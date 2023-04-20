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

/*! \Brief Frequency of timer1 in [Hz].
 * Newtimer 50000000
 * Modify this according to frequency used. Because of the prescaler setting,
 * the timer1 frequency is the clock frequency divided by 8.
 */
// Timer/Counter 1 running on 3,686MHz / 8 = 460,75kHz (2,17uS). (T1-FREQ 460750)
// 1.28us/tick => timer pre-scaler at (1/64) * 50mhz pbclk3
//#define ONE_64
#define ONE_8

#ifdef ONE_64
 #define T1_FREQ   781250
#endif
#ifdef ONE_8
 #define T1_FREQ   6250000
#endif

#define minSpeed  30210
#define maxSpeed  10
#define cirSpeed  100

#define MAX_ACC_LIM 5000
#define MIN_ACC_LIN 10

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
  char  running: 1;        //running bit
  char  startPulses: 1;
  char  homed: 1;         //busy homing
  char  run_circle: 1;        //circle in motion indicator
  char  cir: 1;
  char  Single_Dual: 1;
  char  mode_complete: 2;
  int   AxisNo;
  int   dirx;
  int   diry;
  int   dirz;
  int   dira;
  int   dirb;
  int   dirc;
  long  dif;
  long  dA;
  long  dB;
  long  dC;
  long  prevA;
  long  prevB;
  long  prevC;
  long  over;
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

//set the current position to sys.position
void plan_set_current_position();

//after homing set abs osition to 0
void plan_reset_absolute_position();

//efficient sqrt interger calculation
long sqrt_(long v);

//calculation of vectors for radius
void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
              float r, float i, float j, float k, int axis_A,int axis_B,int dir);

 #endif