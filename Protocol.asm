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
BNE	R2, R0, L__Str_Initialize418
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize418:
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
ADDIU	SP, SP, -140
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
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,69 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer422
NOP	
J	L__Sample_Ringbuffer382
NOP	
L__Sample_Ringbuffer422:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer423
NOP	
J	L__Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer423:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer380:
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
L__Sample_Ringbuffer382:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer381:
;Protocol.c,76 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer424:
; dif end address is: 20 (R5)
;Protocol.c,78 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer426:
;Protocol.c,79 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,80 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,85 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,86 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer428:
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
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer429:
;Protocol.c,93 :: 		int modal_response = 0;
;Protocol.c,94 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
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
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,98 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,103 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 38
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,105 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,127 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer430:
;Protocol.c,132 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,133 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,134 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,135 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,136 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,137 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,146 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,149 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer431:
;Protocol.c,150 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,151 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer432:
;Protocol.c,152 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,153 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,154 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer433:
;Protocol.c,156 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer434:
;Protocol.c,157 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,158 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,159 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,160 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,161 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,162 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,163 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,164 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,165 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,166 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer21:
;Protocol.c,167 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,168 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,169 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,170 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer22:
;Protocol.c,171 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,172 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,173 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,174 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer23:
;Protocol.c,175 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,176 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,179 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer435:
;Protocol.c,180 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer24:
;Protocol.c,181 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,182 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,183 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer25:
;Protocol.c,184 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,188 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer436:
;Protocol.c,189 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,190 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,191 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,192 :: 		} else {
L_Sample_Ringbuffer26:
;Protocol.c,194 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer438:
;Protocol.c,195 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,196 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,197 :: 		}
L_Sample_Ringbuffer28:
;Protocol.c,199 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,200 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,202 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,203 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,205 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer29:
;Protocol.c,206 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,207 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer439:
;Protocol.c,208 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,209 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,211 :: 		}
L_Sample_Ringbuffer30:
;Protocol.c,212 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,213 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,214 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer31:
;Protocol.c,215 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,217 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer441:
;Protocol.c,218 :: 		int axis_to_home = 0;
;Protocol.c,221 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer443
NOP	
J	L__Sample_Ringbuffer384
NOP	
L__Sample_Ringbuffer443:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L__Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer445:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer384:
L__Sample_Ringbuffer383:
;Protocol.c,222 :: 		int i = 0;
;Protocol.c,223 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,226 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,227 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer36:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer446:
;Protocol.c,228 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,227 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,228 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer37:
;Protocol.c,231 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer448:
;Protocol.c,232 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,234 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,235 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer35:
;Protocol.c,236 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,237 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,238 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,239 :: 		} else {
J	L_Sample_Ringbuffer41
NOP	
L_Sample_Ringbuffer32:
;Protocol.c,240 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,241 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,242 :: 		}
L_Sample_Ringbuffer41:
;Protocol.c,245 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,246 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,247 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,248 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer42:
;Protocol.c,249 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,250 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer449:
;Protocol.c,251 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer450:
;Protocol.c,252 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer452:
;Protocol.c,254 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,255 :: 		} else {
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,256 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,257 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,258 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,251 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,263 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,264 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,265 :: 		}else { // Store startup line
L_Sample_Ringbuffer43:
;Protocol.c,266 :: 		int N_Val = 0;
;Protocol.c,267 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,272 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer453
NOP	
J	L__Sample_Ringbuffer386
NOP	
L__Sample_Ringbuffer453:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer454
NOP	
J	L__Sample_Ringbuffer385
NOP	
L__Sample_Ringbuffer454:
L__Sample_Ringbuffer378:
;Protocol.c,273 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 117(SP)
MOVZ	R30, R0, R0
SB	R30, 118(SP)
;Protocol.c,275 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 117
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,276 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,283 :: 		}else {
J	L_Sample_Ringbuffer53
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,272 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer386:
L__Sample_Ringbuffer385:
;Protocol.c,284 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,285 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,286 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,289 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer456:
; helper_var end address is: 28 (R7)
;Protocol.c,290 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer458:
; N_Val end address is: 16 (R4)
;Protocol.c,293 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,294 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 38
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,302 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,307 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,308 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,316 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 38
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,317 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,319 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,321 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,322 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,323 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer57:
;Protocol.c,324 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,325 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,326 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,327 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer58:
;Protocol.c,328 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,329 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,331 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer59:
;Protocol.c,332 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,333 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,334 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,335 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,336 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,340 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L__Sample_Ringbuffer388
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L__Sample_Ringbuffer387
NOP	
L__Sample_Ringbuffer462:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer388:
L__Sample_Ringbuffer387:
;Protocol.c,341 :: 		char str_val[9]={0};
ADDIU	R23, SP, 119
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,342 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,343 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,344 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer463:
;Protocol.c,346 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 119
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,347 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer465
NOP	
J	L__Sample_Ringbuffer405
NOP	
L__Sample_Ringbuffer465:
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
L__Sample_Ringbuffer405:
L_Sample_Ringbuffer74:
;Protocol.c,348 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,349 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L__Sample_Ringbuffer407
NOP	
L__Sample_Ringbuffer466:
;Protocol.c,351 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 119
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,352 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer468
NOP	
J	L__Sample_Ringbuffer406
NOP	
L__Sample_Ringbuffer468:
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
L__Sample_Ringbuffer406:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,353 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 119
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,354 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,355 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer407:
;Protocol.c,349 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,355 :: 		}
L_Sample_Ringbuffer76:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer75:
;Protocol.c,358 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer469
NOP	
J	L__Sample_Ringbuffer390
NOP	
L__Sample_Ringbuffer469:
; value end address is: 8 (R2)
ADDIU	R2, SP, 119
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer471
NOP	
J	L__Sample_Ringbuffer389
NOP	
L__Sample_Ringbuffer471:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer390:
L__Sample_Ringbuffer389:
;Protocol.c,359 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,360 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,361 :: 		value = atof(str_val);
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,366 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,369 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,370 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,371 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,372 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer475:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer479:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer481:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer483:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer493:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer495:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer499:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer513:
L_Sample_Ringbuffer19:
;Protocol.c,374 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer514
NOP	
J	L__Sample_Ringbuffer404
NOP	
L__Sample_Ringbuffer514:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer515
NOP	
J	L__Sample_Ringbuffer403
NOP	
L__Sample_Ringbuffer515:
L__Sample_Ringbuffer375:
;Protocol.c,375 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,376 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 136(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,377 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,379 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer516:
;Protocol.c,380 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,381 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer517:
;Protocol.c,382 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,385 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L__Sample_Ringbuffer393
NOP	
L__Sample_Ringbuffer519:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L__Sample_Ringbuffer392
NOP	
L__Sample_Ringbuffer521:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L__Sample_Ringbuffer391
NOP	
L__Sample_Ringbuffer523:
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer393:
L__Sample_Ringbuffer392:
L__Sample_Ringbuffer391:
;Protocol.c,386 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer93:
;Protocol.c,387 :: 		}else{
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,389 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,390 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,392 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,394 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer524:
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
;Protocol.c,397 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,404 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer526:
;Protocol.c,405 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,407 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,408 :: 		case 'G':case 'g':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,409 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer527:
;Protocol.c,410 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,413 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L__Sample_Ringbuffer396
NOP	
L__Sample_Ringbuffer529:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L__Sample_Ringbuffer395
NOP	
L__Sample_Ringbuffer531:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L__Sample_Ringbuffer394
NOP	
L__Sample_Ringbuffer533:
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer396:
L__Sample_Ringbuffer395:
L__Sample_Ringbuffer394:
;Protocol.c,414 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer105:
;Protocol.c,415 :: 		}else{
J	L_Sample_Ringbuffer106
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,417 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,418 :: 		}
L_Sample_Ringbuffer106:
;Protocol.c,420 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,422 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer534:
; ?FLOC___Sample_Ringbuffer?T227 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T227 end address is: 12 (R3)
J	L_Sample_Ringbuffer108
NOP	
L_Sample_Ringbuffer107:
; ?FLOC___Sample_Ringbuffer?T227 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T227 end address is: 12 (R3)
L_Sample_Ringbuffer108:
; ?FLOC___Sample_Ringbuffer?T227 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T227 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,425 :: 		PrintDebug(*(*(gcode+1)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+64)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,428 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,429 :: 		case 'X':case 'x':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,430 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,431 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,432 :: 		case 'A':case 'a':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,434 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,435 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,437 :: 		PrintDebug(*(*(gcode+1)+0),temp,&XYZ_Val);
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
;Protocol.c,442 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,444 :: 		PrintDebug(*(*(gcode+1)+0),temp,&O_Val);
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
;Protocol.c,449 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,451 :: 		PrintDebug(*(*(gcode+1)+0),temp,&O_Val);
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
;Protocol.c,456 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,458 :: 		PrintDebug(*(*(gcode+1)+0),temp,&O_Val);
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
;Protocol.c,463 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,465 :: 		PrintDebug(*(*(gcode+1)+0),temp,&O_Val);
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
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer536:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer538:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer542:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer544:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer546:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer548:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer550
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer550:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer552
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer552:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer554
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer554:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer556
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer556:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer558
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer558:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer560
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer560:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer562
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer562:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer564
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer564:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer566
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer566:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer568
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer568:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer570:
L_Sample_Ringbuffer99:
;Protocol.c,469 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,474 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer572
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer572:
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
BNE	R2, R0, L__Sample_Ringbuffer573
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer573:
;Protocol.c,479 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,482 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L__Sample_Ringbuffer399
NOP	
L__Sample_Ringbuffer575:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L__Sample_Ringbuffer398
NOP	
L__Sample_Ringbuffer577:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer579
NOP	
J	L__Sample_Ringbuffer397
NOP	
L__Sample_Ringbuffer579:
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer399:
L__Sample_Ringbuffer398:
L__Sample_Ringbuffer397:
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
BEQ	R3, R2, L__Sample_Ringbuffer580
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer580:
; ?FLOC___Sample_Ringbuffer?T313 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T313 end address is: 12 (R3)
J	L_Sample_Ringbuffer136
NOP	
L_Sample_Ringbuffer135:
; ?FLOC___Sample_Ringbuffer?T313 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T313 end address is: 12 (R3)
L_Sample_Ringbuffer136:
; ?FLOC___Sample_Ringbuffer?T313 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T313 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,493 :: 		PrintDebug(*(*(gcode+2)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
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
;Protocol.c,499 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,500 :: 		case 'I':case 'i':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,501 :: 		case 'J':case 'j':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,503 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,504 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,506 :: 		PrintDebug(*(*(gcode+2)+0),temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,508 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,509 :: 		case 'L':case 'l':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,510 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,511 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,513 :: 		PrintDebug(*(*(gcode+2)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,515 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,516 :: 		case 'F':case 'f':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,517 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,518 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,520 :: 		PrintDebug(*(*(gcode+2)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,522 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,523 :: 		case 'P':case 'p':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,524 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,525 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,527 :: 		PrintDebug(*(*(gcode+2)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,529 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,530 :: 		case 'S':case 's':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,531 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,532 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,534 :: 		PrintDebug(*(*(gcode+2)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+128)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,536 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,537 :: 		}
L_Sample_Ringbuffer126:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer582
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer582:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer584
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer584:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer586
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer586:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer588:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer590:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer592
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer592:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer594
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer594:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer596
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer596:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer598
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer598:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer600
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer600:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer602
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer602:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer604
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer604:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer606
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer606:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer608
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer608:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer610
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer610:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer612
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer612:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer614
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer614:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer616
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer616:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer618
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer618:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer620
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer620:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer622
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer622:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer624
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer624:
L_Sample_Ringbuffer127:
;Protocol.c,538 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,542 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer626
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer626:
;Protocol.c,543 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,544 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer158
NOP	
;Protocol.c,545 :: 		case 'G':case 'g':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
;Protocol.c,546 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer627
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer627:
;Protocol.c,547 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,550 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer629
NOP	
J	L__Sample_Ringbuffer402
NOP	
L__Sample_Ringbuffer629:
LH	R3, 30(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer631
NOP	
J	L__Sample_Ringbuffer401
NOP	
L__Sample_Ringbuffer631:
LH	R3, 30(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer633
NOP	
J	L__Sample_Ringbuffer400
NOP	
L__Sample_Ringbuffer633:
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer402:
L__Sample_Ringbuffer401:
L__Sample_Ringbuffer400:
;Protocol.c,551 :: 		G_Val *= 10;
LH	R3, 30(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 30(SP)
L_Sample_Ringbuffer165:
;Protocol.c,552 :: 		}else{
J	L_Sample_Ringbuffer166
NOP	
L_Sample_Ringbuffer162:
;Protocol.c,554 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,555 :: 		}
L_Sample_Ringbuffer166:
;Protocol.c,557 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 30(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,559 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer634
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer634:
; ?FLOC___Sample_Ringbuffer?T404 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T404 end address is: 12 (R3)
J	L_Sample_Ringbuffer168
NOP	
L_Sample_Ringbuffer167:
; ?FLOC___Sample_Ringbuffer?T404 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T404 end address is: 12 (R3)
L_Sample_Ringbuffer168:
; ?FLOC___Sample_Ringbuffer?T404 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T404 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,561 :: 		PrintDebug(*(*(gcode+3)+0),temp,&G_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+192)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,563 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,564 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,565 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,566 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
L_Sample_Ringbuffer178:
;Protocol.c,568 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer179:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer636
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer636:
J	L_Sample_Ringbuffer179
NOP	
L_Sample_Ringbuffer180:
;Protocol.c,569 :: 		dma_printf("%s\t%s\n","3",(gcode+3));
ORI	R30, R0, 37
SB	R30, 128(SP)
ORI	R30, R0, 115
SB	R30, 129(SP)
ORI	R30, R0, 9
SB	R30, 130(SP)
ORI	R30, R0, 37
SB	R30, 131(SP)
ORI	R30, R0, 115
SB	R30, 132(SP)
ORI	R30, R0, 10
SB	R30, 133(SP)
MOVZ	R30, R0, R0
SB	R30, 134(SP)
ADDIU	R3, SP, 128
LUI	R2, hi_addr(_gcode+192)
ORI	R2, R2, lo_addr(_gcode+192)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Protocol+0)
ORI	R2, R2, lo_addr(?lstr_2_Protocol+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Protocol.c,572 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,573 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,575 :: 		PrintDebug(*(*(gcode+3)+0),temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+192)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,577 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,578 :: 		case 'F': case 'f':
L_Sample_Ringbuffer181:
L_Sample_Ringbuffer182:
;Protocol.c,579 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,580 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,582 :: 		PrintDebug(*(*(gcode+3)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+192)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,584 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,585 :: 		}
L_Sample_Ringbuffer158:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer638
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer638:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer640
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer640:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer642:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer644:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer646:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer648:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer650:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer652:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer654:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer656:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer658
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer658:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer660:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer662
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer662:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer664:
L_Sample_Ringbuffer159:
;Protocol.c,586 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,591 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer666:
;Protocol.c,592 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,593 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,594 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
;Protocol.c,595 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
;Protocol.c,596 :: 		case 'J':case 'j':
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
;Protocol.c,597 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,598 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,600 :: 		PrintDebug(*(*(gcode+4)+0),temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+256)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,602 :: 		break;
J	L_Sample_Ringbuffer185
NOP	
;Protocol.c,603 :: 		case 'F':case 'f':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,604 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,605 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,607 :: 		PrintDebug(*(*(gcode+4)+0),temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+256)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,609 :: 		break;
J	L_Sample_Ringbuffer185
NOP	
;Protocol.c,611 :: 		}
L_Sample_Ringbuffer184:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer668:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer670:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer672:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer674:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer676:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer678:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer680
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer680:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer682:
L_Sample_Ringbuffer185:
;Protocol.c,612 :: 		}
L_Sample_Ringbuffer183:
;Protocol.c,616 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer684:
;Protocol.c,617 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,618 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,619 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer195
NOP	
;Protocol.c,620 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,621 :: 		case 'J':case 'j':
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
;Protocol.c,622 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,623 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,625 :: 		PrintDebug(*gcode[5],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+320)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,627 :: 		break;
J	L_Sample_Ringbuffer196
NOP	
;Protocol.c,628 :: 		case 'F':case 'f':
L_Sample_Ringbuffer201:
L_Sample_Ringbuffer202:
;Protocol.c,629 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,630 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,632 :: 		PrintDebug(*gcode[5],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+320)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,634 :: 		break;
J	L_Sample_Ringbuffer196
NOP	
;Protocol.c,635 :: 		}
L_Sample_Ringbuffer195:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer686:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer688:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer690:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer692:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer694:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer696
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer696:
L_Sample_Ringbuffer196:
;Protocol.c,636 :: 		}
L_Sample_Ringbuffer194:
;Protocol.c,639 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer698
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer698:
;Protocol.c,640 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,641 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer204
NOP	
;Protocol.c,642 :: 		case 'J':case 'j':
L_Sample_Ringbuffer206:
L_Sample_Ringbuffer207:
;Protocol.c,643 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,644 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,646 :: 		PrintDebug(gcode[6],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,648 :: 		break;
J	L_Sample_Ringbuffer205
NOP	
;Protocol.c,649 :: 		case 'F':case 'f':
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
;Protocol.c,650 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,651 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,653 :: 		PrintDebug(gcode[6],temp,&O_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,655 :: 		break;
J	L_Sample_Ringbuffer205
NOP	
;Protocol.c,657 :: 		}
L_Sample_Ringbuffer204:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer700:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer702
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer702:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer704
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer704:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer706
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer706:
L_Sample_Ringbuffer205:
;Protocol.c,658 :: 		}
L_Sample_Ringbuffer203:
;Protocol.c,659 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,660 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer707:
; ?FLOC___Sample_Ringbuffer?T551 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T551 end address is: 8 (R2)
J	L_Sample_Ringbuffer211
NOP	
L_Sample_Ringbuffer210:
; ?FLOC___Sample_Ringbuffer?T551 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T551 end address is: 8 (R2)
L_Sample_Ringbuffer211:
; ?FLOC___Sample_Ringbuffer?T551 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T551 end address is: 8 (R2)
;Protocol.c,661 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,662 :: 		case 'M':
L_Sample_Ringbuffer212:
;Protocol.c,663 :: 		case 'm':
L_Sample_Ringbuffer213:
;Protocol.c,665 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,666 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 34(SP)
;Protocol.c,667 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,669 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 34
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,673 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer709:
;Protocol.c,674 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer215
NOP	
;Protocol.c,675 :: 		case 'S':
L_Sample_Ringbuffer217:
;Protocol.c,676 :: 		case 's':
L_Sample_Ringbuffer218:
;Protocol.c,678 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,679 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,680 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,682 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,684 :: 		}
J	L_Sample_Ringbuffer216
NOP	
L_Sample_Ringbuffer215:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer711
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer711:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer713
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer713:
L_Sample_Ringbuffer216:
;Protocol.c,685 :: 		}
L_Sample_Ringbuffer214:
;Protocol.c,686 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,687 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,688 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
L_Sample_Ringbuffer221:
L_Sample_Ringbuffer222:
;Protocol.c,689 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer223:
L_Sample_Ringbuffer224:
L_Sample_Ringbuffer225:
L_Sample_Ringbuffer226:
;Protocol.c,690 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer227:
L_Sample_Ringbuffer228:
L_Sample_Ringbuffer229:
L_Sample_Ringbuffer230:
;Protocol.c,691 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer714
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer714:
;Protocol.c,692 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,693 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,694 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,696 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,698 :: 		}
L_Sample_Ringbuffer231:
;Protocol.c,702 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer716
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer716:
;Protocol.c,703 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,704 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,705 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer233
NOP	
;Protocol.c,706 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer235:
L_Sample_Ringbuffer236:
;Protocol.c,707 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer237:
L_Sample_Ringbuffer238:
;Protocol.c,708 :: 		case 'A':case 'a':
L_Sample_Ringbuffer239:
L_Sample_Ringbuffer240:
;Protocol.c,709 :: 		case 'I':case 'i':
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,710 :: 		case 'J':case 'j':
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer244:
;Protocol.c,711 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,712 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,714 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+64)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,716 :: 		break;
J	L_Sample_Ringbuffer234
NOP	
;Protocol.c,717 :: 		case 'F':
L_Sample_Ringbuffer245:
;Protocol.c,718 :: 		case 'f':
L_Sample_Ringbuffer246:
;Protocol.c,721 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,722 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,724 :: 		PrintDebug(gcode[1],temp,&F_Val);
ADDIU	R3, SP, 32
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+64)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,727 :: 		break;
J	L_Sample_Ringbuffer234
NOP	
;Protocol.c,728 :: 		}
L_Sample_Ringbuffer233:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer718
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer718:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer720
NOP	
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer720:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer722
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer722:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer724
NOP	
J	L_Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer724:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer726
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer726:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer728
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer728:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer730
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer730:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer732:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer734:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer736:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer738
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer738:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer740
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer740:
L_Sample_Ringbuffer234:
;Protocol.c,729 :: 		}
L_Sample_Ringbuffer232:
;Protocol.c,730 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,731 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,732 :: 		case 'F':
L_Sample_Ringbuffer247:
;Protocol.c,734 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer741
NOP	
J	L_Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer741:
;Protocol.c,735 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,736 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,737 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,739 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 32
ADDIU	R2, SP, 102
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+384)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,741 :: 		}
L_Sample_Ringbuffer248:
;Protocol.c,742 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,743 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,744 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 136(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer743
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer743:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer745
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer745:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer747
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer747:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer749
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer749:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer751
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer751:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer753
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer753:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer755
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer755:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer757
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer757:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer759
NOP	
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer759:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer761
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer761:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer763
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer763:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer765
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer765:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer767
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer767:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer769
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer769:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer771
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer771:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer773
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer773:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer775
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer775:
L_Sample_Ringbuffer86:
;Protocol.c,374 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer404:
L__Sample_Ringbuffer403:
;Protocol.c,745 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,746 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,752 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer776
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer776:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer250
NOP	
L_Sample_Ringbuffer249:
;Protocol.c,753 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer777
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer777:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer252
NOP	
L_Sample_Ringbuffer251:
;Protocol.c,754 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer778
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer778:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer254
NOP	
L_Sample_Ringbuffer253:
;Protocol.c,755 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer779
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer779:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer256
NOP	
L_Sample_Ringbuffer255:
;Protocol.c,756 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer780
NOP	
J	L_Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer780:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer258
NOP	
L_Sample_Ringbuffer257:
;Protocol.c,757 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer781
NOP	
J	L_Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer781:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer260
NOP	
L_Sample_Ringbuffer259:
;Protocol.c,758 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer782
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer782:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer262
NOP	
L_Sample_Ringbuffer261:
;Protocol.c,759 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer783
NOP	
J	L_Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer783:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer264
NOP	
L_Sample_Ringbuffer263:
;Protocol.c,760 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer784
NOP	
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer784:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer265:
;Protocol.c,761 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer785
NOP	
J	L_Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer785:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer267:
L_Sample_Ringbuffer264:
L_Sample_Ringbuffer262:
L_Sample_Ringbuffer260:
L_Sample_Ringbuffer258:
L_Sample_Ringbuffer256:
L_Sample_Ringbuffer254:
L_Sample_Ringbuffer252:
L_Sample_Ringbuffer250:
;Protocol.c,764 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,765 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,768 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,769 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,772 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer786
NOP	
J	L_Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer786:
; ?FLOC___Sample_Ringbuffer?T688 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T688 end address is: 8 (R2)
J	L_Sample_Ringbuffer269
NOP	
L_Sample_Ringbuffer268:
; ?FLOC___Sample_Ringbuffer?T688 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T688 end address is: 8 (R2)
L_Sample_Ringbuffer269:
; ?FLOC___Sample_Ringbuffer?T688 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T688 end address is: 8 (R2)
;Protocol.c,774 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,776 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,779 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,780 :: 		}
;Protocol.c,779 :: 		return status;
;Protocol.c,780 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 140
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,786 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,788 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,789 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,790 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,791 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit270:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit788
NOP	
J	L_Protocol_strsplit271
NOP	
L_Protocol_strsplit788:
;Protocol.c,792 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,793 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit790
NOP	
J	L_Protocol_strsplit411
NOP	
L_Protocol_strsplit790:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit792
NOP	
J	L_Protocol_strsplit410
NOP	
L_Protocol_strsplit792:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit793
NOP	
J	L_Protocol_strsplit409
NOP	
L_Protocol_strsplit793:
J	L_Protocol_strsplit275
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit411:
L_Protocol_strsplit410:
L_Protocol_strsplit409:
;Protocol.c,794 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,795 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,796 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,797 :: 		continue;
J	L_Protocol_strsplit272
NOP	
;Protocol.c,798 :: 		}else{
L_Protocol_strsplit275:
;Protocol.c,799 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,801 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit794
NOP	
J	L_Protocol_strsplit277
NOP	
L_Protocol_strsplit794:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,802 :: 		break;
J	L_Protocol_strsplit271
NOP	
L_Protocol_strsplit277:
;Protocol.c,803 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit272:
;Protocol.c,791 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,803 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit270
NOP	
L_Protocol_strsplit271:
;Protocol.c,804 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,805 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,806 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,811 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,813 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,814 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,815 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,816 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2278:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2796
NOP	
J	L_Protocol_strsplit2370
NOP	
L_Protocol_strsplit2796:
;Protocol.c,817 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,818 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2798
NOP	
J	L_Protocol_strsplit2361
NOP	
L_Protocol_strsplit2798:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2800
NOP	
J	L_Protocol_strsplit2360
NOP	
L_Protocol_strsplit2800:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2801
NOP	
J	L_Protocol_strsplit2359
NOP	
L_Protocol_strsplit2801:
J	L_Protocol_strsplit2283
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2361:
L_Protocol_strsplit2360:
L_Protocol_strsplit2359:
;Protocol.c,819 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,820 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,821 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,822 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,823 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2280
NOP	
;Protocol.c,824 :: 		}else{
L_Protocol_strsplit2283:
;Protocol.c,825 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2802
NOP	
J	L_Protocol_strsplit2368
NOP	
L_Protocol_strsplit2802:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2804
NOP	
J	L_Protocol_strsplit2369
NOP	
L_Protocol_strsplit2804:
L_Protocol_strsplit2357:
;Protocol.c,826 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2805
NOP	
J	L_Protocol_strsplit2366
NOP	
L_Protocol_strsplit2805:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2806
NOP	
J	L_Protocol_strsplit2367
NOP	
L_Protocol_strsplit2806:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2356:
;Protocol.c,827 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,828 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,829 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,826 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2363
NOP	
L_Protocol_strsplit2366:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2363:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2362
NOP	
L_Protocol_strsplit2367:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2362:
;Protocol.c,825 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2365
NOP	
L_Protocol_strsplit2368:
L_Protocol_strsplit2365:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2364
NOP	
L_Protocol_strsplit2369:
L_Protocol_strsplit2364:
;Protocol.c,832 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,834 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2807
NOP	
J	L_Protocol_strsplit2291
NOP	
L_Protocol_strsplit2807:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,835 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2279
NOP	
L_Protocol_strsplit2291:
;Protocol.c,836 :: 		}
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
L_Protocol_strsplit2280:
;Protocol.c,816 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,836 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2278
NOP	
L_Protocol_strsplit2370:
;Protocol.c,816 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,836 :: 		}
L_Protocol_strsplit2279:
;Protocol.c,837 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,838 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,839 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,843 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,846 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,847 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,849 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,850 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str292:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str810
NOP	
J	L_Protocol_cpy_val_from_str293
NOP	
L_Protocol_cpy_val_from_str810:
;Protocol.c,851 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,852 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,853 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str292
NOP	
L_Protocol_cpy_val_from_str293:
;Protocol.c,854 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,856 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,857 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,862 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,864 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,866 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,868 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int294:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int812
NOP	
J	L_Protocol_str2int295
NOP	
L_Protocol_str2int812:
;Protocol.c,869 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,870 :: 		while(DMA_IsOn(1));
L_Protocol_str2int297:
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
BNE	R2, R0, L_Protocol_str2int814
NOP	
J	L_Protocol_str2int298
NOP	
L_Protocol_str2int814:
J	L_Protocol_str2int297
NOP	
L_Protocol_str2int298:
;Protocol.c,868 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,871 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int294
NOP	
L_Protocol_str2int295:
;Protocol.c,873 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,874 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
Protocol_PrintDebug:
;Protocol.c,879 :: 		static void PrintDebug(char c,char *strB,void *ptr){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Protocol.c,883 :: 		switch(c){
J	L_Protocol_PrintDebug299
NOP	
;Protocol.c,884 :: 		case 'G':case 'g':
L_Protocol_PrintDebug301:
L_Protocol_PrintDebug302:
;Protocol.c,885 :: 		case 'F':case 'f':
L_Protocol_PrintDebug303:
L_Protocol_PrintDebug304:
;Protocol.c,886 :: 		case 'M':case 'm':
L_Protocol_PrintDebug305:
L_Protocol_PrintDebug306:
;Protocol.c,887 :: 		case 'S':case 's':
L_Protocol_PrintDebug307:
L_Protocol_PrintDebug308:
;Protocol.c,888 :: 		case 'P':case 'p':
L_Protocol_PrintDebug309:
L_Protocol_PrintDebug310:
;Protocol.c,889 :: 		case 'L':case 'l':
L_Protocol_PrintDebug311:
L_Protocol_PrintDebug312:
;Protocol.c,890 :: 		case 'T':case 't':
L_Protocol_PrintDebug313:
L_Protocol_PrintDebug314:
;Protocol.c,891 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,892 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug315:
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
BNE	R2, R0, L_Protocol_PrintDebug817
NOP	
J	L_Protocol_PrintDebug316
NOP	
L_Protocol_PrintDebug817:
J	L_Protocol_PrintDebug315
NOP	
L_Protocol_PrintDebug316:
;Protocol.c,893 :: 		dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
ADDIU	R23, SP, 17
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr3_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr3_Protocol+0)
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
;Protocol.c,894 :: 		break;
J	L_Protocol_PrintDebug300
NOP	
;Protocol.c,895 :: 		case 'X':case 'x':
L_Protocol_PrintDebug317:
L_Protocol_PrintDebug318:
;Protocol.c,896 :: 		case 'Y':case 'y':
L_Protocol_PrintDebug319:
L_Protocol_PrintDebug320:
;Protocol.c,897 :: 		case 'Z':case 'z':
L_Protocol_PrintDebug321:
L_Protocol_PrintDebug322:
;Protocol.c,898 :: 		case 'A':case 'a':
L_Protocol_PrintDebug323:
L_Protocol_PrintDebug324:
;Protocol.c,899 :: 		case 'I':case 'i':
L_Protocol_PrintDebug325:
L_Protocol_PrintDebug326:
;Protocol.c,900 :: 		case 'J':case 'j':
L_Protocol_PrintDebug327:
L_Protocol_PrintDebug328:
;Protocol.c,901 :: 		case 'K':case 'k':
L_Protocol_PrintDebug329:
L_Protocol_PrintDebug330:
;Protocol.c,902 :: 		case 'R':case 'r':
L_Protocol_PrintDebug331:
L_Protocol_PrintDebug332:
;Protocol.c,903 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,904 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug333:
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
BNE	R2, R0, L_Protocol_PrintDebug819
NOP	
J	L_Protocol_PrintDebug334
NOP	
L_Protocol_PrintDebug819:
J	L_Protocol_PrintDebug333
NOP	
L_Protocol_PrintDebug334:
;Protocol.c,905 :: 		dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
ADDIU	R23, SP, 27
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr4_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr4_Protocol+0)
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
;Protocol.c,906 :: 		break;
J	L_Protocol_PrintDebug300
NOP	
;Protocol.c,907 :: 		default:break;
L_Protocol_PrintDebug335:
J	L_Protocol_PrintDebug300
NOP	
;Protocol.c,908 :: 		}
L_Protocol_PrintDebug299:
ANDI	R3, R25, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_PrintDebug821
NOP	
J	L_Protocol_PrintDebug301
NOP	
L_Protocol_PrintDebug821:
ANDI	R3, R25, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_PrintDebug823
NOP	
J	L_Protocol_PrintDebug302
NOP	
L_Protocol_PrintDebug823:
ANDI	R3, R25, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_PrintDebug825
NOP	
J	L_Protocol_PrintDebug303
NOP	
L_Protocol_PrintDebug825:
ANDI	R3, R25, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_PrintDebug827
NOP	
J	L_Protocol_PrintDebug304
NOP	
L_Protocol_PrintDebug827:
ANDI	R3, R25, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_PrintDebug829
NOP	
J	L_Protocol_PrintDebug305
NOP	
L_Protocol_PrintDebug829:
ANDI	R3, R25, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_PrintDebug831
NOP	
J	L_Protocol_PrintDebug306
NOP	
L_Protocol_PrintDebug831:
ANDI	R3, R25, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_PrintDebug833
NOP	
J	L_Protocol_PrintDebug307
NOP	
L_Protocol_PrintDebug833:
ANDI	R3, R25, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_PrintDebug835
NOP	
J	L_Protocol_PrintDebug308
NOP	
L_Protocol_PrintDebug835:
ANDI	R3, R25, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_PrintDebug837
NOP	
J	L_Protocol_PrintDebug309
NOP	
L_Protocol_PrintDebug837:
ANDI	R3, R25, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_PrintDebug839
NOP	
J	L_Protocol_PrintDebug310
NOP	
L_Protocol_PrintDebug839:
ANDI	R3, R25, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_PrintDebug841
NOP	
J	L_Protocol_PrintDebug311
NOP	
L_Protocol_PrintDebug841:
ANDI	R3, R25, 255
ORI	R2, R0, 108
BNE	R3, R2, L_Protocol_PrintDebug843
NOP	
J	L_Protocol_PrintDebug312
NOP	
L_Protocol_PrintDebug843:
ANDI	R3, R25, 255
ORI	R2, R0, 84
BNE	R3, R2, L_Protocol_PrintDebug845
NOP	
J	L_Protocol_PrintDebug313
NOP	
L_Protocol_PrintDebug845:
ANDI	R3, R25, 255
ORI	R2, R0, 116
BNE	R3, R2, L_Protocol_PrintDebug847
NOP	
J	L_Protocol_PrintDebug314
NOP	
L_Protocol_PrintDebug847:
ANDI	R3, R25, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_PrintDebug849
NOP	
J	L_Protocol_PrintDebug317
NOP	
L_Protocol_PrintDebug849:
ANDI	R3, R25, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_PrintDebug851
NOP	
J	L_Protocol_PrintDebug318
NOP	
L_Protocol_PrintDebug851:
ANDI	R3, R25, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_PrintDebug853
NOP	
J	L_Protocol_PrintDebug319
NOP	
L_Protocol_PrintDebug853:
ANDI	R3, R25, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_PrintDebug855
NOP	
J	L_Protocol_PrintDebug320
NOP	
L_Protocol_PrintDebug855:
ANDI	R3, R25, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_PrintDebug857
NOP	
J	L_Protocol_PrintDebug321
NOP	
L_Protocol_PrintDebug857:
ANDI	R3, R25, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_PrintDebug859
NOP	
J	L_Protocol_PrintDebug322
NOP	
L_Protocol_PrintDebug859:
ANDI	R3, R25, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_PrintDebug861
NOP	
J	L_Protocol_PrintDebug323
NOP	
L_Protocol_PrintDebug861:
ANDI	R3, R25, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_PrintDebug863
NOP	
J	L_Protocol_PrintDebug324
NOP	
L_Protocol_PrintDebug863:
ANDI	R3, R25, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_PrintDebug865
NOP	
J	L_Protocol_PrintDebug325
NOP	
L_Protocol_PrintDebug865:
ANDI	R3, R25, 255
ORI	R2, R0, 105
BNE	R3, R2, L_Protocol_PrintDebug867
NOP	
J	L_Protocol_PrintDebug326
NOP	
L_Protocol_PrintDebug867:
ANDI	R3, R25, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_PrintDebug869
NOP	
J	L_Protocol_PrintDebug327
NOP	
L_Protocol_PrintDebug869:
ANDI	R3, R25, 255
ORI	R2, R0, 106
BNE	R3, R2, L_Protocol_PrintDebug871
NOP	
J	L_Protocol_PrintDebug328
NOP	
L_Protocol_PrintDebug871:
ANDI	R3, R25, 255
ORI	R2, R0, 75
BNE	R3, R2, L_Protocol_PrintDebug873
NOP	
J	L_Protocol_PrintDebug329
NOP	
L_Protocol_PrintDebug873:
ANDI	R3, R25, 255
ORI	R2, R0, 107
BNE	R3, R2, L_Protocol_PrintDebug875
NOP	
J	L_Protocol_PrintDebug330
NOP	
L_Protocol_PrintDebug875:
ANDI	R3, R25, 255
ORI	R2, R0, 82
BNE	R3, R2, L_Protocol_PrintDebug877
NOP	
J	L_Protocol_PrintDebug331
NOP	
L_Protocol_PrintDebug877:
ANDI	R3, R25, 255
ORI	R2, R0, 114
BNE	R3, R2, L_Protocol_PrintDebug879
NOP	
J	L_Protocol_PrintDebug332
NOP	
L_Protocol_PrintDebug879:
J	L_Protocol_PrintDebug335
NOP	
L_Protocol_PrintDebug300:
;Protocol.c,909 :: 		return;
;Protocol.c,910 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Protocol_PrintDebug
_protocol_execute_runtime:
;Protocol.c,935 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,936 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+18)(GP)
BNE	R2, R0, L__protocol_execute_runtime882
NOP	
J	L_protocol_execute_runtime336
NOP	
L__protocol_execute_runtime882:
;Protocol.c,937 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,942 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime884
NOP	
J	L__protocol_execute_runtime413
NOP	
L__protocol_execute_runtime884:
;Protocol.c,943 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,946 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime886
NOP	
J	L_protocol_execute_runtime338
NOP	
L__protocol_execute_runtime886:
;Protocol.c,947 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,948 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,949 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,950 :: 		do {
J	L_protocol_execute_runtime339
NOP	
L__protocol_execute_runtime412:
;Protocol.c,954 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,950 :: 		do {
L_protocol_execute_runtime339:
;Protocol.c,954 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime888
NOP	
J	L__protocol_execute_runtime412
NOP	
L__protocol_execute_runtime888:
; rt_exec end address is: 12 (R3)
;Protocol.c,957 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime342
NOP	
L_protocol_execute_runtime338:
;Protocol.c,961 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,962 :: 		}
L_protocol_execute_runtime342:
;Protocol.c,963 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,964 :: 		}
J	L_protocol_execute_runtime337
NOP	
L__protocol_execute_runtime413:
;Protocol.c,942 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,964 :: 		}
L_protocol_execute_runtime337:
;Protocol.c,967 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime890
NOP	
J	L_protocol_execute_runtime343
NOP	
L__protocol_execute_runtime890:
; rt_exec end address is: 16 (R4)
;Protocol.c,968 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,969 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,970 :: 		}
L_protocol_execute_runtime343:
;Protocol.c,973 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime892
NOP	
J	L_protocol_execute_runtime344
NOP	
L__protocol_execute_runtime892:
;Protocol.c,974 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,975 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,976 :: 		}
L_protocol_execute_runtime344:
;Protocol.c,979 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime894
NOP	
J	L_protocol_execute_runtime345
NOP	
L__protocol_execute_runtime894:
;Protocol.c,981 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,982 :: 		}
L_protocol_execute_runtime345:
;Protocol.c,986 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime896
NOP	
J	L_protocol_execute_runtime346
NOP	
L__protocol_execute_runtime896:
;Protocol.c,988 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,989 :: 		}
L_protocol_execute_runtime346:
;Protocol.c,991 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime898
NOP	
J	L_protocol_execute_runtime347
NOP	
L__protocol_execute_runtime898:
;Protocol.c,993 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime900
NOP	
J	L_protocol_execute_runtime348
NOP	
L__protocol_execute_runtime900:
;Protocol.c,994 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
;Protocol.c,995 :: 		}
L_protocol_execute_runtime348:
;Protocol.c,996 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,997 :: 		}
L_protocol_execute_runtime347:
;Protocol.c,998 :: 		}
L_protocol_execute_runtime336:
;Protocol.c,1002 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,1006 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,1010 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check903
NOP	
J	L_protocol_system_check349
NOP	
L__protocol_system_check903:
;Protocol.c,1023 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,1026 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,1027 :: 		sys.execute = 0;
SH	R0, Offset(_sys+18)(GP)
;Protocol.c,1028 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check905
NOP	
J	L_protocol_system_check350
NOP	
L__protocol_system_check905:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check350:
;Protocol.c,1038 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check906
NOP	
J	L__protocol_system_check416
NOP	
L__protocol_system_check906:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check908
NOP	
J	L__protocol_system_check415
NOP	
L__protocol_system_check908:
L__protocol_system_check414:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check416:
L__protocol_system_check415:
;Protocol.c,1042 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check909
NOP	
J	L_protocol_system_check354
NOP	
L__protocol_system_check909:
;Protocol.c,1043 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1044 :: 		} else {
J	L_protocol_system_check355
NOP	
L_protocol_system_check354:
;Protocol.c,1046 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1048 :: 		}
L_protocol_system_check355:
;Protocol.c,1049 :: 		}
L_protocol_system_check349:
;Protocol.c,1050 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
