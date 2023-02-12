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
BNE	R2, R0, L__Str_Initialize249
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize249:
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
ADDIU	SP, SP, -128
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
BNE	R2, R0, L__Sample_Ringbuffer253
NOP	
J	L__Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer253:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer254
NOP	
J	L__Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer254:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer229:
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
L__Sample_Ringbuffer231:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer230:
;Protocol.c,50 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer255
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer255:
; dif end address is: 20 (R5)
;Protocol.c,52 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer257
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer257:
;Protocol.c,53 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,54 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer258:
;Protocol.c,59 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,60 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer259:
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
BEQ	R2, R0, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer260:
;Protocol.c,68 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,70 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 24
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,71 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,72 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,77 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
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
BEQ	R3, R2, L__Sample_Ringbuffer261
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer261:
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
BEQ	R3, R2, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer262:
;Protocol.c,112 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,113 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer263:
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
BEQ	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer264:
;Protocol.c,117 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer265:
;Protocol.c,118 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,119 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,120 :: 		status = STATUS_OK;
SH	R0, 22(SP)
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
BEQ	R2, R0, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer266:
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
BEQ	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer267:
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
BNE	R2, R0, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer269:
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
BEQ	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer270:
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
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer272:
;Protocol.c,171 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer274
NOP	
J	L__Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L__Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer276:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer233:
L__Sample_Ringbuffer232:
;Protocol.c,173 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer277:
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
BNE	R2, R0, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer278:
;Protocol.c,186 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer40:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer279:
;Protocol.c,187 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer281
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer281:
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
;Protocol.c,208 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L__Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer282:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer283
NOP	
J	L__Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer283:
L__Sample_Ringbuffer227:
;Protocol.c,209 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 112(SP)
MOVZ	R30, R0, R0
SB	R30, 113(SP)
;Protocol.c,211 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 112
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,212 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,219 :: 		}else {
J	L_Sample_Ringbuffer49
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,208 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer235:
L__Sample_Ringbuffer234:
;Protocol.c,220 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,222 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,223 :: 		}
L_Sample_Ringbuffer49:
;Protocol.c,226 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer285:
; helper_var end address is: 28 (R7)
;Protocol.c,227 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer287:
; N_Val end address is: 16 (R4)
;Protocol.c,230 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,231 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,239 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,244 :: 		}else{
J	L_Sample_Ringbuffer52
NOP	
L_Sample_Ringbuffer51:
;Protocol.c,245 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,253 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,254 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,255 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,257 :: 		}
L_Sample_Ringbuffer50:
;Protocol.c,259 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,260 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer53:
L_Sample_Ringbuffer54:
L_Sample_Ringbuffer55:
L_Sample_Ringbuffer56:
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer58:
;Protocol.c,261 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,265 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer289
NOP	
J	L__Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer289:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer291
NOP	
J	L__Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer291:
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer237:
L__Sample_Ringbuffer236:
;Protocol.c,266 :: 		char str_val[9]={0};
ADDIU	R23, SP, 114
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,267 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,268 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,269 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer292:
;Protocol.c,271 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 114
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,272 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer294
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer294:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 114
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer245:
L_Sample_Ringbuffer67:
;Protocol.c,273 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 114
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,274 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer68
NOP	
L_Sample_Ringbuffer66:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer295
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer295:
;Protocol.c,276 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 114
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,277 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer297
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer297:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 114
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer246:
SEH	R5, R6
L_Sample_Ringbuffer70:
;Protocol.c,278 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 114
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,279 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 114
SH	R5, 20(SP)
SEH	R27, R2
LUI	R26, hi_addr(_gcode+4)
ORI	R26, R26, lo_addr(_gcode+4)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
; N_Val end address is: 20 (R5)
LH	R5, 20(SP)
SEH	R7, R5
;Protocol.c,280 :: 		}
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer247:
;Protocol.c,274 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,280 :: 		}
L_Sample_Ringbuffer69:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer68:
;Protocol.c,283 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer298
NOP	
J	L__Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer298:
; value end address is: 8 (R2)
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer300
NOP	
J	L__Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer300:
J	L_Sample_Ringbuffer73
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer239:
L__Sample_Ringbuffer238:
;Protocol.c,284 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,285 :: 		}
L_Sample_Ringbuffer73:
;Protocol.c,286 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 114
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,291 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,294 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,295 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,296 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,297 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,298 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,300 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer304:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer334:
L_Sample_Ringbuffer19:
;Protocol.c,302 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer74
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer335
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer335:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer336
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer336:
L__Sample_Ringbuffer224:
;Protocol.c,303 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer78
NOP	
;Protocol.c,304 :: 		case 'G':case 'g':
L_Sample_Ringbuffer80:
L_Sample_Ringbuffer81:
;Protocol.c,306 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer337:
;Protocol.c,307 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,308 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer338:
;Protocol.c,309 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,312 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer340:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer342:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer344:
SEH	R2, R4
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer242:
L__Sample_Ringbuffer241:
L__Sample_Ringbuffer240:
;Protocol.c,313 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer86:
;Protocol.c,314 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer87
NOP	
L_Sample_Ringbuffer83:
;Protocol.c,316 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 88
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
;Protocol.c,317 :: 		}
L_Sample_Ringbuffer87:
;Protocol.c,319 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,329 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer346:
;Protocol.c,331 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,332 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,333 :: 		case 'X':case 'x':
L_Sample_Ringbuffer91:
L_Sample_Ringbuffer92:
;Protocol.c,334 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer93:
L_Sample_Ringbuffer94:
;Protocol.c,335 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
;Protocol.c,336 :: 		case 'A':case 'a':
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,337 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,338 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,342 :: 		break;
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,343 :: 		case 'L':case 'l':
L_Sample_Ringbuffer99:
L_Sample_Ringbuffer100:
;Protocol.c,344 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,345 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,349 :: 		break;
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,350 :: 		case 'F':case 'f':
L_Sample_Ringbuffer101:
L_Sample_Ringbuffer102:
;Protocol.c,351 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,352 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,356 :: 		break;
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,357 :: 		case 'P':case 'p':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,358 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,359 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,363 :: 		break;
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,364 :: 		case 'S':case 's':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,365 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,366 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,370 :: 		break;
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,371 :: 		}
L_Sample_Ringbuffer89:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer348:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer350:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer352:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer354:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer356:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer378:
L_Sample_Ringbuffer90:
;Protocol.c,372 :: 		}
L_Sample_Ringbuffer88:
;Protocol.c,377 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer380:
;Protocol.c,379 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,380 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer108
NOP	
;Protocol.c,381 :: 		case 'X':case 'x':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,382 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
;Protocol.c,383 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,384 :: 		case 'A':case 'a':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
;Protocol.c,385 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,386 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,390 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,391 :: 		case 'L':case 'l':
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,392 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,393 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,397 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,398 :: 		case 'F':case 'f':
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
;Protocol.c,399 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,400 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,404 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,405 :: 		case 'P':case 'p':
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
;Protocol.c,406 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,407 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,411 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,412 :: 		case 'S':case 's':
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
;Protocol.c,413 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,414 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,418 :: 		break;
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,419 :: 		}
L_Sample_Ringbuffer108:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer390:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer392:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer394:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer398:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer400:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer412:
L_Sample_Ringbuffer109:
;Protocol.c,420 :: 		}
L_Sample_Ringbuffer107:
;Protocol.c,424 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer414:
;Protocol.c,426 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,427 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,428 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,429 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer133:
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
;Protocol.c,430 :: 		case 'I':case 'i':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,431 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,432 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,436 :: 		break;
J	L_Sample_Ringbuffer128
NOP	
;Protocol.c,437 :: 		case 'F': case 'f':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,438 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,439 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,443 :: 		break;
J	L_Sample_Ringbuffer128
NOP	
;Protocol.c,444 :: 		}
L_Sample_Ringbuffer127:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer438:
L_Sample_Ringbuffer128:
;Protocol.c,445 :: 		}
L_Sample_Ringbuffer126:
;Protocol.c,450 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer440:
;Protocol.c,451 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,452 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer142
NOP	
;Protocol.c,453 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,454 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer146:
L_Sample_Ringbuffer147:
;Protocol.c,455 :: 		case 'J':case 'j':
L_Sample_Ringbuffer148:
L_Sample_Ringbuffer149:
;Protocol.c,456 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,457 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,461 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,462 :: 		case 'F':case 'f':
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
;Protocol.c,463 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,464 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,468 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,470 :: 		}
L_Sample_Ringbuffer142:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer456:
L_Sample_Ringbuffer143:
;Protocol.c,471 :: 		}
L_Sample_Ringbuffer141:
;Protocol.c,475 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer458:
;Protocol.c,476 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,477 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,478 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,479 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,480 :: 		case 'J':case 'j':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
;Protocol.c,481 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,482 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,486 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,487 :: 		case 'F':case 'f':
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
;Protocol.c,488 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,489 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,493 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,494 :: 		}
L_Sample_Ringbuffer153:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer462:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer466:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer468:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer470:
L_Sample_Ringbuffer154:
;Protocol.c,495 :: 		}
L_Sample_Ringbuffer152:
;Protocol.c,498 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer472:
;Protocol.c,499 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,500 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer162
NOP	
;Protocol.c,501 :: 		case 'J':case 'j':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,502 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,503 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,507 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,508 :: 		case 'F':case 'f':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,509 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,510 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,514 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,516 :: 		}
L_Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer478:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer480:
L_Sample_Ringbuffer163:
;Protocol.c,517 :: 		}
L_Sample_Ringbuffer161:
;Protocol.c,518 :: 		}else {
J	L_Sample_Ringbuffer168
NOP	
L_Sample_Ringbuffer82:
;Protocol.c,519 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,520 :: 		}
L_Sample_Ringbuffer168:
;Protocol.c,521 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,522 :: 		case 'M':
L_Sample_Ringbuffer169:
;Protocol.c,523 :: 		case 'm':
L_Sample_Ringbuffer170:
;Protocol.c,525 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,526 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,527 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,533 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer482:
;Protocol.c,534 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer172
NOP	
;Protocol.c,535 :: 		case 'S':
L_Sample_Ringbuffer174:
;Protocol.c,536 :: 		case 's':
L_Sample_Ringbuffer175:
;Protocol.c,538 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,539 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 108(SP)
;Protocol.c,540 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,544 :: 		break;
J	L_Sample_Ringbuffer173
NOP	
;Protocol.c,545 :: 		}
L_Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer484:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer486:
L_Sample_Ringbuffer173:
;Protocol.c,546 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,547 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,548 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
L_Sample_Ringbuffer178:
L_Sample_Ringbuffer179:
;Protocol.c,549 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer180:
L_Sample_Ringbuffer181:
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
;Protocol.c,550 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer487:
;Protocol.c,551 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,552 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,553 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,557 :: 		}
L_Sample_Ringbuffer184:
;Protocol.c,561 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer489:
;Protocol.c,562 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,563 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,564 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer186
NOP	
;Protocol.c,565 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
;Protocol.c,566 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
;Protocol.c,567 :: 		case 'A':case 'a':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,568 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,569 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,573 :: 		break;
J	L_Sample_Ringbuffer187
NOP	
;Protocol.c,574 :: 		case 'F':
L_Sample_Ringbuffer194:
;Protocol.c,575 :: 		case 'f':
L_Sample_Ringbuffer195:
;Protocol.c,578 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,579 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,584 :: 		break;
J	L_Sample_Ringbuffer187
NOP	
;Protocol.c,586 :: 		}
L_Sample_Ringbuffer186:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer493:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer495:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer499:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer505:
L_Sample_Ringbuffer187:
;Protocol.c,587 :: 		}
L_Sample_Ringbuffer185:
;Protocol.c,588 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,589 :: 		case 'F':
L_Sample_Ringbuffer196:
;Protocol.c,591 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer506:
;Protocol.c,592 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 88
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,593 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,594 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,598 :: 		}
L_Sample_Ringbuffer197:
;Protocol.c,599 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,601 :: 		}
L_Sample_Ringbuffer78:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer508
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer508:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer510:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer512:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer514:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer516:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer518:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer520:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer522:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer524:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer526:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer528:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer530:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer532:
L_Sample_Ringbuffer79:
;Protocol.c,302 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer244:
L__Sample_Ringbuffer243:
;Protocol.c,602 :: 		}
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer15:
;Protocol.c,604 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer533:
;Protocol.c,605 :: 		status = STATUS_OK;
SH	R0, 22(SP)
;Protocol.c,606 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,607 :: 		}else if(query == 2){
L_Sample_Ringbuffer198:
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer534:
;Protocol.c,608 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 22(SP)
;Protocol.c,609 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,610 :: 		}else if(query == 3){
L_Sample_Ringbuffer200:
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer535:
;Protocol.c,611 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 22(SP)
;Protocol.c,612 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,613 :: 		}
L_Sample_Ringbuffer202:
;Protocol.c,615 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,616 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,618 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer536:
;Protocol.c,619 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer203:
;Protocol.c,622 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,625 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,626 :: 		}
;Protocol.c,625 :: 		return status;
;Protocol.c,626 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 128
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,631 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,633 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,634 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,635 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,636 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit204:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit538
NOP	
J	L_Protocol_strsplit205
NOP	
L_Protocol_strsplit538:
;Protocol.c,637 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,638 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit540
NOP	
J	L_Protocol_strsplit222
NOP	
L_Protocol_strsplit540:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit542
NOP	
J	L_Protocol_strsplit221
NOP	
L_Protocol_strsplit542:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit543
NOP	
J	L_Protocol_strsplit220
NOP	
L_Protocol_strsplit543:
J	L_Protocol_strsplit209
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit222:
L_Protocol_strsplit221:
L_Protocol_strsplit220:
;Protocol.c,639 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,640 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,641 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,642 :: 		continue;
J	L_Protocol_strsplit206
NOP	
;Protocol.c,643 :: 		}else{
L_Protocol_strsplit209:
;Protocol.c,644 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,646 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit544
NOP	
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit544:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,647 :: 		break;
J	L_Protocol_strsplit205
NOP	
L_Protocol_strsplit211:
;Protocol.c,648 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit206:
;Protocol.c,636 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,648 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit204
NOP	
L_Protocol_strsplit205:
;Protocol.c,649 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,650 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,651 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,655 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,658 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,659 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,661 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,662 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str212:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str547
NOP	
J	L_Protocol_cpy_val_from_str213
NOP	
L_Protocol_cpy_val_from_str547:
;Protocol.c,663 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,664 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,665 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str212
NOP	
L_Protocol_cpy_val_from_str213:
;Protocol.c,666 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,668 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,669 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,674 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,676 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,678 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,680 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int214:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int549
NOP	
J	L_Protocol_str2int215
NOP	
L_Protocol_str2int549:
;Protocol.c,681 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,682 :: 		while(DMA_IsOn(1));
L_Protocol_str2int217:
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
BNE	R2, R0, L_Protocol_str2int551
NOP	
J	L_Protocol_str2int218
NOP	
L_Protocol_str2int551:
J	L_Protocol_str2int217
NOP	
L_Protocol_str2int218:
;Protocol.c,680 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,683 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int214
NOP	
L_Protocol_str2int215:
;Protocol.c,685 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,686 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
