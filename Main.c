/*
* Check on CalcStep in Kinematics for redundant quadrant checking
*
*
*/



#include "Config.h"

//settings_t settings;
parser_state_t gc;
STP STPS[NoOfAxis];

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
int xyz_ = 0;
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
            //   sprintf(txBuf,"%d",disable_steps);
            //   CHEN_DCH1CON_bit = 1;
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
            sys.steps_position[X] = 0;
         }
         //X Y Z
         if(Toggle){
           if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
               sprintf(txt_,"%d",a);
               UART2_Write_Text("a:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",STPS[X].step_count);
               UART2_Write_Text(" | step_count[X]:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",sys.axis_dir[X]);
               UART2_Write_Text(" | axis_dir[X]:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",sys.steps_position[X]);
               UART2_Write_Text(" | absX:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",STPS[Y].step_count);
               UART2_Write_Text(" | step_count[Y]:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",sys.axis_dir[Y]);
               UART2_Write_Text(" | axis_dir[Y]:= ");
               UART2_Write_Text(txt_);
               sprintf(txt_,"%d",sys.steps_position[Y]);
               UART2_Write_Text(" | absY:= ");
               UART2_Write_Text(txt_);
               UART2_Write(0x0D);
               
               Temp_Move(a);
               a++;
               if(a > 8)a=0;
           }
         }
            
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
                //r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k)
                 r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,1.0, 0.00);
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