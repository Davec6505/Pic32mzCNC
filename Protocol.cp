#line 1 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
#line 1 "c:/users/davec/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/timers.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"







typedef __attribute__((aligned (32))) float afloat;
#line 181 "c:/users/davec/git/pic32mzcnc/settings.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/planner.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/flash_r_w.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
#line 31 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
typedef struct{
 volatile char temp_buffer[ 1024 ];
 volatile unsigned int head;
 volatile unsigned int tail;
} Serial;

extern Serial serial;
extern volatile char rxBuf[];
extern char txBuf[];

void Serial_Init(char mode);

void Uart2InterruptSetup();
#line 47 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
unsigned int Serial_TakeRealtime();
unsigned int Serial_PeekRealtime();

char Serial_TakeStatusRequest();

int Serial_ReadLine(char *line);
void Reset_Ring();
void Host_SetLink(char link);
char Host_GetLink();

void Host_ReceiveBytes(char *bytes, unsigned int n);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();

void DMA1();
char DMA1_Flag();
unsigned int DMA1_Enable();
void DMA1_Disable();
unsigned int DMA_IsOn(int channel);
unsigned int DMA_Busy();
unsigned int DMA_Suspend();
unsigned int DMA_Resume();

int dma_printf(const char *str,...);
void lTrim(char *d,char *s);
#line 155 "c:/users/davec/git/pic32mzcnc/flash_r_w.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 30 "c:/users/davec/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_);


float fround(float val);


int round(float val);


long lround(float val);
#line 107 "c:/users/davec/git/pic32mzcnc/globals.h"
extern unsigned long volatile buffA[512];





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
extern volatile coord_sys coord_system[ 11 ];





void settings_init(short reset_all);
int settings_restore(int restore_mask);


static int set_ram_loaded_indicator(int val);


static void zero_ram_loaded_indicator();


int read_ram_loaded_indicator();


static void rst_single_coord_read_indicators(int flag);


static void rst_coord_read_indicator();


int read_coord_data_indicator();


int read_row_from_flash(unsigned long addr);


unsigned int settings_write_coord_data(int coord_select,float *coord);


void settings_read_coord_data();


int settings_read_startup_line(int n, char *line);


int settings_store_startup_line(int n, char *line);


void write_global_settings();


int settings_store_global_setting(int parameter, float value);
int settings_store_grbl_setting(int parameter, float value);
#line 62 "c:/users/davec/git/pic32mzcnc/planner.h"
typedef struct genVars{
 char running: 1;
 char startPulses: 1;
 char homed: 1;
 char run_circle: 1;
 char cir: 1;
 char Single_Dual: 1;
 char mode_complete;
 int AxisNo;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
 long dif;
 long dA;
 long dB;
 long dC;
 long prevA;
 long prevB;
 long prevC;
 long over;
}sVars;
extern sVars SV;


void plan_init(float accel,float decel);


void set_calculation_constants();


float Get_Step_Rate(float speed,int axis);


void speed_cntr_Move(long mmSteps, float speed, int axis_combo);


void sys_sync_current_position();


void plan_set_current_position();


void plan_reset_absolute_position();


long sqrt_(long v);


void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
 float r, float i, float j, float k, int axis_A,int axis_B,int dir);
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 59 "c:/users/davec/git/pic32mzcnc/kinematics.h"
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

 unsigned short PLS_Step_ : 1;

 unsigned short stopAxis: 1;

 int axis_dir;

 int run_state ;

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

 float max_travel;
}STP;
extern STP STPS[ 4 ];







void SetInitialSizes(STP axis[6]);


static void Set_Axisdirection(long temp,int axis);


void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed);
void SingleAxisStep(float newxyz,float speed,int axis_No);
static void SingleAxisStart(long dist,float speed,int axis_No);


void mc_arc(float *position, float *target, float *offset, int axis_0,
 int axis_1,int axis_linear, float feed_rate,char invert_feed_rate,
 float radius, char isclockwise);

float hypot(float angular_travel, float linear_travel);


int GetAxisDirection(long mm2move);



void ResetHoming();
int Home(int axis);
static void Home_Axis(double distance,float speed,int axis);
static void Inv_Home_Axis(double distance,float speed,int axis);
void mc_dwell(float sec);
void mc_reset();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/davec/git/pic32mzcnc/timers.h"
#line 1 "c:/users/davec/git/pic32mzcnc/pins.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 1 "c:/users/davec/git/pic32mzcnc/planner.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 35 "c:/users/davec/git/pic32mzcnc/stepper.h"
typedef enum _axis_{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum _axis_combination_{AXIS_XY,AXIS_XZ,AXIS_YZ,AXIS_XA,AXIS_YA,AXIS_ZA,AXIS_YX,AXIS_ZX,AXIS_AX,AXIS_ZY,AXIS_AY,AXIS_AZ} axis_combination;

extern _axis_ _axis;
extern axis_combination axis_xyz;




extern long test;
#line 53 "c:/users/davec/git/pic32mzcnc/stepper.h"
 typedef struct{
 uint32_t phase;
 uint32_t incrament;
 uint32_t old_phase;
 } dds_axis_t;

 extern volatile dds_axis_t dds_axes[4];



void SetPinMode();
void CycleStart();
void CycleStop();

void DisableStepperInterrupt(int stepper);
void EnableSteppers();
void DisableSteppers();
void disableSpindleOCx();


int GET_RunState(int axis_No);
int Steppers_Enabled();


static void SingleStepAxis(int axis);
void Start_Interpolation(int axisA,int axisB);
static void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);



void Single_Axis_Enable(_axis_ axis_);
#line 16 "c:/users/davec/git/pic32mzcnc/timers.h"
struct Timer{
char clock;
char P1: 1;
char P2: 1;
unsigned int disable_cnt;
unsigned int (*Reset)(unsigned int time,unsigned int last_sec);
};
extern struct Timer TMR;
#line 35 "c:/users/davec/git/pic32mzcnc/timers.h"
void InitTimer1();
#line 46 "c:/users/davec/git/pic32mzcnc/timers.h"
void InitTimer8();
#line 53 "c:/users/davec/git/pic32mzcnc/timers.h"
void Timer8CallbackInitialize(void (*callback)());
#line 58 "c:/users/davec/git/pic32mzcnc/timers.h"
void Timer8_Start();
#line 63 "c:/users/davec/git/pic32mzcnc/timers.h"
void Timer8_Stop();
#line 70 "c:/users/davec/git/pic32mzcnc/timers.h"
static void ClockPulse();
#line 78 "c:/users/davec/git/pic32mzcnc/timers.h"
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 58 "c:/users/davec/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 70 "c:/users/davec/git/pic32mzcnc/steptodistance.h"
long calcSteps(float mmsToMove, float Dia);
long leadscrew_sets(float move_distance,int axis);
long belt_steps(float move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
float mm2in(float mm);
float in2mm(float inch);
float fround(float var);
float torpm(float mm_per_min);
float toradians(float rev_per_min);
#line 1 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 1 "c:/users/davec/git/pic32mzcnc/limits.h"
#line 1 "c:/users/davec/git/pic32mzcnc/pins.h"
#line 1 "c:/users/davec/git/pic32mzcnc/timers.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 35 "c:/users/davec/git/pic32mzcnc/limits.h"
struct limit {

char Pin: 1;
char Limit_Min: 1;
char Limit_Max: 1;
char new_val;
char old_Pval;
char old_Fval;

unsigned int trip_cnt;
unsigned int release_cnt;


long Soft_Limit_Min;

};



void Limit_Initialize();

static void X_Min_Limit_Setup();
static void Y_Min_Limit_Setup();
static void Z_Min_Limit_Setup();
static void A_Min_Limit_Setup();

void Set_Min_Limit(int axis);
char Test_Port_Pins(int axis);
char Test_Min(int axis);
void Reset_Min_Limit(int axis);
void XOR_Min_Limit(int axis);
void Invert_Min_Limit(int axis);

void Limits_Sample();

char Limits_TakeEvent();

char FP(int axis);
void Rst_FP(int axis);
char FN(int axis);
void Rst_FN(int axis);
#line 1 "c:/users/davec/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/davec/git/pic32mzcnc/flash_r_w.h"
#line 1 "c:/users/davec/git/pic32mzcnc/tcp_ethernet.h"




void Ethernet_Transport_Init();
void Ethernet_Transport_Poll();
char Ethernet_Ready();
char *Ethernet_Address();
int Ethernet_HostPut(char ch);
#line 31 "c:/users/davec/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;







void PinMode();

void set_performance_mode();


void OutPutPulseXYZ();


static int Modal_Group_Actions0(int action);


static int Execute_Gcode_Line();
static void Compute_Target(int axes,float *target);
static void Motion_Line(int axes);
static void Run_Move(float *target,int mode);


void Cycle_Complete();


void Host_ServiceNow();
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 49 "c:/users/davec/git/pic32mzcnc/gcode.h"
extern volatile int status_code;
#line 162 "c:/users/davec/git/pic32mzcnc/gcode.h"
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
 float inverse_feedrate;
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
 float dwell;
 int DIR;
} parser_state_t;
extern parser_state_t gc;
void G_Save_State();
void G_Restore_State();








void G_Initialise();
void G_Begin_Block();
void G_Program_End();

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
static void Load_Coord_System(int select);
#line 1 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/davec/git/pic32mzcnc/print.h"
#line 36 "c:/users/davec/git/pic32mzcnc/print.h"
void report_status_message(int status_code);

void report_alarm_message(int alarm_code);

void report_feedback_message(int message_code);

void report_init_message();

void report_startup_line(int n, char *line);

void report_grbl_help();


void report_grbl_settings();

void report_gcode_parameters();

void report_gcode_modes();
void report_build_info();

void protocol_execute_startup();

void report_realtime_status();
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
#line 1 "c:/users/davec/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 1 "c:/users/davec/git/pic32mzcnc/timers.h"
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 52 "c:/users/davec/git/pic32mzcnc/protocol.h"
void Init_Protocol();


void Str_Initialize(char arg[ 20 ][ 64 ]);


void Str_clear(char *str,int len);


int Sample_Gocde_Line();







static int Check_Query_Type(char *str_,int dif_);


static int Do_Gcode(char *str_,int dif_);


static int gcode_words(char *line);


static int Machine_Busy();


int Sample_Ringbuffer();


static int strsplit(char arg[ 20 ][ 64 ],char *str, char c);
static int strsplit2(char arg[ 20 ][ 64 ],char *str,char c);


static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);


static int str2int(char *str,int base);


void protocol_execute_startup();


void protocol_system_check();


void protocol_execute_runtime();
#line 1 "c:/users/davec/git/pic32mzcnc/print.h"
#line 29 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
const code char SL[] = "$N";
volatile char gcode[ 20 ][ 64 ];
char startup absolute 0xA0002600 ;



void Init_Protocol(){
 startup = 0;
 report_init_message();
}


void Str_Initialize(char arg[ 20 ][ 64 ]){
int i;
 for(i = 0; i <  20 ;i++){
 memset(arg[i],0, 64 );
 }
}

void Str_clear(char *str,int len){
 memset(str,0,len);
}




static int strsplit(char arg[ 20 ][ 64 ],char *str, char c){
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




static int strsplit2(char arg[ 20 ][ 64 ],char *str, char c){
int i,ii,kk,err,lasti,len,track_char;
 Str_Initialize(arg);
 len = strlen(str);


 track_char=ii=kk=err=lasti=0;
 for (i = 0;i < len;i++){
 err = i - lasti;
 if(*(str+i) == c || *(str+i) == '\n' || err > 49){
 arg[kk++][ii] = 0;
 ii=err=0;
 lasti = i;
 track_char++;
 continue;
 }else{
 if(i > 0 && (*(str+0) != '$') ){
 if(!track_char && *(str+i) > 0x39){
 arg[kk++][ii] = 0;
 ii=err=0;
 lasti = i;
 }
 }
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
#line 164 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
void protocol_execute_runtime(){
 unsigned int pending = Serial_TakeRealtime();
 if(pending &  (1 << 4) ){
 Reset_Ring();
 mc_reset();
 pending &= ~ (1 << 4) ;
 }

 if(Limits_TakeEvent()){
 mc_reset();
 sys.execute |=  (1 << 6) ;
 }
 sys.execute |= pending;
 if (sys.execute) {
 int rt_exec = sys.execute;




 if (rt_exec & ( (1 << 5)  |  (1 << 6) )) {
 sys.state =  6 ;


 if (rt_exec &  (1 << 6) ) {
 report_alarm_message( -1 );
 report_feedback_message( 1 );
  (sys.execute &= ~ (1 << 4) ) ;
 do {
 Ethernet_Transport_Poll();
 if(Serial_TakeRealtime() &  (1 << 4) ){
 Reset_Ring();
 mc_reset();
 }
 } while ( ((sys.execute & (1 << 4) ) == 0) );


 } else {



 report_alarm_message( -2 );
 }
  (sys.execute &= ~( (1 << 5)  | (1 << 6) )) ;
 }


 if (rt_exec &  (1 << 4) ) {
 sys.abort =  1 ;
 return;
 }


 if (rt_exec &  (1 << 0) ) {
 report_realtime_status();
  (sys.execute &= ~ (1 << 0) ) ;
 }


 if (rt_exec &  (1 << 3) ) {


 if (sys.state ==  0 ) sys.state =  4 ;
  (sys.execute &= ~ (1 << 3) ) ;
 }



 if (rt_exec &  (1 << 2) ) {

  (sys.execute &= ~ (1 << 2) ) ;
 }

 if (rt_exec &  (1 << 1) ) {


 if (sys.state ==  4 ) sys.state =  0 ;
 if ( ((settings.flags & 2 ) != 0) ) {
 sys.auto_start =  1 ;
 }
  (sys.execute &= ~ (1 << 1) ) ;
 }
 }



}



void protocol_system_check(){



 if (sys.abort) {

 Reset_Ring();










 sys_sync_current_position();


 sys.abort = 0;
 sys.execute = 0;
 startup = 0;
 report_init_message();
 if ( ((settings.flags & (1 << 1) ) != 0) ) { sys.auto_start =  1 ; }









 if (sys.state ==  1  &&  ((settings.flags & (1 << 4) ) != 0) ) { sys.state =  6 ; }



 if (sys.state ==  6 ) {
 report_feedback_message( 2 );
 } else {

 sys.state =  0 ;

 }
 }
}




int Sample_Gocde_Line(){
 char str[ 64 ];
 int state, dif, result;
 result = Serial_ReadLine(str);
 if(result ==  0 ) return  0 ;
 if(result ==  -1  || result ==  -2 ){
 report_status_message(result ==  -1  ?  15  :  16 );
 return  0 ;
 }
 if(sys.abort || (sys.execute &  (1 << 4) )) return  99 ;
 dif = strlen(str);
 if(dif == 0){
 report_status_message( 0 );
 return  0 ;
 }
 if(str[0] == '$'){
 Check_Query_Type(str,dif);
 return  99 ;
 }
 if(sys.state ==  6 ){
 report_status_message( 12 );
 return  99 ;
 }



 state = Do_Gcode(str,dif);
#line 335 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 if(state !=  0  || sys.state ==  7 ){
 report_status_message(state);
 G_Begin_Block();
 return  99 ;
 }
 return  20 ;
}

static int Machine_Busy(){
 return (sys.state ==  3  || sys.state ==  4  ||
 sys.state ==  5  || sys.state ==  8 );
}



static int Check_Query_Type(char *str_,int dif_){
int query;
int helper_var;
int status =  0 ;
#line 358 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 if(str_[0] == '$'){

 switch(str_[1]){
 case '$': case '#': case 'G': case 'C': case 'X': case 'H': case 'I':
 if(str_[2] != 0){
 report_status_message( 6 );
 return  6 ;
 }
 }
 switch(str_[1]){
 case '\0': case '\r' :case '\n' :
 report_grbl_help();
 status =  0 ;
 break;
 case '$':
 report_grbl_settings();
 status =  0 ;
 break;
 case '#' :
 report_gcode_parameters();
 status =  0 ;
 break;
 case 'G' :
 report_gcode_modes();
 status =  0 ;
 break;
 case 'C' :
 status =  0 ;
#line 393 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 if ( sys.state ==  7  ) {
 mc_reset();
 report_feedback_message( 5 );
 } else if (sys.state) {
 status =  11 ;
 } else {
 sys.state =  7 ;
 report_feedback_message( 4 );
 }
 break;
 case 'X' :
 if (sys.state ==  6 ) {
 report_feedback_message( 3 );
 sys.state =  0 ;

 }
 status =  0 ;
 break;
 case 'H' :


 status =  3 ;
 break;
#line 449 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 case 'N' :
 if ( str_[2] < 0x20 ) {
 for (helper_var=0; helper_var <  2 ; helper_var++) {
 if ((settings_read_startup_line(helper_var, str_))) {
 status =  10 ;
 break;
 }
 report_startup_line(helper_var,str_);
#line 461 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 }
 break;
 }else {
 int N_Val = 0;
 helper_var = 1;




 if ( str_[2] >= '0' && str_[2] < '0' +  2  ) {
 char num[] = "0";

 num[0] = str_[2];
 N_Val = atoi(num);
#line 481 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 }else {
 status =  1 ;
 break;
 }


 if (helper_var) {
 int str_len = 0;
 if(str_[3] != '='){

 status =  6 ;


 helper_var = strlen((str_));
#line 503 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 str_len = strlen(str_);
#line 508 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 }else{
 int str_length = 0;
#line 517 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 if(Machine_Busy())
 status =  11 ;
 else if(settings_store_startup_line(N_Val,str_+4))
 status =  10 ;
 }

 }
 }
 break;
 case 'I' :
 report_build_info();
 status =  0 ;
 break;
 case 'J' :
 status =  3 ;
 break;
 case 'R' :
 if(strncmp(str_+1,"RST=",4)){
 status =  6 ;
 break;
 }
 switch(str_[5]){
 case '$': helper_var =  0x01 ; break;
 case '#': helper_var =  0x02 ; break;
 case '*': helper_var =  0xFF ; break;
 default : helper_var = 0; break;
 }
 if(!helper_var){
 status =  6 ;
 }else if(Machine_Busy()){
 status =  11 ;
 }else if(settings_restore(helper_var)){
 status =  10 ;
 }else{
 status =  0 ;
 }
 break;
 case '0': case '1': case '2': case'3': case '4': case '5':
 case '6': case '7': case '8': case '9': {

 char *eq = strchr(str_,'=');
 if((eq == 0) || (!isdigit(eq[1]) && eq[1] != '.' && eq[1] != '-')){
 status =  1 ;
 }else if(Machine_Busy()){
 status =  11 ;
 }else{
 int N_Val = atoi(str_+1);
 float value = atof(eq+1);
#line 569 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 status = settings_store_grbl_setting(N_Val,value);
 }
 break;
 }
 default:
 status =  6 ;
 break;
 }
 report_status_message(status);

 return status;
 }else{
 status =  20 ;
 }
 return status;
}




static int gcode_words(char *line){
int n = 0, k = 0, in_comment = 0;
char ch;
 Str_Initialize(gcode);
 while((ch = *line++) != 0){
 if(in_comment){
 if(ch == ')') in_comment = 0;
 continue;
 }
 if(ch == '(') { in_comment = 1; continue; }
 if(ch == ';') break;
 if(ch == ' ' || ch == '\t') continue;
 ch = toupper(ch);
 if(ch >= 'A' && ch <= 'Z'){
 if(n >=  20 ) return -1;
 k = 0;
 gcode[n++][k++] = ch;
 }else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
 if(k >=  64 -1) return -1;
 gcode[n-1][k++] = ch;
 }else{
 return -1;
 }
 }
 return n;
}




static int Do_Gcode(char *str_,int dif_){
float XYZ_Val;
int i,pass,num_of_strings,Val,st,is_mode;
int err =  0 ;
char *num;

 G_Begin_Block();
 G_Save_State();
 num_of_strings = gcode_words(str_);
 if(num_of_strings < 0) return  2 ;
#line 633 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 for(pass=0; pass < 2; pass++)
 for(i=0; i < num_of_strings; i++){
 is_mode = (gcode[i][0] == 'G' || gcode[i][0] == 'M');
 if(is_mode != (pass == 0)) continue;
 num = gcode[i]+1;
 if(*num == 0){
 st =  1 ;
 }else{
 st =  0 ;
 switch(gcode[i][0]){
 case 'G':


 Val = (int)(atof(num)*10.0 + 0.5);
 if(Val % 10 == 0){
 Val /= 10;
 if(Val == 28 || Val == 30 || Val == 92) Val *= 10;
 }
 G_Mode(Val);
 st = GET_FAIL();
#line 657 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 break;
 case 'M':
 M_Mode(atoi(num));
 st = GET_FAIL();
 break;
 case 'X':case 'Y':case 'Z':case 'A':
 case 'I':case 'J':case 'K':case 'R':case 'F':
 XYZ_Val = atof(num);
 st = Instruction_Values(gcode[i],&XYZ_Val);
#line 670 "c:/Users/davec/GIT/Pic32mzCNC/Protocol.c"
 break;
 case 'P':case 'L':
 case 'S':
 if(gcode[i][0] == 'P') gc.dwell = atof(num);
 Val = atoi(num);
 st = Instruction_Values(gcode[i],&Val);
 break;
 case 'N':
 break;
 case 'T':
 default:
 st =  3 ;
 break;
 }
 }
 if(err ==  0 ) err = st;
 }

 if(err ==  0 ) err = Check_group_multiple_violations();
 if(err !=  0 ) G_Restore_State();
 return err;
}
