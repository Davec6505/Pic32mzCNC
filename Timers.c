#include "Timers.h"

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
//TMR1 setup to 10ms clock
  T1CON         = 0x8010;
  //PRIORITY 6 SUB-PRIORTY 2
  IPC1SET       = 0x1A;
  //SET IE FLAG
  IEC0       |= 1<<4;
  //CLEAR IF FLAG
  IFS0       |= ~(1<<4);

  PR1           = 62500;
  TMR1          = 0;
}


///////////////////////////////////////////////////////////////////
//TMR 8  initialized to interrupt at 1us was used for early
//interpolation no longer used to interpolate
void InitTimer8(){
  T8CON            = 0x8000;
  T8IP0_bit        = 1;
  T8IP1_bit        = 1;
  T8IP2_bit        = 0;
  T8IS0_bit        = 0;
  T8IS1_bit        = 1;
 // IEC0             = 1<<4;
 // IFS0             =
  T8IF_bit         = 0;
  T8IE_bit         = 0;
  PR8              = 50;
  TMR8             = 0;
}


///////////////////////////////////////////
//TMR 1 as a 10ms clock pulse ???
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_SRS {
  T1IF_bit  = 0;
  //Enter your code here
  Clock();
}

//////////////////////////////////////////
// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
//Enter your code here
//oneShot to start the steppers runnin
  T8IF_bit  = 0;
}

//////////////////////////////////////////
//Do Clock pulses
void ClockPulse(){
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

////////////////////////////////////////////
//COUNT STEPPER RESET
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable){
   TMR.P1 = TMR. clock >> 4;  //1sec clock pulse
   if(last_sec_to_disable == 0)
      TMR.disable_cnt = 1;
   if(TMR.P1 && !TMR.P2){
      TMR.P2 = 1;
      TMR.disable_cnt++;
      if(TMR.disable_cnt > sec_to_disable)
          DisableStepper();
   }else if(!TMR.P1 && TMR.P2)
      TMR.P2 = 0;
      
   return TMR.disable_cnt;
}