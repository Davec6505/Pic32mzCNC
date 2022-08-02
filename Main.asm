_Timer6Interrupt:
;Main.c,22 :: 		void Timer6Interrupt() iv IVT_TIMER_6 ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
;Main.c,26 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Timer6Interrupt42
NOP	
J	L_Timer6Interrupt0
NOP	
L__Timer6Interrupt42:
;Main.c,27 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_Timer6Interrupt1:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__Timer6Interrupt43
NOP	
J	L_Timer6Interrupt2
NOP	
L__Timer6Interrupt43:
;Main.c,28 :: 		STPS[ii].PLS_Step_     = 0;
SEH	R2, R4
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Main.c,29 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__Timer6Interrupt44
NOP	
J	L_Timer6Interrupt4
NOP	
L__Timer6Interrupt44:
; ii end address is: 16 (R4)
J	L_Timer6Interrupt2
NOP	
L_Timer6Interrupt4:
;Main.c,30 :: 		if(ii == X)PLS_StepX   = 0;
; ii start address is: 16 (R4)
SEH	R2, R4
BEQ	R2, R0, L__Timer6Interrupt45
NOP	
J	L_Timer6Interrupt5
NOP	
L__Timer6Interrupt45:
SH	R0, Offset(PLS_StepX+0)(GP)
L_Timer6Interrupt5:
;Main.c,31 :: 		if(ii == Y)PLS_StepY   = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__Timer6Interrupt46
NOP	
J	L_Timer6Interrupt6
NOP	
L__Timer6Interrupt46:
SH	R0, Offset(PLS_StepY+0)(GP)
L_Timer6Interrupt6:
;Main.c,27 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,32 :: 		}
; ii end address is: 16 (R4)
J	L_Timer6Interrupt1
NOP	
L_Timer6Interrupt2:
;Main.c,33 :: 		}
L_Timer6Interrupt0:
;Main.c,34 :: 		T6IE_bit      = 0;
LUI	R2, BitMask(T6IE_bit+0)
ORI	R2, R2, BitMask(T6IE_bit+0)
_SX	
;Main.c,35 :: 		}
L_end_Timer6Interrupt:
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
; end of _Timer6Interrupt
_Timer7Interrupt:
;Main.c,38 :: 		void Timer7Interrupt() iv IVT_TIMER_7 ilevel 4 ics ICS_SRS{
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
;Main.c,39 :: 		T7IF_bit  = 0;
LUI	R2, BitMask(T7IF_bit+0)
ORI	R2, R2, BitMask(T7IF_bit+0)
_SX	
;Main.c,41 :: 		TMR.mSec++;
LHU	R2, Offset(_TMR+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR+8)(GP)
;Main.c,42 :: 		if(TMR.mSec > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Timer7Interrupt48
NOP	
J	L_Timer7Interrupt7
NOP	
L__Timer7Interrupt48:
;Main.c,43 :: 		LATA9_bit = !LATA9_bit;
_LX	
EXT	R2, R2, BitPos(LATA9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA9_bit+0), 1
_SX	
;Main.c,44 :: 		TMR.mSec = 0;
SH	R0, Offset(_TMR+8)(GP)
;Main.c,45 :: 		TMR.Sec++;
LBU	R2, Offset(_TMR+10)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR+10)(GP)
;Main.c,46 :: 		if(TMR.Sec > 59){
ANDI	R2, R2, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Timer7Interrupt49
NOP	
J	L_Timer7Interrupt8
NOP	
L__Timer7Interrupt49:
;Main.c,47 :: 		TMR.Sec = 0;
SB	R0, Offset(_TMR+10)(GP)
;Main.c,48 :: 		}
L_Timer7Interrupt8:
;Main.c,49 :: 		}
L_Timer7Interrupt7:
;Main.c,50 :: 		}
L_end_Timer7Interrupt:
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
; end of _Timer7Interrupt
_Timer8Interrupt:
;Main.c,53 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,56 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__Timer8Interrupt52
NOP	
J	L_Timer8Interrupt9
NOP	
L__Timer8Interrupt52:
;Main.c,57 :: 		CycleStart();
JAL	_CycleStart+0
NOP	
;Main.c,58 :: 		}else{
J	L_Timer8Interrupt10
NOP	
L_Timer8Interrupt9:
;Main.c,59 :: 		CycleStop();
JAL	_CycleStop+0
NOP	
;Main.c,60 :: 		}
L_Timer8Interrupt10:
;Main.c,61 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Main.c,62 :: 		}
L_end_Timer8Interrupt:
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
; end of _Timer8Interrupt
_uart2_Rx_interrupt:
;Main.c,67 :: 		void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,68 :: 		uart_rd = UART2_Read();
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
;Main.c,69 :: 		UART2_Write( uart_rd );
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
;Main.c,71 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Main.c,72 :: 		}
L_end_uart2_Rx_interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _uart2_Rx_interrupt
_DMA_CH0_ISR:
;Main.c,76 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,79 :: 		if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
_LX	
EXT	R2, R2, BitPos(CHBCIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR56
NOP	
J	L_DMA_CH0_ISR11
NOP	
L__DMA_CH0_ISR56:
;Main.c,83 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
SH	R2, 4(SP)
;Main.c,84 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Main.c,85 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
SEH	R27, R2
LUI	R26, 40960
ORI	R26, R26, 8192
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,86 :: 		CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
LUI	R2, BitMask(CHEN_DCH1CON_bit+0)
ORI	R2, R2, BitMask(CHEN_DCH1CON_bit+0)
_SX	
;Main.c,87 :: 		}
L_DMA_CH0_ISR11:
;Main.c,88 :: 		DCH1SSIZ            = i ;
LH	R2, 4(SP)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Main.c,91 :: 		if( CHERIF_bit == 1){                     // clear channel error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR58
NOP	
J	L_DMA_CH0_ISR12
NOP	
L__DMA_CH0_ISR58:
;Main.c,92 :: 		CHERIF_bit = 0;
LUI	R2, BitMask(CHERIF_bit+0)
ORI	R2, R2, BitMask(CHERIF_bit+0)
_SX	
;Main.c,93 :: 		memcpy(txBuf,"CHERIF Error",13);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
ORI	R27, R0, 13
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,94 :: 		}
L_DMA_CH0_ISR12:
;Main.c,95 :: 		DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Main.c,98 :: 		CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Main.c,100 :: 		CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
LUI	R2, BitMask(CFORCE_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CFORCE_DCH1ECON_bit+0)
_SX	
;Main.c,101 :: 		DMA0IF_bit          = 0 ;                 // clear DMA0 int flag
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Main.c,103 :: 		}
L_end_DMA_CH0_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _DMA_CH0_ISR
_DMA_CH1_ISR:
;Main.c,106 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
;Main.c,107 :: 		int ptr = 0;
;Main.c,110 :: 		if (CHBCIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHBCIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR61
NOP	
J	L_DMA_CH1_ISR13
NOP	
L__DMA_CH1_ISR61:
;Main.c,111 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,112 :: 		}
L_DMA_CH1_ISR13:
;Main.c,114 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR63
NOP	
J	L_DMA_CH1_ISR14
NOP	
L__DMA_CH1_ISR63:
;Main.c,115 :: 		CHERIF_DCH1INT_bit = 0;
LUI	R2, BitMask(CHERIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIF_DCH1INT_bit+0)
_SX	
;Main.c,117 :: 		}
L_DMA_CH1_ISR14:
;Main.c,119 :: 		dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Main.c,120 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Main.c,121 :: 		DMA1IF_bit   = 0 ;
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Main.c,123 :: 		}
L_end_DMA_CH1_ISR:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _DMA_CH1_ISR
_StepX:
;Main.c,127 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Main.c,129 :: 		STmr.compOCxRunning = 2;
ORI	R2, R0, 2
SH	R2, Offset(_STmr+8)(GP)
;Main.c,130 :: 		TMR4 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Main.c,131 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Main.c,133 :: 		}
L_end_StepX:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _StepX
_StepY:
;Main.c,134 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Main.c,136 :: 		STmr.compOCxRunning = 1;
ORI	R2, R0, 1
SH	R2, Offset(_STmr+8)(GP)
;Main.c,137 :: 		TMR2 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Main.c,138 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Main.c,140 :: 		}
L_end_StepY:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _StepY
_main:
;Main.c,143 :: 		void main() {
;Main.c,146 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,147 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Main.c,148 :: 		StepperConstants(4500,4500);
ORI	R26, R0, 4500
ORI	R25, R0, 4500
JAL	_StepperConstants+0
NOP	
;Main.c,149 :: 		EnableInterrupts();
EI	R30
;Main.c,150 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,151 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 4
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,152 :: 		while(1){
L_main15:
;Main.c,154 :: 		if((!RC3_bit)&&(!oneShotA)){
_LX	
EXT	R2, R2, BitPos(RC3_bit+0), 1
BEQ	R2, R0, L__main67
NOP	
J	L__main38
NOP	
L__main67:
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main68
NOP	
J	L__main37
NOP	
L__main68:
L__main36:
;Main.c,156 :: 		oneShotA     = 1;
LBU	R2, Offset(_oneShotA+0)(GP)
ORI	R2, R2, BitMask(_oneShotA+0)
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,158 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,159 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,160 :: 		EnStepper();
JAL	_EnStepper+0
NOP	
;Main.c,161 :: 		a = 2;
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,154 :: 		if((!RC3_bit)&&(!oneShotA)){
L__main38:
L__main37:
;Main.c,164 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__main70
NOP	
J	L_main20
NOP	
L__main70:
;Main.c,165 :: 		switch(a){
J	L_main21
NOP	
;Main.c,166 :: 		case 0:
L_main23:
;Main.c,167 :: 		STPS[X].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,168 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,169 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,170 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,171 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,172 :: 		Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
LW	R26, Offset(_STPS+124)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_Step+0
NOP	
;Main.c,173 :: 		a = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,174 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,175 :: 		break;
J	L_main22
NOP	
;Main.c,176 :: 		case 1:
L_main24:
;Main.c,177 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,178 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,179 :: 		if(SV.Tog == 1)a=2;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main71
NOP	
J	L_main25
NOP	
L__main71:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
L_main25:
;Main.c,180 :: 		break;
J	L_main22
NOP	
;Main.c,181 :: 		case 2:
L_main26:
;Main.c,182 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,183 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,184 :: 		STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,185 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,186 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,187 :: 		Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
LW	R26, Offset(_STPS+124)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_Step+0
NOP	
;Main.c,188 :: 		a = 3;
ORI	R2, R0, 3
SH	R2, Offset(Main_a+0)(GP)
;Main.c,189 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,190 :: 		break;
J	L_main22
NOP	
;Main.c,191 :: 		case 3:
L_main27:
;Main.c,192 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,193 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,194 :: 		if(SV.Tog == 1) a = 0;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main72
NOP	
J	L_main28
NOP	
L__main72:
SH	R0, Offset(Main_a+0)(GP)
L_main28:
;Main.c,195 :: 		break;
J	L_main22
NOP	
;Main.c,196 :: 		default: a = 2;
L_main29:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,197 :: 		break;
J	L_main22
NOP	
;Main.c,198 :: 		}
L_main21:
LHU	R2, Offset(Main_a+0)(GP)
BNE	R2, R0, L__main74
NOP	
J	L_main23
NOP	
L__main74:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main76
NOP	
J	L_main24
NOP	
L__main76:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main78
NOP	
J	L_main26
NOP	
L__main78:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main80
NOP	
J	L_main27
NOP	
L__main80:
J	L_main29
NOP	
L_main22:
;Main.c,199 :: 		}
L_main20:
;Main.c,200 :: 		if((!RB0_bit)&&(Toggle))oneShotA = 0;
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BEQ	R2, R0, L__main81
NOP	
J	L__main40
NOP	
L__main81:
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main83
NOP	
J	L__main39
NOP	
L__main83:
L__main35:
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
L__main40:
L__main39:
;Main.c,201 :: 		if(!oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main84
NOP	
J	L_main33
NOP	
L__main84:
;Main.c,202 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,203 :: 		}
L_main33:
;Main.c,205 :: 		if(!RB0_bit){
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BEQ	R2, R0, L__main85
NOP	
J	L_main34
NOP	
L__main85:
;Main.c,206 :: 		oneShotB       = 0;
LBU	R2, Offset(_oneShotB+0)(GP)
INS	R2, R0, BitPos(_oneShotB+0), 1
SB	R2, Offset(_oneShotB+0)(GP)
;Main.c,207 :: 		oneShotA       = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,208 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,209 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,210 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,211 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,215 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
LW	R2, Offset(_STPS+44)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Main+0)
ORI	R2, R2, lo_addr(?lstr_2_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,216 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,218 :: 		sprintf(txt,"%d",STPS[0].decel_start);
LW	R2, Offset(_STPS+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,219 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,223 :: 		sprintf(txt,"%d",STPS[0].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Main+0)
ORI	R2, R2, lo_addr(?lstr_4_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,224 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,226 :: 		sprintf(txt,"%d",STPS[0].min_delay);
LW	R2, Offset(_STPS+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,227 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,231 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Main+0)
ORI	R2, R2, lo_addr(?lstr_6_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,232 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,234 :: 		sprintf(txt,"%d",STPS[0].decel_val);
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,235 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,237 :: 		}
L_main34:
;Main.c,239 :: 		}
J	L_main15
NOP	
;Main.c,240 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
