#include "Stepper.h"

char txt_A[9];

/////////////////////////////////
//enum varibles
_axis_ _axis;
axis_combination axis_xyz;


unsigned char AxisNo;
unsigned int Toggle;

 

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


void DisableStepper(){
   EN_StepX      = 1;
   EN_StepY      = 1;
   EN_StepZ      = 1;
   EN_StepA      = 1;
}



//speedRampData STPS;



/////////////////////////////////////////////////
//       STEPS CYCLE CONTROL SECTION           //
/////////////////////////////////////////////////

//Step cycle out of for loop
void Step_Cycle(int axis_No){
     //keep track of relative position
      STPS[axis_No].step_count++;
     //keep track of absolute position
      STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
      toggleOCx(axis_No);
}


//toggle the OCxCON regs
void toggleOCx(int axis_No){
      switch(axis_No){
        case X:
             OC5R   = 0x5;
             OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
             TMR2   =  0xFFFF;
             OC5CON =  0x8004; //restart the output compare module
             break;
        case Y:
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

 
//reset the pulse
int Pulse(int axis_No){

/*if(!STPS[axis_No].PLS_Step_ ){
      STPS[axis_No].PLS_Step_   = 1;
    }*/

    switch(STPS[axis_No].run_state) {
      case STOP:
           STPS[axis_No].run_state  = STOP;
           SV.Tog = 1;
        break;

      case ACCEL:
        //taylor series calculation for acc
        AccDec(axis_No);
        if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
             STPS[axis_No].step_delay = STPS[axis_No].min_delay;
             STPS[axis_No].run_state  = RUN;
        }
        if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
        if(STPS[axis_No].accel_count > -1 ){
         STPS[axis_No].run_state = STOP;
        }
        break;
      default:break;
    }
  return axis_No;
}


//Accel Decel calculation and test
void AccDec(int axis_No){
          STPS[axis_No].accel_count++;
          STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
          STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
          STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
}

//////////////////////////////////////////////////////////
//      ENABLE / DISABLE  SINGLE AXIS  CONTROL          //
//////////////////////////////////////////////////////////
void Single_Axis_Enable(_axis_ axis_){
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


void disableOCx(){
     OC5IE_bit = 0;OC5CONbits.ON = 0; //X
     OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
     OC7IE_bit = 0;OC7CONbits.ON = 0; //Z

     OC3IE_bit = 0;OC3CONbits.ON = 0; //A
     OC6IE_bit = 0;OC6CONbits.ON = 0; //B
     OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
}


//////////////////////////////////////////////////////////
//            X AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
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

//////////////////////////////////////////////////////////
//            Y AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
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

//////////////////////////////////////////////////////////
//            Z AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
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

//////////////////////////////////////////////////////////
//            A AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
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
    if(STPS[axis].step_count >= STPS[axis].dist){
      StopAxis(axis);
    }
    else{
      Step_Cycle(axis);
      Pulse(axis);
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
}

////////////////////////////////////////////////////////
//   INTERPOLATE MULTI AXIS USING BRESENHAMS ALGO     //
//       MASTER AXIS CONTROLS THE ACCELERATION        //
////////////////////////////////////////////////////////

void Axis_Interpolate(int axisA,int axisB){

   if((STPS[axisA].step_count > SV.dA)||(STPS[axisB].step_count > SV.dB)){
        StopAxis(axisA);
        StopAxis(axisB);
        return;
   }

   if(SV.dA >= SV.dB){
      Step_Cycle(axisA);
      if(!SV.cir)
        Pulse(axisA);
      if(SV.dif < 0){
          SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
      }else{
          SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
          Step_Cycle(axisB);
      }
   }else{
      Step_Cycle(axisB);
      if(!SV.cir)
         Pulse(axisB);
      if(SV.dif < 0){
         SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
      }else{
         SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
         Step_Cycle(axisA);
       }
   }
}