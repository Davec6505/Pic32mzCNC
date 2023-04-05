#include "Stepper.h"

char txt_A[9];

/////////////////////////////////
//enum varibles
_axis_ _axis;
axis_combination axis_xyz;

//unsigned int Toggle;
//long test;
static int axis_running;

//////////////////////////////////
//Set up pin outs
void SetPinMode(){

//Xaxis
  EN_Step_PinDirX  = 0; //output
  DIR_Step_PinDirX = 0;
//  RST_Step_PinDirX = 0;
//  SLP_FLT_Step_PinDirX = 0;
 // PLS_Step_PinDirX = 0;

  
//Yaxis
  EN_Step_PinDirY  = 0; //output
  DIR_Step_PinDirY = 0;
//  RST_Step_PinDirY = 0;
//  SLP_FLT_Step_PinDirY = 0;
 // PLS_Step_PinDirY = 0;

  
//zaxis
  EN_Step_PinDirZ  = 0; //output
  DIR_Step_PinDirZ = 0;
//  RST_Step_PinDirZ = 0;
//  SLP_FLT_Step_PinDirZ = 0;
//  PLS_Step_PinDirZ = 0;

  
//aaxis
  EN_Step_PinDirA  = 0; //output
  DIR_Step_PinDirA = 0;
//  RST_Step_PinDirA = 0;
//  SLP_FLT_Step_PinDirA = 0;
//  PLS_Step_PinDirA = 0;

//stepper timeout counter
}

/////////////////////////////////
//Enable Steppers
void EnStepperX(){
//  SLP_FLT_StepX = 1;
//  RST_StepX     = 1;
  EN_StepX       = 0;
}

void EnStepperY(){
//  SLP_FLT_StepY = 1;
//  RST_StepY     = 1;
  EN_StepY       = 0;
}
void EnStepperZ(){
//  SLP_FLT_StepZ = 1;
//  RST_StepZ     = 1;
  EN_StepZ       = 0;
}
void EnStepperA(){
//  SLP_FLT_StepA = 1;
//  RST_StepA    = 1;
  EN_StepA       = 0;
}

void EnableSteppers(int steppers){
int i;
  for(i=0;i<steppers;i++){
    if(i==0) EN_StepX       = 0;
    if(i==1) EN_StepY       = 0;
    if(i==2) EN_StepZ       = 0;
    if(i==3) EN_StepA       = 0;
  }
}

void EnableStepper(int stepper){
  switch(stepper){
   case X:EN_StepX = 0; break;
   case Y:EN_StepY = 0; break;
   case Z:EN_StepZ = 0; break;
   case A:EN_StepA = 0; break;
   //case B:EN_StepB = 0; break;
   //case C:EN_StepC = 0; break;
  }
}

void DisableStepper(){
   EN_StepX      = 1;
   EN_StepY      = 1;
   EN_StepZ      = 1;
   EN_StepA      = 1;
}

//////////////////////////////////////////////////////////
//            POL THE AXIS BITS                      //
//////////////////////////////////////////////////////////
int GET_RunState(int axis_No){
  return STPS[axis_No].run_state;
}

int Get_AxisStatus(int stepper){
int state = 0;
  switch(stepper){
   case X:state = EN_StepX&1; break;
   case Y:state = EN_StepY&1; break;
   case Z:state = EN_StepZ&1; break;
   case A:state = EN_StepA&1; break;
   //case B:EN_StepB = 0; break;
   //case C:EN_StepC = 0; break;
  }
  return state;
}

//////////////////////////////////////////////////////////
//returns the output state of the axis
int Get_Axis_Enable_States(){
 int temp = 0;
 temp |= OC3IE_bit << 3;
 temp |= OC7IE_bit << 2;
 temp |= OC2IE_bit << 1;
 temp |= OC3IE_bit << 0;
 return temp;
}

//////////////////////////////////////////////////////////
//      ENABLE / DISABLE  SINGLE AXIS  CONTROL          //
//////////////////////////////////////////////////////////
void Single_Axis_Enable(_axis_ axis_){
//pre condition axis stop control for interpolate here??
 axis_running =0;
 
  switch(axis_){
     case X:
           OC5IE_bit = 1;OC5CONbits.ON = 1;
          break;
     case Y:
           OC2IE_bit = 1;OC2CONbits.ON = 1;
          break;
     case Z:
           OC7IE_bit = 1;OC7CONbits.ON = 1;
          break;
     case A:
           OC3IE_bit = 1;OC3CONbits.ON = 1;
          break;
     case B:
          OC6IE_bit = 1;OC6CONbits.ON = 1;
          break;
     case C:
          OC8IE_bit = 1;OC8CONbits.ON = 1;
          break;
     default:
          break;
  }
}

void StopAxis(int axis){
  switch(axis){
   case X:
         OC5IE_bit = 0;
         OC5CONbits.ON = 0;
         break;
   case Y:
         OC2IE_bit = 0;
         OC2CONbits.ON = 0;
         break;
   case Z:
        OC7IE_bit = 0;
        OC7CONbits.ON = 0;
        break;
   case A:
        OC3IE_bit = 0;
        OC3CONbits.ON = 0;
        break;
   default : break;
  }
  STPS[axis].stopAxis = 1;
  SV.Tog = 1;
}


void disableOCx(){
   OC5IE_bit = 0;OC5CONbits.ON = 0; //X
   OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
   OC7IE_bit = 0;OC7CONbits.ON = 0; //Z

   OC3IE_bit = 0;OC3CONbits.ON = 0; //A
   OC6IE_bit = 0;OC6CONbits.ON = 0; //B
   OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
}


//toggle the OCxCON regs
void toggleOCx(int axis_No){
  switch(axis_No){
    case X:
         OC5IF_bit = 0;
         OC5R   = 0x5;
         OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
         TMR2   =  0xFFFF;
         OC5CON =  0x8004; //restart the output compare module
         break;
    case Y:
         OC2IF_bit = 0;
         OC2R   = 0x5;
         OC2RS  = STPS[Y].step_delay & 0xFFFF;
         TMR4   =  0xFFFF;
         OC2CON =  0x8004; //restart the output compare module
         break;
    case Z:
         OC7R   = 0x5;
         OC7RS  = STPS[Z].step_delay & 0xFFFF;
         TMR6   =  0xFFFF;
         OC7CON =  0x8004; //restart the output compare module
         break;
    case A:
         OC3R   = 0x5;
         OC3RS  = STPS[A].step_delay & 0xFFFF;
         TMR5   =  0xFFFF;
         OC3CON =  0x800C; //restart the output compare module
         break;
    case B:
         OC6R   = 0x5;
         OC6RS  = STPS[B].step_delay & 0xFFFF;
         TMR3   =  0xFFFF;
         OC6CON =  0x800C; //restart the output compare module
         break;
    case C:
         OC8R   = 0x5;
         OC8RS  = STPS[C].step_delay & 0xFFFF;
         TMR7   =  0xFFFF;
         OC8CON =  0x800C; //restart the output compare module
         break;
    default:
         break;
  }

}

/////////////////////////////////////////////////
//       STEPS CYCLE CONTROL SECTION           //
/////////////////////////////////////////////////

//Step cycle out of for loop
void Step_Cycle(int axis_No){
  toggleOCx(axis_No);
 //keep track of relative position
  STPS[axis_No].step_count++;
 //keep track of absolute position
  STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;

}

//reset the pulse
static int Pulse(int axis_No){

  switch(STPS[axis_No].run_state) {
    case STOP:
        STPS[axis_No].run_state  = STOP;
        StopAxis(axis_No);
        SV.Tog = 1;
      break;
    case ACCEL:
      //taylor series calculation for acc
      AccDec(axis_No);
      if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
         STPS[axis_No].step_delay = STPS[axis_No].min_delay;
         //STPS[axis_No].run_state  = RUN;
      }
      if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
           STPS[axis_No].run_state  = RUN;
      }
      //if the peak of the triangle is before max_accel_limit
      //then start to decel
      if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
         STPS[axis_No].accel_count = STPS[axis_No].decel_val;
         STPS[axis_No].rest        = 0;
         STPS[axis_No].run_state   = DECEL;
      }
      break;
    case RUN:
      STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      // Check for decelration start position.
      // Start decelration with same delay as accel ended with.
      if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
         STPS[axis_No].accel_count = STPS[axis_No].decel_val;
         STPS[axis_No].rest        = 0;
         STPS[axis_No].run_state   =  DECEL;
      }
      break;
    case DECEL:
      //taylor series calculation for dec
      AccDec(axis_No);
      // Check for final step
      if(STPS[axis_No].accel_count >= -1 ){
        STPS[axis_No].run_state = STOP;
      }
      break;
    default:break;
  }
  return axis_No;
}


//Accel Decel calculation and test
static void AccDec(int axis_No){
  STPS[axis_No].accel_count++;
  STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
  STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
  STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
}



//////////////////////////////////////////////////////////
//               ISR PULSE CONTROL                      //
//////////////////////////////////////////////////////////
// X AXIS ISR
void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
     OC5IF_bit = 0;
     
     if(SV.Single_Dual == 0){
        SingleStepAxis(X);
     }else{
       if(STPS[X].master = 1){
          if(axis_xyz == xy)
               Axis_Interpolate(X,Y);
          else if(axis_xyz == xz)
               Axis_Interpolate(X,Z);
          else if(axis_xyz == yz)
               Axis_Interpolate(Y,Z);
       }
     }
}


//Y AXIS ISR
void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
   OC2IF_bit = 0;

   if(SV.Single_Dual == 0){
        SingleStepAxis(Y);
   }else {
      if(STPS[Y].master = 1){
        if(axis_xyz == xy )
           Axis_Interpolate(X,Y);
        else if(axis_xyz == yz)
           Axis_Interpolate(Y,Z);
        else if(axis_xyz == ya)
           Axis_Interpolate(Y,A);
      }
   }
}

//Z AXIS ISR
void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
   OC7IF_bit = 0;

   if(SV.Single_Dual == 0){
        SingleStepAxis(Z);
   }else{
     if(STPS[Z].master = 1){
        if(axis_xyz == xz)
           Axis_Interpolate(X,Z);
        else if(axis_xyz == yz)
           Axis_Interpolate(Y,Z);
        else if(axis_xyz == za)
           Axis_Interpolate(Z,A);

     }
   }

}

// A AXIS ISR
void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
   OC3IF_bit = 0;

   if(SV.Single_Dual == 0){
        SingleStepAxis(A);
   }else{
     if(STPS[A].master = 1){
        if(axis_xyz == xa)
           Axis_Interpolate(X,A);
        else if(axis_xyz == ya)
           Axis_Interpolate(Y,A);
        else if(axis_xyz == za)
           Axis_Interpolate(Z,A);
      }
   }
}


////////////////////////////////////////////////////////
//        SINGLE AXIS STEP FUNCTIONALITY              //
////////////////////////////////////////////////////////

void SingleStepAxis(int axis){
  /*  if(STPS[axis].step_count >= STPS[axis].dist){
      StopAxis(axis);
      return;
    } */
  //  else{
      Step_Cycle(axis);
      Pulse(axis);
  //  }
}

////////////////////////////////////////////////////////
//   INTERPOLATE MULTI AXIS USING BRESENHAMS ALGO     //
//       MASTER AXIS CONTROLS THE ACCELERATION        //
////////////////////////////////////////////////////////

void Axis_Interpolate(int axisA,int axisB){
static int cnt;

   cnt++;
   if(cnt > 5){
      LED2=!LED2;
      cnt = 0;
   }

   if(SV.dA >= SV.dB){
     STPS[axisB].step_delay  = STPS[axisA].step_delay;
     STPS[axisB].accel_count = STPS[axisA].accel_count;
     
     if(STPS[axisA].step_count < STPS[axisA].dist)
        Step_Cycle(axisA);
     else{
       if(SV.cir)
          StopAxis(axisA);
     }
        
     if(!SV.cir)
        Pulse(axisA);


      if(SV.dif < 0){
          SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
      }else{
          Step_Cycle(axisB);
          SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
      }
      //axisA is used here to stop axisB otherwise axisB will over step its mark
      if(STPS[axisA].run_state == STOP | STPS[axisA].step_count >= STPS[axisA].dist){
        StopAxis(axisB);
        STPS[axisA].run_state = STOP;
        STPS[axisB].run_state = STOP;
      }
        
   }else{
     STPS[axisA].step_delay  = STPS[axisB].step_delay;
     STPS[axisA].accel_count = STPS[axisB].accel_count;
     
     if(STPS[axisB].step_count < STPS[axisB].dist)
       Step_Cycle(axisB);
     else{
       if(SV.cir)
         StopAxis(axisB);
     }
     
     if(!SV.cir)
       Pulse(axisB);
       
         
     if(SV.dif < 0){
       SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
     }else{
         Step_Cycle(axisA);
         SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
     }
     //axisB is used here to stop axisA otherwise axisA will over step its mark
     if(STPS[axisB].run_state == STOP | STPS[axisB].step_count >= STPS[axisB].dist){
        StopAxis(axisA);
        STPS[axisA].run_state = STOP;
        STPS[axisB].run_state = STOP;
     }
   }
}