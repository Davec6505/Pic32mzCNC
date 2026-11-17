_CORETIMER_Initialize:
;coretimer.c,21 :: 		void CORETIMER_Initialize(void)
;coretimer.c,23 :: 		uint32_t cp0_ = 0UL;
; cp0_ start address is: 16 (R4)
MOVZ	R4, R0, R0
;coretimer.c,27 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,30 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;coretimer.c,33 :: 		CP0_SET(CP0_COUNT, cp0_);
MOVZ	R2, R4, R0
; cp0_ end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,35 :: 		CP0_SET(CP0_COMPARE, compareValue);
LW	R2, Offset(_compareValue+0)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,38 :: 		cp0_ =  CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
;coretimer.c,39 :: 		CP0_SET(CP0_CAUSE, cp0_ );
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,42 :: 		IPC0bits.CTIP = 0x1;
ORI	R3, R0, 1
LBU	R2, Offset(IPC0bits+0)(GP)
INS	R2, R3, 2, 3
SB	R2, Offset(IPC0bits+0)(GP)
;coretimer.c,43 :: 		IPC0bits.CTIS = 0x0;
ORI	R2, R0, 3
SB	R2, Offset(IPC0bits+4)(GP)
;coretimer.c,45 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;coretimer.c,47 :: 		IFS0SET = 0;
SW	R0, Offset(IFS0SET+0)(GP)
;coretimer.c,48 :: 		}
L_end_CORETIMER_Initialize:
JR	RA
NOP	
; end of _CORETIMER_Initialize
_CORETIMER_Start:
;coretimer.c,51 :: 		void CORETIMER_Start(void)
;coretimer.c,54 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,57 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;coretimer.c,60 :: 		CP0_SET(CP0_COUNT, 0UL);
MOVZ	R2, R0, R0
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;coretimer.c,62 :: 		CP0_SET(CP0_COMPARE, compareValue);
LW	R2, Offset(_compareValue+0)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,64 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,67 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;coretimer.c,68 :: 		}
L_end_CORETIMER_Start:
JR	RA
NOP	
; end of _CORETIMER_Start
_CORETIMER_Stop:
;coretimer.c,70 :: 		void CORETIMER_Stop(void)
;coretimer.c,72 :: 		CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;coretimer.c,73 :: 		}
L_end_CORETIMER_Stop:
JR	RA
NOP	
; end of _CORETIMER_Stop
_CORETIMER_CounterGet:
;coretimer.c,75 :: 		uint32_t CORETIMER_CounterGet(void)
;coretimer.c,77 :: 		return CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
;coretimer.c,78 :: 		}
L_end_CORETIMER_CounterGet:
JR	RA
NOP	
; end of _CORETIMER_CounterGet
_CORETIMER_CompareSet:
;coretimer.c,81 :: 		void CORETIMER_CompareSet(uint32_t compare)
;coretimer.c,83 :: 		CP0_SET(CP0_COMPARE, compare);
MOVZ	R2, R25, R0
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,84 :: 		}
L_end_CORETIMER_CompareSet:
JR	RA
NOP	
; end of _CORETIMER_CompareSet
_CORETIMER_DelayMs:
;coretimer.c,99 :: 		void CORETIMER_DelayMs(uint32_t delay_ms)
ADDIU	SP, SP, -4
;coretimer.c,104 :: 		endCount = 100000UL * delay_ms;   // 100 MHz / 1000
LUI	R2, 1
ORI	R2, R2, 34464
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,106 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;coretimer.c,108 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayMs0:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayMs10
NOP	
J	L_CORETIMER_DelayMs1
NOP	
L__CORETIMER_DelayMs10:
;coretimer.c,110 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayMs0
NOP	
L_CORETIMER_DelayMs1:
;coretimer.c,111 :: 		}
L_end_CORETIMER_DelayMs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayMs
_CORETIMER:
;coretimer.c,114 :: 		void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {
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
;coretimer.c,119 :: 		IFS0CLR = 1;
ORI	R2, R0, 1
SW	R2, Offset(IFS0CLR+0)(GP)
;coretimer.c,120 :: 		DI();
DI	R30
;coretimer.c,121 :: 		count      = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; count start address is: 16 (R4)
MOVZ	R4, R2, R0
;coretimer.c,122 :: 		newCompare = CP0_GET(CP0_COMPARE) + compareValue;
MFC0	R30, 11, 0
MOVZ	R3, R30, R0
LW	R2, Offset(_compareValue+0)(GP)
ADDU	R2, R3, R2
; newCompare start address is: 12 (R3)
MOVZ	R3, R2, R0
;coretimer.c,124 :: 		if((newCompare - count) > 50UL)
SUBU	R2, R2, R4
SLTIU	R2, R2, 51
BEQ	R2, R0, L__CORETIMER12
NOP	
J	L_CORETIMER2
NOP	
L__CORETIMER12:
; count end address is: 16 (R4)
;coretimer.c,126 :: 		CP0_SET(CP0_COMPARE, newCompare);
MOVZ	R2, R3, R0
; newCompare end address is: 12 (R3)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,127 :: 		}
J	L_CORETIMER3
NOP	
L_CORETIMER2:
;coretimer.c,130 :: 		CP0_SET(CP0_COMPARE, count + 50UL);
; count start address is: 16 (R4)
ADDIU	R2, R4, 50
; count end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;coretimer.c,131 :: 		}
L_CORETIMER3:
;coretimer.c,132 :: 		EI();
EI	R30
;coretimer.c,133 :: 		LED4 = !LED4;
_LX	
EXT	R2, R2, BitPos(LED4+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED4+0), 1
_SX	
;coretimer.c,134 :: 		}
L_end_CORETIMER:
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
