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
#line 1 "c:/users/git/pic32mzcnc/settings.h"
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
#line 22 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 34 "c:/users/git/pic32mzcnc/steptodistance.h"
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
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 13 "c:/users/git/pic32mzcnc/serial_dma.h"
extern char txt[];
extern char rxBuf[];
extern char txBuf[];







void DMA_global();
void DMA0();
void DMA1();
void DMA0_Enable();
void DMA0_Disable();
void DMA1_Enable();
void DMA1_Disable();
int DMA_Busy(int channel);
int dma_printf(char* str,...);
void lTrim(char* d,char* s);
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 52 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 uint8_t status_code;
 uint8_t motion_mode;
 uint8_t inverse_feed_rate_mode;
 uint8_t inches_mode;
 uint8_t absolute_mode;
 uint8_t program_flow;
 int8_t spindle_direction;
 uint8_t coolant_mode;
 float feed_rate;

 float position[3];
 uint8_t tool;

 uint8_t plane_axis_0,
 plane_axis_1,
 plane_axis_2;
 uint8_t coord_select;
 float coord_system[ 6 ];

 float coord_offset[ 6 ];

} parser_state_t;
extern parser_state_t gc;



void gc_init();


uint8_t gc_execute_line(char *line);


void gc_set_current_position(int32_t x, int32_t y, int32_t z);
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 50 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 uint8_t abort;
 uint8_t state;
 int homing;
 int homing_cnt;
 uint8_t auto_start;
 volatile uint8_t execute;
} system_t;
extern system_t sys;




typedef struct genVars{
 int Single_Dual;
 unsigned short running: 1;
 unsigned short startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long d2;
 long dx;
 long dy;
 long dz;
 long da;
 long px;
 long py;
 long pz;
 long pa;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
}sVars;
extern sVars SV;
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
void Temp_Move(int a);
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
#line 15 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 54 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;


typedef struct STPT {

 long uSec;

 int axisTosample;

 int howManyOCxRunning;

 int compOCxRunning;
}StepTmr;
extern StepTmr STmr;


typedef enum xyz{X,Y,Z,A,B,C,XY,XZ,XA,YZ,YA,XYZ,XYA,XZA,YZA}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;

extern _axis_ _axis;
extern axis_combination axis_xyz;







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


void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
void speed_cntr_Init_Timer1(void);
static unsigned long sqrt_(unsigned long v);
unsigned int min_(unsigned long x, unsigned long y);
void CalcDly(int axis_No);
void StepperConstants(long accel,long decel);

void SingleStepX();
void SingleStepY();
void SingleStepZ();
void SingleStepA();

void XY_Interpolate();
void XZ_Interpolate();
void YZ_Interpolate();
void XA_Interpolate();
void YA_Interpolate();
void ZA_Interpolate();

void StopX();
void StopY();
void StopZ();
void StopA();


int Pulse(int axis_No);
void toggleOCx(int axis_No);
void multiToggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);

void Test_CycleX();
void Test_CycleY();
void Test_CycleZ();
void Test_CycleA();
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 60 "c:/users/git/pic32mzcnc/kinematics.h"
extern volatile void (*AxisPulse[3])();




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

 long steps_position;

 double mm_position;

 double mm_home_position;

 double max_travel;

 int axis_dir;

 char master: 1;
}STP;
extern STP STPS[ 6 ];


typedef struct{
char set: 1;
char home: 1;
char rev: 1;
char back: 1;
char complete: 1;
unsigned int home_cnt;
}Homing;
extern Homing homing[ 6 ];










void SetInitialSizes(STP axis[6]);


void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);


void mc_arc(double *position, double *target, double *offset, uint8_t axis_0,
 uint8_t axis_1,uint8_t axis_linear, double feed_rate,uint8_t invert_feed_rate,
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
Homing homing[ 6 ];



volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] = "\r";
char txtB[200];


static long d2;




void SetInitialSizes(STP axis[6]){
int i = 0;

 for (i = 0;i< 6 ;i++){
 axis[i].max_travel = max_sizes[i];
 }
}
#line 33 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
#line 40 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 STPS[axis_No].axis_dir =  (((newxyz) < (0))? ( -1 ) : ( 1 )) ;
 SV.Single_Dual = 0;
 STPS[axis_No].psingle = 0;

 Single_Axis_Enable(axis_No);
 STPS[axis_No].dist = newxyz - STPS[axis_No].psingle;
 STPS[axis_No].dist = labs(newxyz);
 dir = (newxyz < 0)?  1  :  0 ;

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

 Step_Cycle(axis_No);

}






void DualAxisStep(long axis_a,long axis_b,int axis_combo){
int dirA,dirB;
 SV.over=0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
 SV.d2 = 0;


 SV.Single_Dual = 1;

 switch(axis_combo){
 case xy:

 AxisPulse[1] = &XY_Interpolate;

 axis_xyz = xy;

 STPS[X].axis_dir =  (((axis_a) < (0))? ( -1 ) : ( 1 )) ;
 STPS[Y].axis_dir =  (((axis_b) < (0))? ( -1 ) : ( 1 )) ;

 Multi_Axis_Enable(axis_xyz);

 SV.dx = axis_a - SV.px;
 SV.dy = axis_b - SV.py;



 dirA = SV.dx > 0?  0 : 1 ;
 dirB = SV.dy > 0?  0 : 1 ;

 DIR_StepX = ( 1  ^ dirA) & 0x0001;
 DIR_StepY = ( 0  ^ dirB) & 0x0001;

 SV.dx = labs(SV.dx);
 SV.dy = labs(SV.dy);

 if(SV.dx > SV.dy)
 SV.d2 =  ((2)*((SV.dy) - (SV.dx))) ;
 else
 SV.d2 =  ((2)*((SV.dx) - (SV.dy))) ;

 if(SV.dx >= SV.dy){
 STPS[X].master = 1;
 STPS[Y].master = 0;
 }else{
 STPS[X].master = 0;
 STPS[Y].master = 1;
 }

 STPS[X].step_count = 0;
 STPS[Y].step_count = 0;
 AxisPulse[1]();

 break;
 case xz:

 AxisPulse[1] = &XZ_Interpolate;

 axis_xyz = xz;

 STPS[X].axis_dir =  (((axis_a) < (0))? ( -1 ) : ( 1 )) ;
 STPS[Z].axis_dir =  (((axis_b) < (0))? ( -1 ) : ( 1 )) ;

 Multi_Axis_Enable(axis_xyz);



 SV.dx = axis_a - SV.px;
 SV.dz = axis_b - SV.pz;

 dirA = SV.dx > 0?  0 : 1 ;
 dirB = SV.dz > 0?  0 : 1 ;

 DIR_StepX = ( 1  ^ dirA) & 0x0001;
 DIR_StepZ = ( 0  ^ dirB) & 0x0001;

 SV.dx = labs(SV.dx);
 SV.dz = labs(SV.dz);

 if(SV.dx > SV.dz)
 d2 =  ((2)*((SV.dz) - (SV.dx))) ;
 else
 d2 =  ((2)*((SV.dx) - (SV.dx))) ;

 STPS[X].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse[1]();
 break;
 case yz:

 AxisPulse[1] = &YZ_Interpolate;

 axis_xyz = yz;
 STPS[Y].axis_dir =  (((axis_a) < (0))? ( -1 ) : ( 1 )) ;
 STPS[Z].axis_dir =  (((axis_b) < (0))? ( -1 ) : ( 1 )) ;

 Multi_Axis_Enable(axis_xyz);



 SV.dy = axis_a - SV.pz;
 SV.dz = axis_b - SV.py;

 dirA = SV.dy > 0?  0 : 1 ;
 dirB = SV.dz > 0?  0 : 1 ;

 DIR_StepY = ( 0  ^ dirA) & 0x0001;
 DIR_StepZ = ( 0  ^ dirB) & 0x0001;

 SV.dy = labs(SV.dy);
 SV.dz = labs(SV.dz);

 if(SV.dy > SV.dz)
 SV.d2 =  ((2)*((SV.dz) - (SV.dy))) ;
 else
 SV.d2 =  ((2)*((SV.dy) - (SV.dz))) ;

 STPS[Y].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse[1]();
 break;
 default: break;

 }
}
#line 220 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,
 double r, double i, double j, double k, int axis_A,int axis_B,int dir){
unsigned short isclockwise = 0;
double inverse_feed_rate = -1;
double position[ 6 ];
double target[ 6 ];
double offset[ 6 ];
double x = 0.00;
double y = 0.00;
double h_x2_div_d = 0.00;
unsigned int axis_plane_a,axis_plane_b;


 position[axis_A] = Cur_axis_a;
 position[axis_B] = Cur_axis_b;
 target[axis_A] = Fin_axis_a;
 target[axis_B] = Fin_axis_b;
 offset[axis_A] = i;
 offset[axis_B] = j;

 if (r != 0.00) {
#line 304 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 x = target[axis_plane_a] - position[axis_plane_a];

 y = target[axis_plane_b] - position[axis_plane_b];



 h_x2_div_d = 4 * r*r - x*x - y*y;


 h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y);

 if (gc.motion_mode ==  3 ) { h_x2_div_d = -h_x2_div_d; }
#line 338 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 if (r < 0) {
 h_x2_div_d = -h_x2_div_d;
 r = -r;
 }


 i = 0.5*(x-(y*h_x2_div_d));

 j = 0.5*(y+(x*h_x2_div_d));
 } else {


 r = hypot(i, j);
 }
 dma_printf("Radius:= %f",r);


 isclockwise =  0 ;
 if (dir ==  0 ) { isclockwise =  1 ; }



 mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
  250.0 , gc.inverse_feed_rate_mode,r, isclockwise);
}



void mc_arc(double *position, double *target, double *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
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
 double millimeters_of_travel = 0.00;
 uint16_t segments = 0;
 double cos_T = 0.00;
 double sin_T = 0.00;

 double arc_target[3];
 double sin_Ti;
 double cos_Ti;
 double r_axisi;
 uint16_t i;
 int8_t count = 0;
 double nPx,nPy;
 uint8_t n_arc_correction;



 angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);

 if (isclockwise) {

 if (angular_travel >= 0) { angular_travel -= 2* 3.1416 ; }
 } else {
 if (angular_travel <= 0) { angular_travel += 2* 3.1416 ; }
 }


 millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));


 segments = floor(millimeters_of_travel/ 0.1 );




 if (invert_feed_rate) { feed_rate *= segments; }
 angular_travel = angular_travel *  (180.00/ 3.141593 ) ;
 theta_per_segment = angular_travel/segments;



 linear_per_segment = linear_travel/segments;
#line 446 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 cos_T = 1-0.5*theta_per_segment*theta_per_segment;
 sin_T = theta_per_segment;

 nPx = arc_target[X] = position[X];
 nPy = arc_target[Y] = position[Y];
 for (i = 1; i<segments; i++) {
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


 arc_target[X] = center_axis0 + r_axis0;
 arc_target[Y] = center_axis1 + r_axis1;
 arc_target[axis_linear] += linear_per_segment;
 nPx = arc_target[X] - position[X];
 position[X] = arc_target[X];
 nPy = arc_target[Y] - position[Y];
 position[Y] = arc_target[Y];
 while(1){
 if(!OC5IE_bit && !OC2IE_bit)
 break;
 }
#line 486 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 STPS[X].mmToTravel = belt_steps(nPx);
 STPS[Y].mmToTravel = belt_steps(nPy);
 tempA = abs(STPS[X].mmToTravel);
 tempB = abs(STPS[Y].mmToTravel);
 if(tempA > tempB)
 speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
 else
 speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);


 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);



 }


}

float hypot(float angular_travel, float linear_travel){
 return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}







int GetAxisDirection(long mm2move){
 return(mm2move < 0)?  -1 : 1  ;
}





void ResetHoming(){
int i = 0;
 for(i = 0;i<  6 ;i++){
 homing[i].set = 0;
 homing[i].complete = 0;
 homing[i].home_cnt = 0;
 homing[i].rev = 0;
 homing[i].home = 0;
 }
}


void Home(int axis){
long speed = 0;

 if(!homing[axis].set){
 homing[axis].set = 1;
 homing[axis].complete = 0;
 homing[axis].home_cnt = 0;
 speed = 2000;
 }else{
 speed = 100;
 }



 if(FP(axis)){
 if(axis == X)
 StopX();
 else if(axis == Y)
 StopY();

 if(!homing[axis].rev){
 homing[axis].rev = 1;
 Inv_Home_Axis(2.0,speed, axis);
 }
 homing[axis].home_cnt++;
 }

 if(FN(axis)){
 homing[axis].home = 0;
 }

 if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){

 if(!homing[axis].home){
 homing[axis].home = 1;
 Home_Axis(-290.00,speed,axis);
 }

 if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
 homing[axis].complete = 1;
 STPS[axis].step_count = 0;
 STPS[axis].steps_position = 0;
 }
 }

}


void Home_Axis(double distance,long speed,int axis){
 distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
 distance = (distance < 0.0)? distance : -distance;
 STPS[axis].mmToTravel = belt_steps(distance);
 speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
 SingleAxisStep(STPS[axis].mmToTravel,axis);
}

void Inv_Home_Axis(double distance,long speed,int axis){
 distance = (distance > 10.0)? 10.0 : distance;
 distance *= (distance < 0.0)? -1.0 : 1.0;
 STPS[axis].mmToTravel = belt_steps(distance);
 speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
 SingleAxisStep(STPS[axis].mmToTravel,axis);
}
