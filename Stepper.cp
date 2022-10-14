#line 1 "C:/Users/Git/Pic32mzCNC/Stepper.c"
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
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 20 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 32 "c:/users/git/pic32mzcnc/steptodistance.h"
long calcSteps( double mmsToMove, double Dia);
long leadscrew_sets(double move_distance);
long belt_steps(double move_distance);
double mm2in(double mm);
double in2mm(double inch);
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
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 54 "c:/users/git/pic32mzcnc/gcode.h"
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
#line 38 "c:/users/git/pic32mzcnc/kinematics.h"
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

 char master: 1;
}STP;
extern STP STPS[ 6 ];







typedef struct {
 double steps_per_mm[3];
 uint8_t microsteps;
 uint8_t pulse_microseconds;
 double default_feed_rate;
 double default_seek_rate;
 uint8_t invert_mask;
 double mm_per_arc_segment;
 double acceleration;
 double junction_deviation;
 uint8_t flags;
 uint8_t homing_dir_mask;
 double homing_feed_rate;
 double homing_seek_rate;
 uint16_t homing_debounce_delay;
 double homing_pulloff;
 uint8_t stepper_idle_lock_time;
 uint8_t decimal_places;
 uint8_t n_arc_correction;
<<<<<<< HEAD

} settings_t;
extern settings_t settings;
=======
>>>>>>> patch2

} settings_t;
extern settings_t settings;




void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);

<<<<<<< HEAD
<<<<<<< HEAD

void mc_arc(float *position, float *target, float *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise);
=======
void mc_arc(double *position, double *target, double *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise);
>>>>>>> patch2
=======
void mc_arc(double *position, double *target, double *offset, uint8_t axis_0, uint8_t axis_1,
 uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise);
>>>>>>> patch2
float hypot(float angular_travel, float linear_travel);
void SerialPrint(float r);
void r_or_ijk(double xCur,double yCur,double xFin,double yFin,double r, double i, double j, double k,int axis_xyz);
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
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
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 15 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 56 "c:/users/git/pic32mzcnc/stepper.h"
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
void multiToggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);


 void Test_CycleX();
 void Test_CycleY();
 void Test_CycleZ();
 void Test_CycleA();
#line 3 "C:/Users/Git/Pic32mzCNC/Stepper.c"
char txt_A[9];



_axis_ _axis;
axis_combination axis_xyz;

unsigned char AxisNo;
unsigned int Toggle;




 sVars SV;
 StepTmr STmr;




void SetPinMode(){


 EN_Step_PinDirX = 0;
 DIR_Step_PinDirX = 0;






 EN_Step_PinDirY = 0;
 DIR_Step_PinDirY = 0;






 EN_Step_PinDirZ = 0;
 DIR_Step_PinDirZ = 0;






 EN_Step_PinDirA = 0;
 DIR_Step_PinDirA = 0;




}



void StepperConstants(long accel,long decel){
 SV.acc = accel;
 SV.dec = decel;
}



void EnStepperX(){


 EN_StepX = 0;
}

void EnStepperY(){


 EN_StepY = 0;
}
void EnStepperZ(){


 EN_StepZ = 0;
}
void EnStepperA(){


 EN_StepA = 0;
}

void DisableStepper(){
 EN_StepX = 1;
 EN_StepY = 1;
 EN_StepZ = 1;
 EN_StepA = 1;
}
#line 111 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
int ii;
char txt_[9];

 if(mmSteps == 1){

 STPS[axis_No].accel_count = -1;
 STPS[axis_No].run_state =  2 ;
 STPS[axis_No].step_delay = 20000;
 SV.running = 1;

 }

 else if((mmSteps != 0)&&(abs(mmSteps) != 1)){



 STPS[axis_No].min_delay =  (long)(( (2*3.14159)/ 200 * 781250 )*100)  / speed;




 STPS[axis_No].step_delay = abs(( (long)(( 781250 *0.676)/100)  * sqrt_( (long)( (2*3.14159)/ 200 *2*10000000000)  / SV.acc))/100);
 STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;




 STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0* (2*3.14159)/ 200 *(double)SV.acc*100.0);




 if(STPS[axis_No].max_step_lim == 0){
 STPS[axis_No].max_step_lim = 1;
 }



 STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);


 if(STPS[axis_No].accel_lim == 0){
 STPS[axis_No].accel_lim = 1;
 }


 if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
 if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;
 else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
 }else{
 STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
 }

 if(mmSteps >= 0){
 if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
 else STPS[axis_No].decel_start = STPS[axis_No].accel_lim;
 }
 else {
 if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
 else STPS[axis_No].decel_start = STPS[axis_No].accel_lim;
 }

 if(STPS[axis_No].decel_val == 0){
 STPS[axis_No].decel_val = -1;
 }


 if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;
 STPS[axis_No].run_state =  3 ;
 }else{
 STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
 STPS[axis_No].run_state =  1 ;
 }

 }

 STPS[axis_No].step_count = 0;
 STPS[axis_No].rest = 0;
 STPS[axis_No].microSec = 0;
 STPS[axis_No].accel_count = 1;
 STPS[axis_No].dist = 0;
 SV.Tog = 0;
 SV.running = 1;

 sprintf(txt_,"%d",STPS[axis_No].mmToTravel);
 UART2_Write_Text(txt_);
 UART2_Write_Text(" : ");
 sprintf(txt_,"%d",STPS[axis_No].step_delay);
 UART2_Write_Text(txt_);
 UART2_Write_Text(" : ");
 sprintf(txt_,"%d",STPS[axis_No].min_delay);
 UART2_Write_Text(txt_);
 UART2_Write_Text(" : ");
 sprintf(txt_,"%d",STPS[axis_No].accel_lim);
 UART2_Write_Text(txt_);
 UART2_Write_Text(" : ");
 sprintf(txt_,"%d",STPS[axis_No].decel_start);
 UART2_Write_Text(txt_);
 UART2_Write(0x0D);
}








void Step_Cycle(int axis_No){
 toggleOCx(axis_No);
}



void toggleOCx(int axis_No){
 switch(axis_No){
 case X:
 OC5R = 0x5;
 OC5RS = STPS[X].step_delay & 0xFFFF;
 TMR2 = 0xFFFF;
 OC5CON = 0x8004;
 break;
 case Y:
 OC2R = 0x5;
 OC2RS = STPS[Y].step_delay & 0xFFFF;
 TMR4 = 0xFFFF;
 OC2CON = 0x8004;
 break;
 case Z:
 OC7R = 0x5;
 OC7RS = STPS[Z].step_delay & 0xFFFF;
 TMR6 = 0xFFFF;
 OC7CON = 0x8004;
 break;
 case A:
 OC3R = 0x5;
 OC3RS = STPS[A].step_delay & 0xFFFF;
 TMR5 = 0xFFFF;
 OC3CON = 0x800C;
 break;
 case B:
 OC6R = 0x5;
 OC6RS = STPS[B].step_delay & 0xFFFF;
 TMR3 = 0xFFFF;
 OC6CON = 0x800C;
 break;
 case C:
 OC8R = 0x5;
 OC8RS = STPS[C].step_delay & 0xFFFF;
 TMR7 = 0xFFFF;
 OC8CON = 0x800C;
 break;
 default:
 break;
 }

}



int Pulse(int axis_No){
#line 279 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 switch(STPS[axis_No].run_state) {
 case  0 :
 SV.Tog = 1;
 break;

 case  1 :
#line 289 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 AccDec(axis_No);
 if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){

 STPS[axis_No].step_delay = STPS[axis_No].min_delay;
 STPS[axis_No].run_state =  3 ;
 }
 if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
 STPS[axis_No].run_state =  3 ;
 }
 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;
 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  3 :
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;

 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;

 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  2 :
#line 321 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 AccDec(axis_No);



 if(STPS[axis_No].accel_count >= 0 ){
 STPS[axis_No].run_state =  0 ;
 }
 break;
 default:break;
 }
 return axis_No;
}



void AccDec(int axis_No){
 STPS[axis_No].accel_count++;
 STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
 STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
 STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;

}




void Single_Axis_Enable(_axis_ axis_){
 switch(axis_){
 case X:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 break;
 case Y:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 break;
 case Z:
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case A:
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case B:
 OC6IE_bit = 1;OC6CONbits.ON = 1;
 break;
 case C:
 OC8IE_bit = 1;OC8CONbits.ON = 1;
 break;
 default:
 break;
 }
}




void Multi_Axis_Enable(axis_combination axis){
 switch(axis){
 case xy:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 break;
 case xz:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case yz:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case xa:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case ya:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case za:
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 default:
 break;
 }
}

void disableOCx(){
 OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC2IE_bit = 0;OC2CONbits.ON = 0;
 OC7IE_bit = 0;OC7CONbits.ON = 0;

 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC6IE_bit = 0;OC6CONbits.ON = 0;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
}




void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
 STPS[X].step_count++;
 OC5IF_bit = 0;

 if(SV.Single_Dual == 0)
 SingleStepX();
<<<<<<< HEAD
 else
 AxisPulse[SV.Single_Dual]();
}

void SingleStepX(){
 if( (SV.Tog == 1)){
=======
 else{
 if(STPS[X].master = 1)
 AxisPulse[SV.Single_Dual]();
 }
}

void SingleStepX(){
 if((STPS[X].step_count >= STPS[X].dist) ){
>>>>>>> patch2
 StopX();
 }
 else{
 Step_Cycle(X);
 Pulse(X);
 }
}


void StopX(){
 OC5IE_bit = 0;
 OC5CONbits.ON = 0;
}





void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
 STPS[Y].step_count++;
 OC2IF_bit = 0;

 if(SV.Single_Dual == 0)
 SingleStepY();
<<<<<<< HEAD
 else
 AxisPulse[SV.Single_Dual]();
=======
 else {
 if(STPS[Y].master = 1)
 AxisPulse[SV.Single_Dual]();
 }
>>>>>>> patch2
}

void SingleStepY(){
 if( (SV.Tog == 1)){
 StopY();
 }
 else{
 Step_Cycle(Y);
 Pulse(Y);
 }
}

void StopY(){
 OC2IE_bit = 0;
 OC2CONbits.ON = 0;
}





void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
 STPS[Z].step_count++;
 OC7IF_bit = 0;

 if(SV.Single_Dual == 0)
 SingleStepZ();
 else
 AxisPulse[SV.Single_Dual]();

}

void SingleStepZ(){
 if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
 StopZ();
 }
 else{
 Step_Cycle(Z);
 Pulse(Z);
 }
}

void StopZ(){
 OC7IE_bit = 0;
 OC7CONbits.ON = 0;
}





void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
 STPS[A].step_count++;
 OC3IF_bit = 0;

 if(SV.Single_Dual == 0)
 SingleStepA();
 else
 AxisPulse[SV.Single_Dual]();

}

void SingleStepA(){
 if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
 StopA();
 }
 else{
 Step_Cycle(A);
 Pulse(A);
 }
}

void StopA(){
 OC3IE_bit = 0;
 OC3CONbits.ON = 0;
}



<<<<<<< HEAD
=======


>>>>>>> patch2
void XY_Interpolate(){

 if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy) ){
 StopX();
 StopY();
 UART2_Write_Text("Stopped");
 return;
 }

<<<<<<< HEAD
 if(SV.dx > SV.dy){
 Step_Cycle(X);
=======
 if(SV.dx >= SV.dy){
 Step_Cycle(X);
 Pulse(X);
>>>>>>> patch2
 if(SV.d2 < 0){
 SV.d2 += 2*SV.dy;
 }else{
 SV.d2 += 2 * (SV.dy - SV.dx);
 Step_Cycle(Y);
 }
 }else{
 Step_Cycle(Y);
<<<<<<< HEAD
=======
 Pulse(Y);
>>>>>>> patch2
 if(SV.d2 < 0){
 SV.d2 += 2 * SV.dx;
 }else{
 SV.d2 += 2 * (SV.dx - SV.dy);
 Step_Cycle(X);
 }
 }
}

void XZ_Interpolate(){

 if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
 StopX();
 StopZ();

 return;
 }

<<<<<<< HEAD
 if(SV.dx > SV.dz){
 Step_Cycle(X);
=======
 if(SV.dx >= SV.dz){
 Step_Cycle(X);
 Pulse(X);
>>>>>>> patch2
 if(SV.d2 < 0)
 SV.d2 += 2*SV.dz;
 else{
 SV.d2 += 2 * (SV.dz - SV.dx);
 Step_Cycle(Z);
 }

 }else{
 Step_Cycle(Z);
<<<<<<< HEAD
=======
 Pulse(Z);
>>>>>>> patch2
 if(SV.d2 < 0)
 SV.d2 += 2 * SV.dx;
 else{
 SV.d2 += 2 * (SV.dx - SV.dz);
 Step_Cycle(X);
 }
 }
}
void YZ_Interpolate(){
 if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz) ){
 StopY();
 StopZ();
 return;
 }

<<<<<<< HEAD
 if(SV.dy > SV.dz){
 Step_Cycle(Y);
=======
 if(SV.dy >= SV.dz){
 Step_Cycle(Y);
 Pulse(Y);
>>>>>>> patch2
 if(SV.d2 < 0)
 SV.d2 += 2*SV.dz;
 else{
 SV.d2 += 2 * (SV.dz - SV.dy);
 Step_Cycle(Z);
 }
 }else{
 Step_Cycle(Z);
<<<<<<< HEAD
=======
 Pulse(Z);
>>>>>>> patch2
 if(SV.d2 < 0)
 SV.d2 += 2 * SV.dy;
 else{
 SV.d2 += 2 * (SV.dy - SV.dz);
 Step_Cycle(Y);
 }
 }

}
<<<<<<< HEAD
#line 600 "C:/Users/Git/Pic32mzCNC/Stepper.c"
=======
#line 639 "C:/Users/Git/Pic32mzCNC/Stepper.c"
>>>>>>> patch2
unsigned int min_(unsigned int x, unsigned int y){
 if(x < y){
 return x;
 }
 else{
 return y;
 }
}
<<<<<<< HEAD
#line 617 "C:/Users/Git/Pic32mzCNC/Stepper.c"
=======
#line 656 "C:/Users/Git/Pic32mzCNC/Stepper.c"
>>>>>>> patch2
static unsigned long sqrt_(unsigned long x){

 register unsigned long xr;
 register unsigned long q2;
 register unsigned char f;

 xr = 0;
 q2 = 0x40000000L;
 do
 {
 if((xr + q2) <= x)
 {
 x -= xr + q2;
 f = 1;
 }
 else{
 f = 0;
 }
 xr >>= 1;
 if(f){
 xr += q2;
 }
 } while(q2 >>= 2);
 if(xr < x){
 return xr +1;
 }
 else{
 return xr;
 }
}
<<<<<<< HEAD
#line 671 "C:/Users/Git/Pic32mzCNC/Stepper.c"
=======
#line 710 "C:/Users/Git/Pic32mzCNC/Stepper.c"
>>>>>>> patch2
void CycleStop(){
int ii;
 STmr.uSec = 0;
 for(ii = 0;ii< 6 ;ii++){
 STPS[ii].microSec = 0;
 if(ii >  6 )break;
 }
}

void CycleStart(){
int ii;

 if(SV.Tog == 0){
 for(ii = 0; ii <  6 ;ii++){
 if(ii >  6 )break;
 STPS[ii].microSec++;
 }
 }
}
