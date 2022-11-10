_PinMode:
;Config.c,5 :: 		void PinMode(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,7 :: 		DI();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
DI	R30
;Config.c,9 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082130384)(GP)
;Config.c,10 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082130384)(GP)
;Config.c,11 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(-1082130430)(GP)
ORI	R2, R2, 1
SB	R2, Offset(-1082130430)(GP)
;Config.c,12 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(-1082130384)(GP)
;Config.c,14 :: 		JTAGEN_bit = 0;
LBU	R2, Offset(-1082130432)(GP)
INS	R2, R0, 3, 1
SB	R2, Offset(-1082130432)(GP)
;Config.c,15 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_PinMode0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PinMode0
NOP	
;Config.c,18 :: 		ANSELA = 0X0000;
SW	R0, Offset(-1081737216)(GP)
;Config.c,19 :: 		TRISA  = 0X0000;
SW	R0, Offset(-1081737200)(GP)
;Config.c,20 :: 		ANSELB = 0X0000;
SW	R0, Offset(-1081736960)(GP)
;Config.c,21 :: 		TRISB  = 0X0000;
SW	R0, Offset(-1081736944)(GP)
;Config.c,22 :: 		ANSELC = 0X0000;
SW	R0, Offset(-1081736704)(GP)
;Config.c,23 :: 		TRISC  = 0X0000;
SW	R0, Offset(-1081736688)(GP)
;Config.c,24 :: 		ANSELD = 0X0000;
SW	R0, Offset(-1081736448)(GP)
;Config.c,25 :: 		TRISD  = 0X0000;
SW	R0, Offset(-1081736432)(GP)
;Config.c,26 :: 		ANSELE = 0X0000;
SW	R0, Offset(-1081736192)(GP)
;Config.c,27 :: 		TRISE  = 0X0000;
SW	R0, Offset(-1081736176)(GP)
;Config.c,28 :: 		ANSELG = 0X0000;
SW	R0, Offset(-1081735680)(GP)
;Config.c,29 :: 		TRISG  = 0X0000;
SW	R0, Offset(-1081735664)(GP)
;Config.c,31 :: 		CNPUB = 0x0000;
SW	R0, Offset(-1081736880)(GP)
;Config.c,34 :: 		LED1_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED1_Dir+0), 1
_SX	
;Config.c,35 :: 		LED2_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED2_Dir+0), 1
_SX	
;Config.c,40 :: 		SW1_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW1_Dir+0)
_SX	
;Config.c,41 :: 		SW2_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW2_Dir+0)
_SX	
;Config.c,43 :: 		TRISG7_bit = 1;
ORI	R2, R0, 128
SW	R2, Offset(-1081735656)(GP)
;Config.c,44 :: 		TRISG8_bit = 1;
ORI	R2, R0, 256
SW	R2, Offset(-1081735656)(GP)
;Config.c,47 :: 		set_performance_mode();
JAL	_set_performance_mode+0
NOP	
;Config.c,51 :: 		Unlock_IOLOCK();
JAL	_Unlock_IOLOCK+0
NOP	
;Config.c,53 :: 		PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);    // Sets pin PORTE.B8 to be Output and maps UART2 Transmit
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 61
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,54 :: 		PPS_Mapping_NoLock(_RPE9, _INPUT,  _U2RX);    // Sets pin PORTE.B9 to be Input and maps UART2 Receive
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 45
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,56 :: 		PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,57 :: 		PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,60 :: 		PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);     //X_Axis TMR2
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 36
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,61 :: 		PPS_Mapping_NoLock(_RPD5, _OUTPUT, _OC2);     //Y_Axis TMR4
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 54
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,62 :: 		PPS_Mapping_NoLock(_RPF0, _OUTPUT, _OC7);     //Z_Axis TMR6
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 20
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,63 :: 		PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);     //A_Axis TMR5
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 4
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,64 :: 		PPS_Mapping_NoLock(_RPG1, _OUTPUT, _OC6);     //B_Axis TMR3
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,65 :: 		PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //C_Axis TMR7
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 38
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,68 :: 		PPS_Mapping_NoLock(_RPF3, _INPUT, _INT1);     //X_Min_Limit
ORI	R27, R0, 39
ORI	R26, R0, 1
ORI	R25, R0, 56
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,69 :: 		PPS_Mapping_NoLock(_RPB15, _INPUT, _INT2);    //Y_Min_Limit
ORI	R27, R0, 25
ORI	R26, R0, 1
ORI	R25, R0, 35
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,70 :: 		Lock_IOLOCK();
JAL	_Lock_IOLOCK+0
NOP	
;Config.c,78 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;Config.c,83 :: 		UartConfig();
JAL	_UartConfig+0
NOP	
;Config.c,87 :: 		Uart2InterruptSetup();
JAL	_Uart2InterruptSetup+0
NOP	
;Config.c,91 :: 		Limit_Initialize();
JAL	_Limit_Initialize+0
NOP	
;Config.c,95 :: 		DMA_global();
JAL	_DMA_global+0
NOP	
;Config.c,96 :: 		DMA0_Enable();
JAL	_DMA0_Enable+0
NOP	
;Config.c,97 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Config.c,101 :: 		OutPutPulseXYZ();
JAL	_OutPutPulseXYZ+0
NOP	
;Config.c,102 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Config.c,107 :: 		SetInitialSizes(STPS);
LUI	R25, hi_addr(_STPS+0)
ORI	R25, R25, lo_addr(_STPS+0)
JAL	_SetInitialSizes+0
NOP	
;Config.c,108 :: 		}
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
;Config.c,110 :: 		void UartConfig(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,113 :: 		UART2_Init_Advanced(256000, 200000/*PBClk x 2*/, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 1
LUI	R26, 3
ORI	R26, R26, 3392
LUI	R25, 3
ORI	R25, R25, 59392
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART2_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
;Config.c,114 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
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
;Config.c,115 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
LUI	R24, 101
ORI	R24, R24, 47530
L_UartConfig2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_UartConfig2
NOP	
;Config.c,116 :: 		}
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
;Config.c,125 :: 		void Uart2InterruptSetup(){
;Config.c,127 :: 		URXISEL0_bit = 0;
ORI	R2, R0, 64
SW	R2, Offset(-1081991148)(GP)
;Config.c,128 :: 		URXISEL1_bit = 0;
ORI	R2, R0, 128
SW	R2, Offset(-1081991148)(GP)
;Config.c,131 :: 		UTXISEL0_bit = 0;
ORI	R2, R0, 16384
SW	R2, Offset(-1081991148)(GP)
;Config.c,132 :: 		UTXISEL1_bit = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081991148)(GP)
;Config.c,135 :: 		IEC4CLR      = 0xc000;
ORI	R2, R0, 49152
SW	R2, Offset(-1082064636)(GP)
;Config.c,137 :: 		}
L_end_Uart2InterruptSetup:
JR	RA
NOP	
; end of _Uart2InterruptSetup
_set_performance_mode:
;Config.c,139 :: 		void set_performance_mode(){
;Config.c,143 :: 		DI(); // Disable all interrupts
DI	R30
;Config.c,148 :: 		INTCONSET = 0x00001400;
ORI	R2, R0, 5120
SW	R2, Offset(-1082064888)(GP)
;Config.c,150 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082130384)(GP)
;Config.c,151 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082130384)(GP)
;Config.c,154 :: 		PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125568)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125568)(GP)
;Config.c,157 :: 		UEN0_bit = 1;
ORI	R2, R0, 256
SW	R2, Offset(-1081991160)(GP)
;Config.c,158 :: 		UEN1_bit = 1;
ORI	R2, R0, 512
SW	R2, Offset(-1081991160)(GP)
;Config.c,159 :: 		PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125544)(GP)
SWL	R2, Offset(-1082125541)(GP)
;Config.c,160 :: 		while(!PB2DIVbits.PBDIVRDY);
L_set_performance_mode4:
LBU	R2, Offset(-1082125551)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode20
NOP	
J	L_set_performance_mode5
NOP	
L__set_performance_mode20:
J	L_set_performance_mode4
NOP	
L_set_performance_mode5:
;Config.c,161 :: 		PB2DIVbits.PBDIV = 0x07; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 8)
ORI	R3, R0, 7
LBU	R2, Offset(-1082125552)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125552)(GP)
;Config.c,164 :: 		PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125528)(GP)
SWL	R2, Offset(-1082125525)(GP)
;Config.c,165 :: 		while(!PB3DIVbits.PBDIVRDY);
L_set_performance_mode6:
LBU	R2, Offset(-1082125535)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode21
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode21:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
;Config.c,166 :: 		PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)
ORI	R3, R0, 3
LBU	R2, Offset(-1082125536)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125536)(GP)
;Config.c,169 :: 		PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125512)(GP)
SWL	R2, Offset(-1082125509)(GP)
;Config.c,170 :: 		while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
L_set_performance_mode8:
LBU	R2, Offset(-1082125519)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode22
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode22:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
;Config.c,171 :: 		PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(-1082125516)(GP)
;Config.c,174 :: 		PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125496)(GP)
SWL	R2, Offset(-1082125493)(GP)
;Config.c,175 :: 		while(!PB5DIVbits.PBDIVRDY);
L_set_performance_mode10:
LBU	R2, Offset(-1082125503)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode23
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode23:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
;Config.c,176 :: 		PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125504)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125504)(GP)
;Config.c,179 :: 		PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125464)(GP)
SWL	R2, Offset(-1082125461)(GP)
;Config.c,180 :: 		while(!PB7DIVbits.PBDIVRDY);
L_set_performance_mode12:
LBU	R2, Offset(-1082125471)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode24
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode24:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
;Config.c,181 :: 		PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(-1082125468)(GP)
;Config.c,184 :: 		PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125448)(GP)
SWL	R2, Offset(-1082125445)(GP)
;Config.c,185 :: 		while(!PB8DIVbits.PBDIVRDY);
L_set_performance_mode14:
LBU	R2, Offset(-1082125455)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode25
NOP	
J	L_set_performance_mode15
NOP	
L__set_performance_mode25:
J	L_set_performance_mode14
NOP	
L_set_performance_mode15:
;Config.c,186 :: 		PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125456)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125456)(GP)
;Config.c,189 :: 		PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
LUI	R2, 1024
SW	R2, Offset(-1081212924)(GP)
;Config.c,190 :: 		PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
ORI	R2, R0, 48
SB	R2, Offset(-1081212920)(GP)
;Config.c,191 :: 		PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)
ORI	R3, R0, 4
LBU	R2, Offset(-1081212928)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(-1081212928)(GP)
;Config.c,195 :: 		cp0 = CP0_GET(CP0_CONFIG);
MFC0	R30, 16, 0
MOVZ	R2, R30, R0
; cp0 start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,196 :: 		cp0 &= ~0x07;
LUI	R2, 65535
ORI	R2, R2, 65528
AND	R2, R3, R2
; cp0 end address is: 12 (R3)
;Config.c,197 :: 		cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
ORI	R2, R2, 3
;Config.c,198 :: 		CP0_SET(CP0_CONFIG,cp0);
MOVZ	R30, R2, R0
MTC0	R30, 16, 0
;Config.c,201 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(-1082130384)(GP)
;Config.c,202 :: 		PRISS = 0x76543210;   //SRS all priorities
LUI	R2, 30292
ORI	R2, R2, 12816
SW	R2, Offset(-1082064880)(GP)
;Config.c,204 :: 		PREFEN0_bit = 1;
ORI	R2, R0, 16
SW	R2, Offset(-1081212920)(GP)
;Config.c,205 :: 		PREFEN1_bit = 1;
ORI	R2, R0, 32
SW	R2, Offset(-1081212920)(GP)
;Config.c,206 :: 		PFMWS0_bit = 0;
ORI	R2, R0, 1
SW	R2, Offset(-1081212924)(GP)
;Config.c,207 :: 		PFMWS1_bit = 1;
ORI	R2, R0, 2
SW	R2, Offset(-1081212920)(GP)
;Config.c,208 :: 		PFMWS2_bit = 0;
ORI	R2, R0, 4
SW	R2, Offset(-1081212924)(GP)
;Config.c,209 :: 		}
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
_OutPutPulseXYZ:
;Config.c,212 :: 		void OutPutPulseXYZ(){
;Config.c,218 :: 		OC5CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(-1081849856)(GP)
;Config.c,219 :: 		OC2CON = 0x0000; // disable OC5 module |
SW	R0, Offset(-1081851392)(GP)
;Config.c,220 :: 		OC7CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(-1081848832)(GP)
;Config.c,221 :: 		OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(-1081850880)(GP)
;Config.c,222 :: 		OC6CON = 0x0000; // disable OC5 module |
SW	R0, Offset(-1081849344)(GP)
;Config.c,223 :: 		OC8CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(-1081848320)(GP)
;Config.c,226 :: 		T2CON  = 0x0000;  // disable Timer2  OC5
SW	R0, Offset(-1081867776)(GP)
;Config.c,227 :: 		T3CON  = 0x0000;  // disable Timer4  OC3
SW	R0, Offset(-1081867264)(GP)
;Config.c,228 :: 		T4CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(-1081866752)(GP)
;Config.c,229 :: 		T5CON  = 0x0000;  // disable Timer2  OC5
SW	R0, Offset(-1081866240)(GP)
;Config.c,230 :: 		T6CON  = 0x0000;  // disable Timer4  OC3
SW	R0, Offset(-1081865728)(GP)
;Config.c,231 :: 		T7CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(-1081865216)(GP)
;Config.c,233 :: 		T2CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081867776)(GP)
;Config.c,234 :: 		T3CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081867264)(GP)
;Config.c,235 :: 		T4CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081866752)(GP)
;Config.c,236 :: 		T5CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081866240)(GP)
;Config.c,237 :: 		T6CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081865728)(GP)
;Config.c,238 :: 		T7CON  = 0x0030;  //   a prescaler of 1:8 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081865216)(GP)
;Config.c,241 :: 		PR2    = 0xFFFF;   //OC5
ORI	R2, R0, 65535
SW	R2, Offset(-1081867744)(GP)
;Config.c,242 :: 		PR3    = 0xFFFF;   //OC6
ORI	R2, R0, 65535
SW	R2, Offset(-1081867232)(GP)
;Config.c,243 :: 		PR4    = 0xFFFF;   //OC2
ORI	R2, R0, 65535
SW	R2, Offset(-1081866720)(GP)
;Config.c,244 :: 		PR5    = 0xFFFF;   //OC3
ORI	R2, R0, 65535
SW	R2, Offset(-1081866208)(GP)
;Config.c,245 :: 		PR6    = 0xFFFF;   //OC7
ORI	R2, R0, 65535
SW	R2, Offset(-1081865696)(GP)
;Config.c,246 :: 		PR7    = 0xFFFF;   //OC8
ORI	R2, R0, 65535
SW	R2, Offset(-1081865184)(GP)
;Config.c,249 :: 		OC5CON = 0x0004; //X Conf OC5 module for dual single Pulse output 16bit tmr2
ORI	R2, R0, 4
SW	R2, Offset(-1081849856)(GP)
;Config.c,250 :: 		OC2CON = 0x0004; //Y Conf OC2 module for dual single Pulse output 16bit tmr4
ORI	R2, R0, 4
SW	R2, Offset(-1081851392)(GP)
;Config.c,251 :: 		OC7CON = 0x0004; //Z Conf OC7 module for dual single Pulse output 16bit tmr6
ORI	R2, R0, 4
SW	R2, Offset(-1081848832)(GP)
;Config.c,252 :: 		OC3CON = 0x000C; //A Conf OC3 module for dual single Pulse output 16bit tmr5
ORI	R2, R0, 12
SW	R2, Offset(-1081850880)(GP)
;Config.c,253 :: 		OC6CON = 0x000C; //B Conf OC6 module for dual single Pulse output 16bit tmr3
ORI	R2, R0, 12
SW	R2, Offset(-1081849344)(GP)
;Config.c,254 :: 		OC8CON = 0x000C; //C Conf OC8 module for dual single Pulse output 16bit tmr7
ORI	R2, R0, 12
SW	R2, Offset(-1081848320)(GP)
;Config.c,262 :: 		OC5R   = 0x5;        // X_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081849840)(GP)
;Config.c,263 :: 		OC5RS  = 0x234;      // X_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081849824)(GP)
;Config.c,264 :: 		OC2R   = 0x5;        // Y_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081851376)(GP)
;Config.c,265 :: 		OC2RS  = 0x234;      // Y_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081851360)(GP)
;Config.c,266 :: 		OC7R   = 0x5;        // Z_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081848816)(GP)
;Config.c,267 :: 		OC7RS  = 0x234;      // Z_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081848800)(GP)
;Config.c,268 :: 		OC3R   = 0x5;        // A_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081850864)(GP)
;Config.c,269 :: 		OC3RS  = 0x234;      // A_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081850848)(GP)
;Config.c,270 :: 		OC6R   = 0x5;        // B_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081849328)(GP)
;Config.c,271 :: 		OC6RS  = 0x234;      // B_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081849312)(GP)
;Config.c,272 :: 		OC8R   = 0x5;        // C_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081848304)(GP)
;Config.c,273 :: 		OC8RS  = 0x234;      // C_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081848288)(GP)
;Config.c,277 :: 		OC5IP0_bit = 1;  // Set OC5 interrupt priority to 3
LUI	R9, 1024
SW	R9, Offset(-1082064472)(GP)
;Config.c,278 :: 		OC5IP1_bit = 1;
LUI	R8, 2048
SW	R8, Offset(-1082064472)(GP)
;Config.c,279 :: 		OC5IP2_bit = 0;
LUI	R7, 4096
SW	R7, Offset(-1082064476)(GP)
;Config.c,280 :: 		OC5IS0_bit = 0;  // Set OC5 sub priority 0
LUI	R6, 256
SW	R6, Offset(-1082064476)(GP)
;Config.c,281 :: 		OC5IS1_bit = 0;
LUI	R5, 512
SW	R5, Offset(-1082064476)(GP)
;Config.c,282 :: 		OC5IF_bit  = 0;  // reset interrupt flag
SW	R8, Offset(-1082064828)(GP)
;Config.c,283 :: 		OC5IE_bit  = 0;  // enable interrupt
SW	R8, Offset(-1082064700)(GP)
;Config.c,286 :: 		OC2IP0_bit = 1;  // Set OC3 interrupt priority to 3
ORI	R2, R0, 4
SW	R2, Offset(-1082064520)(GP)
;Config.c,287 :: 		OC2IP1_bit = 1;
ORI	R4, R0, 8
SW	R4, Offset(-1082064520)(GP)
;Config.c,288 :: 		OC2IP2_bit = 0;
ORI	R2, R0, 16
SW	R2, Offset(-1082064524)(GP)
;Config.c,289 :: 		OC2IS0_bit = 1;  // Set OC3 sub priority 1
ORI	R2, R0, 1
SW	R2, Offset(-1082064520)(GP)
;Config.c,290 :: 		OC2IS1_bit = 0;
ORI	R2, R0, 2
SW	R2, Offset(-1082064524)(GP)
;Config.c,291 :: 		OC2IF_bit  = 0;   // reset interrupt flag
ORI	R3, R0, 4096
SW	R3, Offset(-1082064828)(GP)
;Config.c,292 :: 		OC2IE_bit  = 0;   // enable interrupt
SW	R3, Offset(-1082064700)(GP)
;Config.c,295 :: 		OC7IP0_bit = 1;  // Set OC8 interrupt priority to 6
SW	R9, Offset(-1082064440)(GP)
;Config.c,296 :: 		OC7IP1_bit = 1;
SW	R8, Offset(-1082064440)(GP)
;Config.c,297 :: 		OC7IP2_bit = 0;
SW	R7, Offset(-1082064444)(GP)
;Config.c,298 :: 		OC7IS0_bit = 0;  // Set OC8 sub priority 2
SW	R6, Offset(-1082064444)(GP)
;Config.c,299 :: 		OC7IS1_bit = 1;
SW	R5, Offset(-1082064440)(GP)
;Config.c,300 :: 		OC7IF_bit  = 0;  // reset interrupt flag
SW	R4, Offset(-1082064812)(GP)
;Config.c,301 :: 		OC7IE_bit  = 0;  // enable interrupt
SW	R4, Offset(-1082064684)(GP)
;Config.c,304 :: 		OC3IP0_bit = 1;  // Set OC3 interrupt priority to 6
ORI	R2, R0, 1024
SW	R2, Offset(-1082064504)(GP)
;Config.c,305 :: 		OC3IP1_bit = 1;
ORI	R2, R0, 2048
SW	R2, Offset(-1082064504)(GP)
;Config.c,306 :: 		OC3IP2_bit = 0;
SW	R3, Offset(-1082064508)(GP)
;Config.c,307 :: 		OC3IS0_bit = 1;  // Set OC3 sub priority 3
ORI	R2, R0, 256
SW	R2, Offset(-1082064504)(GP)
;Config.c,308 :: 		OC3IS1_bit = 1;
ORI	R2, R0, 512
SW	R2, Offset(-1082064504)(GP)
;Config.c,309 :: 		OC3IF_bit  = 0;   // reset interrupt flag
LUI	R2, 2
SW	R2, Offset(-1082064828)(GP)
;Config.c,310 :: 		OC3IE_bit  = 0;   // enable interrupt
SW	R2, Offset(-1082064700)(GP)
;Config.c,313 :: 		OC6IP0_bit = 1;  // Set OC5 interrupt priority to 6
SW	R9, Offset(-1082064456)(GP)
;Config.c,314 :: 		OC6IP1_bit = 1;
SW	R8, Offset(-1082064456)(GP)
;Config.c,315 :: 		OC6IP2_bit = 0;
SW	R7, Offset(-1082064460)(GP)
;Config.c,316 :: 		OC6IS0_bit = 1;  // Set OC6 sub priority 3
SW	R6, Offset(-1082064456)(GP)
;Config.c,317 :: 		OC6IS1_bit = 1;
SW	R5, Offset(-1082064456)(GP)
;Config.c,318 :: 		OC6IF_bit  = 0;  // reset interrupt flag
LUI	R2, 32768
SW	R2, Offset(-1082064828)(GP)
;Config.c,319 :: 		OC6IE_bit  = 0;  // enable interrupt
SW	R2, Offset(-1082064700)(GP)
;Config.c,322 :: 		OC8IP0_bit = 1;  // Set OC8 interrupt priority to 6
SW	R9, Offset(-1082064424)(GP)
;Config.c,323 :: 		OC8IP1_bit = 1;
SW	R8, Offset(-1082064424)(GP)
;Config.c,324 :: 		OC8IP2_bit = 0;
SW	R7, Offset(-1082064428)(GP)
;Config.c,325 :: 		OC8IS0_bit = 1;  // Set OC8 sub priority 2
SW	R6, Offset(-1082064424)(GP)
;Config.c,326 :: 		OC8IS1_bit = 1;
SW	R5, Offset(-1082064424)(GP)
;Config.c,327 :: 		OC8IF_bit  = 0;  // reset interrupt flag
ORI	R2, R0, 128
SW	R2, Offset(-1082064812)(GP)
;Config.c,328 :: 		OC8IE_bit  = 0;  // enable interrupt
SW	R2, Offset(-1082064684)(GP)
;Config.c,331 :: 		T2CONSET  = 0x8000; //X Enable Timer2 0C5
ORI	R2, R0, 32768
SW	R2, Offset(-1081867768)(GP)
;Config.c,332 :: 		T4CONSET  = 0x8000; //Y Enable Timer4 OC2
ORI	R2, R0, 32768
SW	R2, Offset(-1081866744)(GP)
;Config.c,333 :: 		T6CONSET  = 0x8000; //Z Enable Timer6 OC7
ORI	R2, R0, 32768
SW	R2, Offset(-1081865720)(GP)
;Config.c,334 :: 		T5CONSET  = 0x8000; //A Enable Timer5 0C3
ORI	R2, R0, 32768
SW	R2, Offset(-1081866232)(GP)
;Config.c,335 :: 		T3CONSET  = 0x8000; //B Enable Timer3 OC6
ORI	R2, R0, 32768
SW	R2, Offset(-1081867256)(GP)
;Config.c,336 :: 		T7CONSET  = 0x8000; //C Enable Timer6 OC8
ORI	R2, R0, 32768
SW	R2, Offset(-1081865208)(GP)
;Config.c,342 :: 		}
L_end_OutPutPulseXYZ:
JR	RA
NOP	
; end of _OutPutPulseXYZ
