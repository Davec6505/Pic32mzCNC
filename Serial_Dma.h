#ifndef SERIAL_DMA_H
#define SERIAL_DMA_H


#include <stdlib.h>
#include <stdarg.h>
#include "Config.h"


#define NULL 0


extern char txt[];
extern char rxBuf[];
extern char txBuf[];





////////////////////////////////////////////
//function prototypes
void DMA_global();
void DMA0();
void DMA1();
void DMA0_Enable();
void DMA0_Disable();
void DMA1_Enable();
void DMA1_Disable();
int DMA_Busy(int channel);
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#endif