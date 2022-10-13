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
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 16 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 28 "c:/users/git/pic32mzcnc/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 7 "c:/users/git/pic32mzcnc/serial_dma.h"
extern char txt[];
extern char rxBuf[];
extern char txBuf[];







void DMA_global();
void DMA0();
void DMA1();
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
#line 31 "c:/users/git/pic32mzcnc/config.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 62 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
typedef enum{
 _LCD_FIRST_ROW = 1,
 _LCD_SECOND_ROW,
 _LCD_THIRD_ROW,
 _LCD_FOURTH_ROW,
 _LCD_CLEAR,
 _LCD_RETURN_HOME,
 _LCD_CURSOR_OFF,
 _LCD_UNDERLINE_ON,
 _LCD_BLINK_CURSOR_ON,
 _LCD_MOVE_CURSOR_LEFT,
 _LCD_MOVE_CURSOR_RIGHT,
 _LCD_TURN_ON,
 _LCD_TURN_OFF,
 _LCD_SHIFT_LEFT,
 _LCD_SHIFT_RIGHT,
 _LCD_INCREMENT_NO_SHIFT
}Cmd_Type;

extern Cmd_Type Cmd;



  unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data);
 void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype);
 void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col);
 void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col);
 void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta);
 void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s);
 void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char);
 void I2C_LCD_init( unsigned char  addr);
 void I2C_LCD_init4l( unsigned char  addr);
 void I2C_Pins(char i2c_pins);
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 12 "c:/users/git/pic32mzcnc/timers.h"
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
#line 15 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 58 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 int Single_Dual;
 UInt8_t running: 1;
 UInt8_t startPulses: 1;
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
 long psingle;
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

typedef struct STPT {

 long uSec;

 int axisTosample;

 int howManyOCxRunning;

 int compOCxRunning;
}StepTmr;
extern StepTmr STmr;




typedef enum xyz{X,Y,Z,A,B,C}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;
enum swt{FALSE,TRUE};

extern _axis_ _axis;
extern axis_combination axis_xyz;







void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
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
#line 30 "c:/users/git/pic32mzcnc/kinematics.h"
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

 long new_step_delay;

 long last_accel_delay;

 long accel_lim;

 long max_step_lim;

 long rest;

 long StartUp_delay;

 signed long mmToTravel;
}STP;
extern STP STPS[ 6 ];










typedef struct {
 float steps_per_mm[3];
 uint8_t microsteps;
 uint8_t pulse_microseconds;
 float default_feed_rate;
 float default_seek_rate;
 uint8_t invert_mask;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 uint8_t flags;
 uint8_t homing_dir_mask;
 float homing_feed_rate;
 float homing_seek_rate;
 uint16_t homing_debounce_delay;
 float homing_pulloff;
 uint8_t stepper_idle_lock_time;
 uint8_t decimal_places;
 uint8_t n_arc_correction;

} settings_t;
extern settings_t settings;





void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);


void mc_arc(float *position, float *target, float *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise);
float hypot(float angular_travel, float linear_travel);
void SerialPrint(float r);
void r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k);
#line 6 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] = "\r";
char txtB[200];


static long d2;
#line 21 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
#line 27 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 SV.Single_Dual = 0;

 switch(axis_No){
 case X:
 Single_Axis_Enable(X);
 break;
 case Y:
 Single_Axis_Enable(Y);
 break;
 case Z:
 Single_Axis_Enable(Z);
 break;
 case A:
 Single_Axis_Enable(A);
 break;
 default: break;
 }
 SV.psingle = 0;
 STPS[axis_No].dist = newxyz - SV.psingle;
 STPS[axis_No].dist = abs(STPS[axis_No].dist);

 if(newxyz < 0)
 dir =  1 ;
 else
 dir =  0 ;

 switch(axis_No){
 case X:
 DIR_StepX = dir;
 break;
 case Y:
 DIR_StepY = dir;
 break;
 case Z:
 DIR_StepZ = dir;
 break;
 case A:
 DIR_StepA = dir;
 break;
 default: break;
 }

 STPS[axis_No].step_count = 0;

 Step_Cycle(axis_No);

}




void DualAxisStep(long newx,long newy,int axis_combo){

 SV.over=0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
#line 88 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 SV.Single_Dual = 1;

 switch(axis_combo){
 case xy:
 AxisPulse[1] = &XY_Interpolate;
 axis_xyz = xy;
 Multi_Axis_Enable(axis_xyz);

 SV.dx = newx - SV.px;
 SV.dy = newy - SV.py;


 SV.dirx = SV.dx > 0? 1:-1;
 SV.diry = SV.dy > 0? 1:-1;


 if(SV.dirx < 0)
 DIR_StepX =  1 ;
 else
 DIR_StepX =  0 ;

 if(SV.diry < 0)
 DIR_StepY =  1 ;
 else
 DIR_StepY =  0 ;

 SV.dx = abs(SV.dx);
 SV.dy = abs(SV.dy);

 if(SV.dx > SV.dy)
 SV.d2 = 2*(SV.dy - SV.dx);
 else
 SV.d2 = 2* (SV.dx - SV.dy);

 STPS[X].step_count = 0;
 STPS[Y].step_count = 0;
 AxisPulse[1]();

 break;
 case xz:
 AxisPulse[1] = &XZ_Interpolate;
 axis_xyz = xz;
 Multi_Axis_Enable(axis_xyz);

 SV.dx = newx - SV.px;
 SV.dz = newy - SV.pz;


 SV.dirx = SV.dx > 0?1:-1;
 SV.dirz = SV.dz > 0?1:-1;


 if(SV.dirx < 0)DIR_StepX =  1 ;
 else DIR_StepX =  0 ;

 if(SV.dirz < 0) DIR_StepZ =  1 ;
 else DIR_StepZ =  0 ;

 SV.dx = abs(SV.dx);
 SV.dz = abs(SV.dz);

 if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
 else d2 = 2* (SV.dx - SV.dz);

 STPS[X].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse[1]();
 break;
 case yz:
 AxisPulse[1] = &YZ_Interpolate;
 axis_xyz = yz;
 Multi_Axis_Enable(axis_xyz);


 SV.dy = newx - SV.pz;
 SV.dz = newy - SV.py;


 SV.diry = SV.dy > 0?1:-1;
 SV.dirz = SV.dz > 0?1:-1;


 if(SV.diry < 0)DIR_StepY =  1 ;
 else DIR_StepY =  0 ;
 if(SV.dirz < 0) DIR_StepZ =  1 ;
 else DIR_StepZ =  0 ;

 SV.dy = abs(SV.dy);
 SV.dz = abs(SV.dz);

 if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
 else d2 = 2* (SV.dy - SV.dz);

 STPS[Y].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse[1]();
 break;
 default: break;

 }
}




void XY_Interpolate(){

 if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
 StopX();
 StopY();
 return;
 }

 if(SV.dx > SV.dy){
 Step_Cycle(X);
 if(SV.d2 < 0){
 SV.d2 += 2*SV.dy;
 }else{
 SV.d2 += 2 * (SV.dy - SV.dx);
 Step_Cycle(Y);
 }
 }else{
 Step_Cycle(Y);
 if(SV.d2 < 0){
 SV.d2 += 2 * SV.dx;
 }else{
 SV.d2 += 2 * (SV.dx - SV.dy);
 Step_Cycle(X);
 }
 }
}

void XZ_Interpolate(){

 if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
 StopX();
 StopZ();

 return;
 }

 if(SV.dx > SV.dz){
 Step_Cycle(X);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dx);
 Step_Cycle(Z);
 }

 }else{
 Step_Cycle(Z);
 if(d2 < 0)
 d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dz);
 Step_Cycle(X);
 }
 }
}

void YZ_Interpolate(){
 if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
 StopY();
 StopZ();
 return;
 }

 if(SV.dy > SV.dz){
 Step_Cycle(Y);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dy);
 Step_Cycle(Z);
 }
 }else{
 Step_Cycle(Z);
 if(d2 < 0)
 d2 += 2 * SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dz);
 Step_Cycle(Y);
 }
 }

}




void r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k){
uint8_t char_counter = 0;
char letter;
float value;
int int_value;

uint16_t modal_group_words = 0;
uint8_t axis_words = 0;

float inverse_feed_rate = -1;
uint8_t absolute_override =  0 ;
uint8_t non_modal_action =  0 ;
float target[ 6 ];
float offset[ 6 ];
float x = 0.00;
float y = 0.00;
float h_x2_div_d = 0.00;
uint8_t isclockwise = 0;

 gc.position[X] = xCur;
 gc.position[Y] = yCur;
 target[X] = xFin;
 target[Y] = yFin;
 offset[X] = i;
 offset[Y] = j;
 gc.plane_axis_0 = X;
 gc.plane_axis_1 = Y;
 gc.plane_axis_2 = Z;
 if (r != 0) {
#line 359 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 x = target[gc.plane_axis_0]-gc.position[gc.plane_axis_0];
 y = target[gc.plane_axis_1]-gc.position[gc.plane_axis_1];

  memset(offset, 0, sizeof(offset)) ;


 h_x2_div_d = 4 * r*r - x*x - y*y;


 h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y);

 if (gc.motion_mode ==  3 ) { h_x2_div_d = -h_x2_div_d; }
#line 393 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 if (r < 0) {
 h_x2_div_d = -h_x2_div_d;
 r = -r;
 }

 offset[gc.plane_axis_0] = 0.5*(x-(y*h_x2_div_d));
 offset[gc.plane_axis_1] = 0.5*(y+(x*h_x2_div_d));

 } else {


 r = hypot(offset[X], offset[Y]);
 SerialPrint(r);
 }


 isclockwise =  0 ;
 if (gc.motion_mode ==  2 ) { isclockwise =  1 ; }


 gc.inverse_feed_rate_mode = 1;
 mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
  250.0 , gc.inverse_feed_rate_mode,
 r, isclockwise);
}



void mc_arc(float *position, float *target, float *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise){

 float center_axis0 = position[X] + offset[X];
 float center_axis1 = position[Y] + offset[Y];
 float linear_travel = target[X] - position[X];
 float r_axis0 = -offset[X];
 float r_axis1 = -offset[Y];
 float rt_axis0 = target[X] - center_axis0;
 float rt_axis1 = target[Y] - center_axis1;
 float theta_per_segment = 0.00;
 float linear_per_segment = 0.00;
 float millimeters_of_travel = 0.00;
 uint16_t segments = 0;
 float cos_T = 0.00;
 float sin_T = 0.00;

 float arc_target[3];
 float sin_Ti;
 float cos_Ti;
 float r_axisi;
 uint16_t i;
 int8_t count = 0;
 float nPx,nPy;

 float angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
 if (isclockwise) {
 if (angular_travel >= 0) { angular_travel -= 2* 3.1416 ; }
 } else {
 if (angular_travel <= 0) { angular_travel += 2* 3.1416 ; }
 }
 SerialPrint(angular_travel);
 SerialPrint(linear_travel);
 millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
 if (millimeters_of_travel == 0.0) { return; }
 SerialPrint(millimeters_of_travel);
 segments = floor(millimeters_of_travel/ 0.1 );
 SerialPrint(segments);



 if (invert_feed_rate) { feed_rate *= segments; }
 angular_travel = angular_travel *  (180.00/ 3.141593 ) ;
 theta_per_segment = angular_travel/segments;
 SerialPrint(theta_per_segment);
 linear_per_segment = linear_travel/segments;
 SerialPrint(linear_per_segment);
#line 493 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 cos_T = 1-0.5*theta_per_segment*theta_per_segment;
 SerialPrint(cos_T);
 sin_T = theta_per_segment;
 SerialPrint(sin_T);

 nPx = arc_target[X] = position[X];
 nPy = arc_target[Y] = position[Y];
 for (i = 1; i<segments; i++) {
 SerialPrint((float)i);
 if (count < settings.n_arc_correction) {

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
 SerialPrint(nPx);
 SerialPrint(nPy);
 while(1){
 if(!OC5IE_bit && !OC2IE_bit)
 break;
 }
#line 538 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 STPS[X].mmToTravel = calcSteps(nPx,8.06);

 STPS[Y].mmToTravel = calcSteps(nPy,8.06);

 STPS[X].step_delay = 100;
 STPS[Y].step_delay = 100;
 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);



 }


}

float hypot(float angular_travel, float linear_travel){
 return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}

void SerialPrint(float r){
int str_len = 0;
int str_lenA = 0;
 str_lenA = strlen(txtA);
 memset(txtB,0,30);

 sprintf(txt,"%0.2f",r);
 strncpy(txtB, " ",strlen(txt));
 strncat(txtB, txt,strlen(txt));
 str_len += strlen(txt);
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;
#line 625 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 UART2_Write_Text(txtB);
#line 634 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
}
