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
#line 169 "c:/users/git/pic32mzcnc/settings.h"
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
#line 58 "c:/users/git/pic32mzcnc/kinematics.h"
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

 double mm_position;

 double mm_home_position;

 double max_travel;

 int axis_dir;

 char master: 1;
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

void sys_sync_current_position();

void plan_set_current_position(long x, long y, long z);

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
void EnableStepper(int stepper);
void DisableStepper();
void disableOCx();


unsigned int GET_RunState(int axis_No);
unsigned int Get_AxisStatus(int stepper);

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
#line 1 "c:/users/git/pic32mzcnc/flash_r_w.h"
#line 27 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







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
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 49 "c:/users/git/pic32mzcnc/gcode.h"
extern volatile int status_code;
#line 160 "c:/users/git/pic32mzcnc/gcode.h"
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
 unsigned long frequency;
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

void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z);

static int Set_Modal_Groups(int mode);
static int Set_Motion_Mode(int mode);
static int Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
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
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 47 "c:/users/git/pic32mzcnc/protocol.h"
void Str_Initialize(char arg[ 20 ][ 64 ]);


void Str_clear(char *str,int len);


int Sample_Ringbuffer();


static int strsplit(char arg[ 20 ][ 64 ],char *str, char c);
static int strsplit2(char arg[ 20 ][ 64 ],char *str,char c);


static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);


static int str2int(char *str,int base);


void protocol_execute_startup();


void protocol_system_check();


void protocol_execute_runtime();
#line 1 "c:/users/git/pic32mzcnc/print.h"
#line 26 "C:/Users/Git/Pic32mzCNC/Protocol.c"
const code char SL[] = "$N";
char gcode[ 20 ][ 64 ];
static unsigned short startup = 0;



void Str_Initialize(char arg[ 20 ][ 64 ]){
int i;
 for(i = 0; i <=  20 ;i++){
 memset(arg[i],0, 64 );
 }
}

void Str_clear(char *str,int len){
 memset(str,0,len);
}



int Sample_Ringbuffer(){
float XYZ_Val;
static int motion_mode,str_len,query;
int status;
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val,O_Val,P_Val;
unsigned char *ptr;
char str[64];
char temp[9];
char xyz[6];
int F_1_Once=0,no_of_axis=0;
int axis_to_run = 0;

 num_of_strings = 0;


 dif = 0;
 dif = Get_Difference();


 if( ((sys.execute & (1 << 0) ) != 0) && !startup){
 startup = 1;
  (sys.execute &= ~ (1 << 0) ) ;
 report_realtime_status();
 return  0 ;
 }

 if(dif == 0){

 if(DMA0_ReadDstPtr()){
 ptr = (char*) 0xA0002000 ;
 if(*ptr == '?'){
#line 81 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 DMA0_Abort();
 if( ((sys.execute & (1 << 0) ) == 0) )
  (sys.execute |= (1 << 0) ) ;
 startup = 0;
 }
 }
 return  0 ;
 }else if(dif > 0){

 F_1_Once = no_of_axis = query = 0 ;

 Str_clear(str,str_len+2);
 Get_Line(str,dif);
 str_len = strlen(str);

START_LINE:


 num_of_strings = strsplit2(gcode,str,0x20);

 str_len = strlen(gcode[0]);
#line 121 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if(DCH0DAT == '?'){
#line 126 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 report_init_message();
 DCH0DAT = '\n';
 status =  0 ;
 startup = 1;
 goto report;
 }
#line 138 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if(gcode[0][0] =='?'){
 startup = 0;
 if( ((sys.execute & (1 << 0) ) == 0) )
  (sys.execute |= (1 << 0) ) ;
 goto end;
 }else if(gcode[0][0] =='$'){
 int helper_var;
 if(str_len < 2){
 report_grbl_help();
 query = 1;
 goto report;
 }
 switch(gcode[0][1]){
 case '?':
 report_grbl_help();
 query = 1;
 break;
 case '$':
 report_grbl_settings();
 query = 1;
 break;
 case '#' :
 report_gcode_parameters();
 query = 1;
 break;
 case 'G' :
 startup = 0;
 report_gcode_modes();


 if( ((sys.execute & (1 << 0) ) == 0) )
  (sys.execute |= (1 << 0) ) ;
 query = 1;
 break;
 case 'C' :
 startup = 2;



 if ( sys.state ==  7  ) {
 mc_reset();
 report_feedback_message( 5 );
 goto end;
 } else {

 if (sys.state) {
 query = 4;
 goto report;
 }

 sys.state =  7 ;
 report_feedback_message( 4 );
 }
 query = 1;
 goto report;
 break;
 case 'X' :
 startup = 2;
 if (sys.state ==  6 ) {
 report_feedback_message( 3 );
 sys.state =  0 ;

 }
 query = 1;
 break;
 case 'H' :
 startup = 2;

 if ( ((settings.flags & 16 ) != 0) ) {
 int axis_to_home = 0;


 if ( sys.state== 0  || sys.state== 6  ) {
 int i = 0;
 Rst_modalgroup();


 Set_modalgroup( 10 );
 for(i=1;i< 4 ;i++)
 Set_Axisword(i);
#line 223 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if (sys.abort) {
 query = 5;
 break;
 }
 } else {
 query = 6;
 break;
 }
 } else {
 query = 7;
 break;
 }
 FAIL( 0 );
 goto end;
 break;
 case 'N' :
 startup = 2;
 if ( gcode[0][2] < 0x20 ) {
 for (helper_var=0; helper_var <  2 ; helper_var++) {
 if ((settings_read_startup_line(helper_var, gcode[0]))) {

 query = 8;
 } else {
 report_startup_line(helper_var,gcode[0]);
 query = 1;
 }
#line 253 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }
 break;
 }else {
 int N_Val = 0;
 helper_var = 1;




 if ( gcode[0][2] >= '0' && gcode[0][2] <= '9' ) {
 char num[] = "0";

 num[0] = gcode[0][2];
 N_Val = atoi(num);
#line 273 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }else {
 query = 2;
 break;
 }


 if (helper_var) {
 if(gcode[0][3] != '='){


 helper_var = strlen((gcode[0]));
 strncpy(str,(gcode[0]),helper_var);
#line 292 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 str_len = strlen(str);
#line 297 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }else{
 int str_length = 0;
#line 306 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 settings_store_startup_line(N_Val,str+4);
 }

 }
 }
 query = 1;
 break;
 case '~':
 sys.execute |=  (1 << 1) ;
 query = 1;
 break;
 case '!':
 sys.execute |=  (1 << 3) ;
 break;
 query = 1;
 case 0x18:
 mc_reset();
 query = 1;
 break;

 case '0': case '1': case '2': case'3': case '4': case '5':
 case '6': case '7': case '8': case '9':



 if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
 char str_val[9]={0};
 int N_Val = 0;
 float value = 0.00;
 if(gcode[0][2] == '='){

 strncpy(str_val,gcode[0]+1,1);
 if(isdigit(str_val[0])){N_Val = atoi(str_val);}
 strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
 }else if(gcode[0][3] == '='){

 strncpy(str_val,gcode[0]+1,2);
 if(isdigit(str_val[0])){N_Val = atoi(str_val);}
 memset(str_val,0,9);
 strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
 }


 if((value < 0.0) || (!isdigit(str_val[0]))){
 query = 3;
 }
 value = atof(str_val);
#line 357 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 settings_store_global_setting(N_Val,value);


 query = 1;
 }
 break;
 }

 }else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
 switch(*(*gcode+0)+0){
 case 'G':case 'g':

 if (*(*(gcode)+0)=='G'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 if(i < 3){
 G_Val = atoi(temp);


 if(G_Val == 28 || G_Val == 30 || G_Val == 92)
 G_Val *= 10;
 }else{

 G_Val = (int)(atof(temp)*10.0);
 }

 motion_mode = G_Mode(G_Val);
#line 392 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if(*(*(gcode+1)+0) != 0){
 no_of_axis++;
#line 397 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
 switch(*(*(gcode+1)+0)) {
 case 'G':case 'g':
 if(i < 3){
 G_Val = atoi(temp);


 if(G_Val == 28 || G_Val == 30 || G_Val == 92)
 G_Val *= 10;
 }else{

 G_Val = (int)(atof(temp)*10.0);
 }

 motion_mode = G_Mode(G_Val);
#line 415 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'X':case 'x':
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[1],&XYZ_Val);
#line 425 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'L':case 'l':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);
#line 432 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);
#line 439 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'P':case 'p':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);
#line 446 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'S':case 's':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[1],&O_Val);
#line 453 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }




 if(*(*(gcode+2)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
 switch(*(*(gcode+2)+0)) {
 case 'G':case 'g':
 if(i < 3){
 G_Val = atoi(temp);


 if(G_Val == 28 || G_Val == 30 || G_Val == 92)
 G_Val *= 10;
 }else{

 G_Val = (int)(atof(temp)*10.0);
 }

 motion_mode = G_Mode(G_Val);
#line 479 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'X':case 'x':
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 no_of_axis++;
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[2],&XYZ_Val);
#line 490 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'L':case 'l':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);
#line 497 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);
#line 504 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'P':case 'p':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);
#line 511 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'S':case 's':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&O_Val);
#line 518 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }



 if(*(*(gcode+3)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
 switch(*(*(gcode+3)+0)) {
 case 'G':case 'g':
 if(i < 3){
 G_Val = atoi(temp);


 if(G_Val == 28 || G_Val == 30 || G_Val == 92)
 G_Val *= 10;
 }else{

 G_Val = (int)(atof(temp)*10.0);
 }

 motion_mode = G_Mode(G_Val);
#line 543 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'X':case 'x':case 'Y':case 'y':
 case 'Z':case 'z':case 'R':case 'r':
 case 'I':case 'i':
 no_of_axis++;
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[3],&XYZ_Val);
#line 553 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F': case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[3],&O_Val);
#line 560 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }




 if(*(*(gcode+4)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
 switch(*(*(gcode+4))) {
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[4],&XYZ_Val);
#line 578 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[4],&O_Val);
#line 585 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;

 }
 }



 if(*(*(gcode+5)+0) != 0){
 xyz[4] = *(*(gcode+5)+0);no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
 switch(*(*(gcode+5))) {
 case 'Z':case 'z':
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 Instruction_Values(gcode[5],&XYZ_Val);
#line 603 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[5],&O_Val);
#line 610 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }


 if(*(*(gcode+6)+0) != 0){
 i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
 switch(*(*(gcode+6))) {
 case 'J':case 'j':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[6],&XYZ_Val);
#line 624 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':case 'f':
 O_Val = atoi(temp);
 status = Instruction_Values(gcode[6],&O_Val);
#line 631 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;

 }
 }
 }else {
 return;
 }
 query = 20;
 break;
 case 'M':
 case 'm':

 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 M_Val = atoi(temp);
 M_Instruction(M_Val);
#line 651 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 if((*(gcode+1)) != 0){
 switch(*(*(gcode+1))){
 case 'S':
 case 's':

 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 XYZ_Val = atoi(temp);
 status = Instruction_Values(gcode[0],&XYZ_Val);
#line 662 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }
 query = 20;
 break;
 case 'X':case 'x':case 'Y':case 'y':
 case 'Z':case 'z':case 'A':case 'a':
 if(*(*(gcode)+0)=='X'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[0],&XYZ_Val);
#line 676 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }



 if(*(*(gcode+1)+0) != 0){
 xyz[1] = *(*(gcode+1)+0);no_of_axis++;
 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
 switch(*(*(gcode+1))) {
 case 'Y':case 'y':
 case 'Z':case 'z':
 case 'A':case 'a':
 XYZ_Val = atof(temp);
 status = Instruction_Values(gcode[1],&XYZ_Val);
#line 692 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 case 'F':
 case 'f':

 F_1_Once = 1;
 F_Val = atoi(temp);
 status = Instruction_Values(gcode[2],&F_Val);
#line 703 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 break;
 }
 }
 query = 20;
 break;
 case 'F':

 if (*(*(gcode)+0)=='F'){
 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
 F_Val = atoi(temp);
 status = Instruction_Values(gcode[0],&F_Val);
#line 717 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 }
 query =  20 ;
 break;
 }
 }
 report:
 if(query == 1){status =  0 ;}
 else if(query == 2){status =  1 ;}
 else if(query == 3){status =  3 ;}
 else if(query == 4){status =  11 ;}
 else if(query == 5){status =  -2 ;}
 else if(query == 6){status =  11 ;}
 else if(query == 7){status =  7 ;}
 else if(query == 8){status =  10 ;}
 else if(query == 20){status =  20 ; goto ret;}


 report_status_message(status);
 goto end;


 ret:
 status = Check_group_multiple_violations();

 }

 end:
 return status;
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
#line 896 "C:/Users/Git/Pic32mzCNC/Protocol.c"
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
#line 984 "C:/Users/Git/Pic32mzCNC/Protocol.c"
 sys_sync_current_position();


 sys.abort =  0 ;
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
