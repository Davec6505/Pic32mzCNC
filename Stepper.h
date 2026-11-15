#ifndef STEPPER_H
#define STEPPER_H

 #include "Kinematics.h"
 #include "built_in.h"
 #include "Timers.h"
 #include "Pins.h"
 #include "Settings.h"
 #include "Globals.h"
 #include "Planner.h"
 #include <stdint.h>

// Speed ramp states
#define STOP  0
#define ACCEL 1
#define DECEL 2
#define RUN   3

//enums
typedef enum _axis_{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum _axis_combination_{AXIS_XY,AXIS_XZ,AXIS_YZ,AXIS_XA,AXIS_YA,AXIS_ZA,AXIS_YX,AXIS_ZX,AXIS_AX,AXIS_ZY,AXIS_AY,AXIS_AZ} axis_combination;

extern axis_combination axis_xyz;

//DDS step engine: Timer8 runs at DDS_FREQ (PR8 = 500 on 50 MHz PBCLK3)
#define DDS_FREQ          100000
//T1_FREQ / DDS_FREQ * 2 = 6250000 / 100000 * 2, the ramp works in T1 ticks
#define DDS_T1_RATIO_X2   125
//fastest step: one tick high, one low = 50 kHz = 125 T1 ticks
#define DDS_MIN_DELAY     125

//function prototypes
void SetPinMode();
void EnableSteppers();
void DisableSteppers();
void disableSpindleOCx();

//Axis status
int GET_RunState(int axis_No);
//Axis control functions
void Start_Interpolation(int master,int axes);
void Stepper_Abort();
int Stepper_Busy();
void StopAxis(int axis);

//Speed ramp, call after each step pulse (Austin / AVR446 Taylor series)
int Pulse(int axis_No);
#endif