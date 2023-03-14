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
BNE	R2, R0, L__Str_Initialize379
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize379:
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
ADDIU	SP, SP, -128
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
BNE	R2, R0, L__Sample_Ringbuffer383
NOP	
J	L__Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer383:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer384
NOP	
J	L__Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer384:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer341:
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
L__Sample_Ringbuffer343:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer342:
;Protocol.c,76 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer385:
; dif end address is: 20 (R5)
;Protocol.c,78 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer387:
;Protocol.c,79 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,80 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer388:
;Protocol.c,85 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,86 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer389:
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
BEQ	R2, R0, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer390:
;Protocol.c,93 :: 		int modal_response = 0;
;Protocol.c,94 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,96 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,97 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,98 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,103 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
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
BEQ	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer391:
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
BEQ	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer392:
;Protocol.c,150 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,151 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer393:
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
BEQ	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer394:
;Protocol.c,156 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer395:
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
BEQ	R2, R0, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer396:
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
BEQ	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer397:
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
BNE	R2, R0, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer399:
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
BEQ	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer400:
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
BNE	R2, R0, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer402:
;Protocol.c,218 :: 		int axis_to_home = 0;
;Protocol.c,221 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer404
NOP	
J	L__Sample_Ringbuffer345
NOP	
L__Sample_Ringbuffer404:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L__Sample_Ringbuffer344
NOP	
L__Sample_Ringbuffer406:
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer345:
L__Sample_Ringbuffer344:
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
BNE	R2, R0, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer407:
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
BNE	R2, R0, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer409:
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
BNE	R2, R0, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer410:
;Protocol.c,251 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer44:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer411:
;Protocol.c,252 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer413:
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
BEQ	R2, R0, L__Sample_Ringbuffer414
NOP	
J	L__Sample_Ringbuffer347
NOP	
L__Sample_Ringbuffer414:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer415
NOP	
J	L__Sample_Ringbuffer346
NOP	
L__Sample_Ringbuffer415:
L__Sample_Ringbuffer339:
;Protocol.c,273 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,275 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
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
L__Sample_Ringbuffer347:
L__Sample_Ringbuffer346:
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
BNE	R7, R0, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer417:
; helper_var end address is: 28 (R7)
;Protocol.c,290 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer419:
; N_Val end address is: 16 (R4)
;Protocol.c,293 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,294 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,302 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
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
ADDIU	R2, SP, 34
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
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L__Sample_Ringbuffer349
NOP	
L__Sample_Ringbuffer421:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L__Sample_Ringbuffer348
NOP	
L__Sample_Ringbuffer423:
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer349:
L__Sample_Ringbuffer348:
;Protocol.c,341 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
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
BEQ	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer424:
;Protocol.c,346 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,347 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer426
NOP	
J	L__Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer426:
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
L__Sample_Ringbuffer366:
L_Sample_Ringbuffer74:
;Protocol.c,348 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,349 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer75
NOP	
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L__Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,351 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,352 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer429
NOP	
J	L__Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer429:
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
L__Sample_Ringbuffer367:
SEH	R5, R6
L_Sample_Ringbuffer77:
;Protocol.c,353 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
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
;Protocol.c,355 :: 		}
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer368:
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
BC1F	0, L__Sample_Ringbuffer430
NOP	
J	L__Sample_Ringbuffer351
NOP	
L__Sample_Ringbuffer430:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer432
NOP	
J	L__Sample_Ringbuffer350
NOP	
L__Sample_Ringbuffer432:
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer351:
L__Sample_Ringbuffer350:
;Protocol.c,359 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,360 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,361 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
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
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer462:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer466:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer468:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer470:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer472:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer474:
L_Sample_Ringbuffer19:
;Protocol.c,374 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer475
NOP	
J	L__Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer475:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer476
NOP	
J	L__Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer476:
L__Sample_Ringbuffer336:
;Protocol.c,375 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,376 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,377 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,383 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer477:
;Protocol.c,384 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,385 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer478:
;Protocol.c,386 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,389 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L__Sample_Ringbuffer354
NOP	
L__Sample_Ringbuffer480:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L__Sample_Ringbuffer353
NOP	
L__Sample_Ringbuffer482:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L__Sample_Ringbuffer352
NOP	
L__Sample_Ringbuffer484:
SEH	R2, R4
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer354:
L__Sample_Ringbuffer353:
L__Sample_Ringbuffer352:
;Protocol.c,390 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer93:
;Protocol.c,391 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,393 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,394 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,396 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,398 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer485:
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
;Protocol.c,408 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer487:
;Protocol.c,414 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,416 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,417 :: 		case 'G':case 'g':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,418 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer488:
;Protocol.c,419 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,422 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L__Sample_Ringbuffer357
NOP	
L__Sample_Ringbuffer490:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L__Sample_Ringbuffer356
NOP	
L__Sample_Ringbuffer492:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L__Sample_Ringbuffer355
NOP	
L__Sample_Ringbuffer494:
SEH	R2, R4
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer357:
L__Sample_Ringbuffer356:
L__Sample_Ringbuffer355:
;Protocol.c,423 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer105:
;Protocol.c,424 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer106
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,426 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,427 :: 		}
L_Sample_Ringbuffer106:
;Protocol.c,429 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,431 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer495:
; ?FLOC___Sample_Ringbuffer?T224 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T224 end address is: 12 (R3)
J	L_Sample_Ringbuffer108
NOP	
L_Sample_Ringbuffer107:
; ?FLOC___Sample_Ringbuffer?T224 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T224 end address is: 12 (R3)
L_Sample_Ringbuffer108:
; ?FLOC___Sample_Ringbuffer?T224 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T224 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,437 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,438 :: 		case 'X':case 'x':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,439 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,440 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,441 :: 		case 'A':case 'a':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,442 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,443 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,447 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,448 :: 		case 'L':case 'l':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,449 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,450 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,454 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,455 :: 		case 'F':case 'f':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,456 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,457 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,461 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,462 :: 		case 'P':case 'p':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,463 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,464 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,468 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,469 :: 		case 'S':case 's':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,470 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,471 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,475 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,476 :: 		}
L_Sample_Ringbuffer98:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer499:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer519:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer521:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer523:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer525:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer527:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer529:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer531:
L_Sample_Ringbuffer99:
;Protocol.c,477 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,482 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer533:
;Protocol.c,487 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,488 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,489 :: 		case 'G':case 'g':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,490 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer534:
;Protocol.c,491 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,494 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L__Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer536:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L__Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer538:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L__Sample_Ringbuffer358
NOP	
L__Sample_Ringbuffer540:
SEH	R2, R4
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer360:
L__Sample_Ringbuffer359:
L__Sample_Ringbuffer358:
;Protocol.c,495 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer133:
;Protocol.c,496 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer134
NOP	
L_Sample_Ringbuffer130:
;Protocol.c,498 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,499 :: 		}
L_Sample_Ringbuffer134:
;Protocol.c,501 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,503 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer541:
; ?FLOC___Sample_Ringbuffer?T285 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T285 end address is: 12 (R3)
J	L_Sample_Ringbuffer136
NOP	
L_Sample_Ringbuffer135:
; ?FLOC___Sample_Ringbuffer?T285 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T285 end address is: 12 (R3)
L_Sample_Ringbuffer136:
; ?FLOC___Sample_Ringbuffer?T285 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T285 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,507 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,508 :: 		case 'X':case 'x':
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,509 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
;Protocol.c,510 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,511 :: 		case 'A':case 'a':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
;Protocol.c,512 :: 		case 'I':case 'i':
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,513 :: 		case 'J':case 'j':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,515 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,516 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,520 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,521 :: 		case 'L':case 'l':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,522 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,523 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,527 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,528 :: 		case 'F':case 'f':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,529 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,530 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,534 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,535 :: 		case 'P':case 'p':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,536 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,537 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,541 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,542 :: 		case 'S':case 's':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,543 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,544 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,548 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,549 :: 		}
L_Sample_Ringbuffer126:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer543:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer545:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer547:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer549:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer551:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer553:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer555:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer557:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer559:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer561
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer561:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer563
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer563:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer565:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer567
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer567:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer569
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer569:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer571
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer571:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer573
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer573:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer575:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer577:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer579
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer579:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer581
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer581:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer583
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer583:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer585
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer585:
L_Sample_Ringbuffer127:
;Protocol.c,550 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,554 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer587
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer587:
;Protocol.c,555 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,556 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer158
NOP	
;Protocol.c,557 :: 		case 'G':case 'g':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
;Protocol.c,558 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer588:
;Protocol.c,559 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,562 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L__Sample_Ringbuffer363
NOP	
L__Sample_Ringbuffer590:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer592
NOP	
J	L__Sample_Ringbuffer362
NOP	
L__Sample_Ringbuffer592:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer594
NOP	
J	L__Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer594:
SEH	R2, R4
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer363:
L__Sample_Ringbuffer362:
L__Sample_Ringbuffer361:
;Protocol.c,563 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer165:
;Protocol.c,564 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer166
NOP	
L_Sample_Ringbuffer162:
;Protocol.c,566 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,567 :: 		}
L_Sample_Ringbuffer166:
;Protocol.c,569 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,571 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer595
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer595:
; ?FLOC___Sample_Ringbuffer?T351 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T351 end address is: 12 (R3)
J	L_Sample_Ringbuffer168
NOP	
L_Sample_Ringbuffer167:
; ?FLOC___Sample_Ringbuffer?T351 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T351 end address is: 12 (R3)
L_Sample_Ringbuffer168:
; ?FLOC___Sample_Ringbuffer?T351 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T351 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,575 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,576 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,577 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,578 :: 		case 'I':case 'i':
L_Sample_Ringbuffer177:
L_Sample_Ringbuffer178:
;Protocol.c,584 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,585 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,589 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,590 :: 		case 'F': case 'f':
L_Sample_Ringbuffer179:
L_Sample_Ringbuffer180:
;Protocol.c,591 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,592 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,596 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,597 :: 		}
L_Sample_Ringbuffer158:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer597
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer597:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer599
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer599:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer601
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer601:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer603
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer603:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer605
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer605:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer607
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer607:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer609
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer609:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer611
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer611:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer613
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer613:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer615
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer615:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer617
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer617:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer619
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer619:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer621
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer621:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer623
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer623:
L_Sample_Ringbuffer159:
;Protocol.c,598 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,603 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer625
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer625:
;Protocol.c,608 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,609 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,610 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
;Protocol.c,611 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
;Protocol.c,612 :: 		case 'J':case 'j':
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
;Protocol.c,613 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,614 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,618 :: 		break;
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,619 :: 		case 'F':case 'f':
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
;Protocol.c,620 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,621 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,625 :: 		break;
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,627 :: 		}
L_Sample_Ringbuffer182:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer627
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer627:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer629
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer629:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer631
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer631:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer633
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer633:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer635
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer635:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer637
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer637:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer639
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer639:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer641
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer641:
L_Sample_Ringbuffer183:
;Protocol.c,628 :: 		}
L_Sample_Ringbuffer181:
;Protocol.c,632 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer643:
;Protocol.c,637 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,638 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,639 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer193
NOP	
;Protocol.c,640 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,641 :: 		case 'J':case 'j':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,642 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,643 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,647 :: 		break;
J	L_Sample_Ringbuffer194
NOP	
;Protocol.c,648 :: 		case 'F':case 'f':
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
;Protocol.c,649 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,650 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,654 :: 		break;
J	L_Sample_Ringbuffer194
NOP	
;Protocol.c,655 :: 		}
L_Sample_Ringbuffer193:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer645:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer647:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer649:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer651:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer653:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer655
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer655:
L_Sample_Ringbuffer194:
;Protocol.c,656 :: 		}
L_Sample_Ringbuffer192:
;Protocol.c,659 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer657:
;Protocol.c,660 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,661 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer202
NOP	
;Protocol.c,662 :: 		case 'J':case 'j':
L_Sample_Ringbuffer204:
L_Sample_Ringbuffer205:
;Protocol.c,663 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,664 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,668 :: 		break;
J	L_Sample_Ringbuffer203
NOP	
;Protocol.c,669 :: 		case 'F':case 'f':
L_Sample_Ringbuffer206:
L_Sample_Ringbuffer207:
;Protocol.c,670 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,671 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,675 :: 		break;
J	L_Sample_Ringbuffer203
NOP	
;Protocol.c,677 :: 		}
L_Sample_Ringbuffer202:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer659
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer659:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer661
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer661:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer663
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer663:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer665:
L_Sample_Ringbuffer203:
;Protocol.c,678 :: 		}
L_Sample_Ringbuffer201:
;Protocol.c,679 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,680 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer666:
; ?FLOC___Sample_Ringbuffer?T454 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T454 end address is: 8 (R2)
J	L_Sample_Ringbuffer209
NOP	
L_Sample_Ringbuffer208:
; ?FLOC___Sample_Ringbuffer?T454 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T454 end address is: 8 (R2)
L_Sample_Ringbuffer209:
; ?FLOC___Sample_Ringbuffer?T454 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T454 end address is: 8 (R2)
;Protocol.c,681 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,682 :: 		case 'M':
L_Sample_Ringbuffer210:
;Protocol.c,683 :: 		case 'm':
L_Sample_Ringbuffer211:
;Protocol.c,685 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,686 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,687 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,693 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer668:
;Protocol.c,694 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer213
NOP	
;Protocol.c,695 :: 		case 'S':
L_Sample_Ringbuffer215:
;Protocol.c,696 :: 		case 's':
L_Sample_Ringbuffer216:
;Protocol.c,698 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,699 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,700 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,704 :: 		}
J	L_Sample_Ringbuffer214
NOP	
L_Sample_Ringbuffer213:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer670:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer672:
L_Sample_Ringbuffer214:
;Protocol.c,705 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,706 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,707 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,708 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
;Protocol.c,709 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer221:
L_Sample_Ringbuffer222:
L_Sample_Ringbuffer223:
L_Sample_Ringbuffer224:
;Protocol.c,710 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer225:
L_Sample_Ringbuffer226:
L_Sample_Ringbuffer227:
L_Sample_Ringbuffer228:
;Protocol.c,711 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer673
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer673:
;Protocol.c,712 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,713 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,714 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,718 :: 		}
L_Sample_Ringbuffer229:
;Protocol.c,722 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer675
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer675:
;Protocol.c,723 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,724 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,725 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,726 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer233:
L_Sample_Ringbuffer234:
;Protocol.c,727 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer235:
L_Sample_Ringbuffer236:
;Protocol.c,728 :: 		case 'A':case 'a':
L_Sample_Ringbuffer237:
L_Sample_Ringbuffer238:
;Protocol.c,729 :: 		case 'I':case 'i':
L_Sample_Ringbuffer239:
L_Sample_Ringbuffer240:
;Protocol.c,730 :: 		case 'J':case 'j':
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,731 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,732 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,736 :: 		break;
J	L_Sample_Ringbuffer232
NOP	
;Protocol.c,737 :: 		case 'F':
L_Sample_Ringbuffer243:
;Protocol.c,738 :: 		case 'f':
L_Sample_Ringbuffer244:
;Protocol.c,741 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,742 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,747 :: 		break;
J	L_Sample_Ringbuffer232
NOP	
;Protocol.c,748 :: 		}
L_Sample_Ringbuffer231:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer677
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer677:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer679
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer679:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer681:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer683
NOP	
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer683:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer685
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer685:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer687
NOP	
J	L_Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer687:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer689
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer689:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer691
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer691:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer693
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer693:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer695
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer695:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer697
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer697:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer699
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer699:
L_Sample_Ringbuffer232:
;Protocol.c,749 :: 		}
L_Sample_Ringbuffer230:
;Protocol.c,750 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,751 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,752 :: 		case 'F':
L_Sample_Ringbuffer245:
;Protocol.c,754 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer700:
;Protocol.c,755 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,756 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,757 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,761 :: 		}
L_Sample_Ringbuffer246:
;Protocol.c,762 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,763 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,764 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer702
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer702:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer704
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer704:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer706
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer706:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer708
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer708:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer710
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer710:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer712
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer712:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer714
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer714:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer716
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer716:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer718
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer718:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer720
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer720:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer722
NOP	
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer722:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer724
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer724:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer726
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer726:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer728
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer728:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer730
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer730:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer732:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer734:
L_Sample_Ringbuffer86:
;Protocol.c,374 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer365:
L__Sample_Ringbuffer364:
;Protocol.c,765 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,766 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,772 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer735
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer735:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer248
NOP	
L_Sample_Ringbuffer247:
;Protocol.c,773 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer736:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer250
NOP	
L_Sample_Ringbuffer249:
;Protocol.c,774 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer737
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer737:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer252
NOP	
L_Sample_Ringbuffer251:
;Protocol.c,775 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer738
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer738:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer254
NOP	
L_Sample_Ringbuffer253:
;Protocol.c,776 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer739
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer739:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer256
NOP	
L_Sample_Ringbuffer255:
;Protocol.c,777 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer740
NOP	
J	L_Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer740:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer258
NOP	
L_Sample_Ringbuffer257:
;Protocol.c,778 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer741
NOP	
J	L_Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer741:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer260
NOP	
L_Sample_Ringbuffer259:
;Protocol.c,779 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer742
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer742:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer262
NOP	
L_Sample_Ringbuffer261:
;Protocol.c,780 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer743
NOP	
J	L_Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer743:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer263:
;Protocol.c,781 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer744
NOP	
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer744:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer265:
L_Sample_Ringbuffer262:
L_Sample_Ringbuffer260:
L_Sample_Ringbuffer258:
L_Sample_Ringbuffer256:
L_Sample_Ringbuffer254:
L_Sample_Ringbuffer252:
L_Sample_Ringbuffer250:
L_Sample_Ringbuffer248:
;Protocol.c,784 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,785 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,788 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,789 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,792 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer745
NOP	
J	L_Sample_Ringbuffer266
NOP	
L__Sample_Ringbuffer745:
; ?FLOC___Sample_Ringbuffer?T566 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T566 end address is: 8 (R2)
J	L_Sample_Ringbuffer267
NOP	
L_Sample_Ringbuffer266:
; ?FLOC___Sample_Ringbuffer?T566 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T566 end address is: 8 (R2)
L_Sample_Ringbuffer267:
; ?FLOC___Sample_Ringbuffer?T566 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T566 end address is: 8 (R2)
;Protocol.c,794 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,796 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,799 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,800 :: 		}
;Protocol.c,799 :: 		return status;
;Protocol.c,800 :: 		}
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
;Protocol.c,806 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,808 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,809 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,810 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,811 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit268:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit747
NOP	
J	L_Protocol_strsplit269
NOP	
L_Protocol_strsplit747:
;Protocol.c,812 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,813 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit749
NOP	
J	L_Protocol_strsplit372
NOP	
L_Protocol_strsplit749:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit751
NOP	
J	L_Protocol_strsplit371
NOP	
L_Protocol_strsplit751:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit752
NOP	
J	L_Protocol_strsplit370
NOP	
L_Protocol_strsplit752:
J	L_Protocol_strsplit273
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit372:
L_Protocol_strsplit371:
L_Protocol_strsplit370:
;Protocol.c,814 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,815 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,816 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,817 :: 		continue;
J	L_Protocol_strsplit270
NOP	
;Protocol.c,818 :: 		}else{
L_Protocol_strsplit273:
;Protocol.c,819 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,821 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit753
NOP	
J	L_Protocol_strsplit275
NOP	
L_Protocol_strsplit753:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,822 :: 		break;
J	L_Protocol_strsplit269
NOP	
L_Protocol_strsplit275:
;Protocol.c,823 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit270:
;Protocol.c,811 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,823 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit268
NOP	
L_Protocol_strsplit269:
;Protocol.c,824 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,825 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,826 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,831 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,833 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,834 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,835 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,836 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit2276:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2755
NOP	
J	L_Protocol_strsplit2331
NOP	
L_Protocol_strsplit2755:
;Protocol.c,837 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,838 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2757
NOP	
J	L_Protocol_strsplit2322
NOP	
L_Protocol_strsplit2757:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2759
NOP	
J	L_Protocol_strsplit2321
NOP	
L_Protocol_strsplit2759:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2760
NOP	
J	L_Protocol_strsplit2320
NOP	
L_Protocol_strsplit2760:
J	L_Protocol_strsplit2281
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2322:
L_Protocol_strsplit2321:
L_Protocol_strsplit2320:
;Protocol.c,839 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,840 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,841 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,842 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,843 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit2278
NOP	
;Protocol.c,844 :: 		}else{
L_Protocol_strsplit2281:
;Protocol.c,845 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2761
NOP	
J	L_Protocol_strsplit2329
NOP	
L_Protocol_strsplit2761:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2763
NOP	
J	L_Protocol_strsplit2330
NOP	
L_Protocol_strsplit2763:
L_Protocol_strsplit2318:
;Protocol.c,846 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2764
NOP	
J	L_Protocol_strsplit2327
NOP	
L_Protocol_strsplit2764:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2765
NOP	
J	L_Protocol_strsplit2328
NOP	
L_Protocol_strsplit2765:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2317:
;Protocol.c,847 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,848 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,849 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,846 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2324
NOP	
L_Protocol_strsplit2327:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2324:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2323
NOP	
L_Protocol_strsplit2328:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2323:
;Protocol.c,845 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2326
NOP	
L_Protocol_strsplit2329:
L_Protocol_strsplit2326:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2325
NOP	
L_Protocol_strsplit2330:
L_Protocol_strsplit2325:
;Protocol.c,852 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,854 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2766
NOP	
J	L_Protocol_strsplit2289
NOP	
L_Protocol_strsplit2766:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,855 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit2277
NOP	
L_Protocol_strsplit2289:
;Protocol.c,856 :: 		}
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
L_Protocol_strsplit2278:
;Protocol.c,836 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,856 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2276
NOP	
L_Protocol_strsplit2331:
;Protocol.c,836 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,856 :: 		}
L_Protocol_strsplit2277:
;Protocol.c,857 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,858 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,859 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,863 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,866 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,867 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,869 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,870 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str290:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str769
NOP	
J	L_Protocol_cpy_val_from_str291
NOP	
L_Protocol_cpy_val_from_str769:
;Protocol.c,871 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,872 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,873 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str290
NOP	
L_Protocol_cpy_val_from_str291:
;Protocol.c,874 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,876 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,877 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,882 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,884 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,886 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,888 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int292:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int771
NOP	
J	L_Protocol_str2int293
NOP	
L_Protocol_str2int771:
;Protocol.c,889 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,890 :: 		while(DMA_IsOn(1));
L_Protocol_str2int295:
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
BNE	R2, R0, L_Protocol_str2int773
NOP	
J	L_Protocol_str2int296
NOP	
L_Protocol_str2int773:
J	L_Protocol_str2int295
NOP	
L_Protocol_str2int296:
;Protocol.c,888 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,891 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int292
NOP	
L_Protocol_str2int293:
;Protocol.c,893 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,894 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,955 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,956 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+18)(GP)
BNE	R2, R0, L__protocol_execute_runtime776
NOP	
J	L_protocol_execute_runtime297
NOP	
L__protocol_execute_runtime776:
;Protocol.c,957 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,962 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime778
NOP	
J	L__protocol_execute_runtime374
NOP	
L__protocol_execute_runtime778:
;Protocol.c,963 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,966 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime780
NOP	
J	L_protocol_execute_runtime299
NOP	
L__protocol_execute_runtime780:
;Protocol.c,967 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,968 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,969 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,970 :: 		do {
J	L_protocol_execute_runtime300
NOP	
L__protocol_execute_runtime373:
;Protocol.c,974 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,970 :: 		do {
L_protocol_execute_runtime300:
;Protocol.c,974 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime782
NOP	
J	L__protocol_execute_runtime373
NOP	
L__protocol_execute_runtime782:
; rt_exec end address is: 12 (R3)
;Protocol.c,977 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime303
NOP	
L_protocol_execute_runtime299:
;Protocol.c,981 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,982 :: 		}
L_protocol_execute_runtime303:
;Protocol.c,983 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,984 :: 		}
J	L_protocol_execute_runtime298
NOP	
L__protocol_execute_runtime374:
;Protocol.c,962 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,984 :: 		}
L_protocol_execute_runtime298:
;Protocol.c,987 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime784
NOP	
J	L_protocol_execute_runtime304
NOP	
L__protocol_execute_runtime784:
; rt_exec end address is: 16 (R4)
;Protocol.c,988 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,989 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,990 :: 		}
L_protocol_execute_runtime304:
;Protocol.c,993 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime786
NOP	
J	L_protocol_execute_runtime305
NOP	
L__protocol_execute_runtime786:
;Protocol.c,994 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,995 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,996 :: 		}
L_protocol_execute_runtime305:
;Protocol.c,999 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime788
NOP	
J	L_protocol_execute_runtime306
NOP	
L__protocol_execute_runtime788:
;Protocol.c,1001 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,1002 :: 		}
L_protocol_execute_runtime306:
;Protocol.c,1006 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime790
NOP	
J	L_protocol_execute_runtime307
NOP	
L__protocol_execute_runtime790:
;Protocol.c,1008 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,1009 :: 		}
L_protocol_execute_runtime307:
;Protocol.c,1011 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime792
NOP	
J	L_protocol_execute_runtime308
NOP	
L__protocol_execute_runtime792:
;Protocol.c,1013 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime794
NOP	
J	L_protocol_execute_runtime309
NOP	
L__protocol_execute_runtime794:
;Protocol.c,1014 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
;Protocol.c,1015 :: 		}
L_protocol_execute_runtime309:
;Protocol.c,1016 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,1017 :: 		}
L_protocol_execute_runtime308:
;Protocol.c,1018 :: 		}
L_protocol_execute_runtime297:
;Protocol.c,1022 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,1026 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,1030 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check797
NOP	
J	L_protocol_system_check310
NOP	
L__protocol_system_check797:
;Protocol.c,1043 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,1046 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,1047 :: 		sys.execute = 0;
SH	R0, Offset(_sys+18)(GP)
;Protocol.c,1048 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check799
NOP	
J	L_protocol_system_check311
NOP	
L__protocol_system_check799:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check311:
;Protocol.c,1058 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check800
NOP	
J	L__protocol_system_check377
NOP	
L__protocol_system_check800:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check802
NOP	
J	L__protocol_system_check376
NOP	
L__protocol_system_check802:
L__protocol_system_check375:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check377:
L__protocol_system_check376:
;Protocol.c,1062 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check803
NOP	
J	L_protocol_system_check315
NOP	
L__protocol_system_check803:
;Protocol.c,1063 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,1064 :: 		} else {
J	L_protocol_system_check316
NOP	
L_protocol_system_check315:
;Protocol.c,1066 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,1068 :: 		}
L_protocol_system_check316:
;Protocol.c,1069 :: 		}
L_protocol_system_check310:
;Protocol.c,1070 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
