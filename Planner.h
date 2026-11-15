 #ifndef PLANNER_H
 #define PLANNER_H

#include "Config_adv.h"
#include "Stepper.h"
#include "Kinematics.h"
#include "Globals.h"


// Useful macros
#define clear_vector(a) memset(a, 0, sizeof(a))
#define clear_vector_float(a) memset(a, 0.0, sizeof(float)*N_AXIS)
#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))

//The ramp delay is expressed in Timer1 ticks (50 MHz PBCLK3 / 8).
//The DDS_T1_RATIO_X2 conversion in Stepper.h must agree with this frequency.
//#define ONE_64
#define ONE_8

#ifdef ONE_64
 #define T1_FREQ   781250
#endif
#ifdef ONE_8
 #define T1_FREQ   6250000
#endif

#define minSpeed  30210
/************************************************************************
* Maths constants. To simplify maths when calculating in speed_cntr_Move().
* Alpha is stepangle in radians 2*pi/spr in rad  || (1.8 * Pi) / 180
* Speed = (ALPHA * T1_FREQ) / Step  {T1_Freq = }
* acc = ((2 * ALPHA * T1_FREQ)*(Step1 - Step2)) / (Step1*Step2)*(Step1+Step2)
*************************************************************************/
#define PIx2        (2.00*M_Pi)
//#define ALPHA       (PIx2/SPR)
//#define A_T_x100    (long)(ALPHA*T1_FREQ*100.00) // (ALPHA / T_FREQ)*100
#define T1_FREQ_148 ((T1_FREQ*0.676)/100.00)       // divided by 100 and scaled by 0.676
#define SQ_MASK     10000000000
#define x20000      20000.00
//#define A_SQ        (long)(ALPHA*2.00*SQ_MASK)   // ALPHA*2*10000000000



////////////////////////////////////////////////////
//structs enums and constants

////////////////////////////////////////////////////
//  ****** INTERPOLATION SPECIFIC  ******         //
////////////////////////////////////////////////////
typedef struct genVars{
  char  cir: 1;
  char  mode_complete;
}sVars;
extern sVars SV;

// Initialize the motion plan subsystem
void plan_init(float accel,float decel);

//Set the values to init calculation constants
void set_calculation_constants();

//Speed in steprate for timers
float Get_Step_Rate(float speed,int axis);

//Acceleration, speed and Circ calcs
void speed_cntr_Move(long mmSteps, float speed, int axis_combo);

//sync the current position of axis
void sys_sync_current_position();

//sync parser position from the actual step counters
void plan_set_current_position();

//efficient sqrt interger calculation
long sqrt_(long v);

//calculation of vectors for radius
void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
              float r, float i, float j, float k, int axis_A,int axis_B,int dir);

 #endif