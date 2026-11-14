_report_status_message:
;Print.c,10 :: 		void report_status_message(int status_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,12 :: 		switch(status_code){
J	L_report_status_message0
NOP	
;Print.c,13 :: 		case STATUS_OK:
L_report_status_message2:
;Print.c,14 :: 		while(DMA_IsOn(1));
L_report_status_message3:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message166
NOP	
J	L_report_status_message4
NOP	
L__report_status_message166:
J	L_report_status_message3
NOP	
L_report_status_message4:
;Print.c,15 :: 		dma_printf("%s","ok\r\n");
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
;Print.c,16 :: 		return;
J	L_end_report_status_message
NOP	
;Print.c,17 :: 		case STATUS_EXPECTED_COMMAND_LETTER: err_no = 1; break;
L_report_status_message5:
ORI	R2, R0, 1
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,18 :: 		case STATUS_BAD_NUMBER_FORMAT:       err_no = 2; break;
L_report_status_message6:
ORI	R2, R0, 2
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,19 :: 		case STATUS_INVALID_STATEMENT:       err_no = 3; break;
L_report_status_message7:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,20 :: 		case STATUS_SETTING_VALUE_NEG:       err_no = 4; break;
L_report_status_message8:
ORI	R2, R0, 4
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,21 :: 		case STATUS_SETTING_DISABLED:        err_no = 5; break;
L_report_status_message9:
ORI	R2, R0, 5
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,22 :: 		case STATUS_SETTING_STEP_PULSE_MIN:  err_no = 6; break;
L_report_status_message10:
ORI	R2, R0, 6
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,23 :: 		case STATUS_SETTING_READ_FAIL:       err_no = 7; break;
L_report_status_message11:
ORI	R2, R0, 7
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,24 :: 		case STATUS_IDLE_ERROR:              err_no = 8; break;
L_report_status_message12:
ORI	R2, R0, 8
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,25 :: 		case STATUS_ALARM_LOCK:              err_no = 9; break;
L_report_status_message13:
ORI	R2, R0, 9
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,26 :: 		case STATUS_LINE_OVERFLOW:
L_report_status_message14:
;Print.c,27 :: 		case STATUS_SERIAL_RX_ERROR:         err_no = 11; break;
L_report_status_message15:
ORI	R2, R0, 11
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,28 :: 		case STATUS_SPEED_ERROR:             err_no = 12; break;
L_report_status_message16:
ORI	R2, R0, 12
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,29 :: 		case STATUS_UNSUPPORTED_STATEMENT:
L_report_status_message17:
;Print.c,30 :: 		case STATUS_EI_ERROR:                err_no = 20; break;
L_report_status_message18:
ORI	R2, R0, 20
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,31 :: 		case STATUS_MODAL_GROUP_VIOLATION:   err_no = 21; break;
L_report_status_message19:
ORI	R2, R0, 21
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,32 :: 		case STATUS_UNDEFINED_FEED_RATE:     err_no = 22; break;
L_report_status_message20:
ORI	R2, R0, 22
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,33 :: 		case STATUS_ARC_RADIUS_ERROR:        err_no = 34; break;
L_report_status_message21:
ORI	R2, R0, 34
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,34 :: 		case STATUS_COMMAND_EXECUTE_MOTION:
L_report_status_message22:
;Print.c,35 :: 		case STATUS_NO_REPORT:               return;
L_report_status_message23:
J	L_end_report_status_message
NOP	
;Print.c,37 :: 		default:                             err_no = 3; break;
L_report_status_message24:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_status_message1
NOP	
;Print.c,38 :: 		}
L_report_status_message0:
SEH	R2, R25
BNE	R2, R0, L__report_status_message168
NOP	
J	L_report_status_message2
NOP	
L__report_status_message168:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_status_message170
NOP	
J	L_report_status_message5
NOP	
L__report_status_message170:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_status_message172
NOP	
J	L_report_status_message6
NOP	
L__report_status_message172:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__report_status_message174
NOP	
J	L_report_status_message7
NOP	
L__report_status_message174:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__report_status_message176
NOP	
J	L_report_status_message8
NOP	
L__report_status_message176:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__report_status_message178
NOP	
J	L_report_status_message9
NOP	
L__report_status_message178:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__report_status_message180
NOP	
J	L_report_status_message10
NOP	
L__report_status_message180:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__report_status_message182
NOP	
J	L_report_status_message11
NOP	
L__report_status_message182:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__report_status_message184
NOP	
J	L_report_status_message12
NOP	
L__report_status_message184:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__report_status_message186
NOP	
J	L_report_status_message13
NOP	
L__report_status_message186:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__report_status_message188
NOP	
J	L_report_status_message14
NOP	
L__report_status_message188:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__report_status_message190
NOP	
J	L_report_status_message15
NOP	
L__report_status_message190:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__report_status_message192
NOP	
J	L_report_status_message16
NOP	
L__report_status_message192:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_status_message194
NOP	
J	L_report_status_message17
NOP	
L__report_status_message194:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__report_status_message196
NOP	
J	L_report_status_message18
NOP	
L__report_status_message196:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_status_message198
NOP	
J	L_report_status_message19
NOP	
L__report_status_message198:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__report_status_message200
NOP	
J	L_report_status_message20
NOP	
L__report_status_message200:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_status_message202
NOP	
J	L_report_status_message21
NOP	
L__report_status_message202:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__report_status_message204
NOP	
J	L_report_status_message22
NOP	
L__report_status_message204:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__report_status_message206
NOP	
J	L_report_status_message23
NOP	
L__report_status_message206:
J	L_report_status_message24
NOP	
L_report_status_message1:
;Print.c,39 :: 		while(DMA_IsOn(1));
L_report_status_message25:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message208
NOP	
J	L_report_status_message26
NOP	
L__report_status_message208:
J	L_report_status_message25
NOP	
L_report_status_message26:
;Print.c,40 :: 		dma_printf("error:%d\r\n",err_no);
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
;Print.c,41 :: 		}
L_end_report_status_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_status_message
_report_alarm_message:
;Print.c,44 :: 		void report_alarm_message(int alarm_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,46 :: 		switch (alarm_code) {
J	L_report_alarm_message27
NOP	
;Print.c,47 :: 		case ALARM_HARD_LIMIT:  err_no = 1; break;
L_report_alarm_message29:
ORI	R2, R0, 1
SH	R2, 6(SP)
J	L_report_alarm_message28
NOP	
;Print.c,48 :: 		case ALARM_ABORT_CYCLE: err_no = 3; break;
L_report_alarm_message30:
ORI	R2, R0, 3
SH	R2, 6(SP)
J	L_report_alarm_message28
NOP	
;Print.c,49 :: 		default: return;
L_report_alarm_message31:
J	L_end_report_alarm_message
NOP	
;Print.c,50 :: 		}
L_report_alarm_message27:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_alarm_message211
NOP	
J	L_report_alarm_message29
NOP	
L__report_alarm_message211:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__report_alarm_message213
NOP	
J	L_report_alarm_message30
NOP	
L__report_alarm_message213:
J	L_report_alarm_message31
NOP	
L_report_alarm_message28:
;Print.c,51 :: 		while(DMA_IsOn(1));
L_report_alarm_message32:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message215
NOP	
J	L_report_alarm_message33
NOP	
L__report_alarm_message215:
J	L_report_alarm_message32
NOP	
L_report_alarm_message33:
;Print.c,52 :: 		dma_printf("ALARM:%d\r\n",err_no);
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
;Print.c,53 :: 		Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
LUI	R24, 508
ORI	R24, R24, 41044
L_report_alarm_message34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_report_alarm_message34
NOP	
NOP	
NOP	
;Print.c,54 :: 		}
L_end_report_alarm_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_alarm_message
_report_feedback_message:
;Print.c,59 :: 		void report_feedback_message(int message_code){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,60 :: 		while(DMA_IsOn(1));
L_report_feedback_message36:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message218
NOP	
J	L_report_feedback_message37
NOP	
L__report_feedback_message218:
J	L_report_feedback_message36
NOP	
L_report_feedback_message37:
;Print.c,61 :: 		switch(message_code) {
J	L_report_feedback_message38
NOP	
;Print.c,62 :: 		case MESSAGE_CRITICAL_EVENT: dma_printf("%s","[MSG:Reset to continue]\r\n"); break;
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
;Print.c,63 :: 		case MESSAGE_ALARM_LOCK:     dma_printf("%s","[MSG:'$H'|'$X' to unlock]\r\n"); break;
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
;Print.c,64 :: 		case MESSAGE_ALARM_UNLOCK:   dma_printf("%s","[MSG:Caution: Unlocked]\r\n"); break;
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
;Print.c,65 :: 		case MESSAGE_ENABLED:        dma_printf("%s","[MSG:Enabled]\r\n"); break;
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
;Print.c,66 :: 		case MESSAGE_DISABLED:       dma_printf("%s","[MSG:Disabled]\r\n"); break;
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
;Print.c,67 :: 		}
L_report_feedback_message38:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_feedback_message220
NOP	
J	L_report_feedback_message40
NOP	
L__report_feedback_message220:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_feedback_message222
NOP	
J	L_report_feedback_message41
NOP	
L__report_feedback_message222:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_feedback_message224
NOP	
J	L_report_feedback_message42
NOP	
L__report_feedback_message224:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_feedback_message226
NOP	
J	L_report_feedback_message43
NOP	
L__report_feedback_message226:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_feedback_message228
NOP	
J	L_report_feedback_message44
NOP	
L__report_feedback_message228:
L_report_feedback_message39:
;Print.c,68 :: 		}
L_end_report_feedback_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_feedback_message
_report_init_message:
;Print.c,71 :: 		void report_init_message(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,72 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_init_message45:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_init_message231
NOP	
J	L_report_init_message46
NOP	
L__report_init_message231:
J	L_report_init_message45
NOP	
L_report_init_message46:
;Print.c,73 :: 		dma_printf("\r\n%s%s%s\r\n",FIRMWARE,GRBL_VERSION,GRBL_HELP);
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
;Print.c,74 :: 		}
L_end_report_init_message:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_init_message
_report_grbl_help:
;Print.c,77 :: 		void report_grbl_help() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,78 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_grbl_help47:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_help234
NOP	
J	L_report_grbl_help48
NOP	
L__report_grbl_help234:
J	L_report_grbl_help47
NOP	
L_report_grbl_help48:
;Print.c,79 :: 		dma_printf("%s","[HLP:$$ $# $G $I $N $x=val $Nx=line $C $X $H ~ ! ? ctrl-x]\r\n");
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
;Print.c,80 :: 		}
L_end_report_grbl_help:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_grbl_help
_report_build_info:
;Print.c,83 :: 		void report_build_info(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,84 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_build_info49:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_build_info237
NOP	
J	L_report_build_info50
NOP	
L__report_build_info237:
J	L_report_build_info49
NOP	
L_report_build_info50:
;Print.c,85 :: 		dma_printf("[VER:%s.%s:]\r\n[OPT:,15,128]\r\n",GRBL_VERSION,GRBL_VERSION_BUILD);
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
;Print.c,86 :: 		while(DMA_IsOn(1));
L_report_build_info51:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_build_info239
NOP	
J	L_report_build_info52
NOP	
L__report_build_info239:
J	L_report_build_info51
NOP	
L_report_build_info52:
;Print.c,87 :: 		if(Ethernet_Ready()) dma_printf("[MSG:Ethernet %s]\r\n",Ethernet_Address());
JAL	_Ethernet_Ready+0
NOP	
BNE	R2, R0, L__report_build_info241
NOP	
J	L_report_build_info53
NOP	
L__report_build_info241:
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
;Print.c,88 :: 		else dma_printf("[MSG:Ethernet not found]\r\n");
LUI	R2, hi_addr(?lstr_25_Print+0)
ORI	R2, R2, lo_addr(?lstr_25_Print+0)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_build_info54:
;Print.c,89 :: 		}
L_end_report_build_info:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _report_build_info
_report_grbl_settings:
;Print.c,92 :: 		void report_grbl_settings() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,93 :: 		float acc = settings.acceleration / sec_sec;
SW	R25, 4(SP)
LWC1	S1, Offset(_settings+40)(GP)
LUI	R2, 17761
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
SWC1	S0, 8(SP)
;Print.c,94 :: 		while(DMA_IsOn(1));
L_report_grbl_settings55:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings244
NOP	
J	L_report_grbl_settings56
NOP	
L__report_grbl_settings244:
J	L_report_grbl_settings55
NOP	
L_report_grbl_settings56:
;Print.c,99 :: 		,(int)bit_istrue(settings.flags,FLAG_INVERT_ST_ENABLE));
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 4
ANDI	R2, R2, 65535
XORI	R2, R2, 0
SLTU	R2, R0, R2
ADDIU	SP, SP, -20
SH	R2, 16(SP)
;Print.c,98 :: 		,(int)settings.invert_mask
LH	R2, Offset(_settings+66)(GP)
SH	R2, 12(SP)
;Print.c,97 :: 		,(int)settings.stepper_idle_lock_time
LH	R2, Offset(_settings+56)(GP)
SH	R2, 8(SP)
;Print.c,96 :: 		,(int)settings.p_usec
LH	R2, Offset(_settings+60)(GP)
SH	R2, 4(SP)
;Print.c,95 :: 		dma_printf("$0=%d\r\n$1=%d\r\n$2=%d\r\n$3=0\r\n$4=%d\r\n$5=0\r\n$6=0\r\n$10=1\r\n"
LUI	R2, hi_addr(?lstr_26_Print+0)
ORI	R2, R2, lo_addr(?lstr_26_Print+0)
SW	R2, 0(SP)
;Print.c,99 :: 		,(int)bit_istrue(settings.flags,FLAG_INVERT_ST_ENABLE));
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Print.c,100 :: 		while(DMA_IsOn(1));
L_report_grbl_settings57:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings247
NOP	
J	L_report_grbl_settings58
NOP	
L__report_grbl_settings247:
J	L_report_grbl_settings57
NOP	
L_report_grbl_settings58:
;Print.c,106 :: 		,(int)bit_istrue(settings.flags,FLAG_HOMING_ENABLE)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
XORI	R5, R2, 0
SLTU	R5, R0, R5
;Print.c,105 :: 		,(int)bit_istrue(settings.flags,FLAG_HARD_LIMIT_ENABLE)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
XORI	R4, R2, 0
SLTU	R4, R0, R4
;Print.c,104 :: 		,(int)bit_istrue(settings.flags,FLAG_REPORT_INCHES)
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
XORI	R3, R2, 0
SLTU	R3, R0, R3
;Print.c,107 :: 		,(int)settings.homing_dir_mask);
LH	R2, Offset(_settings+64)(GP)
ADDIU	SP, SP, -28
SH	R2, 24(SP)
;Print.c,106 :: 		,(int)bit_istrue(settings.flags,FLAG_HOMING_ENABLE)
SH	R5, 20(SP)
;Print.c,105 :: 		,(int)bit_istrue(settings.flags,FLAG_HARD_LIMIT_ENABLE)
SH	R4, 16(SP)
;Print.c,104 :: 		,(int)bit_istrue(settings.flags,FLAG_REPORT_INCHES)
SH	R3, 12(SP)
;Print.c,103 :: 		,settings.mm_per_arc_segment
LW	R2, Offset(_settings+36)(GP)
SW	R2, 8(SP)
;Print.c,102 :: 		,settings.junction_deviation
LW	R2, Offset(_settings+44)(GP)
SW	R2, 4(SP)
;Print.c,101 :: 		dma_printf("$11=%f\r\n$12=%f\r\n$13=%d\r\n$20=0\r\n$21=%d\r\n$22=%d\r\n$23=%d\r\n"
LUI	R2, hi_addr(?lstr_27_Print+0)
ORI	R2, R2, lo_addr(?lstr_27_Print+0)
SW	R2, 0(SP)
;Print.c,107 :: 		,(int)settings.homing_dir_mask);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Print.c,108 :: 		while(DMA_IsOn(1));
L_report_grbl_settings59:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings252
NOP	
J	L_report_grbl_settings60
NOP	
L__report_grbl_settings252:
J	L_report_grbl_settings59
NOP	
L_report_grbl_settings60:
;Print.c,113 :: 		,settings.homing_pulloff);
LW	R2, Offset(_settings+32)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Print.c,112 :: 		,(int)settings.homing_debounce_delay
LH	R2, Offset(_settings+54)(GP)
SH	R2, 12(SP)
;Print.c,111 :: 		,settings.homing_seek_rate
LW	R2, Offset(_settings+28)(GP)
SW	R2, 8(SP)
;Print.c,110 :: 		,settings.homing_feed_rate
LW	R2, Offset(_settings+24)(GP)
SW	R2, 4(SP)
;Print.c,109 :: 		dma_printf("$24=%f\r\n$25=%f\r\n$26=%d\r\n$27=%f\r\n$30=1000\r\n$31=0\r\n$32=0\r\n"
LUI	R2, hi_addr(?lstr_28_Print+0)
ORI	R2, R2, lo_addr(?lstr_28_Print+0)
SW	R2, 0(SP)
;Print.c,113 :: 		,settings.homing_pulloff);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Print.c,114 :: 		while(DMA_IsOn(1));
L_report_grbl_settings61:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings254
NOP	
J	L_report_grbl_settings62
NOP	
L__report_grbl_settings254:
J	L_report_grbl_settings61
NOP	
L_report_grbl_settings62:
;Print.c,118 :: 		,settings.steps_per_mm[Z]);
LW	R2, Offset(_settings+8)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,117 :: 		,settings.steps_per_mm[Y]
LW	R2, Offset(_settings+4)(GP)
SW	R2, 8(SP)
;Print.c,116 :: 		,settings.steps_per_mm[X]
LW	R2, Offset(_settings+0)(GP)
SW	R2, 4(SP)
;Print.c,115 :: 		dma_printf("$100=%f\r\n$101=%f\r\n$102=%f\r\n"
LUI	R2, hi_addr(?lstr_29_Print+0)
ORI	R2, R2, lo_addr(?lstr_29_Print+0)
SW	R2, 0(SP)
;Print.c,118 :: 		,settings.steps_per_mm[Z]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,119 :: 		while(DMA_IsOn(1));
L_report_grbl_settings63:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings256
NOP	
J	L_report_grbl_settings64
NOP	
L__report_grbl_settings256:
J	L_report_grbl_settings63
NOP	
L_report_grbl_settings64:
;Print.c,124 :: 		,acc,acc,acc);
LW	R2, 8(SP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, 36(SP)
SW	R2, 20(SP)
LW	R2, 36(SP)
SW	R2, 16(SP)
;Print.c,123 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 12(SP)
;Print.c,122 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 8(SP)
;Print.c,121 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 4(SP)
;Print.c,120 :: 		dma_printf("$110=%f\r\n$111=%f\r\n$112=%f\r\n$120=%f\r\n$121=%f\r\n$122=%f\r\n"
LUI	R2, hi_addr(?lstr_30_Print+0)
ORI	R2, R2, lo_addr(?lstr_30_Print+0)
SW	R2, 0(SP)
;Print.c,124 :: 		,acc,acc,acc);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Print.c,125 :: 		while(DMA_IsOn(1));
L_report_grbl_settings65:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings258
NOP	
J	L_report_grbl_settings66
NOP	
L__report_grbl_settings258:
J	L_report_grbl_settings65
NOP	
L_report_grbl_settings66:
;Print.c,129 :: 		,(float)Z_MAX_SIZE);
LUI	R2, 17096
ORI	R2, R2, 0
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,128 :: 		,(float)Y_MAX_SIZE
LUI	R2, 17302
ORI	R2, R2, 0
SW	R2, 8(SP)
;Print.c,127 :: 		,(float)X_MAX_SIZE
LUI	R2, 17302
ORI	R2, R2, 0
SW	R2, 4(SP)
;Print.c,126 :: 		dma_printf("$130=%f\r\n$131=%f\r\n$132=%f\r\n"
LUI	R2, hi_addr(?lstr_31_Print+0)
ORI	R2, R2, lo_addr(?lstr_31_Print+0)
SW	R2, 0(SP)
;Print.c,129 :: 		,(float)Z_MAX_SIZE);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,130 :: 		}
L_end_report_grbl_settings:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _report_grbl_settings
_report_startup_line:
;Print.c,133 :: 		void report_startup_line(int n, char *line){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,134 :: 		while(DMA_IsOn(1));
L_report_startup_line67:
SW	R26, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__report_startup_line261
NOP	
J	L_report_startup_line68
NOP	
L__report_startup_line261:
J	L_report_startup_line67
NOP	
L_report_startup_line68:
;Print.c,135 :: 		dma_printf("$N%d=%s\r\n",n,line);
SW	R26, 4(SP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R26, 8(SP)
SH	R25, 4(SP)
LUI	R2, hi_addr(?lstr_32_Print+0)
ORI	R2, R2, lo_addr(?lstr_32_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
LW	R26, 4(SP)
;Print.c,136 :: 		}
L_end_report_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _report_startup_line
Print_report_xyz:
;Print.c,139 :: 		static void report_xyz(float *pos){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Print.c,140 :: 		while(DMA_IsOn(1));
L_Print_report_xyz69:
SW	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L_Print_report_xyz264
NOP	
J	L_Print_report_xyz70
NOP	
L_Print_report_xyz264:
J	L_Print_report_xyz69
NOP	
L_Print_report_xyz70:
;Print.c,141 :: 		dma_printf("%f,%f,%f",pos[X],pos[Y],pos[Z]);
ADDIU	R2, R25, 8
LWC1	S2, 0(R2)
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R25)
SW	R25, 4(SP)
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
LW	R25, 4(SP)
;Print.c,142 :: 		}
L_end_report_xyz:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Print_report_xyz
Print_report_to_units:
;Print.c,144 :: 		static void report_to_units(float *pos){
;Print.c,146 :: 		if (bit_istrue(settings.flags,FLAG_REPORT_INCHES)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L_Print_report_to_units267
NOP	
J	L_Print_report_to_units71
NOP	
L_Print_report_to_units267:
;Print.c,147 :: 		for (i=0; i<3; i++) { pos[i] *= INCH_PER_MM; }
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Print_report_to_units72:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L_Print_report_to_units268
NOP	
J	L_Print_report_to_units73
NOP	
L_Print_report_to_units268:
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
J	L_Print_report_to_units72
NOP	
L_Print_report_to_units73:
;Print.c,148 :: 		}
L_Print_report_to_units71:
;Print.c,149 :: 		}
L_end_report_to_units:
JR	RA
NOP	
; end of Print_report_to_units
_report_realtime_status:
;Print.c,153 :: 		void report_realtime_status(){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Print.c,157 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
SW	R26, 8(SP)
L_report_realtime_status75:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status271
NOP	
J	L_report_realtime_status76
NOP	
L__report_realtime_status271:
J	L_report_realtime_status75
NOP	
L_report_realtime_status76:
;Print.c,158 :: 		switch (sys.state) {
J	L_report_realtime_status77
NOP	
;Print.c,159 :: 		case STATE_CYCLE:      dma_printf("%s","<Run"); break;
L_report_realtime_status79:
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
J	L_report_realtime_status78
NOP	
;Print.c,160 :: 		case STATE_HOLD:       dma_printf("%s","<Hold:0"); break;
L_report_realtime_status80:
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
J	L_report_realtime_status78
NOP	
;Print.c,161 :: 		case STATE_HOMING:     dma_printf("%s","<Home"); break;
L_report_realtime_status81:
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
J	L_report_realtime_status78
NOP	
;Print.c,162 :: 		case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
L_report_realtime_status82:
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
J	L_report_realtime_status78
NOP	
;Print.c,163 :: 		case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
L_report_realtime_status83:
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
J	L_report_realtime_status78
NOP	
;Print.c,164 :: 		default:               dma_printf("%s","<Idle"); break;
L_report_realtime_status84:
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
J	L_report_realtime_status78
NOP	
;Print.c,165 :: 		}
L_report_realtime_status77:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_realtime_status273
NOP	
J	L_report_realtime_status79
NOP	
L__report_realtime_status273:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_realtime_status275
NOP	
J	L_report_realtime_status80
NOP	
L__report_realtime_status275:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_realtime_status277
NOP	
J	L_report_realtime_status81
NOP	
L__report_realtime_status277:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_realtime_status279
NOP	
J	L_report_realtime_status82
NOP	
L__report_realtime_status279:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_realtime_status281
NOP	
J	L_report_realtime_status83
NOP	
L__report_realtime_status281:
J	L_report_realtime_status84
NOP	
L_report_realtime_status78:
;Print.c,167 :: 		for (i=0; i<3; i++) {
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_report_realtime_status85:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status282
NOP	
J	L_report_realtime_status86
NOP	
L__report_realtime_status282:
;Print.c,168 :: 		position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
ADDIU	R3, SP, 16
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 28(SP)
SEH	R3, R4
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 28(SP)
SWC1	S0, 0(R2)
;Print.c,167 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R4, 1
SEH	R4, R2
;Print.c,169 :: 		}
; i end address is: 16 (R4)
J	L_report_realtime_status85
NOP	
L_report_realtime_status86:
;Print.c,170 :: 		report_to_units(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_to_units+0
NOP	
;Print.c,171 :: 		while(DMA_IsOn(1));
L_report_realtime_status88:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status284
NOP	
J	L_report_realtime_status89
NOP	
L__report_realtime_status284:
J	L_report_realtime_status88
NOP	
L_report_realtime_status89:
;Print.c,172 :: 		dma_printf("%s","|MPos:");
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
;Print.c,173 :: 		report_xyz(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_xyz+0
NOP	
;Print.c,175 :: 		while(DMA_IsOn(1));
L_report_realtime_status90:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status286
NOP	
J	L_report_realtime_status91
NOP	
L__report_realtime_status286:
J	L_report_realtime_status90
NOP	
L_report_realtime_status91:
;Print.c,176 :: 		dma_printf("|FS:%d,0|WCO:",(sys.state == STATE_CYCLE) ? (int)gc.feed_rate : 0);
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__report_realtime_status287
NOP	
J	L_report_realtime_status92
NOP	
L__report_realtime_status287:
LWC1	S0, Offset(_gc+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
; ?FLOC___report_realtime_status?T142 start address is: 8 (R2)
; ?FLOC___report_realtime_status?T142 end address is: 8 (R2)
J	L_report_realtime_status93
NOP	
L_report_realtime_status92:
; ?FLOC___report_realtime_status?T142 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___report_realtime_status?T142 end address is: 8 (R2)
L_report_realtime_status93:
; ?FLOC___report_realtime_status?T142 start address is: 8 (R2)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
; ?FLOC___report_realtime_status?T142 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_48_Print+0)
ORI	R2, R2, lo_addr(?lstr_48_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,177 :: 		for (i=0; i<3; i++) {
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_realtime_status94:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status288
NOP	
J	L_report_realtime_status95
NOP	
L__report_realtime_status288:
;Print.c,178 :: 		position[i] = gc.coord_system[i] + gc.coord_offset[i];
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
;Print.c,177 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R5, 1
SEH	R5, R2
;Print.c,179 :: 		}
; i end address is: 20 (R5)
J	L_report_realtime_status94
NOP	
L_report_realtime_status95:
;Print.c,180 :: 		report_to_units(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_to_units+0
NOP	
;Print.c,181 :: 		report_xyz(position);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	Print_report_xyz+0
NOP	
;Print.c,182 :: 		while(DMA_IsOn(1));
L_report_realtime_status97:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status290
NOP	
J	L_report_realtime_status98
NOP	
L__report_realtime_status290:
J	L_report_realtime_status97
NOP	
L_report_realtime_status98:
;Print.c,183 :: 		dma_printf("%s",">\r\n");
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
;Print.c,184 :: 		}
L_end_report_realtime_status:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _report_realtime_status
Print_report_coord_line:
;Print.c,189 :: 		static void report_coord_line(char *name, float *pos){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,190 :: 		report_to_units(pos);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	Print_report_to_units+0
NOP	
LW	R25, 4(SP)
;Print.c,191 :: 		while(DMA_IsOn(1));
L_Print_report_coord_line99:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L_Print_report_coord_line293
NOP	
J	L_Print_report_coord_line100
NOP	
L_Print_report_coord_line293:
J	L_Print_report_coord_line99
NOP	
L_Print_report_coord_line100:
;Print.c,192 :: 		dma_printf("[%s:",name);
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -8
SW	R25, 4(SP)
LUI	R2, hi_addr(?lstr_51_Print+0)
ORI	R2, R2, lo_addr(?lstr_51_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 8(SP)
LW	R26, 4(SP)
;Print.c,193 :: 		report_xyz(pos);
SW	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R25, R26, R0
JAL	Print_report_xyz+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;Print.c,194 :: 		while(DMA_IsOn(1));
L_Print_report_coord_line101:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L_Print_report_coord_line295
NOP	
J	L_Print_report_coord_line102
NOP	
L_Print_report_coord_line295:
J	L_Print_report_coord_line101
NOP	
L_Print_report_coord_line102:
;Print.c,195 :: 		dma_printf("%s","]\r\n");
LUI	R2, hi_addr(?lstr_53_Print+0)
ORI	R2, R2, lo_addr(?lstr_53_Print+0)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(?lstr_52_Print+0)
ORI	R2, R2, lo_addr(?lstr_52_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 8(SP)
LW	R26, 4(SP)
;Print.c,196 :: 		}
L_end_report_coord_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Print_report_coord_line
Print_report_coord_system:
;Print.c,199 :: 		static void report_coord_system(char *name, int recipe){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Print.c,202 :: 		for (i=0; i<3; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Print_report_coord_system103:
; i start address is: 24 (R6)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Print_report_coord_system297
NOP	
J	L_Print_report_coord_system104
NOP	
L_Print_report_coord_system297:
;Print.c,203 :: 		position[i] = coord_system[recipe-1].coord[i];
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
;Print.c,202 :: 		for (i=0; i<3; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Print.c,204 :: 		}
; i end address is: 24 (R6)
J	L_Print_report_coord_system103
NOP	
L_Print_report_coord_system104:
;Print.c,205 :: 		report_coord_line(name,position);
ADDIU	R2, SP, 12
SH	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R2, R0
JAL	Print_report_coord_line+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
;Print.c,206 :: 		}
L_end_report_coord_system:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of Print_report_coord_system
_report_gcode_parameters:
;Print.c,210 :: 		void report_gcode_parameters(){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Print.c,214 :: 		settings_read_coord_data();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_settings_read_coord_data+0
NOP	
;Print.c,215 :: 		report_coord_system("G54",1);
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
;Print.c,216 :: 		report_coord_system("G55",2);
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
;Print.c,217 :: 		report_coord_system("G56",3);
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
;Print.c,218 :: 		report_coord_system("G57",4);
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
;Print.c,219 :: 		report_coord_system("G58",5);
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
;Print.c,220 :: 		report_coord_system("G59",6);
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
;Print.c,221 :: 		report_coord_system("G28",SETTING_INDEX_G28);
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
;Print.c,222 :: 		report_coord_system("G30",SETTING_INDEX_G30);
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
;Print.c,223 :: 		for (i=0; i<3; i++) { position[i] = gc.coord_offset[i]; }
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_gcode_parameters106:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters299
NOP	
J	L_report_gcode_parameters107
NOP	
L__report_gcode_parameters299:
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
J	L_report_gcode_parameters106
NOP	
L_report_gcode_parameters107:
;Print.c,224 :: 		report_coord_line("G92",position);
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
;Print.c,225 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters109:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters301
NOP	
J	L_report_gcode_parameters110
NOP	
L__report_gcode_parameters301:
J	L_report_gcode_parameters109
NOP	
L_report_gcode_parameters110:
;Print.c,226 :: 		dma_printf("%s","[TLO:0.000]\r\n");
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
;Print.c,227 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters111:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters303
NOP	
J	L_report_gcode_parameters112
NOP	
L__report_gcode_parameters303:
J	L_report_gcode_parameters111
NOP	
L_report_gcode_parameters112:
;Print.c,228 :: 		dma_printf("%s","[PRB:0.000,0.000,0.000:0]\r\n");
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
;Print.c,229 :: 		}
L_end_report_gcode_parameters:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _report_gcode_parameters
_report_gcode_modes:
;Print.c,232 :: 		void report_gcode_modes(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,234 :: 		switch (gc.motion_mode) {
SW	R25, 4(SP)
J	L_report_gcode_modes113
NOP	
;Print.c,235 :: 		case MOTION_MODE_LINEAR :  motion = 1; break;
L_report_gcode_modes115:
; motion start address is: 8 (R2)
ORI	R2, R0, 1
SEH	R3, R2
; motion end address is: 8 (R2)
J	L_report_gcode_modes114
NOP	
;Print.c,236 :: 		case MOTION_MODE_CW_ARC :  motion = 2; break;
L_report_gcode_modes116:
; motion start address is: 8 (R2)
ORI	R2, R0, 2
SEH	R3, R2
; motion end address is: 8 (R2)
J	L_report_gcode_modes114
NOP	
;Print.c,237 :: 		case MOTION_MODE_CCW_ARC : motion = 3; break;
L_report_gcode_modes117:
; motion start address is: 8 (R2)
ORI	R2, R0, 3
SEH	R3, R2
; motion end address is: 8 (R2)
J	L_report_gcode_modes114
NOP	
;Print.c,238 :: 		case MOTION_MODE_CANCEL :  motion = 80; break;
L_report_gcode_modes118:
; motion start address is: 8 (R2)
ORI	R2, R0, 80
SEH	R3, R2
; motion end address is: 8 (R2)
J	L_report_gcode_modes114
NOP	
;Print.c,239 :: 		default:                   motion = 0; break;
L_report_gcode_modes119:
; motion start address is: 8 (R2)
MOVZ	R2, R0, R0
SEH	R3, R2
; motion end address is: 8 (R2)
J	L_report_gcode_modes114
NOP	
;Print.c,240 :: 		}
L_report_gcode_modes113:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes306
NOP	
J	L_report_gcode_modes115
NOP	
L__report_gcode_modes306:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes308
NOP	
J	L_report_gcode_modes116
NOP	
L__report_gcode_modes308:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_modes310
NOP	
J	L_report_gcode_modes117
NOP	
L__report_gcode_modes310:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_modes312
NOP	
J	L_report_gcode_modes118
NOP	
L__report_gcode_modes312:
J	L_report_gcode_modes119
NOP	
L_report_gcode_modes114:
;Print.c,241 :: 		while(DMA_IsOn(1));
; motion start address is: 12 (R3)
; motion end address is: 12 (R3)
L_report_gcode_modes120:
; motion start address is: 12 (R3)
SH	R3, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R3, 8(SP)
BNE	R2, R0, L__report_gcode_modes314
NOP	
J	L_report_gcode_modes121
NOP	
L__report_gcode_modes314:
J	L_report_gcode_modes120
NOP	
L_report_gcode_modes121:
;Print.c,242 :: 		dma_printf("[GC:G%d G%d",motion,gc.coord_select+53);
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
;Print.c,244 :: 		while(DMA_IsOn(1));
L_report_gcode_modes122:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes316
NOP	
J	L_report_gcode_modes123
NOP	
L__report_gcode_modes316:
J	L_report_gcode_modes122
NOP	
L_report_gcode_modes123:
;Print.c,245 :: 		if (gc.plane_axis_0 == X) {
LBU	R2, Offset(_gc+11)(GP)
BEQ	R2, R0, L__report_gcode_modes317
NOP	
J	L_report_gcode_modes124
NOP	
L__report_gcode_modes317:
;Print.c,246 :: 		if (gc.plane_axis_1 == Y) { dma_printf("%s"," G17"); }
LBU	R3, Offset(_gc+12)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__report_gcode_modes318
NOP	
J	L_report_gcode_modes125
NOP	
L__report_gcode_modes318:
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
J	L_report_gcode_modes126
NOP	
L_report_gcode_modes125:
;Print.c,247 :: 		else { dma_printf("%s"," G18"); }
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
L_report_gcode_modes126:
;Print.c,248 :: 		} else { dma_printf("%s"," G19"); }
J	L_report_gcode_modes127
NOP	
L_report_gcode_modes124:
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
L_report_gcode_modes127:
;Print.c,249 :: 		while(DMA_IsOn(1));
L_report_gcode_modes128:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes320
NOP	
J	L_report_gcode_modes129
NOP	
L__report_gcode_modes320:
J	L_report_gcode_modes128
NOP	
L_report_gcode_modes129:
;Print.c,250 :: 		dma_printf("%s",gc.inches_mode ? " G20" : " G21");
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes322
NOP	
J	L_report_gcode_modes130
NOP	
L__report_gcode_modes322:
; ?FLOC___report_gcode_modes?T219 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_75_Print+0)
ORI	R2, R2, lo_addr(?lstr_75_Print+0)
; ?FLOC___report_gcode_modes?T219 end address is: 8 (R2)
J	L_report_gcode_modes131
NOP	
L_report_gcode_modes130:
; ?FLOC___report_gcode_modes?T219 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_76_Print+0)
ORI	R2, R2, lo_addr(?lstr_76_Print+0)
; ?FLOC___report_gcode_modes?T219 end address is: 8 (R2)
L_report_gcode_modes131:
; ?FLOC___report_gcode_modes?T219 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T219 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_74_Print+0)
ORI	R2, R2, lo_addr(?lstr_74_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,251 :: 		while(DMA_IsOn(1));
L_report_gcode_modes132:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes324
NOP	
J	L_report_gcode_modes133
NOP	
L__report_gcode_modes324:
J	L_report_gcode_modes132
NOP	
L_report_gcode_modes133:
;Print.c,252 :: 		dma_printf("%s",gc.absolute_mode ? " G90" : " G91");
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__report_gcode_modes326
NOP	
J	L_report_gcode_modes134
NOP	
L__report_gcode_modes326:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_78_Print+0)
ORI	R2, R2, lo_addr(?lstr_78_Print+0)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
J	L_report_gcode_modes135
NOP	
L_report_gcode_modes134:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_79_Print+0)
ORI	R2, R2, lo_addr(?lstr_79_Print+0)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
L_report_gcode_modes135:
; ?FLOC___report_gcode_modes?T223 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T223 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_77_Print+0)
ORI	R2, R2, lo_addr(?lstr_77_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,253 :: 		while(DMA_IsOn(1));
L_report_gcode_modes136:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes328
NOP	
J	L_report_gcode_modes137
NOP	
L__report_gcode_modes328:
J	L_report_gcode_modes136
NOP	
L_report_gcode_modes137:
;Print.c,254 :: 		dma_printf("%s",gc.inverse_feed_rate_mode ? " G93" : " G94");
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__report_gcode_modes330
NOP	
J	L_report_gcode_modes138
NOP	
L__report_gcode_modes330:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_81_Print+0)
ORI	R2, R2, lo_addr(?lstr_81_Print+0)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
J	L_report_gcode_modes139
NOP	
L_report_gcode_modes138:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
LUI	R2, hi_addr(?lstr_82_Print+0)
ORI	R2, R2, lo_addr(?lstr_82_Print+0)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
L_report_gcode_modes139:
; ?FLOC___report_gcode_modes?T227 start address is: 8 (R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
; ?FLOC___report_gcode_modes?T227 end address is: 8 (R2)
LUI	R2, hi_addr(?lstr_80_Print+0)
ORI	R2, R2, lo_addr(?lstr_80_Print+0)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,256 :: 		while(DMA_IsOn(1));
L_report_gcode_modes140:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes332
NOP	
J	L_report_gcode_modes141
NOP	
L__report_gcode_modes332:
J	L_report_gcode_modes140
NOP	
L_report_gcode_modes141:
;Print.c,257 :: 		switch (gc.program_flow) {
J	L_report_gcode_modes142
NOP	
;Print.c,258 :: 		case PROGRAM_FLOW_PAUSED :    dma_printf("%s"," M0"); break;
L_report_gcode_modes144:
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
J	L_report_gcode_modes143
NOP	
;Print.c,259 :: 		case PROGRAM_FLOW_COMPLETED : dma_printf("%s"," M2"); break;
L_report_gcode_modes145:
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
J	L_report_gcode_modes143
NOP	
;Print.c,260 :: 		}
L_report_gcode_modes142:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes334
NOP	
J	L_report_gcode_modes144
NOP	
L__report_gcode_modes334:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes336
NOP	
J	L_report_gcode_modes145
NOP	
L__report_gcode_modes336:
L_report_gcode_modes143:
;Print.c,261 :: 		while(DMA_IsOn(1));
L_report_gcode_modes146:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes338
NOP	
J	L_report_gcode_modes147
NOP	
L__report_gcode_modes338:
J	L_report_gcode_modes146
NOP	
L_report_gcode_modes147:
;Print.c,262 :: 		switch (gc.spindle_direction) {
J	L_report_gcode_modes148
NOP	
;Print.c,263 :: 		case 1 :  dma_printf("%s"," M3"); break;
L_report_gcode_modes150:
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
J	L_report_gcode_modes149
NOP	
;Print.c,264 :: 		case -1 : dma_printf("%s"," M4"); break;
L_report_gcode_modes151:
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
J	L_report_gcode_modes149
NOP	
;Print.c,265 :: 		default : dma_printf("%s"," M5"); break;
L_report_gcode_modes152:
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
J	L_report_gcode_modes149
NOP	
;Print.c,266 :: 		}
L_report_gcode_modes148:
LBU	R3, Offset(_gc+6)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes340
NOP	
J	L_report_gcode_modes150
NOP	
L__report_gcode_modes340:
LBU	R3, Offset(_gc+6)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_gcode_modes342
NOP	
J	L_report_gcode_modes151
NOP	
L__report_gcode_modes342:
J	L_report_gcode_modes152
NOP	
L_report_gcode_modes149:
;Print.c,267 :: 		while(DMA_IsOn(1));
L_report_gcode_modes153:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes344
NOP	
J	L_report_gcode_modes154
NOP	
L__report_gcode_modes344:
J	L_report_gcode_modes153
NOP	
L_report_gcode_modes154:
;Print.c,268 :: 		switch (gc.coolant_mode) {
J	L_report_gcode_modes155
NOP	
;Print.c,269 :: 		case COOLANT_MIST_ENABLE :  dma_printf("%s"," M7"); break;
L_report_gcode_modes157:
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
J	L_report_gcode_modes156
NOP	
;Print.c,270 :: 		case COOLANT_FLOOD_ENABLE : dma_printf("%s"," M8"); break;
L_report_gcode_modes158:
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
J	L_report_gcode_modes156
NOP	
;Print.c,271 :: 		default :                   dma_printf("%s"," M9"); break;
L_report_gcode_modes159:
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
J	L_report_gcode_modes156
NOP	
;Print.c,272 :: 		}
L_report_gcode_modes155:
LBU	R3, Offset(_gc+7)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes346
NOP	
J	L_report_gcode_modes157
NOP	
L__report_gcode_modes346:
LBU	R3, Offset(_gc+7)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes348
NOP	
J	L_report_gcode_modes158
NOP	
L__report_gcode_modes348:
J	L_report_gcode_modes159
NOP	
L_report_gcode_modes156:
;Print.c,273 :: 		while(DMA_IsOn(1));
L_report_gcode_modes160:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes350
NOP	
J	L_report_gcode_modes161
NOP	
L__report_gcode_modes350:
J	L_report_gcode_modes160
NOP	
L_report_gcode_modes161:
;Print.c,275 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes352
NOP	
J	L_report_gcode_modes162
NOP	
L__report_gcode_modes352:
LWC1	S1, Offset(_gc+24)(GP)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
; ?FLOC___report_gcode_modes?T255 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___report_gcode_modes?T255 end address is: 8 (R2)
J	L_report_gcode_modes163
NOP	
L_report_gcode_modes162:
; ?FLOC___report_gcode_modes?T255 start address is: 8 (R2)
LWC1	S1, Offset(_gc+24)(GP)
; ?FLOC___report_gcode_modes?T255 end address is: 8 (R2)
L_report_gcode_modes163:
; ?FLOC___report_gcode_modes?T255 start address is: 8 (R2)
MOV.S 	S0, S1
; ?FLOC___report_gcode_modes?T255 end address is: 8 (R2)
CVT36.S 	S0, S0
MFC1	R3, S0
;Print.c,274 :: 		dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
LBU	R2, Offset(_gc+10)(GP)
;Print.c,275 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
ADDIU	SP, SP, -12
SH	R3, 8(SP)
;Print.c,274 :: 		dma_printf(" T%d F%d S0]\r\n",(int)gc.tool,
SH	R2, 4(SP)
LUI	R2, hi_addr(?lstr_99_Print+0)
ORI	R2, R2, lo_addr(?lstr_99_Print+0)
SW	R2, 0(SP)
;Print.c,275 :: 		(int)(gc.inches_mode ? gc.feed_rate*INCH_PER_MM : gc.feed_rate));
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Print.c,291 :: 		*/
L_end_report_gcode_modes:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _report_gcode_modes
