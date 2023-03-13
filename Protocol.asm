_Str_Initialize:
;Protocol.c,35 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,37 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize396
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize396:
;Protocol.c,38 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,37 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,39 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,40 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,42 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,43 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,44 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,48 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -152
SW	RA, 0(SP)
;Protocol.c,58 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,59 :: 		int axis_to_run = 0;
;Protocol.c,66 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 24 (R6)
SEH	R6, R2
;Protocol.c,69 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer400
NOP	
J	L__Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer400:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer401
NOP	
J	L__Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer401:
; dif end address is: 24 (R6)
L__Sample_Ringbuffer358:
;Protocol.c,70 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,71 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,72 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,73 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,69 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer360:
; dif start address is: 24 (R6)
L__Sample_Ringbuffer359:
;Protocol.c,76 :: 		if(dif == 0){
SEH	R2, R6
BEQ	R2, R0, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer402:
; dif end address is: 24 (R6)
;Protocol.c,78 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer404:
;Protocol.c,79 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,80 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer405
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer405:
;Protocol.c,85 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,86 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer406:
;Protocol.c,87 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer9:
;Protocol.c,88 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,89 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,90 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,91 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,92 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 24 (R6)
SEH	R2, R6
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer407:
;Protocol.c,93 :: 		int modal_response = 0;
;Protocol.c,94 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; no_of_axis start address is: 20 (R5)
MOVZ	R5, R0, R0
;Protocol.c,96 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 38
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,97 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 38
SH	R5, 20(SP)
; dif end address is: 24 (R6)
SEH	R26, R6
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R5, 20(SP)
;Protocol.c,98 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,103 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 38
SH	R5, 20(SP)
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
LH	R5, 20(SP)
;Protocol.c,105 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,125 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer408:
; no_of_axis end address is: 20 (R5)
;Protocol.c,130 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,131 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,132 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,133 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,134 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,135 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,144 :: 		SV.homed = false;
; no_of_axis start address is: 20 (R5)
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,147 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer409:
; no_of_axis end address is: 20 (R5)
;Protocol.c,148 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,149 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer410:
;Protocol.c,150 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,151 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,152 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer13:
; no_of_axis start address is: 20 (R5)
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer411:
; no_of_axis end address is: 20 (R5)
;Protocol.c,154 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer412:
;Protocol.c,155 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,156 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,157 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,158 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,159 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,160 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,161 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,162 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,163 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,164 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer21:
;Protocol.c,165 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,166 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,167 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,168 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer22:
;Protocol.c,169 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,170 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,171 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,172 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer23:
;Protocol.c,173 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,174 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,177 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer413:
;Protocol.c,178 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer24:
;Protocol.c,179 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,180 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,181 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer25:
;Protocol.c,182 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,186 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer414:
;Protocol.c,187 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,188 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,189 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,190 :: 		} else {
L_Sample_Ringbuffer26:
;Protocol.c,192 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer416:
;Protocol.c,193 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,194 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,195 :: 		}
L_Sample_Ringbuffer28:
;Protocol.c,197 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,198 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,200 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,201 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,203 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer29:
;Protocol.c,204 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,205 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer417:
;Protocol.c,206 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,207 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,209 :: 		}
L_Sample_Ringbuffer30:
;Protocol.c,210 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,211 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,212 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer31:
;Protocol.c,213 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,215 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer419:
;Protocol.c,216 :: 		int axis_to_home = 0;
;Protocol.c,219 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer421
NOP	
J	L__Sample_Ringbuffer362
NOP	
L__Sample_Ringbuffer421:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L__Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer423:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer362:
L__Sample_Ringbuffer361:
;Protocol.c,220 :: 		int i = 0;
;Protocol.c,221 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,224 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,225 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer36:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer424:
;Protocol.c,226 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,225 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,226 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer37:
;Protocol.c,229 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer426:
;Protocol.c,230 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,231 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,232 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,233 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer35:
;Protocol.c,234 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,235 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,236 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,237 :: 		} else {
J	L_Sample_Ringbuffer41
NOP	
L_Sample_Ringbuffer32:
;Protocol.c,238 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,239 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,240 :: 		}
L_Sample_Ringbuffer41:
;Protocol.c,243 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,244 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,245 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,246 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer42:
;Protocol.c,247 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,248 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,249 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer428:
;Protocol.c,250 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer430:
;Protocol.c,252 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,253 :: 		} else {
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,254 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,255 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,256 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,249 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,261 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,262 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,263 :: 		}else { // Store startup line
L_Sample_Ringbuffer43:
;Protocol.c,264 :: 		int N_Val = 0;
;Protocol.c,265 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,270 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer431
NOP	
J	L__Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer431:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer432
NOP	
J	L__Sample_Ringbuffer363
NOP	
L__Sample_Ringbuffer432:
L__Sample_Ringbuffer356:
;Protocol.c,271 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 117(SP)
MOVZ	R30, R0, R0
SB	R30, 118(SP)
;Protocol.c,273 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 117
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,274 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,281 :: 		}else {
J	L_Sample_Ringbuffer53
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,270 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer364:
L__Sample_Ringbuffer363:
;Protocol.c,282 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,283 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,284 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,287 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer434:
; helper_var end address is: 28 (R7)
;Protocol.c,288 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer436:
; N_Val end address is: 16 (R4)
;Protocol.c,291 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,292 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 38
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,300 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,305 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,306 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,314 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 38
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,315 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,317 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,319 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,320 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,321 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer57:
;Protocol.c,322 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,323 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,324 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,325 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer58:
;Protocol.c,326 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,327 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,329 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer59:
;Protocol.c,330 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,331 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,332 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,333 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,334 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,338 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L__Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L__Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer440:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer366:
L__Sample_Ringbuffer365:
;Protocol.c,339 :: 		char str_val[9]={0};
ADDIU	R23, SP, 119
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,340 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,341 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,342 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer441:
;Protocol.c,344 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 119
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,345 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer443
NOP	
J	L__Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer443:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer383:
L_Sample_Ringbuffer74:
;Protocol.c,346 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 119
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,347 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L__Sample_Ringbuffer385
NOP	
L__Sample_Ringbuffer444:
;Protocol.c,349 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 119
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,350 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer446
NOP	
J	L__Sample_Ringbuffer384
NOP	
L__Sample_Ringbuffer446:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer384:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,351 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 119
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,352 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 119
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
;Protocol.c,353 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer385:
;Protocol.c,347 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,353 :: 		}
L_Sample_Ringbuffer76:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer75:
;Protocol.c,356 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer447
NOP	
J	L__Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer447:
; value end address is: 8 (R2)
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer449
NOP	
J	L__Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer449:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer368:
L__Sample_Ringbuffer367:
;Protocol.c,357 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,358 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,359 :: 		value = atof(str_val);
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,364 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,367 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,368 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,369 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,370 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer451
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer451:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer453
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer453:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer455:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer457
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer457:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer459
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer459:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer461:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer463:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer465:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer467:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer469:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer471
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer471:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer475:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer479:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer481:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer483:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer491:
L_Sample_Ringbuffer19:
;Protocol.c,372 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
; no_of_axis start address is: 20 (R5)
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer492
NOP	
J	L__Sample_Ringbuffer382
NOP	
L__Sample_Ringbuffer492:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer493
NOP	
J	L__Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer493:
L__Sample_Ringbuffer353:
;Protocol.c,373 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,374 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 148(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,375 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,377 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer494:
;Protocol.c,378 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,379 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer495:
;Protocol.c,380 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
SH	R5, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LH	R5, 20(SP)
SH	R2, 30(SP)
;Protocol.c,383 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L__Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer497:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L__Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer499:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L__Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer501:
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer371:
L__Sample_Ringbuffer370:
L__Sample_Ringbuffer369:
;Protocol.c,384 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer93:
;Protocol.c,385 :: 		}else{
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,387 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 102
SH	R5, 20(SP)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LH	R5, 20(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,388 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,390 :: 		motion_mode = G_Mode(G_Val);
SH	R5, 20(SP)
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
LH	R5, 20(SP)
;Protocol.c,392 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer502
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer502:
; ?FLOC___Sample_Ringbuffer?T200 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T200 end address is: 12 (R3)
J	L_Sample_Ringbuffer96
NOP	
L_Sample_Ringbuffer95:
; ?FLOC___Sample_Ringbuffer?T200 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T200 end address is: 12 (R3)
L_Sample_Ringbuffer96:
; ?FLOC___Sample_Ringbuffer?T200 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T200 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,395 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
SH	R5, 20(SP)
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
LH	R5, 20(SP)
;Protocol.c,402 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer504:
;Protocol.c,403 :: 		no_of_axis++;
ADDIU	R3, R5, 1
; no_of_axis end address is: 20 (R5)
;Protocol.c,405 :: 		dma_printf("no_of_axis:= %d\n",no_of_axis);
ADDIU	R23, SP, 128
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 128
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,407 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,408 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,409 :: 		case 'G':case 'g':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,410 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer505:
;Protocol.c,411 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,414 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L__Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer507:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L__Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer509:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L__Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer511:
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer374:
L__Sample_Ringbuffer373:
L__Sample_Ringbuffer372:
;Protocol.c,415 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer105:
;Protocol.c,416 :: 		}else{
J	L_Sample_Ringbuffer106
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,418 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,419 :: 		}
L_Sample_Ringbuffer106:
;Protocol.c,421 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,423 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer512:
; ?FLOC___Sample_Ringbuffer?T229 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T229 end address is: 12 (R3)
J	L_Sample_Ringbuffer108
NOP	
L_Sample_Ringbuffer107:
; ?FLOC___Sample_Ringbuffer?T229 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T229 end address is: 12 (R3)
L_Sample_Ringbuffer108:
; ?FLOC___Sample_Ringbuffer?T229 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T229 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,426 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,429 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,430 :: 		case 'X':case 'x':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,431 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,432 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,433 :: 		case 'A':case 'a':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,434 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,435 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,437 :: 		PrintDebug(*gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,439 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,440 :: 		case 'L':case 'l':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,441 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,442 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,444 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,446 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,447 :: 		case 'F':case 'f':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,448 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,449 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,451 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,453 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,454 :: 		case 'P':case 'p':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,455 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,456 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,458 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,460 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,461 :: 		case 'S':case 's':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,462 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,463 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,465 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,467 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,468 :: 		}
L_Sample_Ringbuffer98:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer514:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer516:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer518:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer520:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer522:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer524:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer526:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer528:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer530:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer532:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer534:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer536:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer538:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer542:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer544:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer546:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer548:
L_Sample_Ringbuffer99:
;Protocol.c,469 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,474 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer550
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer550:
;Protocol.c,475 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,476 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,477 :: 		case 'G':case 'g':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,478 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer551:
;Protocol.c,479 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,482 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L__Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer553:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L__Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer555:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L__Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer557:
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer377:
L__Sample_Ringbuffer376:
L__Sample_Ringbuffer375:
;Protocol.c,483 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer133:
;Protocol.c,484 :: 		}else{
J	L_Sample_Ringbuffer134
NOP	
L_Sample_Ringbuffer130:
;Protocol.c,486 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,487 :: 		}
L_Sample_Ringbuffer134:
;Protocol.c,489 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,491 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer558
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer558:
; ?FLOC___Sample_Ringbuffer?T314 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T314 end address is: 12 (R3)
J	L_Sample_Ringbuffer136
NOP	
L_Sample_Ringbuffer135:
; ?FLOC___Sample_Ringbuffer?T314 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T314 end address is: 12 (R3)
L_Sample_Ringbuffer136:
; ?FLOC___Sample_Ringbuffer?T314 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T314 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,493 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,495 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,496 :: 		case 'X':case 'x':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,497 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,498 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,499 :: 		case 'A':case 'a':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,501 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,502 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,504 :: 		PrintDebug(*gcode[2],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,506 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,507 :: 		case 'L':case 'l':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,508 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,509 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,511 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,513 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,514 :: 		case 'F':case 'f':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,515 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,516 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,518 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,520 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,521 :: 		case 'P':case 'p':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,522 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,523 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,525 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,527 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,528 :: 		case 'S':case 's':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,529 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,530 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,532 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,534 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,535 :: 		}
L_Sample_Ringbuffer126:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer560
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer560:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer562
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer562:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer564
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer564:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer566
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer566:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer568
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer568:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer570:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer572
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer572:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer574
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer574:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer576
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer576:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer578
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer578:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer580
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer580:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer582
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer582:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer584
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer584:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer586
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer586:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer588:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer590:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer592
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer592:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer594
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer594:
L_Sample_Ringbuffer127:
;Protocol.c,536 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,540 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer596
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer596:
;Protocol.c,541 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,542 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,543 :: 		case 'G':case 'g':
L_Sample_Ringbuffer156:
L_Sample_Ringbuffer157:
;Protocol.c,544 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer597
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer597:
;Protocol.c,545 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,548 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer599
NOP	
J	L__Sample_Ringbuffer380
NOP	
L__Sample_Ringbuffer599:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer601
NOP	
J	L__Sample_Ringbuffer379
NOP	
L__Sample_Ringbuffer601:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer603
NOP	
J	L__Sample_Ringbuffer378
NOP	
L__Sample_Ringbuffer603:
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer380:
L__Sample_Ringbuffer379:
L__Sample_Ringbuffer378:
;Protocol.c,549 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer161:
;Protocol.c,550 :: 		}else{
J	L_Sample_Ringbuffer162
NOP	
L_Sample_Ringbuffer158:
;Protocol.c,552 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,553 :: 		}
L_Sample_Ringbuffer162:
;Protocol.c,555 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,557 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer604
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer604:
; ?FLOC___Sample_Ringbuffer?T400 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T400 end address is: 12 (R3)
J	L_Sample_Ringbuffer164
NOP	
L_Sample_Ringbuffer163:
; ?FLOC___Sample_Ringbuffer?T400 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T400 end address is: 12 (R3)
L_Sample_Ringbuffer164:
; ?FLOC___Sample_Ringbuffer?T400 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T400 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,559 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,561 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,562 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
L_Sample_Ringbuffer168:
;Protocol.c,563 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,564 :: 		case 'I':case 'i':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,566 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,567 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,569 :: 		PrintDebug(*gcode[3],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+192)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,571 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,572 :: 		case 'F': case 'f':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,573 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,574 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,576 :: 		PrintDebug(*gcode[3],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+192)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,578 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,579 :: 		}
L_Sample_Ringbuffer154:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer606
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer606:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer608
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer608:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer610
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer610:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer612
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer612:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer614
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer614:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer616
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer616:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer618
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer618:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer620
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer620:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer622
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer622:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer624
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer624:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer626
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer626:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer628
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer628:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer630
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer630:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer632
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer632:
L_Sample_Ringbuffer155:
;Protocol.c,580 :: 		}
L_Sample_Ringbuffer153:
;Protocol.c,585 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer634
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer634:
;Protocol.c,586 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,587 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer178
NOP	
;Protocol.c,588 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer180:
L_Sample_Ringbuffer181:
;Protocol.c,589 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
;Protocol.c,590 :: 		case 'J':case 'j':
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
;Protocol.c,591 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,592 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,594 :: 		PrintDebug(*gcode[4],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+256)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,596 :: 		break;
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,597 :: 		case 'F':case 'f':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
;Protocol.c,598 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,599 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,601 :: 		PrintDebug(*gcode[4],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+256)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,603 :: 		break;
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,605 :: 		}
L_Sample_Ringbuffer178:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer636
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer636:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer638
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer638:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer640
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer640:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer642:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer644:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer646:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer648:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer650:
L_Sample_Ringbuffer179:
;Protocol.c,606 :: 		}
L_Sample_Ringbuffer177:
;Protocol.c,610 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer652:
;Protocol.c,611 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,612 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,613 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer189
NOP	
;Protocol.c,614 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
;Protocol.c,615 :: 		case 'J':case 'j':
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
;Protocol.c,616 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,617 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,619 :: 		PrintDebug(*gcode[5],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+320)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,621 :: 		break;
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,622 :: 		case 'F':case 'f':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,623 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,624 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,626 :: 		PrintDebug(*gcode[5],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+320)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,628 :: 		break;
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,629 :: 		}
L_Sample_Ringbuffer189:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer654:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer656:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer658
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer658:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer660:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer662
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer662:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer664:
L_Sample_Ringbuffer190:
;Protocol.c,630 :: 		}
L_Sample_Ringbuffer188:
;Protocol.c,633 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer666:
;Protocol.c,634 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,635 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer198
NOP	
;Protocol.c,636 :: 		case 'J':case 'j':
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,637 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,638 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,640 :: 		PrintDebug(gcode[6],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,642 :: 		break;
J	L_Sample_Ringbuffer199
NOP	
;Protocol.c,643 :: 		case 'F':case 'f':
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,644 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,645 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,647 :: 		PrintDebug(gcode[6],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,649 :: 		break;
J	L_Sample_Ringbuffer199
NOP	
;Protocol.c,651 :: 		}
L_Sample_Ringbuffer198:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer668:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer670:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer672:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer674:
L_Sample_Ringbuffer199:
;Protocol.c,652 :: 		}
L_Sample_Ringbuffer197:
;Protocol.c,653 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,654 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer675
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer675:
; ?FLOC___Sample_Ringbuffer?T539 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T539 end address is: 8 (R2)
J	L_Sample_Ringbuffer205
NOP	
L_Sample_Ringbuffer204:
; ?FLOC___Sample_Ringbuffer?T539 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T539 end address is: 8 (R2)
L_Sample_Ringbuffer205:
; ?FLOC___Sample_Ringbuffer?T539 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T539 end address is: 8 (R2)
;Protocol.c,655 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,656 :: 		case 'M':
L_Sample_Ringbuffer206:
;Protocol.c,657 :: 		case 'm':
L_Sample_Ringbuffer207:
;Protocol.c,659 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,660 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 34(SP)
;Protocol.c,661 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,663 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 34
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,667 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer677
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer677:
;Protocol.c,668 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer209
NOP	
;Protocol.c,669 :: 		case 'S':
L_Sample_Ringbuffer211:
;Protocol.c,670 :: 		case 's':
L_Sample_Ringbuffer212:
;Protocol.c,672 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,673 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,674 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,676 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,678 :: 		}
J	L_Sample_Ringbuffer210
NOP	
L_Sample_Ringbuffer209:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer679
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer679:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer681:
L_Sample_Ringbuffer210:
;Protocol.c,679 :: 		}
L_Sample_Ringbuffer208:
;Protocol.c,680 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,681 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,682 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer213:
L_Sample_Ringbuffer214:
L_Sample_Ringbuffer215:
L_Sample_Ringbuffer216:
;Protocol.c,683 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
;Protocol.c,684 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer682:
;Protocol.c,685 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,686 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,687 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,689 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,691 :: 		}
L_Sample_Ringbuffer221:
;Protocol.c,695 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer684:
;Protocol.c,696 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,697 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,698 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer223
NOP	
;Protocol.c,699 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer225:
L_Sample_Ringbuffer226:
;Protocol.c,700 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer227:
L_Sample_Ringbuffer228:
;Protocol.c,701 :: 		case 'A':case 'a':
L_Sample_Ringbuffer229:
L_Sample_Ringbuffer230:
;Protocol.c,702 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,703 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,705 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+64)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,707 :: 		break;
J	L_Sample_Ringbuffer224
NOP	
;Protocol.c,708 :: 		case 'F':
L_Sample_Ringbuffer231:
;Protocol.c,709 :: 		case 'f':
L_Sample_Ringbuffer232:
;Protocol.c,712 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,713 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,715 :: 		PrintDebug(gcode[1],temp,&F_Val);
ADDIU	R3, SP, 32
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+64)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,718 :: 		break;
J	L_Sample_Ringbuffer224
NOP	
;Protocol.c,719 :: 		}
L_Sample_Ringbuffer223:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer686:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer688:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer690:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer692:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer694:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer696
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer696:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer698
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer698:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer700:
L_Sample_Ringbuffer224:
;Protocol.c,720 :: 		}
L_Sample_Ringbuffer222:
;Protocol.c,721 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,722 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,723 :: 		case 'F':
L_Sample_Ringbuffer233:
;Protocol.c,725 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer701
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer701:
;Protocol.c,726 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,727 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,728 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,730 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 32
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,732 :: 		}
L_Sample_Ringbuffer234:
;Protocol.c,733 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,734 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,735 :: 		}
L_Sample_Ringbuffer85:
; no_of_axis start address is: 20 (R5)
LH	R4, 148(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer703
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer703:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer705
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer705:
; no_of_axis end address is: 20 (R5)
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer707:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer709:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer711
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer711:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer713
NOP	
J	L_Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer713:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer715
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer715:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer717
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer717:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer719
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer719:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer721
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer721:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer723
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer723:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer725
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer725:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer727
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer727:
L_Sample_Ringbuffer86:
;Protocol.c,372 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer382:
L__Sample_Ringbuffer381:
;Protocol.c,736 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,737 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,743 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer728
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer728:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer236
NOP	
L_Sample_Ringbuffer235:
;Protocol.c,744 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer729
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer729:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer238
NOP	
L_Sample_Ringbuffer237:
;Protocol.c,745 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer730
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer730:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer240
NOP	
L_Sample_Ringbuffer239:
;Protocol.c,746 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer731
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer731:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer242
NOP	
L_Sample_Ringbuffer241:
;Protocol.c,747 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer732:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer244
NOP	
L_Sample_Ringbuffer243:
;Protocol.c,748 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer733
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer733:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer246
NOP	
L_Sample_Ringbuffer245:
;Protocol.c,749 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer734:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer248
NOP	
L_Sample_Ringbuffer247:
;Protocol.c,750 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer735
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer735:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer250
NOP	
L_Sample_Ringbuffer249:
;Protocol.c,751 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer736:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer251:
;Protocol.c,752 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer737
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer737:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer253:
L_Sample_Ringbuffer250:
L_Sample_Ringbuffer248:
L_Sample_Ringbuffer246:
L_Sample_Ringbuffer244:
L_Sample_Ringbuffer242:
L_Sample_Ringbuffer240:
L_Sample_Ringbuffer238:
L_Sample_Ringbuffer236:
;Protocol.c,755 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,756 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,759 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,760 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,763 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer738
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer738:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T667 end address is: 8 (R2)
J	L_Sample_Ringbuffer255
NOP	
L_Sample_Ringbuffer254:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T667 end address is: 8 (R2)
L_Sample_Ringbuffer255:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T667 end address is: 8 (R2)
;Protocol.c,765 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,767 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,770 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,771 :: 		}
;Protocol.c,770 :: 		return status;
;Protocol.c,771 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 152
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,777 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,779 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,780 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,781 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,782 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit256:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit740
NOP	
J	L_Protocol_strsplit257
NOP	
L_Protocol_strsplit740:
;Protocol.c,783 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,784 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit742
NOP	
J	L_Protocol_strsplit389
NOP	
L_Protocol_strsplit742:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit744
NOP	
J	L_Protocol_strsplit388
NOP	
L_Protocol_strsplit744:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit745
NOP	
J	L_Protocol_strsplit387
NOP	
L_Protocol_strsplit745:
J	L_Protocol_strsplit261
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit389:
L_Protocol_strsplit388:
L_Protocol_strsplit387:
;Protocol.c,785 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,786 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,787 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,788 :: 		continue;
J	L_Protocol_strsplit258
NOP	
;Protocol.c,789 :: 		}else{
L_Protocol_strsplit261:
;Protocol.c,790 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,792 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit746
NOP	
J	L_Protocol_strsplit263
NOP	
L_Protocol_strsplit746:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,793 :: 		break;
J	L_Protocol_strsplit257
NOP	
L_Protocol_strsplit263:
;Protocol.c,794 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit258:
;Protocol.c,782 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,794 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit256
NOP	
L_Protocol_strsplit257:
;Protocol.c,795 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,796 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,797 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,802 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,804 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,805 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,806 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,807 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2264:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2748
NOP	
J	L_Protocol_strsplit2348
NOP	
L_Protocol_strsplit2748:
;Protocol.c,808 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,809 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2750
NOP	
J	L_Protocol_strsplit2339
NOP	
L_Protocol_strsplit2750:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2752
NOP	
J	L_Protocol_strsplit2338
NOP	
L_Protocol_strsplit2752:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2753
NOP	
J	L_Protocol_strsplit2337
NOP	
L_Protocol_strsplit2753:
J	L_Protocol_strsplit2269
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2339:
L_Protocol_strsplit2338:
L_Protocol_strsplit2337:
;Protocol.c,810 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,811 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,812 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,813 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,814 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2266
NOP	
;Protocol.c,815 :: 		}else{
L_Protocol_strsplit2269:
;Protocol.c,816 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2754
NOP	
J	L_Protocol_strsplit2346
NOP	
L_Protocol_strsplit2754:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2756
NOP	
J	L_Protocol_strsplit2347
NOP	
L_Protocol_strsplit2756:
L_Protocol_strsplit2335:
;Protocol.c,817 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2757
NOP	
J	L_Protocol_strsplit2344
NOP	
L_Protocol_strsplit2757:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2758
NOP	
J	L_Protocol_strsplit2345
NOP	
L_Protocol_strsplit2758:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2334:
;Protocol.c,818 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,819 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,820 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,817 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2341
NOP	
L_Protocol_strsplit2344:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2341:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2340
NOP	
L_Protocol_strsplit2345:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2340:
;Protocol.c,816 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2343
NOP	
L_Protocol_strsplit2346:
L_Protocol_strsplit2343:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2342
NOP	
L_Protocol_strsplit2347:
L_Protocol_strsplit2342:
;Protocol.c,823 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,825 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2759
NOP	
J	L_Protocol_strsplit2277
NOP	
L_Protocol_strsplit2759:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,826 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2265
NOP	
L_Protocol_strsplit2277:
;Protocol.c,827 :: 		}
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
L_Protocol_strsplit2266:
;Protocol.c,807 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,827 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2264
NOP	
L_Protocol_strsplit2348:
;Protocol.c,807 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,827 :: 		}
L_Protocol_strsplit2265:
;Protocol.c,828 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,829 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,830 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,834 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,837 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,838 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,840 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,841 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str278:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str762
NOP	
J	L_Protocol_cpy_val_from_str279
NOP	
L_Protocol_cpy_val_from_str762:
;Protocol.c,842 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,843 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,844 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str278
NOP	
L_Protocol_cpy_val_from_str279:
;Protocol.c,845 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,847 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,848 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,853 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,855 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,857 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,859 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int280:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int764
NOP	
J	L_Protocol_str2int281
NOP	
L_Protocol_str2int764:
;Protocol.c,860 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,861 :: 		while(DMA_IsOn(1));
L_Protocol_str2int283:
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
BNE	R2, R0, L_Protocol_str2int766
NOP	
J	L_Protocol_str2int284
NOP	
L_Protocol_str2int766:
J	L_Protocol_str2int283
NOP	
L_Protocol_str2int284:
;Protocol.c,859 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,862 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int280
NOP	
L_Protocol_str2int281:
;Protocol.c,864 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,865 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
Protocol_PrintDebug:
;Protocol.c,870 :: 		static void PrintDebug(char c,char *strB,void *ptr){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Protocol.c,874 :: 		switch(c){
J	L_Protocol_PrintDebug285
NOP	
;Protocol.c,875 :: 		case 'G':case 'g':
L_Protocol_PrintDebug287:
L_Protocol_PrintDebug288:
;Protocol.c,876 :: 		case 'F':case 'f':
L_Protocol_PrintDebug289:
L_Protocol_PrintDebug290:
;Protocol.c,877 :: 		case 'M':case 'm':
L_Protocol_PrintDebug291:
L_Protocol_PrintDebug292:
;Protocol.c,878 :: 		case 'S':case 's':
L_Protocol_PrintDebug293:
L_Protocol_PrintDebug294:
;Protocol.c,879 :: 		case 'P':case 'p':
L_Protocol_PrintDebug295:
L_Protocol_PrintDebug296:
;Protocol.c,880 :: 		case 'L':case 'l':
L_Protocol_PrintDebug297:
L_Protocol_PrintDebug298:
;Protocol.c,881 :: 		case 'T':case 't':
L_Protocol_PrintDebug299:
L_Protocol_PrintDebug300:
;Protocol.c,882 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,883 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug301:
; G_Val start address is: 12 (R3)
SH	R3, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug769
NOP	
J	L_Protocol_PrintDebug302
NOP	
L_Protocol_PrintDebug769:
J	L_Protocol_PrintDebug301
NOP	
L_Protocol_PrintDebug302:
;Protocol.c,884 :: 		dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
ADDIU	R23, SP, 17
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
SW	R27, 4(SP)
; G_Val end address is: 12 (R3)
SW	R26, 8(SP)
SB	R25, 12(SP)
ADDIU	SP, SP, -16
SH	R3, 12(SP)
SW	R26, 8(SP)
SB	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LBU	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,885 :: 		break;
J	L_Protocol_PrintDebug286
NOP	
;Protocol.c,886 :: 		case 'X':case 'x':
L_Protocol_PrintDebug303:
L_Protocol_PrintDebug304:
;Protocol.c,887 :: 		case 'Y':case 'y':
L_Protocol_PrintDebug305:
L_Protocol_PrintDebug306:
;Protocol.c,888 :: 		case 'Z':case 'z':
L_Protocol_PrintDebug307:
L_Protocol_PrintDebug308:
;Protocol.c,889 :: 		case 'A':case 'a':
L_Protocol_PrintDebug309:
L_Protocol_PrintDebug310:
;Protocol.c,890 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,891 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug311:
; XYZ_Val start address is: 128 (R32)
SWC1	S16, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LWC1	S16, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug771
NOP	
J	L_Protocol_PrintDebug312
NOP	
L_Protocol_PrintDebug771:
J	L_Protocol_PrintDebug311
NOP	
L_Protocol_PrintDebug312:
;Protocol.c,892 :: 		dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
ADDIU	R23, SP, 27
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr3_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr3_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 27
SW	R27, 4(SP)
; XYZ_Val end address is: 128 (R32)
SW	R26, 8(SP)
SB	R25, 12(SP)
ADDIU	SP, SP, -16
SWC1	S16, 12(SP)
SW	R26, 8(SP)
SB	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LBU	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,893 :: 		break;
J	L_Protocol_PrintDebug286
NOP	
;Protocol.c,894 :: 		default:break;
L_Protocol_PrintDebug313:
J	L_Protocol_PrintDebug286
NOP	
;Protocol.c,895 :: 		}
L_Protocol_PrintDebug285:
ANDI	R3, R25, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_PrintDebug773
NOP	
J	L_Protocol_PrintDebug287
NOP	
L_Protocol_PrintDebug773:
ANDI	R3, R25, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_PrintDebug775
NOP	
J	L_Protocol_PrintDebug288
NOP	
L_Protocol_PrintDebug775:
ANDI	R3, R25, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_PrintDebug777
NOP	
J	L_Protocol_PrintDebug289
NOP	
L_Protocol_PrintDebug777:
ANDI	R3, R25, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_PrintDebug779
NOP	
J	L_Protocol_PrintDebug290
NOP	
L_Protocol_PrintDebug779:
ANDI	R3, R25, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_PrintDebug781
NOP	
J	L_Protocol_PrintDebug291
NOP	
L_Protocol_PrintDebug781:
ANDI	R3, R25, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_PrintDebug783
NOP	
J	L_Protocol_PrintDebug292
NOP	
L_Protocol_PrintDebug783:
ANDI	R3, R25, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_PrintDebug785
NOP	
J	L_Protocol_PrintDebug293
NOP	
L_Protocol_PrintDebug785:
ANDI	R3, R25, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_PrintDebug787
NOP	
J	L_Protocol_PrintDebug294
NOP	
L_Protocol_PrintDebug787:
ANDI	R3, R25, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_PrintDebug789
NOP	
J	L_Protocol_PrintDebug295
NOP	
L_Protocol_PrintDebug789:
ANDI	R3, R25, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_PrintDebug791
NOP	
J	L_Protocol_PrintDebug296
NOP	
L_Protocol_PrintDebug791:
ANDI	R3, R25, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_PrintDebug793
NOP	
J	L_Protocol_PrintDebug297
NOP	
L_Protocol_PrintDebug793:
ANDI	R3, R25, 255
ORI	R2, R0, 108
BNE	R3, R2, L_Protocol_PrintDebug795
NOP	
J	L_Protocol_PrintDebug298
NOP	
L_Protocol_PrintDebug795:
ANDI	R3, R25, 255
ORI	R2, R0, 84
BNE	R3, R2, L_Protocol_PrintDebug797
NOP	
J	L_Protocol_PrintDebug299
NOP	
L_Protocol_PrintDebug797:
ANDI	R3, R25, 255
ORI	R2, R0, 116
BNE	R3, R2, L_Protocol_PrintDebug799
NOP	
J	L_Protocol_PrintDebug300
NOP	
L_Protocol_PrintDebug799:
ANDI	R3, R25, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_PrintDebug801
NOP	
J	L_Protocol_PrintDebug303
NOP	
L_Protocol_PrintDebug801:
ANDI	R3, R25, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_PrintDebug803
NOP	
J	L_Protocol_PrintDebug304
NOP	
L_Protocol_PrintDebug803:
ANDI	R3, R25, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_PrintDebug805
NOP	
J	L_Protocol_PrintDebug305
NOP	
L_Protocol_PrintDebug805:
ANDI	R3, R25, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_PrintDebug807
NOP	
J	L_Protocol_PrintDebug306
NOP	
L_Protocol_PrintDebug807:
ANDI	R3, R25, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_PrintDebug809
NOP	
J	L_Protocol_PrintDebug307
NOP	
L_Protocol_PrintDebug809:
ANDI	R3, R25, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_PrintDebug811
NOP	
J	L_Protocol_PrintDebug308
NOP	
L_Protocol_PrintDebug811:
ANDI	R3, R25, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_PrintDebug813
NOP	
J	L_Protocol_PrintDebug309
NOP	
L_Protocol_PrintDebug813:
ANDI	R3, R25, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_PrintDebug815
NOP	
J	L_Protocol_PrintDebug310
NOP	
L_Protocol_PrintDebug815:
J	L_Protocol_PrintDebug313
NOP	
L_Protocol_PrintDebug286:
;Protocol.c,896 :: 		return;
;Protocol.c,897 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Protocol_PrintDebug
_protocol_execute_runtime:
;Protocol.c,922 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,923 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+18)(GP)
BNE	R2, R0, L__protocol_execute_runtime818
NOP	
J	L_protocol_execute_runtime314
NOP	
L__protocol_execute_runtime818:
;Protocol.c,924 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,929 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime820
NOP	
J	L__protocol_execute_runtime391
NOP	
L__protocol_execute_runtime820:
;Protocol.c,930 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,933 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime822
NOP	
J	L_protocol_execute_runtime316
NOP	
L__protocol_execute_runtime822:
;Protocol.c,934 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,935 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,936 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,937 :: 		do {
J	L_protocol_execute_runtime317
NOP	
L__protocol_execute_runtime390:
;Protocol.c,941 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,937 :: 		do {
L_protocol_execute_runtime317:
;Protocol.c,941 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime824
NOP	
J	L__protocol_execute_runtime390
NOP	
L__protocol_execute_runtime824:
; rt_exec end address is: 12 (R3)
;Protocol.c,944 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime320
NOP	
L_protocol_execute_runtime316:
;Protocol.c,948 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,949 :: 		}
L_protocol_execute_runtime320:
;Protocol.c,950 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,951 :: 		}
J	L_protocol_execute_runtime315
NOP	
L__protocol_execute_runtime391:
;Protocol.c,929 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,951 :: 		}
L_protocol_execute_runtime315:
;Protocol.c,954 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime826
NOP	
J	L_protocol_execute_runtime321
NOP	
L__protocol_execute_runtime826:
; rt_exec end address is: 16 (R4)
;Protocol.c,955 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,956 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,957 :: 		}
L_protocol_execute_runtime321:
;Protocol.c,960 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime828
NOP	
J	L_protocol_execute_runtime322
NOP	
L__protocol_execute_runtime828:
;Protocol.c,961 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,962 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,963 :: 		}
L_protocol_execute_runtime322:
;Protocol.c,966 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime830
NOP	
J	L_protocol_execute_runtime323
NOP	
L__protocol_execute_runtime830:
;Protocol.c,968 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,969 :: 		}
L_protocol_execute_runtime323:
;Protocol.c,973 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime832
NOP	
J	L_protocol_execute_runtime324
NOP	
L__protocol_execute_runtime832:
;Protocol.c,975 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,976 :: 		}
L_protocol_execute_runtime324:
;Protocol.c,978 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime834
NOP	
J	L_protocol_execute_runtime325
NOP	
L__protocol_execute_runtime834:
;Protocol.c,980 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime836
NOP	
J	L_protocol_execute_runtime326
NOP	
L__protocol_execute_runtime836:
;Protocol.c,981 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
;Protocol.c,982 :: 		}
L_protocol_execute_runtime326:
;Protocol.c,983 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,984 :: 		}
L_protocol_execute_runtime325:
;Protocol.c,985 :: 		}
L_protocol_execute_runtime314:
;Protocol.c,989 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,993 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,997 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check839
NOP	
J	L_protocol_system_check327
NOP	
L__protocol_system_check839:
;Protocol.c,1010 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,1013 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,1014 :: 		sys.execute = 0;
SH	R0, Offset(_sys+18)(GP)
;Protocol.c,1015 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check841
NOP	
J	L_protocol_system_check328
NOP	
L__protocol_system_check841:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check328:
;Protocol.c,1025 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check842
NOP	
J	L__protocol_system_check394
NOP	
L__protocol_system_check842:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check844
NOP	
J	L__protocol_system_check393
NOP	
L__protocol_system_check844:
L__protocol_system_check392:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check394:
L__protocol_system_check393:
;Protocol.c,1029 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check845
NOP	
J	L_protocol_system_check332
NOP	
L__protocol_system_check845:
;Protocol.c,1030 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1031 :: 		} else {
J	L_protocol_system_check333
NOP	
L_protocol_system_check332:
;Protocol.c,1033 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1035 :: 		}
L_protocol_system_check333:
;Protocol.c,1036 :: 		}
L_protocol_system_check327:
;Protocol.c,1037 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
