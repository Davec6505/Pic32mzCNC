_report_status_message:
;Print.c,16 :: 		void report_status_message(int status_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,18 :: 		switch(status_code){
J	L_report_status_message0
NOP	
;Print.c,19 :: 		case STATUS_OK:
L_report_status_message2:
;Print.c,20 :: 		while(DMA_IsOn(1));
L_report_status_message3:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message116
NOP	
J	L_report_status_message4
NOP	
L__report_status_message116:
J	L_report_status_message3
NOP	
L_report_status_message4:
;Print.c,21 :: 		dma_printf("%s","ok\r\n");
LUI	R2, hi_addr(?lstr_2_Print+0)
ORI	R2, R2, lo_addr(?lstr_2_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_1_Print+0)
ORI	R2, R2, lo_addr(?lstr_1_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,22 :: 		return;
J	L_end_report_status_message
NOP	
;Print.c,23 :: 		case STATUS_EXPECTED_COMMAND_LETTER: err_no = 1; break;
L_report_status_message5:
ORI	R2, R0, 1
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,24 :: 		case STATUS_BAD_NUMBER_FORMAT:       err_no = 2; break;
L_report_status_message6:
ORI	R2, R0, 2
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,25 :: 		case STATUS_INVALID_STATEMENT:       err_no = 3; break;
L_report_status_message7:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,26 :: 		case STATUS_SETTING_VALUE_NEG:       err_no = 4; break;
L_report_status_message8:
ORI	R2, R0, 4
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,27 :: 		case STATUS_SETTING_DISABLED:        err_no = 5; break;
L_report_status_message9:
ORI	R2, R0, 5
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,28 :: 		case STATUS_SETTING_STEP_PULSE_MIN:  err_no = 6; break;
L_report_status_message10:
ORI	R2, R0, 6
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,29 :: 		case STATUS_SETTING_READ_FAIL:       err_no = 7; break;
L_report_status_message11:
ORI	R2, R0, 7
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,30 :: 		case STATUS_IDLE_ERROR:              err_no = 8; break;
L_report_status_message12:
ORI	R2, R0, 8
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,31 :: 		case STATUS_ALARM_LOCK:              err_no = 9; break;
L_report_status_message13:
ORI	R2, R0, 9
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,32 :: 		case STATUS_LINE_OVERFLOW:
L_report_status_message14:
;Print.c,33 :: 		case STATUS_SERIAL_RX_ERROR:         err_no = 11; break;
L_report_status_message15:
ORI	R2, R0, 11
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,34 :: 		case STATUS_SPEED_ERROR:             err_no = 12; break;
L_report_status_message16:
ORI	R2, R0, 12
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,35 :: 		case STATUS_UNSUPPORTED_STATEMENT:
L_report_status_message17:
;Print.c,36 :: 		case STATUS_EI_ERROR:                err_no = 20; break;
L_report_status_message18:
ORI	R2, R0, 20
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,37 :: 		case STATUS_MODAL_GROUP_VIOLATION:   err_no = 21; break;
L_report_status_message19:
ORI	R2, R0, 21
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,38 :: 		case STATUS_UNDEFINED_FEED_RATE:     err_no = 22; break;
L_report_status_message20:
ORI	R2, R0, 22
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,39 :: 		case STATUS_ARC_RADIUS_ERROR:        err_no = 34; break;
L_report_status_message21:
ORI	R2, R0, 34
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,40 :: 		case STATUS_COMMAND_EXECUTE_MOTION:
L_report_status_message22:
;Print.c,41 :: 		case STATUS_NO_REPORT:               return;
L_report_status_message23:
J	L_end_report_status_message
NOP	
;Print.c,43 :: 		default:                             err_no = 3; break;
L_report_status_message24:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,44 :: 		}
L_report_status_message0:
SEH	R2, R25
BNE	R2, R0, L__report_status_message118
NOP	
J	L_report_status_message2
NOP	
L__report_status_message118:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_status_message120
NOP	
J	L_report_status_message5
NOP	
L__report_status_message120:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_status_message122
NOP	
J	L_report_status_message6
NOP	
L__report_status_message122:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__report_status_message124
NOP	
J	L_report_status_message7
NOP	
L__report_status_message124:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__report_status_message126
NOP	
J	L_report_status_message8
NOP	
L__report_status_message126:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__report_status_message128
NOP	
J	L_report_status_message9
NOP	
L__report_status_message128:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__report_status_message130
NOP	
J	L_report_status_message10
NOP	
L__report_status_message130:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__report_status_message132
NOP	
J	L_report_status_message11
NOP	
L__report_status_message132:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__report_status_message134
NOP	
J	L_report_status_message12
NOP	
L__report_status_message134:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__report_status_message136
NOP	
J	L_report_status_message13
NOP	
L__report_status_message136:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__report_status_message138
NOP	
J	L_report_status_message14
NOP	
L__report_status_message138:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__report_status_message140
NOP	
J	L_report_status_message15
NOP	
L__report_status_message140:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__report_status_message142
NOP	
J	L_report_status_message16
NOP	
L__report_status_message142:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_status_message144
NOP	
J	L_report_status_message17
NOP	
L__report_status_message144:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__report_status_message146
NOP	
J	L_report_status_message18
NOP	
L__report_status_message146:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_status_message148
NOP	
J	L_report_status_message19
NOP	
L__report_status_message148:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__report_status_message150
NOP	
J	L_report_status_message20
NOP	
L__report_status_message150:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_status_message152
NOP	
J	L_report_status_message21
NOP	
L__report_status_message152:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__report_status_message154
NOP	
J	L_report_status_message22
NOP	
L__report_status_message154:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__report_status_message156
NOP	
J	L_report_status_message23
NOP	
L__report_status_message156:
J	L_report_status_message24
NOP	
L_report_status_message1:
;Print.c,45 :: 		while(DMA_IsOn(1));
L_report_status_message25:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message158
NOP	
J	L_report_status_message26
NOP	
L__report_status_message158:
J	L_report_status_message25
NOP	
L_report_status_message26:
;Print.c,46 :: 		dma_printf("error:%d\r\n",err_no);
LH	R2, 6(SP)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
LUI	R2, hi_addr(?lstr_3_Print+0)
ORI	R2, R2, lo_addr(?lstr_3_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,47 :: 		}
L_end_report_status_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_status_message
_report_alarm_message:
;Print.c,56 :: 		void report_alarm_message(int alarm_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,58 :: 		switch (alarm_code) {
J	L_report_alarm_message27
NOP	
;Print.c,59 :: 		case ALARM_HARD_LIMIT:  err_no = 1; break;
L_report_alarm_message29:
ORI	R2, R0, 1
SH	R2, 6(SP)
J	L_report_alarm_message28
NOP	
;Print.c,60 :: 		case ALARM_ABORT_CYCLE: err_no = 3; break;
L_report_alarm_message30:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_alarm_message28
NOP	
;Print.c,61 :: 		default: return;
L_report_alarm_message31:
J	L_end_report_alarm_message
NOP	
;Print.c,62 :: 		}
L_report_alarm_message27:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_alarm_message161
NOP	
J	L_report_alarm_message29
NOP	
L__report_alarm_message161:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__report_alarm_message163
NOP	
J	L_report_alarm_message30
NOP	
L__report_alarm_message163:
J	L_report_alarm_message31
NOP	
L_report_alarm_message28:
;Print.c,63 :: 		while(DMA_IsOn(1));
L_report_alarm_message32:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message165
NOP	
J	L_report_alarm_message33
NOP	
L__report_alarm_message165:
J	L_report_alarm_message32
NOP	
L_report_alarm_message33:
;Print.c,64 :: 		dma_printf("ALARM:%d\r\n",err_no);
LH	R2, 6(SP)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
LUI	R2, hi_addr(?lstr_4_Print+0)
ORI	R2, R2, lo_addr(?lstr_4_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,65 :: 		Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
LUI	R24, 508
ORI	R24, R24, 41044
L_report_alarm_message34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_report_alarm_message34
NOP	
NOP	
NOP	
;Print.c,66 :: 		}
L_end_report_alarm_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_alarm_message
_report_feedback_message:
;Print.c,79 :: 		void report_feedback_message(int message_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,80 :: 		while(DMA_IsOn(1));
L_report_feedback_message36:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message168
NOP	
J	L_report_feedback_message37
NOP	
L__report_feedback_message168:
J	L_report_feedback_message36
NOP	
L_report_feedback_message37:
;Print.c,81 :: 		switch(message_code) {
J	L_report_feedback_message38
NOP	
;Print.c,82 :: 		case MESSAGE_CRITICAL_EVENT: dma_printf("%s","[MSG:Reset to continue]\r\n"); break;
L_report_feedback_message40:
LUI	R2, hi_addr(?lstr_6_Print+0)
ORI	R2, R2, lo_addr(?lstr_6_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_5_Print+0)
ORI	R2, R2, lo_addr(?lstr_5_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message39
NOP	
;Print.c,83 :: 		case MESSAGE_ALARM_LOCK:     dma_printf("%s","[MSG:'$H'|'$X' to unlock]\r\n"); break;
L_report_feedback_message41:
LUI	R2, hi_addr(?lstr_8_Print+0)
ORI	R2, R2, lo_addr(?lstr_8_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_7_Print+0)
ORI	R2, R2, lo_addr(?lstr_7_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message39
NOP	
;Print.c,84 :: 		case MESSAGE_ALARM_UNLOCK:   dma_printf("%s","[MSG:Caution: Unlocked]\r\n"); break;
L_report_feedback_message42:
LUI	R2, hi_addr(?lstr_10_Print+0)
ORI	R2, R2, lo_addr(?lstr_10_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_9_Print+0)
ORI	R2, R2, lo_addr(?lstr_9_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message39
NOP	
;Print.c,85 :: 		case MESSAGE_ENABLED:        dma_printf("%s","[MSG:Enabled]\r\n"); break;
L_report_feedback_message43:
LUI	R2, hi_addr(?lstr_12_Print+0)
ORI	R2, R2, lo_addr(?lstr_12_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_11_Print+0)
ORI	R2, R2, lo_addr(?lstr_11_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message39
NOP	
;Print.c,86 :: 		case MESSAGE_DISABLED:       dma_printf("%s","[MSG:Disabled]\r\n"); break;
L_report_feedback_message44:
LUI	R2, hi_addr(?lstr_14_Print+0)
ORI	R2, R2, lo_addr(?lstr_14_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_13_Print+0)
ORI	R2, R2, lo_addr(?lstr_13_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message39
NOP	
;Print.c,87 :: 		}
L_report_feedback_message38:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_feedback_message170
NOP	
J	L_report_feedback_message40
NOP	
L__report_feedback_message170:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_feedback_message172
NOP	
J	L_report_feedback_message41
NOP	
L__report_feedback_message172:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_feedback_message174
NOP	
J	L_report_feedback_message42
NOP	
L__report_feedback_message174:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_feedback_message176
NOP	
J	L_report_feedback_message43
NOP	
L__report_feedback_message176:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_feedback_message178
NOP	
J	L_report_feedback_message44
NOP	
L__report_feedback_message178:
L_report_feedback_message39:
;Print.c,88 :: 		}
L_end_report_feedback_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_feedback_message
_report_init_message:
;Print.c,97 :: 		void report_init_message(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,98 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_init_message45:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_init_message181
NOP	
J	L_report_init_message46
NOP	
L__report_init_message181:
J	L_report_init_message45
NOP	
L_report_init_message46:
;Print.c,99 :: 		dma_printf("\r\n%s%s%s\r\n",FIRMWARE,GRBL_VERSION,GRBL_HELP);
LUI	R2, hi_addr(?lstr_18_Print+0)
ORI	R2, R2, lo_addr(?lstr_18_Print+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(?lstr_17_Print+0)
ORI	R2, R2, lo_addr(?lstr_17_Print+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_16_Print+0)
ORI	R2, R2, lo_addr(?lstr_16_Print+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_15_Print+0)
ORI	R2, R2, lo_addr(?lstr_15_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,100 :: 		}
L_end_report_init_message:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_init_message
_report_grbl_help:
;Print.c,109 :: 		void report_grbl_help() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,110 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_grbl_help47:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_help184
NOP	
J	L_report_grbl_help48
NOP	
L__report_grbl_help184:
J	L_report_grbl_help47
NOP	
L_report_grbl_help48:
;Print.c,111 :: 		dma_printf("%s","[HLP:$$ $# $G $I $N $x=val $Nx=line $C $X $H ~ ! ? ctrl-x]\r\n");
LUI	R2, hi_addr(?lstr_20_Print+0)
ORI	R2, R2, lo_addr(?lstr_20_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_19_Print+0)
ORI	R2, R2, lo_addr(?lstr_19_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,112 :: 		}
L_end_report_grbl_help:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_grbl_help
_report_build_info:
;Print.c,126 :: 		void report_build_info(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,127 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_build_info49:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_build_info187
NOP	
J	L_report_build_info50
NOP	
L__report_build_info187:
J	L_report_build_info49
NOP	
L_report_build_info50:
;Print.c,128 :: 		dma_printf("[VER:%s.%s:]\r\n[OPT:,15,128]\r\n",GRBL_VERSION,GRBL_VERSION_BUILD);
LUI	R2, hi_addr(?lstr_23_Print+0)
ORI	R2, R2, lo_addr(?lstr_23_Print+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_22_Print+0)
ORI	R2, R2, lo_addr(?lstr_22_Print+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_21_Print+0)
ORI	R2, R2, lo_addr(?lstr_21_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Print.c,129 :: 		while(DMA_IsOn(1));
L_report_build_info51:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_build_info189
NOP	
J	L_report_build_info52
NOP	
L__report_build_info189:
J	L_report_build_info51
NOP	
L_report_build_info52:
;Print.c,130 :: 		if(Ethernet_Ready()) dma_printf("[MSG:Ethernet %s]\r\n",Ethernet_Address());
JAL	_Ethernet_Ready+0
NOP	
BNE	R2, R0, L__report_build_info191
NOP	
J	L_report_build_info53
NOP	
L__report_build_info191:
JAL	_Ethernet_Address+0
NOP	
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_24_Print+0)
ORI	R2, R2, lo_addr(?lstr_24_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_build_info54
NOP	
L_report_build_info53:
;Print.c,131 :: 		else dma_printf("[MSG:Ethernet not found]\r\n");
LUI	R2, hi_addr(?lstr_25_Print+0)
ORI	R2, R2, lo_addr(?lstr_25_Print+0)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_build_info54:
;Print.c,132 :: 		}
L_end_report_build_info:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_build_info
_report_grbl_settings:
;Print.c,141 :: 		void report_grbl_settings() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,142 :: 		float acc = settings.acceleration / sec_sec;
LWC1	S1, Offset(_settings+40)(GP)
LUI	R2, 17761
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
SWC1	S0, 4(SP)
;Print.c,152 :: 		,(int)bit_istrue(settings.flags,BITFLAG_INVERT_LIMIT_PINS));
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
XORI	R3, R2, 0
SLTU	R3, R0, R3
;Print.c,151 :: 		,(int)bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 4
ANDI	R2, R2, 65535
XORI	R2, R2, 0
SLTU	R2, R0, R2
;Print.c,152 :: 		,(int)bit_istrue(settings.flags,BITFLAG_INVERT_LIMIT_PINS));
ADDIU	SP, SP, -28
SH	R3, 24(SP)
;Print.c,151 :: 		,(int)bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
SH	R2, 20(SP)
;Print.c,150 :: 		,(int)settings.dir_invert_mask
LH	R2, Offset(_settings+68)(GP)
SH	R2, 16(SP)
;Print.c,149 :: 		,(int)settings.invert_mask
LH	R2, Offset(_settings+66)(GP)
SH	R2, 12(SP)
;Print.c,148 :: 		,(int)settings.stepper_idle_lock_time
LH	R2, Offset(_settings+56)(GP)
SH	R2, 8(SP)
;Print.c,147 :: 		,(int)settings.p_usec
LH	R2, Offset(_settings+60)(GP)
SH	R2, 4(SP)
;Print.c,146 :: 		dma_printf("$0=%d\r\n$1=%d\r\n$2=%d\r\n$3=%d\r\n$4=%d\r\n$5=%d\r\n$6=0\r\n$10=1\r\n"
LUI	R2, hi_addr(?lstr_26_Print+0)
ORI	R2, R2, lo_addr(?lstr_26_Print+0)
SW	R2, 0(SP)
;Print.c,152 :: 		,(int)bit_istrue(settings.flags,BITFLAG_INVERT_LIMIT_PINS));
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Print.c,162 :: 		,(int)bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
XORI	R5, R2, 0
SLTU	R5, R0, R5
;Print.c,161 :: 		,(int)bit_istrue(settings.flags,BITFLAG_HARD_LIMIT_ENABLE)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
XORI	R4, R2, 0
SLTU	R4, R0, R4
;Print.c,160 :: 		,(int)bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
XORI	R3, R2, 0
SLTU	R3, R0, R3
;Print.c,163 :: 		,(int)settings.homing_dir_mask);
LH	R2, Offset(_settings+64)(GP)
ADDIU	SP, SP, -28
SH	R2, 24(SP)
;Print.c,162 :: 		,(int)bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
SH	R5, 20(SP)
;Print.c,161 :: 		,(int)bit_istrue(settings.flags,BITFLAG_HARD_LIMIT_ENABLE)
SH	R4, 16(SP)
;Print.c,160 :: 		,(int)bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)
SH	R3, 12(SP)
;Print.c,159 :: 		,settings.mm_per_arc_segment
LW	R2, Offset(_settings+36)(GP)
SW	R2, 8(SP)
;Print.c,158 :: 		,settings.junction_deviation
LW	R2, Offset(_settings+44)(GP)
SW	R2, 4(SP)
;Print.c,157 :: 		dma_printf("$11=%f\r\n$12=%f\r\n$13=%d\r\n$20=0\r\n$21=%d\r\n$22=%d\r\n$23=%d\r\n"
LUI	R2, hi_addr(?lstr_27_Print+0)
ORI	R2, R2, lo_addr(?lstr_27_Print+0)
SW	R2, 0(SP)
;Print.c,163 :: 		,(int)settings.homing_dir_mask);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Print.c,171 :: 		,settings.homing_pulloff);
LW	R2, Offset(_settings+32)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Print.c,170 :: 		,(int)settings.homing_debounce_delay
LH	R2, Offset(_settings+54)(GP)
SH	R2, 12(SP)
;Print.c,169 :: 		,settings.homing_seek_rate
LW	R2, Offset(_settings+28)(GP)
SW	R2, 8(SP)
;Print.c,168 :: 		,settings.homing_feed_rate
LW	R2, Offset(_settings+24)(GP)
SW	R2, 4(SP)
;Print.c,167 :: 		dma_printf("$24=%f\r\n$25=%f\r\n$26=%d\r\n$27=%f\r\n$30=1000\r\n$31=0\r\n$32=0\r\n"
LUI	R2, hi_addr(?lstr_28_Print+0)
ORI	R2, R2, lo_addr(?lstr_28_Print+0)
SW	R2, 0(SP)
;Print.c,171 :: 		,settings.homing_pulloff);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Print.c,178 :: 		,settings.steps_per_mm[Z]);
LW	R2, Offset(_settings+8)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,177 :: 		,settings.steps_per_mm[Y]
LW	R2, Offset(_settings+4)(GP)
SW	R2, 8(SP)
;Print.c,176 :: 		,settings.steps_per_mm[X]
LW	R2, Offset(_settings+0)(GP)
SW	R2, 4(SP)
;Print.c,175 :: 		dma_printf("$100=%f\r\n$101=%f\r\n$102=%f\r\n"
LUI	R2, hi_addr(?lstr_29_Print+0)
ORI	R2, R2, lo_addr(?lstr_29_Print+0)
SW	R2, 0(SP)
;Print.c,178 :: 		,settings.steps_per_mm[Z]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,186 :: 		,acc,acc,acc);
LW	R2, 4(SP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, 32(SP)
SW	R2, 20(SP)
LW	R2, 32(SP)
SW	R2, 16(SP)
;Print.c,185 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 12(SP)
;Print.c,184 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 8(SP)
;Print.c,183 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 4(SP)
;Print.c,182 :: 		dma_printf("$110=%f\r\n$111=%f\r\n$112=%f\r\n$120=%f\r\n$121=%f\r\n$122=%f\r\n"
LUI	R2, hi_addr(?lstr_30_Print+0)
ORI	R2, R2, lo_addr(?lstr_30_Print+0)
SW	R2, 0(SP)
;Print.c,186 :: 		,acc,acc,acc);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Print.c,193 :: 		,(float)Z_MAX_SIZE);
LUI	R2, 17096
ORI	R2, R2, 0
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,192 :: 		,(float)Y_MAX_SIZE
LUI	R2, 17302
ORI	R2, R2, 0
SW	R2, 8(SP)
;Print.c,191 :: 		,(float)X_MAX_SIZE
LUI	R2, 17302
ORI	R2, R2, 0
SW	R2, 4(SP)
;Print.c,190 :: 		dma_printf("$130=%f\r\n$131=%f\r\n$132=%f\r\n"
LUI	R2, hi_addr(?lstr_31_Print+0)
ORI	R2, R2, lo_addr(?lstr_31_Print+0)
SW	R2, 0(SP)
;Print.c,193 :: 		,(float)Z_MAX_SIZE);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,194 :: 		}
L_end_report_grbl_settings:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_grbl_settings
_report_startup_line:
;Print.c,202 :: 		void report_startup_line(int n, char *line){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Print.c,206 :: 		dma_printf("$N%d=%s\r\n",n,line);
ADDIU	SP, SP, -12
SW	R26, 8(SP)
SH	R25, 4(SP)
LUI	R2, hi_addr(?lstr_32_Print+0)
ORI	R2, R2, lo_addr(?lstr_32_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Print.c,207 :: 		}
L_end_report_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _report_startup_line
Print_report_xyz:
;Print.c,213 :: 		static void report_xyz(float *pos){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Print.c,217 :: 		dma_printf("%f,%f,%f",pos[X],pos[Y],pos[Z]);
ADDIU	R2, R25, 8
LWC1	S2, 0(R2)
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R25)
ADDIU	SP, SP, -16
SWC1	S2, 12(SP)
SWC1	S1, 8(SP)
SWC1	S0, 4(SP)
LUI	R2, hi_addr(?lstr_33_Print+0)
ORI	R2, R2, lo_addr(?lstr_33_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,218 :: 		}
L_end_report_xyz:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Print_report_xyz
Print_report_to_units:
;Print.c,224 :: 		static void report_to_units(float *pos){
;Print.c,226 :: 		if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L_Print_report_to_units202
NOP	
J	L_Print_report_to_units55
NOP	
L_Print_report_to_units202:
;Print.c,227 :: 		for (i=0; i<3; i++) { pos[i] *= INCH_PER_MM; }
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Print_report_to_units56:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L_Print_report_to_units203
NOP	
J	L_Print_report_to_units57
NOP	
L_Print_report_to_units203:
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R3, R25, R2
LWC1	S1, 0(R3)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_Print_report_to_units56
NOP	
L_Print_report_to_units57:
;Print.c,228 :: 		}
L_Print_report_to_units55:
;Print.c,229 :: 		}
L_end_report_to_units:
JR	RA
NOP	
; end of Print_report_to_units
_report_realtime_status:
;Print.c,237 :: 		void report_realtime_status(){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Print.c,244 :: 		switch (sys.state) {
SW	R25, 4(SP)
SW	R26, 8(SP)
J	L_report_realtime_status59
NOP	
;Print.c,245 :: 		case STATE_CYCLE:      dma_printf("%s","<Run"); break;
L_report_realtime_status61:
LUI	R2, hi_addr(?lstr_35_Print+0)
ORI	R2, R2, lo_addr(?lstr_35_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_34_Print+0)
ORI	R2, R2, lo_addr(?lstr_34_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,246 :: 		case STATE_HOLD:       dma_printf("%s","<Hold:0"); break;
L_report_realtime_status62:
LUI	R2, hi_addr(?lstr_37_Print+0)
ORI	R2, R2, lo_addr(?lstr_37_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_36_Print+0)
ORI	R2, R2, lo_addr(?lstr_36_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,247 :: 		case STATE_HOMING:     dma_printf("%s","<Home"); break;
L_report_realtime_status63:
LUI	R2, hi_addr(?lstr_39_Print+0)
ORI	R2, R2, lo_addr(?lstr_39_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_38_Print+0)
ORI	R2, R2, lo_addr(?lstr_38_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,248 :: 		case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
L_report_realtime_status64:
LUI	R2, hi_addr(?lstr_41_Print+0)
ORI	R2, R2, lo_addr(?lstr_41_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_40_Print+0)
ORI	R2, R2, lo_addr(?lstr_40_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,249 :: 		case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
L_report_realtime_status65:
LUI	R2, hi_addr(?lstr_43_Print+0)
ORI	R2, R2, lo_addr(?lstr_43_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_42_Print+0)
ORI	R2, R2, lo_addr(?lstr_42_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,250 :: 		default:               dma_printf("%s","<Idle"); break;
L_report_realtime_status66:
LUI	R2, hi_addr(?lstr_45_Print+0)
ORI	R2, R2, lo_addr(?lstr_45_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_44_Print+0)
ORI	R2, R2, lo_addr(?lstr_44_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status60
NOP	
;Print.c,251 :: 		}
L_report_realtime_status59:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_realtime_status206
NOP	
J	L_report_realtime_status61
NOP	
L__report_realtime_status206:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_realtime_status208
NOP	
J	L_report_realtime_status62
NOP	
L__report_realtime_status208:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_realtime_status210
NOP	
J	L_report_realtime_status63
NOP	
L__report_realtime_status210:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_realtime_status212
NOP	
J	L_report_realtime_status64
NOP	
L__report_realtime_status212:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_realtime_status214
NOP	
J	L_report_realtime_status65
NOP	
L__report_realtime_status214:
J	L_report_realtime_status66
NOP	
L_report_realtime_status60:
;Print.c,253 :: 		for (i=0; i<3; i++) {
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_report_realtime_status67:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status215
NOP	
J	L_report_realtime_status68
NOP	
L__report_realtime_status215:
;Print.c,254 :: 		position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
ADDIU	R3, SP, 16
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 28(SP)
SEH	R3, R4
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 28(SP)
SWC1	S0, 0(R2)
;Print.c,253 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R4, 1
SEH	R4, R2
;Print.c,255 :: 		}
; i end address is: 16 (R4)
J	L_report_realtime_status67
NOP	
L_report_realtime_status68:
;Print.c,256 :: 		report_to_units(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_to_units+0
NOP	
;Print.c,260 :: 		dma_printf("%s","|MPos:");
LUI	R2, hi_addr(?lstr_47_Print+0)
ORI	R2, R2, lo_addr(?lstr_47_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_46_Print+0)
ORI	R2, R2, lo_addr(?lstr_46_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,261 :: 		report_xyz(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_xyz+0
NOP	
;Print.c,266 :: 		dma_printf("|FS:%d,0|WCO:",(sys.state == STATE_CYCLE) ? (int)gc.feed_rate : 0);
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__report_realtime_status216
NOP	
J	L_report_realtime_status70
NOP	
L__report_realtime_status216:
LWC1	S0, Offset(_gc+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
; ?FLOC___report_realtime_status?T146 start address is: 8 (R2)
; ?FLOC___report_realtime_status?T146 end address is: 8 (R2)
J	L_report_realtime_status71
NOP	
L_report_realtime_status70:
; ?FLOC___report_realtime_status?T146 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___report_realtime_status?T146 end address is: 8 (R2)
L_report_realtime_status71:
; ?FLOC___report_realtime_status?T146 start address is: 8 (R2)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
; ?FLOC___report_realtime_status?T146 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_48_Print+0)
ORI	R2, R2, lo_addr(?lstr_48_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,267 :: 		for (i=0; i<3; i++) {
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_realtime_status72:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status217
NOP	
J	L_report_realtime_status73
NOP	
L__report_realtime_status217:
;Print.c,268 :: 		position[i] = gc.coord_system[i] + gc.coord_offset[i];
ADDIU	R3, SP, 16
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+48)
ORI	R2, R2, lo_addr(_gc+48)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+64)
ORI	R2, R2, lo_addr(_gc+64)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Print.c,267 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R5, 1
SEH	R5, R2
;Print.c,269 :: 		}
; i end address is: 20 (R5)
J	L_report_realtime_status72
NOP	
L_report_realtime_status73:
;Print.c,270 :: 		report_to_units(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_to_units+0
NOP	
;Print.c,271 :: 		report_xyz(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_xyz+0
NOP	
;Print.c,275 :: 		dma_printf("%s",">\r\n");
LUI	R2, hi_addr(?lstr_50_Print+0)
ORI	R2, R2, lo_addr(?lstr_50_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_49_Print+0)
ORI	R2, R2, lo_addr(?lstr_49_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,276 :: 		}
L_end_report_realtime_status:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _report_realtime_status
Print_report_coord_line:
;Print.c,285 :: 		static void report_coord_line(char *name, float *pos){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,286 :: 		report_to_units(pos);
SW	R25, 4(SP)
SW	R25, 8(SP)
MOVZ	R25, R26, R0
JAL	Print_report_to_units+0
NOP	
LW	R25, 8(SP)
;Print.c,290 :: 		dma_printf("[%s:",name);
SW	R26, 8(SP)
ADDIU	SP, SP, -8
SW	R25, 4(SP)
LUI	R2, hi_addr(?lstr_51_Print+0)
ORI	R2, R2, lo_addr(?lstr_51_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R26, 8(SP)
;Print.c,291 :: 		report_xyz(pos);
MOVZ	R25, R26, R0
JAL	Print_report_xyz+0
NOP	
;Print.c,295 :: 		dma_printf("%s","]\r\n");
LUI	R2, hi_addr(?lstr_53_Print+0)
ORI	R2, R2, lo_addr(?lstr_53_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_52_Print+0)
ORI	R2, R2, lo_addr(?lstr_52_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,296 :: 		}
L_end_report_coord_line:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Print_report_coord_line
Print_report_coord_system:
;Print.c,304 :: 		static void report_coord_system(char *name, int recipe){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Print.c,307 :: 		for (i=0; i<3; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Print_report_coord_system75:
; i start address is: 24 (R6)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Print_report_coord_system220
NOP	
J	L_Print_report_coord_system76
NOP	
L_Print_report_coord_system220:
;Print.c,308 :: 		position[i] = coord_system[recipe-1].coord[i];
ADDIU	R3, SP, 12
SEH	R2, R6
SLL	R5, R2, 2
ADDU	R4, R3, R5
ADDIU	R2, R26, -1
SEH	R2, R2
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R2, R2, R3
ADDU	R2, R2, R5
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
;Print.c,307 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Print.c,309 :: 		}
; i end address is: 24 (R6)
J	L_Print_report_coord_system75
NOP	
L_Print_report_coord_system76:
;Print.c,310 :: 		report_coord_line(name,position);
ADDIU	R2, SP, 12
SH	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R2, R0
JAL	Print_report_coord_line+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
;Print.c,311 :: 		}
L_end_report_coord_system:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of Print_report_coord_system
_report_gcode_parameters:
;Print.c,320 :: 		void report_gcode_parameters(){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Print.c,324 :: 		settings_read_coord_data();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_settings_read_coord_data+0
NOP	
;Print.c,325 :: 		report_coord_system("G54",1);
ORI	R30, R0, 71
SB	R30, 24(SP)
ORI	R30, R0, 53
SB	R30, 25(SP)
ORI	R30, R0, 52
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 24
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,326 :: 		report_coord_system("G55",2);
ORI	R30, R0, 71
SB	R30, 28(SP)
ORI	R30, R0, 53
SB	R30, 29(SP)
ORI	R30, R0, 53
SB	R30, 30(SP)
MOVZ	R30, R0, R0
SB	R30, 31(SP)
ADDIU	R2, SP, 28
ORI	R26, R0, 2
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,327 :: 		report_coord_system("G56",3);
ORI	R30, R0, 71
SB	R30, 32(SP)
ORI	R30, R0, 53
SB	R30, 33(SP)
ORI	R30, R0, 54
SB	R30, 34(SP)
MOVZ	R30, R0, R0
SB	R30, 35(SP)
ADDIU	R2, SP, 32
ORI	R26, R0, 3
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,328 :: 		report_coord_system("G57",4);
ORI	R30, R0, 71
SB	R30, 36(SP)
ORI	R30, R0, 53
SB	R30, 37(SP)
ORI	R30, R0, 55
SB	R30, 38(SP)
MOVZ	R30, R0, R0
SB	R30, 39(SP)
ADDIU	R2, SP, 36
ORI	R26, R0, 4
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,329 :: 		report_coord_system("G58",5);
ORI	R30, R0, 71
SB	R30, 40(SP)
ORI	R30, R0, 53
SB	R30, 41(SP)
ORI	R30, R0, 56
SB	R30, 42(SP)
MOVZ	R30, R0, R0
SB	R30, 43(SP)
ADDIU	R2, SP, 40
ORI	R26, R0, 5
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,330 :: 		report_coord_system("G59",6);
ORI	R30, R0, 71
SB	R30, 44(SP)
ORI	R30, R0, 53
SB	R30, 45(SP)
ORI	R30, R0, 57
SB	R30, 46(SP)
MOVZ	R30, R0, R0
SB	R30, 47(SP)
ADDIU	R2, SP, 44
ORI	R26, R0, 6
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,331 :: 		report_coord_system("G28",SETTING_INDEX_G28);
ORI	R30, R0, 71
SB	R30, 48(SP)
ORI	R30, R0, 50
SB	R30, 49(SP)
ORI	R30, R0, 56
SB	R30, 50(SP)
MOVZ	R30, R0, R0
SB	R30, 51(SP)
ADDIU	R2, SP, 48
ORI	R26, R0, 10
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,332 :: 		report_coord_system("G30",SETTING_INDEX_G30);
ORI	R30, R0, 71
SB	R30, 52(SP)
ORI	R30, R0, 51
SB	R30, 53(SP)
ORI	R30, R0, 48
SB	R30, 54(SP)
MOVZ	R30, R0, R0
SB	R30, 55(SP)
ADDIU	R2, SP, 52
ORI	R26, R0, 11
MOVZ	R25, R2, R0
JAL	Print_report_coord_system+0
NOP	
;Print.c,333 :: 		for (i=0; i<3; i++) { position[i] = gc.coord_offset[i]; }
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_gcode_parameters78:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters222
NOP	
J	L_report_gcode_parameters79
NOP	
L__report_gcode_parameters222:
ADDIU	R3, SP, 12
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+64)
ORI	R2, R2, lo_addr(_gc+64)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
ADDIU	R2, R5, 1
SEH	R5, R2
; i end address is: 20 (R5)
J	L_report_gcode_parameters78
NOP	
L_report_gcode_parameters79:
;Print.c,334 :: 		report_coord_line("G92",position);
ADDIU	R3, SP, 12
ORI	R30, R0, 71
SB	R30, 56(SP)
ORI	R30, R0, 57
SB	R30, 57(SP)
ORI	R30, R0, 50
SB	R30, 58(SP)
MOVZ	R30, R0, R0
SB	R30, 59(SP)
ADDIU	R2, SP, 56
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	Print_report_coord_line+0
NOP	
;Print.c,338 :: 		dma_printf("%s","[TLO:0.000]\r\n");
LUI	R2, hi_addr(?lstr_64_Print+0)
ORI	R2, R2, lo_addr(?lstr_64_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_63_Print+0)
ORI	R2, R2, lo_addr(?lstr_63_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,342 :: 		dma_printf("%s","[PRB:0.000,0.000,0.000:0]\r\n");
LUI	R2, hi_addr(?lstr_66_Print+0)
ORI	R2, R2, lo_addr(?lstr_66_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_65_Print+0)
ORI	R2, R2, lo_addr(?lstr_65_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,343 :: 		}
L_end_report_gcode_parameters:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _report_gcode_parameters
_report_gcode_modes:
;Print.c,346 :: 		void report_gcode_modes(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Print.c,348 :: 		switch (gc.motion_mode) {
J	L_report_gcode_modes81
NOP	
;Print.c,349 :: 		case MOTION_MODE_LINEAR :  motion = 1; break;
L_report_gcode_modes83:
; motion start address is: 12 (R3)
ORI	R3, R0, 1
; motion end address is: 12 (R3)
J	L_report_gcode_modes82
NOP	
;Print.c,350 :: 		case MOTION_MODE_CW_ARC :  motion = 2; break;
L_report_gcode_modes84:
; motion start address is: 12 (R3)
ORI	R3, R0, 2
; motion end address is: 12 (R3)
J	L_report_gcode_modes82
NOP	
;Print.c,351 :: 		case MOTION_MODE_CCW_ARC : motion = 3; break;
L_report_gcode_modes85:
; motion start address is: 12 (R3)
ORI	R3, R0, 3
; motion end address is: 12 (R3)
J	L_report_gcode_modes82
NOP	
;Print.c,352 :: 		case MOTION_MODE_CANCEL :  motion = 80; break;
L_report_gcode_modes86:
; motion start address is: 12 (R3)
ORI	R3, R0, 80
; motion end address is: 12 (R3)
J	L_report_gcode_modes82
NOP	
;Print.c,353 :: 		default:                   motion = 0; break;
L_report_gcode_modes87:
; motion start address is: 12 (R3)
MOVZ	R3, R0, R0
; motion end address is: 12 (R3)
J	L_report_gcode_modes82
NOP	
;Print.c,354 :: 		}
L_report_gcode_modes81:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes225
NOP	
J	L_report_gcode_modes83
NOP	
L__report_gcode_modes225:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes227
NOP	
J	L_report_gcode_modes84
NOP	
L__report_gcode_modes227:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_modes229
NOP	
J	L_report_gcode_modes85
NOP	
L__report_gcode_modes229:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_modes231
NOP	
J	L_report_gcode_modes86
NOP	
L__report_gcode_modes231:
J	L_report_gcode_modes87
NOP	
L_report_gcode_modes82:
;Print.c,358 :: 		dma_printf("[GC:G%d G%d",motion,gc.coord_select+53);
; motion start address is: 12 (R3)
LH	R2, Offset(_gc+14)(GP)
ADDIU	R2, R2, 53
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SH	R3, 4(SP)
; motion end address is: 12 (R3)
LUI	R2, hi_addr(?lstr_67_Print+0)
ORI	R2, R2, lo_addr(?lstr_67_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Print.c,363 :: 		if (gc.plane_axis_0 == X) {
LBU	R2, Offset(_gc+11)(GP)
BEQ	R2, R0, L__report_gcode_modes232
NOP	
J	L_report_gcode_modes88
NOP	
L__report_gcode_modes232:
;Print.c,364 :: 		if (gc.plane_axis_1 == Y) { dma_printf("%s"," G17"); }
LBU	R3, Offset(_gc+12)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__report_gcode_modes233
NOP	
J	L_report_gcode_modes89
NOP	
L__report_gcode_modes233:
LUI	R2, hi_addr(?lstr_69_Print+0)
ORI	R2, R2, lo_addr(?lstr_69_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_68_Print+0)
ORI	R2, R2, lo_addr(?lstr_68_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes90
NOP	
L_report_gcode_modes89:
;Print.c,365 :: 		else { dma_printf("%s"," G18"); }
LUI	R2, hi_addr(?lstr_71_Print+0)
ORI	R2, R2, lo_addr(?lstr_71_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_70_Print+0)
ORI	R2, R2, lo_addr(?lstr_70_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
L_report_gcode_modes90:
;Print.c,366 :: 		} else { dma_printf("%s"," G19"); }
J	L_report_gcode_modes91
NOP	
L_report_gcode_modes88:
LUI	R2, hi_addr(?lstr_73_Print+0)
ORI	R2, R2, lo_addr(?lstr_73_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_72_Print+0)
ORI	R2, R2, lo_addr(?lstr_72_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
L_report_gcode_modes91:
;Print.c,370 :: 		dma_printf("%s",gc.inches_mode ? " G20" : " G21");
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes235
NOP	
J	L_report_gcode_modes92
NOP	
L__report_gcode_modes235:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_75_Print+0)
ORI	R2, R2, lo_addr(?lstr_75_Print+0)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
J	L_report_gcode_modes93
NOP	
L_report_gcode_modes92:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_76_Print+0)
ORI	R2, R2, lo_addr(?lstr_76_Print+0)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
L_report_gcode_modes93:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_74_Print+0)
ORI	R2, R2, lo_addr(?lstr_74_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,374 :: 		dma_printf("%s",gc.absolute_mode ? " G90" : " G91");
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__report_gcode_modes237
NOP	
J	L_report_gcode_modes94
NOP	
L__report_gcode_modes237:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_78_Print+0)
ORI	R2, R2, lo_addr(?lstr_78_Print+0)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
J	L_report_gcode_modes95
NOP	
L_report_gcode_modes94:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_79_Print+0)
ORI	R2, R2, lo_addr(?lstr_79_Print+0)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
L_report_gcode_modes95:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_77_Print+0)
ORI	R2, R2, lo_addr(?lstr_77_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,378 :: 		dma_printf("%s",gc.inverse_feed_rate_mode ? " G93" : " G94");
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__report_gcode_modes239
NOP	
J	L_report_gcode_modes96
NOP	
L__report_gcode_modes239:
; ?FLOC___report_gcode_modes?T231 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_81_Print+0)
ORI	R2, R2, lo_addr(?lstr_81_Print+0)
; ?FLOC___report_gcode_modes?T231 end address is: 8 (R2)
J	L_report_gcode_modes97
NOP	
L_report_gcode_modes96:
; ?FLOC___report_gcode_modes?T231 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_82_Print+0)
ORI	R2, R2, lo_addr(?lstr_82_Print+0)
; ?FLOC___report_gcode_modes?T231 end address is: 8 (R2)
L_report_gcode_modes97:
; ?FLOC___report_gcode_modes?T231 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T231 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_80_Print+0)
ORI	R2, R2, lo_addr(?lstr_80_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,383 :: 		switch (gc.program_flow) {
J	L_report_gcode_modes98
NOP	
;Print.c,384 :: 		case PROGRAM_FLOW_PAUSED :    dma_printf("%s"," M0"); break;
L_report_gcode_modes100:
LUI	R2, hi_addr(?lstr_84_Print+0)
ORI	R2, R2, lo_addr(?lstr_84_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_83_Print+0)
ORI	R2, R2, lo_addr(?lstr_83_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes99
NOP	
;Print.c,385 :: 		case PROGRAM_FLOW_COMPLETED : dma_printf("%s"," M2"); break;
L_report_gcode_modes101:
LUI	R2, hi_addr(?lstr_86_Print+0)
ORI	R2, R2, lo_addr(?lstr_86_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_85_Print+0)
ORI	R2, R2, lo_addr(?lstr_85_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes99
NOP	
;Print.c,386 :: 		}
L_report_gcode_modes98:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes241
NOP	
J	L_report_gcode_modes100
NOP	
L__report_gcode_modes241:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes243
NOP	
J	L_report_gcode_modes101
NOP	
L__report_gcode_modes243:
L_report_gcode_modes99:
;Print.c,390 :: 		switch (gc.spindle_direction) {
J	L_report_gcode_modes102
NOP	
;Print.c,391 :: 		case 1 :  dma_printf("%s"," M3"); break;
L_report_gcode_modes104:
LUI	R2, hi_addr(?lstr_88_Print+0)
ORI	R2, R2, lo_addr(?lstr_88_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_87_Print+0)
ORI	R2, R2, lo_addr(?lstr_87_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes103
NOP	
;Print.c,392 :: 		case -1 : dma_printf("%s"," M4"); break;
L_report_gcode_modes105:
LUI	R2, hi_addr(?lstr_90_Print+0)
ORI	R2, R2, lo_addr(?lstr_90_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_89_Print+0)
ORI	R2, R2, lo_addr(?lstr_89_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes103
NOP	
;Print.c,393 :: 		default : dma_printf("%s"," M5"); break;
L_report_gcode_modes106:
LUI	R2, hi_addr(?lstr_92_Print+0)
ORI	R2, R2, lo_addr(?lstr_92_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_91_Print+0)
ORI	R2, R2, lo_addr(?lstr_91_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes103
NOP	
;Print.c,394 :: 		}
L_report_gcode_modes102:
LBU	R3, Offset(_gc+6)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes245
NOP	
J	L_report_gcode_modes104
NOP	
L__report_gcode_modes245:
LBU	R3, Offset(_gc+6)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_gcode_modes247
NOP	
J	L_report_gcode_modes105
NOP	
L__report_gcode_modes247:
J	L_report_gcode_modes106
NOP	
L_report_gcode_modes103:
;Print.c,398 :: 		switch (gc.coolant_mode) {
J	L_report_gcode_modes107
NOP	
;Print.c,399 :: 		case COOLANT_MIST_ENABLE :  dma_printf("%s"," M7"); break;
L_report_gcode_modes109:
LUI	R2, hi_addr(?lstr_94_Print+0)
ORI	R2, R2, lo_addr(?lstr_94_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_93_Print+0)
ORI	R2, R2, lo_addr(?lstr_93_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes108
NOP	
;Print.c,400 :: 		case COOLANT_FLOOD_ENABLE : dma_printf("%s"," M8"); break;
L_report_gcode_modes110:
LUI	R2, hi_addr(?lstr_96_Print+0)
ORI	R2, R2, lo_addr(?lstr_96_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_95_Print+0)
ORI	R2, R2, lo_addr(?lstr_95_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes108
NOP	
;Print.c,401 :: 		default :                   dma_printf("%s"," M9"); break;
L_report_gcode_modes111:
LUI	R2, hi_addr(?lstr_98_Print+0)
ORI	R2, R2, lo_addr(?lstr_98_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_97_Print+0)
ORI	R2, R2, lo_addr(?lstr_97_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_gcode_modes108
NOP	
;Print.c,402 :: 		}
L_report_gcode_modes107:
LBU	R3, Offset(_gc+7)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes249
NOP	
J	L_report_gcode_modes109
NOP	
L__report_gcode_modes249:
LBU	R3, Offset(_gc+7)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes251
NOP	
J	L_report_gcode_modes110
NOP	
L__report_gcode_modes251:
J	L_report_gcode_modes111
NOP	
L_report_gcode_modes108:
;Print.c,407 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes253
NOP	
J	L_report_gcode_modes112
NOP	
L__report_gcode_modes253:
LWC1	S1, Offset(_gc+24)(GP)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
; ?FLOC___report_gcode_modes?T259 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___report_gcode_modes?T259 end address is: 8 (R2)
J	L_report_gcode_modes113
NOP	
L_report_gcode_modes112:
; ?FLOC___report_gcode_modes?T259 start address is: 8 (R2)
LWC1	S1, Offset(_gc+24)(GP)
; ?FLOC___report_gcode_modes?T259 end address is: 8 (R2)
L_report_gcode_modes113:
; ?FLOC___report_gcode_modes?T259 start address is: 8 (R2)
MOV.S 	S0, S1
; ?FLOC___report_gcode_modes?T259 end address is: 8 (R2)
CVT36.S 	S0, S0
MFC1	R3, S0
;Print.c,406 :: 		dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
LBU	R2, Offset(_gc+10)(GP)
;Print.c,407 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
ADDIU	SP, SP, -12
SH	R3, 8(SP)
;Print.c,406 :: 		dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
SH	R2, 4(SP)
LUI	R2, hi_addr(?lstr_99_Print+0)
ORI	R2, R2, lo_addr(?lstr_99_Print+0)
SW	R2, 0(SP)
;Print.c,407 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Print.c,423 :: 		*/
L_end_report_gcode_modes:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _report_gcode_modes
