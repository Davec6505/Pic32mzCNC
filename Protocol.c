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


#include "protocol.h"
#include "Print.h"
////////////////////////////////////////////////////
//local variables
const code char SL[] = "$N";
char gcode[arr_size][str_size];
static unsigned short startup = 0;

////////////////////////////////////////////////////
//reset the string array to zero
void Str_Initialize(char arg[arr_size][str_size]){
int i;
  for(i = 0; i <= arr_size;i++){
    memset(arg[i],0,str_size);
  }
}

void Str_clear(char *str,int len){
   memset(str,0,len);
}

///////////////////////////////////////////////////
//sample the ring buffer to check for data
int Sample_Ringbuffer(){
unsigned char *ptr;
static int motion_mode,str_len,query;
int status;
char str[64];
char temp[9];
char xyz[6];
char F_1_Once,no_of_axis;
char axis_to_run;
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val,O_Val,P_Val;
float XYZ_Val;

  //read head and tail pointer difference
  //if there is a difference then process line
  dif = 0;
  dif = Get_Difference();
  
  //send runtime status when instructed
  if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
      startup = 1;
      bit_false(sys.execute,EXEC_STATUS_REPORT);
      report_realtime_status();
      return STATUS_OK;
  }
  
  if(dif == 0){
     //EXECUTES THIS AFTER INITIAL STARTUP LINE
     if(DMA0_ReadDstPtr()){
       ptr = (char*)RXBUFF;
       if(*ptr == '?'){
         #if ProtoDebug == 1
         while(DMA_IsOn(1));
         dma_printf("%d\n",ptr);
         #endif
         DMA0_Abort();
         if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
               bit_true(sys.execute,EXEC_STATUS_REPORT);
         startup = 0;
       }
     }
     return STATUS_OK;
  }else if(dif > 0){

    F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing

    Str_clear(str,str_len+2);    //reset the string to empty
    Get_Line(str,dif);         //get the line sent from PC
    str_len = strlen(str);

START_LINE://label to rerun startup line if it has one

    //split up the line into string array using SPC seperator
    num_of_strings = strsplit(gcode,str,0x20);
    str_len = strlen(gcode[0]);
    
    #if ProtoDebug == 2
    while(DMA_IsOn(1));
    dma_printf("%s:=\t%d\n",gcode[0],str_len);
    #endif
    
    //condition each string by seperating the 1st char from the value
    //e.g. G01  => 'G' "01" and extract the numeral from value
    //GCODE standard is usuall capitals = making compensation for
    //Lowercase in the invent of a GCODE set sending lowercase
    #if LoopBackDebug == 1
       UART3_Write_Text(str);
    #endif

     if(DCH0DAT == '?'){
       #if ProtoDebug == 3
       while(DMA_IsOn(1));
       dma_printf("%s\n","?");
       #endif
       report_init_message();
       DCH0DAT = '\n';
       status = STATUS_OK;
       startup = 1;
       return STATUS_OK;
       //goto end;
     }
     
     #if ProtoDebug == 4
       while(DMA_IsOn(1));
         dma_printf("%s\t%d\n",gcode[0],str_len);
     #endif
     
     if(gcode[0][0] =='?'){
        startup = 0;
        if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
             bit_true(sys.execute,EXEC_STATUS_REPORT);
     }else if(gcode[0][0] =='$'){
       int helper_var;
       if(str_len < 2){
          report_grbl_help();
          query = 1;
          status = STATUS_OK;
          goto end;
       }
       switch(gcode[0][1]){
            case '$': // Prints Grbl setting
              report_grbl_settings();
              query = 1;
              break;
            case '#' : // Print gcode parameters
              report_gcode_parameters();
              query = 1;
              break;
            case 'G' : // Prints gcode parser state

                startup = 0;
                report_gcode_modes();
                query = 1;
                //will report the current status of the machine after it is asked
                //for gcode_report
                if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
                    bit_true(sys.execute,EXEC_STATUS_REPORT);
                break;
            case 'C' : // Set check g-code mode
                startup = 2; //for 1st scan to get ugs to connect
                // Perform reset when toggling off. Check g-code mode should only work if Grbl
                // is idle and ready, regardless of alarm locks. This is mainly to keep things
                // simple and consistent.
                if ( sys.state == STATE_CHECK_MODE ) {
                  mc_reset();
                  report_feedback_message(MESSAGE_DISABLED);
                } else {
                  //if not in idle then ignore request
                  if (sys.state) { return(STATUS_IDLE_ERROR); }
                  //only in idle will this respond
                  sys.state = STATE_CHECK_MODE;
                  report_feedback_message(MESSAGE_ENABLED);
                }
              break;
            case 'X' : // Disable alarm lock
              startup = 2; //for 1st scan to get ugs to connect
              if (sys.state == STATE_ALARM) {
                report_feedback_message(MESSAGE_ALARM_UNLOCK);
                sys.state = STATE_IDLE;
                // Don't run startup script. Prevents stored moves in startup from causing accidents.
              }
              query = 1; //status ok response
              break;
            case 'H' : // Perform homing cycle
               startup = 2;

               if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
                int axis_to_home = 0;

                  // Only perform homing if Grbl is idle or lost.
                  if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
                    int i = 0;
                    Rst_modalgroup();
                    //set bit 10 [1024] for homing
                    Set_modalgroup(HOME_ALL);
                    for(i=1;i<NoOfAxis;i++)
                      Set_Axisword(i);
                   #if HomeDebug == 1
                    while(DMA_IsOn(1));
                    dma_printf("GCODE:= %s\tmodal_group:= %d\n",gcode[0],Get_modalgroup());
                   #endif
                   //will need to test for abort!!!
                   if (sys.abort) {
                      return(ALARM_ABORT_CYCLE);
                      break;
                   }
                  } else {
                     return(STATUS_IDLE_ERROR); 
                  }
               } else { 
                  return(STATUS_SETTING_DISABLED);
               }
               return(STATUS_OK);
               break; //'H'
            case 'N' : // Startup lines.
               startup = 2;
               if ( gcode[0][2] < 0x20 ) { // Print startup lines
                  for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
                    if ((settings_read_startup_line(helper_var, gcode[0]))) {
                      report_status_message(STATUS_SETTING_READ_FAIL);
                    } else {
                      report_startup_line(helper_var,gcode[0]);
                    }
                   #if ProtoDebug == -1
                   while(DMA_IsOn(1));
                   dma_printf("gcode[%d]:= %s\n",helper_var,gcode[0]);
                   #endif
                  }
                  //no need to report error on exit, a response has already been
                  //sent to gcode sender
                  query = 1; //report status is ok continue
                  break;
               }else { // Store startup line
                  int N_Val = 0;
                  helper_var = 1;  // Set helper_var to flag storing method.
                  //look for char [0 - 9] and no = sign indicating run line x
                  //extract the value from the string if = is at [2]
                  //[        $  n  =  *value-str ]
                  //[$n=val [0][1][2] *[3]      ]
                   if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
                    char num[] = "0";
                      //extract num char into string
                      num[0] = gcode[0][2];
                      N_Val = atoi(num);
                      
                      #if ProtoDebug == 6
                      while(DMA_IsOn(1));
                      dma_printf("%s\t%d\n",num,N_Val);
                      #endif
                          
                   }else {
                      query = 0; //report bad status
                      status = STATUS_BAD_NUMBER_FORMAT;
                      break;
                   }
                   //$Nn\r\n leads to gocde execute startup line, providng it
                   //has already been saved
                   if (helper_var) { // Store startup line
                       if(gcode[0][3] != '='){
                         // Prepare sending gcode block back to gcode parser
                         // Set helper variable as counter to start of gcode block
                         helper_var = strlen((gcode[0]));
                         strncpy(str,(gcode[0]),helper_var);
                         #if ProtoDebug == 6
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str);
                         #endif
                         //use length to determine if startup line exists
                         //becareful not to put loop here as $Nn will repeat
                         //forever!!!!!!
                         str_len = strlen(str);
                         //after extracting the start line execute it by
                         //returning to the beginning of this function
                         /*if(!strncmp(SL,str,2))
                             goto START_LINE;  */
                       }else{
                        int str_length = 0;
                        // debug to check string argument of startup line
                         #if ProtoDebug == -1
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str);
                         #endif
                         
                         // Prepare saving gcode block to line number 0 | 1
                         settings_store_startup_line(N_Val,str+4);
                         query = 1; //noneed to send erro report
                       }

                    }
               }
               break;
             case '~': //*~ (cycle start)
               sys.execute |= EXEC_CYCLE_START;
               break;
             case '!': //*! (feed hold)
               sys.execute |= EXEC_FEED_HOLD;
               break;
             case 0x18: // *ctrl-x (reset Grbl)
               mc_reset();
               break;

            case '0': case '1': case '2': case'3':  case '4': case '5':
            case '6': case '7': case '8': case '9':
               //extract the value from the string if = is at [2]
               //[        $  n  =  *value-str ]
               //[$n=val [0][1][2] *[3]      ]
               if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
                 char str_val[9]={0};
                 int N_Val = 0;
                 float value = 0.00;
                 if(gcode[0][2] == '='){
                    //$n < 10
                    strncpy(str_val,gcode[0]+1,1);
                    if(isdigit(str_val[0])){N_Val = atoi(str_val);}
                    strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
                 }else if(gcode[0][3] == '='){
                    //$n >= 10
                    strncpy(str_val,gcode[0]+1,2);
                    if(isdigit(str_val[0])){N_Val = atoi(str_val);}
                    memset(str_val,0,9);
                    strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
                 }
                 //check if 1st char is a digit if not value extraction
                 //failed and result will be 0.0 !!! report status bad number
                 if((value < 0.0) || (!isdigit(str_val[0]))){
                     return(STATUS_UNSUPPORTED_STATEMENT);
                 }
                 value = atof(str_val);
                 #if ProtoDebug == 6
                 while(DMA_IsOn(1));
                 dma_printf("%d\t%s\t%f\n",N_Val,str_val,value);
                 #endif
                 settings_store_global_setting(N_Val,value);
                 // if(line[char_counter] != 0) { return(STATUS_UNSUPPORTED_STATEMENT); }
                 // return(settings_store_global_setting(parameter, value));*/
                 query = 1; //noneed to send erro report
                 break;
               }
               query = 3;
               break;
                
       }

     }else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
        switch(*(*gcode+0)+0){
         case 'G':case 'g':
              //1st char usually 'G'
              if (*(*(gcode)+0)=='G'){
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 if(i < 3){ //G00 - G99
                   G_Val = atoi(temp);
                   //Compensation for G28,G30 & G92 have other codes with 
                   //decimal places, resulting in G280,G300 etc
                   if(G_Val == 28 || G_Val == 30 || G_Val == 92)
                      G_Val *= 10;
                 }else{  
                  //G28.1,G30.1 & G92.1 resulting in G281,G301 etc
                   G_Val = (int)(atof(temp)*10.0);
                 }
                 
                 motion_mode = G_Mode(G_Val);
                 #if ProtoDebug == 1
                  PrintDebug(*(*(gcode)+0),temp,&G_Val);
                 #endif
                 

               //get position a
               //G00/G01 X12.5 Y14.7 F0.2;
               //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
               //G10 Lnn Pnn Xnn Ynn Znn offsets can be G10 Pn Rnn Snn
                if(*(*(gcode+1)+0) != 0){
                 no_of_axis++;
                 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                 switch(*(*(gcode+1)+0)) {
                      case 'X':case 'x':
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                       XYZ_Val = atof(temp);
                       status = Instruction_Values(gcode[1],&XYZ_Val);
                       #if ProtoDebug == 1
                         PrintDebug(*gcode[1],temp,&XYZ_Val);
                       #endif
                       break;
                    case 'L':case 'l':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[1],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[1],temp,&O_Val);
                       #endif
                       break;
                    case 'F':case 'f':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[1],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[1],temp,&O_Val);
                       #endif
                       break;
                    case 'P':case 'p':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[1],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[1],temp,&O_Val);
                       #endif
                       break;
                    case 'S':case 's':
                         O_Val = atoi(temp);
                         status = Instruction_Values(gcode[1],&O_Val);
                       #if ProtoDebug == 1
                         PrintDebug(*gcode[1],temp,&O_Val);
                       #endif
                       break;
                 }
                }
                //get position b
               //G00/G01 X12.5 Y14.7 F0.2;
               //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
               //G10 Pnn  toolnumber
                if(*(*(gcode+2)+0) != 0){
                   no_of_axis++;
                   i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
                   switch(*(*(gcode+2)+0)) {
                      case 'X':case 'x':
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[2],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[2],temp,&XYZ_Val);
                         #endif
                         break;
                    case 'L':case 'l':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[2],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[2],temp,&O_Val);
                       #endif
                       break;
                    case 'F':case 'f':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[2],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[2],temp,&O_Val);
                       #endif
                       break;
                    case 'P':case 'p':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[2],&O_Val);
                       #if ProtoDebug == 1
                          PrintDebug(*gcode[2],temp,&O_Val);
                       #endif
                       break;
                    case 'S':case 's':
                         O_Val = atoi(temp);
                         status = Instruction_Values(gcode[2],&O_Val);
                       #if ProtoDebug == 1
                         PrintDebug(*gcode[2],temp,&O_Val);
                       #endif
                       break;
                   }
                }
                  //get  pos c value
                  //G10 X0.00 offset
                  //G02/G03 = R2.0 /  I1.0 / F0.2;
                if(*(*(gcode+3)+0) != 0){
                  no_of_axis++;
                  i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
                   switch(*(*(gcode+3)+0)) {
                      case 'X':case 'x':case 'Y':case 'y':
                      case 'Z':case 'z':case 'R':case 'r':
                      case 'I':case 'i':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[3],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[3],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F': case 'f':
                          O_Val = atoi(temp);
                          status = Instruction_Values(gcode[3],&O_Val);
                         #if ProtoDebug == 1
                          PrintDebug(*gcode[3],temp,&O_Val);
                         #endif
                         break;
                   }
                }

                  //get  pos d value
                  //G10 Y0.00 offset
                  //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+4)+0) != 0){
                  i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
                   switch(*(*(gcode+4))) {
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[4],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[4],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':case 'f':
                           O_Val = atoi(temp);
                           status = Instruction_Values(gcode[4],&O_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[4],temp,&O_Val);
                         #endif
                         break;

                   }
                }
                  //get  pos e value
                  //G10 Z0.00 offset
                  //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+5)+0) != 0){
                  xyz[4] = *(*(gcode+5)+0);no_of_axis++;
                  i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
                   switch(*(*(gcode+5))) {
                      case 'Z':case 'z':
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         Instruction_Values(gcode[5],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[5],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':case 'f':
                         O_Val = atoi(temp);
                         status = Instruction_Values(gcode[5],&O_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[5],temp,&O_Val);
                         #endif
                         break;
                   }
                }
                //get  pos f value; gcodes should not go beyond this
                //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+6)+0) != 0){
                  i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
                   switch(*(*(gcode+6))) {
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[6],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[6],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':case 'f':
                           O_Val = atoi(temp);
                           status = Instruction_Values(gcode[6],&O_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[6],temp,&O_Val);
                         #endif
                         break;

                   }
                }
              }else {
                return;
              }
              break;
         case 'M':
         case 'm':
              //get m instruction
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 M_Val = atoi(temp);
                 M_Instruction(M_Val);     //debugging instructions
                 #if ProtoDebug == 1
                  PrintDebug(gcode[0],temp,&M_Val);
                 #endif

                //get position a
                if((*(gcode+1)) != 0){
                     switch(*(*(gcode+1))){
                       case 'S':
                       case 's':
                       //add more cases when needing more instructions
                           i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                           XYZ_Val = atoi(temp);
                           status = Instruction_Values(gcode[0],&XYZ_Val);
                           #if ProtoDebug == 1
                             PrintDebug(gcode[0],temp,&XYZ_Val);
                           #endif
                           break;
                     }
                }
              break;
         case 'X':case 'x':case 'Y':case 'y':
         case 'Z':case 'z':case 'A':case 'a':
              if(*(*(gcode)+0)=='X'){
                   i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                   XYZ_Val = atof(temp);
                   status = Instruction_Values(gcode[0],&XYZ_Val);
                   #if ProtoDebug == 1
                      PrintDebug(gcode[0],temp,&XYZ_Val);
                   #endif
              }
              //get position b
              //G00/G01 X12.5 Y14.7 F0.2;
              //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
              if(*(*(gcode+1)+0) != 0){
                   xyz[1] = *(*(gcode+1)+0);no_of_axis++;
                   i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                   switch(*(*(gcode+1))) {
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[1],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[1],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                       //  if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[2],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[1],temp,&F_Val);
                         #endif
                        // }
                         break;
                   }
               }
              break;
           case 'F':
             //get g instruction
               if (*(*(gcode)+0)=='F'){
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 F_Val = atoi(temp);
                 status = Instruction_Values(gcode[0],&F_Val);
                 #if ProtoDebug == 1
                    PrintDebug(gcode[6],temp,&F_Val);
                 #endif
               }
              break;

       }
     }
     
     if(query == 1){     status = STATUS_OK;goto end;}
     else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
     else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
     
     ret:
     status = Check_group_multiple_violations();
     end:


    if(!status)
      report_status_message(status);
  }

     
  return status;
}


///////////////////////////////////////////////////////
// Split the string according to the char
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



#if ProtoDebug == 1
static void PrintDebug(char c,char *strB,void *ptr){
int G_Val;
float XYZ_Val;

      switch(c){
         case 'G':case 'g':
         case 'F':case 'f':
         case 'M':case 'm':
         case 'S':case 's':
         case 'P':case 'p':
         case 'L':case 'l':
         case 'T':case 't':
              G_Val = *(int*)ptr;
              while(DMA_IsOn(1));
              dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
              break;
         case 'X':case 'x':
         case 'Y':case 'y':
         case 'Z':case 'z':
         case 'A':case 'a':
              XYZ_Val = *(float*)ptr;
              while(DMA_IsOn(1));
              dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
              break;
         default:break;
      }
  return;
}

#elif ProtoDebug == 2
static void PrintStatus(int state){
  while(DMA_IsOn(1));
  dma_printf("status:= %d\n",state);
}
#endif