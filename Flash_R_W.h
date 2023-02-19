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


//////////////////////////////////////////////////////
//set a value into 5F4 to indicate that flash has been
//flash memory has been loaded with settings, this is
//is to save time on startup, the other option is to
//iterrate over the entire row ??
#define  FLASH_Settings_VAddr_FLASH_LOADED  0xBD1BC5F0
#define  FLASH_LOADED_OFFSET 0x17C

//////////////////////////////////////////////////////
//1/4th of row for coords [1st 1/3rd] starts at C000
//rows for mz2048 are 512 32bit words in size.
//G10 Pnnn coordinate recipes memory offsets
#define  FLASH_Settings_VAddr_P1  0xBD1BC000//Row start address
#define  FLASH_Settings_VAddr_P2  0xBD1BC010//
#define  FLASH_Settings_VAddr_P3  0xBD1BC020//
#define  FLASH_Settings_VAddr_P4  0xBD1BC030//
#define  FLASH_Settings_VAddr_P5  0xBD1BC040//
#define  FLASH_Settings_VAddr_P6  0xBD1BC050//
#define  FLASH_Settings_VAddr_P7  0xBD1BC060//
#define  FLASH_Settings_VAddr_P8  0xBD1BC070//
#define  FLASH_Settings_VAddr_P9  0xBD1BC080//

//Homming positions
//G28, G30: Go to Pre-Defined Position
//G28.1, G30.1: Set Pre-Defined Position
#define  FLASH_Settings_VAddr_G281 0xBD1BC090//0xBD079000
#define  FLASH_Settings_VAddr_G301 0xBD1BC0A0//0xBD079000
//#define  FLASH_Settings_VAddr_G56 0xBD1BC0B0//0xBD079000
//#define  FLASH_Settings_VAddr_G57 0xBD1BC0C0//0xBD079000
//#define  FLASH_Settings_VAddr_G58 0xBD1BC0D0//0xBD079000
//#define  FLASH_Settings_VAddr_G59 0xBD1BC0E0//0xBD079000

/////////////////////////////////////////////////////////
//1/2th of row for settings
//Flash offsets Virtual memory of Steps/mm settings
//long values **to be revised**
#define  FLASH_Settings_VAddr_SPMMX  0xBD1BC100
#define  FLASH_Settings_VAddr_SPMMY  0xBD1BC104
#define  FLASH_Settings_VAddr_SPMMZ  0xBD1BC108
#define  FLASH_Settings_VAddr_SPMMA  0xBD1BC10C
#define  FLASH_Settings_VAddr_SPMMB  0xBD1BC110
#define  FLASH_Settings_VAddr_SPMMC  0xBD1BC114
//Ram memory of Steps/mm setting
#define  SPMMX_OFFSET  0x40
#define  SPMMY_OFFSET  0x41
#define  SPMMZ_OFFSET  0x42
#define  SPMMA_OFFSET  0x43
#define  SPMMB_OFFSET  0x44
#define  SPMMC_OFFSET  0x45

//Flash offsets Virtual memory of float varialbes
#define  FLASH_Settings_VAddr_P_USEC        0xBD1BC118
#define  FLASH_Settings_VAddr_D_FEED_RATE   0xBD1BC11C
#define  FLASH_Settings_VAddr_D_SEEK_RATE   0xBD1BC120
#define  FLASH_Settings_VAddr_H_FEED_RATE   0xBD1BC124
#define  FLASH_Settings_VAddr_H_SEEK_RATE   0xBD1BC128
#define  FLASH_Settings_VAddr_H_PULL_OFF    0xBD1BC12C
#define  FLASH_Settings_VAddr_MM_ARC_SEG    0xBD1BC130
#define  FLASH_Settings_VAddr_ACCELERATION  0xBD1BC134
#define  FLASH_Settings_VAddr_JUNCTION_DEV  0xBD1BC138
//Ram offsets  of float variables
#define  P_USEC_OFFSET        0x46
#define  D_FEED_RATE_OFFSET   0x47
#define  D_SEEK_RATE_OFFSET   0x48
#define  H_FEED_RATE_OFFSET   0x49
#define  H_SEEK_RATE_OFFSET   0x4A
#define  H_PULL_OFF_OFFSET    0x4B
#define  MM_ARC_SEG_OFFSET    0x4C
#define  ACCELERATION_OFFSET  0x4D
#define  JUNCTION_DEV_OFFSET  0x4E

//Flash offsets Virtual memory of int values
#define  FLASH_Settings_VAddr_N_ARC_CORREC  0xBD1BC13C
#define  FLASH_Settings_VAddr_FLAGS         0xBD1BC140
#define  FLASH_Settings_VAddr_STEP_IDLE_DLY 0xBD1BC144
#define  FLASH_Settings_VAddr_H_DEBNC_DLY   0xBD1BC148
#define  FLASH_Settings_VAddr_IDLE_LOCK_TMR 0xBD1BC14C
#define  FLASH_Settings_VAddr_MICROSTEPS    0xBD1BC150
#define  FLASH_Settings_VAddr_PLS_MICRO_SEC 0xBD1BC154
#define  FLASH_Settings_VAddr_DEC_PLACES    0xBD1BC158
#define  FLASH_Settings_VAddr_HOME_DIR_MASK 0xBD1BC15C
#define  FLASH_Settings_VAddr_INVERT_MASK   0xBD1BC160
//Ram offsets of int variables
#define  N_ARC_CORREC_OFFSET  0x4F
#define  FLAGS_OFFSET         0x50
#define  STEP_IDLE_DLY_OFFSET 0x51
#define  H_DEBNC_DLY_OFFSET   0x52
#define  IDLE_LOCK_TMR_OFFSET 0x53
#define  MICROSTEPS_OFFSET    0x54
#define  PLS_MICRO_SEC_OFFSET 0x55
#define  DEC_PLACES_OFFSET    0x56
#define  HOME_DIR_MASK_OFFSET 0x57
#define  INVERT_MASK_OFFSET   0x58


////////////////////////////////////////////////////////
//3/4th of row for startup line + offsets
//Flash offset startup lines Virtual memory
#define  FLASH_Settings_VAddr_SLine1  0xBD1BC600
#define  FLASH_Settings_VAddr_SLine2  0xBD1BC640
//Ram offset startup lines
#define Line0_Offset 0x180
#define Line1_Offset 0x190



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
unsigned int NVMWriteWord (const void *address, unsigned long _data);
unsigned int NVMWriteQuad (const void *address, unsigned long *_data);
unsigned int NVMWriteRow (const void* address, void* _data);
unsigned int NVMErasePage(const void* address);
static unsigned int NVMUnlock(unsigned long nvmop);
unsigned int NVM_ERROR_Rst();
static void NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static void NVM_WREN_Set();
static void NVM_WREN_Rst();
static unsigned int NVM_WREN_Wait();
void NVM_PWPAGE_Lock();
void NVMReadRow(unsigned long addr,unsigned long *buff);
void NVMReadQuad(unsigned long addr,unsigned long *words);
unsigned long NVMReadWord(void *addr);
unsigned long Get_Address_Pval(int recipe);
#endif