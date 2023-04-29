#ifndef STEPPER_H
#define STEPPER_H

 #include "Kinematics.h"
 #include "built_in.h"
 #include "Timers.h"
 #include "Pins.h"
 #include "Settings.h"
 #include "Globals.h"
 #include "Planner.h"
//extern bit PLS_Step_;sfr;

//////////////////////////////////////////////
//stepper macros


//////////////////////////////////////////////
//defines
typedef unsigned short UInt8_t;


// Speed ramp states
#define STOP  0
#define ACCEL 1
#define DECEL 2
#define RUN   3

//incrament value for axis floating point
#define EPSILON 0.001

//! Stop and Start toggle bit
//extern  unsigned int Toggle;


//enums
typedef enum _axis_{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
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

void DisableStepperInterrupt(int stepper);
void EnableSteppers(int steppers);
void EnableStepper(int stepper);
void DisableStepper();
void disableOCx();

//Axis status
int GET_RunState(int axis_No);
int Get_AxisStatus(int stepper);
int Get_Axis_IEnable_States();
int Get_Axis_Run_States();

//Axis control functions
static void SingleStepAxis(int axis);
void Start_Interpolation(int axisA,int axisB);
static void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);

//Step control using Output compare module
static int Pulse(int axis_No);
static void toggleOCx(int axis_No);
//static void multiToggleOCx(int axis_No);
static static void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Single_Axis_Enable(_axis_ axis_);

 
#endif