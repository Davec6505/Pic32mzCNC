/************************************************************************
* if G90 absolute mode mmSteps must be added or subtracted from last known
* position
*************************************************************************/

#include "Planner.h"


sVars SV;

/////////////////////////////////////////////////////
//       SET THE ACC AND DEC CONSTANTS             //
/////////////////////////////////////////////////////
void plan_init(long accel,long decel)
{
int i = 0;
 for(i = 0; i < NoOfAxis; i++){
  STPS[i].acc = accel;
  STPS[i].dec = decel;
 }
}

/************************************************************************
 *  Makes the stepper motor move the given number of steps.
 *  It accelrate with given accelration up to maximum speed and decelerate
 *  with given deceleration so it stops at the given step.
 *  If accel/decel is to small and steps to move is to few, speed might not
 *  reach the max speed limit before deceleration starts.
 *   ac:AVR_Stepper_Acc_Dec
 *  \param step  Number of steps to move (pos - CW, neg - CCW).
 *  \param accel  Accelration to use, in 0.01*rad/sec^2.
 *  \param decel  Decelration to use, in 0.01*rad/sec^2.
 *  \param speed  Max speed, in 0.01*rad/sec.
 *
 ***********************************************************************/
void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
int ii;
long temp_speed;
static long last_speed;
long abs_mmSteps = labs(mmSteps);

  // If moving only 1 step then set accel counter
  // and run state to decellerate -ve acc count value
  // is for addition to step couter.
  if(mmSteps == 1){
    STPS[axis_No].accel_count = -1;        // Move one step...
    STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
    STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
    SV.running = 1;                        // start running

  }else if((mmSteps != 0)&&(abs_mmSteps != 1)){
    //if the motor is still moving at time of recalculating then use difference
    //still need to figure out if we should be doing this gcode is ususlly specific
    //to finnishing a move before starting a next!!!!
    
    //dly = (Vlast - Vcur) / (2 . a)
    if(STPS[axis_No].run_state != STOP)
        temp_speed = last_speed - speed;
    else
        temp_speed = speed;
        
    // Only move if number of steps to move is not zero.
    // Set max speed limit, by calc min_delay to use in timer.
    // min_delay = (ALPHA / T1_Freq)/ speed
    STPS[axis_No].min_delay =  A_T_x100 / temp_speed;

    // Set accelration by calc the first (c0) step delay .
    // step_delay = 1/T_Freq*sqrt(2*alpha/accel)
    // step_delay = ( T_Freq*0.676/100 ) * sqrt( (2*alpha*10000000000) / (accel*100) )/10000
    STPS[axis_No].step_delay = labs(T1_FREQ_148 * ((sqrt_(A_SQ / STPS[axis_No].acc))/100));
    STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;

    // Find out after how many Steps before the speed hits the max speed limit.
    STPS[axis_No].max_step_lim =(temp_speed*temp_speed)/(long)(2.0*ALPHA*(double)STPS[axis_No].acc*100.0);

    //test calc using A_x20000 ???
    //STPS.max_s_lim = (long)speed*speed/(long)(((long)A_x20000*accel)/100);
    
    // If we hit max speed limit before 0,5 step it will round to 0.
    // But in practice we need to move atleast 1 step to get any speed at all.
    if(STPS[axis_No].max_step_lim == 0){
      STPS[axis_No].max_step_lim = 1;
    }

    // Find out after how many Steps before we must start deceleration.
    // n1 = (n1+n2)decel / (accel + decel) which is 50%
     STPS[axis_No].accel_lim = (abs_mmSteps * STPS[axis_No].dec) / (STPS[axis_No].acc + STPS[axis_No].dec);
     
    // We must accelrate at least 1 step before we can start deceleration.
    if(STPS[axis_No].accel_lim == 0){
       STPS[axis_No].accel_lim = 1;
    }

    // Use the limit we hit first to calc decel.
    if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
         STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
    }else{
         STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *STPS[axis_No].acc)/STPS[axis_No].dec);
    }
    //we must at least dec by 1 step
    if(STPS[axis_No].decel_val == 0)
           STPS[axis_No].decel_val = -1;

    // Find step to start decleration.
    if(mmSteps < 0){
        STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
    }
    else {
        STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
    }

    //find the position at which to start decelerating from
    // If the maximum speed is so low that we won't need to go via accelration state.
    if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
      STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      STPS[axis_No].run_state = RUN;
    }else{
       STPS[axis_No].step_delay = labs(STPS[axis_No].StartUp_delay);
       STPS[axis_No].run_state = ACCEL;
    }

  }

  STPS[axis_No].step_count  = 0;
  STPS[axis_No].rest        = 0;
  STPS[axis_No].accel_count = 1;
  SV.Tog                    = 0;
  SV.running                = 1;
  last_speed                = speed;
}

//////////////////////////////////////////////////////////////////////////////
//GCODE uses either radius or I,J,K for offset / this function can condition//
//for either standard / offset is mostly a byEuropean standard and          //
//radius mostly an American standard                                        //
//////////////////////////////////////////////////////////////////////////////

//TODO: change function arguments to struct that holds positions, targets etc
//      as arrays for GCODE sampling and conditioning mostly to compensate for
//      for 3 axis helix movement/spiraling; for test purposes we keep
//      axix_linear_per_segment as 0 test 2D plane circle
void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,
              double r, double i, double j, double k, int axis_A,int axis_B,int dir){
unsigned short isclockwise = 0;
double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
double position[NoOfAxis];
double target[NoOfAxis];
double offset[NoOfAxis];
double x = 0.00;
double y = 0.00;
double h_x2_div_d = 0.00;
int axis_plane_a,axis_plane_b;


     //use thess arrays to simplify call to arc function
     position[axis_A] = Cur_axis_a;
     position[axis_B] = Cur_axis_b;
     position[2] = 0;
     target[axis_A] = Fin_axis_a;
     target[axis_B] = Fin_axis_b;
     target[2] = 0;
     offset[axis_A] = i;
     offset[axis_B] = j;

     if (r != 0.00) { // Arc Radius Mode
            /*
              We need to calculate the center of the circle that has the designated radius and passes
              through both the current position and the target position. This method calculates the following
              set of equations where [x,y] is the vector from current to target position, d == magnitude of
              that vector, h == hypotenuse of the triangle formed by the radius of the circle, the distance to
              the center of the travel vector. A vector perpendicular to the travel vector [-y,x] is scaled to the
              length of h [-y/d*h, x/d*h] and added to the center of the travel vector [x/2,y/2] to form the new point
              [i,j] at [x/2-y/d*h, y/2+x/d*h] which will be the center of our arc.
              ******************************
              Equilateral formulae derived as
              area = 0.5 * d * h
              a^2 = h^2 + (r/2)^2
              ? h^2 = r^2 – (r^2/4)
              ? h^2 = (3r^2)/4  Or h = ½(sqrt(3r))
              *********************************
              area formula: h? = 2 × area / r = sqrt(r² - (0.5 × b)²) × b / r
              *********************************
              area = ¼(sqrt(3r^2))
              h = ½ × (sqrt(3 )× r)
              *********************************
              d^2 == x^2 + y^2
              h^2 == r^2 - (d/2)^2
              i == x/2 - y/d*h
              j == y/2 + x/d*h

                                                                   O <- [i,j]
                                                                -  |
                                                      r      -     |
                                                          -        |
                                                       -           | h
                                                    -              |
                                      [0,0] ->  C -----------------+--------------- T  <- [x,y]
                                                | <------ d/2 ---->|

              C - Current position
              T - Target position
              O - center of circle that pass through both C and T
              d - distance from C to T
              r - designated radius
              h - distance from center of CT to O

              Expanding the equations:

              d -> sqrt(x^2 + y^2)
              h -> sqrt(4 * r^2 - x^2 - y^2)/2
              i -> (x - (y * sqrt(4 * r^2 - x^2 - y^2)) / sqrt(x^2 + y^2)) / 2
              j -> (y + (x * sqrt(4 * r^2 - x^2 - y^2)) / sqrt(x^2 + y^2)) / 2

              Which can be written:

              i -> (x - (y * sqrt(4 * r^2 - x^2 - y^2))/sqrt(x^2 + y^2))/2
              j -> (y + (x * sqrt(4 * r^2 - x^2 - y^2))/sqrt(x^2 + y^2))/2

              Which we for size and speed reasons optimize to:

              h_x2_div_d = sqrt(4 * r^2 - x^2 - y^2)/sqrt(x^2 + y^2)
              i = (x - (y * h_x2_div_d))/2
              j = (y + (x * h_x2_div_d))/2

            */

            // Calculate the change in position along each selected axis
            //x = target[gc.plane_axis_0]-gc.position[gc.plane_axis_0];
            x = target[axis_plane_a] - position[axis_plane_a];
            //y = target[gc.plane_axis_1]-gc.position[gc.plane_axis_1];
            y = target[axis_plane_b] - position[axis_plane_b];
            //clear_vector(offset);
            // First, use h_x2_div_d to compute 4*h^2 to check if it is negative or r is smaller
            // than d. If so, the sqrt of a negative number is complex and error out.
            h_x2_div_d = 4 * r*r - x*x - y*y;
           // if (h_x2_div_d < 0) { FAIL(STATUS_ARC_RADIUS_ERROR); return(gc.status_code); }
            // Finish computing h_x2_div_d.
            h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
            // Invert the sign of h_x2_div_d if the circle is counter clockwise (see sketch below)
           if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }

            /* The counter clockwise circle lies to the left of the target direction. When offset is positive,
               the left hand circle will be generated - when it is negative the right hand circle is generated.


                                                             T  <-- Target position

                                                             ^
                  Clockwise circles with this center         |          Clockwise circles with this center will have
                  will have > 180 deg of angular travel      |          < 180 deg of angular travel, which is a good thing!
                                                   \         |          /
      center of arc when h_x2_div_d is positive ->  x <----- | -----> x <- center of arc when h_x2_div_d is negative
                                                             |
                                                             |

                                                             C  <-- Current position                                 */


            // Negative R is g-code-alese for "I want a circle with more than 180 degrees of travel" (go figure!),
            // even though it is advised against ever generating such circles in a single line of g-code. By
            // inverting the sign of h_x2_div_d the center of the circles is placed on the opposite side of the line of
            // travel and thus we get the unadvisably long arcs as prescribed.
            if (r < 0) {
                h_x2_div_d = -h_x2_div_d;
                r = -r; // Finished with r. Set to positive for mc_arc
            }
            // Complete the operation by calculating the actual center of the arc
            //offset[gc.plane_axis_0] = 0.5*(x-(y*h_x2_div_d));
            i =  0.5*(x-(y*h_x2_div_d));
            //offset[gc.plane_axis_1] = 0.5*(y+(x*h_x2_div_d));
            j =  0.5*(y+(x*h_x2_div_d));
          } else {
            //using this section for understanding 1st
            // Arc Center Format Offset Mode
             r = hypot(i, j); // Compute arc radius for mc_arc
          }
          // Set clockwise/counter-clockwise sign for mc_arc computations
          isclockwise = false;
          if (dir == CW) { isclockwise = true; }
       //   dma_printf("Radius:=%f\n",r);
        //  gc.plane_axis_2 =1;
          // Trace the arc  inverse_feed_rate_mode used withG01 G02 G03 for Fxxx
          mc_arc(position, target, offset, axis_A, axis_B, Z,
                 DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
}



// Syncs all internal position vectors to the current system position.
void sys_sync_current_position(){

 // plan_set_current_position(sys.position[X],sys.position[Y],sys.position[Z]);
  gc_set_current_position(STPS[X].steps_abs_position
                          ,STPS[Y].steps_abs_position
                          ,STPS[Z].steps_abs_position);
}

// Reset the planner position vector (in steps). Called by the system abort routine.
void plan_set_current_position(long x, long y, long z)
{
 /* pl.position[X] = beltsteps2mm(x);
  pl.position[Y] = beltsteps2mm(Y);
  pl.position[Z] = beltsteps2mm(Z); */
}

// Reset the planner position vector (in steps). Called by the system abort routine.
void plan_reset_absolute_position(){
 int i = 0;
 for(i=0;i<NoOfAxis;i++)
     STPS[X].steps_abs_position = 0;
     
}
////////////////////////////////////////////////
//              CALCULATIONS                  //
////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////


/*!
 *    brief Square root routine.
 *    sqrt routine, from comp.sys.ibm.pc.programmer
 *    Subject: Summary: SQRT(int) algorithm (with profiling)
 *    From: warwick@cs.uq.oz.au (Warwick Allison)
 *    Date: Tue Oct 8 09:16:35 1991
 *    param x  Value to find square root of.
 *    return  Square root of x.
 */
unsigned long sqrt_(unsigned long x){

  register unsigned long xr;  // result register
  register unsigned long q2;  // scan-bit register
  register unsigned char f;   // flag (one bit)

  xr = 0;                     // clear result
  q2 = 0x40000000L;           // higest possible result bit
  do
  {
    if((xr + q2) <= x)
    {
      x -= xr + q2;
      f = 1;                  // set flag
    }
    else{
      f = 0;                  // clear flag
    }
    xr >>= 1;
    if(f){
      xr += q2;               // test flag
    }
  } while(q2 >>= 2);          // shift twice
  if(xr < x){
    return xr +1;             // add for rounding
  }
  else{
    return xr;
  }
}