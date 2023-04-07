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

//set this to initialize default settings in flash prior to writing $99=1
#define PREPARE_DEFAULT_FLASH

//do not make this vale to large it will reduce the life of flash row
#define FLASH_RETRY_COUNT 2

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
extern unsigned long volatile buffA[128];

///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////
// Define global system variables
typedef struct {
  int abort;                 // System abort flag. Forces exit back to main loop for reset.
  int state;                 // Tracks the current state of Grbl.
  int  homing;                //track the axis homing -1 = none, 0 = x, 1 = y, 2 = z etc
  int homing_cnt;             //count the homing bounce
  long position[NoOfAxis];      // Real-time machine (aka home) position vector in steps.
                              // NOTE: This may need to be a volatile variable, if problems arise.
  int auto_start;            // Planner auto-start flag. Toggled off during feed hold. Defaulted by settings.
  int execute;      // Global system runtime executor bitflag variable. See EXEC bitmasks.
} system_t;
extern system_t sys;

////////////////////////////////////////////
//9 different coordinates can be saved
typedef struct{
 float coord[NoOfAxis];
 float coord_offset[NoOfAxis];
}coord_sys;
extern volatile coord_sys coord_system[NUMBER_OF_DATUMS];


///////////////////////////////////////////////////////////////////////////////
//                             FUNCTION PROTOTYPES                           //
///////////////////////////////////////////////////////////////////////////////
void settings_init(short reset_all);

//set the ram_loaded indicator
static int set_ram_loaded_indicator(int val);

//force a zeroing of ram_loaded indicator
static void zero_ram_loaded_indicator();

//read the ram loaded indicator
int read_ram_loaded_indicator();

//reset individual flags back to false
static void rst_single_coord_read_indicators(int flag);

//reset all coord status flags back to false
static void rst_coord_read_indicator();

//get the status of the indicator flag
int read_coord_data_indicator();

//void read_row_from_flash(unsigned long addr);
int read_row_from_flash(unsigned long addr);

//writes the coord data into flash
unsigned int settings_write_coord_data(int coord_select,float *coord);

//reads a coord from flashinto relevant axis data
void settings_read_coord_data();

//write 1 coordinate to flash QUAD_WORD
unsigned int settings_write_one_coord(int coord_select,float *coord);

// Reads startup line from EEPROM. Updated pointed line string data.
int settings_read_startup_line(int n, char *line);

// Method to store startup lines into EEPROM
int settings_store_startup_line(int n, char *line);

// Method to store Grbl global settings struct and version number into EEPROM
void write_global_settings();

// A helper method to set settings from command line
int settings_store_global_setting(int parameter, float value);
#endif