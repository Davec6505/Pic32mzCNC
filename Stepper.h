#ifndef STEPPER_H
#define STEPPER_H

 #include "built_in.h"
 #include "Timers.h"
 #include "Pins.h"
 #include "Kinematics.h"
 #include "Settings.h"
 #include "Globals.h"
//extern bit PLS_Step_;sfr;


//////////////////////////////////////////////
//defines
typedef unsigned short UInt8_t;


/*! \Brief Frequency of timer1 in [Hz].
 * Newtimer 50000000
 * Modify this according to frequency used. Because of the prescaler setting,
 * the timer1 frequency is the clock frequency divided by 8.
 */
// Timer/Counter 1 running on 3,686MHz / 8 = 460,75kHz (2,17uS). (T1-FREQ 460750)
#define T1_FREQ   781250//=1.28us => timer pre-scaler at (1/64) * 50mhz pbclk3
#define minSpeed  30210
#define maxSpeed  10
#define cirSpeed  100

#define MAX_ACC_LIM 5000
#define MIN_ACC_LIN 10
/************************************************************************
* Maths constants. To simplify maths when calculating in speed_cntr_Move().
* Alpha is stepangle in radians 2*pi/spr in rad  || (1.8 * Pi) / 180
* Speed = (ALPHA * T1_FREQ) / Step
* acc = ((2 * ALPHA * T1_FREQ)*(Step1 - Step2)) / (Step1*Step2)*(Step1+Step2)
*************************************************************************/
#define ALPHA    (2*3.14159)/SPR
#define A_T_x100 (long)((ALPHA*T1_FREQ)*100)    // (ALPHA / T1_FREQ)*100
#define T1_FREQ_148 (long)((T1_FREQ*0.676)/100)      // divided by 100 and scaled by 0.676
#define A_SQ (long)(ALPHA*2*10000000000)                    // ALPHA*2*10000000000
#define A_x20000 (long)(ALPHA*20000)              // ALPHA*20000

// Speed ramp states
#define STOP  0
#define ACCEL 1
#define DECEL 2
#define RUN   3



// Constants for accelleration

  //! Stop and Start toggle bit
extern  unsigned int Toggle;



typedef struct STPT {
//! micro sec counter
 long uSec;
//! axis that is used for accelertation see x = Pulse(n)??
 int axisTosample;
//! check for dly bits
 int howManyOCxRunning;
//! compare the vale of howmanyOCxrunning bits
 int compOCxRunning;
}StepTmr;
extern StepTmr STmr;



//enums
typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;


extern _axis_ _axis;
extern axis_combination axis_xyz;
//enum StepState{STOP,ACCEL,RUN,DECEL};

/////////////////////////////////////////
//global variables

/////////////////////////////////////////
//function prototypes
void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
int  EnableSteppers(int steppers);
void DisableStepper();
void disableOCx();

//Acceleration, speed and Circ calcs
void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
void speed_cntr_Init_Timer1(void);
static unsigned long sqrt_(unsigned long v);
unsigned int min_(unsigned long x, unsigned long y);
void CalcDly(int axis_No);
void StepperConstants(long accel,long decel);



void SingleStepX();
void SingleStepY();
void SingleStepZ();
void SingleStepA();

void XY_Interpolate();
void XZ_Interpolate();
void YZ_Interpolate();
void XA_Interpolate();
void YA_Interpolate();
void ZA_Interpolate();

void StopX();
void StopY();
void StopZ();
void StopA();

//Step control using Output compare module
int Pulse(int axis_No);
void toggleOCx(int axis_No);
void multiToggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);

 
 void Test_CycleX();
 void Test_CycleY();
 void Test_CycleZ();
 void Test_CycleA();
 
#endif