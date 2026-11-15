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

