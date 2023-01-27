#include "Print.h"
#include "Settings.h"
#include "Flash_R_W.h"
#include "Nuts_Bolts.h"
#include "GCODE.h"



 void report_status_message(int status_code){
  if (status_code == 0) { // STATUS_OK
    while(DMA_IsOn(1));
    dma_printf("%s","ok\r\n");
  } else {

    switch(status_code) {
      case STATUS_BAD_NUMBER_FORMAT:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Bad number format");
           break;
      case STATUS_EXPECTED_COMMAND_LETTER:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Expected command letter");
           break;
      case STATUS_UNSUPPORTED_STATEMENT:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Unsupported statement");
            break;
      case STATUS_ARC_RADIUS_ERROR:
           while(DMA_IsOn(1));
           dma_printf("%s\n","error: Invalid radius");
           break;
      case STATUS_MODAL_GROUP_VIOLATION:
           while(DMA_IsOn(1));
           dma_printf("%s\n","error: Modal group violation");
           break;
      case STATUS_INVALID_STATEMENT:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Invalid statement");
            break;
      case STATUS_SETTING_DISABLED:
           dma_printf("%s\n","error: Setting disabled");
            break;
      case STATUS_SETTING_VALUE_NEG:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Value < 0.0");
            break;
      case STATUS_SETTING_STEP_PULSE_MIN:
           while(DMA_IsOn(1));
           dma_printf("%s\n","error: Value < 3 usec");
            break;
      case STATUS_SETTING_READ_FAIL:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: EEPROM read fail. Using defaults");
            break;
      case STATUS_IDLE_ERROR:
           while(DMA_IsOn(1));
           dma_printf("%s\n","error: Busy or queued");
            break;
      case STATUS_ALARM_LOCK:
           while(DMA_IsOn(1));
           dma_printf("%s\r\n","error: Alarm lock");
            break;
    }
  }
}

// Prints alarm messages.
void report_alarm_message(int alarm_code){
  while(DMA_IsOn(1));
  dma_printf("%s","ALARM: ");
  switch (alarm_code) {
    case ALARM_HARD_LIMIT:
           while(DMA_IsOn(1));
           dma_printf("%s\n","Hard limit");
           break;
    case ALARM_ABORT_CYCLE:
           while(DMA_IsOn(1));
           dma_printf("%s\n","Abort during cycle");
           break;
  }
  while(DMA_IsOn(1));
  dma_printf("%s\n",". MPos?");
  Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
}

// Prints feedback messages. This serves as a centralized method to provide additional
// user feedback for things that are not of the status/alarm message protocol. These are
// messages such as setup warnings, switch toggling, and how to exit alarms.
// NOTE: For interfaces, messages are always placed within brackets. And if silent mode
// is installed, the message number codes are less than zero.
// TODO: Install silence feedback messages option in settings
void report_feedback_message(int message_code){

  switch(message_code) {
    case MESSAGE_CRITICAL_EVENT:
           while(DMA_IsOn(1));
           dma_printf("%s\n","[Reset to continue]"); break;
    case MESSAGE_ALARM_LOCK:
           while(DMA_IsOn(1));
           dma_printf("%s\n","['$H'|'$X' to unlock]"); break;
    case MESSAGE_ALARM_UNLOCK:
           while(DMA_IsOn(1));
           dma_printf("%s\n","[Caution: Unlocked]"); break;
    case MESSAGE_ENABLED:
           while(DMA_IsOn(1));
           dma_printf("%s\n","[Enabled]"); break;
    case MESSAGE_DISABLED:
           while(DMA_IsOn(1));
           dma_printf("%s\n","[Disabled]"); break;
  }
}

// Welcome message
void report_init_message(){
  while(DMA_IsOn(1));
  dma_printf("%s%s%s\r\n","Grbl ", GRBL_VERSION ,"['$' for help]");
}

// Grbl help message
void report_grbl_help() {
  while(DMA_IsOn(1));
  dma_printf("%s","$$ (view Grbl settings)\n\
                      $# (view # parameters)\n\
                      $G (view parser state)\n\
                      $N (view startup blocks)\n\
                      $x=value (save Grbl setting)\n\
                      $Nx=line (save startup block)\n\
                      $C (check gcode mode)\n\
                      $X (kill alarm lock)\n\
                      $H (run homing cycle)\n\
                      ~ (cycle start)\n\
                      ! (feed hold)\n\
                      ? (current status)\n\
                      ctrl-x (reset Grbl)\n");
}

// Grbl global settings print out.
// NOTE: The numbering scheme here must correlate to storing in settings.c
void report_grbl_settings() {
float acc = settings.acceleration;
  acc /=(60*60);
  while(DMA_IsOn(1));
  dma_printf("$0=    %l (x, step/mm) \n\
              $1=    %l (y, step/mm) \n\
              $2=    %l (z, step/mm) \n\
              $3=    %d (n-arc correction, int) \n\
              $4=    %d (n-decimals, int) \n\
              $5=    %d (hard limits, bool) \n\
              $6=    %d (homing dir invert mask, int:)\n\
              $7=    %d (step idle delay, msec)\n\
              $8=    %d (homing debounce, msec)\n\
              $9=    %f (default feed, mm/min)\n\
              $10=   %f (default seek, mm/min)\n\
              $11=   %f (acceleration, mm/sec^2)\n\
              $12=   %f (junction deviation, mm)\n\
              $13=   %f (arc, mm/segment)\n\
              $14=   %f (homing feed, mm/min)\n\
              $15=   %f (homing seek, mm/min)\n\
              $16=   %f (homing pull-off, mm)\n\
              $17=   %d (report inches, bool)\n\
              $18=   %d (auto start, bool)\n\
              $19:=  %d (invert step enable, bool)\n\
              $20=   %d (homing cycle, bool)\n\
              $21=   %d (homing dir invert mask, int:)\n\
              $22=   %d (step port invert mask, int:)\n"
              ,settings.steps_per_mm[X]
              ,settings.steps_per_mm[Y]
              ,settings.steps_per_mm[Z]
              ,settings.n_arc_correction
              ,settings.decimal_places
              ,settings.flags
              ,settings.homing_dir_mask
              ,settings.step_idle_delay
              ,settings.homing_debounce_delay
              ,settings.default_feed_rate
              ,settings.default_seek_rate
              ,acc
              ,settings.junction_deviation
              ,settings.mm_per_arc_segment
              ,settings.homing_feed_rate
              ,settings.homing_seek_rate
              ,settings.homing_pulloff
              ,bit_istrue(settings.flags,BITFLAG_AUTO_START)
              ,bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
              ,bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
              ,settings.homing_dir_mask
              ,settings.homing_dir_mask
              ,settings.invert_mask);
}


// Prints specified startup line
void report_startup_line(int n, char *line){
  while(DMA_IsOn(1));
  dma_printf("$N= %d %s\n",n,line);
  
}

 // Prints real-time data. This function grabs a real-time snapshot of the stepper subprogram
 // and the actual location of the CNC machine. Users may change the following function to their
 // specific needs, but the desired real-time data report must be as short as possible. This is
 // requires as it minimizes the computational overhead and allows grbl to keep running smoothly,
 // especially during g-code programs with fast, short line segments and high frequency reports (5-20Hz).
void report_realtime_status(){
  // **Under construction** Bare-bones status report. Provides real-time machine position relative to
  // the system power on location (0,0,0) and work coordinate position (G54 and G92 applied). Eventually
  // to be added are distance to go on block, processed block id, and feed rate. Also a settings bitmask
  // for a user to select the desired real-time data.
  int i;
  long current_position[3]; // Copy current state of the system position variable
  float print_position[3];
  while(DMA_IsOn(1));
  
  memcpy(current_position,sys.position,sizeof(sys.position));
  
  // Report current machine state
  switch (sys.state) {
    case STATE_IDLE:       dma_printf("%s","<Idle"); break;
//    case STATE_INIT: printPgmString(PSTR("[Init")); break; // Never observed
    case STATE_QUEUED:     dma_printf("%s","<Queue"); break;
    case STATE_CYCLE:      dma_printf("%s","<Run"); break;
    case STATE_HOLD:       dma_printf("%s","<Hold"); break;
    case STATE_HOMING:     dma_printf("%s","<Home"); break;
    case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
    case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
  }

  // Report machine position
  for (i=0; i<= 2; i++) {
    print_position[i] = current_position[i]/settings.steps_per_mm[i];
    if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) { print_position[i] *= INCH_PER_MM; }
  }
  
  while(DMA_IsOn(1));
  dma_printf(",MPos: %f,%f,%f,"
              ,print_position[0]
              ,print_position[1]
              ,print_position[2]);
              
  // Report work position
  for (i=0; i<= 2; i++) {
    if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) {
      print_position[i] -= (gc.coord_system[i]+gc.coord_offset[i])*INCH_PER_MM;
    } else {
      print_position[i] -= gc.coord_system[i]+gc.coord_offset[i];
    }
  }
  
  while(DMA_IsOn(1));
  dma_printf(",WPos: %f,%f,%f>\n"
              ,print_position[0]
              ,print_position[1]
              ,print_position[2]);
}

// Prints gcode coordinate offset parameters
void report_gcode_parameters(){
float coord_data[NoOfAxis];
int coord_select, i;

  for (coord_select = 0; coord_select <= SETTING_INDEX_NCOORD; coord_select++) {
   /* if (!(settings_read_coord_data(coord_select,coord_data))) {
      report_status_message(STATUS_SETTING_READ_FAIL);
      return;
    } */
     while(DMA_IsOn(1));
    dma_printf("[G");
     while(DMA_IsOn(1));
    switch (coord_select) {
      case 0: dma_printf("54:"); break;
      case 1: dma_printf("55:"); break;
      case 2: dma_printf("56:"); break;
      case 3: dma_printf("57:"); break;
      case 4: dma_printf("58:"); break;
      case 5: dma_printf("59:"); break;
      case 6: dma_printf("28:"); break;
      case 7: dma_printf("30:"); break;
      // case 8: printPgmString(PSTR("92:")); break; // G92.2, G92.3 not supported. Hence not stored.
    }
    for (i=0; i<NoOfAxis; i++) {
      while(DMA_IsOn(1));
      if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) { 
          dma_printf("%f ",coord_data[i]*INCH_PER_MM);
      }else { 
          dma_printf("%f ",coord_data[i]);
      }
      while(DMA_IsOn(1));
      if (i < (NoOfAxis-1)) {
         dma_printf(",");
      }else {
         dma_printf("]\n");
      }
    }
  }
  while(DMA_IsOn(1));
  dma_printf("[G92:"); // Print G92,G92.1 which are not persistent in memory
  for (i=0; i<NoOfAxis; i++) {
    while(DMA_IsOn(1));
    if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)){
      dma_printf("%f ",gc.coord_offset[i]*INCH_PER_MM);
    }else {
      dma_printf("%f ",gc.coord_offset[i]);
    }
    while(DMA_IsOn(1));
    if (i < (NoOfAxis-1)) {
       dma_printf(",");
    }else {
      dma_printf("]\n"); }
  }
}

// Print current gcode parser mode state
void report_gcode_modes(){
    while(DMA_IsOn(1));
  switch (gc.motion_mode) {
    case MOTION_MODE_SEEK :    dma_printf("[G0"); break;
    case MOTION_MODE_LINEAR :  dma_printf("[G1"); break;
    case MOTION_MODE_CW_ARC :  dma_printf("[G2"); break;
    case MOTION_MODE_CCW_ARC : dma_printf("[G3"); break;
    case MOTION_MODE_CANCEL :  dma_printf("[G80"); break;
  }
  while(DMA_IsOn(1));
  dma_printf(" G%d",gc.coord_select+54);
  while(DMA_IsOn(1));
  if (gc.plane_axis_0 == X) {
    if (gc.plane_axis_1 == Y) { dma_printf(" G17"); }
    else { dma_printf(" G18"); }
  } else { dma_printf(" G19"); }
  while(DMA_IsOn(1));
  if (gc.inches_mode) { dma_printf(" G20"); }
  else { dma_printf(" G21"); }
  while(DMA_IsOn(1));
  if (gc.absolute_mode) { dma_printf(" G90"); }
  else { dma_printf(" G91"); }
  while(DMA_IsOn(1));
  if (gc.inverse_feed_rate_mode) { dma_printf(" G93"); }
  else { dma_printf(" G94"); }
  
  while(DMA_IsOn(1));
  switch (gc.program_flow) {
    case PROGRAM_FLOW_RUNNING : dma_printf(" M0"); break;
    case PROGRAM_FLOW_PAUSED :  dma_printf(" M1"); break;
    case PROGRAM_FLOW_COMPLETED : dma_printf(" M2"); break;
  }
  while(DMA_IsOn(1));
  switch (gc.spindle_direction) {
    case 1 : dma_printf(" M3"); break;
    case -1 : dma_printf(" M4"); break;
    case 0 : dma_printf(" M5"); break;
  }
  while(DMA_IsOn(1));
  switch (gc.coolant_mode) {
    //case MESSAGE_DISABLE : printPgmString(PSTR(" M9")); break;
 //   case COOLANT_FLOOD_ENABLE : printPgmString(PSTR(" M8")); break;
    #ifdef ENABLE_M7
      case COOLANT_MIST_ENABLE : dma_printf(" M7"); break;
    #endif
  }
   while(DMA_IsOn(1));
   if (gc.inches_mode)
      dma_printf(" T %dF %f",gc.tool,gc.feed_rate*INCH_PER_MM);
   else
      dma_printf(" T %dF %f]\n",gc.tool,gc.feed_rate);


}
/*
// Executes user startup script, if stored.
void protocol_execute_startup(){
  uint8_t n;
  for (n=0; n < N_STARTUP_LINE; n++) {
    if (!(settings_read_startup_line(n, line))) {
      report_status_message(STATUS_SETTING_READ_FAIL);
    } else {
      if (line[0] != 0) {
        printString(line); // Echo startup line to indicate execution.
        report_status_message(gc_execute_line(line));
      }
    }
  }
}
*/