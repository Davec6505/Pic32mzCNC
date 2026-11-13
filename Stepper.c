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

//Xaxis
  EN_Step_PinDirX  = 0; //output
  DIR_Step_PinDirX = 0;
//  RST_Step_PinDirX = 0;
//  SLP_FLT_Step_PinDirX = 0;
  PLS_Step_PinDirX = 0;

  
//Yaxis
  EN_Step_PinDirY  = 0; //output
  DIR_Step_PinDirY = 0;
//  RST_Step_PinDirY = 0;
//  SLP_FLT_Step_PinDirY = 0;
  PLS_Step_PinDirY = 0;

  
//zaxis
  EN_Step_PinDirZ  = 0; //output
  DIR_Step_PinDirZ = 0;
//  RST_Step_PinDirZ = 0;
//  SLP_FLT_Step_PinDirZ = 0;
  PLS_Step_PinDirZ = 0;

  
//aaxis
  EN_Step_PinDirA  = 0; //output
  DIR_Step_PinDirA = 0;
//  RST_Step_PinDirA = 0;
//  SLP_FLT_Step_PinDirA = 0;
  PLS_Step_PinDirA = 0;

//stepper timeout counter
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
int Get_Axis_IEnable_States(){
 int temp = 0;
 temp |= EN_StepX << 3;
 temp |= EN_StepY << 2;
 temp |= EN_StepZ << 1;
 temp |= EN_StepA << 0;
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
            EN_StepX = 0;
          break;
     case Y:
           EN_StepY = 0;
          break;
     case Z:
           EN_StepZ = 0;
          break;
     case A:
           EN_StepA = 0;
          break;
 /*    case B:
           EN_StepB = 1;
          break;
     case C:
           EN_StepC = 1;
          break;
 */
     default:
          break;
  }
}

void StopAxis(int axis){
  switch(axis){
   case X:
         EN_StepX = 1;
         break;
   case Y:
         EN_StepY = 1;
         break;
   case Z:
        EN_StepZ = 1;
        break;
   case A:
        EN_StepA = 1;
        break;
   default : break;
  }
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
