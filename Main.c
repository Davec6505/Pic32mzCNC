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
*
* Using Flash memory to store data instead of Eprom  ac:Flash_Prgm &  ac:Flasg_gen
*******************************************************************************/



#include "Config.h"


//////////////////////////////////////////
//external scope variables
//settings_t settings;
//parser_state_t gc;
system_t sys;
STP STPS[NoOfAxis];
settings_t settings;
bit oneShotA; sfr;
bit oneShotB; sfr;
const unsigned long  Addre = 0xBD030000;
unsigned long *ptr;
unsigned long data_;
unsigned long rowbuff[128]={0};
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
int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
static int cntr = 0,a = 0;

 // fp = Test_Min;
 
  Conditin_Externs();
  cntr = a = axis_to_run = dif = status_of_gcode = 0;
  EnableInterrupts();
  
  while(1){
     //continously test the limits
     Debounce_Limits(X);
     Debounce_Limits(Y);
     
     //continously check the communication channel
    if(!status_of_gcode){
      //get the modal_group
      modal_group = Get_modalgroup();
       switch(modal_group){
          case 0:break;
          case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
               modal_action = Non_Modal_Actions(Get_modalword());
               modal_group = Rst_modalgroup();
               break;
          case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
              axis_to_run = Get_Axisword();
              if(axis_to_run){
                EnableSteppers(2);
                Temp_Move(axis_to_run);
                axis_to_run = Rst_Axisword();
              }
               break;
          case 8://MODAL_GROUP_2  [G17,G18,G19] Plane selection
               break;
          case 16://MODAL_GROUP_3 [G90,G91] Distance mode
               break;
          case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
               break;
          case 64://MODAL_GROUP_5 [G93,G94] Feed rate mode
               break;
          case 128://MODAL_GROUP_6 [G20,G21] Units
               break;
          case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
               break;
          case 512://MODAL_GROUP_12 [G54,G55,G56,G57,G58,G59] Coordinate system selection
               break;
       }
     }
     status_of_gcode = Sample_Ringbuffer();
     
      //code execution confirmation led on clicker2 board
      #ifdef LED_STATUS
       LED1 = TMR.clock >> 4;
      #endif
      
      //disable the steppers after a long idle state, switch off in "Settings.h"
      #ifdef RESET_STEPPER_TIME
       if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
           disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
           
      #endif


     //temp debug for steppers
     #if StepperDebug == 1
     if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
       while(DMA_IsOn(1));
       dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
                 (STPS[X].run_state&0xff),STPS[X].step_count,
                  SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
      }
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
             while(DMA_IsOn(1));
             dma_printf("X:= %f | Y:=%f\n",gc.next_position[X],gc.next_position[Y]);
             DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
             //while(DMA_IsOn(1));
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

int Non_Modal_Actions(int action){
//[b0=10ms | b1=100ms | b2 = 300ms | b4=500ms | b5 = 1sec]
int dly_time,i,result;
float test;
unsigned long test_flash,*addr;
   switch(action){
     case 2:
           i = 0;
           //G04 [P/S] PAUSE MACHINE INSTRUCTION
           if(gc.S > 0){ //wait in seconds
             dly_time = gc.S * 1000;
             while(i < dly_time){
              LED2 = TMR.clock >> 1;
              Delay_ms(1);
              i++;
             }
           }else if(gc.P > 0){ //wait in msec
             dly_time = (unsigned long)gc.P;
             while(i < dly_time){
              LED2 = TMR.clock >> 1;
              Delay_ms(1);
              i++;
             }
           }
           LED2 = false;
          break;
     case 4: 
          /******************************************************************
           *! L1 sets the offsets of the specified tool relative to the head
           *  reference point to the specified values.
           *! L2 sets the current workplace coordinate offsets to the specified
           *  values.
           *! L20 adjusts the current workplace coordinate offsets so
           *  that the current tool head position has the specified coordinates.
           ******************************************************************/
          //G10 setting of offsets 
          //[G10 L1 P2 X17.8 Y-19.3 Z0.0]
          //[G10 P1 R140 S205]
          //P index is EEPROM coordinate data indexing / recipe.
          if(gc.L != 2 && gc.L != 20)
             return -1;
          if (gc.L == 20) {

              //addr = FLASH_Settings_VAddr;
              //NVMErasePage(addr);
              //NVMWriteRow(addr,0);
              //ptr = (unsigned long*)Addre;
              //Flash_Write_Row(Addre,rowbuff);
              result = Settings_Write_Coord_Data(Addre,gc.P,gc.next_position );
              while(DMA_IsOn(1));
              dma_printf("res:= %d\n",result);
              //test_flash = flt2ulong(gc.next_position[0]);
              //Flash_Erase_Page(Addre);            // erase page           // erase page
              //Flash_Write_Word(Addre,test_flash); // write one word
              ptr = Addre;
              test_flash = *ptr;//ReadFlashWord(Addre);//NVMRead(Addre);//
              test = ulong2flt(test_flash);
              while(DMA_IsOn(1));
              dma_printf("ptr:= $l\ttest_flash:= %l\ttest:= %f\n",ptr,test_flash,test);
             // Update system coordinate system if currently active.
            // if (gc.coord_select == int_value) { memcpy(gc.coord_system,gc.position,sizeof(gc.position)); }
          } else {
           /* float coord_data[N_AXIS];
            if (!settings_read_coord_data(int_value,coord_data)) { return(STATUS_SETTING_READ_FAIL); }
            // Update axes defined only in block. Always in machine coordinates. Can change non-active system.
            uint8_t i;
            for (i=0; i<N_AXIS; i++) { // Axes indices are consistent, so loop may be used.
              if ( bit_istrue(axis_words,bit(i)) ) { coord_data[i] = target[i]; }
            }
            settings_write_coord_data(int_value,coord_data);
            // Update system coordinate system if currently active.
            if (gc.coord_select == int_value) { memcpy(gc.coord_system,coord_data,sizeof(coord_data)); } */
          }

          break;
     case 8:
          break;
     case 16:
          break;
     case 32:
          break;
     case 64:
          break;
     case 128:
          break;
     case 256:
          break;
     case 512:
          break;
     default: action = -1; //error in action msg ???
          break;
   }
  return action;
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