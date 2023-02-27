#include "Kinematics.h"

const code double max_sizes[]={X_MAX_SIZE,Y_MAX_SIZE,Z_MAX_SIZE,A_MAX_SIZE,B_MAX_SIZE,C_MAX_SIZE};


//////////////////////////////////
//FUNCTION POINTERS
volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] =  "\r";
char txtB[200];
//////////////////////////////////
//static file vars
static long d2;

//////////////////////////////////
//homing data
//static unsigned int home_state = 0;
//static unsigned int home_cnt = 0;
static homing_t homing[NoOfAxis];
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

//////////////////////////////////////////////////////////
//                 SET AXIS DIRECTION                   //
//////////////////////////////////////////////////////////
static void Set_Axisdirection(long temp,int axis){
     int dir = (temp < 0)? CCW : CW;
     switch(axis){
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
}

/*single axis step rate may needs to be "doubled"?? in order
 *to compensate for the speed increase [due to no 2nd axis
 *interpolation], a possible solution is to use a dummy
 *axis. Increaseing the speed of single axis is slightly
 *more complicated than just doubling the spped, code
 *execution time for the 2nd axis needs to be considered
 *[still to be decided as to whether a dummy axis or speed
 *calculation should be used????]*/
///////////////////////////////////////////////////////////
//                SINGLE AXIS MOVEMENT                   //
///////////////////////////////////////////////////////////
void SingleAxisStep(double newxyz,long speed,int axis_No){
long tempA = 0;
int dir = 0;
      Single_Axis_Enable(axis_No);
      tempA = belt_steps(newxyz);
      speed_cntr_Move(tempA , speed , axis_No);
      
//static long dist;
      /* if(STPS[axis].psingle != newxyz)
             STPS[axis].psingle = newxyz; */
     Set_Axisdirection(tempA,axis_No);
     STPS[axis_No].axis_dir = Direction(tempA);
     SV.Single_Dual = 0;
     STPS[axis_No].psingle  = 0;
     STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
     STPS[axis_No].step_count = 0;
     STPS[axis_No].mmToTravel = tempA;
     //Start output compare module
     Step_Cycle(axis_No);

}

//////////////////////////////////////////////////////////
//         DUAL AXIS INTERPOLATION SECTION              //
//////////////////////////////////////////////////////////
void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){//,int xyza){
long tempA,tempB,tempC;
int dirA,dirB;
   SV.over=0;
   SV.dif = 0;

   tempA = belt_steps(axis_a);
   tempB = belt_steps(axis_b);
   
   //Enable the relevant axis in Stepper.c
   SV.Single_Dual = 1;
   Single_Axis_Enable(axisA);
   Single_Axis_Enable(axisB);
  // Multi_Axis_Enable(xyza);
  
  //if in abs mode prev must be cur pos
   if (!gc.absolute_mode){
     SV.prevA = 0;
     SV.prevB = 0;
     SV.prevC = 0;
   }else{
     SV.prevA = 0;
     SV.prevB = 0;
     SV.prevC = 0;
   }
   
  //set the direction counter for absolute position
  Set_Axisdirection(tempA,axisA);
  STPS[axisA].axis_dir = Direction(tempA);
  Set_Axisdirection(tempB,axisB);
  STPS[axisB].axis_dir = Direction(tempB);

  //Delta distance to move
  SV.dA   = tempA - SV.prevA;
  SV.dB   = tempB - SV.prevB;
  SV.dC   = tempC - SV.prevC;

  //Remove -ve values
  SV.dA = labs(SV.dA);
  SV.dB = labs(SV.dB);
  
  //Start values for Bresenhams
  if(SV.dA >= SV.dB){
     if(!SV.cir)
        speed_cntr_Move(tempA,speed,axisA);

     SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
     STPS[axisA].master = 1;
     STPS[axisB].master = 0;
  }
  else{
     if(!SV.cir)
        speed_cntr_Move(tempB,speed,axisB);

     SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
     STPS[axisA].master = 0;
     STPS[axisB].master = 1;
  }
  
   STPS[axisA].step_count = 0;
   STPS[axisB].step_count = 0;
   STPS[axisA].mmToTravel = tempA;
   STPS[axisB].mmToTravel = tempB;
   
   Axis_Interpolate(axisA,axisB);
   
  //leave previous values at 0 for now this will
  //be implimented at a later stage.
  // SV.px = SV.dx;
  // SV.py = SV.dy;
  // SV.pz = SV.dz;
   

}



///////////////////////////////////////////////////////////////////////////////
//     Circular Interpolation taken from Grbl as it uses Rotation matrix     //
///////////////////////////////////////////////////////////////////////////////


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
 char limit_error = 0;

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
#if DMADebug == -1
  dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
             cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
#endif
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

      STPS[axis_0].step_delay = 1000;
      STPS[axis_1].step_delay = 1000;

#if DMADebug == -1
     if(!DMA_IsOn(1));
       dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
                  i,segments,nPx,nPy,tempA,tempB);
#endif

     SV.cir = 1;
     DualAxisStep(nPx, nPy,axis_0,axis_1,1000);//,xy);
     
     while(1){
     
      if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
         disableOCx();
         limit_error = 1;
      }

        if(!OC5IE_bit && !OC2IE_bit)
            break;
     }

    // Bail mid-circle on system abort. Runtime command check already performed by mc_line.
    // if (sys.abort) { return; }
    if(limit_error)
       break;
   i++;
  }
  
#if DMADebug == 1
   while(DMA_Busy(1));
   dma_printf("\n%s","Arc Finnished");
#endif

}

/*!
 *returns hypotinuse of a triangle
 */
float hypot(float angular_travel, float linear_travel){
      return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
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

//////////////////////////////////////////////////////////////////
//Homing sequence =>
// 1) axis moves toward the limits
// 2) at 1st hit axis reverses
// 3) at 2nd hit axis stops and
// 4) next axis starts from 1 & repeats until NoOfAxis is reached
int Home(int axis){
long speed = 0;
int ax_en = 0;

  //idle homing can only take place once all alarms are cleared
  if(sys.state == STATE_IDLE){

    speed = 1000;//settings.homing_feed_rate;
    //make sure Home_complete is off at start of homing
    bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
    //set counter to 0
    homing[axis].home_cnt = 0;

    //enable all axis at the start
    EnableStepper(axis);//sort this out

    //indicator for interface
    sys.state = STATE_HOMING;

    //if limit is already made go to rev mode
    if(!Test_Min(axis))return axis;

    //start the movement
    //(max_sizes[axis]+10.0)
    Home_Axis(-500.0,speed,axis);

   #if HomeDebug == 1
    while(DMA_IsOn(1));
    dma_printf("[sys.state:= %d ][home_state:= %d ][home_cnt:= %d]\n"
                ,sys.state
                ,homing[axis].home_state
                ,homing[axis].home_cnt);
   #endif
    return axis;
  }


   //test if limit has been hit with rising edge
   if(sys.state == STATE_HOMING){

  /*  if(homing[axis].home_cnt <= 0){speed = 2000;}
    else{speed = 100;} */
#ifdef POSITIVE_EDGE
     //rising edge of limit switch
    if(FP(axis)){
#else
    if(FN(axis)){
#endif
       speed = 100;//settings.homing_seek_rate;
       #if HomeDebug == 1
       while(DMA_IsOn(1));
       dma_printf("[%s][axis:= %d][cnt:= %d]\n"
                  ,"FN"
                  ,axis
                  ,homing[axis].home_cnt);
       #endif

       //check if homing has completed its cycle
       if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
         //if not yet reversing
         if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){


           if(homing[axis].home_cnt == 1){ //at 1st hit of limit

               bit_true(homing[axis].home_state,bit(HOME_REV));
               bit_false(homing[axis].home_state,bit(HOME));
               //distance here is any value to move off the limit
               //movement will stop on falling edge of limit
               Home_Axis(12.0,100, axis);

           }else if(homing[axis].home_cnt > 1){//2nd hit of limit

               bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
               StopAxis(axis);
               axis++;
               sys.state = STATE_IDLE;
               homing[axis].home_cnt = 0;

               #if HomeDebug == 1
               while(DMA_IsOn(1));
               dma_printf("[%s][sys.state:= %d][axis:= %d][cnt:= %d]\n","axis finnished"
                          ,sys.state
                          ,axis
                          ,homing[axis].home_cnt);
               #endif

               return axis;
           }
         }
         #if HomeDebug == 1
         while(DMA_IsOn(1));
         dma_printf("homing[%d].home_state:= %d\n",axis,homing[axis].home_state);
         #endif
       }
     }

     //falling edge of limit to stop after 1 cycle
#ifdef POSITIVE_EDGE
     //rising edge of limit switch
     if(FN(axis)){
#else
     if(FP(axis)){
#endif
       homing[axis].home_cnt++;
       if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
          bit_false(homing[axis].home_state,bit(HOME_REV));
          Home_Axis(-290.00,50,axis);
       }
       #if HomeDebug == 1
       while(DMA_IsOn(1));
       dma_printf("[%s][axis[%d].home_cnt:= %d][home_state:= %d]\n"
       ,"FP"
       ,axis
       ,homing[axis].home_cnt
       ,homing[axis].home_state);
       #endif
     }
   }
   return axis;
}

//Home single axis
static void Home_Axis(double distance,long speed,int axis){
  //force a stop of the axis
  StopAxis(axis);
  STPS[axis].run_state = STOP ;
  //make sure the travel is long enough to get Home tsto limi
// distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
//  distance = (distance < 0.0)? distance : -distance;

  #if HomeDebug == 1
   while(DMA_IsOn(1));
   dma_printf("HomeAxis(%f,%l,%d);\n",distance,speed,axis);
  #endif
  //calculate the distance in Steps and send to stepper control
  STPS[axis].mmToTravel = belt_steps(distance);
  SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
}

static void ResetHoming(){
int i = 0;
   for(i = 0;i< NoOfAxis;i++){
        homing[i].home_state = 0;
        homing[i].home_cnt = 0;
   }
}

// Method to ready the system to reset by setting the runtime reset command and killing any
// active processes in the system. This also checks if a system reset is issued while Grbl
// is in a motion state. If so, kills the steppers and sets the system alarm to flag position
// lost, since there was an abrupt uncontrolled deceleration. Called at an interrupt level by
// runtime abort command and hard limits. So, keep to a minimum.
void mc_reset(){
  // Only this function can set the system reset. Helps prevent multiple kill calls.
  if (bit_isfalse(sys.execute, EXEC_RESET)) {
    sys.execute |= EXEC_RESET;

    // Kill spindle and coolant.
    //spindle_stop();
   // coolant_stop();

    // Kill steppers only if in any motion state, i.e. cycle, feed hold, homing, or jogging
    // NOTE: If steppers are kept enabled via the step idle delay setting, this also keeps
    // the steppers enabled by avoiding the go_idle call altogether, unless the motion state is
    // violated, by which, all bets are off.
    switch (sys.state) {
      case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
        sys.execute |= EXEC_ALARM; // Execute alarm state.
        disableOCx(); // Execute alarm force kills steppers. Position likely lost.
        ResetHoming();
    }
  }
}