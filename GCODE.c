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

parser_state_t gc;

#define FAIL(status) status_code = status;

float coord_data[NoOfAxis];

static volatile char axis_words;        // Bitflag to track which XYZ(ABC) parameters exist in block
static char absolute_override;
static volatile int modal_group_words;  // Bitflag variable to track and check modal group words in block
static volatile int non_modal_words;    // Bitflags to track non-modal actions
static volatile int status_code;             // Status of instructions
static volatile int motion_mode;
int group_number;
int non_modal_action;

int int_value;
float inverse_feed_rate;       // negative inverse_feed_rate means no inverse_feed_rate specified
float value;

/////////////////////////////////////////////////////////
//                GLOBAL SCOPE FUNCTIONS               //
/////////////////////////////////////////////////////////
//init vals to defaults
void G_Initialise(){
  group_number      = 0;
  axis_words        = 0;
  int_value         = 0;
  value             = 0;
  inverse_feed_rate = false;
  absolute_override = 0;
}

//Modal group as per RS274NGC Spec
int Get_modalgroup(){
  return modal_group_words;
}

int Rst_modalgroup(){
   modal_group_words = 0;
   return modal_group_words;
}

//modal modes within each group
int Get_modalword(){
  return non_modal_words;
}

int Rst_modalword(){
   non_modal_words = 0;
   return non_modal_words;
}

//Axis to run
int Get_Axisword(){
  return (int)axis_words & 0x00ff;
}

int Rst_Axisword(){
  axis_words=0;
  return (int)axis_words;
}

//motion mode instruvtion is extracted from G e.g. G0 G1 ect.
int Get_motionmode(){
  return motion_mode;
}

int Rst_motionmode(){
  motion_mode = 0;
  return motion_mode;
}

//Gcodes {G 0,1,2,3,80}
int G_Mode(int mode){
 gc.inches_mode = 0;//temp for debugging
 group_number = Set_Modal_Groups(mode);
 motion_mode = Set_Motion_Mode(mode);
 return motion_mode;
}

//MCodes
void M_Instruction(int flow){
//gc.program_flow = flow;
 Set_M_Modal_Commands(flow);
 Set_M_Commands(flow);
#if GcodeDebug == 1
 while(DMA_Busy(1));
 dma_printf("gc.program_flow:= %d\n",flow);
#endif
}

///////////////////////////////////////////////////////
//           MOVEMENT INSTRUCTIONS                   //
///////////////////////////////////////////////////////
// Check for modal group multiple command violations in the current block
int Check_group_multiple_violations(){
static int last_group_number,last_non_modal_action;
int i = 0;
    //A machining system may be in many modes at the same time,
    // with one mode from each modal group being in effect.
    //non modal codes have effect only on the lines on which they occur
    //these codes will need the full instruction in one line
 if(group_number > 0) {
 
   FAIL(STATUS_OK);
   if(group_number == MODAL_GROUP_NONE)
      FAIL(STATUS_MODAL_GROUP_VIOLATION);
   
   if(group_number != last_group_number)
      Rst_modalgroup();
      
   bit_true(modal_group_words,bit(group_number));

   #if GcodeDebug == 2
     while(DMA_Busy(1));
     dma_printf("group_number:= %d\n",group_number);
   #endif
   
   last_group_number = group_number;
   if (group_number == MODAL_GROUP_0){
     //if the non modal action has changed reset its state
     if(non_modal_action != last_non_modal_action){
        Rst_modalword();
        bit_true( non_modal_words,bit( non_modal_action));
     }
     #if GcodeDebug == 2
       while(DMA_Busy(1));
       dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
       non_modal_action,non_modal_words);
     #endif
     last_non_modal_action = non_modal_action;
     return status_code;
   }
 }

  // Convert all target position data to machine coordinates for executing motion. Apply
  // absolute mode coordinate offsets or incremental mode offsets.
  // NOTE: Tool offsets may be appended to these conversions when/if this feature is added.
  for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
      if ( bit_istrue(axis_words,bit(i))) {
        if (!absolute_override) { // Do not update target in absolute override mode
          if (gc.absolute_mode) {
            gc.next_position[i] += gc.position[i] + gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
          } else {
            //assuming gc.next position doesnt go to 0.00 when finnishing a move!!!
            //however it is being reset????
            gc.next_position[i] + gc.coord_offset[i]; // Incremental mode
          }
        }
      } else {
        gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
      }
  }

//Motion mode for movement set in 1st and 2nd switch statememnts within
//this function

 switch (motion_mode) {

    case MOTION_MODE_CANCEL:
      if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
      break;
    case MOTION_MODE_SEEK:
      if (axis_words == 0) {
         FAIL(STATUS_INVALID_STATEMENT);
      }else {
         //single axis interpolate at max speed, can be multiple axis at the
         //same time
          gc.frequency = 5000;//settings.default_seek_rate;
          FAIL(STATUS_OK);
      }
      break;
    case MOTION_MODE_LINEAR:
      // TODO: Inverse time requires F-word with each statement. Need to do a check. Also need
      // to check for initial F-word upon startup. Maybe just set to zero upon initialization
      // and after an inverse time move and then check for non-zero feed rate each time. This
      // should be efficient and effective.
      #if GcodeDebug == 2
       while(DMA_Busy(1));
       dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
      #endif
      if (axis_words == 0) {
         FAIL(STATUS_INVALID_STATEMENT);
      }else {
        //run the new line here , consider planner for future
          FAIL(STATUS_OK);
      }
      break;
    case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
      // Check if at least one of the axes of the selected plane has been specified. If in center
      // format arc mode, also check for at least one of the IJK axes of the selected plane was sent.
      if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
           ( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
        FAIL(STATUS_INVALID_STATEMENT);
      } else {
        if (gc.R != 0) {
           // Arc Mode radius is passed over to the arc function
           asm{nop;}
        }
      }
      break;
 }
 //track current position
 for(i=0;i<NoOfAxis;i++){
    gc.position[i] =  gc.next_position[i];
 }

  return status_code;
}

//{X,Y,Z,A} Movement values
int Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,O_Val;

   switch(c[0]){
      case 'X':
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
            F_Val = *(int*)any;
            if(F_Val < 0){
               FAIL(STATUS_SPEED_ERROR);
            }
            /* still tobe implimented <need to understand how speed is sent?>
            if (gc.inverse_feed_rate_mode) {
              inverse_feed_rate = To_Millimeters(F_Val); // seconds per motion for this motion only
            } else {
              gc.feed_rate = To_Millimeters(F_Val); // millimeters per minute
            } */
            gc.frequency = F_Val;
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
       break; //L2 tells the G10 we’re setting standard work offsets
      default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
   }
  #if GcodeDebug == 1
      while(DMA_Busy(1));
      if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
         dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
      else if(c[0] == 'F')
         dma_printf("\t%c\t%d\n",c[0],F_Val);
      else if(c[0] == 'S' ||  c[0] == 'P' || c[0] == 'L')
         dma_printf("\t%c\t%d\n",c[0],O_Val);
  #endif
  return status_code;
}

/////////////////////////////////////////////////////////////
//                file scope functions                     //
/////////////////////////////////////////////////////////////
static float To_Millimeters(float value){
  return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
}

//select the working plane
static void Select_Plane(long x,long y,long z){
  gc.position[X] = x/settings.steps_per_mm[X];
  gc.position[Y] = y/settings.steps_per_mm[Y];
  gc.position[Z] = z/settings.steps_per_mm[Z];
}


//Set the modal group values taken directly from grbl
static int Set_Modal_Groups(int mode){
int gp_num;
  switch(mode) {
    case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
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
int i;
  switch(mode){
    case 0: motion_mode    = MOTION_MODE_SEEK;    break;
    case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
    case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
    case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
    case 4: non_modal_action  = NON_MODAL_DWELL;     break;
    case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
    case 17: Select_Plane(X, Y, Z); break;
    case 18: Select_Plane(X, Z, Y); break;
    case 19: Select_Plane(Y, Z, X); break;
    case 20: gc.inches_mode = 1; break;
    case 21: gc.inches_mode = 0; break;
    case 53: absolute_override = true; break;
    case 54: case 55: case 56: case 57: case 58: case 59:
             gc.coord_select = int_value-54;
             break;
    case 80: motion_mode = MOTION_MODE_CANCEL; break;
    case 90: gc.absolute_mode = true; break;
    case 91: gc.absolute_mode = false; break;
    case 93: gc.inverse_feed_rate_mode = true; break;
    case 94: gc.inverse_feed_rate_mode = false; break;
    case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
    case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
    case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
    case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
    case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
    case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
  }
  FAIL(STATUS_OK);
  // [G54,G55,...,G59]: Coordinate system selection to be implimented
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
    if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
      FAIL(STATUS_INVALID_STATEMENT);
    }
    // Report any errors.
    if (status_code) { return(status_code); }

 }
#if GcodeDebug == 2
   while(DMA_Busy(1));
   dma_printf("non_modal_action:= %d\n",non_modal_action);
#endif
 return motion_mode;
}

static void Set_M_Modal_Commands(int flow){
// Set modal group values
   switch(flow) {
     case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
     case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
   }
}

//M Commands
static int Set_M_Commands(int flow){
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
  return status_code;
}