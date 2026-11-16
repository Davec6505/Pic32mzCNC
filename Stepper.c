#include "Stepper.h"


/*
 * DDS (Direct Digital Synthesis) tick function and axis control
*/
typedef struct{
  uint32_t phase;
  uint32_t increment;
  uint32_t old_phase;
} dds_axis_t;

//DDS step engine: one phase accumulator runs at the master axis step rate.
static volatile dds_axis_t dds_master;
static volatile int  eng_master = -1;   //-1 = idle, set last when a move starts
static volatile int  eng_axes;
static volatile unsigned long eng_err[NoOfAxis];
//$2 cache: idle level per step pin (0 normal, 1 inverted); the active level
//is the opposite. Filled by Stepper_ApplyInvertMasks, read every tick.
static volatile char step_idle[NoOfAxis];
void dds_tick();
static void Step_Cycle(int axis_No);
static unsigned long Dds_Increment(long step_delay);
static void AccDec(int axis_No);

//Set up pin outs
void SetPinMode(){
// configure the dds callback function first
  Timer8CallbackInitialize(dds_tick);

//shared driver enable: start disabled, then make it an output
  EN_Steppers      = 1;
  EN_Steppers_Dir  = 0;

//Xaxis
  DIR_Step_PinDirX = 0;
//  RST_Step_PinDirX = 0;
//  SLP_FLT_Step_PinDirX = 0;
  PLS_Step_PinDirX = 0;

  
//Yaxis
  DIR_Step_PinDirY = 0;
//  RST_Step_PinDirY = 0;
//  SLP_FLT_Step_PinDirY = 0;
  PLS_Step_PinDirY = 0;

  
//zaxis
  DIR_Step_PinDirZ = 0;
//  RST_Step_PinDirZ = 0;
//  SLP_FLT_Step_PinDirZ = 0;
  PLS_Step_PinDirZ = 0;

  
//aaxis
  DIR_Step_PinDirA = 0;
//  RST_Step_PinDirA = 0;
//  SLP_FLT_Step_PinDirA = 0;
  PLS_Step_PinDirA = 0;

  PLS_StepX = 0;
  PLS_StepY = 0;
  PLS_StepZ = 0;
  PLS_StepA = 0;
}


/*
 * void dds_tick() is called on each Timer8 interrupt to update the DDS axes
 * This function should handle the timing and control of the stepper motor
 * Timer 8 must be started in code first.
 */
void dds_tick(){
int m, i;
unsigned long gap;
  //end the pulse raised on the previous tick (10 us wide): back to idle level
  PLS_StepX = step_idle[X];
  PLS_StepY = step_idle[Y];
  PLS_StepZ = step_idle[Z];
  PLS_StepA = step_idle[A];

  m = eng_master;
  if(m < 0) return;

  //a step is due when the phase wraps
  dds_master.old_phase = dds_master.phase;
  dds_master.phase += dds_master.increment;
  if(dds_master.phase >= dds_master.old_phase) return;

  Step_Cycle(m);
  for(i=0;i<NoOfAxis;i++){
    if(i != m && bit_istrue(eng_axes,bit(i))){
      //Subtract before adding to avoid overflow for long moves.
      gap = (unsigned long)STPS[m].dist - (unsigned long)STPS[i].dist;
      if(eng_err[i] >= gap){
        eng_err[i] -= gap;
        Step_Cycle(i);
      }else{
        eng_err[i] += (unsigned long)STPS[i].dist;
      }
    }
  }

  //ramp: new step_delay for the next master step
  Pulse(m);
  if(STPS[m].run_state == STOP){
    for(i=0;i<NoOfAxis;i++){
      if(i != m && bit_istrue(eng_axes,bit(i))){
        STPS[i].run_state = STOP;
        bit_false(SV.mode_complete,bit(i));
      }
    }
    eng_master = -1;
    return;
  }
  dds_master.increment = Dds_Increment(STPS[m].step_delay);
}

//step_delay is in T1_FREQ ticks, the DDS runs at DDS_FREQ:
//increment = 2^32 * T1_FREQ / (DDS_FREQ * step_delay), kept in 32 bits
static unsigned long Dds_Increment(long step_delay){
unsigned long q;
  if(step_delay < DDS_MIN_DELAY) step_delay = DDS_MIN_DELAY;
  q = 0xFFFFFFFF / (unsigned long)step_delay;
  return (q >> 1) * DDS_T1_RATIO_X2;
}

//Start the engine with the chosen master and mask of moving axes.
//All STPS[] fields and DIR pins must be set before this is called.
void Start_Interpolation(int m,int axes){
int i;
  eng_master = -1;
  if(STPS[m].dist <= 0 || STPS[m].run_state == STOP){
    for(i=0;i<NoOfAxis;i++){
      if(bit_istrue(axes,bit(i))){
        STPS[i].run_state = STOP;
        bit_false(SV.mode_complete,bit(i));
      }
    }
    return;
  }
  eng_axes = axes;
  for(i=0;i<NoOfAxis;i++)
    eng_err[i] = (unsigned long)STPS[m].dist >> 1;
  dds_master.phase     = 0;
  dds_master.increment = Dds_Increment(STPS[m].step_delay);
  eng_master = m;
}

//Stop stepping at once (reset, alarm); the position is what was stepped
void Stepper_Abort(){
int i;
  eng_master = -1;
  eng_axes = 0;
  for(i=0;i<NoOfAxis;i++)
    STPS[i].run_state = STOP;
}

int Stepper_Busy(){
  return eng_master >= 0;
}

//$2 step port invert: refresh the cached idle levels from the setting.
//Called at boot/$RST (settings_apply_row) and on a $2 or $3 write; $n= is
//blocked while the machine is busy, and the tick re-drives the pins within
//10 us of a change.
void Stepper_ApplyInvertMasks(){
int i;
  for(i=0;i<NoOfAxis;i++)
    step_idle[i] = bit_istrue(settings.invert_mask,bit(i)) ? 1 : 0;
}

//Shared enable, all drivers switch together. $4=0: enable low (Grbl shield
//style); $4=1 inverts for drivers that enable high.
void EnableSteppers(){
  EN_Steppers = bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE) ? 1 : 0;
}

void DisableSteppers(){
  EN_Steppers = bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE) ? 0 : 1;
}

int GET_RunState(int axis_No){
  return STPS[axis_No].run_state;
}

//Legacy homing flag; the DDS engine does not use it to stop motion.
void StopAxis(int axis){
  STPS[axis].stopAxis = 1;
}


void disableSpindleOCx(){
   OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
}



/////////////////////////////////////////////////
//       STEPS CYCLE CONTROL SECTION           //
/////////////////////////////////////////////////

//Drive the step pin to its active level and count the step, the pin
//returns to its idle level on the next tick
static void Step_Cycle(int axis_No){
  switch(axis_No){
    case X: PLS_StepX = !step_idle[X]; break;
    case Y: PLS_StepY = !step_idle[Y]; break;
    case Z: PLS_StepZ = !step_idle[Z]; break;
    case A: PLS_StepA = !step_idle[A]; break;
    default: break;
  }
  //keep track of relative position
  STPS[axis_No].step_count++;
  //keep track of absolute position
  STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
}

//Call after each step pulse (step_count already incremented) to set
//step_delay, in T1_FREQ ticks, for the next step.
//Decel is indexed by the steps remaining (accel_count = -remaining), so it
//always matches the position and ends on the last step; it never slows below
//the StartUp_delay floor, and the move ends on step_count, not accel_count.
int Pulse(int axis_No){
long remaining = STPS[axis_No].dist - STPS[axis_No].step_count;

  if(STPS[axis_No].run_state != STOP && remaining <= 0)
     STPS[axis_No].run_state = STOP;

  switch(STPS[axis_No].run_state) {
    case STOP:
        StopAxis(axis_No);
        //Clear the master's running bit.
        bit_false(SV.mode_complete,bit(axis_No));
      break;
    case ACCEL:
      //taylor series calculation for acc
      AccDec(axis_No);
      if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
         STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      }
      if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
           STPS[axis_No].run_state  = RUN;
      }
      //if the peak of the triangle is before max_accel_limit
      //then start to decel
      if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
         STPS[axis_No].accel_count = -remaining;
         STPS[axis_No].rest        = 0;
         STPS[axis_No].run_state   = DECEL;
      }
      break;
    case RUN:
      STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      // Check for decelration start position.
      // Start decelration with same delay as accel ended with.
       if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
           STPS[axis_No].accel_count = -remaining;
           STPS[axis_No].rest        = 0;
           STPS[axis_No].run_state =  DECEL;
        }
      break;
    case DECEL:
      //taylor series calculation for dec, accel_count runs -remaining .. -1
      AccDec(axis_No);
      if(STPS[axis_No].step_delay > STPS[axis_No].StartUp_delay)
         STPS[axis_No].step_delay = STPS[axis_No].StartUp_delay;
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
