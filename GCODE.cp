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
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
#line 48 "c:/users/git/pic32mzcnc/kinematics.h"
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
#line 133 "c:/users/git/pic32mzcnc/kinematics.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
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

void Sample_Ringbuffer();

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
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 82 "c:/users/git/pic32mzcnc/gcode.h"
typedef struct {
 char r: 1;
 char status_code;
 char no_axis_interpolate;
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
 int motion_mode;
 int frequency;
 float feed_rate;

 float position[ 6 ];
 float coord_system[ 6 ];
 float coord_offset[ 6 ];

 float next_position[ 6 ];
 float R;
 float I;
 float J;
} parser_state_t;
extern parser_state_t gc;




void G_Initialise();
static float To_Millimeters(float value);
void G_Mode(int mode);
static void Set_Modal_Groups(int mode);
static char Set_Motion_Mode(int mode);

void M_Instruction(int flow);
static void Set_M_Modal_Commands(int M_Val);
static char Set_M_Commands(int M_Val);
char Check_group_multiple_violations();

void Instruction_Values(char *c,void *any);
#line 3 "C:/Users/Git/Pic32mzCNC/GCODE.c"
parser_state_t gc;



char absolute_override;
int group_number;
int non_modal_action;
int modal_group_words;
int axis_words;
int int_value;
float inverse_feed_rate;
float value;



void G_Initialise(){
 group_number = 0;
 non_modal_action = 0;
 modal_group_words = 0;
 axis_words = 0;
 int_value = 0;
 value = 0;
 inverse_feed_rate = -1;
 absolute_override = 0;
}

static float To_Millimeters(float value)
{
 return(gc.inches_mode ? (value *  (25.40) ) : value);
}


static void Select_Plane(long x,long y,long z){
 gc.position[X] = x/settings.steps_per_mm[X];
 gc.position[Y] = y/settings.steps_per_mm[Y];
 gc.position[Z] = z/settings.steps_per_mm[Z];
}


void G_Mode(int mode){

 gc.motion_mode = mode;
 Set_Modal_Groups(mode);
 Set_Motion_Mode(mode);



 while(DMA_Busy(1));
 dma_printf("gc.motion_mode:= %d\n",mode);

}


static void Set_Modal_Groups(int mode){
 switch(mode) {
 case 4: case 10: case 28: case 30: case 53: case 92: group_number =  1 ; break;
 case 0: case 1: case 2: case 3: case 80: group_number =  2 ; break;
 case 17: case 18: case 19: group_number =  3 ; break;
 case 90: case 91: group_number =  4 ; break;
 case 93: case 94: group_number =  6 ; break;
 case 20: case 21: group_number =  7 ; break;
 case 54: case 55: case 56: case 57: case 58: case 59: group_number =  9 ; break;
 }
}


static char Set_Motion_Mode(int mode){
int i;
 switch(mode){
 case 0: gc.motion_mode =  0 ; break;
 case 1: gc.motion_mode =  1 ; break;
 case 2: gc.motion_mode =  2 ; break;
 case 3: gc.motion_mode =  3 ; break;
 case 4: non_modal_action =  1 ; break;
 case 10: non_modal_action =  2 ; break;
 case 17: Select_Plane(X, Y, Z); break;
 case 18: Select_Plane(X, Z, Y); break;
 case 19: Select_Plane(Y, Z, X); break;
 case 20: gc.inches_mode = 1; break;
 case 21: gc.inches_mode = 0; break;
 case 28: case 30:
 int_value = floor(10*mode);
 switch(int_value) {
 case 280: non_modal_action =  3 ; break;
 case 281: non_modal_action =  4 ; break;
 case 300: non_modal_action =  5 ; break;
 case 301: non_modal_action =  6 ; break;
 default:  gc.status_code = 3 ; ;
 }
 break;
 case 53: absolute_override =  1 ; break;
 case 54: case 55: case 56: case 57: case 58: case 59:
 gc.coord_select = int_value-54;
 break;
 case 80: gc.motion_mode =  4 ; break;
 case 90: gc.absolute_mode =  1 ; break;
 case 91: gc.absolute_mode =  0 ; break;
 case 92:
 int_value = floor(10*mode);
 switch(int_value) {
 case 920: non_modal_action =  7 ; break;
 case 921: non_modal_action =  8 ; break;
 default:  gc.status_code = 3 ; ;
 }
 break;
 case 93: gc.inverse_feed_rate_mode =  1 ; break;
 case 94: gc.inverse_feed_rate_mode =  0 ; break;
 default:  gc.status_code = 3 ; ;break;
 }





 if (  ((modal_group_words & (1 << 2 ) ) != 0)  || axis_words ) {


 if ( gc.inverse_feed_rate_mode ) {
 if (inverse_feed_rate < 0 && gc.motion_mode !=  4 ) {
  gc.status_code = 6 ; ;
 }
 }

 if ( absolute_override && !(gc.motion_mode ==  0  || gc.motion_mode ==  1 )) {
  gc.status_code = 6 ; ;
 }

 if (gc.status_code) { return(gc.status_code); }




 for (i=0; i<=2; i++) {
 if (  ((axis_words & (1 << i) ) != 0)  ) {
 if (!absolute_override) {
 if (gc.absolute_mode) {
 gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
 } else {
 gc.next_position[i] += gc.position[i];
 }
 }
 } else {
 gc.next_position[i] = gc.position[i];
 }
 }
 }



 switch (gc.motion_mode) {
 case  4 :
 if (axis_words) {  gc.status_code = 6 ; ; }
 break;
 case  0 :
 if (!axis_words) {  gc.status_code = 6 ; ;}
 else {


 }
 break;
 case  1 :




 if (!axis_words) {  gc.status_code = 6 ; ;}
 else {

 }
 break;
 case  2 : case  3 :


 if ( !(  (axis_words &= ~ (1 << gc.plane_axis_2) )  ) ||
 ( !gc.r) ){
  gc.status_code = 6 ; ;
 } else {
 if (gc.R != 0) {

 asm{nop;}
 }
 }
 break;
 }
}




void M_Instruction(int flow){
 gc.program_flow = flow;
 Set_M_Modal_Commands(flow);
 Set_M_Commands(flow);

 while(DMA_Busy(1));
 dma_printf("gc.program_flow:= %d\n",flow);

}

static void Set_M_Modal_Commands(int flow){

 switch(flow) {
 case 0: case 1: case 2: case 30: group_number =  5 ; break;
 case 3: case 4: case 5: group_number =  8 ; break;
 }
}


static char Set_M_Commands(int flow){

 switch(flow) {
 case 0: gc.program_flow =  1 ; break;
 case 1: break;
 case 2:
 case 30: gc.program_flow =  2 ; break;
 case 3: gc.spindle_direction = 1; break;
 case 4: gc.spindle_direction = -1; break;
 case 5: gc.spindle_direction = 0; break;
#line 224 "C:/Users/Git/Pic32mzCNC/GCODE.c"
 case 8: gc.coolant_mode =  1 ; break;
 case 9: gc.coolant_mode =  0 ; break;
 default:  gc.status_code = 3 ; ;break;
 }
}


char Check_group_multiple_violations(){
 if (group_number) {
 if (  ((modal_group_words & (1 << group_number) ) != 0)  ) {
  gc.status_code = 5 ; ;
 } else {
  (modal_group_words |= (1 << group_number) ) ;
 }
 group_number =  0 ;
 }



 if (gc.status_code)
 return gc.status_code;

 return gc.status_code;
}


void Instruction_Values(char *c,void *any){
float XYZ_Val;
int F_Val,S_Val;

 switch(c[0]){
 case 'X':
 XYZ_Val = *(float*)any;
 gc.next_position[X] = XYZ_Val;
 break;
 case 'Y':
 XYZ_Val = *(float*)any;
 gc.next_position[Y] = XYZ_Val;
 break;
 case 'Z':
 XYZ_Val = *(float*)any;
 gc.next_position[Z] = XYZ_Val;
 break;
 case 'A':
 XYZ_Val = *(float*)any;
 gc.next_position[A] = XYZ_Val;
 break;
 case 'E':
 XYZ_Val = *(float*)any;
 gc.next_position[B] = XYZ_Val;
 break;
 case 'R':
 XYZ_Val = *(float*)any;
 gc.R = XYZ_Val;
 break;
 case 'I':
 gc.r = 0;
 gc.R = 0;
 XYZ_Val = *(float*)any;
 gc.I = XYZ_Val;
 break;
 case 'J':
 XYZ_Val = *(float*)any;
 gc.J = XYZ_Val;
 break;
 case 'F':
 F_Val = *(int*)any;
 gc.frequency = F_Val;
 break;
 case 'S':
 S_Val = *(int*)any;

 break;
 default: gc.status_code = 3 ; ;
 break;
 }

 while(DMA_Busy(1));
 if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
 dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
 else if(c[0] == 'F')
 dma_printf("\t%c\t%d\n",c[0],F_Val);
 else if(c[0] == 'S')
 dma_printf("\t%c\t%d\n",c[0],S_Val);

}
