/*******************************************************************************
*************  RepRap Commonly used parameter qualifiers are :  ****************
*Pnnn or Paaa - Main parameter
*Rnnn - other parameter
*Snnn - other parameter, also often used to modify command behaviour (S0~S9)
*Tnnn - typically Tool number, trigger number for M581 and M582
*Xnnn, Ynnn, Znnn - parameter associated with an axis
*Fnnn - feedrate
*Hnnn or Hn:n:n - Height or Heater/sensor number
*En or En:n:n - Parameter associated with extruder 0,1, etc. to 5
*Dn or Dn:n:n - Extruder drive -For extruders E0 correspond to drive 0, 
                E1 to drive 1 (M563)
*Rn - enable value - for different hardware needing positive or negative
      signal to be enabled - M569
*Bnnn - Safe printing radius (M665), baud rate (M575)
*Wnnn - Maximum value of accumulated Integral - M301 & M304
*Sometimes a "-1" value is used to cancel a command
*******************************************************************************/
#include "GCODE.h"



//the use of volatile here is as a result of the compiler continously
//optomising out these variables cousing the code to fail or values not
//changing when required, either by gcodes or code!! MIKROC!!!! a need to
//understand this compiler better!!!!!!

volatile float coord_data[NoOfAxis];

int axis_words             absolute 0xA0002602 ;  // Bitflag to track which XYZ(ABC) parameters exist in block
int modal_group_words      absolute 0xA0002604 ;  // Bitflag variable to track and check modal group words in block
int non_modal_words        absolute 0xA0002606 ;  // Bitflags to track non-modal actions
int m_flow                 absolute 0xA0002608 ;
int non_modal_action       absolute 0xA0002610 ;
int motion_mode            absolute 0xA0002612 ;
int group_number           absolute 0xA0002614 ;
int status_code            absolute 0xA0002616 ;  // Status of instructions


volatile int int_value;
volatile float inverse_feed_rate;       // negative inverse_feed_rate means no inverse_feed_rate specified
volatile float value;

/////////////////////////////////////////////////////////////
//                file scope functions                     //
/////////////////////////////////////////////////////////////
static float To_Millimeters(float value){
  return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
}

//select the working plane
static void Select_Plane(int axis_combo){
   axis_xyz = axis_combo;
}

/////////////////////////////////////////////////////////////
//                GLOBAL SCOPE FUNCTIONS                   //
/////////////////////////////////////////////////////////////

//init vals to defaults
void G_Initialise(){
  m_flow               = 0;
  group_number         = 0;
  axis_words           = 0;
  int_value            = 0;
  value                = 0;
  gc.inverse_feed_rate_mode = false;
  gc.absolute_override = false;
  gc.absolute_mode     = 1;
}

//status code failures
void FAIL(int status){
  status_code = status;
}

int  GET_FAIL(){
  return status_code;
}

int  SET_FAIL(int val){
  status_code = val;
}

//Set Modal group manually.... typically for homing
//instruction in protocol $H etc...
void Set_modalgroup(int value){
  bit_true( modal_group_words,bit( value));
}

//Modal group as per RS274NGC Spec
int Get_modalgroup(){
  return modal_group_words;
}

int Rst_modalgroup(){
   modal_group_words = 0;
   return modal_group_words;
}


//Set Modal group manually.... typically for homing
//instruction in protocol $H etc...
void Set_non_modalword(int value){
  bit_true( non_modal_words,bit( value));
}

//modal modes within each group
int Get_non_modalword(){
  return non_modal_words;
}

int Rst_non_modalword(){
   non_modal_words = 0;
   return non_modal_words;
}


//Set axis_words group manually.... typically for homing
//instruction in protocol $H etc...
void Set_Axisword(int value){
  bit_true( axis_words,bit( value));
}

//Set the axis word to a specific value instead of a bit
/*static void Set_Axisword(int value){
  axis_words = value;
}*/

//Axis to run
int Get_Axisword(){
  return axis_words & 0x0fff;
}

int Rst_Axisword(){
  axis_words = 0;
  return axis_words;
}

//motion mode instruvtion is extracted from G e.g. G0 G1 ect.
int Get_motionmode(){
  return motion_mode;
}

int Rst_motionmode(){
  motion_mode = 0;
  return motion_mode;
}

///////////////////////////////////////////////////////////////
//Gcodes {G 0,1,2,3,80}
int G_Mode(int mode){
 group_number = Set_Modal_Groups(mode);
 motion_mode  = Set_Motion_Mode(mode);
 return mode;//motion_mode;
}

///////////////////////////////////////////////////////////////
//MCodes
int M_Mode(int flow){
 group_number = Set_M_Modal_Commands(flow);
 m_flow = Set_M_Commands(flow);
#if GcodeDebug == 1
 while(DMA_IsOn(1));
 dma_printf("flow:= %d\n",flow);
#endif
 return flow;
}


/////////////////////////////////////////////////////////////
//                        G COMMANDS                       //
/////////////////////////////////////////////////////////////
//Set the modal group values taken directly from grbl
static int Set_Modal_Groups(int mode){
int gp_num;
  switch(mode) {
    case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
          gp_num = MODAL_GROUP_0; break;
    case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
    case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
    case 90: case 91: gp_num = MODAL_GROUP_3; break;
    case 93: case 94: gp_num = MODAL_GROUP_5; break;
    case 20: case 21: gp_num = MODAL_GROUP_6; break;
    case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
  }
  return gp_num;
}

//set the G commands as per grbl
static int Set_Motion_Mode(int mode){
int i,m_mode;
 FAIL(STATUS_OK);
 
  switch(mode){
    case 0: m_mode    = MOTION_MODE_SEEK;SV.cir = 0;    break;
    case 1: m_mode    = MOTION_MODE_LINEAR;SV.cir = 0;  break;
    case 2: m_mode    = MOTION_MODE_CW_ARC;gc.DIR = CW;SV.cir = 1;  break;
    case 3: m_mode    = MOTION_MODE_CCW_ARC;gc.DIR = CCW;SV.cir = 1; break;
    case 4: non_modal_action  = NON_MODAL_DWELL;     break;
    case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
    case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
    case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
    case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
    case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
    case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
    case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
    case 54: case 55: case 56: case 57: case 58: case 59:
             gc.coord_select = (mode - 53);//G54-53 == 1...;
             m_mode = MOTION_MODE_NULL;break;
    case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
    case 90: gc.absolute_mode = 1; m_mode = MOTION_MODE_NULL; break;
    case 91: gc.absolute_mode = 0; m_mode = MOTION_MODE_NULL; break;
    case 93: gc.inverse_feed_rate_mode = true; m_mode = MOTION_MODE_NULL; break;
    case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
    case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
    case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
    case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
    case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
    case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
    case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
  }

  // [G0,G1,G2,G3,G80]: Perform motion modes.
  // NOTE: Commands G10,G28,G30,G92 lock out and prevent axis words from use in motion modes.
  // Enter motion modes only if there are axis words or a motion mode command word in the block.
  if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
    // G1,G2,G3 require F word in inverse time mode.
    if ( gc.inverse_feed_rate_mode ) {
      if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
        FAIL(STATUS_INVALID_STATEMENT);
      }
    }
    // Absolute override G53 only valid with G0 and G1 active.
    if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
      FAIL(STATUS_INVALID_STATEMENT);
    }

  }
 
#if GcodeDebug == 2
while(DMA_IsOn(1));
dma_printf("\
<report!\n\
[status_code:= %d]\n\
[mode:= %d]\n\
[motion_mode:= %d]\n\
[non_modal_action:= %d]\n\
[gc.absolute_mode:= %d]\n"
,status_code ,mode ,motion_mode ,non_modal_action,(int)gc.absolute_mode);
  #endif
  #if GcodeDebug == 3
  //test if axis_word will run arc
  while(DMA_IsOn(1));
  dma_printf("axis_words:= %d\n",axis_words&0x00ff);
  #endif
   return m_mode;
}

///////////////////////////////////////////////////////////////
//                      M COMMANDS                           //
///////////////////////////////////////////////////////////////
static int Set_M_Modal_Commands(int flow){
int m_num;
// Set modal group values
   switch(flow) {
     case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
     case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
   }
   return m_num;
}

//M Commands
static int Set_M_Commands(int flow){
  FAIL(STATUS_OK);
// Set 'M' commands
  switch(flow) {
    case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
    case 1: break; // Optional stop not supported. Ignore.
    case 2:
    case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
    case 3: gc.spindle_direction = 1; break;
    case 4: gc.spindle_direction = -1; break;
    case 5: gc.spindle_direction = 0; break;
    #ifdef ENABLE_M7
      case 7: gc.coolant_mode = COOLANT_MIST_ENABLE; break;
    #endif
    case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
    case 9: gc.coolant_mode = COOLANT_DISABLE; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
  }
  return flow;
}

///////////////////////////////////////////////////////////////
//               MODAL GROUP COMMANND CHECK                  //
///////////////////////////////////////////////////////////////

// Check for modal group multiple command violations in
// the current block
int Check_group_multiple_violations(){
static int last_group_number,last_non_modal_action;
int i = 0;
    //A machining system may be in many modes at the same time,
    // with one mode from each modal group being in effect.
    //non modal codes have effect only on the lines on which they occur
    //these codes will need the full instruction in one line
 if(group_number == MODAL_GROUP_NONE){
   FAIL(STATUS_MODAL_GROUP_VIOLATION);
   return STATUS_MODAL_GROUP_VIOLATION;
 }
 
 if(group_number > 0) {
   
   if(group_number != last_group_number)
      Rst_modalgroup();
      
   bit_true(modal_group_words,bit(group_number));

   last_group_number = group_number;
   
   /////////////////////////////////////////////////////////////
   //NON MODAL ACTION
   if (group_number == MODAL_GROUP_0){
     //if the non modal action has changed reset its state
     ///if(non_modal_action != last_non_modal_action){
     Rst_non_modalword();
     
     if(!gc.absolute_override)
         bit_true( non_modal_words,bit( non_modal_action));
       
     last_non_modal_action = non_modal_action;
     return status_code;
   }
   //NON MODAL END
   //////////////////////////////////////////////////////////////
   
   //////////////////////////////////////////////////////////////
   //MODAL ACTIONS
   //check for cancel from group 1
   if(group_number == MODAL_GROUP_1){
      //motion_mode holds movement set in G_Mode()!!
       switch (motion_mode) {
          case MOTION_MODE_SEEK:
               gc.feed_rate = settings.default_seek_rate;
          case MOTION_MODE_LINEAR:
             FAIL(STATUS_OK);
            break;
          case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
            FAIL(STATUS_OK);
            // Check if at least one of the axes of the selected plane has been specified. If in center
            // format arc mode, also check for at least one of the IJK axes of the selected plane was sent.
            //set axis_word to 15 this tells modal_function1(axis_words)
            //to run arc interpolation
              for(i=0;i<=3;i++)
                  Set_Axisword(i);
              
              /*  
              if ( !( bit_isfalse(axis_words,bit(gc.plane_axis_2)) ) ||
                 ( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
                         FAIL(STATUS_INVALID_STATEMENT);
              }
              */
              #if GcodeDebug == 3
              //test if axis_word will run arc
              while(DMA_IsOn(1));
              dma_printf("%s\taxis_words:= %d\n","ARC",axis_words&0x00ff);
              #endif

            break;
          case MOTION_MODE_CANCEL:
            FAIL(STATUS_OK);
            // No axis words allowed while active.
            if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
            break;
       }
       
       //keep track of current position
       for(i=0;i<NoOfAxis;i++){
          gc.position[i] =  gc.next_position[i];
       }
   }
   
   //check that Plane select is not out of scope
   if (group_number == MODAL_GROUP_2){
     FAIL(STATUS_OK);
     
     if(axis_xyz > NO_OF_PLANES){
       status_code = STATUS_INVALID_STATEMENT;
       FAIL(STATUS_INVALID_STATEMENT);
     }
     
     return status_code;
   }
   
   //incrmental / absolute
   if (group_number == MODAL_GROUP_3){
     FAIL(STATUS_OK);
     return status_code;
   }
   
      //feedratemode - not yet implimented!! understanding needed
   if (group_number == MODAL_GROUP_5){
     FAIL(STATUS_OK);
     return status_code;
   }
   
   //UNITS mm / inches gc.inches_mode
   if (group_number == MODAL_GROUP_6){
     FAIL(STATUS_OK);
     return status_code;
   }
   
   //G54.... Coordinate system selection
   if (group_number == MODAL_GROUP_12){
     FAIL(STATUS_OK);
     
     if(gc.coord_select < 0 || gc.coord_select > 7)
        FAIL(STATUS_BAD_NUMBER_FORMAT);

     return status_code;
   }
 }
  //MODAL END
  
  //////////////////////////////////////////////////////////////
  //if you made it this far then somrthin is wrong
  return status_code;
}

////////////////////////////////////////////////////////////////
//               {X,Y,Z,A} Movement values                    //
////////////////////////////////////////////////////////////////
int Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,O_Val;
   FAIL(STATUS_OK);
   switch(c[0]){
      case 'X':case 'x':
            XYZ_Val = *(float*)any;
            gc.next_position[X] = To_Millimeters(XYZ_Val);
            bit_true(axis_words,bit(X));
            break;
      case 'Y':
            XYZ_Val = *(float*)any;
            gc.next_position[Y] = To_Millimeters(XYZ_Val);
            bit_true(axis_words,bit(Y));
            break;
      case 'Z':
            XYZ_Val = *(float*)any;
            gc.next_position[Z] = To_Millimeters(XYZ_Val);
            bit_true(axis_words,bit(Z));
            break;
      case 'A':
            XYZ_Val = *(float*)any;
            gc.next_position[A] = To_Millimeters(XYZ_Val);
            bit_true(axis_words,bit(A));
            break;
      case 'E':
            XYZ_Val = *(float*)any;
            gc.next_position[B] = To_Millimeters(XYZ_Val);
            bit_true(axis_words,bit(B));
            break;
      case 'R':
            XYZ_Val = *(float*)any;
            gc.R = To_Millimeters(XYZ_Val);
            break;
      case 'I':
            gc.r = 0;
            gc.R = 0;
            XYZ_Val = *(float*)any;
            gc.I = XYZ_Val;
            gc.offset[I] = To_Millimeters(XYZ_Val);
            break;
      case 'J':
            XYZ_Val = *(float*)any;
            gc.J = XYZ_Val;
            gc.offset[J] = To_Millimeters(XYZ_Val);
            break;
      case 'K':
            XYZ_Val = *(float*)any;
            gc.K = XYZ_Val;
            gc.offset[K] = To_Millimeters(XYZ_Val);
            break;
      case 'F':
            XYZ_Val = *(float*)any;
            if(XYZ_Val < 0){FAIL(STATUS_SPEED_ERROR);break;}
            //inches or mm decision
            gc.feed_rate = To_Millimeters(XYZ_Val);

            #if GcodeDebug == 10
            while(DMA_IsOn(1));
            dma_printf("gc.feed_rate:= %f\n",gc.feed_rate);
            #endif
            break;
      case 'P':
            O_Val = *(int*)any;
            if(O_Val < 0){
               FAIL(STATUS_SPEED_ERROR);
            }
            gc.P = O_Val;
            gc.S = -1;
            break;
      case 'S':
            O_Val = *(int*)any;
            if(O_Val < 0){
               FAIL(STATUS_SPEED_ERROR);
            }
            gc.S = O_Val;
            gc.P = -1;
            break;
      case 'L':
            O_Val = *(int*)any;
            if(O_Val < 0){
               FAIL(STATUS_SPEED_ERROR);
            }
            gc.L = O_Val;
       break; //L2 tells the G10 we�re setting standard work offsets
      default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
   }
  #if GcodeDebug == 1
      while(DMA_IsOn(1));
      if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
         dma_printf("[%c\t%f]\n",c[0],XYZ_Val);
      else if(c[0] == 'F')
         dma_printf("[%c\t%d]\n",c[0],F_Val);
      else if(c[0] == 'S' ||  c[0] == 'P' || c[0] == 'L')
         dma_printf("[%c\t%d]\n",c[0],O_Val);
  #endif
  #if GcodeDebug == 3
  //test if axis_word will run arc
  while(DMA_IsOn(1));
  dma_printf("axis_words:= %d\n",axis_words&0x00ff);
  #endif
  return status_code;
}