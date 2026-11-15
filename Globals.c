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


static void settings_load_row();
static void settings_blank_row();
static int  settings_save_row();
static void settings_default_row();
static void settings_apply_row();
static int  set_ram_loaded_indicator(int val);
static void zero_ram_loaded_indicator();
static void rst_single_coord_read_indicators(int flag);
static void rst_coord_read_indicator();
//ramp constants depend on steps_per_mm (Planner.c)
void set_calculation_constants();

////////////////////////////////////////////////////////////////////////////////
//Initializes all settings and restores defaults if needed
//reset_all = 0 resets runtime status, 1 loads the settings row from flash
void settings_init(short reset_all){
unsigned long marker;
 if(!reset_all){
     sys.abort           = 0;
     sys.state           = 0;
     sys.homing          = 0;
     sys.execute         = 0;
     sys.auto_start      = 0;
     return;
 }

 add = (unsigned long)FLASH_Settings_VAddr_FLASH_LOADED;
 marker = NVMReadWord((void*)add);
 #if GlobalsDebug == 2
 while(DMA_IsOn(1));
 dma_printf("marker:= %l\n",marker);
 #endif
 //blank flash, an old layout or garbage: as the original code did, hold the
 //defaults in RAM only. Flash is never erased/written during startup, the
 //first $n=, $RST, G10 or G28.1/G30.1 writes the whole row with the marker.
 if(marker != SETTINGS_VALID_MARKER){
    settings_blank_row();
    settings_default_row();
 }

 settings_load_row();
 settings_apply_row();
}

////////////////////////////////////////////////////////////////////////////////
//empty buffA (all erased) and zero the coordinate recipes and startup lines,
//marks buffA as loaded so it is not overwritten by a flash read
static void settings_blank_row(){
int k;
  for(k = 0; k < 512; k++)
     buffA[k] = 0xFFFFFFFF;
  for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
     buffA[k] = 0;
  for(k = Line0_Offset; k < (Line1_Offset+16); k++)
     buffA[k] = 0;
  set_ram_loaded_indicator(1);
  rst_coord_read_indicator();
}

////////////////////////////////////////////////////////////////////////////////
//put the default settings into buffA (coordinates and startup lines untouched)
static void settings_default_row(){
unsigned long flags = 0;

  buffA[SPMMX_OFFSET]         = flt2ulong(DEFAULT_X_STEPS_PER_MM);
  buffA[SPMMY_OFFSET]         = flt2ulong(DEFAULT_Y_STEPS_PER_MM);
  buffA[SPMMZ_OFFSET]         = flt2ulong(DEFAULT_Z_STEPS_PER_MM);
  buffA[SPMMA_OFFSET]         = flt2ulong(DEFAULT_A_STEPS_PER_MM);
  buffA[SPMMB_OFFSET]         = flt2ulong(DEFAULT_B_STEPS_PER_MM);
  buffA[SPMMC_OFFSET]         = flt2ulong(DEFAULT_C_STEPS_PER_MM);
  buffA[P_USEC_OFFSET]        = (unsigned long)DEFAUT_P_USEC;
  buffA[D_FEED_RATE_OFFSET]   = flt2ulong(DEFAULT_FEEDRATE);
  buffA[D_SEEK_RATE_OFFSET]   = flt2ulong(DEFAULT_RAPID_FEEDRATE);
  buffA[H_FEED_RATE_OFFSET]   = flt2ulong(DEFAULT_HOMING_FEEDRATE);
  buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(DEFAULT_HOMING_RAPID_FEEDRATE);
  buffA[H_PULL_OFF_OFFSET]    = flt2ulong(DEFAULT_HOMING_PULLOFF);
  buffA[MM_ARC_SEG_OFFSET]    = flt2ulong(DEFAULT_MM_PER_ARC_SEGMENT);
  //flash holds mm/sec^2 (as $8= does), settings_apply_row() converts to mm/min^2
  buffA[ACCELERATION_OFFSET]  = flt2ulong(acceleraton);
  buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(DEFAULT_JUNCTION_DEVIATION);
  buffA[N_ARC_CORREC_OFFSET]  = (unsigned long)DEFAULT_N_ARC_CORRECTION;
  buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)DEFAULT_STEPPER_IDLE_LOCK_TIME;
  buffA[H_DEBNC_DLY_OFFSET]   = (unsigned long)DEFAULT_HOMING_DEBOUNCE_DELAY;
  buffA[MICROSTEPS_OFFSET]    = (unsigned long)M_STEP;
  buffA[DEC_PLACES_OFFSET]    = (unsigned long)DEFAULT_DECIMAL_PLACES;
  buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)DEFAULT_HOME_DIR_MASK;
  buffA[INVERT_MASK_OFFSET]   = (unsigned long)DEFAULT_INVERT_MASK;
  buffA[DIR_INVERT_MASK_OFFSET] = (unsigned long)DEFAULT_DIR_INVERT_MASK;

  if (DEFAULT_REPORT_INCHES)    { flags |= BITFLAG_REPORT_INCHES; }
  if (DEFAULT_AUTO_START)       { flags |= BITFLAG_AUTO_START; }
  if (DEFAULT_INVERT_ST_ENABLE) { flags |= BITFLAG_INVERT_ST_ENABLE; }
  if (DEFAULT_HARD_LIMIT_ENABLE){ flags |= BITFLAG_HARD_LIMIT_ENABLE; }
  if (DEFAULT_HOMING_ENABLE)    { flags |= BITFLAG_HOMING_ENABLE; }
  if (DEFAULT_INVERT_LIMIT_PINS){ flags |= BITFLAG_INVERT_LIMIT_PINS; }
  buffA[FLAGS_OFFSET] = flags;
}

////////////////////////////////////////////////////////////////////////////////
//copy the settings held in buffA into the settings struct
static void settings_apply_row(){
  //one line per axis: mikroC mis-compiles ulong2flt(buffA[SPMMX_OFFSET+k]) in a
  //loop (it dereferences the loaded value as an address -> bus error at boot)
  settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
  settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
  settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
  settings.steps_per_mm[A]        = ulong2flt(buffA[SPMMA_OFFSET]);
  settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
  settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
  settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
  settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
  settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
  settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
  settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET])*sec_sec;
  settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
  settings.n_arc_correction       = (unsigned int)buffA[N_ARC_CORREC_OFFSET];
  settings.flags                  = (unsigned int)buffA[FLAGS_OFFSET];
  settings.stepper_idle_lock_time = (unsigned int)buffA[IDLE_LOCK_TMR_OFFSET];
  settings.microsteps             = (unsigned int)buffA[MICROSTEPS_OFFSET];
  settings.p_usec                 = (unsigned int)buffA[P_USEC_OFFSET];
  settings.decimal_places         = (unsigned int)buffA[DEC_PLACES_OFFSET];
  settings.homing_debounce_delay  = (unsigned int)buffA[H_DEBNC_DLY_OFFSET];
  settings.homing_dir_mask        = (unsigned int)buffA[HOME_DIR_MASK_OFFSET];
  settings.invert_mask            = (unsigned int)buffA[INVERT_MASK_OFFSET];
  settings.dir_invert_mask        = (unsigned int)buffA[DIR_INVERT_MASK_OFFSET];
}

////////////////////////////////////////////////////////////////////////////////
//$RST=$ / $RST=# / $RST=* : restore part (or all) of the settings row and save it
int settings_restore(int restore_mask){
int k;
  if(restore_mask == SETTINGS_RESTORE_ALL){
    //start from a blank row so no stale RAM ends up in flash
    for(k = 0; k < 512; k++)
       buffA[k] = 0xFFFFFFFF;
    set_ram_loaded_indicator(1);
  }else{
    settings_load_row();
  }

  if(restore_mask & SETTINGS_RESTORE_DEFAULTS)
     settings_default_row();

  if(restore_mask & SETTINGS_RESTORE_PARAMETERS){
     for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
        buffA[k] = 0;
  }

  if(restore_mask & SETTINGS_RESTORE_STARTUP_LINES){
     for(k = Line0_Offset; k < (Line1_Offset+16); k++)
        buffA[k] = 0;
  }

  k = settings_save_row();
  settings_apply_row();
  return k;
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
   bit_true(coord_read,bit(flag));
}

//reset individual flags back to false
static void rst_single_coord_read_indicators(int flag){
  bit_false(coord_read,bit(flag));
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
 *Gnnn holds the datum�s distance in relations with the tip of the tool.
 *These work offsets are registered into the machine to hold the distance 
 *from the X, Y, Z position to part of the datum.
*******************************************************************/

////////////////////////////////////////////////////////////////////////////////
// Loads the settings row into buffA once. Later edits stay in buffA (RAM)
// until settings_save_row() is called, so they are never overwritten by a re-read.
static void settings_load_row(){
  if(!read_ram_loaded_indicator()){
    add = (unsigned long)FLASH_Settings_VAddr_P1;
    read_row_from_flash(add);
    set_ram_loaded_indicator(1);
  }
}

////////////////////////////////////////////////////////////////////////////////
// The only place the settings page is erased: erase then immediately write the
// whole row back from buffA, so flash is never left erased.
static int settings_save_row(){
  //mark flash as holding valid settings so settings_init() reads them back
  buffA[FLASH_LOADED_OFFSET] = SETTINGS_VALID_MARKER;
  add = (unsigned long)FLASH_Settings_VAddr_P1;
  error = (int)NVMErasePage(&add);
  if(!error){
    error = (int)NVMWriteRow(&add,buffA);
  }
  #if FlashDebug == 1
  if(error){
    while(DMA_IsOn(1));
    dma_printf("error:= %d\n",error);
  }
  #endif
  rst_coord_read_indicator();
  return error;
}

////////////////////////////////////////////////////////////////////////////////
//here we want to write the new recipe to flash and set the coordinate
//coord_select is the 1 based recipe: P1..P9 (G54..G59.3), 10 = G28, 11 = G30
unsigned int settings_write_coord_data(int coord_select,float *coord){
int k;
  if(coord_select < 1 || coord_select > NUMBER_OF_DATUMS)
     return NVM_COORDINATE_WRITE_ERROR;

  settings_load_row();

  //put the new data into the relevant slot e.g. P1,2,3,4...
  k = (coord_select-1)*NoOfAxis;
  buffA[k]   = flt2ulong(coord[0]);
  buffA[k+1] = flt2ulong(coord[1]);
  buffA[k+2] = flt2ulong(coord[2]);
  buffA[k+3] = 0;

  return settings_save_row();
}


////////////////////////////////////////////////////////////////////////////////
//read back the coordinate data and place into coord
//struct for processing, coord_system[recipe-1] holds P1..P9, G28, G30
//indexed by number of axis
void settings_read_coord_data(){

  settings_load_row();

  if(!read_coord_data_indicator()){
  unsigned long temp = 0UL;
    for(i = 0; i < NUMBER_OF_DATUMS; i++){
      for(j = 0 ; j < NoOfAxis; j++){
        temp = buffA[(i*NoOfAxis) + j];
        //if flash has no value force it to 0
        if(temp == 0xFFFFFFFF)
           temp = 0UL;
        coord_system[i].coord[j] = ulong2flt(temp);

        #if FlashDebug == 3
         while(DMA_IsOn(1));
         dma_printf("cord[%l].[%l]:= %f\n"
         ,i,j,coord_system[i].coord[j]);
        #endif
      }
    }
    //set if the coord_system has been read
    set_coord_data_read_indicator(COORD_READ_FLAG);
  }
}

//////////////////////////////////////////////////////
// Reads startup line n from the settings row (buffA mirrors flash), into
// line[LINE_BUFFER_SIZE]. Erased or non printable bytes read as an empty line.
int settings_read_startup_line(int n, char *line){
char *src;
int k;

 switch(n){
  case 0: k = Line0_Offset; break;
  case 1: k = Line1_Offset; break;
  default: line[0] = 0; return STATUS_INVALID_STATEMENT;
 }
 settings_load_row();
 src = (char*)(buffA + k);
 for(k = 0; k < LINE_BUFFER_SIZE-1; k++){
   if(src[k] == 0) break;
   if(src[k] < 0x20 || src[k] > 0x7E){ k = 0; break; }
   line[k] = src[k];
 }
 line[k] = 0;

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
 
 //Ram memory address of startup lines
 switch(n){
    case 0: start_offset = (unsigned long)Line0_Offset;break; //180
    case 1: start_offset = (unsigned long)Line1_Offset;break;
    default: return STATUS_INVALID_STATEMENT;
 }

 settings_load_row();

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

 return settings_save_row();
}

////////////////////////////////////////////////////////////////////////////////
// A helper method to set settings from command line [ ac:grbl_settings ]
// Each accepted change is saved to flash straight away (Grbl style)
int settings_store_global_setting(int parameter, float value) {
int val_temp = 0;

 settings_load_row();
 
  #if GlobalsDebug == 22
  while(DMA_IsOn(1));
  dma_printf("param:= %d & value:= %f\n",
                          parameter,
                          value);
  #endif
  

  switch(parameter) {
    case 0: case 1: case 2: //$100..$102 steps per revolution for X, Y, Z
      if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
      settings.steps_per_mm[parameter] = value;
      buffA[SPMMX_OFFSET+parameter] = flt2ulong(value);
      //the ramp constants (alpha, a_t_x100, a_sq, spr_x_mstep) follow steps_per_mm
      set_calculation_constants();

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
       buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
       break;
    case 5: settings.default_seek_rate = value; 
       buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
       break;
    case 6:
       settings.invert_mask = floor(value);
       buffA[INVERT_MASK_OFFSET] = (unsigned long)floor(value);
       break;
    case 7: 
       val_temp = round(value);
       settings.stepper_idle_lock_time = val_temp;
       buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
       break;
    case 8: // Convert to mm/min^2 for grbl internal use.
       settings.acceleration = value*sec_sec ;
       buffA[ACCELERATION_OFFSET] = flt2ulong(value);
       break;
    case 9: settings.junction_deviation = fabs(value); 
       buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
       break;
    case 10:
       if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
       settings.mm_per_arc_segment = value;
       buffA[MM_ARC_SEG_OFFSET] = flt2ulong(value);
       break;
    case 13:
      if (round(value)){
        settings.flags |= BITFLAG_REPORT_INCHES;
      }else{
        settings.flags &= ~BITFLAG_REPORT_INCHES;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
      break;
    case 15: // Reset to ensure change. Immediate re-init may cause problems.
      if (round(value)){
         settings.flags |= BITFLAG_INVERT_ST_ENABLE;
      }else{
         settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
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
          settings.homing_pulloff = fabs(value);
          buffA[H_PULL_OFF_OFFSET] = flt2ulong(fabs(value));
      break;
    case 23: //$3 direction port invert mask, bits X..A
       val_temp = round(value);
       settings.dir_invert_mask = val_temp;
       buffA[DIR_INVERT_MASK_OFFSET] = (unsigned long)val_temp;
      break;
    case 24: //$5 invert the limit pins (active high switches)
      if (round(value)){
         settings.flags |= BITFLAG_INVERT_LIMIT_PINS;
      }else{
         settings.flags &= ~BITFLAG_INVERT_LIMIT_PINS;
      }
      buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
      break;
    default:
      return(STATUS_INVALID_STATEMENT);
  }
  if(settings_save_row()){ return(STATUS_SETTING_READ_FAIL); }
  return(STATUS_OK);
}

////////////////////////////////////////////////////////////////////////////////
// Maps Grbl 1.1 $n numbering onto the internal (0.8 style) setting indices.
// NOTE: must correlate with report_grbl_settings() in Print.c
int settings_store_grbl_setting(int parameter, float value) {
int internal;
  switch(parameter) {
    case 0:   internal = 3;  break; // step pulse usec
    case 1:   internal = 7;  break; // step idle delay
    case 2:   internal = 6;  break; // step port invert mask
    case 3:   internal = 23; break; // direction port invert mask
    case 4:   internal = 15; break; // step enable invert
    case 5:   internal = 24; break; // limit pins invert
    case 11:  internal = 9;  break; // junction deviation
    case 12:  internal = 10; break; // arc tolerance (mm per arc segment)
    case 13:  internal = 13; break; // report inches
    case 21:  internal = 16; break; // hard limits
    case 22:  internal = 17; break; // homing enable
    case 23:  internal = 18; break; // homing dir mask
    case 24:  internal = 19; break; // homing feed
    case 25:  internal = 20; break; // homing seek
    case 26:  internal = 21; break; // homing debounce
    case 27:  internal = 22; break; // homing pull-off
    case 100: case 101: case 102: internal = parameter - 100; break; // steps/mm
    case 110: case 111: case 112: internal = 5;  break; // shared max rate
    case 120: case 121: case 122: internal = 8;  break; // shared acceleration
    default:  return(STATUS_INVALID_STATEMENT);
  }
  return settings_store_global_setting(internal, value);
}