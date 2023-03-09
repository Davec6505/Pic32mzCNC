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
BNE	R2, R0, L__Str_Initialize367
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize367:
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
BNE	R2, R0, L__Sample_Ringbuffer371
NOP	
J	L__Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer371:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer372
NOP	
J	L__Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer372:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer329:
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
L__Sample_Ringbuffer331:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer330:
;Protocol.c,72 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer373:
; dif end address is: 20 (R5)
;Protocol.c,74 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer375:
;Protocol.c,75 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,76 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer376:
;Protocol.c,81 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,82 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer377:
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
BEQ	R2, R0, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer378:
;Protocol.c,89 :: 		int modal_response = 0;
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
BEQ	R3, R2, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer379:
;Protocol.c,126 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,127 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,128 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,129 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,130 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,131 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,138 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer380:
;Protocol.c,139 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,140 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer381:
;Protocol.c,141 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,142 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,143 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer382:
;Protocol.c,145 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer383:
;Protocol.c,146 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,147 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,148 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,149 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,150 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,151 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,152 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,153 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,154 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,155 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer21:
;Protocol.c,156 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,157 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,158 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,159 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer22:
;Protocol.c,160 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,161 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,162 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,163 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer23:
;Protocol.c,164 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,165 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,168 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer384:
;Protocol.c,169 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer24:
;Protocol.c,170 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,171 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,172 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer25:
;Protocol.c,173 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,177 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer385:
;Protocol.c,178 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,179 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,180 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,181 :: 		} else {
L_Sample_Ringbuffer26:
;Protocol.c,183 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer387:
;Protocol.c,184 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,185 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,186 :: 		}
L_Sample_Ringbuffer28:
;Protocol.c,188 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,189 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,191 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,192 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,194 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer29:
;Protocol.c,195 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,196 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer388:
;Protocol.c,197 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,198 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,200 :: 		}
L_Sample_Ringbuffer30:
;Protocol.c,201 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,202 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,203 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer31:
;Protocol.c,204 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,206 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer390:
;Protocol.c,207 :: 		int axis_to_home = 0;
;Protocol.c,210 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer392
NOP	
J	L__Sample_Ringbuffer333
NOP	
L__Sample_Ringbuffer392:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L__Sample_Ringbuffer332
NOP	
L__Sample_Ringbuffer394:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer333:
L__Sample_Ringbuffer332:
;Protocol.c,211 :: 		int i = 0;
;Protocol.c,212 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,215 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,216 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer36:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 5
BNE	R2, R0, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer395:
;Protocol.c,217 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,216 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,217 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer37:
;Protocol.c,220 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer397:
;Protocol.c,221 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,222 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,223 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,224 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer35:
;Protocol.c,225 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,226 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,227 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,228 :: 		} else {
J	L_Sample_Ringbuffer41
NOP	
L_Sample_Ringbuffer32:
;Protocol.c,229 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,230 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,231 :: 		}
L_Sample_Ringbuffer41:
;Protocol.c,232 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,234 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer42:
;Protocol.c,235 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,236 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer398:
;Protocol.c,237 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer399:
;Protocol.c,238 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer401
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer401:
;Protocol.c,240 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,241 :: 		} else {
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,242 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,243 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,244 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,237 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,249 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,250 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,251 :: 		}else { // Store startup line
L_Sample_Ringbuffer43:
;Protocol.c,252 :: 		int N_Val = 0;
;Protocol.c,253 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,258 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer402
NOP	
J	L__Sample_Ringbuffer335
NOP	
L__Sample_Ringbuffer402:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer403
NOP	
J	L__Sample_Ringbuffer334
NOP	
L__Sample_Ringbuffer403:
L__Sample_Ringbuffer327:
;Protocol.c,259 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,261 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,262 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,269 :: 		}else {
J	L_Sample_Ringbuffer53
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,258 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer335:
L__Sample_Ringbuffer334:
;Protocol.c,270 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,271 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,272 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,275 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer405
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer405:
; helper_var end address is: 28 (R7)
;Protocol.c,276 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer407:
; N_Val end address is: 16 (R4)
;Protocol.c,279 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,280 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,288 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,293 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,294 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,302 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,303 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,305 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,307 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,308 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,309 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer57:
;Protocol.c,310 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,311 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,312 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,313 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer58:
;Protocol.c,314 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,315 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,317 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer59:
;Protocol.c,318 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,319 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,320 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,322 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,323 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,327 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L__Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer409:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L__Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer411:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer337:
L__Sample_Ringbuffer336:
;Protocol.c,328 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,329 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,330 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,331 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer412:
;Protocol.c,333 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,334 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer414
NOP	
J	L__Sample_Ringbuffer354
NOP	
L__Sample_Ringbuffer414:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer354:
L_Sample_Ringbuffer74:
;Protocol.c,335 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,336 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L__Sample_Ringbuffer356
NOP	
L__Sample_Ringbuffer415:
;Protocol.c,338 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,339 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer417
NOP	
J	L__Sample_Ringbuffer355
NOP	
L__Sample_Ringbuffer417:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer355:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,340 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,341 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,342 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer356:
;Protocol.c,336 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,342 :: 		}
L_Sample_Ringbuffer76:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer75:
;Protocol.c,345 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer418
NOP	
J	L__Sample_Ringbuffer339
NOP	
L__Sample_Ringbuffer418:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer420
NOP	
J	L__Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer420:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer339:
L__Sample_Ringbuffer338:
;Protocol.c,346 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,347 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,348 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,353 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,356 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,357 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,358 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,359 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer462:
L_Sample_Ringbuffer19:
;Protocol.c,361 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer463
NOP	
J	L__Sample_Ringbuffer353
NOP	
L__Sample_Ringbuffer463:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer464
NOP	
J	L__Sample_Ringbuffer352
NOP	
L__Sample_Ringbuffer464:
L__Sample_Ringbuffer324:
;Protocol.c,362 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,363 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,364 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,366 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer465:
;Protocol.c,367 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,368 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer466:
;Protocol.c,369 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,372 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L__Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer468:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L__Sample_Ringbuffer341
NOP	
L__Sample_Ringbuffer470:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L__Sample_Ringbuffer340
NOP	
L__Sample_Ringbuffer472:
SEH	R2, R4
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer342:
L__Sample_Ringbuffer341:
L__Sample_Ringbuffer340:
;Protocol.c,373 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer93:
;Protocol.c,374 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,376 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,377 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,379 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,381 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer473:
; ?FLOC___Sample_Ringbuffer?T196 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T196 end address is: 12 (R3)
J	L_Sample_Ringbuffer96
NOP	
L_Sample_Ringbuffer95:
; ?FLOC___Sample_Ringbuffer?T196 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T196 end address is: 12 (R3)
L_Sample_Ringbuffer96:
; ?FLOC___Sample_Ringbuffer?T196 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T196 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,391 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer475:
;Protocol.c,396 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,397 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,398 :: 		case 'G':case 'g':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,399 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer476:
;Protocol.c,400 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,403 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L__Sample_Ringbuffer345
NOP	
L__Sample_Ringbuffer478:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L__Sample_Ringbuffer344
NOP	
L__Sample_Ringbuffer480:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L__Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer482:
SEH	R2, R4
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer345:
L__Sample_Ringbuffer344:
L__Sample_Ringbuffer343:
;Protocol.c,404 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer105:
;Protocol.c,405 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer106
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,407 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,408 :: 		}
L_Sample_Ringbuffer106:
;Protocol.c,410 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,412 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer483:
; ?FLOC___Sample_Ringbuffer?T220 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T220 end address is: 12 (R3)
J	L_Sample_Ringbuffer108
NOP	
L_Sample_Ringbuffer107:
; ?FLOC___Sample_Ringbuffer?T220 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T220 end address is: 12 (R3)
L_Sample_Ringbuffer108:
; ?FLOC___Sample_Ringbuffer?T220 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T220 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,418 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,419 :: 		case 'X':case 'x':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,420 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,421 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,422 :: 		case 'A':case 'a':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,423 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,424 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,428 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,429 :: 		case 'L':case 'l':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,430 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,431 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,435 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,436 :: 		case 'F':case 'f':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,437 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,438 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,442 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,443 :: 		case 'P':case 'p':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,444 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,445 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,449 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,450 :: 		case 'S':case 's':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,451 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,452 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,456 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,457 :: 		}
L_Sample_Ringbuffer98:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer487:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer493:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer495:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer499:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer519:
L_Sample_Ringbuffer99:
;Protocol.c,458 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,463 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer521:
;Protocol.c,464 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,465 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,466 :: 		case 'G':case 'g':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,467 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer522:
;Protocol.c,468 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,471 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L__Sample_Ringbuffer348
NOP	
L__Sample_Ringbuffer524:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L__Sample_Ringbuffer347
NOP	
L__Sample_Ringbuffer526:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L__Sample_Ringbuffer346
NOP	
L__Sample_Ringbuffer528:
SEH	R2, R4
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer348:
L__Sample_Ringbuffer347:
L__Sample_Ringbuffer346:
;Protocol.c,472 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer133:
;Protocol.c,473 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer134
NOP	
L_Sample_Ringbuffer130:
;Protocol.c,475 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,476 :: 		}
L_Sample_Ringbuffer134:
;Protocol.c,478 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,480 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer529:
; ?FLOC___Sample_Ringbuffer?T281 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T281 end address is: 12 (R3)
J	L_Sample_Ringbuffer136
NOP	
L_Sample_Ringbuffer135:
; ?FLOC___Sample_Ringbuffer?T281 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T281 end address is: 12 (R3)
L_Sample_Ringbuffer136:
; ?FLOC___Sample_Ringbuffer?T281 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T281 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,484 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,485 :: 		case 'X':case 'x':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,486 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,487 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,488 :: 		case 'A':case 'a':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,490 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,491 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,495 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,496 :: 		case 'L':case 'l':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,497 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,498 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,502 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,503 :: 		case 'F':case 'f':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,504 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,505 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,509 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,510 :: 		case 'P':case 'p':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,511 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,512 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,516 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,517 :: 		case 'S':case 's':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,518 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,519 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,523 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,524 :: 		}
L_Sample_Ringbuffer126:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer531:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer533:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer535:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer537
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer537:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer539
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer539:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer541:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer543:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer545:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer547:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer549:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer551:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer553:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer555:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer557:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer559:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer561
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer561:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer563
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer563:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer565:
L_Sample_Ringbuffer127:
;Protocol.c,525 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,529 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer567
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer567:
;Protocol.c,530 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,531 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,532 :: 		case 'G':case 'g':
L_Sample_Ringbuffer156:
L_Sample_Ringbuffer157:
;Protocol.c,533 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer568
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer568:
;Protocol.c,534 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,537 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L__Sample_Ringbuffer351
NOP	
L__Sample_Ringbuffer570:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer572
NOP	
J	L__Sample_Ringbuffer350
NOP	
L__Sample_Ringbuffer572:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer574
NOP	
J	L__Sample_Ringbuffer349
NOP	
L__Sample_Ringbuffer574:
SEH	R2, R4
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer351:
L__Sample_Ringbuffer350:
L__Sample_Ringbuffer349:
;Protocol.c,538 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer161:
;Protocol.c,539 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer162
NOP	
L_Sample_Ringbuffer158:
;Protocol.c,541 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,542 :: 		}
L_Sample_Ringbuffer162:
;Protocol.c,544 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,546 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer575:
; ?FLOC___Sample_Ringbuffer?T343 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T343 end address is: 12 (R3)
J	L_Sample_Ringbuffer164
NOP	
L_Sample_Ringbuffer163:
; ?FLOC___Sample_Ringbuffer?T343 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T343 end address is: 12 (R3)
L_Sample_Ringbuffer164:
; ?FLOC___Sample_Ringbuffer?T343 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T343 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,550 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,551 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
L_Sample_Ringbuffer168:
;Protocol.c,552 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,553 :: 		case 'I':case 'i':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,555 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,556 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,560 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,561 :: 		case 'F': case 'f':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,562 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,563 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,567 :: 		break;
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,568 :: 		}
L_Sample_Ringbuffer154:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer577:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer579
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer579:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer581
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer581:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer583
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer583:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer585
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer585:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer587
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer587:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer589
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer589:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer591
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer591:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer593
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer593:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer595
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer595:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer597
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer597:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer599
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer599:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer601
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer601:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer603
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer603:
L_Sample_Ringbuffer155:
;Protocol.c,569 :: 		}
L_Sample_Ringbuffer153:
;Protocol.c,574 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer605
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer605:
;Protocol.c,575 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,576 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer178
NOP	
;Protocol.c,577 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer180:
L_Sample_Ringbuffer181:
;Protocol.c,578 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
;Protocol.c,579 :: 		case 'J':case 'j':
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
;Protocol.c,580 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,581 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,585 :: 		break;
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,586 :: 		case 'F':case 'f':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
;Protocol.c,587 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,588 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,592 :: 		break;
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,594 :: 		}
L_Sample_Ringbuffer178:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer607
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer607:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer609
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer609:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer611
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer611:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer613
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer613:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer615
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer615:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer617
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer617:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer619
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer619:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer621
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer621:
L_Sample_Ringbuffer179:
;Protocol.c,595 :: 		}
L_Sample_Ringbuffer177:
;Protocol.c,599 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer623
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer623:
;Protocol.c,600 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,601 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,602 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer189
NOP	
;Protocol.c,603 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
;Protocol.c,604 :: 		case 'J':case 'j':
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
;Protocol.c,605 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,606 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,610 :: 		break;
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,611 :: 		case 'F':case 'f':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,612 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,613 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,617 :: 		break;
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,618 :: 		}
L_Sample_Ringbuffer189:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer625
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer625:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer627
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer627:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer629
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer629:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer631
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer631:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer633
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer633:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer635
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer635:
L_Sample_Ringbuffer190:
;Protocol.c,619 :: 		}
L_Sample_Ringbuffer188:
;Protocol.c,622 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer637
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer637:
;Protocol.c,623 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,624 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer198
NOP	
;Protocol.c,625 :: 		case 'J':case 'j':
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,626 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,627 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,631 :: 		break;
J	L_Sample_Ringbuffer199
NOP	
;Protocol.c,632 :: 		case 'F':case 'f':
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,633 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,634 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,638 :: 		break;
J	L_Sample_Ringbuffer199
NOP	
;Protocol.c,640 :: 		}
L_Sample_Ringbuffer198:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer639
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer639:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer641
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer641:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer643:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer645:
L_Sample_Ringbuffer199:
;Protocol.c,641 :: 		}
L_Sample_Ringbuffer197:
;Protocol.c,642 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,643 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer646:
; ?FLOC___Sample_Ringbuffer?T446 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T446 end address is: 8 (R2)
J	L_Sample_Ringbuffer205
NOP	
L_Sample_Ringbuffer204:
; ?FLOC___Sample_Ringbuffer?T446 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T446 end address is: 8 (R2)
L_Sample_Ringbuffer205:
; ?FLOC___Sample_Ringbuffer?T446 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T446 end address is: 8 (R2)
;Protocol.c,644 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,645 :: 		case 'M':
L_Sample_Ringbuffer206:
;Protocol.c,646 :: 		case 'm':
L_Sample_Ringbuffer207:
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
;Protocol.c,649 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,650 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,656 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer648:
;Protocol.c,657 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer209
NOP	
;Protocol.c,658 :: 		case 'S':
L_Sample_Ringbuffer211:
;Protocol.c,659 :: 		case 's':
L_Sample_Ringbuffer212:
;Protocol.c,661 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,662 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,663 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,667 :: 		}
J	L_Sample_Ringbuffer210
NOP	
L_Sample_Ringbuffer209:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer650:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer652:
L_Sample_Ringbuffer210:
;Protocol.c,668 :: 		}
L_Sample_Ringbuffer208:
;Protocol.c,669 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,670 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,671 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer213:
L_Sample_Ringbuffer214:
L_Sample_Ringbuffer215:
L_Sample_Ringbuffer216:
;Protocol.c,672 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
;Protocol.c,673 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer653:
;Protocol.c,674 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,675 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,676 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,680 :: 		}
L_Sample_Ringbuffer221:
;Protocol.c,684 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer655
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer655:
;Protocol.c,685 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,686 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,687 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer223
NOP	
;Protocol.c,688 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer225:
L_Sample_Ringbuffer226:
;Protocol.c,689 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer227:
L_Sample_Ringbuffer228:
;Protocol.c,690 :: 		case 'A':case 'a':
L_Sample_Ringbuffer229:
L_Sample_Ringbuffer230:
;Protocol.c,691 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,692 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,696 :: 		break;
J	L_Sample_Ringbuffer224
NOP	
;Protocol.c,697 :: 		case 'F':
L_Sample_Ringbuffer231:
;Protocol.c,698 :: 		case 'f':
L_Sample_Ringbuffer232:
;Protocol.c,701 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,702 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,707 :: 		break;
J	L_Sample_Ringbuffer224
NOP	
;Protocol.c,708 :: 		}
L_Sample_Ringbuffer223:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer657:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer659
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer659:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer661
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer661:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer663
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer663:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer665:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer667
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer667:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer669
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer669:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer671
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer671:
L_Sample_Ringbuffer224:
;Protocol.c,709 :: 		}
L_Sample_Ringbuffer222:
;Protocol.c,710 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,711 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,712 :: 		case 'F':
L_Sample_Ringbuffer233:
;Protocol.c,714 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer672:
;Protocol.c,715 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,716 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,717 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,721 :: 		}
L_Sample_Ringbuffer234:
;Protocol.c,722 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,723 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,724 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer674:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer676:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer678:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer680
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer680:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer682:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer684:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer686:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer688:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer690:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer692:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer694:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer696
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer696:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer698
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer698:
L_Sample_Ringbuffer86:
;Protocol.c,361 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer353:
L__Sample_Ringbuffer352:
;Protocol.c,725 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,726 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,732 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer699
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer699:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer236
NOP	
L_Sample_Ringbuffer235:
;Protocol.c,733 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer700:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer238
NOP	
L_Sample_Ringbuffer237:
;Protocol.c,734 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer701
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer701:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer240
NOP	
L_Sample_Ringbuffer239:
;Protocol.c,735 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer702
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer702:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer242
NOP	
L_Sample_Ringbuffer241:
;Protocol.c,736 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer703
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer703:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer244
NOP	
L_Sample_Ringbuffer243:
;Protocol.c,737 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer704
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer704:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer246
NOP	
L_Sample_Ringbuffer245:
;Protocol.c,738 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer705
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer705:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer248
NOP	
L_Sample_Ringbuffer247:
;Protocol.c,739 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer706
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer706:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer250
NOP	
L_Sample_Ringbuffer249:
;Protocol.c,740 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer707:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer251:
;Protocol.c,741 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer708
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer708:
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
;Protocol.c,744 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,745 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,748 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,749 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,752 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer709:
; ?FLOC___Sample_Ringbuffer?T550 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T550 end address is: 8 (R2)
J	L_Sample_Ringbuffer255
NOP	
L_Sample_Ringbuffer254:
; ?FLOC___Sample_Ringbuffer?T550 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T550 end address is: 8 (R2)
L_Sample_Ringbuffer255:
; ?FLOC___Sample_Ringbuffer?T550 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T550 end address is: 8 (R2)
;Protocol.c,753 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,755 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,756 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,757 :: 		}
;Protocol.c,756 :: 		return status;
;Protocol.c,757 :: 		}
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
;Protocol.c,763 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,765 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,766 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,767 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,768 :: 		for (i = 0; i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit711
NOP	
J	L_Protocol_strsplit257
NOP	
L_Protocol_strsplit711:
;Protocol.c,769 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,770 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit713
NOP	
J	L_Protocol_strsplit360
NOP	
L_Protocol_strsplit713:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit715
NOP	
J	L_Protocol_strsplit359
NOP	
L_Protocol_strsplit715:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit716
NOP	
J	L_Protocol_strsplit358
NOP	
L_Protocol_strsplit716:
J	L_Protocol_strsplit261
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit360:
L_Protocol_strsplit359:
L_Protocol_strsplit358:
;Protocol.c,771 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,772 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,773 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,774 :: 		continue;
J	L_Protocol_strsplit258
NOP	
;Protocol.c,775 :: 		}else{
L_Protocol_strsplit261:
;Protocol.c,776 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,778 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit717
NOP	
J	L_Protocol_strsplit263
NOP	
L_Protocol_strsplit717:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,779 :: 		break;
J	L_Protocol_strsplit257
NOP	
L_Protocol_strsplit263:
;Protocol.c,780 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit258:
;Protocol.c,768 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,780 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit256
NOP	
L_Protocol_strsplit257:
;Protocol.c,781 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,782 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,783 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,788 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,790 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,791 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,792 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,793 :: 		for (i = 0;i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit2719
NOP	
J	L_Protocol_strsplit2319
NOP	
L_Protocol_strsplit2719:
;Protocol.c,794 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,795 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2721
NOP	
J	L_Protocol_strsplit2310
NOP	
L_Protocol_strsplit2721:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2723
NOP	
J	L_Protocol_strsplit2309
NOP	
L_Protocol_strsplit2723:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2724
NOP	
J	L_Protocol_strsplit2308
NOP	
L_Protocol_strsplit2724:
J	L_Protocol_strsplit2269
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2310:
L_Protocol_strsplit2309:
L_Protocol_strsplit2308:
;Protocol.c,796 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,797 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,798 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,799 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,800 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2266
NOP	
;Protocol.c,801 :: 		}else{
L_Protocol_strsplit2269:
;Protocol.c,802 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2725
NOP	
J	L_Protocol_strsplit2317
NOP	
L_Protocol_strsplit2725:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2727
NOP	
J	L_Protocol_strsplit2318
NOP	
L_Protocol_strsplit2727:
L_Protocol_strsplit2306:
;Protocol.c,803 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2728
NOP	
J	L_Protocol_strsplit2315
NOP	
L_Protocol_strsplit2728:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2729
NOP	
J	L_Protocol_strsplit2316
NOP	
L_Protocol_strsplit2729:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2305:
;Protocol.c,804 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,805 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,806 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,803 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2312
NOP	
L_Protocol_strsplit2315:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2312:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2311
NOP	
L_Protocol_strsplit2316:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2311:
;Protocol.c,802 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2314
NOP	
L_Protocol_strsplit2317:
L_Protocol_strsplit2314:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2313
NOP	
L_Protocol_strsplit2318:
L_Protocol_strsplit2313:
;Protocol.c,809 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,811 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2730
NOP	
J	L_Protocol_strsplit2277
NOP	
L_Protocol_strsplit2730:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,812 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2265
NOP	
L_Protocol_strsplit2277:
;Protocol.c,813 :: 		}
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
;Protocol.c,793 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,813 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2264
NOP	
L_Protocol_strsplit2319:
;Protocol.c,793 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,813 :: 		}
L_Protocol_strsplit2265:
;Protocol.c,814 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,815 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,816 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,820 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,823 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,824 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,826 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,827 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str278:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str733
NOP	
J	L_Protocol_cpy_val_from_str279
NOP	
L_Protocol_cpy_val_from_str733:
;Protocol.c,828 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,829 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,830 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str278
NOP	
L_Protocol_cpy_val_from_str279:
;Protocol.c,831 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,833 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,834 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,839 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,841 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,843 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,845 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int280:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int735
NOP	
J	L_Protocol_str2int281
NOP	
L_Protocol_str2int735:
;Protocol.c,846 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,847 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L_Protocol_str2int737
NOP	
J	L_Protocol_str2int284
NOP	
L_Protocol_str2int737:
J	L_Protocol_str2int283
NOP	
L_Protocol_str2int284:
;Protocol.c,845 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,848 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int280
NOP	
L_Protocol_str2int281:
;Protocol.c,850 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,851 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,908 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,909 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+26)(GP)
BNE	R2, R0, L__protocol_execute_runtime740
NOP	
J	L_protocol_execute_runtime285
NOP	
L__protocol_execute_runtime740:
;Protocol.c,910 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+26)(GP)
;Protocol.c,915 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime742
NOP	
J	L__protocol_execute_runtime362
NOP	
L__protocol_execute_runtime742:
;Protocol.c,916 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,919 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime744
NOP	
J	L_protocol_execute_runtime287
NOP	
L__protocol_execute_runtime744:
;Protocol.c,920 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,921 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,922 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,923 :: 		do {
J	L_protocol_execute_runtime288
NOP	
L__protocol_execute_runtime361:
;Protocol.c,927 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,923 :: 		do {
L_protocol_execute_runtime288:
;Protocol.c,927 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime746
NOP	
J	L__protocol_execute_runtime361
NOP	
L__protocol_execute_runtime746:
; rt_exec end address is: 12 (R3)
;Protocol.c,930 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime291
NOP	
L_protocol_execute_runtime287:
;Protocol.c,934 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,935 :: 		}
L_protocol_execute_runtime291:
;Protocol.c,936 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,937 :: 		}
J	L_protocol_execute_runtime286
NOP	
L__protocol_execute_runtime362:
;Protocol.c,915 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,937 :: 		}
L_protocol_execute_runtime286:
;Protocol.c,940 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime748
NOP	
J	L_protocol_execute_runtime292
NOP	
L__protocol_execute_runtime748:
; rt_exec end address is: 16 (R4)
;Protocol.c,941 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,942 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,943 :: 		}
L_protocol_execute_runtime292:
;Protocol.c,946 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime750
NOP	
J	L_protocol_execute_runtime293
NOP	
L__protocol_execute_runtime750:
;Protocol.c,947 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,948 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,949 :: 		}
L_protocol_execute_runtime293:
;Protocol.c,952 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime752
NOP	
J	L_protocol_execute_runtime294
NOP	
L__protocol_execute_runtime752:
;Protocol.c,954 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,955 :: 		}
L_protocol_execute_runtime294:
;Protocol.c,959 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime754
NOP	
J	L_protocol_execute_runtime295
NOP	
L__protocol_execute_runtime754:
;Protocol.c,961 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,962 :: 		}
L_protocol_execute_runtime295:
;Protocol.c,964 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime756
NOP	
J	L_protocol_execute_runtime296
NOP	
L__protocol_execute_runtime756:
;Protocol.c,966 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime758
NOP	
J	L_protocol_execute_runtime297
NOP	
L__protocol_execute_runtime758:
;Protocol.c,967 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,968 :: 		}
L_protocol_execute_runtime297:
;Protocol.c,969 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,970 :: 		}
L_protocol_execute_runtime296:
;Protocol.c,971 :: 		}
L_protocol_execute_runtime285:
;Protocol.c,975 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,979 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,983 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check761
NOP	
J	L_protocol_system_check298
NOP	
L__protocol_system_check761:
;Protocol.c,996 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,999 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,1000 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,1001 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check763
NOP	
J	L_protocol_system_check299
NOP	
L__protocol_system_check763:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check299:
;Protocol.c,1011 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check764
NOP	
J	L__protocol_system_check365
NOP	
L__protocol_system_check764:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check766
NOP	
J	L__protocol_system_check364
NOP	
L__protocol_system_check766:
L__protocol_system_check363:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check365:
L__protocol_system_check364:
;Protocol.c,1015 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check767
NOP	
J	L_protocol_system_check303
NOP	
L__protocol_system_check767:
;Protocol.c,1016 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1017 :: 		} else {
J	L_protocol_system_check304
NOP	
L_protocol_system_check303:
;Protocol.c,1019 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1021 :: 		}
L_protocol_system_check304:
;Protocol.c,1022 :: 		}
L_protocol_system_check298:
;Protocol.c,1023 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
