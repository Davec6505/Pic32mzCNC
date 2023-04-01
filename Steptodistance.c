/////////////////////////////////////////////////////////
//        Stepper motor specific calculations          //
/////////////////////////////////////////////////////////

//SPMM = steps per millimeter
//SPR  = steps per reveloution
// N   = number of turns that the leadscrew must travel to move 1 mm
// p   = leadscrew pitch
// uStep = micro steps
#include "Steptodistance.h"
#include "Globals.h"

////////////////////////////////////////////
//Calculate the setp count to move for
//a lead screw drivem axis
// SPMM = 1/p * 1/uStep * SPR
long leadscrew_steps(double move_distance,int axis){
double temp = 0.00;
#ifndef USE_LEADSCREW_PITCH
   temp =  N * INVERSE_M_STEP * settings.steps_per_mm[axis];
#else
   temp =  INVERSE_LEADSCREW_PITCH * INVERSE_M_STEP * settings.steps_per_mm[axis];
#endif
  return temp;
}

///////////////////////////////////////////
//Calculate the setp count to move for
//a belt driven axis
// SPMM = 1/p * 1/uStep * 1/BTC * SPR
long belt_steps(float move_distance,int axis){
 double temp = 0;
  temp = ((M_STEP * settings.steps_per_mm[axis])/(BELT_PITCH * PULLEY_TOOTH_COUNT)) * move_distance; //mmtostep(move_distance);
  return lround(temp);
}

///////////////////////////////////////////
//Calculate from Steps to mm
//SPMM = p^-1 * frq *
float beltsteps2mm(long Steps,int axis){
 float temp = (BELT_PITCH*PULLEY_TOOTH_COUNT*(float)Steps)/(M_STEP * settings.steps_per_mm[axis]); //steptomm(steps);
 temp = fround(temp);
 #if CalcsDebug == 1
 while(DMA_IsOn(1));
 dma_printf("steps1mm:= %f\n",temp);
 #endif
 return temp;
}

float fround(float var){
    // 37.66666 * 100 =3766.66
    // 3766.66 + .5 =3767.16    for rounding off value
    // then type cast to int so value is 3767
    // then divided by 100 so the value converted into 37.67
    float value = (long)(var * 100 + .5);
    return (float)value / 100;
}

///////////////////////////////////////////
//mm to inches conversion arg in mm
//returns inches
double mm2in(double mm){
  return mm * INCH_PER_MM;
}

//////////////////////////////////////////
//Convert inches to mm arg in inches
//returns mm
double in2mm(double inch){
  return inch * MM_PER_INCH;
}


///////////////////////////////////////////
//Test system not to be used for future
//production code
long calcSteps(double mmsToMove,  double Dia,int axis){
double circ,cirDivision,stepsToMove;

///////////////////////////////////////////
// calculate the circumfrence
  circ = Dia*Pi;

//////////////////////////////////////////
//use the circumfrence and spr to get steps
  cirDivision = mmsToMove / circ;
  stepsToMove = cirDivision * settings.steps_per_mm[axis] * M_STEP;


  return (long)stepsToMove;
}

