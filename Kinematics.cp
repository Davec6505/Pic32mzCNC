#line 1 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
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







typedef __attribute__((aligned (32))) float afloat;
#line 171 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 float steps_per_mm[ 2 ];
 float default_feed_rate;
 float default_seek_rate;
 float homing_feed_rate;
 float homing_seek_rate;
 float homing_pulloff;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 unsigned int n_arc_correction;
 unsigned int flags;
 unsigned int step_idle_delay;
 unsigned int homing_debounce_delay;
 unsigned int stepper_idle_lock_time;
 unsigned int microsteps;
 unsigned int p_usec;
 unsigned int decimal_places;
 unsigned int homing_dir_mask;
 unsigned int invert_mask;

} settings_t;
extern settings_t settings;
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
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
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 30 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 42 "c:/users/git/pic32mzcnc/steptodistance.h"
long calcSteps( double mmsToMove, double Dia);
long leadscrew_sets(double move_distance);
long belt_steps(double move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
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
long max(long a, long int b);
long min(long a, long int b);
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
#line 151 "c:/users/git/pic32mzcnc/flash_r_w.h"
unsigned int NVMWriteWord (const void *address, unsigned long _data);
unsigned int NVMWriteQuad (const void *address, unsigned long *_data);
unsigned int NVMWriteRow (const void* address, void* _data);
unsigned int NVMErasePage(const void* address);
static unsigned int NVMUnlock(unsigned long nvmop);
unsigned int NVM_ERROR_Rst();
static void NVM_WR_Set();
static unsigned int NVM_WR_Wait();
static void NVM_WREN_Set();
static void NVM_WREN_Rst();
static unsigned int NVM_WREN_Wait();
void NVM_PWPAGE_Lock();
void NVMReadRow(unsigned long addr,unsigned long *buff);
void NVMReadQuad(unsigned long addr,unsigned long *words);
unsigned long NVMReadWord(void *addr);
unsigned long Get_Address_Pval(int recipe);
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 30 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_);


int round(double val);
#line 103 "c:/users/git/pic32mzcnc/globals.h"
extern unsigned long volatile buffA[128];





typedef struct {
 int abort;
 int state;
 int homing;
 int homing_cnt;
 long position[ 2 ];

 int auto_start;
 int execute;
} system_t;
extern system_t sys;



typedef struct{
 float coord[ 2 ];
 float coord_offset[ 2 ];
}coord_sys;
extern volatile coord_sys coord_system[ 9 ];





void settings_init(short reset_all);


static int set_ram_loaded_indicator(int val);


static void zero_ram_loaded_indicator();


int read_ram_loaded_indicator();


static void rst_single_coord_read_indicators(int flag);


static void rst_coord_read_indicator();


int read_coord_data_indicator();


int read_row_from_flash(unsigned long addr);


unsigned int settings_write_coord_data(int coord_select,float *coord);


void settings_read_coord_data();


unsigned int settings_write_one_coord(int coord_select,float *coord);


int settings_read_startup_line(int n, char *line);


int settings_store_startup_line(int n, char *line);


void write_global_settings();


int settings_store_global_setting(int parameter, float value);
#line 49 "c:/users/git/pic32mzcnc/gcode.h"
extern volatile int status_code;
#line 161 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char r: 1;
 char no_axis_interpolate;
 char inverse_feed_rate_mode;
 char inches_mode;
 char absolute_override;
 char absolute_mode;
 char spindle_direction;
 char coolant_mode;
 char motion_mode;
 char program_flow;
 char tool;
 char plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 int coord_select;

 int L;
 long frequency;
 float feed_rate;

 float position[ 2 ];
 float coord_system[ 2 ];

 float coord_offset[ 2 ];

 float next_position[ 2 ];
 float offset[3];
 float R;
 float I;
 float J;
 float K;
 int P;
 int S;
 int DIR;
} parser_state_t;
extern parser_state_t gc;


enum IJK{I,J,K};





void FAIL(int status);
void G_Initialise();

void Set_modalgroup(int value);
int Get_modalgroup();
int Rst_modalgroup();

void Set_modalword(int value);
int Get_modalword();
int Rst_modalword();

void Set_Axisword(int value);
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
static int Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
#line 14 "c:/users/git/pic32mzcnc/serial_dma.h"
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
unsigned int DMA_Busy();
unsigned int DMA_Suspend();
unsigned int DMA_Resume();



void DMA0();
char DMA0_Flag();
void DMA0_Enable();
void DMA0_Disable();
unsigned int DMA0_ReadDstPtr();
void DMA0_RstDstPtr();



void DMA1();
char DMA1_Flag();
unsigned int DMA1_Enable();
void DMA1_Disable();




unsigned int DMA_IsOn(int channel);
unsigned int DMA_CH_Busy(int channel);
unsigned int DMA_Abort(int channel);


void Reset_rxBuff(int dif);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();
void Get_Line(char *str,int dif);
void Reset_Ring();
int Loopback();
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

static void X_Min_Limit_Setup();
static void Y_Min_Limit_Setup();
static void Z_Min_Limit_Setup();
void A_Min_Limit_Setup();

void Set_Min_Limit(int axis);
char Test_Port_Pins(int axis);
char Test_Min(int axis);
void Reset_Min_Limit(int axis);
void XOR_Min_Limit(int axis);
void Invert_Min_Limit(int axis);
void Debounce_Limits(int axis);
void Reset_Min_Debounce(int axis);

char FP(int axis);
void Rst_FP(int axis);
char FN(int axis);
void Rst_FN(int axis);
#line 1 "c:/users/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/print.h"
#line 34 "c:/users/git/pic32mzcnc/print.h"
void report_status_message(int status_code);

void report_alarm_message(int alarm_code);

void report_feedback_message(int message_code);

void report_init_message();

void report_startup_line(int n, char *line);

void report_grbl_help();


void report_grbl_settings();

void report_gcode_parameters();

void report_gcode_modes();

void protocol_execute_startup();

void report_realtime_status();
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 52 "c:/users/git/pic32mzcnc/protocol.h"
void Init_Protocol();


void Str_Initialize(char arg[ 20 ][ 64 ]);


void Str_clear(char *str,int len);


int Sample_Gocde_Line();


static void Do_Startup_Msg(char *str_,int dif_);


static void Do_Critical_Msg(char ch_);







static int Check_Query_Type(char *str_,int dif_);


static int Do_Gcode(char *str_,int dif_);


int Sample_Ringbuffer();


static int strsplit(char arg[ 20 ][ 64 ],char *str, char c);
static int strsplit2(char arg[ 20 ][ 64 ],char *str,char c);


static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);


static int str2int(char *str,int base);


void protocol_execute_startup();


void protocol_system_check();


void protocol_execute_runtime();
#line 1 "c:/users/git/pic32mzcnc/flash_r_w.h"
#line 27 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();

void OutPutPulseXYZ();


static int Modal_Group_Actions0(int action);


static int Modal_Group_Actions1(int action);


static int Modal_Group_Actions4(int action);


static int Modal_Group_Actions7(int action);


static int Modal_Group_Actions12(int action);


void protocol_execute_runtime();
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
static void ClockPulse();
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
#line 52 "c:/users/git/pic32mzcnc/planner.h"
typedef struct genVars{
 int Single_Dual;
 char running: 1;
 char startPulses: 1;
 char homed: 1;
 char run_circle: 1;
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

void sys_sync_current_position();

void plan_set_current_position();

void plan_reset_absolute_position();

unsigned long sqrt_(unsigned long v);

void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
 float r, float i, float j, float k, int axis_A,int axis_B,int dir);
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
void EnableStepper(int stepper);
void DisableStepper();
void disableOCx();


int GET_RunState(int axis_No);
int Get_AxisStatus(int stepper);
int Get_Axis_Enable_States();


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
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 58 "c:/users/git/pic32mzcnc/kinematics.h"
extern char stepper_state;
extern sfr stp_stopped;
extern sfr stp_run;
extern sfr stp_pause;



typedef struct {
unsigned int home_state;
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

 float mm_position;

 float mm_home_position;

 float max_travel;

 int axis_dir;

 char master: 1;
}STP;
extern STP STPS[ 2 ];







void SetInitialSizes(STP axis[6]);


static void Set_Axisdirection(long temp,int axis);


void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed);
void SingleAxisStep(double newxyz,long speed,int axis_No);


void mc_arc(float *position, float *target, float *offset, int axis_0,
 int axis_1,int axis_linear, long feed_rate,char invert_feed_rate,
 float radius, char isclockwise);

float hypot(float angular_travel, float linear_travel);


int GetAxisDirection(long mm2move);


void ResetHoming();
int Home(int axis);
static void Home_Axis(double distance,long speed,int axis);
static void Inv_Home_Axis(double distance,long speed,int axis);
void mc_dwell(float sec);
void mc_reset();
#line 3 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
const code double max_sizes[]={ 300.00 , 300.00 , 100.00 , 100.00 , 100.00 , 100.00 };




volatile void (*AxisPulse[3])();




sbit stp_stopped at stepper_state.B0;
sbit stp_run at stepper_state.B1;
sbit stp_pause at stepper_state.B2;



char txtA[] = " : ";
char txtC[] = "\r";
char txtB[200];

static long d2;




static homing_t homing[ 2 ];



void SetInitialSizes(STP axis[6]){
int i = 0;

 gc.absolute_mode = 0;

 for (i = 0;i< 2 ;i++){
 axis[i].max_travel = max_sizes[i];
 }
}




static void Set_Axisdirection(long temp,int axis){
 int dir = (temp < 0)?  1  :  0 ;
 switch(axis){
 case X:
 DIR_StepX = ( 1  ^ dir) & 0x0001;
 break;
 case Y:
 DIR_StepY = ( 0  ^ dir) & 0x0001;
 break;
 case Z:
 DIR_StepZ = ( 0  ^ dir) & 0x0001;
 break;
 case A:
 DIR_StepA = ( 0  ^ dir) & 0x0001;
 break;
 default: break;
 }
}
#line 75 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(double newxyz,long speed,int axis_No){
long absxyz = 0;
long tempA = 0;
int dir = 0;

 if(gc.absolute_mode ==  1 ){

 tempA = belt_steps(newxyz,axis_No);


 tempA = tempA - STPS[axis_No].steps_abs_position;
#line 94 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 }else{
 tempA = belt_steps(newxyz,axis_No);
 }

 Single_Axis_Enable(axis_No);
 speed_cntr_Move(tempA , speed , axis_No);
#line 104 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 Set_Axisdirection(tempA,axis_No);
 STPS[axis_No].axis_dir =  (((tempA) < (0))? ( -1 ) : ( 1 )) ;
 SV.Single_Dual = 0;
 STPS[axis_No].psingle = 0;
 STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
 STPS[axis_No].step_count = 0;
 STPS[axis_No].mmToTravel = tempA;

 Step_Cycle(axis_No);

}




void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){
long tempA,tempB,tempC;
int dirA,dirB;


 if(gc.absolute_mode ==  1 ){

 tempA = belt_steps(axis_a,axisA);
 tempB = belt_steps(axis_b,axisB);

 tempA = tempA - STPS[axisA].steps_abs_position;
 tempB = tempB - STPS[axisB].steps_abs_position;
 }else{
 tempA = belt_steps(axis_a,axisA);
 tempB = belt_steps(axis_b,axisB);
 }
 SV.over=0;
 SV.dif = 0;


 SV.Single_Dual = 1;
 Single_Axis_Enable(axisA);
 Single_Axis_Enable(axisB);



 if (!gc.absolute_mode){
 SV.prevA = 0;
 SV.prevB = 0;
 SV.prevC = 0;
 }else{
 SV.prevA = 0;
 SV.prevB = 0;
 SV.prevC = 0;
 }


 Set_Axisdirection(tempA,axisA);
 STPS[axisA].axis_dir =  (((tempA) < (0))? ( -1 ) : ( 1 )) ;
 Set_Axisdirection(tempB,axisB);
 STPS[axisB].axis_dir =  (((tempB) < (0))? ( -1 ) : ( 1 )) ;


 SV.dA = tempA - SV.prevA;
 SV.dB = tempB - SV.prevB;
 SV.dC = tempC - SV.prevC;


 SV.dA = labs(SV.dA);
 SV.dB = labs(SV.dB);


 if(SV.dA >= SV.dB){
 if(!SV.cir)
 speed_cntr_Move(tempA,speed,axisA);

 SV.dif =  ((2)*((SV.dB) - (SV.dA))) ;
 STPS[axisA].master = 1;
 STPS[axisB].master = 0;
 }
 else{
 if(!SV.cir)
 speed_cntr_Move(tempB,speed,axisB);

 SV.dif =  ((2)*((SV.dA) - (SV.dB))) ;
 STPS[axisA].master = 0;
 STPS[axisB].master = 1;
 }

 STPS[axisA].step_count = 0;
 STPS[axisB].step_count = 0;
 STPS[axisA].mmToTravel = tempA;
 STPS[axisB].mmToTravel = tempB;

 Axis_Interpolate(axisA,axisB);








}
#line 236 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void mc_arc(float *position, float *target, float *offset, int axis_0
 , int axis_1,int axis_linear, long feed_rate, char invert_feed_rate
 , float radius, char isclockwise){
 long tempA,tempB;
 float center_axis0 = position[axis_0] + offset[axis_0];
 float center_axis1 = position[axis_1] + offset[axis_1];
 float linear_travel = target[axis_linear] - position[axis_linear];
 float r_axis0 = -offset[axis_0];
 float r_axis1 = -offset[axis_1];
 float rt_axis0 = target[axis_0] - center_axis0;
 float rt_axis1 = target[axis_1] - center_axis1;
 float theta_per_segment = 0.00;
 float linear_per_segment = 0.00;
 float angular_travel = 0.00;
 float mm_of_travel = 0.00;
 float rads = 0.00;
 long segments = 0;
 float cos_T = 0.00;
 float sin_T = 0.00;
 float arc_target[3];
 float sin_Ti;
 float cos_Ti;
 float r_axisi;
 float nPx,nPy;
 long i = 0;
 int count = 0;
 char n_arc_correction = 3;
 char limit_error = 0;

 arc_target[axis_linear] = position[axis_linear];
 rads = radius *  ( 3.141593 /180.00) ;



 angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);


 if(isclockwise) {

 if (angular_travel >= 0)
 angular_travel -= 2* 3.1416 ;
 else {
 if(angular_travel <= 0)
 angular_travel += 2* 3.1416 ;
 }
 }


 mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
 if (mm_of_travel == 0.0) { return; }

 segments = (long)floor(mm_of_travel/ 0.1 );




 if (invert_feed_rate)
 feed_rate *= segments;


 theta_per_segment = angular_travel/(float)segments;




 linear_per_segment = linear_travel/(float)segments;


 cos_T = 1-0.5*theta_per_segment*theta_per_segment;
 sin_T = theta_per_segment;

 nPx = arc_target[axis_0] = position[axis_0];
 nPy = arc_target[axis_1] = position[axis_1];
 OC5IE_bit = OC2IE_bit = 0;
 i = 0;
#line 321 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 while(i < segments) {

 if (count < n_arc_correction) {

 r_axisi = r_axis0*sin_T + r_axis1*cos_T;
 r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
 r_axis1 = r_axisi;
 count++;
 } else {


 cos_Ti = cos(i*theta_per_segment);
 sin_Ti = sin(i*theta_per_segment);
 r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
 r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
 count = 0;
 }


 arc_target[axis_0] = center_axis0 + r_axis0;
 arc_target[axis_1] = center_axis1 + r_axis1;
 arc_target[axis_linear] += linear_per_segment;
 nPx = arc_target[axis_0] - position[axis_0];
 nPy = arc_target[axis_1] - position[axis_1];

 nPx += position[axis_0];
 nPy += position[axis_1];


 if(gc.absolute_mode){
 STPS[axis_0].step_delay = feed_rate;
 STPS[axis_1].step_delay = feed_rate;
 }

 SV.cir = 1;
 DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);

 while(1){
#line 365 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 if(!OC5IE_bit && !OC2IE_bit)
 break;
 }



 if(limit_error)
 break;
 i++;
#line 382 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 }
 report_status_message( 0 );
#line 390 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
}



float hypot(float angular_travel, float linear_travel){
 return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}







int GetAxisDirection(long mm2move){
 return(mm2move < 0)?  -1 : 1  ;
}
#line 418 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
int Home(int axis){
static long speed = 0;


 if(sys.state ==  0 ){
 speed = 1000;


 Rst_FP(axis);Rst_FN(axis);


  (homing[axis].home_state &= ~ (1 << 5 ) ) ;


  (homing[axis].home_state &= ~ (1 << 3 ) ) ;


 homing[axis].home_cnt = 0;


 EnableStepper(axis);


 sys.state =  5 ;


 if(!Test_Port_Pins(axis)){

 homing[axis].home_cnt = 1;

 goto HOMED;
 }



 Home_Axis(-500.0,speed,axis);
#line 462 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 return axis;
 }



 if(sys.state ==  5 ){




 if(FN(axis)){


HOMED:
 speed = 100;
#line 485 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 if( ((homing[axis].home_state & (1 << 5) ) == 0) ){

 if( ((homing[axis].home_state & (1 << 3) ) == 0) ){


 if(homing[axis].home_cnt == 1){

  (homing[axis].home_state |= (1 << 3 ) ) ;
  (homing[axis].home_state &= ~ (1 << 2 ) ) ;


 Home_Axis(12.0,100, axis);

 }else if(homing[axis].home_cnt > 1){

  (homing[axis].home_state |= (1 << 5 ) ) ;
 StopAxis(axis);
 axis++;

 sys.state =  0 ;


 homing[axis].home_cnt = 0;
#line 519 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 return axis;
 }
 }
#line 526 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 }
 }







 if(FP(axis)){

 homing[axis].home_cnt++;
 if( ((homing[axis].home_state & (1 << 3) ) != 0) ){
  (homing[axis].home_state &= ~ (1 << 3 ) ) ;
 Home_Axis(-290.00,50,axis);
 }
#line 550 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 }
 }
 return axis;
}


static void Home_Axis(double distance,long speed,int axis){

 StopAxis(axis);
 STPS[axis].run_state =  0  ;
#line 569 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 STPS[axis].mmToTravel = belt_steps(distance,axis);
 SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
}

static void ResetHoming(){
int i = 0;
 for(i = 0;i<  2 ;i++){
 homing[i].home_state = 0;
 homing[i].home_cnt = 0;
 }
}






void mc_reset(){

 if ( ((sys.execute & (1 << 4) ) == 0) ) {
 sys.execute |=  (1 << 4) ;









 switch (sys.state) {
 case  3 : case  4 : case  5 :
 sys.execute |=  (1 << 5) ;
 disableOCx();
 DisableStepper();
 ResetHoming();
 }
 }
}
