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
#include "Kinematics.h"


/////////////////////////////////////////////
//defines
#define arr_size 10
#define str_size 60








/////////////////////////////////////////////
//function prototypes
//init the array of stringto empty strings
void Str_Initialize();
//Get the instruction from the ring buffer
void Sample_Ringbuffer();
//split up the instructin
void SplitInstruction(char **arg,char *str,char c);
int CopyStr(char *to,char *from, int len);
#endif