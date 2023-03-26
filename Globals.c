#include "Globals.h"




//coordinates struct - easier to work when extracted from flash
//holds coord[] and coord_offset[]
// coord_sys coord_system[NUMBER_OF_DATUMS];

//temp buffer to save flash settings to
unsigned long volatile buffA[512]= {0} absolute 0xA0000000 ;
static unsigned long volatile add = 0;

//conditional variables to indicate status of buffA and structs
static volatile int ram_loaded;
static volatile int  coord_read;

//loop / error variables to save on continous decaration (SSA ????)
volatile unsigned long j = 0;
volatile unsigned long i = 0;
volatile unsigned int error = 0;


////////////////////////////////////////////////////////////////////////////////
//Initializes all settings and restores defaults if needed
void settings_init(short reset_all){
unsigned long *ptr;
volatile unsigned long has_data = 0;

#ifdef PREPARE_DEFAULT_FLASH
int retry_flash_write = 0;
#endif

 //load the initial address
 add = (unsigned long)FLASH_Settings_VAddr_P1;
 //the falsh indicator address into ptr
 ptr = (unsigned long)FLASH_Settings_VAddr_FLASH_LOADED ;
    
 if(!reset_all){
    //defaults for statuses
     sys.abort           = 0;
     sys.state           = 0;
     sys.homing          = 0;
     sys.execute         = 0;
     sys.auto_start      = 0;
 }else{
   has_data = NVMReadWord(ptr);//read_row_from_flash(add);
#ifdef PREPARE_DEFAULT_FLASH
   //test flash has been loaded with some data
   #if GlobalsDebug == 2
   while(DMA_IsOn(1));
   dma_printf("has_data:= %l\n",has_data);
   #endif
#endif
   if(has_data == -1){
      //An Erase of the page has to be performed on startup prior
      //to an attempt to write flash memory with default values,
      //if the flash_loaded_indicator has a value 0x7FFFFFFF then
      //default writing will be skipped a reading of the default
      //values from flash will be executed
       error = (int)NVMErasePage(&add);
       
      //load default values into settings struct and prepare the
      //ram holding buffA with defaults for writing and reading flash
      //buffA is Converted into unsigned long via memcpy as an
      //way of keeping float memory alignment as opppsed to using
      // a union - this could be investigated to determine a
      //more efficient means of converting.
      
      settings.steps_per_mm[X]   = DEFAULT_X_STEPS_PER_MM;
      buffA[SPMMX_OFFSET]        = flt2ulong(settings.steps_per_mm[X]);
      settings.steps_per_mm[Y]   = DEFAULT_Y_STEPS_PER_MM;
      buffA[SPMMY_OFFSET]        = flt2ulong(settings.steps_per_mm[Y]);
      settings.steps_per_mm[Z]   = DEFAULT_Z_STEPS_PER_MM;
      buffA[SPMMZ_OFFSET]        = flt2ulong(settings.steps_per_mm[Z]);
      settings.steps_per_mm[A]   = DEFAULT_A_STEPS_PER_MM;
      buffA[SPMMA_OFFSET]        = flt2ulong(settings.steps_per_mm[A]);
      settings.steps_per_mm[B]   = DEFAULT_B_STEPS_PER_MM;
      buffA[SPMMZ_OFFSET]        = flt2ulong(settings.steps_per_mm[B]);
      settings.steps_per_mm[C]   = DEFAULT_C_STEPS_PER_MM;
      buffA[SPMMA_OFFSET]        = flt2ulong(settings.steps_per_mm[C]);
      
      settings.default_feed_rate = DEFAULT_FEEDRATE;
      buffA[D_FEED_RATE_OFFSET]  = flt2ulong(settings.default_feed_rate);

      settings.default_seek_rate = DEFAULT_RAPID_FEEDRATE;
      buffA[D_SEEK_RATE_OFFSET]  = flt2ulong(settings.default_seek_rate);
 
      settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
      buffA[H_FEED_RATE_OFFSET]   = flt2ulong(settings.homing_feed_rate);

      settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
      buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(settings.homing_seek_rate);
 
      settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
      buffA[H_PULL_OFF_OFFSET]    = flt2ulong(settings.homing_pulloff);

      settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
      buffA[MM_ARC_SEG_OFFSET]    =  flt2ulong(settings.mm_per_arc_segment);
      
      settings.acceleration      = DEFAULT_ACCELERATION;
      buffA[ACCELERATION_OFFSET] = flt2ulong(settings.acceleration);
      
      settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
      buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(settings.junction_deviation);
      
      //unsigned int values
      settings.n_arc_correction   = DEFAULT_N_ARC_CORRECTION;
      buffA[N_ARC_CORREC_OFFSET]  = (unsigned long)N_ARC_CORREC_OFFSET;
      
      settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
      buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)settings.stepper_idle_lock_time;
      
      settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
      buffA[H_DEBNC_DLY_OFFSET]   = (unsigned long)settings.homing_debounce_delay;

      settings.p_usec             = DEFAUT_P_USEC;
      buffA[P_USEC_OFFSET]        = (unsigned long)settings.p_usec;
      
      settings.decimal_places     = DEFAULT_DECIMAL_PLACES;
      buffA[DEC_PLACES_OFFSET]    = (unsigned int)settings.decimal_places;
      
      settings.homing_dir_mask    = DEFAULT_HOME_DIR_MASK;
      buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)settings.homing_dir_mask;

      settings.invert_mask        = DEFAULT_INVERT_MASK;
      buffA[INVERT_MASK_OFFSET]   = (unsigned long)settings.invert_mask;
      
      settings.flags  = 0;
      if (DEFAULT_REPORT_INCHES)    {settings.flags |= BITFLAG_REPORT_INCHES;}
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("settings.flags:= %d\n",settings.flags);
      #endif
      if (DEFAULT_AUTO_START)       { settings.flags |= (BITFLAG_AUTO_START);}
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("settings.flags:= %d\n",settings.flags);
      #endif
      if (DEFAULT_INVERT_ST_ENABLE) { settings.flags |= (BITFLAG_INVERT_ST_ENABLE);}
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("settings.flags:= %d\n",settings.flags);
      #endif
      if (DEFAULT_HARD_LIMIT_ENABLE){ settings.flags |= (BITFLAG_HARD_LIMIT_ENABLE);}
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("settings.flags:= %d\n",settings.flags);
      #endif
      if (DEFAULT_HOMING_ENABLE)    { settings.flags |= (BITFLAG_HOMING_ENABLE);}
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("settings.flags:= %d\n",settings.flags);
      #endif
      buffA[0x50] = ((unsigned long)settings.flags) & 0x1F;
      #if GlobalsDebug == 7
        while(DMA_IsOn(1));
        dma_printf("buffA[%X]:= %l & settings.flags:= %d\n",
                               FLAGS_OFFSET&0x50,
                               buffA[FLAGS_OFFSET],
                               settings.flags);
      #endif
  #ifdef PREPARE_DEFAULT_FLASH
  
      //set the ram loaded indicator for startup
      buffA[FLASH_LOADED_OFFSET] = 0x7FFFFFFF;
      
      //prepare has_data as returned from flash write should be 0!!!
      //this indicates no error while writing to flash
      has_data = 1;
      
      while(has_data){
      //write buffA back to Row3 on 1st powerup after loading new firmware
        has_data = (unsigned long)NVMWriteRow(&add,buffA);
        retry_flash_write++;
        #if GlobalsDebug == 2
        while(DMA_IsOn(1));
        dma_printf("has_data:= %l & retry_flash_write:= %d\n",
                               has_data,
                               retry_flash_write);
        #endif
        if(retry_flash_write > FLASH_RETRY_COUNT)break;
      }
  #endif
  
   }
   if(has_data){
      set_ram_loaded_indicator(read_row_from_flash(add));
    }

    settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
    settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
    settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
    settings.steps_per_mm[A]        = ulong2flt(buffA[SPMMA_OFFSET]); //temp disabled for now
    settings.steps_per_mm[B]        = ulong2flt(buffA[SPMMB_OFFSET]);
    settings.steps_per_mm[C]        = ulong2flt(buffA[SPMMC_OFFSET]);
    settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
    settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
    settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
    settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
    settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
    settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
    settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET]);
    settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
    settings.n_arc_correction       = (unsigned int)buffA[N_ARC_CORREC_OFFSET];
    settings.flags                  = ((unsigned int)buffA[0x50]);//FLAGS_OFFSET]);
    settings.stepper_idle_lock_time = (unsigned int)buffA[STEP_IDLE_DLY_OFFSET];// If max value 255, steppers do not disable.
    settings.microsteps             = (unsigned int)buffA[MICROSTEPS_OFFSET];
    settings.p_usec                 = (unsigned int)buffA[P_USEC_OFFSET];
    settings.decimal_places         = (unsigned int)buffA[DEC_PLACES_OFFSET];
    settings.homing_debounce_delay  = (unsigned int)buffA[H_DEBNC_DLY_OFFSET];
    settings.homing_dir_mask        = (unsigned int)buffA[HOME_DIR_MASK_OFFSET];
    settings.invert_mask            = (unsigned int)buffA[INVERT_MASK_OFFSET];
 }
 //set_ram_loaded_indicator(1);
}

////////////////////////////////////////////////////////////////////////////////
//                    FLASH STATUS INDICATOR FUNCTIONS                        //
////////////////////////////////////////////////////////////////////////////////

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

//sets / resets the coordinate data read bit, the code should
//test this bit so as not to waste time requering the flash every
//time it needs to feed back to ugs, reset this flag once flash
//has been updated
static void set_coord_data_read_indicator(int flag){
   bit_true(coord_read,flag);
}

//reset individual flags back to false
static void rst_single_coord_read_indicators(int flag){
  bit_false(coord_read,flag);
}

//reset all coord status flags back to false
static void rst_coord_read_indicator(){
  coord_read = 0;
}

//get the status of the indicator flag
int read_coord_data_indicator(){
 return coord_read;
}


////////////////////////////////////////////////////////////////////////////////
//                          FLASH CONTROL FUNCTIONS                           //
////////////////////////////////////////////////////////////////////////////////

//Save current page to a temp buffer [ram @ #A0000000], this is to
//push original setting back after a page errase and save time
//reading flash to often, as well as save flash
int read_row_from_flash(unsigned long addr){
unsigned long *ptr;
int data_count;

 ptr = addr;
 data_count = 0;
 for(j = 0;j < 512;j++){
    buffA[j] = *(ptr+j);
    if(buffA[j] != -1)data_count++;
    #if FlashDebug == 22
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

////////////////////////////////////////////////////////////////////////////////
//here we want to write the new recipe to flash and set the coordinate
unsigned int settings_write_coord_data(int coord_select,float *coord){
float ptr;
int res=0,recipe = 0;
unsigned long wdata[4]={0};
unsigned long temp[4] = {0};

 add = (unsigned long)FLASH_Settings_VAddr_P1;

//save the coordinate P value
 recipe = coord_select;

  if(!read_ram_loaded_indicator()){
   //Read the saved Row from flash first place it into ram
   set_ram_loaded_indicator(read_row_from_flash(add));

   //Erase the page in order to over write the values
   // add = (unsigned long)FLASH_Settings_VAddr_P1;
    error = (int)NVMErasePage(&add);
 }
 
 //if page erase didnt suceed return the error
 //leave indicator in its current state
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
   //G28.1, 30.1
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
 }

 j = i = 0;
 for (i=0;i<3;i++){
   wdata[i] = flt2ulong(coord[i]);
   #if FlashDebug == 1
    while(DMA_IsOn(1));
    dma_printf("%f\t%l\n",coord[i],wdata[i]);
   #endif
 }
 
 //place the new data into the correct position
 i = (recipe-1)*4 ;
 
 //put the new data into the relevant slot e.g. P1,2,3,4...
 for(j = 0;j<4;j++){
   buffA[i] =  wdata[j];
   i++;
 }
  
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


////////////////////////////////////////////////////////////////////////////////
//read back the coordinate data and place into coord
//struct for processing, coordinate system is 36longs
//indexed by number of axis
void settings_read_coord_data(){

  //read from the buffer and place into coordinate system
  if(!read_ram_loaded_indicator()){
     add = (unsigned long)FLASH_Settings_VAddr_P1;
     read_row_from_flash(add);
  }
  
  if(!read_coord_data_indicator()){
  unsigned long temp = 0UL;
  float value = 0.00;
    for(i = 0; i < 9; i++){
      for(j = 0 ; j < NoOfAxis; j++){
        temp = buffA[(i*NoOfAxis) + j];
        //if flash has no value force it to 0
        if(temp == -1)
           temp = 0UL;
        value = ulong2flt(temp);
        coord_system[i].coord[j] = value;

        #if FlashDebug == 3
         while(DMA_IsOn(1));
         dma_printf("cord[%l].[%l]:= %f\n"
         ,i,j,coord_system[i].coord[j]);
         //coord_system[(coord_select*NoOfAxis)].coord[i]);
        #endif
      }
    }
    //set if the coord_system has been read
    set_coord_data_read_indicator(COORD_READ_FLAG);
  }
}

////////////////////////////////////////////////////////////////////////////////
//write 1 coordinate to flash QUAD_WORD
//1st update buffA incase of row write then write to flash
//only use this if flash has been erased first otherwise an error
//or corrupt flash will result -- may need to get rid of this!!!
unsigned int settings_write_one_coord(int coord_select,float *coord){
float coord_data[NoOfAxis];
int recipe;
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
   //G28.1, 30.1
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
 }
 
 if(!read_ram_loaded_indicator()){
   //Read the saved Row from flash first place it into ram
   set_ram_loaded_indicator(read_row_from_flash(add));

   //Erase the page in order to over write the values
   // add = (unsigned long)FLASH_Settings_VAddr_P1;
    error = (int)NVMErasePage(&add);
 }
 
 //if page erase didnt suceed return the error leave ram
 //indicator in its current state
 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }
 
 //write the coord to flash as a quad word, if more axis are added
 //may need to add 2 quad word writes or wait for row write???
 if(!error)
     set_ram_loaded_indicator(NVMWriteQuad (&add, temp));
 
 return error;
}


//////////////////////////////////////////////////////
// Reads startup line from EEPROM. Updated pointed line string data.
int settings_read_startup_line(int n, char *line){
char *char_add;

 switch(n){
  case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
  case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
 }
  //read_row_from_flash(add);
  memcpy(line,char_add,64);

  //test return string for correctness
 #if GlobalsDebug == 10
 while(DMA_IsOn(1));
 dma_printf("%s\n",line);
 #endif
   
 return STATUS_OK;
}

////////////////////////////////////////////////////////////////////////////////
// Method to store startup lines into EEPROM
int settings_store_startup_line(int n, char *line){
unsigned long start_offset;
int  str_len;
char temp_char;

  str_len = strlen(line);
  
 //test string argument for correctness
 #if GlobalsDebug == 10
   while(DMA_IsOn(1));
   dma_printf("*line:= %s\n",line);
  #endif
 
 //Virtual memory address of Row
 add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000

 //Ram memory address of startup lines
 switch(n){
    case 0: start_offset = (unsigned long)Line0_Offset;break; //180
    case 1: start_offset = (unsigned long)Line1_Offset;break;
 }

 if(!read_ram_loaded_indicator()){
   //Read the saved Row from flash first place it into ram
   set_ram_loaded_indicator(read_row_from_flash(add));

   //Erase the page in order to over write the values
   // add = (unsigned long)FLASH_Settings_VAddr_P1;
   error = (int)NVMErasePage(&add);
 }
 
 //if page erase didnt suceed return the error
 //leave indicator in its current state
 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }
 
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

 //write buffA back to Row3 and set ram indicator to 0
 //to indicate that ram needs to be reread
 set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));

 return error;
}

////////////////////////////////////////////////////////////////////////////////
// A helper method to set settings from command line [ ac:grbl_settings ]
// $99=1 is added to save all updated to flash
int settings_store_global_setting(int parameter, float value) {
unsigned long *ptr;
volatile unsigned long has_data = 0;
int val_temp = 0;

 add = (unsigned long)FLASH_Settings_VAddr_P1;
 ptr = (unsigned long)FLASH_Settings_VAddr_FLASH_LOADED ;

 if(!read_ram_loaded_indicator()){
   //Read the saved Row from flash first place it into ram
   set_ram_loaded_indicator(read_row_from_flash(add));
 }
 
 //Erase the page in order to over write the values
 // add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(&add);
 
 //if page erase didnt suceed return the error
 //leave indicator in its current state
 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return(STATUS_INVALID_STATEMENT);
 }
 
  #if GlobalsDebug == 22
  while(DMA_IsOn(1));
  dma_printf("param:= %d & value:= %f\n",
                          parameter,
                          value);
  #endif
  

  switch(parameter) {
    case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
      if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
      //set current values
      settings.steps_per_mm[parameter] = value;
      //prepare flash values in case $=99 is sent
      buffA[SPMMX_OFFSET+parameter] = flt2ulong(value);

     //test string argument for correctness
      #if GlobalsDebug == 2
      while(DMA_IsOn(1));
      dma_printf("param:= %d & settings:= %f & buffA[%X]:= %l\n",
                          parameter,
                          settings.steps_per_mm[parameter],
                          SPMMX_OFFSET+parameter,
                          buffA[SPMMX_OFFSET+parameter]);
      #endif
      break;
    case 3:
       if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
       val_temp = round(value);
       settings.p_usec = val_temp;
       //prepare flash values in case $=99 is sent
       buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
       break;
    case 4: settings.default_feed_rate = value; 
       buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
       break;
    case 5: settings.default_seek_rate = value; 
       buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
       break;
    case 6:
       settings.invert_mask = floor(value);
       buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
       break;
    case 7: 
       val_temp = round(value);
       settings.stepper_idle_lock_time = val_temp;
       buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
       break;
    case 8: // Convert to mm/min^2 for grbl internal use.
       settings.acceleration = value*60.0*60.0;
       buffA[ACCELERATION_OFFSET] = flt2ulong(value);
       break;
    case 9: settings.junction_deviation = fabs(value); 
       buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
       break;
    case 10:
       val_temp = round(value);
       settings.mm_per_arc_segment = val_temp;
       buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
       break;
    case 11: 
       val_temp = round(value);
       settings.n_arc_correction = val_temp;
       buffA[N_ARC_CORREC_OFFSET] = (int)val_temp;
       break;
    case 12: 
       val_temp = round(value);
       settings.decimal_places = val_temp;
       buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
       break;
    case 13:
      if (round(value)){
        settings.flags |= BITFLAG_REPORT_INCHES;
      }else{
        settings.flags &= ~BITFLAG_REPORT_INCHES;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
      break;
    case 14: // Reset to ensure change. Immediate re-init may cause problems.
      if (round(value)){
        settings.flags |= BITFLAG_AUTO_START;
      }else{ 
        settings.flags &= ~BITFLAG_AUTO_START;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
      break;
    case 15: // Reset to ensure change. Immediate re-init may cause problems.
      if (round(value)){
         settings.flags |= BITFLAG_INVERT_ST_ENABLE;
      }else{
         settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
      }
      buffA[FLAGS_OFFSET] |= (unsigned long)settings.flags;
      break;
    case 16:
      if (round(value)){
         settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
      }else{ 
         settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
     // limits_init(); // Re-init to immediately change. NOTE: Nice to have but could be problematic later.
      break;
    case 17:
      if (round(value)){
        settings.flags |= BITFLAG_HOMING_ENABLE;
      }else{
        settings.flags &= ~BITFLAG_HOMING_ENABLE;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
      break;
    case 18:
         val_temp = round(value);
         settings.homing_dir_mask = val_temp;
          buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
      break;
    case 19: settings.homing_feed_rate = value; 
             buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
      break;
    case 20: settings.homing_seek_rate = value; 
             buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
      break;
    case 21:
         val_temp = round(value);
         settings.homing_debounce_delay = val_temp;
         buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
      break;
    case 22:
          val_temp = round(value);
          settings.homing_pulloff = val_temp;
          buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
      break;
    case 99://write buffC back to Row3
         val_temp = round(value);
         if(val_temp == 1){
           //set the ram loaded indicator for startup
           buffA[FLASH_LOADED_OFFSET] = 0x7FFFFFFF;
           
           //set the ram indicator back to zero if a write succeeded
           //to indicate to the next process that it has to reload
           //flash to ram, reading has no concequence on flash longevity
           //however continously writing does, use $99=1 sparingly make
           //all the changes necessary prior to using this statement
           set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
           
           #if GlobalsDebug == 22
           while(DMA_IsOn(1));
           dma_printf("ram_loaded_indicator:= %d\t%d\t%d\n",
                       read_ram_loaded_indicator(),
                       error,settings.flags);
           #endif
         }
       break;
    default:
      return(STATUS_INVALID_STATEMENT);
  }
  return(STATUS_OK);
}