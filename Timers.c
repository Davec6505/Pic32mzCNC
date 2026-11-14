#include "Timers.h"

void (*DDS_Tick)();
void (*Clock)();
struct Timer TMR;

static unsigned int ms100, ms300, ms500, ms800, sec1, sec1_5, sec2;

 /////////////////////////////////////////////////////////////////
//TMR 1 setup for 1us pusles as a dummy axis for single puls to
//keep the seep equivilant to Bres algo dual axis.
void InitTimer1(){
//Clock pulses 100ms 500ms 800ms 1sec
  Clock = ClockPulse;
//count 1sec pulses to a predefined value to reset steppers
  TMR.Reset = ResetSteppers;
//TMR1 setup to 10ms clock: PBCLK3 50MHz / 8 = 6.25MHz, PR1 62500
  T1CON         = 0x0010;   //off, 1:8 prescaler
  PR1           = 62500;
  TMR1          = 0;
  //PRIORITY 6 SUB-PRIORTY 2
  IPC1CLR       = 0x1F;
  IPC1SET       = 0x1A;
  IFS0CLR       = 1<<4;
  IEC0SET       = 1<<4;
  T1CONSET      = 0x8000;   //on
}


//TMR 8  initialized to interrupt at 10us was used for early
//interpolation no longer used to interpolate
void InitTimer8(){
  T8CON            = 0x0000;
  //PRIORITY 7, the highest: step timing comes before everything else
  T8IP0_bit        = 1;
  T8IP1_bit        = 1;
  T8IP2_bit        = 1;
  T8IS0_bit        = 0;
  T8IS1_bit        = 1;
 // IEC0             = 1<<4;
 // IFS0             =
  T8IF_bit         = 0;
  T8IE_bit         = 1;
  PR8              = 500;
  TMR8             = 0;
}

void Timer8_Start(){
   T8CONbits.ON = 1;
}

void Timer8_Stop(){
   T8CONbits.ON = 0;
}

void Timer8CallbackInitialize(void (*callback)()){
   DDS_Tick = callback;
}



/*
 * ISR for Timer interrupts
*/
//TMR 1: 10 ms clock pulses and limit sampling, priority 6
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_SRS {
  T1IF_bit  = 0;
  Clock();
  Limits_Sample();
}


// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 7 ics ICS_SRS {
//Enter your code here
  T8IF_bit  = 0;
  if(DDS_Tick) DDS_Tick();

}


//Do Clock pulses
static void ClockPulse(){
 ms100++;
 ms300++;
 ms500++;
 sec1++;

   TMR.clock.B0 = !TMR.clock.B0;
   if(ms100 > 9){
      ms100 = 0;
      TMR.clock.B1 = !TMR.clock.B1;
   }
   if(ms300 > 29){
      ms300 = 0;
      TMR.clock.B2 = !TMR.clock.B2;
   }
   if(ms500 > 49){
      ms500 = 0;
      TMR.clock.B3 = !TMR.clock.B3;
   }
   if(sec1 > 99){
      sec1 = 0;
      TMR.clock.B4 = !TMR.clock.B4;
   }

}


//COUNT STEPPER RESET
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable){
   TMR.P1 = TMR. clock >> 4;  //1sec clock pulse
   if(last_sec_to_disable == 0)
      TMR.disable_cnt = 1;
   if(TMR.P1 && !TMR.P2){
      TMR.P2 = 1;
      TMR.disable_cnt++;
      if(TMR.disable_cnt > sec_to_disable){
          DisableSteppers();
      }
   }else if(!TMR.P1 && TMR.P2)
      TMR.P2 = 0;
      
   return TMR.disable_cnt;
}
