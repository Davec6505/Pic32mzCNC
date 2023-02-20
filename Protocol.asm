_Str_Initialize:
;Protocol.c,29 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,31 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize254
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize254:
;Protocol.c,32 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,31 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,33 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,34 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,36 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,37 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,38 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,42 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;Protocol.c,58 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,61 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer258
NOP	
J	L__Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer258:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer259
NOP	
J	L__Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer259:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer234:
;Protocol.c,62 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,63 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,64 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,65 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,61 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer236:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer235:
;Protocol.c,68 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer260:
; dif end address is: 20 (R5)
;Protocol.c,70 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer262:
;Protocol.c,71 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,72 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer263:
;Protocol.c,77 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,78 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer264:
;Protocol.c,79 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer9:
;Protocol.c,80 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,81 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,82 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,83 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,84 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer265:
;Protocol.c,86 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,88 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 24
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,89 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,90 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,95 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,96 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,111 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer266:
;Protocol.c,116 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,117 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,119 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,120 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,122 :: 		}
L_Sample_Ringbuffer12:
;Protocol.c,129 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer267:
;Protocol.c,130 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,131 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer268:
;Protocol.c,132 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer14:
;Protocol.c,133 :: 		}else if(gcode[0][0] =='$'){
J	L_Sample_Ringbuffer15
NOP	
L_Sample_Ringbuffer13:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer269:
;Protocol.c,135 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer270:
;Protocol.c,136 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,137 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,138 :: 		status = STATUS_OK;
SH	R0, 22(SP)
;Protocol.c,139 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,140 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,141 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,142 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,143 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,144 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,145 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,146 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer21:
;Protocol.c,147 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,148 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,149 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,150 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer22:
;Protocol.c,152 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,153 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,154 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,157 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer271:
;Protocol.c,158 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer23:
;Protocol.c,159 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,160 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer24:
;Protocol.c,161 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,165 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer272:
;Protocol.c,166 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,167 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,168 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,170 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer274:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,172 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SB	R2, Offset(_sys+1)(GP)
;Protocol.c,173 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,174 :: 		}
L_Sample_Ringbuffer26:
;Protocol.c,175 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,176 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer28:
;Protocol.c,177 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,178 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer275
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer275:
;Protocol.c,179 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,180 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,182 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,183 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,184 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,185 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer30:
;Protocol.c,186 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,188 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer277:
;Protocol.c,189 :: 		int axis_to_home = 0;
;Protocol.c,192 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer279
NOP	
J	L__Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer279:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer281
NOP	
J	L__Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer281:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer238:
L__Sample_Ringbuffer237:
;Protocol.c,193 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,195 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer35:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer283
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer283:
J	L_Sample_Ringbuffer35
NOP	
L_Sample_Ringbuffer36:
;Protocol.c,196 :: 		dma_printf("GCODE:= %s\tmodal_group:= %d\n",gcode[0],Get_modalgroup());
JAL	_Get_modalgroup+0
NOP	
ADDIU	R23, SP, 112
ADDIU	R22, R23, 29
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 112
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Protocol.c,199 :: 		if (sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer285:
;Protocol.c,200 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,202 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,203 :: 		} else {
J	L_Sample_Ringbuffer38
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,204 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,205 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,206 :: 		} else {
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,207 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,208 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,209 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,211 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer40:
;Protocol.c,212 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,213 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer286:
;Protocol.c,214 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer42:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer287:
;Protocol.c,215 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer289:
;Protocol.c,216 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,217 :: 		} else {
J	L_Sample_Ringbuffer46
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,218 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,219 :: 		}
L_Sample_Ringbuffer46:
;Protocol.c,214 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,224 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer42
NOP	
L_Sample_Ringbuffer43:
;Protocol.c,227 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,228 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,229 :: 		}else { // Store startup line
L_Sample_Ringbuffer41:
;Protocol.c,230 :: 		int N_Val = 0;
;Protocol.c,231 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,236 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer290
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer290:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer291
NOP	
J	L__Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer291:
L__Sample_Ringbuffer232:
;Protocol.c,237 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 141(SP)
MOVZ	R30, R0, R0
SB	R30, 142(SP)
;Protocol.c,239 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 141
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,240 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,247 :: 		}else {
J	L_Sample_Ringbuffer51
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,236 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer240:
L__Sample_Ringbuffer239:
;Protocol.c,248 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,250 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,251 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,254 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer293:
; helper_var end address is: 28 (R7)
;Protocol.c,255 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer295:
; N_Val end address is: 16 (R4)
;Protocol.c,258 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,259 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,267 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,272 :: 		}else{
J	L_Sample_Ringbuffer54
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,273 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,281 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,282 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,283 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,285 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,287 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,288 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer55:
;Protocol.c,289 :: 		sys.execute |= EXEC_CYCLE_START;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,290 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,291 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer56:
;Protocol.c,292 :: 		sys.execute |= EXEC_FEED_HOLD;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,293 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,294 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer57:
;Protocol.c,295 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,296 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,298 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
;Protocol.c,299 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
;Protocol.c,303 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer297
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer297:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer299:
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer242:
L__Sample_Ringbuffer241:
;Protocol.c,304 :: 		char str_val[9]={0};
ADDIU	R23, SP, 143
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,305 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,306 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,307 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer300:
;Protocol.c,309 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 143
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,310 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 143
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer302
NOP	
J	L__Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer302:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 143
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer250:
L_Sample_Ringbuffer72:
;Protocol.c,311 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 143
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,312 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer73
NOP	
L_Sample_Ringbuffer71:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer303
NOP	
J	L__Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer303:
;Protocol.c,314 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 143
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,315 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 143
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer305
NOP	
J	L__Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer305:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 143
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer251:
SEH	R5, R6
L_Sample_Ringbuffer75:
;Protocol.c,316 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 143
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,317 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 143
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
;Protocol.c,318 :: 		}
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer252:
;Protocol.c,312 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,318 :: 		}
L_Sample_Ringbuffer74:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer73:
;Protocol.c,321 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer306
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer306:
; value end address is: 8 (R2)
ADDIU	R2, SP, 143
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer308
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer308:
J	L_Sample_Ringbuffer78
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer244:
L__Sample_Ringbuffer243:
;Protocol.c,322 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,323 :: 		}
L_Sample_Ringbuffer78:
;Protocol.c,324 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 143
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,329 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,332 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,333 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,334 :: 		}
L_Sample_Ringbuffer70:
;Protocol.c,335 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,336 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,338 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer348:
L_Sample_Ringbuffer19:
;Protocol.c,340 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer79
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer349
NOP	
J	L__Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer349:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer350
NOP	
J	L__Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer350:
L__Sample_Ringbuffer229:
;Protocol.c,341 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 152(SP)
J	L_Sample_Ringbuffer83
NOP	
;Protocol.c,342 :: 		case 'G':case 'g':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,344 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer351:
;Protocol.c,345 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,346 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer352:
;Protocol.c,347 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,350 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer354:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer356:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer358:
SEH	R2, R4
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer247:
L__Sample_Ringbuffer246:
L__Sample_Ringbuffer245:
;Protocol.c,351 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer91:
;Protocol.c,352 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer92
NOP	
L_Sample_Ringbuffer88:
;Protocol.c,354 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,355 :: 		}
L_Sample_Ringbuffer92:
;Protocol.c,357 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,367 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer360:
;Protocol.c,369 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,370 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,371 :: 		case 'X':case 'x':
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
;Protocol.c,372 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,373 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,374 :: 		case 'A':case 'a':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,375 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,376 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,380 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,381 :: 		case 'L':case 'l':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,382 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,383 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,387 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,388 :: 		case 'F':case 'f':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,389 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,390 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,394 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,395 :: 		case 'P':case 'p':
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,396 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,397 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,401 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,402 :: 		case 'S':case 's':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,403 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,404 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,408 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,409 :: 		}
L_Sample_Ringbuffer94:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer378:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer380:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer390:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer392:
L_Sample_Ringbuffer95:
;Protocol.c,410 :: 		}
L_Sample_Ringbuffer93:
;Protocol.c,415 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer394:
;Protocol.c,417 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,418 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,419 :: 		case 'X':case 'x':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,420 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,421 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,422 :: 		case 'A':case 'a':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,423 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,424 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,428 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,429 :: 		case 'L':case 'l':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,430 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,431 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,435 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,436 :: 		case 'F':case 'f':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,437 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,438 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,442 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,443 :: 		case 'P':case 'p':
L_Sample_Ringbuffer127:
L_Sample_Ringbuffer128:
;Protocol.c,444 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,445 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,449 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,450 :: 		case 'S':case 's':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
;Protocol.c,451 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,452 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,456 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,457 :: 		}
L_Sample_Ringbuffer113:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer398:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer400:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer426:
L_Sample_Ringbuffer114:
;Protocol.c,458 :: 		}
L_Sample_Ringbuffer112:
;Protocol.c,462 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer428:
;Protocol.c,464 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,465 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer132
NOP	
;Protocol.c,466 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
;Protocol.c,467 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
;Protocol.c,468 :: 		case 'I':case 'i':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,469 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,470 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,474 :: 		break;
J	L_Sample_Ringbuffer133
NOP	
;Protocol.c,475 :: 		case 'F': case 'f':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,476 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,477 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,481 :: 		break;
J	L_Sample_Ringbuffer133
NOP	
;Protocol.c,482 :: 		}
L_Sample_Ringbuffer132:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer452:
L_Sample_Ringbuffer133:
;Protocol.c,483 :: 		}
L_Sample_Ringbuffer131:
;Protocol.c,488 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer454:
;Protocol.c,489 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,490 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer147
NOP	
;Protocol.c,491 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,492 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,493 :: 		case 'J':case 'j':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,494 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,495 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,499 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,500 :: 		case 'F':case 'f':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,501 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,502 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,506 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,508 :: 		}
L_Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer462:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer466:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer468:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer470:
L_Sample_Ringbuffer148:
;Protocol.c,509 :: 		}
L_Sample_Ringbuffer146:
;Protocol.c,513 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer472:
;Protocol.c,514 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,515 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,516 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer158
NOP	
;Protocol.c,517 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
;Protocol.c,518 :: 		case 'J':case 'j':
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
;Protocol.c,519 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,520 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,524 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,525 :: 		case 'F':case 'f':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,526 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,527 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,531 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,532 :: 		}
L_Sample_Ringbuffer158:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer478:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer480:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer482:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer484:
L_Sample_Ringbuffer159:
;Protocol.c,533 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,536 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer486:
;Protocol.c,537 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,538 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer167
NOP	
;Protocol.c,539 :: 		case 'J':case 'j':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
;Protocol.c,540 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,541 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,545 :: 		break;
J	L_Sample_Ringbuffer168
NOP	
;Protocol.c,546 :: 		case 'F':case 'f':
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,547 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,548 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,552 :: 		break;
J	L_Sample_Ringbuffer168
NOP	
;Protocol.c,554 :: 		}
L_Sample_Ringbuffer167:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer488:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer490:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer492:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer494:
L_Sample_Ringbuffer168:
;Protocol.c,555 :: 		}
L_Sample_Ringbuffer166:
;Protocol.c,556 :: 		}else {
J	L_Sample_Ringbuffer173
NOP	
L_Sample_Ringbuffer87:
;Protocol.c,557 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,558 :: 		}
L_Sample_Ringbuffer173:
;Protocol.c,559 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,560 :: 		case 'M':
L_Sample_Ringbuffer174:
;Protocol.c,561 :: 		case 'm':
L_Sample_Ringbuffer175:
;Protocol.c,563 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,564 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,565 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,571 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer496
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer496:
;Protocol.c,572 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer177
NOP	
;Protocol.c,573 :: 		case 'S':
L_Sample_Ringbuffer179:
;Protocol.c,574 :: 		case 's':
L_Sample_Ringbuffer180:
;Protocol.c,576 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,577 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 108(SP)
;Protocol.c,578 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,582 :: 		break;
J	L_Sample_Ringbuffer178
NOP	
;Protocol.c,583 :: 		}
L_Sample_Ringbuffer177:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer498
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer498:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer500
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer500:
L_Sample_Ringbuffer178:
;Protocol.c,584 :: 		}
L_Sample_Ringbuffer176:
;Protocol.c,585 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,586 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer181:
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
;Protocol.c,587 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
;Protocol.c,588 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer501:
;Protocol.c,589 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,590 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,591 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,595 :: 		}
L_Sample_Ringbuffer189:
;Protocol.c,599 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer503:
;Protocol.c,600 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,601 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,602 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,603 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
;Protocol.c,604 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,605 :: 		case 'A':case 'a':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,606 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,607 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,611 :: 		break;
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,612 :: 		case 'F':
L_Sample_Ringbuffer199:
;Protocol.c,613 :: 		case 'f':
L_Sample_Ringbuffer200:
;Protocol.c,616 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,617 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,622 :: 		break;
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,623 :: 		}
L_Sample_Ringbuffer191:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer519:
L_Sample_Ringbuffer192:
;Protocol.c,624 :: 		}
L_Sample_Ringbuffer190:
;Protocol.c,625 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,626 :: 		case 'F':
L_Sample_Ringbuffer201:
;Protocol.c,628 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer520:
;Protocol.c,629 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,630 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,631 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,635 :: 		}
L_Sample_Ringbuffer202:
;Protocol.c,636 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,638 :: 		}
L_Sample_Ringbuffer83:
LH	R4, 152(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer522:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer524:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer526:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer528:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer530:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer532:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer534:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer536:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer538:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer540:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer542:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer544:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer546:
L_Sample_Ringbuffer84:
;Protocol.c,340 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer249:
L__Sample_Ringbuffer248:
;Protocol.c,639 :: 		}
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer15:
;Protocol.c,641 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer547:
SH	R0, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer203:
;Protocol.c,642 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer548:
ORI	R2, R0, 1
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer205:
;Protocol.c,643 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer549:
ORI	R2, R0, 3
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer207:
;Protocol.c,646 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,647 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,650 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer550
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer550:
;Protocol.c,651 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer208:
;Protocol.c,652 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,655 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,656 :: 		}
;Protocol.c,655 :: 		return status;
;Protocol.c,656 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,661 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,663 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,664 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,665 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,666 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit209:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit552
NOP	
J	L_Protocol_strsplit210
NOP	
L_Protocol_strsplit552:
;Protocol.c,667 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,668 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit554
NOP	
J	L_Protocol_strsplit227
NOP	
L_Protocol_strsplit554:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit556
NOP	
J	L_Protocol_strsplit226
NOP	
L_Protocol_strsplit556:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit557
NOP	
J	L_Protocol_strsplit225
NOP	
L_Protocol_strsplit557:
J	L_Protocol_strsplit214
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit227:
L_Protocol_strsplit226:
L_Protocol_strsplit225:
;Protocol.c,669 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,670 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,671 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,672 :: 		continue;
J	L_Protocol_strsplit211
NOP	
;Protocol.c,673 :: 		}else{
L_Protocol_strsplit214:
;Protocol.c,674 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,676 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit558
NOP	
J	L_Protocol_strsplit216
NOP	
L_Protocol_strsplit558:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,677 :: 		break;
J	L_Protocol_strsplit210
NOP	
L_Protocol_strsplit216:
;Protocol.c,678 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit211:
;Protocol.c,666 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,678 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit209
NOP	
L_Protocol_strsplit210:
;Protocol.c,679 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,680 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,681 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,685 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,688 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,689 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,691 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,692 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str217:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str561
NOP	
J	L_Protocol_cpy_val_from_str218
NOP	
L_Protocol_cpy_val_from_str561:
;Protocol.c,693 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,694 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,695 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str217
NOP	
L_Protocol_cpy_val_from_str218:
;Protocol.c,696 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,698 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,699 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,704 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,706 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,708 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,710 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int219:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int563
NOP	
J	L_Protocol_str2int220
NOP	
L_Protocol_str2int563:
;Protocol.c,711 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,712 :: 		while(DMA_IsOn(1));
L_Protocol_str2int222:
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
BNE	R2, R0, L_Protocol_str2int565
NOP	
J	L_Protocol_str2int223
NOP	
L_Protocol_str2int565:
J	L_Protocol_str2int222
NOP	
L_Protocol_str2int223:
;Protocol.c,710 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,713 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int219
NOP	
L_Protocol_str2int220:
;Protocol.c,715 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,716 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
