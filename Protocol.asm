_Str_Initialize:
;Protocol.c,32 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,34 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize284
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize284:
;Protocol.c,35 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,34 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,36 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,37 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,39 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,40 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,41 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,45 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,55 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,56 :: 		int axis_to_run = 0;
;Protocol.c,62 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,65 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L__Sample_Ringbuffer262
NOP	
L__Sample_Ringbuffer288:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L__Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer289:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer260:
;Protocol.c,66 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,67 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,68 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,69 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,65 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer262:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer261:
;Protocol.c,72 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer290:
; dif end address is: 20 (R5)
;Protocol.c,74 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer292:
;Protocol.c,75 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,76 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer293:
;Protocol.c,81 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,82 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer294:
;Protocol.c,83 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer9:
;Protocol.c,84 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,85 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,86 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,87 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,88 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer295:
;Protocol.c,90 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,92 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,93 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,94 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,99 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,101 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,121 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer296:
;Protocol.c,126 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,127 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,129 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,130 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,132 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,139 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer297
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer297:
;Protocol.c,140 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,141 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer298:
;Protocol.c,142 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,143 :: 		}else if(gcode[0][0] =='$'){
J	L_Sample_Ringbuffer15
NOP	
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer299:
;Protocol.c,145 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer300:
;Protocol.c,146 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,147 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,148 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,149 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,150 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,151 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,152 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,153 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,154 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,155 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,156 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer21:
;Protocol.c,157 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,158 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,159 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,160 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer22:
;Protocol.c,162 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,163 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,164 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,167 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer301
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer301:
;Protocol.c,168 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer23:
;Protocol.c,169 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,170 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer24:
;Protocol.c,171 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,175 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer302:
;Protocol.c,176 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,177 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,178 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,180 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer304:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,182 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,183 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,184 :: 		}
L_Sample_Ringbuffer26:
;Protocol.c,185 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,186 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer28:
;Protocol.c,187 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,188 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer305:
;Protocol.c,189 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,190 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,192 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,193 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,194 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,195 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer30:
;Protocol.c,196 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,198 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer307:
;Protocol.c,199 :: 		int axis_to_home = 0;
;Protocol.c,202 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer309
NOP	
J	L__Sample_Ringbuffer264
NOP	
L__Sample_Ringbuffer309:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L__Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer311:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer264:
L__Sample_Ringbuffer263:
;Protocol.c,203 :: 		int i = 0;
;Protocol.c,204 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,207 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,208 :: 		for(i=1;i<NoOfAxis;i++)
; i start address is: 12 (R3)
ORI	R3, R0, 1
; i end address is: 12 (R3)
L_Sample_Ringbuffer35:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer312:
;Protocol.c,209 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,208 :: 		for(i=1;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,209 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer35
NOP	
L_Sample_Ringbuffer36:
;Protocol.c,215 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer314:
;Protocol.c,216 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,218 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,219 :: 		} else {
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,220 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,221 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,222 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,223 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,224 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,225 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,227 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer41:
;Protocol.c,228 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,229 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer315:
;Protocol.c,230 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer43:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer316:
;Protocol.c,231 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer318:
;Protocol.c,232 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,233 :: 		} else {
J	L_Sample_Ringbuffer47
NOP	
L_Sample_Ringbuffer46:
;Protocol.c,234 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,235 :: 		}
L_Sample_Ringbuffer47:
;Protocol.c,230 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,240 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer43
NOP	
L_Sample_Ringbuffer44:
;Protocol.c,243 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,244 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,245 :: 		}else { // Store startup line
L_Sample_Ringbuffer42:
;Protocol.c,246 :: 		int N_Val = 0;
;Protocol.c,247 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,252 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer319
NOP	
J	L__Sample_Ringbuffer266
NOP	
L__Sample_Ringbuffer319:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer320
NOP	
J	L__Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer320:
L__Sample_Ringbuffer258:
;Protocol.c,253 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,255 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,256 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,263 :: 		}else {
J	L_Sample_Ringbuffer52
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,252 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer266:
L__Sample_Ringbuffer265:
;Protocol.c,264 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,266 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,267 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,270 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer322:
; helper_var end address is: 28 (R7)
;Protocol.c,271 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer324:
; N_Val end address is: 16 (R4)
;Protocol.c,274 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,275 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,283 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,288 :: 		}else{
J	L_Sample_Ringbuffer55
NOP	
L_Sample_Ringbuffer54:
;Protocol.c,289 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,297 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,298 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,299 :: 		}
L_Sample_Ringbuffer55:
;Protocol.c,301 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,303 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,304 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer56:
;Protocol.c,305 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,306 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,307 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer57:
;Protocol.c,308 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,309 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,310 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer58:
;Protocol.c,311 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,312 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,314 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
;Protocol.c,315 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
;Protocol.c,319 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L__Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L__Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer328:
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer268:
L__Sample_Ringbuffer267:
;Protocol.c,320 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,321 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,322 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,323 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer329:
;Protocol.c,325 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,326 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer331
NOP	
J	L__Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer331:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer276:
L_Sample_Ringbuffer73:
;Protocol.c,327 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 115
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,328 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer74
NOP	
L_Sample_Ringbuffer72:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L__Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer332:
;Protocol.c,330 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,331 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer334
NOP	
J	L__Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer334:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer277:
SEH	R5, R6
L_Sample_Ringbuffer76:
;Protocol.c,332 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,333 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 115
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
;Protocol.c,334 :: 		}
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer278:
;Protocol.c,328 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,334 :: 		}
L_Sample_Ringbuffer75:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer74:
;Protocol.c,337 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer335
NOP	
J	L__Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer335:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer337
NOP	
J	L__Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer337:
J	L_Sample_Ringbuffer79
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer270:
L__Sample_Ringbuffer269:
;Protocol.c,338 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,339 :: 		}
L_Sample_Ringbuffer79:
;Protocol.c,340 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,345 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,348 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,349 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,350 :: 		}
L_Sample_Ringbuffer71:
;Protocol.c,351 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,352 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,354 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer347:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer349:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer353:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer355:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer357
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer357:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer359:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer363:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer365:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer367:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer369:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer373:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer375:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer377:
L_Sample_Ringbuffer19:
;Protocol.c,356 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer80
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer378
NOP	
J	L__Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer378:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer379
NOP	
J	L__Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer379:
L__Sample_Ringbuffer255:
;Protocol.c,357 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,358 :: 		case 'G':case 'g':
L_Sample_Ringbuffer86:
L_Sample_Ringbuffer87:
;Protocol.c,360 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer380:
;Protocol.c,361 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,362 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer381:
;Protocol.c,363 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,366 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L__Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer383:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L__Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer385:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L__Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer387:
SEH	R2, R4
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer273:
L__Sample_Ringbuffer272:
L__Sample_Ringbuffer271:
;Protocol.c,367 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer92:
;Protocol.c,368 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer93
NOP	
L_Sample_Ringbuffer89:
;Protocol.c,370 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 98
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
;Protocol.c,371 :: 		}
L_Sample_Ringbuffer93:
;Protocol.c,373 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,383 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer389:
;Protocol.c,388 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,389 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,390 :: 		case 'X':case 'x':
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,391 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer99:
L_Sample_Ringbuffer100:
;Protocol.c,392 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer101:
L_Sample_Ringbuffer102:
;Protocol.c,393 :: 		case 'A':case 'a':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,394 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,395 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,399 :: 		break;
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,400 :: 		case 'L':case 'l':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,401 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,402 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,406 :: 		break;
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,407 :: 		case 'F':case 'f':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,408 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,409 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,413 :: 		break;
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,414 :: 		case 'P':case 'p':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,415 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,416 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,420 :: 		break;
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,421 :: 		case 'S':case 's':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,422 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,423 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,427 :: 		break;
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,428 :: 		}
L_Sample_Ringbuffer95:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer391:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer393:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer395:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer397:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer399:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer401
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer401:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer403
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer403:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer405
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer405:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer407:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer409:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer411:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer413:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer415:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer417:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer419:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer421:
L_Sample_Ringbuffer96:
;Protocol.c,429 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,434 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer423:
;Protocol.c,436 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,437 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,438 :: 		case 'X':case 'x':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
;Protocol.c,439 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,440 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
;Protocol.c,441 :: 		case 'A':case 'a':
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
;Protocol.c,442 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,443 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,447 :: 		break;
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,448 :: 		case 'L':case 'l':
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
;Protocol.c,449 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,450 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,454 :: 		break;
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,455 :: 		case 'F':case 'f':
L_Sample_Ringbuffer126:
L_Sample_Ringbuffer127:
;Protocol.c,456 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,457 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,461 :: 		break;
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,462 :: 		case 'P':case 'p':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,463 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,464 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,468 :: 		break;
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,469 :: 		case 'S':case 's':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,470 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,471 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,475 :: 		break;
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,476 :: 		}
L_Sample_Ringbuffer114:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer425:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer427:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer429:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer431:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer435:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer437:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer445:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer447:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer449:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer451
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer451:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer453
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer453:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer455:
L_Sample_Ringbuffer115:
;Protocol.c,477 :: 		}
L_Sample_Ringbuffer113:
;Protocol.c,481 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer457
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer457:
;Protocol.c,483 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,484 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer133
NOP	
;Protocol.c,485 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,486 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,487 :: 		case 'I':case 'i':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,488 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,489 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,493 :: 		break;
J	L_Sample_Ringbuffer134
NOP	
;Protocol.c,494 :: 		case 'F': case 'f':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,495 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,496 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,500 :: 		break;
J	L_Sample_Ringbuffer134
NOP	
;Protocol.c,501 :: 		}
L_Sample_Ringbuffer133:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer459
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer459:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer461:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer463:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer465:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer467:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer469:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer471
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer471:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer475:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer479:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer481:
L_Sample_Ringbuffer134:
;Protocol.c,502 :: 		}
L_Sample_Ringbuffer132:
;Protocol.c,507 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer483:
;Protocol.c,508 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,509 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,510 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
;Protocol.c,511 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer152:
L_Sample_Ringbuffer153:
;Protocol.c,512 :: 		case 'J':case 'j':
L_Sample_Ringbuffer154:
L_Sample_Ringbuffer155:
;Protocol.c,513 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,514 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,518 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,519 :: 		case 'F':case 'f':
L_Sample_Ringbuffer156:
L_Sample_Ringbuffer157:
;Protocol.c,520 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,521 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,525 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,527 :: 		}
L_Sample_Ringbuffer148:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer493:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer495:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer499:
L_Sample_Ringbuffer149:
;Protocol.c,528 :: 		}
L_Sample_Ringbuffer147:
;Protocol.c,532 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer501:
;Protocol.c,533 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,534 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,535 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,536 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
;Protocol.c,537 :: 		case 'J':case 'j':
L_Sample_Ringbuffer163:
L_Sample_Ringbuffer164:
;Protocol.c,538 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,539 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,543 :: 		break;
J	L_Sample_Ringbuffer160
NOP	
;Protocol.c,544 :: 		case 'F':case 'f':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,545 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,546 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,550 :: 		break;
J	L_Sample_Ringbuffer160
NOP	
;Protocol.c,551 :: 		}
L_Sample_Ringbuffer159:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer513:
L_Sample_Ringbuffer160:
;Protocol.c,552 :: 		}
L_Sample_Ringbuffer158:
;Protocol.c,555 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer515:
;Protocol.c,556 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,557 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer168
NOP	
;Protocol.c,558 :: 		case 'J':case 'j':
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
;Protocol.c,559 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,560 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,564 :: 		break;
J	L_Sample_Ringbuffer169
NOP	
;Protocol.c,565 :: 		case 'F':case 'f':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,566 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,567 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,571 :: 		break;
J	L_Sample_Ringbuffer169
NOP	
;Protocol.c,573 :: 		}
L_Sample_Ringbuffer168:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer519:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer521:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer523:
L_Sample_Ringbuffer169:
;Protocol.c,574 :: 		}
L_Sample_Ringbuffer167:
;Protocol.c,575 :: 		}else {
J	L_Sample_Ringbuffer174
NOP	
L_Sample_Ringbuffer88:
;Protocol.c,576 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,577 :: 		}
L_Sample_Ringbuffer174:
;Protocol.c,578 :: 		break;
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,579 :: 		case 'M':
L_Sample_Ringbuffer175:
;Protocol.c,580 :: 		case 'm':
L_Sample_Ringbuffer176:
;Protocol.c,582 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,583 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,584 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,590 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer525:
;Protocol.c,591 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer178
NOP	
;Protocol.c,592 :: 		case 'S':
L_Sample_Ringbuffer180:
;Protocol.c,593 :: 		case 's':
L_Sample_Ringbuffer181:
;Protocol.c,595 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,596 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,597 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,601 :: 		break;
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,602 :: 		}
L_Sample_Ringbuffer178:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer527:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer529:
L_Sample_Ringbuffer179:
;Protocol.c,603 :: 		}
L_Sample_Ringbuffer177:
;Protocol.c,604 :: 		break;
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,605 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
;Protocol.c,606 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
;Protocol.c,607 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer530:
;Protocol.c,608 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,609 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,610 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,614 :: 		}
L_Sample_Ringbuffer190:
;Protocol.c,618 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer532:
;Protocol.c,619 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,620 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,621 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,622 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,623 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
;Protocol.c,624 :: 		case 'A':case 'a':
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,625 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,626 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,630 :: 		break;
J	L_Sample_Ringbuffer193
NOP	
;Protocol.c,631 :: 		case 'F':
L_Sample_Ringbuffer200:
;Protocol.c,632 :: 		case 'f':
L_Sample_Ringbuffer201:
;Protocol.c,635 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,636 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,641 :: 		break;
J	L_Sample_Ringbuffer193
NOP	
;Protocol.c,642 :: 		}
L_Sample_Ringbuffer192:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer534:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer536:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer538:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer542:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer544:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer546:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer548:
L_Sample_Ringbuffer193:
;Protocol.c,643 :: 		}
L_Sample_Ringbuffer191:
;Protocol.c,644 :: 		break;
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,645 :: 		case 'F':
L_Sample_Ringbuffer202:
;Protocol.c,647 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer549:
;Protocol.c,648 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,649 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,650 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,654 :: 		}
L_Sample_Ringbuffer203:
;Protocol.c,655 :: 		break;
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,657 :: 		}
L_Sample_Ringbuffer84:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer551:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer553:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer555:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer557:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer559:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer561
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer561:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer563
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer563:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer565:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer567
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer567:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer569
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer569:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer571
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer571:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer573
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer573:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer575:
L_Sample_Ringbuffer85:
;Protocol.c,356 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer275:
L__Sample_Ringbuffer274:
;Protocol.c,658 :: 		}
L_Sample_Ringbuffer80:
L_Sample_Ringbuffer15:
;Protocol.c,660 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer576
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer576:
SH	R0, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer204:
;Protocol.c,661 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer577:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer206:
;Protocol.c,662 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer578
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer578:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer208:
;Protocol.c,665 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 28(SP)
;Protocol.c,666 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,669 :: 		if(!status)
LH	R2, 28(SP)
BEQ	R2, R0, L__Sample_Ringbuffer579
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer579:
;Protocol.c,670 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer209:
;Protocol.c,671 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,674 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,675 :: 		}
;Protocol.c,674 :: 		return status;
;Protocol.c,675 :: 		}
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
;Protocol.c,681 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,683 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,684 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,685 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,686 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit210:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit581
NOP	
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit581:
;Protocol.c,687 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,688 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit583
NOP	
J	L_Protocol_strsplit282
NOP	
L_Protocol_strsplit583:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit585
NOP	
J	L_Protocol_strsplit281
NOP	
L_Protocol_strsplit585:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit586
NOP	
J	L_Protocol_strsplit280
NOP	
L_Protocol_strsplit586:
J	L_Protocol_strsplit215
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit282:
L_Protocol_strsplit281:
L_Protocol_strsplit280:
;Protocol.c,689 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,690 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,691 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,692 :: 		continue;
J	L_Protocol_strsplit212
NOP	
;Protocol.c,693 :: 		}else{
L_Protocol_strsplit215:
;Protocol.c,694 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,696 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit587
NOP	
J	L_Protocol_strsplit217
NOP	
L_Protocol_strsplit587:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,697 :: 		break;
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit217:
;Protocol.c,698 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit212:
;Protocol.c,686 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,698 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit210
NOP	
L_Protocol_strsplit211:
;Protocol.c,699 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,700 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,701 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,706 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,708 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,709 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,710 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,711 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2218:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2589
NOP	
J	L_Protocol_strsplit2253
NOP	
L_Protocol_strsplit2589:
;Protocol.c,712 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,713 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2591
NOP	
J	L_Protocol_strsplit2244
NOP	
L_Protocol_strsplit2591:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2593
NOP	
J	L_Protocol_strsplit2243
NOP	
L_Protocol_strsplit2593:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2594
NOP	
J	L_Protocol_strsplit2242
NOP	
L_Protocol_strsplit2594:
J	L_Protocol_strsplit2223
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2244:
L_Protocol_strsplit2243:
L_Protocol_strsplit2242:
;Protocol.c,714 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
; kk end address is: 28 (R7)
; kk start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,715 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,716 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,717 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,718 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2220
NOP	
;Protocol.c,719 :: 		}else{
L_Protocol_strsplit2223:
;Protocol.c,720 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2595
NOP	
J	L_Protocol_strsplit2251
NOP	
L_Protocol_strsplit2595:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2597
NOP	
J	L_Protocol_strsplit2252
NOP	
L_Protocol_strsplit2597:
L_Protocol_strsplit2240:
;Protocol.c,721 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2598
NOP	
J	L_Protocol_strsplit2249
NOP	
L_Protocol_strsplit2598:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2599
NOP	
J	L_Protocol_strsplit2250
NOP	
L_Protocol_strsplit2599:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2239:
;Protocol.c,722 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,723 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,724 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,721 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2246
NOP	
L_Protocol_strsplit2249:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2246:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2245
NOP	
L_Protocol_strsplit2250:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2245:
;Protocol.c,720 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2248
NOP	
L_Protocol_strsplit2251:
L_Protocol_strsplit2248:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2247
NOP	
L_Protocol_strsplit2252:
L_Protocol_strsplit2247:
;Protocol.c,727 :: 		arg[kk][ii++] = *(str+i);
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
; lasti start address is: 32 (R8)
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R9, 1
; ii end address is: 36 (R9)
; ii start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,729 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2600
NOP	
J	L_Protocol_strsplit2231
NOP	
L_Protocol_strsplit2600:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,730 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2219
NOP	
L_Protocol_strsplit2231:
;Protocol.c,731 :: 		}
; i start address is: 20 (R5)
; lasti start address is: 32 (R8)
; track_char start address is: 24 (R6)
; ii start address is: 12 (R3)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; kk end address is: 28 (R7)
SEH	R9, R3
; len start address is: 16 (R4)
L_Protocol_strsplit2220:
;Protocol.c,711 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,731 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2218
NOP	
L_Protocol_strsplit2253:
;Protocol.c,711 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,731 :: 		}
L_Protocol_strsplit2219:
;Protocol.c,732 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,733 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,734 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,738 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,741 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,742 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,744 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,745 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str232:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str603
NOP	
J	L_Protocol_cpy_val_from_str233
NOP	
L_Protocol_cpy_val_from_str603:
;Protocol.c,746 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,747 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,748 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str232
NOP	
L_Protocol_cpy_val_from_str233:
;Protocol.c,749 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,751 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,752 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,757 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,759 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,761 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,763 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int234:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int605
NOP	
J	L_Protocol_str2int235
NOP	
L_Protocol_str2int605:
;Protocol.c,764 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,765 :: 		while(DMA_IsOn(1));
L_Protocol_str2int237:
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
BNE	R2, R0, L_Protocol_str2int607
NOP	
J	L_Protocol_str2int238
NOP	
L_Protocol_str2int607:
J	L_Protocol_str2int237
NOP	
L_Protocol_str2int238:
;Protocol.c,763 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,766 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int234
NOP	
L_Protocol_str2int235:
;Protocol.c,768 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,769 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
