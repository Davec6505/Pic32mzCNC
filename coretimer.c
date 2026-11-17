#include "coretimer.h"
#include <stdint.h>
     #include "Pins.h"
/*
these are MikroC` CP0 register numbers for the PIC32 MIPS core
CP0_COUNT            value 4
CP0_COMPARE          value 6
CP0_CAUSE            value 16
CP0_CONFIG           value 24
these are actual CP0 register numbers for MIPS core
MIPS Count   = reg 9
MIPS Compare = reg 11
MIPS Cause   = reg 13
MIPS Config  = reg 16

*/

unsigned long compareValue = 10000000UL;


void CORETIMER_Initialize(void)
{
 uint32_t cp0_ = 0UL;


    // disable the Timer by setting DC bit of cause reg
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
    
    // clear the isr IE bit
    IEC0CLR = 0x1;
    
    // Clear the coretimer
    CP0_SET(CP0_COUNT, cp0_);
    // set the compare period
    CP0_SET(CP0_COMPARE, compareValue);

    // enable the counter / timer
    cp0_ =  CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
    CP0_SET(CP0_CAUSE, cp0_ );

    // set priority 1 sub 0
    IPC0bits.CTIP = 0x1;
    IPC0bits.CTIS = 0x0;
    //  enable isr
    IEC0SET = 0x1;
    // clear isr flag
    IFS0SET = 0;
}


void CORETIMER_Start(void)
{
    // disable the Timer by setting DC bit of cause reg
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);

    // clear the isr IE bit
    IEC0CLR = 0x1;

    // clear the core timer
    CP0_SET(CP0_COUNT, 0UL);
    // set the match period
    CP0_SET(CP0_COMPARE, compareValue);
    // Enable Timer by clearing Disable Count (DC) bit
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
    
    // set the isr enable bit
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


/*bool CORETIMER_CompareHasExpired( void )
{
    bool flagStatus = 0;
    if (IFS0bits.CTIF != 0U)
    {
       // Clear Compare Timer Interrupt Flag
       IFS0CLR = 0x1;
       flagStatus = 1;
    }
    return flagStatus;
}  */

void CORETIMER_DelayMs(uint32_t delay_ms)
{
    uint32_t startCount;
    uint32_t endCount;

    endCount = 100000UL * delay_ms;   // 100 MHz / 1000

    startCount = CP0_GET(CP0_COUNT);

    while((CP0_GET(CP0_COUNT) - startCount) < endCount)
    {
    }
}


void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {

    unsigned long count;
    unsigned long newCompare;

    IFS0CLR = 1;
    DI();
    count      = CP0_GET(CP0_COUNT);
    newCompare = CP0_GET(CP0_COMPARE) + compareValue;

    if((newCompare - count) > 50UL)
    {
        CP0_SET(CP0_COMPARE, newCompare);
    }
    else
    {
        CP0_SET(CP0_COMPARE, count + 50UL);
    }
    EI();
    LED4 = !LED4;
}