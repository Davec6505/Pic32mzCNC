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
extern sfr sbit Z_Min_Limit;
extern sfr sbit Z_Min_Limit_Dir;
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
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


float fround(float val);


int round(float val);


long lround(float val);
#line 106 "c:/users/git/pic32mzcnc/globals.h"
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
#line 62 "c:/users/git/pic32mzcnc/planner.h"
typedef struct genVars{
 char running: 1;
 char startPulses: 1;
 char homed: 1;
 char run_circle: 1;
 char cir: 1;
 char Single_Dual: 1;
 char mode_complete: 2;
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
<<<<<<< HEAD

 long acc;
 long dec;
=======
>>>>>>> patch2

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
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/planner.h"
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 33 "c:/users/git/pic32mzcnc/stepper.h"
typedef enum _axis_{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
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
void DisableStepperInterrupt(int stepper);
void EnableSteppers(int steppers);
void EnableStepper(int stepper);
void DisableStepper();
void disableOCx();


int GET_RunState(int axis_No);
int Get_AxisStatus(int stepper);
int Get_Axis_IEnable_States();


static void SingleStepAxis(int axis);
void Start_Interpolation(int axisA,int axisB);
static void Axis_Interpolate(int axisA,int axisB);
void StopAxis(int axis);


static int Pulse(int axis_No);
static void toggleOCx(int axis_No);

static static void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Single_Axis_Enable(_axis_ axis_);
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
#line 58 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 70 "c:/users/git/pic32mzcnc/steptodistance.h"
long calcSteps(float mmsToMove, float Dia);
long leadscrew_sets(float move_distance,int axis);
long belt_steps(float move_distance,int axis);
float beltsteps2mm(long Steps,int axis);
float mm2in(float mm);
float in2mm(float inch);
float fround(float var);
float torpm(float mm_per_min);
float toradians(float rev_per_min);
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
static void A_Min_Limit_Setup();

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
#line 1 "c:/users/git/pic32mzcnc/print.h"
#line 29 "C:/Users/Git/Pic32mzCNC/Protocol.c"
const code char SL[] = "$N";
volatile char gcode[ 20 ][ 64 ];
char startup absolute 0xA0002600 ;



void Init_Protocol(){
 startup = 0;
}


void Str_Initialize(char arg[ 20 ][ 64 ]){
int i;
 for(i = 0; i <=  20 ;i++){
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
#line 163 "C:/Users/Git/Pic32mzCNC/Protocol.c"
void protocol_execute_runtime(){
 if (sys.execute) {
 int rt_exec = sys.execute;




 if (rt_exec & ( (1 << 5)  |  (1 << 6) )) {
 sys.state =  6 ;


 if (rt_exec &  (1 << 6) ) {
 report_alarm_message( -1 );
 report_feedback_message( 1 );
  (sys.execute &= ~ (1 << 4) ) ;
 do {



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

  (sys.execute &= ~ (1 << 3) ) ;
 }



 if (rt_exec &  (1 << 2) ) {

  (sys.execute &= ~ (1 << 2) ) ;
 }

 if (rt_exec &  (1 << 1) ) {

 if ( ((settings.flags & 2 ) != 0) ) {
 sys.auto_start =  1 ;
 }
  (sys.execute &= ~ (1 << 1) ) ;
 }
 }



}



void protocol_system_check(){



 if (sys.abort) {
#line 251 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 sys_sync_current_position();


 sys.abort = 0;
 sys.execute = 0;
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
int dif,state;


 dif = 0;
 dif = Get_Difference();
 if(dif <= 0){







 if(DMA0_ReadDstPtr()){
 char *ptr = (char*) 0xA0002000 ;
 if(*ptr == '?' || *ptr == '~' || *ptr == '!' || *ptr == 0x18){
 Do_Critical_Msg(*ptr);
 DMA_Abort(0);

 }
 }
 }else{
 char str[64];
 int msg_type= 0;
 int modal_response = 0;
 state =  0 ;


 Str_clear(str,64);


 Get_Line(str,dif);


 if( ((startup & (1 << 0 ) ) == 0) ){
 Do_Startup_Msg(str,dif);
 return  0 ;
 }


 if(str[0] == '?')return state;


 state = Check_Query_Type(str,dif);


 if(state ==  20 ){
 state = Do_Gcode(str,dif);
 modal_response = Check_group_multiple_violations();
#line 337 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }
 }
 return state;

}




static void Do_Startup_Msg(char *str_,int dif_){
char *temp_str = str_;
int i;

 for(i = 0;i <= dif_;i++){
 if(temp_str[i] == '?'){
  (startup |= (1 << 0 ) ) ;
 report_init_message();
 break;
 }
 }
 DCH0DAT = '\n';
 SV.homed =  0 ;
}



static void Do_Critical_Msg(char ch_){
#line 368 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 switch(ch_){
 case  '?' : sys.execute |=  (1 << 0) ; break;
 case  '~' : sys.execute |=  (1 << 1) ; break;
 case  '!' : sys.execute |=  (1 << 3) ; break;
 case  0x18 : mc_reset(); break;
 default: break;
 }
}



static int Check_Query_Type(char *str_,int dif_){
int query;
int helper_var;
int status;
#line 387 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if(str_[0] == '$'){
 switch(str_[1]){
 case '\r' :case '\n' :
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
#line 414 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if ( sys.state ==  7  ) {
 mc_reset();
 report_feedback_message( 5 );
 } else {
 if (sys.state) { status =  11 ; }
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
 status =  0 ;
 if ( ((settings.flags & 16 ) != 0) ) {
 int axis_to_home = 0;


 if ( sys.state== 0  || sys.state== 6  ) {
 int i = 0;
 Rst_modalgroup();


 Set_modalgroup( 10 );
 for(i=0;i<= 4 ;i++)
 Set_Axisword(i);


 if (sys.abort) {
 status =  -2 ;
 break;
 }
 } else {
 status =  11 ;
 break;
 }
 } else {
 status =  7 ;
 break;
 }


 SV.homed =  1 ;
 break;
 case 'N' :
 if ( str_[2] < 0x20 ) {
 for (helper_var=0; helper_var <  2 ; helper_var++) {
 if ((settings_read_startup_line(helper_var, str_))) {
 report_status_message( 10 );
 } else {
 report_startup_line(helper_var,str_);
 status =  0 ;
 }
#line 476 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }
 break;
 }else {
 int N_Val = 0;
 helper_var = 1;




 if ( str_[2] >= '0' && str_[2] <= '9' ) {
 char num[] = "0";

 num[0] = str_[2];
 N_Val = atoi(num);
#line 496 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }else {
 query = 2;
 break;
 }


 if (helper_var) {
 int str_len = 0;
 if(str_[3] != '='){


 helper_var = strlen((str_));
#line 516 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 str_len = strlen(str_);
#line 521 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }else{
 int str_length = 0;
#line 530 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 settings_store_startup_line(N_Val,str_+4);
 }

 }
 }
 status =  0 ;
 break;
 case '0': case '1': case '2': case'3': case '4': case '5':
 case '6': case '7': case '8': case '9':



 if((str_[2] == '=')||(str_[3] == '=')){
 char str_val[9]={0};
 int N_Val = 0;
 float value = 0.00;
 if(str_[2] == '='){

 strncpy(str_val,(str_+1),1);
 if(isdigit(str_val[0])){N_Val = atoi(str_val);}
 strncpy(str_val,(str_+3),strlen((str_+3)));
 }else if(str_[3] == '='){

 strncpy(str_val,(str_+1),2);
 if(isdigit(str_val[0])){N_Val = atoi(str_val);}
 memset(str_val,0,9);
 strncpy(str_val,(str_+4),strlen((str_+4)));
 }


 if((value < 0.0) || (!isdigit(str_val[0]))){
 status =  3 ;
 }
 value = atof(str_val);
#line 568 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 settings_store_global_setting(N_Val,value);
 status =  0 ;
 }
 break;
 }


 if(!SV.homed)
 report_status_message(status);

 return status;
 }else{
 status =  20 ;
 }
 return status;
}


static int Do_Gcode(char str_[64],int dif_){
char temp[9];
float XYZ_Val = 0.0;
int i,j,num_of_strings,mode,flow,status;
int Val = 0;



 num_of_strings = strsplit2(gcode,str_,0x20);
#line 599 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 for(i=0; i < num_of_strings; i++){
 j = cpy_val_from_str(temp,gcode[i],1,strlen(gcode[i]));
 switch(gcode[i][0]){
 case 'G':case'g':
 if(j < 3){
 Val = atoi(temp);


 if(Val == 28 || Val == 30 || Val == 92)
 Val *= 10;
 }else{

 Val = (int)(atof(temp)*10.0);
 }
 mode = G_Mode(Val);
 status =  0 ;
#line 620 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'X':case 'x':case 'Y':case 'y':
 case 'Z':case 'z':case 'A':case 'a':
 case 'I':case 'i':case 'J':case 'j':
 case 'K':case 'k':case 'F':case 'f':
 status =  0 ;
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[i],&XYZ_Val);

 if(gcode[i][0] == 'F' || gcode[i][0] == 'f')
 status =  0 ;
 else
 status =  20 ;
#line 638 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'P':case 'p':case 'L':case 'l':
 case 'S':case 's':
 Val = atoi(temp);
 status = Instruction_Values(gcode[i],&Val);
 break;
 case 'M':case'm':
 Val = atoi(temp);
 flow = M_Mode(Val);
#line 651 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 status =  0 ;
 break;
 }
 }


 return status;
}
