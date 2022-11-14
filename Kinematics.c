#include "Kinematics.h"

const code double max_sizes[]={X_MAX_SIZE,Y_MAX_SIZE,Z_MAX_SIZE,A_MAX_SIZE,B_MAX_SIZE,C_MAX_SIZE};
Homing homing[NoOfAxis];

//////////////////////////////////
//FUNCTION POINTERS
volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] =  "\r";
char txtB[200];
//////////////////////////////////
//static file vars
static long d2;

///////////////////////////////////////////////////////
//         INITIALIZE THE AXIS AND PLATFROM          //
///////////////////////////////////////////////////////
void SetInitialSizes(STP axis[6]){
int i = 0;
  //initialize absloute mode to incamental
  gc.absolute_mode = 0;
  
  for (i = 0;i<NoOfAxis;i++){
    axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
  }
}

/*****************************************************
*single axix step rate need to be doubled to compensate
*speed increase due to no 2nd axis interpolation
*use a dummy axis or increase the speed
*****************************************************/
void SingleAxisStep(long newxyz,int axis_No){
int dir;

//static long dist;
      /* if(STPS[axis].psingle != newxyz)
             STPS[axis].psingle = newxyz; */

     STPS[axis_No].axis_dir = Direction(newxyz);
     SV.Single_Dual = 0;
     STPS[axis_No].psingle  = 0;
     
     Single_Axis_Enable(axis_No);
     STPS[axis_No].dist = newxyz - STPS[axis_No].psingle;
     STPS[axis_No].dist = labs(newxyz);
     dir = (newxyz < 0)? CCW : CW;

     switch(axis_No){
       case X:
            DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
            break;
       case Y:
            DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
            break;
       case Z:
            DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
            break;
       case A:
            DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
            break;
       default: break;
     }
     STPS[axis_No].step_count = 0;
     //Start output compare module
     Step_Cycle(axis_No);

}

//////////////////////////////////////////////////////////
//         DUAL AXIS INTERPOLATION SECTION              //
//////////////////////////////////////////////////////////
//this mus become more code efficient by supplying pointer
//arguments ???
void DualAxisStep(long axis_a,long axis_b,int axis_combo){
int dirA,dirB,master_axis;


   SV.cir = 0;
   SV.over=0;
   SV.d2 = 0;

  SV.Single_Dual = 1;

  switch(axis_combo){
    case xy:
          // set the enum variable
          // axis_xyz = (master_axis == 0)? xy:yx;
          axis_xyz = xy;
          //set the direction counter for absolute position
          STPS[X].axis_dir = Direction(axis_a);
          STPS[Y].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);
          //Delta distance to move
          SV.dx   = axis_a - SV.px;
          SV.dy   = axis_b - SV.py;
          
          // Set direction from sign on step value.
          //Set the Dir_bits
          dirA = SV.dx > 0? CW:CCW;
          dirB = SV.dy > 0? CW:CCW;
          //inversion mask
          DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve values
          SV.dx = labs(SV.dx);
          SV.dy = labs(SV.dy);
          //Start values for Bresenhams
          if(SV.dx >= SV.dy)
             SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
          else
             SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);

          if(SV.dx >= SV.dy){
             STPS[X].master = 1;
             STPS[Y].master = 0;
          }else{
             STPS[X].master = 0;
             STPS[Y].master = 1;
          }

           STPS[X].step_count = 0;
           STPS[Y].step_count = 0;
           Axis_Interpolate(X,Y);
         break;
    case xz:
          // set the enum variable
          axis_xyz = xz;
          //set the direction counter for absolute position
          STPS[X].axis_dir = Direction(axis_a);
          STPS[Z].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);
          
          // Set direction from sign on step value.
          //Delta distance to move
          SV.dx   = axis_a - SV.px;
          SV.dz   = axis_b - SV.pz;
          //Set the Dir_bits
          dirA = SV.dx > 0? CW:CCW;
          dirB = SV.dz > 0? CW:CCW;
          //Inversion mask
          DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve values
          SV.dx = labs(SV.dx);
          SV.dz = labs(SV.dz);

          if(SV.dx > SV.dz) 
             d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
          else 
             d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);

          STPS[X].step_count = 0;
          STPS[Z].step_count = 0;
          Axis_Interpolate(X,Z);
         break;
    case yz:
          // set the enum variable
          axis_xyz = yz;
          STPS[Y].axis_dir = Direction(axis_a);
          STPS[Z].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);

          // Set direction from sign on step value.
          //Delta distance to move
          SV.dy   = axis_a - SV.pz;
          SV.dz   = axis_b - SV.py;
          // direction to move
          dirA = SV.dy > 0? CW:CCW;
          dirB = SV.dz > 0? CW:CCW;
          //Inversion mask
          DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve
          SV.dy = labs(SV.dy);
          SV.dz = labs(SV.dz);

         if(SV.dy > SV.dz)
            SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
         else 
            SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);

         STPS[Y].step_count = 0;
         STPS[Z].step_count = 0;
         Axis_Interpolate(Y,Z);
         break;
    default: break;

  }
  //leave previous values at 0 for now
   SV.px = 0;//SV.dx;
   SV.py = 0;//SV.dy;
   SV.pz = 0;//SV.dz;
}

void DualAxisStep2(long axis_a,long axis_b,int axisA,int axisB,int xyza){
long tempA,tempB;
int dirA,dirB;
   SV.over=0;
   SV.d2 = 0;

   //Enable the relevant axis in Stepper.c
   SV.Single_Dual = 1;
  // Single_Axis_Enable(axisA);
  // Single_Axis_Enable(axisB);
   Multi_Axis_Enable(xyza);
   
   if (!gc.absolute_mode){
     SV.px = 0;
     SV.py = 0;
     SV.pz = 0;
   }
   
  //set the direction counter for absolute position
  STPS[axisA].axis_dir = Direction(axis_a);
  STPS[axisB].axis_dir = Direction(axis_b);

  //Delta distance to move
  SV.dx   = axis_a - SV.px;
  SV.dy   = axis_b - SV.py;

  // Set direction from sign on step value.
  //Set the Dir_bits
  dirA = SV.dx > 0? CW:CCW;
  dirB = SV.dy > 0? CW:CCW;
  //inversion mask
  DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
  DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
  //Remove -ve values
  
  SV.dx = labs(SV.dx);
  SV.dy = labs(SV.dy);
  //Start values for Bresenhams
  if(SV.dx >= SV.dy){
     SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
     //speed_cntr_Move(axis_a, 2000,axisA);
     STPS[axisA].master = 1;
     STPS[axisB].master = 0;
  }
  else{
     SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
     //speed_cntr_Move(axis_b, 2000,axisB);
     STPS[axisA].master = 0;
     STPS[axisB].master = 1;
  }

   STPS[axisA].step_count = 0;
   STPS[axisB].step_count = 0;
   STPS[axisA].mmToTravel = axis_a;
   STPS[axisB].mmToTravel = axis_b;
   STPS[axisA].step_delay  = 2000;
   STPS[axisB].step_delay = 2000;
   Axis_Interpolate(axisA,axisB);
   
  //leave previous values at 0 for now
  // SV.px = SV.dx;
  // SV.py = SV.dy;
  // SV.pz = SV.dz;
   

}



///////////////////////////////////////////////////////////////////////////////
//     Circular Interpolation taken from Grbl as it uses Rotation matrix     //
///////////////////////////////////////////////////////////////////////////////

/*/////////////////////////////////////////////////////////////////////////////
*GCODE uses either radius or I,J,K for offset / this function can condition
*for either standard / offset is mostly a byEuropean standard and
*radius mostly an American standard
/////////////////////////////////////////////////////////////////////////////*/

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
           if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }

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


///////////////////////////////////////////////////////////////////
//returns hypotinuse of a triangle
float hypot(float angular_travel, float linear_travel){
      return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}


  /* Vector rotation by transformation matrix: r is the original vector, r_T is the rotated vector,
     and phi is the angle of rotation. Solution approach by Jens Geisler.
         r_T = [cos(phi) -sin(phi);
                sin(phi)  cos(phi] * r ;

     For arc generation, the center of the circle is the axis of rotation and the radius vector is
     defined from the circle center to the initial position. Each line segment is formed by successive
     vector rotations. This requires only two cos() and sin() computations to form the rotation
     matrix for the duration of the entire arc. Error may accumulate from numerical round-off, since
     all double numbers are single precision. (True double precision will not have
     round off issues for CNC applications.) Single precision error can accumulate to be greater than
     tool precision in some cases. Therefore, arc path correction is implemented.
     Small angle approximation may be used to reduce computation overhead further. This approximation
     holds for everything, but very small circles and large mm_per_arc_segment values. In other words,
     theta_per_segment would need to be greater than 0.1 rad and N_ARC_CORRECTION would need to be large
     to cause an appreciable drift error. N_ARC_CORRECTION~=25 is more than small enough to correct for
     numerical drift error. N_ARC_CORRECTION may be on the order a hundred(s) before error becomes an
     issue for CNC machines with the single precision Arduino calculations.

     This approximation also allows mc_arc to immediately insert a line segment into the planner
     without the initial overhead of computing cos() or sin(). By the time the arc needs to be applied
     a correction, the planner should have caught up to the lag caused by the initial mc_arc overhead.
     This is important when there are successive arc motions.
  */

void mc_arc(double *position, double *target, double *offset, int axis_0, int axis_1,
  int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
 long tempA,tempB;
 double center_axis0            = position[axis_0] + offset[axis_0];
 double center_axis1             = position[axis_1] + offset[axis_1];
 double linear_travel           = target[axis_linear] - position[axis_linear];
 double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
 double r_axis1                 = -offset[axis_1];
 double rt_axis0                = target[axis_0] - center_axis0;
 double rt_axis1                = target[axis_1] - center_axis1;
 double theta_per_segment       = 0.00;
 double linear_per_segment      = 0.00;
 double angular_travel          = 0.00;
 double mm_of_travel            = 0.00;
 double rads                    = 0.00;
 unsigned int segments          = 0;
 double cos_T                   = 0.00;
 double sin_T                   = 0.00;
 double arc_target[3];
 double sin_Ti;
 double cos_Ti;
 double r_axisi;
 double nPx,nPy;
 unsigned int i = 0;
 int count = 0;
 char n_arc_correction = 3; //to be sorted int global struct???
 
  arc_target[axis_linear] = position[axis_linear];
  rads = radius * deg2rad;
  // CCW angle between position and target from circle center. Only one atan2() trig computation required.
  // atan2((I*-J' - I'*J ),(I*J + I'-J'))   ~ arctan Vector opp/Vector adj
  angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
  // Correct atan2 output per direction
  if(isclockwise) {
    // 2*Pi = 360deg in radians
    if (angular_travel >= 0) 
         angular_travel -= 2*M_PI;
    else {
      if(angular_travel <= 0)
        angular_travel += 2*M_PI;
    }
  }

  // Check this with calculator
  mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
  if (mm_of_travel == 0.0) { return; }
  
  segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
  // Multiply inverse feed_rate to compensate for the fact that this movement is approximated
  // by a number of discrete segments. The inverse feed_rate should be correct for the sum of
  // all segments.
  if (invert_feed_rate)
      feed_rate *= segments;
      
  // angular_travel = angular_travel * rad2deg;
   theta_per_segment = angular_travel/segments;
   //linear_per_segmentis the down feed of the 3 axis
   //In most cases this will be 0 for 2D plane unless
   //spiral pocket cutting is needed
   linear_per_segment = linear_travel/(double)segments;
   
  // Vector rotation matrix values
   cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
   sin_T = theta_per_segment;
  // Initialize the linear axis
  nPx = arc_target[axis_0] = position[axis_0];
  nPy = arc_target[axis_1] = position[axis_1];
  OC5IE_bit = OC2IE_bit = 0;
  i = 0;
  dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
             cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
  while(i < segments) { // Increment (segments-1)

      if (count < n_arc_correction) {
        // Apply vector rotation matrix
        r_axisi = r_axis0*sin_T + r_axis1*cos_T;
        r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
        r_axis1 = r_axisi;
        count++;
      } else {
        // Arc correction to radius vector. Computed only every n_arc_correction increments.
        // Compute exact location by applying transformation matrix from initial radius vector(=-offset).
        cos_Ti = cos(i*theta_per_segment);
        sin_Ti = sin(i*theta_per_segment);
        r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
        r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
        count = 0;
     }

      // Update arc_target location
      arc_target[axis_0] = center_axis0 + r_axis0;
      arc_target[axis_1] = center_axis1 + r_axis1;
      arc_target[axis_linear] += linear_per_segment;
      nPx =  arc_target[axis_0] - position[axis_0];
      position[axis_0] = arc_target[axis_0];
      nPy =  arc_target[axis_1] - position[axis_1];
      position[axis_1] = arc_target[axis_1];

      tempA = belt_steps(nPx);//calcSteps(nPx,8.06);
      tempB = belt_steps(nPy);//calcSteps(nPy,8.06);

#if DMADebug == 1
     if(!DMA_Busy(1));
       dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
                  i,segments,nPx,nPy,tempA,tempB);
#endif
     SV.cir = 1;
     DualAxisStep2(tempA, tempB,axis_0,axis_1,xy);
     
     while(1){
        if(!OC5IE_bit && !OC2IE_bit)
            break;
     }

      // Bail mid-circle on system abort. Runtime command check already performed by mc_line.
     // if (sys.abort) { return; }

   i++;
  }
  
#if DMADebug == 1
   while(DMA_Busy(1));
   dma_printf("\n%s","Arc Finnished");
#endif
  // Ensure last segment arrives at target location.
  //mc_line(target[X_AXIS], target[Y_AXIS], target[Z_AXIS], feed_rate, invert_feed_rate);
}




///////////////////////////////////////////////////////////////////
//                       DIRECTION INDICATION                    //
///////////////////////////////////////////////////////////////////

//Return the direction counter for absolute counts +1 or -1
int GetAxisDirection(long mm2move){
 return(mm2move < 0)? CCW_:CW_ ;
}

///////////////////////////////////////////////////////////////////
//                       HOMING AXIS                             //
///////////////////////////////////////////////////////////////////

void ResetHoming(){
int i = 0;
   for(i = 0;i< NoOfAxis;i++){
        homing[i].set = 0;
        homing[i].complete = 0;
        homing[i].home_cnt = 0;
        homing[i].rev = 0;
        homing[i].home = 0;
   }
}
//////////////////////////////////////////////////////////////////
//Homeing sequence is a 2 bounce
void Home(int axis){
long speed = 0;

     if(!homing[axis].set){
        homing[axis].set = 1;
        homing[axis].complete = 0;
        homing[axis].home_cnt = 0;
        speed = 2000;
     }else{
        speed = 100;
     }

     
   //test if limit has been hit with rising edge
   if(FP(axis)){
     if(axis == X)
        StopAxis(X);
     else if(axis == Y)
        StopAxis(Y);

     if(!homing[axis].rev){
         homing[axis].rev = 1;
         Inv_Home_Axis(2.0,speed, axis);
     }
     homing[axis].home_cnt++;
   }
   //use falling edge to stop after 1 cycle
   if(FN(axis)){
     homing[axis].home = 0;
   }

   if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){

      if(!homing[axis].home){
        homing[axis].home = 1;
        Home_Axis(-290.00,speed,axis);
      }

      if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
          homing[axis].complete      = 1;
          STPS[axis].step_count      = 0;
          STPS[axis].steps_position  = 0;
      }
   }
   
}

//Home single axis
void Home_Axis(double distance,long speed,int axis){
      distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
      distance = (distance < 0.0)? distance : -distance;
      STPS[axis].mmToTravel = belt_steps(distance);
      speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
      SingleAxisStep(STPS[axis].mmToTravel,axis);
}
//Re verse
void Inv_Home_Axis(double distance,long speed,int axis){
      distance = (distance > 10.0)?  10.0 : distance;
      distance *= (distance < 0.0)?  -1.0 : 1.0;
      STPS[axis].mmToTravel = belt_steps(distance);
      speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
      SingleAxisStep(STPS[axis].mmToTravel,axis);
}