_DMA_global:
;Serial_Dma.c,22 :: 		void DMA_global(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,24 :: 		DMACONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(-1082060792)(GP)
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
SW	R2, Offset(-1082064636)(GP)
;Serial_Dma.c,43 :: 		IFS4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(-1082064764)(GP)
;Serial_Dma.c,46 :: 		DCH0CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(-1082060700)(GP)
;Serial_Dma.c,49 :: 		DCH0ECON      =  (146 << 8 ) | 0x30;
ORI	R2, R0, 37424
SW	R2, Offset(-1082060688)(GP)
;Serial_Dma.c,52 :: 		DCH0DAT       =  '\n';//0x0A0D;//'\n';
ORI	R2, R0, 10
SW	R2, Offset(-1082060528)(GP)
;Serial_Dma.c,55 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(-1082060656)(GP)
;Serial_Dma.c,56 :: 		DCH0SSIZ      = 1;                 // source size = 1byte at a time
ORI	R2, R0, 1
SW	R2, Offset(-1082060624)(GP)
;Serial_Dma.c,59 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(-1082060640)(GP)
;Serial_Dma.c,60 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(-1082060608)(GP)
;Serial_Dma.c,63 :: 		DCH0CSIZ      = 1  ;  // bytes transferred in the background
ORI	R2, R0, 1
SW	R2, Offset(-1082060560)(GP)
;Serial_Dma.c,67 :: 		DCH0INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(-1082060668)(GP)
;Serial_Dma.c,69 :: 		DCH0INTSET      =  0x90000;
LUI	R2, 9
SW	R2, Offset(-1082060664)(GP)
;Serial_Dma.c,73 :: 		IPC33CLR     = 0x160000;
LUI	R2, 22
SW	R2, Offset(-1082064044)(GP)
;Serial_Dma.c,75 :: 		IPC33SET      = 0x00140000;
LUI	R2, 20
SW	R2, Offset(-1082064040)(GP)
;Serial_Dma.c,77 :: 		IEC4SET       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(-1082064632)(GP)
;Serial_Dma.c,78 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(-1082064764)(GP)
;Serial_Dma.c,81 :: 		DCH0CONSET      = 0X0000013;//813 = 2 char e.g. \r\n
ORI	R2, R0, 19
SW	R2, Offset(-1082060696)(GP)
;Serial_Dma.c,84 :: 		serial.head = serial.tail = serial.diff = 0;
SH	R0, Offset(_serial+504)(GP)
SH	R0, Offset(_serial+502)(GP)
SH	R0, Offset(_serial+500)(GP)
;Serial_Dma.c,85 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA0_Enable:
;Serial_Dma.c,89 :: 		void DMA0_Enable(){
;Serial_Dma.c,98 :: 		DCH0CONSET  |= 1<<7;
LW	R2, Offset(-1082060696)(GP)
ORI	R2, R2, 128
SW	R2, Offset(-1082060696)(GP)
;Serial_Dma.c,99 :: 		}
L_end_DMA0_Enable:
JR	RA
NOP	
; end of _DMA0_Enable
_DMA0_Disable:
;Serial_Dma.c,103 :: 		void DMA0_Disable(){
;Serial_Dma.c,105 :: 		DCH0CONCLR  |= 1<<7;
LW	R2, Offset(-1082060700)(GP)
ORI	R2, R2, 128
SW	R2, Offset(-1082060700)(GP)
;Serial_Dma.c,107 :: 		}
L_end_DMA0_Disable:
JR	RA
NOP	
; end of _DMA0_Disable
_DMA_CH0_ISR:
;Serial_Dma.c,111 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
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
;Serial_Dma.c,112 :: 		int i = 0;
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
;Serial_Dma.c,114 :: 		dma0int_flag = DCH0INT & 0x00FF;         //flags to sample in code if needed
LW	R2, Offset(-1082060672)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,118 :: 		if( CHERIF_bit == 1){       // test error int flag
LBU	R2, Offset(-1082060672)(GP)
EXT	R2, R2, 0, 1
BNE	R2, 1, L__DMA_CH0_ISR49
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR49:
;Serial_Dma.c,120 :: 		strcpy(rxBuf,DMAx_err(dma0,cherie));
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
;Serial_Dma.c,121 :: 		UART2_Write_Text(txBuf);
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_UART2_Write_Text+0
NOP	
;Serial_Dma.c,124 :: 		}
L_DMA_CH0_ISR0:
;Serial_Dma.c,128 :: 		if (DCH0INTbits.CHBCIF == 1){
LBU	R2, Offset(-1082060672)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR51
NOP	
J	L__DMA_CH0_ISR38
NOP	
L__DMA_CH0_ISR51:
; i end address is: 24 (R6)
;Serial_Dma.c,129 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
; i start address is: 24 (R6)
SEH	R6, R2
; i end address is: 24 (R6)
;Serial_Dma.c,130 :: 		}
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR38:
;Serial_Dma.c,128 :: 		if (DCH0INTbits.CHBCIF == 1){
;Serial_Dma.c,130 :: 		}
L_DMA_CH0_ISR1:
;Serial_Dma.c,134 :: 		if(serial.head + i > 499)
; i start address is: 24 (R6)
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__DMA_CH0_ISR52
NOP	
J	L_DMA_CH0_ISR2
NOP	
L__DMA_CH0_ISR52:
;Serial_Dma.c,135 :: 		serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
L_DMA_CH0_ISR2:
;Serial_Dma.c,137 :: 		strncpy(serial.temp_buffer+serial.head, rxBuf, i);
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
;Serial_Dma.c,138 :: 		serial.head += i;
LH	R2, Offset(_serial+500)(GP)
ADDU	R2, R2, R6
; i end address is: 24 (R6)
SH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,139 :: 		*(rxBuf+0) = '\0';
SB	R0, Offset(-1610604544)(GP)
;Serial_Dma.c,140 :: 		DCH0INTCLR    = 0x000000ff;
ORI	R2, R0, 255
SW	R2, Offset(-1082060668)(GP)
;Serial_Dma.c,141 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(-1082064764)(GP)
;Serial_Dma.c,142 :: 		}
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
_Get_Head_Value:
;Serial_Dma.c,145 :: 		int Get_Head_Value(){
;Serial_Dma.c,146 :: 		return serial.head;
LH	R2, Offset(_serial+500)(GP)
;Serial_Dma.c,147 :: 		}
L_end_Get_Head_Value:
JR	RA
NOP	
; end of _Get_Head_Value
_Get_Tail_Value:
;Serial_Dma.c,149 :: 		int Get_Tail_Value(){
;Serial_Dma.c,150 :: 		return serial.tail;
LH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,151 :: 		}
L_end_Get_Tail_Value:
JR	RA
NOP	
; end of _Get_Tail_Value
_Get_Difference:
;Serial_Dma.c,153 :: 		int Get_Difference(){
;Serial_Dma.c,155 :: 		if(serial.head > serial.tail)
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference56
NOP	
J	L_Get_Difference3
NOP	
L__Get_Difference56:
;Serial_Dma.c,156 :: 		serial.diff = serial.head - serial.tail;
LH	R3, Offset(_serial+502)(GP)
LH	R2, Offset(_serial+500)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference4
NOP	
L_Get_Difference3:
;Serial_Dma.c,157 :: 		else if(serial.tail > serial.head)
LH	R3, Offset(_serial+500)(GP)
LH	R2, Offset(_serial+502)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Difference57
NOP	
J	L_Get_Difference5
NOP	
L__Get_Difference57:
;Serial_Dma.c,158 :: 		serial.diff =  serial.head;
LH	R2, Offset(_serial+500)(GP)
SH	R2, Offset(_serial+504)(GP)
J	L_Get_Difference6
NOP	
L_Get_Difference5:
;Serial_Dma.c,160 :: 		serial.diff = 0;
SH	R0, Offset(_serial+504)(GP)
L_Get_Difference6:
L_Get_Difference4:
;Serial_Dma.c,162 :: 		return serial.diff;
LH	R2, Offset(_serial+504)(GP)
;Serial_Dma.c,163 :: 		}
L_end_Get_Difference:
JR	RA
NOP	
; end of _Get_Difference
_Reset_Ring:
;Serial_Dma.c,165 :: 		void Reset_Ring(){
;Serial_Dma.c,166 :: 		serial.tail = serial.head = 0;
SH	R0, Offset(_serial+500)(GP)
SH	R0, Offset(_serial+502)(GP)
;Serial_Dma.c,167 :: 		}
L_end_Reset_Ring:
JR	RA
NOP	
; end of _Reset_Ring
_Get_Line:
;Serial_Dma.c,170 :: 		void Get_Line(char *str,int dif){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Serial_Dma.c,172 :: 		if(serial.tail + dif > 499)
SW	R27, 4(SP)
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Get_Line60
NOP	
J	L_Get_Line7
NOP	
L__Get_Line60:
;Serial_Dma.c,173 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Get_Line7:
;Serial_Dma.c,175 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
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
;Serial_Dma.c,178 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R26
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,179 :: 		}
L_end_Get_Line:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Get_Line
_Loopback:
;Serial_Dma.c,182 :: 		int  Loopback(){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Serial_Dma.c,186 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 52 (R13)
SEH	R13, R2
;Serial_Dma.c,188 :: 		if(serial.tail + dif > 499)
LH	R3, Offset(_serial+502)(GP)
ADDU	R2, R3, R2
SEH	R2, R2
SLTI	R2, R2, 500
BEQ	R2, R0, L__Loopback62
NOP	
J	L_Loopback8
NOP	
L__Loopback62:
;Serial_Dma.c,189 :: 		serial.tail = 0;
SH	R0, Offset(_serial+502)(GP)
L_Loopback8:
;Serial_Dma.c,191 :: 		strncpy(str,serial.temp_buffer+serial.tail,dif);
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
;Serial_Dma.c,192 :: 		dma_printf("\n\t%s",str);
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
;Serial_Dma.c,194 :: 		serial.tail += dif;
LH	R2, Offset(_serial+502)(GP)
ADDU	R2, R2, R13
; dif end address is: 52 (R13)
SH	R2, Offset(_serial+502)(GP)
;Serial_Dma.c,195 :: 		}
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
;Serial_Dma.c,210 :: 		void DMA1(){
;Serial_Dma.c,213 :: 		IPC33CLR      = 0x17000000;
LUI	R2, 5888
SW	R2, Offset(-1082064044)(GP)
;Serial_Dma.c,214 :: 		IEC4CLR       = 0x7;
ORI	R2, R0, 7
SW	R2, Offset(-1082064636)(GP)
;Serial_Dma.c,217 :: 		DCH1CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(-1082060508)(GP)
;Serial_Dma.c,220 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(-1082060496)(GP)
;Serial_Dma.c,224 :: 		DCH1DAT       = '\r';
ORI	R2, R0, 13
SW	R2, Offset(-1082060336)(GP)
;Serial_Dma.c,227 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(-1082060464)(GP)
;Serial_Dma.c,228 :: 		DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(-1082060432)(GP)
;Serial_Dma.c,232 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(-1082060448)(GP)
;Serial_Dma.c,233 :: 		DCH1DSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(-1082060416)(GP)
;Serial_Dma.c,236 :: 		DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(-1082060368)(GP)
;Serial_Dma.c,239 :: 		DCH1INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(-1082060476)(GP)
;Serial_Dma.c,245 :: 		IPC33CLR     = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(-1082064044)(GP)
;Serial_Dma.c,247 :: 		IPC33SET    = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(-1082064040)(GP)
;Serial_Dma.c,249 :: 		IEC4SET     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(-1082064632)(GP)
;Serial_Dma.c,251 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(-1082064764)(GP)
;Serial_Dma.c,255 :: 		DCH1CONSET    = 0x00000003;
ORI	R2, R0, 3
SW	R2, Offset(-1082060504)(GP)
;Serial_Dma.c,257 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Enable:
;Serial_Dma.c,260 :: 		void DMA1_Enable(){
;Serial_Dma.c,261 :: 		DCH1CON |= 1<<7;
LW	R2, Offset(-1082060512)(GP)
ORI	R2, R2, 128
SW	R2, Offset(-1082060512)(GP)
;Serial_Dma.c,262 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,266 :: 		void DMA1_Disable(){
;Serial_Dma.c,267 :: 		DCH1CON |= 1<<7;
LW	R2, Offset(-1082060512)(GP)
ORI	R2, R2, 128
SW	R2, Offset(-1082060512)(GP)
;Serial_Dma.c,268 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA_Busy:
;Serial_Dma.c,274 :: 		int DMA_Busy(int channel){
;Serial_Dma.c,275 :: 		if(channel == 0)
SEH	R2, R25
BEQ	R2, R0, L__DMA_Busy67
NOP	
J	L_DMA_Busy9
NOP	
L__DMA_Busy67:
;Serial_Dma.c,276 :: 		return (DCH0CON & 0x8000)>>15;
LW	R2, Offset(-1082060704)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
J	L_end_DMA_Busy
NOP	
L_DMA_Busy9:
;Serial_Dma.c,278 :: 		return (DCH1CON & 0x8000)>>15;
LW	R2, Offset(-1082060512)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Serial_Dma.c,279 :: 		}
L_end_DMA_Busy:
JR	RA
NOP	
; end of _DMA_Busy
_DMA_CH1_ISR:
;Serial_Dma.c,287 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
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
;Serial_Dma.c,290 :: 		dma1int_flag = DCH1INT & 0x00FF;
LW	R2, Offset(-1082060480)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,292 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(-1082060480)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR70
NOP	
J	L_DMA_CH1_ISR11
NOP	
L__DMA_CH1_ISR70:
;Serial_Dma.c,293 :: 		dma1int_flag = 1;
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,294 :: 		dma0int_flag = 0;
SB	R0, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,296 :: 		}
L_DMA_CH1_ISR11:
;Serial_Dma.c,298 :: 		if( CHERIF_DCH1INT_bit == 1){
LBU	R2, Offset(-1082060480)(GP)
EXT	R2, R2, 0, 1
BNE	R2, 1, L__DMA_CH1_ISR72
NOP	
J	L_DMA_CH1_ISR12
NOP	
L__DMA_CH1_ISR72:
;Serial_Dma.c,299 :: 		CABORT_DCH1ECON_bit = 1;
ORI	R2, R0, 64
SW	R2, Offset(-1082060488)(GP)
;Serial_Dma.c,300 :: 		}
L_DMA_CH1_ISR12:
;Serial_Dma.c,305 :: 		DCH1INTCLR  = 0x00FF;
ORI	R2, R0, 255
SW	R2, Offset(-1082060476)(GP)
;Serial_Dma.c,306 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(-1082064764)(GP)
;Serial_Dma.c,308 :: 		}
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
;Serial_Dma.c,313 :: 		int dma_printf(const char* str,...){
ADDIU	SP, SP, -256
SW	RA, 0(SP)
;Serial_Dma.c,316 :: 		int i = 0, j = 0,busy;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Serial_Dma.c,317 :: 		char buff[200]={0},tmp[20],tmp1[6];
ADDIU	R23, SP, 52
ADDIU	R22, R23, 200
LUI	R24, hi_addr(?ICSdma_printf_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSdma_printf_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Serial_Dma.c,321 :: 		if(str == 0)
LW	R2, 256(SP)
BEQ	R2, R0, L__dma_printf74
NOP	
J	L_dma_printf13
NOP	
L__dma_printf74:
;Serial_Dma.c,322 :: 		return;
J	L_end_dma_printf
NOP	
L_dma_printf13:
;Serial_Dma.c,327 :: 		if(DMA_Busy(1)){
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__dma_printf76
NOP	
J	L_dma_printf14
NOP	
L__dma_printf76:
;Serial_Dma.c,328 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_dma_printf
NOP	
;Serial_Dma.c,329 :: 		}
L_dma_printf14:
;Serial_Dma.c,333 :: 		va_start(va,str);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 256
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;Serial_Dma.c,335 :: 		i = j = 0;
; j start address is: 48 (R12)
MOVZ	R12, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 48 (R12)
; i end address is: 20 (R5)
;Serial_Dma.c,336 :: 		while(str[i]!= '\0'){
L_dma_printf15:
; i start address is: 20 (R5)
; j start address is: 48 (R12)
SEH	R3, R5
LW	R2, 256(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__dma_printf78
NOP	
J	L_dma_printf16
NOP	
L__dma_printf78:
;Serial_Dma.c,337 :: 		if(*(str+i) == '%'){
SEH	R3, R5
LW	R2, 256(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 37
BEQ	R3, R2, L__dma_printf79
NOP	
J	L_dma_printf17
NOP	
L__dma_printf79:
;Serial_Dma.c,338 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 44 (R11)
SEH	R11, R2
;Serial_Dma.c,339 :: 		switch(str[i]){
SEH	R3, R2
LW	R2, 256(SP)
ADDU	R2, R2, R3
SW	R2, 252(SP)
J	L_dma_printf18
NOP	
;Serial_Dma.c,340 :: 		case 'c':
L_dma_printf20:
;Serial_Dma.c,342 :: 		buff[j] = (char)va_arg(va,char);
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R5, R3, R2
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
SB	R2, 0(R5)
;Serial_Dma.c,343 :: 		j++;
ADDIU	R2, R12, 1
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,344 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,345 :: 		case 'd':
L_dma_printf21:
;Serial_Dma.c,347 :: 		sprintf(tmp1,"%d",va_arg(va,int));
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
;Serial_Dma.c,348 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,349 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,351 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,352 :: 		case 'u':
L_dma_printf22:
;Serial_Dma.c,354 :: 		sprintf(tmp1,"%u",va_arg(va,unsigned int));
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
;Serial_Dma.c,355 :: 		strcat(buff+j, tmp1);
ADDIU	R4, SP, 40
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,356 :: 		j += strlen(tmp1);
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
SEH	R12, R2
; j end address is: 48 (R12)
;Serial_Dma.c,357 :: 		case 'l':
J	L_dma_printf23
NOP	
L__dma_printf39:
;Serial_Dma.c,397 :: 		}
;Serial_Dma.c,357 :: 		case 'l':
L_dma_printf23:
;Serial_Dma.c,359 :: 		sprintf(tmp,"%ld",va_arg(va,long));
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
;Serial_Dma.c,361 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,362 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,363 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,364 :: 		case 'X':
L_dma_printf24:
;Serial_Dma.c,366 :: 		sprintf(tmp,"%X",va_arg(va,int));
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
;Serial_Dma.c,367 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,368 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,369 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,370 :: 		case 'X':
L_dma_printf25:
;Serial_Dma.c,372 :: 		sprintf(tmp,"%lX",va_arg(va,long));
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
;Serial_Dma.c,373 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,374 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,375 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,376 :: 		case 'f':
L_dma_printf26:
;Serial_Dma.c,377 :: 		sprintf(tmp,"%f",va_arg(va,float));
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
;Serial_Dma.c,378 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,379 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,380 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,381 :: 		case 'F':
L_dma_printf27:
;Serial_Dma.c,382 :: 		sprintf(tmp,"%E",va_arg(va,double));
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
;Serial_Dma.c,383 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,384 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,385 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,386 :: 		case 'p':
L_dma_printf28:
;Serial_Dma.c,387 :: 		sprintf(tmp,"%p",va_arg(va,void*));
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
;Serial_Dma.c,388 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 20
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,389 :: 		j += strlen(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,390 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,391 :: 		case 's':
L_dma_printf29:
;Serial_Dma.c,393 :: 		str_arg = va_arg( va, char* );
; j start address is: 48 (R12)
ADDIU	R4, SP, 16
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R4, 0(R3)
SW	R4, 48(SP)
;Serial_Dma.c,394 :: 		strcat(buff+j, str_arg);
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,395 :: 		j += strlen(str_arg);
LW	R25, 48(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R12, R2
; j end address is: 48 (R12)
; j start address is: 8 (R2)
;Serial_Dma.c,396 :: 		break;
SEH	R12, R2
; j end address is: 8 (R2)
J	L_dma_printf19
NOP	
;Serial_Dma.c,397 :: 		}
L_dma_printf18:
; j start address is: 48 (R12)
LW	R4, 252(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf81
NOP	
J	L_dma_printf20
NOP	
L__dma_printf81:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf83
NOP	
J	L_dma_printf21
NOP	
L__dma_printf83:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 117
BNE	R3, R2, L__dma_printf85
NOP	
J	L_dma_printf22
NOP	
L__dma_printf85:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf87
NOP	
J	L__dma_printf39
NOP	
L__dma_printf87:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf89
NOP	
J	L_dma_printf24
NOP	
L__dma_printf89:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf91
NOP	
J	L_dma_printf25
NOP	
L__dma_printf91:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L__dma_printf93
NOP	
J	L_dma_printf26
NOP	
L__dma_printf93:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__dma_printf95
NOP	
J	L_dma_printf27
NOP	
L__dma_printf95:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 112
BNE	R3, R2, L__dma_printf97
NOP	
J	L_dma_printf28
NOP	
L__dma_printf97:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf99
NOP	
J	L_dma_printf29
NOP	
L__dma_printf99:
; j end address is: 48 (R12)
L_dma_printf19:
;Serial_Dma.c,398 :: 		}else{
; j start address is: 48 (R12)
SEH	R3, R11
; i end address is: 44 (R11)
J	L_dma_printf30
NOP	
L_dma_printf17:
;Serial_Dma.c,399 :: 		*(buff+j) = *(str+i);
; i start address is: 20 (R5)
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R4, R3, R2
SEH	R3, R5
LW	R2, 256(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Serial_Dma.c,400 :: 		j++;
ADDIU	R2, R12, 1
SEH	R12, R2
; j end address is: 48 (R12)
; i end address is: 20 (R5)
SEH	R3, R5
;Serial_Dma.c,401 :: 		}
L_dma_printf30:
;Serial_Dma.c,402 :: 		i++;
; j start address is: 48 (R12)
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Serial_Dma.c,403 :: 		}
; i end address is: 20 (R5)
J	L_dma_printf15
NOP	
L_dma_printf16:
;Serial_Dma.c,404 :: 		*(buff+j) = 0;
ADDIU	R3, SP, 52
SEH	R2, R12
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Serial_Dma.c,405 :: 		strncpy(txBuf,buff,j-1);
ADDIU	R2, R12, -1
SEH	R27, R2
MOVZ	R26, R3, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strncpy+0
NOP	
;Serial_Dma.c,406 :: 		DCH1SSIZ    = j ;
SEH	R2, R12
SW	R2, Offset(-1082060432)(GP)
;Serial_Dma.c,407 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,408 :: 		return j;
SEH	R2, R12
; j end address is: 48 (R12)
;Serial_Dma.c,410 :: 		}
;Serial_Dma.c,408 :: 		return j;
;Serial_Dma.c,410 :: 		}
L_end_dma_printf:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 256
JR	RA
NOP	
; end of _dma_printf
_lTrim:
;Serial_Dma.c,414 :: 		void lTrim(char *d,char* s){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,416 :: 		int i=0,j,k;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Serial_Dma.c,417 :: 		k = i;
; k start address is: 24 (R6)
SEH	R6, R5
;Serial_Dma.c,418 :: 		j = strlen(s);
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
;Serial_Dma.c,419 :: 		while(*s != '\0'){
L_lTrim31:
; j start address is: 16 (R4)
; k start address is: 12 (R3)
; i start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__lTrim102
NOP	
J	L_lTrim32
NOP	
L__lTrim102:
;Serial_Dma.c,420 :: 		if((*s > 0x30)||(k>0)){
LBU	R2, 0(R26)
ANDI	R2, R2, 255
SLTIU	R2, R2, 49
BNE	R2, R0, L__lTrim103
NOP	
J	L__lTrim42
NOP	
L__lTrim103:
SEH	R2, R3
SLTI	R2, R2, 1
BNE	R2, R0, L__lTrim104
NOP	
J	L__lTrim41
NOP	
L__lTrim104:
J	L_lTrim35
NOP	
; k end address is: 12 (R3)
L__lTrim42:
L__lTrim41:
;Serial_Dma.c,421 :: 		k = 1;
; k start address is: 12 (R3)
ORI	R3, R0, 1
;Serial_Dma.c,422 :: 		*d = *s;
LBU	R2, 0(R26)
SB	R2, 0(R25)
;Serial_Dma.c,423 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,424 :: 		}else
J	L_lTrim36
NOP	
L_lTrim35:
;Serial_Dma.c,425 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 12 (R3)
; i end address is: 20 (R5)
L_lTrim36:
;Serial_Dma.c,426 :: 		s++;
; k start address is: 12 (R3)
; i start address is: 20 (R5)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Serial_Dma.c,427 :: 		}
; k end address is: 12 (R3)
J	L_lTrim31
NOP	
L_lTrim32:
;Serial_Dma.c,428 :: 		if(i == j){
SEH	R3, R5
; i end address is: 20 (R5)
SEH	R2, R4
; j end address is: 16 (R4)
BEQ	R3, R2, L__lTrim105
NOP	
J	L_lTrim37
NOP	
L__lTrim105:
;Serial_Dma.c,429 :: 		*d = '0';
ORI	R2, R0, 48
SB	R2, 0(R25)
;Serial_Dma.c,430 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,431 :: 		}
L_lTrim37:
;Serial_Dma.c,432 :: 		*d = 0;
SB	R0, 0(R25)
;Serial_Dma.c,433 :: 		}
L_end_lTrim:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _lTrim
