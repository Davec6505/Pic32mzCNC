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
int strsplit(char arg[arr_size][str_size],char str[250], char c);
int cpystr(char *strA,const char *strB,int indx,int num_of_char);
int str2int(char *str,int base);
#endif