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
 * NVMCONbits.NVMOP = 0x1; // NVMOP for Word programming
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
unsigned int NVMWriteWord (unsigned long address, unsigned long _data){
unsigned int res;
unsigned long padd = address;

  //reset the Error flags
  NVM_ERROR_Rst();
  
  //translate the Vadd to Phy add
  padd &= FLASH_PADDRESS_OFFSET;

  // Load address to program into NVMADDR register
  NVMADDR = padd;
  while(DMA_IsOn(1));
  dma_printf("address:= %l\n",NVMADDR);
  
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
NVMADDR = (unsigned long)address;

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
static unsigned int NVMUnlock (unsigned int nvmop){
unsigned int I_status,status;
unsigned int dma_susp=0;   // storage for current DMA state

// Suspend or Disable all Interrupts
 I_status = (unsigned int)DI();
 
 //Suspend all DMA actions
 while(!dma_susp)
  dma_susp = DMA_Suspend();
 
 //Set the WREN bit to allow program flash write
 NVM_WREN_Set();
 
//Wait for WREN
 while(!NVM_WREN_Wait());
 
// wait at least 6 us for LVD start-up
 Delay_us(20);
  
// Write Keys
 NVMKEY = 0x0;
 NVMKEY = 0xAA996655;
 NVMKEY = 0x556699AA;
// Wait WR bit to set must be automic
 NVMCONSET = 1 << 15;

//Resume all DMA actions
 while(dma_susp){
   dma_susp = DMA_Resume();
 }

// Restore Interrupts
 if (I_status)
   EI();

//status = 1;
 while(NVM_WR_Wait());
 
//Reset the WREN bit, disables flash programming
 while(NVM_WREN_Rst());
 
// Return WRERR and LVDERR Error Status Bits
 return (NVMCON & 0x3000)>>12;
}

//////////////////////////////////////////////////////////
//Reset Error flags of the NVMCON registor
static unsigned int NVM_ERROR_Rst(){
unsigned int error= 0;
 NVMCON = 0;
//Reset the NVM Error flags by writing 0 to NVMOP and
//setting [WR] & [WREN]
 NVM_WREN_Set();
//Wait for WR
 NVM_WR_Set();
 //wait for WR to reset
 while(NVM_WR_Wait());
 
 // Return WRERR and LVDERR Error Status Bits
 return (NVMCON & 0x3000)>>12;
}

//////////////////////////////////////////////////////////
//Set the WR bit and return its state;
static unsigned int NVM_WR_Set(){
//[WR] Start the operation using the Set Register
   NVMCONSET |= 1 << 15;
   return NVM_WR_Wait();
}

/////////////////////////////////////////////////////////
//Wait for NVM WR to complete resets to false when done
static unsigned int NVM_WR_Wait(){
   return (NVMCON & 0x8000) >> 15;
}

////////////////////////////////////////////////////////
//Set the WREN bit and wait
static unsigned int NVM_WREN_Set(){
   NVMCONSET = 1 << 14;
   while(!NVM_WREN_Wait());
   return (NVMCON & 4000)>>14;
}

////////////////////////////////////////////////////////
//Reset the WREN bit and wait
static unsigned int NVM_WREN_Rst(){
   NVMCONCLR = 1<<14;
   while(NVM_WREN_Wait());
   return (NVMCON & 4000)>>14;
}

/////////////////////////////////////////////////////////
//Wait for NVM WR to complete resets to false when done
static unsigned int NVM_WREN_Wait(){
   return (NVMCON & 0x4000) >> 14;
}

/////////////////////////////////////////////////////////
//Read a 32bit word from flash
//const argument stops the src from being changed
unsigned long NVMReadWord(void *addr){
unsigned long val;

    val = *((unsigned long*)addr);

   return val;
}

void NVMReadRow(unsigned long addr){
unsigned long buff[128] = {0};
unsigned long i,j;
unsigned long*ptr;
float val;

  ptr = (unsigned long*)addr;
  i = 0;
   //for(i = 0;i < 144;i++){
       for(j = 0;j < 128;j++){
          buff[j] = *(ptr+j);
          if(buff[j] < 0xFFFFFFFF)
            val = ulong2flt(buff[j]);
          else val = 0.00;
          
          while(DMA_IsOn(1));
          dma_printf("val:= %f\tbuff[%l]:= %l\n",val,j,buff[j]);
       }

}