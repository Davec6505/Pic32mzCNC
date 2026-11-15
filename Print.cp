#line 1 "c:/Users/davec/GIT/Pic32mzCNC/Print.c"
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
#line 1 "c:/users/davec/git/pic32mzcnc/settings.h"
#line 1 "c:/users/davec/git/pic32mzcnc/flash_r_w.h"
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
#line 1 "c:/users/davec/git/pic32mzcnc/gcode.h"
#line 10 "c:/Users/davec/GIT/Pic32mzCNC/Print.c"
void report_status_message(int status_code){
 int err_no;
 switch(status_code){
 case  0 :
 while(DMA_IsOn(1));
 dma_printf("%s","ok\r\n");
 return;
 case  2 : err_no = 1; break;
 case  1 : err_no = 2; break;
 case  6 : err_no = 3; break;
 case  8 : err_no = 4; break;
 case  7 : err_no = 5; break;
 case  9 : err_no = 6; break;
 case  10 : err_no = 7; break;
 case  11 : err_no = 8; break;
 case  12 : err_no = 9; break;
 case  15 :
 case  16 : err_no = 11; break;
 case  13 : err_no = 12; break;
 case  3 :
 case  14 : err_no = 20; break;
 case  5 : err_no = 21; break;
 case  17 : err_no = 22; break;
 case  4 : err_no = 34; break;
 case  20 :
 case  99 : return;

 default: err_no = 3; break;
 }
 while(DMA_IsOn(1));
 dma_printf("error:%d\r\n",err_no);
}


void report_alarm_message(int alarm_code){
 int err_no;
 switch (alarm_code) {
 case  -1 : err_no = 1; break;
 case  -2 : err_no = 3; break;
 default: return;
 }
 while(DMA_IsOn(1));
 dma_printf("ALARM:%d\r\n",err_no);
 Delay_ms(500);
}




void report_feedback_message(int message_code){
 while(DMA_IsOn(1));
 switch(message_code) {
 case  1 : dma_printf("%s","[MSG:Reset to continue]\r\n"); break;
 case  2 : dma_printf("%s","[MSG:'$H'|'$X' to unlock]\r\n"); break;
 case  3 : dma_printf("%s","[MSG:Caution: Unlocked]\r\n"); break;
 case  4 : dma_printf("%s","[MSG:Enabled]\r\n"); break;
 case  5 : dma_printf("%s","[MSG:Disabled]\r\n"); break;
 }
}


void report_init_message(){
 while(DMA_IsOn(1));
 dma_printf("\r\n%s%s%s\r\n", "Grbl " , "1.1h" , " ['$' for help]" );
}


void report_grbl_help() {
 while(DMA_IsOn(1));
 dma_printf("%s","[HLP:$$ $# $G $I $N $x=val $Nx=line $C $X $H ~ ! ? ctrl-x]\r\n");
}


void report_build_info(){
 while(DMA_IsOn(1));
 dma_printf("[VER:%s.%s:]\r\n[OPT:,15,128]\r\n", "1.1h" , "20190830" );
 while(DMA_IsOn(1));
 if(Ethernet_Ready()) dma_printf("[MSG:Ethernet %s]\r\n",Ethernet_Address());
 else dma_printf("[MSG:Ethernet not found]\r\n");
}


void report_grbl_settings() {
float acc = settings.acceleration /  3600 ;
 while(DMA_IsOn(1));
 dma_printf("$0=%d\r\n$1=%d\r\n$2=%d\r\n$3=%d\r\n$4=%d\r\n$5=%d\r\n$6=0\r\n$10=1\r\n"
 ,(int)settings.p_usec
 ,(int)settings.stepper_idle_lock_time
 ,(int)settings.invert_mask
 ,(int)settings.dir_invert_mask
 ,(int) ((settings.flags & (1 << 2) ) != 0) 
 ,(int) ((settings.flags & (1 << 5) ) != 0) );
 while(DMA_IsOn(1));
 dma_printf("$11=%f\r\n$12=%f\r\n$13=%d\r\n$20=0\r\n$21=%d\r\n$22=%d\r\n$23=%d\r\n"
 ,settings.junction_deviation
 ,settings.mm_per_arc_segment
 ,(int) ((settings.flags & (1 << 0) ) != 0) 
 ,(int) ((settings.flags & (1 << 3) ) != 0) 
 ,(int) ((settings.flags & (1 << 4) ) != 0) 
 ,(int)settings.homing_dir_mask);
 while(DMA_IsOn(1));
 dma_printf("$24=%f\r\n$25=%f\r\n$26=%d\r\n$27=%f\r\n$30=1000\r\n$31=0\r\n$32=0\r\n"
 ,settings.homing_feed_rate
 ,settings.homing_seek_rate
 ,(int)settings.homing_debounce_delay
 ,settings.homing_pulloff);
 while(DMA_IsOn(1));
 dma_printf("$100=%f\r\n$101=%f\r\n$102=%f\r\n"
 ,settings.steps_per_mm[X]
 ,settings.steps_per_mm[Y]
 ,settings.steps_per_mm[Z]);
 while(DMA_IsOn(1));
 dma_printf("$110=%f\r\n$111=%f\r\n$112=%f\r\n$120=%f\r\n$121=%f\r\n$122=%f\r\n"
 ,settings.default_seek_rate
 ,settings.default_seek_rate
 ,settings.default_seek_rate
 ,acc,acc,acc);
 while(DMA_IsOn(1));
 dma_printf("$130=%f\r\n$131=%f\r\n$132=%f\r\n"
 ,(float) 300.00 
 ,(float) 300.00 
 ,(float) 100.00 );
}


void report_startup_line(int n, char *line){
 while(DMA_IsOn(1));
 dma_printf("$N%d=%s\r\n",n,line);
}


static void report_xyz(float *pos){
 while(DMA_IsOn(1));
 dma_printf("%f,%f,%f",pos[X],pos[Y],pos[Z]);
}

static void report_to_units(float *pos){
 int i;
 if ( ((settings.flags & (1 << 0) ) != 0) ) {
 for (i=0; i<3; i++) { pos[i] *=  (0.0393701) ; }
 }
}



void report_realtime_status(){
 int i;
 float position[3];

 while(DMA_IsOn(1));
 switch (sys.state) {
 case  3 : dma_printf("%s","<Run"); break;
 case  4 : dma_printf("%s","<Hold:0"); break;
 case  5 : dma_printf("%s","<Home"); break;
 case  6 : dma_printf("%s","<Alarm"); break;
 case  7 : dma_printf("%s","<Check"); break;
 default: dma_printf("%s","<Idle"); break;
 }

 for (i=0; i<3; i++) {
 position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
 }
 report_to_units(position);
 while(DMA_IsOn(1));
 dma_printf("%s","|MPos:");
 report_xyz(position);

 while(DMA_IsOn(1));
 dma_printf("|FS:%d,0|WCO:",(sys.state ==  3 ) ? (int)gc.feed_rate : 0);
 for (i=0; i<3; i++) {
 position[i] = gc.coord_system[i] + gc.coord_offset[i];
 }
 report_to_units(position);
 report_xyz(position);
 while(DMA_IsOn(1));
 dma_printf("%s",">\r\n");
}




static void report_coord_line(char *name, float *pos){
 report_to_units(pos);
 while(DMA_IsOn(1));
 dma_printf("[%s:",name);
 report_xyz(pos);
 while(DMA_IsOn(1));
 dma_printf("%s","]\r\n");
}


static void report_coord_system(char *name, int recipe){
 float position[3];
 int i;
 for (i=0; i<3; i++) {
 position[i] = coord_system[recipe-1].coord[i];
 }
 report_coord_line(name,position);
}



void report_gcode_parameters(){
 float position[3];
 int i;

 settings_read_coord_data();
 report_coord_system("G54",1);
 report_coord_system("G55",2);
 report_coord_system("G56",3);
 report_coord_system("G57",4);
 report_coord_system("G58",5);
 report_coord_system("G59",6);
 report_coord_system("G28", 9 +1 );
 report_coord_system("G30", 9 +1  + 1 );
 for (i=0; i<3; i++) { position[i] = gc.coord_offset[i]; }
 report_coord_line("G92",position);
 while(DMA_IsOn(1));
 dma_printf("%s","[TLO:0.000]\r\n");
 while(DMA_IsOn(1));
 dma_printf("%s","[PRB:0.000,0.000,0.000:0]\r\n");
}


void report_gcode_modes(){
 int motion;
 switch (gc.motion_mode) {
 case  1  : motion = 1; break;
 case  2  : motion = 2; break;
 case  3  : motion = 3; break;
 case  4  : motion = 80; break;
 default: motion = 0; break;
 }
 while(DMA_IsOn(1));
 dma_printf("[GC:G%d G%d",motion,gc.coord_select+53);

 while(DMA_IsOn(1));
 if (gc.plane_axis_0 == X) {
 if (gc.plane_axis_1 == Y) { dma_printf("%s"," G17"); }
 else { dma_printf("%s"," G18"); }
 } else { dma_printf("%s"," G19"); }
 while(DMA_IsOn(1));
 dma_printf("%s",gc.inches_mode ? " G20" : " G21");
 while(DMA_IsOn(1));
 dma_printf("%s",gc.absolute_mode ? " G90" : " G91");
 while(DMA_IsOn(1));
 dma_printf("%s",gc.inverse_feed_rate_mode ? " G93" : " G94");

 while(DMA_IsOn(1));
 switch (gc.program_flow) {
 case  1  : dma_printf("%s"," M0"); break;
 case  2  : dma_printf("%s"," M2"); break;
 }
 while(DMA_IsOn(1));
 switch (gc.spindle_direction) {
 case 1 : dma_printf("%s"," M3"); break;
 case -1 : dma_printf("%s"," M4"); break;
 default : dma_printf("%s"," M5"); break;
 }
 while(DMA_IsOn(1));
 switch (gc.coolant_mode) {
 case  2  : dma_printf("%s"," M7"); break;
 case  1  : dma_printf("%s"," M8"); break;
 default : dma_printf("%s"," M9"); break;
 }
 while(DMA_IsOn(1));
 dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
 (int)(gc.inches_mode ? gc.feed_rate* (0.0393701)  : gc.feed_rate));
#line 293 "c:/Users/davec/GIT/Pic32mzCNC/Print.c"
}
