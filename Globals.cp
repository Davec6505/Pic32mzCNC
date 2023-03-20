#line 1 "C:/Users/Git/Pic32mzCNC/Globals.c"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
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
extern volatile settings_t settings;
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
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
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
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
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
 volatile long frequency;
 volatile float feed_rate;

 volatile float position[ 2 ];
 volatile float coord_system[ 2 ];

 volatile float coord_offset[ 2 ];

 volatile float next_position[ 2 ];
 volatile float offset[3];
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 30 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_);


int round(double val);
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 52 "c:/users/git/pic32mzcnc/protocol.h"
void Init_Protocol();


void Str_Initialize(char arg[ 20 ][ 64 ]);


void Str_clear(char *str,int len);


int Sample_Gocde_Line();


static void Do_Startup_Msg(char *str,int _dif_);







static int Check_Query_Type(char *str,int dif);


static int Do_Gcode(char *str,int dif);


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
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
void DMA1_Enable();
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
#line 11 "C:/Users/Git/Pic32mzCNC/Globals.c"
unsigned long volatile buffA[512]= {0} absolute 0xA0000000 ;
static unsigned long volatile add = 0;


static volatile int ram_loaded;
static volatile int coord_read;


volatile unsigned long j = 0;
volatile unsigned long i = 0;
volatile unsigned int error = 0;




void settings_init(short reset_all){
unsigned long *ptr;
volatile unsigned long has_data = 0;


int retry_flash_write = 0;



 add = (unsigned long) 0xBD1BC000 ;

 ptr = (unsigned long) 0xBD1BC5F0  ;

 if(!reset_all){

 sys.abort = 0;
 sys.state = 0;
 sys.homing = 0;
 sys.execute = 0;
 sys.auto_start = 0;
 }else{
 has_data = NVMReadWord(ptr);
#line 55 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if(has_data == -1){





 error = (int)NVMErasePage(&add);








 settings.steps_per_mm[X] =  200.00 ;
 buffA[ 0x40 ] = flt2ulong(settings.steps_per_mm[X]);
 settings.steps_per_mm[Y] =  200.00 ;
 buffA[ 0x41 ] = flt2ulong(settings.steps_per_mm[Y]);
 settings.steps_per_mm[Z] =  200.00 ;
 buffA[ 0x42 ] = flt2ulong(settings.steps_per_mm[Z]);
 settings.steps_per_mm[A] =  200.00 ;
 buffA[ 0x43 ] = flt2ulong(settings.steps_per_mm[A]);

 settings.default_feed_rate =  250.0 ;
 buffA[ 0x47 ] = flt2ulong(settings.default_feed_rate);

 settings.default_seek_rate =  500.0 ;
 buffA[ 0x48 ] = flt2ulong(settings.default_seek_rate);

 settings.homing_feed_rate =  25.0 ;
 buffA[ 0x49 ] = flt2ulong(settings.homing_feed_rate);

 settings.homing_seek_rate =  250.0  ;
 buffA[ 0x4A ] = flt2ulong(settings.homing_seek_rate);

 settings.homing_pulloff =  1.0 ;
 buffA[ 0x4B ] = flt2ulong(settings.homing_pulloff);

 settings.mm_per_arc_segment =  0.1 ;
 buffA[ 0x4C ] = flt2ulong(settings.mm_per_arc_segment);

 settings.acceleration =  (10.0*60.0*60.0) ;
 buffA[ 0x4D ] = flt2ulong(settings.acceleration);

 settings.junction_deviation =  0.05 ;
 buffA[ 0x4E ] = flt2ulong(settings.junction_deviation);


 settings.n_arc_correction =  25 ;
 buffA[ 0x4F ] = (unsigned long) 0x4F ;

 settings.stepper_idle_lock_time =  25 ;
 buffA[ 0x53 ] = (unsigned long)settings.stepper_idle_lock_time;

 settings.homing_debounce_delay =  100 ;
 buffA[ 0x52 ] = (unsigned long)settings.homing_debounce_delay;

 settings.p_usec =  100 ;
 buffA[ 0x46 ] = (unsigned long)settings.p_usec;

 settings.decimal_places =  3 ;
 buffA[ 0x56 ] = (unsigned int)settings.decimal_places;

 settings.homing_dir_mask =  15 ;
 buffA[ 0x57 ] = (unsigned long)settings.homing_dir_mask;

 settings.invert_mask =  15 ;
 buffA[ 0x58 ] = (unsigned long)settings.invert_mask;

 settings.flags = 0;
 if ( 0 ) {settings.flags |=  (1 << 0) ;}
#line 131 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if ( 1 ) { settings.flags |= ( (1 << 1) );}
#line 136 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if ( 1 ) { settings.flags |= ( (1 << 2) );}
#line 141 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if ( 1 ){ settings.flags |= ( (1 << 3) );}
#line 146 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if ( 1 ) { settings.flags |= ( (1 << 4) );}
#line 151 "C:/Users/Git/Pic32mzCNC/Globals.c"
 buffA[0x50] = ((unsigned long)settings.flags) & 0x1F;
#line 162 "C:/Users/Git/Pic32mzCNC/Globals.c"
 buffA[ 0x17C ] = 0x7FFFFFFF;



 has_data = 1;

 while(has_data){

 has_data = (unsigned long)NVMWriteRow(&add,buffA);
 retry_flash_write++;
#line 178 "C:/Users/Git/Pic32mzCNC/Globals.c"
 if(retry_flash_write >  2 )break;
 }


 }
 if(has_data){
 set_ram_loaded_indicator(read_row_from_flash(add));
 }

 settings.steps_per_mm[X] = ulong2flt(buffA[ 0x40 ]);
 settings.steps_per_mm[Y] = ulong2flt(buffA[ 0x41 ]);
 settings.steps_per_mm[Z] = ulong2flt(buffA[ 0x42 ]);

 settings.default_feed_rate = ulong2flt(buffA[ 0x47 ]);
 settings.default_seek_rate = ulong2flt(buffA[ 0x48 ]);
 settings.homing_feed_rate = ulong2flt(buffA[ 0x49 ]);
 settings.homing_seek_rate = ulong2flt(buffA[ 0x4A ]);
 settings.homing_pulloff = ulong2flt(buffA[ 0x4B ]);
 settings.mm_per_arc_segment = ulong2flt(buffA[ 0x4C ]);
 settings.acceleration = ulong2flt(buffA[ 0x4D ]);
 settings.junction_deviation = ulong2flt(buffA[ 0x4E ]);
 settings.n_arc_correction = (unsigned int)buffA[ 0x4F ];
 settings.flags = ((unsigned int)buffA[0x50]);
 settings.stepper_idle_lock_time = (unsigned int)buffA[ 0x51 ];
 settings.microsteps = (unsigned int)buffA[ 0x54 ];
 settings.p_usec = (unsigned int)buffA[ 0x46 ];
 settings.decimal_places = (unsigned int)buffA[ 0x56 ];
 settings.homing_debounce_delay = (unsigned int)buffA[ 0x52 ];
 settings.homing_dir_mask = (unsigned int)buffA[ 0x57 ];
 settings.invert_mask = (unsigned int)buffA[ 0x58 ];
 }

}
#line 222 "C:/Users/Git/Pic32mzCNC/Globals.c"
static int set_ram_loaded_indicator(int val){
 ram_loaded = val;
 return ram_loaded;
}


static void zero_ram_loaded_indicator(){
 ram_loaded = 0;
}


int read_ram_loaded_indicator(){
 return ram_loaded;
}





static void set_coord_data_read_indicator(int flag){
  (coord_read |= flag) ;
}


static void rst_single_coord_read_indicators(int flag){
  (coord_read &= ~flag) ;
}


static void rst_coord_read_indicator(){
 coord_read = 0;
}


int read_coord_data_indicator(){
 return coord_read;
}









int read_row_from_flash(unsigned long addr){
unsigned long *ptr;
int data_count;

 ptr = addr;
 data_count = 0;
 for(j = 0;j < 512;j++){
 buffA[j] = *(ptr+j);
 if(buffA[j] != -1)data_count++;
#line 281 "C:/Users/Git/Pic32mzCNC/Globals.c"
 }



 set_ram_loaded_indicator(data_count);


 return data_count;
}
#line 318 "C:/Users/Git/Pic32mzCNC/Globals.c"
unsigned int settings_write_coord_data(int coord_select,float *coord){
float ptr;
int res=0,recipe = 0;
unsigned long wdata[4]={0};
unsigned long temp[4] = {0};

 add = (unsigned long) 0xBD1BC000 ;


 recipe = coord_select;

 if(!read_ram_loaded_indicator()){

 set_ram_loaded_indicator(read_row_from_flash(add));



 error = (int)NVMErasePage(&add);
 }



 if(error){
#line 345 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return error;
 }

 switch(recipe){
 case 0:break;

 case 1: add = (unsigned long) 0xBD1BC000 ;break;
 case 2: add = (unsigned long) 0xBD1BC010 ;break;
 case 3: add = (unsigned long) 0xBD1BC020 ;break;
 case 4: add = (unsigned long) 0xBD1BC030 ;break;
 case 5: add = (unsigned long) 0xBD1BC040 ;break;
 case 6: add = (unsigned long) 0xBD1BC050 ;break;
 case 7: add = (unsigned long) 0xBD1BC060 ;break;
 case 8: add = (unsigned long) 0xBD1BC070 ;break;
 case 9: add = (unsigned long) 0xBD1BC080 ;break;

 case 10: add = (unsigned long) 0xBD1BC090 ;break;
 case 11: add = (unsigned long) 0xBD1BC0A0 ;break;
 }

 j = i = 0;
 for (i=0;i<3;i++){
 wdata[i] = flt2ulong(coord[i]);
#line 372 "C:/Users/Git/Pic32mzCNC/Globals.c"
 }


 i = (recipe-1)*4 ;


 for(j = 0;j<4;j++){
 buffA[i] = wdata[j];
 i++;
 }


 res = NVMWriteRow(&add,buffA);
 set_ram_loaded_indicator(res);
#line 401 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return res;
}






void settings_read_coord_data(){


 if(!read_ram_loaded_indicator()){
 add = (unsigned long) 0xBD1BC000 ;
 read_row_from_flash(add);
 }

 if(!read_coord_data_indicator()){
 unsigned long temp = 0UL;
 float value = 0.00;
 for(i = 0; i < 9; i++){
 for(j = 0 ; j <  2 ; j++){
 temp = buffA[(i* 2 ) + j];

 if(temp == -1)
 temp = 0UL;
 value = ulong2flt(temp);
 coord_system[i].coord[j] = value;
#line 435 "C:/Users/Git/Pic32mzCNC/Globals.c"
 }
 }

 set_coord_data_read_indicator( 0 );
 }
}






unsigned int settings_write_one_coord(int coord_select,float *coord){
float coord_data[ 2 ];
int recipe;
unsigned long temp[ 2 ];


 recipe = coord_select *  2 ;


 j=0;
 for(i = recipe;i< recipe+ 2 ;i++){

 coord_data[j] = *(coord+j);
 temp[j] = flt2ulong(coord_data[j]);
 buffA[i] = temp[j];
 j++;
#line 467 "C:/Users/Git/Pic32mzCNC/Globals.c"
 }

 switch(coord_select){

 case 1: add = (unsigned long) 0xBD1BC000 ;break;
 case 2: add = (unsigned long) 0xBD1BC010 ;break;
 case 3: add = (unsigned long) 0xBD1BC020 ;break;
 case 4: add = (unsigned long) 0xBD1BC030 ;break;
 case 5: add = (unsigned long) 0xBD1BC040 ;break;
 case 6: add = (unsigned long) 0xBD1BC050 ;break;
 case 7: add = (unsigned long) 0xBD1BC060 ;break;
 case 8: add = (unsigned long) 0xBD1BC070 ;break;
 case 9: add = (unsigned long) 0xBD1BC080 ;break;

 case 10: add = (unsigned long) 0xBD1BC090 ;break;
 case 11: add = (unsigned long) 0xBD1BC0A0 ;break;
 }

 if(!read_ram_loaded_indicator()){

 set_ram_loaded_indicator(read_row_from_flash(add));



 error = (int)NVMErasePage(&add);
 }



 if(error){
#line 501 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return error;
 }



 if(!error)
 set_ram_loaded_indicator(NVMWriteQuad (&add, temp));

 return error;
}




int settings_read_startup_line(int n, char *line){
char *char_add;

 switch(n){
 case 0: char_add = (char*) 0xBD1BC600 ;break;
 case 1: char_add = (char*) 0xBD1BC640 ;break;
 }

 memcpy(line,char_add,64);
#line 531 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return  0 ;
}



int settings_store_startup_line(int n, char *line){
unsigned long start_offset;
int str_len;
char temp_char;

 str_len = strlen(line);
#line 550 "C:/Users/Git/Pic32mzCNC/Globals.c"
 add = (unsigned long) 0xBD1BC000 ;


 switch(n){
 case 0: start_offset = (unsigned long) 0x180 ;break;
 case 1: start_offset = (unsigned long) 0x190 ;break;
 }

 if(!read_ram_loaded_indicator()){

 set_ram_loaded_indicator(read_row_from_flash(add));



 error = (int)NVMErasePage(&add);
 }



 if(error){
#line 574 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return error;
 }


 for(i=start_offset;i<start_offset+16;i++)
 buffA[i] = 0;



 memcpy(buffA+start_offset,line,str_len);
#line 595 "C:/Users/Git/Pic32mzCNC/Globals.c"
 set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));

 return error;
}




int settings_store_global_setting(int parameter, float value) {
unsigned long *ptr;
volatile unsigned long has_data = 0;
int val_temp = 0;

 add = (unsigned long) 0xBD1BC000 ;
 ptr = (unsigned long) 0xBD1BC5F0  ;

 if(!read_ram_loaded_indicator()){

 set_ram_loaded_indicator(read_row_from_flash(add));
 }



 error = (int)NVMErasePage(&add);



 if(error){
#line 627 "C:/Users/Git/Pic32mzCNC/Globals.c"
 return( 6 );
 }
#line 638 "C:/Users/Git/Pic32mzCNC/Globals.c"
 switch(parameter) {
 case 0: case 1: case 2:
 if (value <= 0.0) { return( 8 ); }

 settings.steps_per_mm[parameter] = value;

 buffA[ 0x40 +parameter] = flt2ulong(value);
#line 655 "C:/Users/Git/Pic32mzCNC/Globals.c"
 break;
 case 3:
 if (value < 3) { return( 9 ); }
 val_temp = round(value);
 settings.p_usec = val_temp;

 buffA[ 0x46 ] = (unsigned long)val_temp;
 break;
 case 4: settings.default_feed_rate = value;
 buffA[ 0x47 ] = flt2ulong(value);
 break;
 case 5: settings.default_seek_rate = value;
 buffA[ 0x48 ] = flt2ulong(value);
 break;
 case 6:
 settings.invert_mask = floor(value);
 buffA[ 0x58 ] = flt2ulong(floor(value));
 break;
 case 7:
 val_temp = round(value);
 settings.stepper_idle_lock_time = val_temp;
 buffA[ 0x53 ] = (unsigned long)val_temp;
 break;
 case 8:
 settings.acceleration = value*60.0*60.0;
 buffA[ 0x4D ] = flt2ulong(value);
 break;
 case 9: settings.junction_deviation = fabs(value);
 buffA[ 0x4E ] = flt2ulong(fabs(value));
 break;
 case 10:
 val_temp = round(value);
 settings.mm_per_arc_segment = val_temp;
 buffA[ 0x4C ] = (unsigned long)val_temp;
 break;
 case 11:
 val_temp = round(value);
 settings.n_arc_correction = val_temp;
 buffA[ 0x4F ] = (int)val_temp;
 break;
 case 12:
 val_temp = round(value);
 settings.decimal_places = val_temp;
 buffA[ 0x56 ] = (unsigned long)val_temp;
 break;
 case 13:
 if (round(value)){
 settings.flags |=  (1 << 0) ;
 }else{
 settings.flags &= ~ (1 << 0) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
 break;
 case 14:
 if (round(value)){
 settings.flags |=  (1 << 1) ;
 }else{
 settings.flags &= ~ (1 << 1) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
 break;
 case 15:
 if (round(value)){
 settings.flags |=  (1 << 2) ;
 }else{
 settings.flags &= ~ (1 << 2) ;
 }
 buffA[ 0x50 ] |= (unsigned long)settings.flags;
 break;
 case 16:
 if (round(value)){
 settings.flags |=  (1 << 3) ;
 }else{
 settings.flags &= ~ (1 << 3) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;

 break;
 case 17:
 if (round(value)){
 settings.flags |=  (1 << 4) ;
 }else{
 settings.flags &= ~ (1 << 4) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
 break;
 case 18:
 val_temp = round(value);
 settings.homing_dir_mask = val_temp;
 buffA[ 0x57 ] = (unsigned long)val_temp;
 break;
 case 19: settings.homing_feed_rate = value;
 buffA[ 0x49 ] = flt2ulong(value);
 break;
 case 20: settings.homing_seek_rate = value;
 buffA[ 0x4A ] = flt2ulong(value);
 break;
 case 21:
 val_temp = round(value);
 settings.homing_debounce_delay = val_temp;
 buffA[ 0x52 ] = (unsigned long)val_temp;
 break;
 case 22:
 val_temp = round(value);
 settings.homing_pulloff = val_temp;
 buffA[ 0x4B ] = (unsigned long)val_temp;
 break;
 case 99:
 val_temp = round(value);
 if(val_temp == 1){

 buffA[ 0x17C ] = 0x7FFFFFFF;






 set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
#line 781 "C:/Users/Git/Pic32mzCNC/Globals.c"
 }
 break;
 default:
 return( 6 );
 }
 return( 0 );
}
