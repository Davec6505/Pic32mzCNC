#include "GCODE.h"

parser_state_t gc;

#define FAIL(status) gc.status_code = status;

char absolute_override;
int group_number;
int non_modal_action;
int modal_group_words;  // Bitflag variable to track and check modal group words in block
int axis_words;         // Bitflag to track which XYZ(ABC) parameters exist in block
int int_value;
float inverse_feed_rate;// negative inverse_feed_rate means no inverse_feed_rate specified
float value;


//init vals to defaults
void G_Initialise(){
  group_number      = 0;
  non_modal_action  = 0;
  modal_group_words = 0;
  axis_words        = 0;
  int_value         = 0;
  value             = 0;
  inverse_feed_rate = -1;
  absolute_override = 0;
}

static float To_Millimeters(float value)
{
  return(gc.inches_mode ? (value * MM_PER_INCH) : value);
}

//select the working plane
static void Select_Plane(long x,long y,long z){
  gc.position[X] = x/settings.steps_per_mm[X];
  gc.position[Y] = y/settings.steps_per_mm[Y];
  gc.position[Z] = z/settings.steps_per_mm[Z];
}

// {G 0,1,2,3,80}
void G_Mode(int mode){

   gc.motion_mode = mode;
   Set_Modal_Groups(mode);
   Set_Motion_Mode(mode);
   
   
   #if GcodeDebug == 1
      while(DMA_Busy(1));
      dma_printf("gc.motion_mode:= %d\n",mode);
  #endif
}

//Set the modal group values taken directly from grbl
static void Set_Modal_Groups(int mode){
  switch(mode) {
    case 4: case 10: case 28: case 30: case 53: case 92: group_number = MODAL_GROUP_0; break;
    case 0: case 1: case 2: case 3: case 80: group_number = MODAL_GROUP_1; break;
    case 17: case 18: case 19: group_number = MODAL_GROUP_2; break;
    case 90: case 91: group_number = MODAL_GROUP_3; break;
    case 93: case 94: group_number = MODAL_GROUP_5; break;
    case 20: case 21: group_number = MODAL_GROUP_6; break;
    case 54: case 55: case 56: case 57: case 58: case 59: group_number = MODAL_GROUP_12; break;
  }
}

//set the G commands as per grbl
static char Set_Motion_Mode(int mode){
int i;
  switch(mode){
    case 0: gc.motion_mode = MOTION_MODE_SEEK; break;
    case 1: gc.motion_mode = MOTION_MODE_LINEAR; break;
    case 2: gc.motion_mode = MOTION_MODE_CW_ARC; break;
    case 3: gc.motion_mode = MOTION_MODE_CCW_ARC; break;
    case 4: non_modal_action = NON_MODAL_DWELL; break;
    case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
    case 17: Select_Plane(X, Y, Z); break;
    case 18: Select_Plane(X, Z, Y); break;
    case 19: Select_Plane(Y, Z, X); break;
    case 20: gc.inches_mode = 1; break;
    case 21: gc.inches_mode = 0; break;
    case 28: case 30:
      int_value = floor(10*mode); // Multiply by 10 to pick up Gxx.1
      switch(int_value) {
        case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
        case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
        case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
        case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
        default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
      }
      break;
    case 53: absolute_override = true; break;
    case 54: case 55: case 56: case 57: case 58: case 59:
      gc.coord_select = int_value-54;
      break;
    case 80: gc.motion_mode = MOTION_MODE_CANCEL; break;
    case 90: gc.absolute_mode = true; break;
    case 91: gc.absolute_mode = false; break;
    case 92:
      int_value = floor(10*mode); // Multiply by 10 to pick up G92.1
      switch(int_value) {
        case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
        case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
        default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
      }
      break;
    case 93: gc.inverse_feed_rate_mode = true; break;
    case 94: gc.inverse_feed_rate_mode = false; break;
    default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
  }
    // [G54,G55,...,G59]: Coordinate system selection to be implimented
  
  // [G0,G1,G2,G3,G80]: Perform motion modes.
  // NOTE: Commands G10,G28,G30,G92 lock out and prevent axis words from use in motion modes.
  // Enter motion modes only if there are axis words or a motion mode command word in the block.
  if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {

    // G1,G2,G3 require F word in inverse time mode.
    if ( gc.inverse_feed_rate_mode ) {
      if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
        FAIL(STATUS_INVALID_STATEMENT);
      }
    }
    // Absolute override G53 only valid with G0 and G1 active.
    if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
      FAIL(STATUS_INVALID_STATEMENT);
    }
    // Report any errors.
    if (gc.status_code) { return(gc.status_code); }

    // Convert all target position data to machine coordinates for executing motion. Apply
    // absolute mode coordinate offsets or incremental mode offsets.
    // NOTE: Tool offsets may be appended to these conversions when/if this feature is added.
  for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
      if ( bit_istrue(axis_words,bit(i)) ) {
        if (!absolute_override) { // Do not update target in absolute override mode
          if (gc.absolute_mode) {
            gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
          } else {
            gc.next_position[i] += gc.position[i]; // Incremental mode
          }
        }
      } else {
        gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
      }
  }
 }
 
 //Motion mode for movement set in 1st and 2nd switch statememnts within
 //this function
 switch (gc.motion_mode) {
      case MOTION_MODE_CANCEL:
        if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
        break;
      case MOTION_MODE_SEEK:
        if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
        else { 
           //single axis interpolate at max speed, can be multiple axis at the
           //same time
        }
        break;
      case MOTION_MODE_LINEAR:
        // TODO: Inverse time requires F-word with each statement. Need to do a check. Also need
        // to check for initial F-word upon startup. Maybe just set to zero upon initialization
        // and after an inverse time move and then check for non-zero feed rate each time. This
        // should be efficient and effective.
        if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
        else { 
          //run the new line here , consider planner for future
        }
        break;
      case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
        // Check if at least one of the axes of the selected plane has been specified. If in center
        // format arc mode, also check for at least one of the IJK axes of the selected plane was sent.
        if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
             ( !gc.r)/*&& gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 ) */){
          FAIL(STATUS_INVALID_STATEMENT);
        } else {
          if (gc.R != 0) {
             // Arc Mode radius is passed over to the arc function
             asm{nop;}
          }
        }
        break;
    }
}

/////////////////////////////////////////////////////////////////////
//                       {M 0,1,2,30}                              //
/////////////////////////////////////////////////////////////////////
void M_Instruction(int flow){
  gc.program_flow = flow;
  Set_M_Modal_Commands(flow);
  Set_M_Commands(flow);
   #if GcodeDebug == 1
      while(DMA_Busy(1));
      dma_printf("gc.program_flow:= %d\n",flow);
  #endif
}

static void Set_M_Modal_Commands(int flow){
// Set modal group values
   switch(flow) {
     case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
     case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
   }
}

//M Commands
static char Set_M_Commands(int flow){
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
}

// Check for modal group multiple command violations in the current block
char Check_group_multiple_violations(){
    if (group_number) {
      if ( bit_istrue(modal_group_words,bit(group_number)) ) {
        FAIL(STATUS_MODAL_GROUP_VIOLATION);
      } else {
        bit_true(modal_group_words,bit(group_number));
      }
      group_number = MODAL_GROUP_NONE; // Reset for next command.
    }


  // If there were any errors parsing this line, we will return right away with the bad news
  if (gc.status_code)
      return gc.status_code;
      
  return gc.status_code;
}

//{X,Y,Z,A} Movement values
void Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,S_Val;

   switch(c[0]){
      case 'X':
            XYZ_Val = *(float*)any;
            gc.next_position[X] = XYZ_Val;
            break;
      case 'Y':
            XYZ_Val = *(float*)any;
            gc.next_position[Y] = XYZ_Val;
            break;
      case 'Z':
            XYZ_Val = *(float*)any;
            gc.next_position[Z] = XYZ_Val;
            break;
      case 'A':
            XYZ_Val = *(float*)any;
            gc.next_position[A] = XYZ_Val;
            break;
      case 'E':
            XYZ_Val = *(float*)any;
            gc.next_position[B] = XYZ_Val;
            break;
      case 'R':
            XYZ_Val = *(float*)any;
            gc.R = XYZ_Val;
            break;
      case 'I':
            gc.r = 0;
            gc.R = 0;
            XYZ_Val = *(float*)any;
            gc.I = XYZ_Val;
            break;
      case 'J':
            XYZ_Val = *(float*)any;
            gc.J = XYZ_Val;
            break;
      case 'F':
            F_Val = *(int*)any;
            gc.frequency = F_Val;
            break;
      case 'S':
            S_Val = *(int*)any;
            //need to set S_Val ???
            break;
      default:FAIL(STATUS_UNSUPPORTED_STATEMENT);
            break;
   }
  #if GcodeDebug == 1
      while(DMA_Busy(1));
      if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
         dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
      else if(c[0] == 'F')
         dma_printf("\t%c\t%d\n",c[0],F_Val);
      else if(c[0] == 'S')
         dma_printf("\t%c\t%d\n",c[0],S_Val);
  #endif
}