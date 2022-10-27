#line 1 "C:/Users/Git/Pic32mzCNC/Pins.c"
#line 1 "c:/users/git/pic32mzcnc/pins.h"





extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;



extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;





extern sfr sbit EN_StepX;
extern sfr sbit EN_Step_PinDirX;
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

extern sfr sbit EN_StepY;
extern sfr sbit EN_Step_PinDirY;
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

extern sfr sbit EN_StepZ;
extern sfr sbit EN_Step_PinDirZ;
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

extern sfr sbit EN_StepA;
extern sfr sbit EN_Step_PinDirA;
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
#line 10 "C:/Users/Git/Pic32mzCNC/Pins.c"
 sbit LED2 at LATA9_bit;
 sbit LED2_Dir at TRISA9_bit;
 sbit LED1 at LATE7_bit;
 sbit LED1_Dir at TRISE7_bit;

 sbit SW1 at RC3_bit;
 sbit SW1_Dir at TRISC3_bit;
 sbit SW2 at RB0_bit;
 sbit SW2_Dir at TRISB0_bit;





sbit EN_StepX at LATG14_bit;
sbit EN_Step_PinDirX at TRISG14_bit;
sbit DIR_StepX at LATG12_bit;
sbit DIR_Step_PinDirX at TRISG12_bit;




sbit PLS_StepX at LATD4_bit;
sbit PLS_Step_PinDirX at TRISD4_bit;


sbit EN_StepY at LATG9_bit;
sbit EN_Step_PinDirY at TRISG9_bit;
sbit DIR_StepY at LATE2_bit;
sbit DIR_Step_PinDirY at TRISE2_bit;




sbit PLS_StepY at LATD5_bit;
sbit PLS_Step_PinDirY at TRISD5_bit;


sbit EN_StepZ at LATE4_bit;
sbit EN_Step_PinDirZ at TRISE4_bit;
sbit DIR_StepZ at LATG15_bit;
sbit DIR_Step_PinDirZ at TRISG15_bit;




sbit PLS_StepZ at LATF0_bit;
sbit PLS_Step_PinDirZ at TRISF0_bit;


sbit EN_StepA at LATA5_bit;
sbit EN_Step_PinDirA at TRISA5_bit;
sbit DIR_StepA at LATE5_bit;
sbit DIR_Step_PinDirA at TRISE5_bit;




sbit PLS_StepA at LATF1_bit;
sbit PLS_Step_PinDirA at TRISF1_bit;



sbit X_Min_Limit at RF3_bit;
sbit X_Min_Limit_Dir at TRISF3_bit;
sbit Y_Min_Limit at RB15_bit;
sbit Y_Min_Limit_Dir at TRISB15_bit;
