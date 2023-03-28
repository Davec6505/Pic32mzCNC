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


unsigned long sqrt_(unsigned long v);


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
#line 21 "C:/Users/Git/Pic32mzCNC/GCODE.c"
parser_state_t gc;






volatile float coord_data[ 4 ];

int axis_words absolute 0xA0002602 ;
int modal_group_words absolute 0xA0002604 ;
int non_modal_words absolute 0xA0002606 ;
int m_flow absolute 0xA0002608 ;
int non_modal_action absolute 0xA0002610 ;
int motion_mode absolute 0xA0002612 ;
int group_number absolute 0xA0002614 ;
int status_code absolute 0xA0002616 ;


volatile int int_value;
volatile float inverse_feed_rate;
volatile float value;




static float To_Millimeters(float value){
 return(gc.inches_mode) ? (value *  (25.40) ) : value;
}


static void Select_Plane(int axis_combo){
 axis_xyz = axis_combo;
}






void G_Initialise(){
 m_flow = 0;
 group_number = 0;
 axis_words = 0;
 int_value = 0;
 value = 0;
 inverse_feed_rate =  0 ;
 gc.absolute_override =  0 ;
 gc.absolute_mode =  1 ;
}


void FAIL(int status){
 status_code = status;
}

int GET_FAIL(){
 return status_code;
}

int SET_FAIL(int val){
 status_code = val;
}



void Set_modalgroup(int value){
  (modal_group_words |= (1 << value) ) ;
}


int Get_modalgroup(){
 return modal_group_words;
}

int Rst_modalgroup(){
 modal_group_words = 0;
 return modal_group_words;
}




void Set_non_modalword(int value){
  (non_modal_words |= (1 << value) ) ;
}


int Get_non_modalword(){
 return non_modal_words;
}

int Rst_non_modalword(){
 non_modal_words = 0;
 return non_modal_words;
}




void Set_Axisword(int value){
  (axis_words |= (1 << value) ) ;
}
#line 131 "C:/Users/Git/Pic32mzCNC/GCODE.c"
int Get_Axisword(){
 return axis_words & 0x0fff;
}

int Rst_Axisword(){
 axis_words = 0;
 return axis_words;
}


int Get_motionmode(){
 return motion_mode;
}

int Rst_motionmode(){
 motion_mode = 0;
 return motion_mode;
}



int G_Mode(int mode){
#line 157 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 group_number = Set_Modal_Groups(mode);
 motion_mode = Set_Motion_Mode(mode);
 return mode;
}



int M_Mode(int flow){
 group_number = Set_M_Modal_Commands(flow);
 m_flow = Set_M_Commands(flow);
#line 171 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 return flow;
}






static int Set_Modal_Groups(int mode){
int gp_num;
 switch(mode) {
 case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
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
int i,m_mode;
 FAIL( 0 );

 switch(mode){
 case 0: m_mode =  0 ; break;
 case 1: m_mode =  1 ; break;
 case 2: m_mode =  2 ;gc.DIR =  0 ; break;
 case 3: m_mode =  3 ;gc.DIR =  1 ; break;
 case 4: non_modal_action =  1 ; break;
 case 10: non_modal_action =  2 ; break;
 case 17: Select_Plane(xy);m_mode =  6 ; break;
 case 18: Select_Plane(xz);m_mode =  6 ; break;
 case 19: Select_Plane(yz);m_mode =  6 ; break;
 case 20: gc.inches_mode = 1;m_mode =  6 ; break;
 case 21: gc.inches_mode = 0;m_mode =  6 ; break;
 case 53: gc.absolute_override =  1 ;m_mode =  6 ; break;
 case 54: case 55: case 56: case 57: case 58: case 59:
 gc.coord_select = (mode - 53);
 m_mode =  6 ;break;
 case 80: motion_mode =  4 ; break;
 case 90: gc.absolute_mode =  1 ; m_mode =  6 ; break;
 case 91: gc.absolute_mode =  0 ; m_mode =  6 ; break;
 case 93: gc.inverse_feed_rate_mode =  1 ;m_mode =  6 ; break;
 case 94: gc.inverse_feed_rate_mode =  0 ;m_mode =  6 ; break;
 case 280: non_modal_action =  3 ; break;
 case 281: non_modal_action =  4 ; break;
 case 300: non_modal_action =  5 ; break;
 case 301: non_modal_action =  6 ; break;
 case 920: non_modal_action =  7 ; break;
 case 921: non_modal_action =  8 ; break;
 default: FAIL( 3 );return;break;
 }




 if (  ((modal_group_words & (1 << 2 ) ) != 0)  || axis_words ) {

 if ( gc.inverse_feed_rate_mode ) {
 if (inverse_feed_rate < 0 && motion_mode !=  4 ) {
 FAIL( 6 );
 }
 }

 if ( gc.absolute_override && !(motion_mode ==  0  || motion_mode ==  1 )) {
 FAIL( 6 );
 }

 }
#line 251 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 return m_mode;
}




static int Set_M_Modal_Commands(int flow){
int m_num;

 switch(flow) {
 case 0: case 1: case 2: case 30: m_num =  5 ; break;
 case 3: case 4: case 5: m_num =  8 ; break;
 }
 return m_num;
}


static int Set_M_Commands(int flow){
 FAIL( 0 );

 switch(flow) {
 case 0: gc.program_flow =  1 ; break;
 case 1: break;
 case 2:
 case 30: gc.program_flow =  2 ; break;
 case 3: gc.spindle_direction = 1; break;
 case 4: gc.spindle_direction = -1; break;
 case 5: gc.spindle_direction = 0; break;
#line 282 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 case 8: gc.coolant_mode =  1 ; break;
 case 9: gc.coolant_mode =  0 ; break;
 default: FAIL( 3 );break;
 }
 return flow;
}







int Check_group_multiple_violations(){
static int last_group_number,last_non_modal_action;
int i = 0;




 if(group_number ==  0 ){
 FAIL( 5 );
 return  5 ;
 }

 if(group_number > 0) {

 if(group_number != last_group_number)
 Rst_modalgroup();

  (modal_group_words |= (1 << group_number) ) ;

 last_group_number = group_number;



 if (group_number ==  1 ){


 Rst_non_modalword();

 if(!gc.absolute_override)
  (non_modal_words |= (1 << non_modal_action) ) ;

 last_non_modal_action = non_modal_action;
 return status_code;
 }






 if(group_number ==  2 ){

 switch (motion_mode) {
 case  0 :
 gc.frequency = lround(settings.default_seek_rate);
 case  1 :
 FAIL( 0 );
 break;
 case  2 : case  3 :
 FAIL( 0 );




 for(i=0;i<=3;i++)
 Set_Axisword(i);
#line 364 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 break;
 case  4 :
 FAIL( 0 );

 if (axis_words) { FAIL( 6 ); }
 break;
 }


 for(i=0;i< 4 ;i++){
 gc.position[i] = gc.next_position[i];
 }
 }


 if (group_number ==  3 ){
 FAIL( 0 );

 if(axis_xyz >  4 ){
 status_code =  6 ;
 FAIL( 6 );
 }

 return status_code;
 }


 if (group_number ==  4 ){
 FAIL( 0 );
 return status_code;
 }


 if (group_number ==  6 ){
 FAIL( 0 );
 return status_code;
 }


 if (group_number ==  7 ){
 FAIL( 0 );
 return status_code;
 }


 if (group_number ==  9 ){
 FAIL( 0 );

 if(gc.coord_select < 0 || gc.coord_select > 7)
 FAIL( 1 );

 return status_code;
 }
 }




 return status_code;
}




int Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,O_Val;

 switch(c[0]){
 case 'X':case 'x':
 XYZ_Val = *(float*)any;
 gc.next_position[X] = To_Millimeters(XYZ_Val);
  (axis_words |= (1 << X) ) ;
#line 441 "C:/Users/Git/Pic32mzCNC/GCODE.c"
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
 XYZ_Val = *(float*)any;
 if(XYZ_Val < 0){
 FAIL( 13 );
 }

 if (gc.inverse_feed_rate_mode) {
 inverse_feed_rate = To_Millimeters(XYZ_Val);
 } else {
 gc.feed_rate = To_Millimeters(XYZ_Val);
 }
 gc.frequency = (unsigned long)XYZ_Val;
#line 499 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 break;
 case 'P':
 O_Val = *(int*)any;
 if(O_Val < 0){
 FAIL( 13 );
 }
 gc.P = O_Val;
 gc.S = -1;
 break;
 case 'S':
 O_Val = *(int*)any;
 if(O_Val < 0){
 FAIL( 13 );
 }
 gc.S = O_Val;
 gc.P = -1;
 break;
 case 'L':
 O_Val = *(int*)any;
 if(O_Val < 0){
 FAIL( 13 );
 }
 gc.L = O_Val;
 break;
 default:FAIL( 3 );break;
 }
#line 534 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 return status_code;
}
