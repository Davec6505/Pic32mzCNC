#ifndef SERIAL_DMA_H
#define SERIAL_DMA_H


#include <stdlib.h>
#include <stdarg.h>
#include "Config.h"
#include "GCODE.h"

#define NULL 0
#define _DMACON_SUSPEND_MASK (1<<12)

extern char txt[];
extern char rxBuf[];
extern char txBuf[];

typedef struct{
 char temp_buffer[500];
 int head;
 int tail;
 int diff;
 char has_data: 1;
}Serial;

extern Serial serial;



////////////////////////////////////////////
//function prototypes
//rcv
void DMA_global();
void DMA0();
void DMA1();
void DMA0_Enable();
void DMA0_Disable();
void Reset_rxBuff(int dif);
int  Get_Head_Value();
int  Get_Tail_Value();
int  Get_Difference();
void Get_Line(char *str,int dif);
void Reset_Ring();
int  Loopback();

///////////////////////////////////////////
//trmit
void DMA1_Enable();
void DMA1_Disable();
int DMA_IsOn(int channel);
int DMA_CH_Busy(int channel);
int DMA_Busy();
int DMA_Suspend();
int DMA_Resume();
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#endif