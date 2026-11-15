#ifndef TIMERS_H
#define TIMERS_H


#include "Config.h"
#include "built_in.h"
#include "Stepper.h"


//STRUCTS and ENUMS

/*
 * General timer structure for managing clock pulses and stepper resets
 * Contains the clock state, stepper pulse flags, disable counter, and reset function pointer
*/
struct Timer{
char clock;
char P1: 1;
char P2: 1;
unsigned int disable_cnt;
unsigned int (*Reset)(unsigned int time,unsigned int last_sec);
};
extern struct Timer TMR;


/* Timer 1 functions */
/*
 * Initializes Timer 1 for generating clock pulses and managing stepper resets
 *Sets up Timer1 as 10ms interrupt timer
 *ISR Priority level 6
 *ISR Sub-priority 2
 *Clears the Timer1 interrupt flag before enabling the interrupt
 *returns nothing
*/
void InitTimer1();

/*Timer 8 functions*/
/*
 * void InitTimer8() initializes Timer 8 for DDS tick interrupts
 *Sets up Timer8 as 10us interrupt timer 
 *ISR Priority level 7
 *ISR Sub-priority 2
 *Clears the Timer8 interrupt flag before enabling the interrupt
 *returns nothing
*/
void InitTimer8();
/*
 * void Timer8CallbackInitialize(void (*callback)()) sets the callback function
 * to be called on each Timer8 interrupt
 *The callback function should have no parameters and return void
 *returns nothing
*/
void Timer8CallbackInitialize(void (*callback)());
/*
 * void Timer8_Start() starts Timer8 by setting the ON bit
 * returns nothing
 */
void Timer8_Start();
/*
 * void Timer8_Stop() stops Timer8 by clearing the ON bit
 * returns nothing
 */
void Timer8_Stop();

/*
 * ClockPulse updates the general-purpose clock flags
 * This function is typically called from the Timer 1 interrupt
 * returns nothing
 */
static void ClockPulse();

/* ??? going forward I may not use this
 * ResetSteppers disables the stepper motors for a specified duration
 * sec_to_disable: number of seconds to disable the steppers
 * last_sec_to_disable: last recorded disable duration
 * returns the updated disable duration
 */
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);


#endif