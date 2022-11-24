 #ifndef PLANNER_H
 #define PLANNER_H

#include "Config_adv.h"
#include "Stepper.h"
#include "Kinematics.h"
#include "Globals.h"


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

//////////////////////////////////////////
//structs enums and constants



// Initialize the motion plan subsystem
void plan_init(long accel,long decel);
//Acceleration, speed and Circ calcs
void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
//efficient sqrt interger calculation
unsigned long sqrt_(unsigned long v);

//return min of long value
unsigned int min_(unsigned long x, unsigned long y);

//return min of long value
unsigned int max_(unsigned long x, unsigned long y);
 #endif