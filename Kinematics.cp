#line 1 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
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
#line 92 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 float steps_per_mm[3];
 char microsteps;
 char pulse_microseconds;
 float default_feed_rate;
 float default_seek_rate;
 char invert_mask;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 char flags;
 char homing_dir_mask;
 float homing_feed_rate;
 float homing_seek_rate;
 unsigned int homing_debounce_delay;
 float homing_pulloff;
 char stepper_idle_lock_time;
 char decimal_places;
 char n_arc_correction;

} settings_t;
extern settings_t settings;




void Settings_Init();
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
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
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 60 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 char abort;
 char state;
 int homing;
 int homing_cnt;
 char auto_start;
 volatile char execute;
} system_t;
extern system_t sys;
#line 83 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char r: 1;
 char no_axis_interpolate: 1;
 char inverse_feed_rate_mode;
 char inches_mode;
 char absolute_mode;
 char program_flow;
 char spindle_direction;
 char coolant_mode;
 char tool;

 char plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 char coord_select;
 int status_code;
 int motion_mode;
 int frequency;
 float feed_rate;

 float position[ 6 ];
 float coord_system[ 6 ];
 float coord_offset[ 6 ];

 float next_position[ 6 ];
 float offset[3];
 float R;
 float I;
 float J;
 float K;
} parser_state_t;
extern parser_state_t gc;

enum IJK{I,J,K};


void G_Initialise();
int Get_Axisword();
int Rst_Axisword();
static float To_Millimeters(float value);
int G_Mode(int mode);
static void Set_Modal_Groups(int mode);
static int Set_Motion_Mode(int mode);

void M_Instruction(int flow);
static void Set_M_Modal_Commands(int M_Val);
static int Set_M_Commands(int M_Val);
int Check_group_multiple_violations();

int Instruction_Values(char *c,void *any);

void Movement_Condition();
#line 13 "c:/users/git/pic32mzcnc/serial_dma.h"
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
void DMA0();
void DMA1();
void DMA0_Enable();
void DMA0_Disable();
void Reset_rxBuff(int dif);
int Get_Head_Value();
int Get_Tail_Value();
int Get_Difference();
void Get_Line(char *str,int dif);
void Reset_Ring();
int Loopback();



void DMA1_Enable();
void DMA1_Disable();
int DMA_Busy(int channel);
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
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
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/nuts_bolts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 28 "c:/users/git/pic32mzcnc/nuts_bolts.h"
int read_float(char *line, char *char_counter, float *float_ptr);


void delay_ms(unsigned int ms);


void delay_us(unsigned long us);


void sys_sync_current_position();
#line 31 "c:/users/git/pic32mzcnc/protocol.h"
void Str_Initialize(char arg[ 10 ][ 60 ]);

int Sample_Ringbuffer();

int strsplit(char arg[ 10 ][ 60 ],char *str, char c);
int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char);
int str2int(char *str,int base);
#line 27 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();
void LcdI2CConfig();
void OutPutPulseXYZ();
int Temp_Move(int a);
void LCD_Display();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
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
void ClockPulse();
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
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
#line 16 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;










extern unsigned int Toggle;



typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za,yx,zx,ax,zy,ay,az}axis_combination ;

extern _axis_ _axis;
extern volatile axis_combination axis_xyz;







void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
int EnableSteppers(int steppers);
void DisableStepper();
void disableOCx();



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
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
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

 unsigned char run_state ;

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
extern STP STPS[ 6 ];
#line 119 "c:/users/git/pic32mzcnc/kinematics.h"
void SetInitialSizes(STP axis[6]);


void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed);
void SingleAxisStep(double newxyz,long speed,int axis_No);


void mc_arc(double *position, double *target, double *offset, int axis_0,
 int axis_1,int axis_linear, double feed_rate,uint8_t invert_feed_rate,
 double radius, uint8_t isclockwise);
float hypot(float angular_travel, float linear_travel);
void r_or_ijk(double xCur,double yCur,double xFin,double yFin,
 double r, double i, double j, double k, int axis_A,int axis_B,int dir);


int GetAxisDirection(long mm2move);


void ResetHoming();
void Home(int axis);
void Home_Axis(double distance,long speed,int axis);
void Inv_Home_Axis(double distance,long speed,int axis);
#line 3 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
const code double max_sizes[]={ 300.00 , 300.00 , 100.00 , 100.00 , 100.00 , 100.00 };




volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] = "\r";
char txtB[200];


static long d2;




void SetInitialSizes(STP axis[6]){
int i = 0;

 gc.absolute_mode = 0;

 for (i = 0;i< 6 ;i++){
 axis[i].max_travel = max_sizes[i];
 }
}
#line 35 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(double newxyz,long speed,int axis_No){
long tempA = 0;
int dir = 0;
 Single_Axis_Enable(axis_No);
 tempA = belt_steps(newxyz);
 speed_cntr_Move(tempA , speed , axis_No);
#line 45 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 STPS[axis_No].axis_dir =  (((tempA) < (0))? ( -1 ) : ( 1 )) ;
 SV.Single_Dual = 0;
 STPS[axis_No].psingle = 0;

 STPS[axis_No].dist = tempA - STPS[axis_No].psingle;
 STPS[axis_No].dist = labs(tempA);
 dir = (tempA < 0)?  1  :  0 ;
 switch(axis_No){
 case X:
 DIR_StepX = ( 1  ^ dir) & 0x0001;
 break;
 case Y:
 DIR_StepY = ( 0  ^ dir) & 0x0001;
 break;
 case Z:
 DIR_StepZ = ( 0  ^ dir) & 0x0001;
 break;
 case A:
 DIR_StepA = ( 0  ^ dir) & 0x0001;
 break;
 default: break;
 }

 STPS[axis_No].step_count = 0;
 STPS[axis_No].mmToTravel = tempA;

 Step_Cycle(axis_No);

}






void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){
long tempA,tempB,tempC;
int dirA,dirB;
 SV.over=0;
 SV.dif = 0;

 tempA = belt_steps(axis_a);
 tempB = belt_steps(axis_b);


 SV.Single_Dual = 1;
 Single_Axis_Enable(axisA);
 Single_Axis_Enable(axisB);



 if (!gc.absolute_mode){
 SV.prevA = 0;
 SV.prevB = 0;
 SV.prevC = 0;
 }else{
 SV.prevA = 0;
 SV.prevB = 0;
 SV.prevC = 0;
 }


 STPS[axisA].axis_dir =  (((tempA) < (0))? ( -1 ) : ( 1 )) ;
 STPS[axisB].axis_dir =  (((tempB) < (0))? ( -1 ) : ( 1 )) ;


 SV.dA = tempA - SV.prevA;
 SV.dB = tempB - SV.prevB;
 SV.dC = tempC - SV.prevC;


 dirA = SV.dA > 0?  0 : 1 ;
 dirB = SV.dB > 0?  0 : 1 ;

 DIR_StepX = ( 1  ^ dirA) & 0x0001;
 DIR_StepY = ( 0  ^ dirB) & 0x0001;


 SV.dA = labs(SV.dA);
 SV.dB = labs(SV.dB);



 if(SV.dA >= SV.dB){
 if(!SV.cir)
 speed_cntr_Move(tempA,speed,axisA);

 SV.dif =  ((2)*((SV.dB) - (SV.dA))) ;
 STPS[axisA].master = 1;
 STPS[axisB].master = 0;
 }
 else{
 if(!SV.cir)
 speed_cntr_Move(tempB,speed,axisB);

 SV.dif =  ((2)*((SV.dA) - (SV.dB))) ;
 STPS[axisA].master = 0;
 STPS[axisB].master = 1;
 }

 STPS[axisA].step_count = 0;
 STPS[axisB].step_count = 0;
 STPS[axisA].mmToTravel = tempA;
 STPS[axisB].mmToTravel = tempB;

 Axis_Interpolate(axisA,axisB);







}
#line 171 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
float hypot(float angular_travel, float linear_travel){
 return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}
#line 201 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void mc_arc(double *position, double *target, double *offset, int axis_0, int axis_1,
 int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
 long tempA,tempB;
 double center_axis0 = position[axis_0] + offset[axis_0];
 double center_axis1 = position[axis_1] + offset[axis_1];
 double linear_travel = target[axis_linear] - position[axis_linear];
 double r_axis0 = -offset[axis_0];
 double r_axis1 = -offset[axis_1];
 double rt_axis0 = target[axis_0] - center_axis0;
 double rt_axis1 = target[axis_1] - center_axis1;
 double theta_per_segment = 0.00;
 double linear_per_segment = 0.00;
 double angular_travel = 0.00;
 double mm_of_travel = 0.00;
 double rads = 0.00;
 unsigned int segments = 0;
 double cos_T = 0.00;
 double sin_T = 0.00;
 double arc_target[3];
 double sin_Ti;
 double cos_Ti;
 double r_axisi;
 double nPx,nPy;
 unsigned int i = 0;
 int count = 0;
 char n_arc_correction = 3;
 char limit_error = 0;

 arc_target[axis_linear] = position[axis_linear];
 rads = radius *  ( 3.141593 /180.00) ;


 angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);

 if(isclockwise) {

 if (angular_travel >= 0)
 angular_travel -= 2* 3.1416 ;
 else {
 if(angular_travel <= 0)
 angular_travel += 2* 3.1416 ;
 }
 }


 mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
 if (mm_of_travel == 0.0) { return; }

 segments = (unsigned int)floor(mm_of_travel/ 0.8 );



 if (invert_feed_rate)
 feed_rate *= segments;


 theta_per_segment = angular_travel/segments;



 linear_per_segment = linear_travel/(double)segments;


 cos_T = 1-0.5*theta_per_segment*theta_per_segment;
 sin_T = theta_per_segment;

 nPx = arc_target[axis_0] = position[axis_0];
 nPy = arc_target[axis_1] = position[axis_1];
 OC5IE_bit = OC2IE_bit = 0;
 i = 0;

 dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
 cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);

 while(i < segments) {

 if (count < n_arc_correction) {

 r_axisi = r_axis0*sin_T + r_axis1*cos_T;
 r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
 r_axis1 = r_axisi;
 count++;
 } else {


 cos_Ti = cos(i*theta_per_segment);
 sin_Ti = sin(i*theta_per_segment);
 r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
 r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
 count = 0;
 }


 arc_target[axis_0] = center_axis0 + r_axis0;
 arc_target[axis_1] = center_axis1 + r_axis1;
 arc_target[axis_linear] += linear_per_segment;
 nPx = arc_target[axis_0] - position[axis_0];
 position[axis_0] = arc_target[axis_0];
 nPy = arc_target[axis_1] - position[axis_1];
 position[axis_1] = arc_target[axis_1];

 STPS[axis_0].step_delay = 1000;
 STPS[axis_1].step_delay = 1000;


 if(!DMA_Busy(1));
 dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
 i,segments,nPx,nPy,tempA,tempB);


 SV.cir = 1;
 DualAxisStep(nPx, nPy,axis_0,axis_1,1000);

 while(1){

 if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
 disableOCx();
 limit_error = 1;
 }

 if(!OC5IE_bit && !OC2IE_bit)
 break;
 }



 if(limit_error)
 break;
 i++;
 }
#line 337 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
}









int GetAxisDirection(long mm2move){
 return(mm2move < 0)?  -1 : 1  ;
}





void ResetHoming(){
int i = 0;
 for(i = 0;i<  6 ;i++){
 STPS[i].homing.set = 0;
 STPS[i].homing.complete = 0;
 STPS[i].homing.home_cnt = 0;
 STPS[i].homing.rev = 0;
 STPS[i].homing.home = 0;
 }
}


void Home(int axis){
long speed = 0;

 if(!STPS[axis].homing.set){
 STPS[axis].homing.set = 1;
 STPS[axis].homing.complete = 0;
 STPS[axis].homing.home_cnt = 0;
 speed = 2000;
 }else{
 speed = 100;
 }



 if(FP(axis)){
 if(axis == X)
 StopAxis(X);
 else if(axis == Y)
 StopAxis(Y);

 if(!STPS[axis].homing.rev){
 STPS[axis].homing.rev = 1;
 Inv_Home_Axis(2.0,speed, axis);
 }
 STPS[axis].homing.home_cnt++;
 }

 if(FN(axis)){
 STPS[axis].homing.home = 0;
 }

 if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){

 if(!STPS[axis].homing.home){
 STPS[axis].homing.home = 1;
 Home_Axis(-290.00,speed,axis);
 }

 if((STPS[axis].homing.home_cnt >= 2)&&(!STPS[axis].homing.complete)){
 STPS[axis].homing.complete =  1 ;
 STPS[axis].step_count = 0;
 STPS[axis].steps_abs_position = 0;
 }
 }

}


void Home_Axis(double distance,long speed,int axis){
 distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
 distance = (distance < 0.0)? distance : -distance;



}

void Inv_Home_Axis(double distance,long speed,int axis){
 distance = (distance > 10.0)? 10.0 : distance;
 distance *= (distance < 0.0)? -1.0 : 1.0;



}
