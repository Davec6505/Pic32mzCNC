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

#define temp_M_STEP 0.032
#define INVERSE_M_STEP (1/temp_M_STEP)       // 1/Stepper micro steps setting
#define SPRU (SPR*M_STEP)   // SPR * micro stepping of stepper drive
#define INVERSE_BELT_PITCH    (1/BELT_PITCH)
#define INVERSE_PULLEY_TOOTH_COUNT (1/PULLEY_TOOTH_COUNT)
#define INVERSE_LEADSCREW_PITCH (1/LEADSCREW_PITCH)
#define BELT_AND_PITCH (PULLEY_TOOTH_COUNT*BELT_PITCH)

//useful macros
#define step1mm ((SPRU)/(BELT_AND_PITCH))
#define mmtostep(mm) ((step1mm) * (mm))
#define steptomm(step) ((step) / (step1mm))

#define EPSILON 0.001

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



#endif