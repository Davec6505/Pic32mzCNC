#ifndef SERIAL_DMA_H
#define SERIAL_DMA_H


#include "Config.h"





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
#endif