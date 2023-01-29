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
SLTI	R2, R2, 11
BNE	R2, R0, L__Str_Initialize219
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize219:
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
ADDIU	SP, SP, -124
SW	RA, 0(SP)
;Protocol.c,39 :: 		dif = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
SH	R0, 104(SP)
;Protocol.c,40 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
SH	R2, 104(SP)
;Protocol.c,43 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer223
NOP	
J	L__Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer223:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer224
NOP	
J	L__Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer224:
L__Sample_Ringbuffer206:
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
L__Sample_Ringbuffer208:
L__Sample_Ringbuffer207:
;Protocol.c,50 :: 		if(dif == 0){
LH	R2, 104(SP)
BEQ	R2, R0, L__Sample_Ringbuffer225
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer225:
;Protocol.c,52 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer227
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer227:
;Protocol.c,53 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,54 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer228:
;Protocol.c,59 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,60 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer229
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer229:
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
LH	R2, 104(SP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer230:
;Protocol.c,68 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,70 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 24
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,71 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
LH	R26, 104(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,72 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,74 :: 		START_LINE://label to rerun startup line if it has one
___Sample_Ringbuffer_START_LINE:
;Protocol.c,77 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
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
BEQ	R3, R2, L__Sample_Ringbuffer231
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer231:
;Protocol.c,98 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,99 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,100 :: 		status = STATUS_OK;
SH	R0, 22(SP)
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
BEQ	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer232:
;Protocol.c,112 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,113 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer233
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer233:
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
BEQ	R3, R2, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer234:
;Protocol.c,116 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer235
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer235:
;Protocol.c,117 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,118 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,119 :: 		status = STATUS_OK;
SH	R0, 22(SP)
;Protocol.c,120 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,121 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,122 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,123 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer20:
;Protocol.c,124 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,125 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,126 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,127 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer21:
;Protocol.c,128 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,129 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,130 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,131 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer22:
;Protocol.c,133 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,134 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,135 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,138 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer236:
;Protocol.c,139 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer23:
;Protocol.c,140 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,141 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer24:
;Protocol.c,142 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,146 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer237
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer237:
;Protocol.c,147 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,148 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,149 :: 		} else {
J	L_Sample_Ringbuffer26
NOP	
L_Sample_Ringbuffer25:
;Protocol.c,151 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer239
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer239:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,153 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SB	R2, Offset(_sys+1)(GP)
;Protocol.c,154 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,155 :: 		}
L_Sample_Ringbuffer26:
;Protocol.c,156 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,157 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer28:
;Protocol.c,158 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,159 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer240:
;Protocol.c,160 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,161 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,163 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,164 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,165 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,166 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer30:
;Protocol.c,167 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,168 :: 		if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer242
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer242:
;Protocol.c,170 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer244
NOP	
J	L__Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer244:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer246
NOP	
J	L__Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer246:
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer210:
L__Sample_Ringbuffer209:
;Protocol.c,172 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer247
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer247:
;Protocol.c,174 :: 		} // Execute startup scripts after successful homing.
L_Sample_Ringbuffer35:
;Protocol.c,175 :: 		} else {
J	L_Sample_Ringbuffer36
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,176 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,177 :: 		}
L_Sample_Ringbuffer36:
;Protocol.c,178 :: 		} else {
J	L_Sample_Ringbuffer37
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,179 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,180 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,181 :: 		break; //'H'
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,182 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer38:
;Protocol.c,183 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,184 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer248:
;Protocol.c,185 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer40:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer249
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer249:
;Protocol.c,186 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer251
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer251:
;Protocol.c,187 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,188 :: 		} else {
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer43:
;Protocol.c,189 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,190 :: 		}
L_Sample_Ringbuffer44:
;Protocol.c,192 :: 		while(DMA_IsOn(1));
SEH	R4, R3
L_Sample_Ringbuffer45:
; helper_var end address is: 12 (R3)
; helper_var start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer253
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer253:
J	L_Sample_Ringbuffer45
NOP	
L_Sample_Ringbuffer46:
;Protocol.c,193 :: 		dma_printf("%s\n",gcode[0]);
ORI	R30, R0, 37
SB	R30, 116(SP)
ORI	R30, R0, 115
SB	R30, 117(SP)
ORI	R30, R0, 10
SB	R30, 118(SP)
MOVZ	R30, R0, R0
SB	R30, 119(SP)
ADDIU	R3, SP, 116
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SH	R4, 20(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R4, 20(SP)
;Protocol.c,185 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R4, 1
; helper_var end address is: 16 (R4)
; helper_var start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,195 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer40
NOP	
L_Sample_Ringbuffer41:
;Protocol.c,198 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,199 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,200 :: 		} else { // Store startup line
L_Sample_Ringbuffer39:
;Protocol.c,201 :: 		int N_Val = 0;
;Protocol.c,202 :: 		helper_var = true;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,205 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer254
NOP	
J	L__Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer254:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer255
NOP	
J	L__Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer255:
L__Sample_Ringbuffer204:
;Protocol.c,206 :: 		N_Val = atoi(gcode[2]);
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
;Protocol.c,212 :: 		}else {
J	L_Sample_Ringbuffer51
NOP	
; N_Val end address is: 24 (R6)
; helper_var end address is: 28 (R7)
;Protocol.c,205 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer212:
L__Sample_Ringbuffer211:
;Protocol.c,213 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,214 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 22(SP)
;Protocol.c,215 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,216 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,219 :: 		if (helper_var) { // Store startup line
; helper_var start address is: 28 (R7)
; N_Val start address is: 24 (R6)
BNE	R7, R0, L__Sample_Ringbuffer257
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer257:
; helper_var end address is: 28 (R7)
;Protocol.c,220 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer259:
; N_Val end address is: 24 (R6)
;Protocol.c,222 :: 		helper_var = strlen((gcode[0]+4)); // Set helper variable as counter to start of gcode block
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
;Protocol.c,223 :: 		strncpy(str,(gcode[0]+4),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+4)
ORI	R26, R26, lo_addr(_gcode+4)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,227 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,230 :: 		if(!strncmp(SL,str,2))
ADDIU	R2, SP, 24
ORI	R27, R0, 2
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SL+0)
ORI	R25, R25, lo_addr(_SL+0)
JAL	_strncmp+0
NOP	
BEQ	R2, R0, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer260:
;Protocol.c,231 :: 		goto START_LINE;
J	___Sample_Ringbuffer_START_LINE
NOP	
L_Sample_Ringbuffer54:
;Protocol.c,232 :: 		}else{
J	L_Sample_Ringbuffer55
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,235 :: 		helper_var = strlen((gcode[0]+4));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
; helper_var start address is: 28 (R7)
SEH	R7, R2
;Protocol.c,236 :: 		strncpy(str,(gcode[0]+4),helper_var);
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_gcode+4)
ORI	R26, R26, lo_addr(_gcode+4)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,237 :: 		str[helper_var] = 0;
ADDIU	R3, SP, 24
SEH	R2, R7
; helper_var end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,238 :: 		settings_store_startup_line(N_Val,str);
MOVZ	R26, R3, R0
SEH	R25, R6
; N_Val end address is: 24 (R6)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,239 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,240 :: 		}
L_Sample_Ringbuffer55:
;Protocol.c,242 :: 		}else{ // Store global setting.
J	L_Sample_Ringbuffer56
NOP	
L_Sample_Ringbuffer52:
;Protocol.c,246 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,248 :: 		break; //'N'
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,250 :: 		}
L_Sample_Ringbuffer18:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer262:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer264:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer266:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer270:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer272:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer274:
L_Sample_Ringbuffer19:
;Protocol.c,252 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer57
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer275
NOP	
J	L__Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer275:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer276
NOP	
J	L__Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer276:
L__Sample_Ringbuffer203:
;Protocol.c,253 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 120(SP)
J	L_Sample_Ringbuffer61
NOP	
;Protocol.c,254 :: 		case 'G':case 'g':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
;Protocol.c,256 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer277:
;Protocol.c,257 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,258 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer278:
;Protocol.c,259 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,262 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L__Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer280:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L__Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer282:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L__Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer284:
SEH	R2, R4
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer215:
L__Sample_Ringbuffer214:
L__Sample_Ringbuffer213:
;Protocol.c,263 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer69:
;Protocol.c,264 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer70
NOP	
L_Sample_Ringbuffer66:
;Protocol.c,266 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,267 :: 		}
L_Sample_Ringbuffer70:
;Protocol.c,269 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,279 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer286:
;Protocol.c,281 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,282 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer72
NOP	
;Protocol.c,283 :: 		case 'X':case 'x':
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer75:
;Protocol.c,284 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer76:
L_Sample_Ringbuffer77:
;Protocol.c,285 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer78:
L_Sample_Ringbuffer79:
;Protocol.c,286 :: 		case 'A':case 'a':
L_Sample_Ringbuffer80:
L_Sample_Ringbuffer81:
;Protocol.c,287 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,288 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,292 :: 		break;
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,293 :: 		case 'L':case 'l':
L_Sample_Ringbuffer82:
L_Sample_Ringbuffer83:
;Protocol.c,294 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,295 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,299 :: 		break;
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,300 :: 		case 'F':case 'f':
L_Sample_Ringbuffer84:
L_Sample_Ringbuffer85:
;Protocol.c,301 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,302 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,306 :: 		break;
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,307 :: 		case 'P':case 'p':
L_Sample_Ringbuffer86:
L_Sample_Ringbuffer87:
;Protocol.c,308 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,309 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,313 :: 		break;
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,314 :: 		case 'S':case 's':
L_Sample_Ringbuffer88:
L_Sample_Ringbuffer89:
;Protocol.c,315 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,316 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,320 :: 		break;
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,321 :: 		}
L_Sample_Ringbuffer72:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer288:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer300:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer304:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer318:
L_Sample_Ringbuffer73:
;Protocol.c,322 :: 		}
L_Sample_Ringbuffer71:
;Protocol.c,327 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer320:
;Protocol.c,329 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,330 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer91
NOP	
;Protocol.c,331 :: 		case 'X':case 'x':
L_Sample_Ringbuffer93:
L_Sample_Ringbuffer94:
;Protocol.c,332 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
;Protocol.c,333 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,334 :: 		case 'A':case 'a':
L_Sample_Ringbuffer99:
L_Sample_Ringbuffer100:
;Protocol.c,335 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,336 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,340 :: 		break;
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,341 :: 		case 'L':case 'l':
L_Sample_Ringbuffer101:
L_Sample_Ringbuffer102:
;Protocol.c,342 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,343 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,347 :: 		break;
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,348 :: 		case 'F':case 'f':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,349 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,350 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,354 :: 		break;
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,355 :: 		case 'P':case 'p':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,356 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,357 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,361 :: 		break;
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,362 :: 		case 'S':case 's':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,363 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,364 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,368 :: 		break;
J	L_Sample_Ringbuffer92
NOP	
;Protocol.c,369 :: 		}
L_Sample_Ringbuffer91:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer330:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer348:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer350:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer352:
L_Sample_Ringbuffer92:
;Protocol.c,370 :: 		}
L_Sample_Ringbuffer90:
;Protocol.c,374 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer354:
;Protocol.c,376 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,377 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,378 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,379 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,380 :: 		case 'I':case 'i':
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
;Protocol.c,381 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,382 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,386 :: 		break;
J	L_Sample_Ringbuffer111
NOP	
;Protocol.c,387 :: 		case 'F': case 'f':
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
;Protocol.c,388 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,389 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,393 :: 		break;
J	L_Sample_Ringbuffer111
NOP	
;Protocol.c,394 :: 		}
L_Sample_Ringbuffer110:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer356:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer378:
L_Sample_Ringbuffer111:
;Protocol.c,395 :: 		}
L_Sample_Ringbuffer109:
;Protocol.c,400 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer380:
;Protocol.c,401 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,402 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer125
NOP	
;Protocol.c,403 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer127:
L_Sample_Ringbuffer128:
;Protocol.c,404 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
;Protocol.c,405 :: 		case 'J':case 'j':
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,406 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,407 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,411 :: 		break;
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,412 :: 		case 'F':case 'f':
L_Sample_Ringbuffer133:
L_Sample_Ringbuffer134:
;Protocol.c,413 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,414 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,418 :: 		break;
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,420 :: 		}
L_Sample_Ringbuffer125:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer390:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer392
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer392:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer394:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer396:
L_Sample_Ringbuffer126:
;Protocol.c,421 :: 		}
L_Sample_Ringbuffer124:
;Protocol.c,425 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer398:
;Protocol.c,426 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,427 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,428 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer136
NOP	
;Protocol.c,429 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
;Protocol.c,430 :: 		case 'J':case 'j':
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
;Protocol.c,431 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,432 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,436 :: 		break;
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,437 :: 		case 'F':case 'f':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,438 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,439 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,443 :: 		break;
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,444 :: 		}
L_Sample_Ringbuffer136:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer400:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer402:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer410:
L_Sample_Ringbuffer137:
;Protocol.c,445 :: 		}
L_Sample_Ringbuffer135:
;Protocol.c,448 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer412:
;Protocol.c,449 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,450 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer145
NOP	
;Protocol.c,451 :: 		case 'J':case 'j':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,452 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,453 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,457 :: 		break;
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,458 :: 		case 'F':case 'f':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,459 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,460 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,464 :: 		break;
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,466 :: 		}
L_Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer420:
L_Sample_Ringbuffer146:
;Protocol.c,467 :: 		}
L_Sample_Ringbuffer144:
;Protocol.c,468 :: 		}else {
J	L_Sample_Ringbuffer151
NOP	
L_Sample_Ringbuffer65:
;Protocol.c,469 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,470 :: 		}
L_Sample_Ringbuffer151:
;Protocol.c,471 :: 		break;
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,472 :: 		case 'M':
L_Sample_Ringbuffer152:
;Protocol.c,473 :: 		case 'm':
L_Sample_Ringbuffer153:
;Protocol.c,475 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,476 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,477 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,483 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer422:
;Protocol.c,484 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,485 :: 		case 'S':
L_Sample_Ringbuffer157:
;Protocol.c,486 :: 		case 's':
L_Sample_Ringbuffer158:
;Protocol.c,488 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,489 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 112(SP)
;Protocol.c,490 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,494 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,495 :: 		}
L_Sample_Ringbuffer155:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer426:
L_Sample_Ringbuffer156:
;Protocol.c,496 :: 		}
L_Sample_Ringbuffer154:
;Protocol.c,497 :: 		break;
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,498 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
L_Sample_Ringbuffer161:
L_Sample_Ringbuffer162:
;Protocol.c,499 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer163:
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
L_Sample_Ringbuffer166:
;Protocol.c,500 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,501 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,502 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,503 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,507 :: 		}
L_Sample_Ringbuffer167:
;Protocol.c,511 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer429:
;Protocol.c,512 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 97
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,513 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,514 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer169
NOP	
;Protocol.c,515 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer171:
L_Sample_Ringbuffer172:
;Protocol.c,516 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,517 :: 		case 'A':case 'a':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,518 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,519 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,523 :: 		break;
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,524 :: 		case 'F':
L_Sample_Ringbuffer177:
;Protocol.c,525 :: 		case 'f':
L_Sample_Ringbuffer178:
;Protocol.c,528 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,529 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,534 :: 		break;
J	L_Sample_Ringbuffer170
NOP	
;Protocol.c,536 :: 		}
L_Sample_Ringbuffer169:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer431:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer435:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer437:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer445:
L_Sample_Ringbuffer170:
;Protocol.c,537 :: 		}
L_Sample_Ringbuffer168:
;Protocol.c,538 :: 		break;
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,539 :: 		case 'F':
L_Sample_Ringbuffer179:
;Protocol.c,541 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer446:
;Protocol.c,542 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,543 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 88
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,544 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 22(SP)
;Protocol.c,548 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,549 :: 		break;
J	L_Sample_Ringbuffer62
NOP	
;Protocol.c,551 :: 		}
L_Sample_Ringbuffer61:
LH	R4, 120(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer448:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer450:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer452:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer454:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer456:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer458:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer460:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer462:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer464:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer466:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer468:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer470:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer472:
L_Sample_Ringbuffer62:
;Protocol.c,252 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer217:
L__Sample_Ringbuffer216:
;Protocol.c,552 :: 		}
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer15:
;Protocol.c,554 :: 		if(query == 1){
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer473:
;Protocol.c,555 :: 		status = STATUS_OK;
SH	R0, 22(SP)
;Protocol.c,556 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,557 :: 		}
L_Sample_Ringbuffer181:
;Protocol.c,559 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,560 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,562 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer474:
;Protocol.c,563 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer182:
;Protocol.c,566 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,569 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,570 :: 		}
;Protocol.c,569 :: 		return status;
;Protocol.c,570 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 124
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,575 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,577 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,578 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,579 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,580 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit183:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit476
NOP	
J	L_Protocol_strsplit184
NOP	
L_Protocol_strsplit476:
;Protocol.c,581 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,582 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit478
NOP	
J	L_Protocol_strsplit201
NOP	
L_Protocol_strsplit478:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit480
NOP	
J	L_Protocol_strsplit200
NOP	
L_Protocol_strsplit480:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit481
NOP	
J	L_Protocol_strsplit199
NOP	
L_Protocol_strsplit481:
J	L_Protocol_strsplit188
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit201:
L_Protocol_strsplit200:
L_Protocol_strsplit199:
;Protocol.c,583 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,584 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,585 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,586 :: 		continue;
J	L_Protocol_strsplit185
NOP	
;Protocol.c,587 :: 		}else{
L_Protocol_strsplit188:
;Protocol.c,588 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,590 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit482
NOP	
J	L_Protocol_strsplit190
NOP	
L_Protocol_strsplit482:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,591 :: 		break;
J	L_Protocol_strsplit184
NOP	
L_Protocol_strsplit190:
;Protocol.c,592 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit185:
;Protocol.c,580 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,592 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit183
NOP	
L_Protocol_strsplit184:
;Protocol.c,593 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,594 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,595 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,599 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,602 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,603 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,605 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,606 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str191:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str485
NOP	
J	L_Protocol_cpy_val_from_str192
NOP	
L_Protocol_cpy_val_from_str485:
;Protocol.c,607 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,608 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,609 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str191
NOP	
L_Protocol_cpy_val_from_str192:
;Protocol.c,610 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,612 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,613 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,618 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,620 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,622 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,624 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int193:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int487
NOP	
J	L_Protocol_str2int194
NOP	
L_Protocol_str2int487:
;Protocol.c,625 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,626 :: 		while(DMA_IsOn(1));
L_Protocol_str2int196:
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
BNE	R2, R0, L_Protocol_str2int489
NOP	
J	L_Protocol_str2int197
NOP	
L_Protocol_str2int489:
J	L_Protocol_str2int196
NOP	
L_Protocol_str2int197:
;Protocol.c,624 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,627 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int193
NOP	
L_Protocol_str2int194:
;Protocol.c,629 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,630 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
