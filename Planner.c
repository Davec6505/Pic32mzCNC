#include "Planner.h"


sVars SV;
Homing homing[NoOfAxis];
/////////////////////////////////////////////////////
//       SET THE ACC AND DEC CONSTANTS             //
/////////////////////////////////////////////////////
void plan_init(long accel,long decel)
{
int i = 0;
 for(i = 0; i < NoOfAxis; i++){
  STPS[i].acc_ = accel;
  STPS[i].dec_ = decel;
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
char txt_[9];
long abs_mmSteps = abs(mmSteps);
  // If moving only 1 step then set accel counter
  // and run state to decellerate -ve acc count value
  // is for addition to step couter.
  if(mmSteps == 1){
    STPS[axis_No].accel_count = -1;        // Move one step...
    STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
    STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
    SV.running = 1;                        // start running

  }else if((mmSteps != 0)&&(abs_mmSteps != 1)){
    // Only move if number of steps to move is not zero.
    // Set max speed limit, by calc min_delay to use in timer.
    // min_delay = (ALPHA / T1_Freq)/ speed
    STPS[axis_No].min_delay =  A_T_x100 / speed;

    // Set accelration by calc the first (c0) step delay .
    // step_delay = 1/T1_Freq * sqrt(2*alpha/accel)
    // step_delay = ( T1_Freq*0.676/100 ) * sqrt( (2*alpha*10000000000) / (accel*100) )/10000
    STPS[axis_No].step_delay = abs(T1_FREQ_148 * ((sqrt_(A_SQ / SV.acc))/100));
    STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;

    // Find out after how many steps does the speed hits the max speed limit.
    STPS[axis_No].max_step_lim =(speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);


    //STPS.max_s_lim = (long)speed*speed/(long)(((long)A_x20000*accel)/100);
    // If we hit max speed limit before 0,5 step it will round to 0.
    // But in practice we need to move atleast 1 step to get any speed at all.
    if(STPS[axis_No].max_step_lim == 0){
      STPS[axis_No].max_step_lim = 1;
    }

    // Find out after how many Steps before we must start deceleration.
    // n1 = (n1+n2)decel / (accel + decel) which is 50%
     STPS[axis_No].accel_lim = (abs_mmSteps * SV.dec) / (SV.acc + SV.dec);
    // We must accelrate at least 1 step before we can start deceleration.
    if(STPS[axis_No].accel_lim == 0){
       STPS[axis_No].accel_lim = 1;
    }

    // Use the limit we hit first to calc decel.
    if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
         STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
    }else{
         STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *SV.acc)/SV.dec);
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
 *  brief Find minimum value.
 *  Returns the smallest value.
 *  return  Max(x,y).
 */
unsigned int max_(unsigned int x, unsigned int y){
  if(x > y){
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