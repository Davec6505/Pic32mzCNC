#ifndef KINEMATICS_H
#define KINEMATICS_H

#include "Stepper.h"
#include  "SErial_Dma.h"

//Circle defines and consts
// Decide how many axis you would like to run
#define NoOfAxis 6
#define  Pi         3.141593
#define  rad2deg   (180.00/Pi)
#define  deg2rad   (Pi/180.00)

/*
 *FUNCTION POINTER ARRAY FOR TOGGLING BETWEEN LINEAR
 *OUTPUT COMPARE AND CIRCULAR OUTPUT COMPARE
 */
extern volatile void (*AxisPulse[3])();

////////////////////////////////////////////////////
//       ******LINEAR INTERPOLATION******         //
////////////////////////////////////////////////////
typedef struct Steps{
   //! micro sec  count value for clock pluse compare
  signed long microSec;
  //! Step bit check
  unsigned short CheckStep: 1;
  //! Direction stepper motor should move.
  unsigned short PLS_Step_ : 1;
  //!
  unsigned short StepBits:  1;
  //! axis to stop 1st
  unsigned short stopAxis: 1;
  //! What part of the speed ramp we are in.
  unsigned char run_state ;
  //! Peroid of next timer delay. At start this value set the accelration rate.
   long step_delay;
  //! What step_pos to start decelaration
   long decel_start;
  //! Sets deceleration rate.
   long decel_val;
  //! Minimum time delay (max speed)
   long min_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long accel_count;
   long deccl_count;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long step_count;
  //! Distance calculated to travel
   long dist;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long new_step_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long last_accel_delay;
 //! Limit accelleration
   long accel_lim;
 // Limit the number of steps
   long max_step_lim;
 // calculation modulo value
   long rest;
 // Generate a startup delay to accellerate from
  long StartUp_delay;
 //!  the mm to travel
 signed long mmToTravel;
}STP;
extern STP STPS[NoOfAxis];


////////////////////////////////////////////////////
//     ******CIRCULAR INTERPOLATION******         //
////////////////////////////////////////////////////
struct degs{
double degS;
double degF;
double degT;
double deg;
double degreeDeg;
double degreeRadians;
double newdeg;
};

struct X_Y{
 double X;
 double Y;
};

struct async_{
char x: 1;
};

//circular data
typedef struct{
char   cir_start: 1;
char   cir_end:   1;
char   cir_next:  1;
char   x_next:    1;
char   y_next:    1;
double divisor;
double I;
double J;
double I_end;
double J_end;
double N;
double radius;
int   dir;
int   quadrantS;
int   quadrantF;
unsigned int steps;
unsigned int Idivisor;
double xCenter;
double yCenter;
double xStart;
double yStart;
double xStep;
double yStep;
double xFin;
double yFin;
double xLastStep;
double yLastStep;
double lastX;
double lastY;
struct degs Deg;
struct X_Y XY;
struct async_ async;
}Circle;
extern Circle Circ;


///////////////////////////////////////////
//FUNCTION PROTOTYPES
//Move inline
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
//Circle move axis
void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j,int dir);
void CalcRadius(double i,double j);
void CalcCircCenter(double xS,double yS,double i,double j);
void CalcI_J_FromEndPos(double xF,double yF,double xC,double yC);
double Calc_Angle(double j, double i);
int  Quadrant(double i,double j);
double TestQuadrnt(double i,double j,double aS,double aE);
int CircDir(int dir);
void CalcDivisor();
void CalcStep();
void NextCords();
void CirInterpolation();
void Cir_Interpolation();
void Circ_Tick();
void Circ_Prep_Next();

void SerialPrint();

#endif