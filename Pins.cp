#line 1 "c:/Users/davec/GIT/Pic32mzCNC/Pins.c"
#line 1 "c:/users/davec/git/pic32mzcnc/pins.h"
#line 15 "c:/users/davec/git/pic32mzcnc/pins.h"
extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;
extern sfr sbit LED3;
extern sfr sbit LED3_Dir;
extern sfr sbit LED4;
extern sfr sbit LED4_Dir;



extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;




extern sfr sbit EN_Steppers;
extern sfr sbit EN_Steppers_Dir;




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


extern sfr sbit X_Min_Limit;
extern sfr sbit X_Min_Limit_Dir;
extern sfr sbit Y_Min_Limit;
extern sfr sbit Y_Min_Limit_Dir;
extern sfr sbit Z_Min_Limit;
extern sfr sbit Z_Min_Limit_Dir;




extern sfr sbit SPI_Ethernet_CS;
extern sfr sbit SPI_Ethernet_CS_Direction;
extern sfr sbit SPI_Ethernet_Rst;
extern sfr sbit SPI_Ethernet_Rst_Direction;
#line 9 "c:/Users/davec/GIT/Pic32mzCNC/Pins.c"
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










sbit SPI_Ethernet_CS at LATD12_bit;
sbit SPI_Ethernet_CS_Direction at TRISD12_bit;
sbit SPI_Ethernet_Rst at LATG14_bit;
sbit SPI_Ethernet_Rst_Direction at TRISG14_bit;

sbit EN_Steppers at LATF3_bit;
sbit EN_Steppers_Dir at TRISF3_bit;

sbit DIR_StepX at LATF12_bit;
sbit DIR_Step_PinDirX at TRISF12_bit;
sbit PLS_StepX at LATD0_bit;
sbit PLS_Step_PinDirX at TRISD0_bit;

sbit DIR_StepY at LATB15_bit;
sbit DIR_Step_PinDirY at TRISB15_bit;
sbit PLS_StepY at LATF13_bit;
sbit PLS_Step_PinDirY at TRISF13_bit;

sbit DIR_StepZ at LATC13_bit;
sbit DIR_Step_PinDirZ at TRISC13_bit;
sbit PLS_StepZ at LATF8_bit;
sbit PLS_Step_PinDirZ at TRISF8_bit;


sbit DIR_StepA at LATE5_bit;
sbit DIR_Step_PinDirA at TRISE5_bit;
sbit PLS_StepA at LATF1_bit;
sbit PLS_Step_PinDirA at TRISF1_bit;


sbit X_Min_Limit at RF2_bit;
sbit X_Min_Limit_Dir at TRISF2_bit;
sbit Y_Min_Limit at RB8_bit;
sbit Y_Min_Limit_Dir at TRISB8_bit;
sbit Z_Min_Limit at RB10_bit;
sbit Z_Min_Limit_Dir at TRISB10_bit;
