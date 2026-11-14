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

//extern bit PLS_Step_;sfr;


//////////////////////////////////////////////
//defines
//typedef unsigned short UInt8_t;


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
typedef enum _axis_combination_{AXIS_XY,AXIS_XZ,AXIS_YZ,AXIS_XA,AXIS_YA,AXIS_ZA,AXIS_YX,AXIS_ZX,AXIS_AX,AXIS_ZY,AXIS_AY,AXIS_AZ} axis_combination;

extern _axis_ _axis;
extern axis_combination axis_xyz;
//enum StepState{STOP,ACCEL,RUN,DECEL};


//global variables
extern long test;

/* DDS section of control, 
 * TODO: 
 *    1: once implemented, complete the DDS control section remove all old unused code
 */

 
 // axis structure for stepper control
 typedef struct{
    uint32_t phase;
    uint32_t incrament;
    uint32_t old_phase;
 } dds_axis_t;

 extern volatile dds_axis_t dds_axes[4];


//function prototypes
void SetPinMode();
void CycleStart();
void CycleStop();

void DisableStepperInterrupt(int stepper);
void EnableSteppers();
void DisableSteppers();
void disableSpindleOCx();

//Axis status
int GET_RunState(int axis_No);
int Steppers_Enabled();

//Axis control functions
static void SingleStepAxis(int axis);
void Start_Interpolation(int axisA,int axisB);
static void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);

//Step control using Output compare module

void Single_Axis_Enable(_axis_ axis_);

 
#endif