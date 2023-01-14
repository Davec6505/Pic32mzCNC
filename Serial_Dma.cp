#line 1 "C:/Users/Git/Pic32mzCNC/Serial_Dma.c"
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
long max(long a, long int b);
long min(long a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
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
#line 1 "c:/users/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 142 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 unsigned long p_msec;
 unsigned long steps_per_mm[ 4 ];
 float default_feed_rate;
 float default_seek_rate;
 float homing_feed_rate;
 float homing_seek_rate;
 float homing_pulloff;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 unsigned int homing_debounce_delay;
 char flags;
 char homing_dir_mask;
 char stepper_idle_lock_time;
 char decimal_places;
 char n_arc_correction;
 char microsteps;
 char pulse_microseconds;
 char invert_mask;

} settings_t;
extern settings_t settings;
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/flash_r_w.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 62 "c:/users/git/pic32mzcnc/flash_r_w.h"
unsigned int NVMWriteWord (void *address, unsigned long _data);
unsigned int NVMWriteQuad (void *address, unsigned long *_data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(unsigned long address);
static unsigned int NVMUnlock(unsigned long nvmop);
unsigned int NVM_ERROR_Rst();
static void NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static void NVM_WREN_Set();
static void NVM_WREN_Rst();
static unsigned int NVM_WREN_Wait();
void NVM_PWPAGE_Lock();
void NVMReadRow(unsigned long addr);
unsigned long NVMReadWord(void *addr);
unsigned long Get_Address_Pval(int recipe);
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 28 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_) ;


void sys_sync_current_position();
#line 80 "c:/users/git/pic32mzcnc/globals.h"
extern unsigned long volatile buff[128];





typedef struct {
 char abort;
 char state;
 int homing;
 int homing_cnt;
 char auto_start;
 volatile char execute;
} system_t;
extern system_t sys;



typedef struct{
 volatile float coord[ 4 ];
 volatile float coord_offset[ 4 ];
}coord_sys;
extern coord_sys coord_system[ 9 ];




void Settings_Init(char reset_all);
unsigned int Settings_Write_Coord_Data(int coord_select,float *coord);

int Save_Row_From_Flash(unsigned long addr);
#line 50 "c:/users/git/pic32mzcnc/gcode.h"
extern volatile int status_code;
#line 147 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char r: 1;
 char no_axis_interpolate: 1;
 char motion_mode;
 char inverse_feed_rate_mode;
 char inches_mode;
 char absolute_override;
 char absolute_mode;
 char program_flow;
 char spindle_direction;
 char coolant_mode;
 char tool;

 char plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 char coord_select;


 int frequency;
 int L;
 float feed_rate;

 volatile float position[ 4 ];
 volatile float coord_system[ 4 ];

 volatile float coord_offset[ 4 ];

 volatile float next_position[ 4 ];
 volatile float offset[3];
 float R;
 float I;
 float J;
 float K;
 int P;
 int S;
} parser_state_t;
extern parser_state_t gc;


enum IJK{I,J,K};






void G_Initialise();

int Get_modalgroup();
int Rst_modalgroup();

int Get_modalword();
int Rst_modalword();

int Get_Axisword();
int Rst_Axisword();

int Get_motionmode();
int Rst_motionmode();

int G_Mode(int mode);

void M_Instruction(int flow);

static float To_Millimeters(float value);

int Check_group_multiple_violations();
int Motion_mode();

int Instruction_Values(char *c,void *any);

void Movement_Condition();

void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z);

static int Set_Modal_Groups(int mode);
static int Set_Motion_Mode(int mode);
static void Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 34 "c:/users/git/pic32mzcnc/kinematics.h"
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

 unsigned int run_state ;

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
extern STP STPS[ 4 ];







void SetInitialSizes(STP axis[6]);


static void Set_Axisdirection(long temp,int axis);


void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed);
void SingleAxisStep(double newxyz,long speed,int axis_No);


void mc_arc(double *position, double *target, double *offset, int axis_0,
 int axis_1,int axis_linear, double feed_rate,uint8_t invert_feed_rate,
 double radius, uint8_t isclockwise);

float hypot(float angular_travel, float linear_travel);


int GetAxisDirection(long mm2move);


void ResetHoming();
void Home(int axis);
void Home_Axis(double distance,long speed,int axis);
void Inv_Home_Axis(double distance,long speed,int axis);
void mc_dwell(float sec);
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

void r_or_ijk(double xCur,double yCur,double xFin,double yFin,
 double r, double i, double j, double k, int axis_A,int axis_B,int dir);
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 32 "c:/users/git/pic32mzcnc/stepper.h"
typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za,yx,zx,ax,zy,ay,az}axis_combination ;

extern _axis_ _axis;
extern volatile axis_combination axis_xyz;




extern long test;


void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
void EnableSteppers(int steppers);
void DisableStepper();
void disableOCx();


unsigned int GET_RunState(int axis_No);


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
static void ClockPulse();
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 25 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 37 "c:/users/git/pic32mzcnc/steptodistance.h"
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
#line 1 "c:/users/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/print.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 31 "c:/users/git/pic32mzcnc/protocol.h"
void Str_Initialize(char arg[ 10 ][ 60 ]);
void Str_clear(char *str,int len);

int Sample_Ringbuffer();

static int strsplit(char arg[ 10 ][ 60 ],char *str, char c);
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);
static int str2int(char *str,int base);
#line 1 "c:/users/git/pic32mzcnc/flash_r_w.h"
#line 28 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();

void OutPutPulseXYZ();


int Modal_Group_Actions0(int action);

int Modal_Group_Actions1(int action);
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
void Reset_rxBuff(int dif);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();
void Get_Line(char *str,int dif);
void Reset_Ring();
int Loopback();



void DMA1_Enable();
void DMA1_Disable();
unsigned int DMA_IsOn(int channel);
unsigned int DMA_CH_Busy(int channel);
unsigned int DMA_Busy();
unsigned int DMA_Suspend();
unsigned int DMA_Resume();
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#line 7 "C:/Users/Git/Pic32mzCNC/Serial_Dma.c"
Serial serial;
char rxBuf[200] = {0} absolute 0xA0002000 ;
char txBuf[200] = {0} absolute 0xA0002200 ;
char cherie[] = " CHERIF Error\r";
char dma0[] = "DMA0_";
char dma1[] = "DMA1_";
const char newline[] = "\r\n";

char dma0int_flag;
char dma1int_flag;





void DMA_global(){

 DMACONSET = 0x8000;
 DMA0();
 DMA1();
}
#line 40 "C:/Users/Git/Pic32mzCNC/Serial_Dma.c"
void DMA0(){

 IEC4CLR = 0x40;
 IFS4CLR = 0x40;


 DCH0CONCLR = 0x8003;


 DCH0ECON = (146 << 8 ) | 0x30;


 DCH0DAT = 0x0A;


 DCH0SSA = KVA_TO_PA(0xBF822230);
 DCH0SSIZ = 1;


 DCH0DSA = KVA_TO_PA(0xA0002000);
 DCH0DSIZ = 200 ;


 DCH0CSIZ = 1 ;



 DCH0INTCLR = 0x00FF00FF ;

 DCH0INTSET = 0x90000;



 IPC33CLR = 0x160000;

 IPC33SET = 0x00140000;

 IEC4SET = 0x40;
 IFS4CLR = 0x40;


 DCH0CONSET = 0X0000013;


 serial.head = serial.tail = serial.diff = 0;
}



void DMA0_Enable(){


 DCH0CONSET = 1<<7;
}



void DMA0_Disable(){

 DCH0CONCLR = 1<<7;

}



void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
 int i = 0;

 dma0int_flag = DCH0INT & 0x00FF;



 if( CHERIF_bit == 1){

 strcpy(rxBuf, ("dma0" " " "cherie") );



 }



 if (DCH0INTbits.CHBCIF == 1){
 i = strlen(rxBuf);
 }



 if(serial.head + i > 499)
 serial.head = 0;

 strncpy(serial.temp_buffer+serial.head, rxBuf, i);
 serial.head += i;
 memset(rxBuf,0,i);


 DCH0INTCLR = 0x000000ff;
 IFS4CLR = 0x40;
}


static void Reset_rxBuff(int dif){
 memset(rxBuf,0,dif);
}


int Get_Head_Value(){
 return serial.head;
}

int Get_Tail_Value(){
 return serial.tail;
}

int Get_Difference(){

 if(serial.head > serial.tail)
 serial.diff = serial.head - serial.tail;
 else if(serial.tail > serial.head)
 serial.diff = serial.head;
 else
 serial.diff = 0;

 return serial.diff;
}

void Reset_Ring(){
 serial.tail = serial.head = 0;
}


void Get_Line(char *str,int dif){

 if(serial.tail + dif > 499)
 serial.tail = 0;

 strncpy(str,serial.temp_buffer+serial.tail,dif);



 serial.tail += dif;
}


int Loopback(){
char str[50];
int dif;

 dif = Get_Difference();

 if(serial.tail + dif > 499)
 serial.tail = 0;

 strncpy(str,serial.temp_buffer+serial.tail,dif);
 dma_printf("\n\t%s",str);

 serial.tail += dif;
}
#line 212 "C:/Users/Git/Pic32mzCNC/Serial_Dma.c"
void DMA1(){


 IPC33CLR = 0x17000000;
 IEC4CLR = 0x7;


 DCH1CONCLR = 0x8003;


 DCH1ECON=(147 << 8)| 0x30;



 DCH1DAT = '\r';


 DCH1SSA = KVA_TO_PA(0xA0002200) ;
 DCH1SSIZ = 200;



 DCH1DSA = KVA_TO_PA(0xBF822220) ;
 DCH1DSIZ = 1;


 DCH1CSIZ = 1;


 DCH1INTCLR = 0x00FF00FF ;





 IPC33CLR = 0x16000000;

 IPC33SET = 0x16000000;

 IEC4SET = 0x80;

 IFS4CLR = 0x80;



 DCH1CONSET = 0x00000003;

}


void DMA1_Enable(){
 DCH1CONSET = 1<<7;
}




void DMA1_Disable(){
 DCH1CONCLR = 1<<7;
}



unsigned int DMA_IsOn(int channel){
 if(channel == 0)
 return (DCH0CON & 0x8000)>>15;
 else
 return (DCH1CON & 0x8000)>>15;
}






unsigned int DMA_CH_Busy(int channel){
 if(channel == 0)
 return (DCH0CON & 0x8000)>>15;
 else
 return (DCH1CON & 0x8000)>>15;
}





unsigned int DMA_Suspend(){
 DMACONSET = (1 << 12);


 return ((DMACON & 0x1000)>>12);
}




unsigned int DMA_Resume(){
 DMACONCLR = (1 << 12);


 return (DMACON & 0x1000)>>12;
}




unsigned int DMA_Busy(){
 return ((DMACON & 0x800)>>11);
}







void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {


 dma1int_flag = DCH1INT & 0x00FF;

 if (DCH1INTbits.CHBCIF){
 dma1int_flag = 1;
 dma0int_flag = 0;

 }

 if( CHERIF_DCH1INT_bit == 1){
 CABORT_DCH1ECON_bit = 1;
 }




 DCH1INTCLR = 0x00FF;
 IFS4CLR = 0x80;

}




int dma_printf(const char* str,...){

 va_list va;
 int i = 0, j = 0;
 char buff[200]={0},tmp[20],tmp1[9];
 char *str_arg,*tmp_;


 if(str == 0)
 return;




 if(DMA_CH_Busy(1)){
 return 0;
 }



  __va_start(va, str) ;

 i = j = 0;
 while(*(str+i) != '\0'){
 if(*(str+i) == '%'){
 i++;
 switch(*(str+i)){
 case 'c':

 buff[j] = (char) __va_arg(va, char) ;
 j++;
 break;
 case 'd':

 sprintf(tmp1,"%d", __va_arg(va, int) );
 strcat(buff+j, tmp1);
 j += strlen(tmp1);
 break;
 case 'u':

 sprintf(tmp1,"%u", __va_arg(va, unsigned int) );
 strcat(buff+j, tmp1);
 j += strlen(tmp1);
 case 'l':

 sprintf(tmp,"%ld", __va_arg(va, long) );

 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 'X':

 sprintf(tmp,"%X", __va_arg(va, int) );
 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 'X':

 sprintf(tmp,"%lX", __va_arg(va, long) );
 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 'f':
 sprintf(tmp,"%f", __va_arg(va, float) );
 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 'F':
 sprintf(tmp,"%E", __va_arg(va, double) );
 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 'p':
 sprintf(tmp,"%p", __va_arg(va, void*) );
 strcat(buff+j, tmp);
 j += strlen(tmp);
 break;
 case 's':

 str_arg =  __va_arg(va, char*) ;
 strcat(buff+j, str_arg);
 j += strlen(str_arg);
 break;
 }
 }else{
 *(buff+j) = *(str+i);
 j++;
 }
 i++;
 }
 *(buff+j+1) = 0;
 strncpy(txBuf,buff,j+1);
 DCH1SSIZ = j ;
 DMA1_Enable();
 return j;

}



void lTrim(char *d,char* s){
char* temp;
int i=0,j,k;
 k = i;
 j = strlen(s);
 while(*s != '\0'){
 if((*s > 0x30)||(k>0)){
 k = 1;
 *d = *s;
 d++;
 }else
 i++;
 s++;
 }
 if(i == j){
 *d = '0';
 d++;
 }
 *d = 0;
}
