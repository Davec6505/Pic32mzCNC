#ifndef PINS_H
#define PINS_H

////////////////////////////////////////////////////
//BOARD SELECT: pin maps are in Pins.c, PPS in Config.c
#define BOARD_CLICKER2    1
#define BOARD_FLIPNCLICK  2

#ifndef BOARD
#define BOARD  BOARD_FLIPNCLICK
#endif

////////////////////////////////////////////////////
//LEDS
extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;
extern sfr sbit LED3;
extern sfr sbit LED3_Dir;
extern sfr sbit LED4;
extern sfr sbit LED4_Dir;

///////////////////////////////////////////////////
//ON BOARD SWITRCHES
extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;


///////////////////////////////////////////
//Shared stepper driver enable (active low, Grbl shield style)
extern sfr sbit EN_Steppers;
extern sfr sbit EN_Steppers_Dir;

///////////////////////////////////////////
//sfr pin modes
//Xaxis
extern sfr sbit DIR_StepX;
extern sfr sbit DIR_Step_PinDirX;
extern sfr sbit PLS_StepX;
extern sfr sbit PLS_Step_PinDirX;
extern sfr sbit RST_StepX;
extern sfr sbit RST_Step_PinDirX;
extern sfr sbit SLP_FLT_StepX;
extern sfr sbit SLP_FLT_Step_PinDirX;
extern sfr sbit FLT_StepX;
extern sfr sbit FLT_Step_PinDirX;
//Yaxis
extern sfr sbit RST_StepY;
extern sfr sbit RST_Step_PinDirY;
extern sfr sbit SLP_FLT_StepY;
extern sfr sbit SLP_FLT_Step_PinDirY;
extern sfr sbit PLS_StepY;
extern sfr sbit PLS_Step_PinDirY;
extern sfr sbit DIR_StepY;
extern sfr sbit DIR_Step_PinDirY;
extern sfr sbit FLT_StepY;
extern sfr sbit FLT_Step_PinDirY;
//Zaxis
extern sfr sbit RST_StepZ;
extern sfr sbit RST_Step_PinDirZ;
extern sfr sbit SLP_FLT_StepZ;
extern sfr sbit SLP_FLT_Step_PinDirZ;
extern sfr sbit PLS_StepZ;
extern sfr sbit PLS_Step_PinDirZ;
extern sfr sbit DIR_StepZ;
extern sfr sbit DIR_Step_PinDirZ;
extern sfr sbit FLT_StepZ;
extern sfr sbit FLT_Step_PinDirZ;
//Aaxis
extern sfr sbit RST_StepA;
extern sfr sbit RST_Step_PinDirA;
extern sfr sbit SLP_FLT_StepA;
extern sfr sbit SLP_FLT_Step_PinDirA;
extern sfr sbit PLS_StepA;
extern sfr sbit PLS_Step_PinDirA;
extern sfr sbit DIR_StepA;
extern sfr sbit DIR_Step_PinDirA;
extern sfr sbit FLT_StepA;
extern sfr sbit FLT_Step_PinDirA;

//Limits
extern sfr sbit X_Min_Limit;
extern sfr sbit X_Min_Limit_Dir;
extern sfr sbit Y_Min_Limit;
extern sfr sbit Y_Min_Limit_Dir;
extern sfr sbit Z_Min_Limit;
extern sfr sbit Z_Min_Limit_Dir;


//////////////////////////////////////////////////////
//ENC28J60 Pins assignmetn
extern sfr sbit SPI_Ethernet_CS;
extern sfr sbit SPI_Ethernet_CS_Direction;
extern sfr sbit SPI_Ethernet_Rst;
extern sfr sbit SPI_Ethernet_Rst_Direction;




/////////////////////////////////////////////////////
//Direction pins  0 =ve 1 || = -ve
#define X_DIR_DIR  1
#define Y_DIR_DIR  0
#define Z_DIR_DIR  1
#define A_DIR_DIR  0


#endif