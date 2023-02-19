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
ADDIU	SP, SP, -144
SW	RA, 0(SP)
;Protocol.c,58 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,61 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer263
NOP	
J	L__Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer263:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer264
NOP	
J	L__Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer264:
; dif end address is: 16 (R4)
L__Sample_Ringbuffer238:
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
L__Sample_Ringbuffer240:
; dif start address is: 16 (R4)
L__Sample_Ringbuffer239:
;Protocol.c,68 :: 		if(dif == 0){
SEH	R2, R4
BEQ	R2, R0, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer265:
; dif end address is: 16 (R4)
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
; dif start address is: 16 (R4)
SEH	R2, R4
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
ADDIU	R2, SP, 26
SH	R4, 20(SP)
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R4, 20(SP)
;Protocol.c,89 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 26
SH	R4, 20(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,90 :: 		str_len = strlen(str);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,95 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 26
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
LH	R4, 20(SP)
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,111 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer271:
; dif end address is: 16 (R4)
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
; dif start address is: 16 (R4)
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer272:
; dif end address is: 16 (R4)
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
; dif start address is: 16 (R4)
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
; dif end address is: 16 (R4)
;Protocol.c,136 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,137 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,138 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,139 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,140 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,141 :: 		switch(gcode[0][1]){
; dif start address is: 16 (R4)
J	L_Sample_Ringbuffer18
NOP	
; dif end address is: 16 (R4)
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
; dif start address is: 16 (R4)
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,187 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer282:
;Protocol.c,188 :: 		int axis_to_home = 0;
; axis_to_home start address is: 20 (R5)
MOVZ	R5, R0, R0
;Protocol.c,190 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer284
NOP	
J	L__Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer284:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L__Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer286:
; axis_to_home end address is: 20 (R5)
; dif end address is: 16 (R4)
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer242:
; dif start address is: 16 (R4)
; axis_to_home start address is: 20 (R5)
L__Sample_Ringbuffer241:
;Protocol.c,191 :: 		while(axis_to_home != NoOfAxis){
; dif end address is: 16 (R4)
L_Sample_Ringbuffer35:
; axis_to_home end address is: 20 (R5)
; axis_to_home start address is: 20 (R5)
; dif start address is: 16 (R4)
SEH	R3, R5
ORI	R2, R0, 4
BNE	R3, R2, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer288:
;Protocol.c,192 :: 		axis_to_home = Home(axis_to_home);
SH	R4, 20(SP)
; axis_to_home end address is: 20 (R5)
SEH	R25, R5
JAL	_Home+0
NOP	
LH	R4, 20(SP)
; axis_to_home start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,193 :: 		LED2 = TMR.clock >> 3;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 3
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Protocol.c,194 :: 		if(Get_Difference() > 0){
SH	R5, 20(SP)
SH	R4, 22(SP)
JAL	_Get_Difference+0
NOP	
LH	R4, 22(SP)
LH	R5, 20(SP)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L__Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer289:
;Protocol.c,195 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 26
SH	R5, 20(SP)
SH	R4, 22(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,196 :: 		strsplit(gcode,str,0x20);
ADDIU	R2, SP, 26
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
; axis_to_home end address is: 20 (R5)
; dif end address is: 16 (R4)
LH	R4, 22(SP)
LH	R5, 20(SP)
;Protocol.c,198 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer38:
; axis_to_home start address is: 20 (R5)
; dif start address is: 16 (R4)
SH	R4, 20(SP)
SH	R5, 22(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R5, 22(SP)
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer291:
J	L_Sample_Ringbuffer38
NOP	
L_Sample_Ringbuffer39:
;Protocol.c,199 :: 		dma_printf("GCODE:= %s\n",gcode[0]);
ADDIU	R23, SP, 116
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 116
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SH	R4, 20(SP)
SH	R5, 22(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R5, 22(SP)
LH	R4, 20(SP)
;Protocol.c,202 :: 		if(gcode[0][1] == '!'){
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BEQ	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer292:
; axis_to_home end address is: 20 (R5)
; dif end address is: 16 (R4)
;Protocol.c,203 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Protocol.c,204 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,205 :: 		break;
J	L_Sample_Ringbuffer36
NOP	
;Protocol.c,206 :: 		}
L_Sample_Ringbuffer40:
;Protocol.c,208 :: 		if (sys.abort) {
; dif start address is: 16 (R4)
; axis_to_home start address is: 20 (R5)
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer294:
; axis_to_home end address is: 20 (R5)
; dif end address is: 16 (R4)
;Protocol.c,209 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,211 :: 		}
L_Sample_Ringbuffer41:
;Protocol.c,212 :: 		}
; dif start address is: 16 (R4)
; axis_to_home start address is: 20 (R5)
; dif end address is: 16 (R4)
J	L_Sample_Ringbuffer37
NOP	
; axis_to_home end address is: 20 (R5)
L__Sample_Ringbuffer254:
;Protocol.c,194 :: 		if(Get_Difference() > 0){
;Protocol.c,212 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,213 :: 		}
; axis_to_home start address is: 20 (R5)
; dif start address is: 16 (R4)
; axis_to_home end address is: 20 (R5)
; dif end address is: 16 (R4)
J	L_Sample_Ringbuffer35
NOP	
L_Sample_Ringbuffer36:
;Protocol.c,215 :: 		} else {
J	L_Sample_Ringbuffer42
NOP	
L_Sample_Ringbuffer34:
;Protocol.c,216 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,217 :: 		}
L_Sample_Ringbuffer42:
;Protocol.c,218 :: 		} else {
J	L_Sample_Ringbuffer43
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,219 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,220 :: 		}
L_Sample_Ringbuffer43:
;Protocol.c,221 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,223 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer44:
;Protocol.c,224 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,225 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer295:
;Protocol.c,226 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer46:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer296:
;Protocol.c,227 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer298:
;Protocol.c,228 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,229 :: 		} else {
J	L_Sample_Ringbuffer50
NOP	
L_Sample_Ringbuffer49:
;Protocol.c,230 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,231 :: 		}
L_Sample_Ringbuffer50:
;Protocol.c,226 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,236 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer46
NOP	
L_Sample_Ringbuffer47:
;Protocol.c,239 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,240 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,241 :: 		}else { // Store startup line
L_Sample_Ringbuffer45:
;Protocol.c,242 :: 		int N_Val = 0;
;Protocol.c,243 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,248 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer299
NOP	
J	L__Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer299:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer300
NOP	
J	L__Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer300:
L__Sample_Ringbuffer236:
;Protocol.c,249 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 128(SP)
MOVZ	R30, R0, R0
SB	R30, 129(SP)
;Protocol.c,251 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 128
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,252 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,259 :: 		}else {
J	L_Sample_Ringbuffer55
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,248 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer244:
L__Sample_Ringbuffer243:
;Protocol.c,260 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,262 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,263 :: 		}
L_Sample_Ringbuffer55:
;Protocol.c,266 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer302:
; helper_var end address is: 28 (R7)
;Protocol.c,267 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer304:
; N_Val end address is: 16 (R4)
;Protocol.c,270 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,271 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 26
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,279 :: 		str_len = strlen(str);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,284 :: 		}else{
J	L_Sample_Ringbuffer58
NOP	
L_Sample_Ringbuffer57:
;Protocol.c,285 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,293 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 26
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,294 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,295 :: 		}
L_Sample_Ringbuffer58:
;Protocol.c,297 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,299 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,300 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer59:
;Protocol.c,301 :: 		sys.execute |= EXEC_CYCLE_START;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,302 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,303 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer60:
;Protocol.c,304 :: 		sys.execute |= EXEC_FEED_HOLD;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,305 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,306 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer61:
;Protocol.c,307 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,308 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,310 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
L_Sample_Ringbuffer67:
;Protocol.c,311 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer68:
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
L_Sample_Ringbuffer71:
;Protocol.c,315 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L__Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L__Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer308:
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer246:
L__Sample_Ringbuffer245:
;Protocol.c,316 :: 		char str_val[9]={0};
ADDIU	R23, SP, 130
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,317 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,318 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,319 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer309
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer309:
;Protocol.c,321 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 130
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,322 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 130
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer311
NOP	
J	L__Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer311:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 130
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer255:
L_Sample_Ringbuffer76:
;Protocol.c,323 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 130
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,324 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer77
NOP	
L_Sample_Ringbuffer75:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L__Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer312:
;Protocol.c,326 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 130
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,327 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 130
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer314
NOP	
J	L__Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer314:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 130
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer256:
SEH	R5, R6
L_Sample_Ringbuffer79:
;Protocol.c,328 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 130
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,329 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 130
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
;Protocol.c,330 :: 		}
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer257:
;Protocol.c,324 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,330 :: 		}
L_Sample_Ringbuffer78:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer77:
;Protocol.c,333 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer315
NOP	
J	L__Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer315:
; value end address is: 8 (R2)
ADDIU	R2, SP, 130
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer317
NOP	
J	L__Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer317:
J	L_Sample_Ringbuffer82
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer248:
L__Sample_Ringbuffer247:
;Protocol.c,334 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,335 :: 		}
L_Sample_Ringbuffer82:
;Protocol.c,336 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 130
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,341 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,344 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,345 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,346 :: 		}
L_Sample_Ringbuffer74:
;Protocol.c,347 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,348 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,350 :: 		}
L_Sample_Ringbuffer18:
; dif start address is: 16 (R4)
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer319:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer321:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer329:
; dif end address is: 16 (R4)
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer331:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer333:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer335:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer347:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer349:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer353:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer355:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer357
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer357:
L_Sample_Ringbuffer19:
;Protocol.c,352 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer83
NOP	
L_Sample_Ringbuffer16:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer358
NOP	
J	L__Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer358:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer359
NOP	
J	L__Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer359:
L__Sample_Ringbuffer233:
;Protocol.c,353 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 140(SP)
J	L_Sample_Ringbuffer87
NOP	
;Protocol.c,354 :: 		case 'G':case 'g':
L_Sample_Ringbuffer89:
L_Sample_Ringbuffer90:
;Protocol.c,356 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer360:
;Protocol.c,357 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,358 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer361:
;Protocol.c,359 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,362 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L__Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer363:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer365
NOP	
J	L__Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer365:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L__Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer367:
SEH	R2, R4
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer251:
L__Sample_Ringbuffer250:
L__Sample_Ringbuffer249:
;Protocol.c,363 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer95:
;Protocol.c,364 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer96
NOP	
L_Sample_Ringbuffer92:
;Protocol.c,366 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 90
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
;Protocol.c,367 :: 		}
L_Sample_Ringbuffer96:
;Protocol.c,369 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,379 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer369:
;Protocol.c,381 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,382 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,383 :: 		case 'X':case 'x':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,384 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,385 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,386 :: 		case 'A':case 'a':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,387 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,388 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,392 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,393 :: 		case 'L':case 'l':
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,394 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,395 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,399 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,400 :: 		case 'F':case 'f':
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
;Protocol.c,401 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,402 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,406 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,407 :: 		case 'P':case 'p':
L_Sample_Ringbuffer112:
L_Sample_Ringbuffer113:
;Protocol.c,408 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,409 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,413 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,414 :: 		case 'S':case 's':
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,415 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,416 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,420 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,421 :: 		}
L_Sample_Ringbuffer98:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer373:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer375:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer377
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer377:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer379:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer381:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer383:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer385:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer387:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer389:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer391:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer393:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer395:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer397:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer399
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer399:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer401
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer401:
L_Sample_Ringbuffer99:
;Protocol.c,422 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,427 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer403
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer403:
;Protocol.c,429 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,430 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer117
NOP	
;Protocol.c,431 :: 		case 'X':case 'x':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,432 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,433 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,434 :: 		case 'A':case 'a':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,435 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,436 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,440 :: 		break;
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,441 :: 		case 'L':case 'l':
L_Sample_Ringbuffer127:
L_Sample_Ringbuffer128:
;Protocol.c,442 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,443 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,447 :: 		break;
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,448 :: 		case 'F':case 'f':
L_Sample_Ringbuffer129:
L_Sample_Ringbuffer130:
;Protocol.c,449 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,450 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,454 :: 		break;
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,455 :: 		case 'P':case 'p':
L_Sample_Ringbuffer131:
L_Sample_Ringbuffer132:
;Protocol.c,456 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,457 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,461 :: 		break;
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,462 :: 		case 'S':case 's':
L_Sample_Ringbuffer133:
L_Sample_Ringbuffer134:
;Protocol.c,463 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,464 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,468 :: 		break;
J	L_Sample_Ringbuffer118
NOP	
;Protocol.c,469 :: 		}
L_Sample_Ringbuffer117:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer405
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer405:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer407
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer407:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer409
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer409:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer411
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer411:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer413
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer413:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer415
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer415:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer417
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer417:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer419
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer419:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer421
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer421:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer423
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer423:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer425
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer425:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer427:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer429
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer429:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer431
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer431:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer433
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer433:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer435
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer435:
L_Sample_Ringbuffer118:
;Protocol.c,470 :: 		}
L_Sample_Ringbuffer116:
;Protocol.c,474 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer437
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer437:
;Protocol.c,476 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,477 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer136
NOP	
;Protocol.c,478 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
;Protocol.c,479 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,480 :: 		case 'I':case 'i':
L_Sample_Ringbuffer146:
L_Sample_Ringbuffer147:
;Protocol.c,481 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,482 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,486 :: 		break;
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,487 :: 		case 'F': case 'f':
L_Sample_Ringbuffer148:
L_Sample_Ringbuffer149:
;Protocol.c,488 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,489 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,493 :: 		break;
J	L_Sample_Ringbuffer137
NOP	
;Protocol.c,494 :: 		}
L_Sample_Ringbuffer136:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer439
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer439:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer441
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer441:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer443
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer443:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer445
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer445:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer447
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer447:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer449
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer449:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer451
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer451:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer453
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer453:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer455:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer457
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer457:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer459
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer459:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer461:
L_Sample_Ringbuffer137:
;Protocol.c,495 :: 		}
L_Sample_Ringbuffer135:
;Protocol.c,500 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer463:
;Protocol.c,501 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,502 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,503 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
;Protocol.c,504 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,505 :: 		case 'J':case 'j':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
;Protocol.c,506 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,507 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,511 :: 		break;
J	L_Sample_Ringbuffer152
NOP	
;Protocol.c,512 :: 		case 'F':case 'f':
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
;Protocol.c,513 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,514 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,518 :: 		break;
J	L_Sample_Ringbuffer152
NOP	
;Protocol.c,520 :: 		}
L_Sample_Ringbuffer151:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer465:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer467:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer469:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer471
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer471:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer473
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer473:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer475:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer477:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer479:
L_Sample_Ringbuffer152:
;Protocol.c,521 :: 		}
L_Sample_Ringbuffer150:
;Protocol.c,525 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer481:
;Protocol.c,526 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 99
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,527 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,528 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer162
NOP	
;Protocol.c,529 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,530 :: 		case 'J':case 'j':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,531 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,532 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,536 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,537 :: 		case 'F':case 'f':
L_Sample_Ringbuffer168:
L_Sample_Ringbuffer169:
;Protocol.c,538 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,539 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,543 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,544 :: 		}
L_Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer483:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer485:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer487:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer489:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer493:
L_Sample_Ringbuffer163:
;Protocol.c,545 :: 		}
L_Sample_Ringbuffer161:
;Protocol.c,548 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer495
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer495:
;Protocol.c,549 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,550 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer171
NOP	
;Protocol.c,551 :: 		case 'J':case 'j':
L_Sample_Ringbuffer173:
L_Sample_Ringbuffer174:
;Protocol.c,552 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,553 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,557 :: 		break;
J	L_Sample_Ringbuffer172
NOP	
;Protocol.c,558 :: 		case 'F':case 'f':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,559 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 108(SP)
;Protocol.c,560 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 108
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,564 :: 		break;
J	L_Sample_Ringbuffer172
NOP	
;Protocol.c,566 :: 		}
L_Sample_Ringbuffer171:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer497:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer499:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer501
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer501:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer503
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer503:
L_Sample_Ringbuffer172:
;Protocol.c,567 :: 		}
L_Sample_Ringbuffer170:
;Protocol.c,568 :: 		}else {
J	L_Sample_Ringbuffer177
NOP	
L_Sample_Ringbuffer91:
;Protocol.c,569 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,570 :: 		}
L_Sample_Ringbuffer177:
;Protocol.c,571 :: 		break;
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,572 :: 		case 'M':
L_Sample_Ringbuffer178:
;Protocol.c,573 :: 		case 'm':
L_Sample_Ringbuffer179:
;Protocol.c,575 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,576 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,577 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,583 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer505
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer505:
;Protocol.c,584 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer181
NOP	
;Protocol.c,585 :: 		case 'S':
L_Sample_Ringbuffer183:
;Protocol.c,586 :: 		case 's':
L_Sample_Ringbuffer184:
;Protocol.c,588 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,589 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 112(SP)
;Protocol.c,590 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,594 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,595 :: 		}
L_Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer507
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer507:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer509:
L_Sample_Ringbuffer182:
;Protocol.c,596 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,597 :: 		break;
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,598 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
L_Sample_Ringbuffer188:
;Protocol.c,599 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer189:
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
;Protocol.c,600 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer510:
;Protocol.c,601 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,602 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,603 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,607 :: 		}
L_Sample_Ringbuffer193:
;Protocol.c,611 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer512:
;Protocol.c,612 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 99
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,613 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,614 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer195
NOP	
;Protocol.c,615 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
;Protocol.c,616 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
;Protocol.c,617 :: 		case 'A':case 'a':
L_Sample_Ringbuffer201:
L_Sample_Ringbuffer202:
;Protocol.c,618 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 112(SP)
;Protocol.c,619 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 112
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,623 :: 		break;
J	L_Sample_Ringbuffer196
NOP	
;Protocol.c,624 :: 		case 'F':
L_Sample_Ringbuffer203:
;Protocol.c,625 :: 		case 'f':
L_Sample_Ringbuffer204:
;Protocol.c,628 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,629 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,634 :: 		break;
J	L_Sample_Ringbuffer196
NOP	
;Protocol.c,635 :: 		}
L_Sample_Ringbuffer195:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer514:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer516:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer518:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer520:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer522:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer524:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer526:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer528:
L_Sample_Ringbuffer196:
;Protocol.c,636 :: 		}
L_Sample_Ringbuffer194:
;Protocol.c,637 :: 		break;
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,638 :: 		case 'F':
L_Sample_Ringbuffer205:
;Protocol.c,640 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer529:
;Protocol.c,641 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 90
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,642 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 106(SP)
;Protocol.c,643 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 106
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,647 :: 		}
L_Sample_Ringbuffer206:
;Protocol.c,648 :: 		break;
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,650 :: 		}
L_Sample_Ringbuffer87:
LH	R4, 140(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer531:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer533:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer535:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer537
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer537:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer539
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer539:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer541:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer543:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer545:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer547:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer549:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer551:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer553:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer555:
L_Sample_Ringbuffer88:
;Protocol.c,352 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer253:
L__Sample_Ringbuffer252:
;Protocol.c,651 :: 		}
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer15:
;Protocol.c,653 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer556
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer556:
SH	R0, 24(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer207:
;Protocol.c,654 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer557:
ORI	R2, R0, 1
SH	R2, 24(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer209:
;Protocol.c,655 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer558
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer558:
ORI	R2, R0, 3
SH	R2, 24(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer211:
;Protocol.c,658 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 24(SP)
;Protocol.c,659 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,662 :: 		if(!status)
LH	R2, 24(SP)
BEQ	R2, R0, L__Sample_Ringbuffer559
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer559:
;Protocol.c,663 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer212:
;Protocol.c,664 :: 		}
L_Sample_Ringbuffer11:
;Protocol.c,667 :: 		return status;
LH	R2, 24(SP)
;Protocol.c,668 :: 		}
;Protocol.c,667 :: 		return status;
;Protocol.c,668 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 144
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,673 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,675 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,676 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,677 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,678 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit213:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit561
NOP	
J	L_Protocol_strsplit214
NOP	
L_Protocol_strsplit561:
;Protocol.c,679 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,680 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit563
NOP	
J	L_Protocol_strsplit231
NOP	
L_Protocol_strsplit563:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit565
NOP	
J	L_Protocol_strsplit230
NOP	
L_Protocol_strsplit565:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit566
NOP	
J	L_Protocol_strsplit229
NOP	
L_Protocol_strsplit566:
J	L_Protocol_strsplit218
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit231:
L_Protocol_strsplit230:
L_Protocol_strsplit229:
;Protocol.c,681 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,682 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,683 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,684 :: 		continue;
J	L_Protocol_strsplit215
NOP	
;Protocol.c,685 :: 		}else{
L_Protocol_strsplit218:
;Protocol.c,686 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,688 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit567
NOP	
J	L_Protocol_strsplit220
NOP	
L_Protocol_strsplit567:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,689 :: 		break;
J	L_Protocol_strsplit214
NOP	
L_Protocol_strsplit220:
;Protocol.c,690 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit215:
;Protocol.c,678 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,690 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit213
NOP	
L_Protocol_strsplit214:
;Protocol.c,691 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,692 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,693 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,697 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,700 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,701 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,703 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,704 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str221:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str570
NOP	
J	L_Protocol_cpy_val_from_str222
NOP	
L_Protocol_cpy_val_from_str570:
;Protocol.c,705 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,706 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,707 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str221
NOP	
L_Protocol_cpy_val_from_str222:
;Protocol.c,708 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,710 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,711 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,716 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,718 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,720 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,722 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int223:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int572
NOP	
J	L_Protocol_str2int224
NOP	
L_Protocol_str2int572:
;Protocol.c,723 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,724 :: 		while(DMA_IsOn(1));
L_Protocol_str2int226:
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
BNE	R2, R0, L_Protocol_str2int574
NOP	
J	L_Protocol_str2int227
NOP	
L_Protocol_str2int574:
J	L_Protocol_str2int226
NOP	
L_Protocol_str2int227:
;Protocol.c,722 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,725 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int223
NOP	
L_Protocol_str2int224:
;Protocol.c,727 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,728 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
