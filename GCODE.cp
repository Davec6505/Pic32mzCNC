#line 1 "C:/Users/Git/Pic32mzCNC/GCODE.c"
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







typedef __attribute__((aligned (32))) float afloat;
#line 156 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 afloat steps_per_mm[ 4 ];
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
unsigned int DMA0_Abort();
unsigned int DMA0_ReadDstPtr();
void DMA0_RstDstPtr();



void DMA1();
char DMA1_Flag();
void DMA1_Enable();
void DMA1_Disable();
unsigned int DMA1_Abort();



unsigned int DMA_IsOn(int channel);
unsigned int DMA_CH_Busy(int channel);



void Reset_rxBuff(int dif);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();
void Get_Line(char *str,int dif);
void Reset_Ring();
int Loopback();
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
#line 149 "c:/users/git/pic32mzcnc/flash_r_w.h"
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
#line 28 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


unsigned long flt2ulong(float f_);


float ulong2flt(unsigned long ui_) ;


void sys_sync_current_position();


int round(double val);
#line 103 "c:/users/git/pic32mzcnc/globals.h"
extern unsigned long volatile buffA[128];





typedef struct {
 char abort;
 char state;
 int homing;
 int homing_cnt;
 long position[ 4 ];

 char auto_start;
 volatile char execute;
} system_t;
extern volatile system_t sys;



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
void mc_reset();
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
#line 32 "c:/users/git/pic32mzcnc/print.h"
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
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 37 "c:/users/git/pic32mzcnc/protocol.h"
void Str_Initialize(char arg[ 20 ][ 64 ]);
void Str_clear(char *str,int len);

int Sample_Ringbuffer();

static int strsplit(char arg[ 20 ][ 64 ],char *str, char c);
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


int Modal_Group_Actions4(int action);


int Modal_Group_Actions7(int action);


void protocol_execute_runtime();
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 50 "c:/users/git/pic32mzcnc/gcode.h"
extern volatile int status_code;
#line 154 "c:/users/git/pic32mzcnc/gcode.h"
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
extern volatile parser_state_t gc;


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
static int Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
#line 21 "C:/Users/Git/Pic32mzCNC/GCODE.c"
volatile parser_state_t gc;

volatile int status_code;
volatile float coord_data[ 4 ];

static volatile char axis_words;
static char absolute_override;
static volatile int modal_group_words;
static volatile int non_modal_words;
static volatile int motion_mode;
volatile int group_number;
volatile int non_modal_action;

volatile int int_value;
volatile float inverse_feed_rate;
volatile float value;





void G_Initialise(){
 group_number = 0;
 axis_words = 0;
 int_value = 0;
 value = 0;
 inverse_feed_rate =  0 ;
 absolute_override = 0;
}


int Get_modalgroup(){
 return modal_group_words;
}

int Rst_modalgroup(){
 modal_group_words = 0;
 return modal_group_words;
}


int Get_modalword(){
 return non_modal_words;
}

int Rst_modalword(){
 non_modal_words = 0;
 return non_modal_words;
}


int Get_Axisword(){
 return (int)axis_words & 0x00ff;
}

int Rst_Axisword(){
 axis_words=0;
 return (int)axis_words;
}


int Get_motionmode(){
 return motion_mode;
}

int Rst_motionmode(){
 motion_mode = 0;
 return motion_mode;
}


int G_Mode(int mode){
 gc.inches_mode = 0;
 group_number = Set_Modal_Groups(mode);
 motion_mode = Set_Motion_Mode(mode);
 return motion_mode;
}


void M_Instruction(int flow){

 group_number = Set_M_Modal_Commands(flow);
 Set_M_Commands(flow);
#line 108 "C:/Users/Git/Pic32mzCNC/GCODE.c"
}





int Check_group_multiple_violations(){
static int last_group_number,last_non_modal_action;
int i = 0;




 if(group_number > 0) {

  status_code = 0 ; ;
 if(group_number ==  0 )
  status_code = 5 ; ;

 if(group_number != last_group_number)
 Rst_modalgroup();

  (modal_group_words |= (1 << group_number) ) ;
#line 137 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 last_group_number = group_number;
 if (group_number ==  1 ){


 Rst_modalword();
  (non_modal_words |= (1 << non_modal_action) ) ;
#line 149 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 last_non_modal_action = non_modal_action;
 return status_code;
 }
 }




 for (i=0; i<=2; i++) {
 if (  ((axis_words & (1 << i) ) != 0) ) {
 if (!absolute_override) {
 if (gc.absolute_mode) {

 } else {


 gc.next_position[i] + gc.coord_offset[i];
 }
 }
 } else {
 gc.next_position[i] += gc.coord_offset[i];
 }
 }




 switch (motion_mode) {

 case  4 :
 if (axis_words) {  status_code = 6 ; ; }
 break;
 case  0 :
 if (axis_words == 0) {
  status_code = 6 ; ;
 }else {


 gc.frequency = 5000;
  status_code = 0 ; ;
 }
 break;
 case  1 :
#line 200 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 if (axis_words == 0) {
  status_code = 6 ; ;
 }else {

  status_code = 0 ; ;
 }
 break;
 case  2 : case  3 :


 if ( !(  (axis_words &= ~ (1 << gc.plane_axis_2) )  ) ||
 ( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
  status_code = 6 ; ;
 } else {
 if (gc.R != 0) {

 asm{nop;}
 }
 }
 break;
 }

 for(i=0;i< 4 ;i++){
 gc.position[i] = gc.next_position[i];
 }

 return status_code;
}


int Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,O_Val;

 switch(c[0]){
 case 'X':
 XYZ_Val = *(float*)any;
 gc.next_position[X] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << X) ) ;
 break;
 case 'Y':
 XYZ_Val = *(float*)any;
 gc.next_position[Y] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << Y) ) ;
 break;
 case 'Z':
 XYZ_Val = *(float*)any;
 gc.next_position[Z] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << Z) ) ;
 break;
 case 'A':
 XYZ_Val = *(float*)any;
 gc.next_position[A] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << A) ) ;
 break;
 case 'E':
 XYZ_Val = *(float*)any;
 gc.next_position[B] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << B) ) ;
 break;
 case 'R':
 XYZ_Val = *(float*)any;
 gc.R = To_Millimeters(XYZ_Val);
 break;
 case 'I':
 gc.r = 0;
 gc.R = 0;
 XYZ_Val = *(float*)any;
 gc.I = XYZ_Val;
 gc.offset[I] = To_Millimeters(XYZ_Val);
 break;
 case 'J':
 XYZ_Val = *(float*)any;
 gc.J = XYZ_Val;
 gc.offset[J] = To_Millimeters(XYZ_Val);
 break;
 case 'K':
 XYZ_Val = *(float*)any;
 gc.K = XYZ_Val;
 gc.offset[K] = To_Millimeters(XYZ_Val);
 break;
 case 'F':
 F_Val = *(int*)any;
 if(F_Val < 0){
  status_code = 13 ; ;
 }
#line 292 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 gc.frequency = F_Val;
 break;
 case 'P':
 O_Val = *(int*)any;
 if(O_Val < 0){
  status_code = 13 ; ;
 }
 gc.P = O_Val;
 gc.S = -1;
 break;
 case 'S':
 O_Val = *(int*)any;
 if(O_Val < 0){
  status_code = 13 ; ;
 }
 gc.S = O_Val;
 gc.P = -1;
 break;
 case 'L':
 O_Val = *(int*)any;
 if(O_Val < 0){
  status_code = 13 ; ;
 }
 gc.L = O_Val;
 break;
 default: status_code = 3 ; ;break;
 }
#line 328 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 return status_code;
}




void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
int i;
float temp[3];
 for(i=0;i<3;i++){
 temp[i] = ulong2flt(settings.steps_per_mm[i]);
 }
 gc.position[X] = x/temp[X];
 gc.position[Y] = y/temp[Y];
 gc.position[Z] = z/temp[Z];
}




static float To_Millimeters(float value){
 return(gc.inches_mode) ? (value *  (25.40) ) : value;
}


static void Select_Plane(int axis_combo){
 axis_xyz = axis_combo;
}


static int Set_Modal_Groups(int mode){
int gp_num;
 switch(mode) {
 case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
 gp_num =  1 ; break;
 case 0: case 1: case 2: case 3: case 80: gp_num =  2 ; break;
 case 17: case 18: case 19: gp_num =  3 ; break;
 case 90: case 91: gp_num =  4 ; break;
 case 93: case 94: gp_num =  6 ; break;
 case 20: case 21: gp_num =  7 ; break;
 case 54: case 55: case 56: case 57: case 58: case 59: gp_num =  9 ; break;
 }
 return gp_num;
}


static int Set_Motion_Mode(int mode){
int i;
 switch(mode){
 case 0: motion_mode =  0 ; break;
 case 1: motion_mode =  1 ; break;
 case 2: motion_mode =  2 ; break;
 case 3: motion_mode =  3 ; break;
 case 4: non_modal_action =  1 ; break;
 case 10: non_modal_action =  2 ; break;
 case 17: Select_Plane(xy); break;
 case 18: Select_Plane(xz); break;
 case 19: Select_Plane(yz); break;
 case 20: gc.inches_mode = 1; break;
 case 21: gc.inches_mode = 0; break;
 case 53: absolute_override =  1 ; break;
 case 54: case 55: case 56: case 57: case 58: case 59:
 gc.coord_select = (mode - 53);
 break;
 case 80: gc.motion_mode =  4 ; break;
 case 90: gc.absolute_mode =  1 ; break;
 case 91: gc.absolute_mode =  0 ; break;
 case 93: gc.inverse_feed_rate_mode =  1 ; break;
 case 94: gc.inverse_feed_rate_mode =  0 ; break;
 case 280: non_modal_action =  3 ; break;
 case 281: non_modal_action =  4 ; break;
 case 300: non_modal_action =  5 ; break;
 case 301: non_modal_action =  6 ; break;
 case 920: non_modal_action =  7 ; break;
 case 921: non_modal_action =  8 ; break;
 default:  status_code = 3 ; ;return;break;
 }
  status_code = 0 ; ;




 if (  ((modal_group_words & (1 << 2 ) ) != 0)  || axis_words ) {

 if ( gc.inverse_feed_rate_mode ) {
 if (inverse_feed_rate < 0 && motion_mode !=  4 ) {
  status_code = 6 ; ;
 }
 }

 if ( absolute_override && !(motion_mode ==  0  || motion_mode ==  1 )) {
  status_code = 6 ; ;
 }
#line 426 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 if (status_code) { return(status_code); }

 }
#line 433 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 return motion_mode;
}

static int Set_M_Modal_Commands(int flow){
int gp_num;

 switch(flow) {
 case 0: case 1: case 2: case 30: gp_num =  5 ; break;
 case 3: case 4: case 5: gp_num =  8 ; break;
 }
 return gp_num;
}


static int Set_M_Commands(int flow){
  status_code = 0 ; ;

 switch(flow) {
 case 0: gc.program_flow =  1 ; break;
 case 1: break;
 case 2:
 case 30: gc.program_flow =  2 ; break;
 case 3: gc.spindle_direction = 1; break;
 case 4: gc.spindle_direction = -1; break;
 case 5: gc.spindle_direction = 0; break;
#line 461 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 case 8: gc.coolant_mode =  1 ; break;
 case 9: gc.coolant_mode =  0 ; break;
 default:  status_code = 3 ; ;break;
 }
 return status_code;
}
