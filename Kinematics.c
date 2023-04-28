#include "Kinematics.h"

const code double max_sizes[]={X_MAX_SIZE,Y_MAX_SIZE,Z_MAX_SIZE,A_MAX_SIZE,B_MAX_SIZE,C_MAX_SIZE};



//////////////////////////////////
//FUNCTION POINTERS
volatile void (*AxisPulse[3])();

/////////////////////////////////
//globals
//char MyVar located int Config.h
sbit stp_stopped at stepper_state.B0;
sbit stp_run at stepper_state.B1;
sbit stp_pause at stepper_state.B2;

//////////////////////////////////
//static file vars
char txtA[] = " : ";
char txtC[] =  "\r";
char txtB[200];

static long d2;

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
void SingleAxisStep(float newxyz,float speed,int axis_No){
long  absxyz = 0;
long  tempA  = 0;
int   dir    = 0;

  //get rps from mm/min
  speed = RPS_FROM_MMPMIN(speed);
  
  #if KineDebug == 4
  while(DMA_IsOn(1));
  dma_printf("cur_pos:= %l\tabsxyz:= %f\tnewxyz:= %f\tG90:= %d\n"
            ,tempA,beltsteps2mm(STPS[axis_No].steps_abs_position,axis_No)
            ,newxyz,(int)gc.absolute_mode);
  #endif
      //if absolute mode ~ newxyz = new_position - current_position
  if(gc.absolute_mode == true){
    //get current position
    tempA = belt_steps(newxyz,axis_No);
    
    //subtract new from current
    tempA = tempA - STPS[axis_No].steps_abs_position;
    //no move if result is zero
    if(tempA== 0){
       return;
    }
  }else{
    tempA = belt_steps(newxyz,axis_No);
  }
  SingleAxisStart(tempA,speed,axis_No);
  
}

static void SingleAxisStart(long dist,float speed,int axis_No){
long speed_ = 0;

  STPS[axis_No].dist = labs(dist);
  Single_Axis_Enable(axis_No);
  speed_cntr_Move(dist , speed, axis_No);

//static long dist;
    /* if(STPS[axis].psingle != newxyz)
             STPS[axis].psingle = newxyz; */
   Set_Axisdirection(dist,axis_No);
   STPS[axis_No].axis_dir = Direction(dist);
   SV.Single_Dual = SINGLE;
   STPS[axis_No].psingle  = 0;
   STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
   STPS[axis_No].step_count = 0;
   STPS[axis_No].mmToTravel = dist;
   //Start output compare module
   Step_Cycle(axis_No);
}

//////////////////////////////////////////////////////////
//         DUAL AXIS INTERPOLATION SECTION              //
//////////////////////////////////////////////////////////
void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
long tempA,tempB,tempC,temp1,temp2;
//int dirA,dirB;
      //Start values for Bresenhams
  if(SV.prevA == axis_a){
     bit_false(SV.mode_complete,bit(axisA));
     SV.prevA = axis_a;
  }
  if(SV.prevB == axis_b){
      bit_false(SV.mode_complete,bit(axisB));
     SV.prevB = axis_b;
  }
  
 /* if( SV.mode_complete == 0){ //set this to respond with ok
    return;
  }*/
  //get rps from mm/min
  speed = RPS_FROM_MMPMIN(speed);
 
 //if absolute mode ~ newxyz = new_position - current_position
 if(gc.absolute_mode == true){
   //get current position
   tempA = belt_steps(axis_a,axisA);
   tempB = belt_steps(axis_b,axisB);
   
  //subtract new from current
   tempA = tempA - STPS[axisA].steps_abs_position;
   tempB = tempB - STPS[axisB].steps_abs_position;

 }else{
   tempA = belt_steps(axis_a,axisA);
   tempB = belt_steps(axis_b,axisB);
 }

 //fresh values for calc
 temp1 = labs(tempA);
 temp2 = labs(tempB);
 SV.over = 0;
 SV.dif  = 0;

//Enable the relevant axis in Stepper.c
 SV.Single_Dual = DUAL;
 Single_Axis_Enable(axisA);
 Single_Axis_Enable(axisB);
 // Multi_Axis_Enable(xyza);
  
  //set the direction counter for absolute position
  Set_Axisdirection(tempA,axisA);
  STPS[axisA].axis_dir = Direction(tempA);
  Set_Axisdirection(tempB,axisB);
  STPS[axisB].axis_dir = Direction(tempB);

  //check if movement is needed on the axis
  //calculate acc/dec "if arc is runninG use last min speed ?"
  //Remove -ve values for dist in Steps to complete move
  STPS[axisA].dist =  labs(tempA);
  STPS[axisB].dist =  labs(tempB);
  
 #if KineDebug == 4
 while(DMA_IsOn(1));
 dma_printf("SV.dA:= %l\tSV.dB:= %l\n"
            ,STPS[axisA].dist,STPS[axisB].dist);
 #endif
  
 if(temp1 >= temp2){//SV.dA >= SV.dB){
    speed_cntr_Move(tempA,speed,axisA);
    STPS[axisB].step_delay = STPS[axisA].step_delay;
    STPS[axisB].accel_count = STPS[axisA].accel_count;
    SV.dif = BresDiffVal(SV.dB,SV.dA);//STPS[axisB].dist,STPS[axisA].dist);//2*(SV.dy - SV.dx);
    STPS[axisA].master = MASTER;
    STPS[axisB].master = SLAVE;
 }else{
    speed_cntr_Move(tempB,speed,axisB);
    STPS[axisA].step_delay = STPS[axisB].step_delay;
    STPS[axisA].accel_count = STPS[axisB].accel_count;
    SV.dif = BresDiffVal(SV.dA,SV.dB);//STPS[axisA].dist,STPS[axisB].dist);//2* (SV.dx - SV.dy);
    STPS[axisA].master = SLAVE;
    STPS[axisB].master = MASTER;
  }
  
   //store current pos prev must be cur pos
  SV.prevA = axis_a;
  SV.prevB = axis_b;

  STPS[axisA].step_count = 0;
  STPS[axisB].step_count = 0;
  STPS[axisA].mmToTravel = tempA;
  STPS[axisB].mmToTravel = tempB;

  Start_Interpolation(axisA,axisB);
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

void mc_arc(float *position, float *target, float *offset, int axis_0
           , int axis_1,int axis_linear, float feed_rate, char invert_feed_rate
           , float radius, char isclockwise){
float arc_target[3] = {0};
float center_axis0,center_axis1, r_axis0 , r_axis1 , rt_axis0 , rt_axis1 , linear_travel;
float theta_per_segment, linear_per_segment , angular_travel , mm_of_travel , segments;
float cos_T,sin_T,sin_Ti,cos_Ti;
float r_axisi,nPx,nPy,i,x,y;
int count = 0;
char limit_error = 0;

 center_axis0            = position[axis_0] + offset[axis_0];
 center_axis1            = position[axis_1] + offset[axis_1];
 r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
 r_axis1                 = -offset[axis_1];
 rt_axis0                = target[axis_0] - center_axis0;
 rt_axis1                = target[axis_1] - center_axis1;
 linear_travel           = target[axis_linear] - position[axis_linear];
  //axis_linear should be Z for cutting spirals or screw threads
 arc_target[axis_linear] = position[axis_linear];
  
  //deg * (Pi/180) ??
 // rads = radius * deg2rad;

  // CCW angle between position and target from circle center. Only one atan2() trig computation required.
  // atan2((I*-J' - I'*J ),(I*J + I'-J'))   ~ arctan Vector opp/Vector adj
  x = r_axis0*rt_axis1-r_axis1*rt_axis0;
  y = r_axis0*rt_axis0+r_axis1*rt_axis1;
  //MikroC atan2 is not as library describes it?? ansic states
  //y/x  mikroc states x/y. avr example as below does not work in MikroC
  //needed to invert this commented out atan2 ??? MikroC forum said
  //it would be fixed!! Ha! ha! ha!!!! typical MikroC.
  /*angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0,
                         r_axis0*rt_axis0+r_axis1*rt_axis1);*/
  //atan2 as ansic states but not as grbl code would have it!!
  angular_travel = atan2(y,x);
  
  // Correct atan2 output per direction
  if(isclockwise > 0) {
    if (angular_travel >= 0) 
         angular_travel -= PIx2;
  }else {
    if(angular_travel <= 0)
        angular_travel += PIx2;
  }
  
#if KineDebug == 3
while(DMA_IsOn(1));
dma_printf("\
[posx:=%f : posy:=%f]\n\
[tarx:=%f : tary:=%f]\n\
[offx:= %f : offy:= %f]\r\n\
[cenx:= %f : ceny:= %f]\r\n\
[r_axis0:= %f : r_axis1:= %f]\r\n\
[rt_axis0:= %f : rt_axis1:= %f]\r\n\n",
  position[axis_0],position[axis_1]
  ,target[axis_0],target[axis_1]
  ,offset[axis_0],offset[axis_1]
  ,center_axis0,center_axis1
  ,r_axis0,r_axis1,rt_axis0,rt_axis1);
#endif

  // Check this with calculator
  mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
  if (mm_of_travel == 0.0) { return; }
  
  segments = floor(mm_of_travel/settings.mm_per_arc_segment);
  
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
   linear_per_segment = linear_travel/segments;
   
  // Vector rotation matrix values
   cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
   sin_T = theta_per_segment;
   
  // Initialize the linear axis to current posxition
  nPx = arc_target[axis_0] = position[axis_0];
  nPy = arc_target[axis_1] = position[axis_1];
  DisableStepperInterrupt(X);
  DisableStepperInterrupt(Y);
  i = 0.0;
  
  #if KineDebug == 3
  while(DMA_IsOn(1));
  dma_printf("\
[cos_T:=%f : sin_T:=%f]\n\
[radius:=%f : segments:=%f]\n\
[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\r\n\
[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
  cos_T,sin_T,radius,segments,angular_travel,mm_of_travel
  ,linear_travel,linear_per_segment,theta_per_segment,feed_rate);
  #endif

  for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
  //while(i < segments) { // Increment (segments-1)
      if (count < settings.n_arc_correction) {
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
      nPy =  arc_target[axis_1] - position[axis_1];
      
      if(gc.absolute_mode){
        nPx += position[axis_0];// += nPx;//arc_target[axis_0];
        nPy += position[axis_1];// += nPy;//arc_target[axis_1];
      }
     //if absolute mode use current position + nP...
  // if(gc.absolute_mode){
     STPS[axis_0].step_delay = feed_rate;
     STPS[axis_1].step_delay = feed_rate;
  // }

    //to ensure the axis does not over step during an
    //arc, there is a correction interpolation after
    //arc incrament to get axis into target position,
    // if axis is ahead then it would have to reversr
    //this prevents the reversal of wither axis.
    if(position[axis_0] > target[axis_0]){
      if(nPx < target[axis_0]){nPx = target[axis_0];}
    }else if(position[axis_0] < target[axis_0]){
      if(nPx > target[axis_0]){nPx = target[axis_0];}
    }
    
    if(position[axis_1] > target[axis_1]){
      if(nPy <= target[axis_1]){nPy = target[axis_1];}
    }else if(position[axis_1] < target[axis_1]){
      if(nPy >= target[axis_1]){nPy = target[axis_1];}
    }

    //interpolate the difference
    DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
   //wait here while axis completes its move can posibly
   //check limits and estops as well as send out status report
   // will want ot unblockthis nce we have a complete working model
   while(1){

    /* if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
         disableOCx();
         limit_error = 1;
     }*/
    if(!Get_Axis_IEnable_States()||SV.mode_complete < 1)
       break;
   }
   SV.mode_complete = 0;
    // Bail mid-circle on system abort. Runtime command check already performed by mc_line.
    // if (sys.abort) { return; }
   /*if(limit_error)
      break; */
#if KineDebug == 4
while(DMA_IsOn(1));
dma_printf("\
[ i:= %d\tseg:= %d ]\n\
[ nPx:= %f\tnPy:= %f ]\n\
[ tar[axis_0]:= %f\ttar[axis_1]:= %f]\r\n\
[SV.mode_complete:= %d\r\n"
,i,segments,nPx,nPy,target[axis_0],target[axis_1],SV.mode_complete);
#endif

  }
  //end of arc get to correct target
  SV.cir = 0;
  //ensure axis are in position when arc is complete
  DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
  //report_status_message(STATUS_OK);
  SV.mode_complete = 0;
  #if KineDebug == 3
     while(DMA_IsOn(1));
     dma_printf("\n%s\n","Arc Finnished");
  #endif

}

///////////////////////////////////////////////////////////////////////////////
//returns hypotinuse of a triangle
float hypot(float x, float y){
      return(sqrt((x*x) + (y*y)));
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
static long speed = 0;

  //idle homing can only take place once all alarms are cleared
 if(sys.state == STATE_IDLE){
  speed = settings.homing_seek_rate;
  
 //condition the triggers
  Rst_FP(axis);Rst_FN(axis);
    
  //make sure Home_complete is off at start of homing
  bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
    
  //Force a reversal of axis
  bit_false(homing[axis].home_state,bit(HOME_REV));
    
  //set counter to 0
  homing[axis].home_cnt = 0;

  //enable all axis at the start
  EnableStepper(axis);//sort this out

  //indicator for interface
  sys.state = STATE_HOMING;
    
    //if limit is already made go to rev mode
  if(!Test_Port_Pins(axis)){
    //Force the homing counter to 1 == reverse state
    homing[axis].home_cnt = 1;
    // goto homed lable to start reversing
    goto HOMED;
  }
    
  //start the movement
  //(max_sizes[axis]+100.0)to ensure axis gets to limit
  Home_Axis(-(max_sizes[axis]+100.0),speed,axis);

   #if HomeDebug == 2
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
#ifdef POSITIVE_EDGE
     //rising edge of limit switch
    if(FP(axis)){
#else
    if(FN(axis)){
#endif
//label to force a reversal of axis
HOMED:
       speed = settings.homing_feed_rate;
       #if HomeDebug == 2
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

           //move Home iterations
           if(homing[axis].home_cnt == 1){ //at 1st hit of limit
           
               bit_true(homing[axis].home_state,bit(HOME_REV));
               bit_false(homing[axis].home_state,bit(HOME));
               
               //pause prior to reentering limit switch
               VDelay_ms((unsigned long)settings.homing_debounce_delay);
               
               //distance here is any value to move off the limit
               //movement will stop on falling edge of limit
               Home_Axis(12.0,settings.homing_feed_rate, axis);

           }else if(homing[axis].home_cnt > 1){//2nd hit of limit
           
               bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
               StopAxis(axis);
               axis++;
               //reset to idle sto start at fast feed rate for homing
               sys.state = STATE_IDLE;
               
               //reset the Home count for new axis bounce
               homing[axis].home_cnt = 0;
               
               #if HomeDebug == 2
               while(DMA_IsOn(1));
               dma_printf("[%s][sys.state:= %d][axis:= %d][cnt:= %d]\n"
                          ,"axis finnished"
                          ,sys.state
                          ,axis
                          ,homing[axis].home_cnt);
               #endif
               
               //move off axis limit by default value to stop limit false trigger
               Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
               //return the next axis to be homed
               return axis;
           }
         }
         #if HomeDebug == 3
         while(DMA_IsOn(1));
         dma_printf("homing[%d].home_state:= %d\n",axis,homing[axis].home_state);
         #endif
       }
     }


#ifdef POSITIVE_EDGE
     //rising edge of limit switch
     if(FN(axis)){
#else
    //falling edge of limit ISR set to hi to low transition give a FP
     if(FP(axis)){
#endif
       homing[axis].home_cnt++;
       if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
          bit_false(homing[axis].home_state,bit(HOME_REV));
          //distance here is any value to move onto the limit
          //movement will stop on edge of limit
          Home_Axis(-290.00,settings.homing_feed_rate,axis);
       }
       #if HomeDebug == 2
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
static void Home_Axis(double distance,float speed,int axis){
  //force a stop of the axis
  StopAxis(axis);
  STPS[axis].run_state = STOP ;
  //make sure the travel is long enough to get Home tsto limi
// distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
//  distance = (distance < 0.0)? distance : -distance;

  #if HomeDebug == 2
   while(DMA_IsOn(1));
   dma_printf("HomeAxis(%f,%f,%d);\n",distance,speed,axis);
  #endif
  //calculate the distance in Steps and send to stepper control
  STPS[axis].mmToTravel = belt_steps(distance,axis);
  //get rps from mm/min
  speed = RPS_FROM_MMPMIN(speed);
  //get pps from rps
  speed = Get_Step_Rate(speed,axis);
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
        DisableStepper();
        ResetHoming();
    }
  }
}