_PinMode:
;Config.c,13 :: 		void PinMode(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,16 :: 		DI();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
DI	R30
;Config.c,19 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082130384)(GP)
;Config.c,20 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082130384)(GP)
;Config.c,21 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(-1082130430)(GP)
ORI	R2, R2, 1
SB	R2, Offset(-1082130430)(GP)
;Config.c,22 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(-1082130384)(GP)
;Config.c,25 :: 		JTAGEN_bit = 0;
LBU	R2, Offset(-1082130432)(GP)
INS	R2, R0, 3, 1
SB	R2, Offset(-1082130432)(GP)
;Config.c,26 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_PinMode0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PinMode0
NOP	
;Config.c,29 :: 		ANSELA = 0X0000;
SW	R0, Offset(-1081737216)(GP)
;Config.c,30 :: 		TRISA  = 0X0000;
SW	R0, Offset(-1081737200)(GP)
;Config.c,31 :: 		ANSELB = 0X0000;
SW	R0, Offset(-1081736960)(GP)
;Config.c,32 :: 		TRISB  = 0X0000;
SW	R0, Offset(-1081736944)(GP)
;Config.c,33 :: 		ANSELC = 0X0000;
SW	R0, Offset(-1081736704)(GP)
;Config.c,34 :: 		TRISC  = 0X0000;
SW	R0, Offset(-1081736688)(GP)
;Config.c,35 :: 		ANSELD = 0X0000;
SW	R0, Offset(-1081736448)(GP)
;Config.c,36 :: 		TRISD  = 0X0000;
SW	R0, Offset(-1081736432)(GP)
;Config.c,37 :: 		ANSELE = 0X0000;
SW	R0, Offset(-1081736192)(GP)
;Config.c,38 :: 		TRISE  = 0X0000;
SW	R0, Offset(-1081736176)(GP)
;Config.c,39 :: 		ANSELG = 0X0000;
SW	R0, Offset(-1081735680)(GP)
;Config.c,40 :: 		TRISG  = 0X0000;
SW	R0, Offset(-1081735664)(GP)
;Config.c,44 :: 		CNPUB  = 0;//1 << 15;
SW	R0, Offset(-1081736880)(GP)
;Config.c,45 :: 		CNPUF  = 0;//1 << 3;
SW	R0, Offset(-1081735856)(GP)
;Config.c,48 :: 		LED1_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED1_Dir+0), 1
_SX	
;Config.c,49 :: 		LED2_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED2_Dir+0), 1
_SX	
;Config.c,50 :: 		LED3_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED3_Dir+0), 1
_SX	
;Config.c,51 :: 		LED4_Dir = 0;
_LX	
INS	R2, R0, BitPos(LED4_Dir+0), 1
_SX	
;Config.c,54 :: 		SW1_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW1_Dir+0)
_SX	
;Config.c,55 :: 		SW2_Dir = 1;
_LX	
ORI	R2, R2, BitMask(SW2_Dir+0)
_SX	
;Config.c,57 :: 		TRISG7_bit = 1;
ORI	R2, R0, 128
SW	R2, Offset(-1081735656)(GP)
;Config.c,58 :: 		TRISG8_bit = 1;
ORI	R2, R0, 256
SW	R2, Offset(-1081735656)(GP)
;Config.c,61 :: 		set_performance_mode();
JAL	_set_performance_mode+0
NOP	
;Config.c,64 :: 		Unlock_IOLOCK();
JAL	_Unlock_IOLOCK+0
NOP	
;Config.c,67 :: 		PPS_Mapping_NoLock(_RPC2, _OUTPUT, _U2TX);    // RC2 = UART2 TX
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 60
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,68 :: 		PPS_Mapping_NoLock(_RPC3, _INPUT,  _U2RX);    // RC3 = UART2 RX
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 44
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,82 :: 		PPS_Mapping_NoLock(_RPD2, _INPUT, _SDI1);
ORI	R27, R0, 9
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,83 :: 		PPS_Mapping_NoLock(_RPD3, _OUTPUT, _SDO1);
ORI	R27, R0, 5
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,86 :: 		PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //Spindle TMR7
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 38
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,91 :: 		Lock_IOLOCK();
JAL	_Lock_IOLOCK+0
NOP	
;Config.c,96 :: 		MM_Init();
JAL	_MM_Init+0
NOP	
;Config.c,100 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;Config.c,102 :: 		InitTimer8();
JAL	_InitTimer8+0
NOP	
;Config.c,106 :: 		Limit_Initialize();
JAL	_Limit_Initialize+0
NOP	
;Config.c,110 :: 		OutPutPulseXYZ();
JAL	_OutPutPulseXYZ+0
NOP	
;Config.c,111 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Config.c,115 :: 		SetInitialSizes(STPS);
LUI	R25, hi_addr(_STPS+0)
ORI	R25, R25, lo_addr(_STPS+0)
JAL	_SetInitialSizes+0
NOP	
;Config.c,119 :: 		Serial_Init(SERIAL_MODE_RX_IRQ_DMA_TX);
ORI	R25, R0, 2
JAL	_Serial_Init+0
NOP	
;Config.c,125 :: 		CORETIMER_Initialize();
JAL	_CORETIMER_Initialize+0
NOP	
;Config.c,126 :: 		CORETIMER_Start();
JAL	_CORETIMER_Start+0
NOP	
;Config.c,130 :: 		EnableInterrupts();
EI	R30
;Config.c,133 :: 		settings_init(0);
MOVZ	R25, R0, R0
JAL	_settings_init+0
NOP	
;Config.c,134 :: 		settings_init(1);
ORI	R25, R0, 1
JAL	_settings_init+0
NOP	
;Config.c,137 :: 		}
L_end_PinMode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _PinMode
_set_performance_mode:
;Config.c,142 :: 		void set_performance_mode(){
;Config.c,146 :: 		DI(); // Disable all interrupts
DI	R30
;Config.c,151 :: 		INTCONSET = 0x00001400;
ORI	R2, R0, 5120
SW	R2, Offset(-1082064888)(GP)
;Config.c,153 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082130384)(GP)
;Config.c,154 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082130384)(GP)
;Config.c,157 :: 		PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125568)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125568)(GP)
;Config.c,160 :: 		UEN0_bit = 1;
ORI	R2, R0, 256
SW	R2, Offset(-1081991160)(GP)
;Config.c,161 :: 		UEN1_bit = 1;
ORI	R2, R0, 512
SW	R2, Offset(-1081991160)(GP)
;Config.c,162 :: 		PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125544)(GP)
SWL	R2, Offset(-1082125541)(GP)
;Config.c,163 :: 		while(!PB2DIVbits.PBDIVRDY);
L_set_performance_mode2:
LBU	R2, Offset(-1082125551)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode16
NOP	
J	L_set_performance_mode3
NOP	
L__set_performance_mode16:
J	L_set_performance_mode2
NOP	
L_set_performance_mode3:
;Config.c,164 :: 		PB2DIVbits.PBDIV = 0x03; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 4)
ORI	R3, R0, 3
LBU	R2, Offset(-1082125552)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125552)(GP)
;Config.c,167 :: 		PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125528)(GP)
SWL	R2, Offset(-1082125525)(GP)
;Config.c,168 :: 		while(!PB3DIVbits.PBDIVRDY);
L_set_performance_mode4:
LBU	R2, Offset(-1082125535)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode17
NOP	
J	L_set_performance_mode5
NOP	
L__set_performance_mode17:
J	L_set_performance_mode4
NOP	
L_set_performance_mode5:
;Config.c,169 :: 		PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)
ORI	R3, R0, 3
LBU	R2, Offset(-1082125536)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125536)(GP)
;Config.c,172 :: 		PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125512)(GP)
SWL	R2, Offset(-1082125509)(GP)
;Config.c,173 :: 		while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
L_set_performance_mode6:
LBU	R2, Offset(-1082125519)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode18
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode18:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
;Config.c,174 :: 		PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(-1082125516)(GP)
;Config.c,177 :: 		PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125496)(GP)
SWL	R2, Offset(-1082125493)(GP)
;Config.c,178 :: 		while(!PB5DIVbits.PBDIVRDY);
L_set_performance_mode8:
LBU	R2, Offset(-1082125503)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode19
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode19:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
;Config.c,179 :: 		PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125504)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125504)(GP)
;Config.c,182 :: 		PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125464)(GP)
SWL	R2, Offset(-1082125461)(GP)
;Config.c,183 :: 		while(!PB7DIVbits.PBDIVRDY);
L_set_performance_mode10:
LBU	R2, Offset(-1082125471)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode20
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode20:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
;Config.c,184 :: 		PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(-1082125468)(GP)
;Config.c,187 :: 		PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(-1082125448)(GP)
SWL	R2, Offset(-1082125445)(GP)
;Config.c,188 :: 		while(!PB8DIVbits.PBDIVRDY);
L_set_performance_mode12:
LBU	R2, Offset(-1082125455)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode21
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode21:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
;Config.c,189 :: 		PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(-1082125456)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(-1082125456)(GP)
;Config.c,192 :: 		PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
LUI	R2, 1024
SW	R2, Offset(-1081212924)(GP)
;Config.c,193 :: 		PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
ORI	R2, R0, 48
SB	R2, Offset(-1081212920)(GP)
;Config.c,194 :: 		PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)
ORI	R3, R0, 4
LBU	R2, Offset(-1081212928)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(-1081212928)(GP)
;Config.c,198 :: 		cp0 = CP0_GET(CP0_CONFIG);
MFC0	R30, 16, 0
MOVZ	R2, R30, R0
; cp0 start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,199 :: 		cp0 &= ~0x07;
LUI	R2, 65535
ORI	R2, R2, 65528
AND	R2, R3, R2
; cp0 end address is: 12 (R3)
;Config.c,200 :: 		cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
ORI	R2, R2, 3
;Config.c,201 :: 		CP0_SET(CP0_CONFIG,cp0);
MOVZ	R30, R2, R0
MTC0	R30, 16, 0
;Config.c,204 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(-1082130384)(GP)
;Config.c,205 :: 		PRISS = 0x76543210;   //priority n uses shadow set n; every ISR is ics ICS_SRS
LUI	R2, 30292
ORI	R2, R2, 12816
SW	R2, Offset(-1082064880)(GP)
;Config.c,207 :: 		PREFEN0_bit = 1;
ORI	R2, R0, 16
SW	R2, Offset(-1081212920)(GP)
;Config.c,208 :: 		PREFEN1_bit = 1;
ORI	R2, R0, 32
SW	R2, Offset(-1081212920)(GP)
;Config.c,209 :: 		PFMWS0_bit = 0;
ORI	R2, R0, 1
SW	R2, Offset(-1081212924)(GP)
;Config.c,210 :: 		PFMWS1_bit = 1;
ORI	R2, R0, 2
SW	R2, Offset(-1081212920)(GP)
;Config.c,211 :: 		PFMWS2_bit = 0;
ORI	R2, R0, 4
SW	R2, Offset(-1081212924)(GP)
;Config.c,212 :: 		}
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
_OutPutPulseXYZ:
;Config.c,217 :: 		void OutPutPulseXYZ(){
;Config.c,219 :: 		OC5CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(-1081849856)(GP)
;Config.c,220 :: 		OC2CON = 0x0000; // disable OC5 module |
SW	R0, Offset(-1081851392)(GP)
;Config.c,221 :: 		OC7CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(-1081848832)(GP)
;Config.c,222 :: 		OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(-1081850880)(GP)
;Config.c,223 :: 		OC6CON = 0x0000; // disable OC5 module |
SW	R0, Offset(-1081849344)(GP)
;Config.c,224 :: 		OC8CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(-1081848320)(GP)
;Config.c,227 :: 		T7CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(-1081865216)(GP)
;Config.c,230 :: 		T7CON  = 0x0030;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 48
SW	R2, Offset(-1081865216)(GP)
;Config.c,233 :: 		PR7    = 0xFFFF;   //OC8
ORI	R2, R0, 65535
SW	R2, Offset(-1081865184)(GP)
;Config.c,236 :: 		OC8CON = 0x000C; //C Conf OC8 module for dual single Pulse output 16bit tmr7
ORI	R2, R0, 12
SW	R2, Offset(-1081848320)(GP)
;Config.c,245 :: 		OC7R   = 0x5;        // Z_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(-1081848816)(GP)
;Config.c,246 :: 		OC7RS  = 0x234;      // Z_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(-1081848800)(GP)
;Config.c,252 :: 		OC7IP0_bit = 1;  // Set OC8 interrupt priority to 6
LUI	R2, 1024
SW	R2, Offset(-1082064440)(GP)
;Config.c,253 :: 		OC7IP1_bit = 1;
LUI	R2, 2048
SW	R2, Offset(-1082064440)(GP)
;Config.c,254 :: 		OC7IP2_bit = 0;
LUI	R2, 4096
SW	R2, Offset(-1082064444)(GP)
;Config.c,255 :: 		OC7IS0_bit = 0;  // Set OC8 sub priority 2
LUI	R2, 256
SW	R2, Offset(-1082064444)(GP)
;Config.c,256 :: 		OC7IS1_bit = 1;
LUI	R2, 512
SW	R2, Offset(-1082064440)(GP)
;Config.c,257 :: 		OC7IF_bit  = 0;  // reset interrupt flag
ORI	R2, R0, 8
SW	R2, Offset(-1082064812)(GP)
;Config.c,258 :: 		OC7IE_bit  = 0;  // enable interrupt
SW	R2, Offset(-1082064684)(GP)
;Config.c,262 :: 		T7CONSET  = 0x8000; //C Enable Timer6 OC8
ORI	R2, R0, 32768
SW	R2, Offset(-1081865208)(GP)
;Config.c,266 :: 		}
L_end_OutPutPulseXYZ:
JR	RA
NOP	
; end of _OutPutPulseXYZ
