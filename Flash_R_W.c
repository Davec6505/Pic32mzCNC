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

volatile unsigned int res;
///////////////////////////////////////////////////////
//Write a single 32bit word to flash address and data
unsigned int NVMWriteWord (const void *address, unsigned long _data){
unsigned long padd;// = address;

  //translate the Vadd to Phy add
  padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;

  // Load address to program into NVMADDR register
  NVMADDR = padd;
  //while(DMA_IsOn(1));
  //dma_printf("address:= %l\n",NVMADDR);
  
  // Load data into NVMDATA register
  NVMDATA0 = _data; // value
  
  // Unlock and Write Word
  res = NVMUnlock (0x4001);

  // Return Result
  return res;
}

//////////////////////////////////////////////////////
//4 words to be written to flash at once
unsigned int NVMWriteQuad (const void *address, unsigned long *_data){
unsigned long padd;

  //translate the Vadd to Phy add
  padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;

  // Load address to program into NVMADDR register
  NVMADDR = padd;

  // Load data into NVMDATA register
  NVMDATA0 = *(_data+0); // value
  NVMDATA1 = *(_data+1); // value
  NVMDATA2 = *(_data+2); // value
  NVMDATA3 = *(_data+3); // value
  
  // Unlock and Write Word
  res = NVMUnlock (0x4002);

  // Return Result
  return res;
}

/////////////////////////////////////////////////////
//Row of 128 words to be written to flash
//ignore bits <9-0>  [1024 || 0x400] boundries
unsigned int NVMWriteRow (const void *address, void *_data){

  //translate address to phy address
  // Set NVMADDR to Start Address of row to program
  //Dereference the address to get the value
  NVMADDR = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;

  //translate address to phy address
  //Set NVMSRCADDR to the SRAM data buffer Address
  //no need to dereference use the start address
  NVMSRCADDR = (unsigned long)_data & FLASH_PADDRESS_TRANSLATE;
  #if FlahDebug == 2
   while(DMA_IsOn(1));
   dma_printf("add:= %l\tsrc_padd:= %l\n",NVMADDR,NVMSRCADDR);
  #endif
  
 // Unlock and Write Row
 res = NVMUnlock(0x4003);
 
 // Return Result
 return res;
}

/////////////////////////////////////////////////////
//Erase a whole page of flash 16kbytes
unsigned int NVMErasePage(const void *address){
//unsigned long padd;

   //translate the Vadd to Phy add
  NVMADDR = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
  //translate the Vadd to Phy add
  // Load address to program into NVMADDR register
 // NVMADDR = address & FLASH_PADDRESS_TRANSLATE;
  
  // Unlock and Erase Page
  res = NVMUnlock(0x4004);
  
  // Return Result
  return res;
}

//Before entering this sequence of events the PHY add and
// srcadd must be loaded into NVMADDR & NVMSRCADDR
//Sequence follows FRM Section 52 (DS60001193B) Example 52-1 / 52-2:
//NVMOP may only change while WREN = 0, and WREN must stay set until the
//hardware clears WR. Clearing WREN while WR = 1 left the erase hanging.
static unsigned int NVMUnlock (unsigned long nvmop){
unsigned int I_status = 0;
unsigned int dma_susp = 0;
unsigned long timeout = NVM_WR_TIMEOUT;

 NVMCONCLR = 0x4000;              //WREN = 0 so NVMOP can be changed
 NVMCONCLR = 0x000F;
 NVMCONSET = nvmop & 0x000F;      //NVMOP
 NVMCONSET = 0x4000;              //WREN = 1

// Suspend or Disable all Interrupts
 I_status = (unsigned int)DI();

 //Suspend DMA if it is not already suspended, wait until it actually stops
 dma_susp = (DMACON & 0x1000) >> 12;
 if(!dma_susp){
   DMACONSET = 0x1000;
   while(DMA_Busy());
 }

// Write Keys, then start the operation with an atomic set of WR
 NVMKEY = 0x0U;
 NVMKEY = 0xAA996655;
 NVMKEY = 0x556699AA;
 NVMCONSET = 0x8000;
 asm{NOP};

 //Resume DMA only if this function suspended it
 if(!dma_susp)
   DMACONCLR = 0x1000;

// Restore Interrupts
 if(I_status & 0x00000001)
    EI();

//wait for the hardware to finish, bounded so a fault cannot freeze the boot
 while(NVM_WR_Wait() && --timeout);

//only now disable flash programming
 NVMCONCLR = 0x4000;

 if(!timeout)
   return NVM_WR_TIMEOUT_ERROR;
// Return WRERR and LVDERR Error Status Bits
 return (NVMCON & 0x3000)>>12;
}

//NVM Key sequence
//////////////////////////////////////////////////////////
//Reset Error flags of the NVMCON registor
 unsigned int NVM_ERROR_Rst(){
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
static void NVM_WR_Set(){
//[WR] Start the operation using the Set Register
   NVMCON |= 1 << 15;
   while(!NVM_WR_Wait());
}

/////////////////////////////////////////////////////////
//Wait for NVM WR to complete resets to false when done
static unsigned int NVM_WR_Wait(){
   return (NVMCON & 0x8000) >> 15;
}

////////////////////////////////////////////////////////
//Set the WREN bit and wait
static void NVM_WREN_Set(){
   NVMCON |= 1 << 14;
   while(!NVM_WREN_Wait());
}

////////////////////////////////////////////////////////
//Reset the WREN bit and wait
static void NVM_WREN_Rst(){
   NVMCONCLR |= 1<<14;
   while(NVM_WREN_Wait());
}

/////////////////////////////////////////////////////////
//Wait for NVM WR to complete resets to false when done
static unsigned int NVM_WREN_Wait(){
   return (NVMCON & 0x4000) >> 14;
}

////////////////////////////////////////////////////////
//Unlock page
void NVM_PWPAGE_Lock(){
unsigned long padd;// = address;
unsigned int I_status;
unsigned int dma_susp=0;   // storage for current DMA state
 // Suspend or Disable all Interrupts
 I_status = (unsigned int)DI();

 //Suspend all DMA actions
 while(!dma_susp)
  dma_susp = DMA_Suspend();
  
  //Word type of data transfer to take place
 NVMCONSET = 4;
  //Set the WREN bit to allow program flash write
 NVM_WREN_Set();


 // Write Keys
 NVMKEY = 0x0U;
 NVMKEY = 0xAA996655;
 NVMKEY = 0x556699AA;
 NVMPWPCLR = 0x8000C000;
  
//Resume all DMA actions
 while(dma_susp){
   dma_susp = DMA_Resume();
 }

// Restore Interrupts
 if (I_status)
   EI();
   
   //Reset the WREN bit, disables flash programming
 NVM_WREN_Rst();


}


/////////////////////////////////////////////////////////////////////
//Read an entire row, row boundries must be kept
void NVMReadRow(unsigned long addr,unsigned long *buff){
//unsigned long *buff;//[128] = {0};
unsigned long j;
unsigned long *ptr;

 ptr = (unsigned long*)addr;
 //extract therow from flash memory
 for(j = 0;j < 128;j++){
    buff[j] = *(ptr+j);
 }
}

//////////////////////////////////////////////////////////
//retrieve 4 32bit words from flash memory
void NVMReadQuad(unsigned long addr,unsigned long *words){
unsigned long j;
unsigned long *ptr;

 ptr = (unsigned long*)addr;
 //extract therow from flash memory
 for(j = 0;j < 4;j++){
    words[j] = *(ptr+j);
 }
}

/////////////////////////////////////////////////////////
//Read a 32bit word from flash
unsigned long NVMReadWord(void *addr){
unsigned long val;

    val = *(unsigned long*)addr;

   return val;
}

/////////////////////////////////////////////////////////////////////
//Get the address of the P value in G10 Lnnn Pnnn Xnnn Ynnn Znnn Annn
unsigned long Get_Address_Pval(int recipe){
unsigned long addr = 0;
   switch(recipe){
   case 0:break;
   case 1:addr =(unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2:addr =(unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3:addr =(unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4:addr =(unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5:addr =(unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6:addr =(unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7:addr =(unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8:addr =(unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9:addr =(unsigned long)FLASH_Settings_VAddr_P9;break;
 }
 return addr;
}