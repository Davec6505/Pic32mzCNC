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
#define UL unsigned long

//used to translate from Virtual add to Physical address
//use KSEG1 for non cached Vmemory mapped to Pmemory
#define  FLASH_PADDRESS_TRANSLATE 0x1FFFFFFF

//G10 Pnnn coordinate recipes memory offsets
#define  FLASH_Settings_VAddr_P1  0xBD1BC000//86000//0xBD079000
#define  FLASH_Settings_VAddr_P2  0xBD1BC010//0xBD079000
#define  FLASH_Settings_VAddr_P3  0xBD1BC020//0xBD079000
#define  FLASH_Settings_VAddr_P4  0xBD1BC030//0xBD079000
#define  FLASH_Settings_VAddr_P5  0xBD1BC040//0xBD079000
#define  FLASH_Settings_VAddr_P6  0xBD1BC050//0xBD079000
#define  FLASH_Settings_VAddr_P7  0xBD1BC060//0xBD079000
#define  FLASH_Settings_VAddr_P8  0xBD1BC070//0xBD079000
#define  FLASH_Settings_VAddr_P9  0xBD1BC080//0xBD079000

//Flash specific masks
#define NVM_ERROR_RST_MASK  0x0000C000
#define NVM_WRITE_ENABLE_MASK 0x00004000
#define NVM_WREN_ENABLE 0x00004000

//Errors form flash writes
#define NVM_COORDINATE_WRITE_ERROR 1





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
unsigned int NVMWriteWord (void *address, unsigned long _data);
unsigned int NVMWriteQuad (void *address, unsigned long *_data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(unsigned long address);
static unsigned int NVMUnlock(unsigned long nvmop);
unsigned int NVM_ERROR_Rst();
static void NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static void NVM_WREN_Set();
static void NVM_WREN_Rst();
static unsigned int NVM_WREN_Wait();
void NVM_PWPAGE_Lock();
void NVMReadRow(unsigned long addr);
unsigned long NVMReadWord(void *addr);
unsigned long Get_Address_Pval(int recipe);
#endif