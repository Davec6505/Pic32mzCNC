//All limits will be implimented here mostly using
//interrupts to stall the motion, and homing
#include "Limits.h"

/////////////////////////////////////
//Limits variables
static struct limit Limit[NoOfAxis];

//////////////////////////////////////////////////////
//              LIMITS INITAILIZE  Y12 & X13        //
//////////////////////////////////////////////////////                                                `1

/////////////////////////////////////
//Configure Pins for Limits as inputs
void Limit_Initialize(){
 int i = 0;
   //set the limit ports to inputs

   X_Min_Limit_Dir = 1;
   Y_Min_Limit_Dir = 1;
   Z_Min_Limit_Dir = 1;
   //set initial limit values
   Limit[X].Limit_Min = 0;
   Limit[Y].Limit_Min = 0;
   Limit[Z].Limit_Min = 0;
   
   //disable external interrupts 1, 2 and 4
   IEC0CLR  = 0x8021 << 8;

   // Limits are sampled in the Timer1 10 ms ISR (Limits_Sample). The INT1/
   // INT2/INT4 handlers below stay unused until PPS-mapped in Config.c.
   // X_Min_Limit_Setup();
   // Y_Min_Limit_Setup();
   // Z_Min_Limit_Setup();
   
   //pre condition last know Limit luesva
  /* for(i = 0;i < NoOfAxis;i++){
     Limit[i].old_Fval = Limit[i].old_Pval = Test_Min(i) & 0x0001;
   }  */
}

////////////////////////////////////////////////////////
//X_Limit SETUP
static void X_Min_Limit_Setup(){
//IFS0<8>
//IEC0<8>
//IPC2<4:2>
//IPC2<1:0>

 //Set Priority level to 4 & sub 1, IP<4:2> = 4, IS<1:0> = 1
 IPC2CLR = 0x1F;
 IPC2SET = 0x11;
 IFS0CLR = 1 << 8;
 IEC0SET = 1 << 8;
}

////////////////////////////////////////////////////////
//Y_Limit SETUP
static void Y_Min_Limit_Setup(){
//IFS0<13>
//IEC0<13>
//IPC3<12:10>
//IPC3<9:8>

 //Set Priority level to 4 & sub 1
 //limits should seldom hit at the sametime [same sub prior]
 IPC3CLR = 0x1F << 8;
 IPC3SET = 0x11 << 8;
 IFS0CLR = 1 << 13;
 IEC0SET = 1 << 13;
}

////////////////////////////////////////////////////////
//Z_Limit SETUP   INT4
static void Z_Min_Limit_Setup(){
//IFS0<23>
//IEC0<23>
//IPC5<28:26>
//IPC5<25:24>

 //Set Priority level to 4 & sub 1
 //limits should seldom hit at the sametime [same sub prior]
 IPC5CLR = 0x1F << 24;
 IPC5SET = 0x11 << 24;
 IFS0CLR = 1 << 23;
 IEC0SET = 1 << 23;
}

/////////////////////////////////////////////////////////////
//                        LIMITS IRQ'S                     //
/////////////////////////////////////////////////////////////

//X Min Limit interrupt
void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_SRS {
   INT1IF_bit = 0;
   Set_Min_Limit(X);
}


///////////////////////////////////////////////////////////
//Y Min Limit interrupt
void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_SRS {
   INT2IF_bit = 0;
   Set_Min_Limit(Y);
}

///////////////////////////////////////////////////////////
//Y Min Limit interrupt
void Z_Min_Limit() iv IVT_EXTERNAL_4 ilevel 4 ics ICS_SRS {
   INT4IF_bit = 0;
   Set_Min_Limit(Z);
}


///////////////////////////////////////////////////////////
//                LIMIT BITS SAMPLING                    //
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////
//Get the value of the X Min Limit interrupt
char Test_Min(int axis){
   return (Limit[axis].Limit_Min & 0x01)? 1:0;
}

///////////////////////////////////////////////////////////
//             LIMIT BITS / set / RESET / ^ / ~          //
///////////////////////////////////////////////////////////

void Reset_Min_Limit(int axis){
   Limit[axis].Limit_Min = false;//INV ^ Limit[axis].Limit_Min;
}

void XOR_Min_Limit(int axis){
   Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
}

void Invert_Min_Limit(int axis){
   Limit[axis].Limit_Min = (~Limit[axis].Limit_Min) & 0x01;
}

void Set_Min_Limit(int axis){
//if the pin is pulled low
  if(!Limit[axis].Limit_Min)
     Limit[axis].Limit_Min = true;
}

/////////////////////////////////////////////////////////
//         SAMPLE AND DEBOUNCE THE LIMITS (Timer1 ISR) //
/////////////////////////////////////////////////////////

static volatile char limit_event;

// A pressed (low) limit latches after LIMIT_TRIP_COUNT samples and releases
// after DEBOUNCE_COUNT. A new trip during motion stops the drivers here, at
// interrupt level, and leaves the alarm to the main loop.
static void Sample_Limit(int axis){
   Limit[axis].Pin = Test_Port_Pins(axis);
   if(!Limit[axis].Pin){
      Limit[axis].release_cnt = 0;
      if(Limit[axis].Limit_Min) return;
      if(++Limit[axis].trip_cnt < LIMIT_TRIP_COUNT) return;
      Limit[axis].Limit_Min = 1;
      // TODO(DDS): Grbl also trips in hold and idle; needs pull-ups on the pins first
      if(bit_istrue(settings.flags,BITFLAG_HARD_LIMIT_ENABLE) &&
         (sys.state == STATE_CYCLE || sys.state == STATE_JOG)){
         DisableSteppers();
         disableSpindleOCx();
         limit_event = 1;
      }
   }else{
      Limit[axis].trip_cnt = 0;
      if(Limit[axis].Limit_Min && ++Limit[axis].release_cnt > DEBOUNCE_COUNT){
         Limit[axis].Limit_Min = 0;
         Limit[axis].release_cnt = 0;
      }
   }
}

void Limits_Sample(){
   Sample_Limit(X);
   Sample_Limit(Y);
   Sample_Limit(Z);
}

char Limits_TakeEvent(){
   char event;
   T1IE_bit = 0;
   event = limit_event;
   limit_event = 0;
   T1IE_bit = 1;
   return event;
}


/////////////////////////////////////////////////////////
//                      Edge triggers                  //
/////////////////////////////////////////////////////////

//positive edge
char FP(int axis){
char tmp = 0;
  Limit[axis].new_val = Test_Min(axis) & 0x0001;
  if(Limit[axis].new_val > Limit[axis].old_Pval){
     tmp = 1;
  }else {
     tmp = 0;
  }
   Limit[axis].old_Pval = Limit[axis].new_val;
   return tmp;
}

//reset the trigger edge stats
void Rst_FP(int axis){
   Limit[axis].old_Pval = false;
}

//negative edge
char FN(int axis){
char tmp = 0;
   Limit[axis].new_val = Test_Min(axis) & 0x01;
   if(Limit[axis].new_val < Limit[axis].old_Fval){
      tmp = 1;
   }else
      tmp = 0;
   Limit[axis].old_Fval = Limit[axis].new_val;
   return tmp;
}

//reset the trigger edge stats
void Rst_FN(int axis){
   Limit[axis].old_Fval = true;
}

/////////////////////////////////////////////////////////
//        TEST PORT PINS FOR REAL VALUES               //
/////////////////////////////////////////////////////////

char Test_Port_Pins(int axis){
char tmp = 0;
    switch(axis){
        case X:
             tmp = X_Min_Limit & 0x0001;
             break;
        case Y:
             tmp = Y_Min_Limit & 0x0001;
             break;
        case Z:
             tmp = Z_Min_Limit & 0x0001;
             break;
        case A:
          //   tmp = A_Min_Limit & 0x0001;
             break;
        default: tmp = 255;
             break;
    }
     return tmp;
}