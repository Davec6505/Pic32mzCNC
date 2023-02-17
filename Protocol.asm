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
ADDIU	SP, SP, -128
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
;Protocol.c,187 :: 		if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer277:
;Protocol.c,188 :: 		int axis_to_home = 0;
; axis_to_home start address is: 16 (R4)
MOVZ	R4, R0, R0
;Protocol.c,190 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
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
; axis_to_home end address is: 16 (R4)
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer238:
; axis_to_home start address is: 16 (R4)
L__Sample_Ringbuffer237:
;Protocol.c,191 :: 		while(!Home(axis_to_home)){
SEH	R3, R4
L_Sample_Ringbuffer35:
; axis_to_home end address is: 16 (R4)
; axis_to_home start address is: 12 (R3)
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Home+0
NOP	
LH	R3, 20(SP)
BEQ	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer282:
;Protocol.c,193 :: 		if (sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer284:
; axis_to_home end address is: 12 (R3)
;Protocol.c,194 :: 		break;
J	L_Sample_Ringbuffer36
NOP	
;Protocol.c,195 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,196 :: 		}
; axis_to_home start address is: 12 (R3)
; axis_to_home end address is: 12 (R3)
J	L_Sample_Ringbuffer35
NOP	
L_Sample_Ringbuffer36:
;Protocol.c,198 :: 		} else {
J	L_Sample_Ringbuffer38
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,199 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,200 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,201 :: 		} else {
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,202 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,203 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,204 :: 		break; //'H'
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,205 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer40:
;Protocol.c,206 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,207 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer285:
;Protocol.c,208 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer42:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer286:
;Protocol.c,209 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer288:
;Protocol.c,210 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,211 :: 		} else {
J	L_Sample_Ringbuffer46
NOP	
L_Sample_Ringbuffer45:
;Protocol.c,212 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,213 :: 		}
L_Sample_Ringbuffer46:
;Protocol.c,208 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,218 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer42
NOP	
L_Sample_Ringbuffer43:
;Protocol.c,221 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,222 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,223 :: 		}else { // Store startup line
L_Sample_Ringbuffer41:
;Protocol.c,224 :: 		int N_Val = 0;
;Protocol.c,225 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,230 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer289:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer290
NOP	
J	L__Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer290:
L__Sample_Ringbuffer232:
;Protocol.c,231 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 112(SP)
MOVZ	R30, R0, R0
SB	R30, 113(SP)
;Protocol.c,233 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 112
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,234 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,241 :: 		}else {
J	L_Sample_Ringbuffer51
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,230 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer240:
L__Sample_Ringbuffer239:
;Protocol.c,242 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,244 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,245 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,248 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer292:
; helper_var end address is: 28 (R7)
;Protocol.c,249 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer294:
; N_Val end address is: 16 (R4)
;Protocol.c,252 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,253 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,261 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,266 :: 		}else{
J	L_Sample_Ringbuffer54
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,267 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,275 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,276 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,277 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,279 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,281 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,282 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer55:
;Protocol.c,283 :: 		sys.execute |= EXEC_CYCLE_START;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,284 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,285 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer56:
;Protocol.c,286 :: 		sys.execute |= EXEC_FEED_HOLD;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,287 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,288 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer57:
;Protocol.c,289 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,290 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,292 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
;Protocol.c,293 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
;Protocol.c,297 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer298:
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer242:
L__Sample_Ringbuffer241:
;Protocol.c,298 :: 		char str_val[9]={0};
ADDIU	R23, SP, 114
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,299 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,300 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,301 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer299:
;Protocol.c,303 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 114
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,304 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer301
NOP	
J	L__Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer301:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 114
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
;Protocol.c,305 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,306 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer73
NOP	
L_Sample_Ringbuffer71:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L__Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer302:
;Protocol.c,308 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 114
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,309 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer304
NOP	
J	L__Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer304:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 114
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
;Protocol.c,310 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 114
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,311 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,312 :: 		}
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer252:
;Protocol.c,306 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,312 :: 		}
L_Sample_Ringbuffer74:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer73:
;Protocol.c,315 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer305
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer305:
; value end address is: 8 (R2)
ADDIU	R2, SP, 114
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer307
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer307:
J	L_Sample_Ringbuffer78
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer244:
L__Sample_Ringbuffer243:
;Protocol.c,316 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,317 :: 		}
L_Sample_Ringbuffer78:
;Protocol.c,318 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 114
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,323 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,326 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,327 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,328 :: 		}
L_Sample_Ringbuffer70:
;Protocol.c,329 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,330 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,332 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer309
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer309:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer311:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer313
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer313:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer315:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer317:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer319:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer321:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer329:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer331:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer333:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer335:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer347:
L_Sample_Ringbuffer19:
;Protocol.c,334 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer79
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer348
NOP	
J	L__Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer348:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer349
NOP	
J	L__Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer349:
L__Sample_Ringbuffer229:
;Protocol.c,335 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer83
NOP	
;Protocol.c,336 :: 		case 'G':case 'g':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,338 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer350:
;Protocol.c,339 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,340 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer351:
;Protocol.c,341 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,344 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer353:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer355:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer357
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer357:
SEH	R2, R4
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer247:
L__Sample_Ringbuffer246:
L__Sample_Ringbuffer245:
;Protocol.c,345 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer91:
;Protocol.c,346 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer92
NOP	
L_Sample_Ringbuffer88:
;Protocol.c,348 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,349 :: 		}
L_Sample_Ringbuffer92:
;Protocol.c,351 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,361 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer359:
;Protocol.c,363 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,364 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,365 :: 		case 'X':case 'x':
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
;Protocol.c,366 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,367 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,368 :: 		case 'A':case 'a':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,369 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,370 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,374 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,375 :: 		case 'L':case 'l':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,376 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,377 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,381 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,382 :: 		case 'F':case 'f':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,383 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,384 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,388 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,389 :: 		case 'P':case 'p':
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,390 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,391 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,395 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,396 :: 		case 'S':case 's':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,397 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,398 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,402 :: 		break;
J	L_Sample_Ringbuffer95
NOP	
;Protocol.c,403 :: 		}
L_Sample_Ringbuffer94:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer363:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer365:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer367:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer369:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer373:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer375:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer377:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer379:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer381:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer383:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer385:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer387:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer389:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer391:
L_Sample_Ringbuffer95:
;Protocol.c,404 :: 		}
L_Sample_Ringbuffer93:
;Protocol.c,409 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer393:
;Protocol.c,411 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,412 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,413 :: 		case 'X':case 'x':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,414 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,415 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,416 :: 		case 'A':case 'a':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,417 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,418 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,422 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,423 :: 		case 'L':case 'l':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,424 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,425 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,429 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,430 :: 		case 'F':case 'f':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,431 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,432 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,436 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,437 :: 		case 'P':case 'p':
L_Sample_Ringbuffer127:
L_Sample_Ringbuffer128:
;Protocol.c,438 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,439 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,443 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,444 :: 		case 'S':case 's':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
;Protocol.c,445 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,446 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,450 :: 		break;
J	L_Sample_Ringbuffer114
NOP	
;Protocol.c,451 :: 		}
L_Sample_Ringbuffer113:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer395:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer397:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer399:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer401
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer401:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer403
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer403:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer405
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer405:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer407:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer409:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer411:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer413:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer415:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer417:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer419:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer421:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer423:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer425:
L_Sample_Ringbuffer114:
;Protocol.c,452 :: 		}
L_Sample_Ringbuffer112:
;Protocol.c,456 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,458 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,459 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer132
NOP	
;Protocol.c,460 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
;Protocol.c,461 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
;Protocol.c,462 :: 		case 'I':case 'i':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,463 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,464 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,468 :: 		break;
J	L_Sample_Ringbuffer133
NOP	
;Protocol.c,469 :: 		case 'F': case 'f':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,470 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,471 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,475 :: 		break;
J	L_Sample_Ringbuffer133
NOP	
;Protocol.c,476 :: 		}
L_Sample_Ringbuffer132:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer429:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer431:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer435:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer437:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer445:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer447:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer449:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer451
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer451:
L_Sample_Ringbuffer133:
;Protocol.c,477 :: 		}
L_Sample_Ringbuffer131:
;Protocol.c,482 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer453
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer453:
;Protocol.c,483 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,484 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer147
NOP	
;Protocol.c,485 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,486 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,487 :: 		case 'J':case 'j':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,488 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,489 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,493 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,494 :: 		case 'F':case 'f':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,495 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,496 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,500 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,502 :: 		}
L_Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer455:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer457
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer457:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer459
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer459:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer461:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer463:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer465:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer467:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer469:
L_Sample_Ringbuffer148:
;Protocol.c,503 :: 		}
L_Sample_Ringbuffer146:
;Protocol.c,507 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer471
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer471:
;Protocol.c,508 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,509 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,510 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer158
NOP	
;Protocol.c,511 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
;Protocol.c,512 :: 		case 'J':case 'j':
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
;Protocol.c,513 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,514 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,518 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,519 :: 		case 'F':case 'f':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,520 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,521 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,525 :: 		break;
J	L_Sample_Ringbuffer159
NOP	
;Protocol.c,526 :: 		}
L_Sample_Ringbuffer158:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer475:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer479:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer481:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer483:
L_Sample_Ringbuffer159:
;Protocol.c,527 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,530 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer485:
;Protocol.c,531 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,532 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer167
NOP	
;Protocol.c,533 :: 		case 'J':case 'j':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
;Protocol.c,534 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,535 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,539 :: 		break;
J	L_Sample_Ringbuffer168
NOP	
;Protocol.c,540 :: 		case 'F':case 'f':
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,541 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,542 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,546 :: 		break;
J	L_Sample_Ringbuffer168
NOP	
;Protocol.c,548 :: 		}
L_Sample_Ringbuffer167:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer493:
L_Sample_Ringbuffer168:
;Protocol.c,549 :: 		}
L_Sample_Ringbuffer166:
;Protocol.c,550 :: 		}else {
J	L_Sample_Ringbuffer173
NOP	
L_Sample_Ringbuffer87:
;Protocol.c,551 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,552 :: 		}
L_Sample_Ringbuffer173:
;Protocol.c,553 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,554 :: 		case 'M':
L_Sample_Ringbuffer174:
;Protocol.c,555 :: 		case 'm':
L_Sample_Ringbuffer175:
;Protocol.c,557 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,558 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,559 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,565 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer495:
;Protocol.c,566 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer177
NOP	
;Protocol.c,567 :: 		case 'S':
L_Sample_Ringbuffer179:
;Protocol.c,568 :: 		case 's':
L_Sample_Ringbuffer180:
;Protocol.c,570 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,571 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 108(SP)
;Protocol.c,572 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,576 :: 		break;
J	L_Sample_Ringbuffer178
NOP	
;Protocol.c,577 :: 		}
L_Sample_Ringbuffer177:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer499:
L_Sample_Ringbuffer178:
;Protocol.c,578 :: 		}
L_Sample_Ringbuffer176:
;Protocol.c,579 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,580 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer181:
L_Sample_Ringbuffer182:
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
;Protocol.c,581 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
;Protocol.c,582 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer500
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer500:
;Protocol.c,583 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,584 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,585 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,589 :: 		}
L_Sample_Ringbuffer189:
;Protocol.c,593 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer502
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer502:
;Protocol.c,594 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,595 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,596 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer191
NOP	
;Protocol.c,597 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
;Protocol.c,598 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,599 :: 		case 'A':case 'a':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,600 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,601 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,605 :: 		break;
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,606 :: 		case 'F':
L_Sample_Ringbuffer199:
;Protocol.c,607 :: 		case 'f':
L_Sample_Ringbuffer200:
;Protocol.c,610 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,611 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,616 :: 		break;
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,617 :: 		}
L_Sample_Ringbuffer191:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer504:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer506:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer508
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer508:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer510:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer512:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer514:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer516:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer518:
L_Sample_Ringbuffer192:
;Protocol.c,618 :: 		}
L_Sample_Ringbuffer190:
;Protocol.c,619 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,620 :: 		case 'F':
L_Sample_Ringbuffer201:
;Protocol.c,622 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer519:
;Protocol.c,623 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,624 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,625 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,629 :: 		}
L_Sample_Ringbuffer202:
;Protocol.c,630 :: 		break;
J	L_Sample_Ringbuffer84
NOP	
;Protocol.c,632 :: 		}
L_Sample_Ringbuffer83:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer521:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer523:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer525:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer527:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer529:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer531:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer533:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer535:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer537
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer537:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer539
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer539:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer541:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer543:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer545:
L_Sample_Ringbuffer84:
;Protocol.c,334 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer249:
L__Sample_Ringbuffer248:
;Protocol.c,633 :: 		}
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer15:
;Protocol.c,635 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer546:
SH	R0, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer203:
;Protocol.c,636 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer547:
ORI	R2, R0, 1
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer205:
;Protocol.c,637 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer548:
ORI	R2, R0, 3
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer207:
;Protocol.c,640 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,641 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,644 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer549:
;Protocol.c,645 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer208:
;Protocol.c,646 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,649 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,650 :: 		}
;Protocol.c,649 :: 		return status;
;Protocol.c,650 :: 		}
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
;Protocol.c,655 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,657 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,658 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,659 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,660 :: 		for (i = 0; i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit551
NOP	
J	L_Protocol_strsplit210
NOP	
L_Protocol_strsplit551:
;Protocol.c,661 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,662 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit553
NOP	
J	L_Protocol_strsplit227
NOP	
L_Protocol_strsplit553:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit555
NOP	
J	L_Protocol_strsplit226
NOP	
L_Protocol_strsplit555:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit556
NOP	
J	L_Protocol_strsplit225
NOP	
L_Protocol_strsplit556:
J	L_Protocol_strsplit214
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit227:
L_Protocol_strsplit226:
L_Protocol_strsplit225:
;Protocol.c,663 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,664 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,665 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,666 :: 		continue;
J	L_Protocol_strsplit211
NOP	
;Protocol.c,667 :: 		}else{
L_Protocol_strsplit214:
;Protocol.c,668 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,670 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit557
NOP	
J	L_Protocol_strsplit216
NOP	
L_Protocol_strsplit557:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,671 :: 		break;
J	L_Protocol_strsplit210
NOP	
L_Protocol_strsplit216:
;Protocol.c,672 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit211:
;Protocol.c,660 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,672 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit209
NOP	
L_Protocol_strsplit210:
;Protocol.c,673 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,674 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,675 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,679 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,682 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,683 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,685 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,686 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str217:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str560
NOP	
J	L_Protocol_cpy_val_from_str218
NOP	
L_Protocol_cpy_val_from_str560:
;Protocol.c,687 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,688 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,689 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str217
NOP	
L_Protocol_cpy_val_from_str218:
;Protocol.c,690 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,692 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,693 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,698 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,700 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,702 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,704 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int219:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int562
NOP	
J	L_Protocol_str2int220
NOP	
L_Protocol_str2int562:
;Protocol.c,705 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,706 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L_Protocol_str2int564
NOP	
J	L_Protocol_str2int223
NOP	
L_Protocol_str2int564:
J	L_Protocol_str2int222
NOP	
L_Protocol_str2int223:
;Protocol.c,704 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,707 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int219
NOP	
L_Protocol_str2int220:
;Protocol.c,709 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,710 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
