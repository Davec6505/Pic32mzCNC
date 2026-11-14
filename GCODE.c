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

//parser state before the current block, restored if the block is rejected
static parser_state_t gc_saved;
static int motion_mode_saved;
static axis_combination axis_xyz_saved;
static char cir_saved;

/////////////////////////////////////////////////////////////
//                file scope functions                     //
/////////////////////////////////////////////////////////////
static float To_Millimeters(float value){
  return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
}

//select the working plane
static void Select_Plane(int axis_combo){
   axis_xyz = axis_combo;
   switch(axis_combo){
     case AXIS_XZ: gc.plane_axis_0 = X; gc.plane_axis_1 = Z; gc.plane_axis_2 = Y; break;
     case AXIS_YZ: gc.plane_axis_0 = Y; gc.plane_axis_1 = Z; gc.plane_axis_2 = X; break;
     default:      gc.plane_axis_0 = X; gc.plane_axis_1 = Y; gc.plane_axis_2 = Z; break;
   }
}

//make the stored recipe for G54..G59 (1..6) the active work offset
static void Load_Coord_System(int select){
   settings_read_coord_data();
   memcpy(gc.coord_system,coord_system[select-1].coord,sizeof(gc.coord_system));
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
  motion_mode = gc.motion_mode = MOTION_MODE_SEEK;
  Select_Plane(AXIS_XY);
  gc.coord_select = 1;
  Load_Coord_System(gc.coord_select);
  clear_vector(gc.coord_offset);
}

//a rejected block must leave the modal state as it was
void G_Save_State(){
  memcpy(&gc_saved,&gc,sizeof(parser_state_t));
  motion_mode_saved = motion_mode;
  axis_xyz_saved = axis_xyz;
  cir_saved = SV.cir;
}

void G_Restore_State(){
  memcpy(&gc,&gc_saved,sizeof(parser_state_t));
  motion_mode = motion_mode_saved;
  axis_xyz = axis_xyz_saved;
  SV.cir = cir_saved;
}

//clear everything that only lives for one block, called before parsing a line
void G_Begin_Block(){
  Rst_modalgroup();
  Rst_non_modalword();
  Rst_Axisword();
  non_modal_action = NON_MODAL_NONE;
  gc.absolute_override = false;
  gc.P = gc.S = gc.L = -1;
  gc.R = gc.I = gc.J = gc.K = 0.0;
  gc.dwell = -1.0;
  gc.r = 0;
  gc.program_flow = PROGRAM_FLOW_RUNNING;
  FAIL(STATUS_OK);
}

//program end M2/M30 restores these modes, as Grbl does
void G_Program_End(){
  motion_mode = gc.motion_mode = MOTION_MODE_LINEAR;
  Select_Plane(AXIS_XY);
  gc.absolute_mode = 1;
  gc.inverse_feed_rate_mode = false;
  gc.coord_select = 1;
  Load_Coord_System(gc.coord_select);
  clear_vector(gc.coord_offset);
  gc.spindle_direction = 0;
  gc.coolant_mode = COOLANT_DISABLE;
  gc.program_flow = PROGRAM_FLOW_RUNNING;
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
//Gcodes {G 0,1,2,3,80} etc. Each modal group may appear only once per block.
int G_Mode(int mode){
int grp;
 non_modal_action = NON_MODAL_NONE;
 grp = Set_Modal_Groups(mode);
 Set_Motion_Mode(mode);
 if(status_code == STATUS_OK){
   if(bit_istrue(modal_group_words,bit(grp))){
     FAIL(STATUS_MODAL_GROUP_VIOLATION);
   }else{
     bit_true(modal_group_words,bit(grp));
     if(non_modal_action != NON_MODAL_NONE)
       bit_true(non_modal_words,bit(non_modal_action));
   }
 }
 group_number = grp;
 return mode;
}

///////////////////////////////////////////////////////////////
//MCodes
int M_Mode(int flow){
int grp;
 grp = Set_M_Modal_Commands(flow);
 m_flow = Set_M_Commands(flow);
 if(status_code == STATUS_OK && grp != MODAL_GROUP_NONE){
   if(bit_istrue(modal_group_words,bit(grp)))
     FAIL(STATUS_MODAL_GROUP_VIOLATION);
   else
     bit_true(modal_group_words,bit(grp));
 }
 group_number = grp;
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
int gp_num = MODAL_GROUP_NONE;
  switch(mode) {
    case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920: case 921:
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

//set the G commands as per grbl, modal state changes take effect while parsing
static int Set_Motion_Mode(int mode){
 FAIL(STATUS_OK);

  switch(mode){
    case 0: motion_mode = MOTION_MODE_SEEK;SV.cir = 0;    break;
    case 1: motion_mode = MOTION_MODE_LINEAR;SV.cir = 0;  break;
    case 2: motion_mode = MOTION_MODE_CW_ARC;gc.DIR = CW;SV.cir = 1;  break;
    case 3: motion_mode = MOTION_MODE_CCW_ARC;gc.DIR = CCW;SV.cir = 1; break;
    case 80: motion_mode = MOTION_MODE_CANCEL; break;
    case 4: non_modal_action  = NON_MODAL_DWELL;     break;
    case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
    case 17: Select_Plane(AXIS_XY); break;
    case 18: Select_Plane(AXIS_XZ); break;
    case 19: Select_Plane(AXIS_YZ); break;
    case 20: gc.inches_mode = 1; break;
    case 21: gc.inches_mode = 0; break;
    case 53: gc.absolute_override = true; break;
    case 54: case 55: case 56: case 57: case 58: case 59:
             gc.coord_select = (mode - 53);//G54-53 == 1...;
             Load_Coord_System(gc.coord_select);
             break;
    case 90: gc.absolute_mode = 1; break;
    case 91: gc.absolute_mode = 0; break;
    // TODO: G93 inverse time feed needs the step engine to time each block.
    case 93: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
    case 94: gc.inverse_feed_rate_mode = false; break;
    case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
    case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
    case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
    case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
    case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
    case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
  }
  gc.motion_mode = motion_mode;

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
   return motion_mode;
}

///////////////////////////////////////////////////////////////
//                      M COMMANDS                           //
///////////////////////////////////////////////////////////////
static int Set_M_Modal_Commands(int flow){
int m_num = MODAL_GROUP_NONE;
// Set modal group values
   switch(flow) {
     case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
     case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
   }
   return m_num;
}

//M Commands, anything without physical behaviour yet replies error:20
static int Set_M_Commands(int flow){
  FAIL(STATUS_OK);
// Set 'M' commands
  switch(flow) {
    case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause, '~' resumes
    case 1: break; // Optional stop not supported. Ignore.
    case 2:
    case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
    // TODO: M3/M4 need the spindle output driven.
    case 3: case 4: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
    case 5: gc.spindle_direction = 0; break;
    // TODO: M7/M8 need the coolant outputs driven.
    case 7: case 8: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
    case 9: gc.coolant_mode = COOLANT_DISABLE; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
  }
  return flow;
}

///////////////////////////////////////////////////////////////
//               MODAL GROUP COMMANND CHECK                  //
///////////////////////////////////////////////////////////////

// End of block checks once every word has been parsed
int Check_group_multiple_violations(){
 if(status_code != STATUS_OK)
   return status_code;

 // G80 cancels motion, axis words with it have nothing to drive
 if(motion_mode == MOTION_MODE_CANCEL && axis_words &&
    bit_istrue(modal_group_words,bit(MODAL_GROUP_1)))
   FAIL(STATUS_INVALID_STATEMENT);

 // G10, G28, G30 and G92 consume the axis words, so two of them can't share a block
 if(bit_istrue(modal_group_words,bit(MODAL_GROUP_0)) &&
    bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) && axis_words &&
    (non_modal_words & ~bit(NON_MODAL_DWELL)))
   FAIL(STATUS_MODAL_GROUP_VIOLATION);

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
            gc.I = To_Millimeters(XYZ_Val);
         //   gc.offset[gc.I] = To_Millimeters(XYZ_Val);
            break;
      case 'J':
            XYZ_Val = *(float*)any;
            gc.J = To_Millimeters(XYZ_Val);
          //  gc.offset[gc.J] = To_Millimeters(XYZ_Val);
            break;
      case 'K':
            XYZ_Val = *(float*)any;
            gc.K = To_Millimeters(XYZ_Val);
         //   gc.offset[gc.K] = To_Millimeters(XYZ_Val);
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