#ifndef TIMERS_H
#define TIMERS_H


#include "Config.h"
#include "built_in.h"
#include "I2C_LCD.h"
#include "Stepper.h"
////////////////////////////////////////////////////
//STRUCTS and ENUMS

struct Timer{
char clock;
char P1: 1;
char P2: 1;
unsigned int disable_cnt;
unsigned int (*Reset)(unsigned int time,unsigned int last_sec);
};
extern struct Timer TMR;


void InitTimer1();
void InitTimer8();
void ClockPulse();
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#endif