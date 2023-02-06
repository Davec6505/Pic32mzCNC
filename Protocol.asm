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
BNE	R2, R0, L__Str_Initialize253
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize253:
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
ADDIU	SP, SP, -152
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
BNE	R2, R0, L__Sample_Ringbuffer257
NOP	
J	L__Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer257:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer258
NOP	
J	L__Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer258:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer235:
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
L__Sample_Ringbuffer237:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer236:
;Protocol.c,50 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer259:
; dif end address is: 20 (R5)
;Protocol.c,52 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer261
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer261:
;Protocol.c,53 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,54 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer262:
;Protocol.c,59 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,60 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer263:
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
BEQ	R2, R0, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer264:
;Protocol.c,68 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,70 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 30
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,71 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 30
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,72 :: 		str_len = strlen(str);
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,77 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 30
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
BEQ	R3, R2, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer265:
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
BEQ	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer266:
;Protocol.c,112 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,113 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer267:
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
BEQ	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer268:
;Protocol.c,117 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer269:
;Protocol.c,118 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,119 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,120 :: 		status = STATUS_OK;
SH	R0, 28(SP)
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
BEQ	R2, R0, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer270:
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
BEQ	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer271:
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
BNE	R2, R0, L__Sample_Ringbuffer273
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer273:
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
BEQ	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer274:
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
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer276:
;Protocol.c,171 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer278
NOP	
J	L__Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer278:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L__Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer280:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer239:
L__Sample_Ringbuffer238:
;Protocol.c,173 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer281
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer281:
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
BNE	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer282:
;Protocol.c,186 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer40:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer283
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer283:
;Protocol.c,187 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer285:
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
BEQ	R2, R0, L__Sample_Ringbuffer286
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer286:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer287:
L__Sample_Ringbuffer233:
;Protocol.c,209 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 127(SP)
MOVZ	R30, R0, R0
SB	R30, 128(SP)
;Protocol.c,211 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 127
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,212 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
SEH	R5, R7
;Protocol.c,215 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer49:
; N_Val start address is: 16 (R4)
; helper_var start address is: 20 (R5)
SH	R5, 20(SP)
SH	R4, 22(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 22(SP)
LH	R5, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer289:
J	L_Sample_Ringbuffer49
NOP	
L_Sample_Ringbuffer50:
;Protocol.c,216 :: 		dma_printf("%s\t%d\n",num,N_Val);
ADDIU	R3, SP, 127
ORI	R30, R0, 37
SB	R30, 120(SP)
ORI	R30, R0, 115
SB	R30, 121(SP)
ORI	R30, R0, 9
SB	R30, 122(SP)
ORI	R30, R0, 37
SB	R30, 123(SP)
ORI	R30, R0, 100
SB	R30, 124(SP)
ORI	R30, R0, 10
SB	R30, 125(SP)
MOVZ	R30, R0, R0
SB	R30, 126(SP)
ADDIU	R2, SP, 120
SH	R5, 20(SP)
SH	R4, 22(SP)
ADDIU	SP, SP, -12
SH	R4, 8(SP)
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R4, 22(SP)
LH	R5, 20(SP)
;Protocol.c,219 :: 		}else {
J	L_Sample_Ringbuffer51
NOP	
; N_Val end address is: 16 (R4)
; helper_var end address is: 20 (R5)
;Protocol.c,208 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer241:
L__Sample_Ringbuffer240:
;Protocol.c,220 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,222 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,223 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,226 :: 		if (helper_var) { // Store startup line
; helper_var start address is: 20 (R5)
; N_Val start address is: 16 (R4)
BNE	R5, R0, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer291:
; helper_var end address is: 20 (R5)
;Protocol.c,227 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer293:
; N_Val end address is: 16 (R4)
;Protocol.c,229 :: 		helper_var = strlen((gcode[0])); // Set helper variable as counter to start of gcode block
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,230 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 30
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,232 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer54:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer295:
J	L_Sample_Ringbuffer54
NOP	
L_Sample_Ringbuffer55:
;Protocol.c,233 :: 		dma_printf("%s\n",str);
ADDIU	R3, SP, 30
ORI	R30, R0, 37
SB	R30, 129(SP)
ORI	R30, R0, 115
SB	R30, 130(SP)
ORI	R30, R0, 10
SB	R30, 131(SP)
MOVZ	R30, R0, R0
SB	R30, 132(SP)
ADDIU	R2, SP, 129
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,238 :: 		str_len = strlen(str);
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,243 :: 		}else{
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,244 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,252 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 30
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,253 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,254 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,256 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,258 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,259 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,260 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
;Protocol.c,264 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer297
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer297:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer299:
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer243:
L__Sample_Ringbuffer242:
;Protocol.c,265 :: 		char str_val[9]={0};
ADDIU	R23, SP, 137
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,266 :: 		int N_Val = 0;
; N_Val start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,267 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,268 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer300:
;Protocol.c,270 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 137
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,271 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 137
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer302
NOP	
J	L__Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer302:
; N_Val end address is: 28 (R7)
ADDIU	R2, SP, 137
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 28 (R7)
SEH	R7, R2
; N_Val end address is: 28 (R7)
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer249:
L_Sample_Ringbuffer71:
;Protocol.c,272 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 28 (R7)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 137
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,273 :: 		}else if(gcode[0][3] == '='){
J	L_Sample_Ringbuffer72
NOP	
L_Sample_Ringbuffer70:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer303
NOP	
J	L__Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer303:
;Protocol.c,275 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 137
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,276 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 137
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer305
NOP	
J	L__Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer305:
; N_Val end address is: 28 (R7)
ADDIU	R2, SP, 137
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer250:
SEH	R5, R7
L_Sample_Ringbuffer74:
;Protocol.c,277 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
; N_Val start address is: 20 (R5)
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 137
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
;Protocol.c,278 :: 		}
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer251:
;Protocol.c,273 :: 		}else if(gcode[0][3] == '='){
;Protocol.c,278 :: 		}
L_Sample_Ringbuffer73:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer72:
;Protocol.c,281 :: 		if(isdigit(str_val[0])){value = atof(str_val);}
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 137
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer307:
; value end address is: 8 (R2)
ADDIU	R2, SP, 137
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
; value start address is: 0 (R0)
J	L_Sample_Ringbuffer76
NOP	
; N_Val end address is: 28 (R7)
; value end address is: 0 (R0)
L_Sample_Ringbuffer75:
;Protocol.c,282 :: 		else if(value <= 0){query = 2;break;}
; value start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer308:
; value end address is: 8 (R2)
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
J	L_Sample_Ringbuffer19
NOP	
L_Sample_Ringbuffer77:
;Protocol.c,283 :: 		else{query = 3;break;}
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
J	L_Sample_Ringbuffer19
NOP	
L_Sample_Ringbuffer76:
;Protocol.c,285 :: 		while(DMA_IsOn(1));
; value start address is: 0 (R0)
; N_Val start address is: 28 (R7)
SEH	R4, R7
; value end address is: 0 (R0)
MOV.S 	S16, S0
L_Sample_Ringbuffer79:
; N_Val end address is: 28 (R7)
; value start address is: 128 (R32)
; N_Val start address is: 16 (R4)
SH	R4, 20(SP)
SWC1	S16, 24(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S16, 24(SP)
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer310:
J	L_Sample_Ringbuffer79
NOP	
L_Sample_Ringbuffer80:
;Protocol.c,286 :: 		dma_printf("%s\n",str_val);
ADDIU	R3, SP, 137
ORI	R30, R0, 37
SB	R30, 133(SP)
ORI	R30, R0, 115
SB	R30, 134(SP)
ORI	R30, R0, 10
SB	R30, 135(SP)
MOVZ	R30, R0, R0
SB	R30, 136(SP)
ADDIU	R2, SP, 133
SH	R4, 20(SP)
SWC1	S16, 24(SP)
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LWC1	S16, 24(SP)
LH	R4, 20(SP)
;Protocol.c,288 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S16
; value end address is: 128 (R32)
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,291 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,292 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,293 :: 		}
L_Sample_Ringbuffer69:
;Protocol.c,294 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,295 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,297 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer344:
L_Sample_Ringbuffer19:
;Protocol.c,299 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer81
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer345
NOP	
J	L__Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer345:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer346
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer346:
L__Sample_Ringbuffer231:
;Protocol.c,300 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 148(SP)
J	L_Sample_Ringbuffer85
NOP	
;Protocol.c,301 :: 		case 'G':case 'g':
L_Sample_Ringbuffer87:
L_Sample_Ringbuffer88:
;Protocol.c,303 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer347:
;Protocol.c,304 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,305 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer348:
;Protocol.c,306 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,309 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer350:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer352:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer354:
SEH	R2, R4
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer246:
L__Sample_Ringbuffer245:
L__Sample_Ringbuffer244:
;Protocol.c,310 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer93:
;Protocol.c,311 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,313 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 94
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
;Protocol.c,314 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,316 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,326 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer356:
;Protocol.c,328 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,329 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer96
NOP	
;Protocol.c,330 :: 		case 'X':case 'x':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,331 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,332 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,333 :: 		case 'A':case 'a':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,334 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,335 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,339 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,340 :: 		case 'L':case 'l':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,341 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,342 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,346 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,347 :: 		case 'F':case 'f':
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,348 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,349 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,353 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,354 :: 		case 'P':case 'p':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,355 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,356 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,360 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,361 :: 		case 'S':case 's':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
;Protocol.c,362 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,363 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,367 :: 		break;
J	L_Sample_Ringbuffer97
NOP	
;Protocol.c,368 :: 		}
L_Sample_Ringbuffer96:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer378:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer380:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer388:
L_Sample_Ringbuffer97:
;Protocol.c,369 :: 		}
L_Sample_Ringbuffer95:
;Protocol.c,374 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer390:
;Protocol.c,376 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,377 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,378 :: 		case 'X':case 'x':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,379 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,380 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,381 :: 		case 'A':case 'a':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,382 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,383 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,387 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,388 :: 		case 'L':case 'l':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,389 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,390 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,394 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,395 :: 		case 'F':case 'f':
L_Sample_Ringbuffer127:
L_Sample_Ringbuffer128:
;Protocol.c,396 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,397 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,401 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,402 :: 		case 'P':case 'p':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
;Protocol.c,403 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,404 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,408 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,409 :: 		case 'S':case 's':
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,410 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,411 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,415 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,416 :: 		}
L_Sample_Ringbuffer115:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer392:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer394:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer398:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer400:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer422:
L_Sample_Ringbuffer116:
;Protocol.c,417 :: 		}
L_Sample_Ringbuffer114:
;Protocol.c,421 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer424:
;Protocol.c,423 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,424 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer134
NOP	
;Protocol.c,425 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
;Protocol.c,426 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,427 :: 		case 'I':case 'i':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,428 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,429 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,433 :: 		break;
J	L_Sample_Ringbuffer135
NOP	
;Protocol.c,434 :: 		case 'F': case 'f':
L_Sample_Ringbuffer146:
L_Sample_Ringbuffer147:
;Protocol.c,435 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,436 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,440 :: 		break;
J	L_Sample_Ringbuffer135
NOP	
;Protocol.c,441 :: 		}
L_Sample_Ringbuffer134:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer434:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer436:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer448:
L_Sample_Ringbuffer135:
;Protocol.c,442 :: 		}
L_Sample_Ringbuffer133:
;Protocol.c,447 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer450:
;Protocol.c,448 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,449 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,450 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,451 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,452 :: 		case 'J':case 'j':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,453 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,454 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,458 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,459 :: 		case 'F':case 'f':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
;Protocol.c,460 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,461 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,465 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,467 :: 		}
L_Sample_Ringbuffer149:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer462:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer466:
L_Sample_Ringbuffer150:
;Protocol.c,468 :: 		}
L_Sample_Ringbuffer148:
;Protocol.c,472 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer468:
;Protocol.c,473 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 103
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,474 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,475 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer160
NOP	
;Protocol.c,476 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer162:
L_Sample_Ringbuffer163:
;Protocol.c,477 :: 		case 'J':case 'j':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,478 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,479 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,483 :: 		break;
J	L_Sample_Ringbuffer161
NOP	
;Protocol.c,484 :: 		case 'F':case 'f':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,485 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,486 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,490 :: 		break;
J	L_Sample_Ringbuffer161
NOP	
;Protocol.c,491 :: 		}
L_Sample_Ringbuffer160:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer470:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer472:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer478:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer480:
L_Sample_Ringbuffer161:
;Protocol.c,492 :: 		}
L_Sample_Ringbuffer159:
;Protocol.c,495 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer482:
;Protocol.c,496 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,497 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer169
NOP	
;Protocol.c,498 :: 		case 'J':case 'j':
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,499 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,500 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,504 :: 		break;
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,505 :: 		case 'F':case 'f':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,506 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 112(SP)
;Protocol.c,507 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,511 :: 		break;
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,513 :: 		}
L_Sample_Ringbuffer169:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer484:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer486:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer488:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer490:
L_Sample_Ringbuffer170:
;Protocol.c,514 :: 		}
L_Sample_Ringbuffer168:
;Protocol.c,515 :: 		}else {
J	L_Sample_Ringbuffer175
NOP	
L_Sample_Ringbuffer89:
;Protocol.c,516 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,517 :: 		}
L_Sample_Ringbuffer175:
;Protocol.c,518 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,519 :: 		case 'M':
L_Sample_Ringbuffer176:
;Protocol.c,520 :: 		case 'm':
L_Sample_Ringbuffer177:
;Protocol.c,522 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,523 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,524 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,530 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer492:
;Protocol.c,531 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer179
NOP	
;Protocol.c,532 :: 		case 'S':
L_Sample_Ringbuffer181:
;Protocol.c,533 :: 		case 's':
L_Sample_Ringbuffer182:
;Protocol.c,535 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,536 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 116(SP)
;Protocol.c,537 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,541 :: 		break;
J	L_Sample_Ringbuffer180
NOP	
;Protocol.c,542 :: 		}
L_Sample_Ringbuffer179:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer494:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer496
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer496:
L_Sample_Ringbuffer180:
;Protocol.c,543 :: 		}
L_Sample_Ringbuffer178:
;Protocol.c,544 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,545 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
;Protocol.c,546 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
L_Sample_Ringbuffer190:
;Protocol.c,547 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer497:
;Protocol.c,548 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,549 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,550 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,554 :: 		}
L_Sample_Ringbuffer191:
;Protocol.c,558 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer499:
;Protocol.c,559 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 103
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,560 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,561 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer193
NOP	
;Protocol.c,562 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,563 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,564 :: 		case 'A':case 'a':
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
;Protocol.c,565 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 116(SP)
;Protocol.c,566 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 116
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,570 :: 		break;
J	L_Sample_Ringbuffer194
NOP	
;Protocol.c,571 :: 		case 'F':
L_Sample_Ringbuffer201:
;Protocol.c,572 :: 		case 'f':
L_Sample_Ringbuffer202:
;Protocol.c,575 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 110(SP)
;Protocol.c,576 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 110
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,581 :: 		break;
J	L_Sample_Ringbuffer194
NOP	
;Protocol.c,583 :: 		}
L_Sample_Ringbuffer193:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer503:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer505:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer515:
L_Sample_Ringbuffer194:
;Protocol.c,584 :: 		}
L_Sample_Ringbuffer192:
;Protocol.c,585 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,586 :: 		case 'F':
L_Sample_Ringbuffer203:
;Protocol.c,588 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer516:
;Protocol.c,589 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 94
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,590 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 94
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 110(SP)
;Protocol.c,591 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 110
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,595 :: 		}
L_Sample_Ringbuffer204:
;Protocol.c,596 :: 		break;
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,598 :: 		}
L_Sample_Ringbuffer85:
LH	R4, 148(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer518:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer520:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer522:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer524:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer526:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer528:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer530:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer532:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer534:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer536:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer538:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer540:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer542:
L_Sample_Ringbuffer86:
;Protocol.c,299 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer248:
L__Sample_Ringbuffer247:
;Protocol.c,599 :: 		}
L_Sample_Ringbuffer81:
L_Sample_Ringbuffer15:
;Protocol.c,601 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer543:
;Protocol.c,602 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,603 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,604 :: 		}else if(query == 2){
L_Sample_Ringbuffer205:
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer544:
;Protocol.c,605 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 28(SP)
;Protocol.c,606 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,607 :: 		}else if(query == 3){
L_Sample_Ringbuffer207:
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer545:
;Protocol.c,608 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 28(SP)
;Protocol.c,609 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,610 :: 		}
L_Sample_Ringbuffer209:
;Protocol.c,612 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 28(SP)
;Protocol.c,613 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,615 :: 		if(!status)
LH	R2, 28(SP)
BEQ	R2, R0, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer546:
;Protocol.c,616 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer210:
;Protocol.c,619 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,622 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,623 :: 		}
;Protocol.c,622 :: 		return status;
;Protocol.c,623 :: 		}
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
;Protocol.c,628 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,630 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,631 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,632 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,633 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit211:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit548
NOP	
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit548:
;Protocol.c,634 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,635 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit550
NOP	
J	L_Protocol_strsplit229
NOP	
L_Protocol_strsplit550:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit552
NOP	
J	L_Protocol_strsplit228
NOP	
L_Protocol_strsplit552:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit553
NOP	
J	L_Protocol_strsplit227
NOP	
L_Protocol_strsplit553:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit229:
L_Protocol_strsplit228:
L_Protocol_strsplit227:
;Protocol.c,636 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,637 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,638 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,639 :: 		continue;
J	L_Protocol_strsplit213
NOP	
;Protocol.c,640 :: 		}else{
L_Protocol_strsplit216:
;Protocol.c,641 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,643 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit554
NOP	
J	L_Protocol_strsplit218
NOP	
L_Protocol_strsplit554:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,644 :: 		break;
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit218:
;Protocol.c,645 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit213:
;Protocol.c,633 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,645 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit212:
;Protocol.c,646 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,647 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,648 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,652 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,655 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,656 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,658 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,659 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str219:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str557
NOP	
J	L_Protocol_cpy_val_from_str220
NOP	
L_Protocol_cpy_val_from_str557:
;Protocol.c,660 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,661 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,662 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str219
NOP	
L_Protocol_cpy_val_from_str220:
;Protocol.c,663 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,665 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,666 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,671 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,673 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,675 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,677 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int221:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int559
NOP	
J	L_Protocol_str2int222
NOP	
L_Protocol_str2int559:
;Protocol.c,678 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,679 :: 		while(DMA_IsOn(1));
L_Protocol_str2int224:
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
BNE	R2, R0, L_Protocol_str2int561
NOP	
J	L_Protocol_str2int225
NOP	
L_Protocol_str2int561:
J	L_Protocol_str2int224
NOP	
L_Protocol_str2int225:
;Protocol.c,677 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,680 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int221
NOP	
L_Protocol_str2int222:
;Protocol.c,682 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,683 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
