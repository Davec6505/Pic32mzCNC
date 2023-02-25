#ifndef STEPPER_H
#define STEPPER_H

 #include "built_in.h"
 #include "Timers.h"
 #include "Pins.h"
 #include "Kinematics.h"
 #include "Settings.h"
 #include "Globals.h"
 #include "Planner.h"
//extern bit PLS_Step_;sfr;


//////////////////////////////////////////////
//defines
typedef unsigned short UInt8_t;


// Speed ramp states
#define STOP  0
#define ACCEL 1
#define DECEL 2
#define RUN   3

// Constants for accelleration

//! Stop and Start toggle bit
//extern  unsigned int Toggle;


//enums
typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za,yx,zx,ax,zy,ay,az}axis_combination ;

extern _axis_ _axis;
extern volatile axis_combination axis_xyz;
//enum StepState{STOP,ACCEL,RUN,DECEL};

/////////////////////////////////////////
//global variables
extern long test;
/////////////////////////////////////////
//function prototypes
void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
void EnableSteppers(int steppers);
void EnableStepper(int stepper);
void DisableStepper();
void disableOCx();

//Axis status
unsigned int GET_RunState(int axis_No);

//Axis control functions
void SingleStepAxis(int axis);
void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);

//Step control using Output compare module
int Pulse(int axis_No);
void toggleOCx(int axis_No);
void multiToggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Single_Axis_Enable(_axis_ axis_);

void Test_CycleX();
void Test_CycleY();
void Test_CycleZ();
void Test_CycleA();
 
#endif