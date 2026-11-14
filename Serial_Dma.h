#ifndef SERIAL_DMA_H
#define SERIAL_DMA_H

#include <stdlib.h>
#include <stdarg.h>
#include "Config.h"
#include "GCODE.h"

// Host serial port: UART2 on RC2 (TX) / RC3 (RX), PPS mapped in Config.c.
// Comment out to use UART5 on the onboard FT232 (RD15/RD14), which DTR-resets the MCU on port open.
#define SERIAL_UART2

#define SERIAL_RX_SIZE 1024
#define SERIAL_TX_SIZE 200
#define SERIAL_MODE_RX_IRQ_POLL_TX 1
#define SERIAL_MODE_RX_IRQ_DMA_TX 2

#define SERIAL_LINE_NONE 0
#define SERIAL_LINE_READY 1
#define SERIAL_LINE_TOO_LONG -1
#define SERIAL_LINE_RX_ERROR -2
// Put in the ring by the RX interrupt where a line was damaged
#define SERIAL_FAULT_MARK 0x01

// Host link: the one connection the sender (UGS) talks to. Its bytes go
// through the same realtime check, ring and line assembly, and replies from
// dma_printf go back to it. Bytes from the other link are ignored.
#define HOST_LINK_SERIAL   0
#define HOST_LINK_ETHERNET 1

typedef struct{
  volatile char temp_buffer[SERIAL_RX_SIZE];
  volatile unsigned int head;
  volatile unsigned int tail;
} Serial;

extern Serial serial;
extern volatile char rxBuf[];
extern char txBuf[];

void Serial_Init(char mode);
#ifdef SERIAL_UART2
void Uart2InterruptSetup();
#else
void Uart5InterruptSetup();
#endif
unsigned int Serial_TakeRealtime();
unsigned int Serial_PeekRealtime();
// takes only the '?' request, leaving the other realtime flags pending
char Serial_TakeStatusRequest();
// The caller supplies LINE_BUFFER_SIZE bytes; no partial line is returned.
int Serial_ReadLine(char *line);
void Reset_Ring();
void Host_SetLink(char link);
char Host_GetLink();
// bytes from a non-interrupt source (Ethernet), called from the main loop
void Host_ReceiveBytes(char *bytes, unsigned int n);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();

void DMA1();
char DMA1_Flag();
unsigned int DMA1_Enable();
void DMA1_Disable();
unsigned int DMA_IsOn(int channel);
unsigned int DMA_Busy();
unsigned int DMA_Suspend();
unsigned int DMA_Resume();

int dma_printf(const char *str,...);
void lTrim(char *d,char *s);
#endif
