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
#define T1_FREQ   781250//=1.28us => timer pre-scaler at (1/64) * 50mhz pbclk3
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
#define ALPHA    (2*3.14159)/SPR
#define A_T_x100 (long)((ALPHA*T1_FREQ)*100)      // (ALPHA / T_FREQ)*100
#define T1_FREQ_148 (long)((T1_FREQ*0.676)/100)   // divided by 100 and scaled by 0.676
#define A_SQ (long)(ALPHA*2*10000000000)          // ALPHA*2*10000000000
#define A_x20000 (long)(ALPHA*20000)              // ALPHA*20000

//////////////////////////////////////////
//structs enums and constants

////////////////////////////////////////////////////
//  ****** INTERPOLATION SPECIFIC  ******         //
////////////////////////////////////////////////////
typedef struct genVars{
  int Single_Dual;
  unsigned short running: 1;       //running bit
  unsigned short startPulses: 1;
  int   Tog;
  int   AxisNo;
 // long  i;
  long  dif;
  long  dA;
  long  dB;
  long  dC;
  long  prevA;
  long  prevB;
  long  prevC;
  long  over;
  int   dirx;
  int   diry;
  int   dirz;
  int   dira;
  int   dirb;
  int   dirc;
  char  cir: 1;
}sVars;
extern sVars SV;


// Initialize the motion plan subsystem
void plan_init(long accel,long decel);
//Acceleration, speed and Circ calcs
void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
//sync the current position of axis
void sys_sync_current_position();
//set the current position to sys.position
void plan_set_current_position(long x, long y, long z);
//efficient sqrt interger calculation
unsigned long sqrt_(unsigned long v);
//calculation of vectors for radius
void r_or_ijk(double xCur,double yCur,double xFin,double yFin,
              double r, double i, double j, double k, int axis_A,int axis_B,int dir);

 #endif