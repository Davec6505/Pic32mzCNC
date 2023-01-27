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
BNE	R2, R0, L__Str_Initialize206
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize206:
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
ADDIU	SP, SP, -104
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
BNE	R2, R0, L__Sample_Ringbuffer210
NOP	
J	L__Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer210:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer211
NOP	
J	L__Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer211:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer195:
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
L__Sample_Ringbuffer197:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer196:
;Protocol.c,49 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer212:
; dif end address is: 20 (R5)
;Protocol.c,51 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer214:
;Protocol.c,52 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,53 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer215
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer215:
;Protocol.c,58 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,59 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer216:
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
BEQ	R2, R0, L__Sample_Ringbuffer217
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer217:
;Protocol.c,67 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,69 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 24
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,70 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,71 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,74 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
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
BEQ	R3, R2, L__Sample_Ringbuffer218
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer218:
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
BEQ	R3, R2, L__Sample_Ringbuffer219
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer219:
;Protocol.c,109 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,110 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer220:
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
BEQ	R3, R2, L__Sample_Ringbuffer221
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer221:
;Protocol.c,113 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer222:
;Protocol.c,114 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,115 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,116 :: 		status = STATUS_OK;
SH	R0, 22(SP)
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
BEQ	R2, R0, L__Sample_Ringbuffer223
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer223:
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
;Protocol.c,139 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,143 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer224:
;Protocol.c,144 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,145 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,146 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,148 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer226:
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
;Protocol.c,155 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,156 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer227
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer227:
;Protocol.c,157 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,158 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,160 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,161 :: 		query = 1; //status ok response
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
BNE	R2, R0, L__Sample_Ringbuffer229
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer229:
;Protocol.c,167 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer231
NOP	
J	L__Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer231:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer233
NOP	
J	L__Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer233:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer199:
L__Sample_Ringbuffer198:
;Protocol.c,169 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer234:
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
;Protocol.c,181 :: 		if ( gcode[0][2] == 0 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer235
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer235:
;Protocol.c,182 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer40:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer236:
;Protocol.c,183 :: 		if (!(settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BEQ	R2, R0, L__Sample_Ringbuffer237
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer237:
;Protocol.c,184 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,185 :: 		} else {
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer43:
;Protocol.c,186 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,187 :: 		}
L_Sample_Ringbuffer44:
;Protocol.c,182 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,188 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer41:
;Protocol.c,189 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,190 :: 		} else { // Store startup line
L_Sample_Ringbuffer39:
;Protocol.c,194 :: 		default :  // Storing setting methods
L_Sample_Ringbuffer46:
;Protocol.c,215 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,216 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer239
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer239:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer241
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer241:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer243
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer243:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer245
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer245:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer247
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer247:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer249
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer249:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer251
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer251:
J	L_Sample_Ringbuffer46
NOP	
L_Sample_Ringbuffer19:
;Protocol.c,218 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer47
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer252
NOP	
J	L__Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer252:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer253
NOP	
J	L__Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer253:
L__Sample_Ringbuffer193:
;Protocol.c,219 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 100(SP)
J	L_Sample_Ringbuffer51
NOP	
;Protocol.c,220 :: 		case 'G':case 'g':
L_Sample_Ringbuffer53:
L_Sample_Ringbuffer54:
;Protocol.c,222 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer254:
;Protocol.c,223 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,224 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer255
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer255:
;Protocol.c,225 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,228 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer257
NOP	
J	L__Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer257:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer259
NOP	
J	L__Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer259:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer261
NOP	
J	L__Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer261:
SEH	R2, R4
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer202:
L__Sample_Ringbuffer201:
L__Sample_Ringbuffer200:
;Protocol.c,229 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer59:
;Protocol.c,230 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer60
NOP	
L_Sample_Ringbuffer56:
;Protocol.c,232 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 74
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
;Protocol.c,233 :: 		}
L_Sample_Ringbuffer60:
;Protocol.c,235 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,245 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer263:
;Protocol.c,247 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,248 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,249 :: 		case 'X':case 'x':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,250 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
;Protocol.c,251 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,252 :: 		case 'A':case 'a':
L_Sample_Ringbuffer70:
L_Sample_Ringbuffer71:
;Protocol.c,253 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,254 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,258 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,259 :: 		case 'L':case 'l':
L_Sample_Ringbuffer72:
L_Sample_Ringbuffer73:
;Protocol.c,260 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,261 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,265 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,266 :: 		case 'F':case 'f':
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer75:
;Protocol.c,267 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,268 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,272 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,273 :: 		case 'P':case 'p':
L_Sample_Ringbuffer76:
L_Sample_Ringbuffer77:
;Protocol.c,274 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,275 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,279 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,280 :: 		case 'S':case 's':
L_Sample_Ringbuffer78:
L_Sample_Ringbuffer79:
;Protocol.c,281 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,282 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,286 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,287 :: 		}
L_Sample_Ringbuffer62:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer265:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer267:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer269:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer271:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer273
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer273:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer275
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer275:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer277:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer279:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer281
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer281:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer283
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer283:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer285:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer287:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer289:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer291:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer293:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer295:
L_Sample_Ringbuffer63:
;Protocol.c,288 :: 		}
L_Sample_Ringbuffer61:
;Protocol.c,293 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer297
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer297:
;Protocol.c,295 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,296 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer81
NOP	
;Protocol.c,297 :: 		case 'X':case 'x':
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer84:
;Protocol.c,298 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,299 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,300 :: 		case 'A':case 'a':
L_Sample_Ringbuffer89:
L_Sample_Ringbuffer90:
;Protocol.c,301 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,302 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,306 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,307 :: 		case 'L':case 'l':
L_Sample_Ringbuffer91:
L_Sample_Ringbuffer92:
;Protocol.c,308 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,309 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,313 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,314 :: 		case 'F':case 'f':
L_Sample_Ringbuffer93:
L_Sample_Ringbuffer94:
;Protocol.c,315 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,316 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,320 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,321 :: 		case 'P':case 'p':
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
;Protocol.c,322 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,323 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,327 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,328 :: 		case 'S':case 's':
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,329 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,330 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,334 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,335 :: 		}
L_Sample_Ringbuffer81:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer299:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer301
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer301:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer303
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer303:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer305:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer307:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer309
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer309:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer311:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer313
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer313:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer315:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer317:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer319:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer321:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer329:
L_Sample_Ringbuffer82:
;Protocol.c,336 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,340 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer331:
;Protocol.c,342 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,343 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,344 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,345 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,346 :: 		case 'I':case 'i':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,347 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,348 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,352 :: 		break;
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,353 :: 		case 'F': case 'f':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
;Protocol.c,354 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,355 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,359 :: 		break;
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,360 :: 		}
L_Sample_Ringbuffer100:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer333:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer335:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer347:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer349:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer353:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer355:
L_Sample_Ringbuffer101:
;Protocol.c,361 :: 		}
L_Sample_Ringbuffer99:
;Protocol.c,366 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer357
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer357:
;Protocol.c,367 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+240)
ORI	R26, R26, lo_addr(_gcode+240)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,368 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,369 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,370 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,371 :: 		case 'J':case 'j':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,372 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,373 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,377 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,378 :: 		case 'F':case 'f':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,379 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,380 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,384 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,386 :: 		}
L_Sample_Ringbuffer115:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer359:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer363:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer365:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer367:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer369:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer373:
L_Sample_Ringbuffer116:
;Protocol.c,387 :: 		}
L_Sample_Ringbuffer114:
;Protocol.c,391 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer375:
;Protocol.c,392 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,393 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+300)
ORI	R26, R26, lo_addr(_gcode+300)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,394 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,395 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,396 :: 		case 'J':case 'j':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,397 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,398 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,402 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,403 :: 		case 'F':case 'f':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,404 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,405 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,409 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,410 :: 		}
L_Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer377:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer379:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer381:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer383:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer385:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer387:
L_Sample_Ringbuffer127:
;Protocol.c,411 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,414 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer389:
;Protocol.c,415 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+360)
ORI	R26, R26, lo_addr(_gcode+360)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,416 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer135
NOP	
;Protocol.c,417 :: 		case 'J':case 'j':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,418 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,419 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,423 :: 		break;
J	L_Sample_Ringbuffer136
NOP	
;Protocol.c,424 :: 		case 'F':case 'f':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,425 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,426 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,430 :: 		break;
J	L_Sample_Ringbuffer136
NOP	
;Protocol.c,432 :: 		}
L_Sample_Ringbuffer135:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer391:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer393:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer395:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer397:
L_Sample_Ringbuffer136:
;Protocol.c,433 :: 		}
L_Sample_Ringbuffer134:
;Protocol.c,434 :: 		}else {
J	L_Sample_Ringbuffer141
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,435 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,436 :: 		}
L_Sample_Ringbuffer141:
;Protocol.c,437 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,438 :: 		case 'M':
L_Sample_Ringbuffer142:
;Protocol.c,439 :: 		case 'm':
L_Sample_Ringbuffer143:
;Protocol.c,441 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,442 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,443 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,449 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer399:
;Protocol.c,450 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer145
NOP	
;Protocol.c,451 :: 		case 'S':
L_Sample_Ringbuffer147:
;Protocol.c,452 :: 		case 's':
L_Sample_Ringbuffer148:
;Protocol.c,454 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,455 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 96(SP)
;Protocol.c,456 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,460 :: 		break;
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,461 :: 		}
L_Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer401
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer401:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer403
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer403:
L_Sample_Ringbuffer146:
;Protocol.c,462 :: 		}
L_Sample_Ringbuffer144:
;Protocol.c,463 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,464 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,465 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,466 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer404:
;Protocol.c,467 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,468 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,469 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,473 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,477 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer406:
;Protocol.c,478 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,479 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,480 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,481 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
;Protocol.c,482 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer163:
L_Sample_Ringbuffer164:
;Protocol.c,483 :: 		case 'A':case 'a':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,484 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,485 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,489 :: 		break;
J	L_Sample_Ringbuffer160
NOP	
;Protocol.c,490 :: 		case 'F':
L_Sample_Ringbuffer167:
;Protocol.c,491 :: 		case 'f':
L_Sample_Ringbuffer168:
;Protocol.c,494 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,495 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,500 :: 		break;
J	L_Sample_Ringbuffer160
NOP	
;Protocol.c,502 :: 		}
L_Sample_Ringbuffer159:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer422:
L_Sample_Ringbuffer160:
;Protocol.c,503 :: 		}
L_Sample_Ringbuffer158:
;Protocol.c,504 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,505 :: 		case 'F':
L_Sample_Ringbuffer169:
;Protocol.c,507 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer423:
;Protocol.c,508 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,509 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,510 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,514 :: 		}
L_Sample_Ringbuffer170:
;Protocol.c,515 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,517 :: 		}
L_Sample_Ringbuffer51:
LH	R4, 100(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer425:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer427:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer429:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer431:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer433:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer435:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer437:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer439:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer441:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer443:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer445:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer447:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer449:
L_Sample_Ringbuffer52:
;Protocol.c,218 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer204:
L__Sample_Ringbuffer203:
;Protocol.c,518 :: 		}
L_Sample_Ringbuffer47:
L_Sample_Ringbuffer15:
;Protocol.c,520 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer450:
;Protocol.c,521 :: 		status = STATUS_OK;
SH	R0, 22(SP)
;Protocol.c,522 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,523 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,525 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,526 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,528 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer451
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer451:
;Protocol.c,529 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer172:
;Protocol.c,532 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,535 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,536 :: 		}
;Protocol.c,535 :: 		return status;
;Protocol.c,536 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 104
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,541 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,543 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,544 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,545 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,546 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit173:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit453
NOP	
J	L_Protocol_strsplit174
NOP	
L_Protocol_strsplit453:
;Protocol.c,547 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,548 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit455
NOP	
J	L_Protocol_strsplit191
NOP	
L_Protocol_strsplit455:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit457
NOP	
J	L_Protocol_strsplit190
NOP	
L_Protocol_strsplit457:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit458
NOP	
J	L_Protocol_strsplit189
NOP	
L_Protocol_strsplit458:
J	L_Protocol_strsplit178
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit191:
L_Protocol_strsplit190:
L_Protocol_strsplit189:
;Protocol.c,549 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,550 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,551 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,552 :: 		continue;
J	L_Protocol_strsplit175
NOP	
;Protocol.c,553 :: 		}else{
L_Protocol_strsplit178:
;Protocol.c,554 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,556 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit459
NOP	
J	L_Protocol_strsplit180
NOP	
L_Protocol_strsplit459:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,557 :: 		break;
J	L_Protocol_strsplit174
NOP	
L_Protocol_strsplit180:
;Protocol.c,558 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit175:
;Protocol.c,546 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,558 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit173
NOP	
L_Protocol_strsplit174:
;Protocol.c,559 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,560 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,561 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,565 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,568 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,569 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,571 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,572 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str181:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str462
NOP	
J	L_Protocol_cpy_val_from_str182
NOP	
L_Protocol_cpy_val_from_str462:
;Protocol.c,573 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,574 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,575 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str181
NOP	
L_Protocol_cpy_val_from_str182:
;Protocol.c,576 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,578 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,579 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,584 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,586 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,588 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,590 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int183:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int464
NOP	
J	L_Protocol_str2int184
NOP	
L_Protocol_str2int464:
;Protocol.c,591 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,592 :: 		while(DMA_IsOn(1));
L_Protocol_str2int186:
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
BNE	R2, R0, L_Protocol_str2int466
NOP	
J	L_Protocol_str2int187
NOP	
L_Protocol_str2int466:
J	L_Protocol_str2int186
NOP	
L_Protocol_str2int187:
;Protocol.c,590 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,593 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int183
NOP	
L_Protocol_str2int184:
;Protocol.c,595 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,596 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
