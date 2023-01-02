#line 1 "C:/Users/Git/Pic32mzCNC/Protocol.c"
#line 1 "c:/users/git/pic32mzcnc/protocol.h"
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
#line 1 "c:/users/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 137 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 unsigned long p_msec;
 float steps_per_mm[ 6 ];
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
int DMA_IsOn(int channel);
int DMA_CH_Busy(int channel);
int DMA_Busy();
int DMA_Suspend();
int DMA_Resume();
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
#line 40 "c:/users/git/pic32mzcnc/flash_r_w.h"
unsigned int NVMWriteWord (unsigned long address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
static unsigned int NVMUnlock(unsigned int nvmop);
static unsigned int NVM_ERROR_Rst();
static unsigned int NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static unsigned int NVM_WREN_Set();
static unsigned int NVM_WREN_Wait();
static unsigned int NVM_WREN_Rst();
void NVMReadRow(unsigned long addr);
unsigned long NVMReadWord(void *addr);
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 28 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_) ;


void sys_sync_current_position();
#line 82 "c:/users/git/pic32mzcnc/globals.h"
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
 volatile float x_coord;
 volatile float y_coord;
 volatile float z_coord;
 volatile float a_coord;
}coord_sys;





void Settings_Init(char reset_all);
int Settings_Write_Coord_Data(unsigned long addr,int coord_select,float *coord);
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
extern STP STPS[ 6 ];







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
#line 1 "c:/users/git/pic32mzcnc/flash_r_w.h"
#line 28 "c:/users/git/pic32mzcnc/config.h"
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

int Non_Modal_Actions(int action);
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 134 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char r: 1;
 char no_axis_interpolate: 1;
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


 int frequency;
 int L;
 float feed_rate;

 volatile float position[ 6 ];


 volatile float coord_offset[ 6 ];

 volatile float next_position[ 6 ];
 volatile float offset[3];
 float R;
 float I;
 float J;
 float K;
 int P;
 int S;
} parser_state_t;
extern parser_state_t gc;


typedef struct{
 volatile float x_offset;
 volatile float y_offset;
 volatile float z_offset;
 volatile float a_offset;
}coord_offsets;
extern coord_offsets coord_offset;


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


static int Set_Modal_Groups(int mode);
static int Set_Motion_Mode(int mode);
static void Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
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




 static void PrintDebug(char c,char *strB,void *ptr);
#line 5 "C:/Users/Git/Pic32mzCNC/Protocol.c"
char gcode[ 10 ][ 60 ];




void Str_Initialize(char arg[ 10 ][ 60 ]){
int i;
 for(i = 0; i <=  10 ;i++){
 memset(arg[i],0, 60 );
 }
}

void Str_clear(char *str,int len){
 memset(str,0,len);
}



int Sample_Ringbuffer(){
static int motion_mode,str_len;
int status;
char str[50];
char temp[9];
char xyz[6];
char F_1_Once,no_of_axis;
char axis_to_run;
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val,O_Val,P_Val;
float XYZ_Val;



 dif = 0;
 dif = Get_Difference();

 if(dif > 0){
 G_Initialise();
 F_1_Once = no_of_axis = 0 ;

 Str_clear(str,str_len);
 Get_Line(str,dif);
 str_len = strlen(str);

 num_of_strings = strsplit(gcode,str,0x20);
#line 59 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 switch(*(*gcode+0)+0){
 case 'G':case 'g':

 if (*(*(gcode)+0)=='G'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 if(i < 3){
 G_Val = atoi(temp);


 if(G_Val == 28 || G_Val == 30 || G_Val == 92)
 G_Val *= 10;
 }else{

 G_Val = (int)(atof(temp)*10.0);
 }

 motion_mode = G_Mode(G_Val);

 PrintDebug(*(*(gcode)+0),temp,&G_Val);







 if(*(*(gcode+1)+0) != 0){
 no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
 switch(*(*(gcode+1)+0)) {
 case 'X':case 'x':
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[1],&XYZ_Val);

 PrintDebug(*gcode[1],temp,&XYZ_Val);

 break;
 case 'L':case 'l':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);

 PrintDebug(*gcode[1],temp,&O_Val);

 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);

 PrintDebug(*gcode[1],temp,&O_Val);

 break;
 case 'P':case 'p':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);

 PrintDebug(*gcode[1],temp,&O_Val);

 break;
 case 'S':case 's':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);

 PrintDebug(*gcode[1],temp,&O_Val);

 break;
 }
 }




 if(*(*(gcode+2)+0) != 0){
 no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
 switch(*(*(gcode+2)+0)) {
 case 'X':case 'x':
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[2],&XYZ_Val);

 PrintDebug(*gcode[2],temp,&XYZ_Val);

 break;
 case 'L':case 'l':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);

 PrintDebug(*gcode[2],temp,&O_Val);

 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);

 PrintDebug(*gcode[2],temp,&O_Val);

 break;
 case 'P':case 'p':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);

 PrintDebug(*gcode[2],temp,&O_Val);

 break;
 case 'S':case 's':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);

 PrintDebug(*gcode[2],temp,&O_Val);

 break;
 }
 }



 if(*(*(gcode+3)+0) != 0){
 no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
 switch(*(*(gcode+3)+0)) {
 case 'X':case 'x':case 'Y':case 'y':
 case 'Z':case 'z':case 'R':case 'r':
 case 'I':case 'i':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[3],&XYZ_Val);

 PrintDebug(*gcode[3],temp,&XYZ_Val);

 break;
 case 'F': case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[3],&O_Val);

 PrintDebug(*gcode[3],temp,&O_Val);

 break;
 }
 }




 if(*(*(gcode+4)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
 switch(*(*(gcode+4))) {
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[4],&XYZ_Val);

 PrintDebug(*gcode[4],temp,&XYZ_Val);

 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[4],&O_Val);

 PrintDebug(*gcode[4],temp,&O_Val);

 break;

 }
 }



 if(*(*(gcode+5)+0) != 0){
 xyz[4] = *(*(gcode+5)+0);no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
 switch(*(*(gcode+5))) {
 case 'Z':case 'z':
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 Instruction_Values(gcode[5],&XYZ_Val);

 PrintDebug(*gcode[5],temp,&XYZ_Val);

 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[5],&O_Val);

 PrintDebug(*gcode[5],temp,&O_Val);

 break;
 }
 }


 if(*(*(gcode+6)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
 switch(*(*(gcode+6))) {
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[6],&XYZ_Val);

 PrintDebug(gcode[6],temp,&XYZ_Val);

 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[6],&O_Val);

 PrintDebug(gcode[6],temp,&O_Val);

 break;

 }
 }
 }else {
 return;
 }
 break;
 case 'M':
 case 'm':

 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 M_Val = atoi(temp);
 M_Instruction(M_Val);

 PrintDebug(gcode[0],temp,&M_Val);



 if((*(gcode+1)) != 0){
 switch(*(*(gcode+1))){
 case 'S':
 case 's':

 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 XYZ_Val = atoi(temp);
 status = Instruction_Values(gcode[0],&XYZ_Val);

 PrintDebug(gcode[0],temp,&XYZ_Val);

 break;
 }
 }
 break;
 case 'X':case 'x':case 'Y':case 'y':
 case 'Z':case 'z':case 'A':case 'a':
 if(*(*(gcode)+0)=='X'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[0],&XYZ_Val);

 PrintDebug(gcode[0],temp,&XYZ_Val);

 }



 if(*(*(gcode+1)+0) != 0){
 xyz[1] = *(*(gcode+1)+0);no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
 switch(*(*(gcode+1))) {
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[1],&XYZ_Val);

 PrintDebug(gcode[1],temp,&XYZ_Val);

 break;
 case 'F':
 case 'f':

 F_1_Once = 1;
 F_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&F_Val);

 PrintDebug(gcode[1],temp,&F_Val);


 break;

 }
 }
 break;
 case 'F':

 if (*(*(gcode)+0)=='F'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 F_Val = atoi(temp);
 status = Instruction_Values(gcode[0],&F_Val);

 PrintDebug(gcode[6],temp,&F_Val);

 }
 break;

 }
 ret:
 status = Check_group_multiple_violations();


 }
 return status;
}




static int strsplit(char arg[ 10 ][ 60 ],char *str, char c){
int i,ii,kk,err,lasti,len;
 Str_Initialize(arg);
 len = strlen(str);
 ii=kk=err=lasti=0;
 for (i = 0; i < len;i++){
 err = i - lasti;
 if(*(str+i) == c || *(str+i) == '\n' || err > 49){
 arg[kk++][ii] = 0;
 ii=err=0;
 lasti = i;
 continue;
 }else{
 arg[kk][ii++] = *(str+i);
 }
 if(*(str+i)==0)
 break;
 }
 arg[kk][0] = 0;
 return kk;
}



static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
int i;
char *tmp;
 tmp = strB+indx;
 *(tmp+num_of_char)=0;

 i = 0;
 while(*tmp != 0){
 *strA++ = *tmp++;
 i++;
 }
 *strA = '\0';

 return i;
}




static int str2int(char *str,int base){
int i, len;
int result = 0;

 len = strlen(str);

 for(i=0; i<len; i++){
 result = result * base + ( *(str+i) - 0x30 );
 while(DMA_IsOn(1));
 }

 return result;
}




static void PrintDebug(char c,char *strB,void *ptr){
int G_Val;
float XYZ_Val;

 switch(c){
 case 'G':case 'g':
 case 'F':case 'f':
 case 'M':case 'm':
 case 'S':case 's':
 case 'P':case 'p':
 case 'L':case 'l':
 case 'T':case 't':
 G_Val = *(int*)ptr;
 while(DMA_IsOn(1));
 dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
 break;
 case 'X':case 'x':
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = *(float*)ptr;
 while(DMA_IsOn(1));
 dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
 break;
 default:break;
 }
 return;
}
