#include "Stepper.h"


/*
 * DDS (Direct Digital Synthesis) tick function and axis control
*/
void dds_tick();
volatile dds_axis_t dds_axes[4];


char txt_A[9];


//unsigned int Toggle;
//long test;
static int axis_running;


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

//stepper timeout counter
dds_axes[0].incrament = 54540;
}


/*
 * void dds_tick() is called on each Timer8 interrupt to update the DDS axes
 * This function should handle the timing and control of the stepper motor
 * Timer 8 must be started in code first.
 */
void dds_tick(){
  // Implement the DDS tick handling for each axis here
  dds_axes[0].old_phase = dds_axes[0].phase;
  dds_axes[0].phase += dds_axes[0].incrament;

  if(dds_axes[0].phase < dds_axes[0].old_phase){
    LED2 = !LED2;
  }
}

//Shared enable: all drivers switch together (active low)
void EnableSteppers(){
  EN_Steppers = 0;
}

void DisableSteppers(){
  EN_Steppers = 1;
}

void DisableSpindleInterrupt(int stepper){
  OC8IE_bit = 0;
  OC8CONbits.ON = 0;
}

//////////////////////////////////////////////////////////
//            POL THE AXIS BITS                      //
//////////////////////////////////////////////////////////
int GET_RunState(int axis_No){
  return STPS[axis_No].run_state;
}

int Steppers_Enabled(){
  return EN_Steppers? 0:1;
}

//////////////////////////////////////////////////////////
//      ENABLE / DISABLE  SINGLE AXIS  CONTROL          //
//////////////////////////////////////////////////////////
void Single_Axis_Enable(_axis_ axis_){
//pre condition axis stop control for interpolate here??
 axis_running = 0;
 EnableSteppers();
}

//Stop one axis only; the shared enable stays on for the others
void StopAxis(int axis){
  STPS[axis].stopAxis = 1;
}


void disableSpindleOCx(){
   OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
}



/////////////////////////////////////////////////
//       STEPS CYCLE CONTROL SECTION           //
/////////////////////////////////////////////////


////////////////////////////////////////////////////////
//        SINGLE AXIS STEP FUNCTIONALITY              //
////////////////////////////////////////////////////////



////////////////////////////////////////////////////////
//   INTERPOLATE MULTI AXIS USING BRESENHAMS ALGO     //
//       MASTER AXIS CONTROLS THE ACCELERATION        //
////////////////////////////////////////////////////////
//keep Axis_interpolation scope local
