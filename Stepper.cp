#line 1 "C:/Users/Git/Pic32mzCNC/Stepper.c"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
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
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
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
#line 48 "c:/users/git/pic32mzcnc/kinematics.h"
typedef struct {
char set: 1;
char home: 1;
char rev: 1;
char back: 1;
char complete: 1;
unsigned int home_cnt;
}homing_t;


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
 long acc;
 long dec;

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

 long steps_abs_position;

 double mm_position;

 double mm_home_position;

 double max_travel;

 int axis_dir;

 char master: 1;

 homing_t homing;
}STP;
extern STP STPS[ 6 ];
#line 133 "c:/users/git/pic32mzcnc/kinematics.h"
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
#line 10 "c:/users/git/pic32mzcnc/gcode.h"
extern char gcode_instruction[200];
#line 52 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char s;
 int motion_mode;
 char inverse_feed_rate_mode;
 char inches_mode;
 char absolute_mode;
 char program_flow;
 char spindle_direction;
 char coolant_mode;
 char tool;

 char plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 char coord_select;
 float feed_rate;

 float position[3];
 float coord_system[ 6 ];
 float coord_offset[ 6 ];

 float next_position[ 6 ];
} parser_state_t;
extern parser_state_t gc;



void G_Instruction(int mode);
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
void Get_Line(char *str,int dif);
void Reset_Ring();
int Loopback();



void DMA1_Enable();
void DMA1_Disable();
int DMA_Busy(int channel);
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
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
#line 1 "c:/users/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/print.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 28 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


void delay_ms(unsigned int ms);


void delay_us(unsigned long us);


void sys_sync_current_position();
#line 31 "c:/users/git/pic32mzcnc/protocol.h"
void Str_Initialize();

void Sample_Ringbuffer();

int strsplit(char arg[ 10 ][ 60 ],char str[250], char c);
int cpystr(char *strA,const char *strB,int indx,int num_of_char);
int str2int(char *str,int base);


 void PrintDebug(char *strA,char *strB,void *ptr);
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
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
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/planner.h"
#line 1 "c:/users/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 49 "c:/users/git/pic32mzcnc/planner.h"
typedef struct genVars{
 int Single_Dual;
 unsigned short running: 1;
 unsigned short startPulses: 1;
 int Tog;
 int AxisNo;

 long dif;
 long dA;
 long dB;
 long dC;
 long prevA;
 long prevB;
 long prevC;
 long over;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
 char cir: 1;
}sVars;
extern sVars SV;



void plan_init(long accel,long decel);

void speed_cntr_Move(long mmSteps, long speed, int axis_combo);

unsigned long sqrt_(unsigned long v);
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;










extern unsigned int Toggle;



typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za,yx,zx,ax,zy,ay,az}axis_combination ;

extern _axis_ _axis;
extern volatile axis_combination axis_xyz;







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
#line 3 "C:/Users/Git/Pic32mzCNC/Stepper.c"
char txt_A[9];



_axis_ _axis;
axis_combination axis_xyz;


unsigned char AxisNo;
unsigned int Toggle;





void SetPinMode(){


 EN_Step_PinDirX = 0;
 DIR_Step_PinDirX = 0;






 EN_Step_PinDirY = 0;
 DIR_Step_PinDirY = 0;






 EN_Step_PinDirZ = 0;
 DIR_Step_PinDirZ = 0;






 EN_Step_PinDirA = 0;
 DIR_Step_PinDirA = 0;





}



void EnStepperX(){


 EN_StepX = 0;
}

void EnStepperY(){


 EN_StepY = 0;
}
void EnStepperZ(){


 EN_StepZ = 0;
}
void EnStepperA(){


 EN_StepA = 0;
}


void DisableStepper(){
 EN_StepX = 1;
 EN_StepY = 1;
 EN_StepZ = 1;
 EN_StepA = 1;
}
#line 97 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void Step_Cycle(int axis_No){

 STPS[axis_No].step_count++;

 STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
 toggleOCx(axis_No);
}



void toggleOCx(int axis_No){
 switch(axis_No){
 case X:
 OC5R = 0x5;
 OC5RS = STPS[X].step_delay & 0xFFFF;
 TMR2 = 0xFFFF;
 OC5CON = 0x8004;
 break;
 case Y:
 OC2R = 0x5;
 OC2RS = STPS[Y].step_delay & 0xFFFF;
 TMR4 = 0xFFFF;
 OC2CON = 0x8004;
 break;
 case Z:
 OC7R = 0x5;
 OC7RS = STPS[Z].step_delay & 0xFFFF;
 TMR6 = 0xFFFF;
 OC7CON = 0x8004;
 break;
 case A:
 OC3R = 0x5;
 OC3RS = STPS[A].step_delay & 0xFFFF;
 TMR5 = 0xFFFF;
 OC3CON = 0x800C;
 break;
 case B:
 OC6R = 0x5;
 OC6RS = STPS[B].step_delay & 0xFFFF;
 TMR3 = 0xFFFF;
 OC6CON = 0x800C;
 break;
 case C:
 OC8R = 0x5;
 OC8RS = STPS[C].step_delay & 0xFFFF;
 TMR7 = 0xFFFF;
 OC8CON = 0x800C;
 break;
 default:
 break;
 }

}



int Pulse(int axis_No){
#line 159 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 switch(STPS[axis_No].run_state) {
 case  0 :
 STPS[axis_No].run_state =  0 ;
 SV.Tog = 1;
 break;

 case  1 :

 AccDec(axis_No);
 if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;
 STPS[axis_No].run_state =  3 ;
 }
 if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
 STPS[axis_No].run_state =  3 ;
 }


 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;
 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  3 :
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;



 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;
 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  2 :

 AccDec(axis_No);


 if(STPS[axis_No].accel_count > -1 ){
 STPS[axis_No].run_state =  0 ;
 }
 break;
 default:break;
 }
 return axis_No;
}



void AccDec(int axis_No){
 STPS[axis_No].accel_count++;
 STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
 STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
 STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
}




void Single_Axis_Enable(_axis_ axis_){
 switch(axis_){
 case X:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 break;
 case Y:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 break;
 case Z:
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case A:
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case B:
 OC6IE_bit = 1;OC6CONbits.ON = 1;
 break;
 case C:
 OC8IE_bit = 1;OC8CONbits.ON = 1;
 break;
 default:
 break;
 }
}


void disableOCx(){
 OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC2IE_bit = 0;OC2CONbits.ON = 0;
 OC7IE_bit = 0;OC7CONbits.ON = 0;

 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC6IE_bit = 0;OC6CONbits.ON = 0;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
}





void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
 OC5IF_bit = 0;

 if(SV.Single_Dual == 0){
 SingleStepAxis(X);
 }else{
 if(STPS[X].master = 1){
 if(axis_xyz == xy)
 Axis_Interpolate(X,Y);
 else if(axis_xyz == xz)
 Axis_Interpolate(X,Z);
 else if(axis_xyz == yz)
 Axis_Interpolate(Y,Z);
 }
 }
}




void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
 OC2IF_bit = 0;

 if(SV.Single_Dual == 0){
 SingleStepAxis(Y);
 }else {
 if(STPS[Y].master = 1){
 if(axis_xyz == xy )
 Axis_Interpolate(X,Y);
 else if(axis_xyz == yz)
 Axis_Interpolate(Y,Z);
 else if(axis_xyz == ya)
 Axis_Interpolate(Y,A);
 }
 }
}




void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
 OC7IF_bit = 0;

 if(SV.Single_Dual == 0){
 SingleStepAxis(Z);
 }else{
 if(STPS[Z].master = 1){
 if(axis_xyz == xz)
 Axis_Interpolate(X,Z);
 else if(axis_xyz == yz)
 Axis_Interpolate(Y,Z);
 else if(axis_xyz == za)
 Axis_Interpolate(Z,A);

 }
 }

}




void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
 OC3IF_bit = 0;

 if(SV.Single_Dual == 0){
 SingleStepAxis(A);
 }else{
 if(STPS[A].master = 1){
 if(axis_xyz == xa)
 Axis_Interpolate(X,A);
 else if(axis_xyz == ya)
 Axis_Interpolate(Y,A);
 else if(axis_xyz == za)
 Axis_Interpolate(Z,A);
 }
 }
}






void SingleStepAxis(int axis){
 if(STPS[axis].step_count >= STPS[axis].dist){
 StopAxis(axis);
 }
 else{
 Step_Cycle(axis);
 Pulse(axis);
 }
}

void StopAxis(int axis){
 switch(axis){
 case X:
 OC5IE_bit = 0;
 OC5CONbits.ON = 0;
 break;
 case Y:
 OC2IE_bit = 0;
 OC2CONbits.ON = 0;
 break;
 case Z:
 OC7IE_bit = 0;
 OC7CONbits.ON = 0;
 break;
 case A:
 OC3IE_bit = 0;
 OC3CONbits.ON = 0;
 break;
 default : break;
 }
 STPS[axis].stopAxis = 1;
}






void Axis_Interpolate(int axisA,int axisB){

 if((STPS[axisA].step_count > SV.dA)||(STPS[axisB].step_count > SV.dB)){
 StopAxis(axisA);
 StopAxis(axisB);
 return;
 }

 if(SV.dA >= SV.dB){
 Step_Cycle(axisA);
 if(!SV.cir)
 Pulse(axisA);
 if(SV.dif < 0){
 SV.dif +=  ((2)*(SV.dB)) ;
 }else{
 SV.dif +=  ((2)*((SV.dB) - (SV.dA))) ;
 Step_Cycle(axisB);
 }
 }else{
 Step_Cycle(axisB);
 if(!SV.cir)
 Pulse(axisB);
 if(SV.dif < 0){
 SV.dif +=  ((2)*(SV.dA)) ;
 }else{
 SV.dif +=  ((2)*((SV.dA) - (SV.dB))) ;
 Step_Cycle(axisA);
 }
 }
}
