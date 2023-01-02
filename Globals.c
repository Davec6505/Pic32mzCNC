#include "Globals.h"

//coordinates saved to flash - easier to work
//with a array
coord_sys coord_system[NUMBER_OF_DATUMS];



void Settings_Init(char reset_all){
 if(reset_all){
  settings.steps_per_mm[_X] = DEFAULT_X_STEPS_PER_MM;
  settings.steps_per_mm[_Y] = DEFAULT_Y_STEPS_PER_MM;
  settings.steps_per_mm[_Z] = DEFAULT_Z_STEPS_PER_MM;
  settings.steps_per_mm[_A] = DEFAULT_A_STEPS_PER_MM;
  settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
  settings.default_feed_rate  = DEFAULT_FEEDRATE;
  settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
  settings.acceleration       = DEFAULT_ACCELERATION;
  settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
  settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
  settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
  settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
  settings.homing_pulloff        = DEFAULT_HOMING_PULLOFF;
  settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
  settings.decimal_places = DEFAULT_DECIMAL_PLACES;
  settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
 }
}

////////////////////////////////////////////////////////////////////
//    G54, G55, G56, G57, G58 and G59 are datum shift G-Codes     //
////////////////////////////////////////////////////////////////////
/*** Table 1. Coordinate System  *********
P      Value        Coordinate System        G code
0      Active     n/a
1      1          G54
2      2          G55
3      3          G56
4      4          G57
5      5          G58
6      6          G59
7      7          G59.1
8      8          G59.2
9      9          G59.3
*****************************************/
/*************************G Recipes **********************************
 *Gnnn:= The X and Y values represent the distance from the machine home
 *to part datum XY. The Z value is the distance from the tool reference 
 *point (for example, the top of a 1-2-3 block) and the part Z-datum
 *Gnnn holds the datum’s distance in relations with the tip of the tool.
 *These work offsets are registered into the machine to hold the distance 
 *from the X, Y, Z position to part of the datum.
*******************************************************************/


///////////////////////////////////////////////////////////////////
//here we want to write the new recipe to flash and set the coordinate
int Settings_Write_Coord_Data(int coord_select,float *coord){
int res=0;
unsigned long wdata[4]={0};
unsigned long j,i,add;
 switch(coord_select){
   case 0:break;
   case 1: add = FLASH_Settings_VAddr_P1;break;
   case 2: add = FLASH_Settings_VAddr_P2;break;
   case 3: add = FLASH_Settings_VAddr_P3;break;
   case 4: add = FLASH_Settings_VAddr_P4;break;
   case 5: add = FLASH_Settings_VAddr_P5;break;
   case 6: add = FLASH_Settings_VAddr_P6;break;
   case 7: add = FLASH_Settings_VAddr_P7;break;
   case 8: add = FLASH_Settings_VAddr_P8;break;
   case 9: add = FLASH_Settings_VAddr_P9;break;
 }

 // while(DMA_IsOn(1));
 // dma_printf("%l\n",addr);
  
   j = i = 0;
  for (i=0;i<3;i++){
    wdata[i] = flt2ulong(coord[i]);
    
   // while(DMA_IsOn(1));
   // dma_printf("%f\t%l\n",coord[i],wdata[i]);

    //Flash_Write_Word(addr+i*4,wdata[i]);
    //res = NVMWriteWord(addr+i*4,wdata[i]);
  }
  res = NVMWriteQuad(&add,wdata);
  
  #if FlashDebug == 1
  add = FLASH_Settings_VAddr_P1;
  Delay_us(100);
  NVMReadRow(add);
  #endif
  // Flash_Write_Row(addr,wdata);
   return res;
}