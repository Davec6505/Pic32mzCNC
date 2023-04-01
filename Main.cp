#line 1 "C:/Users/Git/Pic32mzCNC/Main.c"
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







typedef __attribute__((aligned (32))) float afloat;
#line 173 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 float steps_per_mm[ 4 ];
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
#line 1 "c:/users/git/pic32mzcnc/planner.h"
#line 1 "c:/users/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
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

 float position[ 4 ];
 float coord_system[ 4 ];

 float coord_offset[ 4 ];

 float next_position[ 4 ];
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





void G_Initialise();

void FAIL(int status);
int GET_FAIL();
int SET_FAIL(int val);

void Set_modalgroup(int value);
int Get_modalgroup();
int Rst_modalgroup();

void Set_non_modalword(int value);
int Get_non_modalword();
int Rst_non_modalword();

void Set_Axisword(int value);
int Get_Axisword();
int Rst_Axisword();

int Get_motionmode();
int Rst_motionmode();


int G_Mode(int mode);

int M_Mode(int flow);

int Check_group_multiple_violations();


static float To_Millimeters(float value);


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


float fround(float val);


int round(float val);


long lround(float val);
#line 103 "c:/users/git/pic32mzcnc/globals.h"
extern unsigned long volatile buffA[128];





typedef struct {
 int abort;
 int state;
 int homing;
 int homing_cnt;
 long position[ 4 ];

 int auto_start;
 int execute;
} system_t;
extern system_t sys;



typedef struct{
 float coord[ 4 ];
 float coord_offset[ 4 ];
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
#line 53 "c:/users/git/pic32mzcnc/planner.h"
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



void plan_init(float accel,float decel);


void set_calculation_constants();


void speed_cntr_Move(long mmSteps, long speed, int axis_combo);


void sys_sync_current_position();


void plan_set_current_position();


void plan_reset_absolute_position();


long sqrt_(long v);


void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
 float r, float i, float j, float k, int axis_A,int axis_B,int dir);
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 59 "c:/users/git/pic32mzcnc/kinematics.h"
extern char stepper_state;
extern sfr stp_stopped;
extern sfr stp_run;
extern sfr stp_pause;



typedef struct {
unsigned int home_state;
unsigned int home_cnt;
}homing_t;


typedef struct Steps{

 char master: 1;

 unsigned short CheckStep: 1;

 unsigned short PLS_Step_ : 1;

 unsigned short StepBits: 1;

 unsigned short stopAxis: 1;

 int axis_dir;

 int run_state ;

 long microSec;

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

 long mmToTravel;

 long steps_abs_position;

 float mm_position;

 float mm_home_position;

 float max_travel;
}STP;
extern STP STPS[ 4 ];







void SetInitialSizes(STP axis[6]);


static void Set_Axisdirection(long temp,int axis);


void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,long speed);
void SingleAxisStep(float newxyz,long speed,int axis_No);


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
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 33 "c:/users/git/pic32mzcnc/stepper.h"
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


static int Pulse(int axis_No);
void toggleOCx(int axis_No);
void multiToggleOCx(int axis_No);
static void AccDec(int axis_No);
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
#line 29 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 41 "c:/users/git/pic32mzcnc/steptodistance.h"
long calcSteps( double mmsToMove, double Dia);
long leadscrew_sets(double move_distance,int axis);
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
#line 39 "C:/Users/Git/Pic32mzCNC/Main.c"
system_t sys;
coord_sys coord_system[ 9 ];
STP STPS[ 4 ];
settings_t settings absolute 0xA0002800 ;



unsigned long rowbuff[128]={0};



static unsigned int disable_steps;
static int axis_to_home = 0;
static int send_status_once = 0;


void Conditin_Externs(){
 PinMode();
 plan_init(settings.acceleration,settings.acceleration);
 Init_Protocol();
 disableOCx();
 DisableStepper();

 disable_steps = 0;
}



void main() {
int error = 0;
int has_flash = 0;
int modal_group = 0;
int modal_action = 0;
int dif,status_of_gcode;
static int cntr = 0,a = 0;


 Conditin_Externs();

 cntr = a = dif = status_of_gcode = modal_group = modal_action = 0;

 while(1){


 Debounce_Limits(X);
 Debounce_Limits(Y);






 if(status_of_gcode ==  20  ||
 status_of_gcode ==  0 ){
 int axis_to_run = 0;

 modal_group = Get_modalgroup();
#line 102 "C:/Users/Git/Pic32mzCNC/Main.c"
 switch(modal_group){
 case 0:FAIL( 0 );break;
 case 2:
 modal_action = Modal_Group_Actions0(Get_non_modalword());
 modal_group = Rst_modalgroup();
 report_status_message( 0 );
 break;
 case 4:
 axis_to_run = Get_Axisword();

 if(axis_to_run){


 EnableSteppers( ((( 4 * 4 )*2)-1) );
 Modal_Group_Actions1(axis_to_run);
 axis_to_run = Rst_Axisword();
 modal_group = Rst_modalgroup();
 }else{
 int report = GET_FAIL();
 if(!report){
 report_status_message( 0 );
 SET_FAIL( 99 );
 }
 }
 break;
 case 8:
 case 16:
 report_status_message(GET_FAIL());
 modal_group = Rst_modalgroup();
 break;
 case 32:
 Modal_Group_Actions4(1);
 modal_group = Rst_modalgroup();
 break;
 case 64:
 case 128:
 report_status_message(GET_FAIL());
 modal_group = Rst_modalgroup();
 break;
 case 256:
 Modal_Group_Actions7(1);
 modal_group = Rst_modalgroup();
 break;
 case 512:
 Modal_Group_Actions12(gc.coord_select);
 modal_group = Rst_modalgroup();
 break;
 case 1024:

 modal_action = Modal_Group_Actions1( ((( 4 * 4 )*2)-1) );
#line 156 "C:/Users/Git/Pic32mzCNC/Main.c"
 if(modal_action == 0)modal_group = Rst_modalgroup();
 break;
 }
 }

 if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed){
#line 170 "C:/Users/Git/Pic32mzCNC/Main.c"
 status_of_gcode ==  0 ;
 report_status_message(status_of_gcode);

 SV.Tog = 0;
 }



if(!SV.Tog){
if(STPS[X].run_state !=  0  || STPS[Y].run_state !=  0 ){
while(DMA_IsOn(1));
#line 182 "C:/Users/Git/Pic32mzCNC/Main.c"
dma_printf("run_state:= %d\t%l\t%l\t%d\t%l\t%l\n"
,(STPS[X].run_state&0xff)
,STPS[X].step_count
,STPS[X].dist
,(STPS[Y].run_state&0xff)
,STPS[Y].step_count
,STPS[Y].dist);
}
}



 protocol_system_check();


 protocol_execute_runtime();


 status_of_gcode = Sample_Gocde_Line();
#line 212 "C:/Users/Git/Pic32mzCNC/Main.c"
 LED1 = TMR.clock >> 4;




 if(disable_steps <=  10 )
 disable_steps = TMR.Reset( 10 ,disable_steps);



 WDTCONSET = 0x01;
 }
}





static int Modal_Group_Actions0(int action){

int dly_time,i,j,result,axis_words,indx,temp_axis,axis_cnt,temp;
unsigned int home_select = 0;
unsigned long _data;
unsigned long _flash,*addr;
float coord_data[ 4 ];
float a_val;




 switch(action){
 case 2:
 i = 0;

 if(gc.S > 0){
 dly_time = gc.S * 1000;
 while(i < dly_time){
 LED2 = TMR.clock >> 1;
 Delay_ms(1);
 i++;
 }
 }else if(gc.P > 0){
 dly_time = (unsigned long)gc.P;
 while(i < dly_time){
 LED2 = TMR.clock >> 1;
 Delay_ms(1);
 i++;
 }
 }
 LED2 =  0 ;
 break;
 case 4:
#line 276 "C:/Users/Git/Pic32mzCNC/Main.c"
 if(gc.L != 2 && gc.L != 20)
 return -1;
 if (gc.L == 20) {

 result = settings_write_coord_data((int)gc.P,gc.next_position );

 if(result){
 return  1 ;
 }


 if (gc.coord_select > 0) {
 memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
 }

 } else {





 temp = indx = (gc.P-1) & 0xFF;
 indx *= 4;
 axis_cnt = 0;



 axis_words = Get_Axisword();
 for(i = 0; i < 3;i++){
 temp_axis = (axis_words >> i) & 1;

 if(temp_axis == 0){
 axis_cnt++;
 if(axis_cnt > 2)break;

 _flash = buffA[indx];



 coord_data[i] = ulong2flt(_flash);
#line 323 "C:/Users/Git/Pic32mzCNC/Main.c"
 }else{


 coord_data[i] = gc.next_position[i];
#line 334 "C:/Users/Git/Pic32mzCNC/Main.c"
 }
 indx++;
 }

 result = settings_write_coord_data((int)gc.P,coord_data);


 memcpy(gc.coord_system,coord_data,sizeof(coord_data));
 }

 break;
 case 8:
 case 32:


 axis_words = Get_Axisword();
#line 358 "C:/Users/Git/Pic32mzCNC/Main.c"
 if (axis_words) {

 for (i=0; i< 4 ; i++){

 if (  ((axis_words & (1 << i) ) != 0)  ) {
 if (gc.absolute_mode) {
 gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
 } else {
 gc.next_position[i] += gc.position[i];
 }
 } else {
 gc.next_position[i] = gc.position[i];
 }




 SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
 while(GET_RunState(i));
 }
 }

 temp =  9 +1 ;

 if (action ==  (1 << 5) ){temp =  9 +1  + 1 ;}
 i = (temp)*4 ;


 for(j = 0;j<4;j++){
 _data = buffA[i];
 coord_system[temp].coord[j] = ulong2flt(_data);
#line 393 "C:/Users/Git/Pic32mzCNC/Main.c"
 i++;


 SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
 while(GET_RunState(j));
 }
 axis_words = 0;
 break;
 case 16:

 home_select =  9 +1 ;
 if (action ==  6 ) { home_select =  9 +1  + 1 ; }
 settings_write_coord_data(home_select,gc.position);
 break;
 case 53:
 axis_words = Get_Axisword();




 for (i=0; i<=2; i++) {
 if (  ((axis_words & (1 << i) ) != 0)  ) {
 if (!gc.absolute_override) {
 if (!gc.absolute_mode) {
 gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
 } else {
 gc.next_position[i] += gc.position[i];
 }
 } else {
 gc.next_position[i] = gc.position[i];
 }
 }
 }
 break;
 case 64:
 temp =  9 +1 ;
 if (action ==  (1 << 6) ) { temp =  9 +1  + 1 ; }
 settings_write_coord_data(temp,gc.position);
 break;
 case 128:
 axis_words = Get_Axisword();

 if (!axis_words) {
 FAIL( 6 );
 } else {



 for (i=0; i<=2; i++) {
 if ( ((axis_words & (1 << i) ) != 0)  ) {
 gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
 }
 }
 }
 axis_words = 0;
 case 256:

  memset(gc.coord_offset, 0, sizeof(gc.coord_offset)) ;
 break;
 default: action = -1;
 break;
 }
 return action;
}




static int Modal_Group_Actions1(int action){
#line 466 "C:/Users/Git/Pic32mzCNC/Main.c"
 switch(action){
 case 1:
 SingleAxisStep(gc.next_position[X],gc.frequency,X);
 break;
 case 2:
 SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
 break;
 case 3:
 DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
 break;
 case 4:
 SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
 break;
 case 5:
 DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
 break;
 case 6:
 DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
 break;
 case 8:
 SingleAxisStep(gc.next_position[A],gc.frequency,A);
 break;
 case 9:
 DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
 break;
 case 10:
 DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
 break;
 case 12:
 DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
 break;
 case 15:
 sys_sync_current_position();
 r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
 break;
 case  ((( 4 * 4 )*2)-1) :
 axis_to_home = Home(axis_to_home);
 LED2 = TMR.clock >> 3;
#line 508 "C:/Users/Git/Pic32mzCNC/Main.c"
 if(axis_to_home < 2){


 if (sys.abort) {
 action =( -2 );
 }
 }else{
 int l = 0;

 LED2 =  0 ;
 mc_reset();
 action = 0;
 for(l=0;l< 4 ;l++){


 STPS[l].steps_abs_position = 0;
 sys.position[l] = STPS[l].steps_abs_position;


 if(STPS[l].run_state !=  0 )
 STPS[l].run_state =  0 ;
 }


 sys_sync_current_position();


 while(axis_to_home)
 axis_to_home = Rst_Axisword();


 sys.state =  0 ;
 SV.homed =  0 ;
 }
 break;
 default: return action = 0;
 break;
 }

 return action;
}





static int Modal_Group_Actions3(int action){

 if(gc.inches_mode > 1)
 FAIL( 10 );

 return action;
}




static int Modal_Group_Actions4(int action){
#line 570 "C:/Users/Git/Pic32mzCNC/Main.c"
 if(gc.program_flow <  0  ||
 gc.program_flow >  2 )
 FAIL( 6 );

 return action;
}




static int Modal_Group_Actions7(int action){
#line 585 "C:/Users/Git/Pic32mzCNC/Main.c"
 if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
 FAIL( 6 );

 return action;
}




static int Modal_Group_Actions12(int action){
#line 599 "C:/Users/Git/Pic32mzCNC/Main.c"
 return action;
}
