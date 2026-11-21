_LED4_Callback:
;coretimer.c,25 :: 		void LED4_Callback(uint32_t status, uintptr_t context){
;coretimer.c,26 :: 		LED4 = !LED4;
_LX	
EXT	R2, R2, BitPos(LED4+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED4+0), 1
_SX	
;coretimer.c,27 :: 		}
L_end_LED4_Callback:
JR	RA
NOP	
; end of _LED4_Callback
_CORETIMER_Initialize:
;coretimer.c,31 :: 		void CORETIMER_Initialize(void)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;coretimer.c,33 :: 		uint32_t cp0_ = 0UL;
SW	R25, 4(SP)
SW	R26, 8(SP)
; cp0_ start address is: 16 (R4)
MOVZ	R4, R0, R0
;coretimer.c,34 :: 		coreTmr.callback = NULL;
SW	R0, Offset(coretimer_coreTmr+0)(GP)
;coretimer.c,35 :: 		coreTmr.context = 0;
SW	R0, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,36 :: 		coreTmr.tickCounter = 0;
SW	R0, Offset(coretimer_coreTmr+8)(GP)
;coretimer.c,37 :: 		coreTmr.period = CORE_TIMER_INTERRUPT_PERIOD_VALUE;
LUI	R2, 152
ORI	R2, R2, 38528
SW	R2, Offset(coretimer_coreTmr+12)(GP)
;coretimer.c,38 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,41 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064700)(GP)
;coretimer.c,44 :: 		CP0_SET(CP0_COUNT, cp0_);
MOVZ	R2, R4, R0
; cp0_ end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,46 :: 		CP0_SET(CP0_COMPARE, coreTmr.period);
LW	R2, Offset(coretimer_coreTmr+12)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,49 :: 		cp0_ =  CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
;coretimer.c,50 :: 		CP0_SET(CP0_CAUSE, cp0_ );
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,54 :: 		IPC0bits.CTIP = 0x1;
ORI	R3, R0, 1
LBU	R2, Offset(-1082064576)(GP)
INS	R2, R3, 2, 3
SB	R2, Offset(-1082064576)(GP)
;coretimer.c,55 :: 		IPC0bits.CTIS = 0x0;
ORI	R2, R0, 3
SB	R2, Offset(-1082064572)(GP)
;coretimer.c,57 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064696)(GP)
;coretimer.c,59 :: 		IFS0SET = 0;
SW	R0, Offset(-1082064824)(GP)
;coretimer.c,61 :: 		CORETIMER_CallbackSet(LED4_Callback, 0);
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_LED4_Callback+0)
ORI	R25, R25, lo_addr(_LED4_Callback+0)
JAL	_CORETIMER_CallbackSet+0
NOP	
;coretimer.c,62 :: 		}
L_end_CORETIMER_Initialize:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _CORETIMER_Initialize
_CORETIMER_CallbackSet:
;coretimer.c,67 :: 		void CORETIMER_CallbackSet ( CORETIMER_CALLBACK callback, uintptr_t context ){
;coretimer.c,68 :: 		coreTmr.callback = callback;
SW	R25, Offset(coretimer_coreTmr+0)(GP)
;coretimer.c,69 :: 		coreTmr.context = context;
SW	R26, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,70 :: 		}
L_end_CORETIMER_CallbackSet:
JR	RA
NOP	
; end of _CORETIMER_CallbackSet
_CORETIMER_Start:
;coretimer.c,74 :: 		void CORETIMER_Start(void)
;coretimer.c,77 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,80 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064700)(GP)
;coretimer.c,83 :: 		CP0_SET(CP0_COUNT, 0UL);
MOVZ	R2, R0, R0
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,85 :: 		CP0_SET(CP0_COMPARE, coreTmr.period);
LW	R2, Offset(coretimer_coreTmr+12)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,87 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,90 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064696)(GP)
;coretimer.c,91 :: 		}
L_end_CORETIMER_Start:
JR	RA
NOP	
; end of _CORETIMER_Start
_CORETIMER_Stop:
;coretimer.c,94 :: 		void CORETIMER_Stop(void)
;coretimer.c,96 :: 		CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,97 :: 		}
L_end_CORETIMER_Stop:
JR	RA
NOP	
; end of _CORETIMER_Stop
_CORETIMER_CounterGet:
;coretimer.c,101 :: 		uint32_t CORETIMER_CounterGet(void)
;coretimer.c,103 :: 		return CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
;coretimer.c,104 :: 		}
L_end_CORETIMER_CounterGet:
JR	RA
NOP	
; end of _CORETIMER_CounterGet
_CORETIMER_CompareSet:
;coretimer.c,108 :: 		void CORETIMER_CompareSet(uint32_t compare)
;coretimer.c,110 :: 		CP0_SET(CP0_COMPARE, compare);
MOVZ	R2, R25, R0
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,111 :: 		}
L_end_CORETIMER_CompareSet:
JR	RA
NOP	
; end of _CORETIMER_CompareSet
_CORETIMER_FrequencyGet:
;coretimer.c,115 :: 		uint32_t CORETIMER_FrequencyGet ( void )
;coretimer.c,117 :: 		return (CORE_TIMER_FREQUENCY);
LUI	R2, 1525
ORI	R2, R2, 57600
;coretimer.c,118 :: 		}
L_end_CORETIMER_FrequencyGet:
JR	RA
NOP	
; end of _CORETIMER_FrequencyGet
_CORETIMER_GetTickCounter:
;coretimer.c,124 :: 		uint32_t CORETIMER_GetTickCounter(void)
;coretimer.c,126 :: 		return coreTmr.tickCounter;
LW	R2, Offset(coretimer_coreTmr+8)(GP)
;coretimer.c,127 :: 		}
L_end_CORETIMER_GetTickCounter:
JR	RA
NOP	
; end of _CORETIMER_GetTickCounter
_CORETIMER_PeriodSet:
;coretimer.c,131 :: 		void CORETIMER_PeriodSet (uint32_t period)
;coretimer.c,133 :: 		coreTmr.period = period;
SW	R25, Offset(coretimer_coreTmr+12)(GP)
;coretimer.c,134 :: 		}
L_end_CORETIMER_PeriodSet:
JR	RA
NOP	
; end of _CORETIMER_PeriodSet
_CORETIMER_StartTimeOut:
;coretimer.c,139 :: 		void CORETIMER_StartTimeOut (CORETIMER_TIMEOUT* timeout, uint32_t delay_ms)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;coretimer.c,141 :: 		timeout->start = CORETIMER_GetTickCounter();
MOVZ	R2, R25, R0
SW	R2, 4(SP)
JAL	_CORETIMER_GetTickCounter+0
NOP	
LW	R3, 4(SP)
SW	R2, 0(R3)
;coretimer.c,142 :: 		timeout->count = (delay_ms*1000U)/CORE_TIMER_INTERRUPT_PERIOD_IN_US;
ADDIU	R4, R25, 4
ORI	R2, R0, 1000
MULTU	R26, R2
MFLO	R3
ORI	R2, R0, 10000
DIVU	R3, R2
MFLO	R2
SW	R2, 0(R4)
;coretimer.c,143 :: 		}
L_end_CORETIMER_StartTimeOut:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _CORETIMER_StartTimeOut
_CORETIMER_ResetTimeOut:
;coretimer.c,148 :: 		void CORETIMER_ResetTimeOut (CORETIMER_TIMEOUT* timeout)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;coretimer.c,150 :: 		timeout->start = CORETIMER_GetTickCounter();
MOVZ	R2, R25, R0
SW	R2, 4(SP)
JAL	_CORETIMER_GetTickCounter+0
NOP	
LW	R3, 4(SP)
SW	R2, 0(R3)
;coretimer.c,151 :: 		}
L_end_CORETIMER_ResetTimeOut:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _CORETIMER_ResetTimeOut
_CORETIMER_IsTimeoutReached:
;coretimer.c,157 :: 		bool CORETIMER_IsTimeoutReached (CORETIMER_TIMEOUT* timeout)
;coretimer.c,159 :: 		bool valTimeout  = true;
; valTimeout start address is: 16 (R4)
ORI	R4, R0, 1
;coretimer.c,160 :: 		if ((coreTmr.tickCounter - timeout->start) < timeout->count)
LW	R3, 0(R25)
LW	R2, Offset(coretimer_coreTmr+8)(GP)
SUBU	R3, R2, R3
ADDIU	R2, R25, 4
LW	R2, 0(R2)
SLTU	R2, R3, R2
BNE	R2, R0, L__CORETIMER_IsTimeoutReached24
NOP	
J	L__CORETIMER_IsTimeoutReached9
NOP	
L__CORETIMER_IsTimeoutReached24:
; valTimeout end address is: 16 (R4)
;coretimer.c,162 :: 		valTimeout = false;
; valTimeout start address is: 8 (R2)
MOVZ	R2, R0, R0
; valTimeout end address is: 8 (R2)
;coretimer.c,163 :: 		}
J	L_CORETIMER_IsTimeoutReached0
NOP	
L__CORETIMER_IsTimeoutReached9:
;coretimer.c,160 :: 		if ((coreTmr.tickCounter - timeout->start) < timeout->count)
ANDI	R2, R4, 255
;coretimer.c,163 :: 		}
L_CORETIMER_IsTimeoutReached0:
;coretimer.c,164 :: 		return valTimeout;
; valTimeout start address is: 8 (R2)
; valTimeout end address is: 8 (R2)
;coretimer.c,165 :: 		}
L_end_CORETIMER_IsTimeoutReached:
JR	RA
NOP	
; end of _CORETIMER_IsTimeoutReached
_CORETIMER_CompareHasExpired:
;coretimer.c,170 :: 		bool CORETIMER_CompareHasExpired( void )
;coretimer.c,172 :: 		bool flagStatus = 0;
; flagStatus start address is: 12 (R3)
MOVZ	R3, R0, R0
;coretimer.c,173 :: 		if (IFS0bits.CTIF != 0U)
LBU	R2, Offset(-1082064832)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__CORETIMER_CompareHasExpired27
NOP	
J	L__CORETIMER_CompareHasExpired10
NOP	
L__CORETIMER_CompareHasExpired27:
; flagStatus end address is: 12 (R3)
;coretimer.c,176 :: 		IFS0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064828)(GP)
;coretimer.c,177 :: 		flagStatus = 1;
; flagStatus start address is: 8 (R2)
ORI	R2, R0, 1
; flagStatus end address is: 8 (R2)
;coretimer.c,178 :: 		}
J	L_CORETIMER_CompareHasExpired1
NOP	
L__CORETIMER_CompareHasExpired10:
;coretimer.c,173 :: 		if (IFS0bits.CTIF != 0U)
ANDI	R2, R3, 255
;coretimer.c,178 :: 		}
L_CORETIMER_CompareHasExpired1:
;coretimer.c,179 :: 		return flagStatus;
; flagStatus start address is: 8 (R2)
; flagStatus end address is: 8 (R2)
;coretimer.c,180 :: 		}
L_end_CORETIMER_CompareHasExpired:
JR	RA
NOP	
; end of _CORETIMER_CompareHasExpired
_CORETIMER_DelayMs:
;coretimer.c,186 :: 		void CORETIMER_DelayMs(uint32_t delay_ms)
ADDIU	SP, SP, -4
;coretimer.c,191 :: 		endCount = 100000UL * delay_ms;   // 100 MHz / 1000
LUI	R2, 1
ORI	R2, R2, 34464
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,193 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;coretimer.c,195 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayMs2:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayMs29
NOP	
J	L_CORETIMER_DelayMs3
NOP	
L__CORETIMER_DelayMs29:
;coretimer.c,197 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayMs2
NOP	
L_CORETIMER_DelayMs3:
;coretimer.c,198 :: 		}
L_end_CORETIMER_DelayMs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayMs
_CORETIMER_DelayUs:
;coretimer.c,202 :: 		void CORETIMER_DelayUs(uint32_t delay_us)
ADDIU	SP, SP, -4
;coretimer.c,207 :: 		endCount = 100UL * delay_us;   // 100 MHz / 1000000
ORI	R2, R0, 100
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,209 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;coretimer.c,211 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayUs4:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayUs31
NOP	
J	L_CORETIMER_DelayUs5
NOP	
L__CORETIMER_DelayUs31:
;coretimer.c,213 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayUs4
NOP	
L_CORETIMER_DelayUs5:
;coretimer.c,214 :: 		}
L_end_CORETIMER_DelayUs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayUs
_CORETIMER:
;coretimer.c,219 :: 		void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 1024
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;coretimer.c,223 :: 		uint32_t status = IFS0bits.CTIF;
LBU	R2, Offset(-1082064832)(GP)
EXT	R2, R2, 0, 1
; status start address is: 16 (R4)
MOVZ	R4, R2, R0
;coretimer.c,225 :: 		IFS0CLR = 1;
ORI	R2, R0, 1
SW	R2, Offset(-1082064828)(GP)
;coretimer.c,227 :: 		DI();
DI	R30
;coretimer.c,228 :: 		count      = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; count start address is: 20 (R5)
MOVZ	R5, R2, R0
;coretimer.c,229 :: 		newCompare = CP0_GET(CP0_COMPARE) + coreTmr.period;
MFC0	R30, 11, 0
MOVZ	R3, R30, R0
LW	R2, Offset(coretimer_coreTmr+12)(GP)
ADDU	R2, R3, R2
; newCompare start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,231 :: 		if((newCompare - count) > 50UL)
SUBU	R2, R2, R5
SLTIU	R2, R2, 51
BEQ	R2, R0, L__CORETIMER33
NOP	
J	L_CORETIMER6
NOP	
L__CORETIMER33:
; count end address is: 20 (R5)
;coretimer.c,233 :: 		CP0_SET(CP0_COMPARE, newCompare);
MOVZ	R2, R3, R0
; newCompare end address is: 12 (R3)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,234 :: 		}
J	L_CORETIMER7
NOP	
L_CORETIMER6:
;coretimer.c,237 :: 		CP0_SET(CP0_COMPARE, count + 50UL);
; count start address is: 20 (R5)
ADDIU	R2, R5, 50
; count end address is: 20 (R5)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,238 :: 		}
L_CORETIMER7:
;coretimer.c,239 :: 		EI();
EI	R30
;coretimer.c,242 :: 		coreTmr.tickCounter++;
LW	R2, Offset(coretimer_coreTmr+8)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(coretimer_coreTmr+8)(GP)
;coretimer.c,243 :: 		if(coreTmr.callback != NULL)
LW	R2, Offset(coretimer_coreTmr+0)(GP)
BNE	R2, R0, L__CORETIMER35
NOP	
J	L_CORETIMER8
NOP	
L__CORETIMER35:
;coretimer.c,245 :: 		uintptr_t context = coreTmr.context;
; context start address is: 8 (R2)
LW	R2, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,246 :: 		coreTmr.callback(status, context);
MOVZ	R26, R2, R0
; context end address is: 8 (R2)
MOVZ	R25, R4, R0
; status end address is: 16 (R4)
LW	R30, Offset(coretimer_coreTmr+0)(GP)
JALR	RA, R30
NOP	
;coretimer.c,247 :: 		}
L_CORETIMER8:
;coretimer.c,249 :: 		}
L_end_CORETIMER:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _CORETIMER
