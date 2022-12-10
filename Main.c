/*******************************************************************************
* This firmware is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
* This is a stepper interpolator / gcode interp interpreter, which is based on
* multiple documents 1st is ACC DEC  ac:AVR_Stepper_Acc_Dec to impliment the
* motion, the interpolation is based on Bresenhams algo and the Circular is at
* present using ac:grbl implimentation "thank you for this @K. Jeon & 
* @Simen Svale Skogsrud.
* The micro used is a pic32mz2048efh  ac:pic32mz , the 6 axis motion uses 6 of
* the Output compare modules  ac:OUTPUT_COMPARE and no "for or while" loops
* blocking during interpolation.
*
*for limits the external interrupts  [ ac:Interrupts ] for origins x y z &
* a b c* will most likely get polled without interrupts??
*
* Communication is Serial using the  ac:DMA_Pic32 DMA0 and DMA1 and is setup to
* transfer and recieve to two seperate buffers.
*
* The development platform used for this application is MikroC Pro for pic32
* using the Clicker2 for mz ac:Clicker2_Dwg :  ac:Clicker2_Pinouts , however
* code can easily be modified for any C compiler Ide.
* The intention is to move this on the the new Necto Studio which is now open
* source.
*******************************************************************************/



#include "Config.h"

//settings_t settings;
parser_state_t gc;
STP STPS[NoOfAxis];

static unsigned int disable_steps;
char DMA_Buff[200];
char txt_[9];
bit testISR;
bit oneShotA; sfr;
bit oneShotB; sfr;
char uart_rd;

//////////////////////////////////////////
// temp vars
unsigned int ii;
unsigned long testOcr;
static unsigned int a;
//static unsigned int disable_steps = 0;
//char (*fp)(int);
/////////////////////////////////////////
//main function
void main() {
char txt_[9];
static char oneshot = 0;
unsigned char j;
int xyz_ = 0, i,dif;
static int cntr;
 // fp = Test_Min;
  PinMode();
  plan_init(15000,15000);
  oneShotA = 0;
  a=0;
  disableOCx();
  DisableStepper();
  //stepper timeout counter
  disable_steps = 0;
  EnableInterrupts();
  Toggle = 0;
  while(1){

     Debounce_Limits(X);
     Debounce_Limits(Y);
     Sample_Ringbuffer();
   /*  dif = Get_Difference();
     if(dif>0){
       dma_printf("\ntail:= %d : head:= %d : diff:= %d",serial.tail,serial.head,dif);
       while(DMA_Busy(1));
         Loopback();
     }*/
     
     if(!Toggle){
       LED1 = TMR.clock >> 4;

       if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
           disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);

     }
         
     if(!SW2){
       Toggle  = 0;
       disable_steps = 0;
       disableOCx();
     }

     if((!SW1)&&(!Toggle)){
        LED1 = 0;
        Toggle = 1;
        EnStepperX();
        EnStepperY();
        EnStepperZ();
        EnStepperA();
        ResetHoming();
        a = 0;
     }
     //X Y Z
     if(Toggle){

       if((a > 19)){
         if(STPS[X].homing.home_cnt >= 2){
            STPS[X].homing.home_cnt = 0;
            a = 11;
            dma_printf("\nXCnt:= %d : a:= %d",STPS[X].homing.home_cnt,a);
         }
         if(STPS[Y].homing.home_cnt >= 2){
            STPS[Y].homing.home_cnt = 0;
            a = 12;
            dma_printf("\nXCnt:= %d : a:= %d",STPS[Y].homing.home_cnt,a);
         }
        // Temp_Move(a);
       }else{
          if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
            // a = Temp_Move(a);
#if DMADebug == 1
             dma_printf("\na:= %d : Step:=\t%l mm2mve:=\t%l : Step:=\t%l",
                     a,STPS[X].dist,STPS[X].mmToTravel,
                     STPS[X].step_count);
#endif
          }
       }
     }
    // WDTCONSET = 0x01;
  }
}

int Temp_Move(int a){
    switch(a){
      case 0:
             SingleAxisStep(50.00,8000,Y);
             a = 1;
             break;
      case 1:
             SingleAxisStep(50.00,8000,X);
             a = 2;
             break;
       case 2:
             SingleAxisStep(-50.00,8000,Y);
             a = 3;
             break;
      case 3:
            SingleAxisStep(-50.00,8000,X);
            a = 4;
             break;
       case 4:
             DualAxisStep(150.00, 100.00,X,Y,8000);
             a = 5;
             break;
       case 5:
             DualAxisStep(-150.00, -100.00,X,Y,8000);
             a = 6;
             break;
       case 6:
             DualAxisStep(150.00, 30.00,X,Y,8000);
             a = 9;
             break;
       case 7:
             DualAxisStep(-150.00, -30.00,X,Y,8000);
             a = 8;
             break;
       case 8:
             SingleAxisStep(350.00,10000,A);
             a = 9;
             break;
       case 9:
            //r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,
            //         double Fin_axis_b,double r, double i, double j, double k,
            //         int axis_A,int axis_B)
            r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
            a = 12;
            break;
       case 10://Homing X axis                                                                abcdef
            Home(X);
            break;
       case 11://Homing Y axis
            Home(Y);
            break;
       case 12://Homing Y axis

            break;
        default: a = 0;
              break;
    }
    
    return a;
}