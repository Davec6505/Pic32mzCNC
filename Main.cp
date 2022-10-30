#line 1 "C:/Users/Git/Pic32mzCNC/Main.c"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
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
int dma_printf(char* str,...);
char * _itoa(int i, char *strout, int base);
char *_strrev (char *str);
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
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 50 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 uint8_t abort;
 uint8_t state;
 int8_t homing;
 uint8_t homing_cnt;
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
#line 134 "c:/users/git/pic32mzcnc/kinematics.h"
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


void Home_Axis(double distance,long speed,int axis);
void Inv_Home_Axis(double distance,long speed,int axis);
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
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
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/gcode.h"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/limits.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 28 "c:/users/git/pic32mzcnc/limits.h"
extern sbit TX0;
extern sbit TX1;
extern sbit TX2;
extern sbit TX3;

extern sbit TY0;
extern sbit TY1;
extern sbit TY2;
extern sbit TY3;

extern sbit TZ0;
extern sbit TZ1;
extern sbit TZ2;
extern sbit TZ3;

extern sbit TA0;
extern sbit TA1;
extern sbit TA2;
extern sbit TA3;



struct limits{

char X_Limit_Min: 1;
char Y_Limit_Min: 1;
char Z_Limit_Min: 1;
char A_Limit_Min: 1;
char X_Limit_Max: 1;
char Y_Limit_Max: 1;
char Z_Limit_Max: 1;
char A_Limit_Max: 1;

long X_Soft_Limit_Min;
long X_Soft_Limit_Max;
long Y_Soft_Limit_Min;
long Y_Soft_Limit_MAx;
long Z_Soft_Limit_Min;
long Z_Soft_Limit_MAx;
long A_Soft_Limit_Min;
long A_Soft_Limit_MAx;

unsigned int X_Min_DeBnc;
unsigned int Y_Min_DeBnc;
unsigned int Z_Min_DeBnc;
unsigned int A_Min_DeBnc;
};



extern struct limits Limits;


void Limit_Initialize();
void X_Min_Limit_Setup();
void Y_Min_Limit_Setup();
void Z_Min_Limit_Setup();
void A_Min_Limit_Setup();

char Test_X_Min();
char Test_Y_Min();
void Reset_X_Min_Limit();
void Reset_Y_Min_Limit();
void Debounce_X_Limits();
void Debounce_Y_Limits();
void Reset_X_Min_Debounce();
void Reset_Y_Min_Debounce();
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
#line 34 "C:/Users/Git/Pic32mzCNC/Main.c"
parser_state_t gc;
STP STPS[ 6 ];

char DMA_Buff[200];
char txt_[9];
bit testISR;
bit oneShotA; sfr;
bit oneShotB; sfr;
char uart_rd;

unsigned char LCD_01_ADDRESS = 0x4E;


unsigned int ii;
unsigned long testOcr;
static unsigned int a;




void main() {
char txt_[9];
static char oneshot = 0;
unsigned char j;
static unsigned int disable_steps = 0;
int xyz_ = 0, i;
static int cntr;
 PinMode();

 StepperConstants(15000,15000);
 oneShotA = 0;

 a=0;
 disable_steps = 0;
 disableOCx();
 DisableStepper();

 EnableInterrupts();
 while(1){

 if(!Toggle){
 LED1 = Limits.X_Limit_Min;
 if(disable_steps <=  10 )
 disable_steps = TMR.Reset( 10 ,disable_steps);
 if(LED1 && (oneshot == 0)){
 oneshot = 1;
 }else if(!LED1 && (oneshot == 1))
 oneshot = 0;

 }



 if(!SW2){
 Toggle = 0;
 disableOCx();
 }

 if((!SW1)&&(!Toggle)){
 LED1 = 0;
 Toggle = 1;
 disable_steps = 0;
 EnStepperX();
 EnStepperY();
 EnStepperZ();
 EnStepperA();
 cntr = 0;
 sys.homing = 1;
 sys.homing_cnt = 0;
 a = 10;
 }

 if(Toggle){

 if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
 Temp_Move(a);
 a++;
 if(a > 12)a=10;



 }
 if((Limits.X_Limit_Min)&&(sys.homing == 1)){
 sys.homing == -1;
 StopX();
 Delay_ms(200);
 }


 cntr++;
 if(cntr > 10000){

 dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
 a,STPS[X].step_count,STPS[X].axis_dir,
 STPS[X].steps_position);
#line 139 "C:/Users/Git/Pic32mzCNC/Main.c"
 cntr = 0;
 }

 }

 Debounce_X_Limits();
 Debounce_Y_Limits();
 }
}


void Temp_Move(int a){

 switch(a){
 case 0:
 STPS[X].mmToTravel = belt_steps(50.00);
 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
 SingleAxisStep(STPS[X].mmToTravel,X);
 break;
 case 1:
 STPS[Y].mmToTravel = belt_steps(50.00);
 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
 SingleAxisStep(STPS[Y].mmToTravel,Y);
 break;
 case 2:
 STPS[X].mmToTravel = belt_steps(-50.00);
 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
 SingleAxisStep(STPS[X].mmToTravel,X);
 break;
 case 3:
 STPS[Y].mmToTravel = belt_steps(-50.00);
 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
 SingleAxisStep(STPS[Y].mmToTravel,Y);
 break;
 case 4:
 STPS[X].mmToTravel = belt_steps(50.00);

 STPS[Y].mmToTravel = belt_steps(100.00);
 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
 break;
 case 5:
 STPS[X].mmToTravel = belt_steps(-50.00);

 STPS[Y].mmToTravel = belt_steps(-100.00);
 speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
 break;
 case 6:
 STPS[X].mmToTravel = belt_steps(150.00);
 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
 STPS[Y].mmToTravel = belt_steps(100.00);

 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
 break;
 case 7:
 STPS[X].mmToTravel = belt_steps(-150.00);
 speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
 STPS[Y].mmToTravel = belt_steps(-100.00);

 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
 break;
 case 8:
 STPS[A].mmToTravel = belt_steps(150.00);
 speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
#line 212 "C:/Users/Git/Pic32mzCNC/Main.c"
 SingleAxisStep(STPS[A].mmToTravel,A);
 break;
 case 9:



 r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y, 0 );
 break;
 case 10:
 Home_Axis(-300.00,500,X);
 break;
 case 11:
 Inv_Home_Axis(10.00,100,X);
 Delay_ms(1000);
 sys.homing = 1;
 break;
 case 12:

 break;
 default: a = 0;
 break;
 }
}

void LCD_Display(){




 sprintf(txt,"%d",STPS[0].accel_lim);
 I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);

 sprintf(txt,"%d",STPS[0].decel_start);
 I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);



 sprintf(txt,"%d",STPS[0].step_delay);
 I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);

 sprintf(txt,"%d",STPS[0].min_delay);
 I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);



 sprintf(txt,"%d",STPS[0].max_step_lim);
 I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);

 sprintf(txt,"%d",STPS[0].decel_val);
 I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
}
