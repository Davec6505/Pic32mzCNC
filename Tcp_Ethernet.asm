Tcp_Ethernet_Enc28_Config:
;Tcp_Ethernet.c,56 :: 		static void Enc28_Config() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Tcp_Ethernet.c,57 :: 		SPI_Ethernet_CS_Direction = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
_LX	
INS	R2, R0, BitPos(SPI_Ethernet_CS_Direction+0), 1
_SX	
;Tcp_Ethernet.c,58 :: 		SPI_Ethernet_CS = 1;
_LX	
ORI	R2, R2, BitMask(SPI_Ethernet_CS+0)
_SX	
;Tcp_Ethernet.c,59 :: 		SPI_Ethernet_Rst_Direction = 0;
_LX	
INS	R2, R0, BitPos(SPI_Ethernet_Rst_Direction+0), 1
_SX	
;Tcp_Ethernet.c,60 :: 		SPI_Ethernet_Rst = 1;
_LX	
ORI	R2, R2, BitMask(SPI_Ethernet_Rst+0)
_SX	
;Tcp_Ethernet.c,63 :: 		TRISD1_bit = 0;
LUI	R2, BitMask(TRISD1_bit+0)
ORI	R2, R2, BitMask(TRISD1_bit+0)
_SX	
;Tcp_Ethernet.c,64 :: 		TRISD2_bit = 1;
LUI	R2, BitMask(TRISD2_bit+0)
ORI	R2, R2, BitMask(TRISD2_bit+0)
_SX	
;Tcp_Ethernet.c,65 :: 		TRISD3_bit = 0;
LUI	R2, BitMask(TRISD3_bit+0)
ORI	R2, R2, BitMask(TRISD3_bit+0)
_SX	
;Tcp_Ethernet.c,68 :: 		_SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE,
MOVZ	R28, R0, R0
;Tcp_Ethernet.c,67 :: 		SPI1_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 16,
ORI	R27, R0, 16
MOVZ	R26, R0, R0
ORI	R25, R0, 32
;Tcp_Ethernet.c,69 :: 		_SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
ORI	R2, R0, 256
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SH	R0, 2(SP)
;Tcp_Ethernet.c,68 :: 		_SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE,
SH	R0, 0(SP)
;Tcp_Ethernet.c,69 :: 		_SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
JAL	_SPI1_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;Tcp_Ethernet.c,70 :: 		}
L_end_Enc28_Config:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Tcp_Ethernet_Enc28_Config
Tcp_Ethernet_Enc28_ReadEstat:
;Tcp_Ethernet.c,72 :: 		static unsigned char Enc28_ReadEstat() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Tcp_Ethernet.c,74 :: 		SPI_Ethernet_CS = 0;
SW	R25, 4(SP)
_LX	
INS	R2, R0, BitPos(SPI_Ethernet_CS+0), 1
_SX	
;Tcp_Ethernet.c,75 :: 		SPI1_Write(ENC28J60_RCR_ESTAT);
ORI	R25, R0, 29
JAL	_SPI1_Write+0
NOP	
;Tcp_Ethernet.c,76 :: 		estat = SPI1_Read(0);
MOVZ	R25, R0, R0
JAL	_SPI1_Read+0
NOP	
;Tcp_Ethernet.c,77 :: 		SPI_Ethernet_CS = 1;
_LX	
ORI	R3, R3, BitMask(SPI_Ethernet_CS+0)
_SX	
;Tcp_Ethernet.c,78 :: 		return estat;
;Tcp_Ethernet.c,79 :: 		}
;Tcp_Ethernet.c,78 :: 		return estat;
;Tcp_Ethernet.c,79 :: 		}
L_end_Enc28_ReadEstat:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Tcp_Ethernet_Enc28_ReadEstat
Tcp_Ethernet_Enc28_Present:
;Tcp_Ethernet.c,83 :: 		static char Enc28_Present() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Tcp_Ethernet.c,86 :: 		SPI_Ethernet_Rst = 0;
_LX	
INS	R2, R0, BitPos(SPI_Ethernet_Rst+0), 1
_SX	
;Tcp_Ethernet.c,87 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Tcp_Ethernet_Enc28_Present0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Tcp_Ethernet_Enc28_Present0
NOP	
;Tcp_Ethernet.c,88 :: 		SPI_Ethernet_Rst = 1;
_LX	
ORI	R2, R2, BitMask(SPI_Ethernet_Rst+0)
_SX	
;Tcp_Ethernet.c,89 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Tcp_Ethernet_Enc28_Present2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Tcp_Ethernet_Enc28_Present2
NOP	
;Tcp_Ethernet.c,90 :: 		for (ms = 0; ms < ETHERNET_PROBE_MS; ms++) {
; ms start address is: 16 (R4)
MOVZ	R4, R0, R0
; ms end address is: 16 (R4)
L_Tcp_Ethernet_Enc28_Present4:
; ms start address is: 16 (R4)
ANDI	R2, R4, 65535
SLTIU	R2, R2, 50
BNE	R2, R0, L_Tcp_Ethernet_Enc28_Present56
NOP	
J	L_Tcp_Ethernet_Enc28_Present5
NOP	
L_Tcp_Ethernet_Enc28_Present56:
;Tcp_Ethernet.c,91 :: 		estat = Enc28_ReadEstat();
JAL	Tcp_Ethernet_Enc28_ReadEstat+0
NOP	
; estat start address is: 12 (R3)
ANDI	R3, R2, 255
;Tcp_Ethernet.c,92 :: 		if (!(estat & ENC28J60_ESTAT_UNUSED) && (estat & ENC28J60_ESTAT_CLKRDY))
ANDI	R2, R2, 8
BEQ	R2, R0, L_Tcp_Ethernet_Enc28_Present57
NOP	
J	L_Tcp_Ethernet_Enc28_Present43
NOP	
L_Tcp_Ethernet_Enc28_Present57:
ANDI	R2, R3, 1
; estat end address is: 12 (R3)
BNE	R2, R0, L_Tcp_Ethernet_Enc28_Present59
NOP	
J	L_Tcp_Ethernet_Enc28_Present42
NOP	
L_Tcp_Ethernet_Enc28_Present59:
; ms end address is: 16 (R4)
L_Tcp_Ethernet_Enc28_Present41:
;Tcp_Ethernet.c,93 :: 		return 1;
ORI	R2, R0, 1
J	L_end_Enc28_Present
NOP	
;Tcp_Ethernet.c,92 :: 		if (!(estat & ENC28J60_ESTAT_UNUSED) && (estat & ENC28J60_ESTAT_CLKRDY))
L_Tcp_Ethernet_Enc28_Present43:
; ms start address is: 16 (R4)
L_Tcp_Ethernet_Enc28_Present42:
;Tcp_Ethernet.c,94 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Tcp_Ethernet_Enc28_Present10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Tcp_Ethernet_Enc28_Present10
NOP	
;Tcp_Ethernet.c,90 :: 		for (ms = 0; ms < ETHERNET_PROBE_MS; ms++) {
ADDIU	R2, R4, 1
ANDI	R4, R2, 65535
;Tcp_Ethernet.c,95 :: 		}
; ms end address is: 16 (R4)
J	L_Tcp_Ethernet_Enc28_Present4
NOP	
L_Tcp_Ethernet_Enc28_Present5:
;Tcp_Ethernet.c,96 :: 		return 0;
MOVZ	R2, R0, R0
;Tcp_Ethernet.c,97 :: 		}
L_end_Enc28_Present:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Tcp_Ethernet_Enc28_Present
_Ethernet_Transport_Init:
;Tcp_Ethernet.c,99 :: 		void Ethernet_Transport_Init() {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Tcp_Ethernet.c,100 :: 		ethernet_ready = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(Tcp_Ethernet_ethernet_ready+0)(GP)
;Tcp_Ethernet.c,101 :: 		ethernet_tx_head = ethernet_tx_tail = 0;
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
;Tcp_Ethernet.c,102 :: 		Enc28_Config();
JAL	Tcp_Ethernet_Enc28_Config+0
NOP	
;Tcp_Ethernet.c,103 :: 		if (!Enc28_Present()) return;
JAL	Tcp_Ethernet_Enc28_Present+0
NOP	
BEQ	R2, R0, L__Ethernet_Transport_Init61
NOP	
J	L_Ethernet_Transport_Init12
NOP	
L__Ethernet_Transport_Init61:
J	L_end_Ethernet_Transport_Init
NOP	
L_Ethernet_Transport_Init12:
;Tcp_Ethernet.c,105 :: 		SPI_Ethernet_Init(ethernet_mac, ethernet_ip, SPI_Ethernet_HALFDUPLEX);
MOVZ	R27, R0, R0
LUI	R26, hi_addr(Tcp_Ethernet_ethernet_ip+0)
ORI	R26, R26, lo_addr(Tcp_Ethernet_ethernet_ip+0)
LUI	R25, hi_addr(Tcp_Ethernet_ethernet_mac+0)
ORI	R25, R25, lo_addr(Tcp_Ethernet_ethernet_mac+0)
JAL	_SPI_Ethernet_Init+0
NOP	
;Tcp_Ethernet.c,106 :: 		SPI_Ethernet_confNetwork(ethernet_mask, ethernet_gateway, ethernet_dns);
LUI	R27, hi_addr(Tcp_Ethernet_ethernet_dns+0)
ORI	R27, R27, lo_addr(Tcp_Ethernet_ethernet_dns+0)
LUI	R26, hi_addr(Tcp_Ethernet_ethernet_gateway+0)
ORI	R26, R26, lo_addr(Tcp_Ethernet_ethernet_gateway+0)
LUI	R25, hi_addr(Tcp_Ethernet_ethernet_mask+0)
ORI	R25, R25, lo_addr(Tcp_Ethernet_ethernet_mask+0)
JAL	_SPI_Ethernet_confNetwork+0
NOP	
;Tcp_Ethernet.c,107 :: 		ethernet_ready = 1;
ORI	R2, R0, 1
SB	R2, Offset(Tcp_Ethernet_ethernet_ready+0)(GP)
;Tcp_Ethernet.c,108 :: 		}
L_end_Ethernet_Transport_Init:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Ethernet_Transport_Init
Tcp_Ethernet_Ethernet_SetHost:
;Tcp_Ethernet.c,110 :: 		static void Ethernet_SetHost(char link) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Tcp_Ethernet.c,111 :: 		Host_SetLink(link);
JAL	_Host_SetLink+0
NOP	
;Tcp_Ethernet.c,112 :: 		ethernet_tx_head = ethernet_tx_tail = 0;
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
;Tcp_Ethernet.c,113 :: 		}
L_end_Ethernet_SetHost:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Tcp_Ethernet_Ethernet_SetHost
Tcp_Ethernet_Ethernet_Seconds:
;Tcp_Ethernet.c,116 :: 		static void Ethernet_Seconds() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Tcp_Ethernet.c,117 :: 		char tick = (TMR.clock >> 4) & 1;
SW	R25, 4(SP)
LBU	R2, Offset(_TMR+0)(GP)
SRL	R2, R2, 4
ANDI	R2, R2, 1
; tick start address is: 16 (R4)
ANDI	R4, R2, 255
;Tcp_Ethernet.c,118 :: 		if (tick == ethernet_last_tick) return;
ANDI	R3, R2, 255
LBU	R2, Offset(Tcp_Ethernet_ethernet_last_tick+0)(GP)
BEQ	R3, R2, L_Tcp_Ethernet_Ethernet_Seconds64
NOP	
J	L_Tcp_Ethernet_Ethernet_Seconds13
NOP	
L_Tcp_Ethernet_Ethernet_Seconds64:
; tick end address is: 16 (R4)
J	L_end_Ethernet_Seconds
NOP	
L_Tcp_Ethernet_Ethernet_Seconds13:
;Tcp_Ethernet.c,119 :: 		ethernet_last_tick = tick;
; tick start address is: 16 (R4)
SB	R4, Offset(Tcp_Ethernet_ethernet_last_tick+0)(GP)
; tick end address is: 16 (R4)
;Tcp_Ethernet.c,120 :: 		SPI_Ethernet_UserTimerSec++;
LW	R2, Offset(_SPI_Ethernet_UserTimerSec+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_SPI_Ethernet_UserTimerSec+0)(GP)
;Tcp_Ethernet.c,121 :: 		if (Host_GetLink() != HOST_LINK_ETHERNET) return;
JAL	_Host_GetLink+0
NOP	
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L_Tcp_Ethernet_Ethernet_Seconds66
NOP	
J	L_Tcp_Ethernet_Ethernet_Seconds14
NOP	
L_Tcp_Ethernet_Ethernet_Seconds66:
J	L_end_Ethernet_Seconds
NOP	
L_Tcp_Ethernet_Ethernet_Seconds14:
;Tcp_Ethernet.c,122 :: 		if (++ethernet_idle_sec >= ETHERNET_IDLE_SEC) Ethernet_SetHost(HOST_LINK_SERIAL);
LHU	R2, Offset(Tcp_Ethernet_ethernet_idle_sec+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Tcp_Ethernet_ethernet_idle_sec+0)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 5
BEQ	R2, R0, L_Tcp_Ethernet_Ethernet_Seconds67
NOP	
J	L_Tcp_Ethernet_Ethernet_Seconds15
NOP	
L_Tcp_Ethernet_Ethernet_Seconds67:
MOVZ	R25, R0, R0
JAL	Tcp_Ethernet_Ethernet_SetHost+0
NOP	
L_Tcp_Ethernet_Ethernet_Seconds15:
;Tcp_Ethernet.c,123 :: 		}
L_end_Ethernet_Seconds:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Tcp_Ethernet_Ethernet_Seconds
_Ethernet_Transport_Poll:
;Tcp_Ethernet.c,125 :: 		void Ethernet_Transport_Poll() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Tcp_Ethernet.c,126 :: 		if (!ethernet_ready) return;
LBU	R2, Offset(Tcp_Ethernet_ethernet_ready+0)(GP)
BEQ	R2, R0, L__Ethernet_Transport_Poll69
NOP	
J	L_Ethernet_Transport_Poll16
NOP	
L__Ethernet_Transport_Poll69:
J	L_end_Ethernet_Transport_Poll
NOP	
L_Ethernet_Transport_Poll16:
;Tcp_Ethernet.c,127 :: 		Ethernet_Seconds();
JAL	Tcp_Ethernet_Ethernet_Seconds+0
NOP	
;Tcp_Ethernet.c,128 :: 		SPI_Ethernet_doPacket();
JAL	_SPI_Ethernet_doPacket+0
NOP	
;Tcp_Ethernet.c,129 :: 		}
L_end_Ethernet_Transport_Poll:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Ethernet_Transport_Poll
_Ethernet_Ready:
;Tcp_Ethernet.c,131 :: 		char Ethernet_Ready() {
;Tcp_Ethernet.c,132 :: 		return ethernet_ready;
LBU	R2, Offset(Tcp_Ethernet_ethernet_ready+0)(GP)
;Tcp_Ethernet.c,133 :: 		}
L_end_Ethernet_Ready:
JR	RA
NOP	
; end of _Ethernet_Ready
_Ethernet_Address:
;Tcp_Ethernet.c,135 :: 		char *Ethernet_Address() {
;Tcp_Ethernet.c,136 :: 		return ethernet_ip_text;
LUI	R2, hi_addr(Tcp_Ethernet_ethernet_ip_text+0)
ORI	R2, R2, lo_addr(Tcp_Ethernet_ethernet_ip_text+0)
;Tcp_Ethernet.c,137 :: 		}
L_end_Ethernet_Address:
JR	RA
NOP	
; end of _Ethernet_Address
_Ethernet_HostPut:
;Tcp_Ethernet.c,140 :: 		int Ethernet_HostPut(char ch) {
;Tcp_Ethernet.c,141 :: 		unsigned int next = (ethernet_tx_head + 1) & (ETHERNET_TX_SIZE - 1);
LHU	R2, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
ADDIU	R2, R2, 1
ANDI	R2, R2, 2047
; next start address is: 16 (R4)
ANDI	R4, R2, 65535
;Tcp_Ethernet.c,142 :: 		if (next == ethernet_tx_tail) return 0;
ANDI	R3, R2, 65535
LHU	R2, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
BEQ	R3, R2, L__Ethernet_HostPut73
NOP	
J	L_Ethernet_HostPut17
NOP	
L__Ethernet_HostPut73:
; next end address is: 16 (R4)
MOVZ	R2, R0, R0
J	L_end_Ethernet_HostPut
NOP	
L_Ethernet_HostPut17:
;Tcp_Ethernet.c,143 :: 		ethernet_tx[ethernet_tx_head] = ch;
; next start address is: 16 (R4)
LHU	R3, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
LUI	R2, hi_addr(Tcp_Ethernet_ethernet_tx+0)
ORI	R2, R2, lo_addr(Tcp_Ethernet_ethernet_tx+0)
ADDU	R2, R2, R3
SB	R25, 0(R2)
;Tcp_Ethernet.c,144 :: 		ethernet_tx_head = next;
SH	R4, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
; next end address is: 16 (R4)
;Tcp_Ethernet.c,145 :: 		return 1;
ORI	R2, R0, 1
;Tcp_Ethernet.c,146 :: 		}
L_end_Ethernet_HostPut:
JR	RA
NOP	
; end of _Ethernet_HostPut
Tcp_Ethernet_Ethernet_IsHost:
;Tcp_Ethernet.c,148 :: 		static char Ethernet_IsHost(unsigned char *remoteHost) {
;Tcp_Ethernet.c,149 :: 		return remoteHost[0] == ethernet_host[0] && remoteHost[1] == ethernet_host[1] &&
LBU	R2, 0(R25)
ANDI	R3, R2, 255
LBU	R2, Offset(Tcp_Ethernet_ethernet_host+0)(GP)
BEQ	R3, R2, L_Tcp_Ethernet_Ethernet_IsHost75
NOP	
J	L_Tcp_Ethernet_Ethernet_IsHost19
NOP	
L_Tcp_Ethernet_Ethernet_IsHost75:
ADDIU	R2, R25, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LBU	R2, Offset(Tcp_Ethernet_ethernet_host+1)(GP)
BEQ	R3, R2, L_Tcp_Ethernet_Ethernet_IsHost76
NOP	
J	L_Tcp_Ethernet_Ethernet_IsHost19
NOP	
L_Tcp_Ethernet_Ethernet_IsHost76:
;Tcp_Ethernet.c,150 :: 		remoteHost[2] == ethernet_host[2] && remoteHost[3] == ethernet_host[3];
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LBU	R2, Offset(Tcp_Ethernet_ethernet_host+2)(GP)
BEQ	R3, R2, L_Tcp_Ethernet_Ethernet_IsHost77
NOP	
J	L_Tcp_Ethernet_Ethernet_IsHost19
NOP	
L_Tcp_Ethernet_Ethernet_IsHost77:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LBU	R2, Offset(Tcp_Ethernet_ethernet_host+3)(GP)
BEQ	R3, R2, L_Tcp_Ethernet_Ethernet_IsHost78
NOP	
J	L_Tcp_Ethernet_Ethernet_IsHost19
NOP	
L_Tcp_Ethernet_Ethernet_IsHost78:
ORI	R2, R0, 1
J	L_Tcp_Ethernet_Ethernet_IsHost18
NOP	
L_Tcp_Ethernet_Ethernet_IsHost19:
MOVZ	R2, R0, R0
L_Tcp_Ethernet_Ethernet_IsHost18:
;Tcp_Ethernet.c,151 :: 		}
L_end_Ethernet_IsHost:
JR	RA
NOP	
; end of Tcp_Ethernet_Ethernet_IsHost
_SPI_Ethernet_UserTCP:
;Tcp_Ethernet.c,163 :: 		TEthPktFlags *flags) {
ADDIU	SP, SP, -96
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R27, 8(SP)
; flags start address is: 16 (R4)
LW	R4, 96(SP)
;Tcp_Ethernet.c,167 :: 		if (localPort != ETHERNET_TCP_PORT) return 0;
ANDI	R3, R27, 65535
ORI	R2, R0, 23
BNE	R3, R2, L__SPI_Ethernet_UserTCP81
NOP	
J	L_SPI_Ethernet_UserTCP20
NOP	
L__SPI_Ethernet_UserTCP81:
; flags end address is: 16 (R4)
MOVZ	R2, R0, R0
J	L_end_SPI_Ethernet_UserTCP
NOP	
L_SPI_Ethernet_UserTCP20:
;Tcp_Ethernet.c,168 :: 		if (Host_GetLink() == HOST_LINK_ETHERNET && !Ethernet_IsHost(remoteHost))
; flags start address is: 16 (R4)
SW	R4, 12(SP)
SH	R28, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
JAL	_Host_GetLink+0
NOP	
LW	R25, 20(SP)
LHU	R26, 18(SP)
LHU	R28, 16(SP)
LW	R4, 12(SP)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__SPI_Ethernet_UserTCP82
NOP	
J	L__SPI_Ethernet_UserTCP48
NOP	
L__SPI_Ethernet_UserTCP82:
JAL	Tcp_Ethernet_Ethernet_IsHost+0
NOP	
BEQ	R2, R0, L__SPI_Ethernet_UserTCP83
NOP	
J	L__SPI_Ethernet_UserTCP47
NOP	
L__SPI_Ethernet_UserTCP83:
; flags end address is: 16 (R4)
L__SPI_Ethernet_UserTCP46:
;Tcp_Ethernet.c,169 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_SPI_Ethernet_UserTCP
NOP	
;Tcp_Ethernet.c,168 :: 		if (Host_GetLink() == HOST_LINK_ETHERNET && !Ethernet_IsHost(remoteHost))
L__SPI_Ethernet_UserTCP48:
; flags start address is: 16 (R4)
L__SPI_Ethernet_UserTCP47:
;Tcp_Ethernet.c,170 :: 		flags->canCloseTCP = 0;
LBU	R2, 0(R4)
INS	R2, R0, 0, 1
SB	R2, 0(R4)
; flags end address is: 16 (R4)
;Tcp_Ethernet.c,171 :: 		if (reqLength == 0 && Host_GetLink() != HOST_LINK_ETHERNET) return 0;
ANDI	R2, R28, 65535
BEQ	R2, R0, L__SPI_Ethernet_UserTCP84
NOP	
J	L__SPI_Ethernet_UserTCP50
NOP	
L__SPI_Ethernet_UserTCP84:
SH	R28, 12(SP)
SH	R26, 14(SP)
SW	R25, 16(SP)
JAL	_Host_GetLink+0
NOP	
LW	R25, 16(SP)
LHU	R26, 14(SP)
LHU	R28, 12(SP)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SPI_Ethernet_UserTCP86
NOP	
J	L__SPI_Ethernet_UserTCP49
NOP	
L__SPI_Ethernet_UserTCP86:
L__SPI_Ethernet_UserTCP45:
MOVZ	R2, R0, R0
J	L_end_SPI_Ethernet_UserTCP
NOP	
L__SPI_Ethernet_UserTCP50:
L__SPI_Ethernet_UserTCP49:
;Tcp_Ethernet.c,173 :: 		if (Host_GetLink() != HOST_LINK_ETHERNET) {
SH	R28, 12(SP)
SH	R26, 14(SP)
SW	R25, 16(SP)
JAL	_Host_GetLink+0
NOP	
LW	R25, 16(SP)
LHU	R26, 14(SP)
LHU	R28, 12(SP)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SPI_Ethernet_UserTCP88
NOP	
J	L_SPI_Ethernet_UserTCP27
NOP	
L__SPI_Ethernet_UserTCP88:
;Tcp_Ethernet.c,174 :: 		memcpy(ethernet_host, remoteHost, 4);
SH	R26, 12(SP)
ORI	R27, R0, 4
MOVZ	R26, R25, R0
LUI	R25, hi_addr(Tcp_Ethernet_ethernet_host+0)
ORI	R25, R25, lo_addr(Tcp_Ethernet_ethernet_host+0)
JAL	_memcpy+0
NOP	
LHU	R26, 12(SP)
;Tcp_Ethernet.c,175 :: 		ethernet_host_port = remotePort;
SH	R26, Offset(Tcp_Ethernet_ethernet_host_port+0)(GP)
;Tcp_Ethernet.c,176 :: 		Ethernet_SetHost(HOST_LINK_ETHERNET);
SH	R28, 12(SP)
ORI	R25, R0, 1
JAL	Tcp_Ethernet_Ethernet_SetHost+0
NOP	
LHU	R28, 12(SP)
;Tcp_Ethernet.c,177 :: 		} else if (remotePort != ethernet_host_port) {
J	L_SPI_Ethernet_UserTCP28
NOP	
L_SPI_Ethernet_UserTCP27:
ANDI	R3, R26, 65535
LHU	R2, Offset(Tcp_Ethernet_ethernet_host_port+0)(GP)
BNE	R3, R2, L__SPI_Ethernet_UserTCP90
NOP	
J	L_SPI_Ethernet_UserTCP29
NOP	
L__SPI_Ethernet_UserTCP90:
;Tcp_Ethernet.c,178 :: 		if (reqLength == 0) return 0;
ANDI	R2, R28, 65535
BEQ	R2, R0, L__SPI_Ethernet_UserTCP91
NOP	
J	L_SPI_Ethernet_UserTCP30
NOP	
L__SPI_Ethernet_UserTCP91:
MOVZ	R2, R0, R0
J	L_end_SPI_Ethernet_UserTCP
NOP	
L_SPI_Ethernet_UserTCP30:
;Tcp_Ethernet.c,179 :: 		ethernet_host_port = remotePort;
SH	R26, Offset(Tcp_Ethernet_ethernet_host_port+0)(GP)
;Tcp_Ethernet.c,180 :: 		Reset_Ring();
SH	R28, 12(SP)
JAL	_Reset_Ring+0
NOP	
LHU	R28, 12(SP)
;Tcp_Ethernet.c,181 :: 		ethernet_tx_head = ethernet_tx_tail = 0;
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
SH	R0, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
;Tcp_Ethernet.c,182 :: 		}
L_SPI_Ethernet_UserTCP29:
L_SPI_Ethernet_UserTCP28:
;Tcp_Ethernet.c,183 :: 		ethernet_idle_sec = 0;
SH	R0, Offset(Tcp_Ethernet_ethernet_idle_sec+0)(GP)
;Tcp_Ethernet.c,185 :: 		while (reqLength > 0) {
L_SPI_Ethernet_UserTCP31:
ANDI	R2, R28, 65535
SLTIU	R2, R2, 1
BEQ	R2, R0, L__SPI_Ethernet_UserTCP92
NOP	
J	L_SPI_Ethernet_UserTCP32
NOP	
L__SPI_Ethernet_UserTCP92:
;Tcp_Ethernet.c,186 :: 		n = reqLength < ETHERNET_RX_CHUNK ? reqLength : ETHERNET_RX_CHUNK;
ANDI	R2, R28, 65535
SLTIU	R2, R2, 64
BNE	R2, R0, L__SPI_Ethernet_UserTCP93
NOP	
J	L_SPI_Ethernet_UserTCP33
NOP	
L__SPI_Ethernet_UserTCP93:
; ?FLOC___SPI_Ethernet_UserTCP?T69 start address is: 12 (R3)
ANDI	R3, R28, 65535
; ?FLOC___SPI_Ethernet_UserTCP?T69 end address is: 12 (R3)
J	L_SPI_Ethernet_UserTCP34
NOP	
L_SPI_Ethernet_UserTCP33:
; ?FLOC___SPI_Ethernet_UserTCP?T69 start address is: 12 (R3)
ORI	R3, R0, 64
; ?FLOC___SPI_Ethernet_UserTCP?T69 end address is: 12 (R3)
L_SPI_Ethernet_UserTCP34:
; ?FLOC___SPI_Ethernet_UserTCP?T69 start address is: 12 (R3)
; n start address is: 16 (R4)
ANDI	R4, R3, 65535
;Tcp_Ethernet.c,187 :: 		reqLength -= n;
SUBU	R2, R28, R3
; ?FLOC___SPI_Ethernet_UserTCP?T69 end address is: 12 (R3)
ANDI	R28, R2, 65535
;Tcp_Ethernet.c,188 :: 		sent = 0;
; sent start address is: 20 (R5)
MOVZ	R5, R0, R0
; n end address is: 16 (R4)
; sent end address is: 20 (R5)
;Tcp_Ethernet.c,189 :: 		while (sent < n) bytes[sent++] = SPI_Ethernet_getByte();
L_SPI_Ethernet_UserTCP35:
; sent start address is: 20 (R5)
; n start address is: 16 (R4)
ANDI	R3, R5, 65535
ANDI	R2, R4, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__SPI_Ethernet_UserTCP94
NOP	
J	L_SPI_Ethernet_UserTCP36
NOP	
L__SPI_Ethernet_UserTCP94:
ADDIU	R3, SP, 28
ANDI	R2, R5, 65535
ADDU	R2, R3, R2
SW	R2, 92(SP)
SH	R4, 12(SP)
SH	R5, 14(SP)
SH	R28, 16(SP)
SH	R27, 18(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
JAL	_SPI_Ethernet_getByte+0
NOP	
LW	R25, 24(SP)
LHU	R26, 20(SP)
LHU	R27, 18(SP)
LHU	R28, 16(SP)
LHU	R5, 14(SP)
LHU	R4, 12(SP)
LW	R3, 92(SP)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
; sent end address is: 20 (R5)
J	L_SPI_Ethernet_UserTCP35
NOP	
L_SPI_Ethernet_UserTCP36:
;Tcp_Ethernet.c,190 :: 		Host_ReceiveBytes(bytes, n);
ADDIU	R2, SP, 28
SH	R28, 12(SP)
; n end address is: 16 (R4)
SH	R27, 14(SP)
SH	R26, 16(SP)
SW	R25, 20(SP)
ANDI	R26, R4, 65535
MOVZ	R25, R2, R0
JAL	_Host_ReceiveBytes+0
NOP	
LW	R25, 20(SP)
LHU	R26, 16(SP)
LHU	R27, 14(SP)
LHU	R28, 12(SP)
;Tcp_Ethernet.c,191 :: 		}
J	L_SPI_Ethernet_UserTCP31
NOP	
L_SPI_Ethernet_UserTCP32:
;Tcp_Ethernet.c,192 :: 		Host_ServiceNow();
SH	R28, 12(SP)
SH	R27, 14(SP)
SH	R26, 16(SP)
SW	R25, 20(SP)
JAL	_Host_ServiceNow+0
NOP	
LW	R25, 20(SP)
LHU	R26, 16(SP)
LHU	R27, 14(SP)
LHU	R28, 12(SP)
;Tcp_Ethernet.c,194 :: 		sent = 0;
; sent start address is: 16 (R4)
MOVZ	R4, R0, R0
; sent end address is: 16 (R4)
;Tcp_Ethernet.c,195 :: 		while (ethernet_tx_tail != ethernet_tx_head && sent < ETHERNET_TX_MAX) {
L_SPI_Ethernet_UserTCP37:
; sent start address is: 16 (R4)
LHU	R3, Offset(Tcp_Ethernet_ethernet_tx_head+0)(GP)
LHU	R2, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
BNE	R2, R3, L__SPI_Ethernet_UserTCP96
NOP	
J	L__SPI_Ethernet_UserTCP52
NOP	
L__SPI_Ethernet_UserTCP96:
ANDI	R2, R4, 65535
SLTIU	R2, R2, 1024
BNE	R2, R0, L__SPI_Ethernet_UserTCP97
NOP	
J	L__SPI_Ethernet_UserTCP51
NOP	
L__SPI_Ethernet_UserTCP97:
L__SPI_Ethernet_UserTCP44:
;Tcp_Ethernet.c,196 :: 		SPI_Ethernet_putByte(ethernet_tx[ethernet_tx_tail]);
LHU	R3, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
LUI	R2, hi_addr(Tcp_Ethernet_ethernet_tx+0)
ORI	R2, R2, lo_addr(Tcp_Ethernet_ethernet_tx+0)
ADDU	R2, R2, R3
SH	R4, 12(SP)
SH	R28, 14(SP)
SH	R27, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
LBU	R25, 0(R2)
JAL	_SPI_Ethernet_putByte+0
NOP	
LW	R25, 20(SP)
LHU	R26, 18(SP)
LHU	R27, 16(SP)
LHU	R28, 14(SP)
LHU	R4, 12(SP)
;Tcp_Ethernet.c,197 :: 		ethernet_tx_tail = (ethernet_tx_tail + 1) & (ETHERNET_TX_SIZE - 1);
LHU	R2, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
ADDIU	R2, R2, 1
ANDI	R2, R2, 2047
SH	R2, Offset(Tcp_Ethernet_ethernet_tx_tail+0)(GP)
;Tcp_Ethernet.c,198 :: 		sent++;
ADDIU	R2, R4, 1
ANDI	R4, R2, 65535
;Tcp_Ethernet.c,199 :: 		}
J	L_SPI_Ethernet_UserTCP37
NOP	
;Tcp_Ethernet.c,195 :: 		while (ethernet_tx_tail != ethernet_tx_head && sent < ETHERNET_TX_MAX) {
L__SPI_Ethernet_UserTCP52:
L__SPI_Ethernet_UserTCP51:
;Tcp_Ethernet.c,200 :: 		return sent;
ANDI	R2, R4, 65535
; sent end address is: 16 (R4)
;Tcp_Ethernet.c,201 :: 		}
;Tcp_Ethernet.c,200 :: 		return sent;
;Tcp_Ethernet.c,201 :: 		}
L_end_SPI_Ethernet_UserTCP:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _SPI_Ethernet_UserTCP
_SPI_Ethernet_UserUDP:
;Tcp_Ethernet.c,207 :: 		TEthPktFlags *flags) {
; flags start address is: 8 (R2)
LW	R2, 0(SP)
; flags end address is: 8 (R2)
;Tcp_Ethernet.c,208 :: 		return 0;
MOVZ	R2, R0, R0
;Tcp_Ethernet.c,209 :: 		}
L_end_SPI_Ethernet_UserUDP:
JR	RA
NOP	
; end of _SPI_Ethernet_UserUDP
