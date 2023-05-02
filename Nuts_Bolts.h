#ifndef NUTS_BOLTS_H
#define NUTS_BOLTS_H

#include <stdint.h>
#include "Config.h"
#include "Settings.h"

// Useful macros
#define clear_vector(a) memset(a, 0, sizeof(a))
#define clear_vector_float(a) memset(a, 0.0, sizeof(float)*N_AXIS)

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


//Conversion from float to unsigned long keeping byte order
unsigned long flt2ulong(float f_);

//Conversion from unsigned long to float keeping byte order
float ulong2flt(unsigned long ui_);

//returns the specific decimal value (rounded value) of the given float
float fround(float val);

//returns the nearest integer value (rounded value) of the given float
int round(float val);

//returns the nearest long value (rounded value) of the given float
long lround(float val);
#endif