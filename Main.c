/*
* Check on CalcStep in Kinematics for redundant quadrant checking
*
*
*/



#include "Config.h"

//settings_t settings;
parser_state_t gc;
STP STPS[NoOfAxis];

char DMA_Buff[200];
char txt_[9];
char spc[] = " : ";
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
             LED1 = TMR.clock >> 4;
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
            a = 0;
            LED1 = 0;
            Toggle = 1;
            disable_steps = 0;
            EnStepperX();
            EnStepperY();
            EnStepperZ();
            EnStepperA();
            cntr = 0;
         }
         //X Y Z
         if(Toggle){
         cntr++;
           if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
               Temp_Move(a);
               a++;
               if(a > 8)a=0;
            //Change the value of DMADebug in the DEFINE.pld
            //file found in the Project Level Define folder
            #if DMADebug == 1
              dma_printf("a:=%d:%l:%d:abs:=%l:%l:%d:abs:=%l \r\n",
                         a,STPS[X].step_count,sys.axis_dir[X],
                         sys.steps_position[X],STPS[Y].step_count,
                         sys.axis_dir[Y],sys.steps_position[Y]);
            #endif
           }
            if(cntr > 10000){
            #if DMADebug == 2
             dma_printf("a:=%d \r\n",sys.steps_position[X]);

            #elif DMADebug == 3
              dma_printf("a:=%d:%l:%d:abs:=%l:%l:%d:abs:=%l \r\n",
                         a,STPS[X].step_count,sys.axis_dir[X],
                         sys.steps_position[X],STPS[Y].step_count,
                         sys.axis_dir[Y],sys.steps_position[Y]);
            #endif
              cntr = 0;
            }
         }
         
        Debounce_X_Limits();
        Debounce_Y_Limits();
  }
}

//Temp code for trsting
void Temp_Move(int a){

    switch(a){
      case 0:
                 STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
                 SingleAxisStep(STPS[X].mmToTravel,X);
             break;
      case 2:
                 STPS[X].mmToTravel = belt_steps(50.00);
                 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
                 SingleAxisStep(STPS[X].mmToTravel,X);
              break;
       case 1:
                 STPS[Y].mmToTravel = belt_steps(50.00);
                 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
                 SingleAxisStep(STPS[Y].mmToTravel,Y);
              break;
       case 3:
                 STPS[Y].mmToTravel = belt_steps(-50.00);
                 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
                 SingleAxisStep(STPS[Y].mmToTravel,Y);
              break;
       case 4:
                 STPS[X].mmToTravel = belt_steps(-50.00);
                // speed_cntr_Move(STPS[X].mmToTravel, 75000,X);
                 STPS[Y].mmToTravel = belt_steps(100.00);
                 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 5:
                 STPS[X].mmToTravel = belt_steps(50.00);
                 //speed_cntr_Move(STPS[X].mmToTravel, 75000,X);
                 STPS[Y].mmToTravel = belt_steps(-100.00);
                 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 6:
                 STPS[X].mmToTravel = belt_steps(-150.00);
                 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
                 STPS[Y].mmToTravel = belt_steps(100.00);
               //  speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 7:
                 STPS[X].mmToTravel = belt_steps(150.00);
                 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
                 STPS[Y].mmToTravel = belt_steps(-100.00);
                // speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
       case 8:
                 STPS[A].mmToTravel = belt_steps(150.00);
                 speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
                 SingleAxisStep(STPS[A].mmToTravel,A);
             break;
       case 9:
                //r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,
                //         double Fin_axis_b,double r, double i, double j, double k,
                //         int axis_A,int axis_B)
                 r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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