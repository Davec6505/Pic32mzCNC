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
////////////////////////////////////////////////////
//local variables
const code char SL[] = "$N";
volatile char gcode[arr_size][str_size];
char startup  absolute 0xA0002600 ;

////////////////////////////////////////////////////
// Initialize alllocal statics
void Init_Protocol(){
   startup = 0;
}
////////////////////////////////////////////////////
//reset the string array to zero                                               c
void Str_Initialize(char arg[arr_size][str_size]){
int i;
  for(i = 0; i <= arr_size;i++){
    memset(arg[i],0,str_size);
  }
}

void Str_clear(char *str,int len){
   memset(str,0,len);
}

///////////////////////////////////////////////////////
// Split the string according to the char
//G00X100.0Y100.0F1000
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

///////////////////////////////////////////////////////
// Split the string according to the char or space
//G00X100.0Y100.0F1000
static int strsplit2(char arg[arr_size][str_size],char *str, char c){
int i,ii,kk,err,lasti,len,track_char;
  Str_Initialize(arg);
  len = strlen(str);
  
  
  track_char=ii=kk=err=lasti=0;
  for (i = 0;i < len;i++){
    err = i - lasti; //test if string in string is < 49
    if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
      arg[kk++][ii] = 0;
      ii=err=0;
      lasti = i;
      track_char++;
      continue;
    }else{
      if(i > 0 && (*(str+0) != '$') ){
        if(!track_char && *(str+i) > 0x39){
         arg[kk++][ii] = 0;
         ii=err=0;
         lasti = i;
        }
      }
      arg[kk][ii++] = *(str+i);
   }
   if(*(str+i)==0)
      break;
  }
  arg[kk][0] = 0;
  return kk;
}

/////////////////////////////////////////////////////
//seperate the char and numerals from the string
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
int i;
char *tmp;// = strB;
   tmp = strB+indx;
  *(tmp+num_of_char)=0;

   i = 0;
   while(*tmp != 0){
    *strA++ = *tmp++;
    i++;
   }
   *strA = '\0';

   return i;
}


/////////////////////////////////////////////////
//Convert str to int
static int str2int(char *str,int base){
int  i, len;
int result = 0;
  
  len = strlen(str);

  for(i=0; i<len; i++){
     result = result * base + ( *(str+i) - 0x30 );
     while(DMA_IsOn(1));
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
void protocol_execute_runtime(){
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
          // Nothing. Block EVERYTHING until user issues reset or power cycles. Hard limits
          // typically occur while unattended or not paying attention. Gives the user time
          // to do what is needed before resetting, like killing the incoming stream.
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
      //st_feed_hold(); // Initiate feed hold.
      bit_false(sys.execute,EXEC_FEED_HOLD);
    }

    // Reinitializes the stepper module running state and, if a feed hold, re-plans the buffer.
    // NOTE: EXEC_CYCLE_STOP is set by the stepper subsystem when a cycle or feed hold completes.
    if (rt_exec & EXEC_CYCLE_STOP) {
      //st_cycle_reinitialize();
      bit_false(sys.execute,EXEC_CYCLE_STOP);
    }

    if (rt_exec & EXEC_CYCLE_START) {
      //st_cycle_start(); // Issue cycle start command to stepper subsystem
      if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
        sys.auto_start = true; // Re-enable auto start after feed hold.
      }
      bit_false(sys.execute,EXEC_CYCLE_START);
    }
  }

  // Overrides flag byte (sys.override) and execution should be installed here, since they
  // are runtime and require a direct and controlled interface to the main stepper program.
}


//check for errors or resets
void protocol_system_check(){
    // Execute system reset upon a system abort, where the main program will return to this loop.
    // Once here, it is safe to re-initialize the system. At startup, the system will automatically
    // reset to finish the initialization process.
  if (sys.abort) {
      // Reset system.
      //serial_reset_read_buffer(); // Clear serial read buffer
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

///////////////////////////////////////////////////
//         NEW GCODE LINE INTERPRETER            //
///////////////////////////////////////////////////
int Sample_Gocde_Line(){
int dif,state;
  //read head and tail pointer difference
  //if there is a difference then process line
  dif = 0;
  dif = Get_Difference();
  if(dif <= 0){
     //check for '?' status reporting query DMA uses pattern match
     //at startup the pattern match is set to ? for startup msg
     //once startup msg has been sent pattern match changes to '\n'
     //after which a test is needed on recieve buffer to indicate
     //that a char has been recieved without a pattern, once the
     //if the char '?' matches we condition the protocol report and
     //reset the DMA pointers back to the start indices
     if(DMA0_ReadDstPtr()){
      char *ptr = (char*)RXBUFF;
       if(*ptr == '?' || *ptr == '~' || *ptr == '!' || *ptr == 0x18){
         Do_Critical_Msg(*ptr);
         DMA_Abort(0);
         //DCH0DAT  = '\n'; //to ensure this is not changed??
       }
     }
  }else{
   char str[64];
   int msg_type= 0;
   int modal_response = 0;
    state = STATUS_OK;
    
    //reset the string to empty
    Str_clear(str,64);
    
    //get the line sent from PC
    Get_Line(str,dif);

    //test is startupmsg has been sent
    if(bit_isfalse(startup,bit(START_MSG))){
        Do_Startup_Msg(str,dif);
        return STATUS_OK;
    }

    //? cannot be used with '\n'
    if(str[0] == '?')return state;
     
    //a messages after firmware query '?'
    state = Check_Query_Type(str,dif);

    //if msg_type == 20 then run gcode function
    if(state == STATUS_COMMAND_EXECUTE_MOTION){
      state = Do_Gcode(str,dif);
      modal_response = Check_group_multiple_violations();
      #if ProtoDebug == 26
      while(DMA_IsOn(1));
      dma_printf("state:= %d\n",state);
      #endif
    }
  }
  return state;

}

////////////////////////////////////////////////////////
//on startup look for a ? char to setup pattern match 
//from ? to \n
static void Do_Startup_Msg(char *str_,int dif_){
char *temp_str = str_;//if more than 6 chars sent here ????
int i;
 //find ? at startup if it exists set startup bit 0
 for(i = 0;i <= dif_;i++){
    if(temp_str[i] == '?'){
     bit_true(startup,bit(START_MSG));
     report_init_message();
     break;
    }
 }
 DCH0DAT = '\n';
 SV.homed = false; //release homed
}

/////////////////////////////////////////////////////
//critical execution messages
static void Do_Critical_Msg(char ch_){
  #if ProtoDebug == 21
  while(DMA_IsOn(1));
  dma_printf("%c\n",ch_);
  #endif
  switch(ch_){
    case CMD_STATUS_REPORT: sys.execute |= EXEC_STATUS_REPORT; break; // Set as true
    case CMD_CYCLE_START:   sys.execute |= EXEC_CYCLE_START; break; // Set as true
    case CMD_FEED_HOLD:     sys.execute |= EXEC_FEED_HOLD; break; // Set as true
    case CMD_RESET:         mc_reset(); break; // Call motion control reset routine.
    default: break;
  }
}

///////////////////////////////////////////////////
//test string char 0 for instructions or gcode
static int Check_Query_Type(char *str_,int dif_){
int query;
int helper_var;
int status;
    #if ProtoDebug == 24
    while(DMA_IsOn(1));
    dma_printf("dif:=%d\n%s\n",dif_,str_);
    #endif
   if(str_[0] == '$'){
       switch(str_[1]){
         case '\r' :case '\n' : 
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
                } else {
                  if (sys.state) { status = STATUS_IDLE_ERROR; }
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
               status = STATUS_OK;
               if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
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
               //if we have made it this far we need to reset
               //SV.Tog to prepare for ok response
               SV.homed = true;
               break;
         case 'N' : // Startup lines. $N
               if ( str_[2] < 0x20 ) { // Print startup lines
                  for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
                    if ((settings_read_startup_line(helper_var, str_))) {
                      report_status_message(STATUS_SETTING_READ_FAIL);
                    } else {
                      report_startup_line(helper_var,str_);
                      status = STATUS_OK;
                    }
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
                   if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
                    char num[] = "0";
                      //extract num char into string
                      num[0] = str_[2];
                      N_Val = atoi(num);

                      #if ProtoDebug == 6
                      while(DMA_IsOn(1));
                      dma_printf("%s\t%d\n",num,N_Val);
                      #endif

                   }else {
                      query = 2; //STATUS_BAD_NUMBER_FORMAT;
                      break;
                   }
                   //$Nn\r\n leads to gocde execute startup line, providng it
                   //has already been saved
                   if (helper_var) { // Store startup line
                     int str_len = 0;
                       if(str_[3] != '='){
                         // Prepare sending gcode block back to gcode parser
                         // Set helper variable as counter to start of gcode block
                         helper_var = strlen((str_));
                         //strncpy(str_,(gcode[0]),helper_var);
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
                         #if ProtoDebug == 6
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str_);
                         #endif

                         // Prepare saving gcode block to line number 0 | 1
                         settings_store_startup_line(N_Val,str_+4);
                       }

                    }
               }
               status = STATUS_OK;
               break;
         case '0': case '1': case '2': case'3':  case '4': case '5':
         case '6': case '7': case '8': case '9':
               //extract the value from the string if = is at [2]
               //[        $  n  =  *value-str ]
               //[$n=val [0][1][2] *[3]      ]
               if((str_[2] == '=')||(str_[3] == '=')){
                 char str_val[9]={0};
                 int N_Val = 0;
                 float value = 0.00;
                 if(str_[2] == '='){
                    //$n < 10
                    strncpy(str_val,(str_+1),1);
                    if(isdigit(str_val[0])){N_Val = atoi(str_val);}
                    strncpy(str_val,(str_+3),strlen((str_+3)));
                 }else if(str_[3] == '='){
                    //$n >= 10
                    strncpy(str_val,(str_+1),2);
                    if(isdigit(str_val[0])){N_Val = atoi(str_val);}
                    memset(str_val,0,9);
                    strncpy(str_val,(str_+4),strlen((str_+4)));
                 }
                 //check if 1st char is a digit if not value extraction
                 //failed and result will be 0.0 !!! report status bad number
                 if((value < 0.0) || (!isdigit(str_val[0]))){
                     status = STATUS_UNSUPPORTED_STATEMENT;
                 }
                 value = atof(str_val);
                 #if ProtoDebug == 21
                 while(DMA_IsOn(1));
                 dma_printf("%d\t%s\t%f\n",N_Val,str_val,value);
                 #endif
                 settings_store_global_setting(N_Val,value);
                 status = STATUS_OK;
               }
               break;
       }
       //report on status messages
      // if(status != STATUS_OK)
      if(!SV.homed)
          report_status_message(status);
          
      return status;
   }else{
      status = STATUS_COMMAND_EXECUTE_MOTION;
   }
   return status;
}


static int Do_Gcode(char str_[64],int dif_){
char temp[9];
float XYZ_Val = 0.0;
int i,j,num_of_strings,mode,flow,status;
int  Val = 0;
//int axis_to_run = 0;

   //split up the line into string array using SPC seperator
   num_of_strings = strsplit2(gcode,str_,0x20);
   #if ProtoDebug == 27
   while(DMA_IsOn(1));
   dma_printf("no_of_strings:= %d\n",num_of_strings);
   #endif
   for(i=0; i < num_of_strings; i++){
     j = cpy_val_from_str(temp,gcode[i],1,strlen(gcode[i]));
     switch(gcode[i][0]){
        case 'G':case'g':
           if(j < 3){ //G00 - G99
            Val = atoi(temp);
             //Compensation for G28,G30 & G92 have other codes with
             //decimal places, resulting in G280,G300 etc
             if(Val == 28 || Val == 30 || Val == 92)
                Val *= 10;
           }else{
            //G28.1,G30.1 & G92.1 resulting in G281,G301 etc
             Val = (int)(atof(temp)*10.0);
           }
          mode = G_Mode(Val);
          status = STATUS_OK;
          #if ProtoDebug == 25
          while(DMA_IsOn(1));
          dma_printf("%d [%s][%d]\n",i,gcode[i],Val);
          #endif

           break;
        case 'X':case 'x':case 'Y':case 'y':
        case 'Z':case 'z':case 'A':case 'a':
        case 'I':case 'i':case 'J':case 'j':
        case 'K':case 'k':case 'F':case 'f':
          status = STATUS_OK;
          XYZ_Val = atof(temp);
          status = Instruction_Values(gcode[i],&XYZ_Val);

          if(gcode[i][0] == 'F' || gcode[i][0] == 'f')
            status = STATUS_OK;
          else
            status = STATUS_COMMAND_EXECUTE_MOTION;
            
          #if ProtoDebug == 25
          while(DMA_IsOn(1));
          dma_printf("[%d][%s][%f][%d]\n",i,gcode[i],XYZ_Val,status);
          #endif
          break;
        case 'P':case 'p':case 'L':case 'l':
        case 'S':case 's':
          Val = atoi(temp);
          status = Instruction_Values(gcode[i],&Val);
          break;
       case 'M':case'm':
          Val = atoi(temp);
          flow = M_Mode(Val);
          #if ProtoDebug == 25
          while(DMA_IsOn(1));
          dma_printf("%d [%s][%d]\n",i,gcode[i],Val);
          #endif
          status = STATUS_OK;
          break;
     }//switch
   }//for

  //return num of strings split for sanity checking
  return status;
}