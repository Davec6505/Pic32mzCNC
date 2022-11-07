//All limits will be implimented here mostly using
//interrupts to stall the motion, and homing
#include "Limits.h"

/////////////////////////////////////
//Limits variables
static struct limit Limit[NoOfAxis];

//////////////////////////////////////
//static local variables
static unsigned int last_cntX_min;
static unsigned int last_cntY_min;
static unsigned int last_cntZ_min;
static unsigned int last_cntA_min;

//////////////////////////////////////////////////////
//                LIMITS INITAILIZE                 //
//////////////////////////////////////////////////////


/////////////////////////////////////
//Configure Pins for Limits as inputs
void Limit_Initialize(){

   //set the limit ports to inputs

   X_Min_Limit_Dir = 1;
   Y_Min_Limit_Dir = 1;

   //set initial limit values
   Limit[X].Limit_Min = 0;
   Limit[Y].Limit_Min = 0;

   //keep track of 100ms pulse
   last_cntX_min = 0;
   last_cntY_min = 0;
   last_cntZ_min = 0;
   last_cntA_min = 0;

   //disable external interrupts 1 and 2
   IEC0  |= 0x21 << 8;

   
   X_Min_Limit_Setup();
   Y_Min_Limit_Setup();

}

////////////////////////////////////////////////////////
//X_Limit SETUP
void X_Min_Limit_Setup(){
//IFS0<8>
//IEC0<8>
//IPC2<4:2>
//IPC2<1:0>

 //Set Priority level to 4 & sub 1
 IPC2 |= 17 ;
 
 // enable INT0
 IEC0 |= 1 << 8;
 // clear the interrupt flag
 IFS0 |= ~(1 << 8);
}

////////////////////////////////////////////////////////
//Y_Limit SETUP
void Y_Min_Limit_Setup(){
//IFS0<13>
//IEC0<13>
//IPC3<12:10>
//IPC3<9:8>

 //Set Priority level to 3 & sub 2
 IPC3 |= 18 << 8;

 // enable INT0
 IEC0 |= 1 << 13;
 // clear the interrupt flag
 IFS0 |= ~(1 << 13);
}

/////////////////////////////////////////////////////////////
//                        LIMITS IRQ'S                     //
/////////////////////////////////////////////////////////////

//X Min Limit interrupt
void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_AUTO {
   INT1IF_bit = 0;
   if(!Limit[X].Limit_Min)
        Limit[X].Limit_Min = 1;
        
}

///////////////////////////////////////////////////////////
//Y Min Limit interrupt
void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_AUTO {
   INT2IF_bit = 0;
   if(!Limit[Y].Limit_Min)
      Limit[Y].Limit_Min = 1;
        
}


///////////////////////////////////////////////////////////
//                LIMIT BITS SAMPLING                    //
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////
//Get the value of the X Min Limit interrupt


char Test_Min(int axis){
   return (Limit[axis].Limit_Min & 0x0001)? 1:0;
}

///////////////////////////////////////////////////////////
//                  LIMIT BITS RESET                     //
///////////////////////////////////////////////////////////

void Reset_Min_Limit(int axis){
   Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
}


/////////////////////////////////////////////////////////
//         Debounce the resetting Limits               //
/////////////////////////////////////////////////////////
void Reset_Min_Debounce(int axis){
  Limit[axis].Min_DeBnc = 0;
  Limit[axis].last_cnt_min = 0;
}


////////////////////////////////////////////////////////
//
void Debounce_Limits(int axis){
   Limit[axis].T0 = (TMR.clock >> BASE_TMR)&1;
  // Limit[axis].T1 = Limit[axis].Limit_Min;
   
   Limit[axis].Pin = Test_Port_Pins(axis);
   
   if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
      if(!Limit[axis].T0 && !Limit[axis].T2){
         Limit[axis].T2 = 1;
         Limit[axis].Min_DeBnc++;
      #if DMADebug == 10
          dma_printf("\nLimit[%d]:=%d\r\n",axis,Limit[axis].Min_DeBnc);
      #endif
        if(Limit[axis].Min_DeBnc > Limit[axis].last_cnt_min){
           Limit[axis].last_cnt_min = Limit[axis].Min_DeBnc;
        }
      }else if(Limit[axis].T0 && Limit[axis].T2)
         Limit[axis].T2 = 0;

      if(Limit[axis].Min_DeBnc > DEBOUNCE_COUNT)
          Reset_Min_Limit(axis);

   }else if(Limit[axis].Pin){
         Reset_Min_Debounce(axis);
   }

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

//negative edge
char FN(int axis){
char tmp = 0;
   Limit[axis].new_val = Test_Min(axis) & 0x0001;
   if(Limit[axis].new_val < Limit[axis].old_Fval){
      tmp = 1;
   }else
      tmp = 0;
   Limit[axis].old_Fval = Limit[axis].new_val;
   return tmp;
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
            // tmp = Z_Min_Limit & 0x0001;
             break;
        case A:
          //   tmp = A_Min_Limit & 0x0001;
             break;
        default: tmp = 255;
             break;
    }
     return tmp;
}