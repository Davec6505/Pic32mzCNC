#ifndef STEPTODISTANCE_H
#define STEPTODISTANCE_H

#include "Stepper.h"
#include "built_in.h"
#include "Settings.h"


#define SECPMIN     60.00

//useful macros
// pitch * pulley tooth count
#define PITCHXTOOTH() ((PULLEY_TOOTH_COUNT)*(BELT_PITCH))
// SPR * micro stepping of stepper drive
#define SPRU(spr) ((spr)*(M_STEP))
// rpm = mm/min / (pitch * pulley tooth count) e.g 300/40 = 7.5rpm
#define RPM_FROM_MMPMIN(mm_min) ((mm_min)/(PITCHXTOOTH()))
// rps = rpm/60.0 revs per sec
#define RPS_FROM_MMPMIN(mm_min) ((RPM_FROM_MMPMIN(mm_min))/(SECPMIN))
/////////////////////////////////////////////
//function prototypes

long belt_steps(float move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
float fround(float var);

#endif