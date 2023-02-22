/*******************************************************************************
 *Standard Modal groups for G-codes are as follows:

Group 1 {G00, G01, G02, G03, G33, G38.x, G73, G76, G80, G81, G82, G84, G85, 
         G86, G87, G88, G89} motion – This is a group of G-codes for motion 
         called current motion mode — one is always in effect.
Group 2 {G17, G18, G19, G17.1, G17.2, G17.3} plane selection
Group 3 {G90, G91} distance mode
Group 4 {G90.1, G91.1} arc IJK distance mode
Group 5 {G93, G94} feed rate mode
Group 6 {G20, G21} units
Group 7 {G40, G41, G42, G41.1, G42.1} cutter radius compensation
Group 8 {G43, G43.1, G49} tool length offset
Group 10 {G98, G99} return mode in canned cycles
Group 12 {G54, G55, G56, G57, G58, G59, G59.1, G59.2, G59.3} 
         coordinate system selection
Group 13 {G61, G61.1, G64} path control mode
Group 14 {G96, G97} spindle speed mode
Group 15 {G07, G08} lathe diameter mode
Modal groups for M-codes are as follows:

Group 4 {M00, M01, M02, M30, M60} stopping
Group 7 {M03, M04, M05} spindle turning
Group 8 {M07, M08, M09} coolant (special case: M07 and M08 may be 
        active at the same time)
Group 9 {M48, M49} enable/disable feed and speed override controls
Group 10 {operator defined M100 to M199}
Non-modal G-codes are as follows:

Group 0 {G04, G10, G28, G30, G53, G92, G92.1, G92.2, G92.3}
******************************************************************************/


#ifndef GCODE_H
#define GCODE_H

///////////////////////////////////////////////////////////////////////////////
//                             INCLUDES                                      //                           //
///////////////////////////////////////////////////////////////////////////////
#include <stdint.h>
#include "Config.h"
#include "Kinematics.h"
#include "Settings.h"
#include "Globals.h"

///////////////////////////////////////////////////////////////////////////////
//                             MACROS                                        //
///////////////////////////////////////////////////////////////////////////////
#define FAIL(status) status_code = status;
extern volatile int status_code;   // Status of instructions

///////////////////////////////////////////////////////////////////////////////
//                             DEFINES                                       //
///////////////////////////////////////////////////////////////////////////////

//G54, G55, G56, G57, G58 and G59 are datum shift G-Codes. 
//This series of commands tell the CNC control which datum we are using. 
//Once the machine reads one of these codes it will continue to work 
//from this position until a new one is called upon
#define NUMBER_OF_DATUMS 9

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

////////////////////////////////////////////////////////////////////////////////
//       MODAL MODES WILL USE Motion_mode VALUE TO CONTION TO STATE           //
////////////////////////////////////////////////////////////////////////////////
// Define command actions for within execution-type modal groups 
//(motion, stopping, non-modal). Used/internally by the parser to know which 
//command to execute within main state m/c
#define MOTION_MODE_SEEK    0  // G0
#define MOTION_MODE_LINEAR  1  // G1
#define MOTION_MODE_CW_ARC  2  // G2
#define MOTION_MODE_CCW_ARC 3  // G3
#define MOTION_MODE_CANCEL  4  // G80
#define MOTION_MODE_MCODES  5  // M....

//PROGRAM FLOW VALUES
#define PROGRAM_FLOW_RUNNING   0
#define PROGRAM_FLOW_PAUSED    1 // M0,1
#define PROGRAM_FLOW_COMPLETED 2 // M2,30

///////////////////////////////////////////////////////////////////////////////
//            NON MODAL DEFINES AND THEIR RESPECTIVE BITS                    //
///////////////////////////////////////////////////////////////////////////////
#define NON_MODAL_NONE 0
#define NON_MODAL_DWELL 1                         // G4
#define NON_MODAL_SET_COORDINATE_DATA 2           // G10
#define NON_MODAL_GO_HOME_0 3                     // G28
#define NON_MODAL_GO_HOME_0_BIT bit(3)            // G28
#define NON_MODAL_SET_HOME_0 4                    // G28.1
#define NON_MODAL_SET_HOME_0_BIT bit(4)
#define NON_MODAL_GO_HOME_1 5                     // G30
#define NON_MODAL_GO_HOME_1_BIT bit(5)
#define NON_MODAL_SET_HOME_1 6                    // G30.1
#define NON_MODAL_SET_HOME_1_BIT bit(6)
#define NON_MODAL_SET_COORDINATE_OFFSET 7         // G92
#define NON_MODAL_SET_COORDINATE_OFFSET_BIT bit(7)
#define NON_MODAL_RESET_COORDINATE_OFFSET 8       //G92.1
#define NON_MODAL_RESET_COORDINATE_OFFSET_BIT bit(8)
#define HOME_ALL 10                     //$H


////////////////////////////////////////////////////////
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
#define STATUS_SPEED_ERROR 13
#define STATUS_EI_ERROR 14

////////////////////////////////////////////////////////
// Define Grbl alarm codes. Less than zero to distinguish alarm error from status error.
#define ALARM_HARD_LIMIT -1
#define ALARM_ABORT_CYCLE -2

///////////////////////////////////////////////////////
// Define Grbl feedback message codes.
#define MESSAGE_CRITICAL_EVENT 1
#define MESSAGE_ALARM_LOCK 2
#define MESSAGE_ALARM_UNLOCK 3
#define MESSAGE_ENABLED 4
#define MESSAGE_DISABLED 5



///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////

typedef struct {
  char r:                      1;
  char no_axis_interpolate;      //Single or dual axis for interpolation
  char inverse_feed_rate_mode;   // {G93, G94}
  char inches_mode;              // 0 = millimeter mode, 1 = inches mode {G20, G21}
  char absolute_override;
  char absolute_mode;            // 0 = relative motion, 1 = absolute motion {G90, G91}
  char spindle_direction;        // 1 = CW, -1 = CCW, 0 = Stop {M3, M4, M5}
  char coolant_mode;             // 0 = Disable, 1 = Flood Enable {M8, M9}
  char motion_mode;              // {G0, G1, G2, G3, G80}
  char program_flow;             // {M0, M1, M2, M30}
  char tool;
  //  uint16_t spindle_speed;    // RPM/100
  char plane_axis_0,
       plane_axis_1,
       plane_axis_2;                      // The axes of the selected plane
  int  coord_select;                      // Active work coordinate system number. Default: 0=G54.
 // int status_code;                      // Parser status for current block
 // int motion_mode;                      // {G0, G1, G2, G3, G80}
  int L;                                  //L2 tells the G10 we’re setting standard work offsets
  unsigned long frequency;                // Speed expressed as Frequency of pulses
  float feed_rate;                        // Millimeters/min
//  float seek_rate;                      // Millimeters/min. Will be used in v0.9 when axis independence is installed
  volatile float position[NoOfAxis];      // Where the interpreter considers the tool to be at this point in the code
  volatile float coord_system[NoOfAxis];  // Current work coordinate system (G54+). Stores offset from absolute machine
                                          // position in mm. Loaded from EEPROM when called.
  volatile float coord_offset[NoOfAxis];  // Retains the G92 coordinate offset (work coordinates) relative to
                                          // machine zero in mm. Non-persistent. Cleared upon reset and boot.
  volatile float next_position[NoOfAxis]; // Target position instruction from gcode sender
  volatile float offset[3];
  float R;                                // I,J,K for arc
  float I;
  float J;
  float K;
  int P;               //Pause as in msec if sent with G04 else Coord-position
  int S;               //Pause as in sec
} parser_state_t;
extern parser_state_t gc;


enum IJK{I,J,K};


///////////////////////////////////////////////////////////////////////////////
//                             FUNCTION PROTOTYPES                           //
///////////////////////////////////////////////////////////////////////////////

void G_Initialise();

void Set_modalgroup(int value);
int Get_modalgroup();
int Rst_modalgroup();

void Set_modalword(int value);
int Get_modalword();
int Rst_modalword();

int Get_Axisword();
int Rst_Axisword();

int Get_motionmode();
int Rst_motionmode();

int G_Mode(int mode);
// m instructions
void M_Instruction(int flow);

static float To_Millimeters(float value);

int Check_group_multiple_violations();
int Motion_mode();
//all values passed from instruction
int Instruction_Values(char *c,void *any);
//movement of axis
void Movement_Condition();
//update current position ??? prehaps move to another location
void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z);

static int Set_Modal_Groups(int mode);
static int Set_Motion_Mode(int mode);
static int Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);

#endif