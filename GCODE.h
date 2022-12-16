#ifndef GCODE_H
#define GCODE_H

#include <stdint.h>
#include "Config.h"
#include "Kinematics.h"
#include "Settings.h"
#include "Globals.h"

// Define modal group internal numbers for checking multiple command violations and tracking the
// type of command that is called in the block. A modal group is a group of g-code commands that are
// mutually exclusive, or cannot exist on the same line, because they each toggle a state or execute
// a unique motion. These are defined in the NIST RS274-NGC v3 g-code standard, available online,
// and are similar/identical to other g-code interpreters by manufacturers (Haas,Fanuc,Mazak,etc).
#define MODAL_GROUP_NONE 0
#define MODAL_GROUP_0 1 // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
#define MODAL_GROUP_1 2 // [G0,G1,G2,G3,G80] Motion
#define MODAL_GROUP_2 3 // [G17,G18,G19] Plane selection
#define MODAL_GROUP_3 4 // [G90,G91] Distance mode
#define MODAL_GROUP_4 5 // [M0,M1,M2,M30] Stopping
#define MODAL_GROUP_5 6 // [G93,G94] Feed rate mode
#define MODAL_GROUP_6 7 // [G20,G21] Units
#define MODAL_GROUP_7 8 // [M3,M4,M5] Spindle turning
#define MODAL_GROUP_12 9 // [G54,G55,G56,G57,G58,G59] Coordinate system selection

// Define command actions for within execution-type modal groups (motion, stopping, non-modal). Used
// internally by the parser to know which command to execute.
#define MOTION_MODE_SEEK 0 // G0
#define MOTION_MODE_LINEAR 1 // G1
#define MOTION_MODE_CW_ARC 2  // G2
#define MOTION_MODE_CCW_ARC 3  // G3
#define MOTION_MODE_CANCEL 4 // G80

#define PROGRAM_FLOW_RUNNING 0
#define PROGRAM_FLOW_PAUSED 1 // M0, M1
#define PROGRAM_FLOW_COMPLETED 2 // M2, M30

#define NON_MODAL_NONE 0
#define NON_MODAL_DWELL 1 // G4
#define NON_MODAL_SET_COORDINATE_DATA 2 // G10
#define NON_MODAL_GO_HOME_0 3 // G28
#define NON_MODAL_SET_HOME_0 4 // G28.1
#define NON_MODAL_GO_HOME_1 5 // G30
#define NON_MODAL_SET_HOME_1 6 // G30.1
#define NON_MODAL_SET_COORDINATE_OFFSET 7 // G92
#define NON_MODAL_RESET_COORDINATE_OFFSET 8 //G92.1


// Define Grbl status codes.
#define STATUS_OK 0
#define STATUS_BAD_NUMBER_FORMAT 1
#define STATUS_EXPECTED_COMMAND_LETTER 2
#define STATUS_UNSUPPORTED_STATEMENT 3
#define STATUS_ARC_RADIUS_ERROR 4
#define STATUS_MODAL_GROUP_VIOLATION 5
#define STATUS_INVALID_STATEMENT 6
#define STATUS_SETTING_DISABLED 7
#define STATUS_SETTING_VALUE_NEG 8
#define STATUS_SETTING_STEP_PULSE_MIN 9
#define STATUS_SETTING_READ_FAIL 10
#define STATUS_IDLE_ERROR 11
#define STATUS_ALARM_LOCK 12

// Define Grbl alarm codes. Less than zero to distinguish alarm error from status error.
#define ALARM_HARD_LIMIT -1
#define ALARM_ABORT_CYCLE -2

// Define Grbl feedback message codes.
#define MESSAGE_CRITICAL_EVENT 1
#define MESSAGE_ALARM_LOCK 2
#define MESSAGE_ALARM_UNLOCK 3
#define MESSAGE_ENABLED 4
#define MESSAGE_DISABLED 5


//mm or inches
#define MM_PER_INCH (25.40)
#define INCH_PER_MM (0.0393701)



typedef struct {
  char r: 1;
  char status_code;              // Parser status for current block
  char no_axis_interpolate;      //Single or dual axis for interpolation
  char inverse_feed_rate_mode;   // {G93, G94}
  char inches_mode;              // 0 = millimeter mode, 1 = inches mode {G20, G21}
  char absolute_mode;            // 0 = relative motion, 1 = absolute motion {G90, G91}
  char program_flow;             // {M0, M1, M2, M30}
  char spindle_direction;        // 1 = CW, -1 = CCW, 0 = Stop {M3, M4, M5}
  char coolant_mode;             // 0 = Disable, 1 = Flood Enable {M8, M9}
  char tool;
  //  uint16_t spindle_speed;    // RPM/100
  char plane_axis_0,
       plane_axis_1,
       plane_axis_2;             // The axes of the selected plane
  char  coord_select;            // Active work coordinate system number. Default: 0=G54.
  int motion_mode;               // {G0, G1, G2, G3, G80}
  int frequency;                 // Speed expressed as Frequency of pulses
  float feed_rate;               // Millimeters/min
//  float seek_rate;             // Millimeters/min. Will be used in v0.9 when axis independence is installed
  float position[NoOfAxis];      // Where the interpreter considers the tool to be at this point in the code
  float coord_system[NoOfAxis];  // Current work coordinate system (G54+). Stores offset from absolute machine                                   // position in mm. Loaded from EEPROM when called.
  float coord_offset[NoOfAxis];  // Retains the G92 coordinate offset (work coordinates) relative to
                                 // machine zero in mm. Non-persistent. Cleared upon reset and boot.
  float next_position[NoOfAxis]; // Target position instruction from gcode sender
  float R;
  float I;
  float J;
} parser_state_t;
extern parser_state_t gc;


// Initialize the parser
//G Instructions
void G_Initialise();
static float To_Millimeters(float value);
void G_Mode(int mode);
static void Set_Modal_Groups(int mode);
static char Set_Motion_Mode(int mode);
// m instructions
void M_Instruction(int flow);
static void Set_M_Modal_Commands(int M_Val);
static char Set_M_Commands(int M_Val);
char Check_group_multiple_violations();
//all values passed from instruction
void Instruction_Values(char *c,void *any);

#endif