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
#define NULL ((void*)0)

//unsigned long compareValue = 10000000UL;
volatile static CORETIMER_OBJECT coreTmr;


void LED4_Callback(uint32_t status, uintptr_t context){
   LED4 = !LED4;
}

/// @brief Initializes the core timer
/// @param None
void CORETIMER_Initialize(void)
{
 uint32_t cp0_ = 0UL;
    coreTmr.callback = NULL;
    coreTmr.context = 0;
    coreTmr.tickCounter = 0;
    coreTmr.period = CORE_TIMER_INTERRUPT_PERIOD_VALUE;
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
    
    // clear the isr IE bit
    IEC0CLR = 0x1;
    
    // Clear the coretimer
    CP0_SET(CP0_COUNT, cp0_);
    // set the compare period
    CP0_SET(CP0_COMPARE, coreTmr.period);

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

    CORETIMER_CallbackSet(LED4_Callback, 0);
}

/// @brief Sets the callback function and context for the core timer
/// @param callback The callback function to be called on core timer interrupt
/// @param context The context to be passed to the callback function
void CORETIMER_CallbackSet ( CORETIMER_CALLBACK callback, uintptr_t context ){
    coreTmr.callback = callback;
    coreTmr.context = context;
}

/// @brief Starts the core timer
/// @param None
void CORETIMER_Start(void)
{
    // disable the Timer by setting DC bit of cause reg
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);

    // clear the isr IE bit
    IEC0CLR = 0x1;

    // clear the core timer
    CP0_SET(CP0_COUNT, 0UL);
    // set the match period
    CP0_SET(CP0_COMPARE, coreTmr.period);
    // Enable Timer by clearing Disable Count (DC) bit
    CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
    
    // set the isr enable bit
    IEC0SET = 0x1;
}

/// @brief Stops the core timer
void CORETIMER_Stop(void)
{
    CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
}

/// @brief Gets the current value of the core timer counter
/// @return The current core timer counter value
uint32_t CORETIMER_CounterGet(void)
{
    return CP0_GET(CP0_COUNT);
}

/// @brief Sets the compare value for the core timer
/// @param compare The compare value to set
void CORETIMER_CompareSet(uint32_t compare)
{
    CP0_SET(CP0_COMPARE, compare);
}
    
/// @brief Gets the frequency of the core timer
/// @return The core timer frequency in Hz
uint32_t CORETIMER_FrequencyGet ( void )
{
    return (CORE_TIMER_FREQUENCY);
}

    
/// @brief Gets the current tick counter value of the core timer
/// @return The current tick counter value
uint32_t CORETIMER_GetTickCounter(void)
{
    return coreTmr.tickCounter;
}

/// @brief Sets the period of the core timer
/// @param period The period value to set for the core timer
void CORETIMER_PeriodSet (uint32_t period)
{
    coreTmr.period = period;
}

/// @brief Starts a timeout with the specified delay in milliseconds
/// @param timeout Pointer to the CORETIMER_TIMEOUT structure
/// @param delay_ms Delay in milliseconds
void CORETIMER_StartTimeOut (CORETIMER_TIMEOUT* timeout, uint32_t delay_ms)
{
    timeout->start = CORETIMER_GetTickCounter();
    timeout->count = (delay_ms*1000U)/CORE_TIMER_INTERRUPT_PERIOD_IN_US;
}
    

/// @brief Resets the specified timeout to start counting from the current tick
/// @param timeout Pointer to the CORETIMER_TIMEOUT structure
void CORETIMER_ResetTimeOut (CORETIMER_TIMEOUT* timeout)
{
    timeout->start = CORETIMER_GetTickCounter();
}

    
/// @brief Checks if the specified timeout has been reached
/// @param timeout Pointer to the CORETIMER_TIMEOUT structure
/// @return true if the timeout has been reached, false otherwise
bool CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout)
{
    bool valTimeout  = true;
    if ((coreTmr.tickCounter - timeout->start) < timeout->count)
    {
        valTimeout = false;
    }
    return valTimeout;
}

/// @brief Checks if the core timer compare event has expired
/// @param  None
/// @return true if the compare event has expired, false otherwise
bool CORETIMER_CompareHasExpired( void )
{
    bool flagStatus = 0;
    if (IFS0bits.CTIF != 0U)
    {
       // Clear Compare Timer Interrupt Flag
       IFS0CLR = 0x1;
       flagStatus = 1;
    }
    return flagStatus;
}  



/// @brief Delays execution for the specified number of milliseconds
/// @param delay_ms The delay duration in milliseconds
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

/// @brief Delays execution for the specified number of microseconds
/// @param delay_us The delay duration in microseconds
void CORETIMER_DelayUs(uint32_t delay_us)
{
    uint32_t startCount;
    uint32_t endCount;

    endCount = 100UL * delay_us;   // 100 MHz / 1000000

    startCount = CP0_GET(CP0_COUNT);

    while((CP0_GET(CP0_COUNT) - startCount) < endCount)
    {
    }
}


/// @brief Core timer interrupt service routine
/// @note This function is automatically called when the core timer interrupt occurs
void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {

    unsigned long count;
    unsigned long newCompare;
    uint32_t status = IFS0bits.CTIF;

    IFS0CLR = 1;
    //critical section start
    DI();
    count      = CP0_GET(CP0_COUNT);
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
    //critical section end

    coreTmr.tickCounter++;
    if(coreTmr.callback != NULL)
    {
        uintptr_t context = coreTmr.context;
        coreTmr.callback(status, context);
    }

}