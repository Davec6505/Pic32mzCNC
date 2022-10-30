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
//struct Timer TMR;
unsigned char LCD_01_ADDRESS = 0x4E;//7E; //PCF8574T
//////////////////////////////////////////
// temp vars
unsigned int ii;
unsigned long testOcr;
static unsigned int a;


/////////////////////////////////////////
//main function
void main() {
char txt_[9];
static char oneshot = 0;
unsigned char j;
static unsigned int disable_steps = 0;
int xyz_ = 0, i;
static int cntr;
  PinMode();

  StepperConstants(15000,15000);
  oneShotA = 0;
  //I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
  a=0;
  disable_steps = 0;
  disableOCx();
  DisableStepper();

  EnableInterrupts();
  while(1){

         if(!Toggle){
             LED1 = Limits.X_Limit_Min;//= TMR.clock >> 4;
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
            sys.homing = 1;
            sys.homing_cnt = 0;
            a = 10;
         }
         //X Y Z
         if(Toggle){

           if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
               Temp_Move(a);
               a++;
               if(a > 12)a=10;
            //Change the value of DMADebug in the DEFINE.pld
            //file found in the Project Level Define folder

           }
           if((Limits.X_Limit_Min)&&(sys.homing == 1)){
               sys.homing == -1;
               StopX();
               Delay_ms(200);
           }
           
#if DMADebug > 0
            cntr++;
            if(cntr > 10000){
            #if DMADebug == 1
              dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
                         a,STPS[X].step_count,STPS[X].axis_dir,
                         STPS[X].steps_position);
            #endif
            #if DMADebug == 2
             dma_printf("a:=%d \r\n",sys.steps_position[X]);

            #elif DMADebug == 3
              dma_printf("a:=%d:%l:%d:abs:=%l:%l:%d:abs:=%l \r\n",
                         a,STPS[X].step_count,STPS[X].axis_dir,
                         STPS[X].steps_position,STPS[Y].step_count,
                         STPS[Y].axis_dir,STPS[Y].steps_position);
            #endif
              cntr = 0;
            }
#endif
         }
         
        Debounce_X_Limits();
        Debounce_Y_Limits();
  }
}

//Temp code for trsting
void Temp_Move(int a){

    switch(a){
      case 0:
                 STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
                 SingleAxisStep(STPS[X].mmToTravel,X);
             break;
       case 1:
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
                 dma_printf("mm:=%l\ndly%l\nmin_dly%l\nmax_lim%l\n"
                 "acc_lim%l\ndec_val%l\ndecel_val%l\ndec_start%l\n\r\n",
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
                Home_Axis(-300.00,500,X);
            break;
       case 11://Homing Y axis
                Inv_Home_Axis(10.00,100,X);
                Delay_ms(1000);
                sys.homing = 1;
            break;
       case 12://Homing Y axis

            break;
        default: a = 0;
              break;
    }
}

void LCD_Display(){


     //line 1
     // Find out after how many Steps before we must start deceleration.
     sprintf(txt,"%d",STPS[0].accel_lim);
     I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
     // Find step to start decleration.
     sprintf(txt,"%d",STPS[0].decel_start);
     I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);

     //Line 2
     // Set accelration/speed/deccelration  by  step delay .
     sprintf(txt,"%d",STPS[0].step_delay);
     I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
     // Set max speed limit, by calc min_delay to use in timer.
     sprintf(txt,"%d",STPS[0].min_delay);
     I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);

     //Line 3
     // Find out after how many steps does the speed hit the max speed limit.
     sprintf(txt,"%d",STPS[0].max_step_lim);
     I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
     // decelrate  value start
     sprintf(txt,"%d",STPS[0].decel_val);
     I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
}