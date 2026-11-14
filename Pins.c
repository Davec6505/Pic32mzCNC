#include "Pins.h"

//////////////////////////////////////////////////////////
// Board pin maps. Select the board with BOARD in Pins.h //
//////////////////////////////////////////////////////////

//////////////////////////////////////
//ONBOARD SWITCHES AND LEDS (both boards)
sbit LED1 at LATA6_bit;
sbit LED1_Dir at TRISA6_bit;
sbit LED2 at LATA7_bit;
sbit LED2_Dir at TRISA7_bit;
sbit LED3 at LATE0_bit;
sbit LED3_Dir at TRISE0_bit;
sbit LED4 at LATE1_bit;
sbit LED4_Dir at TRISE1_bit;

sbit SW1 at RD10_bit;
sbit SW1_Dir at TRISD10_bit;
sbit SW2 at RD11_bit;
sbit SW2_Dir at TRISD11_bit;

//////////////////////////////////////////
//ENC28J60 pin names are fixed by __Lib_EthEnc28j60, which drives them itself.
//Reset is active low: it must sit high for the chip to run.

#if BOARD == BOARD_FLIPNCLICK
//////////////////////////////////////////////////////////
// FLIP&CLICK (Grbl Uno shield pinout)
//////////////////////////////////////////////////////////
// ETH click in mikroBUS C: SPI1, CS RD12, RST RG14
sbit SPI_Ethernet_CS at LATD12_bit;
sbit SPI_Ethernet_CS_Direction at TRISD12_bit;
sbit SPI_Ethernet_Rst at LATG14_bit;
sbit SPI_Ethernet_Rst_Direction at TRISG14_bit;

sbit EN_Steppers at LATF3_bit;          // all drivers, active low
sbit EN_Steppers_Dir at TRISF3_bit;

sbit DIR_StepX at LATF12_bit;
sbit DIR_Step_PinDirX at TRISF12_bit;
sbit PLS_StepX at LATD0_bit;
sbit PLS_Step_PinDirX at TRISD0_bit;

sbit DIR_StepY at LATB15_bit;
sbit DIR_Step_PinDirY at TRISB15_bit;
sbit PLS_StepY at LATF13_bit;
sbit PLS_Step_PinDirY at TRISF13_bit;

sbit DIR_StepZ at LATC13_bit;      // RC13 = SOSCI, needs FSOSCEN off
sbit DIR_Step_PinDirZ at TRISC13_bit;
sbit PLS_StepZ at LATF8_bit;
sbit PLS_Step_PinDirZ at TRISF8_bit;

// TODO: A axis DIR/STEP not wired yet; left on the Clicker2 pins
sbit DIR_StepA at LATE5_bit;
sbit DIR_Step_PinDirA at TRISE5_bit;
sbit PLS_StepA at LATF1_bit;
sbit PLS_Step_PinDirA at TRISF1_bit;

//Limits
sbit X_Min_Limit at RF2_bit;
sbit X_Min_Limit_Dir at TRISF2_bit;
sbit Y_Min_Limit at RB8_bit;
sbit Y_Min_Limit_Dir at TRISB8_bit;
sbit Z_Min_Limit at RB10_bit;
sbit Z_Min_Limit_Dir at TRISB10_bit;

#elif BOARD == BOARD_CLICKER2
//////////////////////////////////////////////////////////
// CLICKER2   ac:Clicker2_Pinouts     ac:Clicker2_Dwg
//////////////////////////////////////////////////////////
// One shared enable, as on the Flip&Click. The old per-axis
// enables (RG9 RE4 RA5) are unused; wire all drivers to RG14.
sbit EN_Steppers at LATG14_bit;         // all drivers, active low
sbit EN_Steppers_Dir at TRISG14_bit;

// ENC28J60 as originally wired on the Clicker2
sbit SPI_Ethernet_CS at LATD13_bit;
sbit SPI_Ethernet_CS_Direction at TRISD13_bit;
sbit SPI_Ethernet_Rst at LATE2_bit;
sbit SPI_Ethernet_Rst_Direction at TRISE2_bit;

sbit DIR_StepX at LATG12_bit;
sbit DIR_Step_PinDirX at TRISG12_bit;
sbit PLS_StepX at LATD4_bit;
sbit PLS_Step_PinDirX at TRISD4_bit;

sbit DIR_StepY at LATB15_bit;
sbit DIR_Step_PinDirY at TRISB15_bit;
sbit PLS_StepY at LATD5_bit;
sbit PLS_Step_PinDirY at TRISD5_bit;

sbit DIR_StepZ at LATG15_bit;
sbit DIR_Step_PinDirZ at TRISG15_bit;
sbit PLS_StepZ at LATF0_bit;
sbit PLS_Step_PinDirZ at TRISF0_bit;

sbit DIR_StepA at LATE5_bit;
sbit DIR_Step_PinDirA at TRISE5_bit;
sbit PLS_StepA at LATF1_bit;
sbit PLS_Step_PinDirA at TRISF1_bit;

//Limits
// TODO: Y limit shares RB15 with DIR_StepY on this map
sbit X_Min_Limit at RF3_bit;
sbit X_Min_Limit_Dir at TRISF3_bit;
sbit Y_Min_Limit at RB15_bit;
sbit Y_Min_Limit_Dir at TRISB15_bit;
sbit Z_Min_Limit at RB1_bit;
sbit Z_Min_Limit_Dir at TRISB1_bit;

#else
#error "Pins.c: unknown BOARD"
#endif
