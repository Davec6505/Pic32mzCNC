#ifndef CORETIMER_H
#define CORETIMER_H

   #include <stdint.h>
   #include <stdbool.h>
   

#define CORE_TIMER_FREQUENCY    (100000000U)

typedef struct
{
    uint32_t start;
    uint32_t count;
}CORETIMER_TIMEOUT;

//MikroC is not typically 32bit integer even though pic32mz is 32bit, be careful of type defines, 
// make sure they are explicit in their type, e.g., using UL for unsigned long constants
#define CORE_TIMER_INTERRUPT_PERIOD_VALUE     10000000UL
#define CORE_TIMER_INTERRUPT_PERIOD_IN_US     10000

typedef void (*CORETIMER_CALLBACK)(uint32_t status, uintptr_t context);

typedef struct
{
    CORETIMER_CALLBACK  callback;
    uintptr_t           context;
    uint32_t            tickCounter;
    uint32_t            period;
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
bool CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout);

void CORETIMER_DelayMs(uint32_t delay_ms);
void CORETIMER_DelayUs(uint32_t delay_us);


bool CORETIMER_CompareHasExpired(void);
void CORETIMER_InterruptHandler(void);

#endif // CORETIMER_H

/*
uint32_t CORETIMER_GetTickCounter(void);
void CORETIMER_StartTimeOut (CORETIMER_TIMEOUT* timeout, uint32_t delay_ms);
void CORETIMER_ResetTimeOut (CORETIMER_TIMEOUT* timeout);
bool CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout);

*/