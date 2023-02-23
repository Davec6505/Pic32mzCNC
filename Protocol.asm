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
BNE	R2, R0, L__Str_Initialize259
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize259:
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
ADDIU	SP, SP, -148
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
BNE	R2, R0, L__Sample_Ringbuffer263
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer263:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer264
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer264:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer239:
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
L__Sample_Ringbuffer241:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer240:
;Protocol.c,68 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer265:
; dif end address is: 20 (R5)
;Protocol.c,70 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer267:
;Protocol.c,71 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,72 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer268:
;Protocol.c,77 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,78 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer269:
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
BEQ	R2, R0, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer270:
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
BEQ	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer271:
;Protocol.c,116 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,117 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,118 :: 		status = STATUS_OK;
SH	R0, 22(SP)
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
BEQ	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer272:
;Protocol.c,130 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,131 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer273
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer273:
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
BEQ	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer274:
;Protocol.c,135 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer275
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer275:
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
BEQ	R2, R0, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer276:
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
BEQ	R3, R2, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer277:
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
BNE	R2, R0, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer279:
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
BEQ	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer280:
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
BNE	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer282:
;Protocol.c,189 :: 		int axis_to_home = 0;
;Protocol.c,192 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer284
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer284:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer286:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer243:
L__Sample_Ringbuffer242:
;Protocol.c,193 :: 		int i = 0;
;Protocol.c,194 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,196 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,197 :: 		for(i=1;i<NoOfAxis;i++)
; i start address is: 12 (R3)
ORI	R3, R0, 1
; i end address is: 12 (R3)
L_Sample_Ringbuffer35:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer287:
;Protocol.c,198 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,197 :: 		for(i=1;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,198 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer35
NOP	
L_Sample_Ringbuffer36:
;Protocol.c,204 :: 		if (sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer289:
;Protocol.c,205 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,207 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,208 :: 		} else {
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,209 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,210 :: 		}
L_Sample_Ringbuffer39:
;Protocol.c,211 :: 		} else {
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,212 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,213 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,214 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,216 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer41:
;Protocol.c,217 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,218 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer290:
;Protocol.c,219 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer43:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer291:
;Protocol.c,220 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer293
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer293:
;Protocol.c,221 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,222 :: 		} else {
J	L_Sample_Ringbuffer47
NOP	
L_Sample_Ringbuffer46:
;Protocol.c,223 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,224 :: 		}
L_Sample_Ringbuffer47:
;Protocol.c,226 :: 		while(DMA_IsOn(1));
SEH	R4, R3
L_Sample_Ringbuffer48:
; helper_var end address is: 12 (R3)
; helper_var start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer295:
J	L_Sample_Ringbuffer48
NOP	
L_Sample_Ringbuffer49:
;Protocol.c,227 :: 		dma_printf("gcode[%d]:= %s\n",helper_var,gcode[0]);
ADDIU	R23, SP, 112
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 112
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SH	R4, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
SH	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R4, 20(SP)
;Protocol.c,219 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R4, 1
; helper_var end address is: 16 (R4)
; helper_var start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,229 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer43
NOP	
L_Sample_Ringbuffer44:
;Protocol.c,232 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,234 :: 		}else { // Store startup line
L_Sample_Ringbuffer42:
;Protocol.c,235 :: 		int N_Val = 0;
;Protocol.c,236 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,241 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer296
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer296:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer297
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer297:
L__Sample_Ringbuffer237:
;Protocol.c,242 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 128(SP)
MOVZ	R30, R0, R0
SB	R30, 129(SP)
;Protocol.c,244 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 128
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,245 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,252 :: 		}else {
J	L_Sample_Ringbuffer54
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,241 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer245:
L__Sample_Ringbuffer244:
;Protocol.c,253 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,254 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 22(SP)
;Protocol.c,255 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,256 :: 		}
L_Sample_Ringbuffer54:
;Protocol.c,259 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer299:
; helper_var end address is: 28 (R7)
;Protocol.c,260 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer301
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer301:
; N_Val end address is: 16 (R4)
;Protocol.c,263 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,264 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,272 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,277 :: 		}else{
J	L_Sample_Ringbuffer57
NOP	
L_Sample_Ringbuffer56:
;Protocol.c,278 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
; N_Val end address is: 16 (R4)
;Protocol.c,281 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer58:
; N_Val start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer303
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer303:
J	L_Sample_Ringbuffer58
NOP	
L_Sample_Ringbuffer59:
;Protocol.c,282 :: 		dma_printf("%s\n",str);
ADDIU	R3, SP, 24
ORI	R30, R0, 37
SB	R30, 130(SP)
ORI	R30, R0, 115
SB	R30, 131(SP)
ORI	R30, R0, 10
SB	R30, 132(SP)
MOVZ	R30, R0, R0
SB	R30, 133(SP)
ADDIU	R2, SP, 130
SH	R4, 20(SP)
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R4, 20(SP)
;Protocol.c,286 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,287 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,288 :: 		}
L_Sample_Ringbuffer57:
;Protocol.c,290 :: 		}
L_Sample_Ringbuffer55:
;Protocol.c,292 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,293 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer60:
;Protocol.c,294 :: 		sys.execute |= EXEC_CYCLE_START;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,295 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,296 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer61:
;Protocol.c,297 :: 		sys.execute |= EXEC_FEED_HOLD;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,298 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,299 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer62:
;Protocol.c,300 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,301 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,303 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
L_Sample_Ringbuffer68:
;Protocol.c,304 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
;Protocol.c,308 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer305:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer307
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer307:
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer247:
L__Sample_Ringbuffer246:
;Protocol.c,309 :: 		char str_val[9]={0};
ADDIU	R23, SP, 134
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,310 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,311 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,312 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer308:
;Protocol.c,314 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 134
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,315 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 134
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer310
NOP	
J	L__Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer310:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 134
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer255:
L_Sample_Ringbuffer77:
;Protocol.c,316 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 134
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,317 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer78
NOP	
L_Sample_Ringbuffer76:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L__Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer311:
;Protocol.c,319 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 134
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,320 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 134
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer313
NOP	
J	L__Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer313:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 134
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer256:
SEH	R5, R6
L_Sample_Ringbuffer80:
;Protocol.c,321 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 134
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,322 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 134
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
;Protocol.c,323 :: 		}
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer257:
;Protocol.c,317 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,323 :: 		}
L_Sample_Ringbuffer79:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer78:
;Protocol.c,326 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer314
NOP	
J	L__Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer314:
; value end address is: 8 (R2)
ADDIU	R2, SP, 134
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer316
NOP	
J	L__Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer316:
J	L_Sample_Ringbuffer83
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer249:
L__Sample_Ringbuffer248:
;Protocol.c,327 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,328 :: 		}
L_Sample_Ringbuffer83:
;Protocol.c,329 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 134
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,334 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,337 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,338 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,339 :: 		}
L_Sample_Ringbuffer75:
;Protocol.c,340 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,341 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,343 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer348:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer350:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer352:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer354:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer356:
L_Sample_Ringbuffer19:
;Protocol.c,345 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer84
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer357
NOP	
J	L__Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer357:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer358
NOP	
J	L__Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer358:
L__Sample_Ringbuffer234:
;Protocol.c,346 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 144(SP)
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,347 :: 		case 'G':case 'g':
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
;Protocol.c,349 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer359:
;Protocol.c,350 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,351 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer360:
;Protocol.c,352 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,355 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L__Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer362:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L__Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer364:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L__Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer366:
SEH	R2, R4
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer252:
L__Sample_Ringbuffer251:
L__Sample_Ringbuffer250:
;Protocol.c,356 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer96:
;Protocol.c,357 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer97
NOP	
L_Sample_Ringbuffer93:
;Protocol.c,359 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,360 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,362 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,372 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer368:
;Protocol.c,374 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,375 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,376 :: 		case 'X':case 'x':
L_Sample_Ringbuffer101:
L_Sample_Ringbuffer102:
;Protocol.c,377 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,378 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,379 :: 		case 'A':case 'a':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,380 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,381 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,385 :: 		break;
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,386 :: 		case 'L':case 'l':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,387 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,388 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,392 :: 		break;
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,393 :: 		case 'F':case 'f':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,394 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,395 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,399 :: 		break;
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,400 :: 		case 'P':case 'p':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,401 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,402 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,406 :: 		break;
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,407 :: 		case 'S':case 's':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,408 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,409 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,413 :: 		break;
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,414 :: 		}
L_Sample_Ringbuffer99:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer378:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer380:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer390:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer392:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer394:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer396:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer398:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer400:
L_Sample_Ringbuffer100:
;Protocol.c,415 :: 		}
L_Sample_Ringbuffer98:
;Protocol.c,420 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer402:
;Protocol.c,422 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,423 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,424 :: 		case 'X':case 'x':
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
;Protocol.c,425 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
;Protocol.c,426 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
;Protocol.c,427 :: 		case 'A':case 'a':
L_Sample_Ringbuffer126:
L_Sample_Ringbuffer127:
;Protocol.c,428 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,429 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,433 :: 		break;
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,434 :: 		case 'L':case 'l':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,435 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,436 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,440 :: 		break;
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,441 :: 		case 'F':case 'f':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,442 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,443 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,447 :: 		break;
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,448 :: 		case 'P':case 'p':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,449 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,450 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,454 :: 		break;
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,455 :: 		case 'S':case 's':
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
;Protocol.c,456 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,457 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,461 :: 		break;
J	L_Sample_Ringbuffer119
NOP	
;Protocol.c,462 :: 		}
L_Sample_Ringbuffer118:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer434:
L_Sample_Ringbuffer119:
;Protocol.c,463 :: 		}
L_Sample_Ringbuffer117:
;Protocol.c,467 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer436:
;Protocol.c,469 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,470 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,471 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,472 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
L_Sample_Ringbuffer146:
;Protocol.c,473 :: 		case 'I':case 'i':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,474 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,475 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,479 :: 		break;
J	L_Sample_Ringbuffer138
NOP	
;Protocol.c,480 :: 		case 'F': case 'f':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,481 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,482 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,486 :: 		break;
J	L_Sample_Ringbuffer138
NOP	
;Protocol.c,487 :: 		}
L_Sample_Ringbuffer137:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer460:
L_Sample_Ringbuffer138:
;Protocol.c,488 :: 		}
L_Sample_Ringbuffer136:
;Protocol.c,493 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer462:
;Protocol.c,494 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,495 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer152
NOP	
;Protocol.c,496 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer154:
L_Sample_Ringbuffer155:
;Protocol.c,497 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer156:
L_Sample_Ringbuffer157:
;Protocol.c,498 :: 		case 'J':case 'j':
L_Sample_Ringbuffer158:
L_Sample_Ringbuffer159:
;Protocol.c,499 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,500 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,504 :: 		break;
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,505 :: 		case 'F':case 'f':
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
;Protocol.c,506 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,507 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,511 :: 		break;
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,513 :: 		}
L_Sample_Ringbuffer152:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer466:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer468:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer470:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer472:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer478:
L_Sample_Ringbuffer153:
;Protocol.c,514 :: 		}
L_Sample_Ringbuffer151:
;Protocol.c,518 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer480:
;Protocol.c,519 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,520 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,521 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,522 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,523 :: 		case 'J':case 'j':
L_Sample_Ringbuffer167:
L_Sample_Ringbuffer168:
;Protocol.c,524 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,525 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,529 :: 		break;
J	L_Sample_Ringbuffer164
NOP	
;Protocol.c,530 :: 		case 'F':case 'f':
L_Sample_Ringbuffer169:
L_Sample_Ringbuffer170:
;Protocol.c,531 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,532 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,536 :: 		break;
J	L_Sample_Ringbuffer164
NOP	
;Protocol.c,537 :: 		}
L_Sample_Ringbuffer163:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer482:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer484:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer486:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer488:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer490:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer492:
L_Sample_Ringbuffer164:
;Protocol.c,538 :: 		}
L_Sample_Ringbuffer162:
;Protocol.c,541 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer494:
;Protocol.c,542 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,543 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer172
NOP	
;Protocol.c,544 :: 		case 'J':case 'j':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,545 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,546 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,550 :: 		break;
J	L_Sample_Ringbuffer173
NOP	
;Protocol.c,551 :: 		case 'F':case 'f':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,552 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,553 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,557 :: 		break;
J	L_Sample_Ringbuffer173
NOP	
;Protocol.c,559 :: 		}
L_Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer496
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer496:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer498
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer498:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer500
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer500:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer502
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer502:
L_Sample_Ringbuffer173:
;Protocol.c,560 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,561 :: 		}else {
J	L_Sample_Ringbuffer178
NOP	
L_Sample_Ringbuffer92:
;Protocol.c,562 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,563 :: 		}
L_Sample_Ringbuffer178:
;Protocol.c,564 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,565 :: 		case 'M':
L_Sample_Ringbuffer179:
;Protocol.c,566 :: 		case 'm':
L_Sample_Ringbuffer180:
;Protocol.c,568 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,569 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,570 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,576 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer504:
;Protocol.c,577 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,578 :: 		case 'S':
L_Sample_Ringbuffer184:
;Protocol.c,579 :: 		case 's':
L_Sample_Ringbuffer185:
;Protocol.c,581 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,582 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 108(SP)
;Protocol.c,583 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,587 :: 		break;
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,588 :: 		}
L_Sample_Ringbuffer182:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer506:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer508
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer508:
L_Sample_Ringbuffer183:
;Protocol.c,589 :: 		}
L_Sample_Ringbuffer181:
;Protocol.c,590 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,591 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
L_Sample_Ringbuffer189:
;Protocol.c,592 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,593 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer509:
;Protocol.c,594 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,595 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,596 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,600 :: 		}
L_Sample_Ringbuffer194:
;Protocol.c,604 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer511:
;Protocol.c,605 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,606 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,607 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer196
NOP	
;Protocol.c,608 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,609 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,610 :: 		case 'A':case 'a':
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,611 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 108(SP)
;Protocol.c,612 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,616 :: 		break;
J	L_Sample_Ringbuffer197
NOP	
;Protocol.c,617 :: 		case 'F':
L_Sample_Ringbuffer204:
;Protocol.c,618 :: 		case 'f':
L_Sample_Ringbuffer205:
;Protocol.c,621 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,622 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,627 :: 		break;
J	L_Sample_Ringbuffer197
NOP	
;Protocol.c,628 :: 		}
L_Sample_Ringbuffer196:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer519:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer521:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer523:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer525:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer527:
L_Sample_Ringbuffer197:
;Protocol.c,629 :: 		}
L_Sample_Ringbuffer195:
;Protocol.c,630 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,631 :: 		case 'F':
L_Sample_Ringbuffer206:
;Protocol.c,633 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer528:
;Protocol.c,634 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,635 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 104(SP)
;Protocol.c,636 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 104
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,640 :: 		}
L_Sample_Ringbuffer207:
;Protocol.c,641 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,643 :: 		}
L_Sample_Ringbuffer88:
LH	R4, 144(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer530:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer532:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer534:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer536:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer538:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer540:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer542:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer544:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer546
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer546:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer548:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer550
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer550:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer552
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer552:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer554
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer554:
L_Sample_Ringbuffer89:
;Protocol.c,345 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer254:
L__Sample_Ringbuffer253:
;Protocol.c,644 :: 		}
L_Sample_Ringbuffer84:
L_Sample_Ringbuffer15:
;Protocol.c,646 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer555:
SH	R0, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer208:
;Protocol.c,647 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer556
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer556:
ORI	R2, R0, 1
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer210:
;Protocol.c,648 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer557:
ORI	R2, R0, 3
SH	R2, 22(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer212:
;Protocol.c,651 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,652 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,655 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer558
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer558:
;Protocol.c,656 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer213:
;Protocol.c,657 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,660 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,661 :: 		}
;Protocol.c,660 :: 		return status;
;Protocol.c,661 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 148
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,666 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,668 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,669 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,670 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,671 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit214:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit560
NOP	
J	L_Protocol_strsplit215
NOP	
L_Protocol_strsplit560:
;Protocol.c,672 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,673 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit562
NOP	
J	L_Protocol_strsplit232
NOP	
L_Protocol_strsplit562:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit564
NOP	
J	L_Protocol_strsplit231
NOP	
L_Protocol_strsplit564:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit565
NOP	
J	L_Protocol_strsplit230
NOP	
L_Protocol_strsplit565:
J	L_Protocol_strsplit219
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit232:
L_Protocol_strsplit231:
L_Protocol_strsplit230:
;Protocol.c,674 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,675 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,676 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,677 :: 		continue;
J	L_Protocol_strsplit216
NOP	
;Protocol.c,678 :: 		}else{
L_Protocol_strsplit219:
;Protocol.c,679 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,681 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit566
NOP	
J	L_Protocol_strsplit221
NOP	
L_Protocol_strsplit566:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,682 :: 		break;
J	L_Protocol_strsplit215
NOP	
L_Protocol_strsplit221:
;Protocol.c,683 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit216:
;Protocol.c,671 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,683 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit214
NOP	
L_Protocol_strsplit215:
;Protocol.c,684 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,685 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,686 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,690 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,693 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,694 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,696 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,697 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str222:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str569
NOP	
J	L_Protocol_cpy_val_from_str223
NOP	
L_Protocol_cpy_val_from_str569:
;Protocol.c,698 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,699 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,700 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str222
NOP	
L_Protocol_cpy_val_from_str223:
;Protocol.c,701 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,703 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,704 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,709 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,711 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,713 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,715 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int224:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int571
NOP	
J	L_Protocol_str2int225
NOP	
L_Protocol_str2int571:
;Protocol.c,716 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,717 :: 		while(DMA_IsOn(1));
L_Protocol_str2int227:
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
BNE	R2, R0, L_Protocol_str2int573
NOP	
J	L_Protocol_str2int228
NOP	
L_Protocol_str2int573:
J	L_Protocol_str2int227
NOP	
L_Protocol_str2int228:
;Protocol.c,715 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,718 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int224
NOP	
L_Protocol_str2int225:
;Protocol.c,720 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,721 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
