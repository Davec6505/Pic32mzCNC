#ifndef PROTOCOL_H
#define PROTOCOL_H


#include "GCODE.h"
#include "Serial_Dma.h"
#include "Print.h"
#include "Settings.h"
#include "Config.h"
#include "Nuts_Bolts.h"
#include "Globals.h"
#include "Timers.h"
#include "Kinematics.h"


/////////////////////////////////////////////
//defines
#define RXBUFF  0xA0002000

#define arr_size 20
#define str_size 64

// Startup string from UGS is always ? and there after the ? is asking
// for the current positions of the head
#define START_MSG 0
#define DRO_MSG   1

// Number of blocks Grbl executes upon startup. These blocks are stored in EEPROM, where the size
// and addresses are defined in settings.h. With the current settings, up to 5 startup blocks may
// be stored and executed in order. These startup blocks would typically be used to set the g-code
// parser state depending on user preferences.
#define N_STARTUP_LINE 2 // Integer (1-5)

// Define runtime command special characters. These characters are 'picked-off' directly from the
// serial read data stream and are not passed to the grbl line execution parser. Select characters
// that do not and must not exist in the streamed g-code program. ASCII control characters may be
// used, if they are available per user setup. Also, extended ASCII codes (>127), which are never in
// g-code programs, maybe selected for interface programs.
// NOTE: If changed, manually update help message in report.c.
#define CMD_STATUS_REPORT '?'
#define CMD_FEED_HOLD '!'
#define CMD_CYCLE_START '~'
#define CMD_RESET 0x18 // ctrl-x





/////////////////////////////////////////////
//function prototypes
//init protocol variables and functions
void Init_Protocol();

//init the array of stringto empty strings
void Str_Initialize(char arg[arr_size][str_size]);

//clear the string buffer prepare for new string
void Str_clear(char *str,int len);

//New gcode string interpreter
int Sample_Gocde_Line();

//startup message for ugs is ? = Grbl 0.8c ['$' for help]
static void Do_Startup_Msg(char *str_,int dif_);

//~ ! ? ctrl+x [0x18]
static void Do_Critical_Msg(char ch_);

//after firmware has been sent ugs sends $$ - $G - to get settings
//from controller and its G code functionality this will be tested
//here and if these are questions asked then responses must be sent
//immediately otherwise return a value indicating that the string
//must be split up into its relative commands, this saves time not
//splitting unnecessary strings
static int Check_Query_Type(char *str_,int dif_);

//after checking for gcode run the gcode instructions
static int Do_Gcode(char *str_,int dif_);

//Get the instruction from the ring buffer
int Sample_Ringbuffer();

//split up the instructin
static int strsplit(char arg[arr_size][str_size],char *str, char c);
static int strsplit2(char arg[arr_size][str_size],char *str,char c);

//copies the alpha numeric chars from the string and returns number of chars
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);

//converts string to int is all cahrs are alpha numeric
static int str2int(char *str,int base);

// Executes user startup script, if stored.
void protocol_execute_startup();

//check for errors or resets
void protocol_system_check();

//Runtime checking of status states
void protocol_execute_runtime();



#endif