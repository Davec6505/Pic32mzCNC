_DMA_global:
;Serial_Dma.c,22 :: 		void DMA_global(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,24 :: 		DMACONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,25 :: 		DMA0();
JAL	_DMA0+0
NOP	
;Serial_Dma.c,26 :: 		DMA1();
JAL	_DMA1+0
NOP	
;Serial_Dma.c,27 :: 		}
L_end_DMA_global:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DMA_global
_DMA0:
;Serial_Dma.c,40 :: 		void  DMA0(){
;Serial_Dma.c,42 :: 		IEC4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,43 :: 		IFS4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,46 :: 		DCH0CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,49 :: 		DCH0ECON      =  (146 << 8 ) | 0x30;
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Serial_Dma.c,52 :: 		DCH0DAT       = '?';//'\0' //0x0A0D;//'\r\n';
ORI	R2, R0, 63
SW	R2, Offset(DCH0DAT+0)(GP)
;Serial_Dma.c,55 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Serial_Dma.c,56 :: 		DCH0SSIZ      = 1;                 // source size = 1byte at a time
ORI	R2, R0, 1
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Serial_Dma.c,59 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,60 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Serial_Dma.c,63 :: 		DCH0CSIZ      = 1  ;  // bytes transferred in the background
ORI	R2, R0, 1
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Serial_Dma.c,67 :: 		IPC33CLR     = 0x160000;
LUI	R2, 22
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,70 :: 		DCH0INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,73 :: 		IPC33SET      = 0x00140000;
LUI	R2, 20
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,76 :: 		DCH0INTSET      =  0xB0000;
LUI	R2, 11
SW	R2, Offset(DCH0INTSET+0)(GP)
;Serial_Dma.c,79 :: 		IEC4SET       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,80 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,83 :: 		DCH0INTCLR    = 0x000000FF ;
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,87 :: 		DCH0CONSET      = 0X0000513;//013 = 1 char || 813 = 2 char e.g. \r\n
ORI	R2, R0, 1299
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,90 :: 		serial.head = serial.tail = serial.diff = 0;
SH	R0, Offset(_serial+504)(GP)
SH	R0, Offset(_serial+502)(GP)
SH	R0, Offset(_serial+500)(GP)
;Serial_Dma.c,91 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA0_Flag:
;Serial_Dma.c,95 :: 		char DMA0_Flag(){
;Serial_Dma.c,96 :: 		return dma0int_flag;
LBU	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,97 :: 		}
L_end_DMA0_Flag:
JR	RA
NOP	
; end of _DMA0_Flag
_DMA0_Enable:
;Serial_Dma.c,101 :: 		void DMA0_Enable(){
;Serial_Dma.c,104 :: 		DCH0CONSET  = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,105 :: 		IFS4CLR     = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,106 :: 		}
L_end_DMA0_Enable:
JR	RA
NOP	
; end of _DMA0_Enable
_DMA0_Disable:
;Serial_Dma.c,110 :: 		void DMA0_Disable(){
;Serial_Dma.c,112 :: 		DCH0CONCLR  = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,114 :: 		}
L_end_DMA0_Disable:
JR	RA
NOP	
; end of _DMA0_Disable
_DMA0_ReadDstPtr:
;Serial_Dma.c,119 :: 		unsigned int DMA0_ReadDstPtr(){
;Serial_Dma.c,120 :: 		return DCH0DPTR;
LW	R2, Offset(DCH0DPTR+0)(GP)
;Serial_Dma.c,121 :: 		}
L_end_DMA0_ReadDstPtr:
JR	RA
NOP	
; end of _DMA0_ReadDstPtr
_DMA0_RstDstPtr:
;Serial_Dma.c,125 :: 		void DMA0_RstDstPtr(){
;Serial_Dma.c,126 :: 		DCH0DPTRCLR = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(DCH0DPTRCLR+0)(GP)
;Serial_Dma.c,127 :: 		}
L_end_DMA0_RstDstPtr:
JR	RA
NOP	
; end of _DMA0_RstDstPtr
_DMA_CH0_ISR:
;Serial_Dma.c,131 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
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
;Serial_Dma.c,132 :: 		int i = 0;
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
;Serial_Dma.c,135 :: 		dma0int_flag = DCH0INT & 0x00FF;
LW	R2, Offset(DCH0INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,138 :: 		if( CHERIF_bit == 1){       // test error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR65
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR65:
;Serial_Dma.c,140 :: 		strcpy(rxBuf,DMAx_err(dma0,cherie));
ADDIU	R23, SP, 4
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr1_Serial_Dma+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Serial_Dma+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strcpy+0
NOP	
;Serial_Dma.c,144 :: 		}
L_DMA_CH0_ISR0:
;Serial_Dma.c,151 :: 		if (DCH0INTbits.CHBCIF == 1){
LBU	R2, Offset(DCH0INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR67
NOP	
J	L__DMA_CH0_ISR51
NOP	
L__DMA_CH0_ISR67:
; i end address is: 24 (R6)
;Serial_Dma.c,152 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
; i start address is: 24 (R6)
SEH	R6, R2
; i end address is: 24 (R6)
;Serial_Dma.c,153 :: 		}
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR51:
;Serial_Dma.c,151 :: 		if (DCH0INTbits.CHBCIF == 1){
;Serial_Dma.c,153 :: 		}
L_DMA_CH0_ISR1:
;Serial_Dma.c,157 :: 		if(serial.head + i > 499)
; i start address is: 24 (R6)
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__DMA_CH0_ISR68
NOP	
J	L_DMA_CH0_ISR2
NOP	
L__DMA_CH0_ISR68:
;Serial_Dma.c,158 :: 		serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
L_DMA_CH0_ISR2:
;Serial_Dma.c,160 :: 		strncpy(serial.temp_buffer+serial.head, rxBuf, i);
LH	R3, Offset(_serial+500)(GP)
LUI	R2, hi_addr(_serial+0)
ORI	R2, R2, lo_addr(_serial+0)
ADDU	R2, R2, R3
SEH	R27, R6
LUI	R26, 40960
ORI	R26, R26, 8192
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Serial_Dma.c,161 :: 		serial.head += i;
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
SH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,162 :: 		memset(rxBuf,0,i+2);
ADDIU	R2, R6, 2
; i end address is: 24 (R6)
SEH	R27, R2
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_memset+0
NOP	
;Serial_Dma.c,165 :: 		DCH0INTCLR    = 0x000000ff;
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,166 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,168 :: 		}
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
Serial_Dma_Reset_rxBuff:
;Serial_Dma.c,171 :: 		static void Reset_rxBuff(int dif){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Serial_Dma.c,172 :: 		memset(rxBuf,0,dif);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SEH	R27, R25
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_memset+0
NOP	
;Serial_Dma.c,173 :: 		}
L_end_Reset_rxBuff:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Serial_Dma_Reset_rxBuff
_Get_Head_Value:
;Serial_Dma.c,176 :: 		int Get_Head_Value(){
;Serial_Dma.c,177 :: 		return serial.head;
LH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,178 :: 		}
L_end_Get_Head_Value:
JR	RA
NOP	
; end of _Get_Head_Value
_Get_Tail_Value:
;Serial_Dma.c,181 :: 		int Get_Tail_Value(){
;Serial_Dma.c,182 :: 		return serial.tail;
LH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,183 :: 		}
L_end_Get_Tail_Value:
JR	RA
NOP	
; end of _Get_Tail_Value
_Get_Difference:
;Serial_Dma.c,186 :: 		int Get_Difference(){
;Serial_Dma.c,188 :: 		if(serial.head > serial.tail)
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference73
NOP	
J	L_Get_Difference3
NOP	
L__Get_Difference73:
;Serial_Dma.c,189 :: 		serial.diff = serial.head - serial.tail;
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference4
NOP	
L_Get_Difference3:
;Serial_Dma.c,190 :: 		else if(serial.tail > serial.head)
LH	R3, Offset(_serial+500)(GP)
LH	R2, Offset(_serial+502)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference74
NOP	
J	L_Get_Difference5
NOP	
L__Get_Difference74:
;Serial_Dma.c,191 :: 		serial.diff =  serial.head;
LH	R2, Offset(_serial+500)(GP)
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference6
NOP	
L_Get_Difference5:
;Serial_Dma.c,193 :: 		serial.diff = 0;
SH	R0, Offset(_serial+504)(GP)
L_Get_Difference6:
L_Get_Difference4:
;Serial_Dma.c,195 :: 		return serial.diff;
LH	R2, Offset(_serial+504)(GP)
;Serial_Dma.c,196 :: 		}
L_end_Get_Difference:
JR	RA
NOP	
; end of _Get_Difference
_Reset_Ring:
;Serial_Dma.c,198 :: 		void Reset_Ring(){
;Serial_Dma.c,199 :: 		serial.tail = serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
SH	R0, Offset(_serial+502)(GP)
;Serial_Dma.c,200 :: 		}
L_end_Reset_Ring:
JR	RA
NOP	
; end of _Reset_Ring
_Get_Line:
;Serial_Dma.c,203 :: 		void Get_Line(char *str,int dif){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Serial_Dma.c,205 :: 		if(serial.tail + dif > 499)
SW	R27, 4(SP)
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Get_Line77
NOP	
J	L_Get_Line7
NOP	
L__Get_Line77:
;Serial_Dma.c,206 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Get_Line7:
;Serial_Dma.c,208 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
LH	R3, Offset(_serial+502)(GP)
LUI	R2, hi_addr(_serial+0)
ORI	R2, R2, lo_addr(_serial+0)
ADDU	R2, R2, R3
SH	R26, 8(SP)
SEH	R27, R26
MOVZ	R26, R2, R0
JAL	_strncpy+0
NOP	
LH	R26, 8(SP)
;Serial_Dma.c,212 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,213 :: 		}
L_end_Get_Line:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Get_Line
_Loopback:
;Serial_Dma.c,216 :: 		int  Loopback(){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Serial_Dma.c,220 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 52 (R13)
SEH	R13, R2
;Serial_Dma.c,222 :: 		if(serial.tail + dif > 499)
LH	R3, Offset(_serial+502)(GP)
ADDU	R2, R3, R2
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Loopback79
NOP	
J	L_Loopback8
NOP	
L__Loopback79:
;Serial_Dma.c,223 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Loopback8:
;Serial_Dma.c,225 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
LH	R3, Offset(_serial+502)(GP)
LUI	R2, hi_addr(_serial+0)
ORI	R2, R2, lo_addr(_serial+0)
ADDU	R3, R2, R3
ADDIU	R2, SP, 16
SEH	R27, R13
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Serial_Dma.c,226 :: 		dma_printf("\n\t%s",str);
ADDIU	R3, SP, 16
ORI	R30, R0, 10
SB	R30, 66(SP)
ORI	R30, R0, 9
SB	R30, 67(SP)
ORI	R30, R0, 37
SB	R30, 68(SP)
ORI	R30, R0, 115
SB	R30, 69(SP)
MOVZ	R30, R0, R0
SB	R30, 70(SP)
ADDIU	R2, SP, 66
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Serial_Dma.c,228 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R13
; dif end address is: 52 (R13)
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,229 :: 		}
L_end_Loopback:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _Loopback
_DMA1:
;Serial_Dma.c,244 :: 		void DMA1(){
;Serial_Dma.c,247 :: 		IPC33CLR      = 0x17000000;
LUI	R2, 5888
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,248 :: 		IEC4CLR       = 0x7;
ORI	R2, R0, 7
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,251 :: 		DCH1CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,254 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,258 :: 		DCH1DAT       = '\0';
SW	R0, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,261 :: 		DCH1SSA   = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,262 :: 		DCH1SSIZ  = 1000;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 1000
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,266 :: 		U1TXREG   = 0x00;
SW	R0, Offset(U1TXREG+0)(GP)
;Serial_Dma.c,267 :: 		DCH1DSA   = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,268 :: 		DCH1DSIZ  = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,271 :: 		DCH1CSIZ  = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,275 :: 		IPC33CLR  = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,278 :: 		DCH1INTCLR = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,281 :: 		IPC33SET  = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,287 :: 		IEC4SET   = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,289 :: 		IFS4CLR   = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,291 :: 		DCH1INTCLR = 0x00FF ;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,295 :: 		DCH1CONSET    = 0x00000003;
ORI	R2, R0, 3
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,297 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Flag:
;Serial_Dma.c,301 :: 		char DMA1_Flag(){
;Serial_Dma.c,302 :: 		return dma1int_flag;
LBU	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,303 :: 		}
L_end_DMA1_Flag:
JR	RA
NOP	
; end of _DMA1_Flag
_DMA1_Enable:
;Serial_Dma.c,309 :: 		void DMA1_Enable(){
;Serial_Dma.c,310 :: 		DCH1CONSET = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,311 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,316 :: 		void DMA1_Disable(){
;Serial_Dma.c,317 :: 		DCH1CONCLR = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,318 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA_Abort:
;Serial_Dma.c,322 :: 		unsigned int DMA_Abort(int channel){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,323 :: 		if(channel == 0){
SEH	R2, R25
BEQ	R2, R0, L__DMA_Abort85
NOP	
J	L_DMA_Abort9
NOP	
L__DMA_Abort85:
;Serial_Dma.c,328 :: 		DMA0_Disable();
JAL	_DMA0_Disable+0
NOP	
;Serial_Dma.c,330 :: 		while(DMA_IsOn(0));
L_DMA_Abort10:
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__DMA_Abort87
NOP	
J	L_DMA_Abort11
NOP	
L__DMA_Abort87:
J	L_DMA_Abort10
NOP	
L_DMA_Abort11:
;Serial_Dma.c,332 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,334 :: 		DMA0_Enable();
JAL	_DMA0_Enable+0
NOP	
;Serial_Dma.c,335 :: 		while(!DMA_IsOn(0));
L_DMA_Abort12:
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__DMA_Abort88
NOP	
J	L_DMA_Abort13
NOP	
L__DMA_Abort88:
J	L_DMA_Abort12
NOP	
L_DMA_Abort13:
;Serial_Dma.c,337 :: 		return (DCH0CON & 0x0080 ) >> 7;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 128
SRL	R2, R2, 7
J	L_end_DMA_Abort
NOP	
;Serial_Dma.c,339 :: 		}else if(channel == 1){
L_DMA_Abort9:
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__DMA_Abort89
NOP	
J	L_DMA_Abort15
NOP	
L__DMA_Abort89:
;Serial_Dma.c,342 :: 		DMA1_Disable();
JAL	_DMA1_Disable+0
NOP	
;Serial_Dma.c,344 :: 		while(DMA_IsOn(1));
L_DMA_Abort16:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__DMA_Abort91
NOP	
J	L_DMA_Abort17
NOP	
L__DMA_Abort91:
J	L_DMA_Abort16
NOP	
L_DMA_Abort17:
;Serial_Dma.c,346 :: 		DCH1SSA   = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,347 :: 		while(!DMA_IsOn(1));
L_DMA_Abort18:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__DMA_Abort92
NOP	
J	L_DMA_Abort19
NOP	
L__DMA_Abort92:
J	L_DMA_Abort18
NOP	
L_DMA_Abort19:
;Serial_Dma.c,349 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,350 :: 		return (DCH1CON & 0x0080 ) >> 7;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 128
SRL	R2, R2, 7
J	L_end_DMA_Abort
NOP	
;Serial_Dma.c,351 :: 		}
L_DMA_Abort15:
;Serial_Dma.c,353 :: 		return 255;
ORI	R2, R0, 255
;Serial_Dma.c,354 :: 		}
L_end_DMA_Abort:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _DMA_Abort
_DMA_IsOn:
;Serial_Dma.c,358 :: 		unsigned int DMA_IsOn(int channel){
;Serial_Dma.c,359 :: 		if(channel == 0)
SEH	R2, R25
BEQ	R2, R0, L__DMA_IsOn94
NOP	
J	L_DMA_IsOn20
NOP	
L__DMA_IsOn94:
;Serial_Dma.c,360 :: 		return (DCH0CON & 0x8000)>>15;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
J	L_end_DMA_IsOn
NOP	
L_DMA_IsOn20:
;Serial_Dma.c,362 :: 		return (DCH1CON & 0x8000)>>15;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Serial_Dma.c,363 :: 		}
L_end_DMA_IsOn:
JR	RA
NOP	
; end of _DMA_IsOn
_DMA_CH_Busy:
;Serial_Dma.c,370 :: 		unsigned int DMA_CH_Busy(int channel){
;Serial_Dma.c,371 :: 		if(channel == 0)
SEH	R2, R25
BEQ	R2, R0, L__DMA_CH_Busy96
NOP	
J	L_DMA_CH_Busy22
NOP	
L__DMA_CH_Busy96:
;Serial_Dma.c,372 :: 		return (DCH0CON & 0x8000)>>15;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
J	L_end_DMA_CH_Busy
NOP	
L_DMA_CH_Busy22:
;Serial_Dma.c,374 :: 		return (DCH1CON & 0x8000)>>15;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Serial_Dma.c,375 :: 		}
L_end_DMA_CH_Busy:
JR	RA
NOP	
; end of _DMA_CH_Busy
_DMA_Suspend:
;Serial_Dma.c,381 :: 		unsigned int DMA_Suspend(){
;Serial_Dma.c,382 :: 		DMACONSET = (1 << 12);
ORI	R2, R0, 4096
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,385 :: 		return ((DMACON & 0x1000)>>12);
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,386 :: 		}
L_end_DMA_Suspend:
JR	RA
NOP	
; end of _DMA_Suspend
_DMA_Resume:
;Serial_Dma.c,391 :: 		unsigned int DMA_Resume(){
;Serial_Dma.c,392 :: 		DMACONCLR = (1 << 12);
ORI	R2, R0, 4096
SW	R2, Offset(DMACONCLR+0)(GP)
;Serial_Dma.c,395 :: 		return (DMACON & 0x1000)>>12;
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,396 :: 		}
L_end_DMA_Resume:
JR	RA
NOP	
; end of _DMA_Resume
_DMA_Busy:
;Serial_Dma.c,401 :: 		unsigned int DMA_Busy(){
;Serial_Dma.c,402 :: 		return ((DMACON & 0x800)>>11);
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 2048
SRL	R2, R2, 11
;Serial_Dma.c,403 :: 		}
L_end_DMA_Busy:
JR	RA
NOP	
; end of _DMA_Busy
_DMA_CH1_ISR:
;Serial_Dma.c,411 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
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
;Serial_Dma.c,414 :: 		dma1int_flag = DCH1INT & 0x00FF;
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,416 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(DCH1INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR102
NOP	
J	L_DMA_CH1_ISR24
NOP	
L__DMA_CH1_ISR102:
;Serial_Dma.c,418 :: 		}
L_DMA_CH1_ISR24:
;Serial_Dma.c,420 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR104
NOP	
J	L_DMA_CH1_ISR25
NOP	
L__DMA_CH1_ISR104:
;Serial_Dma.c,421 :: 		CABORT_DCH1ECON_bit = 1;
LUI	R2, BitMask(CABORT_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CABORT_DCH1ECON_bit+0)
_SX	
;Serial_Dma.c,422 :: 		}
L_DMA_CH1_ISR25:
;Serial_Dma.c,427 :: 		DCH1INTCLR  = 0x00FF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,428 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,430 :: 		}
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
;Serial_Dma.c,435 :: 		int dma_printf(const char* str,...){
ADDIU	SP, SP, -1568
SW	RA, 0(SP)
;Serial_Dma.c,438 :: 		int i = 0, j = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Serial_Dma.c,439 :: 		char buff[1500]={0},tmp[20],tmp1[20];
ADDIU	R23, SP, 64
ADDIU	R22, R23, 1500
LUI	R24, hi_addr(?ICSdma_printf_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSdma_printf_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Serial_Dma.c,443 :: 		if(str == 0)
LW	R2, 1568(SP)
BEQ	R2, R0, L__dma_printf106
NOP	
J	L_dma_printf26
NOP	
L__dma_printf106:
;Serial_Dma.c,444 :: 		return;
J	L_end_dma_printf
NOP	
L_dma_printf26:
;Serial_Dma.c,449 :: 		if(DMA_CH_Busy(1)){
ORI	R25, R0, 1
JAL	_DMA_CH_Busy+0
NOP	
BNE	R2, R0, L__dma_printf108
NOP	
J	L_dma_printf27
NOP	
L__dma_printf108:
;Serial_Dma.c,450 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_dma_printf
NOP	
;Serial_Dma.c,451 :: 		}
L_dma_printf27:
;Serial_Dma.c,455 :: 		va_start(va,str);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 1568
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;Serial_Dma.c,457 :: 		i = j = 0;
; j start address is: 48 (R12)
MOVZ	R12, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 48 (R12)
; i end address is: 20 (R5)
;Serial_Dma.c,458 :: 		while(*(str+i) != '\0'){
L_dma_printf28:
; i start address is: 20 (R5)
; j start address is: 48 (R12)
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__dma_printf110
NOP	
J	L_dma_printf29
NOP	
L__dma_printf110:
;Serial_Dma.c,459 :: 		if(*(str+i) == '%'){
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 37
BEQ	R3, R2, L__dma_printf111
NOP	
J	L_dma_printf30
NOP	
L__dma_printf111:
;Serial_Dma.c,460 :: 		i++;  //step over % char
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 44 (R11)
SEH	R11, R2
;Serial_Dma.c,461 :: 		switch(*(str+i)){
SEH	R3, R2
LW	R2, 1568(SP)
ADDU	R2, R2, R3
SW	R2, 1564(SP)
J	L_dma_printf31
NOP	
;Serial_Dma.c,462 :: 		case 'c':
L_dma_printf33:
;Serial_Dma.c,464 :: 		buff[j] = (char)va_arg(va,char);
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R5, R3, R2
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
SB	R2, 0(R5)
;Serial_Dma.c,465 :: 		j++;
ADDIU	R2, R12, 1
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,466 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,467 :: 		case 'd':
L_dma_printf34:
;Serial_Dma.c,469 :: 		sprintf(tmp1,"%d",va_arg(va,int));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
ADDIU	R3, SP, 40
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_3_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,470 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,471 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,472 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,473 :: 		case 'u':
L_dma_printf35:
;Serial_Dma.c,475 :: 		sprintf(tmp1,"%u",va_arg(va,unsigned int));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LHU	R2, 0(R3)
ADDIU	R3, SP, 40
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_4_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,476 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,477 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
SEH	R12, R2
; j end address is: 48 (R12)
;Serial_Dma.c,478 :: 		case 'l':
J	L_dma_printf36
NOP	
L__dma_printf52:
;Serial_Dma.c,518 :: 		}
;Serial_Dma.c,478 :: 		case 'l':
L_dma_printf36:
;Serial_Dma.c,480 :: 		sprintf(tmp,"%ld",va_arg(va,long));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_5_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,482 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,483 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,484 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,485 :: 		case 'X':
L_dma_printf37:
;Serial_Dma.c,487 :: 		sprintf(tmp,"%X",va_arg(va,int));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_6_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,488 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,489 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,490 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,491 :: 		case 'X':
L_dma_printf38:
;Serial_Dma.c,493 :: 		sprintf(tmp,"%lX",va_arg(va,long));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_7_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,494 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,495 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,496 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,497 :: 		case 'f':
L_dma_printf39:
;Serial_Dma.c,498 :: 		sprintf(tmp,"%08.3f",va_arg(va,float));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LWC1	S0, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LUI	R2, hi_addr(?lstr_8_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_8_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,499 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,500 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,501 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,502 :: 		case 'F':
L_dma_printf40:
;Serial_Dma.c,503 :: 		sprintf(tmp,"%E",va_arg(va,double));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LWC1	S0, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LUI	R2, hi_addr(?lstr_9_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_9_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,504 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,505 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,506 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,507 :: 		case 'p':
L_dma_printf41:
;Serial_Dma.c,508 :: 		sprintf(tmp,"%p",va_arg(va,void*));
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_10_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Serial_Dma.c,509 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,510 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,511 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,512 :: 		case 's':
L_dma_printf42:
;Serial_Dma.c,514 :: 		str_arg = va_arg( va, char* );
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R4, 0(R3)
SW	R4, 60(SP)
;Serial_Dma.c,515 :: 		strcat(buff+j, str_arg);
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,516 :: 		j += strlen(str_arg);
LW	R25, 60(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,517 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf32
NOP	
;Serial_Dma.c,518 :: 		}
L_dma_printf31:
; j start address is: 48 (R12)
LW	R4, 1564(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf113
NOP	
J	L_dma_printf33
NOP	
L__dma_printf113:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf115
NOP	
J	L_dma_printf34
NOP	
L__dma_printf115:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 117
BNE	R3, R2, L__dma_printf117
NOP	
J	L_dma_printf35
NOP	
L__dma_printf117:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf119
NOP	
J	L__dma_printf52
NOP	
L__dma_printf119:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf121
NOP	
J	L_dma_printf37
NOP	
L__dma_printf121:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf123
NOP	
J	L_dma_printf38
NOP	
L__dma_printf123:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L__dma_printf125
NOP	
J	L_dma_printf39
NOP	
L__dma_printf125:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__dma_printf127
NOP	
J	L_dma_printf40
NOP	
L__dma_printf127:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 112
BNE	R3, R2, L__dma_printf129
NOP	
J	L_dma_printf41
NOP	
L__dma_printf129:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf131
NOP	
J	L_dma_printf42
NOP	
L__dma_printf131:
; j end address is: 48 (R12)
L_dma_printf32:
;Serial_Dma.c,519 :: 		}else{
; j start address is: 48 (R12)
SEH	R3, R11
; i end address is: 44 (R11)
J	L_dma_printf43
NOP	
L_dma_printf30:
;Serial_Dma.c,520 :: 		*(buff+j) = *(str+i);
; i start address is: 20 (R5)
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R4, R3, R2
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Serial_Dma.c,521 :: 		j++;
ADDIU	R2, R12, 1
SEH	R12, R2
; j end address is: 48 (R12)
; i end address is: 20 (R5)
SEH	R3, R5
;Serial_Dma.c,522 :: 		}
L_dma_printf43:
;Serial_Dma.c,523 :: 		i++;
; j start address is: 48 (R12)
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Serial_Dma.c,524 :: 		}
; i end address is: 20 (R5)
J	L_dma_printf28
NOP	
L_dma_printf29:
;Serial_Dma.c,525 :: 		*(buff+j+1) = 0;
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
SB	R0, 0(R2)
;Serial_Dma.c,526 :: 		strncpy(txBuf,buff,j+1);
ADDIU	R2, R12, 1
SEH	R27, R2
MOVZ	R26, R3, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strncpy+0
NOP	
;Serial_Dma.c,527 :: 		DCH1SSIZ    = j ;
SEH	R2, R12
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,528 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,530 :: 		return j;
SEH	R2, R12
; j end address is: 48 (R12)
;Serial_Dma.c,532 :: 		}
;Serial_Dma.c,530 :: 		return j;
;Serial_Dma.c,532 :: 		}
L_end_dma_printf:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 1568
JR	RA
NOP	
; end of _dma_printf
_lTrim:
;Serial_Dma.c,536 :: 		void lTrim(char *d,char* s){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,538 :: 		int i=0,j,k;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Serial_Dma.c,539 :: 		k = i;
; k start address is: 24 (R6)
SEH	R6, R5
;Serial_Dma.c,540 :: 		j = strlen(s);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; j start address is: 16 (R4)
SEH	R4, R2
; k end address is: 24 (R6)
; j end address is: 16 (R4)
; i end address is: 20 (R5)
SEH	R3, R6
;Serial_Dma.c,541 :: 		while(*s != '\0'){
L_lTrim44:
; j start address is: 16 (R4)
; k start address is: 12 (R3)
; i start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__lTrim134
NOP	
J	L_lTrim45
NOP	
L__lTrim134:
;Serial_Dma.c,542 :: 		if((*s > 0x30)||(k>0)){
LBU	R2, 0(R26)
ANDI	R2, R2, 255
SLTIU	R2, R2, 49
BNE	R2, R0, L__lTrim135
NOP	
J	L__lTrim55
NOP	
L__lTrim135:
SEH	R2, R3
SLTI	R2, R2, 1
BNE	R2, R0, L__lTrim136
NOP	
J	L__lTrim54
NOP	
L__lTrim136:
J	L_lTrim48
NOP	
; k end address is: 12 (R3)
L__lTrim55:
L__lTrim54:
;Serial_Dma.c,543 :: 		k = 1;
; k start address is: 12 (R3)
ORI	R3, R0, 1
;Serial_Dma.c,544 :: 		*d = *s;
LBU	R2, 0(R26)
SB	R2, 0(R25)
;Serial_Dma.c,545 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,546 :: 		}else
J	L_lTrim49
NOP	
L_lTrim48:
;Serial_Dma.c,547 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 12 (R3)
; i end address is: 20 (R5)
L_lTrim49:
;Serial_Dma.c,548 :: 		s++;
; k start address is: 12 (R3)
; i start address is: 20 (R5)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Serial_Dma.c,549 :: 		}
; k end address is: 12 (R3)
J	L_lTrim44
NOP	
L_lTrim45:
;Serial_Dma.c,550 :: 		if(i == j){
SEH	R3, R5
; i end address is: 20 (R5)
SEH	R2, R4
; j end address is: 16 (R4)
BEQ	R3, R2, L__lTrim137
NOP	
J	L_lTrim50
NOP	
L__lTrim137:
;Serial_Dma.c,551 :: 		*d = '0';
ORI	R2, R0, 48
SB	R2, 0(R25)
;Serial_Dma.c,552 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,553 :: 		}
L_lTrim50:
;Serial_Dma.c,554 :: 		*d = 0;
SB	R0, 0(R25)
;Serial_Dma.c,555 :: 		}
L_end_lTrim:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _lTrim
