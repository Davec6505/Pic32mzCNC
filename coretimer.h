#ifndef CORETIMER_H
#define CORETIMER_H

   #include <stdint.h>
   #include <stdbool.h>
   

void CORETIMER_Initialize(void);
void CORETIMER_Start(void);
void CORETIMER_Stop(void);
uint32_t CORETIMER_CounterGet(void);
void CORETIMER_CompareSet(uint32_t compare);
void CORETIMER_DelayMs(uint32_t delay_ms);
void CORETIMER_DelayUs(uint32_t delay_us);
void CORETIMER_CompareHasExpired(void);
void CORETIMER_InterruptHandler(void);

#endif // CORETIMER_H