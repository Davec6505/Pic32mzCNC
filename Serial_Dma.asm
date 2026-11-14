Serial_Dma_Serial_DisableRxInterrupt:
;Serial_Dma.c,23 :: 		static unsigned long Serial_DisableRxInterrupt(){
;Serial_Dma.c,25 :: 		unsigned long enabled = IEC4 & 0x00040000;
LW	R3, Offset(IEC4+0)(GP)
LUI	R2, 4
AND	R3, R3, R2
;Serial_Dma.c,26 :: 		IEC4CLR = 0x00040000;
LUI	R2, 4
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,31 :: 		return enabled;
MOVZ	R2, R3, R0
;Serial_Dma.c,32 :: 		}
L_end_Serial_DisableRxInterrupt:
JR	RA
NOP	
; end of Serial_Dma_Serial_DisableRxInterrupt
Serial_Dma_Serial_RestoreRxInterrupt:
;Serial_Dma.c,34 :: 		static void Serial_RestoreRxInterrupt(unsigned long enabled){
;Serial_Dma.c,36 :: 		IEC4SET = enabled;
SW	R25, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,40 :: 		}
L_end_Serial_RestoreRxInterrupt:
JR	RA
NOP	
; end of Serial_Dma_Serial_RestoreRxInterrupt
Serial_Dma_Serial_PollText:
;Serial_Dma.c,42 :: 		static void Serial_PollText(const char *text){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,43 :: 		while(*text){
L_Serial_Dma_Serial_PollText0:
LBU	R2, 0(R25)
BNE	R2, R0, L_Serial_Dma_Serial_PollText168
NOP	
J	L_Serial_Dma_Serial_PollText1
NOP	
L_Serial_Dma_Serial_PollText168:
;Serial_Dma.c,45 :: 		UART2_Write(*text++);
SW	R25, 4(SP)
LBU	R25, 0(R25)
JAL	_UART2_Write+0
NOP	
LW	R25, 4(SP)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,49 :: 		}
J	L_Serial_Dma_Serial_PollText0
NOP	
L_Serial_Dma_Serial_PollText1:
;Serial_Dma.c,50 :: 		}
L_end_Serial_PollText:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Serial_Dma_Serial_PollText
_Reset_Ring:
;Serial_Dma.c,52 :: 		void Reset_Ring(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,53 :: 		unsigned long enabled = Serial_DisableRxInterrupt();
SW	R25, 4(SP)
JAL	Serial_Dma_Serial_DisableRxInterrupt+0
NOP	
;Serial_Dma.c,54 :: 		serial.tail = serial.head;
LHU	R3, Offset(_serial+1024)(GP)
SH	R3, Offset(_serial+1026)(GP)
;Serial_Dma.c,55 :: 		serial_realtime = 0;
SH	R0, Offset(Serial_Dma_serial_realtime+0)(GP)
;Serial_Dma.c,56 :: 		serial_rx_fault = serial_rx_discard = serial_rx_boundary = 0;
SB	R0, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
LBU	R3, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
SB	R3, Offset(Serial_Dma_serial_rx_discard+0)(GP)
LBU	R3, Offset(Serial_Dma_serial_rx_discard+0)(GP)
SB	R3, Offset(Serial_Dma_serial_rx_fault+0)(GP)
;Serial_Dma.c,57 :: 		serial_rx_bad_line = 0;
SB	R0, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
;Serial_Dma.c,58 :: 		serial_line_length = 0;
SH	R0, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,59 :: 		serial_line_overflow = serial_line_fault = serial_last_cr = 0;
SB	R0, Offset(Serial_Dma_serial_last_cr+0)(GP)
SB	R0, Offset(Serial_Dma_serial_line_fault+0)(GP)
SB	R0, Offset(Serial_Dma_serial_line_overflow+0)(GP)
;Serial_Dma.c,60 :: 		Serial_RestoreRxInterrupt(enabled);
MOVZ	R25, R2, R0
JAL	Serial_Dma_Serial_RestoreRxInterrupt+0
NOP	
;Serial_Dma.c,61 :: 		}
L_end_Reset_Ring:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Reset_Ring
_Host_GetLink:
;Serial_Dma.c,63 :: 		char Host_GetLink(){
;Serial_Dma.c,64 :: 		return host_link;
LBU	R2, Offset(Serial_Dma_host_link+0)(GP)
;Serial_Dma.c,65 :: 		}
L_end_Host_GetLink:
JR	RA
NOP	
; end of _Host_GetLink
_Host_SetLink:
;Serial_Dma.c,68 :: 		void Host_SetLink(char link){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,69 :: 		if(link == host_link) return;
ANDI	R3, R25, 255
LBU	R2, Offset(Serial_Dma_host_link+0)(GP)
BEQ	R3, R2, L__Host_SetLink172
NOP	
J	L_Host_SetLink2
NOP	
L__Host_SetLink172:
J	L_end_Host_SetLink
NOP	
L_Host_SetLink2:
;Serial_Dma.c,70 :: 		if(serial_tx_dma) while(DMA_IsOn(1));
LBU	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
BNE	R2, R0, L__Host_SetLink174
NOP	
J	L_Host_SetLink3
NOP	
L__Host_SetLink174:
L_Host_SetLink4:
SB	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LBU	R25, 4(SP)
BNE	R2, R0, L__Host_SetLink176
NOP	
J	L_Host_SetLink5
NOP	
L__Host_SetLink176:
J	L_Host_SetLink4
NOP	
L_Host_SetLink5:
L_Host_SetLink3:
;Serial_Dma.c,71 :: 		host_link = link;
SB	R25, Offset(Serial_Dma_host_link+0)(GP)
;Serial_Dma.c,72 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Serial_Dma.c,73 :: 		}
L_end_Host_SetLink:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Host_SetLink
_Serial_Init:
;Serial_Dma.c,75 :: 		void Serial_Init(char mode){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Serial_Dma.c,76 :: 		IEC4CLR = 0xC0; // Neither DMA channel may consume RX bytes.
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R2, R0, 192
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,77 :: 		IFS4CLR = 0xC0;
ORI	R2, R0, 192
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,78 :: 		DCH0CONCLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(DCH0CONCLR+0)(GP)
;Serial_Dma.c,79 :: 		DCH0INTCLR = 0x00FF00FF;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,80 :: 		DCH1CONCLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,81 :: 		DCH1INTCLR = 0x00FF00FF;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,83 :: 		IEC4CLR = 0x000E0000;
LUI	R2, 14
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,84 :: 		UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
SB	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 1
LUI	R26, 3
ORI	R26, R26, 3392
LUI	R25, 1
ORI	R25, R25, 49664
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART2_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
;Serial_Dma.c,85 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
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
LBU	R25, 20(SP)
;Serial_Dma.c,91 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_Serial_Init6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Serial_Init6
NOP	
;Serial_Dma.c,92 :: 		serial.head = serial.tail = 0;
SH	R0, Offset(_serial+1026)(GP)
SH	R0, Offset(_serial+1024)(GP)
;Serial_Dma.c,93 :: 		rxBuf[0] = 0;
SB	R0, Offset(-1610604544)(GP)
;Serial_Dma.c,94 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Serial_Dma.c,95 :: 		dma1int_flag = 0;
SB	R0, Offset(Serial_Dma_dma1int_flag+0)(GP)
;Serial_Dma.c,96 :: 		serial_tx_dma = (mode == SERIAL_MODE_RX_IRQ_DMA_TX);
ANDI	R2, R25, 255
XORI	R2, R2, 2
SLTIU	R2, R2, 1
SB	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
;Serial_Dma.c,97 :: 		if(mode != SERIAL_MODE_RX_IRQ_POLL_TX && mode != SERIAL_MODE_RX_IRQ_DMA_TX){
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Serial_Init180
NOP	
J	L__Serial_Init128
NOP	
L__Serial_Init180:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Serial_Init182
NOP	
J	L__Serial_Init127
NOP	
L__Serial_Init182:
L__Serial_Init126:
;Serial_Dma.c,98 :: 		Serial_PollText("error: Invalid serial mode\r\n");
LUI	R25, hi_addr(?lstr_1_Serial_Dma+0)
ORI	R25, R25, lo_addr(?lstr_1_Serial_Dma+0)
JAL	Serial_Dma_Serial_PollText+0
NOP	
;Serial_Dma.c,99 :: 		return;
J	L_end_Serial_Init
NOP	
;Serial_Dma.c,97 :: 		if(mode != SERIAL_MODE_RX_IRQ_POLL_TX && mode != SERIAL_MODE_RX_IRQ_DMA_TX){
L__Serial_Init128:
L__Serial_Init127:
;Serial_Dma.c,101 :: 		if(serial_tx_dma){
LBU	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
BNE	R2, R0, L__Serial_Init184
NOP	
J	L_Serial_Init11
NOP	
L__Serial_Init184:
;Serial_Dma.c,102 :: 		DMACONCLR = 0x1000;
ORI	R2, R0, 4096
SW	R2, Offset(DMACONCLR+0)(GP)
;Serial_Dma.c,103 :: 		DMACONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,104 :: 		DMA1();
JAL	_DMA1+0
NOP	
;Serial_Dma.c,105 :: 		}
L_Serial_Init11:
;Serial_Dma.c,107 :: 		Uart2InterruptSetup();
JAL	_Uart2InterruptSetup+0
NOP	
;Serial_Dma.c,111 :: 		}
L_end_Serial_Init:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Serial_Init
Serial_Dma_Serial_Push:
;Serial_Dma.c,114 :: 		static char Serial_Push(char ch, unsigned int reserve){
;Serial_Dma.c,116 :: 		if(serial.head >= serial.tail) used = serial.head - serial.tail;
LHU	R3, Offset(_serial+1026)(GP)
LHU	R2, Offset(_serial+1024)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L_Serial_Dma_Serial_Push186
NOP	
J	L_Serial_Dma_Serial_Push12
NOP	
L_Serial_Dma_Serial_Push186:
LHU	R3, Offset(_serial+1026)(GP)
LHU	R2, Offset(_serial+1024)(GP)
SUBU	R2, R2, R3
; used start address is: 12 (R3)
ANDI	R3, R2, 65535
; used end address is: 12 (R3)
J	L_Serial_Dma_Serial_Push13
NOP	
L_Serial_Dma_Serial_Push12:
;Serial_Dma.c,117 :: 		else used = SERIAL_RX_SIZE - serial.tail + serial.head;
LHU	R3, Offset(_serial+1026)(GP)
ORI	R2, R0, 1024
SUBU	R3, R2, R3
LHU	R2, Offset(_serial+1024)(GP)
ADDU	R2, R3, R2
; used start address is: 12 (R3)
ANDI	R3, R2, 65535
; used end address is: 12 (R3)
L_Serial_Dma_Serial_Push13:
;Serial_Dma.c,118 :: 		if(used + 1 + reserve >= SERIAL_RX_SIZE) return 0;
; used start address is: 12 (R3)
ADDIU	R2, R3, 1
; used end address is: 12 (R3)
ADDU	R2, R2, R26
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1024
BEQ	R2, R0, L_Serial_Dma_Serial_Push187
NOP	
J	L_Serial_Dma_Serial_Push14
NOP	
L_Serial_Dma_Serial_Push187:
MOVZ	R2, R0, R0
J	L_end_Serial_Push
NOP	
L_Serial_Dma_Serial_Push14:
;Serial_Dma.c,119 :: 		serial.temp_buffer[serial.head] = ch;
LHU	R3, Offset(_serial+1024)(GP)
LUI	R2, hi_addr(_serial+0)
ORI	R2, R2, lo_addr(_serial+0)
ADDU	R2, R2, R3
SB	R25, 0(R2)
;Serial_Dma.c,120 :: 		if(++serial.head == SERIAL_RX_SIZE) serial.head = 0;
LHU	R2, Offset(_serial+1024)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_serial+1024)(GP)
ANDI	R3, R2, 65535
ORI	R2, R0, 1024
BEQ	R3, R2, L_Serial_Dma_Serial_Push188
NOP	
J	L_Serial_Dma_Serial_Push15
NOP	
L_Serial_Dma_Serial_Push188:
SH	R0, Offset(_serial+1024)(GP)
L_Serial_Dma_Serial_Push15:
;Serial_Dma.c,121 :: 		return 1;
ORI	R2, R0, 1
;Serial_Dma.c,122 :: 		}
L_end_Serial_Push:
JR	RA
NOP	
; end of Serial_Dma_Serial_Push
Serial_Dma_Serial_HardFault:
;Serial_Dma.c,125 :: 		static void Serial_HardFault(){
;Serial_Dma.c,126 :: 		serial_rx_fault = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
;Serial_Dma.c,127 :: 		serial_rx_discard = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_discard+0)(GP)
;Serial_Dma.c,128 :: 		serial_rx_boundary = 0;
SB	R0, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
;Serial_Dma.c,129 :: 		serial_rx_bad_line = 0;
SB	R0, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
;Serial_Dma.c,130 :: 		}
L_end_Serial_HardFault:
JR	RA
NOP	
; end of Serial_Dma_Serial_HardFault
Serial_Dma_Serial_ReceiveFault:
;Serial_Dma.c,135 :: 		static void Serial_ReceiveFault(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Serial_Dma.c,136 :: 		if(serial_rx_fault || serial_rx_discard || serial_rx_bad_line) return;
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveFault191
NOP	
J	L_Serial_Dma_Serial_ReceiveFault132
NOP	
L_Serial_Dma_Serial_ReceiveFault191:
LBU	R2, Offset(Serial_Dma_serial_rx_discard+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveFault192
NOP	
J	L_Serial_Dma_Serial_ReceiveFault131
NOP	
L_Serial_Dma_Serial_ReceiveFault192:
LBU	R2, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveFault193
NOP	
J	L_Serial_Dma_Serial_ReceiveFault130
NOP	
L_Serial_Dma_Serial_ReceiveFault193:
J	L_Serial_Dma_Serial_ReceiveFault18
NOP	
L_Serial_Dma_Serial_ReceiveFault132:
L_Serial_Dma_Serial_ReceiveFault131:
L_Serial_Dma_Serial_ReceiveFault130:
J	L_end_Serial_ReceiveFault
NOP	
L_Serial_Dma_Serial_ReceiveFault18:
;Serial_Dma.c,137 :: 		if(Serial_Push(SERIAL_FAULT_MARK,0)) serial_rx_bad_line = 1;
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	Serial_Dma_Serial_Push+0
NOP	
BNE	R2, R0, L_Serial_Dma_Serial_ReceiveFault195
NOP	
J	L_Serial_Dma_Serial_ReceiveFault19
NOP	
L_Serial_Dma_Serial_ReceiveFault195:
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
J	L_Serial_Dma_Serial_ReceiveFault20
NOP	
L_Serial_Dma_Serial_ReceiveFault19:
;Serial_Dma.c,138 :: 		else Serial_HardFault();
JAL	Serial_Dma_Serial_HardFault+0
NOP	
L_Serial_Dma_Serial_ReceiveFault20:
;Serial_Dma.c,139 :: 		}
L_end_Serial_ReceiveFault:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Serial_Dma_Serial_ReceiveFault
Serial_Dma_Serial_EndBadLine:
;Serial_Dma.c,142 :: 		static void Serial_EndBadLine(char ch){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,143 :: 		serial_rx_bad_line = 0;
SW	R26, 4(SP)
SB	R0, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
;Serial_Dma.c,144 :: 		if(!Serial_Push(ch,0)){
MOVZ	R26, R0, R0
JAL	Serial_Dma_Serial_Push+0
NOP	
BEQ	R2, R0, L_Serial_Dma_Serial_EndBadLine197
NOP	
J	L_Serial_Dma_Serial_EndBadLine21
NOP	
L_Serial_Dma_Serial_EndBadLine197:
;Serial_Dma.c,145 :: 		Serial_HardFault();
JAL	Serial_Dma_Serial_HardFault+0
NOP	
;Serial_Dma.c,146 :: 		serial_rx_boundary = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
;Serial_Dma.c,147 :: 		}
L_Serial_Dma_Serial_EndBadLine21:
;Serial_Dma.c,148 :: 		}
L_end_Serial_EndBadLine:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Serial_Dma_Serial_EndBadLine
Serial_Dma_Serial_ReceiveByte:
;Serial_Dma.c,150 :: 		static void Serial_ReceiveByte(char ch){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,151 :: 		switch(ch){
SW	R26, 4(SP)
J	L_Serial_Dma_Serial_ReceiveByte22
NOP	
;Serial_Dma.c,152 :: 		case CMD_STATUS_REPORT: serial_realtime |= EXEC_STATUS_REPORT; return;
L_Serial_Dma_Serial_ReceiveByte24:
LHU	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
ORI	R2, R2, 1
SH	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,153 :: 		case CMD_CYCLE_START: serial_realtime |= EXEC_CYCLE_START; return;
L_Serial_Dma_Serial_ReceiveByte25:
LHU	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
ORI	R2, R2, 2
SH	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,154 :: 		case CMD_FEED_HOLD: serial_realtime |= EXEC_FEED_HOLD; return;
L_Serial_Dma_Serial_ReceiveByte26:
LHU	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
ORI	R2, R2, 8
SH	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,155 :: 		case CMD_RESET: serial_realtime |= EXEC_RESET; return;
L_Serial_Dma_Serial_ReceiveByte27:
LHU	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
ORI	R2, R2, 16
SH	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,156 :: 		}
L_Serial_Dma_Serial_ReceiveByte22:
ANDI	R3, R25, 255
ORI	R2, R0, 63
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte200
NOP	
J	L_Serial_Dma_Serial_ReceiveByte24
NOP	
L_Serial_Dma_Serial_ReceiveByte200:
ANDI	R3, R25, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte202
NOP	
J	L_Serial_Dma_Serial_ReceiveByte25
NOP	
L_Serial_Dma_Serial_ReceiveByte202:
ANDI	R3, R25, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte204
NOP	
J	L_Serial_Dma_Serial_ReceiveByte26
NOP	
L_Serial_Dma_Serial_ReceiveByte204:
ANDI	R3, R25, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte206
NOP	
J	L_Serial_Dma_Serial_ReceiveByte27
NOP	
L_Serial_Dma_Serial_ReceiveByte206:
;Serial_Dma.c,159 :: 		if((unsigned char)ch >= 0x80) return;
ANDI	R2, R25, 255
SLTIU	R2, R2, 128
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveByte207
NOP	
J	L_Serial_Dma_Serial_ReceiveByte28
NOP	
L_Serial_Dma_Serial_ReceiveByte207:
J	L_end_Serial_ReceiveByte
NOP	
L_Serial_Dma_Serial_ReceiveByte28:
;Serial_Dma.c,160 :: 		if(ch == 0 || ch == SERIAL_FAULT_MARK){
ANDI	R2, R25, 255
BNE	R2, R0, L_Serial_Dma_Serial_ReceiveByte209
NOP	
J	L_Serial_Dma_Serial_ReceiveByte139
NOP	
L_Serial_Dma_Serial_ReceiveByte209:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte211
NOP	
J	L_Serial_Dma_Serial_ReceiveByte138
NOP	
L_Serial_Dma_Serial_ReceiveByte211:
J	L_Serial_Dma_Serial_ReceiveByte31
NOP	
L_Serial_Dma_Serial_ReceiveByte139:
L_Serial_Dma_Serial_ReceiveByte138:
;Serial_Dma.c,161 :: 		Serial_ReceiveFault();
JAL	Serial_Dma_Serial_ReceiveFault+0
NOP	
;Serial_Dma.c,162 :: 		return;
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,163 :: 		}
L_Serial_Dma_Serial_ReceiveByte31:
;Serial_Dma.c,164 :: 		if(serial_rx_bad_line){
LBU	R2, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
BNE	R2, R0, L_Serial_Dma_Serial_ReceiveByte213
NOP	
J	L_Serial_Dma_Serial_ReceiveByte32
NOP	
L_Serial_Dma_Serial_ReceiveByte213:
;Serial_Dma.c,165 :: 		if(ch == '\r' || ch == '\n') Serial_EndBadLine(ch);
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte215
NOP	
J	L_Serial_Dma_Serial_ReceiveByte141
NOP	
L_Serial_Dma_Serial_ReceiveByte215:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte217
NOP	
J	L_Serial_Dma_Serial_ReceiveByte140
NOP	
L_Serial_Dma_Serial_ReceiveByte217:
J	L_Serial_Dma_Serial_ReceiveByte35
NOP	
L_Serial_Dma_Serial_ReceiveByte141:
L_Serial_Dma_Serial_ReceiveByte140:
JAL	Serial_Dma_Serial_EndBadLine+0
NOP	
L_Serial_Dma_Serial_ReceiveByte35:
;Serial_Dma.c,166 :: 		return;
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,167 :: 		}
L_Serial_Dma_Serial_ReceiveByte32:
;Serial_Dma.c,168 :: 		if(serial_rx_fault || serial_rx_discard){
LBU	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveByte218
NOP	
J	L_Serial_Dma_Serial_ReceiveByte143
NOP	
L_Serial_Dma_Serial_ReceiveByte218:
LBU	R2, Offset(Serial_Dma_serial_rx_discard+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveByte219
NOP	
J	L_Serial_Dma_Serial_ReceiveByte142
NOP	
L_Serial_Dma_Serial_ReceiveByte219:
J	L_Serial_Dma_Serial_ReceiveByte38
NOP	
L_Serial_Dma_Serial_ReceiveByte143:
L_Serial_Dma_Serial_ReceiveByte142:
;Serial_Dma.c,169 :: 		if(ch == '\r' || ch == '\n'){
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte221
NOP	
J	L_Serial_Dma_Serial_ReceiveByte145
NOP	
L_Serial_Dma_Serial_ReceiveByte221:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte223
NOP	
J	L_Serial_Dma_Serial_ReceiveByte144
NOP	
L_Serial_Dma_Serial_ReceiveByte223:
J	L_Serial_Dma_Serial_ReceiveByte41
NOP	
L_Serial_Dma_Serial_ReceiveByte145:
L_Serial_Dma_Serial_ReceiveByte144:
;Serial_Dma.c,170 :: 		serial_rx_boundary = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
;Serial_Dma.c,171 :: 		if(!serial_rx_fault) serial_rx_discard = 0;
LBU	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveByte224
NOP	
J	L_Serial_Dma_Serial_ReceiveByte42
NOP	
L_Serial_Dma_Serial_ReceiveByte224:
SB	R0, Offset(Serial_Dma_serial_rx_discard+0)(GP)
L_Serial_Dma_Serial_ReceiveByte42:
;Serial_Dma.c,172 :: 		}else{
J	L_Serial_Dma_Serial_ReceiveByte43
NOP	
L_Serial_Dma_Serial_ReceiveByte41:
;Serial_Dma.c,173 :: 		serial_rx_boundary = 0;
SB	R0, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
;Serial_Dma.c,174 :: 		}
L_Serial_Dma_Serial_ReceiveByte43:
;Serial_Dma.c,175 :: 		return;
J	L_end_Serial_ReceiveByte
NOP	
;Serial_Dma.c,176 :: 		}
L_Serial_Dma_Serial_ReceiveByte38:
;Serial_Dma.c,178 :: 		if(!Serial_Push(ch,1)){
ORI	R26, R0, 1
JAL	Serial_Dma_Serial_Push+0
NOP	
BEQ	R2, R0, L_Serial_Dma_Serial_ReceiveByte225
NOP	
J	L_Serial_Dma_Serial_ReceiveByte44
NOP	
L_Serial_Dma_Serial_ReceiveByte225:
;Serial_Dma.c,179 :: 		Serial_ReceiveFault();
JAL	Serial_Dma_Serial_ReceiveFault+0
NOP	
;Serial_Dma.c,180 :: 		if(ch == '\r' || ch == '\n'){
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte227
NOP	
J	L_Serial_Dma_Serial_ReceiveByte147
NOP	
L_Serial_Dma_Serial_ReceiveByte227:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Serial_Dma_Serial_ReceiveByte229
NOP	
J	L_Serial_Dma_Serial_ReceiveByte146
NOP	
L_Serial_Dma_Serial_ReceiveByte229:
J	L_Serial_Dma_Serial_ReceiveByte47
NOP	
L_Serial_Dma_Serial_ReceiveByte147:
L_Serial_Dma_Serial_ReceiveByte146:
;Serial_Dma.c,181 :: 		if(serial_rx_bad_line) Serial_EndBadLine(ch);
LBU	R2, Offset(Serial_Dma_serial_rx_bad_line+0)(GP)
BNE	R2, R0, L_Serial_Dma_Serial_ReceiveByte231
NOP	
J	L_Serial_Dma_Serial_ReceiveByte48
NOP	
L_Serial_Dma_Serial_ReceiveByte231:
JAL	Serial_Dma_Serial_EndBadLine+0
NOP	
J	L_Serial_Dma_Serial_ReceiveByte49
NOP	
L_Serial_Dma_Serial_ReceiveByte48:
;Serial_Dma.c,182 :: 		else serial_rx_boundary = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
L_Serial_Dma_Serial_ReceiveByte49:
;Serial_Dma.c,183 :: 		}
L_Serial_Dma_Serial_ReceiveByte47:
;Serial_Dma.c,184 :: 		}
L_Serial_Dma_Serial_ReceiveByte44:
;Serial_Dma.c,185 :: 		}
L_end_Serial_ReceiveByte:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Serial_Dma_Serial_ReceiveByte
_Uart2InterruptSetup:
;Serial_Dma.c,188 :: 		void Uart2InterruptSetup(){
;Serial_Dma.c,189 :: 		IEC4CLR = 0x000E0000;
LUI	R2, 14
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,190 :: 		U2STACLR = 0xC0;
ORI	R2, R0, 192
SW	R2, Offset(U2STACLR+0)(GP)
;Serial_Dma.c,191 :: 		IPC36CLR = 0x001F0000;
LUI	R2, 31
SW	R2, Offset(IPC36CLR+0)(GP)
;Serial_Dma.c,192 :: 		IPC36SET = 0x00150000;
LUI	R2, 21
SW	R2, Offset(IPC36SET+0)(GP)
;Serial_Dma.c,193 :: 		IFS4CLR = 0x000E0000;
LUI	R2, 14
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,194 :: 		IEC4SET = 0x00040000;
LUI	R2, 4
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,195 :: 		}
L_end_Uart2InterruptSetup:
JR	RA
NOP	
; end of _Uart2InterruptSetup
_UART2:
;Serial_Dma.c,197 :: 		void UART2() iv IVT_UART2_RX ilevel 5 ics ICS_SRS {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,200 :: 		IFS4CLR = 0x00040000;
LUI	R2, 4
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,201 :: 		if(U2STA & 0x2){
LW	R2, Offset(U2STA+0)(GP)
ANDI	R2, R2, 2
BNE	R2, R0, L__UART2235
NOP	
J	L_UART250
NOP	
L__UART2235:
;Serial_Dma.c,202 :: 		if(host_link == HOST_LINK_SERIAL) Serial_ReceiveFault();
LBU	R2, Offset(Serial_Dma_host_link+0)(GP)
BEQ	R2, R0, L__UART2236
NOP	
J	L_UART251
NOP	
L__UART2236:
JAL	Serial_Dma_Serial_ReceiveFault+0
NOP	
L_UART251:
;Serial_Dma.c,203 :: 		U2STACLR = 0x2;
ORI	R2, R0, 2
SW	R2, Offset(U2STACLR+0)(GP)
;Serial_Dma.c,204 :: 		}
L_UART250:
;Serial_Dma.c,205 :: 		while(U2STA & 0x1){
L_UART252:
LW	R2, Offset(U2STA+0)(GP)
ANDI	R2, R2, 1
BNE	R2, R0, L__UART2238
NOP	
J	L_UART253
NOP	
L__UART2238:
;Serial_Dma.c,206 :: 		status = U2STA;
; status start address is: 12 (R3)
LW	R3, Offset(U2STA+0)(GP)
;Serial_Dma.c,207 :: 		ch = U2RXREG;
; ch start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Serial_Dma.c,208 :: 		if(host_link != HOST_LINK_SERIAL) continue;
LBU	R2, Offset(Serial_Dma_host_link+0)(GP)
BNE	R2, R0, L__UART2240
NOP	
J	L_UART254
NOP	
L__UART2240:
; status end address is: 12 (R3)
; ch end address is: 16 (R4)
J	L_UART252
NOP	
L_UART254:
;Serial_Dma.c,209 :: 		if(status & 0xC) Serial_ReceiveFault();
; ch start address is: 16 (R4)
; status start address is: 12 (R3)
ANDI	R2, R3, 12
; status end address is: 12 (R3)
BNE	R2, R0, L__UART2242
NOP	
J	L_UART255
NOP	
L__UART2242:
; ch end address is: 16 (R4)
JAL	Serial_Dma_Serial_ReceiveFault+0
NOP	
J	L_UART256
NOP	
L_UART255:
;Serial_Dma.c,210 :: 		else Serial_ReceiveByte(ch);
; ch start address is: 16 (R4)
ANDI	R25, R4, 255
; ch end address is: 16 (R4)
JAL	Serial_Dma_Serial_ReceiveByte+0
NOP	
L_UART256:
;Serial_Dma.c,211 :: 		}
J	L_UART252
NOP	
L_UART253:
;Serial_Dma.c,212 :: 		}
L_end_UART2:
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
; end of _UART2
_Host_ReceiveBytes:
;Serial_Dma.c,242 :: 		void Host_ReceiveBytes(char *bytes, unsigned int n){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,244 :: 		if(host_link != HOST_LINK_ETHERNET) return;
LBU	R3, Offset(Serial_Dma_host_link+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Host_ReceiveBytes245
NOP	
J	L_Host_ReceiveBytes57
NOP	
L__Host_ReceiveBytes245:
J	L_end_Host_ReceiveBytes
NOP	
L_Host_ReceiveBytes57:
;Serial_Dma.c,245 :: 		enabled = Serial_DisableRxInterrupt();
JAL	Serial_Dma_Serial_DisableRxInterrupt+0
NOP	
; enabled start address is: 16 (R4)
MOVZ	R4, R2, R0
; enabled end address is: 16 (R4)
;Serial_Dma.c,246 :: 		while(n--) Serial_ReceiveByte(*bytes++);
L_Host_ReceiveBytes58:
; enabled start address is: 16 (R4)
ANDI	R3, R26, 65535
ADDIU	R2, R26, -1
ANDI	R26, R2, 65535
BNE	R3, R0, L__Host_ReceiveBytes247
NOP	
J	L_Host_ReceiveBytes59
NOP	
L__Host_ReceiveBytes247:
SW	R25, 4(SP)
LBU	R25, 0(R25)
JAL	Serial_Dma_Serial_ReceiveByte+0
NOP	
LW	R25, 4(SP)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
J	L_Host_ReceiveBytes58
NOP	
L_Host_ReceiveBytes59:
;Serial_Dma.c,247 :: 		Serial_RestoreRxInterrupt(enabled);
SW	R25, 4(SP)
; enabled end address is: 16 (R4)
MOVZ	R25, R4, R0
JAL	Serial_Dma_Serial_RestoreRxInterrupt+0
NOP	
LW	R25, 4(SP)
;Serial_Dma.c,248 :: 		}
L_end_Host_ReceiveBytes:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Host_ReceiveBytes
_Serial_TakeRealtime:
;Serial_Dma.c,250 :: 		unsigned int Serial_TakeRealtime(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,252 :: 		unsigned long enabled = Serial_DisableRxInterrupt();
SW	R25, 4(SP)
JAL	Serial_Dma_Serial_DisableRxInterrupt+0
NOP	
;Serial_Dma.c,253 :: 		flags = serial_realtime;
; flags start address is: 12 (R3)
LHU	R3, Offset(Serial_Dma_serial_realtime+0)(GP)
;Serial_Dma.c,254 :: 		serial_realtime = 0;
SH	R0, Offset(Serial_Dma_serial_realtime+0)(GP)
;Serial_Dma.c,255 :: 		Serial_RestoreRxInterrupt(enabled);
MOVZ	R25, R2, R0
JAL	Serial_Dma_Serial_RestoreRxInterrupt+0
NOP	
;Serial_Dma.c,256 :: 		return flags;
ANDI	R2, R3, 65535
; flags end address is: 12 (R3)
;Serial_Dma.c,257 :: 		}
;Serial_Dma.c,256 :: 		return flags;
;Serial_Dma.c,257 :: 		}
L_end_Serial_TakeRealtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Serial_TakeRealtime
_Serial_PeekRealtime:
;Serial_Dma.c,259 :: 		unsigned int Serial_PeekRealtime(){
;Serial_Dma.c,260 :: 		return serial_realtime;
LHU	R2, Offset(Serial_Dma_serial_realtime+0)(GP)
;Serial_Dma.c,261 :: 		}
L_end_Serial_PeekRealtime:
JR	RA
NOP	
; end of _Serial_PeekRealtime
_Serial_TakeStatusRequest:
;Serial_Dma.c,263 :: 		char Serial_TakeStatusRequest(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,265 :: 		unsigned long enabled = Serial_DisableRxInterrupt();
SW	R25, 4(SP)
JAL	Serial_Dma_Serial_DisableRxInterrupt+0
NOP	
;Serial_Dma.c,266 :: 		taken = (serial_realtime & EXEC_STATUS_REPORT) != 0;
LHU	R3, Offset(Serial_Dma_serial_realtime+0)(GP)
ANDI	R3, R3, 1
ANDI	R3, R3, 65535
XORI	R3, R3, 0
SLTU	R3, R0, R3
; taken start address is: 20 (R5)
MOVZ	R5, R3, R0
;Serial_Dma.c,267 :: 		serial_realtime &= ~EXEC_STATUS_REPORT;
LHU	R4, Offset(Serial_Dma_serial_realtime+0)(GP)
ORI	R3, R0, 65534
AND	R3, R4, R3
SH	R3, Offset(Serial_Dma_serial_realtime+0)(GP)
;Serial_Dma.c,268 :: 		Serial_RestoreRxInterrupt(enabled);
MOVZ	R25, R2, R0
JAL	Serial_Dma_Serial_RestoreRxInterrupt+0
NOP	
;Serial_Dma.c,269 :: 		return taken;
ANDI	R2, R5, 255
; taken end address is: 20 (R5)
;Serial_Dma.c,270 :: 		}
;Serial_Dma.c,269 :: 		return taken;
;Serial_Dma.c,270 :: 		}
L_end_Serial_TakeStatusRequest:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Serial_TakeStatusRequest
_Get_Head_Value:
;Serial_Dma.c,272 :: 		int Get_Head_Value(){
;Serial_Dma.c,273 :: 		return serial.head;
LHU	R2, Offset(_serial+1024)(GP)
;Serial_Dma.c,274 :: 		}
L_end_Get_Head_Value:
JR	RA
NOP	
; end of _Get_Head_Value
_Get_Tail_Value:
;Serial_Dma.c,276 :: 		int Get_Tail_Value(){
;Serial_Dma.c,277 :: 		return serial.tail;
LHU	R2, Offset(_serial+1026)(GP)
;Serial_Dma.c,278 :: 		}
L_end_Get_Tail_Value:
JR	RA
NOP	
; end of _Get_Tail_Value
_Get_Difference:
;Serial_Dma.c,280 :: 		int Get_Difference(){
;Serial_Dma.c,281 :: 		unsigned int head = serial.head;
; head start address is: 16 (R4)
LHU	R4, Offset(_serial+1024)(GP)
;Serial_Dma.c,282 :: 		if(head >= serial.tail) return head - serial.tail;
LHU	R3, Offset(_serial+1026)(GP)
LHU	R2, Offset(_serial+1024)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L__Get_Difference255
NOP	
J	L_Get_Difference60
NOP	
L__Get_Difference255:
LHU	R2, Offset(_serial+1026)(GP)
SUBU	R2, R4, R2
; head end address is: 16 (R4)
J	L_end_Get_Difference
NOP	
L_Get_Difference60:
;Serial_Dma.c,283 :: 		return SERIAL_RX_SIZE - serial.tail + head;
; head start address is: 16 (R4)
LHU	R3, Offset(_serial+1026)(GP)
ORI	R2, R0, 1024
SUBU	R2, R2, R3
ADDU	R2, R2, R4
; head end address is: 16 (R4)
;Serial_Dma.c,284 :: 		}
L_end_Get_Difference:
JR	RA
NOP	
; end of _Get_Difference
Serial_Dma_Serial_ReadByte:
;Serial_Dma.c,287 :: 		static int Serial_ReadByte(char *ch){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,288 :: 		unsigned long enabled = Serial_DisableRxInterrupt();
SW	R25, 4(SP)
JAL	Serial_Dma_Serial_DisableRxInterrupt+0
NOP	
; enabled start address is: 16 (R4)
MOVZ	R4, R2, R0
;Serial_Dma.c,289 :: 		int result = 0;
; result start address is: 20 (R5)
MOVZ	R5, R0, R0
;Serial_Dma.c,290 :: 		if(serial_rx_fault){
LBU	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
BNE	R2, R0, L_Serial_Dma_Serial_ReadByte258
NOP	
J	L_Serial_Dma_Serial_ReadByte61
NOP	
L_Serial_Dma_Serial_ReadByte258:
; result end address is: 20 (R5)
;Serial_Dma.c,291 :: 		serial.tail = serial.head;
LHU	R2, Offset(_serial+1024)(GP)
SH	R2, Offset(_serial+1026)(GP)
;Serial_Dma.c,292 :: 		serial_rx_discard = !serial_rx_boundary;
LBU	R2, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
SLTIU	R2, R2, 1
SB	R2, Offset(Serial_Dma_serial_rx_discard+0)(GP)
;Serial_Dma.c,293 :: 		serial_rx_fault = serial_rx_boundary = 0;
SB	R0, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
LBU	R2, Offset(Serial_Dma_serial_rx_boundary+0)(GP)
SB	R2, Offset(Serial_Dma_serial_rx_fault+0)(GP)
;Serial_Dma.c,294 :: 		result = SERIAL_LINE_RX_ERROR;
; result start address is: 8 (R2)
ORI	R2, R0, 65534
;Serial_Dma.c,295 :: 		}else if(serial.tail != serial.head){
; result end address is: 8 (R2)
J	L_Serial_Dma_Serial_ReadByte62
NOP	
L_Serial_Dma_Serial_ReadByte61:
; result start address is: 20 (R5)
LHU	R3, Offset(_serial+1024)(GP)
LHU	R2, Offset(_serial+1026)(GP)
BNE	R2, R3, L_Serial_Dma_Serial_ReadByte261
NOP	
J	L_Serial_Dma_Serial_ReadByte148
NOP	
L_Serial_Dma_Serial_ReadByte261:
; result end address is: 20 (R5)
;Serial_Dma.c,296 :: 		*ch = serial.temp_buffer[serial.tail];
LHU	R3, Offset(_serial+1026)(GP)
LUI	R2, hi_addr(_serial+0)
ORI	R2, R2, lo_addr(_serial+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R25)
;Serial_Dma.c,297 :: 		serial.tail++;
LHU	R2, Offset(_serial+1026)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_serial+1026)(GP)
;Serial_Dma.c,298 :: 		if(serial.tail == SERIAL_RX_SIZE) serial.tail = 0;
ANDI	R3, R2, 65535
ORI	R2, R0, 1024
BEQ	R3, R2, L_Serial_Dma_Serial_ReadByte262
NOP	
J	L_Serial_Dma_Serial_ReadByte64
NOP	
L_Serial_Dma_Serial_ReadByte262:
SH	R0, Offset(_serial+1026)(GP)
L_Serial_Dma_Serial_ReadByte64:
;Serial_Dma.c,299 :: 		result = SERIAL_LINE_READY;
; result start address is: 8 (R2)
ORI	R2, R0, 1
; result end address is: 8 (R2)
;Serial_Dma.c,300 :: 		}
J	L_Serial_Dma_Serial_ReadByte63
NOP	
L_Serial_Dma_Serial_ReadByte148:
;Serial_Dma.c,295 :: 		}else if(serial.tail != serial.head){
SEH	R2, R5
;Serial_Dma.c,300 :: 		}
L_Serial_Dma_Serial_ReadByte63:
; result start address is: 8 (R2)
; result end address is: 8 (R2)
L_Serial_Dma_Serial_ReadByte62:
;Serial_Dma.c,301 :: 		Serial_RestoreRxInterrupt(enabled);
; result start address is: 8 (R2)
MOVZ	R25, R4, R0
; enabled end address is: 16 (R4)
JAL	Serial_Dma_Serial_RestoreRxInterrupt+0
NOP	
;Serial_Dma.c,302 :: 		return result;
; result end address is: 8 (R2)
;Serial_Dma.c,303 :: 		}
;Serial_Dma.c,302 :: 		return result;
;Serial_Dma.c,303 :: 		}
L_end_Serial_ReadByte:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Serial_Dma_Serial_ReadByte
_Serial_ReadLine:
;Serial_Dma.c,305 :: 		int Serial_ReadLine(char *line){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Serial_Dma.c,308 :: 		while((result = Serial_ReadByte(&ch)) != SERIAL_LINE_NONE){
SW	R26, 4(SP)
L_Serial_ReadLine65:
ADDIU	R2, SP, 12
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	Serial_Dma_Serial_ReadByte+0
NOP	
LW	R25, 8(SP)
; result start address is: 16 (R4)
SEH	R4, R2
SEH	R2, R2
BNE	R2, R0, L__Serial_ReadLine265
NOP	
J	L_Serial_ReadLine66
NOP	
L__Serial_ReadLine265:
;Serial_Dma.c,309 :: 		if(result == SERIAL_LINE_RX_ERROR){
SEH	R3, R4
LUI	R2, 65535
ORI	R2, R2, 65534
BEQ	R3, R2, L__Serial_ReadLine266
NOP	
J	L_Serial_ReadLine67
NOP	
L__Serial_ReadLine266:
;Serial_Dma.c,310 :: 		serial_line_length = 0;
SH	R0, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,311 :: 		serial_line_overflow = serial_line_fault = serial_last_cr = 0;
SB	R0, Offset(Serial_Dma_serial_last_cr+0)(GP)
SB	R0, Offset(Serial_Dma_serial_line_fault+0)(GP)
SB	R0, Offset(Serial_Dma_serial_line_overflow+0)(GP)
;Serial_Dma.c,312 :: 		return result;
SEH	R2, R4
; result end address is: 16 (R4)
J	L_end_Serial_ReadLine
NOP	
;Serial_Dma.c,313 :: 		}
L_Serial_ReadLine67:
;Serial_Dma.c,314 :: 		if(ch == SERIAL_FAULT_MARK){
LBU	R3, 12(SP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Serial_ReadLine267
NOP	
J	L_Serial_ReadLine68
NOP	
L__Serial_ReadLine267:
;Serial_Dma.c,315 :: 		serial_line_fault = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_line_fault+0)(GP)
;Serial_Dma.c,316 :: 		continue;
J	L_Serial_ReadLine65
NOP	
;Serial_Dma.c,317 :: 		}
L_Serial_ReadLine68:
;Serial_Dma.c,318 :: 		if(ch == '\n' && serial_last_cr){
LBU	R3, 12(SP)
ORI	R2, R0, 10
BEQ	R3, R2, L__Serial_ReadLine268
NOP	
J	L__Serial_ReadLine152
NOP	
L__Serial_ReadLine268:
LBU	R2, Offset(Serial_Dma_serial_last_cr+0)(GP)
BNE	R2, R0, L__Serial_ReadLine270
NOP	
J	L__Serial_ReadLine151
NOP	
L__Serial_ReadLine270:
L__Serial_ReadLine150:
;Serial_Dma.c,319 :: 		serial_last_cr = 0;
SB	R0, Offset(Serial_Dma_serial_last_cr+0)(GP)
;Serial_Dma.c,320 :: 		continue;
J	L_Serial_ReadLine65
NOP	
;Serial_Dma.c,318 :: 		if(ch == '\n' && serial_last_cr){
L__Serial_ReadLine152:
L__Serial_ReadLine151:
;Serial_Dma.c,322 :: 		serial_last_cr = (ch == '\r');
LBU	R3, 12(SP)
XORI	R2, R3, 13
SLTIU	R2, R2, 1
SB	R2, Offset(Serial_Dma_serial_last_cr+0)(GP)
;Serial_Dma.c,323 :: 		if(ch == '\r' || ch == '\n'){
ORI	R2, R0, 13
BNE	R3, R2, L__Serial_ReadLine273
NOP	
J	L__Serial_ReadLine154
NOP	
L__Serial_ReadLine273:
LBU	R3, 12(SP)
ORI	R2, R0, 10
BNE	R3, R2, L__Serial_ReadLine275
NOP	
J	L__Serial_ReadLine153
NOP	
L__Serial_ReadLine275:
J	L_Serial_ReadLine74
NOP	
L__Serial_ReadLine154:
L__Serial_ReadLine153:
;Serial_Dma.c,324 :: 		if(serial_line_fault){
LBU	R2, Offset(Serial_Dma_serial_line_fault+0)(GP)
BNE	R2, R0, L__Serial_ReadLine277
NOP	
J	L_Serial_ReadLine75
NOP	
L__Serial_ReadLine277:
;Serial_Dma.c,325 :: 		serial_line_length = 0;
SH	R0, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,326 :: 		serial_line_overflow = serial_line_fault = 0;
SB	R0, Offset(Serial_Dma_serial_line_fault+0)(GP)
SB	R0, Offset(Serial_Dma_serial_line_overflow+0)(GP)
;Serial_Dma.c,327 :: 		return SERIAL_LINE_RX_ERROR;
ORI	R2, R0, 65534
J	L_end_Serial_ReadLine
NOP	
;Serial_Dma.c,328 :: 		}
L_Serial_ReadLine75:
;Serial_Dma.c,329 :: 		if(serial_line_overflow){
LBU	R2, Offset(Serial_Dma_serial_line_overflow+0)(GP)
BNE	R2, R0, L__Serial_ReadLine279
NOP	
J	L_Serial_ReadLine76
NOP	
L__Serial_ReadLine279:
;Serial_Dma.c,330 :: 		serial_line_length = 0;
SH	R0, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,331 :: 		serial_line_overflow = 0;
SB	R0, Offset(Serial_Dma_serial_line_overflow+0)(GP)
;Serial_Dma.c,332 :: 		return SERIAL_LINE_TOO_LONG;
ORI	R2, R0, 65535
J	L_end_Serial_ReadLine
NOP	
;Serial_Dma.c,333 :: 		}
L_Serial_ReadLine76:
;Serial_Dma.c,334 :: 		serial_line[serial_line_length] = 0;
LHU	R3, Offset(Serial_Dma_serial_line_length+0)(GP)
LUI	R2, hi_addr(Serial_Dma_serial_line+0)
ORI	R2, R2, lo_addr(Serial_Dma_serial_line+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Serial_Dma.c,335 :: 		strcpy(line, serial_line);
LUI	R26, hi_addr(Serial_Dma_serial_line+0)
ORI	R26, R26, lo_addr(Serial_Dma_serial_line+0)
JAL	_strcpy+0
NOP	
;Serial_Dma.c,336 :: 		serial_line_length = 0;
SH	R0, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,337 :: 		return SERIAL_LINE_READY;
ORI	R2, R0, 1
J	L_end_Serial_ReadLine
NOP	
;Serial_Dma.c,338 :: 		}
L_Serial_ReadLine74:
;Serial_Dma.c,339 :: 		if(serial_line_length < LINE_BUFFER_SIZE - 1){
LHU	R2, Offset(Serial_Dma_serial_line_length+0)(GP)
SLTIU	R2, R2, 63
BNE	R2, R0, L__Serial_ReadLine280
NOP	
J	L_Serial_ReadLine77
NOP	
L__Serial_ReadLine280:
;Serial_Dma.c,340 :: 		serial_line[serial_line_length++] = ch;
LHU	R3, Offset(Serial_Dma_serial_line_length+0)(GP)
LUI	R2, hi_addr(Serial_Dma_serial_line+0)
ORI	R2, R2, lo_addr(Serial_Dma_serial_line+0)
ADDU	R3, R2, R3
LBU	R2, 12(SP)
SB	R2, 0(R3)
LHU	R2, Offset(Serial_Dma_serial_line_length+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Serial_Dma_serial_line_length+0)(GP)
;Serial_Dma.c,341 :: 		}else{
J	L_Serial_ReadLine78
NOP	
L_Serial_ReadLine77:
;Serial_Dma.c,342 :: 		serial_line_overflow = 1;
ORI	R2, R0, 1
SB	R2, Offset(Serial_Dma_serial_line_overflow+0)(GP)
;Serial_Dma.c,343 :: 		}
L_Serial_ReadLine78:
;Serial_Dma.c,344 :: 		}
J	L_Serial_ReadLine65
NOP	
L_Serial_ReadLine66:
;Serial_Dma.c,345 :: 		return SERIAL_LINE_NONE;
MOVZ	R2, R0, R0
;Serial_Dma.c,346 :: 		}
;Serial_Dma.c,345 :: 		return SERIAL_LINE_NONE;
;Serial_Dma.c,346 :: 		}
L_end_Serial_ReadLine:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Serial_ReadLine
_DMA1:
;Serial_Dma.c,348 :: 		void DMA1(){
;Serial_Dma.c,349 :: 		IEC4CLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,350 :: 		IFS4CLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,351 :: 		DCH1CON = 0x3;
ORI	R2, R0, 3
SW	R2, Offset(DCH1CON+0)(GP)
;Serial_Dma.c,353 :: 		U2STACLR = 0xC000;
ORI	R2, R0, 49152
SW	R2, Offset(U2STACLR+0)(GP)
;Serial_Dma.c,354 :: 		DCH1ECON = (147 << 8) | 0x10;
ORI	R2, R0, 37648
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,355 :: 		DCH1DSA = KVA_TO_PA(0xBF822220);
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,361 :: 		DCH1SSA = KVA_TO_PA(0xA0002200);
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,362 :: 		DCH1SSIZ = SERIAL_TX_SIZE;
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,363 :: 		DCH1DSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,364 :: 		DCH1CSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,365 :: 		IPC33CLR = 0x1F000000;
LUI	R2, 7936
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,366 :: 		IPC33SET = 0x16000000;
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,367 :: 		DCH1INTCLR = 0x00FF00FF;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,368 :: 		DCH1INTSET = 0x00090000;
LUI	R2, 9
SW	R2, Offset(DCH1INTSET+0)(GP)
;Serial_Dma.c,369 :: 		IEC4SET = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,370 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA1_Flag:
;Serial_Dma.c,372 :: 		char DMA1_Flag(){
;Serial_Dma.c,373 :: 		return dma1int_flag;
LBU	R2, Offset(Serial_Dma_dma1int_flag+0)(GP)
;Serial_Dma.c,374 :: 		}
L_end_DMA1_Flag:
JR	RA
NOP	
; end of _DMA1_Flag
_DMA1_Enable:
;Serial_Dma.c,376 :: 		unsigned int DMA1_Enable(){
;Serial_Dma.c,377 :: 		DCH1CONSET = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,378 :: 		return (DCH1CON & 0x80) >> 7;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 128
SRL	R2, R2, 7
;Serial_Dma.c,379 :: 		}
L_end_DMA1_Enable:
JR	RA
NOP	
; end of _DMA1_Enable
_DMA1_Disable:
;Serial_Dma.c,381 :: 		void DMA1_Disable(){
;Serial_Dma.c,382 :: 		DCH1ECONSET = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(DCH1ECONSET+0)(GP)
;Serial_Dma.c,383 :: 		}
L_end_DMA1_Disable:
JR	RA
NOP	
; end of _DMA1_Disable
_DMA_IsOn:
;Serial_Dma.c,386 :: 		unsigned int DMA_IsOn(int channel){
;Serial_Dma.c,387 :: 		if(channel == 0) return (DCH0CON & 0x8080) != 0;
SEH	R2, R25
BEQ	R2, R0, L__DMA_IsOn286
NOP	
J	L_DMA_IsOn79
NOP	
L__DMA_IsOn286:
LW	R2, Offset(DCH0CON+0)(GP)
ANDI	R2, R2, 32896
XORI	R2, R2, 0
SLTU	R2, R0, R2
J	L_end_DMA_IsOn
NOP	
L_DMA_IsOn79:
;Serial_Dma.c,388 :: 		return (DCH1CON & 0x8080) != 0;
LW	R2, Offset(DCH1CON+0)(GP)
ANDI	R2, R2, 32896
XORI	R2, R2, 0
SLTU	R2, R0, R2
;Serial_Dma.c,389 :: 		}
L_end_DMA_IsOn:
JR	RA
NOP	
; end of _DMA_IsOn
_DMA_Suspend:
;Serial_Dma.c,391 :: 		unsigned int DMA_Suspend(){
;Serial_Dma.c,392 :: 		DMACONSET = 0x1000;
ORI	R2, R0, 4096
SW	R2, Offset(DMACONSET+0)(GP)
;Serial_Dma.c,393 :: 		return (DMACON & 0x1000) >> 12;
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,394 :: 		}
L_end_DMA_Suspend:
JR	RA
NOP	
; end of _DMA_Suspend
_DMA_Resume:
;Serial_Dma.c,396 :: 		unsigned int DMA_Resume(){
;Serial_Dma.c,397 :: 		DMACONCLR = 0x1000;
ORI	R2, R0, 4096
SW	R2, Offset(DMACONCLR+0)(GP)
;Serial_Dma.c,398 :: 		return (DMACON & 0x1000) >> 12;
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
;Serial_Dma.c,399 :: 		}
L_end_DMA_Resume:
JR	RA
NOP	
; end of _DMA_Resume
_DMA_Busy:
;Serial_Dma.c,401 :: 		unsigned int DMA_Busy(){
;Serial_Dma.c,402 :: 		return (DMACON & 0x800) >> 11;
LW	R2, Offset(DMACON+0)(GP)
ANDI	R2, R2, 2048
SRL	R2, R2, 11
;Serial_Dma.c,403 :: 		}
L_end_DMA_Busy:
JR	RA
NOP	
; end of _DMA_Busy
_DMA_CH1_ISR:
;Serial_Dma.c,405 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
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
;Serial_Dma.c,406 :: 		dma1int_flag |= DCH1INT & 0xFF;
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R3, R2, 255
LBU	R2, Offset(Serial_Dma_dma1int_flag+0)(GP)
OR	R2, R2, R3
SB	R2, Offset(Serial_Dma_dma1int_flag+0)(GP)
;Serial_Dma.c,407 :: 		if(DCH1INT & 0x8){
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 8
BNE	R2, R0, L__DMA_CH1_ISR294
NOP	
J	L_DMA_CH1_ISR80
NOP	
L__DMA_CH1_ISR294:
;Serial_Dma.c,408 :: 		DCH1CONCLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,409 :: 		}
L_DMA_CH1_ISR80:
;Serial_Dma.c,410 :: 		if(DCH1INT & 0x1){
LW	R2, Offset(DCH1INT+0)(GP)
ANDI	R2, R2, 1
BNE	R2, R0, L__DMA_CH1_ISR296
NOP	
J	L_DMA_CH1_ISR81
NOP	
L__DMA_CH1_ISR296:
;Serial_Dma.c,411 :: 		DCH1ECONSET = 0x40;
ORI	R2, R0, 64
SW	R2, Offset(DCH1ECONSET+0)(GP)
;Serial_Dma.c,412 :: 		DCH1CONCLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONCLR+0)(GP)
;Serial_Dma.c,413 :: 		}
L_DMA_CH1_ISR81:
;Serial_Dma.c,414 :: 		DCH1INTCLR = 0xFF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,415 :: 		IFS4CLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,416 :: 		}
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
Serial_Dma_Serial_WaitTx:
;Serial_Dma.c,418 :: 		static int Serial_WaitTx(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,419 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_Serial_Dma_Serial_WaitTx82:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L_Serial_Dma_Serial_WaitTx299
NOP	
J	L_Serial_Dma_Serial_WaitTx83
NOP	
L_Serial_Dma_Serial_WaitTx299:
J	L_Serial_Dma_Serial_WaitTx82
NOP	
L_Serial_Dma_Serial_WaitTx83:
;Serial_Dma.c,420 :: 		if((dma1int_flag | DCH1INT) & 0x1){
LW	R3, Offset(DCH1INT+0)(GP)
LBU	R2, Offset(Serial_Dma_dma1int_flag+0)(GP)
OR	R2, R2, R3
ANDI	R2, R2, 1
BNE	R2, R0, L_Serial_Dma_Serial_WaitTx301
NOP	
J	L_Serial_Dma_Serial_WaitTx84
NOP	
L_Serial_Dma_Serial_WaitTx301:
;Serial_Dma.c,421 :: 		dma1int_flag = 0;
SB	R0, Offset(Serial_Dma_dma1int_flag+0)(GP)
;Serial_Dma.c,422 :: 		Serial_PollText("error: DMA transmit failure\r\n");
LUI	R25, hi_addr(?lstr_2_Serial_Dma+0)
ORI	R25, R25, lo_addr(?lstr_2_Serial_Dma+0)
JAL	Serial_Dma_Serial_PollText+0
NOP	
;Serial_Dma.c,423 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_Serial_WaitTx
NOP	
;Serial_Dma.c,424 :: 		}
L_Serial_Dma_Serial_WaitTx84:
;Serial_Dma.c,425 :: 		return 1;
ORI	R2, R0, 1
;Serial_Dma.c,426 :: 		}
;Serial_Dma.c,425 :: 		return 1;
;Serial_Dma.c,426 :: 		}
L_end_Serial_WaitTx:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Serial_Dma_Serial_WaitTx
Serial_Dma_Serial_FlushTx:
;Serial_Dma.c,428 :: 		static void Serial_FlushTx(unsigned int *used){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,429 :: 		if(*used){
LHU	R2, 0(R25)
BNE	R2, R0, L_Serial_Dma_Serial_FlushTx304
NOP	
J	L_Serial_Dma_Serial_FlushTx85
NOP	
L_Serial_Dma_Serial_FlushTx304:
;Serial_Dma.c,430 :: 		dma1int_flag = 0;
SB	R0, Offset(Serial_Dma_dma1int_flag+0)(GP)
;Serial_Dma.c,431 :: 		DCH1INTCLR = 0xFF;
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,432 :: 		IFS4CLR = 0x80;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,433 :: 		DCH1SSIZ = *used;
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,434 :: 		DMA1_Enable();
JAL	_DMA1_Enable+0
NOP	
;Serial_Dma.c,435 :: 		*used = 0;
SH	R0, 0(R25)
;Serial_Dma.c,436 :: 		}
L_Serial_Dma_Serial_FlushTx85:
;Serial_Dma.c,437 :: 		}
L_end_Serial_FlushTx:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Serial_Dma_Serial_FlushTx
Serial_Dma_Serial_PutChar:
;Serial_Dma.c,439 :: 		static int Serial_PutChar(char ch, unsigned int *used){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Serial_Dma.c,440 :: 		if(host_link == HOST_LINK_ETHERNET) return Ethernet_HostPut(ch);
SW	R25, 4(SP)
LBU	R3, Offset(Serial_Dma_host_link+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L_Serial_Dma_Serial_PutChar306
NOP	
J	L_Serial_Dma_Serial_PutChar86
NOP	
L_Serial_Dma_Serial_PutChar306:
JAL	_Ethernet_HostPut+0
NOP	
J	L_end_Serial_PutChar
NOP	
L_Serial_Dma_Serial_PutChar86:
;Serial_Dma.c,441 :: 		if(!serial_tx_dma){
LBU	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
BEQ	R2, R0, L_Serial_Dma_Serial_PutChar307
NOP	
J	L_Serial_Dma_Serial_PutChar87
NOP	
L_Serial_Dma_Serial_PutChar307:
;Serial_Dma.c,443 :: 		UART2_Write(ch);
ANDI	R25, R25, 255
JAL	_UART2_Write+0
NOP	
;Serial_Dma.c,447 :: 		return 1;
ORI	R2, R0, 1
J	L_end_Serial_PutChar
NOP	
;Serial_Dma.c,448 :: 		}
L_Serial_Dma_Serial_PutChar87:
;Serial_Dma.c,449 :: 		if(*used == 0 && !Serial_WaitTx()) return 0;
LHU	R2, 0(R26)
ANDI	R2, R2, 65535
BEQ	R2, R0, L_Serial_Dma_Serial_PutChar308
NOP	
J	L_Serial_Dma_Serial_PutChar157
NOP	
L_Serial_Dma_Serial_PutChar308:
SB	R25, 8(SP)
JAL	Serial_Dma_Serial_WaitTx+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L_Serial_Dma_Serial_PutChar309
NOP	
J	L_Serial_Dma_Serial_PutChar156
NOP	
L_Serial_Dma_Serial_PutChar309:
L_Serial_Dma_Serial_PutChar155:
MOVZ	R2, R0, R0
J	L_end_Serial_PutChar
NOP	
L_Serial_Dma_Serial_PutChar157:
L_Serial_Dma_Serial_PutChar156:
;Serial_Dma.c,450 :: 		txBuf[(*used)++] = ch;
LHU	R2, 0(R26)
ANDI	R3, R2, 65535
LUI	R2, 40960
ORI	R2, R2, 8704
ADDU	R2, R2, R3
SB	R25, 0(R2)
LHU	R2, 0(R26)
ADDIU	R2, R2, 1
SH	R2, 0(R26)
;Serial_Dma.c,451 :: 		if(*used == SERIAL_TX_SIZE) Serial_FlushTx(used);
LHU	R2, 0(R26)
ANDI	R3, R2, 65535
ORI	R2, R0, 200
BEQ	R3, R2, L_Serial_Dma_Serial_PutChar310
NOP	
J	L_Serial_Dma_Serial_PutChar91
NOP	
L_Serial_Dma_Serial_PutChar310:
MOVZ	R25, R26, R0
JAL	Serial_Dma_Serial_FlushTx+0
NOP	
L_Serial_Dma_Serial_PutChar91:
;Serial_Dma.c,452 :: 		return 1;
ORI	R2, R0, 1
;Serial_Dma.c,453 :: 		}
;Serial_Dma.c,452 :: 		return 1;
;Serial_Dma.c,453 :: 		}
L_end_Serial_PutChar:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Serial_Dma_Serial_PutChar
_dma_printf:
;Serial_Dma.c,455 :: 		int dma_printf(const char *str,...){
ADDIU	SP, SP, -416
SW	RA, 0(SP)
;Serial_Dma.c,457 :: 		unsigned int used = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R30, R0, R0
SH	R30, 412(SP)
MOVZ	R30, R0, R0
SH	R30, 414(SP)
;Serial_Dma.c,458 :: 		int count = 0;
;Serial_Dma.c,462 :: 		if(!str){
LW	R2, 416(SP)
BEQ	R2, R0, L__dma_printf312
NOP	
J	L_dma_printf92
NOP	
L__dma_printf312:
;Serial_Dma.c,463 :: 		Serial_PollText("error: Invalid serial format\r\n");
LUI	R25, hi_addr(?lstr_3_Serial_Dma+0)
ORI	R25, R25, lo_addr(?lstr_3_Serial_Dma+0)
JAL	Serial_Dma_Serial_PollText+0
NOP	
;Serial_Dma.c,464 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_dma_printf
NOP	
;Serial_Dma.c,465 :: 		}
L_dma_printf92:
;Serial_Dma.c,466 :: 		va_start(va,str);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 416
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;Serial_Dma.c,467 :: 		while(*str){
L_dma_printf93:
LW	R2, 416(SP)
LBU	R2, 0(R2)
BNE	R2, R0, L__dma_printf314
NOP	
J	L_dma_printf94
NOP	
L__dma_printf314:
;Serial_Dma.c,468 :: 		ch = *str++;
LW	R2, 416(SP)
LBU	R3, 0(R2)
; ch start address is: 16 (R4)
ANDI	R4, R3, 255
LW	R2, 416(SP)
ADDIU	R2, R2, 1
SW	R2, 416(SP)
;Serial_Dma.c,469 :: 		if(ch != '%'){
ANDI	R3, R3, 255
ORI	R2, R0, 37
BNE	R3, R2, L__dma_printf316
NOP	
J	L_dma_printf95
NOP	
L__dma_printf316:
;Serial_Dma.c,470 :: 		if(!Serial_PutChar(ch,&used)) goto tx_error;
ADDIU	R2, SP, 412
MOVZ	R26, R2, R0
ANDI	R25, R4, 255
; ch end address is: 16 (R4)
JAL	Serial_Dma_Serial_PutChar+0
NOP	
BEQ	R2, R0, L__dma_printf317
NOP	
J	L_dma_printf96
NOP	
L__dma_printf317:
J	___dma_printf_tx_error
NOP	
L_dma_printf96:
;Serial_Dma.c,471 :: 		count++;
LH	R2, 414(SP)
ADDIU	R2, R2, 1
SH	R2, 414(SP)
;Serial_Dma.c,472 :: 		continue;
J	L_dma_printf93
NOP	
;Serial_Dma.c,473 :: 		}
L_dma_printf95:
;Serial_Dma.c,474 :: 		ch = *str++;
LW	R2, 416(SP)
LBU	R2, 0(R2)
; ch start address is: 16 (R4)
ANDI	R4, R2, 255
LW	R2, 416(SP)
ADDIU	R2, R2, 1
SW	R2, 416(SP)
;Serial_Dma.c,475 :: 		text = tmp;
ADDIU	R2, SP, 16
SW	R2, 400(SP)
;Serial_Dma.c,476 :: 		switch(ch){
J	L_dma_printf97
NOP	
; ch end address is: 16 (R4)
;Serial_Dma.c,477 :: 		case '%': tmp[0] = '%'; tmp[1] = 0; break;
L_dma_printf99:
ADDIU	R3, SP, 16
ORI	R2, R0, 37
SB	R2, 0(R3)
ADDIU	R2, R3, 1
SB	R0, 0(R2)
J	L_dma_printf98
NOP	
;Serial_Dma.c,478 :: 		case 'c':
L_dma_printf100:
;Serial_Dma.c,479 :: 		if(!Serial_PutChar(va_arg(va,char),&used)) goto tx_error;
ADDIU	R5, SP, 412
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
MOVZ	R26, R5, R0
ANDI	R25, R2, 255
JAL	Serial_Dma_Serial_PutChar+0
NOP	
BEQ	R2, R0, L__dma_printf318
NOP	
J	L_dma_printf101
NOP	
L__dma_printf318:
J	___dma_printf_tx_error
NOP	
L_dma_printf101:
;Serial_Dma.c,480 :: 		count++;
LH	R2, 414(SP)
ADDIU	R2, R2, 1
SH	R2, 414(SP)
;Serial_Dma.c,481 :: 		continue;
J	L_dma_printf93
NOP	
;Serial_Dma.c,482 :: 		case 'd': sprintf(tmp,"%d",va_arg(va,int)); break;
L_dma_printf102:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LH	R2, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_4_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,483 :: 		case 'u': sprintf(tmp,"%u",va_arg(va,unsigned int)); break;
L_dma_printf103:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LHU	R2, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_5_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,484 :: 		case 'l': sprintf(tmp,"%ld",va_arg(va,long)); break;
L_dma_printf104:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_6_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,485 :: 		case 'X': sprintf(tmp,"%X",va_arg(va,unsigned int)); break;
L_dma_printf105:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LHU	R2, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_7_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,486 :: 		case 'f': sprintf(tmp,"%08.3f",va_arg(va,float)); break;
L_dma_printf106:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LWC1	S0, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LUI	R2, hi_addr(?lstr_8_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_8_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,487 :: 		case 'F': sprintf(tmp,"%E",va_arg(va,double)); break;
L_dma_printf107:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LWC1	S0, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LUI	R2, hi_addr(?lstr_9_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_9_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,488 :: 		case 'p': sprintf(tmp,"%p",va_arg(va,void*)); break;
L_dma_printf108:
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Serial_Dma+0)
ORI	R2, R2, lo_addr(?lstr_10_Serial_Dma+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
J	L_dma_printf98
NOP	
;Serial_Dma.c,489 :: 		case 's':
L_dma_printf109:
;Serial_Dma.c,490 :: 		text = va_arg(va,char*);
ADDIU	R4, SP, 12
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LW	R2, 0(R3)
SW	R2, 400(SP)
;Serial_Dma.c,491 :: 		if(!text) text = "(null)";
BEQ	R2, R0, L__dma_printf319
NOP	
J	L_dma_printf110
NOP	
L__dma_printf319:
ORI	R30, R0, 40
SB	R30, 404(SP)
ORI	R30, R0, 110
SB	R30, 405(SP)
ORI	R30, R0, 117
SB	R30, 406(SP)
ORI	R30, R0, 108
SB	R30, 407(SP)
ORI	R30, R0, 108
SB	R30, 408(SP)
ORI	R30, R0, 41
SB	R30, 409(SP)
MOVZ	R30, R0, R0
SB	R30, 410(SP)
ADDIU	R2, SP, 404
SW	R2, 400(SP)
L_dma_printf110:
;Serial_Dma.c,492 :: 		break;
J	L_dma_printf98
NOP	
;Serial_Dma.c,493 :: 		default:
L_dma_printf111:
;Serial_Dma.c,494 :: 		if(serial_tx_dma && !Serial_WaitTx()) return -1;
LBU	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
BNE	R2, R0, L__dma_printf321
NOP	
J	L__dma_printf160
NOP	
L__dma_printf321:
JAL	Serial_Dma_Serial_WaitTx+0
NOP	
BEQ	R2, R0, L__dma_printf322
NOP	
J	L__dma_printf159
NOP	
L__dma_printf322:
L__dma_printf158:
ORI	R2, R0, 65535
J	L_end_dma_printf
NOP	
L__dma_printf160:
L__dma_printf159:
;Serial_Dma.c,495 :: 		Serial_PollText("error: Invalid serial format\r\n");
LUI	R25, hi_addr(?lstr_12_Serial_Dma+0)
ORI	R25, R25, lo_addr(?lstr_12_Serial_Dma+0)
JAL	Serial_Dma_Serial_PollText+0
NOP	
;Serial_Dma.c,496 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_dma_printf
NOP	
;Serial_Dma.c,497 :: 		}
L_dma_printf97:
; ch start address is: 16 (R4)
ANDI	R3, R4, 255
ORI	R2, R0, 37
BNE	R3, R2, L__dma_printf324
NOP	
J	L_dma_printf99
NOP	
L__dma_printf324:
ANDI	R3, R4, 255
ORI	R2, R0, 99
BNE	R3, R2, L__dma_printf326
NOP	
J	L_dma_printf100
NOP	
L__dma_printf326:
ANDI	R3, R4, 255
ORI	R2, R0, 100
BNE	R3, R2, L__dma_printf328
NOP	
J	L_dma_printf102
NOP	
L__dma_printf328:
ANDI	R3, R4, 255
ORI	R2, R0, 117
BNE	R3, R2, L__dma_printf330
NOP	
J	L_dma_printf103
NOP	
L__dma_printf330:
ANDI	R3, R4, 255
ORI	R2, R0, 108
BNE	R3, R2, L__dma_printf332
NOP	
J	L_dma_printf104
NOP	
L__dma_printf332:
ANDI	R3, R4, 255
ORI	R2, R0, 88
BNE	R3, R2, L__dma_printf334
NOP	
J	L_dma_printf105
NOP	
L__dma_printf334:
ANDI	R3, R4, 255
ORI	R2, R0, 102
BNE	R3, R2, L__dma_printf336
NOP	
J	L_dma_printf106
NOP	
L__dma_printf336:
ANDI	R3, R4, 255
ORI	R2, R0, 70
BNE	R3, R2, L__dma_printf338
NOP	
J	L_dma_printf107
NOP	
L__dma_printf338:
ANDI	R3, R4, 255
ORI	R2, R0, 112
BNE	R3, R2, L__dma_printf340
NOP	
J	L_dma_printf108
NOP	
L__dma_printf340:
ANDI	R3, R4, 255
; ch end address is: 16 (R4)
ORI	R2, R0, 115
BNE	R3, R2, L__dma_printf342
NOP	
J	L_dma_printf109
NOP	
L__dma_printf342:
J	L_dma_printf111
NOP	
L_dma_printf98:
;Serial_Dma.c,498 :: 		while(*text){
L_dma_printf115:
LW	R2, 400(SP)
LBU	R2, 0(R2)
BNE	R2, R0, L__dma_printf344
NOP	
J	L_dma_printf116
NOP	
L__dma_printf344:
;Serial_Dma.c,499 :: 		if(!Serial_PutChar(*text++,&used)) goto tx_error;
ADDIU	R4, SP, 412
LW	R3, 400(SP)
LW	R2, 400(SP)
ADDIU	R2, R2, 1
SW	R2, 400(SP)
LBU	R2, 0(R3)
MOVZ	R26, R4, R0
ANDI	R25, R2, 255
JAL	Serial_Dma_Serial_PutChar+0
NOP	
BEQ	R2, R0, L__dma_printf345
NOP	
J	L_dma_printf117
NOP	
L__dma_printf345:
J	___dma_printf_tx_error
NOP	
L_dma_printf117:
;Serial_Dma.c,500 :: 		count++;
LH	R2, 414(SP)
ADDIU	R2, R2, 1
SH	R2, 414(SP)
;Serial_Dma.c,501 :: 		}
J	L_dma_printf115
NOP	
L_dma_printf116:
;Serial_Dma.c,502 :: 		}
J	L_dma_printf93
NOP	
L_dma_printf94:
;Serial_Dma.c,503 :: 		if(serial_tx_dma) Serial_FlushTx(&used);
LBU	R2, Offset(Serial_Dma_serial_tx_dma+0)(GP)
BNE	R2, R0, L__dma_printf347
NOP	
J	L_dma_printf118
NOP	
L__dma_printf347:
ADDIU	R2, SP, 412
MOVZ	R25, R2, R0
JAL	Serial_Dma_Serial_FlushTx+0
NOP	
L_dma_printf118:
;Serial_Dma.c,504 :: 		return count;
LH	R2, 414(SP)
J	L_end_dma_printf
NOP	
;Serial_Dma.c,506 :: 		tx_error:
___dma_printf_tx_error:
;Serial_Dma.c,507 :: 		return -1;
ORI	R2, R0, 65535
;Serial_Dma.c,508 :: 		}
;Serial_Dma.c,507 :: 		return -1;
;Serial_Dma.c,508 :: 		}
L_end_dma_printf:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 416
JR	RA
NOP	
; end of _dma_printf
_lTrim:
;Serial_Dma.c,510 :: 		void lTrim(char *d,char *s){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Serial_Dma.c,511 :: 		int i = 0, j, k = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; k start address is: 24 (R6)
MOVZ	R6, R0, R0
;Serial_Dma.c,512 :: 		j = strlen(s);
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
;Serial_Dma.c,513 :: 		while(*s != '\0'){
L_lTrim119:
; j start address is: 16 (R4)
; k start address is: 12 (R3)
; i start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__lTrim350
NOP	
J	L_lTrim120
NOP	
L__lTrim350:
;Serial_Dma.c,514 :: 		if((*s > 0x30) || k > 0){
LBU	R2, 0(R26)
ANDI	R2, R2, 255
SLTIU	R2, R2, 49
BNE	R2, R0, L__lTrim351
NOP	
J	L__lTrim163
NOP	
L__lTrim351:
SEH	R2, R3
SLTI	R2, R2, 1
BNE	R2, R0, L__lTrim352
NOP	
J	L__lTrim162
NOP	
L__lTrim352:
J	L_lTrim123
NOP	
; k end address is: 12 (R3)
L__lTrim163:
L__lTrim162:
;Serial_Dma.c,515 :: 		k = 1;
; k start address is: 12 (R3)
ORI	R3, R0, 1
;Serial_Dma.c,516 :: 		*d++ = *s;
LBU	R2, 0(R26)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;Serial_Dma.c,517 :: 		}else{
J	L_lTrim124
NOP	
L_lTrim123:
;Serial_Dma.c,518 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 12 (R3)
; i end address is: 20 (R5)
;Serial_Dma.c,519 :: 		}
L_lTrim124:
;Serial_Dma.c,520 :: 		s++;
; k start address is: 12 (R3)
; i start address is: 20 (R5)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Serial_Dma.c,521 :: 		}
; k end address is: 12 (R3)
J	L_lTrim119
NOP	
L_lTrim120:
;Serial_Dma.c,522 :: 		if(i == j) *d++ = '0';
SEH	R3, R5
; i end address is: 20 (R5)
SEH	R2, R4
; j end address is: 16 (R4)
BEQ	R3, R2, L__lTrim353
NOP	
J	L_lTrim125
NOP	
L__lTrim353:
ORI	R2, R0, 48
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
L_lTrim125:
;Serial_Dma.c,523 :: 		*d = 0;
SB	R0, 0(R25)
;Serial_Dma.c,524 :: 		}
L_end_lTrim:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _lTrim
