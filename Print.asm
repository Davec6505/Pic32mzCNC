_report_status_message:
;Print.c,9 :: 		void report_status_message(int status_code){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Print.c,10 :: 		if (status_code == 0) { // STATUS_OK
SEH	R2, R25
BEQ	R2, R0, L__report_status_message198
NOP	
J	L_report_status_message0
NOP	
L__report_status_message198:
;Print.c,11 :: 		while(DMA_IsOn(1));
L_report_status_message1:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message200
NOP	
J	L_report_status_message2
NOP	
L__report_status_message200:
J	L_report_status_message1
NOP	
L_report_status_message2:
;Print.c,12 :: 		dma_printf("%s","ok\r\n");
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 115
SB	R30, 7(SP)
MOVZ	R30, R0, R0
SB	R30, 8(SP)
ADDIU	R3, SP, 6
LUI	R2, hi_addr(?lstr_2_Print+0)
ORI	R2, R2, lo_addr(?lstr_2_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,13 :: 		} else {
J	L_report_status_message3
NOP	
L_report_status_message0:
;Print.c,15 :: 		switch(status_code) {
J	L_report_status_message4
NOP	
;Print.c,16 :: 		case STATUS_BAD_NUMBER_FORMAT:
L_report_status_message6:
;Print.c,17 :: 		while(DMA_IsOn(1));
L_report_status_message7:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message202
NOP	
J	L_report_status_message8
NOP	
L__report_status_message202:
J	L_report_status_message7
NOP	
L_report_status_message8:
;Print.c,18 :: 		dma_printf("%s\r\n","error: Bad number format");
ORI	R30, R0, 37
SB	R30, 9(SP)
ORI	R30, R0, 115
SB	R30, 10(SP)
ORI	R30, R0, 13
SB	R30, 11(SP)
ORI	R30, R0, 10
SB	R30, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 13(SP)
ADDIU	R3, SP, 9
LUI	R2, hi_addr(?lstr_4_Print+0)
ORI	R2, R2, lo_addr(?lstr_4_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,19 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,20 :: 		case STATUS_EXPECTED_COMMAND_LETTER:
L_report_status_message9:
;Print.c,21 :: 		while(DMA_IsOn(1));
L_report_status_message10:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message204
NOP	
J	L_report_status_message11
NOP	
L__report_status_message204:
J	L_report_status_message10
NOP	
L_report_status_message11:
;Print.c,22 :: 		dma_printf("%s\r\n","error: Expected command letter");
ORI	R30, R0, 37
SB	R30, 14(SP)
ORI	R30, R0, 115
SB	R30, 15(SP)
ORI	R30, R0, 13
SB	R30, 16(SP)
ORI	R30, R0, 10
SB	R30, 17(SP)
MOVZ	R30, R0, R0
SB	R30, 18(SP)
ADDIU	R3, SP, 14
LUI	R2, hi_addr(?lstr_6_Print+0)
ORI	R2, R2, lo_addr(?lstr_6_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,23 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,24 :: 		case STATUS_UNSUPPORTED_STATEMENT:
L_report_status_message12:
;Print.c,25 :: 		while(DMA_IsOn(1));
L_report_status_message13:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message206
NOP	
J	L_report_status_message14
NOP	
L__report_status_message206:
J	L_report_status_message13
NOP	
L_report_status_message14:
;Print.c,26 :: 		dma_printf("%s\r\n","error: Unsupported statement");
ORI	R30, R0, 37
SB	R30, 19(SP)
ORI	R30, R0, 115
SB	R30, 20(SP)
ORI	R30, R0, 13
SB	R30, 21(SP)
ORI	R30, R0, 10
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R3, SP, 19
LUI	R2, hi_addr(?lstr_8_Print+0)
ORI	R2, R2, lo_addr(?lstr_8_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,27 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,28 :: 		case STATUS_ARC_RADIUS_ERROR:
L_report_status_message15:
;Print.c,29 :: 		while(DMA_IsOn(1));
L_report_status_message16:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message208
NOP	
J	L_report_status_message17
NOP	
L__report_status_message208:
J	L_report_status_message16
NOP	
L_report_status_message17:
;Print.c,30 :: 		dma_printf("%s\r\n","error: Invalid radius");
ORI	R30, R0, 37
SB	R30, 24(SP)
ORI	R30, R0, 115
SB	R30, 25(SP)
ORI	R30, R0, 13
SB	R30, 26(SP)
ORI	R30, R0, 10
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R3, SP, 24
LUI	R2, hi_addr(?lstr_10_Print+0)
ORI	R2, R2, lo_addr(?lstr_10_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,31 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,32 :: 		case STATUS_MODAL_GROUP_VIOLATION:
L_report_status_message18:
;Print.c,33 :: 		while(DMA_IsOn(1));
L_report_status_message19:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message210
NOP	
J	L_report_status_message20
NOP	
L__report_status_message210:
J	L_report_status_message19
NOP	
L_report_status_message20:
;Print.c,34 :: 		dma_printf("%s\n","error: Modal group violation");
ORI	R30, R0, 37
SB	R30, 29(SP)
ORI	R30, R0, 115
SB	R30, 30(SP)
ORI	R30, R0, 10
SB	R30, 31(SP)
MOVZ	R30, R0, R0
SB	R30, 32(SP)
ADDIU	R3, SP, 29
LUI	R2, hi_addr(?lstr_12_Print+0)
ORI	R2, R2, lo_addr(?lstr_12_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,35 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,36 :: 		case STATUS_INVALID_STATEMENT:
L_report_status_message21:
;Print.c,37 :: 		while(DMA_IsOn(1));
L_report_status_message22:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message212
NOP	
J	L_report_status_message23
NOP	
L__report_status_message212:
J	L_report_status_message22
NOP	
L_report_status_message23:
;Print.c,38 :: 		dma_printf("%s\r\n","error: Invalid statement");
ORI	R30, R0, 37
SB	R30, 33(SP)
ORI	R30, R0, 115
SB	R30, 34(SP)
ORI	R30, R0, 13
SB	R30, 35(SP)
ORI	R30, R0, 10
SB	R30, 36(SP)
MOVZ	R30, R0, R0
SB	R30, 37(SP)
ADDIU	R3, SP, 33
LUI	R2, hi_addr(?lstr_14_Print+0)
ORI	R2, R2, lo_addr(?lstr_14_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,39 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,40 :: 		case STATUS_SETTING_DISABLED:
L_report_status_message24:
;Print.c,41 :: 		dma_printf("%s\r\n","error: Setting disabled");
ORI	R30, R0, 37
SB	R30, 38(SP)
ORI	R30, R0, 115
SB	R30, 39(SP)
ORI	R30, R0, 13
SB	R30, 40(SP)
ORI	R30, R0, 10
SB	R30, 41(SP)
MOVZ	R30, R0, R0
SB	R30, 42(SP)
ADDIU	R3, SP, 38
LUI	R2, hi_addr(?lstr_16_Print+0)
ORI	R2, R2, lo_addr(?lstr_16_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,42 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,43 :: 		case STATUS_SETTING_VALUE_NEG:
L_report_status_message25:
;Print.c,44 :: 		while(DMA_IsOn(1));
L_report_status_message26:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message214
NOP	
J	L_report_status_message27
NOP	
L__report_status_message214:
J	L_report_status_message26
NOP	
L_report_status_message27:
;Print.c,45 :: 		dma_printf("%s\r\n","error: Value < 0.0");
ORI	R30, R0, 37
SB	R30, 43(SP)
ORI	R30, R0, 115
SB	R30, 44(SP)
ORI	R30, R0, 13
SB	R30, 45(SP)
ORI	R30, R0, 10
SB	R30, 46(SP)
MOVZ	R30, R0, R0
SB	R30, 47(SP)
ADDIU	R3, SP, 43
LUI	R2, hi_addr(?lstr_18_Print+0)
ORI	R2, R2, lo_addr(?lstr_18_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,46 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,47 :: 		case STATUS_SETTING_STEP_PULSE_MIN:
L_report_status_message28:
;Print.c,48 :: 		while(DMA_IsOn(1));
L_report_status_message29:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message216
NOP	
J	L_report_status_message30
NOP	
L__report_status_message216:
J	L_report_status_message29
NOP	
L_report_status_message30:
;Print.c,49 :: 		dma_printf("%s\r\n","error: Value < 3 usec");
ORI	R30, R0, 37
SB	R30, 48(SP)
ORI	R30, R0, 115
SB	R30, 49(SP)
ORI	R30, R0, 13
SB	R30, 50(SP)
ORI	R30, R0, 10
SB	R30, 51(SP)
MOVZ	R30, R0, R0
SB	R30, 52(SP)
ADDIU	R3, SP, 48
LUI	R2, hi_addr(?lstr_20_Print+0)
ORI	R2, R2, lo_addr(?lstr_20_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,50 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,51 :: 		case STATUS_SETTING_READ_FAIL:
L_report_status_message31:
;Print.c,52 :: 		while(DMA_IsOn(1));
L_report_status_message32:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message218
NOP	
J	L_report_status_message33
NOP	
L__report_status_message218:
J	L_report_status_message32
NOP	
L_report_status_message33:
;Print.c,53 :: 		dma_printf("%s\r\n","error: EEPROM read fail. Using defaults");
ORI	R30, R0, 37
SB	R30, 53(SP)
ORI	R30, R0, 115
SB	R30, 54(SP)
ORI	R30, R0, 13
SB	R30, 55(SP)
ORI	R30, R0, 10
SB	R30, 56(SP)
MOVZ	R30, R0, R0
SB	R30, 57(SP)
ADDIU	R3, SP, 53
LUI	R2, hi_addr(?lstr_22_Print+0)
ORI	R2, R2, lo_addr(?lstr_22_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,54 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,55 :: 		case STATUS_IDLE_ERROR:
L_report_status_message34:
;Print.c,56 :: 		while(DMA_IsOn(1));
L_report_status_message35:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message220
NOP	
J	L_report_status_message36
NOP	
L__report_status_message220:
J	L_report_status_message35
NOP	
L_report_status_message36:
;Print.c,57 :: 		dma_printf("%s\r\n","error: Busy or queued");
ORI	R30, R0, 37
SB	R30, 58(SP)
ORI	R30, R0, 115
SB	R30, 59(SP)
ORI	R30, R0, 13
SB	R30, 60(SP)
ORI	R30, R0, 10
SB	R30, 61(SP)
MOVZ	R30, R0, R0
SB	R30, 62(SP)
ADDIU	R3, SP, 58
LUI	R2, hi_addr(?lstr_24_Print+0)
ORI	R2, R2, lo_addr(?lstr_24_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,58 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,59 :: 		case STATUS_ALARM_LOCK:
L_report_status_message37:
;Print.c,60 :: 		while(DMA_IsOn(1));
L_report_status_message38:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message222
NOP	
J	L_report_status_message39
NOP	
L__report_status_message222:
J	L_report_status_message38
NOP	
L_report_status_message39:
;Print.c,61 :: 		dma_printf("%s\r\n","error: Alarm lock");
ORI	R30, R0, 37
SB	R30, 63(SP)
ORI	R30, R0, 115
SB	R30, 64(SP)
ORI	R30, R0, 13
SB	R30, 65(SP)
ORI	R30, R0, 10
SB	R30, 66(SP)
MOVZ	R30, R0, R0
SB	R30, 67(SP)
ADDIU	R3, SP, 63
LUI	R2, hi_addr(?lstr_26_Print+0)
ORI	R2, R2, lo_addr(?lstr_26_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,62 :: 		break;
J	L_report_status_message5
NOP	
;Print.c,63 :: 		}
L_report_status_message4:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_status_message224
NOP	
J	L_report_status_message6
NOP	
L__report_status_message224:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_status_message226
NOP	
J	L_report_status_message9
NOP	
L__report_status_message226:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_status_message228
NOP	
J	L_report_status_message12
NOP	
L__report_status_message228:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_status_message230
NOP	
J	L_report_status_message15
NOP	
L__report_status_message230:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_status_message232
NOP	
J	L_report_status_message18
NOP	
L__report_status_message232:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__report_status_message234
NOP	
J	L_report_status_message21
NOP	
L__report_status_message234:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__report_status_message236
NOP	
J	L_report_status_message24
NOP	
L__report_status_message236:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__report_status_message238
NOP	
J	L_report_status_message25
NOP	
L__report_status_message238:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__report_status_message240
NOP	
J	L_report_status_message28
NOP	
L__report_status_message240:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__report_status_message242
NOP	
J	L_report_status_message31
NOP	
L__report_status_message242:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__report_status_message244
NOP	
J	L_report_status_message34
NOP	
L__report_status_message244:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__report_status_message246
NOP	
J	L_report_status_message37
NOP	
L__report_status_message246:
L_report_status_message5:
;Print.c,64 :: 		}
L_report_status_message3:
;Print.c,65 :: 		}
L_end_report_status_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _report_status_message
_report_alarm_message:
;Print.c,68 :: 		void report_alarm_message(int alarm_code){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Print.c,69 :: 		while(DMA_IsOn(1));
L_report_alarm_message40:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message249
NOP	
J	L_report_alarm_message41
NOP	
L__report_alarm_message249:
J	L_report_alarm_message40
NOP	
L_report_alarm_message41:
;Print.c,70 :: 		dma_printf("%s","ALARM: ");
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 115
SB	R30, 7(SP)
MOVZ	R30, R0, R0
SB	R30, 8(SP)
ADDIU	R3, SP, 6
LUI	R2, hi_addr(?lstr_28_Print+0)
ORI	R2, R2, lo_addr(?lstr_28_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,71 :: 		switch (alarm_code) {
J	L_report_alarm_message42
NOP	
;Print.c,72 :: 		case ALARM_HARD_LIMIT:
L_report_alarm_message44:
;Print.c,73 :: 		while(DMA_IsOn(1));
L_report_alarm_message45:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message251
NOP	
J	L_report_alarm_message46
NOP	
L__report_alarm_message251:
J	L_report_alarm_message45
NOP	
L_report_alarm_message46:
;Print.c,74 :: 		dma_printf("%s\r\n","Hard limit");
ORI	R30, R0, 37
SB	R30, 9(SP)
ORI	R30, R0, 115
SB	R30, 10(SP)
ORI	R30, R0, 13
SB	R30, 11(SP)
ORI	R30, R0, 10
SB	R30, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 13(SP)
ADDIU	R3, SP, 9
LUI	R2, hi_addr(?lstr_30_Print+0)
ORI	R2, R2, lo_addr(?lstr_30_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,75 :: 		break;
J	L_report_alarm_message43
NOP	
;Print.c,76 :: 		case ALARM_ABORT_CYCLE:
L_report_alarm_message47:
;Print.c,77 :: 		while(DMA_IsOn(1));
L_report_alarm_message48:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message253
NOP	
J	L_report_alarm_message49
NOP	
L__report_alarm_message253:
J	L_report_alarm_message48
NOP	
L_report_alarm_message49:
;Print.c,78 :: 		dma_printf("%s\r\n","Abort during cycle");
ORI	R30, R0, 37
SB	R30, 14(SP)
ORI	R30, R0, 115
SB	R30, 15(SP)
ORI	R30, R0, 13
SB	R30, 16(SP)
ORI	R30, R0, 10
SB	R30, 17(SP)
MOVZ	R30, R0, R0
SB	R30, 18(SP)
ADDIU	R3, SP, 14
LUI	R2, hi_addr(?lstr_32_Print+0)
ORI	R2, R2, lo_addr(?lstr_32_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,79 :: 		break;
J	L_report_alarm_message43
NOP	
;Print.c,80 :: 		}
L_report_alarm_message42:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_alarm_message255
NOP	
J	L_report_alarm_message44
NOP	
L__report_alarm_message255:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__report_alarm_message257
NOP	
J	L_report_alarm_message47
NOP	
L__report_alarm_message257:
L_report_alarm_message43:
;Print.c,81 :: 		while(DMA_IsOn(1));
L_report_alarm_message50:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message259
NOP	
J	L_report_alarm_message51
NOP	
L__report_alarm_message259:
J	L_report_alarm_message50
NOP	
L_report_alarm_message51:
;Print.c,82 :: 		dma_printf("%s\r\n",". MPos?");
ORI	R30, R0, 37
SB	R30, 19(SP)
ORI	R30, R0, 115
SB	R30, 20(SP)
ORI	R30, R0, 13
SB	R30, 21(SP)
ORI	R30, R0, 10
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R3, SP, 19
LUI	R2, hi_addr(?lstr_34_Print+0)
ORI	R2, R2, lo_addr(?lstr_34_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,83 :: 		Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
LUI	R24, 508
ORI	R24, R24, 41044
L_report_alarm_message52:
ADDIU	R24, R24, -1
BNE	R24, R0, L_report_alarm_message52
NOP	
NOP	
NOP	
;Print.c,84 :: 		}
L_end_report_alarm_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _report_alarm_message
_report_feedback_message:
;Print.c,92 :: 		void report_feedback_message(int message_code){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Print.c,94 :: 		switch(message_code) {
J	L_report_feedback_message54
NOP	
;Print.c,95 :: 		case MESSAGE_CRITICAL_EVENT:
L_report_feedback_message56:
;Print.c,96 :: 		while(DMA_IsOn(1));
L_report_feedback_message57:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message262
NOP	
J	L_report_feedback_message58
NOP	
L__report_feedback_message262:
J	L_report_feedback_message57
NOP	
L_report_feedback_message58:
;Print.c,97 :: 		dma_printf("%s\r\n","[Reset to continue]"); break;
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 115
SB	R30, 7(SP)
ORI	R30, R0, 13
SB	R30, 8(SP)
ORI	R30, R0, 10
SB	R30, 9(SP)
MOVZ	R30, R0, R0
SB	R30, 10(SP)
ADDIU	R3, SP, 6
LUI	R2, hi_addr(?lstr_36_Print+0)
ORI	R2, R2, lo_addr(?lstr_36_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message55
NOP	
;Print.c,98 :: 		case MESSAGE_ALARM_LOCK:
L_report_feedback_message59:
;Print.c,99 :: 		while(DMA_IsOn(1));
L_report_feedback_message60:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message264
NOP	
J	L_report_feedback_message61
NOP	
L__report_feedback_message264:
J	L_report_feedback_message60
NOP	
L_report_feedback_message61:
;Print.c,100 :: 		dma_printf("%s\r\n","['$H'|'$X' to unlock]"); break;
ORI	R30, R0, 37
SB	R30, 11(SP)
ORI	R30, R0, 115
SB	R30, 12(SP)
ORI	R30, R0, 13
SB	R30, 13(SP)
ORI	R30, R0, 10
SB	R30, 14(SP)
MOVZ	R30, R0, R0
SB	R30, 15(SP)
ADDIU	R3, SP, 11
LUI	R2, hi_addr(?lstr_38_Print+0)
ORI	R2, R2, lo_addr(?lstr_38_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message55
NOP	
;Print.c,101 :: 		case MESSAGE_ALARM_UNLOCK:
L_report_feedback_message62:
;Print.c,102 :: 		while(DMA_IsOn(1));
L_report_feedback_message63:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message266
NOP	
J	L_report_feedback_message64
NOP	
L__report_feedback_message266:
J	L_report_feedback_message63
NOP	
L_report_feedback_message64:
;Print.c,103 :: 		dma_printf("%s\r\n","[Caution: Unlocked]"); break;
ORI	R30, R0, 37
SB	R30, 16(SP)
ORI	R30, R0, 115
SB	R30, 17(SP)
ORI	R30, R0, 13
SB	R30, 18(SP)
ORI	R30, R0, 10
SB	R30, 19(SP)
MOVZ	R30, R0, R0
SB	R30, 20(SP)
ADDIU	R3, SP, 16
LUI	R2, hi_addr(?lstr_40_Print+0)
ORI	R2, R2, lo_addr(?lstr_40_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message55
NOP	
;Print.c,104 :: 		case MESSAGE_ENABLED:
L_report_feedback_message65:
;Print.c,105 :: 		while(DMA_IsOn(1));
L_report_feedback_message66:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message268
NOP	
J	L_report_feedback_message67
NOP	
L__report_feedback_message268:
J	L_report_feedback_message66
NOP	
L_report_feedback_message67:
;Print.c,106 :: 		dma_printf("%s\r\n","[Enabled]"); break;
ORI	R30, R0, 37
SB	R30, 21(SP)
ORI	R30, R0, 115
SB	R30, 22(SP)
ORI	R30, R0, 13
SB	R30, 23(SP)
ORI	R30, R0, 10
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R3, SP, 21
LUI	R2, hi_addr(?lstr_42_Print+0)
ORI	R2, R2, lo_addr(?lstr_42_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message55
NOP	
;Print.c,107 :: 		case MESSAGE_DISABLED:
L_report_feedback_message68:
;Print.c,108 :: 		while(DMA_IsOn(1));
L_report_feedback_message69:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message270
NOP	
J	L_report_feedback_message70
NOP	
L__report_feedback_message270:
J	L_report_feedback_message69
NOP	
L_report_feedback_message70:
;Print.c,109 :: 		dma_printf("%s\r\n","[Disabled]"); break;
ORI	R30, R0, 37
SB	R30, 26(SP)
ORI	R30, R0, 115
SB	R30, 27(SP)
ORI	R30, R0, 13
SB	R30, 28(SP)
ORI	R30, R0, 10
SB	R30, 29(SP)
MOVZ	R30, R0, R0
SB	R30, 30(SP)
ADDIU	R3, SP, 26
LUI	R2, hi_addr(?lstr_44_Print+0)
ORI	R2, R2, lo_addr(?lstr_44_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message55
NOP	
;Print.c,110 :: 		}
L_report_feedback_message54:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_feedback_message272
NOP	
J	L_report_feedback_message56
NOP	
L__report_feedback_message272:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_feedback_message274
NOP	
J	L_report_feedback_message59
NOP	
L__report_feedback_message274:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_feedback_message276
NOP	
J	L_report_feedback_message62
NOP	
L__report_feedback_message276:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_feedback_message278
NOP	
J	L_report_feedback_message65
NOP	
L__report_feedback_message278:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_feedback_message280
NOP	
J	L_report_feedback_message68
NOP	
L__report_feedback_message280:
L_report_feedback_message55:
;Print.c,111 :: 		}
L_end_report_feedback_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _report_feedback_message
_report_init_message:
;Print.c,114 :: 		void report_init_message(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Print.c,115 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_init_message71:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_init_message283
NOP	
J	L_report_init_message72
NOP	
L__report_init_message283:
J	L_report_init_message71
NOP	
L_report_init_message72:
;Print.c,116 :: 		dma_printf("%s%s%s\r\n",FIRMWARE,GRBL_VERSION,GRBL_HELP);
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr45_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LUI	R2, hi_addr(?lstr_48_Print+0)
ORI	R2, R2, lo_addr(?lstr_48_Print+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(?lstr_47_Print+0)
ORI	R2, R2, lo_addr(?lstr_47_Print+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_46_Print+0)
ORI	R2, R2, lo_addr(?lstr_46_Print+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,117 :: 		}
L_end_report_init_message:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _report_init_message
_report_grbl_help:
;Print.c,120 :: 		void report_grbl_help() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,121 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_grbl_help73:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_help286
NOP	
J	L_report_grbl_help74
NOP	
L__report_grbl_help286:
J	L_report_grbl_help73
NOP	
L_report_grbl_help74:
;Print.c,135 :: 		ctrl-x (reset Grbl)\r\n");
ORI	R30, R0, 37
SB	R30, 8(SP)
ORI	R30, R0, 115
SB	R30, 9(SP)
MOVZ	R30, R0, R0
SB	R30, 10(SP)
ADDIU	R3, SP, 8
LUI	R2, hi_addr(?lstr_50_Print+0)
ORI	R2, R2, lo_addr(?lstr_50_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,136 :: 		}
L_end_report_grbl_help:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _report_grbl_help
_report_grbl_settings:
;Print.c,140 :: 		void report_grbl_settings() {
ADDIU	SP, SP, -684
SW	RA, 0(SP)
;Print.c,143 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_grbl_settings75:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_settings289
NOP	
J	L_report_grbl_settings76
NOP	
L__report_grbl_settings289:
J	L_report_grbl_settings75
NOP	
L_report_grbl_settings76:
;Print.c,185 :: 		,bit_istrue(settings.flags,FLAG_HOMING_ENABLE)     //17
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
XORI	R8, R2, 0
SLTU	R8, R0, R8
;Print.c,184 :: 		,bit_istrue(settings.flags,FLAG_HARD_LIMIT_ENABLE) //16
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
XORI	R7, R2, 0
SLTU	R7, R0, R7
;Print.c,183 :: 		,bit_istrue(settings.flags,FLAG_INVERT_ST_ENABLE)  //15
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 4
ANDI	R2, R2, 65535
XORI	R6, R2, 0
SLTU	R6, R0, R6
;Print.c,182 :: 		,bit_istrue(settings.flags,FLAG_AUTO_START)        //14
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
XORI	R5, R2, 0
SLTU	R5, R0, R5
;Print.c,181 :: 		,bit_istrue(settings.flags,FLAG_REPORT_INCHES)     //13
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
XORI	R4, R2, 0
SLTU	R4, R0, R4
;Print.c,167 :: 		$22=%f (homing pull-off, mm)\r\n"
ADDIU	R23, SP, 8
ADDIU	R22, R23, 674
LUI	R24, hi_addr(?ICS?lstr51_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
;Print.c,190 :: 		,settings.homing_pulloff);                            //22
LW	R2, Offset(_settings+32)(GP)
ADDIU	SP, SP, -96
SW	R2, 92(SP)
;Print.c,189 :: 		,settings.homing_debounce_delay                       //21
LHU	R2, Offset(_settings+54)(GP)
SH	R2, 88(SP)
;Print.c,188 :: 		,settings.homing_seek_rate                            //20
LW	R2, Offset(_settings+28)(GP)
SW	R2, 84(SP)
;Print.c,187 :: 		,settings.homing_feed_rate                         //19
LW	R2, Offset(_settings+24)(GP)
SW	R2, 80(SP)
;Print.c,186 :: 		,settings.homing_dir_mask                          //18
LHU	R2, Offset(_settings+64)(GP)
SH	R2, 76(SP)
;Print.c,185 :: 		,bit_istrue(settings.flags,FLAG_HOMING_ENABLE)     //17
SW	R8, 72(SP)
;Print.c,184 :: 		,bit_istrue(settings.flags,FLAG_HARD_LIMIT_ENABLE) //16
SW	R7, 68(SP)
;Print.c,183 :: 		,bit_istrue(settings.flags,FLAG_INVERT_ST_ENABLE)  //15
SW	R6, 64(SP)
;Print.c,182 :: 		,bit_istrue(settings.flags,FLAG_AUTO_START)        //14
SW	R5, 60(SP)
;Print.c,181 :: 		,bit_istrue(settings.flags,FLAG_REPORT_INCHES)     //13
SW	R4, 56(SP)
;Print.c,180 :: 		,settings.decimal_places            //12
LHU	R2, Offset(_settings+62)(GP)
SH	R2, 52(SP)
;Print.c,179 :: 		,settings.n_arc_correction          //11
LHU	R2, Offset(_settings+48)(GP)
SH	R2, 48(SP)
;Print.c,178 :: 		,settings.mm_per_arc_segment        //10
LW	R2, Offset(_settings+36)(GP)
SW	R2, 44(SP)
;Print.c,177 :: 		,settings.junction_deviation        //9
LW	R2, Offset(_settings+44)(GP)
SW	R2, 40(SP)
;Print.c,176 :: 		,settings.acceleration              //8
LW	R2, Offset(_settings+40)(GP)
SW	R2, 36(SP)
;Print.c,175 :: 		,settings.step_idle_delay           //7
LHU	R2, Offset(_settings+52)(GP)
SH	R2, 32(SP)
;Print.c,174 :: 		,settings.invert_mask               //6
LHU	R2, Offset(_settings+66)(GP)
SH	R2, 28(SP)
;Print.c,173 :: 		,settings.default_seek_rate         //5
LW	R2, Offset(_settings+20)(GP)
SW	R2, 24(SP)
;Print.c,172 :: 		,settings.default_feed_rate         //4
LW	R2, Offset(_settings+16)(GP)
SW	R2, 20(SP)
;Print.c,171 :: 		,settings.p_usec                    //3
LHU	R2, Offset(_settings+60)(GP)
SH	R2, 16(SP)
;Print.c,170 :: 		,settings.steps_per_mm[Z]           //2
LW	R2, Offset(_settings+8)(GP)
SW	R2, 12(SP)
;Print.c,169 :: 		,settings.steps_per_mm[Y]           //1
LW	R2, Offset(_settings+4)(GP)
SW	R2, 8(SP)
;Print.c,168 :: 		,settings.steps_per_mm[X]           //0
LW	R2, Offset(_settings+0)(GP)
SW	R2, 4(SP)
;Print.c,167 :: 		$22=%f (homing pull-off, mm)\r\n"
SW	R3, 0(SP)
;Print.c,190 :: 		,settings.homing_pulloff);                            //22
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 96
;Print.c,191 :: 		}
L_end_report_grbl_settings:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 684
JR	RA
NOP	
; end of _report_grbl_settings
_report_startup_line:
;Print.c,195 :: 		void report_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Print.c,196 :: 		while(DMA_IsOn(1));
L_report_startup_line77:
SW	R26, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__report_startup_line297
NOP	
J	L_report_startup_line78
NOP	
L__report_startup_line297:
J	L_report_startup_line77
NOP	
L_report_startup_line78:
;Print.c,197 :: 		dma_printf("$N%d=%s\r\n",n,line);
ADDIU	R23, SP, 10
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr52_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 10
SW	R26, 4(SP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R26, 8(SP)
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
LW	R26, 4(SP)
;Print.c,198 :: 		}
L_end_report_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _report_startup_line
_report_realtime_status:
;Print.c,205 :: 		void report_realtime_status(){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Print.c,214 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
SW	R26, 8(SP)
L_report_realtime_status79:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status300
NOP	
J	L_report_realtime_status80
NOP	
L__report_realtime_status300:
J	L_report_realtime_status79
NOP	
L_report_realtime_status80:
;Print.c,216 :: 		switch (sys.state) {
J	L_report_realtime_status81
NOP	
;Print.c,217 :: 		case STATE_IDLE:       dma_printf("%s","<Idle"); break;
L_report_realtime_status83:
ORI	R30, R0, 37
SB	R30, 14(SP)
ORI	R30, R0, 115
SB	R30, 15(SP)
MOVZ	R30, R0, R0
SB	R30, 16(SP)
ADDIU	R3, SP, 14
LUI	R2, hi_addr(?lstr_54_Print+0)
ORI	R2, R2, lo_addr(?lstr_54_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,219 :: 		case STATE_QUEUED:     dma_printf("%s","<Queue"); break;
L_report_realtime_status84:
ORI	R30, R0, 37
SB	R30, 17(SP)
ORI	R30, R0, 115
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R3, SP, 17
LUI	R2, hi_addr(?lstr_56_Print+0)
ORI	R2, R2, lo_addr(?lstr_56_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,220 :: 		case STATE_CYCLE:      dma_printf("%s","<Run"); break;
L_report_realtime_status85:
ORI	R30, R0, 37
SB	R30, 20(SP)
ORI	R30, R0, 115
SB	R30, 21(SP)
MOVZ	R30, R0, R0
SB	R30, 22(SP)
ADDIU	R3, SP, 20
LUI	R2, hi_addr(?lstr_58_Print+0)
ORI	R2, R2, lo_addr(?lstr_58_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,221 :: 		case STATE_HOLD:       dma_printf("%s","<Hold"); break;
L_report_realtime_status86:
ORI	R30, R0, 37
SB	R30, 23(SP)
ORI	R30, R0, 115
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R3, SP, 23
LUI	R2, hi_addr(?lstr_60_Print+0)
ORI	R2, R2, lo_addr(?lstr_60_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,222 :: 		case STATE_HOMING:     dma_printf("%s","<Home"); break;
L_report_realtime_status87:
ORI	R30, R0, 37
SB	R30, 26(SP)
ORI	R30, R0, 115
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R3, SP, 26
LUI	R2, hi_addr(?lstr_62_Print+0)
ORI	R2, R2, lo_addr(?lstr_62_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,223 :: 		case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
L_report_realtime_status88:
ORI	R30, R0, 37
SB	R30, 29(SP)
ORI	R30, R0, 115
SB	R30, 30(SP)
MOVZ	R30, R0, R0
SB	R30, 31(SP)
ADDIU	R3, SP, 29
LUI	R2, hi_addr(?lstr_64_Print+0)
ORI	R2, R2, lo_addr(?lstr_64_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,224 :: 		case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
L_report_realtime_status89:
ORI	R30, R0, 37
SB	R30, 32(SP)
ORI	R30, R0, 115
SB	R30, 33(SP)
MOVZ	R30, R0, R0
SB	R30, 34(SP)
ADDIU	R3, SP, 32
LUI	R2, hi_addr(?lstr_66_Print+0)
ORI	R2, R2, lo_addr(?lstr_66_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status82
NOP	
;Print.c,225 :: 		}
L_report_realtime_status81:
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__report_realtime_status302
NOP	
J	L_report_realtime_status83
NOP	
L__report_realtime_status302:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_realtime_status304
NOP	
J	L_report_realtime_status84
NOP	
L__report_realtime_status304:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_realtime_status306
NOP	
J	L_report_realtime_status85
NOP	
L__report_realtime_status306:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_realtime_status308
NOP	
J	L_report_realtime_status86
NOP	
L__report_realtime_status308:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_realtime_status310
NOP	
J	L_report_realtime_status87
NOP	
L__report_realtime_status310:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_realtime_status312
NOP	
J	L_report_realtime_status88
NOP	
L__report_realtime_status312:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_realtime_status314
NOP	
J	L_report_realtime_status89
NOP	
L__report_realtime_status314:
L_report_realtime_status82:
;Print.c,228 :: 		for (i=0; i<= NoOfAxis; i++) {
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_report_realtime_status90:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 5
BNE	R2, R0, L__report_realtime_status315
NOP	
J	L_report_realtime_status91
NOP	
L__report_realtime_status315:
;Print.c,229 :: 		print_position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(report_realtime_status_print_position_L0+0)
ORI	R2, R2, lo_addr(report_realtime_status_print_position_L0+0)
ADDU	R2, R2, R3
SW	R2, 72(SP)
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 72(SP)
SWC1	S0, 0(R2)
;Print.c,230 :: 		if (bit_istrue(settings.flags,FLAG_REPORT_INCHES)) { print_position[i] *= INCH_PER_MM; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L__report_realtime_status317
NOP	
J	L_report_realtime_status93
NOP	
L__report_realtime_status317:
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(report_realtime_status_print_position_L0+0)
ORI	R2, R2, lo_addr(report_realtime_status_print_position_L0+0)
ADDU	R3, R2, R3
LWC1	S1, 0(R3)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
L_report_realtime_status93:
;Print.c,228 :: 		for (i=0; i<= NoOfAxis; i++) {
ADDIU	R2, R4, 1
SEH	R4, R2
;Print.c,231 :: 		}
; i end address is: 16 (R4)
J	L_report_realtime_status90
NOP	
L_report_realtime_status91:
;Print.c,233 :: 		while(DMA_IsOn(1));
L_report_realtime_status94:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status319
NOP	
J	L_report_realtime_status95
NOP	
L__report_realtime_status319:
J	L_report_realtime_status94
NOP	
L_report_realtime_status95:
;Print.c,234 :: 		dma_printf(",MPos: %f,%f,%f,"
ADDIU	R23, SP, 35
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr67_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 35
;Print.c,237 :: 		,print_position[2]);
LW	R2, Offset(report_realtime_status_print_position_L0+8)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,236 :: 		,print_position[1]
LW	R2, Offset(report_realtime_status_print_position_L0+4)(GP)
SW	R2, 8(SP)
;Print.c,235 :: 		,print_position[0]
LW	R2, Offset(report_realtime_status_print_position_L0+0)(GP)
SW	R2, 4(SP)
;Print.c,234 :: 		dma_printf(",MPos: %f,%f,%f,"
SW	R3, 0(SP)
;Print.c,237 :: 		,print_position[2]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,240 :: 		for (i=0; i<= 2; i++) {
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_realtime_status96:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status320
NOP	
J	L_report_realtime_status97
NOP	
L__report_realtime_status320:
;Print.c,241 :: 		if (bit_istrue(settings.flags,FLAG_REPORT_INCHES)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L__report_realtime_status322
NOP	
J	L_report_realtime_status99
NOP	
L__report_realtime_status322:
;Print.c,242 :: 		print_position[i] -= (gc.coord_system[i]+gc.coord_offset[i])*INCH_PER_MM;
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(report_realtime_status_print_position_L0+0)
ORI	R2, R2, lo_addr(report_realtime_status_print_position_L0+0)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S1, S1, S0
LWC1	S0, 0(R3)
SUB.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Print.c,243 :: 		} else {
J	L_report_realtime_status100
NOP	
L_report_realtime_status99:
;Print.c,244 :: 		print_position[i] -= gc.coord_system[i]+gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(report_realtime_status_print_position_L0+0)
ORI	R2, R2, lo_addr(report_realtime_status_print_position_L0+0)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
SUB.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Print.c,245 :: 		}
L_report_realtime_status100:
;Print.c,240 :: 		for (i=0; i<= 2; i++) {
ADDIU	R2, R5, 1
SEH	R5, R2
;Print.c,246 :: 		}
; i end address is: 20 (R5)
J	L_report_realtime_status96
NOP	
L_report_realtime_status97:
;Print.c,248 :: 		while(DMA_IsOn(1));
L_report_realtime_status101:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status324
NOP	
J	L_report_realtime_status102
NOP	
L__report_realtime_status324:
J	L_report_realtime_status101
NOP	
L_report_realtime_status102:
;Print.c,249 :: 		dma_printf("WPos: %f,%f,%f>\r\n"
ADDIU	R23, SP, 52
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr68_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 52
;Print.c,252 :: 		,print_position[2]);
LW	R2, Offset(report_realtime_status_print_position_L0+8)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
;Print.c,251 :: 		,print_position[1]
LW	R2, Offset(report_realtime_status_print_position_L0+4)(GP)
SW	R2, 8(SP)
;Print.c,250 :: 		,print_position[0]
LW	R2, Offset(report_realtime_status_print_position_L0+0)(GP)
SW	R2, 4(SP)
;Print.c,249 :: 		dma_printf("WPos: %f,%f,%f>\r\n"
SW	R3, 0(SP)
;Print.c,252 :: 		,print_position[2]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,253 :: 		}
L_end_report_realtime_status:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _report_realtime_status
_report_gcode_parameters:
;Print.c,258 :: 		void report_gcode_parameters(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Print.c,262 :: 		if (!read_coord_data_indicator()){
SW	R25, 4(SP)
JAL	_read_coord_data_indicator+0
NOP	
BEQ	R2, R0, L__report_gcode_parameters326
NOP	
J	L_report_gcode_parameters103
NOP	
L__report_gcode_parameters326:
;Print.c,263 :: 		settings_read_coord_data();
JAL	_settings_read_coord_data+0
NOP	
;Print.c,264 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__report_gcode_parameters327
NOP	
J	L_report_gcode_parameters104
NOP	
L__report_gcode_parameters327:
;Print.c,265 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
;Print.c,266 :: 		return;
J	L_end_report_gcode_parameters
NOP	
;Print.c,267 :: 		}
L_report_gcode_parameters104:
;Print.c,268 :: 		}
L_report_gcode_parameters103:
;Print.c,270 :: 		for (coord_select = 1; coord_select <= SETTING_INDEX_NCOORD; coord_select++){
ORI	R2, R0, 1
SH	R2, 8(SP)
L_report_gcode_parameters105:
LH	R2, 8(SP)
SLTI	R2, R2, 11
BNE	R2, R0, L__report_gcode_parameters328
NOP	
J	L_report_gcode_parameters106
NOP	
L__report_gcode_parameters328:
;Print.c,271 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters108:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters330
NOP	
J	L_report_gcode_parameters109
NOP	
L__report_gcode_parameters330:
J	L_report_gcode_parameters108
NOP	
L_report_gcode_parameters109:
;Print.c,272 :: 		dma_printf("[G");
ORI	R30, R0, 91
SB	R30, 12(SP)
ORI	R30, R0, 71
SB	R30, 13(SP)
MOVZ	R30, R0, R0
SB	R30, 14(SP)
ADDIU	R2, SP, 12
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,273 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters110:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters332
NOP	
J	L_report_gcode_parameters111
NOP	
L__report_gcode_parameters332:
J	L_report_gcode_parameters110
NOP	
L_report_gcode_parameters111:
;Print.c,274 :: 		switch (coord_select) {
J	L_report_gcode_parameters112
NOP	
;Print.c,275 :: 		case 1: dma_printf("54:"); break;
L_report_gcode_parameters114:
ORI	R30, R0, 53
SB	R30, 15(SP)
ORI	R30, R0, 52
SB	R30, 16(SP)
ORI	R30, R0, 58
SB	R30, 17(SP)
MOVZ	R30, R0, R0
SB	R30, 18(SP)
ADDIU	R2, SP, 15
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,276 :: 		case 2: dma_printf("55:"); break;
L_report_gcode_parameters115:
ORI	R30, R0, 53
SB	R30, 19(SP)
ORI	R30, R0, 53
SB	R30, 20(SP)
ORI	R30, R0, 58
SB	R30, 21(SP)
MOVZ	R30, R0, R0
SB	R30, 22(SP)
ADDIU	R2, SP, 19
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,277 :: 		case 3: dma_printf("56:"); break;
L_report_gcode_parameters116:
ORI	R30, R0, 53
SB	R30, 23(SP)
ORI	R30, R0, 54
SB	R30, 24(SP)
ORI	R30, R0, 58
SB	R30, 25(SP)
MOVZ	R30, R0, R0
SB	R30, 26(SP)
ADDIU	R2, SP, 23
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,278 :: 		case 4: dma_printf("57:"); break;
L_report_gcode_parameters117:
ORI	R30, R0, 53
SB	R30, 27(SP)
ORI	R30, R0, 55
SB	R30, 28(SP)
ORI	R30, R0, 58
SB	R30, 29(SP)
MOVZ	R30, R0, R0
SB	R30, 30(SP)
ADDIU	R2, SP, 27
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,279 :: 		case 5: dma_printf("58:"); break;
L_report_gcode_parameters118:
ORI	R30, R0, 53
SB	R30, 31(SP)
ORI	R30, R0, 56
SB	R30, 32(SP)
ORI	R30, R0, 58
SB	R30, 33(SP)
MOVZ	R30, R0, R0
SB	R30, 34(SP)
ADDIU	R2, SP, 31
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,280 :: 		case 6: dma_printf("59:"); break;
L_report_gcode_parameters119:
ORI	R30, R0, 53
SB	R30, 35(SP)
ORI	R30, R0, 57
SB	R30, 36(SP)
ORI	R30, R0, 58
SB	R30, 37(SP)
MOVZ	R30, R0, R0
SB	R30, 38(SP)
ADDIU	R2, SP, 35
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,281 :: 		case 7: dma_printf("28:"); break;
L_report_gcode_parameters120:
ORI	R30, R0, 50
SB	R30, 39(SP)
ORI	R30, R0, 56
SB	R30, 40(SP)
ORI	R30, R0, 58
SB	R30, 41(SP)
MOVZ	R30, R0, R0
SB	R30, 42(SP)
ADDIU	R2, SP, 39
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,282 :: 		case 8: dma_printf("30:"); break;
L_report_gcode_parameters121:
ORI	R30, R0, 51
SB	R30, 43(SP)
ORI	R30, R0, 48
SB	R30, 44(SP)
ORI	R30, R0, 58
SB	R30, 45(SP)
MOVZ	R30, R0, R0
SB	R30, 46(SP)
ADDIU	R2, SP, 43
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,284 :: 		}
L_report_gcode_parameters112:
LH	R3, 8(SP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_parameters334
NOP	
J	L_report_gcode_parameters114
NOP	
L__report_gcode_parameters334:
LH	R3, 8(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_parameters336
NOP	
J	L_report_gcode_parameters115
NOP	
L__report_gcode_parameters336:
LH	R3, 8(SP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_parameters338
NOP	
J	L_report_gcode_parameters116
NOP	
L__report_gcode_parameters338:
LH	R3, 8(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_parameters340
NOP	
J	L_report_gcode_parameters117
NOP	
L__report_gcode_parameters340:
LH	R3, 8(SP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_gcode_parameters342
NOP	
J	L_report_gcode_parameters118
NOP	
L__report_gcode_parameters342:
LH	R3, 8(SP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_gcode_parameters344
NOP	
J	L_report_gcode_parameters119
NOP	
L__report_gcode_parameters344:
LH	R3, 8(SP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_gcode_parameters346
NOP	
J	L_report_gcode_parameters120
NOP	
L__report_gcode_parameters346:
LH	R3, 8(SP)
ORI	R2, R0, 8
BNE	R3, R2, L__report_gcode_parameters348
NOP	
J	L_report_gcode_parameters121
NOP	
L__report_gcode_parameters348:
L_report_gcode_parameters113:
;Print.c,285 :: 		for (i=0; i<NoOfAxis; i++) {
SH	R0, 10(SP)
L_report_gcode_parameters122:
LH	R2, 10(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__report_gcode_parameters349
NOP	
J	L_report_gcode_parameters123
NOP	
L__report_gcode_parameters349:
;Print.c,286 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters125:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters351
NOP	
J	L_report_gcode_parameters126
NOP	
L__report_gcode_parameters351:
J	L_report_gcode_parameters125
NOP	
L_report_gcode_parameters126:
;Print.c,287 :: 		if (bit_istrue(settings.flags,FLAG_REPORT_INCHES)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L__report_gcode_parameters353
NOP	
J	L_report_gcode_parameters127
NOP	
L__report_gcode_parameters353:
;Print.c,288 :: 		dma_printf("%f ",coord_system[coord_select].coord[i]*INCH_PER_MM);
LH	R2, 8(SP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LH	R2, 10(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S1, 0(R2)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ORI	R30, R0, 37
SB	R30, 47(SP)
ORI	R30, R0, 102
SB	R30, 48(SP)
ORI	R30, R0, 32
SB	R30, 49(SP)
MOVZ	R30, R0, R0
SB	R30, 50(SP)
ADDIU	R2, SP, 47
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,289 :: 		}else {
J	L_report_gcode_parameters128
NOP	
L_report_gcode_parameters127:
;Print.c,290 :: 		dma_printf("%f ",coord_system[coord_select].coord[i]);
LH	R2, 8(SP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LH	R2, 10(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
ORI	R30, R0, 37
SB	R30, 51(SP)
ORI	R30, R0, 102
SB	R30, 52(SP)
ORI	R30, R0, 32
SB	R30, 53(SP)
MOVZ	R30, R0, R0
SB	R30, 54(SP)
ADDIU	R2, SP, 51
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,291 :: 		}
L_report_gcode_parameters128:
;Print.c,292 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters129:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters355
NOP	
J	L_report_gcode_parameters130
NOP	
L__report_gcode_parameters355:
J	L_report_gcode_parameters129
NOP	
L_report_gcode_parameters130:
;Print.c,293 :: 		if (i < (NoOfAxis-1)) {
LH	R2, 10(SP)
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters356
NOP	
J	L_report_gcode_parameters131
NOP	
L__report_gcode_parameters356:
;Print.c,294 :: 		dma_printf(",");
ORI	R30, R0, 44
SB	R30, 55(SP)
MOVZ	R30, R0, R0
SB	R30, 56(SP)
ADDIU	R2, SP, 55
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,295 :: 		}else {
J	L_report_gcode_parameters132
NOP	
L_report_gcode_parameters131:
;Print.c,296 :: 		dma_printf("]\r\n");
ORI	R30, R0, 93
SB	R30, 57(SP)
ORI	R30, R0, 13
SB	R30, 58(SP)
ORI	R30, R0, 10
SB	R30, 59(SP)
MOVZ	R30, R0, R0
SB	R30, 60(SP)
ADDIU	R2, SP, 57
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,297 :: 		}
L_report_gcode_parameters132:
;Print.c,285 :: 		for (i=0; i<NoOfAxis; i++) {
LH	R2, 10(SP)
ADDIU	R2, R2, 1
SH	R2, 10(SP)
;Print.c,298 :: 		}
J	L_report_gcode_parameters122
NOP	
L_report_gcode_parameters123:
;Print.c,270 :: 		for (coord_select = 1; coord_select <= SETTING_INDEX_NCOORD; coord_select++){
LH	R2, 8(SP)
ADDIU	R2, R2, 1
SH	R2, 8(SP)
;Print.c,299 :: 		}
J	L_report_gcode_parameters105
NOP	
L_report_gcode_parameters106:
;Print.c,300 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters133:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters358
NOP	
J	L_report_gcode_parameters134
NOP	
L__report_gcode_parameters358:
J	L_report_gcode_parameters133
NOP	
L_report_gcode_parameters134:
;Print.c,301 :: 		dma_printf("[G92:"); // Print G92,G92.1 which are not persistent in memory
ORI	R30, R0, 91
SB	R30, 61(SP)
ORI	R30, R0, 71
SB	R30, 62(SP)
ORI	R30, R0, 57
SB	R30, 63(SP)
ORI	R30, R0, 50
SB	R30, 64(SP)
ORI	R30, R0, 58
SB	R30, 65(SP)
MOVZ	R30, R0, R0
SB	R30, 66(SP)
ADDIU	R2, SP, 61
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,302 :: 		for (i=0; i<NoOfAxis; i++) {
SH	R0, 10(SP)
L_report_gcode_parameters135:
LH	R2, 10(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__report_gcode_parameters359
NOP	
J	L_report_gcode_parameters136
NOP	
L__report_gcode_parameters359:
;Print.c,303 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters138:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters361
NOP	
J	L_report_gcode_parameters139
NOP	
L__report_gcode_parameters361:
J	L_report_gcode_parameters138
NOP	
L_report_gcode_parameters139:
;Print.c,304 :: 		if (bit_istrue(settings.flags,FLAG_REPORT_INCHES)){
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 65535
BNE	R2, R0, L__report_gcode_parameters363
NOP	
J	L_report_gcode_parameters140
NOP	
L__report_gcode_parameters363:
;Print.c,305 :: 		dma_printf("%f ",gc.coord_offset[i]*INCH_PER_MM);
LH	R2, 10(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ORI	R30, R0, 37
SB	R30, 67(SP)
ORI	R30, R0, 102
SB	R30, 68(SP)
ORI	R30, R0, 32
SB	R30, 69(SP)
MOVZ	R30, R0, R0
SB	R30, 70(SP)
ADDIU	R2, SP, 67
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,306 :: 		}else {
J	L_report_gcode_parameters141
NOP	
L_report_gcode_parameters140:
;Print.c,307 :: 		dma_printf("%f ",gc.coord_offset[i]);
LH	R2, 10(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
ORI	R30, R0, 37
SB	R30, 71(SP)
ORI	R30, R0, 102
SB	R30, 72(SP)
ORI	R30, R0, 32
SB	R30, 73(SP)
MOVZ	R30, R0, R0
SB	R30, 74(SP)
ADDIU	R2, SP, 71
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,308 :: 		}
L_report_gcode_parameters141:
;Print.c,309 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters142:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters365
NOP	
J	L_report_gcode_parameters143
NOP	
L__report_gcode_parameters365:
J	L_report_gcode_parameters142
NOP	
L_report_gcode_parameters143:
;Print.c,310 :: 		if (i < (NoOfAxis-1)) {
LH	R2, 10(SP)
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters366
NOP	
J	L_report_gcode_parameters144
NOP	
L__report_gcode_parameters366:
;Print.c,311 :: 		dma_printf(",");
ORI	R30, R0, 44
SB	R30, 75(SP)
MOVZ	R30, R0, R0
SB	R30, 76(SP)
ADDIU	R2, SP, 75
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,312 :: 		}else {
J	L_report_gcode_parameters145
NOP	
L_report_gcode_parameters144:
;Print.c,313 :: 		dma_printf("]\r\n"); }
ORI	R30, R0, 93
SB	R30, 77(SP)
ORI	R30, R0, 13
SB	R30, 78(SP)
ORI	R30, R0, 10
SB	R30, 79(SP)
MOVZ	R30, R0, R0
SB	R30, 80(SP)
ADDIU	R2, SP, 77
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_parameters145:
;Print.c,302 :: 		for (i=0; i<NoOfAxis; i++) {
LH	R2, 10(SP)
ADDIU	R2, R2, 1
SH	R2, 10(SP)
;Print.c,314 :: 		}
J	L_report_gcode_parameters135
NOP	
L_report_gcode_parameters136:
;Print.c,315 :: 		}
L_end_report_gcode_parameters:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _report_gcode_parameters
_report_gcode_modes:
;Print.c,318 :: 		void report_gcode_modes(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Print.c,319 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_gcode_modes146:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes369
NOP	
J	L_report_gcode_modes147
NOP	
L__report_gcode_modes369:
J	L_report_gcode_modes146
NOP	
L_report_gcode_modes147:
;Print.c,320 :: 		switch (gc.motion_mode) {
J	L_report_gcode_modes148
NOP	
;Print.c,321 :: 		case MOTION_MODE_SEEK :    dma_printf("[G0"); break;
L_report_gcode_modes150:
ORI	R30, R0, 91
SB	R30, 8(SP)
ORI	R30, R0, 71
SB	R30, 9(SP)
ORI	R30, R0, 48
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 8
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes149
NOP	
;Print.c,322 :: 		case MOTION_MODE_LINEAR :  dma_printf("[G1"); break;
L_report_gcode_modes151:
ORI	R30, R0, 91
SB	R30, 12(SP)
ORI	R30, R0, 71
SB	R30, 13(SP)
ORI	R30, R0, 49
SB	R30, 14(SP)
MOVZ	R30, R0, R0
SB	R30, 15(SP)
ADDIU	R2, SP, 12
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes149
NOP	
;Print.c,323 :: 		case MOTION_MODE_CW_ARC :  dma_printf("[G2"); break;
L_report_gcode_modes152:
ORI	R30, R0, 91
SB	R30, 16(SP)
ORI	R30, R0, 71
SB	R30, 17(SP)
ORI	R30, R0, 50
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 16
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes149
NOP	
;Print.c,324 :: 		case MOTION_MODE_CCW_ARC : dma_printf("[G3"); break;
L_report_gcode_modes153:
ORI	R30, R0, 91
SB	R30, 20(SP)
ORI	R30, R0, 71
SB	R30, 21(SP)
ORI	R30, R0, 51
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 20
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes149
NOP	
;Print.c,325 :: 		case MOTION_MODE_CANCEL :  dma_printf("[G80"); break;
L_report_gcode_modes154:
ORI	R30, R0, 91
SB	R30, 24(SP)
ORI	R30, R0, 71
SB	R30, 25(SP)
ORI	R30, R0, 56
SB	R30, 26(SP)
ORI	R30, R0, 48
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R2, SP, 24
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes149
NOP	
;Print.c,326 :: 		}
L_report_gcode_modes148:
LBU	R2, Offset(_gc+8)(GP)
BNE	R2, R0, L__report_gcode_modes371
NOP	
J	L_report_gcode_modes150
NOP	
L__report_gcode_modes371:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes373
NOP	
J	L_report_gcode_modes151
NOP	
L__report_gcode_modes373:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes375
NOP	
J	L_report_gcode_modes152
NOP	
L__report_gcode_modes375:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_modes377
NOP	
J	L_report_gcode_modes153
NOP	
L__report_gcode_modes377:
LBU	R3, Offset(_gc+8)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_modes379
NOP	
J	L_report_gcode_modes154
NOP	
L__report_gcode_modes379:
L_report_gcode_modes149:
;Print.c,327 :: 		while(DMA_IsOn(1));
L_report_gcode_modes155:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes381
NOP	
J	L_report_gcode_modes156
NOP	
L__report_gcode_modes381:
J	L_report_gcode_modes155
NOP	
L_report_gcode_modes156:
;Print.c,328 :: 		dma_printf(" G%d",gc.coord_select+54);
LH	R2, Offset(_gc+14)(GP)
ADDIU	R3, R2, 54
ORI	R30, R0, 32
SB	R30, 29(SP)
ORI	R30, R0, 71
SB	R30, 30(SP)
ORI	R30, R0, 37
SB	R30, 31(SP)
ORI	R30, R0, 100
SB	R30, 32(SP)
MOVZ	R30, R0, R0
SB	R30, 33(SP)
ADDIU	R2, SP, 29
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,329 :: 		while(DMA_IsOn(1));
L_report_gcode_modes157:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes383
NOP	
J	L_report_gcode_modes158
NOP	
L__report_gcode_modes383:
J	L_report_gcode_modes157
NOP	
L_report_gcode_modes158:
;Print.c,330 :: 		if (gc.plane_axis_0 == X) {
LBU	R2, Offset(_gc+11)(GP)
BEQ	R2, R0, L__report_gcode_modes384
NOP	
J	L_report_gcode_modes159
NOP	
L__report_gcode_modes384:
;Print.c,331 :: 		if (gc.plane_axis_1 == Y) { dma_printf(" G17"); }
LBU	R3, Offset(_gc+12)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__report_gcode_modes385
NOP	
J	L_report_gcode_modes160
NOP	
L__report_gcode_modes385:
ORI	R30, R0, 32
SB	R30, 34(SP)
ORI	R30, R0, 71
SB	R30, 35(SP)
ORI	R30, R0, 49
SB	R30, 36(SP)
ORI	R30, R0, 55
SB	R30, 37(SP)
MOVZ	R30, R0, R0
SB	R30, 38(SP)
ADDIU	R2, SP, 34
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes161
NOP	
L_report_gcode_modes160:
;Print.c,332 :: 		else { dma_printf(" G18"); }
ORI	R30, R0, 32
SB	R30, 39(SP)
ORI	R30, R0, 71
SB	R30, 40(SP)
ORI	R30, R0, 49
SB	R30, 41(SP)
ORI	R30, R0, 56
SB	R30, 42(SP)
MOVZ	R30, R0, R0
SB	R30, 43(SP)
ADDIU	R2, SP, 39
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_modes161:
;Print.c,333 :: 		} else { dma_printf(" G19"); }
J	L_report_gcode_modes162
NOP	
L_report_gcode_modes159:
ORI	R30, R0, 32
SB	R30, 44(SP)
ORI	R30, R0, 71
SB	R30, 45(SP)
ORI	R30, R0, 49
SB	R30, 46(SP)
ORI	R30, R0, 57
SB	R30, 47(SP)
MOVZ	R30, R0, R0
SB	R30, 48(SP)
ADDIU	R2, SP, 44
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_modes162:
;Print.c,334 :: 		while(DMA_IsOn(1));
L_report_gcode_modes163:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes387
NOP	
J	L_report_gcode_modes164
NOP	
L__report_gcode_modes387:
J	L_report_gcode_modes163
NOP	
L_report_gcode_modes164:
;Print.c,335 :: 		if (gc.inches_mode) { dma_printf(" G20"); }
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes389
NOP	
J	L_report_gcode_modes165
NOP	
L__report_gcode_modes389:
ORI	R30, R0, 32
SB	R30, 49(SP)
ORI	R30, R0, 71
SB	R30, 50(SP)
ORI	R30, R0, 50
SB	R30, 51(SP)
ORI	R30, R0, 48
SB	R30, 52(SP)
MOVZ	R30, R0, R0
SB	R30, 53(SP)
ADDIU	R2, SP, 49
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes166
NOP	
L_report_gcode_modes165:
;Print.c,336 :: 		else { dma_printf(" G21"); }
ORI	R30, R0, 32
SB	R30, 54(SP)
ORI	R30, R0, 71
SB	R30, 55(SP)
ORI	R30, R0, 50
SB	R30, 56(SP)
ORI	R30, R0, 49
SB	R30, 57(SP)
MOVZ	R30, R0, R0
SB	R30, 58(SP)
ADDIU	R2, SP, 54
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_modes166:
;Print.c,337 :: 		while(DMA_IsOn(1));
L_report_gcode_modes167:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes391
NOP	
J	L_report_gcode_modes168
NOP	
L__report_gcode_modes391:
J	L_report_gcode_modes167
NOP	
L_report_gcode_modes168:
;Print.c,338 :: 		if (gc.absolute_mode) { dma_printf(" G90"); }
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__report_gcode_modes393
NOP	
J	L_report_gcode_modes169
NOP	
L__report_gcode_modes393:
ORI	R30, R0, 32
SB	R30, 59(SP)
ORI	R30, R0, 71
SB	R30, 60(SP)
ORI	R30, R0, 57
SB	R30, 61(SP)
ORI	R30, R0, 48
SB	R30, 62(SP)
MOVZ	R30, R0, R0
SB	R30, 63(SP)
ADDIU	R2, SP, 59
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes170
NOP	
L_report_gcode_modes169:
;Print.c,339 :: 		else { dma_printf(" G91"); }
ORI	R30, R0, 32
SB	R30, 64(SP)
ORI	R30, R0, 71
SB	R30, 65(SP)
ORI	R30, R0, 57
SB	R30, 66(SP)
ORI	R30, R0, 49
SB	R30, 67(SP)
MOVZ	R30, R0, R0
SB	R30, 68(SP)
ADDIU	R2, SP, 64
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_modes170:
;Print.c,340 :: 		while(DMA_IsOn(1));
L_report_gcode_modes171:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes395
NOP	
J	L_report_gcode_modes172
NOP	
L__report_gcode_modes395:
J	L_report_gcode_modes171
NOP	
L_report_gcode_modes172:
;Print.c,341 :: 		if (gc.inverse_feed_rate_mode) { dma_printf(" G93"); }
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__report_gcode_modes397
NOP	
J	L_report_gcode_modes173
NOP	
L__report_gcode_modes397:
ORI	R30, R0, 32
SB	R30, 69(SP)
ORI	R30, R0, 71
SB	R30, 70(SP)
ORI	R30, R0, 57
SB	R30, 71(SP)
ORI	R30, R0, 51
SB	R30, 72(SP)
MOVZ	R30, R0, R0
SB	R30, 73(SP)
ADDIU	R2, SP, 69
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes174
NOP	
L_report_gcode_modes173:
;Print.c,342 :: 		else { dma_printf(" G94"); }
ORI	R30, R0, 32
SB	R30, 74(SP)
ORI	R30, R0, 71
SB	R30, 75(SP)
ORI	R30, R0, 57
SB	R30, 76(SP)
ORI	R30, R0, 52
SB	R30, 77(SP)
MOVZ	R30, R0, R0
SB	R30, 78(SP)
ADDIU	R2, SP, 74
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_modes174:
;Print.c,344 :: 		while(DMA_IsOn(1));
L_report_gcode_modes175:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes399
NOP	
J	L_report_gcode_modes176
NOP	
L__report_gcode_modes399:
J	L_report_gcode_modes175
NOP	
L_report_gcode_modes176:
;Print.c,345 :: 		switch (gc.program_flow) {
J	L_report_gcode_modes177
NOP	
;Print.c,346 :: 		case PROGRAM_FLOW_RUNNING : dma_printf(" M0"); break;
L_report_gcode_modes179:
ORI	R30, R0, 32
SB	R30, 79(SP)
ORI	R30, R0, 77
SB	R30, 80(SP)
ORI	R30, R0, 48
SB	R30, 81(SP)
MOVZ	R30, R0, R0
SB	R30, 82(SP)
ADDIU	R2, SP, 79
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes178
NOP	
;Print.c,347 :: 		case PROGRAM_FLOW_PAUSED :  dma_printf(" M1"); break;
L_report_gcode_modes180:
ORI	R30, R0, 32
SB	R30, 83(SP)
ORI	R30, R0, 77
SB	R30, 84(SP)
ORI	R30, R0, 49
SB	R30, 85(SP)
MOVZ	R30, R0, R0
SB	R30, 86(SP)
ADDIU	R2, SP, 83
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes178
NOP	
;Print.c,348 :: 		case PROGRAM_FLOW_COMPLETED : dma_printf(" M2"); break;
L_report_gcode_modes181:
ORI	R30, R0, 32
SB	R30, 87(SP)
ORI	R30, R0, 77
SB	R30, 88(SP)
ORI	R30, R0, 50
SB	R30, 89(SP)
MOVZ	R30, R0, R0
SB	R30, 90(SP)
ADDIU	R2, SP, 87
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes178
NOP	
;Print.c,349 :: 		}
L_report_gcode_modes177:
LBU	R2, Offset(_gc+9)(GP)
BNE	R2, R0, L__report_gcode_modes401
NOP	
J	L_report_gcode_modes179
NOP	
L__report_gcode_modes401:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes403
NOP	
J	L_report_gcode_modes180
NOP	
L__report_gcode_modes403:
LBU	R3, Offset(_gc+9)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes405
NOP	
J	L_report_gcode_modes181
NOP	
L__report_gcode_modes405:
L_report_gcode_modes178:
;Print.c,350 :: 		while(DMA_IsOn(1));
L_report_gcode_modes182:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes407
NOP	
J	L_report_gcode_modes183
NOP	
L__report_gcode_modes407:
J	L_report_gcode_modes182
NOP	
L_report_gcode_modes183:
;Print.c,351 :: 		switch (gc.spindle_direction) {
J	L_report_gcode_modes184
NOP	
;Print.c,352 :: 		case 1 : dma_printf(" M3"); break;
L_report_gcode_modes186:
ORI	R30, R0, 32
SB	R30, 91(SP)
ORI	R30, R0, 77
SB	R30, 92(SP)
ORI	R30, R0, 51
SB	R30, 93(SP)
MOVZ	R30, R0, R0
SB	R30, 94(SP)
ADDIU	R2, SP, 91
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes185
NOP	
;Print.c,353 :: 		case -1 : dma_printf(" M4"); break;
L_report_gcode_modes187:
ORI	R30, R0, 32
SB	R30, 95(SP)
ORI	R30, R0, 77
SB	R30, 96(SP)
ORI	R30, R0, 52
SB	R30, 97(SP)
MOVZ	R30, R0, R0
SB	R30, 98(SP)
ADDIU	R2, SP, 95
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes185
NOP	
;Print.c,354 :: 		case 0 : dma_printf(" M5"); break;
L_report_gcode_modes188:
ORI	R30, R0, 32
SB	R30, 99(SP)
ORI	R30, R0, 77
SB	R30, 100(SP)
ORI	R30, R0, 53
SB	R30, 101(SP)
MOVZ	R30, R0, R0
SB	R30, 102(SP)
ADDIU	R2, SP, 99
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_modes185
NOP	
;Print.c,355 :: 		}
L_report_gcode_modes184:
LBU	R3, Offset(_gc+6)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes409
NOP	
J	L_report_gcode_modes186
NOP	
L__report_gcode_modes409:
LBU	R3, Offset(_gc+6)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_gcode_modes411
NOP	
J	L_report_gcode_modes187
NOP	
L__report_gcode_modes411:
LBU	R2, Offset(_gc+6)(GP)
BNE	R2, R0, L__report_gcode_modes413
NOP	
J	L_report_gcode_modes188
NOP	
L__report_gcode_modes413:
L_report_gcode_modes185:
;Print.c,356 :: 		while(DMA_IsOn(1));
L_report_gcode_modes189:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes415
NOP	
J	L_report_gcode_modes190
NOP	
L__report_gcode_modes415:
J	L_report_gcode_modes189
NOP	
L_report_gcode_modes190:
;Print.c,363 :: 		}
L_report_gcode_modes191:
;Print.c,364 :: 		while(DMA_IsOn(1));
L_report_gcode_modes193:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes417
NOP	
J	L_report_gcode_modes194
NOP	
L__report_gcode_modes417:
J	L_report_gcode_modes193
NOP	
L_report_gcode_modes194:
;Print.c,365 :: 		if (gc.inches_mode)
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes419
NOP	
J	L_report_gcode_modes195
NOP	
L__report_gcode_modes419:
;Print.c,366 :: 		dma_printf(" T %dF %f",gc.tool,gc.feed_rate*INCH_PER_MM);
LWC1	S1, Offset(_gc+24)(GP)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ADDIU	R23, SP, 103
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr108_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr108_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 103
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LBU	R2, Offset(_gc+10)(GP)
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
J	L_report_gcode_modes196
NOP	
L_report_gcode_modes195:
;Print.c,368 :: 		dma_printf(" T %dF %f]\r\n",gc.tool,gc.feed_rate);
ADDIU	R23, SP, 113
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr109_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr109_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 113
LW	R2, Offset(_gc+24)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LBU	R2, Offset(_gc+10)(GP)
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
L_report_gcode_modes196:
;Print.c,371 :: 		}
L_end_report_gcode_modes:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 128
JR	RA
NOP	
; end of _report_gcode_modes
