#include "Globals.h"

//coordinates struct - easier to work when extracted from flash
//holds coord[] and coord_offset[]
volatile coord_sys coord_system[NUMBER_OF_DATUMS];

//temp buffer to save flash settings to
unsigned long volatile buffA[512]= {0} absolute 0xA0000000 ;
static int volatile ram_loaded;

void Settings_Init(short reset_all){
 if(!reset_all){
    //defaults for statuses
     sys.abort           = 0;
     sys.state           = 0;
     sys.homing          = 0;
     sys.execute         = 0;
     sys.auto_start      = 0;
 }else if(reset_all == 1){
  //defaults for settings
  settings.steps_per_mm[X] = DEFAULT_X_STEPS_PER_MM;
  settings.steps_per_mm[Y] = DEFAULT_Y_STEPS_PER_MM;
  settings.steps_per_mm[Z] = DEFAULT_Z_STEPS_PER_MM;
  settings.steps_per_mm[A]    = DEFAULT_A_STEPS_PER_MM;
  settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
  settings.default_feed_rate  = DEFAULT_FEEDRATE;
  settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
  settings.acceleration       = DEFAULT_ACCELERATION;
  settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
  settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
  settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
  settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
  settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
  settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
  settings.decimal_places = DEFAULT_DECIMAL_PLACES;
  settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;

 }
}

////////////////////////////////////////////////////////////////////
//                     FLASH CONTROL FUNCTIONS                    //
////////////////////////////////////////////////////////////////////

//Save current page to a temp buffer [ram @ #A0000000], this is to
//push original setting back after a page errase and save time
//reading flash to often, as well as save flash

static int Save_Row_From_Flash(unsigned long addr){
unsigned long i,j;
unsigned long *ptr;
int data_count;

 ptr = addr;
 data_count = 0;
 for(j = 0;j < 512;j++){
    buffA[j] = *(ptr+j);
    if(buffA[j] != -1)data_count++;
    #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("buffA[%l]:= %l\n",j,buffA[j]);
    #endif
 }
 
 //call this function and pass as an argument the
 //amount of data held in flash
 set_ram_loaded_indicator(data_count);
 
 //return the number of indices that hold data
 return data_count;
}

//sets the indicator of available data in flash "--EEPROM--"
//call this function at every write to flash,if flash fails to
//write an error indicator will will be sent 0f 1-3
//1=low volt error | 2=write failed | 3=both erros | 0=success
//if success on write a reset of this value indicating a new read of 
//the flash is needed to reload buffA / ram @ #A000000
static int set_ram_loaded_indicator(int val){
 ram_loaded = val;
 return ram_loaded;
}

//force a zeroing of ram_loaded indicator
static void zero_ram_loaded_indicator(){
 ram_loaded = 0;
}

//read the indicator to test for data
int read_ram_loaded_indicator(){
 return ram_loaded;
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
unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
float ptr;
unsigned int error = 0;
int res=0,recipe = 0;
unsigned long wdata[4]={0};
unsigned long j,i;
unsigned long add;
unsigned long temp[4] = {0};

 add = (unsigned long)FLASH_Settings_VAddr_P1;

//save the coordinate P value
 recipe = coord_select;

//Read the saved Row from flash first
 Save_Row_From_Flash(add);

//Erase the page in order to over write the values
// add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(add);

 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }

 switch(recipe){
   case 0:break;
   //P1,2,3,4,5,6,7,8,9
   case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
   //G54,55,56,57,58,59
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
   case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
   case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
   case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
   case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
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
   buffA[i] =  wdata[j];
   i++;
 }
  
 //add = (unsigned long)FLASH_Settings_VAddr_P1;
 //if result == 0 then write was sucessfull a reread of flash is needed
  res = NVMWriteRow(&add,buffA);
  set_ram_loaded_indicator(res);

  #if FlashDebug == 5
    add = (unsigned long)FLASH_Settings_VAddr_P1;
    //used todebug by printing out row to serial am going
    //to optomise this
    NVMReadQuad(add,temp);
    for(i = 0;i< 4;i++){
      if(temp[i] < 0xFFFFFFFF)  //print conversion??
        ptr = ulong2flt(temp[i]);
      else ptr = 0.00;
       while(DMA_IsOn(1));
       dma_printf("val:= %f\tbuff[%l]:= %l\n",ptr,i,temp[i]);
    }
  #endif

   return res;
}

//////////////////////////////////////////////////////
//read back the coordinate data and place into coord
//struct for processing, coordinate system is 36longs
//indexed by number of axis
void settings_read_coord_data(){
float ptr;
unsigned int error = 0;
unsigned long j,i,res;
unsigned long temp;

  //read from the buffer and place into coordinate system
  if(!read_ram_loaded_indicator()){
     unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
     Save_Row_From_Flash(add);
  }else{
    for(i = 0; i < 9; i++){
      for(j = 0 ; j < NoOfAxis; j++){
        temp = buffA[(i*NoOfAxis) + j];
        ptr = ulong2flt(temp);
        coord_system[i].coord[j] = ptr;

        #if FlashDebug == 2
         while(DMA_IsOn(1));
         dma_printf("cord[%l].[%l]:= %f\n"
         ,i,j,coord_system[i].coord[j]);
         //coord_system[(coord_select*NoOfAxis)].coord[i]);
        #endif
      }
    }
  }
}

/////////////////////////////////////////////////////////
//write 1 coordinate to flash QUAD_WORD
//1st update buffA incase of row write then write to flash
unsigned int settings_write_one_coord(int coord_select,float *coord){
float coord_data[NoOfAxis];
int recipe;
unsigned int error = 0;
unsigned long j,i,add;
unsigned long temp[NoOfAxis];

 //calculate the index of the Pnnn section of the buffA[]
 recipe = coord_select * NoOfAxis;
 
 //individually update buffA[] which is ulong in preperation for flash
  j=0;
  for(i = recipe;i< recipe+NoOfAxis;i++){
     //prepare this to pass to quad word write
      coord_data[j] = *(coord+j);
      temp[j] = flt2ulong(coord_data[j]);
      buffA[i] = temp[j];
      j++;
      #if FlashDebug == 2
       while(DMA_IsOn(1));
       dma_printf("buffA[%l]:= %l\n",i,j,buffA[i]);//coord_system[(coord_select*NoOfAxis)].coord[i]);
      #endif
  }
  
 switch(coord_select){
   //P1,2,3,4,5,6,7,8,9 [4 dbl wrd boundries]
   case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
   //G54,55,56,57,58,59
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
   case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
   case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
   case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
   case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
 }
 //write the coord to flash as a quad word, if more axis are added
 //may need to add 2 quad word writes or wait for row write???
 error =  NVMWriteQuad (add, temp);
 set_ram_loaded_indicator(error);
 
 return error;
}


//////////////////////////////////////////////////////
// Reads startup line from EEPROM. Updated pointed line string data.
int settings_read_startup_line(int n, char *line){
unsigned long *add;
char *char_add;

 switch(n){
  case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
  case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
 }
  //Save_Row_From_Flash(add);
  memcpy(line,char_add,64);

  //test return string for correctness
 #if GlobalsDebug == 10
 while(DMA_IsOn(1));
 dma_printf("%s\n",line);
 #endif
   
 return STATUS_OK;
}

//////////////////////////////////////////////////////////////////
// Method to store startup lines into EEPROM
int settings_store_startup_line(int n, char *line){
unsigned long start_offset,addA;
unsigned long i,j;
int error,str_len;
char temp_char;

  str_len = strlen(line);
  
 //test string argument for correctness
 #if GlobalsDebug == 10
   while(DMA_IsOn(1));
   dma_printf("*line:= %s\n",line);
  #endif
 
 //Virtual memory address of Row
 addA  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000

 //Ram memory address of startup lines
 switch(n){
    case 0: start_offset = (unsigned long)Line0_Offset;break; //180
    case 1: start_offset = (unsigned long)Line1_Offset;break;
 }

 //Read the saved Row from flash first place it into ram
 Save_Row_From_Flash(addA);

//Erase the page in order to over write the values
// add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(addA);
 
 //clear the words in buffA at line(n) offset
 for(i=start_offset;i<start_offset+16;i++)
    buffA[i] = 0;

 //replace the current string with new string at
 //memory offset for startup lines
 memcpy(buffA+start_offset,line,str_len);

//test buffA for correct offset
 #if GlobalsDebug == 10
 for(i=0; i < 16 ;i++){
   while(DMA_IsOn(1));
   dma_printf("buffA[%X]:= %l\n",i+start_offset,buffA[i+start_offset]);
 }
 #endif

 //write buffA back to Row3
 error = (int)NVMWriteRow(&addA,buffA);
 set_ram_loaded_indicator(error);
 
 return error;
}

////////////////////////////////////////////////////////////////////
// A helper method to set settings from command line
// ac:grbl_settings  $999 is added to save all updated to flash
int settings_store_global_setting(int parameter, float value) {
int error = 0;
  //check if flash has been changed since last read a 0 indicates
  //that flash was changed, for any other value Flash has to first
  //be read into Ram buffA inorder not to over write existing values
  //when saving back to flash memory using $=99 command
  if(!read_ram_loaded_indicator()){
     unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
     Save_Row_From_Flash(add);
  }
  
  switch(parameter) {
    case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
      if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
      //set current values
      settings.steps_per_mm[parameter] = value;
      //prepare flash values in case $=99 is sent
      buffA[SPMMX_OFFSET + parameter] = value;
      break;
    case 3:
       if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
       settings.pulse_microseconds = round(value);
       //prepare flash values in case $=99 is sent
       buffA[P_MSEC_OFFSET] = value;
       break;
    case 4: settings.default_feed_rate = value; 
       buffA[D_FEED_RATE_OFFSET] = value;
       break;
    case 5: settings.default_seek_rate = value; 
       buffA[D_SEEK_RATE_OFFSET] = value;
       break;
    case 6: settings.invert_mask = floor(value); 
       buffA[INVERT_MASK_OFFSET] = floor(value);
       break;
    case 7: settings.stepper_idle_lock_time = round(value);
       buffA[IDLE_LOCK_TMR_OFFSET] = round(value);
       break;
    case 8: // Convert to mm/min^2 for grbl internal use.
       settings.acceleration = value*60*60;
       buffA[ACCELERATION_OFFSET] = value;
       break;
    case 9: settings.junction_deviation = fabs(value); 
       buffA[JUNCTION_DEV_OFFSET] = value;
       break;
    case 10: settings.mm_per_arc_segment = value; 
       buffA[MM_ARC_SEG_OFFSET] = value;
       break;
    case 11: settings.n_arc_correction = round(value);
       buffA[N_ARC_CORREC_OFFSET] = value;
       break;
    case 12: settings.decimal_places = round(value);
       buffA[DEC_PLACES_OFFSET] = value;
       break;
    case 13:
      if (value){ 
        settings.flags |= BITFLAG_REPORT_INCHES;
        buffA[FLAGS_OFFSET] |= BITFLAG_REPORT_INCHES;
      }else{
        settings.flags &= ~BITFLAG_REPORT_INCHES;
        buffA[FLAGS_OFFSET] &= ~BITFLAG_REPORT_INCHES;
      }
      break;
    case 14: // Reset to ensure change. Immediate re-init may cause problems.
      if (value){ 
        settings.flags |= BITFLAG_AUTO_START; 
        buffA[FLAGS_OFFSET] |= BITFLAG_AUTO_START;
      }else{ 
        settings.flags &= ~BITFLAG_AUTO_START;
        buffA[FLAGS_OFFSET] &= ~BITFLAG_AUTO_START;
      }
      break;
    case 15: // Reset to ensure change. Immediate re-init may cause problems.
      if (value){ 
         settings.flags |= BITFLAG_INVERT_ST_ENABLE;
         buffA[FLAGS_OFFSET] |= BITFLAG_INVERT_ST_ENABLE;
      }else{
         settings.flags &= ~BITFLAG_INVERT_ST_ENABLE; 
         buffA[FLAGS_OFFSET] &= ~BITFLAG_INVERT_ST_ENABLE;
      }
      break;
    case 16:
      if (value){
         settings.flags |= BITFLAG_HARD_LIMIT_ENABLE; 
         buffA[FLAGS_OFFSET] |= BITFLAG_INVERT_ST_ENABLE;
      }else{ 
         settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
         buffA[FLAGS_OFFSET] &= ~BITFLAG_INVERT_ST_ENABLE;
      }
     // limits_init(); // Re-init to immediately change. NOTE: Nice to have but could be problematic later.
      break;
    case 17:
      if (value){ 
        settings.flags |= BITFLAG_HOMING_ENABLE; 
        buffA[FLAGS_OFFSET] |= BITFLAG_HOMING_ENABLE;
      }else{
        settings.flags &= ~BITFLAG_HOMING_ENABLE;
        buffA[FLAGS_OFFSET] &= ~BITFLAG_HOMING_ENABLE;
      }
      break;
    case 18: settings.homing_dir_mask = floor(value); 
             buffA[HOME_DIR_MASK_OFFSET] = floor(value);
      break;
    case 19: settings.homing_feed_rate = value; 
             buffA[H_FEED_RATE_OFFSET] = value;
      break;
    case 20: settings.homing_seek_rate = value; 
             buffA[D_SEEK_RATE_OFFSET] = value;
      break;
    case 21: settings.homing_debounce_delay = round(value); 
             buffA[H_DEBNC_DLY_OFFSET] = round(value);
      break;
    case 22: settings.homing_pulloff = value; 
             buffA[H_PULL_OFF_OFFSET] = value;
      break;
    case 99://write buffC back to Row3
       error = 1;
       if(error){
            unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
            error = set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
            if(!error){ 
               //reread the flash once it has been changed
                Save_Row_From_Flash(add);
             }
       }
       break;
    default:
      return(STATUS_INVALID_STATEMENT);
  }
  return(STATUS_OK);
}