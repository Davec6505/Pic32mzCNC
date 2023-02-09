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
_DMA0_Abort:
;Serial_Dma.c,118 :: 		unsigned int DMA0_Abort(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,119 :: 		DCH0ECONSET= 1<<6;
SW	R25, 4(SP)
ORI	R2, R0, 64
SW	R2, Offset(DCH0ECONSET+0)(GP)
;Serial_Dma.c,120 :: 		while(DMA_IsOn(1));
L_DMA0_Abort0:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__DMA0_Abort56
NOP	
J	L_DMA0_Abort1
NOP	
L__DMA0_Abort56:
J	L_DMA0_Abort0
NOP	
L_DMA0_Abort1:
;Serial_Dma.c,121 :: 		DMA0_Enable();
JAL	_DMA0_Enable+0
NOP	
;Serial_Dma.c,123 :: 		return (DCH0CON & 0x0040 ) >> 6;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 64
SRL	R2, R2, 6
;Serial_Dma.c,124 :: 		}
;Serial_Dma.c,123 :: 		return (DCH0CON & 0x0040 ) >> 6;
;Serial_Dma.c,124 :: 		}
L_end_DMA0_Abort:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _DMA0_Abort
_DMA0_ReadDstPtr:
;Serial_Dma.c,128 :: 		unsigned int DMA0_ReadDstPtr(){
;Serial_Dma.c,129 :: 		return DCH0DPTR;
LW	R2, Offset(DCH0DPTR+0)(GP)
;Serial_Dma.c,130 :: 		}
L_end_DMA0_ReadDstPtr:
JR	RA
NOP	
; end of _DMA0_ReadDstPtr
_DMA0_RstDstPtr:
;Serial_Dma.c,134 :: 		void DMA0_RstDstPtr(){
;Serial_Dma.c,135 :: 		DCH0DPTRCLR = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(DCH0DPTRCLR+0)(GP)
;Serial_Dma.c,136 :: 		}
L_end_DMA0_RstDstPtr:
JR	RA
NOP	
; end of _DMA0_RstDstPtr
_DMA_CH0_ISR:
;Serial_Dma.c,140 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
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
;Serial_Dma.c,141 :: 		int i = 0;
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
;Serial_Dma.c,144 :: 		dma0int_flag = DCH0INT & 0x00FF;
LW	R2, Offset(DCH0INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,147 :: 		if( CHERIF_bit == 1){       // test error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR61
NOP	
J	L_DMA_CH0_ISR2
NOP	
L__DMA_CH0_ISR61:
;Serial_Dma.c,149 :: 		strcpy(rxBuf,DMAx_err(dma0,cherie));
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
;Serial_Dma.c,153 :: 		}
L_DMA_CH0_ISR2:
;Serial_Dma.c,160 :: 		if (DCH0INTbits.CHBCIF == 1){
LBU	R2, Offset(DCH0INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR63
NOP	
J	L__DMA_CH0_ISR44
NOP	
L__DMA_CH0_ISR63:
; i end address is: 24 (R6)
;Serial_Dma.c,161 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
; i start address is: 24 (R6)
SEH	R6, R2
; i end address is: 24 (R6)
;Serial_Dma.c,162 :: 		}
J	L_DMA_CH0_ISR3
NOP	
L__DMA_CH0_ISR44:
;Serial_Dma.c,160 :: 		if (DCH0INTbits.CHBCIF == 1){
;Serial_Dma.c,162 :: 		}
L_DMA_CH0_ISR3:
;Serial_Dma.c,166 :: 		if(serial.head + i > 499)
; i start address is: 24 (R6)
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__DMA_CH0_ISR64
NOP	
J	L_DMA_CH0_ISR4
NOP	
L__DMA_CH0_ISR64:
;Serial_Dma.c,167 :: 		serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
L_DMA_CH0_ISR4:
;Serial_Dma.c,169 :: 		strncpy(serial.temp_buffer+serial.head, rxBuf, i);
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
;Serial_Dma.c,170 :: 		serial.head += i;
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
SH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,171 :: 		memset(rxBuf,0,i+2);
ADDIU	R2, R6, 2
; i end address is: 24 (R6)
SEH	R27, R2
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_memset+0
NOP	
;Serial_Dma.c,174 :: 		DCH0INTCLR    = 0x000000ff;
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,175 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,177 :: 		}
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
;Serial_Dma.c,180 :: 		static void Reset_rxBuff(int dif){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Serial_Dma.c,181 :: 		memset(rxBuf,0,dif);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SEH	R27, R25
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_memset+0
NOP	
;Serial_Dma.c,182 :: 		}
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
;Serial_Dma.c,185 :: 		int Get_Head_Value(){
;Serial_Dma.c,186 :: 		return serial.head;
LH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,187 :: 		}
L_end_Get_Head_Value:
JR	RA
NOP	
; end of _Get_Head_Value
_Get_Tail_Value:
;Serial_Dma.c,190 :: 		int Get_Tail_Value(){
;Serial_Dma.c,191 :: 		return serial.tail;
LH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,192 :: 		}
L_end_Get_Tail_Value:
JR	RA
NOP	
; end of _Get_Tail_Value
_Get_Difference:
;Serial_Dma.c,195 :: 		int Get_Difference(){
;Serial_Dma.c,197 :: 		if(serial.head > serial.tail)
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference69
NOP	
J	L_Get_Difference5
NOP	
L__Get_Difference69:
;Serial_Dma.c,198 :: 		serial.diff = serial.head - serial.tail;
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference6
NOP	
L_Get_Difference5:
;Serial_Dma.c,199 :: 		else if(serial.tail > serial.head)
LH	R3, Offset(_serial+500)(GP)
LH	R2, Offset(_serial+502)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference70
NOP	
J	L_Get_Difference7
NOP	
L__Get_Difference70:
;Serial_Dma.c,200 :: 		serial.diff =  serial.head;
LH	R2, Offset(_serial+500)(GP)
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference8
NOP	
L_Get_Difference7:
;Serial_Dma.c,202 :: 		serial.diff = 0;
SH	R0, Offset(_serial+504)(GP)
L_Get_Difference8:
L_Get_Difference6:
;Serial_Dma.c,204 :: 		return serial.diff;
LH	R2, Offset(_serial+504)(GP)
;Serial_Dma.c,205 :: 		}
L_end_Get_Difference:
JR	RA
NOP	
; end of _Get_Difference
_Reset_Ring:
;Serial_Dma.c,207 :: 		void Reset_Ring(){
;Serial_Dma.c,208 :: 		serial.tail = serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
SH	R0, Offset(_serial+502)(GP)
;Serial_Dma.c,209 :: 		}
L_end_Reset_Ring:
JR	RA
NOP	
; end of _Reset_Ring
_Get_Line:
;Serial_Dma.c,212 :: 		void Get_Line(char *str,int dif){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Serial_Dma.c,214 :: 		if(serial.tail + dif > 499)
SW	R27, 4(SP)
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Get_Line73
NOP	
J	L_Get_Line9
NOP	
L__Get_Line73:
;Serial_Dma.c,215 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Get_Line9:
;Serial_Dma.c,217 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
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
;Serial_Dma.c,221 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,222 :: 		}
L_end_Get_Line:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Get_Line
_Loopback:
;Serial_Dma.c,225 :: 		int  Loopback(){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Serial_Dma.c,229 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 52 (R13)
SEH	R13, R2
;Serial_Dma.c,231 :: 		if(serial.tail + dif > 499)
LH	R3, Offset(_serial+502)(GP)
ADDU	R2, R3, R2
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Loopback75
NOP	
J	L_Loopback10
NOP	
L__Loopback75:
;Serial_Dma.c,232 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Loopback10:
;Serial_Dma.c,234 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
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
;Serial_Dma.c,235 :: 		dma_printf("\n\t%s",str);
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
;Serial_Dma.c,237 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R13
; dif end address is: 52 (R13)
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,238 :: 		}
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
;Serial_Dma.c,253 :: 		void DMA1(){
;Serial_Dma.c,256 :: 		IPC33CLR      = 0x17000000;
LUI	R2, 5888
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,257 :: 		IEC4CLR       = 0x7;
ORI	R2, R0, 7
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,260 :: 		DCH1CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,263 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,267 :: 		DCH1DAT       = '\0';
SW	R0, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,270 :: 		DCH1SSA   = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,271 :: 		DCH1SSIZ  = 1000;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 1000
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,275 :: 		U1TXREG   = 0x00;
SW	R0, Offset(U1TXREG+0)(GP)
;Serial_Dma.c,276 :: 		DCH1DSA   = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,277 :: 		DCH1DSIZ  = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,280 :: 		DCH1CSIZ  = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,284 :: 		IPC33CLR  = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,287 :: 		DCH1INTCLR = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,290 :: 		IPC33SET  = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,296 :: 		IEC4SET   = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,298 :: 		IFS4CLR   = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,300 :: 		DCH1INTCLR = 0x00FF ;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,304 :: 		DCH1CONSET    = 0x00000003;
ORI	R2, R0, 3
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,306 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Flag:
;Serial_Dma.c,310 :: 		char DMA1_Flag(){
;Serial_Dma.c,311 :: 		return dma1int_flag;
LBU	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,312 :: 		}
L_end_DMA1_Flag:
JR	RA
NOP	
; end of _DMA1_Flag
_DMA1_Enable:
;Serial_Dma.c,318 :: 		void DMA1_Enable(){
;Serial_Dma.c,319 :: 		DCH1CONSET = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,320 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,325 :: 		void DMA1_Disable(){
;Serial_Dma.c,326 :: 		DCH1CONCLR = 1<<7;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,327 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA1_Abort:
;Serial_Dma.c,331 :: 		unsigned int DMA1_Abort(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,332 :: 		DCH1CONSET= 1<<6;
SW	R25, 4(SP)
ORI	R2, R0, 64
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,333 :: 		while(DMA_IsOn(1));
L_DMA1_Abort11:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__DMA1_Abort82
NOP	
J	L_DMA1_Abort12
NOP	
L__DMA1_Abort82:
J	L_DMA1_Abort11
NOP	
L_DMA1_Abort12:
;Serial_Dma.c,334 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,336 :: 		return (DCH1CON & 0x0040 ) >> 6;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 64
SRL	R2, R2, 6
;Serial_Dma.c,337 :: 		}
;Serial_Dma.c,336 :: 		return (DCH1CON & 0x0040 ) >> 6;
;Serial_Dma.c,337 :: 		}
L_end_DMA1_Abort:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _DMA1_Abort
_DMA_IsOn:
;Serial_Dma.c,341 :: 		unsigned int DMA_IsOn(int channel){
;Serial_Dma.c,342 :: 		if(channel == 0)
SEH	R2, R25
BEQ	R2, R0, L__DMA_IsOn84
NOP	
J	L_DMA_IsOn13
NOP	
L__DMA_IsOn84:
;Serial_Dma.c,343 :: 		return (DCH0CON & 0x8000)>>15;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
J	L_end_DMA_IsOn
NOP	
L_DMA_IsOn13:
;Serial_Dma.c,345 :: 		return (DCH1CON & 0x8000)>>15;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Serial_Dma.c,346 :: 		}
L_end_DMA_IsOn:
JR	RA
NOP	
; end of _DMA_IsOn
_DMA_CH_Busy:
;Serial_Dma.c,353 :: 		unsigned int DMA_CH_Busy(int channel){
;Serial_Dma.c,354 :: 		if(channel == 0)
SEH	R2, R25
BEQ	R2, R0, L__DMA_CH_Busy86
NOP	
J	L_DMA_CH_Busy15
NOP	
L__DMA_CH_Busy86:
;Serial_Dma.c,355 :: 		return (DCH0CON & 0x8000)>>15;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
J	L_end_DMA_CH_Busy
NOP	
L_DMA_CH_Busy15:
;Serial_Dma.c,357 :: 		return (DCH1CON & 0x8000)>>15;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Serial_Dma.c,358 :: 		}
L_end_DMA_CH_Busy:
JR	RA
NOP	
; end of _DMA_CH_Busy
_DMA_Suspend:
;Serial_Dma.c,364 :: 		unsigned int DMA_Suspend(){
;Serial_Dma.c,365 :: 		DMACONSET = (1 << 12);
ORI	R2, R0, 4096
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,368 :: 		return ((DMACON & 0x1000)>>12);
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,369 :: 		}
L_end_DMA_Suspend:
JR	RA
NOP	
; end of _DMA_Suspend
_DMA_Resume:
;Serial_Dma.c,374 :: 		unsigned int DMA_Resume(){
;Serial_Dma.c,375 :: 		DMACONCLR = (1 << 12);
ORI	R2, R0, 4096
SW	R2, Offset(DMACONCLR+0)(GP)
;Serial_Dma.c,378 :: 		return (DMACON & 0x1000)>>12;
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,379 :: 		}
L_end_DMA_Resume:
JR	RA
NOP	
; end of _DMA_Resume
_DMA_Busy:
;Serial_Dma.c,384 :: 		unsigned int DMA_Busy(){
;Serial_Dma.c,385 :: 		return ((DMACON & 0x800)>>11);
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 2048
SRL	R2, R2, 11
;Serial_Dma.c,386 :: 		}
L_end_DMA_Busy:
JR	RA
NOP	
; end of _DMA_Busy
_DMA_CH1_ISR:
;Serial_Dma.c,394 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
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
;Serial_Dma.c,397 :: 		dma1int_flag = DCH1INT & 0x00FF;
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,399 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(DCH1INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR92
NOP	
J	L_DMA_CH1_ISR17
NOP	
L__DMA_CH1_ISR92:
;Serial_Dma.c,401 :: 		}
L_DMA_CH1_ISR17:
;Serial_Dma.c,403 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR94
NOP	
J	L_DMA_CH1_ISR18
NOP	
L__DMA_CH1_ISR94:
;Serial_Dma.c,404 :: 		CABORT_DCH1ECON_bit = 1;
LUI	R2, BitMask(CABORT_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CABORT_DCH1ECON_bit+0)
_SX	
;Serial_Dma.c,405 :: 		}
L_DMA_CH1_ISR18:
;Serial_Dma.c,410 :: 		DCH1INTCLR  = 0x00FF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,411 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,413 :: 		}
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
;Serial_Dma.c,418 :: 		int dma_printf(const char* str,...){
ADDIU	SP, SP, -1568
SW	RA, 0(SP)
;Serial_Dma.c,421 :: 		int i = 0, j = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Serial_Dma.c,422 :: 		char buff[1500]={0},tmp[20],tmp1[20];
ADDIU	R23, SP, 64
ADDIU	R22, R23, 1500
LUI	R24, hi_addr(?ICSdma_printf_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSdma_printf_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Serial_Dma.c,426 :: 		if(str == 0)
LW	R2, 1568(SP)
BEQ	R2, R0, L__dma_printf96
NOP	
J	L_dma_printf19
NOP	
L__dma_printf96:
;Serial_Dma.c,427 :: 		return;
J	L_end_dma_printf
NOP	
L_dma_printf19:
;Serial_Dma.c,432 :: 		if(DMA_CH_Busy(1)){
ORI	R25, R0, 1
JAL	_DMA_CH_Busy+0
NOP	
BNE	R2, R0, L__dma_printf98
NOP	
J	L_dma_printf20
NOP	
L__dma_printf98:
;Serial_Dma.c,433 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_dma_printf
NOP	
;Serial_Dma.c,434 :: 		}
L_dma_printf20:
;Serial_Dma.c,438 :: 		va_start(va,str);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 1568
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;Serial_Dma.c,440 :: 		i = j = 0;
; j start address is: 48 (R12)
MOVZ	R12, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 48 (R12)
; i end address is: 20 (R5)
;Serial_Dma.c,441 :: 		while(*(str+i) != '\0'){
L_dma_printf21:
; i start address is: 20 (R5)
; j start address is: 48 (R12)
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__dma_printf100
NOP	
J	L_dma_printf22
NOP	
L__dma_printf100:
;Serial_Dma.c,442 :: 		if(*(str+i) == '%'){
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 37
BEQ	R3, R2, L__dma_printf101
NOP	
J	L_dma_printf23
NOP	
L__dma_printf101:
;Serial_Dma.c,443 :: 		i++;  //step over % char
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 44 (R11)
SEH	R11, R2
;Serial_Dma.c,444 :: 		switch(*(str+i)){
SEH	R3, R2
LW	R2, 1568(SP)
ADDU	R2, R2, R3
SW	R2, 1564(SP)
J	L_dma_printf24
NOP	
;Serial_Dma.c,445 :: 		case 'c':
L_dma_printf26:
;Serial_Dma.c,447 :: 		buff[j] = (char)va_arg(va,char);
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R5, R3, R2
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
SB	R2, 0(R5)
;Serial_Dma.c,448 :: 		j++;
ADDIU	R2, R12, 1
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,449 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,450 :: 		case 'd':
L_dma_printf27:
;Serial_Dma.c,452 :: 		sprintf(tmp1,"%d",va_arg(va,int));
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
;Serial_Dma.c,453 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,454 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,455 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,456 :: 		case 'u':
L_dma_printf28:
;Serial_Dma.c,458 :: 		sprintf(tmp1,"%u",va_arg(va,unsigned int));
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
;Serial_Dma.c,459 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,460 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
SEH	R12, R2
; j end address is: 48 (R12)
;Serial_Dma.c,461 :: 		case 'l':
J	L_dma_printf29
NOP	
L__dma_printf45:
;Serial_Dma.c,501 :: 		}
;Serial_Dma.c,461 :: 		case 'l':
L_dma_printf29:
;Serial_Dma.c,463 :: 		sprintf(tmp,"%ld",va_arg(va,long));
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
;Serial_Dma.c,465 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,466 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,467 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,468 :: 		case 'X':
L_dma_printf30:
;Serial_Dma.c,470 :: 		sprintf(tmp,"%X",va_arg(va,int));
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
;Serial_Dma.c,471 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,472 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,473 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,474 :: 		case 'X':
L_dma_printf31:
;Serial_Dma.c,476 :: 		sprintf(tmp,"%lX",va_arg(va,long));
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
;Serial_Dma.c,477 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,478 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,479 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,480 :: 		case 'f':
L_dma_printf32:
;Serial_Dma.c,481 :: 		sprintf(tmp,"%08.3f",va_arg(va,float));
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
J	L_dma_printf25
NOP	
;Serial_Dma.c,485 :: 		case 'F':
L_dma_printf33:
;Serial_Dma.c,486 :: 		sprintf(tmp,"%E",va_arg(va,double));
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
;Serial_Dma.c,487 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,488 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,489 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,490 :: 		case 'p':
L_dma_printf34:
;Serial_Dma.c,491 :: 		sprintf(tmp,"%p",va_arg(va,void*));
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
;Serial_Dma.c,492 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,493 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,494 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,495 :: 		case 's':
L_dma_printf35:
;Serial_Dma.c,497 :: 		str_arg = va_arg( va, char* );
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R4, 0(R3)
SW	R4, 60(SP)
;Serial_Dma.c,498 :: 		strcat(buff+j, str_arg);
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,499 :: 		j += strlen(str_arg);
LW	R25, 60(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,500 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf25
NOP	
;Serial_Dma.c,501 :: 		}
L_dma_printf24:
; j start address is: 48 (R12)
LW	R4, 1564(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf103
NOP	
J	L_dma_printf26
NOP	
L__dma_printf103:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf105
NOP	
J	L_dma_printf27
NOP	
L__dma_printf105:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 117
BNE	R3, R2, L__dma_printf107
NOP	
J	L_dma_printf28
NOP	
L__dma_printf107:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf109
NOP	
J	L__dma_printf45
NOP	
L__dma_printf109:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf111
NOP	
J	L_dma_printf30
NOP	
L__dma_printf111:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf113
NOP	
J	L_dma_printf31
NOP	
L__dma_printf113:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L__dma_printf115
NOP	
J	L_dma_printf32
NOP	
L__dma_printf115:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__dma_printf117
NOP	
J	L_dma_printf33
NOP	
L__dma_printf117:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 112
BNE	R3, R2, L__dma_printf119
NOP	
J	L_dma_printf34
NOP	
L__dma_printf119:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf121
NOP	
J	L_dma_printf35
NOP	
L__dma_printf121:
; j end address is: 48 (R12)
L_dma_printf25:
;Serial_Dma.c,502 :: 		}else{
; j start address is: 48 (R12)
SEH	R3, R11
; i end address is: 44 (R11)
J	L_dma_printf36
NOP	
L_dma_printf23:
;Serial_Dma.c,503 :: 		*(buff+j) = *(str+i);
; i start address is: 20 (R5)
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R4, R3, R2
SEH	R3, R5
LW	R2, 1568(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Serial_Dma.c,504 :: 		j++;
ADDIU	R2, R12, 1
SEH	R12, R2
; j end address is: 48 (R12)
; i end address is: 20 (R5)
SEH	R3, R5
;Serial_Dma.c,505 :: 		}
L_dma_printf36:
;Serial_Dma.c,506 :: 		i++;
; j start address is: 48 (R12)
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Serial_Dma.c,507 :: 		}
; i end address is: 20 (R5)
J	L_dma_printf21
NOP	
L_dma_printf22:
;Serial_Dma.c,508 :: 		*(buff+j+1) = 0;
ADDIU	R3, SP, 64
SEH	R2, R12
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
SB	R0, 0(R2)
;Serial_Dma.c,509 :: 		strncpy(txBuf,buff,j+1);
ADDIU	R2, R12, 1
SEH	R27, R2
MOVZ	R26, R3, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strncpy+0
NOP	
;Serial_Dma.c,510 :: 		DCH1SSIZ    = j ;
SEH	R2, R12
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,511 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,513 :: 		return j;
SEH	R2, R12
; j end address is: 48 (R12)
;Serial_Dma.c,515 :: 		}
;Serial_Dma.c,513 :: 		return j;
;Serial_Dma.c,515 :: 		}
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
;Serial_Dma.c,519 :: 		void lTrim(char *d,char* s){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,521 :: 		int i=0,j,k;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Serial_Dma.c,522 :: 		k = i;
; k start address is: 24 (R6)
SEH	R6, R5
;Serial_Dma.c,523 :: 		j = strlen(s);
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
;Serial_Dma.c,524 :: 		while(*s != '\0'){
L_lTrim37:
; j start address is: 16 (R4)
; k start address is: 12 (R3)
; i start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__lTrim124
NOP	
J	L_lTrim38
NOP	
L__lTrim124:
;Serial_Dma.c,525 :: 		if((*s > 0x30)||(k>0)){
LBU	R2, 0(R26)
ANDI	R2, R2, 255
SLTIU	R2, R2, 49
BNE	R2, R0, L__lTrim125
NOP	
J	L__lTrim48
NOP	
L__lTrim125:
SEH	R2, R3
SLTI	R2, R2, 1
BNE	R2, R0, L__lTrim126
NOP	
J	L__lTrim47
NOP	
L__lTrim126:
J	L_lTrim41
NOP	
; k end address is: 12 (R3)
L__lTrim48:
L__lTrim47:
;Serial_Dma.c,526 :: 		k = 1;
; k start address is: 12 (R3)
ORI	R3, R0, 1
;Serial_Dma.c,527 :: 		*d = *s;
LBU	R2, 0(R26)
SB	R2, 0(R25)
;Serial_Dma.c,528 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,529 :: 		}else
J	L_lTrim42
NOP	
L_lTrim41:
;Serial_Dma.c,530 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 12 (R3)
; i end address is: 20 (R5)
L_lTrim42:
;Serial_Dma.c,531 :: 		s++;
; k start address is: 12 (R3)
; i start address is: 20 (R5)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Serial_Dma.c,532 :: 		}
; k end address is: 12 (R3)
J	L_lTrim37
NOP	
L_lTrim38:
;Serial_Dma.c,533 :: 		if(i == j){
SEH	R3, R5
; i end address is: 20 (R5)
SEH	R2, R4
; j end address is: 16 (R4)
BEQ	R3, R2, L__lTrim127
NOP	
J	L_lTrim43
NOP	
L__lTrim127:
;Serial_Dma.c,534 :: 		*d = '0';
ORI	R2, R0, 48
SB	R2, 0(R25)
;Serial_Dma.c,535 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,536 :: 		}
L_lTrim43:
;Serial_Dma.c,537 :: 		*d = 0;
SB	R0, 0(R25)
;Serial_Dma.c,538 :: 		}
L_end_lTrim:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _lTrim
