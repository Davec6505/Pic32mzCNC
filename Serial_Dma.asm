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
;Serial_Dma.c,38 :: 		void  DMA0(){
;Serial_Dma.c,40 :: 		IEC4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,41 :: 		IFS4CLR      = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,44 :: 		DCH0CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,47 :: 		DCH0ECON      =  (146 << 8 ) | 0x30;
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Serial_Dma.c,50 :: 		DCH0DAT       =  '\r';
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;Serial_Dma.c,53 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Serial_Dma.c,54 :: 		DCH0SSIZ      = 1;                 // source size = 1byte at a time
ORI	R2, R0, 1
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Serial_Dma.c,57 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,58 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Serial_Dma.c,61 :: 		DCH0CSIZ      = 1  ;  // bytes transferred in the background
ORI	R2, R0, 1
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Serial_Dma.c,65 :: 		DCH0INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,67 :: 		DCH0INTSET      =  0x90000;
LUI	R2, 9
SW	R2, Offset(DCH0INTSET+0)(GP)
;Serial_Dma.c,71 :: 		IPC33CLR     = 0x160000;
LUI	R2, 22
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,73 :: 		IPC33SET      = 0x00140000;
LUI	R2, 20
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,75 :: 		IEC4SET       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,76 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,79 :: 		DCH0CONSET      = 0X0000013;
ORI	R2, R0, 19
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,81 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA0_Enable:
;Serial_Dma.c,85 :: 		void DMA0_Enable(){
;Serial_Dma.c,94 :: 		DCH0CONSET  |= 1<<7;
LW	R2, Offset(DCH0CONSET+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,95 :: 		}
L_end_DMA0_Enable:
JR	RA
NOP	
; end of _DMA0_Enable
_DMA0_Disable:
;Serial_Dma.c,99 :: 		void DMA0_Disable(){
;Serial_Dma.c,101 :: 		DCH0CONCLR  |= 1<<7;
LW	R2, Offset(DCH0CONCLR+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,103 :: 		}
L_end_DMA0_Disable:
JR	RA
NOP	
; end of _DMA0_Disable
_DMA_CH0_ISR:
;Serial_Dma.c,107 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO{
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
;Serial_Dma.c,108 :: 		int i = 0;
;Serial_Dma.c,110 :: 		dma0int_flag = DCH0INT & 0x00FF;         //flags to sample in code if needed
LW	R2, Offset(DCH0INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,115 :: 		if (DCH0INTbits.CHBCIF == 1) {
LBU	R2, Offset(DCH0INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR41
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR41:
;Serial_Dma.c,124 :: 		}
L_DMA_CH0_ISR0:
;Serial_Dma.c,127 :: 		if( CHERIF_bit == 1){       // test error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR43
NOP	
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR43:
;Serial_Dma.c,129 :: 		strcpy(txBuf,DMAx_err(dma0,cherie));
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
;Serial_Dma.c,130 :: 		UART2_Write_Text(txBuf);
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_UART2_Write_Text+0
NOP	
;Serial_Dma.c,133 :: 		}
L_DMA_CH0_ISR1:
;Serial_Dma.c,135 :: 		DCH0INTCLR    = 0x000000ff;
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,136 :: 		IFS4CLR       = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,137 :: 		}
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
;Serial_Dma.c,151 :: 		void DMA1(){
;Serial_Dma.c,154 :: 		IPC33CLR      = 0x17000000;
LUI	R2, 5888
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,155 :: 		IEC4CLR       = 0x7;
ORI	R2, R0, 7
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,158 :: 		DCH1CONCLR = 0x8003;
ORI	R2, R0, 32771
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,161 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,165 :: 		DCH1DAT       = '\r';
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,168 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,169 :: 		DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,173 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,174 :: 		DCH1DSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,177 :: 		DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,180 :: 		DCH1INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,186 :: 		IPC33CLR     = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,188 :: 		IPC33SET    = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,190 :: 		IEC4SET     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,192 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,196 :: 		DCH1CONSET    = 0x00000003;
ORI	R2, R0, 3
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,198 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Enable:
;Serial_Dma.c,201 :: 		void DMA1_Enable(){
;Serial_Dma.c,202 :: 		DCH1CON |= 1<<7;
LW	R2, Offset(DCH1CON+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH1CON+0)(GP)
;Serial_Dma.c,203 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,207 :: 		void DMA1_Disable(){
;Serial_Dma.c,208 :: 		DCH1CON |= 1<<7;
LW	R2, Offset(DCH1CON+0)(GP)
ORI	R2, R2, 128
SW	R2, Offset(DCH1CON+0)(GP)
;Serial_Dma.c,209 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA_Busy:
;Serial_Dma.c,215 :: 		char DMA_Busy(char channel){
;Serial_Dma.c,216 :: 		if(channel == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__DMA_Busy48
NOP	
J	L_DMA_Busy2
NOP	
L__DMA_Busy48:
;Serial_Dma.c,217 :: 		return DCH0CON & 0x8000;
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32768
J	L_end_DMA_Busy
NOP	
L_DMA_Busy2:
;Serial_Dma.c,219 :: 		return DCH1CON & 0x8000;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32768
;Serial_Dma.c,220 :: 		}
L_end_DMA_Busy:
JR	RA
NOP	
; end of _DMA_Busy
_DMA_CH1_ISR:
;Serial_Dma.c,228 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
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
;Serial_Dma.c,231 :: 		dma1int_flag = DCH1INT & 0x00FF;
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 255
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,233 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(DCH1INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR51
NOP	
J	L_DMA_CH1_ISR4
NOP	
L__DMA_CH1_ISR51:
;Serial_Dma.c,234 :: 		dma1int_flag = 1;
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,235 :: 		dma0int_flag = 0;
SB	R0, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,237 :: 		}
L_DMA_CH1_ISR4:
;Serial_Dma.c,239 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR53
NOP	
J	L_DMA_CH1_ISR5
NOP	
L__DMA_CH1_ISR53:
;Serial_Dma.c,241 :: 		}
L_DMA_CH1_ISR5:
;Serial_Dma.c,246 :: 		DCH1INTCLR  = 0x00FF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,247 :: 		IFS4CLR     = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,249 :: 		}
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
;Serial_Dma.c,254 :: 		int dma_printf(const char* str,...){
ADDIU	SP, SP, -252
SW	RA, 0(SP)
;Serial_Dma.c,255 :: 		int i = 0, j=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Serial_Dma.c,256 :: 		char buff[200]={0},tmp[20];
ADDIU	R23, SP, 48
ADDIU	R22, R23, 200
LUI	R24, hi_addr(?ICSdma_printf_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSdma_printf_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Serial_Dma.c,264 :: 		va_start(va,str);
ADDIU	R3, SP, 44
ADDIU	R2, SP, 252
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;Serial_Dma.c,266 :: 		i = j = 0;
; j start address is: 32 (R8)
MOVZ	R8, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 32 (R8)
; i end address is: 20 (R5)
;Serial_Dma.c,267 :: 		while(str && str[i]){
L_dma_printf6:
; i start address is: 20 (R5)
; j start address is: 32 (R8)
LW	R2, 252(SP)
BNE	R2, R0, L__dma_printf56
NOP	
J	L__dma_printf34
NOP	
L__dma_printf56:
SEH	R3, R5
LW	R2, 252(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
BNE	R2, R0, L__dma_printf58
NOP	
J	L__dma_printf33
NOP	
L__dma_printf58:
L__dma_printf32:
;Serial_Dma.c,268 :: 		if(str[i] == '%'){
SEH	R3, R5
LW	R2, 252(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 37
BEQ	R3, R2, L__dma_printf59
NOP	
J	L_dma_printf10
NOP	
L__dma_printf59:
;Serial_Dma.c,269 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 28 (R7)
SEH	R7, R2
;Serial_Dma.c,270 :: 		switch(str[i]){
SEH	R3, R2
LW	R2, 252(SP)
ADDU	R2, R2, R3
SW	R2, 248(SP)
J	L_dma_printf11
NOP	
;Serial_Dma.c,271 :: 		case 'c':
L_dma_printf13:
;Serial_Dma.c,273 :: 		buff[j] = (char)va_arg(va,char);
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R5, R3, R2
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
SB	R2, 0(R5)
;Serial_Dma.c,274 :: 		j++;
ADDIU	R2, R8, 1
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,275 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,276 :: 		case 'd':
L_dma_printf14:
;Serial_Dma.c,278 :: 		IntToStr(va_arg(va,int),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	_IntToStr+0
NOP	
;Serial_Dma.c,279 :: 		lTrim(tmp_,&tmp);
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LW	R25, 40(SP)
JAL	_lTrim+0
NOP	
;Serial_Dma.c,280 :: 		strcat(buff+j, tmp_);
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
LW	R26, 40(SP)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,281 :: 		j += strlen(tmp_);
LW	R25, 40(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,282 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,283 :: 		case 'l':
L_dma_printf15:
;Serial_Dma.c,285 :: 		LongToStr(va_arg(va,long),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
MOVZ	R26, R5, R0
MOVZ	R25, R2, R0
JAL	_LongToStr+0
NOP	
;Serial_Dma.c,286 :: 		lTrim(tmp_,&tmp);
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LW	R25, 40(SP)
JAL	_lTrim+0
NOP	
;Serial_Dma.c,287 :: 		strcat(buff+j, tmp_);
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
LW	R26, 40(SP)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,288 :: 		j += strlen(tmp_);
LW	R25, 40(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,289 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,290 :: 		case 'x':
L_dma_printf16:
;Serial_Dma.c,291 :: 		IntToHex(va_arg(va,int),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
MOVZ	R26, R5, R0
SEH	R25, R2
JAL	_IntToHex+0
NOP	
;Serial_Dma.c,292 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,293 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,294 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,295 :: 		case 'X':
L_dma_printf17:
;Serial_Dma.c,297 :: 		LongIntToHex(va_arg(va,long),tmp);
; j start address is: 32 (R8)
ADDIU	R5, SP, 16
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
MOVZ	R26, R5, R0
MOVZ	R25, R2, R0
JAL	_LongIntToHex+0
NOP	
;Serial_Dma.c,298 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,299 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,300 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,301 :: 		case 'f':
L_dma_printf18:
;Serial_Dma.c,302 :: 		case 'F':
; j start address is: 32 (R8)
L_dma_printf19:
;Serial_Dma.c,304 :: 		FloatToStr(va_arg(va,double),tmp);
ADDIU	R5, SP, 16
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LWC1	S0, 0(R3)
MOVZ	R25, R5, R0
MOV.S 	S12, S0
JAL	_FloatToStr+0
NOP	
;Serial_Dma.c,305 :: 		strcat(buff+j, tmp);
ADDIU	R4, SP, 16
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,306 :: 		j += strlen(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,307 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,308 :: 		case 's':
L_dma_printf20:
;Serial_Dma.c,310 :: 		str_arg = va_arg( va, char* );
; j start address is: 32 (R8)
ADDIU	R4, SP, 44
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R4, 0(R3)
SW	R4, 36(SP)
;Serial_Dma.c,311 :: 		strcat(buff+j, str_arg);
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;Serial_Dma.c,312 :: 		j += strlen(str_arg);
LW	R25, 36(SP)
JAL	_strlen+0
NOP	
ADDU	R2, R8, R2
; j end address is: 32 (R8)
; j start address is: 8 (R2)
;Serial_Dma.c,313 :: 		break;
SEH	R8, R2
; j end address is: 8 (R2)
J	L_dma_printf12
NOP	
;Serial_Dma.c,314 :: 		}
L_dma_printf11:
; j start address is: 32 (R8)
LW	R4, 248(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf61
NOP	
J	L_dma_printf13
NOP	
L__dma_printf61:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf63
NOP	
J	L_dma_printf14
NOP	
L__dma_printf63:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf65
NOP	
J	L_dma_printf15
NOP	
L__dma_printf65:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__dma_printf67
NOP	
J	L_dma_printf16
NOP	
L__dma_printf67:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf69
NOP	
J	L_dma_printf17
NOP	
L__dma_printf69:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L__dma_printf71
NOP	
J	L_dma_printf18
NOP	
L__dma_printf71:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__dma_printf73
NOP	
J	L_dma_printf19
NOP	
L__dma_printf73:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf75
NOP	
J	L_dma_printf20
NOP	
L__dma_printf75:
; j end address is: 32 (R8)
L_dma_printf12:
;Serial_Dma.c,315 :: 		}else{
; j start address is: 32 (R8)
SEH	R3, R7
; i end address is: 28 (R7)
J	L_dma_printf21
NOP	
L_dma_printf10:
;Serial_Dma.c,316 :: 		*(buff+j) = *(str+i);
; i start address is: 20 (R5)
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R4, R3, R2
SEH	R3, R5
LW	R2, 252(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Serial_Dma.c,317 :: 		j++;
ADDIU	R2, R8, 1
SEH	R8, R2
; j end address is: 32 (R8)
; i end address is: 20 (R5)
SEH	R3, R5
;Serial_Dma.c,318 :: 		}
L_dma_printf21:
;Serial_Dma.c,319 :: 		i++;
; j start address is: 32 (R8)
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Serial_Dma.c,320 :: 		}
; i end address is: 20 (R5)
J	L_dma_printf6
NOP	
;Serial_Dma.c,267 :: 		while(str && str[i]){
L__dma_printf34:
L__dma_printf33:
;Serial_Dma.c,321 :: 		*(buff+j) = 0;
ADDIU	R3, SP, 48
SEH	R2, R8
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Serial_Dma.c,322 :: 		strncpy(txBuf,buff,j);
SEH	R27, R8
MOVZ	R26, R3, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_strncpy+0
NOP	
;Serial_Dma.c,323 :: 		DCH1SSIZ    = j ;
SEH	R2, R8
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,324 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,325 :: 		return j;
SEH	R2, R8
; j end address is: 32 (R8)
;Serial_Dma.c,327 :: 		}
;Serial_Dma.c,325 :: 		return j;
;Serial_Dma.c,327 :: 		}
L_end_dma_printf:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 252
JR	RA
NOP	
; end of _dma_printf
_lTrim:
;Serial_Dma.c,331 :: 		void lTrim(char *d,char* s){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,333 :: 		int i=0,j,k;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Serial_Dma.c,334 :: 		k = i;
; k start address is: 24 (R6)
SEH	R6, R5
;Serial_Dma.c,335 :: 		j = strlen(s);
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
;Serial_Dma.c,336 :: 		while(*s != '\0'){
L_lTrim22:
; j start address is: 16 (R4)
; k start address is: 12 (R3)
; i start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__lTrim78
NOP	
J	L_lTrim23
NOP	
L__lTrim78:
;Serial_Dma.c,337 :: 		if((*s > 0x30)||(k>0)){
LBU	R2, 0(R26)
ANDI	R2, R2, 255
SLTIU	R2, R2, 49
BNE	R2, R0, L__lTrim79
NOP	
J	L__lTrim31
NOP	
L__lTrim79:
SEH	R2, R3
SLTI	R2, R2, 1
BNE	R2, R0, L__lTrim80
NOP	
J	L__lTrim30
NOP	
L__lTrim80:
J	L_lTrim26
NOP	
; k end address is: 12 (R3)
L__lTrim31:
L__lTrim30:
;Serial_Dma.c,338 :: 		k = 1;
; k start address is: 12 (R3)
ORI	R3, R0, 1
;Serial_Dma.c,339 :: 		*d = *s;
LBU	R2, 0(R26)
SB	R2, 0(R25)
;Serial_Dma.c,340 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,341 :: 		}else
J	L_lTrim27
NOP	
L_lTrim26:
;Serial_Dma.c,342 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 12 (R3)
; i end address is: 20 (R5)
L_lTrim27:
;Serial_Dma.c,343 :: 		s++;
; k start address is: 12 (R3)
; i start address is: 20 (R5)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Serial_Dma.c,344 :: 		}
; k end address is: 12 (R3)
J	L_lTrim22
NOP	
L_lTrim23:
;Serial_Dma.c,345 :: 		if(i == j){
SEH	R3, R5
; i end address is: 20 (R5)
SEH	R2, R4
; j end address is: 16 (R4)
BEQ	R3, R2, L__lTrim81
NOP	
J	L_lTrim28
NOP	
L__lTrim81:
;Serial_Dma.c,346 :: 		*d = '0';
ORI	R2, R0, 48
SB	R2, 0(R25)
;Serial_Dma.c,347 :: 		d++;
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,348 :: 		}
L_lTrim28:
;Serial_Dma.c,349 :: 		*d = 0;
SB	R0, 0(R25)
;Serial_Dma.c,350 :: 		}
L_end_lTrim:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _lTrim
