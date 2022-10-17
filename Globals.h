#ifndef GLOBALS_H
#define GLOBALS_H

///////////////////////////////////////////////////
//includes
#include <stdint.h>
#include "Settings.h"



#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))

// Bit field and masking macros
#define bit(n) (1 << n)
#define bit_true(x,mask) (x |= mask)
#define bit_false(x,mask) (x &= ~mask)
#define bit_toggle(x,mask) (x ^= mask)
#define bit_istrue(x,mask) ((x & mask) != 0)
#define bit_isfalse(x,mask) ((x & mask) == 0)

// Define system executor bit map. Used internally by runtime protocol as runtime command flags,
// which notifies the main program to execute the specified runtime command asynchronously.
// NOTE: The system executor uses an unsigned 8-bit volatile variable (8 flag limit.) The default
// flags are always false, so the runtime protocol only needs to check for a non-zero value to
// know when there is a runtime command to execute.
#define EXEC_STATUS_REPORT  bit(0) // bitmask 00000001
#define EXEC_CYCLE_START    bit(1) // bitmask 00000010
#define EXEC_CYCLE_STOP     bit(2) // bitmask 00000100
#define EXEC_FEED_HOLD      bit(3) // bitmask 00001000
#define EXEC_RESET          bit(4) // bitmask 00010000
#define EXEC_ALARM          bit(5) // bitmask 00100000
#define EXEC_CRIT_EVENT     bit(6) // bitmask 01000000
// #define                  bit(7) // bitmask 10000000

// Define system state bit map. The state variable primarily tracks the individual functions
// of Grbl to manage each without overlapping. It is also used as a messaging flag for
// critical events.
#define STATE_IDLE       0 // Must be zero.
#define STATE_INIT       1 // Initial power up state.
#define STATE_QUEUED     2 // Indicates buffered blocks, awaiting cycle start.
#define STATE_CYCLE      3 // Cycle is running
#define STATE_HOLD       4 // Executing feed hold
#define STATE_HOMING     5 // Performing homing cycle
#define STATE_ALARM      6 // In alarm state. Locks out all g-code processes. Allows settings access.
#define STATE_CHECK_MODE 7 // G-code check mode. Locks out planner and motion only.
#define STATE_JOG        8 // Jogging mode is unique like homing.

// Define global system variables
typedef struct {
  int     axis_dir[NoOfAxis];         // Track the direction of the axis for absolute value tracking
  uint8_t abort;                      // System abort flag. Forces exit back to main loop for reset.
  uint8_t state;                      // Tracks the current state of Grbl.
  uint8_t auto_start;                 // Planner auto-start flag. Toggled off during feed hold. Defaulted by settings.
  volatile uint8_t execute;           // Global system runtime executor bitflag variable. See EXEC bitmasks.
  long steps_position[NoOfAxis];      // Real-time machine (aka home) position vector in steps.
                                      // NOTE: This may need to be a volatile variable, if problems arise.
  double mm_position[NoOfAxis];       // Real-time machine positions in mm or inches
  double mm_home_position[NoOfAxis];  // Home positions saved if offsets are needed for limit switches
} system_t;
extern system_t sys;


//////////////////////////////////////////
//structs enums and constants
typedef struct genVars{
  int Single_Dual;
  unsigned short running: 1;       //running bit
  unsigned short startPulses: 1;
  int   Tog;
  int   AxisNo;
  long  i;
  long  d2;
  long  dx;
  long  dy;
  long  dz;
  long  da;
  long  px;
  long  py;
  long  pz;
  long  pa;
  long  psingle;
  long  over;
  long  acc;
  long  dec;
  int   dirx;
  int   diry;
  int   dirz;
  int   dira;
  int   dirb;
  int   dirc;
}sVars;
extern sVars SV;

////////////////////////////////////////////
//function prototypes
int GetAxisDirection(long mm2move);
#endif