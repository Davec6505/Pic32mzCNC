_DMA_global:
;Serial_Dma.c,20 :: 		void DMA_global(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,22 :: 		DMACONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,23 :: 		DMA0();
JAL	_DMA0+0
NOP	
;Serial_Dma.c,24 :: 		DMA1();
JAL	_DMA1+0
NOP	
;Serial_Dma.c,25 :: 		}
L_end_DMA_global:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DMA_global
_DMA0:
;Serial_Dma.c,37 :: 		void  DMA0(){
;Serial_Dma.c,39 :: 		IEC4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,40 :: 		IFS4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,43 :: 		DCH0CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,46 :: 		DCH0ECON      =  (146 << 8 ) | 0x30;
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Serial_Dma.c,49 :: 		DCH0DAT       =  '\r';
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;Serial_Dma.c,52 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Serial_Dma.c,53 :: 		DCH0SSIZ      = 1;                 // source size = 1byte at a time
ORI	R2, R0, 1
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Serial_Dma.c,56 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,57 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Serial_Dma.c,60 :: 		DCH0CSIZ      = 1  ;  // bytes transferred in the background
ORI	R2, R0, 1
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Serial_Dma.c,64 :: 		DCH0INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,66 :: 		DCH0INTSET      =  0x90000;
LUI	R2, 9
SW	R2, Offset(DCH0INTSET+0)(GP)
;Serial_Dma.c,70 :: 		IPC33CLR     = 0x160000;
LUI	R2, 22
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,72 :: 		IPC33SET      = 0x00140000;
LUI	R2, 20
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,74 :: 		IEC4SET       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,75 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,78 :: 		DCH0CONSET      = 0X0000013;
ORI	R2, R0, 19
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,80 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA0_Enable:
;Serial_Dma.c,84 :: 		void DMA0_Enable(){
;Serial_Dma.c,93 :: 		DCH0CONSET  |= 1<<7;
LW	R2, Offset(DCH0CONSET+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,94 :: 		}
L_end_DMA0_Enable:
JR	RA
NOP	
; end of _DMA0_Enable
_DMA0_Disable:
;Serial_Dma.c,98 :: 		void DMA0_Disable(){
;Serial_Dma.c,100 :: 		DCH0CONCLR  |= 1<<7;
LW	R2, Offset(DCH0CONCLR+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,102 :: 		}
L_end_DMA0_Disable:
JR	RA
NOP	
; end of _DMA0_Disable
_DMA_CH0_ISR:
;Serial_Dma.c,106 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
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
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Serial_Dma.c,107 :: 		int i = 0;
;Serial_Dma.c,109 :: 		dma0int_flag = DCH0INT & 0x00FF;         //flags to sample in code if needed
LW	R2, Offset(DCH0INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,114 :: 		if (DCH0INTbits.CHBCIF == 1) {
LBU	R2, Offset(DCH0INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR43
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR43:
;Serial_Dma.c,123 :: 		}
L_DMA_CH0_ISR0:
;Serial_Dma.c,126 :: 		if( CHERIF_bit == 1){       // test error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR45
NOP	
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR45:
;Serial_Dma.c,128 :: 		strcpy(txBuf,DMAx_err(dma0,cherie));
ADDIU	R23, SP, 4
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr1_Serial_Dma+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Serial_Dma+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strcpy+0
NOP	
;Serial_Dma.c,129 :: 		UART2_Write_Text(txBuf);
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_UART2_Write_Text+0
NOP	
;Serial_Dma.c,132 :: 		}
L_DMA_CH0_ISR1:
;Serial_Dma.c,134 :: 		DCH0INTCLR    = 0x000000ff;
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,135 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,136 :: 		}
L_end_DMA_CH0_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
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
_DMA1:
;Serial_Dma.c,150 :: 		void DMA1(){
;Serial_Dma.c,153 :: 		IPC33CLR      = 0x17000000;
LUI	R2, 5888
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,154 :: 		IEC4CLR       = 0x7;
ORI	R2, R0, 7
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,157 :: 		DCH1CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,160 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,164 :: 		DCH1DAT       = '\r';
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,167 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,168 :: 		DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,172 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,173 :: 		DCH1DSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,176 :: 		DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,179 :: 		DCH1INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,185 :: 		IPC33CLR     = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,187 :: 		IPC33SET    = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,189 :: 		IEC4SET     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,191 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,195 :: 		DCH1CONSET    = 0x00000003;
ORI	R2, R0, 3
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,197 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Enable:
;Serial_Dma.c,200 :: 		void DMA1_Enable(){
;Serial_Dma.c,201 :: 		DCH1CONSET |= 1<<7;
LW	R2, Offset(DCH1CONSET+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,202 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,206 :: 		void DMA1_Disable(){
;Serial_Dma.c,207 :: 		DCH1CONCLR |= 1<<7;
LW	R2, Offset(DCH1CONCLR+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,208 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA_CH1_ISR:
;Serial_Dma.c,216 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
;Serial_Dma.c,219 :: 		dma1int_flag = DCH1INT & 0x00FF;
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,221 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(DCH1INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR51
NOP	
J	L_DMA_CH1_ISR2
NOP	
L__DMA_CH1_ISR51:
;Serial_Dma.c,222 :: 		dma1int_flag = 1;
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,223 :: 		dma0int_flag = 0;
SB	R0, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,225 :: 		}
L_DMA_CH1_ISR2:
;Serial_Dma.c,227 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR53
NOP	
J	L_DMA_CH1_ISR3
NOP	
L__DMA_CH1_ISR53:
;Serial_Dma.c,229 :: 		}
L_DMA_CH1_ISR3:
;Serial_Dma.c,234 :: 		DCH1INTCLR  = 0x00FF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,235 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,237 :: 		}
L_end_DMA_CH1_ISR:
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
; end of _DMA_CH1_ISR
_dma_printf:
;Serial_Dma.c,242 :: 		int dma_printf(char* str,...){
ADDIU	SP, SP, -148
SW	RA, 0(SP)
;Serial_Dma.c,243 :: 		int i = 0, j=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j start address is: 32 (R8)
MOVZ	R8, R0, R0
;Serial_Dma.c,244 :: 		char buff[100]={0}, tmp[20];
ADDIU	R23, SP, 44
ADDIU	R22, R23, 100
LUI	R24, hi_addr(?ICSdma_printf_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSdma_printf_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Serial_Dma.c,251 :: 		va_start(va,str);
ADDIU	R3, SP, 40
ADDIU	R2, SP, 148
ADDIU	R2, R2, 4
SW	R2, 0(R3)
; j end address is: 32 (R8)
; i end address is: 20 (R5)
;Serial_Dma.c,253 :: 		while(str && str[i]){
L_dma_printf4:
; j start address is: 32 (R8)
; i start address is: 20 (R5)
LW	R2, 148(SP)
BNE	R2, R0, L__dma_printf56
NOP	
J	L__dma_printf36
NOP	
L__dma_printf56:
SEH	R3, R5
LW	R2, 148(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
BNE	R2, R0, L__dma_printf58
NOP	
J	L__dma_printf35
NOP	
L__dma_printf58:
L__dma_printf34:
;Serial_Dma.c,254 :: 		if(str[i] == '%'){
SEH	R3, R5
LW	R2, 148(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 37
BEQ	R3, R2, L__dma_printf59
NOP	
J	L_dma_printf8
NOP	
L__dma_printf59:
;Serial_Dma.c,255 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 28 (R7)
SEH	R7, R2
;Serial_Dma.c,256 :: 		switch(str[i]){
SEH	R3, R2
LW	R2, 148(SP)
ADDU	R2, R2, R3
SW	R2, 144(SP)
J	L_dma_printf9
NOP	
;Serial_Dma.c,257 :: 		case 'c':
L_dma_printf11:
;Serial_Dma.c,259 :: 		buff[j] = (char)va_arg(va,int);
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R5, R3, R2
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
SB	R2, 0(R5)
;Serial_Dma.c,260 :: 		j++;
ADDIU	R2, R8, 1
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,261 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,262 :: 		case 'd':
L_dma_printf12:
;Serial_Dma.c,265 :: 		IntToStr(va_arg(va,int),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	_IntToStr+0
NOP	
;Serial_Dma.c,266 :: 		strcpy(&buff[j], tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Serial_Dma.c,267 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,268 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,269 :: 		case 'l':
L_dma_printf13:
;Serial_Dma.c,272 :: 		LongToStr(va_arg(va,int),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	_LongToStr+0
NOP	
;Serial_Dma.c,273 :: 		strcpy(&buff[j], tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Serial_Dma.c,274 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,275 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,276 :: 		case 'x':
L_dma_printf14:
;Serial_Dma.c,277 :: 		case 'X':
; j start address is: 32 (R8)
L_dma_printf15:
;Serial_Dma.c,279 :: 		_itoa(va_arg( va, int ), tmp, 16);
ADDIU	R5, SP, 16
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
ORI	R27, R0, 16
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	__itoa+0
NOP	
;Serial_Dma.c,280 :: 		strcpy(&buff[j], tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Serial_Dma.c,281 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,282 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,283 :: 		case 'o':
L_dma_printf16:
;Serial_Dma.c,284 :: 		case 'O':
; j start address is: 32 (R8)
L_dma_printf17:
;Serial_Dma.c,286 :: 		_itoa(va_arg( va, int ), tmp, 8);
ADDIU	R5, SP, 16
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
ORI	R27, R0, 8
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	__itoa+0
NOP	
;Serial_Dma.c,287 :: 		strcpy(&buff[j], tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Serial_Dma.c,288 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,289 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,290 :: 		case 's':
L_dma_printf18:
;Serial_Dma.c,292 :: 		str_arg = va_arg( va, char* );
; j start address is: 32 (R8)
ADDIU	R4, SP, 40
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R4, 0(R3)
SW	R4, 36(SP)
;Serial_Dma.c,293 :: 		strcpy(&buff[j], str_arg);
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Serial_Dma.c,294 :: 		j += strlen(str_arg);
LW	R25, 36(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,295 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf10
NOP	
;Serial_Dma.c,296 :: 		}
L_dma_printf9:
; j start address is: 32 (R8)
LW	R4, 144(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf61
NOP	
J	L_dma_printf11
NOP	
L__dma_printf61:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf63
NOP	
J	L_dma_printf12
NOP	
L__dma_printf63:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf65
NOP	
J	L_dma_printf13
NOP	
L__dma_printf65:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__dma_printf67
NOP	
J	L_dma_printf14
NOP	
L__dma_printf67:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf69
NOP	
J	L_dma_printf15
NOP	
L__dma_printf69:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 111
BNE	R3, R2, L__dma_printf71
NOP	
J	L_dma_printf16
NOP	
L__dma_printf71:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 79
BNE	R3, R2, L__dma_printf73
NOP	
J	L_dma_printf17
NOP	
L__dma_printf73:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf75
NOP	
J	L_dma_printf18
NOP	
L__dma_printf75:
; j end address is: 32 (R8)
L_dma_printf10:
;Serial_Dma.c,297 :: 		}else{
; j start address is: 32 (R8)
SEH	R3, R7
; i end address is: 28 (R7)
J	L_dma_printf19
NOP	
L_dma_printf8:
;Serial_Dma.c,298 :: 		buff[j] = str[i];
; i start address is: 20 (R5)
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R4, R3, R2
SEH	R3, R5
LW	R2, 148(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Serial_Dma.c,299 :: 		j++;
ADDIU	R2, R8, 1
SEH	R8, R2
; j end address is: 32 (R8)
; i end address is: 20 (R5)
SEH	R3, R5
;Serial_Dma.c,300 :: 		}
L_dma_printf19:
;Serial_Dma.c,301 :: 		i++;
; j start address is: 32 (R8)
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Serial_Dma.c,302 :: 		}
; i end address is: 20 (R5)
J	L_dma_printf4
NOP	
;Serial_Dma.c,253 :: 		while(str && str[i]){
L__dma_printf36:
L__dma_printf35:
;Serial_Dma.c,303 :: 		buff[j] = 0;
ADDIU	R3, SP, 44
SEH	R2, R8
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Serial_Dma.c,304 :: 		strncpy(txBuf,buff,j);
SEH	R27, R8
MOVZ	R26, R3, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strncpy+0
NOP	
;Serial_Dma.c,305 :: 		DCH1SSIZ    = j ;
SEH	R2, R8
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,306 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,307 :: 		return j;
SEH	R2, R8
; j end address is: 32 (R8)
;Serial_Dma.c,309 :: 		}
;Serial_Dma.c,307 :: 		return j;
;Serial_Dma.c,309 :: 		}
L_end_dma_printf:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 148
JR	RA
NOP	
; end of _dma_printf
__itoa:
;Serial_Dma.c,311 :: 		char * _itoa(int i, char *strout, int base){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,312 :: 		char *str = strout;
; str start address is: 20 (R5)
MOVZ	R5, R26, R0
;Serial_Dma.c,313 :: 		int digit, sign = 0;
; sign start address is: 12 (R3)
MOVZ	R3, R0, R0
;Serial_Dma.c,314 :: 		if (i < 0) {
SEH	R2, R25
SLTI	R2, R2, 0
BNE	R2, R0, L___itoa77
NOP	
J	L___itoa32
NOP	
L___itoa77:
;Serial_Dma.c,315 :: 		sign = 1;
ORI	R3, R0, 1
;Serial_Dma.c,316 :: 		i *= -1;
ORI	R2, R0, 65535
MUL	R2, R25, R2
SEH	R25, R2
; sign end address is: 12 (R3)
SEH	R4, R3
;Serial_Dma.c,317 :: 		}
J	L__itoa20
NOP	
L___itoa32:
;Serial_Dma.c,314 :: 		if (i < 0) {
SEH	R4, R3
;Serial_Dma.c,317 :: 		}
L__itoa20:
;Serial_Dma.c,318 :: 		while(i) {
; sign start address is: 16 (R4)
; sign end address is: 16 (R4)
; str end address is: 20 (R5)
L__itoa21:
; sign start address is: 16 (R4)
; str start address is: 20 (R5)
BNE	R25, R0, L___itoa79
NOP	
J	L__itoa22
NOP	
L___itoa79:
;Serial_Dma.c,319 :: 		digit = i % base;
DIV	R25, R27
MFHI	R2
; digit start address is: 12 (R3)
SEH	R3, R2
;Serial_Dma.c,320 :: 		*str = (digit > 9) ? ('A' + digit - 10) : '0' + digit;
SEH	R2, R2
SLTI	R2, R2, 10
BEQ	R2, R0, L___itoa80
NOP	
J	L__itoa23
NOP	
L___itoa80:
ADDIU	R2, R3, 65
; digit end address is: 12 (R3)
ADDIU	R2, R2, -10
; ?FLOC____itoa?T153 start address is: 8 (R2)
ANDI	R2, R2, 255
; ?FLOC____itoa?T153 end address is: 8 (R2)
J	L__itoa24
NOP	
L__itoa23:
; digit start address is: 12 (R3)
ADDIU	R2, R3, 48
; digit end address is: 12 (R3)
; ?FLOC____itoa?T153 start address is: 12 (R3)
ANDI	R3, R2, 255
; ?FLOC____itoa?T153 end address is: 12 (R3)
SEH	R2, R3
L__itoa24:
; ?FLOC____itoa?T153 start address is: 8 (R2)
SB	R2, 0(R5)
; ?FLOC____itoa?T153 end address is: 8 (R2)
;Serial_Dma.c,321 :: 		i = i / base;
SEH	R3, R25
SEH	R2, R27
DIV	R3, R2
MFLO	R2
SEH	R25, R2
;Serial_Dma.c,322 :: 		str ++;
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Serial_Dma.c,323 :: 		}
J	L__itoa21
NOP	
L__itoa22:
;Serial_Dma.c,324 :: 		if(sign) {
BNE	R4, R0, L___itoa82
NOP	
J	L___itoa33
NOP	
L___itoa82:
; sign end address is: 16 (R4)
;Serial_Dma.c,325 :: 		*str++ = '-';
ORI	R2, R0, 45
SB	R2, 0(R5)
ADDIU	R2, R5, 1
; str end address is: 20 (R5)
; str start address is: 12 (R3)
MOVZ	R3, R2, R0
; str end address is: 12 (R3)
MOVZ	R2, R3, R0
;Serial_Dma.c,326 :: 		}
J	L__itoa25
NOP	
L___itoa33:
;Serial_Dma.c,324 :: 		if(sign) {
MOVZ	R2, R5, R0
;Serial_Dma.c,326 :: 		}
L__itoa25:
;Serial_Dma.c,327 :: 		*str = '\0';
; str start address is: 8 (R2)
SB	R0, 0(R2)
; str end address is: 8 (R2)
;Serial_Dma.c,328 :: 		_strrev(strout);
SH	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	__strrev+0
NOP	
LH	R25, 4(SP)
;Serial_Dma.c,329 :: 		return strout;
MOVZ	R2, R26, R0
;Serial_Dma.c,330 :: 		}
L_end__itoa:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of __itoa
__strrev:
;Serial_Dma.c,332 :: 		char *_strrev (char *str){
;Serial_Dma.c,334 :: 		int len = 0;
; len start address is: 16 (R4)
MOVZ	R4, R0, R0
;Serial_Dma.c,336 :: 		if (!str)
BEQ	R25, R0, L___strrev84
NOP	
J	L__strrev26
NOP	
L___strrev84:
; len end address is: 16 (R4)
;Serial_Dma.c,337 :: 		return NULL;
MOVZ	R2, R0, R0
J	L_end__strrev
NOP	
L__strrev26:
;Serial_Dma.c,338 :: 		while(str[len] != '\0'){
; len start address is: 16 (R4)
L__strrev27:
; len end address is: 16 (R4)
; len start address is: 16 (R4)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L___strrev86
NOP	
J	L__strrev28
NOP	
L___strrev86:
;Serial_Dma.c,339 :: 		len++;
ADDIU	R2, R4, 1
SEH	R4, R2
;Serial_Dma.c,340 :: 		}
J	L__strrev27
NOP	
L__strrev28:
;Serial_Dma.c,341 :: 		for(i = 0; i < (len/2); i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; i end address is: 20 (R5)
L__strrev29:
; i start address is: 20 (R5)
; len start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 2
DIV	R3, R2
MFLO	R2
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L___strrev87
NOP	
J	L__strrev30
NOP	
L___strrev87:
;Serial_Dma.c,343 :: 		c = str[i];
SEH	R2, R5
ADDU	R3, R25, R2
LBU	R2, 0(R3)
; c start address is: 24 (R6)
ANDI	R6, R2, 255
;Serial_Dma.c,344 :: 		str [i] = str[len - i - 1];
SUBU	R2, R4, R5
ADDIU	R2, R2, -1
SEH	R2, R2
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Serial_Dma.c,345 :: 		str[len - i - 1] = c;
SUBU	R2, R4, R5
ADDIU	R2, R2, -1
SEH	R2, R2
ADDU	R2, R25, R2
SB	R6, 0(R2)
; c end address is: 24 (R6)
;Serial_Dma.c,341 :: 		for(i = 0; i < (len/2); i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Serial_Dma.c,346 :: 		}
; len end address is: 16 (R4)
; i end address is: 20 (R5)
J	L__strrev29
NOP	
L__strrev30:
;Serial_Dma.c,347 :: 		return str;
MOVZ	R2, R25, R0
;Serial_Dma.c,348 :: 		}
L_end__strrev:
JR	RA
NOP	
; end of __strrev
