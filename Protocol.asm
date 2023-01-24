_Str_Initialize:
;Protocol.c,10 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,12 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 11
BNE	R2, R0, L__Str_Initialize199
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize199:
;Protocol.c,13 :: 		memset(arg[i],0,str_size);
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SW	R25, 12(SP)
ORI	R27, R0, 60
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 12(SP)
;Protocol.c,12 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,14 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,15 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,17 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,18 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,19 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,23 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;Protocol.c,39 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,42 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer203
NOP	
J	L__Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer203:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer204
NOP	
J	L__Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer204:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer188:
;Protocol.c,43 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,44 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,45 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,46 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,42 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer190:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer189:
;Protocol.c,49 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer205:
; dif end address is: 20 (R5)
;Protocol.c,51 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer207
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer207:
;Protocol.c,52 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,53 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer208
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer208:
;Protocol.c,58 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,59 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer209
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer209:
;Protocol.c,60 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer9:
;Protocol.c,61 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,62 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,63 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,64 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,65 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer210
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer210:
;Protocol.c,67 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,69 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 22
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,70 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 22
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,71 :: 		str_len = strlen(str);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,74 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 22
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,75 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,90 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer211
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer211:
;Protocol.c,95 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,96 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,98 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,99 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,101 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,108 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer212:
;Protocol.c,109 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,110 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer213
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer213:
;Protocol.c,111 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,112 :: 		}else if(gcode[0][0] =='$'){
J	L_Sample_Ringbuffer15
NOP	
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer214:
;Protocol.c,113 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer215
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer215:
;Protocol.c,114 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,115 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,116 :: 		status = STATUS_OK;
SH	R0, 20(SP)
;Protocol.c,117 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,118 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,119 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,120 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,121 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,122 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,123 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,124 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer21:
;Protocol.c,125 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,126 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,127 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,128 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer22:
;Protocol.c,130 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,131 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,132 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,135 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer216:
;Protocol.c,136 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer23:
;Protocol.c,137 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,138 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer24:
;Protocol.c,139 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,143 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer217
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer217:
;Protocol.c,144 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,146 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,148 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer219
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer219:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,150 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SB	R2, Offset(_sys+1)(GP)
;Protocol.c,151 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,152 :: 		}
L_Sample_Ringbuffer26:
;Protocol.c,153 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,154 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer28:
;Protocol.c,155 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,156 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer220:
;Protocol.c,157 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,158 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,160 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,161 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,162 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,163 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer30:
;Protocol.c,164 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,165 :: 		if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer222:
;Protocol.c,167 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer224
NOP	
J	L__Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer224:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L__Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer226:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer192:
L__Sample_Ringbuffer191:
;Protocol.c,169 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer227
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer227:
;Protocol.c,171 :: 		} // Execute startup scripts after successful homing.
L_Sample_Ringbuffer35:
;Protocol.c,172 :: 		} else {
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,173 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,174 :: 		}
L_Sample_Ringbuffer36:
;Protocol.c,175 :: 		} else {
J	L_Sample_Ringbuffer37
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,176 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,177 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,178 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,179 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer38:
;Protocol.c,180 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,181 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,182 :: 		default :  // Storing setting methods  */
L_Sample_Ringbuffer39:
;Protocol.c,183 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,184 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer229
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer229:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer231
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer231:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer233
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer233:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer235
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer235:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer237
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer237:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer239
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer239:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer241
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer241:
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer19:
;Protocol.c,185 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer242
NOP	
J	L__Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer242:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer243
NOP	
J	L__Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer243:
L__Sample_Ringbuffer186:
;Protocol.c,186 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 96(SP)
J	L_Sample_Ringbuffer44
NOP	
;Protocol.c,187 :: 		case 'G':case 'g':
L_Sample_Ringbuffer46:
L_Sample_Ringbuffer47:
;Protocol.c,189 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer244
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer244:
;Protocol.c,190 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,191 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer245
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer245:
;Protocol.c,192 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,195 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer247
NOP	
J	L__Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer247:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer249
NOP	
J	L__Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer249:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer251
NOP	
J	L__Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer251:
SEH	R2, R4
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer195:
L__Sample_Ringbuffer194:
L__Sample_Ringbuffer193:
;Protocol.c,196 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer52:
;Protocol.c,197 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer53
NOP	
L_Sample_Ringbuffer49:
;Protocol.c,199 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
;Protocol.c,200 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,202 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,212 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer253
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer253:
;Protocol.c,214 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,215 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer55
NOP	
;Protocol.c,216 :: 		case 'X':case 'x':
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer58:
;Protocol.c,217 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
;Protocol.c,218 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,219 :: 		case 'A':case 'a':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
;Protocol.c,220 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,221 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,225 :: 		break;
J	L_Sample_Ringbuffer56
NOP	
;Protocol.c,226 :: 		case 'L':case 'l':
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
;Protocol.c,227 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,228 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,232 :: 		break;
J	L_Sample_Ringbuffer56
NOP	
;Protocol.c,233 :: 		case 'F':case 'f':
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
;Protocol.c,234 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,235 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,239 :: 		break;
J	L_Sample_Ringbuffer56
NOP	
;Protocol.c,240 :: 		case 'P':case 'p':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
;Protocol.c,241 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,242 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,246 :: 		break;
J	L_Sample_Ringbuffer56
NOP	
;Protocol.c,247 :: 		case 'S':case 's':
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
;Protocol.c,248 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,249 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,253 :: 		break;
J	L_Sample_Ringbuffer56
NOP	
;Protocol.c,254 :: 		}
L_Sample_Ringbuffer55:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer255
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer255:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer257
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer257:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer259:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer261
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer261:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer263:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer265:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer267:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer269:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer271:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer273
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer273:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer275
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer275:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer277:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer279:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer281
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer281:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer283
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer283:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer285:
L_Sample_Ringbuffer56:
;Protocol.c,255 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,260 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer287:
;Protocol.c,262 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,263 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,264 :: 		case 'X':case 'x':
L_Sample_Ringbuffer76:
L_Sample_Ringbuffer77:
;Protocol.c,265 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer78:
L_Sample_Ringbuffer79:
;Protocol.c,266 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer80:
L_Sample_Ringbuffer81:
;Protocol.c,267 :: 		case 'A':case 'a':
L_Sample_Ringbuffer82:
L_Sample_Ringbuffer83:
;Protocol.c,268 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,269 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,273 :: 		break;
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,274 :: 		case 'L':case 'l':
L_Sample_Ringbuffer84:
L_Sample_Ringbuffer85:
;Protocol.c,275 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,276 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,280 :: 		break;
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,281 :: 		case 'F':case 'f':
L_Sample_Ringbuffer86:
L_Sample_Ringbuffer87:
;Protocol.c,282 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,283 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,287 :: 		break;
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,288 :: 		case 'P':case 'p':
L_Sample_Ringbuffer88:
L_Sample_Ringbuffer89:
;Protocol.c,289 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,290 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,294 :: 		break;
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,295 :: 		case 'S':case 's':
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
;Protocol.c,296 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,297 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,301 :: 		break;
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,302 :: 		}
L_Sample_Ringbuffer74:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer289:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer291:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer293:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer295:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer297
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer297:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer299:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer301
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer301:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer303
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer303:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer305:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer307:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer309
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer309:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer311:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer313
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer313:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer315:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer317:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer319:
L_Sample_Ringbuffer75:
;Protocol.c,303 :: 		}
L_Sample_Ringbuffer73:
;Protocol.c,307 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer321:
;Protocol.c,309 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,310 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,311 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,312 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer99:
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
L_Sample_Ringbuffer102:
;Protocol.c,313 :: 		case 'I':case 'i':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,314 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,315 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,319 :: 		break;
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,320 :: 		case 'F': case 'f':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,321 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,322 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,326 :: 		break;
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,327 :: 		}
L_Sample_Ringbuffer93:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer329:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer331:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer333:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer335:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer345:
L_Sample_Ringbuffer94:
;Protocol.c,328 :: 		}
L_Sample_Ringbuffer92:
;Protocol.c,333 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer347:
;Protocol.c,334 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+240)
ORI	R26, R26, lo_addr(_gcode+240)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,335 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer108
NOP	
;Protocol.c,336 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,337 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
;Protocol.c,338 :: 		case 'J':case 'j':
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,339 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,340 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,344 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,345 :: 		case 'F':case 'f':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
;Protocol.c,346 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,347 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,351 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,353 :: 		}
L_Sample_Ringbuffer108:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer349:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer353:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer355:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer357
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer357:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer359:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer363:
L_Sample_Ringbuffer109:
;Protocol.c,354 :: 		}
L_Sample_Ringbuffer107:
;Protocol.c,358 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer365:
;Protocol.c,359 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,360 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+300)
ORI	R26, R26, lo_addr(_gcode+300)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,361 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,362 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,363 :: 		case 'J':case 'j':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,364 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,365 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,369 :: 		break;
J	L_Sample_Ringbuffer120
NOP	
;Protocol.c,370 :: 		case 'F':case 'f':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,371 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,372 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,376 :: 		break;
J	L_Sample_Ringbuffer120
NOP	
;Protocol.c,377 :: 		}
L_Sample_Ringbuffer119:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer367:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer369:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer373:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer375:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer377:
L_Sample_Ringbuffer120:
;Protocol.c,378 :: 		}
L_Sample_Ringbuffer118:
;Protocol.c,381 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer379:
;Protocol.c,382 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+360)
ORI	R26, R26, lo_addr(_gcode+360)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,383 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer128
NOP	
;Protocol.c,384 :: 		case 'J':case 'j':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,385 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,386 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,390 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,391 :: 		case 'F':case 'f':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,392 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,393 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,397 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,399 :: 		}
L_Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer381:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer383:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer385:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer387:
L_Sample_Ringbuffer129:
;Protocol.c,400 :: 		}
L_Sample_Ringbuffer127:
;Protocol.c,401 :: 		}else {
J	L_Sample_Ringbuffer134
NOP	
L_Sample_Ringbuffer48:
;Protocol.c,402 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,403 :: 		}
L_Sample_Ringbuffer134:
;Protocol.c,404 :: 		break;
J	L_Sample_Ringbuffer45
NOP	
;Protocol.c,405 :: 		case 'M':
L_Sample_Ringbuffer135:
;Protocol.c,406 :: 		case 'm':
L_Sample_Ringbuffer136:
;Protocol.c,408 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,409 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,410 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,416 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer389:
;Protocol.c,417 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer138
NOP	
;Protocol.c,418 :: 		case 'S':
L_Sample_Ringbuffer140:
;Protocol.c,419 :: 		case 's':
L_Sample_Ringbuffer141:
;Protocol.c,421 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,422 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 92(SP)
;Protocol.c,423 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,427 :: 		break;
J	L_Sample_Ringbuffer139
NOP	
;Protocol.c,428 :: 		}
L_Sample_Ringbuffer138:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer391:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer393:
L_Sample_Ringbuffer139:
;Protocol.c,429 :: 		}
L_Sample_Ringbuffer137:
;Protocol.c,430 :: 		break;
J	L_Sample_Ringbuffer45
NOP	
;Protocol.c,431 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,432 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer146:
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
L_Sample_Ringbuffer149:
;Protocol.c,433 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer394:
;Protocol.c,434 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,435 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,436 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,440 :: 		}
L_Sample_Ringbuffer150:
;Protocol.c,444 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer396:
;Protocol.c,445 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,446 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,447 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer152
NOP	
;Protocol.c,448 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer154:
L_Sample_Ringbuffer155:
;Protocol.c,449 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer156:
L_Sample_Ringbuffer157:
;Protocol.c,450 :: 		case 'A':case 'a':
L_Sample_Ringbuffer158:
L_Sample_Ringbuffer159:
;Protocol.c,451 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,452 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,456 :: 		break;
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,457 :: 		case 'F':
L_Sample_Ringbuffer160:
;Protocol.c,458 :: 		case 'f':
L_Sample_Ringbuffer161:
;Protocol.c,461 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 88(SP)
;Protocol.c,462 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,467 :: 		break;
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,469 :: 		}
L_Sample_Ringbuffer152:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer398:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer400:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer412:
L_Sample_Ringbuffer153:
;Protocol.c,470 :: 		}
L_Sample_Ringbuffer151:
;Protocol.c,471 :: 		break;
J	L_Sample_Ringbuffer45
NOP	
;Protocol.c,472 :: 		case 'F':
L_Sample_Ringbuffer162:
;Protocol.c,474 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer413:
;Protocol.c,475 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,476 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 88(SP)
;Protocol.c,477 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,481 :: 		}
L_Sample_Ringbuffer163:
;Protocol.c,482 :: 		break;
J	L_Sample_Ringbuffer45
NOP	
;Protocol.c,484 :: 		}
L_Sample_Ringbuffer44:
LH	R4, 96(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer415:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer417:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer419:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer421:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer423:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer425:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer427:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer429:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer431:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer433:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer435:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer437:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer439:
L_Sample_Ringbuffer45:
;Protocol.c,185 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer197:
L__Sample_Ringbuffer196:
;Protocol.c,485 :: 		}
L_Sample_Ringbuffer40:
L_Sample_Ringbuffer15:
;Protocol.c,487 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer440:
;Protocol.c,488 :: 		status = STATUS_OK;
SH	R0, 20(SP)
;Protocol.c,489 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,490 :: 		}
L_Sample_Ringbuffer164:
;Protocol.c,492 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 20(SP)
;Protocol.c,493 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,495 :: 		if(!status)
LH	R2, 20(SP)
BEQ	R2, R0, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer441:
;Protocol.c,496 :: 		report_status_message(status);
LH	R25, 20(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer165:
;Protocol.c,499 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,502 :: 		return status;
LH	R2, 20(SP)
;Protocol.c,503 :: 		}
;Protocol.c,502 :: 		return status;
;Protocol.c,503 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,508 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,510 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,511 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,512 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,513 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit166:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit443
NOP	
J	L_Protocol_strsplit167
NOP	
L_Protocol_strsplit443:
;Protocol.c,514 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,515 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit445
NOP	
J	L_Protocol_strsplit184
NOP	
L_Protocol_strsplit445:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit447
NOP	
J	L_Protocol_strsplit183
NOP	
L_Protocol_strsplit447:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit448
NOP	
J	L_Protocol_strsplit182
NOP	
L_Protocol_strsplit448:
J	L_Protocol_strsplit171
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit184:
L_Protocol_strsplit183:
L_Protocol_strsplit182:
;Protocol.c,516 :: 		arg[kk++][ii] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,517 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,518 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,519 :: 		continue;
J	L_Protocol_strsplit168
NOP	
;Protocol.c,520 :: 		}else{
L_Protocol_strsplit171:
;Protocol.c,521 :: 		arg[kk][ii++] = *(str+i);
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R8
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R8, 1
SEH	R8, R2
;Protocol.c,523 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit449
NOP	
J	L_Protocol_strsplit173
NOP	
L_Protocol_strsplit449:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,524 :: 		break;
J	L_Protocol_strsplit167
NOP	
L_Protocol_strsplit173:
;Protocol.c,525 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit168:
;Protocol.c,513 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,525 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit166
NOP	
L_Protocol_strsplit167:
;Protocol.c,526 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,527 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,528 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,532 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,535 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,536 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,538 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,539 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str174:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str452
NOP	
J	L_Protocol_cpy_val_from_str175
NOP	
L_Protocol_cpy_val_from_str452:
;Protocol.c,540 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,541 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,542 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str174
NOP	
L_Protocol_cpy_val_from_str175:
;Protocol.c,543 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,545 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,546 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,551 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,553 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,555 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,557 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int176:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int454
NOP	
J	L_Protocol_str2int177
NOP	
L_Protocol_str2int454:
;Protocol.c,558 :: 		result = result * base + ( *(str+i) - 0x30 );
LH	R2, 14(SP)
MUL	R3, R2, R26
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -48
ADDU	R2, R3, R2
SH	R2, 14(SP)
; i end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,559 :: 		while(DMA_IsOn(1));
L_Protocol_str2int179:
; i start address is: 12 (R3)
SH	R3, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_str2int456
NOP	
J	L_Protocol_str2int180
NOP	
L_Protocol_str2int456:
J	L_Protocol_str2int179
NOP	
L_Protocol_str2int180:
;Protocol.c,557 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,560 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int176
NOP	
L_Protocol_str2int177:
;Protocol.c,562 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,563 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
