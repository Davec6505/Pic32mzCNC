#line 1 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
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
#line 1 "c:/users/davec/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"







typedef __attribute__((aligned (32))) float afloat;
#line 183 "c:/users/davec/git/pic32mzcnc/settings.h"
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
 unsigned int dir_invert_mask;

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
#line 157 "c:/users/davec/git/pic32mzcnc/flash_r_w.h"
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
#line 108 "c:/users/davec/git/pic32mzcnc/globals.h"
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


int read_ram_loaded_indicator();


int read_coord_data_indicator();


int read_row_from_flash(unsigned long addr);


unsigned int settings_write_coord_data(int coord_select,float *coord);


void settings_read_coord_data();


int settings_read_startup_line(int n, char *line);


int settings_store_startup_line(int n, char *line);




int settings_store_global_setting(int parameter, float value);
int settings_store_grbl_setting(int parameter, float value);
#line 51 "c:/users/davec/git/pic32mzcnc/planner.h"
typedef struct genVars{
 char cir: 1;
 char mode_complete;
}sVars;
extern sVars SV;


void plan_init(float accel,float decel);


void set_calculation_constants();


float Get_Step_Rate(float speed,int axis);


void speed_cntr_Move(long mmSteps, float speed, int axis_combo);


void sys_sync_current_position();


void plan_set_current_position();


long sqrt_(long v);


void r_or_ijk(float xCur,float yCur,float xFin,float yFin,
 float r, float i, float j, float k, int axis_A,int axis_B,int dir);
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 58 "c:/users/davec/git/pic32mzcnc/kinematics.h"
typedef struct {
unsigned int home_state;
unsigned int home_cnt;
}homing_t;


typedef struct Steps{

 unsigned short stopAxis: 1;

 int axis_dir;

 int run_state ;

 long step_delay;

 long decel_start;

 long decel_val;

 long min_delay;

 long accel_count;

 long acc;
 long dec;

 long step_count;

 long dist;

 long new_step_delay;

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
void MultiAxisStep(float *target,int axes,float speed);
void SingleAxisStep(float newxyz,float speed,int axis_No);
static void SingleAxisStart(long dist,float speed,int axis_No);


void mc_arc(float *position, float *target, float *offset, int axis_0,
 int axis_1,int axis_linear, float feed_rate,char invert_feed_rate,
 float radius, char isclockwise);

float hypot(float angular_travel, float linear_travel);


int Home(int axis);
static void Home_Axis(double distance,float speed,int axis);
void mc_reset();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/davec/git/pic32mzcnc/timers.h"
#line 1 "c:/users/davec/git/pic32mzcnc/pins.h"
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
#line 1 "c:/users/davec/git/pic32mzcnc/planner.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 20 "c:/users/davec/git/pic32mzcnc/stepper.h"
typedef enum _axis_{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum _axis_combination_{AXIS_XY,AXIS_XZ,AXIS_YZ,AXIS_XA,AXIS_YA,AXIS_ZA,AXIS_YX,AXIS_ZX,AXIS_AX,AXIS_ZY,AXIS_AY,AXIS_AZ} axis_combination;

extern axis_combination axis_xyz;









void SetPinMode();
void EnableSteppers();
void DisableSteppers();
void disableSpindleOCx();


int GET_RunState(int axis_No);

void Start_Interpolation(int master,int axes);
void Stepper_Abort();
int Stepper_Busy();
void StopAxis(int axis);


int Pulse(int axis_No);
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
#line 23 "c:/users/davec/git/pic32mzcnc/steptodistance.h"
long belt_steps(float move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
float fround(float var);
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
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
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



static int Modal_Group_Actions1(int action);
static int Axes_Running();
static void Wait_Motion();
static void Run_Single_Axes(float *target);
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
#line 1 "c:/users/davec/git/pic32mzcnc/protocol.h"
#line 1 "c:/users/davec/git/pic32mzcnc/tcp_ethernet.h"
#line 5 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
Serial serial;
volatile char rxBuf[ 200 ] absolute  0xA0002000 ;
char txBuf[ 200 ] = {0} absolute 0xA0002200;

static char serial_tx_dma;
static volatile char host_link =  0 ;
static volatile unsigned int serial_realtime;
static volatile char serial_rx_fault;
static volatile char serial_rx_discard;
static volatile char serial_rx_boundary;
static volatile char serial_rx_bad_line;
static volatile char dma1int_flag;
static char serial_line[ 64 ];
static unsigned int serial_line_length;
static char serial_line_overflow;
static char serial_line_fault;
static char serial_last_cr;

static unsigned long Serial_DisableRxInterrupt(){

 unsigned long enabled = IEC4 & 0x00040000;
 IEC4CLR = 0x00040000;
#line 31 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
 return enabled;
}

static void Serial_RestoreRxInterrupt(unsigned long enabled){

 IEC4SET = enabled;
#line 40 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
}

static void Serial_PollText(const char *text){
 while(*text){

 UART2_Write(*text++);
#line 49 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
 }
}

void Reset_Ring(){
 unsigned long enabled = Serial_DisableRxInterrupt();
 serial.tail = serial.head;
 serial_realtime = 0;
 serial_rx_fault = serial_rx_discard = serial_rx_boundary = 0;
 serial_rx_bad_line = 0;
 serial_line_length = 0;
 serial_line_overflow = serial_line_fault = serial_last_cr = 0;
 Serial_RestoreRxInterrupt(enabled);
}

char Host_GetLink(){
 return host_link;
}


void Host_SetLink(char link){
 if(link == host_link) return;
 if(serial_tx_dma) while(DMA_IsOn(1));
 host_link = link;
 Reset_Ring();
}

void Serial_Init(char mode){
 IEC4CLR = 0xC0;
 IFS4CLR = 0xC0;
 DCH0CONCLR = 0x80;
 DCH0INTCLR = 0x00FF00FF;
 DCH1CONCLR = 0x80;
 DCH1INTCLR = 0x00FF00FF;

 IEC4CLR = 0x000E0000;
 UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
#line 91 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
 Delay_ms(100);
 serial.head = serial.tail = 0;
 rxBuf[0] = 0;
 Reset_Ring();
 dma1int_flag = 0;
 serial_tx_dma = (mode ==  2 );
 if(mode !=  1  && mode !=  2 ){
 Serial_PollText("error: Invalid serial mode\r\n");
 return;
 }
 if(serial_tx_dma){
 DMACONCLR = 0x1000;
 DMACONSET = 0x8000;
 DMA1();
 }

 Uart2InterruptSetup();
#line 111 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
}


static char Serial_Push(char ch, unsigned int reserve){
 unsigned int used;
 if(serial.head >= serial.tail) used = serial.head - serial.tail;
 else used =  1024  - serial.tail + serial.head;
 if(used + 1 + reserve >=  1024 ) return 0;
 serial.temp_buffer[serial.head] = ch;
 if(++serial.head ==  1024 ) serial.head = 0;
 return 1;
}


static void Serial_HardFault(){
 serial_rx_fault = 1;
 serial_rx_discard = 1;
 serial_rx_boundary = 0;
 serial_rx_bad_line = 0;
}




static void Serial_ReceiveFault(){
 if(serial_rx_fault || serial_rx_discard || serial_rx_bad_line) return;
 if(Serial_Push( 0x01 ,0)) serial_rx_bad_line = 1;
 else Serial_HardFault();
}


static void Serial_EndBadLine(char ch){
 serial_rx_bad_line = 0;
 if(!Serial_Push(ch,0)){
 Serial_HardFault();
 serial_rx_boundary = 1;
 }
}

static void Serial_ReceiveByte(char ch){
 switch(ch){
 case  '?' : serial_realtime |=  (1 << 0) ; return;
 case  '~' : serial_realtime |=  (1 << 1) ; return;
 case  '!' : serial_realtime |=  (1 << 3) ; return;
 case  0x18 : serial_realtime |=  (1 << 4) ; return;
 }


 if((unsigned char)ch >= 0x80) return;
 if(ch == 0 || ch ==  0x01 ){
 Serial_ReceiveFault();
 return;
 }
 if(serial_rx_bad_line){
 if(ch == '\r' || ch == '\n') Serial_EndBadLine(ch);
 return;
 }
 if(serial_rx_fault || serial_rx_discard){
 if(ch == '\r' || ch == '\n'){
 serial_rx_boundary = 1;
 if(!serial_rx_fault) serial_rx_discard = 0;
 }else{
 serial_rx_boundary = 0;
 }
 return;
 }

 if(!Serial_Push(ch,1)){
 Serial_ReceiveFault();
 if(ch == '\r' || ch == '\n'){
 if(serial_rx_bad_line) Serial_EndBadLine(ch);
 else serial_rx_boundary = 1;
 }
 }
}


void Uart2InterruptSetup(){
 IEC4CLR = 0x000E0000;
 U2STACLR = 0xC0;
 IPC36CLR = 0x001F0000;
 IPC36SET = 0x00150000;
 IFS4CLR = 0x000E0000;
 IEC4SET = 0x00040000;
}

void UART2() iv IVT_UART2_RX ilevel 5 ics ICS_SRS {
 unsigned long status;
 char ch;
 IFS4CLR = 0x00040000;
 if(U2STA & 0x2){
 if(host_link ==  0 ) Serial_ReceiveFault();
 U2STACLR = 0x2;
 }
 while(U2STA & 0x1){
 status = U2STA;
 ch = U2RXREG;
 if(host_link !=  0 ) continue;
 if(status & 0xC) Serial_ReceiveFault();
 else Serial_ReceiveByte(ch);
 }
}
#line 242 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
void Host_ReceiveBytes(char *bytes, unsigned int n){
 unsigned long enabled;
 if(host_link !=  1 ) return;
 enabled = Serial_DisableRxInterrupt();
 while(n--) Serial_ReceiveByte(*bytes++);
 Serial_RestoreRxInterrupt(enabled);
}

unsigned int Serial_TakeRealtime(){
 unsigned int flags;
 unsigned long enabled = Serial_DisableRxInterrupt();
 flags = serial_realtime;
 serial_realtime = 0;
 Serial_RestoreRxInterrupt(enabled);
 return flags;
}

unsigned int Serial_PeekRealtime(){
 return serial_realtime;
}

char Serial_TakeStatusRequest(){
 char taken;
 unsigned long enabled = Serial_DisableRxInterrupt();
 taken = (serial_realtime &  (1 << 0) ) != 0;
 serial_realtime &= ~ (1 << 0) ;
 Serial_RestoreRxInterrupt(enabled);
 return taken;
}

int Get_Head_Value(){
 return serial.head;
}

int Get_Tail_Value(){
 return serial.tail;
}

int Get_Difference(){
 unsigned int head = serial.head;
 if(head >= serial.tail) return head - serial.tail;
 return  1024  - serial.tail + head;
}


static int Serial_ReadByte(char *ch){
 unsigned long enabled = Serial_DisableRxInterrupt();
 int result = 0;
 if(serial_rx_fault){
 serial.tail = serial.head;
 serial_rx_discard = !serial_rx_boundary;
 serial_rx_fault = serial_rx_boundary = 0;
 result =  -2 ;
 }else if(serial.tail != serial.head){
 *ch = serial.temp_buffer[serial.tail];
 serial.tail++;
 if(serial.tail ==  1024 ) serial.tail = 0;
 result =  1 ;
 }
 Serial_RestoreRxInterrupt(enabled);
 return result;
}

int Serial_ReadLine(char *line){
 char ch;
 int result;
 while((result = Serial_ReadByte(&ch)) !=  0 ){
 if(result ==  -2 ){
 serial_line_length = 0;
 serial_line_overflow = serial_line_fault = serial_last_cr = 0;
 return result;
 }
 if(ch ==  0x01 ){
 serial_line_fault = 1;
 continue;
 }
 if(ch == '\n' && serial_last_cr){
 serial_last_cr = 0;
 continue;
 }
 serial_last_cr = (ch == '\r');
 if(ch == '\r' || ch == '\n'){
 if(serial_line_fault){
 serial_line_length = 0;
 serial_line_overflow = serial_line_fault = 0;
 return  -2 ;
 }
 if(serial_line_overflow){
 serial_line_length = 0;
 serial_line_overflow = 0;
 return  -1 ;
 }
 serial_line[serial_line_length] = 0;
 strcpy(line, serial_line);
 serial_line_length = 0;
 return  1 ;
 }
 if(serial_line_length <  64  - 1){
 serial_line[serial_line_length++] = ch;
 }else{
 serial_line_overflow = 1;
 }
 }
 return  0 ;
}

void DMA1(){
 IEC4CLR = 0x80;
 IFS4CLR = 0x80;
 DCH1CON = 0x3;

 U2STACLR = 0xC000;
 DCH1ECON = (147 << 8) | 0x10;
 DCH1DSA = KVA_TO_PA(0xBF822220);
#line 361 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
 DCH1SSA = KVA_TO_PA(0xA0002200);
 DCH1SSIZ =  200 ;
 DCH1DSIZ = 1;
 DCH1CSIZ = 1;
 IPC33CLR = 0x1F000000;
 IPC33SET = 0x16000000;
 DCH1INTCLR = 0x00FF00FF;
 DCH1INTSET = 0x00090000;
 IEC4SET = 0x80;
}

char DMA1_Flag(){
 return dma1int_flag;
}

unsigned int DMA1_Enable(){
 DCH1CONSET = 0x80;
 return (DCH1CON & 0x80) >> 7;
}

void DMA1_Disable(){
 DCH1ECONSET = 0x40;
}


unsigned int DMA_IsOn(int channel){
 if(channel == 0) return (DCH0CON & 0x8080) != 0;
 return (DCH1CON & 0x8080) != 0;
}

unsigned int DMA_Suspend(){
 DMACONSET = 0x1000;
 return (DMACON & 0x1000) >> 12;
}

unsigned int DMA_Resume(){
 DMACONCLR = 0x1000;
 return (DMACON & 0x1000) >> 12;
}

unsigned int DMA_Busy(){
 return (DMACON & 0x800) >> 11;
}

void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
 dma1int_flag |= DCH1INT & 0xFF;
 if(DCH1INT & 0x8){
 DCH1CONCLR = 0x80;
 }
 if(DCH1INT & 0x1){
 DCH1ECONSET = 0x40;
 DCH1CONCLR = 0x80;
 }
 DCH1INTCLR = 0xFF;
 IFS4CLR = 0x80;
}

static int Serial_WaitTx(){
 while(DMA_IsOn(1));
 if((dma1int_flag | DCH1INT) & 0x1){
 dma1int_flag = 0;
 Serial_PollText("error: DMA transmit failure\r\n");
 return 0;
 }
 return 1;
}

static void Serial_FlushTx(unsigned int *used){
 if(*used){
 dma1int_flag = 0;
 DCH1INTCLR = 0xFF;
 IFS4CLR = 0x80;
 DCH1SSIZ = *used;
 DMA1_Enable();
 *used = 0;
 }
}

static int Serial_PutChar(char ch, unsigned int *used){
 if(host_link ==  1 ) return Ethernet_HostPut(ch);
 if(!serial_tx_dma){

 UART2_Write(ch);
#line 447 "c:/Users/davec/GIT/Pic32mzCNC/Serial_Dma.c"
 return 1;
 }
 if(*used == 0 && !Serial_WaitTx()) return 0;
 txBuf[(*used)++] = ch;
 if(*used ==  200 ) Serial_FlushTx(used);
 return 1;
}

int dma_printf(const char *str,...){
 va_list va;
 unsigned int used = 0;
 int count = 0;
 char tmp[384];
 char *text;
 char ch;
 if(!str){
 Serial_PollText("error: Invalid serial format\r\n");
 return -1;
 }
  __va_start(va, str) ;
 while(*str){
 ch = *str++;
 if(ch != '%'){
 if(!Serial_PutChar(ch,&used)) goto tx_error;
 count++;
 continue;
 }
 ch = *str++;
 text = tmp;
 switch(ch){
 case '%': tmp[0] = '%'; tmp[1] = 0; break;
 case 'c':
 if(!Serial_PutChar( __va_arg(va, char) ,&used)) goto tx_error;
 count++;
 continue;
 case 'd': sprintf(tmp,"%d", __va_arg(va, int) ); break;
 case 'u': sprintf(tmp,"%u", __va_arg(va, unsigned int) ); break;
 case 'l': sprintf(tmp,"%ld", __va_arg(va, long) ); break;
 case 'X': sprintf(tmp,"%X", __va_arg(va, unsigned int) ); break;
 case 'f': sprintf(tmp,"%08.3f", __va_arg(va, float) ); break;
 case 'F': sprintf(tmp,"%E", __va_arg(va, double) ); break;
 case 'p': sprintf(tmp,"%p", __va_arg(va, void*) ); break;
 case 's':
 text =  __va_arg(va, char*) ;
 if(!text) text = "(null)";
 break;
 default:
 if(serial_tx_dma && !Serial_WaitTx()) return -1;
 Serial_PollText("error: Invalid serial format\r\n");
 return -1;
 }
 while(*text){
 if(!Serial_PutChar(*text++,&used)) goto tx_error;
 count++;
 }
 }
 if(serial_tx_dma) Serial_FlushTx(&used);
 return count;

tx_error:
 return -1;
}

void lTrim(char *d,char *s){
 int i = 0, j, k = 0;
 j = strlen(s);
 while(*s != '\0'){
 if((*s > 0x30) || k > 0){
 k = 1;
 *d++ = *s;
 }else{
 i++;
 }
 s++;
 }
 if(i == j) *d++ = '0';
 *d = 0;
}
