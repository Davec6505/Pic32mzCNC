#ifndef NUTS_BOLTS_H
#define NUTS_BOLTS_H

#include <stdint.h>
#include "Config.h"
#include "Settings.h"



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
// #define STATE_JOG     8 // Jogging mode is unique like homing.



// Read a floating point value from a string. Line points to the input buffer, char_counter
// is the indexer pointing to the current character of the line, while float_ptr is
// a pointer to the result variable. Returns true when it succeeds
int read_float(char *line, char *char_counter, float *float_ptr);

//Conversion from float to unsigned long keeping byte order
unsigned long flt2ulong(float f_);

//Conversion from unsigned long to float keeping byte order
float ulong2flt(unsigned long ui_) ;

// Syncs Grbl's gcode and planner position variables with the system position.
void sys_sync_current_position();

//returns the nearest integer value (rounded value) of the given float
int round(double val);
#endif