#ifndef GLOBALS_H
#define GLOBALS_H

///////////////////////////////////////////////////////////////////////////////
//                             INCLUDES                                      //                           //
///////////////////////////////////////////////////////////////////////////////
//#include <stdint.h>
#include "Settings.h"
#include "Flash_R_W.h"
#include "Nuts_Bolts.h"
//#include "GCODE.h"

///////////////////////////////////////////////////////////////////////////////
//                             MACROS                                        //
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//                             DEFINES                                       //
///////////////////////////////////////////////////////////////////////////////

//written to FLASH_LOADED_OFFSET with every save; change it whenever the
//settings row layout changes so new firmware restores its defaults once
//0x7FFF0102: added $3 dir invert mask and $5 limit invert, $2/$4 new defaults
#define SETTINGS_VALID_MARKER 0x7FFF0102

//$RST restore masks
#define SETTINGS_RESTORE_DEFAULTS      0x01  // $RST=$
#define SETTINGS_RESTORE_PARAMETERS    0x02  // $RST=#  G54..G59.3, G28, G30
#define SETTINGS_RESTORE_STARTUP_LINES 0x04  // part of $RST=*
#define SETTINGS_RESTORE_ALL           0xFF  // $RST=*

//global usage defines
#define true 1
#define TRUE 1
#define false 0
#define FALSE 0

//mm or inches
#define MM_PER_INCH (25.40)
#define INCH_PER_MM (0.0393701)

//Circle defines and consts
#define  Pi         3.1415926535897932384626433832795
#define  M_Pi       3.141592653589793238462643
#define  rad2deg    (180.00/M_Pi)
#define  deg2rad    (M_Pi/180.00)


 //basis macros
#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))

// Bit field and masking macros
#define bit(n)              (1 << n)
#define bit_true(x,mask)    (x |= mask)
#define bit_false(x,mask)   (x &= ~mask)
#define bit_toggle(x,mask)  (x ^= mask)
#define bit_istrue(x,mask)  ((x & mask) != 0)
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

// Line buffer size from the serial input stream to be executed.
// NOTE: Not a problem except for extreme cases, but the line buffer size can be too small
// and g-code blocks can get truncated. Officially, the g-code standards support up to 256
// characters. In future versions, this will be increased, when we know how much extra
// memory space we can invest into here or we re-write the g-code parser not to have his
// buffer.
#ifndef LINE_BUFFER_SIZE
  #define LINE_BUFFER_SIZE         64
  #define LINE_BUFFER_SIZE_WORDS   LINE_BUFFER_SIZE/4
#endif

//coord_data read from flash indicators
#define COORD_READ_FLAG  0 //bit 0 indicates coord_data has been read from flash



///////////////////////////////////////////////////////////////////////////////
//                          EXTERNS                                          //
///////////////////////////////////////////////////////////////////////////////
extern unsigned long volatile buffA[512];

///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////
// Define global system variables
typedef struct {
  int abort;                // System abort flag. Forces exit back to main loop for reset.
  int state;                // Tracks the current state of Grbl.
  int  homing;              //track the axis homing -1 = none, 0 = x, 1 = y, 2 = z etc
  int homing_cnt;           //count the homing bounce
  long position[NoOfAxis];  // Real-time machine (aka home) position vector in steps.
                            // NOTE: This may need to be a volatile variable, if problems arise.
  int auto_start;           // Planner auto-start flag. Toggled off during feed hold. Defaulted by settings.
  int execute;              // Global system runtime executor bitflag variable. See EXEC bitmasks.
} system_t;
extern system_t sys;

////////////////////////////////////////////
//coord_system[recipe-1]: P1..P9 (G54..G59.3), G28, G30
typedef struct{
 float coord[NoOfAxis];
 float coord_offset[NoOfAxis];
}coord_sys;
extern volatile coord_sys coord_system[NUMBER_OF_DATUMS];


///////////////////////////////////////////////////////////////////////////////
//                             FUNCTION PROTOTYPES                           //
///////////////////////////////////////////////////////////////////////////////
void settings_init(short reset_all);
int settings_restore(int restore_mask);

//read the ram loaded indicator
int read_ram_loaded_indicator();

//get the status of the indicator flag
int read_coord_data_indicator();

//void read_row_from_flash(unsigned long addr);
int read_row_from_flash(unsigned long addr);

//writes the coord data into flash
unsigned int settings_write_coord_data(int coord_select,float *coord);

//reads a coord from flashinto relevant axis data
void settings_read_coord_data();

// Reads startup line from EEPROM. Updated pointed line string data.
int settings_read_startup_line(int n, char *line);

// Method to store startup lines into EEPROM
int settings_store_startup_line(int n, char *line);

// Store one setting ($n=value): settings_store_grbl_setting maps the Grbl 1.1
// number onto the internal index, settings_store_global_setting writes the
// value and saves the row to flash
int settings_store_global_setting(int parameter, float value);
int settings_store_grbl_setting(int parameter, float value);
#endif//GLOBALS_H