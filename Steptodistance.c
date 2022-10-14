/////////////////////////////////////////////////////////
//        Stepper motor specific calculations          //
/////////////////////////////////////////////////////////

//SPMM = steps per millimeter
//SPR  = steps per reveloution
// N   = number of turns that the leadscrew must travel to move 1 mm
// p   = leadscrew pitch
// uStep = micro steps
#include "Steptodistance.h"


////////////////////////////////////////////
//Calculate the setp count to move for
//a lead screw drivem axis
// SPMM = 1/p * 1/uStep * SPR
long leadscrew_steps(double move_distance){
double temp = 0.00;
#ifndef USE_LEADSCREW_PITCH
   temp =  N * INVERSE_M_STEP * SPR;
#else
   temp =  INVERSE_LEADSCREW_PITCH * INVERSE_M_STEP * SPR;
#endif
  return temp;
}

///////////////////////////////////////////
//Calculate the setp count to move for
//a belt driven axixs
// SPMM = 1/p * 1/uStep * 1/BTC * SPR
long belt_steps(double move_distance){
 double temp = 0;
  temp = (SPRU/(BELT_PITCH*PULLEY_TOOTH_COUNT))*move_distance;
<<<<<<< HEAD

  return (signed long)temp;
}

///////////////////////////////////////////
//mm to inches conversion arg in mm
//returns inches
double mm2in(double mm){
  return mm * INCH_PER_MM;
}

=======
  return (long)temp;
}

///////////////////////////////////////////
//mm to inches conversion arg in mm
//returns inches
double mm2in(double mm){
  return mm * INCH_PER_MM;
}

>>>>>>> patch2
//////////////////////////////////////////
//Convert inches to mm arg in inches
//returns mm
double in2mm(double inch){
  return inch * MM_PER_INCH;
}


///////////////////////////////////////////
//Test system not to be used for future
//production code
long calcSteps(double mmsToMove,  double Dia){
double circ,cirDivision,stepsToMove;

///////////////////////////////////////////
// calculate the circumfrence
  circ = Dia*Pi;

//////////////////////////////////////////
//use the circumfrence and spr to get steps
  cirDivision = mmsToMove / circ;
  stepsToMove = cirDivision * SPRU;


  return (signed long)stepsToMove;
}