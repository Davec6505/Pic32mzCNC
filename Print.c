#include "Print.h"
#include "Settings.h"
#include "Flash_R_W.h"
#include "Nuts_Bolts.h"
#include "GCODE.h"




/**
 * Reports status messages using Grbl 1.1 error codes.
 * This function maps internal status codes to the corresponding Grbl error numbers and prints them.
 * @param status_code The internal status code to report.
 * @return None.
 */
void report_status_message(int status_code){
  int err_no;
  switch(status_code){
    case STATUS_OK:
      while(DMA_IsOn(1));
      dma_printf("%s","ok\r\n");
      return;
    case STATUS_EXPECTED_COMMAND_LETTER: err_no = 1; break;
    case STATUS_BAD_NUMBER_FORMAT:       err_no = 2; break;
    case STATUS_INVALID_STATEMENT:       err_no = 3; break;
    case STATUS_SETTING_VALUE_NEG:       err_no = 4; break;
    case STATUS_SETTING_DISABLED:        err_no = 5; break;
    case STATUS_SETTING_STEP_PULSE_MIN:  err_no = 6; break;
    case STATUS_SETTING_READ_FAIL:       err_no = 7; break;
    case STATUS_IDLE_ERROR:              err_no = 8; break;
    case STATUS_ALARM_LOCK:              err_no = 9; break;
    case STATUS_LINE_OVERFLOW:
    case STATUS_SERIAL_RX_ERROR:         err_no = 11; break;
    case STATUS_SPEED_ERROR:             err_no = 12; break;
    case STATUS_UNSUPPORTED_STATEMENT:
    case STATUS_EI_ERROR:                err_no = 20; break;
    case STATUS_MODAL_GROUP_VIOLATION:   err_no = 21; break;
    case STATUS_UNDEFINED_FEED_RATE:     err_no = 22; break;
    case STATUS_ARC_RADIUS_ERROR:        err_no = 34; break;
    case STATUS_COMMAND_EXECUTE_MOTION:
    case STATUS_NO_REPORT:               return;
    // every line needs exactly one reply, or the sender waits for ever
    default:                             err_no = 3; break;
  }
  while(DMA_IsOn(1));
  dma_printf("error:%d\r\n",err_no);
}


/**
 * Reports alarm messages using Grbl 1.1 alarm codes.
 * This function maps internal alarm codes to the corresponding Grbl alarm numbers and prints them.
 * @param alarm_code The internal alarm code to report.
 * @return None.
 */
void report_alarm_message(int alarm_code){
  int err_no;
  switch (alarm_code) {
    case ALARM_HARD_LIMIT:  err_no = 1; break;
    case ALARM_ABORT_CYCLE: err_no = 3; break;
    default: return;
  }
  while(DMA_IsOn(1));
  dma_printf("ALARM:%d\r\n",err_no);
  Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
}


/**
 * Reports feedback messages for various user events.
 * This serves as a centralized method to provide user feedback for non-critical events.
 * for events that do not require immediate attention or action.
 * messages such as setup warnings, switch toggling, and how to exit alarms.
 * @note The message codes should correspond to the defined constants for feedback messages.
 * 
 * @param message_code The code representing the specific feedback message to report.
 * @return None.
 */
void report_feedback_message(int message_code){
  while(DMA_IsOn(1));
  switch(message_code) {
    case MESSAGE_CRITICAL_EVENT: dma_printf("%s","[MSG:Reset to continue]\r\n"); break;
    case MESSAGE_ALARM_LOCK:     dma_printf("%s","[MSG:'$H'|'$X' to unlock]\r\n"); break;
    case MESSAGE_ALARM_UNLOCK:   dma_printf("%s","[MSG:Caution: Unlocked]\r\n"); break;
    case MESSAGE_ENABLED:        dma_printf("%s","[MSG:Enabled]\r\n"); break;
    case MESSAGE_DISABLED:       dma_printf("%s","[MSG:Disabled]\r\n"); break;
  }
}


/**
 * Reports the initial Grbl startup message.
 * This message typically includes the firmware version and help information.
 * It is called during the initialization sequence to inform the user of the current Grbl state.
 * @return None.
 */
void report_init_message(){
  while(DMA_IsOn(1));
  dma_printf("\r\n%s%s%s\r\n",FIRMWARE,GRBL_VERSION,GRBL_HELP);
}


/**
 * Reports the Grbl help message.
 * This message provides a summary of the available commands and their usage.
 * It is typically called in response to the $H command or similar help requests.
 * @return None.
 */
void report_grbl_help() {
  while(DMA_IsOn(1));
  dma_printf("%s","[HLP:$$ $# $G $I $N $x=val $Nx=line $C $X $H ~ ! ? ctrl-x]\r\n");
}

// $I build info. OPT: no option letters, 15 planner blocks, 128 byte RX budget for the sender.
/**
 * Reports the build information for the Grbl firmware.
 * This includes the version, build number, and optional features.
 * It also reports the status of the Ethernet connection if available.
 * $I command is used to request this build information.
 * OPT: Optional features included in the build.
 * 15 planner blocks
 * 128 byte RX budget for the sender.
 * @note This function is called in response to the $I command.
 * @return None.
 */
void report_build_info(){
  while(DMA_IsOn(1));
  dma_printf("[VER:%s.%s:]\r\n[OPT:,15,128]\r\n",GRBL_VERSION,GRBL_VERSION_BUILD);
  while(DMA_IsOn(1));
  if(Ethernet_Ready()) dma_printf("[MSG:Ethernet %s]\r\n",Ethernet_Address());
  else dma_printf("[MSG:Ethernet not found]\r\n");
}


/**
 * Reports the current Grbl 1.1 settings ($$).
 * This function prints each setting in the format expected by Grbl, including both supported and fixed-value settings.
 * It ensures that the output matches the numbering used in settings_store_grbl_setting() for consistency.
 */

void report_grbl_settings() {
float acc = settings.acceleration / sec_sec;
  while(DMA_IsOn(1));
  dma_printf("$0=%d\r\n$1=%d\r\n$2=%d\r\n$3=%d\r\n$4=%d\r\n$5=%d\r\n$6=0\r\n$10=1\r\n"
    ,(int)settings.p_usec
    ,(int)settings.stepper_idle_lock_time
    ,(int)settings.invert_mask
    ,(int)settings.dir_invert_mask
    ,(int)bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
    ,(int)bit_istrue(settings.flags,BITFLAG_INVERT_LIMIT_PINS));


  while(DMA_IsOn(1));
  dma_printf("$11=%f\r\n$12=%f\r\n$13=%d\r\n$14=%d\r\n$20=0\r\n$21=%d\r\n$22=%d\r\n$23=%d\r\n"
    ,settings.junction_deviation
    ,settings.mm_per_arc_segment
    ,(int)bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)
    ,settings.s_curve_percentage
    ,(int)bit_istrue(settings.flags,BITFLAG_HARD_LIMIT_ENABLE)
    ,(int)bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
    ,(int)settings.homing_dir_mask);

  while(DMA_IsOn(1));
  dma_printf("$24=%f\r\n$25=%f\r\n$26=%d\r\n$27=%f\r\n$30=1000\r\n$31=0\r\n$32=0\r\n"
    ,settings.homing_feed_rate
    ,settings.homing_seek_rate
    ,(int)settings.homing_debounce_delay
    ,settings.homing_pulloff);

  while(DMA_IsOn(1));
  dma_printf("$100=%f\r\n$101=%f\r\n$102=%f\r\n"
    ,settings.steps_per_mm[X]
    ,settings.steps_per_mm[Y]
    ,settings.steps_per_mm[Z]);

  while(DMA_IsOn(1));
  dma_printf("$110=%f\r\n$111=%f\r\n$112=%f\r\n$120=%f\r\n$121=%f\r\n$122=%f\r\n"
    ,settings.default_seek_rate
    ,settings.default_seek_rate
    ,settings.default_seek_rate
    ,acc,acc,acc);

  while(DMA_IsOn(1));
  dma_printf("$130=%f\r\n$131=%f\r\n$132=%f\r\n"
    ,(float)X_MAX_SIZE
    ,(float)Y_MAX_SIZE
    ,(float)Z_MAX_SIZE);
}


/**
 * @brief Reports a startup line with the given line number and content.
 * @param n The line number of the startup line.
 * @param line The content of the startup line.
 */
void report_startup_line(int n, char *line){

  while(DMA_IsOn(1));
  dma_printf("$N%d=%s\r\n",n,line);
}

/**
 * @brief Reports the XYZ position in the specified units.
 * @param pos The position array containing X, Y, and Z coordinates.
 */
static void report_xyz(float *pos){
  while(DMA_IsOn(1));
  dma_printf("%f,%f,%f",pos[X],pos[Y],pos[Z]);
}

/**
 * @brief Converts the given position array to the current report units.
 * @param pos The position array containing X, Y, and Z coordinates.
 */
static void report_to_units(float *pos){
  int i;
  if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) {
    for (i=0; i<3; i++) { pos[i] *= INCH_PER_MM; }
  }
}


/**
 * @brief Reports the real-time status in the Grbl 1.1 format.
 * Reports the current machine state, position, feed rate, and work coordinate offset.
 * The status is printed in the format: <State|MPos:x,y,z|FS:feed,speed|WCO:x,y,z>
 */
void report_realtime_status(){
  int i;
  float position[3];

#ifndef ETHERNET_SPI
  while(DMA_IsOn(1));
#endif
  switch (sys.state) {
    case STATE_CYCLE:      dma_printf("%s","<Run"); break;
    case STATE_HOLD:       dma_printf("%s","<Hold:0"); break;
    case STATE_HOMING:     dma_printf("%s","<Home"); break;
    case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
    case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
    default:               dma_printf("%s","<Idle"); break;
  }

  for (i=0; i<3; i++) {
    position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
  }
  report_to_units(position);

  while(DMA_IsOn(1));
  dma_printf("%s","|MPos:");
  report_xyz(position);

  while(DMA_IsOn(1));
  dma_printf("|FS:%d,0|WCO:",(sys.state == STATE_CYCLE) ? (int)gc.feed_rate : 0);
  for (i=0; i<3; i++) {
    position[i] = gc.coord_system[i] + gc.coord_offset[i];
  }
  report_to_units(position);
  report_xyz(position);

  while(DMA_IsOn(1));
  dma_printf("%s",">\r\n");
}


/**
 * @brief Prints a coordinate line in the format: [name:x,y,z]
 * @details Reports a coordinate line with the given name and position.
 * @param name The name of the coordinate line.
 * @param pos The position array containing X, Y, and Z coordinates.
 */
static void report_coord_line(char *name, float *pos){
  report_to_units(pos);

  while(DMA_IsOn(1));
  dma_printf("[%s:",name);
  report_xyz(pos);

  while(DMA_IsOn(1));
  dma_printf("%s","]\r\n");
}

/**
 * @details Retrieves the position of the specified coordinate system from the stored recipes (P1..P9,G28,G30) and reports it using the report_coord_line function coord_system[recipe-1].
 * @brief Reports the specified coordinate system line.
 * @param name The name of the coordinate system line.
 * @param recipe The recipe index corresponding to the coordinate system.
 */
static void report_coord_system(char *name, int recipe){
  float position[3];
  int i;
  for (i=0; i<3; i++) {
    position[i] = coord_system[recipe-1].coord[i];
  }
  report_coord_line(name,position);
}

// Prints gcode coordinate offset parameters ($#) in the Grbl 1.1 format.
// G54..G59 are recipes P1..P6 (gc.coord_select = G-53).
/**
 * @details This function reads the stored coordinate system data and reports each relevant coordinate system line. Prints the G54..G59, G28, G30, and G92 coordinate offsets in the Grbl 1.1 format.
 * @brief Reports the current G-code coordinate offset parameters.
 * 
 */
void report_gcode_parameters(){
  float position[3];
  int i;

  settings_read_coord_data();
  report_coord_system("G54",1);
  report_coord_system("G55",2);
  report_coord_system("G56",3);
  report_coord_system("G57",4);
  report_coord_system("G58",5);
  report_coord_system("G59",6);
  report_coord_system("G28",SETTING_INDEX_G28);
  report_coord_system("G30",SETTING_INDEX_G30);
  for (i=0; i<3; i++) { position[i] = gc.coord_offset[i]; }
  report_coord_line("G92",position);

  while(DMA_IsOn(1));
  dma_printf("%s","[TLO:0.000]\r\n");

  while(DMA_IsOn(1));
  dma_printf("%s","[PRB:0.000,0.000,0.000:0]\r\n");
}
// Print current gcode parser mode state ($G) in the Grbl 1.1 format:
// [GC:G0 G54 G17 G21 G90 G94 M5 M9 T0 F0 S0]
void report_gcode_modes(){
  int motion;
  switch (gc.motion_mode) {
    case MOTION_MODE_LINEAR :  motion = 1; break;
    case MOTION_MODE_CW_ARC :  motion = 2; break;
    case MOTION_MODE_CCW_ARC : motion = 3; break;
    case MOTION_MODE_CANCEL :  motion = 80; break;
    default:                   motion = 0; break;
  }

  while(DMA_IsOn(1));
  dma_printf("[GC:G%d G%d",motion,gc.coord_select+53);

  if (gc.plane_axis_0 == X) {
    if (gc.plane_axis_1 == Y) { dma_printf("%s"," G17"); }
    else { dma_printf("%s"," G18"); }
  } else { dma_printf("%s"," G19"); }

  while(DMA_IsOn(1));
  dma_printf("%s",gc.inches_mode ? " G20" : " G21");

  while(DMA_IsOn(1));
  dma_printf("%s",gc.absolute_mode ? " G90" : " G91");
  while(DMA_IsOn(1));
  dma_printf("%s",gc.inverse_feed_rate_mode ? " G93" : " G94");

  while(DMA_IsOn(1));
  switch (gc.program_flow) {
    case PROGRAM_FLOW_PAUSED :    dma_printf("%s"," M0"); break;
    case PROGRAM_FLOW_COMPLETED : dma_printf("%s"," M2"); break;
  }

  while(DMA_IsOn(1));
  switch (gc.spindle_direction) {
    case 1 :  dma_printf("%s"," M3"); break;
    case -1 : dma_printf("%s"," M4"); break;
    default : dma_printf("%s"," M5"); break;
  }

  while(DMA_IsOn(1));
  switch (gc.coolant_mode) {
    case COOLANT_MIST_ENABLE :  dma_printf("%s"," M7"); break;
    case COOLANT_FLOOD_ENABLE : dma_printf("%s"," M8"); break;
    default :                   dma_printf("%s"," M9"); break;
  }

  while(DMA_IsOn(1));
  dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
             (int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
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