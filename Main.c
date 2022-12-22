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

//////////////////////////////////////////
//external scope variables
//settings_t settings;
//parser_state_t gc;
STP STPS[NoOfAxis];
bit oneShotA; sfr;
bit oneShotB; sfr;


//////////////////////////////////////////
//file scope vars
static unsigned int disable_steps;//stepper timeout

/////////////////////////////////////////
//condition externs
void Conditin_Externs(){
  PinMode();
  plan_init(15000,15000);
  disableOCx();
  DisableStepper();
  //stepper timeout counter
  disable_steps = 0;
}
/////////////////////////////////////////
//main function
void main() {
int axis_to_run,dif,status_of_gcode;
static int cntr,a;
 // fp = Test_Min;
 
  Conditin_Externs();
  cntr = a = axis_to_run = dif = status_of_gcode = 0;
  EnableInterrupts();
  
  while(1){

     Debounce_Limits(X);
     Debounce_Limits(Y);
     if(!status_of_gcode)
        axis_to_run = Get_Axisword();
     if(axis_to_run){

        //   while(DMA_Busy(1));
        //   dma_printf("axis_to_run:= %d\n",axis_to_run);
           EnableSteppers(2);
           Temp_Move(axis_to_run);
           axis_to_run = Rst_Axisword();
     }
        
     status_of_gcode = Sample_Ringbuffer();
     //temp debug for steppers
     #if StepperDebug == 1
     if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
       while(DMA_Busy(1));
       dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",(STPS[X].run_state&0xff),STPS[X].step_count,SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
      }
     #endif
     
     
      #ifdef LED_STATUS
       LED1 = TMR.clock >> 4;
      #endif
      
      #ifdef RESET_STEPPER_TIME
       if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
           disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
           
      #endif


         

     WDTCONSET = 0x01;
  }
}


int Temp_Move(int a){
    switch(a){
      case 1: //b0000 0001
             SingleAxisStep(gc.next_position[X],gc.frequency,X);
             break;
      case 2://b0000 0010
             SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
             break;
       case 3://b0000 0011
             while(DMA_Busy(1));
             dma_printf("X:= %f | Y:=%f\n",gc.next_position[X],gc.next_position[Y]);
             DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
             //while(DMA_Busy(1));
             //dma_printf("SdlyX:=%l\taccX:=%l\tdecX:=%l\n",STPS[X].StartUp_delay,STPS[X].max_step_lim,STPS[X].decel_start);
             break;
      case 4://b0000 0100
            SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
             break;
       case 5://b0000 0101
             DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
             break;
       case 6://b0000 0110
             DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
             break;
       case 8://b0000 1000
            SingleAxisStep(gc.next_position[A],gc.frequency,A);
             break;
       case 9://b0000 1001
            DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
            break;
       case 10://b0000 1010
            DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
            break;
       case 12://b0000 1100
            DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
            break;
       case 13://Homing X axis
            Home(X);
            break;
       case 14://Homing Y axis
            Home(Y);
            break;
       case 15://Homing Y axis
            r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
            break;
        default: a = 0;
              break;
    }
    
    return a;
}

/* 
 *temp disabled code to get gcode send working
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
}*/