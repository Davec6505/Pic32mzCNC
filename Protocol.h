#ifndef PROTOCOL_H
#define PROTOCOL_H


#include "GCODE.h"
#include "Serial_Dma.h"
#include "Print.h"
#include "Settings.h"
#include "Config.h"
#include "Nuts_Bolts.h"
#include "Globals.h"
//#include "report.h"
#include "Kinematics.h"


/////////////////////////////////////////////
//defines
#define RXBUFF  0xA0002000

#define arr_size 20
#define str_size 64

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
//init the array of stringto empty strings
void Str_Initialize(char arg[arr_size][str_size]);
void Str_clear(char *str,int len);
//Get the instruction from the ring buffer
int Sample_Ringbuffer();
//split up the instructin
static int strsplit(char arg[arr_size][str_size],char *str, char c);
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);
static int str2int(char *str,int base);

/////////////////////////////////////////////
//puerly for debug purposes
#if ProtoDebug == 1
  static void PrintDebug(char c,char *strB,void *ptr);
#elif ProtoDebug == 2
  static void PrintStatus(int state);
#endif

#endif