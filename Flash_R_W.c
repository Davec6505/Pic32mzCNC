/********************************************
*In PIC32MZ EF devices, 
*the Flash page size is 16 KB (0x3E80) (4K IW)
*the row size is 2 KB (512 IW).

*A page of Flash (16kb) is the smallest unit of memory that can be erased at a
 single time.
*The program Flash array can be programmed in several ways:
*- Word Programming, with 1 instruction word (32bit) at a time (most devices)
*- Double-Word Programming, with 2 instruction words at a time 
 (select devices only)
*- Row Programming, with 512 instruction words at a time

*PIC32MZ2048EFn 
*Virtual   0x9D000000 Program Flash 0x9D1FFFFF
*Physical  0x1D000000 Program Flash 0x1D1FFFFF
********************************************/


#include "Flash_R_W.h"

/*
 *When programming or erasing Flash memory, the physical addresses 
 *is always the address used for the target operation.
*/
//unsigned long  FLASH_Settings_VAddr = 0x9D07A000;
//unsigned long  FLASH_Settings_PAddr = 0x1D07A000;


//Write a single 32bit word to flash address and data
/*
 * Set up Address and Data Registers
 * NVMADDR= 0x1D008000;
 // physical address 
 * NVMDATA0 = 0x12345678; // value
 // set the operation, assumes 
 * WREN = 0NVMCONbits.NVMOP = 0x1; // NVMOP for Word programming
 // Enable Flash for write operation and set the NVMOP 
 * NVMCONbits.WREN = 1;
 // Start programming
 * NVMInitiateOperation(); // see Example 52-1
 // Wait for WR bit to clear
 while(NVMCONbits.WR);
 // Disable future Flash Write/Erase operations
 NVMCONbits.WREN = 0;
 // Check Error Status
 if(NVMCON & 0x3000)
 // mask for WRERR and LVDERR{// process errors}
*/
unsigned int NVMWriteWord (void* address, unsigned long _data){
unsigned int res;

  // Load address to program into NVMADDR register
  NVMADDR = (unsigned long) address;

  // Load data into NVMDATA register
  NVMDATA0 = _data; // value
  // Unlock and Write Word
  res = NVMUnlock (0x4001);
  
  // Return Result
  return res;
}


unsigned int NVMWriteRow (void* address, void* _data){
unsigned int res;
// Set NVMADDR to Start Address of row to program
NVMADDR = (unsigned long) address;

// Set NVMSRCADDR to the SRAM data buffer Address
NVMSRCADDR = (unsigned long) _data;

// Unlock and Write Row
res = NVMUnlock(0x4003);
// Return Result
return res;
}

unsigned int NVMErasePage(void* address){
unsigned int res;
// Set NVMADDR to the Start Address of page to erase
NVMADDR = (unsigned long) address;
// Unlock and Erase Page
res = NVMUnlock(0x4004);
// Return Result
return res;
}

//Before entering this sequence of events the PHY add and
// srcadd must be loaded into NVMADDR & NVMSRCADDR
/*
 *{ 
 * int int_status; // storage for current Interrupt Enable state 
 * int dma_susp;   // storage for current DMA state 
 * // Disable Interrupts 
 * asm volatile(“di%0” : “=r”(int_status)); 
 * // Disable DMA 
 * if(!(dma_susp=DMACONbits.SUSPEND)) {
 *   DMACONSET=_DMACON_SUSPEND_MASK;// suspend
 *   while((DMACONbits.DMABUSY));// wait to be actually suspended
 * } 
 * NVMKEY = 0x0;
 * NVMKEY = 0xAA996655; 
 * NVMKEY = 0x556699AA; 
 * NVMCONSET = 1 << 15;// must be an atomic instruction 
 * // Restore DMA 
 * if(!dma_susp) {
 *   DMACONCLR=_DMACON_SUSPEND_MASK;  // resume DMA activity
 * } 
 * // Restore Interrupts
 * if(int_status & 0x00000001) {asm volatile(“ei”);}
 *}
 */
unsigned int NVMUnlock (unsigned int nvmop){
unsigned int status;
unsigned int dma_susp0,dma_susp1;   // storage for current DMA state
// Suspend or Disable all Interrupts
 status = (unsigned int)DI();
 while(!dma_susp0 && !dma_susp1){
  dma_susp0 = DMA_Suspend(0);
  dma_susp1 =DMA_Suspend(1);
 }
// Enable Flash Write/Erase Operations and Select
// Flash operation to perform
 NVMCON = nvmop & 0x00004007;

//Wait for LDV circuit to energise
 Delay_ms(5);
// Write Keys
 NVMKEY = 0x0;
 NVMKEY = 0xAA996655;
 NVMKEY = 0x556699AA;

//[WR] Start the operation using the Set Register
 NVMCONSET = 1 << 15;

// Wait for operation to complete
 while( NVMWait());

//Restore DMA activity
 DMA_Resume(0);
 DMA_Resume(1);
 
// Restore Interrupts
 if (status & 0x0001)
  EI();
 else
  DI();  //set an alarm here
  
// Disable NVM write enable
 NVMCONCLR = 0x0004000;

// Return WRERR and LVDERR Error Status Bits
 return (NVMCON & 0x3000);
}

/////////////////////////////////////////////////////////
//Wait for NVM WR to complete resets to false when done
unsigned int NVMWait(){
   return (NVMCON & 0x8000) >> 15;
}

/////////////////////////////////////////////////////////
//Read a 32bit word from flash
//const argument stops the src from being changed
unsigned long ReadFlashWord(const unsigned long *addr){
unsigned long val;
unsigned long add;
    add = *addr;
    val = ( *((unsigned long*)(add)) ); //<=== CRASHES HERE

   return val;//0xafffafff;
}
//Reading from flash