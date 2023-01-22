_report_status_message:
;Print.c,9 :: 		void report_status_message(int status_code){
ADDIU	SP, SP, -60
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
;Print.c,14 :: 		while(DMA_IsOn(1));
L_report_status_message4:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message202
NOP	
J	L_report_status_message5
NOP	
L__report_status_message202:
J	L_report_status_message4
NOP	
L_report_status_message5:
;Print.c,15 :: 		dma_printf("%s","error: ");
ORI	R30, R0, 37
SB	R30, 9(SP)
ORI	R30, R0, 115
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
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
;Print.c,16 :: 		switch(status_code) {
J	L_report_status_message6
NOP	
;Print.c,17 :: 		case STATUS_BAD_NUMBER_FORMAT:
L_report_status_message8:
;Print.c,18 :: 		while(DMA_IsOn(1));
L_report_status_message9:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message204
NOP	
J	L_report_status_message10
NOP	
L__report_status_message204:
J	L_report_status_message9
NOP	
L_report_status_message10:
;Print.c,19 :: 		dma_printf("%s\n","Bad number format");
ORI	R30, R0, 37
SB	R30, 12(SP)
ORI	R30, R0, 115
SB	R30, 13(SP)
ORI	R30, R0, 10
SB	R30, 14(SP)
MOVZ	R30, R0, R0
SB	R30, 15(SP)
ADDIU	R3, SP, 12
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
;Print.c,20 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,21 :: 		case STATUS_EXPECTED_COMMAND_LETTER:
L_report_status_message11:
;Print.c,22 :: 		while(DMA_IsOn(1));
L_report_status_message12:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message206
NOP	
J	L_report_status_message13
NOP	
L__report_status_message206:
J	L_report_status_message12
NOP	
L_report_status_message13:
;Print.c,23 :: 		dma_printf("%s\n","Expected command letter");
ORI	R30, R0, 37
SB	R30, 16(SP)
ORI	R30, R0, 115
SB	R30, 17(SP)
ORI	R30, R0, 10
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R3, SP, 16
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
;Print.c,24 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,25 :: 		case STATUS_UNSUPPORTED_STATEMENT:
L_report_status_message14:
;Print.c,26 :: 		while(DMA_IsOn(1));
L_report_status_message15:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message208
NOP	
J	L_report_status_message16
NOP	
L__report_status_message208:
J	L_report_status_message15
NOP	
L_report_status_message16:
;Print.c,27 :: 		dma_printf("%s\n","Unsupported statement");
ORI	R30, R0, 37
SB	R30, 20(SP)
ORI	R30, R0, 115
SB	R30, 21(SP)
ORI	R30, R0, 10
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R3, SP, 20
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
;Print.c,28 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,29 :: 		case STATUS_ARC_RADIUS_ERROR:
L_report_status_message17:
;Print.c,30 :: 		while(DMA_IsOn(1));
L_report_status_message18:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message210
NOP	
J	L_report_status_message19
NOP	
L__report_status_message210:
J	L_report_status_message18
NOP	
L_report_status_message19:
;Print.c,31 :: 		dma_printf("%s\n","Invalid radius");
ORI	R30, R0, 37
SB	R30, 24(SP)
ORI	R30, R0, 115
SB	R30, 25(SP)
ORI	R30, R0, 10
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R3, SP, 24
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
;Print.c,32 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,33 :: 		case STATUS_MODAL_GROUP_VIOLATION:
L_report_status_message20:
;Print.c,34 :: 		while(DMA_IsOn(1));
L_report_status_message21:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message212
NOP	
J	L_report_status_message22
NOP	
L__report_status_message212:
J	L_report_status_message21
NOP	
L_report_status_message22:
;Print.c,35 :: 		dma_printf("%s\n","Modal group violation");
ORI	R30, R0, 37
SB	R30, 28(SP)
ORI	R30, R0, 115
SB	R30, 29(SP)
ORI	R30, R0, 10
SB	R30, 30(SP)
MOVZ	R30, R0, R0
SB	R30, 31(SP)
ADDIU	R3, SP, 28
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
;Print.c,36 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,37 :: 		case STATUS_INVALID_STATEMENT:
L_report_status_message23:
;Print.c,38 :: 		while(DMA_IsOn(1));
L_report_status_message24:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message214
NOP	
J	L_report_status_message25
NOP	
L__report_status_message214:
J	L_report_status_message24
NOP	
L_report_status_message25:
;Print.c,39 :: 		dma_printf("%s\n","Invalid statement");
ORI	R30, R0, 37
SB	R30, 32(SP)
ORI	R30, R0, 115
SB	R30, 33(SP)
ORI	R30, R0, 10
SB	R30, 34(SP)
MOVZ	R30, R0, R0
SB	R30, 35(SP)
ADDIU	R3, SP, 32
LUI	R2, hi_addr(?lstr_16_Print+0)
ORI	R2, R2, lo_addr(?lstr_16_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Print.c,40 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,41 :: 		case STATUS_SETTING_DISABLED:
L_report_status_message26:
;Print.c,42 :: 		dma_printf("%s\n","Setting disabled");
ORI	R30, R0, 37
SB	R30, 36(SP)
ORI	R30, R0, 115
SB	R30, 37(SP)
ORI	R30, R0, 10
SB	R30, 38(SP)
MOVZ	R30, R0, R0
SB	R30, 39(SP)
ADDIU	R3, SP, 36
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
;Print.c,43 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,44 :: 		case STATUS_SETTING_VALUE_NEG:
L_report_status_message27:
;Print.c,45 :: 		while(DMA_IsOn(1));
L_report_status_message28:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message216
NOP	
J	L_report_status_message29
NOP	
L__report_status_message216:
J	L_report_status_message28
NOP	
L_report_status_message29:
;Print.c,46 :: 		dma_printf("%s\n","Value < 0.0");
ORI	R30, R0, 37
SB	R30, 40(SP)
ORI	R30, R0, 115
SB	R30, 41(SP)
ORI	R30, R0, 10
SB	R30, 42(SP)
MOVZ	R30, R0, R0
SB	R30, 43(SP)
ADDIU	R3, SP, 40
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
;Print.c,47 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,48 :: 		case STATUS_SETTING_STEP_PULSE_MIN:
L_report_status_message30:
;Print.c,49 :: 		while(DMA_IsOn(1));
L_report_status_message31:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message218
NOP	
J	L_report_status_message32
NOP	
L__report_status_message218:
J	L_report_status_message31
NOP	
L_report_status_message32:
;Print.c,50 :: 		dma_printf("%s\n","Value < 3 usec");
ORI	R30, R0, 37
SB	R30, 44(SP)
ORI	R30, R0, 115
SB	R30, 45(SP)
ORI	R30, R0, 10
SB	R30, 46(SP)
MOVZ	R30, R0, R0
SB	R30, 47(SP)
ADDIU	R3, SP, 44
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
;Print.c,51 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,52 :: 		case STATUS_SETTING_READ_FAIL:
L_report_status_message33:
;Print.c,53 :: 		while(DMA_IsOn(1));
L_report_status_message34:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message220
NOP	
J	L_report_status_message35
NOP	
L__report_status_message220:
J	L_report_status_message34
NOP	
L_report_status_message35:
;Print.c,54 :: 		dma_printf("%s\n","EEPROM read fail. Using defaults");
ORI	R30, R0, 37
SB	R30, 48(SP)
ORI	R30, R0, 115
SB	R30, 49(SP)
ORI	R30, R0, 10
SB	R30, 50(SP)
MOVZ	R30, R0, R0
SB	R30, 51(SP)
ADDIU	R3, SP, 48
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
;Print.c,55 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,56 :: 		case STATUS_IDLE_ERROR:
L_report_status_message36:
;Print.c,57 :: 		while(DMA_IsOn(1));
L_report_status_message37:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message222
NOP	
J	L_report_status_message38
NOP	
L__report_status_message222:
J	L_report_status_message37
NOP	
L_report_status_message38:
;Print.c,58 :: 		dma_printf("%s\n","Busy or queued");
ORI	R30, R0, 37
SB	R30, 52(SP)
ORI	R30, R0, 115
SB	R30, 53(SP)
ORI	R30, R0, 10
SB	R30, 54(SP)
MOVZ	R30, R0, R0
SB	R30, 55(SP)
ADDIU	R3, SP, 52
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
;Print.c,59 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,60 :: 		case STATUS_ALARM_LOCK:
L_report_status_message39:
;Print.c,61 :: 		while(DMA_IsOn(1));
L_report_status_message40:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_status_message224
NOP	
J	L_report_status_message41
NOP	
L__report_status_message224:
J	L_report_status_message40
NOP	
L_report_status_message41:
;Print.c,62 :: 		dma_printf("%s\n","Alarm lock");
ORI	R30, R0, 37
SB	R30, 56(SP)
ORI	R30, R0, 115
SB	R30, 57(SP)
ORI	R30, R0, 10
SB	R30, 58(SP)
MOVZ	R30, R0, R0
SB	R30, 59(SP)
ADDIU	R3, SP, 56
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
;Print.c,63 :: 		break;
J	L_report_status_message7
NOP	
;Print.c,64 :: 		}
L_report_status_message6:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_status_message226
NOP	
J	L_report_status_message8
NOP	
L__report_status_message226:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_status_message228
NOP	
J	L_report_status_message11
NOP	
L__report_status_message228:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_status_message230
NOP	
J	L_report_status_message14
NOP	
L__report_status_message230:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_status_message232
NOP	
J	L_report_status_message17
NOP	
L__report_status_message232:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_status_message234
NOP	
J	L_report_status_message20
NOP	
L__report_status_message234:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__report_status_message236
NOP	
J	L_report_status_message23
NOP	
L__report_status_message236:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__report_status_message238
NOP	
J	L_report_status_message26
NOP	
L__report_status_message238:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__report_status_message240
NOP	
J	L_report_status_message27
NOP	
L__report_status_message240:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__report_status_message242
NOP	
J	L_report_status_message30
NOP	
L__report_status_message242:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__report_status_message244
NOP	
J	L_report_status_message33
NOP	
L__report_status_message244:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__report_status_message246
NOP	
J	L_report_status_message36
NOP	
L__report_status_message246:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__report_status_message248
NOP	
J	L_report_status_message39
NOP	
L__report_status_message248:
L_report_status_message7:
;Print.c,65 :: 		}
L_report_status_message3:
;Print.c,66 :: 		}
L_end_report_status_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _report_status_message
_report_alarm_message:
;Print.c,69 :: 		void report_alarm_message(int alarm_code){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Print.c,70 :: 		while(DMA_IsOn(1));
L_report_alarm_message42:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message251
NOP	
J	L_report_alarm_message43
NOP	
L__report_alarm_message251:
J	L_report_alarm_message42
NOP	
L_report_alarm_message43:
;Print.c,71 :: 		dma_printf("%s","ALARM: ");
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 115
SB	R30, 7(SP)
MOVZ	R30, R0, R0
SB	R30, 8(SP)
ADDIU	R3, SP, 6
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
;Print.c,72 :: 		switch (alarm_code) {
J	L_report_alarm_message44
NOP	
;Print.c,73 :: 		case ALARM_HARD_LIMIT:
L_report_alarm_message46:
;Print.c,74 :: 		while(DMA_IsOn(1));
L_report_alarm_message47:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message253
NOP	
J	L_report_alarm_message48
NOP	
L__report_alarm_message253:
J	L_report_alarm_message47
NOP	
L_report_alarm_message48:
;Print.c,75 :: 		dma_printf("%s\n","Hard limit");
ORI	R30, R0, 37
SB	R30, 9(SP)
ORI	R30, R0, 115
SB	R30, 10(SP)
ORI	R30, R0, 10
SB	R30, 11(SP)
MOVZ	R30, R0, R0
SB	R30, 12(SP)
ADDIU	R3, SP, 9
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
;Print.c,76 :: 		break;
J	L_report_alarm_message45
NOP	
;Print.c,77 :: 		case ALARM_ABORT_CYCLE:
L_report_alarm_message49:
;Print.c,78 :: 		while(DMA_IsOn(1));
L_report_alarm_message50:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message255
NOP	
J	L_report_alarm_message51
NOP	
L__report_alarm_message255:
J	L_report_alarm_message50
NOP	
L_report_alarm_message51:
;Print.c,79 :: 		dma_printf("%s\n","Abort during cycle");
ORI	R30, R0, 37
SB	R30, 13(SP)
ORI	R30, R0, 115
SB	R30, 14(SP)
ORI	R30, R0, 10
SB	R30, 15(SP)
MOVZ	R30, R0, R0
SB	R30, 16(SP)
ADDIU	R3, SP, 13
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
;Print.c,80 :: 		break;
J	L_report_alarm_message45
NOP	
;Print.c,81 :: 		}
L_report_alarm_message44:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_alarm_message257
NOP	
J	L_report_alarm_message46
NOP	
L__report_alarm_message257:
SEH	R3, R25
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__report_alarm_message259
NOP	
J	L_report_alarm_message49
NOP	
L__report_alarm_message259:
L_report_alarm_message45:
;Print.c,82 :: 		while(DMA_IsOn(1));
L_report_alarm_message52:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_alarm_message261
NOP	
J	L_report_alarm_message53
NOP	
L__report_alarm_message261:
J	L_report_alarm_message52
NOP	
L_report_alarm_message53:
;Print.c,83 :: 		dma_printf("%s\n",". MPos?");
ORI	R30, R0, 37
SB	R30, 17(SP)
ORI	R30, R0, 115
SB	R30, 18(SP)
ORI	R30, R0, 10
SB	R30, 19(SP)
MOVZ	R30, R0, R0
SB	R30, 20(SP)
ADDIU	R3, SP, 17
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
;Print.c,84 :: 		Delay_ms(500); //??? Force delay to ensure message clears serial write buffer.
LUI	R24, 508
ORI	R24, R24, 41044
L_report_alarm_message54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_report_alarm_message54
NOP	
NOP	
NOP	
;Print.c,85 :: 		}
L_end_report_alarm_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _report_alarm_message
_report_feedback_message:
;Print.c,93 :: 		void report_feedback_message(int message_code){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Print.c,95 :: 		switch(message_code) {
J	L_report_feedback_message56
NOP	
;Print.c,96 :: 		case MESSAGE_CRITICAL_EVENT:
L_report_feedback_message58:
;Print.c,97 :: 		while(DMA_IsOn(1));
L_report_feedback_message59:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message264
NOP	
J	L_report_feedback_message60
NOP	
L__report_feedback_message264:
J	L_report_feedback_message59
NOP	
L_report_feedback_message60:
;Print.c,98 :: 		dma_printf("%s\n","[Reset to continue]"); break;
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 115
SB	R30, 7(SP)
ORI	R30, R0, 10
SB	R30, 8(SP)
MOVZ	R30, R0, R0
SB	R30, 9(SP)
ADDIU	R3, SP, 6
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
J	L_report_feedback_message57
NOP	
;Print.c,99 :: 		case MESSAGE_ALARM_LOCK:
L_report_feedback_message61:
;Print.c,100 :: 		while(DMA_IsOn(1));
L_report_feedback_message62:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message266
NOP	
J	L_report_feedback_message63
NOP	
L__report_feedback_message266:
J	L_report_feedback_message62
NOP	
L_report_feedback_message63:
;Print.c,101 :: 		dma_printf("%s\n","['$H'|'$X' to unlock]"); break;
ORI	R30, R0, 37
SB	R30, 10(SP)
ORI	R30, R0, 115
SB	R30, 11(SP)
ORI	R30, R0, 10
SB	R30, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 13(SP)
ADDIU	R3, SP, 10
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
J	L_report_feedback_message57
NOP	
;Print.c,102 :: 		case MESSAGE_ALARM_UNLOCK:
L_report_feedback_message64:
;Print.c,103 :: 		while(DMA_IsOn(1));
L_report_feedback_message65:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message268
NOP	
J	L_report_feedback_message66
NOP	
L__report_feedback_message268:
J	L_report_feedback_message65
NOP	
L_report_feedback_message66:
;Print.c,104 :: 		dma_printf("%s\n","[Caution: Unlocked]"); break;
ORI	R30, R0, 37
SB	R30, 14(SP)
ORI	R30, R0, 115
SB	R30, 15(SP)
ORI	R30, R0, 10
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R3, SP, 14
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
J	L_report_feedback_message57
NOP	
;Print.c,105 :: 		case MESSAGE_ENABLED:
L_report_feedback_message67:
;Print.c,106 :: 		while(DMA_IsOn(1));
L_report_feedback_message68:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message270
NOP	
J	L_report_feedback_message69
NOP	
L__report_feedback_message270:
J	L_report_feedback_message68
NOP	
L_report_feedback_message69:
;Print.c,107 :: 		dma_printf("%s\n","[Enabled]"); break;
ORI	R30, R0, 37
SB	R30, 18(SP)
ORI	R30, R0, 115
SB	R30, 19(SP)
ORI	R30, R0, 10
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R3, SP, 18
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
J	L_report_feedback_message57
NOP	
;Print.c,108 :: 		case MESSAGE_DISABLED:
L_report_feedback_message70:
;Print.c,109 :: 		while(DMA_IsOn(1));
L_report_feedback_message71:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__report_feedback_message272
NOP	
J	L_report_feedback_message72
NOP	
L__report_feedback_message272:
J	L_report_feedback_message71
NOP	
L_report_feedback_message72:
;Print.c,110 :: 		dma_printf("%s\n","[Disabled]"); break;
ORI	R30, R0, 37
SB	R30, 22(SP)
ORI	R30, R0, 115
SB	R30, 23(SP)
ORI	R30, R0, 10
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R3, SP, 22
LUI	R2, hi_addr(?lstr_46_Print+0)
ORI	R2, R2, lo_addr(?lstr_46_Print+0)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
J	L_report_feedback_message57
NOP	
;Print.c,111 :: 		}
L_report_feedback_message56:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__report_feedback_message274
NOP	
J	L_report_feedback_message58
NOP	
L__report_feedback_message274:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__report_feedback_message276
NOP	
J	L_report_feedback_message61
NOP	
L__report_feedback_message276:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__report_feedback_message278
NOP	
J	L_report_feedback_message64
NOP	
L__report_feedback_message278:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__report_feedback_message280
NOP	
J	L_report_feedback_message67
NOP	
L__report_feedback_message280:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__report_feedback_message282
NOP	
J	L_report_feedback_message70
NOP	
L__report_feedback_message282:
L_report_feedback_message57:
;Print.c,112 :: 		}
L_end_report_feedback_message:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _report_feedback_message
_report_init_message:
;Print.c,115 :: 		void report_init_message(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Print.c,116 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_init_message73:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_init_message285
NOP	
J	L_report_init_message74
NOP	
L__report_init_message285:
J	L_report_init_message73
NOP	
L_report_init_message74:
;Print.c,117 :: 		dma_printf("%s%s%s\n","Grbl ", GRBL_VERSION ,"['$' for help]");
ADDIU	R23, SP, 8
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr47_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LUI	R2, hi_addr(?lstr_50_Print+0)
ORI	R2, R2, lo_addr(?lstr_50_Print+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(?lstr_49_Print+0)
ORI	R2, R2, lo_addr(?lstr_49_Print+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_48_Print+0)
ORI	R2, R2, lo_addr(?lstr_48_Print+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,118 :: 		}
L_end_report_init_message:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _report_init_message
_report_grbl_help:
;Print.c,121 :: 		void report_grbl_help() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Print.c,122 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_grbl_help75:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_grbl_help288
NOP	
J	L_report_grbl_help76
NOP	
L__report_grbl_help288:
J	L_report_grbl_help75
NOP	
L_report_grbl_help76:
;Print.c,135 :: 		ctrl-x (reset Grbl)\n");
ORI	R30, R0, 37
SB	R30, 8(SP)
ORI	R30, R0, 115
SB	R30, 9(SP)
MOVZ	R30, R0, R0
SB	R30, 10(SP)
ADDIU	R3, SP, 8
LUI	R2, hi_addr(?lstr_52_Print+0)
ORI	R2, R2, lo_addr(?lstr_52_Print+0)
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
ADDIU	SP, SP, -1068
SW	RA, 0(SP)
;Print.c,142 :: 		acc /=(60*60);
SW	R25, 4(SP)
LWC1	S1, Offset(_settings+44)(GP)
LUI	R2, 17761
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
; acc start address is: 8 (R2)
MOV.S 	S1, S0
; acc end address is: 8 (R2)
MOV.S 	S16, S1
;Print.c,143 :: 		while(DMA_IsOn(1));
L_report_grbl_settings77:
; acc start address is: 128 (R32)
SWC1	S16, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S16, 8(SP)
BNE	R2, R0, L__report_grbl_settings291
NOP	
J	L_report_grbl_settings78
NOP	
L__report_grbl_settings291:
J	L_report_grbl_settings77
NOP	
L_report_grbl_settings78:
;Print.c,186 :: 		,bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
XORI	R6, R2, 0
SLTU	R6, R0, R6
;Print.c,185 :: 		,bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
XORI	R5, R2, 0
SLTU	R5, R0, R5
;Print.c,184 :: 		,bit_istrue(settings.flags,BITFLAG_AUTO_START)
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 2
SEH	R2, R2
XORI	R4, R2, 0
SLTU	R4, R0, R4
;Print.c,166 :: 		$22=   %d (step port invert mask, int:)\n"
ADDIU	R23, SP, 12
ADDIU	R22, R23, 1055
LUI	R24, hi_addr(?ICS?lstr53_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 12
;Print.c,189 :: 		,settings.invert_mask);
LH	R2, Offset(_settings+70)(GP)
ADDIU	SP, SP, -96
SH	R2, 92(SP)
;Print.c,188 :: 		,settings.homing_dir_mask
LH	R2, Offset(_settings+68)(GP)
SH	R2, 88(SP)
;Print.c,187 :: 		,settings.homing_dir_mask
LH	R2, Offset(_settings+68)(GP)
SH	R2, 84(SP)
;Print.c,186 :: 		,bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)
SW	R6, 80(SP)
;Print.c,185 :: 		,bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE)
SW	R5, 76(SP)
;Print.c,184 :: 		,bit_istrue(settings.flags,BITFLAG_AUTO_START)
SW	R4, 72(SP)
;Print.c,183 :: 		,settings.homing_pulloff
LW	R2, Offset(_settings+36)(GP)
SW	R2, 68(SP)
;Print.c,182 :: 		,settings.homing_seek_rate
LW	R2, Offset(_settings+32)(GP)
SW	R2, 64(SP)
;Print.c,181 :: 		,settings.homing_feed_rate
LW	R2, Offset(_settings+28)(GP)
SW	R2, 60(SP)
;Print.c,180 :: 		,settings.mm_per_arc_segment
LW	R2, Offset(_settings+40)(GP)
SW	R2, 56(SP)
;Print.c,179 :: 		,settings.junction_deviation
LW	R2, Offset(_settings+48)(GP)
SW	R2, 52(SP)
;Print.c,178 :: 		,acc
SWC1	S16, 48(SP)
; acc end address is: 128 (R32)
;Print.c,177 :: 		,settings.default_seek_rate
LW	R2, Offset(_settings+24)(GP)
SW	R2, 44(SP)
;Print.c,176 :: 		,settings.default_feed_rate
LW	R2, Offset(_settings+20)(GP)
SW	R2, 40(SP)
;Print.c,175 :: 		,settings.homing_debounce_delay
LH	R2, Offset(_settings+58)(GP)
SH	R2, 36(SP)
;Print.c,174 :: 		,settings.step_idle_delay
LH	R2, Offset(_settings+56)(GP)
SH	R2, 32(SP)
;Print.c,173 :: 		,settings.homing_dir_mask
LH	R2, Offset(_settings+68)(GP)
SH	R2, 28(SP)
;Print.c,172 :: 		,settings.flags
LH	R2, Offset(_settings+54)(GP)
SH	R2, 24(SP)
;Print.c,171 :: 		,settings.decimal_places
LH	R2, Offset(_settings+66)(GP)
SH	R2, 20(SP)
;Print.c,170 :: 		,settings.n_arc_correction
LH	R2, Offset(_settings+52)(GP)
SH	R2, 16(SP)
;Print.c,169 :: 		,settings.steps_per_mm[Z]
LW	R2, Offset(_settings+12)(GP)
SW	R2, 12(SP)
;Print.c,168 :: 		,settings.steps_per_mm[Y]
LW	R2, Offset(_settings+8)(GP)
SW	R2, 8(SP)
;Print.c,167 :: 		,settings.steps_per_mm[X]
LW	R2, Offset(_settings+4)(GP)
SW	R2, 4(SP)
;Print.c,166 :: 		$22=   %d (step port invert mask, int:)\n"
SW	R3, 0(SP)
;Print.c,189 :: 		,settings.invert_mask);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 96
;Print.c,190 :: 		}
L_end_report_grbl_settings:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 1068
JR	RA
NOP	
; end of _report_grbl_settings
_report_startup_line:
;Print.c,194 :: 		void report_startup_line(int n, char *line)
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Print.c,196 :: 		while(DMA_IsOn(1));
L_report_startup_line79:
SW	R26, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__report_startup_line297
NOP	
J	L_report_startup_line80
NOP	
L__report_startup_line297:
J	L_report_startup_line79
NOP	
L_report_startup_line80:
;Print.c,197 :: 		dma_printf("$N= %d %s\n",n,line);
ADDIU	R23, SP, 10
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr54_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Print+0)
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
;Print.c,199 :: 		}
L_end_report_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _report_startup_line
_report_realtime_status:
;Print.c,206 :: 		void report_realtime_status(){
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;Print.c,214 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
L_report_realtime_status81:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status300
NOP	
J	L_report_realtime_status82
NOP	
L__report_realtime_status300:
J	L_report_realtime_status81
NOP	
L_report_realtime_status82:
;Print.c,216 :: 		memcpy(current_position,sys.position,sizeof(sys.position));
ADDIU	R2, SP, 16
ORI	R27, R0, 16
LUI	R26, hi_addr(_sys+8)
ORI	R26, R26, lo_addr(_sys+8)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Print.c,219 :: 		switch (sys.state) {
J	L_report_realtime_status83
NOP	
;Print.c,220 :: 		case STATE_IDLE:       dma_printf("%s","<Idle"); break;
L_report_realtime_status85:
ORI	R30, R0, 37
SB	R30, 40(SP)
ORI	R30, R0, 115
SB	R30, 41(SP)
MOVZ	R30, R0, R0
SB	R30, 42(SP)
ADDIU	R3, SP, 40
LUI	R2, hi_addr(?lstr_56_Print+0)
ORI	R2, R2, lo_addr(?lstr_56_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,222 :: 		case STATE_QUEUED:     dma_printf("%s","<Queue"); break;
L_report_realtime_status86:
ORI	R30, R0, 37
SB	R30, 43(SP)
ORI	R30, R0, 115
SB	R30, 44(SP)
MOVZ	R30, R0, R0
SB	R30, 45(SP)
ADDIU	R3, SP, 43
LUI	R2, hi_addr(?lstr_58_Print+0)
ORI	R2, R2, lo_addr(?lstr_58_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,223 :: 		case STATE_CYCLE:      dma_printf("%s","<Run"); break;
L_report_realtime_status87:
ORI	R30, R0, 37
SB	R30, 46(SP)
ORI	R30, R0, 115
SB	R30, 47(SP)
MOVZ	R30, R0, R0
SB	R30, 48(SP)
ADDIU	R3, SP, 46
LUI	R2, hi_addr(?lstr_60_Print+0)
ORI	R2, R2, lo_addr(?lstr_60_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,224 :: 		case STATE_HOLD:       dma_printf("%s","<Hold"); break;
L_report_realtime_status88:
ORI	R30, R0, 37
SB	R30, 49(SP)
ORI	R30, R0, 115
SB	R30, 50(SP)
MOVZ	R30, R0, R0
SB	R30, 51(SP)
ADDIU	R3, SP, 49
LUI	R2, hi_addr(?lstr_62_Print+0)
ORI	R2, R2, lo_addr(?lstr_62_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,225 :: 		case STATE_HOMING:     dma_printf("%s","<Home"); break;
L_report_realtime_status89:
ORI	R30, R0, 37
SB	R30, 52(SP)
ORI	R30, R0, 115
SB	R30, 53(SP)
MOVZ	R30, R0, R0
SB	R30, 54(SP)
ADDIU	R3, SP, 52
LUI	R2, hi_addr(?lstr_64_Print+0)
ORI	R2, R2, lo_addr(?lstr_64_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,226 :: 		case STATE_ALARM:      dma_printf("%s","<Alarm"); break;
L_report_realtime_status90:
ORI	R30, R0, 37
SB	R30, 55(SP)
ORI	R30, R0, 115
SB	R30, 56(SP)
MOVZ	R30, R0, R0
SB	R30, 57(SP)
ADDIU	R3, SP, 55
LUI	R2, hi_addr(?lstr_66_Print+0)
ORI	R2, R2, lo_addr(?lstr_66_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,227 :: 		case STATE_CHECK_MODE: dma_printf("%s","<Check"); break;
L_report_realtime_status91:
ORI	R30, R0, 37
SB	R30, 58(SP)
ORI	R30, R0, 115
SB	R30, 59(SP)
MOVZ	R30, R0, R0
SB	R30, 60(SP)
ADDIU	R3, SP, 58
LUI	R2, hi_addr(?lstr_68_Print+0)
ORI	R2, R2, lo_addr(?lstr_68_Print+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
J	L_report_realtime_status84
NOP	
;Print.c,228 :: 		}
L_report_realtime_status83:
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__report_realtime_status302
NOP	
J	L_report_realtime_status85
NOP	
L__report_realtime_status302:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_realtime_status304
NOP	
J	L_report_realtime_status86
NOP	
L__report_realtime_status304:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_realtime_status306
NOP	
J	L_report_realtime_status87
NOP	
L__report_realtime_status306:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_realtime_status308
NOP	
J	L_report_realtime_status88
NOP	
L__report_realtime_status308:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_realtime_status310
NOP	
J	L_report_realtime_status89
NOP	
L__report_realtime_status310:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_realtime_status312
NOP	
J	L_report_realtime_status90
NOP	
L__report_realtime_status312:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_realtime_status314
NOP	
J	L_report_realtime_status91
NOP	
L__report_realtime_status314:
L_report_realtime_status84:
;Print.c,231 :: 		for (i=0; i<= 2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_report_realtime_status92:
; i start address is: 24 (R6)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status315
NOP	
J	L_report_realtime_status93
NOP	
L__report_realtime_status315:
;Print.c,232 :: 		print_position[i] = current_position[i]/settings.steps_per_mm[i];
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R5, R2, 2
ADDU	R4, R3, R5
ADDIU	R2, SP, 16
ADDU	R2, R2, R5
LW	R3, 0(R2)
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R2, R2, R5
LW	R2, 0(R2)
DIVU	R3, R2
MFLO	R2
MTC1	R2, S0
MTHC1	R0, S0
CVT32.L 	S0, S0
SWC1	S0, 0(R4)
;Print.c,233 :: 		if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) { print_position[i] *= INCH_PER_MM; }
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__report_realtime_status317
NOP	
J	L_report_realtime_status95
NOP	
L__report_realtime_status317:
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R3, R3, R2
LWC1	S1, 0(R3)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
L_report_realtime_status95:
;Print.c,231 :: 		for (i=0; i<= 2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Print.c,234 :: 		}
; i end address is: 24 (R6)
J	L_report_realtime_status92
NOP	
L_report_realtime_status93:
;Print.c,236 :: 		while(DMA_IsOn(1));
L_report_realtime_status96:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status319
NOP	
J	L_report_realtime_status97
NOP	
L__report_realtime_status319:
J	L_report_realtime_status96
NOP	
L_report_realtime_status97:
;Print.c,240 :: 		,print_position[2]);
ADDIU	R3, SP, 28
ADDIU	R2, R3, 8
LWC1	S2, 0(R2)
;Print.c,239 :: 		,print_position[1]
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
;Print.c,238 :: 		,print_position[0]
LWC1	S0, 0(R3)
;Print.c,237 :: 		dma_printf(",MPos: %f,%f,%f,"
ADDIU	R23, SP, 61
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr69_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr69_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 61
;Print.c,240 :: 		,print_position[2]);
ADDIU	SP, SP, -16
SWC1	S2, 12(SP)
;Print.c,239 :: 		,print_position[1]
SWC1	S1, 8(SP)
;Print.c,238 :: 		,print_position[0]
SWC1	S0, 4(SP)
;Print.c,237 :: 		dma_printf(",MPos: %f,%f,%f,"
SW	R2, 0(SP)
;Print.c,240 :: 		,print_position[2]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,243 :: 		for (i=0; i<= 2; i++) {
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_report_realtime_status98:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__report_realtime_status320
NOP	
J	L_report_realtime_status99
NOP	
L__report_realtime_status320:
;Print.c,244 :: 		if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__report_realtime_status322
NOP	
J	L_report_realtime_status101
NOP	
L__report_realtime_status322:
;Print.c,245 :: 		print_position[i] -= (gc.coord_system[i]+gc.coord_offset[i])*INCH_PER_MM;
ADDIU	R3, SP, 28
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+40)
ORI	R2, R2, lo_addr(_gc+40)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
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
;Print.c,246 :: 		} else {
J	L_report_realtime_status102
NOP	
L_report_realtime_status101:
;Print.c,247 :: 		print_position[i] -= gc.coord_system[i]+gc.coord_offset[i];
ADDIU	R3, SP, 28
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+40)
ORI	R2, R2, lo_addr(_gc+40)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
SUB.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Print.c,248 :: 		}
L_report_realtime_status102:
;Print.c,243 :: 		for (i=0; i<= 2; i++) {
ADDIU	R2, R5, 1
SEH	R5, R2
;Print.c,249 :: 		}
; i end address is: 20 (R5)
J	L_report_realtime_status98
NOP	
L_report_realtime_status99:
;Print.c,251 :: 		while(DMA_IsOn(1));
L_report_realtime_status103:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_realtime_status324
NOP	
J	L_report_realtime_status104
NOP	
L__report_realtime_status324:
J	L_report_realtime_status103
NOP	
L_report_realtime_status104:
;Print.c,255 :: 		,print_position[2]);
ADDIU	R3, SP, 28
ADDIU	R2, R3, 8
LWC1	S2, 0(R2)
;Print.c,254 :: 		,print_position[1]
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
;Print.c,253 :: 		,print_position[0]
LWC1	S0, 0(R3)
;Print.c,252 :: 		dma_printf(",WPos: %f,%f,%f>\n"
ADDIU	R23, SP, 78
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr70_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr70_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 78
;Print.c,255 :: 		,print_position[2]);
ADDIU	SP, SP, -16
SWC1	S2, 12(SP)
;Print.c,254 :: 		,print_position[1]
SWC1	S1, 8(SP)
;Print.c,253 :: 		,print_position[0]
SWC1	S0, 4(SP)
;Print.c,252 :: 		dma_printf(",WPos: %f,%f,%f>\n"
SW	R2, 0(SP)
;Print.c,255 :: 		,print_position[2]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Print.c,256 :: 		}
L_end_report_realtime_status:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _report_realtime_status
_report_gcode_parameters:
;Print.c,259 :: 		void report_gcode_parameters(){
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;Print.c,263 :: 		for (coord_select = 0; coord_select <= SETTING_INDEX_NCOORD; coord_select++) {
SW	R25, 4(SP)
SH	R0, 24(SP)
L_report_gcode_parameters105:
LH	R2, 24(SP)
SLTI	R2, R2, 11
BNE	R2, R0, L__report_gcode_parameters326
NOP	
J	L_report_gcode_parameters106
NOP	
L__report_gcode_parameters326:
;Print.c,268 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters108:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters328
NOP	
J	L_report_gcode_parameters109
NOP	
L__report_gcode_parameters328:
J	L_report_gcode_parameters108
NOP	
L_report_gcode_parameters109:
;Print.c,269 :: 		dma_printf("[G");
ORI	R30, R0, 91
SB	R30, 28(SP)
ORI	R30, R0, 71
SB	R30, 29(SP)
MOVZ	R30, R0, R0
SB	R30, 30(SP)
ADDIU	R2, SP, 28
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,270 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters110:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters330
NOP	
J	L_report_gcode_parameters111
NOP	
L__report_gcode_parameters330:
J	L_report_gcode_parameters110
NOP	
L_report_gcode_parameters111:
;Print.c,271 :: 		switch (coord_select) {
J	L_report_gcode_parameters112
NOP	
;Print.c,272 :: 		case 0: dma_printf("54:"); break;
L_report_gcode_parameters114:
ORI	R30, R0, 53
SB	R30, 31(SP)
ORI	R30, R0, 52
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
;Print.c,273 :: 		case 1: dma_printf("55:"); break;
L_report_gcode_parameters115:
ORI	R30, R0, 53
SB	R30, 35(SP)
ORI	R30, R0, 53
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
;Print.c,274 :: 		case 2: dma_printf("56:"); break;
L_report_gcode_parameters116:
ORI	R30, R0, 53
SB	R30, 39(SP)
ORI	R30, R0, 54
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
;Print.c,275 :: 		case 3: dma_printf("57:"); break;
L_report_gcode_parameters117:
ORI	R30, R0, 53
SB	R30, 43(SP)
ORI	R30, R0, 55
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
;Print.c,276 :: 		case 4: dma_printf("58:"); break;
L_report_gcode_parameters118:
ORI	R30, R0, 53
SB	R30, 47(SP)
ORI	R30, R0, 56
SB	R30, 48(SP)
ORI	R30, R0, 58
SB	R30, 49(SP)
MOVZ	R30, R0, R0
SB	R30, 50(SP)
ADDIU	R2, SP, 47
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,277 :: 		case 5: dma_printf("59:"); break;
L_report_gcode_parameters119:
ORI	R30, R0, 53
SB	R30, 51(SP)
ORI	R30, R0, 57
SB	R30, 52(SP)
ORI	R30, R0, 58
SB	R30, 53(SP)
MOVZ	R30, R0, R0
SB	R30, 54(SP)
ADDIU	R2, SP, 51
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,278 :: 		case 6: dma_printf("28:"); break;
L_report_gcode_parameters120:
ORI	R30, R0, 50
SB	R30, 55(SP)
ORI	R30, R0, 56
SB	R30, 56(SP)
ORI	R30, R0, 58
SB	R30, 57(SP)
MOVZ	R30, R0, R0
SB	R30, 58(SP)
ADDIU	R2, SP, 55
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,279 :: 		case 7: dma_printf("30:"); break;
L_report_gcode_parameters121:
ORI	R30, R0, 51
SB	R30, 59(SP)
ORI	R30, R0, 48
SB	R30, 60(SP)
ORI	R30, R0, 58
SB	R30, 61(SP)
MOVZ	R30, R0, R0
SB	R30, 62(SP)
ADDIU	R2, SP, 59
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
J	L_report_gcode_parameters113
NOP	
;Print.c,281 :: 		}
L_report_gcode_parameters112:
LH	R2, 24(SP)
BNE	R2, R0, L__report_gcode_parameters332
NOP	
J	L_report_gcode_parameters114
NOP	
L__report_gcode_parameters332:
LH	R3, 24(SP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_parameters334
NOP	
J	L_report_gcode_parameters115
NOP	
L__report_gcode_parameters334:
LH	R3, 24(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_parameters336
NOP	
J	L_report_gcode_parameters116
NOP	
L__report_gcode_parameters336:
LH	R3, 24(SP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_parameters338
NOP	
J	L_report_gcode_parameters117
NOP	
L__report_gcode_parameters338:
LH	R3, 24(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_parameters340
NOP	
J	L_report_gcode_parameters118
NOP	
L__report_gcode_parameters340:
LH	R3, 24(SP)
ORI	R2, R0, 5
BNE	R3, R2, L__report_gcode_parameters342
NOP	
J	L_report_gcode_parameters119
NOP	
L__report_gcode_parameters342:
LH	R3, 24(SP)
ORI	R2, R0, 6
BNE	R3, R2, L__report_gcode_parameters344
NOP	
J	L_report_gcode_parameters120
NOP	
L__report_gcode_parameters344:
LH	R3, 24(SP)
ORI	R2, R0, 7
BNE	R3, R2, L__report_gcode_parameters346
NOP	
J	L_report_gcode_parameters121
NOP	
L__report_gcode_parameters346:
L_report_gcode_parameters113:
;Print.c,282 :: 		for (i=0; i<NoOfAxis; i++) {
SH	R0, 26(SP)
L_report_gcode_parameters122:
LH	R2, 26(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__report_gcode_parameters347
NOP	
J	L_report_gcode_parameters123
NOP	
L__report_gcode_parameters347:
;Print.c,283 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters125:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters349
NOP	
J	L_report_gcode_parameters126
NOP	
L__report_gcode_parameters349:
J	L_report_gcode_parameters125
NOP	
L_report_gcode_parameters126:
;Print.c,284 :: 		if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__report_gcode_parameters351
NOP	
J	L_report_gcode_parameters127
NOP	
L__report_gcode_parameters351:
;Print.c,285 :: 		dma_printf("%f ",coord_data[i]*INCH_PER_MM);
ADDIU	R3, SP, 8
LH	R2, 26(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S1, 0(R2)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ORI	R30, R0, 37
SB	R30, 63(SP)
ORI	R30, R0, 102
SB	R30, 64(SP)
ORI	R30, R0, 32
SB	R30, 65(SP)
MOVZ	R30, R0, R0
SB	R30, 66(SP)
ADDIU	R2, SP, 63
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,286 :: 		}else {
J	L_report_gcode_parameters128
NOP	
L_report_gcode_parameters127:
;Print.c,287 :: 		dma_printf("%f ",coord_data[i]);
ADDIU	R3, SP, 8
LH	R2, 26(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
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
;Print.c,288 :: 		}
L_report_gcode_parameters128:
;Print.c,289 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters129:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters353
NOP	
J	L_report_gcode_parameters130
NOP	
L__report_gcode_parameters353:
J	L_report_gcode_parameters129
NOP	
L_report_gcode_parameters130:
;Print.c,290 :: 		if (i < (NoOfAxis-1)) {
LH	R2, 26(SP)
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters354
NOP	
J	L_report_gcode_parameters131
NOP	
L__report_gcode_parameters354:
;Print.c,291 :: 		dma_printf(",");
ORI	R30, R0, 44
SB	R30, 71(SP)
MOVZ	R30, R0, R0
SB	R30, 72(SP)
ADDIU	R2, SP, 71
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,292 :: 		}else {
J	L_report_gcode_parameters132
NOP	
L_report_gcode_parameters131:
;Print.c,293 :: 		dma_printf("]\n");
ORI	R30, R0, 93
SB	R30, 73(SP)
ORI	R30, R0, 10
SB	R30, 74(SP)
MOVZ	R30, R0, R0
SB	R30, 75(SP)
ADDIU	R2, SP, 73
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,294 :: 		}
L_report_gcode_parameters132:
;Print.c,282 :: 		for (i=0; i<NoOfAxis; i++) {
LH	R2, 26(SP)
ADDIU	R2, R2, 1
SH	R2, 26(SP)
;Print.c,295 :: 		}
J	L_report_gcode_parameters122
NOP	
L_report_gcode_parameters123:
;Print.c,263 :: 		for (coord_select = 0; coord_select <= SETTING_INDEX_NCOORD; coord_select++) {
LH	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;Print.c,296 :: 		}
J	L_report_gcode_parameters105
NOP	
L_report_gcode_parameters106:
;Print.c,297 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters133:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters356
NOP	
J	L_report_gcode_parameters134
NOP	
L__report_gcode_parameters356:
J	L_report_gcode_parameters133
NOP	
L_report_gcode_parameters134:
;Print.c,298 :: 		dma_printf("[G92:"); // Print G92,G92.1 which are not persistent in memory
ORI	R30, R0, 91
SB	R30, 76(SP)
ORI	R30, R0, 71
SB	R30, 77(SP)
ORI	R30, R0, 57
SB	R30, 78(SP)
ORI	R30, R0, 50
SB	R30, 79(SP)
ORI	R30, R0, 58
SB	R30, 80(SP)
MOVZ	R30, R0, R0
SB	R30, 81(SP)
ADDIU	R2, SP, 76
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,299 :: 		for (i=0; i<NoOfAxis; i++) {
SH	R0, 26(SP)
L_report_gcode_parameters135:
LH	R2, 26(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__report_gcode_parameters357
NOP	
J	L_report_gcode_parameters136
NOP	
L__report_gcode_parameters357:
;Print.c,300 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters138:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters359
NOP	
J	L_report_gcode_parameters139
NOP	
L__report_gcode_parameters359:
J	L_report_gcode_parameters138
NOP	
L_report_gcode_parameters139:
;Print.c,301 :: 		if (bit_istrue(settings.flags,BITFLAG_REPORT_INCHES)){
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__report_gcode_parameters361
NOP	
J	L_report_gcode_parameters140
NOP	
L__report_gcode_parameters361:
;Print.c,302 :: 		dma_printf("%f ",gc.coord_offset[i]*INCH_PER_MM);
LH	R2, 26(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ORI	R30, R0, 37
SB	R30, 82(SP)
ORI	R30, R0, 102
SB	R30, 83(SP)
ORI	R30, R0, 32
SB	R30, 84(SP)
MOVZ	R30, R0, R0
SB	R30, 85(SP)
ADDIU	R2, SP, 82
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,303 :: 		}else {
J	L_report_gcode_parameters141
NOP	
L_report_gcode_parameters140:
;Print.c,304 :: 		dma_printf("%f ",gc.coord_offset[i]);
LH	R2, 26(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
ORI	R30, R0, 37
SB	R30, 86(SP)
ORI	R30, R0, 102
SB	R30, 87(SP)
ORI	R30, R0, 32
SB	R30, 88(SP)
MOVZ	R30, R0, R0
SB	R30, 89(SP)
ADDIU	R2, SP, 86
ADDIU	SP, SP, -8
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Print.c,305 :: 		}
L_report_gcode_parameters141:
;Print.c,306 :: 		while(DMA_IsOn(1));
L_report_gcode_parameters142:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_parameters363
NOP	
J	L_report_gcode_parameters143
NOP	
L__report_gcode_parameters363:
J	L_report_gcode_parameters142
NOP	
L_report_gcode_parameters143:
;Print.c,307 :: 		if (i < (NoOfAxis-1)) {
LH	R2, 26(SP)
SLTI	R2, R2, 3
BNE	R2, R0, L__report_gcode_parameters364
NOP	
J	L_report_gcode_parameters144
NOP	
L__report_gcode_parameters364:
;Print.c,308 :: 		dma_printf(",");
ORI	R30, R0, 44
SB	R30, 90(SP)
MOVZ	R30, R0, R0
SB	R30, 91(SP)
ADDIU	R2, SP, 90
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
;Print.c,309 :: 		}else {
J	L_report_gcode_parameters145
NOP	
L_report_gcode_parameters144:
;Print.c,310 :: 		dma_printf("]\n"); }
ORI	R30, R0, 93
SB	R30, 92(SP)
ORI	R30, R0, 10
SB	R30, 93(SP)
MOVZ	R30, R0, R0
SB	R30, 94(SP)
ADDIU	R2, SP, 92
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
L_report_gcode_parameters145:
;Print.c,299 :: 		for (i=0; i<NoOfAxis; i++) {
LH	R2, 26(SP)
ADDIU	R2, R2, 1
SH	R2, 26(SP)
;Print.c,311 :: 		}
J	L_report_gcode_parameters135
NOP	
L_report_gcode_parameters136:
;Print.c,312 :: 		}
L_end_report_gcode_parameters:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _report_gcode_parameters
_report_gcode_modes:
;Print.c,315 :: 		void report_gcode_modes(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Print.c,316 :: 		while(DMA_IsOn(1));
SW	R25, 4(SP)
L_report_gcode_modes146:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes367
NOP	
J	L_report_gcode_modes147
NOP	
L__report_gcode_modes367:
J	L_report_gcode_modes146
NOP	
L_report_gcode_modes147:
;Print.c,317 :: 		switch (gc.motion_mode) {
J	L_report_gcode_modes148
NOP	
;Print.c,318 :: 		case MOTION_MODE_SEEK :    dma_printf("[G0"); break;
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
;Print.c,319 :: 		case MOTION_MODE_LINEAR :  dma_printf("[G1"); break;
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
;Print.c,320 :: 		case MOTION_MODE_CW_ARC :  dma_printf("[G2"); break;
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
;Print.c,321 :: 		case MOTION_MODE_CCW_ARC : dma_printf("[G3"); break;
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
;Print.c,322 :: 		case MOTION_MODE_CANCEL :  dma_printf("[G80"); break;
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
;Print.c,323 :: 		}
L_report_gcode_modes148:
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L__report_gcode_modes369
NOP	
J	L_report_gcode_modes150
NOP	
L__report_gcode_modes369:
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes371
NOP	
J	L_report_gcode_modes151
NOP	
L__report_gcode_modes371:
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes373
NOP	
J	L_report_gcode_modes152
NOP	
L__report_gcode_modes373:
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__report_gcode_modes375
NOP	
J	L_report_gcode_modes153
NOP	
L__report_gcode_modes375:
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__report_gcode_modes377
NOP	
J	L_report_gcode_modes154
NOP	
L__report_gcode_modes377:
L_report_gcode_modes149:
;Print.c,324 :: 		while(DMA_IsOn(1));
L_report_gcode_modes155:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes379
NOP	
J	L_report_gcode_modes156
NOP	
L__report_gcode_modes379:
J	L_report_gcode_modes155
NOP	
L_report_gcode_modes156:
;Print.c,325 :: 		dma_printf(" G%d",gc.coord_select+54);
LBU	R2, Offset(_gc+13)(GP)
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
;Print.c,326 :: 		while(DMA_IsOn(1));
L_report_gcode_modes157:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes381
NOP	
J	L_report_gcode_modes158
NOP	
L__report_gcode_modes381:
J	L_report_gcode_modes157
NOP	
L_report_gcode_modes158:
;Print.c,327 :: 		if (gc.plane_axis_0 == X) {
LBU	R2, Offset(_gc+10)(GP)
BEQ	R2, R0, L__report_gcode_modes382
NOP	
J	L_report_gcode_modes159
NOP	
L__report_gcode_modes382:
;Print.c,328 :: 		if (gc.plane_axis_1 == Y) { dma_printf(" G17"); }
LBU	R3, Offset(_gc+11)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__report_gcode_modes383
NOP	
J	L_report_gcode_modes160
NOP	
L__report_gcode_modes383:
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
;Print.c,329 :: 		else { dma_printf(" G18"); }
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
;Print.c,330 :: 		} else { dma_printf(" G19"); }
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
;Print.c,331 :: 		while(DMA_IsOn(1));
L_report_gcode_modes163:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes385
NOP	
J	L_report_gcode_modes164
NOP	
L__report_gcode_modes385:
J	L_report_gcode_modes163
NOP	
L_report_gcode_modes164:
;Print.c,332 :: 		if (gc.inches_mode) { dma_printf(" G20"); }
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes387
NOP	
J	L_report_gcode_modes165
NOP	
L__report_gcode_modes387:
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
;Print.c,333 :: 		else { dma_printf(" G21"); }
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
;Print.c,334 :: 		while(DMA_IsOn(1));
L_report_gcode_modes167:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes389
NOP	
J	L_report_gcode_modes168
NOP	
L__report_gcode_modes389:
J	L_report_gcode_modes167
NOP	
L_report_gcode_modes168:
;Print.c,335 :: 		if (gc.absolute_mode) { dma_printf(" G90"); }
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__report_gcode_modes391
NOP	
J	L_report_gcode_modes169
NOP	
L__report_gcode_modes391:
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
;Print.c,336 :: 		else { dma_printf(" G91"); }
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
;Print.c,337 :: 		while(DMA_IsOn(1));
L_report_gcode_modes171:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes393
NOP	
J	L_report_gcode_modes172
NOP	
L__report_gcode_modes393:
J	L_report_gcode_modes171
NOP	
L_report_gcode_modes172:
;Print.c,338 :: 		if (gc.inverse_feed_rate_mode) { dma_printf(" G93"); }
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__report_gcode_modes395
NOP	
J	L_report_gcode_modes173
NOP	
L__report_gcode_modes395:
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
;Print.c,339 :: 		else { dma_printf(" G94"); }
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
;Print.c,341 :: 		while(DMA_IsOn(1));
L_report_gcode_modes175:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes397
NOP	
J	L_report_gcode_modes176
NOP	
L__report_gcode_modes397:
J	L_report_gcode_modes175
NOP	
L_report_gcode_modes176:
;Print.c,342 :: 		switch (gc.program_flow) {
J	L_report_gcode_modes177
NOP	
;Print.c,343 :: 		case PROGRAM_FLOW_RUNNING : dma_printf(" M0"); break;
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
;Print.c,344 :: 		case PROGRAM_FLOW_PAUSED :  dma_printf(" M1"); break;
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
;Print.c,345 :: 		case PROGRAM_FLOW_COMPLETED : dma_printf(" M2"); break;
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
;Print.c,346 :: 		}
L_report_gcode_modes177:
LBU	R2, Offset(_gc+6)(GP)
BNE	R2, R0, L__report_gcode_modes399
NOP	
J	L_report_gcode_modes179
NOP	
L__report_gcode_modes399:
LBU	R3, Offset(_gc+6)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes401
NOP	
J	L_report_gcode_modes180
NOP	
L__report_gcode_modes401:
LBU	R3, Offset(_gc+6)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__report_gcode_modes403
NOP	
J	L_report_gcode_modes181
NOP	
L__report_gcode_modes403:
L_report_gcode_modes178:
;Print.c,347 :: 		while(DMA_IsOn(1));
L_report_gcode_modes182:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes405
NOP	
J	L_report_gcode_modes183
NOP	
L__report_gcode_modes405:
J	L_report_gcode_modes182
NOP	
L_report_gcode_modes183:
;Print.c,348 :: 		switch (gc.spindle_direction) {
J	L_report_gcode_modes184
NOP	
;Print.c,349 :: 		case 1 : dma_printf(" M3"); break;
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
;Print.c,350 :: 		case -1 : dma_printf(" M4"); break;
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
;Print.c,351 :: 		case 0 : dma_printf(" M5"); break;
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
;Print.c,352 :: 		}
L_report_gcode_modes184:
LBU	R3, Offset(_gc+7)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__report_gcode_modes407
NOP	
J	L_report_gcode_modes186
NOP	
L__report_gcode_modes407:
LBU	R3, Offset(_gc+7)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__report_gcode_modes409
NOP	
J	L_report_gcode_modes187
NOP	
L__report_gcode_modes409:
LBU	R2, Offset(_gc+7)(GP)
BNE	R2, R0, L__report_gcode_modes411
NOP	
J	L_report_gcode_modes188
NOP	
L__report_gcode_modes411:
L_report_gcode_modes185:
;Print.c,353 :: 		while(DMA_IsOn(1));
L_report_gcode_modes189:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes413
NOP	
J	L_report_gcode_modes190
NOP	
L__report_gcode_modes413:
J	L_report_gcode_modes189
NOP	
L_report_gcode_modes190:
;Print.c,360 :: 		}
L_report_gcode_modes191:
;Print.c,361 :: 		while(DMA_IsOn(1));
L_report_gcode_modes193:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__report_gcode_modes415
NOP	
J	L_report_gcode_modes194
NOP	
L__report_gcode_modes415:
J	L_report_gcode_modes193
NOP	
L_report_gcode_modes194:
;Print.c,362 :: 		if (gc.inches_mode)
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__report_gcode_modes417
NOP	
J	L_report_gcode_modes195
NOP	
L__report_gcode_modes417:
;Print.c,363 :: 		dma_printf(" T %dF %f",gc.tool,gc.feed_rate*INCH_PER_MM);
LWC1	S1, Offset(_gc+20)(GP)
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S1, S0
ADDIU	R23, SP, 103
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr110_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr110_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 103
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
LBU	R2, Offset(_gc+9)(GP)
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
J	L_report_gcode_modes196
NOP	
L_report_gcode_modes195:
;Print.c,365 :: 		dma_printf(" T %dF %f]\n",gc.tool,gc.feed_rate);
ADDIU	R23, SP, 113
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr111_Print+0)
ORI	R24, R24, lo_addr(?ICS?lstr111_Print+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 113
LW	R2, Offset(_gc+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LBU	R2, Offset(_gc+9)(GP)
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
L_report_gcode_modes196:
;Print.c,368 :: 		}
L_end_report_gcode_modes:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 128
JR	RA
NOP	
; end of _report_gcode_modes
