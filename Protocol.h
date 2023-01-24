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

#define arr_size 10
#define str_size 60








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