#include "Globals.h"

//coordinates saved to flash - easier to work
//with a array
coord_sys coord_system[NUMBER_OF_DATUMS];

//temp buffer to save flash settings to
unsigned long volatile buff[128]= {0} absolute 0xA0000000 ;


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


///////////////////////////////////////////////////////////////////
//here we want to write the new recipe to flash and set the coordinate
unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
float ptr;
unsigned int error = 0;
int res=0,recipe = 0;
unsigned long wdata[4]={0};
unsigned long j,i;
unsigned long add;

 add = (unsigned long)FLASH_Settings_VAddr_P1;

//save the coordinate P value
 recipe = coord_select;

//Read the saved Row from flash first
 Save_Row_From_Flash(add);

//Erase the page in order to over write the values
// add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(add);

// Flash_Erase_Page(add);
 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }

 switch(recipe){
   case 0:break;
   case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
 }

   j = i = 0;
  for (i=0;i<3;i++){
    wdata[i] = flt2ulong(coord[i]);
   #if FlashDebug == 1
    while(DMA_IsOn(1));
    dma_printf("%f\t%l\n",coord[i],wdata[i]);
   #endif
    //in order to write single word change the addresses from0x10 incraments
    //to 0x4 incraments
    //res = NVMWriteWord(add+i*4,wdata[i]);
  }
 
  i = (recipe-1)*4 ; //place the new data into the correct position
  //put the new data into the relevant slot e.g. P1,2,3,4...
  for(j = 0;j<4;j++){
     buff[i] =  wdata[j];
     i++;
  }
  
  //Write 4 double words at once
  //res = NVMWriteQuad(&add,wdata);
 // add = (unsigned long)FLASH_Settings_VAddr_P1;
  res = NVMWriteRow(&add,buff);
  //Flash_Write_Row(add,buff);
  #if FlashDebug == 1
    add = (unsigned long)FLASH_Settings_VAddr_P1;
    NVMReadRow(add);
  #endif

   return res;
}


/////////////////////////////////////////////////////
//Save current page to a temp buffer, this is to
//push original setting back after a page errase
int Save_Row_From_Flash(unsigned long addr){
unsigned long i,j,data_count;
unsigned long *ptr;
 ptr = addr;
 data_count = 0;
 for(j = 0;j < 128;j++){
    buff[j] = *(ptr+j);
    if(buff[j] != -1)data_count++;
    #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("buff[%l]:= %l\n",j,buff[j]);
    #endif
 }
 //return the number of indices that hold data
 return data_count;
}