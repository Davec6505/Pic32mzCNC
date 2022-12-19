#ifndef PROTOCOL_H
#define PROTOCOL_H


#include "GCODE.h"
#include "Serial_Dma.h"
#include "Print.h"
#include "Settings.h"
#include "Config.h"
#include "Nuts_Bolts.h"
//#include "stepper.h"
//#include "report.h"
//#include "Kinematics.h"


/////////////////////////////////////////////
//defines
#define arr_size 10
#define str_size 60








/////////////////////////////////////////////
//function prototypes
//init the array of stringto empty strings
void Str_Initialize(char arg[arr_size][str_size]);
//Get the instruction from the ring buffer
int Sample_Ringbuffer();
//split up the instructin
int strsplit(char arg[arr_size][str_size],char *str, char c);
int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);
int str2int(char *str,int base);

/////////////////////////////////////////////
//puerly for debug purposes
#if ProtoDebug == 1
  void PrintDebug(char *strA,char *strB,void *ptr);
#elif ProtoDebug == 2
  void PrintStatus(int state);
#endif

#endif