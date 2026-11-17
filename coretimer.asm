_LED4_Callback:
;coretimer.c,23 :: 		void LED4_Callback(uint32_t status, uintptr_t context){
;coretimer.c,24 :: 		LED4 = !LED4;
_LX	
EXT	R2, R2, BitPos(LED4+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED4+0), 1
_SX	
;coretimer.c,25 :: 		}
L_end_LED4_Callback:
JR	RA
NOP	
; end of _LED4_Callback
_CORETIMER_Initialize:
;coretimer.c,27 :: 		void CORETIMER_Initialize(void)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;coretimer.c,29 :: 		uint32_t cp0_ = 0UL;
SW	R25, 4(SP)
SW	R26, 8(SP)
; cp0_ start address is: 16 (R4)
MOVZ	R4, R0, R0
;coretimer.c,30 :: 		coreTmr.callback = NULL;
SW	R0, Offset(coretimer_coreTmr+0)(GP)
;coretimer.c,31 :: 		coreTmr.context = 0;
SW	R0, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,32 :: 		coreTmr.tickCounter = 0;
SW	R0, Offset(coretimer_coreTmr+8)(GP)
;coretimer.c,33 :: 		coreTmr.period = CORE_TIMER_INTERRUPT_PERIOD_VALUE;
LUI	R2, 152
ORI	R2, R2, 38528
SW	R2, Offset(coretimer_coreTmr+12)(GP)
;coretimer.c,34 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,37 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;coretimer.c,40 :: 		CP0_SET(CP0_COUNT, cp0_);
MOVZ	R2, R4, R0
; cp0_ end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,42 :: 		CP0_SET(CP0_COMPARE, coreTmr.period);
LW	R2, Offset(coretimer_coreTmr+12)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,45 :: 		cp0_ =  CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
;coretimer.c,46 :: 		CP0_SET(CP0_CAUSE, cp0_ );
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,49 :: 		IPC0bits.CTIP = 0x1;
ORI	R3, R0, 1
LBU	R2, Offset(IPC0bits+0)(GP)
INS	R2, R3, 2, 3
SB	R2, Offset(IPC0bits+0)(GP)
;coretimer.c,50 :: 		IPC0bits.CTIS = 0x0;
ORI	R2, R0, 3
SB	R2, Offset(IPC0bits+4)(GP)
;coretimer.c,52 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;coretimer.c,54 :: 		IFS0SET = 0;
SW	R0, Offset(IFS0SET+0)(GP)
;coretimer.c,56 :: 		CORETIMER_CallbackSet(LED4_Callback, 0);
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_LED4_Callback+0)
ORI	R25, R25, lo_addr(_LED4_Callback+0)
JAL	_CORETIMER_CallbackSet+0
NOP	
;coretimer.c,57 :: 		}
L_end_CORETIMER_Initialize:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _CORETIMER_Initialize
_CORETIMER_CallbackSet:
;coretimer.c,59 :: 		void CORETIMER_CallbackSet ( CORETIMER_CALLBACK callback, uintptr_t context ){
;coretimer.c,60 :: 		coreTmr.callback = callback;
SW	R25, Offset(coretimer_coreTmr+0)(GP)
;coretimer.c,61 :: 		coreTmr.context = context;
SW	R26, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,62 :: 		}
L_end_CORETIMER_CallbackSet:
JR	RA
NOP	
; end of _CORETIMER_CallbackSet
_CORETIMER_Start:
;coretimer.c,65 :: 		void CORETIMER_Start(void)
;coretimer.c,68 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,71 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;coretimer.c,74 :: 		CP0_SET(CP0_COUNT, 0UL);
MOVZ	R2, R0, R0
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,76 :: 		CP0_SET(CP0_COMPARE, coreTmr.period);
LW	R2, Offset(coretimer_coreTmr+12)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,78 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,81 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;coretimer.c,82 :: 		}
L_end_CORETIMER_Start:
JR	RA
NOP	
; end of _CORETIMER_Start
_CORETIMER_Stop:
;coretimer.c,84 :: 		void CORETIMER_Stop(void)
;coretimer.c,86 :: 		CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,87 :: 		}
L_end_CORETIMER_Stop:
JR	RA
NOP	
; end of _CORETIMER_Stop
_CORETIMER_CounterGet:
;coretimer.c,89 :: 		uint32_t CORETIMER_CounterGet(void)
;coretimer.c,91 :: 		return CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
;coretimer.c,92 :: 		}
L_end_CORETIMER_CounterGet:
JR	RA
NOP	
; end of _CORETIMER_CounterGet
_CORETIMER_CompareSet:
;coretimer.c,95 :: 		void CORETIMER_CompareSet(uint32_t compare)
;coretimer.c,97 :: 		CP0_SET(CP0_COMPARE, compare);
MOVZ	R2, R25, R0
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,98 :: 		}
L_end_CORETIMER_CompareSet:
JR	RA
NOP	
; end of _CORETIMER_CompareSet
_CORETIMER_DelayMs:
;coretimer.c,113 :: 		void CORETIMER_DelayMs(uint32_t delay_ms)
ADDIU	SP, SP, -4
;coretimer.c,118 :: 		endCount = 100000UL * delay_ms;   // 100 MHz / 1000
LUI	R2, 1
ORI	R2, R2, 34464
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,120 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;coretimer.c,122 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayMs0:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayMs15
NOP	
J	L_CORETIMER_DelayMs1
NOP	
L__CORETIMER_DelayMs15:
;coretimer.c,124 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayMs0
NOP	
L_CORETIMER_DelayMs1:
;coretimer.c,125 :: 		}
L_end_CORETIMER_DelayMs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayMs
_CORETIMER_DelayUs:
;coretimer.c,127 :: 		void CORETIMER_DelayUs(uint32_t delay_us)
ADDIU	SP, SP, -4
;coretimer.c,132 :: 		endCount = 100UL * delay_us;   // 100 MHz / 1000000
ORI	R2, R0, 100
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,134 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;coretimer.c,136 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayUs2:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayUs17
NOP	
J	L_CORETIMER_DelayUs3
NOP	
L__CORETIMER_DelayUs17:
;coretimer.c,138 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayUs2
NOP	
L_CORETIMER_DelayUs3:
;coretimer.c,139 :: 		}
L_end_CORETIMER_DelayUs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayUs
_CORETIMER:
;coretimer.c,142 :: 		void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {
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
;coretimer.c,146 :: 		uint32_t status = IFS0bits.CTIF;
LBU	R2, Offset(IFS0bits+0)(GP)
EXT	R2, R2, 0, 1
; status start address is: 16 (R4)
MOVZ	R4, R2, R0
;coretimer.c,148 :: 		IFS0CLR = 1;
ORI	R2, R0, 1
SW	R2, Offset(IFS0CLR+0)(GP)
;coretimer.c,150 :: 		DI();
DI	R30
;coretimer.c,151 :: 		count      = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; count start address is: 20 (R5)
MOVZ	R5, R2, R0
;coretimer.c,152 :: 		newCompare = CP0_GET(CP0_COMPARE) + coreTmr.period;
MFC0	R30, 11, 0
MOVZ	R3, R30, R0
LW	R2, Offset(coretimer_coreTmr+12)(GP)
ADDU	R2, R3, R2
; newCompare start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,154 :: 		if((newCompare - count) > 50UL)
SUBU	R2, R2, R5
SLTIU	R2, R2, 51
BEQ	R2, R0, L__CORETIMER19
NOP	
J	L_CORETIMER4
NOP	
L__CORETIMER19:
; count end address is: 20 (R5)
;coretimer.c,156 :: 		CP0_SET(CP0_COMPARE, newCompare);
MOVZ	R2, R3, R0
; newCompare end address is: 12 (R3)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,157 :: 		}
J	L_CORETIMER5
NOP	
L_CORETIMER4:
;coretimer.c,160 :: 		CP0_SET(CP0_COMPARE, count + 50UL);
; count start address is: 20 (R5)
ADDIU	R2, R5, 50
; count end address is: 20 (R5)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,161 :: 		}
L_CORETIMER5:
;coretimer.c,162 :: 		EI();
EI	R30
;coretimer.c,165 :: 		coreTmr.tickCounter++;
LW	R2, Offset(coretimer_coreTmr+8)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(coretimer_coreTmr+8)(GP)
;coretimer.c,166 :: 		if(coreTmr.callback != NULL)
LW	R2, Offset(coretimer_coreTmr+0)(GP)
BNE	R2, R0, L__CORETIMER21
NOP	
J	L_CORETIMER6
NOP	
L__CORETIMER21:
;coretimer.c,168 :: 		uintptr_t context = coreTmr.context;
; context start address is: 8 (R2)
LW	R2, Offset(coretimer_coreTmr+4)(GP)
;coretimer.c,169 :: 		coreTmr.callback(status, context);
MOVZ	R26, R2, R0
; context end address is: 8 (R2)
MOVZ	R25, R4, R0
; status end address is: 16 (R4)
LW	R30, Offset(coretimer_coreTmr+0)(GP)
JALR	RA, R30
NOP	
;coretimer.c,170 :: 		}
L_CORETIMER6:
;coretimer.c,171 :: 		LED3 = !LED3;
_LX	
EXT	R2, R2, BitPos(LED3+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED3+0), 1
_SX	
;coretimer.c,172 :: 		}
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
