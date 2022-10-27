#ifndef LIMITS_H
#define LIMITS_H

#include "Pins.h"
#include "Timers.h"
#include "Settings.h"

//////////////////////////////////////////////
//local defines
#ifdef _ms10_
  #define BASE_TMR 0
#endif
#ifdef _ms100_
  #define BASE_TMR 1
#endif
#ifdef _ms300_
  #define BASE_TMR 2
#endif
#ifdef _ms500_
  #define BASE_TMR 3
#endif
#ifdef _sec1_
  #define BASE_TMR 4
#endif

//////////////////////////////////////////////
//SFR's
extern sbit TX0;
extern sbit TX1;
extern sbit TX2;
extern sbit TX3;

extern sbit TY0;
extern sbit TY1;
extern sbit TY2;
extern sbit TY3;

extern sbit TZ0;
extern sbit TZ1;
extern sbit TZ2;
extern sbit TZ3;

extern sbit TA0;
extern sbit TA1;
extern sbit TA2;
extern sbit TA3;

/////////////////////////////////////////////
//Structs enums and Unions
struct limits{
//hard limits
char X_Limit_Min: 1;
char Y_Limit_Min: 1;
char Z_Limit_Min: 1;
char A_Limit_Min: 1;
char X_Limit_Max: 1;
char Y_Limit_Max: 1;
char Z_Limit_Max: 1;
char A_Limit_Max: 1;
//Soft limits
long X_Soft_Limit_Min;
long X_Soft_Limit_Max;
long Y_Soft_Limit_Min;
long Y_Soft_Limit_MAx;
long Z_Soft_Limit_Min;
long Z_Soft_Limit_MAx;
long A_Soft_Limit_Min;
long A_Soft_Limit_MAx;
//hard limits debounce counters
unsigned int X_Min_DeBnc;
unsigned int Y_Min_DeBnc;
unsigned int Z_Min_DeBnc;
unsigned int A_Min_DeBnc;
};



extern struct limits Limits;
//////////////////////////////////////////////
//Limit function Prototypes
void Limit_Initialize();
void X_Min_Limit_Setup();
void Y_Min_Limit_Setup();
void Z_Min_Limit_Setup();
void A_Min_Limit_Setup();

char Test_X_Min();
char Test_Y_Min();
void Reset_X_Min_Limit();
void Reset_Y_Min_Limit();
void Debounce_X_Limits();
void Debounce_Y_Limits();
void Reset_X_Min_Debounce();
void Reset_Y_Min_Debounce();

#endif