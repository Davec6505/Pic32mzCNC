_PinMode:
;Config.c,17 :: 		void PinMode(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,20 :: 		DI();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
DI	R30
;Config.c,23 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,24 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,25 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(CFGCONbits+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(CFGCONbits+2)(GP)
;Config.c,26 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,29 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,30 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_PinMode0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PinMode0
NOP	
;Config.c,33 :: 		ANSELA = 0X0000;
SW	R0, Offset(ANSELA+0)(GP)
;Config.c,34 :: 		TRISA  = 0X0000;
SW	R0, Offset(TRISA+0)(GP)
;Config.c,35 :: 		ANSELB = 0X0000;
SW	R0, Offset(ANSELB+0)(GP)
;Config.c,36 :: 		TRISB  = 0X0000;
SW	R0, Offset(TRISB+0)(GP)
;Config.c,37 :: 		ANSELC = 0X0000;
SW	R0, Offset(ANSELC+0)(GP)
;Config.c,38 :: 		TRISC  = 0X0000;
SW	R0, Offset(TRISC+0)(GP)
;Config.c,39 :: 		ANSELD = 0X0000;
SW	R0, Offset(ANSELD+0)(GP)
;Config.c,40 :: 		TRISD  = 0X0000;
SW	R0, Offset(TRISD+0)(GP)
;Config.c,41 :: 		ANSELE = 0X0000;
SW	R0, Offset(ANSELE+0)(GP)
;Config.c,42 :: 		TRISE  = 0X0000;
SW	R0, Offset(TRISE+0)(GP)
;Config.c,43 :: 		ANSELG = 0X0000;
SW	R0, Offset(ANSELG+0)(GP)
;Config.c,44 :: 		TRISG  = 0X0000;
SW	R0, Offset(TRISG+0)(GP)
;Config.c,48 :: 		CNPUB  = 0;//1 << 15;
SW	R0, Offset(CNPUB+0)(GP)
;Config.c,49 :: 		CNPUF  = 0;//1 << 3;
SW	R0, Offset(CNPUF+0)(GP)
;Config.c,52 :: 		LED1_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED1_Dir+0), 1
_SX	
;Config.c,53 :: 		LED2_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED2_Dir+0), 1
_SX	
;Config.c,54 :: 		LED3_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED3_Dir+0), 1
_SX	
;Config.c,55 :: 		LED4_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED4_Dir+0), 1
_SX	
;Config.c,58 :: 		SW1_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW1_Dir+0)
_SX	
;Config.c,59 :: 		SW2_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW2_Dir+0)
_SX	
;Config.c,61 :: 		TRISG7_bit = 1;
LUI	R2, BitMask(TRISG7_bit+0)
ORI	R2, R2, BitMask(TRISG7_bit+0)
_SX	
;Config.c,62 :: 		TRISG8_bit = 1;
LUI	R2, BitMask(TRISG8_bit+0)
ORI	R2, R2, BitMask(TRISG8_bit+0)
_SX	
;Config.c,65 :: 		set_performance_mode();
JAL	_set_performance_mode+0
NOP	
;Config.c,68 :: 		Unlock_IOLOCK();
JAL	_Unlock_IOLOCK+0
NOP	
;Config.c,71 :: 		PPS_Mapping_NoLock(_RPC2, _OUTPUT, _U2TX);    // RC2 = UART2 TX
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 60
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,72 :: 		PPS_Mapping_NoLock(_RPC3, _INPUT,  _U2RX);    // RC3 = UART2 RX
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 44
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,85 :: 		PPS_Mapping_NoLock(_RPD2, _INPUT, _SDI1);
ORI	R27, R0, 9
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,86 :: 		PPS_Mapping_NoLock(_RPD3, _OUTPUT, _SDO1);
ORI	R27, R0, 5
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,89 :: 		PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //Spindle TMR7
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 38
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,94 :: 		Lock_IOLOCK();
JAL	_Lock_IOLOCK+0
NOP	
;Config.c,98 :: 		MM_Init();
JAL	_MM_Init+0
NOP	
;Config.c,102 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;Config.c,104 :: 		InitTimer8();
JAL	_InitTimer8+0
NOP	
;Config.c,108 :: 		Limit_Initialize();
JAL	_Limit_Initialize+0
NOP	
;Config.c,112 :: 		OutPutPulseXYZ();
JAL	_OutPutPulseXYZ+0
NOP	
;Config.c,113 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Config.c,117 :: 		SetInitialSizes(STPS);
LUI	R25, hi_addr(_STPS+0)
ORI	R25, R25, lo_addr(_STPS+0)
JAL	_SetInitialSizes+0
NOP	
;Config.c,121 :: 		Serial_Init(SERIAL_MODE_RX_IRQ_DMA_TX);
ORI	R25, R0, 2
JAL	_Serial_Init+0
NOP	
;Config.c,127 :: 		CORETIMER_Initialize();
JAL	_CORETIMER_Initialize+0
NOP	
;Config.c,128 :: 		CORETIMER_Start();
JAL	_CORETIMER_Start+0
NOP	
;Config.c,132 :: 		EnableInterrupts();
EI	R30
;Config.c,135 :: 		settings_init(0);
MOVZ	R25, R0, R0
JAL	_settings_init+0
NOP	
;Config.c,136 :: 		settings_init(1);
ORI	R25, R0, 1
JAL	_settings_init+0
NOP	
;Config.c,141 :: 		}
L_end_PinMode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _PinMode
_CORETIMER_Initialize:
;Config.c,156 :: 		void CORETIMER_Initialize(void)
;Config.c,158 :: 		uint32_t cp0_ = 0UL;
; cp0_ start address is: 16 (R4)
MOVZ	R4, R0, R0
;Config.c,161 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;Config.c,164 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;Config.c,167 :: 		CP0_SET(CP0_COUNT, cp0_);
MOVZ	R2, R4, R0
; cp0_ end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;Config.c,169 :: 		CP0_SET(CP0_COMPARE, compareValue);
LW	R2, Offset(_compareValue+0)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;Config.c,172 :: 		cp0_ =  CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK;
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
;Config.c,173 :: 		CP0_SET(CP0_CAUSE, cp0_ );
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;Config.c,176 :: 		IPC0bits.CTIP = 0x1;
ORI	R3, R0, 1
LBU	R2, Offset(IPC0bits+0)(GP)
INS	R2, R3, 2, 3
SB	R2, Offset(IPC0bits+0)(GP)
;Config.c,177 :: 		IPC0bits.CTIS = 0x0;
ORI	R2, R0, 3
SB	R2, Offset(IPC0bits+4)(GP)
;Config.c,179 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;Config.c,181 :: 		IFS0SET = 0;
SW	R0, Offset(IFS0SET+0)(GP)
;Config.c,182 :: 		}
L_end_CORETIMER_Initialize:
JR	RA
NOP	
; end of _CORETIMER_Initialize
_CORETIMER_Start:
;Config.c,185 :: 		void CORETIMER_Start(void)
;Config.c,188 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;Config.c,191 :: 		IEC0CLR = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0CLR+0)(GP)
;Config.c,194 :: 		CP0_SET(CP0_COUNT, 0UL);
MOVZ	R2, R0, R0
MOVZ	R30, R2, R0
MTC0	R30, 9, 0
;Config.c,196 :: 		CP0_SET(CP0_COMPARE, compareValue);
LW	R2, Offset(_compareValue+0)(GP)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;Config.c,198 :: 		CP0_SET(CP0_CAUSE, CP0_GET(CP0_CAUSE) & ~CP0_CAUSE_DC_MASK);
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 63487
ORI	R2, R2, 65535
AND	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;Config.c,201 :: 		IEC0SET = 0x1;
ORI	R2, R0, 1
SW	R2, Offset(IEC0SET+0)(GP)
;Config.c,202 :: 		}
L_end_CORETIMER_Start:
JR	RA
NOP	
; end of _CORETIMER_Start
_CORETIMER_Stop:
;Config.c,204 :: 		void CORETIMER_Stop(void)
;Config.c,206 :: 		CP0_SET( CP0_CAUSE, CP0_GET(CP0_CAUSE) | CP0_CAUSE_DC_MASK );
MFC0	R30, 13, 0
MOVZ	R3, R30, R0
LUI	R2, 2048
OR	R2, R3, R2
MOVZ	R30, R2, R0
MTC0	R30, 13, 0
;Config.c,207 :: 		}
L_end_CORETIMER_Stop:
JR	RA
NOP	
; end of _CORETIMER_Stop
_CORETIMER_CounterGet:
;Config.c,209 :: 		uint32_t CORETIMER_CounterGet(void)
;Config.c,211 :: 		return CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
;Config.c,212 :: 		}
L_end_CORETIMER_CounterGet:
JR	RA
NOP	
; end of _CORETIMER_CounterGet
_CORETIMER_CompareSet:
;Config.c,215 :: 		void CORETIMER_CompareSet(uint32_t compare)
;Config.c,217 :: 		CP0_SET(CP0_COMPARE, compare);
MOVZ	R2, R25, R0
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;Config.c,218 :: 		}
L_end_CORETIMER_CompareSet:
JR	RA
NOP	
; end of _CORETIMER_CompareSet
_CORETIMER_DelayMs:
;Config.c,233 :: 		void CORETIMER_DelayMs(uint32_t delay_ms)
ADDIU	SP, SP, -4
;Config.c,238 :: 		endCount = 100000UL * delay_ms;   // 100 MHz / 1000
LUI	R2, 1
ORI	R2, R2, 34464
MULTU	R2, R25
MFLO	R2
; endCount start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,240 :: 		startCount = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; startCount start address is: 16 (R4)
MOVZ	R4, R2, R0
; endCount end address is: 12 (R3)
; startCount end address is: 16 (R4)
SW	R4, 0(SP)
MOVZ	R4, R3, R0
LW	R3, 0(SP)
;Config.c,242 :: 		while((CP0_GET(CP0_COUNT) - startCount) < endCount)
L_CORETIMER_DelayMs2:
; startCount start address is: 12 (R3)
; endCount start address is: 16 (R4)
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
SUBU	R2, R2, R3
SLTU	R2, R2, R4
BNE	R2, R0, L__CORETIMER_DelayMs25
NOP	
J	L_CORETIMER_DelayMs3
NOP	
L__CORETIMER_DelayMs25:
;Config.c,244 :: 		}
; startCount end address is: 12 (R3)
; endCount end address is: 16 (R4)
J	L_CORETIMER_DelayMs2
NOP	
L_CORETIMER_DelayMs3:
;Config.c,245 :: 		}
L_end_CORETIMER_DelayMs:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CORETIMER_DelayMs
_CORETIMER:
;Config.c,248 :: 		void CORETIMER() iv IVT_CORE_TIMER ilevel 1 ics ICS_SRS {
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
;Config.c,253 :: 		IFS0CLR = 1;
ORI	R2, R0, 1
SW	R2, Offset(IFS0CLR+0)(GP)
;Config.c,254 :: 		DI();
DI	R30
;Config.c,255 :: 		count      = CP0_GET(CP0_COUNT);
MFC0	R30, 9, 0
MOVZ	R2, R30, R0
; count start address is: 16 (R4)
MOVZ	R4, R2, R0
;Config.c,256 :: 		newCompare = CP0_GET(CP0_COMPARE) + compareValue;
MFC0	R30, 11, 0
MOVZ	R3, R30, R0
LW	R2, Offset(_compareValue+0)(GP)
ADDU	R2, R3, R2
; newCompare start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,258 :: 		if((newCompare - count) > 50UL)
SUBU	R2, R2, R4
SLTIU	R2, R2, 51
BEQ	R2, R0, L__CORETIMER27
NOP	
J	L_CORETIMER4
NOP	
L__CORETIMER27:
; count end address is: 16 (R4)
;Config.c,260 :: 		CP0_SET(CP0_COMPARE, newCompare);
MOVZ	R2, R3, R0
; newCompare end address is: 12 (R3)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;Config.c,261 :: 		}
J	L_CORETIMER5
NOP	
L_CORETIMER4:
;Config.c,264 :: 		CP0_SET(CP0_COMPARE, count + 50UL);
; count start address is: 16 (R4)
ADDIU	R2, R4, 50
; count end address is: 16 (R4)
MOVZ	R30, R2, R0
MTC0	R30, 11, 0
;Config.c,265 :: 		}
L_CORETIMER5:
;Config.c,266 :: 		EI();
EI	R30
;Config.c,267 :: 		LED4 = !LED4;
_LX	
EXT	R2, R2, BitPos(LED4+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED4+0), 1
_SX	
;Config.c,268 :: 		}
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
_set_performance_mode:
;Config.c,273 :: 		void set_performance_mode(){
;Config.c,277 :: 		DI(); // Disable all interrupts
DI	R30
;Config.c,282 :: 		INTCONSET = 0x00001400;
ORI	R2, R0, 5120
SW	R2, Offset(INTCONSET+0)(GP)
;Config.c,284 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,285 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,288 :: 		PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB1DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB1DIVbits+0)(GP)
;Config.c,291 :: 		UEN0_bit = 1;
LUI	R2, BitMask(UEN0_bit+0)
ORI	R2, R2, BitMask(UEN0_bit+0)
_SX	
;Config.c,292 :: 		UEN1_bit = 1;
LUI	R2, BitMask(UEN1_bit+0)
ORI	R2, R2, BitMask(UEN1_bit+0)
_SX	
;Config.c,293 :: 		PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB2DIVbits+8)(GP)
SWL	R2, Offset(PB2DIVbits+11)(GP)
;Config.c,294 :: 		while(!PB2DIVbits.PBDIVRDY);
L_set_performance_mode6:
LBU	R2, Offset(PB2DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode29
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode29:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
;Config.c,295 :: 		PB2DIVbits.PBDIV = 0x03; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 4)
ORI	R3, R0, 3
LBU	R2, Offset(PB2DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB2DIVbits+0)(GP)
;Config.c,298 :: 		PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB3DIVbits+8)(GP)
SWL	R2, Offset(PB3DIVbits+11)(GP)
;Config.c,299 :: 		while(!PB3DIVbits.PBDIVRDY);
L_set_performance_mode8:
LBU	R2, Offset(PB3DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode30
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode30:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
;Config.c,300 :: 		PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)
ORI	R3, R0, 3
LBU	R2, Offset(PB3DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB3DIVbits+0)(GP)
;Config.c,303 :: 		PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB4DIVbits+8)(GP)
SWL	R2, Offset(PB4DIVbits+11)(GP)
;Config.c,304 :: 		while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
L_set_performance_mode10:
LBU	R2, Offset(PB4DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode31
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode31:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
;Config.c,305 :: 		PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB4DIVbits+4)(GP)
;Config.c,308 :: 		PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB5DIVbits+8)(GP)
SWL	R2, Offset(PB5DIVbits+11)(GP)
;Config.c,309 :: 		while(!PB5DIVbits.PBDIVRDY);
L_set_performance_mode12:
LBU	R2, Offset(PB5DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode32
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode32:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
;Config.c,310 :: 		PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB5DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB5DIVbits+0)(GP)
;Config.c,313 :: 		PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB7DIVbits+8)(GP)
SWL	R2, Offset(PB7DIVbits+11)(GP)
;Config.c,314 :: 		while(!PB7DIVbits.PBDIVRDY);
L_set_performance_mode14:
LBU	R2, Offset(PB7DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode33
NOP	
J	L_set_performance_mode15
NOP	
L__set_performance_mode33:
J	L_set_performance_mode14
NOP	
L_set_performance_mode15:
;Config.c,315 :: 		PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB7DIVbits+4)(GP)
;Config.c,318 :: 		PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB8DIVbits+8)(GP)
SWL	R2, Offset(PB8DIVbits+11)(GP)
;Config.c,319 :: 		while(!PB8DIVbits.PBDIVRDY);
L_set_performance_mode16:
LBU	R2, Offset(PB8DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode34
NOP	
J	L_set_performance_mode17
NOP	
L__set_performance_mode34:
J	L_set_performance_mode16
NOP	
L_set_performance_mode17:
;Config.c,320 :: 		PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB8DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB8DIVbits+0)(GP)
;Config.c,323 :: 		PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
LUI	R2, 1024
SW	R2, Offset(PRECONbits+4)(GP)
;Config.c,324 :: 		PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
ORI	R2, R0, 48
SB	R2, Offset(PRECONbits+8)(GP)
;Config.c,325 :: 		PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)
ORI	R3, R0, 4
LBU	R2, Offset(PRECONbits+0)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(PRECONbits+0)(GP)
;Config.c,329 :: 		cp0 = CP0_GET(CP0_CONFIG);
MFC0	R30, 16, 0
MOVZ	R2, R30, R0
; cp0 start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,330 :: 		cp0 &= ~0x07;
LUI	R2, 65535
ORI	R2, R2, 65528
AND	R2, R3, R2
; cp0 end address is: 12 (R3)
;Config.c,331 :: 		cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
ORI	R2, R2, 3
;Config.c,332 :: 		CP0_SET(CP0_CONFIG,cp0);
MOVZ	R30, R2, R0
MTC0	R30, 16, 0
;Config.c,335 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,336 :: 		PRISS = 0x76543210;   //priority n uses shadow set n; every ISR is ics ICS_SRS
LUI	R2, 30292
ORI	R2, R2, 12816
SW	R2, Offset(PRISS+0)(GP)
;Config.c,338 :: 		PREFEN0_bit = 1;
LUI	R2, BitMask(PREFEN0_bit+0)
ORI	R2, R2, BitMask(PREFEN0_bit+0)
_SX	
;Config.c,339 :: 		PREFEN1_bit = 1;
LUI	R2, BitMask(PREFEN1_bit+0)
ORI	R2, R2, BitMask(PREFEN1_bit+0)
_SX	
;Config.c,340 :: 		PFMWS0_bit = 0;
LUI	R2, BitMask(PFMWS0_bit+0)
ORI	R2, R2, BitMask(PFMWS0_bit+0)
_SX	
;Config.c,341 :: 		PFMWS1_bit = 1;
LUI	R2, BitMask(PFMWS1_bit+0)
ORI	R2, R2, BitMask(PFMWS1_bit+0)
_SX	
;Config.c,342 :: 		PFMWS2_bit = 0;
LUI	R2, BitMask(PFMWS2_bit+0)
ORI	R2, R2, BitMask(PFMWS2_bit+0)
_SX	
;Config.c,343 :: 		}
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
_OutPutPulseXYZ:
;Config.c,348 :: 		void OutPutPulseXYZ(){
;Config.c,350 :: 		OC5CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(OC5CON+0)(GP)
;Config.c,351 :: 		OC2CON = 0x0000; // disable OC5 module |
SW	R0, Offset(OC2CON+0)(GP)
;Config.c,352 :: 		OC7CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(OC7CON+0)(GP)
;Config.c,353 :: 		OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(OC3CON+0)(GP)
;Config.c,354 :: 		OC6CON = 0x0000; // disable OC5 module |
SW	R0, Offset(OC6CON+0)(GP)
;Config.c,355 :: 		OC8CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(OC8CON+0)(GP)
;Config.c,358 :: 		T7CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(T7CON+0)(GP)
;Config.c,361 :: 		T7CON  = 0x0030;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(T7CON+0)(GP)
;Config.c,364 :: 		PR7    = 0xFFFF;   //OC8
ORI	R2, R0, 65535
SW	R2, Offset(PR7+0)(GP)
;Config.c,367 :: 		OC8CON = 0x000C; //C Conf OC8 module for dual single Pulse output 16bit tmr7
ORI	R2, R0, 12
SW	R2, Offset(OC8CON+0)(GP)
;Config.c,376 :: 		OC7R   = 0x5;        // Z_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Config.c,377 :: 		OC7RS  = 0x234;      // Z_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC7RS+0)(GP)
;Config.c,383 :: 		OC7IP0_bit = 1;  // Set OC8 interrupt priority to 6
LUI	R2, BitMask(OC7IP0_bit+0)
ORI	R2, R2, BitMask(OC7IP0_bit+0)
_SX	
;Config.c,384 :: 		OC7IP1_bit = 1;
LUI	R2, BitMask(OC7IP1_bit+0)
ORI	R2, R2, BitMask(OC7IP1_bit+0)
_SX	
;Config.c,385 :: 		OC7IP2_bit = 0;
LUI	R2, BitMask(OC7IP2_bit+0)
ORI	R2, R2, BitMask(OC7IP2_bit+0)
_SX	
;Config.c,386 :: 		OC7IS0_bit = 0;  // Set OC8 sub priority 2
LUI	R2, BitMask(OC7IS0_bit+0)
ORI	R2, R2, BitMask(OC7IS0_bit+0)
_SX	
;Config.c,387 :: 		OC7IS1_bit = 1;
LUI	R2, BitMask(OC7IS1_bit+0)
ORI	R2, R2, BitMask(OC7IS1_bit+0)
_SX	
;Config.c,388 :: 		OC7IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Config.c,389 :: 		OC7IE_bit  = 0;  // enable interrupt
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Config.c,393 :: 		T7CONSET  = 0x8000; //C Enable Timer6 OC8
ORI	R2, R0, 32768
SW	R2, Offset(T7CONSET+0)(GP)
;Config.c,397 :: 		}
L_end_OutPutPulseXYZ:
JR	RA
NOP	
; end of _OutPutPulseXYZ
