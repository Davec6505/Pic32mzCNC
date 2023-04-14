#ifndef STEPTODISTANCE_H
#define STEPTODISTANCE

#include "Stepper.h"
#include "built_in.h"
#include "Settings.h"


///////////////////////////////////////////////
//constants and defines

//redefined here as I dont want to include GCODE here
//#define MM_PER_INCH (25.40)
//#define INCH_PER_MM (0.0393701)

/*
 *1 radians per second (rad/s) is equal to 9.5492968 
 *rotations per minute (rpm).
 * Conversely, 1 rotations per minute (rpm) is equal 
 *to 0.1047198 radians per second (rad/s).
*/
#define RPM_TO_RAD  9.5492968
#define RAD_TO_RPM  0.1047198

#define temp_M_STEP 0.032
 // 1/mm_rev
#define INVERSE_LEADSCREW_PITCH (1/LEADSCREW_PITCH)
// 1/Stepper micro steps setting
#define INVERSE_M_STEP (1/temp_M_STEP)

//useful macros
// 1/pitch => 1/2
#define INVERSE_BELT_PITCH() ((1)/(BELT_PITCH))
// 1/teeth => 1/20
#define INVERSE_PULLEY_TOOTH_COUNT() ((1)/(PULLEY_TOOTH_COUNT))
// pitch * pulley tooth count
#define PITCHXTOOTH() ((PULLEY_TOOTH_COUNT)*(BELT_PITCH))
// SPR * micro stepping of stepper drive
#define SPRU(spr) ((spr)*(M_STEP))
// rpm = mm/min / (pitch * pulley tooth count) e.g 300/40 = 7.5rpm
#define RPM_FROM_MMPMIN(mm_min) ((mm_min)/(PITCHXTOOTH()))
// 1rad = 9.549rpm  e.g. 7.5rpm / 9.549 = 0.785rad/sec [speed in radians]
#define RADIANS_FROM_RPM(mm_rev) ((RPM_TO_RAD)/(mm_rev))
// Steps/mm  SPRU / PITCHXTOOTH e.g. (200*32)/40 = 160ppmm
#define STEP1MM(spr) ((SPRU(spr))/(BELT_AND_PITCH))
// mm/step  PITCHXTOOTH/SPRU e.g 40/(200*32) = 0.00625
#define MM1STEP(spr,mm) (BELT_AND_PITCH/(SPRU(spr)))


//#define FLOAT_EQ(x,v) (((v-EPSILON)<x)&&(x<(v+EPSILON)))

const float Dia;


//////////////////////////////////////////////
//structs, unions and enums




/////////////////////////////////////////////
//function prototypes

long calcSteps(float mmsToMove, float Dia);
long leadscrew_sets(float move_distance,int axis);
long belt_steps(float move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
float mm2in(float mm);
float in2mm(float inch);
float fround(float var);
float torpm(float mm_per_min);
float toradians(float rev_per_min);


#endif