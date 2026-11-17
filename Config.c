/* 
 * TODO: Review and update output compare module setup for OC7 for PWM to spindle
 *
*/


#include "Config.h"

#include "coretimer.h"



void PinMode(){

//Start by disabling global interrupts
     DI();

//Unlock KSEG to write to SFR's
     SYSKEY = 0xAA996655;
     SYSKEY = 0x556699AA;
     CFGCONbits.OCACLK = 1;
     SYSKEY = 0x33333333;

//Turn off the JTAG Debug big
     JTAGEN_bit = 0;
     Delay_ms(100);
     
//Turn off all analogs
     ANSELA = 0X0000;
     TRISA  = 0X0000;
     ANSELB = 0X0000;
     TRISB  = 0X0000;
     ANSELC = 0X0000;
     TRISC  = 0X0000;
     ANSELD = 0X0000;
     TRISD  = 0X0000;
     ANSELE = 0X0000;
     TRISE  = 0X0000;
     ANSELG = 0X0000;
     TRISG  = 0X0000;

     
     
     CNPUB  = 0;//1 << 15;
     CNPUF  = 0;//1 << 3;

//outputs
    LED1_Dir = 0;
    LED2_Dir = 0;
    LED3_Dir = 0;
    LED4_Dir = 0;

//INPUTS
    SW1_Dir = 1;
    SW2_Dir = 1;
    
    TRISG7_bit = 1;
    TRISG8_bit = 1;

//setup the performance of the sys clocks
    set_performance_mode();

//Remapping of Uart 2 pins
    Unlock_IOLOCK();
  //UART2 PIN MAPPING
#if BOARD == BOARD_FLIPNCLICK
     PPS_Mapping_NoLock(_RPC2, _OUTPUT, _U2TX);    // RC2 = UART2 TX
     PPS_Mapping_NoLock(_RPC3, _INPUT,  _U2RX);    // RC3 = UART2 RX
#elif BOARD == BOARD_CLICKER2
     PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);    // RE8 = UART2 TX
     PPS_Mapping_NoLock(_RPE9, _INPUT,  _U2RX);    // RE9 = UART2 RX
#endif

  //UART5 PIN MAPPING on the flipnClick this is used for communication but it asserts RTS/CTS lines which may need handling
#if UART_BOOTLOADER == 1
     PPS_Mapping_NoLock(_RPD15, _OUTPUT, _U5TX);    // Sets pin PORTD.B15 to be Output and maps UART5 Transmit
     PPS_Mapping_NoLock(_RPD14, _INPUT,  _U5RX);    // Sets pin PORTD.B14 to be Input and maps UART5 Receive
#endif

     //SPI1 Pins for SDI and SDO for ENC28J60 Module
     PPS_Mapping_NoLock(_RPD2, _INPUT, _SDI1);
     PPS_Mapping_NoLock(_RPD3, _OUTPUT, _SDO1);

     //OUTPUT PULSE TO Spindle
     PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //Spindle TMR7

     //lIMIT SWITCHES ? do i need interrupt mapping for them??
     // TODO: limits are polled for now. Check each limit pin's PPS input
     // group before mapping INT1/INT2/INT4 to them (Flip&Click: RF2, RB8, RB10).
    Lock_IOLOCK();
    

//Memory manager initialize
   MM_Init();
   

//TMR 1 & 8 config
   InitTimer1();

   InitTimer8();
  

//Limits initialize
  Limit_Initialize();
   

//set up output compare module for oc3 RF1 pin
  OutPutPulseXYZ();
  SetPinMode();


//Setup platform
  SetInitialSizes(STPS);
  

//UART RX interrupts with DMA TX.
   Serial_Init(SERIAL_MODE_RX_IRQ_DMA_TX);
    
//configure the uart the interrupts
 // Uart2InterruptSetup();

 // Core Timer interrupt will toggle LED4
 CORETIMER_Initialize();
 CORETIMER_Start();


//Enable the interrupts here so uart can report back
 EnableInterrupts();

//init all default settings
 settings_init(0);
 settings_init(1);
 //settings_read_coord_data();
 


}




void set_performance_mode(){
unsigned long cp0;

//setup the clks performance for all periphials
    DI(); // Disable all interrupts
    
   //Enable multi vector, and set TPC<2:0> to <= 4
   //MULTI Vect, TPC & EDGE Detect refer to
   // ac:Interrupts  app note.
   INTCONSET = 0x00001400;
    // Unlock Sequence
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;

    // Peripheral Bus 1 cannot be turned off, so there's no need to turn it on
    PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)

    // PB2DIV  UART / SPI / I2C / PMP
    UEN0_bit = 1;
    UEN1_bit = 1;
    PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
    while(!PB2DIVbits.PBDIVRDY);
    PB2DIVbits.PBDIV = 0x03; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 4)

    // PB3DIV   TIMERS
    PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
    while(!PB3DIVbits.PBDIVRDY);
    PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)

    // PB4DIV
    PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
    while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)

    // PB5DIV
    PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
    while(!PB5DIVbits.PBDIVRDY);
    PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)

    // PB7DIV
    PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
    while(!PB7DIVbits.PBDIVRDY);
    PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)

    // PB8DIV
    PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
    while(!PB8DIVbits.PBDIVRDY);
    PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)

    // PRECON - Set up prefetch
    PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
    PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
    PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)

    // Set up caching

    cp0 = CP0_GET(CP0_CONFIG);
    cp0 &= ~0x07;
    cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
    CP0_SET(CP0_CONFIG,cp0);

    // Lock Sequence
    SYSKEY = 0x33333333;
    PRISS = 0x76543210;   //priority n uses shadow set n; every ISR is ics ICS_SRS
    // SETTING UP PREFETCH MODULE
    PREFEN0_bit = 1;
    PREFEN1_bit = 1;
    PFMWS0_bit = 0;
    PFMWS1_bit = 1;
    PFMWS2_bit = 0;
}


//configure the output pulse mode OCx  use 16bit as 1.28us tick on tmrs
// This will be used for PWM output for Spindle only.
void OutPutPulseXYZ(){

  OC5CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
  OC2CON = 0x0000; // disable OC5 module |
  OC7CON = 0X0000; // disable OC8 module |_using tmr6
  OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
  OC6CON = 0x0000; // disable OC5 module |
  OC8CON = 0X0000; // disable OC8 module |_using tmr6
  
//clear  Tmr7 ready to config for PWM
  T7CON  = 0x0000;  // disable Timer6  OC8

//setup  Tmr7 as 1:64 prescaler 16bit
  T7CON  = 0x0030;  //   a prescaler of 1:64 to get 1.28usec tick resolution
  
// Set period (PR2 is 32-bits wide) and common to all OCx compares
  PR7    = 0xFFFF;   //OC8
  
//setup OC7 32bit but only using in 16bit mode 
  OC8CON = 0x000C; //C Conf OC8 module for dual single Pulse output 16bit tmr7

/*
 * Initialize PR2 to a value  >  OCxRS  >  OC3R, to start output compare.
 * TMR2 must be forced to PR2's value then this will force OC3 bit on as
 * soon as a match between TMR2 and PR2 is made a force on OC3 bit is done,
 * TMR continues to count from 0 to OC3RS value, when a match is made a
 * reset on OC7 bit and interrupt OC7IF is set.
 */
  OC7R   = 0x5;        // Z_Axis Initialize Compare Register 1
  OC7RS  = 0x234;      // Z_Axis Initialize Secondary Compare Register 1
  


  
//interrupt priority and enable set Z_Axis
  OC7IP0_bit = 1;  // Set OC8 interrupt priority to 6
  OC7IP1_bit = 1;
  OC7IP2_bit = 0;
  OC7IS0_bit = 0;  // Set OC8 sub priority 2
  OC7IS1_bit = 1;
  OC7IF_bit  = 0;  // reset interrupt flag
  OC7IE_bit  = 0;  // enable interrupt
  
  
//set Timers on
  T7CONSET  = 0x8000; //C Enable Timer6 OC8
  
//wait for usgage of these modules before enaBling them
 // OC8CONSET = 0x8000; // Enable OC8
}