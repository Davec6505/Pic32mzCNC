#line 1 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/planner.h"
#line 1 "c:/users/davec/git/pic32mzcnc/config_adv.h"
#line 1 "c:/users/davec/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/davec/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/davec/git/pic32mzcnc/globals.h"
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
#line 11 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
unsigned long volatile buffA[512]= {0} absolute 0xA0000000 ;
static unsigned long volatile add = 0;


static volatile int ram_loaded;
static volatile int coord_read;


volatile unsigned long j = 0;
volatile unsigned long i = 0;
volatile unsigned int error = 0;


static void settings_load_row();
static void settings_blank_row();
static int settings_save_row();
static void settings_default_row();
static void settings_apply_row();
static int set_ram_loaded_indicator(int val);
static void zero_ram_loaded_indicator();
static void rst_single_coord_read_indicators(int flag);
static void rst_coord_read_indicator();

void set_calculation_constants();




void settings_init(short reset_all){
unsigned long marker;
 if(!reset_all){
 sys.abort = 0;
 sys.state = 0;
 sys.homing = 0;
 sys.execute = 0;
 sys.auto_start = 0;
 return;
 }

 add = (unsigned long) 0xBD1BC5F0 ;
 marker = NVMReadWord((void*)add);
#line 59 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 if(marker !=  0x7FFF0102 ){
 settings_blank_row();
 settings_default_row();
 }

 settings_load_row();
 settings_apply_row();
}




static void settings_blank_row(){
int k;
 for(k = 0; k < 512; k++)
 buffA[k] = 0xFFFFFFFF;
 for(k = 0; k < ( 11 * 4 ); k++)
 buffA[k] = 0;
 for(k =  0x180 ; k < ( 0x190 +16); k++)
 buffA[k] = 0;
 set_ram_loaded_indicator(1);
 rst_coord_read_indicator();
}



static void settings_default_row(){
unsigned long flags = 0;

 buffA[ 0x40 ] = flt2ulong( 186.750 );
 buffA[ 0x41 ] = flt2ulong( 186.750 );
 buffA[ 0x42 ] = flt2ulong( 186.750 );
 buffA[ 0x43 ] = flt2ulong( 186.750 );
 buffA[ 0x44 ] = flt2ulong( 186.750 );
 buffA[ 0x45 ] = flt2ulong( 186.750 );
 buffA[ 0x46 ] = (unsigned long) 100 ;
 buffA[ 0x47 ] = flt2ulong( 80.00 );
 buffA[ 0x48 ] = flt2ulong( 300.00 );
 buffA[ 0x49 ] = flt2ulong( 12.00 );
 buffA[ 0x4A ] = flt2ulong( 100.00 );
 buffA[ 0x4B ] = flt2ulong( 1.00 );
 buffA[ 0x4C ] = flt2ulong( 0.20 );

 buffA[ 0x4D ] = flt2ulong( 1.3889 );
 buffA[ 0x4E ] = flt2ulong( 0.05 );
 buffA[ 0x4F ] = (unsigned long) 25 ;
 buffA[ 0x53 ] = (unsigned long) 25 ;
 buffA[ 0x52 ] = (unsigned long) 100 ;
 buffA[ 0x54 ] = (unsigned long) 32.00 ;
 buffA[ 0x56 ] = (unsigned long) 3 ;
 buffA[ 0x57 ] = (unsigned long) 15 ;
 buffA[ 0x58 ] = (unsigned long) 0 ;
 buffA[ 0x59 ] = (unsigned long) 5 ;

 if ( 0 ) { flags |=  (1 << 0) ; }
 if ( 1 ) { flags |=  (1 << 1) ; }
 if ( 0 ) { flags |=  (1 << 2) ; }
 if ( 1 ){ flags |=  (1 << 3) ; }
 if ( 1 ) { flags |=  (1 << 4) ; }
 if ( 0 ){ flags |=  (1 << 5) ; }
 buffA[ 0x50 ] = flags;
}



static void settings_apply_row(){


 settings.steps_per_mm[X] = ulong2flt(buffA[ 0x40 ]);
 settings.steps_per_mm[Y] = ulong2flt(buffA[ 0x41 ]);
 settings.steps_per_mm[Z] = ulong2flt(buffA[ 0x42 ]);
 settings.steps_per_mm[A] = ulong2flt(buffA[ 0x43 ]);
 settings.default_feed_rate = ulong2flt(buffA[ 0x47 ]);
 settings.default_seek_rate = ulong2flt(buffA[ 0x48 ]);
 settings.homing_feed_rate = ulong2flt(buffA[ 0x49 ]);
 settings.homing_seek_rate = ulong2flt(buffA[ 0x4A ]);
 settings.homing_pulloff = ulong2flt(buffA[ 0x4B ]);
 settings.mm_per_arc_segment = ulong2flt(buffA[ 0x4C ]);
 settings.acceleration = ulong2flt(buffA[ 0x4D ])* 3600 ;
 settings.junction_deviation = ulong2flt(buffA[ 0x4E ]);
 settings.n_arc_correction = (unsigned int)buffA[ 0x4F ];
 settings.flags = (unsigned int)buffA[ 0x50 ];
 settings.stepper_idle_lock_time = (unsigned int)buffA[ 0x53 ];
 settings.microsteps = (unsigned int)buffA[ 0x54 ];
 settings.p_usec = (unsigned int)buffA[ 0x46 ];
 settings.decimal_places = (unsigned int)buffA[ 0x56 ];
 settings.homing_debounce_delay = (unsigned int)buffA[ 0x52 ];
 settings.homing_dir_mask = (unsigned int)buffA[ 0x57 ];
 settings.invert_mask = (unsigned int)buffA[ 0x58 ];
 settings.dir_invert_mask = (unsigned int)buffA[ 0x59 ];
}



int settings_restore(int restore_mask){
int k;
 if(restore_mask ==  0xFF ){

 for(k = 0; k < 512; k++)
 buffA[k] = 0xFFFFFFFF;
 set_ram_loaded_indicator(1);
 }else{
 settings_load_row();
 }

 if(restore_mask &  0x01 )
 settings_default_row();

 if(restore_mask &  0x02 ){
 for(k = 0; k < ( 11 * 4 ); k++)
 buffA[k] = 0;
 }

 if(restore_mask &  0x04 ){
 for(k =  0x180 ; k < ( 0x190 +16); k++)
 buffA[k] = 0;
 }

 k = settings_save_row();
 settings_apply_row();
 return k;
}
#line 192 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
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
  (coord_read |= (1 << flag) ) ;
}


static void rst_single_coord_read_indicators(int flag){
  (coord_read &= ~ (1 << flag) ) ;
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
#line 251 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 }



 set_ram_loaded_indicator(data_count);


 return data_count;
}
#line 289 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
static void settings_load_row(){
 if(!read_ram_loaded_indicator()){
 add = (unsigned long) 0xBD1BC000 ;
 read_row_from_flash(add);
 set_ram_loaded_indicator(1);
 }
}




static int settings_save_row(){

 buffA[ 0x17C ] =  0x7FFF0102 ;
 add = (unsigned long) 0xBD1BC000 ;
 error = (int)NVMErasePage(&add);
 if(!error){
 error = (int)NVMWriteRow(&add,buffA);
 }
#line 314 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 rst_coord_read_indicator();
 return error;
}




unsigned int settings_write_coord_data(int coord_select,float *coord){
int k;
 if(coord_select < 1 || coord_select >  11 )
 return  1 ;

 settings_load_row();


 k = (coord_select-1)* 4 ;
 buffA[k] = flt2ulong(coord[0]);
 buffA[k+1] = flt2ulong(coord[1]);
 buffA[k+2] = flt2ulong(coord[2]);
 buffA[k+3] = 0;

 return settings_save_row();
}






void settings_read_coord_data(){

 settings_load_row();

 if(!read_coord_data_indicator()){
 unsigned long temp = 0UL;
 for(i = 0; i <  11 ; i++){
 for(j = 0 ; j <  4 ; j++){
 temp = buffA[(i* 4 ) + j];

 if(temp == 0xFFFFFFFF)
 temp = 0UL;
 coord_system[i].coord[j] = ulong2flt(temp);
#line 362 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 }
 }

 set_coord_data_read_indicator( 0 );
 }
}




int settings_read_startup_line(int n, char *line){
char *src;
int k;

 switch(n){
 case 0: k =  0x180 ; break;
 case 1: k =  0x190 ; break;
 default: line[0] = 0; return  6 ;
 }
 settings_load_row();
 src = (char*)(buffA + k);
 for(k = 0; k <  64 -1; k++){
 if(src[k] == 0) break;
 if(src[k] < 0x20 || src[k] > 0x7E){ k = 0; break; }
 line[k] = src[k];
 }
 line[k] = 0;
#line 396 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 return  0 ;
}



int settings_store_startup_line(int n, char *line){
unsigned long start_offset;
int str_len;
char temp_char;

 str_len = strlen(line);
#line 415 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 switch(n){
 case 0: start_offset = (unsigned long) 0x180 ;break;
 case 1: start_offset = (unsigned long) 0x190 ;break;
 default: return  6 ;
 }

 settings_load_row();


 for(i=start_offset;i<start_offset+16;i++)
 buffA[i] = 0;



 memcpy(buffA+start_offset,line,str_len);
#line 439 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 return settings_save_row();
}




int settings_store_global_setting(int parameter, float value) {
int val_temp = 0;

 settings_load_row();
#line 458 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 switch(parameter) {
 case 0: case 1: case 2:
 if (value <= 0.0) { return( 8 ); }
 settings.steps_per_mm[parameter] = value;
 buffA[ 0x40 +parameter] = flt2ulong(value);

 set_calculation_constants();
#line 475 "c:/Users/davec/GIT/Pic32mzCNC/Globals.c"
 break;
 case 3:
 if (value < 3) { return( 9 ); }
 val_temp = round(value);
 settings.p_usec = val_temp;
 buffA[ 0x46 ] = (unsigned long)val_temp;
 break;
 case 5: settings.default_seek_rate = value;
 buffA[ 0x48 ] = flt2ulong(value);
 break;
 case 6:
 settings.invert_mask = floor(value);
 buffA[ 0x58 ] = (unsigned long)floor(value);
 break;
 case 7:
 val_temp = round(value);
 settings.stepper_idle_lock_time = val_temp;
 buffA[ 0x53 ] = (unsigned long)val_temp;
 break;
 case 8:
 settings.acceleration = value* 3600  ;
 buffA[ 0x4D ] = flt2ulong(value);
 break;
 case 9: settings.junction_deviation = fabs(value);
 buffA[ 0x4E ] = flt2ulong(fabs(value));
 break;
 case 10:
 if (value <= 0.0) { return( 8 ); }
 settings.mm_per_arc_segment = value;
 buffA[ 0x4C ] = flt2ulong(value);
 break;
 case 13:
 if (round(value)){
 settings.flags |=  (1 << 0) ;
 }else{
 settings.flags &= ~ (1 << 0) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
 break;
 case 15:
 if (round(value)){
 settings.flags |=  (1 << 2) ;
 }else{
 settings.flags &= ~ (1 << 2) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
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
 settings.homing_pulloff = fabs(value);
 buffA[ 0x4B ] = flt2ulong(fabs(value));
 break;
 case 23:
 val_temp = round(value);
 settings.dir_invert_mask = val_temp;
 buffA[ 0x59 ] = (unsigned long)val_temp;
 break;
 case 24:
 if (round(value)){
 settings.flags |=  (1 << 5) ;
 }else{
 settings.flags &= ~ (1 << 5) ;
 }
 buffA[ 0x50 ] = (unsigned long)settings.flags;
 break;
 default:
 return( 6 );
 }
 if(settings_save_row()){ return( 10 ); }
 return( 0 );
}




int settings_store_grbl_setting(int parameter, float value) {
int internal;
 switch(parameter) {
 case 0: internal = 3; break;
 case 1: internal = 7; break;
 case 2: internal = 6; break;
 case 3: internal = 23; break;
 case 4: internal = 15; break;
 case 5: internal = 24; break;
 case 11: internal = 9; break;
 case 12: internal = 10; break;
 case 13: internal = 13; break;
 case 21: internal = 16; break;
 case 22: internal = 17; break;
 case 23: internal = 18; break;
 case 24: internal = 19; break;
 case 25: internal = 20; break;
 case 26: internal = 21; break;
 case 27: internal = 22; break;
 case 100: case 101: case 102: internal = parameter - 100; break;
 case 110: case 111: case 112: internal = 5; break;
 case 120: case 121: case 122: internal = 8; break;
 default: return( 6 );
 }
 return settings_store_global_setting(internal, value);
}
