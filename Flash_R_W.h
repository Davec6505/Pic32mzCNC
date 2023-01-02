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
#define  FLASH_PADDRESS_OFFSET 0x1FFFFFFF
#define  FLASH_Settings_VAddr  0xBD030000//0x9D079000
#define  FLASH_Settings_PAddr  0x1D030000//0x1D079000

#define NVM_ERROR_RST_MASK  0x0000C000
#define NVM_WRITE_ENABLE_MASK 0x00004000
#define NVM_WREN_ENABLE 0x00004000

#define UL unsigned long





///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////
//Variables
//extern unsigned long  Addre = 0xBD030000;// = 0x9D078007;
//extern unsigned long  FLASH_Settings_PAddr;// = 0x1D078007;
//extern unsigned long  FLASH_Settings_VAddr;// = 0x9D079ff6;
//extern unsigned long  FLASH_Settings_PAddr;// = 0x1D079ff6;
//////////////////////////////////////////////////
//FUNCTION PROTOTYPE
unsigned int NVMWriteWord (unsigned long address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
static unsigned int NVMUnlock(unsigned int nvmop);
static unsigned int NVM_ERROR_Rst();
static unsigned int NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static unsigned int NVM_WREN_Set();
static unsigned int NVM_WREN_Wait();
static unsigned int NVM_WREN_Rst();
void NVMReadRow(unsigned long addr);
unsigned long NVMReadWord(void *addr);
#endif