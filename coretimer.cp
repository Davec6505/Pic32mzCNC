#line 1 "c:/Users/davec/GIT/Pic32mzCNC/coretimer.c"
#line 1 "c:/users/davec/git/pic32mzcnc/coretimer.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdbool.h"



 typedef char _Bool;
#line 10 "c:/users/davec/git/pic32mzcnc/coretimer.h"
typedef struct
{
 uint32_t start;
 uint32_t count;
}CORETIMER_TIMEOUT;






typedef void (*CORETIMER_CALLBACK)(uint32_t status, uintptr_t context);

typedef struct
{
 CORETIMER_CALLBACK callback;
 uintptr_t context;
 uint32_t tickCounter;
 uint32_t period;
} CORETIMER_OBJECT ;



void CORETIMER_Initialize(void);
void CORETIMER_CallbackSet ( CORETIMER_CALLBACK callback, uintptr_t context );
void CORETIMER_Start(void);
void CORETIMER_Stop(void);

uint32_t CORETIMER_CounterGet(void);
void CORETIMER_CompareSet(uint32_t compare);
uint32_t CORETIMER_FrequencyGet (void);

void CORETIMER_PeriodSet (uint32_t period);
uint32_t CORETIMER_GetTickCounter(void);
void CORETIMER_StartTimeOut (CORETIMER_TIMEOUT* timeout, uint32_t delay_ms);
void CORETIMER_ResetTimeOut (CORETIMER_TIMEOUT* timeout);
 _Bool  CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout);

void CORETIMER_DelayMs(uint32_t delay_ms);
void CORETIMER_DelayUs(uint32_t delay_us);


 _Bool  CORETIMER_CompareHasExpired(void);
void CORETIMER_InterruptHandler(void);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/davec/git/pic32mzcnc/pins.h"
#line 15 "c:/users/davec/git/pic32mzcnc/pins.h"
extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;
extern sfr sbit LED3;
extern sfr sbit LED3_Dir;
extern sfr sbit LED4;
extern sfr sbit LED4_Dir;



extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;




extern sfr sbit EN_Steppers;
extern sfr sbit EN_Steppers_Dir;




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




extern sfr sbit SPI_Ethernet_CS;
extern sfr sbit SPI_Ethernet_CS_Direction;
extern sfr sbit SPI_Ethernet_Rst;
extern sfr sbit SPI_Ethernet_Rst_Direction;
#line 20 "c:/Users/davec/GIT/Pic32mzCNC/coretimer.c"
volatile static CORETIMER_OBJECT coreTmr;


void LED4_Callback(uint32_t status, uintptr_t context){
 LED4 = !LED4;
}



void CORETIMER_Initialize(void)
{
 uint32_t cp0_ = 0UL;
 coreTmr.callback =  ((void*)0) ;
 coreTmr.context = 0;
 coreTmr.tickCounter = 0;
 coreTmr.period =  10000000UL ;
 CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);


 IEC0CLR = 0x1;


 CP0_SET(CP0_COUNT, cp0_);

 CP0_SET(CP0_COMPARE, coreTmr.period);


 cp0_ = CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
 CP0_SET(CP0_CAUSE, cp0_ );


 IPC0bits.CTIP = 0x1;
 IPC0bits.CTIS = 0x0;

 IEC0SET = 0x1;

 IFS0SET = 0;

 CORETIMER_CallbackSet(LED4_Callback, 0);
}




void CORETIMER_CallbackSet ( CORETIMER_CALLBACK callback, uintptr_t context ){
 coreTmr.callback = callback;
 coreTmr.context = context;
}



void CORETIMER_Start(void)
{

 CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);


 IEC0CLR = 0x1;


 CP0_SET(CP0_COUNT, 0UL);

 CP0_SET(CP0_COMPARE, coreTmr.period);

 CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);


 IEC0SET = 0x1;
}


void CORETIMER_Stop(void)
{
 CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
}



uint32_t CORETIMER_CounterGet(void)
{
 return CP0_GET(CP0_COUNT);
}



void CORETIMER_CompareSet(uint32_t compare)
{
 CP0_SET(CP0_COMPARE, compare);
}



uint32_t CORETIMER_FrequencyGet ( void )
{
 return ( (100000000U) );
}




uint32_t CORETIMER_GetTickCounter(void)
{
 return coreTmr.tickCounter;
}



void CORETIMER_PeriodSet (uint32_t period)
{
 coreTmr.period = period;
}




void CORETIMER_StartTimeOut (CORETIMER_TIMEOUT* timeout, uint32_t delay_ms)
{
 timeout->start = CORETIMER_GetTickCounter();
 timeout->count = (delay_ms*1000U)/ 10000 ;
}




void CORETIMER_ResetTimeOut (CORETIMER_TIMEOUT* timeout)
{
 timeout->start = CORETIMER_GetTickCounter();
}





 _Bool  CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout)
{
  _Bool  valTimeout =  1 ;
 if ((coreTmr.tickCounter - timeout->start) < timeout->count)
 {
 valTimeout =  0 ;
 }
 return valTimeout;
}




 _Bool  CORETIMER_CompareHasExpired( void )
{
  _Bool  flagStatus = 0;
 if (IFS0bits.CTIF != 0U)
 {

 IFS0CLR = 0x1;
 flagStatus = 1;
 }
 return flagStatus;
}





void CORETIMER_DelayMs(uint32_t delay_ms)
{
 uint32_t startCount;
 uint32_t endCount;

 endCount = 100000UL * delay_ms;

 startCount = CP0_GET(CP0_COUNT);

 while((CP0_GET(CP0_COUNT) - startCount) < endCount)
 {
 }
}



void CORETIMER_DelayUs(uint32_t delay_us)
{
 uint32_t startCount;
 uint32_t endCount;

 endCount = 100UL * delay_us;

 startCount = CP0_GET(CP0_COUNT);

 while((CP0_GET(CP0_COUNT) - startCount) < endCount)
 {
 }
}




void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {

 unsigned long count;
 unsigned long newCompare;
 uint32_t status = IFS0bits.CTIF;

 IFS0CLR = 1;

 DI();
 count = CP0_GET(CP0_COUNT);
 newCompare = CP0_GET(CP0_COMPARE) + coreTmr.period;

 if((newCompare - count) > 50UL)
 {
 CP0_SET(CP0_COMPARE, newCompare);
 }
 else
 {
 CP0_SET(CP0_COMPARE, count + 50UL);
 }
 EI();


 coreTmr.tickCounter++;
 if(coreTmr.callback !=  ((void*)0) )
 {
 uintptr_t context = coreTmr.context;
 coreTmr.callback(status, context);
 }

}
