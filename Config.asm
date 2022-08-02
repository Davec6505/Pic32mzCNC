_PinMode:
;Config.c,3 :: 		void PinMode(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,5 :: 		SYSKEY = 0xAA996655;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,6 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,7 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(CFGCONbits+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(CFGCONbits+2)(GP)
;Config.c,8 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,10 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,11 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_PinMode0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PinMode0
NOP	
;Config.c,14 :: 		ANSELA = 0X0000;
SW	R0, Offset(ANSELA+0)(GP)
;Config.c,15 :: 		ANSELB = 0X0000;
SW	R0, Offset(ANSELB+0)(GP)
;Config.c,16 :: 		ANSELC = 0X0000;
SW	R0, Offset(ANSELC+0)(GP)
;Config.c,17 :: 		ANSELD = 0X0000;
SW	R0, Offset(ANSELD+0)(GP)
;Config.c,18 :: 		ANSELE = 0X0000;
SW	R0, Offset(ANSELE+0)(GP)
;Config.c,19 :: 		ANSELG = 0X0000;
SW	R0, Offset(ANSELG+0)(GP)
;Config.c,21 :: 		CNPUB = 0x0000;
SW	R0, Offset(CNPUB+0)(GP)
;Config.c,24 :: 		TRISA9_bit = 0;
LUI	R2, BitMask(TRISA9_bit+0)
ORI	R2, R2, BitMask(TRISA9_bit+0)
_SX	
;Config.c,25 :: 		TRISD4_bit = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Config.c,26 :: 		TRISE7_bit = 0;
LUI	R2, BitMask(TRISE7_bit+0)
ORI	R2, R2, BitMask(TRISE7_bit+0)
_SX	
;Config.c,27 :: 		TRISF0_bit = 0;
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Config.c,28 :: 		TRISF1_bit = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Config.c,29 :: 		TRISG0_bit = 0;
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
;Config.c,30 :: 		TRISG1_bit = 0;
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
;Config.c,33 :: 		TRISB0_bit = 1;
LUI	R2, BitMask(TRISB0_bit+0)
ORI	R2, R2, BitMask(TRISB0_bit+0)
_SX	
;Config.c,34 :: 		TRISC3_bit = 1;
LUI	R2, BitMask(TRISC3_bit+0)
ORI	R2, R2, BitMask(TRISC3_bit+0)
_SX	
;Config.c,35 :: 		TRISG7_bit = 1;
LUI	R2, BitMask(TRISG7_bit+0)
ORI	R2, R2, BitMask(TRISG7_bit+0)
_SX	
;Config.c,36 :: 		TRISG8_bit = 1;
LUI	R2, BitMask(TRISG8_bit+0)
ORI	R2, R2, BitMask(TRISG8_bit+0)
_SX	
;Config.c,40 :: 		Unlock_IOLOCK();
JAL	_Unlock_IOLOCK+0
NOP	
;Config.c,41 :: 		PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);    // Sets pin PORTE.B8 to be Output and maps UART1 Transmit to it
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 61
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,42 :: 		PPS_Mapping_NoLock(_RPE9, _INPUT,  _U2RX);    // Sets pin PORTE.B9 to be Input and maps UART1 Receive to it
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 45
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,43 :: 		PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,44 :: 		PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,45 :: 		PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);     // dual pulse mode OutPut
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 4
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,46 :: 		PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 36
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,47 :: 		PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 38
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,48 :: 		Lock_IOLOCK();
JAL	_Lock_IOLOCK+0
NOP	
;Config.c,52 :: 		UartConfig();
JAL	_UartConfig+0
NOP	
;Config.c,56 :: 		set_performance_mode();
JAL	_set_performance_mode+0
NOP	
;Config.c,60 :: 		Uart2InterruptSetup();
JAL	_Uart2InterruptSetup+0
NOP	
;Config.c,64 :: 		InitTimer6();
JAL	_InitTimer6+0
NOP	
;Config.c,65 :: 		InitTimer7();
JAL	_InitTimer7+0
NOP	
;Config.c,66 :: 		InitTimer8();
JAL	_InitTimer8+0
NOP	
;Config.c,69 :: 		LcdI2CConfig();
JAL	_LcdI2CConfig+0
NOP	
;Config.c,73 :: 		initDMA_global();
JAL	_initDMA_global+0
NOP	
;Config.c,74 :: 		initDMA0();
JAL	_initDMA0+0
NOP	
;Config.c,75 :: 		initDMA1();
JAL	_initDMA1+0
NOP	
;Config.c,79 :: 		OutPutPulseXYZ();
JAL	_OutPutPulseXYZ+0
NOP	
;Config.c,81 :: 		}
L_end_PinMode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _PinMode
_UartConfig:
;Config.c,83 :: 		void UartConfig(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,86 :: 		UART2_Init_Advanced(256000, 50000/*PBClk x 2*/, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 1
ORI	R26, R0, 50000
LUI	R25, 3
ORI	R25, R25, 59392
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART2_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
;Config.c,87 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
LUI	R28, hi_addr(_UART2_Tx_Idle+0)
ORI	R28, R28, lo_addr(_UART2_Tx_Idle+0)
LUI	R27, hi_addr(_UART2_Data_Ready+0)
ORI	R27, R27, lo_addr(_UART2_Data_Ready+0)
LUI	R26, hi_addr(_UART2_Write+0)
ORI	R26, R26, lo_addr(_UART2_Write+0)
LUI	R25, hi_addr(_UART2_Read+0)
ORI	R25, R25, lo_addr(_UART2_Read+0)
JAL	_UART_Set_Active+0
NOP	
;Config.c,88 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
LUI	R24, 101
ORI	R24, R24, 47530
L_UartConfig2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_UartConfig2
NOP	
;Config.c,89 :: 		}
L_end_UartConfig:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _UartConfig
_Uart2InterruptSetup:
;Config.c,93 :: 		void Uart2InterruptSetup(){
;Config.c,94 :: 		URXISEL0_bit = 0;
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
;Config.c,95 :: 		URXISEL1_bit = 1;
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
;Config.c,96 :: 		IEC4.B18 = 1;              // Enable UART2 RX interrupt
LUI	R2, 4
SW	R2, Offset(IEC4+8)(GP)
;Config.c,98 :: 		U2RXIP0_bit = 1;           //
LUI	R2, BitMask(U2RXIP0_bit+0)
ORI	R2, R2, BitMask(U2RXIP0_bit+0)
_SX	
;Config.c,99 :: 		U2RXIP1_bit = 1;           //
LUI	R2, BitMask(U2RXIP1_bit+0)
ORI	R2, R2, BitMask(U2RXIP1_bit+0)
_SX	
;Config.c,100 :: 		U2RXIP2_bit = 1;           // Set priority
LUI	R2, BitMask(U2RXIP2_bit+0)
ORI	R2, R2, BitMask(U2RXIP2_bit+0)
_SX	
;Config.c,102 :: 		URXISEL1_U2STA_bit = 0;
LUI	R2, BitMask(URXISEL1_U2STA_bit+0)
ORI	R2, R2, BitMask(URXISEL1_U2STA_bit+0)
_SX	
;Config.c,103 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Config.c,104 :: 		}
L_end_Uart2InterruptSetup:
JR	RA
NOP	
; end of _Uart2InterruptSetup
_set_performance_mode:
;Config.c,106 :: 		void set_performance_mode(){
;Config.c,110 :: 		DI(); // Disable all interrupts
DI	R30
;Config.c,113 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,114 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,117 :: 		PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB1DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB1DIVbits+0)(GP)
;Config.c,120 :: 		UEN0_bit = 1;
LUI	R2, BitMask(UEN0_bit+0)
ORI	R2, R2, BitMask(UEN0_bit+0)
_SX	
;Config.c,121 :: 		UEN1_bit = 1;
LUI	R2, BitMask(UEN1_bit+0)
ORI	R2, R2, BitMask(UEN1_bit+0)
_SX	
;Config.c,122 :: 		PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB2DIVbits+8)(GP)
SWL	R2, Offset(PB2DIVbits+11)(GP)
;Config.c,123 :: 		while(!PB2DIVbits.PBDIVRDY);
L_set_performance_mode4:
LBU	R2, Offset(PB2DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode24
NOP	
J	L_set_performance_mode5
NOP	
L__set_performance_mode24:
J	L_set_performance_mode4
NOP	
L_set_performance_mode5:
;Config.c,124 :: 		PB2DIVbits.PBDIV = 0x07; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 8)
ORI	R3, R0, 7
LBU	R2, Offset(PB2DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB2DIVbits+0)(GP)
;Config.c,127 :: 		PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB3DIVbits+8)(GP)
SWL	R2, Offset(PB3DIVbits+11)(GP)
;Config.c,128 :: 		while(!PB3DIVbits.PBDIVRDY);
L_set_performance_mode6:
LBU	R2, Offset(PB3DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode25
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode25:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
;Config.c,129 :: 		PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)
ORI	R3, R0, 3
LBU	R2, Offset(PB3DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB3DIVbits+0)(GP)
;Config.c,132 :: 		PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB4DIVbits+8)(GP)
SWL	R2, Offset(PB4DIVbits+11)(GP)
;Config.c,133 :: 		while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
L_set_performance_mode8:
LBU	R2, Offset(PB4DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode26
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode26:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
;Config.c,134 :: 		PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB4DIVbits+4)(GP)
;Config.c,137 :: 		PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB5DIVbits+8)(GP)
SWL	R2, Offset(PB5DIVbits+11)(GP)
;Config.c,138 :: 		while(!PB5DIVbits.PBDIVRDY);
L_set_performance_mode10:
LBU	R2, Offset(PB5DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode27
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode27:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
;Config.c,139 :: 		PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB5DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB5DIVbits+0)(GP)
;Config.c,142 :: 		PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB7DIVbits+8)(GP)
SWL	R2, Offset(PB7DIVbits+11)(GP)
;Config.c,143 :: 		while(!PB7DIVbits.PBDIVRDY);
L_set_performance_mode12:
LBU	R2, Offset(PB7DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode28
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode28:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
;Config.c,144 :: 		PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB7DIVbits+4)(GP)
;Config.c,147 :: 		PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB8DIVbits+8)(GP)
SWL	R2, Offset(PB8DIVbits+11)(GP)
;Config.c,148 :: 		while(!PB8DIVbits.PBDIVRDY);
L_set_performance_mode14:
LBU	R2, Offset(PB8DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode29
NOP	
J	L_set_performance_mode15
NOP	
L__set_performance_mode29:
J	L_set_performance_mode14
NOP	
L_set_performance_mode15:
;Config.c,149 :: 		PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB8DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB8DIVbits+0)(GP)
;Config.c,152 :: 		PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
LUI	R2, 1024
SW	R2, Offset(PRECONbits+4)(GP)
;Config.c,153 :: 		PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
ORI	R2, R0, 48
SB	R2, Offset(PRECONbits+8)(GP)
;Config.c,154 :: 		PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)
ORI	R3, R0, 4
LBU	R2, Offset(PRECONbits+0)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(PRECONbits+0)(GP)
;Config.c,158 :: 		cp0 = CP0_GET(CP0_CONFIG);
MFC0	R30, 16, 0
MOVZ	R2, R30, R0
; cp0 start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,159 :: 		cp0 &= ~0x07;
LUI	R2, 65535
ORI	R2, R2, 65528
AND	R2, R3, R2
; cp0 end address is: 12 (R3)
;Config.c,160 :: 		cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
ORI	R2, R2, 3
;Config.c,161 :: 		CP0_SET(CP0_CONFIG,cp0);
MOVZ	R30, R2, R0
MTC0	R30, 16, 0
;Config.c,164 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,167 :: 		PREFEN0_bit = 1;
LUI	R2, BitMask(PREFEN0_bit+0)
ORI	R2, R2, BitMask(PREFEN0_bit+0)
_SX	
;Config.c,168 :: 		PREFEN1_bit = 1;
LUI	R2, BitMask(PREFEN1_bit+0)
ORI	R2, R2, BitMask(PREFEN1_bit+0)
_SX	
;Config.c,169 :: 		PFMWS0_bit = 0;
LUI	R2, BitMask(PFMWS0_bit+0)
ORI	R2, R2, BitMask(PFMWS0_bit+0)
_SX	
;Config.c,170 :: 		PFMWS1_bit = 1;
LUI	R2, BitMask(PFMWS1_bit+0)
ORI	R2, R2, BitMask(PFMWS1_bit+0)
_SX	
;Config.c,171 :: 		PFMWS2_bit = 0;
LUI	R2, BitMask(PFMWS2_bit+0)
ORI	R2, R2, BitMask(PFMWS2_bit+0)
_SX	
;Config.c,172 :: 		}
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
_OutPutPulseXYZ:
;Config.c,175 :: 		void OutPutPulseXYZ(){
;Config.c,181 :: 		OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(OC3CON+0)(GP)
;Config.c,182 :: 		OC5CON = 0x0000; // disable OC5 module |
SW	R0, Offset(OC5CON+0)(GP)
;Config.c,185 :: 		T2CON  = 0x0000;  // disable Timer2
SW	R0, Offset(T2CON+0)(GP)
;Config.c,186 :: 		T4CON  = 0x0000;  // disable Timer4
SW	R0, Offset(T4CON+0)(GP)
;Config.c,189 :: 		T2CON  = 0x0060;  //  with a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T2CON+0)(GP)
;Config.c,190 :: 		T4CON  = 0x0060;  //  with a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T4CON+0)(GP)
;Config.c,193 :: 		PR2    = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(PR2+0)(GP)
;Config.c,194 :: 		PR4    = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(PR4+0)(GP)
;Config.c,197 :: 		OC3CON = 0x0004; // Conf OC3 module for dual single Pulse output 16bit tmrx
ORI	R2, R0, 4
SW	R2, Offset(OC3CON+0)(GP)
;Config.c,198 :: 		OC5CON = 0x0004; // Conf OC6 module for dual single Pulse output 16bit tmrx
ORI	R2, R0, 4
SW	R2, Offset(OC5CON+0)(GP)
;Config.c,207 :: 		OC3R   = 0x5;        // Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Config.c,208 :: 		OC3RS  = 0x234;      // Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC3RS+0)(GP)
;Config.c,209 :: 		OC5R   = 0x5;        // Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Config.c,210 :: 		OC5RS  = 0x234;      // Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC5RS+0)(GP)
;Config.c,213 :: 		OC3IP0_bit = 1;  // Set OC3 interrupt priority to 3
LUI	R2, BitMask(OC3IP0_bit+0)
ORI	R2, R2, BitMask(OC3IP0_bit+0)
_SX	
;Config.c,214 :: 		OC3IP1_bit = 1;
LUI	R2, BitMask(OC3IP1_bit+0)
ORI	R2, R2, BitMask(OC3IP1_bit+0)
_SX	
;Config.c,215 :: 		OC3IP2_bit = 0;
LUI	R2, BitMask(OC3IP2_bit+0)
ORI	R2, R2, BitMask(OC3IP2_bit+0)
_SX	
;Config.c,216 :: 		OC3IS0_bit = 0;  // Set OC3 sub priority 1
LUI	R2, BitMask(OC3IS0_bit+0)
ORI	R2, R2, BitMask(OC3IS0_bit+0)
_SX	
;Config.c,217 :: 		OC3IS1_bit = 0;
LUI	R2, BitMask(OC3IS1_bit+0)
ORI	R2, R2, BitMask(OC3IS1_bit+0)
_SX	
;Config.c,218 :: 		OC3IF_bit  = 0;   // reset interrupt flag
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Config.c,219 :: 		OC3IE_bit  = 1;   // enable interrupt
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Config.c,221 :: 		OC5IP0_bit = 1;  // Set OC5 interrupt priority to 3
LUI	R2, BitMask(OC5IP0_bit+0)
ORI	R2, R2, BitMask(OC5IP0_bit+0)
_SX	
;Config.c,222 :: 		OC5IP1_bit = 1;
LUI	R2, BitMask(OC5IP1_bit+0)
ORI	R2, R2, BitMask(OC5IP1_bit+0)
_SX	
;Config.c,223 :: 		OC5IP2_bit = 0;
LUI	R2, BitMask(OC5IP2_bit+0)
ORI	R2, R2, BitMask(OC5IP2_bit+0)
_SX	
;Config.c,224 :: 		OC5IS0_bit = 1;  // Set OC5 sub priority 2
LUI	R2, BitMask(OC5IS0_bit+0)
ORI	R2, R2, BitMask(OC5IS0_bit+0)
_SX	
;Config.c,225 :: 		OC5IS1_bit = 0;
LUI	R2, BitMask(OC5IS1_bit+0)
ORI	R2, R2, BitMask(OC5IS1_bit+0)
_SX	
;Config.c,226 :: 		OC5IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Config.c,227 :: 		OC5IE_bit  = 1;  // enable interrupt
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Config.c,230 :: 		T2CONSET  = 0x8000; // Enable Timer2 0C5
ORI	R2, R0, 32768
SW	R2, Offset(T2CONSET+0)(GP)
;Config.c,231 :: 		T4CONSET  = 0x8000; // Enable Timer4 OC3
ORI	R2, R0, 32768
SW	R2, Offset(T4CONSET+0)(GP)
;Config.c,237 :: 		}
L_end_OutPutPulseXYZ:
JR	RA
NOP	
; end of _OutPutPulseXYZ
_InitTimer6:
;Config.c,240 :: 		void InitTimer6(){
;Config.c,241 :: 		T6CON             = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T6CON+0)(GP)
;Config.c,242 :: 		T6IP0_bit         = 0;
LUI	R2, BitMask(T6IP0_bit+0)
ORI	R2, R2, BitMask(T6IP0_bit+0)
_SX	
;Config.c,243 :: 		T6IP1_bit         = 0;
LUI	R2, BitMask(T6IP1_bit+0)
ORI	R2, R2, BitMask(T6IP1_bit+0)
_SX	
;Config.c,244 :: 		T6IP2_bit         = 1;
LUI	R2, BitMask(T6IP2_bit+0)
ORI	R2, R2, BitMask(T6IP2_bit+0)
_SX	
;Config.c,245 :: 		T6IS0_bit         = 1;
LUI	R2, BitMask(T6IS0_bit+0)
ORI	R2, R2, BitMask(T6IS0_bit+0)
_SX	
;Config.c,246 :: 		T6IS1_bit         = 0;
LUI	R2, BitMask(T6IS1_bit+0)
ORI	R2, R2, BitMask(T6IS1_bit+0)
_SX	
;Config.c,247 :: 		T6IF_bit          = 0;
LUI	R2, BitMask(T6IF_bit+0)
ORI	R2, R2, BitMask(T6IF_bit+0)
_SX	
;Config.c,248 :: 		T6IE_bit          = 0;
LUI	R2, BitMask(T6IE_bit+0)
ORI	R2, R2, BitMask(T6IE_bit+0)
_SX	
;Config.c,249 :: 		PR6               = 500;
ORI	R2, R0, 500
SW	R2, Offset(PR6+0)(GP)
;Config.c,250 :: 		TMR6              = 0;
SW	R0, Offset(TMR6+0)(GP)
;Config.c,251 :: 		}
L_end_InitTimer6:
JR	RA
NOP	
; end of _InitTimer6
_InitTimer7:
;Config.c,255 :: 		void InitTimer7(){
;Config.c,256 :: 		T7CON             = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T7CON+0)(GP)
;Config.c,257 :: 		T7IP0_bit         = 0;
LUI	R2, BitMask(T7IP0_bit+0)
ORI	R2, R2, BitMask(T7IP0_bit+0)
_SX	
;Config.c,258 :: 		T7IP1_bit         = 0;
LUI	R2, BitMask(T7IP1_bit+0)
ORI	R2, R2, BitMask(T7IP1_bit+0)
_SX	
;Config.c,259 :: 		T7IP2_bit         = 1;
LUI	R2, BitMask(T7IP2_bit+0)
ORI	R2, R2, BitMask(T7IP2_bit+0)
_SX	
;Config.c,260 :: 		T7IS0_bit         = 1;
LUI	R2, BitMask(T7IS0_bit+0)
ORI	R2, R2, BitMask(T7IS0_bit+0)
_SX	
;Config.c,261 :: 		T7IS1_bit         = 1;
LUI	R2, BitMask(T7IS1_bit+0)
ORI	R2, R2, BitMask(T7IS1_bit+0)
_SX	
;Config.c,262 :: 		T7IF_bit          = 0;
LUI	R2, BitMask(T7IF_bit+0)
ORI	R2, R2, BitMask(T7IF_bit+0)
_SX	
;Config.c,263 :: 		T7IE_bit          = 0;
LUI	R2, BitMask(T7IE_bit+0)
ORI	R2, R2, BitMask(T7IE_bit+0)
_SX	
;Config.c,264 :: 		PR7               = 50000;
ORI	R2, R0, 50000
SW	R2, Offset(PR7+0)(GP)
;Config.c,265 :: 		TMR7              = 0;
SW	R0, Offset(TMR7+0)(GP)
;Config.c,266 :: 		}
L_end_InitTimer7:
JR	RA
NOP	
; end of _InitTimer7
_InitTimer8:
;Config.c,269 :: 		void InitTimer8(){
;Config.c,270 :: 		T8CON            = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T8CON+0)(GP)
;Config.c,271 :: 		T8IP0_bit        = 0;
LUI	R2, BitMask(T8IP0_bit+0)
ORI	R2, R2, BitMask(T8IP0_bit+0)
_SX	
;Config.c,272 :: 		T8IP1_bit        = 0;
LUI	R2, BitMask(T8IP1_bit+0)
ORI	R2, R2, BitMask(T8IP1_bit+0)
_SX	
;Config.c,273 :: 		T8IP2_bit        = 1;
LUI	R2, BitMask(T8IP2_bit+0)
ORI	R2, R2, BitMask(T8IP2_bit+0)
_SX	
;Config.c,274 :: 		T8IS0_bit        = 0;
LUI	R2, BitMask(T8IS0_bit+0)
ORI	R2, R2, BitMask(T8IS0_bit+0)
_SX	
;Config.c,275 :: 		T8IS1_bit        = 1;
LUI	R2, BitMask(T8IS1_bit+0)
ORI	R2, R2, BitMask(T8IS1_bit+0)
_SX	
;Config.c,276 :: 		T8IF_bit         = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Config.c,277 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Config.c,278 :: 		PR8              = 50;
ORI	R2, R0, 50
SW	R2, Offset(PR8+0)(GP)
;Config.c,279 :: 		TMR8             = 0;
SW	R0, Offset(TMR8+0)(GP)
;Config.c,280 :: 		}
L_end_InitTimer8:
JR	RA
NOP	
; end of _InitTimer8
_LcdI2CConfig:
;Config.c,282 :: 		void LcdI2CConfig(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,285 :: 		I2C4_Init_Advanced(50000, 100000);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R26, 1
ORI	R26, R26, 34464
ORI	R25, R0, 50000
JAL	_I2C4_Init_Advanced+0
NOP	
;Config.c,286 :: 		I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
LUI	R28, hi_addr(_I2C4_Write+0)
ORI	R28, R28, lo_addr(_I2C4_Write+0)
LUI	R27, hi_addr(_I2C4_Read+0)
ORI	R27, R27, lo_addr(_I2C4_Read+0)
LUI	R26, hi_addr(_I2C4_Restart+0)
ORI	R26, R26, lo_addr(_I2C4_Restart+0)
LUI	R25, hi_addr(_I2C4_Start+0)
ORI	R25, R25, lo_addr(_I2C4_Start+0)
;Config.c,287 :: 		&I2C4_Stop,&I2C4_Is_Idle); // Sets the I2C4 module active
LUI	R2, hi_addr(_I2C4_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C4_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C4_Stop+0)
ORI	R2, R2, lo_addr(_I2C4_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
;Config.c,288 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_LcdI2CConfig16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_LcdI2CConfig16
NOP	
;Config.c,289 :: 		I2C_LCD_init(LCD_01_ADDRESS,4);
ORI	R26, R0, 4
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_init+0
NOP	
;Config.c,290 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_LcdI2CConfig18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_LcdI2CConfig18
NOP	
;Config.c,291 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,292 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1); // Cursor off
ORI	R27, R0, 1
ORI	R26, R0, 7
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,293 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1); // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,294 :: 		}
L_end_LcdI2CConfig:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _LcdI2CConfig
_initDMA_global:
;Config.c,298 :: 		void initDMA_global(){
;Config.c,299 :: 		DMACON = 1<<16;       //enable the DMA controller
LUI	R2, 1
SW	R2, Offset(DMACON+0)(GP)
;Config.c,300 :: 		DCH0CON = 0x03;   //channel off on block trf complete ,no event detect, priority 3, no chaining
ORI	R2, R0, 3
SW	R2, Offset(DCH0CON+0)(GP)
;Config.c,301 :: 		}
L_end_initDMA_global:
JR	RA
NOP	
; end of _initDMA_global
_initDMA0:
;Config.c,304 :: 		void  initDMA0(){
;Config.c,305 :: 		DMACONbits.ON = 1;
ORI	R2, R0, 32768
SWR	R2, Offset(DMACONbits+8)(GP)
SWL	R2, Offset(DMACONbits+11)(GP)
;Config.c,306 :: 		DCH0CONbits.CHAEN = 1;
ORI	R2, R0, 16
SW	R2, Offset(DCH0CONbits+8)(GP)
;Config.c,307 :: 		DCH0CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH0CONbits+4)(GP)
;Config.c,308 :: 		DMA0IE_bit = 0;
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Config.c,309 :: 		DMA0IF_bit = 0;
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Config.c,311 :: 		DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Config.c,312 :: 		DCH0DAT       =  0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;Config.c,314 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U1RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Config.c,315 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    //   virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Config.c,317 :: 		DCH0SSIZ      = 200  ;  // source size = size of buffer set up rcBuf, x bytes at a time
ORI	R2, R0, 200
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Config.c,318 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Config.c,319 :: 		DCH0CSIZ      = 200  ;  // bytes transferred per event = Size of how many bytes to transfer per each interrupt on #27 IRQ event
ORI	R2, R0, 200
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Config.c,321 :: 		DCH0INTCLR    = 0x00FF00FF ; // Clear existing events, disable all interrupts ''Clear flags in DMA controller channel 0
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Config.c,322 :: 		CHBCIE_bit    = 1  ;         // Enable Interrupt on block transfer complete
LUI	R2, BitMask(CHBCIE_bit+0)
ORI	R2, R2, BitMask(CHBCIE_bit+0)
_SX	
;Config.c,323 :: 		CHERIE_bit    = 1  ;         // Enable Interrupt on errors
LUI	R2, BitMask(CHERIE_bit+0)
ORI	R2, R2, BitMask(CHERIE_bit+0)
_SX	
;Config.c,327 :: 		IPC33CLR       = 0x0000001F ;//' clear DMA channel priority and sub-priority
ORI	R2, R0, 31
SW	R2, Offset(IPC33CLR+0)(GP)
;Config.c,328 :: 		DMA0IP2_bit   = 1 ;          //' IPC9 DMA0IP  priority = 5
LUI	R2, BitMask(DMA0IP2_bit+0)
ORI	R2, R2, BitMask(DMA0IP2_bit+0)
_SX	
;Config.c,329 :: 		DMA0IP1_bit   = 0 ;
LUI	R2, BitMask(DMA0IP1_bit+0)
ORI	R2, R2, BitMask(DMA0IP1_bit+0)
_SX	
;Config.c,330 :: 		DMA0IP0_bit   = 1 ;
LUI	R2, BitMask(DMA0IP0_bit+0)
ORI	R2, R2, BitMask(DMA0IP0_bit+0)
_SX	
;Config.c,331 :: 		DMA0IS1_bit   = 1 ;         //' sub-priority 3
LUI	R2, BitMask(DMA0IS1_bit+0)
ORI	R2, R2, BitMask(DMA0IS1_bit+0)
_SX	
;Config.c,332 :: 		DMA0IS0_bit   = 1 ;
LUI	R2, BitMask(DMA0IS0_bit+0)
ORI	R2, R2, BitMask(DMA0IS0_bit+0)
_SX	
;Config.c,334 :: 		DMA0IE_bit    = 1 ;         //' enable DMA0 interrupt
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Config.c,335 :: 		CHEN_bit      = 1 ;         //' Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Config.c,337 :: 		}
L_end_initDMA0:
JR	RA
NOP	
; end of _initDMA0
_initDMA1:
;Config.c,340 :: 		void initDMA1(){
;Config.c,342 :: 		DMA1IE_bit = 0 ;                   //' disable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Config.c,343 :: 		DMA1IF_bit = 0 ;                   //' clear DMA1 interrupt flag
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Config.c,344 :: 		DCH1CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH1CONbits+4)(GP)
;Config.c,345 :: 		DCH1ECON=(147 << 8)| 0x30;         //' Specific INTERRUPT IRQ NUMBER for UART 2 TX (147)
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Config.c,346 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Config.c,347 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;  //U1TX2REG for reply  [0xBF822220 = U1TXREG]
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Config.c,348 :: 		DCH1DAT       = 0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;Config.c,350 :: 		DCH1SSIZ = 200  ;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Config.c,352 :: 		DCH1DSIZ = 1  ;    //' This is how many bytes come from the destination - i.e. rxBuf recieved can change dynamicall as its send buffer
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Config.c,354 :: 		DCH1CSIZ = 200  ;  //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 200
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Config.c,356 :: 		DCH1INTCLR  =  0x00FF00FF ; //'clear all interrupts and clear all interrupt flags
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Config.c,357 :: 		CHBCIE_DCH1INT_bit = 1    ; //'Enable Channel Block transfer interrupt
LUI	R2, BitMask(CHBCIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIE_DCH1INT_bit+0)
_SX	
;Config.c,358 :: 		CHERIE_DCH1INT_bit = 1    ; //'Enable Channel Address Error interrupt
LUI	R2, BitMask(CHERIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIE_DCH1INT_bit+0)
_SX	
;Config.c,360 :: 		DMA1IP2_bit = 1 ;           //' DMA1 interrupt priority 5
LUI	R2, BitMask(DMA1IP2_bit+0)
ORI	R2, R2, BitMask(DMA1IP2_bit+0)
_SX	
;Config.c,361 :: 		DMA1IP1_bit = 0 ;
LUI	R2, BitMask(DMA1IP1_bit+0)
ORI	R2, R2, BitMask(DMA1IP1_bit+0)
_SX	
;Config.c,362 :: 		DMA1IP0_bit = 1 ;
LUI	R2, BitMask(DMA1IP0_bit+0)
ORI	R2, R2, BitMask(DMA1IP0_bit+0)
_SX	
;Config.c,363 :: 		DMA1IS1_bit = 0 ;           //' sub-priority 1
LUI	R2, BitMask(DMA1IS1_bit+0)
ORI	R2, R2, BitMask(DMA1IS1_bit+0)
_SX	
;Config.c,364 :: 		DMA1IS0_bit = 1 ;
LUI	R2, BitMask(DMA1IS0_bit+0)
ORI	R2, R2, BitMask(DMA1IS0_bit+0)
_SX	
;Config.c,365 :: 		DMA1IE_bit  = 1 ;           //' enable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Config.c,366 :: 		}
L_end_initDMA1:
JR	RA
NOP	
; end of _initDMA1
