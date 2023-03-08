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
BNE	R2, R0, L__Str_Initialize357
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize357:
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
BNE	R2, R0, L__Sample_Ringbuffer361
NOP	
J	L__Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer361:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer362
NOP	
J	L__Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer362:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer319:
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
L__Sample_Ringbuffer321:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer320:
;Protocol.c,72 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer363:
; dif end address is: 20 (R5)
;Protocol.c,74 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer365:
;Protocol.c,75 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,76 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer366:
;Protocol.c,81 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,82 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer367:
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
BEQ	R2, R0, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer368:
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
BEQ	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer369:
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
BEQ	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer370:
;Protocol.c,139 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,140 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer371:
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
BEQ	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer372:
;Protocol.c,145 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer373:
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
BEQ	R2, R0, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer374:
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
BEQ	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer375:
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
BNE	R2, R0, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer377:
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
BEQ	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer378:
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
BNE	R2, R0, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer380:
;Protocol.c,207 :: 		int axis_to_home = 0;
;Protocol.c,210 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer382
NOP	
J	L__Sample_Ringbuffer323
NOP	
L__Sample_Ringbuffer382:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L__Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer384:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer323:
L__Sample_Ringbuffer322:
;Protocol.c,211 :: 		int i = 0;
;Protocol.c,212 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,215 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,216 :: 		for(i=1;i<NoOfAxis;i++)
; i start address is: 12 (R3)
ORI	R3, R0, 1
; i end address is: 12 (R3)
L_Sample_Ringbuffer36:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer385:
;Protocol.c,217 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,216 :: 		for(i=1;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,217 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer37:
;Protocol.c,223 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer387:
;Protocol.c,224 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,225 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,226 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,227 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer35:
;Protocol.c,228 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,229 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,230 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,231 :: 		} else {
J	L_Sample_Ringbuffer41
NOP	
L_Sample_Ringbuffer32:
;Protocol.c,232 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,234 :: 		}
L_Sample_Ringbuffer41:
;Protocol.c,235 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,236 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,237 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer42:
;Protocol.c,238 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,239 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer388:
;Protocol.c,240 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer389:
;Protocol.c,241 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer391:
;Protocol.c,243 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,244 :: 		} else {
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,245 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,246 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,247 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,240 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,252 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,253 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,254 :: 		}else { // Store startup line
L_Sample_Ringbuffer43:
;Protocol.c,255 :: 		int N_Val = 0;
;Protocol.c,256 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,261 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer392
NOP	
J	L__Sample_Ringbuffer325
NOP	
L__Sample_Ringbuffer392:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer393
NOP	
J	L__Sample_Ringbuffer324
NOP	
L__Sample_Ringbuffer393:
L__Sample_Ringbuffer317:
;Protocol.c,262 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,264 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,265 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,272 :: 		}else {
J	L_Sample_Ringbuffer53
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,261 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer325:
L__Sample_Ringbuffer324:
;Protocol.c,273 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,274 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,275 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,278 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer395:
; helper_var end address is: 28 (R7)
;Protocol.c,279 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer397:
; N_Val end address is: 16 (R4)
;Protocol.c,282 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,283 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,291 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,296 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,297 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,305 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,306 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,308 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,310 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,311 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,312 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer57:
;Protocol.c,313 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,314 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,315 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,316 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer58:
;Protocol.c,317 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,318 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,320 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer59:
;Protocol.c,321 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,322 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,323 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,325 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,326 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,330 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L__Sample_Ringbuffer327
NOP	
L__Sample_Ringbuffer399:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer401
NOP	
J	L__Sample_Ringbuffer326
NOP	
L__Sample_Ringbuffer401:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer327:
L__Sample_Ringbuffer326:
;Protocol.c,331 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,332 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,333 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,334 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer402:
;Protocol.c,336 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,337 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer404
NOP	
J	L__Sample_Ringbuffer344
NOP	
L__Sample_Ringbuffer404:
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
L__Sample_Ringbuffer344:
L_Sample_Ringbuffer74:
;Protocol.c,338 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,339 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer405
NOP	
J	L__Sample_Ringbuffer346
NOP	
L__Sample_Ringbuffer405:
;Protocol.c,341 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,342 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer407
NOP	
J	L__Sample_Ringbuffer345
NOP	
L__Sample_Ringbuffer407:
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
L__Sample_Ringbuffer345:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,343 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,344 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,345 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer346:
;Protocol.c,339 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,345 :: 		}
L_Sample_Ringbuffer76:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer75:
;Protocol.c,348 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer408
NOP	
J	L__Sample_Ringbuffer329
NOP	
L__Sample_Ringbuffer408:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer410
NOP	
J	L__Sample_Ringbuffer328
NOP	
L__Sample_Ringbuffer410:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer329:
L__Sample_Ringbuffer328:
;Protocol.c,349 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,350 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,351 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,356 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,359 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,360 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,361 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,362 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer452:
L_Sample_Ringbuffer19:
;Protocol.c,364 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer453
NOP	
J	L__Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer453:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer454
NOP	
J	L__Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer454:
L__Sample_Ringbuffer314:
;Protocol.c,365 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,366 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,368 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer455:
;Protocol.c,369 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,370 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer456:
;Protocol.c,371 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,374 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L__Sample_Ringbuffer332
NOP	
L__Sample_Ringbuffer458:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L__Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer460:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L__Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer462:
SEH	R2, R4
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer332:
L__Sample_Ringbuffer331:
L__Sample_Ringbuffer330:
;Protocol.c,375 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer93:
;Protocol.c,376 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,378 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,379 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,381 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,391 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer464:
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
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,398 :: 		case 'G':case 'g':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,399 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer465:
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
BNE	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L__Sample_Ringbuffer335
NOP	
L__Sample_Ringbuffer467:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L__Sample_Ringbuffer334
NOP	
L__Sample_Ringbuffer469:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer471
NOP	
J	L__Sample_Ringbuffer333
NOP	
L__Sample_Ringbuffer471:
SEH	R2, R4
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer335:
L__Sample_Ringbuffer334:
L__Sample_Ringbuffer333:
;Protocol.c,404 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer103:
;Protocol.c,405 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer104
NOP	
L_Sample_Ringbuffer100:
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
L_Sample_Ringbuffer104:
;Protocol.c,410 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,414 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,415 :: 		case 'X':case 'x':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,416 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,417 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,418 :: 		case 'A':case 'a':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,419 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,420 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,424 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,425 :: 		case 'L':case 'l':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,426 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,427 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,431 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,432 :: 		case 'F':case 'f':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,433 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,434 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,438 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,439 :: 		case 'P':case 'p':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,440 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,441 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,445 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,446 :: 		case 'S':case 's':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,447 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,448 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,452 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,453 :: 		}
L_Sample_Ringbuffer96:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer475:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer479:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer481:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer483:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer493:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer495:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer499:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer507:
L_Sample_Ringbuffer97:
;Protocol.c,454 :: 		}
L_Sample_Ringbuffer95:
;Protocol.c,459 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer509:
;Protocol.c,460 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,461 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer122
NOP	
;Protocol.c,462 :: 		case 'G':case 'g':
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
;Protocol.c,463 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer510:
;Protocol.c,464 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,467 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L__Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer512:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L__Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer514:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L__Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer516:
SEH	R2, R4
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer338:
L__Sample_Ringbuffer337:
L__Sample_Ringbuffer336:
;Protocol.c,468 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer129:
;Protocol.c,469 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer130
NOP	
L_Sample_Ringbuffer126:
;Protocol.c,471 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,472 :: 		}
L_Sample_Ringbuffer130:
;Protocol.c,474 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,478 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,479 :: 		case 'X':case 'x':
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,480 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer133:
L_Sample_Ringbuffer134:
;Protocol.c,481 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
;Protocol.c,482 :: 		case 'A':case 'a':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,484 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,485 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,489 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,490 :: 		case 'L':case 'l':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,491 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,492 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,496 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,497 :: 		case 'F':case 'f':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,498 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,499 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,503 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,504 :: 		case 'P':case 'p':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,505 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,506 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,510 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,511 :: 		case 'S':case 's':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,512 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,513 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,517 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,518 :: 		}
L_Sample_Ringbuffer122:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer518:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer520:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer522:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer524:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer526:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer528:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer530:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer532:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer534:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer536:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer538:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer542:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer544:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer546:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer548:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer550
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer550:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer552
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer552:
L_Sample_Ringbuffer123:
;Protocol.c,519 :: 		}
L_Sample_Ringbuffer121:
;Protocol.c,523 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer554
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer554:
;Protocol.c,524 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,525 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,526 :: 		case 'G':case 'g':
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
;Protocol.c,527 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer555:
;Protocol.c,528 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,531 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L__Sample_Ringbuffer341
NOP	
L__Sample_Ringbuffer557:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L__Sample_Ringbuffer340
NOP	
L__Sample_Ringbuffer559:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer561
NOP	
J	L__Sample_Ringbuffer339
NOP	
L__Sample_Ringbuffer561:
SEH	R2, R4
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer341:
L__Sample_Ringbuffer340:
L__Sample_Ringbuffer339:
;Protocol.c,532 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer155:
;Protocol.c,533 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer156
NOP	
L_Sample_Ringbuffer152:
;Protocol.c,535 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,536 :: 		}
L_Sample_Ringbuffer156:
;Protocol.c,538 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,542 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,543 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
;Protocol.c,544 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
L_Sample_Ringbuffer164:
;Protocol.c,545 :: 		case 'I':case 'i':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,547 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,548 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,552 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,553 :: 		case 'F': case 'f':
L_Sample_Ringbuffer167:
L_Sample_Ringbuffer168:
;Protocol.c,554 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,555 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,559 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,560 :: 		}
L_Sample_Ringbuffer148:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer563
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer563:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer565:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer567
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer567:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer569
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer569:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer571
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer571:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer573
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer573:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer575:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer577:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer579
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer579:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer581
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer581:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer583
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer583:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer585
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer585:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer587
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer587:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer589
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer589:
L_Sample_Ringbuffer149:
;Protocol.c,561 :: 		}
L_Sample_Ringbuffer147:
;Protocol.c,566 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer591
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer591:
;Protocol.c,567 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,568 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,569 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,570 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,571 :: 		case 'J':case 'j':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,572 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,573 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,577 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,578 :: 		case 'F':case 'f':
L_Sample_Ringbuffer178:
L_Sample_Ringbuffer179:
;Protocol.c,579 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,580 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,584 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,586 :: 		}
L_Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer593
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer593:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer595
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer595:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer597
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer597:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer599
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer599:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer601
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer601:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer603
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer603:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer605
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer605:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer607
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer607:
L_Sample_Ringbuffer171:
;Protocol.c,587 :: 		}
L_Sample_Ringbuffer169:
;Protocol.c,591 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer609
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer609:
;Protocol.c,592 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,593 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,594 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer181
NOP	
;Protocol.c,595 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
;Protocol.c,596 :: 		case 'J':case 'j':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
;Protocol.c,597 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,598 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,602 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,603 :: 		case 'F':case 'f':
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
;Protocol.c,604 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,605 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,609 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,610 :: 		}
L_Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer611
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer611:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer613
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer613:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer615
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer615:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer617
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer617:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer619
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer619:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer621
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer621:
L_Sample_Ringbuffer182:
;Protocol.c,611 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,614 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer623
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer623:
;Protocol.c,615 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,616 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,617 :: 		case 'J':case 'j':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,618 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,619 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,623 :: 		break;
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,624 :: 		case 'F':case 'f':
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,625 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,626 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,630 :: 		break;
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,632 :: 		}
L_Sample_Ringbuffer190:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer625
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer625:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer627
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer627:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer629
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer629:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer631
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer631:
L_Sample_Ringbuffer191:
;Protocol.c,633 :: 		}
L_Sample_Ringbuffer189:
;Protocol.c,634 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,635 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,636 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,637 :: 		case 'M':
L_Sample_Ringbuffer196:
;Protocol.c,638 :: 		case 'm':
L_Sample_Ringbuffer197:
;Protocol.c,640 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,641 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,642 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,648 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer633
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer633:
;Protocol.c,649 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer199
NOP	
;Protocol.c,650 :: 		case 'S':
L_Sample_Ringbuffer201:
;Protocol.c,651 :: 		case 's':
L_Sample_Ringbuffer202:
;Protocol.c,653 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,654 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,655 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,659 :: 		break;
J	L_Sample_Ringbuffer200
NOP	
;Protocol.c,660 :: 		}
L_Sample_Ringbuffer199:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer635
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer635:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer637
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer637:
L_Sample_Ringbuffer200:
;Protocol.c,661 :: 		}
L_Sample_Ringbuffer198:
;Protocol.c,662 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,663 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,664 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer203:
L_Sample_Ringbuffer204:
L_Sample_Ringbuffer205:
L_Sample_Ringbuffer206:
;Protocol.c,665 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer207:
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
L_Sample_Ringbuffer210:
;Protocol.c,666 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer638
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer638:
;Protocol.c,667 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,668 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,669 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,673 :: 		}
L_Sample_Ringbuffer211:
;Protocol.c,677 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer640
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer640:
;Protocol.c,678 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,679 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,680 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer213
NOP	
;Protocol.c,681 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer215:
L_Sample_Ringbuffer216:
;Protocol.c,682 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
;Protocol.c,683 :: 		case 'A':case 'a':
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
;Protocol.c,684 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,685 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,689 :: 		break;
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,690 :: 		case 'F':
L_Sample_Ringbuffer221:
;Protocol.c,691 :: 		case 'f':
L_Sample_Ringbuffer222:
;Protocol.c,694 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,695 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,700 :: 		break;
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,701 :: 		}
L_Sample_Ringbuffer213:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer642:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer644:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer646:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer648:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer650:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer652:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer654:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer656:
L_Sample_Ringbuffer214:
;Protocol.c,702 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,703 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,704 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,705 :: 		case 'F':
L_Sample_Ringbuffer223:
;Protocol.c,707 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer657:
;Protocol.c,708 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,709 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,710 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,714 :: 		}
L_Sample_Ringbuffer224:
;Protocol.c,715 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,716 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,717 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer659
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer659:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer661
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer661:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer663
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer663:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer665:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer667
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer667:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer669
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer669:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer671
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer671:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer673
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer673:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer675
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer675:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer677
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer677:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer679
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer679:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer681:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer683
NOP	
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer683:
L_Sample_Ringbuffer86:
;Protocol.c,364 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer343:
L__Sample_Ringbuffer342:
;Protocol.c,718 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,719 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,720 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer684:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer226
NOP	
L_Sample_Ringbuffer225:
;Protocol.c,721 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer685
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer685:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer228
NOP	
L_Sample_Ringbuffer227:
;Protocol.c,722 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer686:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer230
NOP	
L_Sample_Ringbuffer229:
;Protocol.c,723 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer687
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer687:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer232
NOP	
L_Sample_Ringbuffer231:
;Protocol.c,724 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer688:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer234
NOP	
L_Sample_Ringbuffer233:
;Protocol.c,725 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer689
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer689:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer236
NOP	
L_Sample_Ringbuffer235:
;Protocol.c,726 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer690:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer238
NOP	
L_Sample_Ringbuffer237:
;Protocol.c,727 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer691
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer691:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer240
NOP	
L_Sample_Ringbuffer239:
;Protocol.c,728 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer692:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer241:
;Protocol.c,729 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer693
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer693:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer240:
L_Sample_Ringbuffer238:
L_Sample_Ringbuffer236:
L_Sample_Ringbuffer234:
L_Sample_Ringbuffer232:
L_Sample_Ringbuffer230:
L_Sample_Ringbuffer228:
L_Sample_Ringbuffer226:
;Protocol.c,731 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,732 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,735 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,736 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,739 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer694:
; ?FLOC___Sample_Ringbuffer?T540 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T540 end address is: 8 (R2)
J	L_Sample_Ringbuffer245
NOP	
L_Sample_Ringbuffer244:
; ?FLOC___Sample_Ringbuffer?T540 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T540 end address is: 8 (R2)
L_Sample_Ringbuffer245:
; ?FLOC___Sample_Ringbuffer?T540 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T540 end address is: 8 (R2)
;Protocol.c,740 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,742 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,743 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,744 :: 		}
;Protocol.c,743 :: 		return status;
;Protocol.c,744 :: 		}
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
;Protocol.c,750 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,752 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,753 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,754 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,755 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit246:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit696
NOP	
J	L_Protocol_strsplit247
NOP	
L_Protocol_strsplit696:
;Protocol.c,756 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,757 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit698
NOP	
J	L_Protocol_strsplit350
NOP	
L_Protocol_strsplit698:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit700
NOP	
J	L_Protocol_strsplit349
NOP	
L_Protocol_strsplit700:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit701
NOP	
J	L_Protocol_strsplit348
NOP	
L_Protocol_strsplit701:
J	L_Protocol_strsplit251
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit350:
L_Protocol_strsplit349:
L_Protocol_strsplit348:
;Protocol.c,758 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,759 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,760 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,761 :: 		continue;
J	L_Protocol_strsplit248
NOP	
;Protocol.c,762 :: 		}else{
L_Protocol_strsplit251:
;Protocol.c,763 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,765 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit702
NOP	
J	L_Protocol_strsplit253
NOP	
L_Protocol_strsplit702:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,766 :: 		break;
J	L_Protocol_strsplit247
NOP	
L_Protocol_strsplit253:
;Protocol.c,767 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit248:
;Protocol.c,755 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,767 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit246
NOP	
L_Protocol_strsplit247:
;Protocol.c,768 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,769 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,770 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,775 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,777 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,778 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,779 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,780 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2254:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2704
NOP	
J	L_Protocol_strsplit2309
NOP	
L_Protocol_strsplit2704:
;Protocol.c,781 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,782 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2706
NOP	
J	L_Protocol_strsplit2300
NOP	
L_Protocol_strsplit2706:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2708
NOP	
J	L_Protocol_strsplit2299
NOP	
L_Protocol_strsplit2708:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2709
NOP	
J	L_Protocol_strsplit2298
NOP	
L_Protocol_strsplit2709:
J	L_Protocol_strsplit2259
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2300:
L_Protocol_strsplit2299:
L_Protocol_strsplit2298:
;Protocol.c,783 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,784 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,785 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,786 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,787 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2256
NOP	
;Protocol.c,788 :: 		}else{
L_Protocol_strsplit2259:
;Protocol.c,789 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2710
NOP	
J	L_Protocol_strsplit2307
NOP	
L_Protocol_strsplit2710:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2712
NOP	
J	L_Protocol_strsplit2308
NOP	
L_Protocol_strsplit2712:
L_Protocol_strsplit2296:
;Protocol.c,790 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2713
NOP	
J	L_Protocol_strsplit2305
NOP	
L_Protocol_strsplit2713:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2714
NOP	
J	L_Protocol_strsplit2306
NOP	
L_Protocol_strsplit2714:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2295:
;Protocol.c,791 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,792 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,793 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,790 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2302
NOP	
L_Protocol_strsplit2305:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2302:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2301
NOP	
L_Protocol_strsplit2306:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2301:
;Protocol.c,789 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2304
NOP	
L_Protocol_strsplit2307:
L_Protocol_strsplit2304:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2303
NOP	
L_Protocol_strsplit2308:
L_Protocol_strsplit2303:
;Protocol.c,796 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,798 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2715
NOP	
J	L_Protocol_strsplit2267
NOP	
L_Protocol_strsplit2715:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,799 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2255
NOP	
L_Protocol_strsplit2267:
;Protocol.c,800 :: 		}
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
L_Protocol_strsplit2256:
;Protocol.c,780 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,800 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2254
NOP	
L_Protocol_strsplit2309:
;Protocol.c,780 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,800 :: 		}
L_Protocol_strsplit2255:
;Protocol.c,801 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,802 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,803 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,807 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,810 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,811 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,813 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,814 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str268:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str718
NOP	
J	L_Protocol_cpy_val_from_str269
NOP	
L_Protocol_cpy_val_from_str718:
;Protocol.c,815 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,816 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,817 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str268
NOP	
L_Protocol_cpy_val_from_str269:
;Protocol.c,818 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,820 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,821 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,826 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,828 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,830 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,832 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int270:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int720
NOP	
J	L_Protocol_str2int271
NOP	
L_Protocol_str2int720:
;Protocol.c,833 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,834 :: 		while(DMA_IsOn(1));
L_Protocol_str2int273:
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
BNE	R2, R0, L_Protocol_str2int722
NOP	
J	L_Protocol_str2int274
NOP	
L_Protocol_str2int722:
J	L_Protocol_str2int273
NOP	
L_Protocol_str2int274:
;Protocol.c,832 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,835 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int270
NOP	
L_Protocol_str2int271:
;Protocol.c,837 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,838 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,895 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,896 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+26)(GP)
BNE	R2, R0, L__protocol_execute_runtime725
NOP	
J	L_protocol_execute_runtime275
NOP	
L__protocol_execute_runtime725:
;Protocol.c,897 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+26)(GP)
;Protocol.c,902 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime727
NOP	
J	L__protocol_execute_runtime352
NOP	
L__protocol_execute_runtime727:
;Protocol.c,903 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,906 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime729
NOP	
J	L_protocol_execute_runtime277
NOP	
L__protocol_execute_runtime729:
;Protocol.c,907 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,908 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,909 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,910 :: 		do {
J	L_protocol_execute_runtime278
NOP	
L__protocol_execute_runtime351:
;Protocol.c,914 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,910 :: 		do {
L_protocol_execute_runtime278:
;Protocol.c,914 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime731
NOP	
J	L__protocol_execute_runtime351
NOP	
L__protocol_execute_runtime731:
; rt_exec end address is: 12 (R3)
;Protocol.c,917 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime281
NOP	
L_protocol_execute_runtime277:
;Protocol.c,921 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,922 :: 		}
L_protocol_execute_runtime281:
;Protocol.c,923 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,924 :: 		}
J	L_protocol_execute_runtime276
NOP	
L__protocol_execute_runtime352:
;Protocol.c,902 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,924 :: 		}
L_protocol_execute_runtime276:
;Protocol.c,927 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime733
NOP	
J	L_protocol_execute_runtime282
NOP	
L__protocol_execute_runtime733:
; rt_exec end address is: 16 (R4)
;Protocol.c,928 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,929 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,930 :: 		}
L_protocol_execute_runtime282:
;Protocol.c,933 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime735
NOP	
J	L_protocol_execute_runtime283
NOP	
L__protocol_execute_runtime735:
;Protocol.c,934 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,935 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,936 :: 		}
L_protocol_execute_runtime283:
;Protocol.c,939 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime737
NOP	
J	L_protocol_execute_runtime284
NOP	
L__protocol_execute_runtime737:
;Protocol.c,941 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,942 :: 		}
L_protocol_execute_runtime284:
;Protocol.c,946 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime739
NOP	
J	L_protocol_execute_runtime285
NOP	
L__protocol_execute_runtime739:
;Protocol.c,948 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,949 :: 		}
L_protocol_execute_runtime285:
;Protocol.c,951 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime741
NOP	
J	L_protocol_execute_runtime286
NOP	
L__protocol_execute_runtime741:
;Protocol.c,953 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime743
NOP	
J	L_protocol_execute_runtime287
NOP	
L__protocol_execute_runtime743:
;Protocol.c,954 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,955 :: 		}
L_protocol_execute_runtime287:
;Protocol.c,956 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,957 :: 		}
L_protocol_execute_runtime286:
;Protocol.c,958 :: 		}
L_protocol_execute_runtime275:
;Protocol.c,962 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,966 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,970 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check746
NOP	
J	L_protocol_system_check288
NOP	
L__protocol_system_check746:
;Protocol.c,983 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,986 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,987 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,988 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check748
NOP	
J	L_protocol_system_check289
NOP	
L__protocol_system_check748:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check289:
;Protocol.c,998 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check749
NOP	
J	L__protocol_system_check355
NOP	
L__protocol_system_check749:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check751
NOP	
J	L__protocol_system_check354
NOP	
L__protocol_system_check751:
L__protocol_system_check353:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check355:
L__protocol_system_check354:
;Protocol.c,1002 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check752
NOP	
J	L_protocol_system_check293
NOP	
L__protocol_system_check752:
;Protocol.c,1003 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1004 :: 		} else {
J	L_protocol_system_check294
NOP	
L_protocol_system_check293:
;Protocol.c,1006 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1008 :: 		}
L_protocol_system_check294:
;Protocol.c,1009 :: 		}
L_protocol_system_check288:
;Protocol.c,1010 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
