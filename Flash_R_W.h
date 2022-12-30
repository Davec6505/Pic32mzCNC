#ifndef FLASH_R_W_H
#define FLASH_R_W_H

///////////////////////////////////////////////////
//INCLUDES
#include "String.h"
#include "Serial_Dma.h"
//#include "built_in.h"


///////////////////////////////////////////////////////////////////////////////
//                             DEFINES                                       //
///////////////////////////////////////////////////////////////////////////////
#define  FLASH_Settings_VAddr 0x9D079ff6;
#define  FLASH_Settings_PAddr 0x1D079ff6;

#define  Ul   unsigned long

#define COORD_DATA_X_W  0x1D079ff6
#define COORD_DATA_Y_W  0x1D079ffA
#define COORD_DATA_Z_W  0x1D079ffE

#define COORD_DATA_X_R  0x9D079ff6
#define COORD_DATA_Y_R  0x9D079ffA
#define COORD_DATA_Z_R  0x9D079ffE


///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////
//Variables
//extern unsigned long  FLASH_Settings_VAddr;// = 0x9D078007;
//extern unsigned long  FLASH_Settings_PAddr;// = 0x1D078007;
//extern unsigned long  FLASH_Settings_VAddr;// = 0x9D079ff6;
//extern unsigned long  FLASH_Settings_PAddr;// = 0x1D079ff6;
//////////////////////////////////////////////////
//FUNCTION PROTOTYPE
unsigned int NVMWriteWord (void* address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
unsigned int NVMUnlock(unsigned int nvmop);
unsigned int NVMWait();
//void NVMRead(void* addr,struct Thresh *vals);
unsigned long ReadFlashWord(const unsigned long *addr);
#endif