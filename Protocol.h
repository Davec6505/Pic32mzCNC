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
#define str_size 20
#define arr_size 10







/////////////////////////////////////////////
//function prototypes
void Sample_Ringbuffer();
void SplitStr(char *arg[],char *str,char c);
#endif