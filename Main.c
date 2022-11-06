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

//char (*fp)(int);
/////////////////////////////////////////
//main function
void main() {
char txt_[9];
static char oneshot = 0;
unsigned char j;
static unsigned int disable_steps = 0;
int xyz_ = 0, i;
static int cntr;
 // fp = Test_Min;
  PinMode();
  StepperConstants(15000,15000);
  oneShotA = 0;
  a=0;
  disable_steps = 0;
  disableOCx();
  DisableStepper();

  EnableInterrupts();
  while(1){
     LED1 = Test_Min(X)&0x0001;
     Debounce_Limits(X);
     Debounce_Limits(Y);
     if(!Toggle){
       //LED1 = Test_Min(X)&0x0001;//TMR.clock >> 4;
       if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
           disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
       
       if(LED1 && (oneshot == 0)){
         oneshot = 1;
       }else if(!LED1 && (oneshot == 1))
          oneshot = 0;
     }
         
     if(!SW2){
       Toggle  = 0;
       disableOCx();
     }

     if((!SW1)&&(!Toggle)){
        LED1 = 0;
        Toggle = 1;
        disable_steps = 0;
        EnStepperX();
        EnStepperY();
        EnStepperZ();
        EnStepperA();
        cntr = 0;
        sys.homing = 0;
        sys.homing_cnt = 0;
        a = 0;
     }
     //X Y Z
     if(Toggle){

       if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
         Temp_Move(a);
         if(a < 9){
           a++;
           if(a == 9)a=10;
         }
        //Change the value of DMADebug in the DEFINE.pld
        //file found in the Project Level Define folder

       }


        #if DMADebug == 1
        if(!DMA_Busy(1)){
         // dma_printf("\ncount:=\t%d",sys.homing_cnt);
          dma_printf("\na:=\t%d: cnt:=\t%l: dir:=\t%d: abs:=\t%l",
                     a,STPS[X].step_count,STPS[X].axis_dir,
                     STPS[X].steps_position);
         }
                     
        #endif
        

     }

  }
}

void Temp_Move(int a){
    switch(a){
      case 0:
             STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
             break;
             STPS[Y].mmToTravel = belt_steps(50.00);
             speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
             SingleAxisStep(STPS[Y].mmToTravel,Y);
             break;
      case 2:
             STPS[X].mmToTravel = belt_steps(-50.00);
             speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
             SingleAxisStep(STPS[X].mmToTravel,X);
              break;
       case 3:
             STPS[Y].mmToTravel = belt_steps(-50.00);
             speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
             SingleAxisStep(STPS[Y].mmToTravel,Y);
              break;
       case 4:
             STPS[X].mmToTravel = belt_steps(50.00);
            // speed_cntr_Move(STPS[X].mmToTravel, 75000,X);
             STPS[Y].mmToTravel = belt_steps(100.00);
             speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
             DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 5:
             STPS[X].mmToTravel = belt_steps(-50.00);
             //speed_cntr_Move(STPS[X].mmToTravel, 75000,X);
             STPS[Y].mmToTravel = belt_steps(-100.00);
             speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
             DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 6:
             STPS[X].mmToTravel = belt_steps(150.00);
             speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
             STPS[Y].mmToTravel = belt_steps(100.00);
           //  speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
             DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 7:
             STPS[X].mmToTravel = belt_steps(-150.00);
             speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
             STPS[Y].mmToTravel = belt_steps(-100.00);
            // speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
             DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 8:
             STPS[A].mmToTravel = belt_steps(150.00);
             speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
#if DMADebug == 4
             if(!DMA_Busy(1)){
             dma_printf("mm:=%l\ndly%l\nmin_dly%l\nmax_lim%l\n"
             "acc_lim%l\ndec_val%l\ndecel_val%l\ndec_start%l\n\n",
             STPS[A].mmToTravel,STPS[A].step_delay,
             STPS[A].min_delay,STPS[A].max_step_lim,
             STPS[A].accel_lim,STPS[A].decel_val,
             STPS[A].decel_start);

#endif
             SingleAxisStep(STPS[A].mmToTravel,A);
             break;
       case 9:
            //r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,
            //         double Fin_axis_b,double r, double i, double j, double k,
            //         int axis_A,int axis_B)
            r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
            break;
       case 10://Homing X axis
            Home(X);
            if(sys.homing_cnt >= 1){
              a =11;
              sys.homing_cnt = 0;
            }
            break;
       case 11://Homing Y axis
            Home(Y);
            if(sys.homing_cnt >= 1){
               a = 12;
               sys.homing_cnt = 0;
            }
       case 12://Homing Y axis

            break;
        default: a = 0;
              break;
    }
}