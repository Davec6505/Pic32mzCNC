#ifndef KINEMATICS_H
#define KINEMATICS_H

#include "Stepper.h"
#include  "SErial_Dma.h"

//Circle defines and consts
#define  Pi         3.14159
#define  rad2deg   (180.00/Pi)
#define  deg2rad   (Pi/180.00)


extern void (*AxisPulse[3])();


//circular data
typedef struct{
char   cir_start: 1;
char   cir_end:   1;
char   cir_next:  1;
double deg;
double degreeDeg;
double degreeRadians;
double deg_A;
double deg_B;
double divisor;
double newdeg_;

double I;
double J;
double N;
double radius;
int   dir;
int   quadrant;
unsigned int steps;
unsigned int Idivisor;
double xRad;
double yRad;
double xStart;
double yStart;
double xStep;
double yStep;
double xFin;
double yFin;
double lastX;
double lastY;
}Circle;
extern Circle Circ;


///////////////////////////////////////////
//FUNCTION PROTOTYPES
//Move inline
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
//Circle move axis
void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j, double deg,int dir);
void CalcRadius();
void CalcAngle();
int  Quadrant(double i,double j);
int CircDir(int dir);
void CalcDivisor();
void NextCords(int fin_step);
void CirInterpolation();
void Cir_Interpolation();
void Circ_Tick();
void Circ_Prep_Next();

void SerialPrint();

#endif