/* ****************************************************
 *$$ (view Grbl settings)
 *$# (view # parameters)
 *$G (view parser state)
 *$I (view build info)
 *$N (view startup blocks)
 *$x=value (save Grbl setting)
 *$Nx=line (save startup block)
 *$C (check gcode mode)
 *$X (kill alarm lock)
 *$H (run homing cycle)
 *~ (cycle start)
 *! (feed hold)
 *? (current status)
 *ctrl-x (reset Grbl)
*******************************************************/

/******************************************************
**************** examples of GCODES *******************
*G21G91G1X0.991F102
*G91 G21
*G02 X0 Y0.5 I0.5 J0 F2.5
******************************************************
******************************************************/

#include "protocol.h"
#include "Print.h"

/****************************************************
 * Defines the startup line prefix for Grbl settings.
 ****************************************************/
const code char SL[] = "$N";
volatile char gcode[arr_size][str_size];
char startup  absolute 0xA0002600 ;


/**
 * Initializes the protocol by resetting the startup array and reporting the initial message.
 * This function should be called at the beginning of the protocol setup to ensure a clean state.
 */
void Init_Protocol(){
   startup = 0;
   report_init_message();
}

/**
 * Resets the string array to zero.
 * This function initializes all elements of the provided 2D character array to zero.
 *
 * @param arg The 2D character array to be reset.
 */                                             
void Str_Initialize(char arg[arr_size][str_size]){
int i;
  for(i = 0; i < arr_size;i++){
    memset(arg[i],0,str_size);
  }
}

/**
 * Clears the specified string by setting all its characters to zero.
 *
 * @param str The string to be cleared.
 * @param len The length of the string to be cleared.
 */
void Str_clear(char *str,int len){
   memset(str,0,len);
}


/**
 * Splits the input string into substrings based on the specified character.
 * This function handles cases where substrings should not exceed 49 characters in length.
 * Example:
 *   Input: "G00X100.0Y100.0F1000", ' '
 *   Output: ["G00X100.0", "Y100.0", "F1000"]
 *
 * @param arg The 2D array to store the resulting substrings.
 * @param str The input string to be split.
 * @param c The character used as the delimiter for splitting.
 * @return The number of substrings generated.
 */
static int strsplit(char arg[arr_size][str_size],char *str, char c){
int i,ii,kk,err,lasti,len;
    Str_Initialize(arg);
    len = strlen(str);
    ii=kk=err=lasti=0;
    for (i = 0; i < len;i++){
        err = i - lasti; //test if string in string is < 49
        if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
          arg[kk++][ii] = 0;
          ii=err=0;
          lasti = i;
          continue;
        }else{
          arg[kk][ii++] = *(str+i);
       }
       if(*(str+i)==0)
          break;
    }
    arg[kk][0] = 0;
    return kk;
}

/**
 * Splits the input string into substrings based on the specified character or space, 
 * taking into account special cases for G-code strings.
 * This function handles G-code strings and other special cases to ensure accurate splitting.
 * This function is particularly useful for parsing G-code commands and other CNC-related strings where accurate splitting is crucial.
 * example: 
 *   Input: "G00X100.0Y100.0F1000", ' '
 *   Output: ["G00X100.0", "Y100.0", "F1000"]
 *   Input: "$N12345", ' '
 *   Output: ["$","N12345"]
 *   Input: "M03S1000", ' '
 *   Output: ["M03","S1000"]
 *   Input: "G1 X10.0 Y10.5 F1000", ' '
 *   Output: ["G1", "X10.0", "Y10.5", "F1000"]
 *
 * @param arg: 2D array to store the resulting substrings.
 * @param str: Input string to be split.
 * @param c:   Character used as the delimiter for splitting.
 * @return Returns the number of substrings generated.
 */
static int strsplit2(char arg[arr_size][str_size],char *str, char c){
int i,ii,kk,err,lasti,len,track_char;
  Str_Initialize(arg);
  len = strlen(str);
  
  
  track_char=ii=kk=err=lasti=0;
  for (i = 0;i < len;i++){
    //calculate the length of the current substring, should be < 49 chars in length
    err = i - lasti; 
    // check if the current character is the split character, newline, or if the substring length exceeds 49 chars
    if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
      // terminate the current substring and prepare for the next one
      arg[kk++][ii] = 0;
      ii=err=0;
      // update the last index to the current position and increment the character tracker
      lasti = i;
      track_char++;
      continue;
    }else{
      // check if the first character is not '$' and the current character is not a digit/number
      if(i > 0 && (*(str+0) != '$') ){
        // if the first character is not '$' and the current character is not a digit, split the string
        if(!track_char && *(str+i) > 0x39){ //0x39 is ASSCI 0x30 ('0') to 0x39 ('9')
          // split the string as the current character is not a digit and the first character is not '$'
          arg[kk++][ii] = 0;
          ii=err=0;
          // update the last index to the current position
          lasti = i;
        }
      }
      // append the current character to the current substring
      arg[kk][ii++] = *(str+i);
   }
  }
  // terminate the last substring to ensure it is properly null-terminated
  arg[kk][ii] = 0;
  // return the total number of substrings generated, kk++ has already been done when a new substring is started
  return kk;
}


/**
 * Obsolete function for copying a substring from strB to strA, temporarily null-terminating strB.
 * This function is replaced by cpy_val_from_str() to avoid modifying the original string.
 * @note MikroC does not strictly enforce modification of string literals, allowing this function to work without immediate errors. 
 *       However, modifying string literals is generally unsafe and should be avoided.
 *
 * @param strA: Destination string where the substring will be copied.
 * @param strB: Source string from which the substring will be taken.
 * @param indx: Starting index in strB for the substring.
 * @param num_of_char: Number of characters to copy from strB.
 * @return Returns: The number of characters copied.
 */
static int cpy_val_from_str_(char *strA,const char *strB,int indx,int num_of_char){
int i;
char *tmp;// = strB;
  // copy address of substring at indx from strB for num_of_char characters into strA
   tmp = strB+indx;
   // temporarily null-terminate the substring at the desired length
  *(tmp+num_of_char)=0;

   i = 0;
   // copy characters from the temporary substring to the destination string until the null terminator is reached
   while(*tmp != 0){
    *strA++ = *tmp++;
    i++;
   }
   *strA = '\0';

   return i;
}


/**
 * Copies a substring from strB starting at indx for num_of_char characters into strA without modifying strB.
 * 
 * @param  strA: Destination string where the substring will be copied.
 * @param  strB: Source string from which the substring will be taken.
 * @param  indx: Starting index in strB for the substring.
 * @param  num_of_char: Number of characters to copy from strB.
 * @return Returns: The number of characters copied.
 */
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char)
{
    int i;

    for (i = 0; i < num_of_char && strB[indx + i] != '\0'; i++)
    {
        strA[i] = strB[indx + i];
    }

    strA[i] = '\0';

    return i;
}


/**
 * Converts a string to an integer based on the specified base.
 *
 * @param  str: The string to be converted.
 * @param  base: The numerical base for conversion (e.g., 10 for decimal, 16 for hexadecimal).
 * @return Returns the integer value represented by the string.
 */
static int str2int(const char *str,int base){
int  i, len;
int result = 0;
  // Get the length of the string
  len = strlen(str);
  // Iterate over each character in the string and convert it to an integer based on the base.
  for(i=0; i<len; i++){
     result = result * base + ( *(str+i) - 0x30 );
     #ifndef ETHERNET_SPI
     while(DMA_IsOn(1));
     #endif
  }

   return result;
}



////////////////////////////////////////////////////////////////////////////////
//      PROTOCOL EXECUTE RUNTIME FROM GRBL [STILL IMPLIMENTING ???]           //
////////////////////////////////////////////////////////////////////////////////

// Executes run-time commands, when required. This is called from various check points in the main
// program, primarily where there may be a while loop waiting for a buffer to clear space or any
// point where the execution time from the last check point may be more than a fraction of a second.
// This is a way to execute runtime commands asynchronously (aka multitasking) with grbl's g-code
// parsing and planning functions. This function also serves as an interface for the interrupts to
// set the system runtime flags, where only the main program handles them, removing the need to
// define more computationally-expensive volatile variables. This also provides a controlled way to
// execute certain tasks without having two or more instances of the same task, such as the planner
// recalculating the buffer upon a feedhold or override.
// NOTE: The sys.execute variable flags are set by any process, step or serial interrupts, pinouts,
// limit switches, or the main program.
/**
 * Executes runtime commands based on the current system state and pending events.
 * This function handles asynchronous tasks such as resets, critical events, and alarms.
 * It should be called periodically from the main program loop to ensure timely execution of runtime commands.
 * @note The sys.execute variable flags are set by any process, step or serial interrupts, pinouts,
 * limit switches, or the main program.
 */
void protocol_execute_runtime(){
  unsigned int pending = Serial_TakeRealtime();
  if(pending & EXEC_RESET){
    Reset_Ring();
    mc_reset();
    pending &= ~EXEC_RESET;
  }
  //the Timer1 ISR has already stopped the drivers
  if(Limits_TakeEvent()){
    mc_reset();
    sys.execute |= EXEC_CRIT_EVENT;
  }
  sys.execute |= pending;
  if (sys.execute) { // Enter only if any bit flag is true
    int rt_exec = sys.execute; // Avoid calling volatile multiple times

    // System alarm. Everything has shutdown by something that has gone severely wrong. Report
    // the source of the error to the user. If critical, Grbl disables by entering an infinite
    // loop until system reset/abort.
    if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
      sys.state = STATE_ALARM; // Set system alarm state

      // Critical event. Only hard limit qualifies. Update this as new critical events surface.
      if (rt_exec & EXEC_CRIT_EVENT) {
        report_alarm_message(ALARM_HARD_LIMIT);
        report_feedback_message(MESSAGE_CRITICAL_EVENT);
        bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
        do {
          Ethernet_Transport_Poll(); // a TCP host's Ctrl-X arrives through here
          if(Serial_TakeRealtime() & EXEC_RESET){
            Reset_Ring();
            mc_reset();
          }
        } while (bit_isfalse(sys.execute,EXEC_RESET));

      // Standard alarm event. Only abort during motion qualifies.
      } else {
        // Runtime abort command issued during a cycle, feed hold, or homing cycle. Message the
        // user that position may have been lost and set alarm state to enable the alarm lockout
        // to indicate the possible severity of the problem.
        report_alarm_message(ALARM_ABORT_CYCLE);
      }
      bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
    }

    // Execute system abort.
    if (rt_exec & EXEC_RESET) {
      sys.abort = true;  // Only place this is set true.
      return; // Nothing else to do but exit.
    }

    // Execute and serial print status
    if (rt_exec & EXEC_STATUS_REPORT) {
      report_realtime_status();
      bit_false(sys.execute,EXEC_STATUS_REPORT);
    }

    // Initiate stepper feed hold
    if (rt_exec & EXEC_FEED_HOLD) {
      //moves complete at once for now, so only an idle machine can be held
      // TODO(DDS): in a cycle, decelerate to a stop and then report Hold:0.
      if (sys.state == STATE_IDLE) sys.state = STATE_HOLD;
      bit_false(sys.execute,EXEC_FEED_HOLD);
    }

    // Reinitializes the stepper module running state and, if a feed hold, re-plans the buffer.
    // NOTE: EXEC_CYCLE_STOP is set by the stepper subsystem when a cycle or feed hold completes.
    if (rt_exec & EXEC_CYCLE_STOP) {
      //st_cycle_reinitialize();
      bit_false(sys.execute,EXEC_CYCLE_STOP);
    }

    if (rt_exec & EXEC_CYCLE_START) {
      //resume from M0 or '!'
      // TODO(DDS): restart the held motion instead of going idle.
      if (sys.state == STATE_HOLD) sys.state = STATE_IDLE;
      if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
        sys.auto_start = true; // Re-enable auto start after feed hold.
      }
      bit_false(sys.execute,EXEC_CYCLE_START);
    }
  }

  // Overrides flag byte (sys.override) and execution should be installed here, since they
  // are runtime and require a direct and controlled interface to the main stepper program.
}


/**
 * Checks for system errors or resets and performs necessary reinitialization.
 * This function should be called periodically from the main program loop to handle
 * system aborts and resets safely.
 * @note This function should not be called from within interrupt service routines.
 */
void protocol_system_check(){
    // Execute system reset upon a system abort, where the main program will return to this loop.
    // Once here, it is safe to re-initialize the system. At startup, the system will automatically
    // reset to finish the initialization process.
  if (sys.abort) {
      // Reset system.
      Reset_Ring();
      //plan_init(); // Clear block buffer and planner variables
      //gc_init(); // Set g-code parser to default state
      //protocol_init(); // Clear incoming line data and execute startup lines
      //spindle_init();
      //coolant_init();
      //limits_init();
      //st_reset(); // Clear stepper subsystem variables.

      // Sync cleared gcode and planner positions to current system position, which is only
      // cleared upon startup, not a reset/abort.
      sys_sync_current_position();

      // Reset system variables.
      sys.abort = 0;
      sys.execute = 0;
      startup = 0;
      report_init_message();
      if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }

      // Check for power-up and set system alarm if homing is enabled to force homing cycle
      // by setting Grbl's alarm state. Alarm locks out all g-code commands, including the
      // startup scripts, but allows access to settings and internal commands. Only a homing
      // cycle '$H' or kill alarm locks '$X' will disable the alarm.
      // NOTE: The startup script will run after successful completion of the homing cycle, but
      // not after disabling the alarm locks. Prevents motion startup blocks from crashing into
      // things uncontrollably. Very bad.
      #ifdef HOMING_INIT_LOCK
        if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
      #endif

      // Check for and report alarm state after a reset, error, or an initial power up.
      if (sys.state == STATE_ALARM) {
        report_feedback_message(MESSAGE_ALARM_LOCK);
      } else {
        // All systems go. Set system to ready and execute startup script.
        sys.state = STATE_IDLE;
        //protocol_execute_startup();
      }
  }
}

/**
 * Interprets and executes a single line of G-code.
 * This function reads a line from the serial input, checks for errors, and processes
 * the line according to the current system state.
 * @return Returns the status of the G-code execution, such as STATUS_OK, STATUS_NO_REPORT,
 *         or STATUS_COMMAND_EXECUTE_MOTION.
 */
int Sample_Gocde_Line(){
  char str[LINE_BUFFER_SIZE];
  int state, dif, result;
  // Read a line from the serial | Ethernet input and handle basic errors.
  result = Serial_ReadLine(str);
  if(result == SERIAL_LINE_NONE) return STATUS_OK;
  if(result == SERIAL_LINE_TOO_LONG || result == SERIAL_LINE_RX_ERROR){
    report_status_message(result == SERIAL_LINE_TOO_LONG ? STATUS_LINE_OVERFLOW : STATUS_SERIAL_RX_ERROR);
    return STATUS_OK;
  }
  if(sys.abort || (sys.execute & EXEC_RESET)) return STATUS_NO_REPORT;
  dif = strlen(str);
  if(dif == 0){
    report_status_message(STATUS_OK);
    return STATUS_OK;
  }
  if(str[0] == '$'){
    Check_Query_Type(str,dif);
    return STATUS_NO_REPORT;
  }
  if(sys.state == STATE_ALARM){
    report_status_message(STATUS_ALARM_LOCK);
    return STATUS_NO_REPORT;
  }

  //exactly one reply per line: errors and check mode reply here, accepted
  //lines reply from main once they have been executed
  state = Do_Gcode(str,dif);
#if ProtoDebug == 26
  while(DMA_IsOn(1));
  dma_printf("state:= %d\n",state);
#endif

  if(state != STATUS_OK || sys.state == STATE_CHECK_MODE){
    report_status_message(state);
    G_Begin_Block();
    return STATUS_NO_REPORT;
  }
  return STATUS_COMMAND_EXECUTE_MOTION;
}

static int Machine_Busy(){
  return (sys.state == STATE_CYCLE || sys.state == STATE_HOLD ||
          sys.state == STATE_HOMING || sys.state == STATE_JOG);
}

/**
 * Checks the type of query command starting with '$' and executes the corresponding action.
 * This function handles system queries, settings, and mode toggles.
 * @param str_ The input string containing the query command.
 * @param dif_ The length of the input string.
 * @return Returns the status of the query execution, such as STATUS_OK or STATUS_INVALID_STATEMENT.
 * @note This function should be called only when a line starting with '$' is received and should not be called from interrupt service routines.
 */
static int Check_Query_Type(char *str_,int dif_){
int query;
int helper_var;
int status = STATUS_OK;

#if ProtoDebug == 24
    while(DMA_IsOn(1));
    dma_printf("dif:=%d\n%s\n",dif_,str_);
#endif

   if(str_[0] == '$'){
       // single letter commands take nothing after the letter, as in Grbl
       switch(str_[1]){
         case '$': case '#': case 'G': case 'C': case 'X': case 'H': case 'I':
              if(str_[2] != 0){
                 report_status_message(STATUS_INVALID_STATEMENT);
                 return STATUS_INVALID_STATEMENT;
              }
       }
       switch(str_[1]){
         case '\0': case '\r' :case '\n' :
               report_grbl_help(); 
               status = STATUS_OK;
               break;
         case '$': // Prints Grbl setting
               report_grbl_settings();
               status = STATUS_OK;
               break;
         case '#' : // Print gcode parameters
               report_gcode_parameters();
               status = STATUS_OK;
               break;
         case 'G' : // Prints gcode parser state
               report_gcode_modes();
               status = STATUS_OK;
               break;
         case 'C' : // Set check g-code mode
                status = STATUS_OK;
                // Debug information for checking system state before toggling check g-code mode.
                #if ProtoDebug == 22
                while(DMA_IsOn(1));
                dma_printf("sys.state:=%d\n",sys.state);
                #endif

                // Perform reset when toggling off. Check g-code mode should only work if Grbl
                // is idle and ready, regardless of alarm locks. This is mainly to keep things
                // simple and consistent.
                if ( sys.state == STATE_CHECK_MODE ) {
                  mc_reset();
                  report_feedback_message(MESSAGE_DISABLED);
                } else if (sys.state) {
                  status = STATUS_IDLE_ERROR;
                } else {
                  sys.state = STATE_CHECK_MODE;
                  report_feedback_message(MESSAGE_ENABLED);
                }
              break;
         case 'X' : // Disable alarm lock
              if (sys.state == STATE_ALARM) {
                report_feedback_message(MESSAGE_ALARM_UNLOCK);
                sys.state = STATE_IDLE;
                // Don't run startup script. Prevents stored moves in startup from causing accidents.
              }
              status = STATUS_OK;
              break;
         case 'H' : // Perform homing cycle $H
               #ifndef HOMING_READY
               // TODO(DDS): rework homing for the DDS engine, then define HOMING_READY.
               status = STATUS_UNSUPPORTED_STATEMENT;
               break;
               #else
               status = STATUS_OK;
               if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
                int axis_to_home = 0;

                  // Only perform homing if Grbl is idle or lost.
                  if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
                   int i = 0;
                   Rst_modalgroup();

                    //set bit 10 [1024] for homing
                   Set_modalgroup(HOME_ALL);
                   for(i=0;i<=NoOfAxis;i++)
                      Set_Axisword(i);
                    //set the global homed bit to false
                   //will need to test for abort!!!
                   if (sys.abort) {
                       status = ALARM_ABORT_CYCLE;
                      break;
                   }
                  } else {
                     status = STATUS_IDLE_ERROR;
                     break;
                  }
               } else {
                  status = STATUS_SETTING_DISABLED;
                  break;
               }
               //ok is sent by main when the homing cycle completes
               sys.state = STATE_HOMING;
               status = STATUS_NO_REPORT;
               break;
               #endif
         case 'N' : // Startup lines. $N
               if ( str_[2] < 0x20 ) { // Print startup lines
                  for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
                    if ((settings_read_startup_line(helper_var, str_))) {
                      status = STATUS_SETTING_READ_FAIL;
                      break;
                    }
                    report_startup_line(helper_var,str_);
                
                  // Debug information for the retrieved startup line.
                   #if ProtoDebug == 6
                   while(DMA_IsOn(1));
                   dma_printf("str[%d]:= %s\n",helper_var,str_);
                   #endif

                  }
                  break;
               }else { // Store startup line
                  int N_Val = 0;
                  helper_var = 1;  // Set helper_var to flag storing method.
                  //look for char [0 - 9] and no = sign indicating run line x
                  //extract the value from the string if = is at [2]
                  //[        $  n  =  *value-str ]
                  //[$n=val [0][1][2] *[3]      ]
                   if ( str_[2] >= '0'  &&  str_[2] < '0' + N_STARTUP_LINE ) {
                    char num[] = "0";
                      //extract num char into string
                      num[0] = str_[2];
                      N_Val = atoi(num);

                      // Debug information for the extracted startup line number.
                      #if ProtoDebug == 6
                      while(DMA_IsOn(1));
                      dma_printf("%s\t%d\n",num,N_Val);
                      #endif

                   }else {
                      status = STATUS_BAD_NUMBER_FORMAT;
                      break;
                   }
                   //$Nn\r\n leads to gocde execute startup line, providng it
                   //has already been saved
                   if (helper_var) { // Store startup line
                     int str_len = 0;
                       if(str_[3] != '='){
                         // TODO: $Nn alone could run startup line n; Grbl only accepts $Nn=line
                         status = STATUS_INVALID_STATEMENT;
                         // Prepare sending gcode block back to gcode parser
                         // Set helper variable as counter to start of gcode block
                         helper_var = strlen((str_));
                         //strncpy(str_,(gcode[0]),helper_var);

                         // Debug information for the invalid startup line format.
                         #if ProtoDebug == 6
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str_);
                         #endif

                         //use length to determine if startup line exists
                         //becareful not to put loop here as $Nn will repeat
                         //forever!!!!!!
                         str_len = strlen(str_);
                         //after extracting the start line execute it by
                         //returning to the beginning of this function
                         /*if(!strncmp(SL,str,2))
                             goto START_LINE;  */

                       }else{
                        int str_length = 0;
                        // debug to check string argument of startup line

                        // Debug information for the startup line argument before saving it.
                         #if ProtoDebug == 6
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str_);
                         #endif

                         // Prepare saving gcode block to line number 0 | 1
                         if(Machine_Busy())
                            status = STATUS_IDLE_ERROR;
                         else if(settings_store_startup_line(N_Val,str_+4))
                            status = STATUS_SETTING_READ_FAIL;
                       }

                    }
               }
               break;
         case 'I' : // Print build info (Grbl 1.1)
               report_build_info();
               status = STATUS_OK;
               break;
         case 'J' : // TODO: $J= jogging, parse as a G1 block and run it as STATE_JOG.
               status = STATUS_UNSUPPORTED_STATEMENT;
               break;
         case 'R' : // $RST=$ defaults, $RST=# offsets, $RST=* everything
               if(strncmp(str_+1,"RST=",4)){
                  status = STATUS_INVALID_STATEMENT;
                  break;
               }
               switch(str_[5]){
                  case '$': helper_var = SETTINGS_RESTORE_DEFAULTS;   break;
                  case '#': helper_var = SETTINGS_RESTORE_PARAMETERS; break;
                  case '*': helper_var = SETTINGS_RESTORE_ALL;        break;
                  default : helper_var = 0;                           break;
               }
               if(!helper_var){
                  status = STATUS_INVALID_STATEMENT;
               }else if(Machine_Busy()){
                  status = STATUS_IDLE_ERROR;
               }else if(settings_restore(helper_var)){
                  status = STATUS_SETTING_READ_FAIL;
               }else{
                  status = STATUS_OK;
               }
               break;
         case '0': case '1': case '2': case'3':  case '4': case '5':
         case '6': case '7': case '8': case '9': {
               // $n=value, n may be 1..3 digits (Grbl 1.1 numbering) 
               // Parse and store the Grbl setting corresponding to $n. after the '=' sign.
               char *eq = strchr(str_,'=');
               // Check for a valid number format after the '=' sign, like a digit, decimal point, or sign.
               if((eq == 0) || (!isdigit(eq[1]) && eq[1] != '.' && eq[1] != '-')){
                  status = STATUS_BAD_NUMBER_FORMAT;
               }else if(Machine_Busy()){
                  status = STATUS_IDLE_ERROR;
               }else{
                  int N_Val = atoi(str_+1);
                  float value = atof(eq+1);

                  // Debug information for the parsed setting number and value.
                  #if ProtoDebug == 21
                  while(DMA_IsOn(1));
                  dma_printf("%d\t%f\n",N_Val,value);
                  #endif

                  status = settings_store_grbl_setting(N_Val,value);
               }
               break;
         }
         default:
               status = STATUS_INVALID_STATEMENT;
               break;
       }       //report on status messages
      report_status_message(status);
          
      return status;
   }else{
      status = STATUS_COMMAND_EXECUTE_MOTION;
   }
   return status;
}


// Splits a line into upper case words (letter + number) in gcode[], dropping
// spaces, (comments) and ; comments. Returns the word count, -1 if malformed.
static int gcode_words(char *line){
int n = 0, k = 0, in_comment = 0;
char ch;
  Str_Initialize(gcode);
  while((ch = *line++) != 0){
    if(in_comment){
      if(ch == ')') in_comment = 0;
      continue;
    }
    if(ch == '(') { in_comment = 1; continue; }
    if(ch == ';') break;
    if(ch == ' ' || ch == '\t') continue;
    ch = toupper(ch);
    if(ch >= 'A' && ch <= 'Z'){
      if(n >= arr_size) return -1;
      k = 0;
      gcode[n++][k++] = ch;
    }else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
      if(k >= str_size-1) return -1;
      gcode[n-1][k++] = ch;
    }else{
      return -1;
    }
  }
  return n;
}

/**
 * Parses and executes a single G-code block.
 * This function processes the G-code line, handling G and M words first, followed by value words.
 * It maintains the parser state, checks for errors, and restores the state if the block is rejected.
 * errors encountered during parsing are stored and reported.
 *
 * @param str_ The G-code line to parse.
 * @param dif_ Unused parameter, reserved for future use.
 * @return The status of the G-code execution, indicating success or specific errors.
 */
static int Do_Gcode(char *str_,int dif_){
float XYZ_Val;
int i,pass,num_of_strings,Val,st,is_mode;
int err = STATUS_OK;
char *num;

   G_Begin_Block();
   G_Save_State();
   num_of_strings = gcode_words(str_);
   if(num_of_strings < 0) return STATUS_EXPECTED_COMMAND_LETTER;
   #if ProtoDebug == 27
   while(DMA_IsOn(1));
   dma_printf("no_of_strings:= %d\n",num_of_strings);
   #endif
   for(pass=0; pass < 2; pass++)
   for(i=0; i < num_of_strings; i++){
     is_mode = (gcode[i][0] == 'G' || gcode[i][0] == 'M');
     if(is_mode != (pass == 0)) continue;
     num = gcode[i]+1;
     if(*num == 0){
       st = STATUS_BAD_NUMBER_FORMAT;
     }else{
       st = STATUS_OK;
       switch(gcode[i][0]){
          case 'G':
             //G28.1, G30.1 and G92.1 become 281, 301 and 921, whole codes
             //G28, G30 and G92 become 280, 300 and 920
             Val = (int)(atof(num)*10.0 + 0.5);
             if(Val % 10 == 0){
               Val /= 10;
               if(Val == 28 || Val == 30 || Val == 92) Val *= 10;
             }
             G_Mode(Val);
             st = GET_FAIL();
             #if ProtoDebug == 25
             while(DMA_IsOn(1));
             dma_printf("%d [%s][%d]\n",i,gcode[i],Val);
             #endif
             break;
          case 'M':
             M_Mode(atoi(num));
             st = GET_FAIL();
             break;
          case 'X':case 'Y':case 'Z':case 'A':
          case 'I':case 'J':case 'K':case 'R':case 'F':
             XYZ_Val = atof(num);
             st = Instruction_Values(gcode[i],&XYZ_Val);
             #if ProtoDebug == 25
             while(DMA_IsOn(1));
             dma_printf("[%d][%s][%f][%d]\n",i,gcode[i],XYZ_Val,st);
             #endif
             break;
          case 'P':case 'L':
          case 'S': // TODO: S is also spindle speed, unused until the spindle is driven.
             if(gcode[i][0] == 'P') gc.dwell = atof(num);
             Val = atoi(num);
             st = Instruction_Values(gcode[i],&Val);
             break;
          case 'N': // line numbers are accepted and ignored
             break;
          case 'T': // TODO: tool change needs a tool table and M6.
          default:
             st = STATUS_UNSUPPORTED_STATEMENT;
             break;
       }
     }
     if(err == STATUS_OK) err = st;
   }

  if(err == STATUS_OK) err = Check_group_multiple_violations();
  if(err != STATUS_OK) G_Restore_State();
  return err;
}