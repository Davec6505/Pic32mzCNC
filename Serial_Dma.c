#include "Serial_Dma.h"

#define err(x,y) x##y
#define DMAx_err(x,y) (#x " " #y)

char rxBuf[200] = {0}  absolute 0xA0002000 ; //resides in flash ??
char txBuf[200] = {0}  absolute 0xA0002200 ;
char cherie[] = " CHERIF Error\r";
char dma0[] = "DMA0_";
char dma1[] = "DMA1_";
const char newline[] = "\r\n";

char dma0int_flag;
char dma1int_flag;



////////////////////////////////////////////////////////////////
//DMA Config
void DMA_global(){
    //Enable the whole DMA module
    DMACONSET = 0x8000;
    DMA0();
    DMA1();
}


/************************************************************
* This is the DMA channel 0 setup for the receiver
* it is setup to auto enable after a block transfer or
* pattern match of '\r' we can enable the 2 char pattern
* match if needed by setting PATLEN bit on.
* Destination size is 200 . a pattern match must be
* Sent or a block transfer will only take place after
* 200 bytes. An abort can be forced by setting the CABORT bit
************************************************************/
void  DMA0(){
    //Disable DMA0 IE
    IEC4CLR      = 0x40;
    IFS4CLR      = 0x40;
    
    //Disable DMA0 and reset priority
    DCH0CONCLR = 0x8003;

    //1INTERRUPT IRQ NUMBER for UART 2 TX (146) | [0x10 = SIRQEN] [0x30 = PATEN & SIRQEN]
    DCH0ECON      =  (146 << 8 ) | 0x30;
    
    //Pattern data
    DCH0DAT       =  '\r';
    
    //Source address as UART_RX
    DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
    DCH0SSIZ      = 1;                 // source size = 1byte at a time

    //Destination address  as RxBuffer
    DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
    DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
   
    //Cell size as 1 byte
    DCH0CSIZ      = 1  ;  // bytes transferred in the background
    
    
    // Clear existing events, disable all interrupts
    DCH0INTCLR    = 0x00FF00FF ;
    //Enable [CHBCIE && CHERIE] Interrupts
    DCH0INTSET      =  0x90000;
    
    //Interrupt setup
    //clear DMA channel priority and sub-priority
    IPC33CLR     = 0x160000;
    //Set priority 5 sub-priority 1
    IPC33SET      = 0x00140000;
    //set DMA0IE bit
    IEC4SET       = 0x40;
    IFS4CLR       = 0x40;
    //PATLEN[11] && CHEN[7] && CHAEN[4] && PRIOR[1:0] 
    //Set up AutoEnable & Priority as 3       .
    DCH0CONSET      = 0X0000013;
    
}

////////////////////////////////////////
//DMA0 on control
void DMA0_Enable(){
   //CHEN[7]
   //Turn on DMA0
   /******************************************************
    *"A new understanding" [SET CLR INV] will affect the
    *the entire word with 0's as well as 1's , this meand
    *or the bit you need to set, contrary to my initial
    *understanding of SET CLR & INV 'MORE REASEARCH NEEDED'
    *****************************************************/
   DCH0CONSET  |= 1<<7;
}

////////////////////////////////////////
//DMA0 off control
void DMA0_Disable(){
  //Disable DAM0 module and clear priority level
   DCH0CONCLR  |= 1<<7;
   //DCH0CONbits.CHEN = 0;
}

////////////////////////////////////////
//DMA0 IRQ   UART2 RX
void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
 int i = 0;

    dma0int_flag = DCH0INT & 0x00FF;         //flags to sample in code if needed

 // THIS CHANNEL IS AUTOMATICALLY ENABLED AFTER A BLOCK
 // OR ERROR ABORT EVENT, THIS SHOULD TAKE PLACE IF A
 // '\n' HAS BEEN RECIEVED OR 200 BYTES EXCEEDED
    if (DCH0INTbits.CHBCIF == 1) {

      // LOOPBACK EXAMPLE USE THIS TO SEND DATA
      // ENABLE DMA1 FOR LOOPBACK
     // i = strlen(rxBuf)+1;
     // strncpy(txBuf, rxBuf, i);  // copy RxBuf -> TxBuf  BUFFER_LENGTH
     // DCH1SSIZ            = i ;  // change the size of block register
     // DMA1_Enable();             //enabling the dma forces a write

    }

    // CHANNEN ADDRESS ERROR FLAF
    if( CHERIF_bit == 1){       // test error int flag
       //LOOPBACK RECIEVE ERROR COULD BE SPECIFIC MSG
       strcpy(txBuf,DMAx_err(dma0,cherie));
       UART2_Write_Text(txBuf);
       //DCH1SSIZ = 13;           //set block size of transfer
       //DCH1ECONbits.CFORCE = 1 ;// force DMA1 interrupt trigger
    }
    
    DCH0INTCLR    = 0x000000ff;
    IFS4CLR       = 0x40;
}

/******************************************************
* This is the DMA setup for the UART2 transmitter and
* is not auto enabled, this will be done everytime a
* UART transfer out need to take place. The loopback 
* is temporary and is done from within the DMA0 IRQ
* Vector, The steps within this Vector to loopback
* will be used from within code to perfoem a data send
* A pattern match should abort the transfer and wait
* for the next CFORCE bit to be set, DCH1SSIZ can be
* dynamically assigned to force and abort but block
* transfer having been finnished
*******************************************************/
void DMA1(){
    //Disable DMA1 IE and clear IF
    //clear DMA channel priority and sub-priority
     IPC33CLR      = 0x17000000;
     IEC4CLR       = 0x7;
     
     //Disable DMA0 and reset priority
    DCH1CONCLR = 0x8003;

    //INTERRUPT IRQ NUMBER for UART 2 TX (147) | [0x10 = SIRQEN] [0x30 = PATEN & SIRQEN]
    DCH1ECON=(147 << 8)| 0x30;
    
    //Pattern Length and char to match not needed here ????
    //Pattern length = 0 = 1 byte
    DCH1DAT       = '\r';
    
    //Source address and size of transfer buffer
    DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
    DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
    
    //Destination Address and size which is 1byte
    //U1TX2REG for reply  [0xBF822220 = U1TXREG]
    DCH1DSA = KVA_TO_PA(0xBF822220) ;
    DCH1DSIZ = 1;
    
    //Cell size to transfer each transfer
    DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ

    // Clear existing events, disable all interrupts
    DCH1INTCLR    = 0x00FF00FF ;
    //[CHBCIE && CHERIE]
    //DCH1INTSET    =  0x90000;
    
    //Interrupt setup
    //clear DMA channel priority and sub-priority
    IPC33CLR     = 0x16000000;
    //Set priority 5 sub-priority 2
    IPC33SET    = 0x16000000;
    //set DMA1IE bit
    IEC4SET     = 0x80;
    //Clear DMA1IF bit
    IFS4CLR     = 0x80;
    
    //PATLEN[11] && CHEN[7] && CHAEN[4] && PRIOR[1:0]
    //Set up no AutoEnable & Priority as 3        .
    DCH1CONSET    = 0x00000003;

}
////////////////////////////////////////
//DMA1 on control
void DMA1_Enable(){
   DCH1CONSET |= 1<<7;
}

////////////////////////////////////////
//DMA1 off control
void DMA1_Disable(){
    DCH1CONCLR |= 1<<7;
}

/////////////////////////////////////////////////////
//UART2 TX Interrupt should be handed automatically
//from within the DMA controller, this IRQ vector
//is only used if errors are need to be checked
//or some otherfunctionality is need after a block
//transfer has completed
void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {

    // user flag to inform this int was triggered. should be cleared in software
    dma1int_flag = DCH1INT & 0x00FF;
    //Channel Block Transfer Complete Interrupt Flag bit
    if (DCH1INTbits.CHBCIF){
       dma1int_flag = 1;
       dma0int_flag = 0;
       //DMA1_Disable();
    }
     //Channel Address Error Interrupt Flag bit
    if( CHERIF_DCH1INT_bit == 1){

    }

    //However, for the interrupt controller, there is
    //just one dedicated interrupt flag bit per channel,
    //DMAxIF, and the corresponding interrupt enable/mask bits, DMAxIE.
    DCH1INTCLR  = 0x00FF;
    IFS4CLR     = 0x80;

}


//////////////////////////////////////////////////////
//DMA Print strings and variable arguments formating
int dma_printf(char* str,...){
  int i = 0, j=0;
  char buff[100]={0}, tmp[20];
  char * str_arg;
  
 //Variable decleration of type va_list
  va_list va;
 //initialize the va_list via themacro va_start(arg1,arg2)
 //arg1 is type va_list and arg2 is type var preceding elipsis
 va_start(va,str);
 
 while(str && str[i]){
    if(str[i] == '%'){
     i++;
     switch(str[i]){
        case 'c':
             //convert to ASCII cahr
             buff[j] = (char)va_arg(va,int);
             j++;
             break;
        case 'd':
             //convert to decimal
             //_itoa(va_arg( va, int ), tmp, 10);
             IntToStr(va_arg(va,int),tmp);
             strcpy(&buff[j], tmp);
             j += strlen(tmp);
             break;
        case 'l':
             //convert to decimal
             //_itoa(va_arg( va, int ), tmp, 10);
             LongToStr(va_arg(va,int),tmp);
             strcpy(&buff[j], tmp);
             j += strlen(tmp);
             break;
        case 'x':
        case 'X':
             //convert to hex
             _itoa(va_arg( va, int ), tmp, 16);
             strcpy(&buff[j], tmp);
             j += strlen(tmp);
             break;
        case 'o':
        case 'O':
             //convert to octal
             _itoa(va_arg( va, int ), tmp, 8);
             strcpy(&buff[j], tmp);
             j += strlen(tmp);
             break;
        case 's':
             //copy string
             str_arg = va_arg( va, char* );
             strcpy(&buff[j], str_arg);
             j += strlen(str_arg);
             break;
     }
    }else{
       buff[j] = str[i];
       j++;
    }
    i++;
 }
 buff[j] = 0;
 strncpy(txBuf,buff,j);
 DCH1SSIZ    = j ;
 DMA1_Enable();
 return j;

}

char * _itoa(int i, char *strout, int base){
  char *str = strout;
  int digit, sign = 0;
  if (i < 0) {
    sign = 1;
    i *= -1;
  }
  while(i) {
    digit = i % base;
    *str = (digit > 9) ? ('A' + digit - 10) : '0' + digit;
    i = i / base;
    str ++;
  }
  if(sign) {
  *str++ = '-';
  }
  *str = '\0';
  _strrev(strout);
  return strout;
}

char *_strrev (char *str){
  int i;
  int len = 0;
  char c;
  if (!str)
    return NULL;
  while(str[len] != '\0'){
    len++;
  }
  for(i = 0; i < (len/2); i++)
  {
    c = str[i];
    str [i] = str[len - i - 1];
    str[len - i - 1] = c;
  }
  return str;
}