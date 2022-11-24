#line 1 "C:/Users/Git/Pic32mzCNC/Config.c"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
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
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 10 "c:/users/git/pic32mzcnc/gcode.h"
extern char gcode_instruction[200];
#line 52 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 uint8_t status_code;
 uint8_t motion_mode;
 uint8_t inverse_feed_rate_mode;
 uint8_t inches_mode;
 uint8_t absolute_mode;
 uint8_t program_flow;
 int8_t spindle_direction;
 uint8_t coolant_mode;
 float feed_rate;

 float position[3];
 uint8_t tool;

 uint8_t plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 uint8_t coord_select;
 float coord_system[ 6 ];

 float coord_offset[ 6 ];

} parser_state_t;
extern parser_state_t gc;



void gc_init();


uint8_t gc_execute_line(char *line);


void gc_set_current_position(int32_t x, int32_t y, int32_t z);
#line 13 "c:/users/git/pic32mzcnc/serial_dma.h"
extern char txt[];
extern char rxBuf[];
extern char txBuf[];

typedef struct{
 char temp_buffer[500];
 int head;
 int tail;
 int diff;
 char has_data: 1;
}Serial;

extern Serial serial;






void DMA_global();
void DMA0();
void DMA1();
void DMA0_Enable();
void DMA0_Disable();
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();
int Loopback();



void DMA1_Enable();
void DMA1_Disable();
int DMA_Busy(int channel);
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 50 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 uint8_t abort;
 uint8_t state;
 int homing;
 int homing_cnt;
 uint8_t auto_start;
 volatile uint8_t execute;
} system_t;
extern system_t sys;
#line 61 "c:/users/git/pic32mzcnc/kinematics.h"
typedef struct genVars{
 int Single_Dual;
 unsigned short running: 1;
 unsigned short startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long d2;
 long dx;
 long dy;
 long dz;
 long da;
 long px;
 long py;
 long pz;
 long pa;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
 char cir: 1;
}sVars;
extern sVars SV;

typedef struct{
char set: 1;
char home: 1;
char rev: 1;
char back: 1;
char complete: 1;
unsigned int home_cnt;
}Homing;
extern Homing homing[ 6 ];

typedef struct Steps{

 signed long microSec;

 unsigned short CheckStep: 1;

 unsigned short PLS_Step_ : 1;

 unsigned short StepBits: 1;

 unsigned short stopAxis: 1;

 unsigned char run_state ;

 long step_delay;

 long decel_start;

 long decel_val;

 long min_delay;

 long accel_count;
 long deccl_count;
 long acc_;
 long dec_;

 long step_count;

 long dist;

 long psingle;

 long new_step_delay;

 long last_accel_delay;

 long accel_lim;

 long max_step_lim;

 long rest;

 long StartUp_delay;

 signed long mmToTravel;

 long steps_position;

 double mm_position;

 double mm_home_position;

 double max_travel;

 int axis_dir;

 char master: 1;
}STP;
extern STP STPS[ 6 ];
#line 173 "c:/users/git/pic32mzcnc/kinematics.h"
void SetInitialSizes(STP axis[6]);


void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed);
void SingleAxisStep(double newxyz,long speed,int axis_No);


void mc_arc(double *position, double *target, double *offset, int axis_0,
 int axis_1,int axis_linear, double feed_rate,uint8_t invert_feed_rate,
 double radius, uint8_t isclockwise);
float hypot(float angular_travel, float linear_travel);
void r_or_ijk(double xCur,double yCur,double xFin,double yFin,
 double r, double i, double j, double k, int axis_A,int axis_B,int dir);


int GetAxisDirection(long mm2move);


void ResetHoming();
void Home(int axis);
void Home_Axis(double distance,long speed,int axis);
void Inv_Home_Axis(double distance,long speed,int axis);
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/planner.h"
#line 1 "c:/users/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 41 "c:/users/git/pic32mzcnc/planner.h"
void plan_init(long accel,long decel);

void speed_cntr_Move(long mmSteps, long speed, int axis_combo);

unsigned long sqrt_(unsigned long v);


unsigned int min_(unsigned long x, unsigned long y);


unsigned int max_(unsigned long x, unsigned long y);
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 31 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za,yx,zx,ax,zy,ay,az}axis_combination ;

extern _axis_ _axis;
extern axis_combination axis_xyz;







void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
int EnableSteppers(int steppers);
void DisableStepper();
void disableOCx();



void StepperConstants(long accel,long decel);


void SingleStepAxis(int axis);
void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);


int Pulse(int axis_No);
void toggleOCx(int axis_No);
void multiToggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Single_Axis_Enable(_axis_ axis_);

void Test_CycleX();
void Test_CycleY();
void Test_CycleZ();
void Test_CycleA();
#line 11 "c:/users/git/pic32mzcnc/timers.h"
struct Timer{
char clock;
char P1: 1;
char P2: 1;
unsigned int disable_cnt;
unsigned int (*Reset)(unsigned int time,unsigned int last_sec);
};
extern struct Timer TMR;


void InitTimer1();
void InitTimer8();
void ClockPulse();
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 22 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 34 "c:/users/git/pic32mzcnc/steptodistance.h"
long calcSteps( double mmsToMove, double Dia);
long leadscrew_sets(double move_distance);
long belt_steps(double move_distance);
double mm2in(double mm);
double in2mm(double inch);
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/limits.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 33 "c:/users/git/pic32mzcnc/limits.h"
struct limit {

char Pin: 1;
char Limit_Min: 1;
char Limit_Max: 1;
char T0: 1;
char T1: 1;
char T2: 1;
char T4: 1;
char new_val;
char old_Pval;
char old_Fval;

unsigned int Min_DeBnc;
unsigned int last_cnt_min;


long Soft_Limit_Min;

};



void Limit_Initialize();

void X_Min_Limit_Setup();
void Y_Min_Limit_Setup();
void Z_Min_Limit_Setup();
void A_Min_Limit_Setup();

char Test_Port_Pins(int axis);
char Test_Min(int axis);
void Reset_Min_Limit(int axis);
void Debounce_Limits(int axis);
void Reset_Min_Debounce(int axis);

char FP(int axis);
char FN(int axis);
#line 27 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();
void LcdI2CConfig();
void OutPutPulseXYZ();
int Temp_Move(int a);
void LCD_Display();
#line 5 "C:/Users/Git/Pic32mzCNC/Config.c"
void PinMode(){

 DI();

 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;
 CFGCONbits.OCACLK = 1;
 SYSKEY = 0x33333333;

 JTAGEN_bit = 0;
 Delay_ms(100);


 ANSELA = 0X0000;
 TRISA = 0X0000;
 ANSELB = 0X0000;
 TRISB = 0X0000;
 ANSELC = 0X0000;
 TRISC = 0X0000;
 ANSELD = 0X0000;
 TRISD = 0X0000;
 ANSELE = 0X0000;
 TRISE = 0X0000;
 ANSELG = 0X0000;
 TRISG = 0X0000;

 CNPUB = 0x0000;


 LED1_Dir = 0;
 LED2_Dir = 0;




 SW1_Dir = 1;
 SW2_Dir = 1;

 TRISG7_bit = 1;
 TRISG8_bit = 1;


 set_performance_mode();



 Unlock_IOLOCK();

 PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);
 PPS_Mapping_NoLock(_RPE9, _INPUT, _U2RX);

 PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
 PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);


 PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);
 PPS_Mapping_NoLock(_RPD5, _OUTPUT, _OC2);
 PPS_Mapping_NoLock(_RPF0, _OUTPUT, _OC7);
 PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);
 PPS_Mapping_NoLock(_RPG1, _OUTPUT, _OC6);
 PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);


 PPS_Mapping_NoLock(_RPF3, _INPUT, _INT1);
 PPS_Mapping_NoLock(_RPB15, _INPUT, _INT2);
 Lock_IOLOCK();







 InitTimer1();




 UartConfig();



 Uart2InterruptSetup();



 Limit_Initialize();



 DMA_global();
 DMA0_Enable();
 DMA1_Enable();



 OutPutPulseXYZ();
 SetPinMode();




 SetInitialSizes(STPS);
}

void UartConfig(){


 UART2_Init_Advanced(256000, 200000 , _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 Delay_ms(100);
}








void Uart2InterruptSetup(){

 URXISEL0_bit = 0;
 URXISEL1_bit = 0;


 UTXISEL0_bit = 0;
 UTXISEL1_bit = 0;


 IEC4CLR = 0xc000;

}

void set_performance_mode(){
unsigned long cp0;


 DI();




 INTCONSET = 0x00001400;

 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;


 PB1DIVbits.PBDIV = 1;


 UEN0_bit = 1;
 UEN1_bit = 1;
 PB2DIVbits.ON = 1;
 while(!PB2DIVbits.PBDIVRDY);
 PB2DIVbits.PBDIV = 0x07;


 PB3DIVbits.ON = 1;
 while(!PB3DIVbits.PBDIVRDY);
 PB3DIVbits.PBDIV = 3;


 PB4DIVbits.ON = 1;
 while (!PB4DIVbits.PBDIVRDY);
 PB4DIVbits.PBDIV = 0;


 PB5DIVbits.ON = 1;
 while(!PB5DIVbits.PBDIVRDY);
 PB5DIVbits.PBDIV = 1;


 PB7DIVbits.ON = 1;
 while(!PB7DIVbits.PBDIVRDY);
 PB7DIVbits.PBDIV = 0;


 PB8DIVbits.ON = 1;
 while(!PB8DIVbits.PBDIVRDY);
 PB8DIVbits.PBDIV = 1;


 PRECONbits.PFMSECEN = 0;
 PRECONbits.PREFEN = 0b11;
 PRECONbits.PFMWS = 0b100;



 cp0 = CP0_GET(CP0_CONFIG);
 cp0 &= ~0x07;
 cp0 |= 0b011;
 CP0_SET(CP0_CONFIG,cp0);


 SYSKEY = 0x33333333;
 PRISS = 0x76543210;

 PREFEN0_bit = 1;
 PREFEN1_bit = 1;
 PFMWS0_bit = 0;
 PFMWS1_bit = 1;
 PFMWS2_bit = 0;
}


void OutPutPulseXYZ(){
#line 218 "C:/Users/Git/Pic32mzCNC/Config.c"
 OC5CON = 0x0000;
 OC2CON = 0x0000;
 OC7CON = 0X0000;
 OC3CON = 0x0000;
 OC6CON = 0x0000;
 OC8CON = 0X0000;


 T2CON = 0x0000;
 T3CON = 0x0000;
 T4CON = 0x0000;
 T5CON = 0x0000;
 T6CON = 0x0000;
 T7CON = 0x0000;

 T2CON = 0x0030;
 T3CON = 0x0030;
 T4CON = 0x0030;
 T5CON = 0x0030;
 T6CON = 0x0030;
 T7CON = 0x0030;


 PR2 = 0xFFFF;
 PR3 = 0xFFFF;
 PR4 = 0xFFFF;
 PR5 = 0xFFFF;
 PR6 = 0xFFFF;
 PR7 = 0xFFFF;


 OC5CON = 0x0004;
 OC2CON = 0x0004;
 OC7CON = 0x0004;
 OC3CON = 0x000C;
 OC6CON = 0x000C;
 OC8CON = 0x000C;
#line 262 "C:/Users/Git/Pic32mzCNC/Config.c"
 OC5R = 0x5;
 OC5RS = 0x234;
 OC2R = 0x5;
 OC2RS = 0x234;
 OC7R = 0x5;
 OC7RS = 0x234;
 OC3R = 0x5;
 OC3RS = 0x234;
 OC6R = 0x5;
 OC6RS = 0x234;
 OC8R = 0x5;
 OC8RS = 0x234;



 OC5IP0_bit = 1;
 OC5IP1_bit = 1;
 OC5IP2_bit = 0;
 OC5IS0_bit = 0;
 OC5IS1_bit = 0;
 OC5IF_bit = 0;
 OC5IE_bit = 0;


 OC2IP0_bit = 1;
 OC2IP1_bit = 1;
 OC2IP2_bit = 0;
 OC2IS0_bit = 1;
 OC2IS1_bit = 0;
 OC2IF_bit = 0;
 OC2IE_bit = 0;


 OC7IP0_bit = 1;
 OC7IP1_bit = 1;
 OC7IP2_bit = 0;
 OC7IS0_bit = 0;
 OC7IS1_bit = 1;
 OC7IF_bit = 0;
 OC7IE_bit = 0;


 OC3IP0_bit = 1;
 OC3IP1_bit = 1;
 OC3IP2_bit = 0;
 OC3IS0_bit = 1;
 OC3IS1_bit = 1;
 OC3IF_bit = 0;
 OC3IE_bit = 0;


 OC6IP0_bit = 1;
 OC6IP1_bit = 1;
 OC6IP2_bit = 0;
 OC6IS0_bit = 1;
 OC6IS1_bit = 1;
 OC6IF_bit = 0;
 OC6IE_bit = 0;


 OC8IP0_bit = 1;
 OC8IP1_bit = 1;
 OC8IP2_bit = 0;
 OC8IS0_bit = 1;
 OC8IS1_bit = 1;
 OC8IF_bit = 0;
 OC8IE_bit = 0;


 T2CONSET = 0x8000;
 T4CONSET = 0x8000;
 T6CONSET = 0x8000;
 T5CONSET = 0x8000;
 T3CONSET = 0x8000;
 T7CONSET = 0x8000;





}
