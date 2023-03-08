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
BNE	R2, R0, L__Str_Initialize354
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize354:
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
BNE	R2, R0, L__Sample_Ringbuffer358
NOP	
J	L__Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer358:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer359
NOP	
J	L__Sample_Ringbuffer317
NOP	
L__Sample_Ringbuffer359:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer316:
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
L__Sample_Ringbuffer318:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer317:
;Protocol.c,72 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer360:
; dif end address is: 20 (R5)
;Protocol.c,74 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer362:
;Protocol.c,75 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,76 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer363:
;Protocol.c,81 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,82 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer364:
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
BEQ	R2, R0, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer365:
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
BEQ	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer366:
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
BEQ	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer367:
;Protocol.c,139 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,140 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer368:
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
BEQ	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer369:
;Protocol.c,145 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer370:
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
BEQ	R2, R0, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer371:
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
BEQ	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer372:
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
BNE	R2, R0, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer374:
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
BEQ	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer375:
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
BNE	R2, R0, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer377:
;Protocol.c,207 :: 		int axis_to_home = 0;
;Protocol.c,210 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer379
NOP	
J	L__Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer379:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer381
NOP	
J	L__Sample_Ringbuffer319
NOP	
L__Sample_Ringbuffer381:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer320:
L__Sample_Ringbuffer319:
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
BNE	R2, R0, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer382:
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
BNE	R2, R0, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer384:
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
;Protocol.c,235 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;Protocol.c,236 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,238 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer42:
;Protocol.c,239 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,240 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer385:
;Protocol.c,241 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer386:
;Protocol.c,242 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer388:
;Protocol.c,244 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,245 :: 		} else {
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,246 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,247 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,248 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,241 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,253 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,254 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,255 :: 		}else { // Store startup line
L_Sample_Ringbuffer43:
;Protocol.c,256 :: 		int N_Val = 0;
;Protocol.c,257 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,262 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer389
NOP	
J	L__Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer389:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer390
NOP	
J	L__Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer390:
L__Sample_Ringbuffer314:
;Protocol.c,263 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,265 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,266 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,273 :: 		}else {
J	L_Sample_Ringbuffer53
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,262 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer322:
L__Sample_Ringbuffer321:
;Protocol.c,274 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,275 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,276 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,279 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer392:
; helper_var end address is: 28 (R7)
;Protocol.c,280 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer394:
; N_Val end address is: 16 (R4)
;Protocol.c,283 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,284 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,292 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,297 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,298 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,306 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,307 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,309 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,311 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,312 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,313 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer57:
;Protocol.c,314 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,315 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,316 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,317 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer58:
;Protocol.c,318 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,319 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,321 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer59:
;Protocol.c,322 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,323 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,324 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,326 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,327 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
;Protocol.c,331 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L__Sample_Ringbuffer324
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L__Sample_Ringbuffer323
NOP	
L__Sample_Ringbuffer398:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer324:
L__Sample_Ringbuffer323:
;Protocol.c,332 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,333 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,334 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,335 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer399:
;Protocol.c,337 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,338 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer401
NOP	
J	L__Sample_Ringbuffer341
NOP	
L__Sample_Ringbuffer401:
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
L__Sample_Ringbuffer341:
L_Sample_Ringbuffer74:
;Protocol.c,339 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,340 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L__Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer402:
;Protocol.c,342 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,343 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer404
NOP	
J	L__Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer404:
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
L__Sample_Ringbuffer342:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,344 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,345 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,346 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer343:
;Protocol.c,340 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,346 :: 		}
L_Sample_Ringbuffer76:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer75:
;Protocol.c,349 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer405
NOP	
J	L__Sample_Ringbuffer326
NOP	
L__Sample_Ringbuffer405:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer407
NOP	
J	L__Sample_Ringbuffer325
NOP	
L__Sample_Ringbuffer407:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer326:
L__Sample_Ringbuffer325:
;Protocol.c,350 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,351 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,352 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,357 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,360 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,361 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,362 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,363 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer409:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer411:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer413:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer415:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer417:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer419:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer421:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer423:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer425:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer427:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer429:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer431:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer435:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer437:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer445:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer447:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer449:
L_Sample_Ringbuffer19:
;Protocol.c,365 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer450
NOP	
J	L__Sample_Ringbuffer340
NOP	
L__Sample_Ringbuffer450:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer451
NOP	
J	L__Sample_Ringbuffer339
NOP	
L__Sample_Ringbuffer451:
L__Sample_Ringbuffer311:
;Protocol.c,366 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,367 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,369 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer452:
;Protocol.c,370 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,371 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer453
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer453:
;Protocol.c,372 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,375 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L__Sample_Ringbuffer329
NOP	
L__Sample_Ringbuffer455:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer457
NOP	
J	L__Sample_Ringbuffer328
NOP	
L__Sample_Ringbuffer457:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer459
NOP	
J	L__Sample_Ringbuffer327
NOP	
L__Sample_Ringbuffer459:
SEH	R2, R4
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer329:
L__Sample_Ringbuffer328:
L__Sample_Ringbuffer327:
;Protocol.c,376 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer93:
;Protocol.c,377 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,379 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,380 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,382 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,392 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer461:
;Protocol.c,397 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,398 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,399 :: 		case 'G':case 'g':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,400 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer462:
;Protocol.c,401 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,404 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L__Sample_Ringbuffer332
NOP	
L__Sample_Ringbuffer464:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L__Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer466:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L__Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer468:
SEH	R2, R4
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer332:
L__Sample_Ringbuffer331:
L__Sample_Ringbuffer330:
;Protocol.c,405 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer103:
;Protocol.c,406 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer104
NOP	
L_Sample_Ringbuffer100:
;Protocol.c,408 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,409 :: 		}
L_Sample_Ringbuffer104:
;Protocol.c,411 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,415 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,416 :: 		case 'X':case 'x':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,417 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,418 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,419 :: 		case 'A':case 'a':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,420 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,421 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,425 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,426 :: 		case 'L':case 'l':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,427 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,428 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,432 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,433 :: 		case 'F':case 'f':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,434 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,435 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,439 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,440 :: 		case 'P':case 'p':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,441 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,442 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,446 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,447 :: 		case 'S':case 's':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,448 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,449 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,453 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,454 :: 		}
L_Sample_Ringbuffer96:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer470:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer472:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer478:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer480:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer482:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer484:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer486:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer488:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer490:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer492:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer494:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer496
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer496:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer498
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer498:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer500
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer500:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer502
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer502:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer504:
L_Sample_Ringbuffer97:
;Protocol.c,455 :: 		}
L_Sample_Ringbuffer95:
;Protocol.c,460 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer506:
;Protocol.c,461 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,462 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer122
NOP	
;Protocol.c,463 :: 		case 'G':case 'g':
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
;Protocol.c,464 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer507:
;Protocol.c,465 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,468 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L__Sample_Ringbuffer335
NOP	
L__Sample_Ringbuffer509:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L__Sample_Ringbuffer334
NOP	
L__Sample_Ringbuffer511:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L__Sample_Ringbuffer333
NOP	
L__Sample_Ringbuffer513:
SEH	R2, R4
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer335:
L__Sample_Ringbuffer334:
L__Sample_Ringbuffer333:
;Protocol.c,469 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer129:
;Protocol.c,470 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer130
NOP	
L_Sample_Ringbuffer126:
;Protocol.c,472 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,473 :: 		}
L_Sample_Ringbuffer130:
;Protocol.c,475 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,479 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,480 :: 		case 'X':case 'x':
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,481 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer133:
L_Sample_Ringbuffer134:
;Protocol.c,482 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
;Protocol.c,483 :: 		case 'A':case 'a':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,485 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,486 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,490 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,491 :: 		case 'L':case 'l':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,492 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,493 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,497 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,498 :: 		case 'F':case 'f':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,499 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,500 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,504 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,505 :: 		case 'P':case 'p':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,506 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,507 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,511 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,512 :: 		case 'S':case 's':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,513 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,514 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,518 :: 		break;
J	L_Sample_Ringbuffer123
NOP	
;Protocol.c,519 :: 		}
L_Sample_Ringbuffer122:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer517:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer519:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer521:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer523:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer525:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer527:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer529:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer531:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer533:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer535:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer537
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer537:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer539
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer539:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer541:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer543:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer545:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer547:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer549:
L_Sample_Ringbuffer123:
;Protocol.c,520 :: 		}
L_Sample_Ringbuffer121:
;Protocol.c,524 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer551:
;Protocol.c,525 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,526 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,527 :: 		case 'G':case 'g':
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
;Protocol.c,528 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer552
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer552:
;Protocol.c,529 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,532 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer554
NOP	
J	L__Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer554:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer556
NOP	
J	L__Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer556:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer558
NOP	
J	L__Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer558:
SEH	R2, R4
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer338:
L__Sample_Ringbuffer337:
L__Sample_Ringbuffer336:
;Protocol.c,533 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer155:
;Protocol.c,534 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer156
NOP	
L_Sample_Ringbuffer152:
;Protocol.c,536 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,537 :: 		}
L_Sample_Ringbuffer156:
;Protocol.c,539 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,543 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,544 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
;Protocol.c,545 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
L_Sample_Ringbuffer164:
;Protocol.c,546 :: 		case 'I':case 'i':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,548 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,549 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,553 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,554 :: 		case 'F': case 'f':
L_Sample_Ringbuffer167:
L_Sample_Ringbuffer168:
;Protocol.c,555 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,556 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,560 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,561 :: 		}
L_Sample_Ringbuffer148:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer560
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer560:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer562
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer562:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer564
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer564:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer566
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer566:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer568
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer568:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer570:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer572
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer572:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer574
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer574:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer576
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer576:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer578
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer578:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer580
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer580:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer582
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer582:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer584
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer584:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer586
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer586:
L_Sample_Ringbuffer149:
;Protocol.c,562 :: 		}
L_Sample_Ringbuffer147:
;Protocol.c,567 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer588:
;Protocol.c,568 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,569 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,570 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,571 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,572 :: 		case 'J':case 'j':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,573 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,574 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,578 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,579 :: 		case 'F':case 'f':
L_Sample_Ringbuffer178:
L_Sample_Ringbuffer179:
;Protocol.c,580 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,581 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,585 :: 		break;
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,587 :: 		}
L_Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer590:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer592
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer592:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer594
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer594:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer596
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer596:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer598
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer598:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer600
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer600:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer602
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer602:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer604
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer604:
L_Sample_Ringbuffer171:
;Protocol.c,588 :: 		}
L_Sample_Ringbuffer169:
;Protocol.c,592 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer606
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer606:
;Protocol.c,593 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,594 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,595 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer181
NOP	
;Protocol.c,596 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
;Protocol.c,597 :: 		case 'J':case 'j':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
;Protocol.c,598 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,599 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,603 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,604 :: 		case 'F':case 'f':
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
;Protocol.c,605 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,606 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,610 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,611 :: 		}
L_Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer608
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer608:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer610
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer610:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer612
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer612:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer614
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer614:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer616
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer616:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer618
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer618:
L_Sample_Ringbuffer182:
;Protocol.c,612 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,615 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer620
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer620:
;Protocol.c,616 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,617 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer190
NOP	
;Protocol.c,618 :: 		case 'J':case 'j':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,619 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,620 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,624 :: 		break;
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,625 :: 		case 'F':case 'f':
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,626 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,627 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,631 :: 		break;
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,633 :: 		}
L_Sample_Ringbuffer190:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer622
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer622:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer624
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer624:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer626
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer626:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer628
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer628:
L_Sample_Ringbuffer191:
;Protocol.c,634 :: 		}
L_Sample_Ringbuffer189:
;Protocol.c,635 :: 		}else {
J	L_Sample_Ringbuffer196
NOP	
L_Sample_Ringbuffer89:
;Protocol.c,636 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,637 :: 		}
L_Sample_Ringbuffer196:
;Protocol.c,638 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,639 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,640 :: 		case 'M':
L_Sample_Ringbuffer197:
;Protocol.c,641 :: 		case 'm':
L_Sample_Ringbuffer198:
;Protocol.c,643 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,644 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,645 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,651 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer630
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer630:
;Protocol.c,652 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer200
NOP	
;Protocol.c,653 :: 		case 'S':
L_Sample_Ringbuffer202:
;Protocol.c,654 :: 		case 's':
L_Sample_Ringbuffer203:
;Protocol.c,656 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,657 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,658 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,662 :: 		break;
J	L_Sample_Ringbuffer201
NOP	
;Protocol.c,663 :: 		}
L_Sample_Ringbuffer200:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer632
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer632:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer634
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer634:
L_Sample_Ringbuffer201:
;Protocol.c,664 :: 		}
L_Sample_Ringbuffer199:
;Protocol.c,665 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,666 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,667 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer204:
L_Sample_Ringbuffer205:
L_Sample_Ringbuffer206:
L_Sample_Ringbuffer207:
;Protocol.c,668 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
L_Sample_Ringbuffer210:
L_Sample_Ringbuffer211:
;Protocol.c,669 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer635
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer635:
;Protocol.c,670 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,671 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,672 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,676 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,680 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer637
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer637:
;Protocol.c,681 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,682 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,683 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,684 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer216:
L_Sample_Ringbuffer217:
;Protocol.c,685 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer218:
L_Sample_Ringbuffer219:
;Protocol.c,686 :: 		case 'A':case 'a':
L_Sample_Ringbuffer220:
L_Sample_Ringbuffer221:
;Protocol.c,687 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,688 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,692 :: 		break;
J	L_Sample_Ringbuffer215
NOP	
;Protocol.c,693 :: 		case 'F':
L_Sample_Ringbuffer222:
;Protocol.c,694 :: 		case 'f':
L_Sample_Ringbuffer223:
;Protocol.c,697 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,698 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,703 :: 		break;
J	L_Sample_Ringbuffer215
NOP	
;Protocol.c,704 :: 		}
L_Sample_Ringbuffer214:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer639
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer639:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer641
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer641:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer643:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer645:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer647:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer649:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer651:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer653:
L_Sample_Ringbuffer215:
;Protocol.c,705 :: 		}
L_Sample_Ringbuffer213:
;Protocol.c,706 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,707 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,708 :: 		case 'F':
L_Sample_Ringbuffer224:
;Protocol.c,710 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer654:
;Protocol.c,711 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,712 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,713 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,717 :: 		}
L_Sample_Ringbuffer225:
;Protocol.c,718 :: 		query = STATUS_COMMAND_EXECUTE_MOTION;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,719 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,720 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer656:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer658
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer658:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer660:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer662
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer662:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer664:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer666:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer668:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer670:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer672:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer674:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer676:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer678:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer680
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer680:
L_Sample_Ringbuffer86:
;Protocol.c,365 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer340:
L__Sample_Ringbuffer339:
;Protocol.c,721 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,722 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,723 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer681:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer227
NOP	
L_Sample_Ringbuffer226:
;Protocol.c,724 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer682:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer229
NOP	
L_Sample_Ringbuffer228:
;Protocol.c,725 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer683
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer683:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer231
NOP	
L_Sample_Ringbuffer230:
;Protocol.c,726 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer684:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer233
NOP	
L_Sample_Ringbuffer232:
;Protocol.c,727 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer685
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer685:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer235
NOP	
L_Sample_Ringbuffer234:
;Protocol.c,728 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer686:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer237
NOP	
L_Sample_Ringbuffer236:
;Protocol.c,729 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer687
NOP	
J	L_Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer687:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer239
NOP	
L_Sample_Ringbuffer238:
;Protocol.c,730 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer688:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer241
NOP	
L_Sample_Ringbuffer240:
;Protocol.c,731 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer689
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer689:
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer242:
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer239:
L_Sample_Ringbuffer237:
L_Sample_Ringbuffer235:
L_Sample_Ringbuffer233:
L_Sample_Ringbuffer231:
L_Sample_Ringbuffer229:
L_Sample_Ringbuffer227:
;Protocol.c,734 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,735 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,738 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,739 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 28(SP)
;Protocol.c,741 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,743 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,744 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,745 :: 		}
;Protocol.c,744 :: 		return status;
;Protocol.c,745 :: 		}
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
;Protocol.c,751 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,753 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,754 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,755 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,756 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit243:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit691
NOP	
J	L_Protocol_strsplit244
NOP	
L_Protocol_strsplit691:
;Protocol.c,757 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,758 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit693
NOP	
J	L_Protocol_strsplit347
NOP	
L_Protocol_strsplit693:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit695
NOP	
J	L_Protocol_strsplit346
NOP	
L_Protocol_strsplit695:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit696
NOP	
J	L_Protocol_strsplit345
NOP	
L_Protocol_strsplit696:
J	L_Protocol_strsplit248
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit347:
L_Protocol_strsplit346:
L_Protocol_strsplit345:
;Protocol.c,759 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,760 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,761 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,762 :: 		continue;
J	L_Protocol_strsplit245
NOP	
;Protocol.c,763 :: 		}else{
L_Protocol_strsplit248:
;Protocol.c,764 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,766 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit697
NOP	
J	L_Protocol_strsplit250
NOP	
L_Protocol_strsplit697:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,767 :: 		break;
J	L_Protocol_strsplit244
NOP	
L_Protocol_strsplit250:
;Protocol.c,768 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit245:
;Protocol.c,756 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,768 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit243
NOP	
L_Protocol_strsplit244:
;Protocol.c,769 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,770 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,771 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,776 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,778 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,779 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,780 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,781 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2251:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2699
NOP	
J	L_Protocol_strsplit2306
NOP	
L_Protocol_strsplit2699:
;Protocol.c,782 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,783 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2701
NOP	
J	L_Protocol_strsplit2297
NOP	
L_Protocol_strsplit2701:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2703
NOP	
J	L_Protocol_strsplit2296
NOP	
L_Protocol_strsplit2703:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2704
NOP	
J	L_Protocol_strsplit2295
NOP	
L_Protocol_strsplit2704:
J	L_Protocol_strsplit2256
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2297:
L_Protocol_strsplit2296:
L_Protocol_strsplit2295:
;Protocol.c,784 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,785 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,786 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,787 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,788 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2253
NOP	
;Protocol.c,789 :: 		}else{
L_Protocol_strsplit2256:
;Protocol.c,790 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2705
NOP	
J	L_Protocol_strsplit2304
NOP	
L_Protocol_strsplit2705:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2707
NOP	
J	L_Protocol_strsplit2305
NOP	
L_Protocol_strsplit2707:
L_Protocol_strsplit2293:
;Protocol.c,791 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2708
NOP	
J	L_Protocol_strsplit2302
NOP	
L_Protocol_strsplit2708:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2709
NOP	
J	L_Protocol_strsplit2303
NOP	
L_Protocol_strsplit2709:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2292:
;Protocol.c,792 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,793 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,794 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,791 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2299
NOP	
L_Protocol_strsplit2302:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2299:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2298
NOP	
L_Protocol_strsplit2303:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2298:
;Protocol.c,790 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2301
NOP	
L_Protocol_strsplit2304:
L_Protocol_strsplit2301:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2300
NOP	
L_Protocol_strsplit2305:
L_Protocol_strsplit2300:
;Protocol.c,797 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,799 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2710
NOP	
J	L_Protocol_strsplit2264
NOP	
L_Protocol_strsplit2710:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,800 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2252
NOP	
L_Protocol_strsplit2264:
;Protocol.c,801 :: 		}
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
L_Protocol_strsplit2253:
;Protocol.c,781 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,801 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2251
NOP	
L_Protocol_strsplit2306:
;Protocol.c,781 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,801 :: 		}
L_Protocol_strsplit2252:
;Protocol.c,802 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,803 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,804 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,808 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,811 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,812 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,814 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,815 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str265:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str713
NOP	
J	L_Protocol_cpy_val_from_str266
NOP	
L_Protocol_cpy_val_from_str713:
;Protocol.c,816 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,817 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,818 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str265
NOP	
L_Protocol_cpy_val_from_str266:
;Protocol.c,819 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,821 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,822 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,827 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,829 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,831 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,833 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int267:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int715
NOP	
J	L_Protocol_str2int268
NOP	
L_Protocol_str2int715:
;Protocol.c,834 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,835 :: 		while(DMA_IsOn(1));
L_Protocol_str2int270:
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
BNE	R2, R0, L_Protocol_str2int717
NOP	
J	L_Protocol_str2int271
NOP	
L_Protocol_str2int717:
J	L_Protocol_str2int270
NOP	
L_Protocol_str2int271:
;Protocol.c,833 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,836 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int267
NOP	
L_Protocol_str2int268:
;Protocol.c,838 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,839 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,896 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,897 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+26)(GP)
BNE	R2, R0, L__protocol_execute_runtime720
NOP	
J	L_protocol_execute_runtime272
NOP	
L__protocol_execute_runtime720:
;Protocol.c,898 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+26)(GP)
;Protocol.c,903 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime722
NOP	
J	L__protocol_execute_runtime349
NOP	
L__protocol_execute_runtime722:
;Protocol.c,904 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,907 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime724
NOP	
J	L_protocol_execute_runtime274
NOP	
L__protocol_execute_runtime724:
;Protocol.c,908 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,909 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,910 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,911 :: 		do {
J	L_protocol_execute_runtime275
NOP	
L__protocol_execute_runtime348:
;Protocol.c,915 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,911 :: 		do {
L_protocol_execute_runtime275:
;Protocol.c,915 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime726
NOP	
J	L__protocol_execute_runtime348
NOP	
L__protocol_execute_runtime726:
; rt_exec end address is: 12 (R3)
;Protocol.c,918 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime278
NOP	
L_protocol_execute_runtime274:
;Protocol.c,922 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,923 :: 		}
L_protocol_execute_runtime278:
;Protocol.c,924 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,925 :: 		}
J	L_protocol_execute_runtime273
NOP	
L__protocol_execute_runtime349:
;Protocol.c,903 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,925 :: 		}
L_protocol_execute_runtime273:
;Protocol.c,928 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime728
NOP	
J	L_protocol_execute_runtime279
NOP	
L__protocol_execute_runtime728:
; rt_exec end address is: 16 (R4)
;Protocol.c,929 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,930 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,931 :: 		}
L_protocol_execute_runtime279:
;Protocol.c,934 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime730
NOP	
J	L_protocol_execute_runtime280
NOP	
L__protocol_execute_runtime730:
;Protocol.c,935 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,936 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,937 :: 		}
L_protocol_execute_runtime280:
;Protocol.c,940 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime732
NOP	
J	L_protocol_execute_runtime281
NOP	
L__protocol_execute_runtime732:
;Protocol.c,942 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,943 :: 		}
L_protocol_execute_runtime281:
;Protocol.c,947 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime734
NOP	
J	L_protocol_execute_runtime282
NOP	
L__protocol_execute_runtime734:
;Protocol.c,949 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,950 :: 		}
L_protocol_execute_runtime282:
;Protocol.c,952 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime736
NOP	
J	L_protocol_execute_runtime283
NOP	
L__protocol_execute_runtime736:
;Protocol.c,954 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime738
NOP	
J	L_protocol_execute_runtime284
NOP	
L__protocol_execute_runtime738:
;Protocol.c,955 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,956 :: 		}
L_protocol_execute_runtime284:
;Protocol.c,957 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,958 :: 		}
L_protocol_execute_runtime283:
;Protocol.c,959 :: 		}
L_protocol_execute_runtime272:
;Protocol.c,963 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,967 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,971 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check741
NOP	
J	L_protocol_system_check285
NOP	
L__protocol_system_check741:
;Protocol.c,984 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,987 :: 		sys.abort = false;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,988 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,989 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check743
NOP	
J	L_protocol_system_check286
NOP	
L__protocol_system_check743:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check286:
;Protocol.c,999 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check744
NOP	
J	L__protocol_system_check352
NOP	
L__protocol_system_check744:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check746
NOP	
J	L__protocol_system_check351
NOP	
L__protocol_system_check746:
L__protocol_system_check350:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check352:
L__protocol_system_check351:
;Protocol.c,1003 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check747
NOP	
J	L_protocol_system_check290
NOP	
L__protocol_system_check747:
;Protocol.c,1004 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1005 :: 		} else {
J	L_protocol_system_check291
NOP	
L_protocol_system_check290:
;Protocol.c,1007 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1009 :: 		}
L_protocol_system_check291:
;Protocol.c,1010 :: 		}
L_protocol_system_check285:
;Protocol.c,1011 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
