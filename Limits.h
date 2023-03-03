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

#define INV 1

//////////////////////////////////////////////
//SFR's

/////////////////////////////////////////////
//Structs enums and Unions
struct limit {
//hard limits
char Pin: 1;
char Limit_Min: 1;
char Limit_Max: 1;
char T0: 1;
char T1: 1;
char T2: 1;
char T4: 1;
char new_val;
char old_Pval;
char old_Fval;
//hard limits debounce counters
unsigned int Min_DeBnc;
unsigned int last_cnt_min;

//Soft limits
long Soft_Limit_Min;

};

//////////////////////////////////////////////
//Limit function Prototypes
void Limit_Initialize();

static void X_Min_Limit_Setup();
static void Y_Min_Limit_Setup();
static void Z_Min_Limit_Setup();
void A_Min_Limit_Setup();

void Set_Min_Limit(int axis);
char Test_Port_Pins(int axis);
char Test_Min(int axis);
void Reset_Min_Limit(int axis);
void XOR_Min_Limit(int axis);
void Invert_Min_Limit(int axis);
void Debounce_Limits(int axis);
void Reset_Min_Debounce(int axis);

char FP(int axis);
void Rst_FP(int axis);
char FN(int axis);
void Rst_FN(int axis);
#endif