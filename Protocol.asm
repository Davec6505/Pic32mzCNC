_Str_Initialize:
;Protocol.c,11 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,13 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize220
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize220:
;Protocol.c,14 :: 		memset(arg[i],0,str_size);
SEH	R2, R5
SLL	R2, R2, 6
ADDU	R2, R25, R2
SW	R25, 12(SP)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 12(SP)
;Protocol.c,13 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,15 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,16 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,18 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,19 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,20 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,24 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -136
SW	RA, 0(SP)
;Protocol.c,40 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,43 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer224
NOP	
J	L__Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer224:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer225
NOP	
J	L__Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer225:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer207:
;Protocol.c,44 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,45 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,46 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,47 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,43 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer209:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer208:
;Protocol.c,50 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer226:
; dif end address is: 20 (R5)
;Protocol.c,52 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer228:
;Protocol.c,53 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,54 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer229
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer229:
;Protocol.c,59 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,60 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer230:
;Protocol.c,61 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer9:
;Protocol.c,62 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,63 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,64 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,65 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,66 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer231
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer231:
;Protocol.c,68 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,70 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 26
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,71 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 26
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,72 :: 		str_len = strlen(str);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,77 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 26
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,78 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,93 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer232:
;Protocol.c,98 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,99 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,101 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,102 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,104 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,111 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer233
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer233:
;Protocol.c,112 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,113 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer234:
;Protocol.c,114 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,115 :: 		}else if(gcode[0][0] =='$'){
J	L_Sample_Ringbuffer15
NOP	
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer235
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer235:
;Protocol.c,117 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer236:
;Protocol.c,118 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,119 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,120 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,121 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,122 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,123 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,124 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,125 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,126 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,127 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,128 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer21:
;Protocol.c,129 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,130 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,131 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,132 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer22:
;Protocol.c,134 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,135 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,136 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,139 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer237
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer237:
;Protocol.c,140 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer23:
;Protocol.c,141 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,142 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer24:
;Protocol.c,143 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,147 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer238
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer238:
;Protocol.c,148 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,149 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,150 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,152 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer240:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,154 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SB	R2, Offset(_sys+1)(GP)
;Protocol.c,155 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,156 :: 		}
L_Sample_Ringbuffer26:
;Protocol.c,157 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,158 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer28:
;Protocol.c,159 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,160 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer241
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer241:
;Protocol.c,161 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,162 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,164 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,165 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,166 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,167 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer30:
;Protocol.c,168 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,169 :: 		if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer243
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer243:
;Protocol.c,171 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer245
NOP	
J	L__Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer245:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer247
NOP	
J	L__Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer247:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer211:
L__Sample_Ringbuffer210:
;Protocol.c,173 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer248:
;Protocol.c,175 :: 		} // Execute startup scripts after successful homing.
L_Sample_Ringbuffer35:
;Protocol.c,176 :: 		} else {
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,177 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,178 :: 		}
L_Sample_Ringbuffer36:
;Protocol.c,179 :: 		} else {
J	L_Sample_Ringbuffer37
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,180 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,181 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,182 :: 		break; //'H'
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,183 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer38:
;Protocol.c,184 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,185 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer249
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer249:
;Protocol.c,186 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer40:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer250:
;Protocol.c,187 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer252:
;Protocol.c,188 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,189 :: 		} else {
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer43:
;Protocol.c,190 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,191 :: 		}
L_Sample_Ringbuffer44:
;Protocol.c,186 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,196 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer41:
;Protocol.c,199 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,200 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,201 :: 		}else { // Store startup line
L_Sample_Ringbuffer39:
;Protocol.c,202 :: 		int N_Val = 0;
;Protocol.c,203 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,205 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer253
NOP	
J	L__Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer253:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer254
NOP	
J	L__Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer254:
L__Sample_Ringbuffer205:
;Protocol.c,206 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 123(SP)
MOVZ	R30, R0, R0
SB	R30, 124(SP)
;Protocol.c,208 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 123
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,209 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
SEH	R5, R7
;Protocol.c,212 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer49:
; N_Val start address is: 16 (R4)
; helper_var start address is: 20 (R5)
SH	R5, 20(SP)
SH	R4, 22(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 22(SP)
LH	R5, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer256
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer256:
J	L_Sample_Ringbuffer49
NOP	
L_Sample_Ringbuffer50:
;Protocol.c,213 :: 		dma_printf("%s\t%d\n",num,N_Val);
ADDIU	R3, SP, 123
ORI	R30, R0, 37
SB	R30, 116(SP)
ORI	R30, R0, 115
SB	R30, 117(SP)
ORI	R30, R0, 9
SB	R30, 118(SP)
ORI	R30, R0, 37
SB	R30, 119(SP)
ORI	R30, R0, 100
SB	R30, 120(SP)
ORI	R30, R0, 10
SB	R30, 121(SP)
MOVZ	R30, R0, R0
SB	R30, 122(SP)
ADDIU	R2, SP, 116
SH	R5, 20(SP)
SH	R4, 22(SP)
ADDIU	SP, SP, -12
SH	R4, 8(SP)
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R4, 22(SP)
LH	R5, 20(SP)
;Protocol.c,216 :: 		}else {
J	L_Sample_Ringbuffer51
NOP	
; N_Val end address is: 16 (R4)
; helper_var end address is: 20 (R5)
;Protocol.c,205 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer213:
L__Sample_Ringbuffer212:
;Protocol.c,217 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,219 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,220 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,223 :: 		if (helper_var) { // Store startup line
; helper_var start address is: 20 (R5)
; N_Val start address is: 16 (R4)
BNE	R5, R0, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer258:
; helper_var end address is: 20 (R5)
;Protocol.c,224 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer260:
; N_Val end address is: 16 (R4)
;Protocol.c,226 :: 		helper_var = strlen((gcode[0])); // Set helper variable as counter to start of gcode block
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,227 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 26
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,229 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer54:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer262:
J	L_Sample_Ringbuffer54
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,230 :: 		dma_printf("%s\n",str);
ADDIU	R3, SP, 26
ORI	R30, R0, 37
SB	R30, 125(SP)
ORI	R30, R0, 115
SB	R30, 126(SP)
ORI	R30, R0, 10
SB	R30, 127(SP)
MOVZ	R30, R0, R0
SB	R30, 128(SP)
ADDIU	R2, SP, 125
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,235 :: 		str_len = strlen(str);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,240 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,241 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,249 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 26
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,250 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,251 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,253 :: 		}else{ // Store global setting.
J	L_Sample_Ringbuffer57
NOP	
L_Sample_Ringbuffer52:
;Protocol.c,254 :: 		settings_store_global_setting(N_Val,0.00);
; N_Val start address is: 16 (R4)
MOVZ	R2, R0, R0
MTC1	R2, S12
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,258 :: 		}
L_Sample_Ringbuffer57:
;Protocol.c,260 :: 		break; //'N'
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,262 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer264:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer266:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer270:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer272:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer276:
L_Sample_Ringbuffer19:
;Protocol.c,264 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer58
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer277
NOP	
J	L__Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer277:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer278
NOP	
J	L__Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer278:
L__Sample_Ringbuffer204:
;Protocol.c,265 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 132(SP)
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,266 :: 		case 'G':case 'g':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,268 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer279:
;Protocol.c,269 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,270 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer280:
;Protocol.c,271 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,274 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L__Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer282:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L__Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer284:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L__Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer286:
SEH	R2, R4
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer216:
L__Sample_Ringbuffer215:
L__Sample_Ringbuffer214:
;Protocol.c,275 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer70:
;Protocol.c,276 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer71
NOP	
L_Sample_Ringbuffer67:
;Protocol.c,278 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 90
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
;Protocol.c,279 :: 		}
L_Sample_Ringbuffer71:
;Protocol.c,281 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,291 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer288:
;Protocol.c,293 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,294 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,295 :: 		case 'X':case 'x':
L_Sample_Ringbuffer75:
L_Sample_Ringbuffer76:
;Protocol.c,296 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer77:
L_Sample_Ringbuffer78:
;Protocol.c,297 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer80:
;Protocol.c,298 :: 		case 'A':case 'a':
L_Sample_Ringbuffer81:
L_Sample_Ringbuffer82:
;Protocol.c,299 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,300 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,304 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,305 :: 		case 'L':case 'l':
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer84:
;Protocol.c,306 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,307 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,311 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,312 :: 		case 'F':case 'f':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,313 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,314 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,318 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,319 :: 		case 'P':case 'p':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,320 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,321 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,325 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,326 :: 		case 'S':case 's':
L_Sample_Ringbuffer89:
L_Sample_Ringbuffer90:
;Protocol.c,327 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,328 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,332 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,333 :: 		}
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer300:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer304:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer320:
L_Sample_Ringbuffer74:
;Protocol.c,334 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,339 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer322:
;Protocol.c,341 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,342 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,343 :: 		case 'X':case 'x':
L_Sample_Ringbuffer94:
L_Sample_Ringbuffer95:
;Protocol.c,344 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
;Protocol.c,345 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,346 :: 		case 'A':case 'a':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,347 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,348 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,352 :: 		break;
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,353 :: 		case 'L':case 'l':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,354 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,355 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,359 :: 		break;
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,360 :: 		case 'F':case 'f':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,361 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,362 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,366 :: 		break;
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,367 :: 		case 'P':case 'p':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,368 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,369 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,373 :: 		break;
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,374 :: 		case 'S':case 's':
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,375 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,376 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,380 :: 		break;
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,381 :: 		}
L_Sample_Ringbuffer92:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer348:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer350:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer352:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer354:
L_Sample_Ringbuffer93:
;Protocol.c,382 :: 		}
L_Sample_Ringbuffer91:
;Protocol.c,386 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer356:
;Protocol.c,388 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,389 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer111
NOP	
;Protocol.c,390 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,391 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,392 :: 		case 'I':case 'i':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,393 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,394 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,398 :: 		break;
J	L_Sample_Ringbuffer112
NOP	
;Protocol.c,399 :: 		case 'F': case 'f':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,400 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,401 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,405 :: 		break;
J	L_Sample_Ringbuffer112
NOP	
;Protocol.c,406 :: 		}
L_Sample_Ringbuffer111:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer378:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer380:
L_Sample_Ringbuffer112:
;Protocol.c,407 :: 		}
L_Sample_Ringbuffer110:
;Protocol.c,412 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer382:
;Protocol.c,413 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,414 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,415 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,416 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,417 :: 		case 'J':case 'j':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,418 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,419 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,423 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,424 :: 		case 'F':case 'f':
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
;Protocol.c,425 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,426 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,430 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,432 :: 		}
L_Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer390:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer392:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer394:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer398:
L_Sample_Ringbuffer127:
;Protocol.c,433 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,437 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer400:
;Protocol.c,438 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 99
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,439 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,440 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,441 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,442 :: 		case 'J':case 'j':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,443 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,444 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,448 :: 		break;
J	L_Sample_Ringbuffer138
NOP	
;Protocol.c,449 :: 		case 'F':case 'f':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,450 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,451 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,455 :: 		break;
J	L_Sample_Ringbuffer138
NOP	
;Protocol.c,456 :: 		}
L_Sample_Ringbuffer137:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer412:
L_Sample_Ringbuffer138:
;Protocol.c,457 :: 		}
L_Sample_Ringbuffer136:
;Protocol.c,460 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer414:
;Protocol.c,461 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,462 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,463 :: 		case 'J':case 'j':
L_Sample_Ringbuffer148:
L_Sample_Ringbuffer149:
;Protocol.c,464 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,465 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,469 :: 		break;
J	L_Sample_Ringbuffer147
NOP	
;Protocol.c,470 :: 		case 'F':case 'f':
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
;Protocol.c,471 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,472 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,476 :: 		break;
J	L_Sample_Ringbuffer147
NOP	
;Protocol.c,478 :: 		}
L_Sample_Ringbuffer146:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer422:
L_Sample_Ringbuffer147:
;Protocol.c,479 :: 		}
L_Sample_Ringbuffer145:
;Protocol.c,480 :: 		}else {
J	L_Sample_Ringbuffer152
NOP	
L_Sample_Ringbuffer66:
;Protocol.c,481 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,482 :: 		}
L_Sample_Ringbuffer152:
;Protocol.c,483 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,484 :: 		case 'M':
L_Sample_Ringbuffer153:
;Protocol.c,485 :: 		case 'm':
L_Sample_Ringbuffer154:
;Protocol.c,487 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,488 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,489 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,495 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer424:
;Protocol.c,496 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,497 :: 		case 'S':
L_Sample_Ringbuffer158:
;Protocol.c,498 :: 		case 's':
L_Sample_Ringbuffer159:
;Protocol.c,500 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,501 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 112(SP)
;Protocol.c,502 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,506 :: 		break;
J	L_Sample_Ringbuffer157
NOP	
;Protocol.c,507 :: 		}
L_Sample_Ringbuffer156:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer428:
L_Sample_Ringbuffer157:
;Protocol.c,508 :: 		}
L_Sample_Ringbuffer155:
;Protocol.c,509 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,510 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
;Protocol.c,511 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,512 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer429:
;Protocol.c,513 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,514 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,515 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,519 :: 		}
L_Sample_Ringbuffer168:
;Protocol.c,523 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer431:
;Protocol.c,524 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 99
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,525 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,526 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,527 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,528 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,529 :: 		case 'A':case 'a':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,530 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,531 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,535 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,536 :: 		case 'F':
L_Sample_Ringbuffer178:
;Protocol.c,537 :: 		case 'f':
L_Sample_Ringbuffer179:
;Protocol.c,540 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,541 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,546 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,548 :: 		}
L_Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer435:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer437:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer445:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer447:
L_Sample_Ringbuffer171:
;Protocol.c,549 :: 		}
L_Sample_Ringbuffer169:
;Protocol.c,550 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,551 :: 		case 'F':
L_Sample_Ringbuffer180:
;Protocol.c,553 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer448:
;Protocol.c,554 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,555 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,556 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,560 :: 		}
L_Sample_Ringbuffer181:
;Protocol.c,561 :: 		break;
J	L_Sample_Ringbuffer63
NOP	
;Protocol.c,563 :: 		}
L_Sample_Ringbuffer62:
LH	R4, 132(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer450:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer452:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer454:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer456:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer458:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer460:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer462:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer464:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer466:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer468:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer470:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer472:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer474:
L_Sample_Ringbuffer63:
;Protocol.c,264 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer218:
L__Sample_Ringbuffer217:
;Protocol.c,564 :: 		}
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer15:
;Protocol.c,566 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer475:
;Protocol.c,567 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,568 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,569 :: 		}
L_Sample_Ringbuffer182:
;Protocol.c,571 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 24(SP)
;Protocol.c,572 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,574 :: 		if(!status)
LH	R2, 24(SP)
BEQ	R2, R0, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer476:
;Protocol.c,575 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer183:
;Protocol.c,578 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,581 :: 		return status;
LH	R2, 24(SP)
;Protocol.c,582 :: 		}
;Protocol.c,581 :: 		return status;
;Protocol.c,582 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 136
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,587 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,589 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,590 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,591 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,592 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit184:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit478
NOP	
J	L_Protocol_strsplit185
NOP	
L_Protocol_strsplit478:
;Protocol.c,593 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,594 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit480
NOP	
J	L_Protocol_strsplit202
NOP	
L_Protocol_strsplit480:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit482
NOP	
J	L_Protocol_strsplit201
NOP	
L_Protocol_strsplit482:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit483
NOP	
J	L_Protocol_strsplit200
NOP	
L_Protocol_strsplit483:
J	L_Protocol_strsplit189
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit202:
L_Protocol_strsplit201:
L_Protocol_strsplit200:
;Protocol.c,595 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,596 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,597 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,598 :: 		continue;
J	L_Protocol_strsplit186
NOP	
;Protocol.c,599 :: 		}else{
L_Protocol_strsplit189:
;Protocol.c,600 :: 		arg[kk][ii++] = *(str+i);
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R8, 1
SEH	R8, R2
;Protocol.c,602 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit484
NOP	
J	L_Protocol_strsplit191
NOP	
L_Protocol_strsplit484:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,603 :: 		break;
J	L_Protocol_strsplit185
NOP	
L_Protocol_strsplit191:
;Protocol.c,604 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit186:
;Protocol.c,592 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,604 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit184
NOP	
L_Protocol_strsplit185:
;Protocol.c,605 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,606 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,607 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,611 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,614 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,615 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,617 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,618 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str192:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str487
NOP	
J	L_Protocol_cpy_val_from_str193
NOP	
L_Protocol_cpy_val_from_str487:
;Protocol.c,619 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,620 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,621 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str192
NOP	
L_Protocol_cpy_val_from_str193:
;Protocol.c,622 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,624 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,625 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,630 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,632 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,634 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,636 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int194:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int489
NOP	
J	L_Protocol_str2int195
NOP	
L_Protocol_str2int489:
;Protocol.c,637 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,638 :: 		while(DMA_IsOn(1));
L_Protocol_str2int197:
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
BNE	R2, R0, L_Protocol_str2int491
NOP	
J	L_Protocol_str2int198
NOP	
L_Protocol_str2int491:
J	L_Protocol_str2int197
NOP	
L_Protocol_str2int198:
;Protocol.c,636 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,639 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int194
NOP	
L_Protocol_str2int195:
;Protocol.c,641 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,642 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
