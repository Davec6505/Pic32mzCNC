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
/*
G21G91G1X0.991F102
G91 G21
*/

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
float XYZ_Val;
static int motion_mode,str_len,query;
int status;
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val,O_Val,P_Val;
unsigned char *ptr;
char str[64];
char temp[9];
char xyz[6];
int F_1_Once=0,no_of_axis=0;
int axis_to_run = 0;

  num_of_strings = 0;
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
         #if ProtoDebug == 6
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
    num_of_strings = strsplit2(gcode,str,0x20);

    str_len = strlen(gcode[0]);
    
    #if ProtoDebug == 16
    while(DMA_IsOn(1));
    dma_printf("noOfstrs:= %d\t%s:=\t%d\t%s:=\t%d\t%s:=\t%d\t%s:=\t%d\n"
               ,num_of_strings
               ,gcode[0],str_len
               ,gcode[1],str_len
               ,gcode[2],str_len
               ,gcode[3],str_len);
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
       goto report;
     }
     
     #if ProtoDebug == 7
     while(DMA_IsOn(1));
     dma_printf("%s\t%d\n",gcode[0],str_len);
     #endif
     
     if(gcode[0][0] =='?'){
        startup = 0;
        if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
             bit_true(sys.execute,EXEC_STATUS_REPORT);
        goto end;
     }else if(gcode[0][0] =='$'){
       int helper_var;
       if(str_len < 2){
          report_grbl_help();
          query = 1;
          goto report;
       }
       switch(gcode[0][1]){
            case '?': // Prints Grbl setting
              report_grbl_help();
              query = 1;
              break;
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
                //will report the current status of the machine after it is asked
                //for gcode_report
                if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
                    bit_true(sys.execute,EXEC_STATUS_REPORT);
                query = 1;
                break;
            case 'C' : // Set check g-code mode
                startup = 2; //for 1st scan to get ugs to connect
                // Perform reset when toggling off. Check g-code mode should only work if Grbl
                // is idle and ready, regardless of alarm locks. This is mainly to keep things
                // simple and consistent.
                if ( sys.state == STATE_CHECK_MODE ) {
                  mc_reset();
                  report_feedback_message(MESSAGE_DISABLED);
                  goto end;
                } else {
                  //if not in idle then ignore request
                  if (sys.state) { 
                    query = 4;
                    goto report;//return(STATUS_IDLE_ERROR); 
                  }
                  //only in idle will this respond
                  sys.state = STATE_CHECK_MODE;
                  report_feedback_message(MESSAGE_ENABLED);
                }
                query = 1;
                goto report;
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
            case 'H' : // Perform homing cycle $H
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
                      query = 5; //ALARM_ABORT
                      break;
                   }
                  } else {
                     query = 6;//return(STATUS_IDLE_ERROR);
                     break;
                  }
               } else { 
                  query = 7;//return(STATUS_SETTING_DISABLED);
                  break;
               }
               FAIL(STATUS_OK);
               goto end;
               break;
            case 'N' : // Startup lines. $N
               startup = 2;
               if ( gcode[0][2] < 0x20 ) { // Print startup lines
                  for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
                    if ((settings_read_startup_line(helper_var, gcode[0]))) {
                      //report_status_message(STATUS_SETTING_READ_FAIL);
                      query = 8;
                    } else {
                      report_startup_line(helper_var,gcode[0]);
                      query = 1; //report status is ok continue
                    }
                   #if ProtoDebug == 6
                   while(DMA_IsOn(1));
                   dma_printf("gcode[%d]:= %s\n",helper_var,gcode[0]);
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
                      query = 2; //STATUS_BAD_NUMBER_FORMAT;
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
                         #if ProtoDebug == 6
                          while(DMA_IsOn(1));
                          dma_printf("%s\n",str);
                         #endif
                         
                         // Prepare saving gcode block to line number 0 | 1
                         settings_store_startup_line(N_Val,str+4);
                       }

                    }
               }
               query = 1; //STATUS_OK;
               break;
             case '~': //*~ (cycle start)
               sys.execute |= EXEC_CYCLE_START;
               query = 1;  //STATUS_OK
               break;
             case '!': //*! (feed hold)
               sys.execute |= EXEC_FEED_HOLD;
               break;
               query = 1;  //STATUS_OK
             case 0x18: // *ctrl-x (reset Grbl)
               mc_reset();
               query = 1;  //STATUS_OK
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
                     query = 3;//STATUS_UNSUPPORTED_STATEMENT
                 }
                 value = atof(str_val);
                 #if ProtoDebug == 6
                 while(DMA_IsOn(1));
                 dma_printf("%d\t%s\t%f\n",N_Val,str_val,value);
                 #endif
                 settings_store_global_setting(N_Val,value);
                 // if(line[char_counter] != 0) { return(STATUS_UNSUPPORTED_STATEMENT); }
                 // return(settings_store_global_setting(parameter, value));*/
                 query = 1;
               }
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
                 #if ProtoDebug == 1
                 dma_printf("no_of_axis:= %d\n",no_of_axis);
                 #endif
                 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                 switch(*(*(gcode+1)+0)) {
                      case 'G':case 'g':
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
                        break;
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
                   i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
                   switch(*(*(gcode+2)+0)) {
                      case 'G':case 'g':
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
                        break;
                      case 'X':case 'x':
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                         no_of_axis++;
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
                     i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
                     switch(*(*(gcode+3)+0)) {
                          case 'G':case 'g':
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
                        break;
                      case 'X':case 'x':case 'Y':case 'y':
                      case 'Z':case 'z':case 'R':case 'r':
                      case 'I':case 'i':
                         no_of_axis++;
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
              query = 20;
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
              query = 20;
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
              query = 20;
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
              query = STATUS_COMMAND_EXECUTE_MOTION;
              break;
       }
     }
     report:
     if(query == 1){status = STATUS_OK;}
     else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
     else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
     else if(query == 4){status = STATUS_IDLE_ERROR;}
     else if(query == 5){status = ALARM_ABORT_CYCLE;}
     else if(query == 6){status = STATUS_IDLE_ERROR;}
     else if(query == 7){status = STATUS_SETTING_DISABLED;}
     else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
     else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
     
     //report on status messages
     report_status_message(status);
     goto end;
     
     //use group violations for modal and non_modal functionality
     ret:
     status = Check_group_multiple_violations();
     
  }
  //block end for status returns
  end:
  return status;
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
      sys.abort = false;
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