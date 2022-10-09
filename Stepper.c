#include "Stepper.h"



/////////////////////////////////
//enum varibles
_axis_ _axis;
axis_combination axis_xyz;

unsigned char AxisNo;
unsigned int Toggle;
//Differential position for interpolation

//////////////////////////////////
//structs
 sVars SV;
 StepTmr STmr;
 

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

}

/////////////////////////////////
//Setup constants
void StepperConstants(long accel,long decel){
    SV.acc = accel;
    SV.dec = decel;
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

/*! \brief Move the stepper motor a given number of steps.
 *
 *  Makes the stepper motor move the given number of steps.
 *  It accelrate with given accelration up to maximum speed and decelerate
 *  with given deceleration so it stops at the given step.
 *  If accel/decel is to small and steps to move is to few, speed might not
 *  reach the max speed limit before deceleration starts.
 *
 *  \param step  Number of steps to move (pos - CW, neg - CCW).
 *  \param accel  Accelration to use, in 0.01*rad/sec^2.
 *  \param decel  Decelration to use, in 0.01*rad/sec^2.
 *  \param speed  Max speed, in 0.01*rad/sec.
 */
void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
int ii;
  // If moving only 1 step.
  if(mmSteps == 1){

    STPS[axis_No].accel_count = -1;        // Move one step...
    STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
    STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
    SV.running = 1;                        // start running

  }
  // Only move if number of steps to move is not zero.
  else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
  
    // Set max speed limit, by calc min_delay to use in timer.
    // min_delay = (alpha / tt)/ w
    STPS[axis_No].min_delay =  A_T_x100 / speed;
    
    // Set accelration by calc the first (c0) step delay .
    // step_delay = 1/tt * sqrt(2*alpha/accel)
    // step_delay = ( tfreq*0.676/100 )*100 * sqrt( (2*alpha*10000000000) / (accel*100) )/10000
    STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
    STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;

/*if(8000 < STPS[axis_No].StartUp_delay)STPS[axis_No].StartUp_delay = 2000;*/
    
    // Find out after how many steps does the speed hits the max speed limit.
    STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
    
    //STPS.max_s_lim = (long)speed*speed/(long)(((long)A_x20000*accel)/100);
    // If we hit max speed limit before 0,5 step it will round to 0.
    // But in practice we need to move atleast 1 step to get any speed at all.
    if(STPS[axis_No].max_step_lim == 0){
      STPS[axis_No].max_step_lim = 1;
    }
    
    // Find out after how many Steps before we must start deceleration.
    // n1 = (n1+n2)decel / (accel + decel) which is 50%
    STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
    
    // We must accelrate at least 1 step before we can start deceleration.
    if(STPS[axis_No].accel_lim == 0){
       STPS[axis_No].accel_lim = 1;
    }

    // Use the limit we hit first to calc decel.
    if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
         if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
         else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
    }else{
         STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
    }
    // Find step to start decleration.
    if(mmSteps >= 0){
        if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
        else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
    }
    else {
        if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
        else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
    }
    // We must decelrate at least 1 step to stop.
    if(STPS[axis_No].decel_val == 0){
      STPS[axis_No].decel_val = -1;
    }

    // If the maximum speed is so low that we dont need to go via accelration state.
    if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
      STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      STPS[axis_No].run_state = RUN;
    }else{
       STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
       STPS[axis_No].run_state = ACCEL;
    }

  }
      STPS[axis_No].step_count  = 0;
      STPS[axis_No].rest        = 0;
      STPS[axis_No].microSec    = 0;
      STPS[axis_No].accel_count = 1;
      STPS[axis_No].dist        = 0;
      SV.Tog   = 0;
      SV.running = 1;
}



/////////////////////////////////////////////////
//       STEPS CYCLE CONTROL SECTION           //
/////////////////////////////////////////////////

//Step cycle out of for loop
void Step_Cycle(int axis_No){
      toggleOCx(axis_No);
      Pulse(axis_No);
}


//toggle the OCxCON regs
void toggleOCx(int axis_No){
      switch(axis_No){
        case X: OC5R   = 0x5;
                OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
                TMR2   =  0xFFFF;
                OC5CON =  0x8004; //restart the output compare module
             break;
        case Y: OC2R   = 0x5;
                OC2RS  = STPS[Y].step_delay & 0xFFFF;
                TMR4   =  0xFFFF;
                OC2CON =  0x8004; //restart the output compare module
             break;
        case Z: OC7R   = 0x5;
                OC7RS  = STPS[Z].step_delay & 0xFFFF;
                TMR6   =  0xFFFF;
                OC7CON =  0x8004; //restart the output compare module
             break;
        case A: OC3R   = 0x5;
                OC3RS  = STPS[A].step_delay & 0xFFFF;
                TMR5   =  0xFFFF;
                OC3CON =  0x800C; //restart the output compare module
             break;
        case B: OC6R   = 0x5;
                OC6RS  = STPS[B].step_delay & 0xFFFF;
                TMR3   =  0xFFFF;
                OC6CON =  0x800C; //restart the output compare module
             break;
        case C: OC8R   = 0x5;
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
           SV.Tog = 1;
        break;

      case ACCEL:
        /*
        * Chech if we should start decelration.
        * Check if we hit max speed.
        */
        AccDec(axis_No);
        if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
        //  STPS.last_accel_delay = STPS.new_step_delay;
             STPS[axis_No].step_delay = STPS[axis_No].min_delay;
             STPS[axis_No].run_state  = RUN;
        }
        if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
             STPS[axis_No].run_state  = RUN;
        }
        if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
          STPS[axis_No].accel_count = STPS[axis_No].decel_val;
          STPS[axis_No].rest        = 0;
          STPS[axis_No].run_state   = DECEL;
        }
        break;

      case RUN:
        STPS[axis_No].step_delay = STPS[axis_No].min_delay;
        // Chech if we should start decelration.
        if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
             STPS[axis_No].accel_count = STPS[axis_No].decel_val;
             STPS[axis_No].rest        = 0;
        // Start decelration with same delay as accel ended with.
             STPS[axis_No].run_state   =  DECEL;
        }
        break;

      case DECEL:
        /*
        * Chech if we should start decelration.
        * Check if we hit max speed.
        */
        AccDec(axis_No);
        // else STPS[axis_No].new_step_delay = STPS[axis_No].StartUp_delay;
        // Check if we at last step

        if(STPS[axis_No].accel_count >= 0 ){
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

//////////////////////////////////////////////////////////
//      ENABLE / DISABLE  MULTI AXIS  CONTROL           //
//////////////////////////////////////////////////////////
void Multi_Axis_Enable(axis_combination axis){
   switch(axis){
     case xy:
          OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
          OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
          break;
     case xz:
          OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
          OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
          break;
     case yz:
          OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
          OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
          break;
     case xa:
          OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
          OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
          break;
     case ya:
          OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
          OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
          break;
     case za:
          OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
          OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
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
     STPS[X].step_count++;
     OC5IF_bit = 0;

     if(SV.Single_Dual == 0)
        SingleStepX();
     else
        AxisPulse[SV.Single_Dual]();
}

void SingleStepX(){
    if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
      StopX();
    }
    else{
      Step_Cycle(X);
    }
}


void StopX(){
   OC5IE_bit = 0;
   OC5CONbits.ON = 0;
}


//////////////////////////////////////////////////////////
//            Y AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
   STPS[Y].step_count++;
   OC2IF_bit = 0;

   if(SV.Single_Dual == 0)
        SingleStepY();
     else
        AxisPulse[SV.Single_Dual]();
}

void SingleStepY(){
    if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
      StopY();
    }
    else{
      Step_Cycle(Y);
    }
}

void StopY(){
   OC2IE_bit = 0;
   OC2CONbits.ON = 0;
}


//////////////////////////////////////////////////////////
//            Z AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
   STPS[Z].step_count++;
   OC7IF_bit = 0;

   if(SV.Single_Dual == 0)
        SingleStepZ();
     else
        AxisPulse[SV.Single_Dual]();

}

void SingleStepZ(){
   if(STPS[Z].step_count >= STPS[Z].dist){
      StopZ();
   }
   else{
      Step_Cycle(Z);
   }
}

void StopZ(){
   OC7IE_bit = 0;
   OC7CONbits.ON = 0;
}

//////////////////////////////////////////////////////////
//            A AXIS PULSE CONTROL                      //
//////////////////////////////////////////////////////////
void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
   STPS[A].step_count++;
   OC3IF_bit = 0;

   if(SV.Single_Dual == 0)
        SingleStepA();
     else
        AxisPulse[SV.Single_Dual]();

}

void SingleStepA(){
   if(STPS[A].step_count >= STPS[A].dist){
      StopA();
   }
   else{
      Step_Cycle(A);
   }
}

void StopA(){
   OC3IE_bit = 0;
   OC3CONbits.ON = 0;
}

////////////////////////////////////////////////
//              CALCULATIONS                  //
////////////////////////////////////////////////

/*!
 *  brief Find minimum value.
 *  Returns the smallest value.
 *  return  Min(x,y).
 */
unsigned int min_(unsigned int x, unsigned int y){
  if(x < y){
    return x;
  }
  else{
    return y;
  }
}
/*!
 *    brief Square root routine.
 *    sqrt routine, from comp.sys.ibm.pc.programmer
 *    Subject: Summary: SQRT(int) algorithm (with profiling)
 *    From: warwick@cs.uq.oz.au (Warwick Allison)
 *    Date: Tue Oct 8 09:16:35 1991
 *    param x  Value to find square root of.
 *    return  Square root of x.
 */
static unsigned long sqrt_(unsigned long x){

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


///////////////////////////////////////////////////////////////////////////////
//TEST CODE
 /*if(OC3RS > 2000)OC3RS -= 100;
     else{
         OC3RS -= 1;
         if(OC3RS < 350)OC3RS = 350;
     }*/


/*if(OC6RS > 2000)OC6RS -= 100;
     else{
         OC6RS -= 1;
         if(OC6RS < 350)OC6RS = 350;
     }*/
     
     
////////////////////////////////////////////////////////
//            OBSOLETE CODE                           //
////////////////////////////////////////////////////////

///////////////////////////////////////////////////////
//interrupt cycles  run from 1.25us clock pulse
void CycleStop(){
int ii;
   STmr.uSec = 0;
   for(ii = 0;ii<NoOfAxis;ii++){
    STPS[ii].microSec = 0;
    if(ii > NoOfAxis)break;
   }
}

void CycleStart(){
int ii;

  if(SV.Tog == 0){
   for(ii = 0; ii < NoOfAxis;ii++){
     if(ii > NoOfAxis)break;
     STPS[ii].microSec++;
   }
  }
}