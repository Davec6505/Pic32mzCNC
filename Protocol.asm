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
BNE	R2, R0, L__Str_Initialize283
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize283:
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
ADDIU	SP, SP, -208
SW	RA, 0(SP)
;Protocol.c,52 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,53 :: 		int axis_to_run = 0;
;Protocol.c,59 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,62 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L__Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer287:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L__Sample_Ringbuffer258
NOP	
L__Sample_Ringbuffer288:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer257:
;Protocol.c,63 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,64 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,65 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,66 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,62 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer259:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer258:
;Protocol.c,69 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer289
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer289:
; dif end address is: 20 (R5)
;Protocol.c,71 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer291
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer291:
;Protocol.c,72 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 16 (R4)
LUI	R4, 40960
ORI	R4, R4, 8192
;Protocol.c,73 :: 		if(*ptr == '?'){
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer292:
; ptr end address is: 16 (R4)
MOVZ	R3, R4, R0
;Protocol.c,75 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer9:
; ptr start address is: 12 (R3)
SW	R3, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer294:
J	L_Sample_Ringbuffer9
NOP	
L_Sample_Ringbuffer10:
;Protocol.c,76 :: 		dma_printf("%d\n",ptr);
ORI	R30, R0, 37
SB	R30, 117(SP)
ORI	R30, R0, 100
SB	R30, 118(SP)
ORI	R30, R0, 10
SB	R30, 119(SP)
MOVZ	R30, R0, R0
SB	R30, 120(SP)
ADDIU	R2, SP, 117
ADDIU	SP, SP, -8
SW	R3, 4(SP)
; ptr end address is: 12 (R3)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,78 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,79 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer295
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer295:
;Protocol.c,80 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer11:
;Protocol.c,81 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,82 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,83 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,84 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,85 :: 		}else if(dif > 0){
L_Sample_Ringbuffer6:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer296:
;Protocol.c,87 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,89 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 38
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,90 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 38
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,91 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,96 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 38
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
; num_of_strings start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,98 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
; num_of_strings end address is: 20 (R5)
SEH	R4, R5
;Protocol.c,101 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer14:
; num_of_strings start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer298:
J	L_Sample_Ringbuffer14
NOP	
L_Sample_Ringbuffer15:
;Protocol.c,102 :: 		dma_printf("noOfstrs:= %d\t%s:=\t%d\t%s:=\t%d\n"
ADDIU	R23, SP, 121
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 121
;Protocol.c,105 :: 		,gcode[1],str_len);
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	SP, SP, -24
SH	R2, 20(SP)
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
SW	R2, 16(SP)
;Protocol.c,104 :: 		,gcode[0],str_len
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SH	R2, 12(SP)
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SW	R2, 8(SP)
;Protocol.c,103 :: 		,num_of_strings
SH	R4, 4(SP)
; num_of_strings end address is: 16 (R4)
;Protocol.c,102 :: 		dma_printf("noOfstrs:= %d\t%s:=\t%d\t%s:=\t%d\n"
SW	R3, 0(SP)
;Protocol.c,105 :: 		,gcode[1],str_len);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 24
;Protocol.c,116 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer299
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer299:
;Protocol.c,121 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,122 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,123 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,124 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,125 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,127 :: 		}
L_Sample_Ringbuffer16:
;Protocol.c,134 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer300:
;Protocol.c,135 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,136 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer301
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer301:
;Protocol.c,137 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer18:
;Protocol.c,138 :: 		}else if(gcode[0][0] =='$'){
J	L_Sample_Ringbuffer19
NOP	
L_Sample_Ringbuffer17:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer302:
;Protocol.c,140 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer303
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer303:
;Protocol.c,141 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,142 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,143 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,144 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,145 :: 		}
L_Sample_Ringbuffer21:
;Protocol.c,146 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer22
NOP	
;Protocol.c,147 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer24:
;Protocol.c,148 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,149 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,150 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,151 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer25:
;Protocol.c,152 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,153 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,154 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,155 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer26:
;Protocol.c,157 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,158 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,159 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,162 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer304:
;Protocol.c,163 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
L_Sample_Ringbuffer27:
;Protocol.c,164 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,165 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer28:
;Protocol.c,166 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,170 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer305:
;Protocol.c,171 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,172 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,173 :: 		} else {
J	L_Sample_Ringbuffer30
NOP	
L_Sample_Ringbuffer29:
;Protocol.c,175 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer307:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer31:
;Protocol.c,177 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,178 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,179 :: 		}
L_Sample_Ringbuffer30:
;Protocol.c,180 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,181 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer32:
;Protocol.c,182 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,183 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer308:
;Protocol.c,184 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,185 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,187 :: 		}
L_Sample_Ringbuffer33:
;Protocol.c,188 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,189 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,190 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer34:
;Protocol.c,191 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,193 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer310:
;Protocol.c,194 :: 		int axis_to_home = 0;
;Protocol.c,197 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer312
NOP	
J	L__Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer312:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L__Sample_Ringbuffer260
NOP	
L__Sample_Ringbuffer314:
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer261:
L__Sample_Ringbuffer260:
;Protocol.c,198 :: 		int i = 0;
;Protocol.c,199 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,202 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,203 :: 		for(i=1;i<NoOfAxis;i++)
; i start address is: 12 (R3)
ORI	R3, R0, 1
; i end address is: 12 (R3)
L_Sample_Ringbuffer39:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer315:
;Protocol.c,204 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,203 :: 		for(i=1;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,204 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer39
NOP	
L_Sample_Ringbuffer40:
;Protocol.c,210 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer317:
;Protocol.c,211 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,213 :: 		}
L_Sample_Ringbuffer42:
;Protocol.c,214 :: 		} else {
J	L_Sample_Ringbuffer43
NOP	
L_Sample_Ringbuffer38:
;Protocol.c,215 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,216 :: 		}
L_Sample_Ringbuffer43:
;Protocol.c,217 :: 		} else {
J	L_Sample_Ringbuffer44
NOP	
L_Sample_Ringbuffer35:
;Protocol.c,218 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,219 :: 		}
L_Sample_Ringbuffer44:
;Protocol.c,220 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,222 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer45:
;Protocol.c,223 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,224 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer318:
;Protocol.c,225 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer47:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer319:
;Protocol.c,226 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer321:
;Protocol.c,227 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LH	R3, 20(SP)
;Protocol.c,228 :: 		} else {
J	L_Sample_Ringbuffer51
NOP	
L_Sample_Ringbuffer50:
;Protocol.c,229 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,230 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,232 :: 		while(DMA_IsOn(1));
SEH	R4, R3
L_Sample_Ringbuffer52:
; helper_var end address is: 12 (R3)
; helper_var start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer323:
J	L_Sample_Ringbuffer52
NOP	
L_Sample_Ringbuffer53:
;Protocol.c,233 :: 		dma_printf("gcode[%d]:= %s\n",helper_var,gcode[0]);
ADDIU	R23, SP, 152
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr3_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 152
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
;Protocol.c,225 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R4, 1
; helper_var end address is: 16 (R4)
; helper_var start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,235 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer47
NOP	
L_Sample_Ringbuffer48:
;Protocol.c,238 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,239 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,240 :: 		}else { // Store startup line
L_Sample_Ringbuffer46:
;Protocol.c,241 :: 		int N_Val = 0;
;Protocol.c,242 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,247 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer324
NOP	
J	L__Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer324:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer325
NOP	
J	L__Sample_Ringbuffer262
NOP	
L__Sample_Ringbuffer325:
L__Sample_Ringbuffer255:
;Protocol.c,248 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 175(SP)
MOVZ	R30, R0, R0
SB	R30, 176(SP)
;Protocol.c,250 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 175
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,251 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
SEH	R5, R7
;Protocol.c,254 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer58:
; N_Val start address is: 16 (R4)
; helper_var start address is: 20 (R5)
SH	R5, 20(SP)
SH	R4, 22(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 22(SP)
LH	R5, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer327:
J	L_Sample_Ringbuffer58
NOP	
L_Sample_Ringbuffer59:
;Protocol.c,255 :: 		dma_printf("%s\t%d\n",num,N_Val);
ADDIU	R3, SP, 175
ORI	R30, R0, 37
SB	R30, 168(SP)
ORI	R30, R0, 115
SB	R30, 169(SP)
ORI	R30, R0, 9
SB	R30, 170(SP)
ORI	R30, R0, 37
SB	R30, 171(SP)
ORI	R30, R0, 100
SB	R30, 172(SP)
ORI	R30, R0, 10
SB	R30, 173(SP)
MOVZ	R30, R0, R0
SB	R30, 174(SP)
ADDIU	R2, SP, 168
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
;Protocol.c,258 :: 		}else {
J	L_Sample_Ringbuffer60
NOP	
; helper_var end address is: 20 (R5)
; N_Val end address is: 16 (R4)
;Protocol.c,247 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer263:
L__Sample_Ringbuffer262:
;Protocol.c,259 :: 		query = 0; //report bad status
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,260 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 32(SP)
;Protocol.c,261 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,262 :: 		}
L_Sample_Ringbuffer60:
;Protocol.c,265 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 20 (R5)
BNE	R5, R0, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer329:
; helper_var end address is: 20 (R5)
;Protocol.c,266 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer331:
; N_Val end address is: 16 (R4)
;Protocol.c,269 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,270 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 38
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,272 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer63:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer333:
J	L_Sample_Ringbuffer63
NOP	
L_Sample_Ringbuffer64:
;Protocol.c,273 :: 		dma_printf("%s\n",str);
ADDIU	R3, SP, 38
ORI	R30, R0, 37
SB	R30, 177(SP)
ORI	R30, R0, 115
SB	R30, 178(SP)
ORI	R30, R0, 10
SB	R30, 179(SP)
MOVZ	R30, R0, R0
SB	R30, 180(SP)
ADDIU	R2, SP, 177
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,278 :: 		str_len = strlen(str);
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,283 :: 		}else{
J	L_Sample_Ringbuffer65
NOP	
L_Sample_Ringbuffer62:
;Protocol.c,284 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
; N_Val end address is: 16 (R4)
;Protocol.c,287 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer66:
; N_Val start address is: 16 (R4)
SH	R4, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer335:
J	L_Sample_Ringbuffer66
NOP	
L_Sample_Ringbuffer67:
;Protocol.c,288 :: 		dma_printf("%s\n",str);
ADDIU	R3, SP, 38
ORI	R30, R0, 37
SB	R30, 181(SP)
ORI	R30, R0, 115
SB	R30, 182(SP)
ORI	R30, R0, 10
SB	R30, 183(SP)
MOVZ	R30, R0, R0
SB	R30, 184(SP)
ADDIU	R2, SP, 181
SH	R4, 20(SP)
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R4, 20(SP)
;Protocol.c,292 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 38
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,293 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,294 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,296 :: 		}
L_Sample_Ringbuffer61:
;Protocol.c,298 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,299 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer68:
;Protocol.c,300 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,301 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,302 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer69:
;Protocol.c,303 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,304 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,305 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer70:
;Protocol.c,306 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,307 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,309 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
L_Sample_Ringbuffer73:
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer75:
L_Sample_Ringbuffer76:
;Protocol.c,310 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer77:
L_Sample_Ringbuffer78:
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer80:
;Protocol.c,314 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L__Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L__Sample_Ringbuffer264
NOP	
L__Sample_Ringbuffer339:
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer265:
L__Sample_Ringbuffer264:
;Protocol.c,315 :: 		char str_val[9]={0};
ADDIU	R23, SP, 195
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,316 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,317 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,318 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer340:
;Protocol.c,320 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 195
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,321 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 195
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer342
NOP	
J	L__Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer342:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 195
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 28 (R7)
SEH	R7, R2
; N_Val end address is: 28 (R7)
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer273:
SEH	R7, R6
L_Sample_Ringbuffer85:
;Protocol.c,322 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 28 (R7)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 195
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,323 :: 		}else if(gcode[0][3] == '='){
; N_Val end address is: 28 (R7)
J	L_Sample_Ringbuffer86
NOP	
L_Sample_Ringbuffer84:
; N_Val start address is: 24 (R6)
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L__Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer343:
;Protocol.c,325 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 195
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,326 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 195
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer345
NOP	
J	L__Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer345:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 195
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer274:
SEH	R5, R6
L_Sample_Ringbuffer88:
;Protocol.c,327 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 195
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,328 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 195
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
;Protocol.c,329 :: 		}
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer275:
;Protocol.c,323 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,329 :: 		}
L_Sample_Ringbuffer87:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer86:
;Protocol.c,332 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer346
NOP	
J	L__Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer346:
; value end address is: 8 (R2)
ADDIU	R2, SP, 195
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer348
NOP	
J	L__Sample_Ringbuffer266
NOP	
L__Sample_Ringbuffer348:
J	L_Sample_Ringbuffer91
NOP	
; N_Val end address is: 28 (R7)
L__Sample_Ringbuffer267:
L__Sample_Ringbuffer266:
;Protocol.c,333 :: 		return(STATUS_UNSUPPORTED_STATEMENT);
ORI	R2, R0, 3
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,334 :: 		}
L_Sample_Ringbuffer91:
;Protocol.c,335 :: 		value = atof(str_val);
; N_Val start address is: 28 (R7)
ADDIU	R2, SP, 195
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
; value start address is: 8 (R2)
MOV.S 	S1, S0
; N_Val end address is: 28 (R7)
; value end address is: 8 (R2)
SEH	R4, R7
MOV.S 	S16, S1
;Protocol.c,337 :: 		while(DMA_IsOn(1));
L_Sample_Ringbuffer92:
; value start address is: 128 (R32)
; N_Val start address is: 16 (R4)
SH	R4, 20(SP)
SWC1	S16, 24(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S16, 24(SP)
LH	R4, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer350:
J	L_Sample_Ringbuffer92
NOP	
L_Sample_Ringbuffer93:
;Protocol.c,338 :: 		dma_printf("%d\t%s\t%f\n",N_Val,str_val,value);
ADDIU	R3, SP, 195
ADDIU	R23, SP, 185
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr7_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr7_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 185
SH	R4, 20(SP)
SWC1	S16, 24(SP)
ADDIU	SP, SP, -16
SWC1	S16, 12(SP)
SW	R3, 8(SP)
SH	R4, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LWC1	S16, 24(SP)
LH	R4, 20(SP)
;Protocol.c,340 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S16
; value end address is: 128 (R32)
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,343 :: 		query = 1; //noneed to send erro report
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,344 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,345 :: 		}
L_Sample_Ringbuffer83:
;Protocol.c,346 :: 		query = 3;
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,347 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,349 :: 		}
L_Sample_Ringbuffer22:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer352:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer354:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer356:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer364:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer372:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer374:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer378:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer380:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer382:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer384
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer384:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer386
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer386:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer388
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer388:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer390
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer390:
L_Sample_Ringbuffer23:
;Protocol.c,351 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer20:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer391
NOP	
J	L__Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer391:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer392
NOP	
J	L__Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer392:
L__Sample_Ringbuffer252:
;Protocol.c,352 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 204(SP)
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,353 :: 		case 'G':case 'g':
L_Sample_Ringbuffer100:
L_Sample_Ringbuffer101:
;Protocol.c,355 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer393:
;Protocol.c,356 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,357 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer394
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer394:
;Protocol.c,358 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,361 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer396
NOP	
J	L__Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer396:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L__Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer398:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L__Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer400:
SEH	R2, R4
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer270:
L__Sample_Ringbuffer269:
L__Sample_Ringbuffer268:
;Protocol.c,362 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer106:
;Protocol.c,363 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer107
NOP	
L_Sample_Ringbuffer103:
;Protocol.c,365 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 102
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
;Protocol.c,366 :: 		}
L_Sample_Ringbuffer107:
;Protocol.c,368 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,378 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer402:
;Protocol.c,383 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,384 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer109
NOP	
;Protocol.c,385 :: 		case 'X':case 'x':
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,386 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer113:
L_Sample_Ringbuffer114:
;Protocol.c,387 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
;Protocol.c,388 :: 		case 'A':case 'a':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,389 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,390 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,394 :: 		break;
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,395 :: 		case 'L':case 'l':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,396 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,397 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,401 :: 		break;
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,402 :: 		case 'F':case 'f':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,403 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,404 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,408 :: 		break;
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,409 :: 		case 'P':case 'p':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,410 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,411 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,415 :: 		break;
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,416 :: 		case 'S':case 's':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,417 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,418 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,422 :: 		break;
J	L_Sample_Ringbuffer110
NOP	
;Protocol.c,423 :: 		}
L_Sample_Ringbuffer109:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer404:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer406:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer408:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer410:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer412:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer414:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer416:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer418:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer420:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer422:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer424:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer426:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer428
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer428:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer430
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer430:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer432
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer432:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer434
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer434:
L_Sample_Ringbuffer110:
;Protocol.c,424 :: 		}
L_Sample_Ringbuffer108:
;Protocol.c,429 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer436
NOP	
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer436:
;Protocol.c,431 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,432 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer128
NOP	
;Protocol.c,433 :: 		case 'X':case 'x':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,434 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,435 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer134:
L_Sample_Ringbuffer135:
;Protocol.c,436 :: 		case 'A':case 'a':
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
;Protocol.c,437 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,438 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,442 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,443 :: 		case 'L':case 'l':
L_Sample_Ringbuffer138:
L_Sample_Ringbuffer139:
;Protocol.c,444 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,445 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,449 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,450 :: 		case 'F':case 'f':
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
;Protocol.c,451 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,452 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,456 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,457 :: 		case 'P':case 'p':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,458 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,459 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,463 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,464 :: 		case 'S':case 's':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,465 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,466 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,470 :: 		break;
J	L_Sample_Ringbuffer129
NOP	
;Protocol.c,471 :: 		}
L_Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer438
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer438:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer440
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer440:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer442
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer442:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer444
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer444:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer446
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer446:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer448
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer448:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer450
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer450:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer452
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer452:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer454
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer454:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer456
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer456:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer458:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer460:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer462:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer464:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer466:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer468:
L_Sample_Ringbuffer129:
;Protocol.c,472 :: 		}
L_Sample_Ringbuffer127:
;Protocol.c,476 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer470:
;Protocol.c,478 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,479 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer147
NOP	
;Protocol.c,480 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,481 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer153:
L_Sample_Ringbuffer154:
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,482 :: 		case 'I':case 'i':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
;Protocol.c,483 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,484 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,488 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,489 :: 		case 'F': case 'f':
L_Sample_Ringbuffer159:
L_Sample_Ringbuffer160:
;Protocol.c,490 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,491 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,495 :: 		break;
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,496 :: 		}
L_Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer472:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer474:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer476:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer478
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer478:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer480:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer482:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer484:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer486:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer488:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer490
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer490:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer492:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer494:
L_Sample_Ringbuffer148:
;Protocol.c,497 :: 		}
L_Sample_Ringbuffer146:
;Protocol.c,502 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer496
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer496:
;Protocol.c,503 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,504 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer162
NOP	
;Protocol.c,505 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,506 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,507 :: 		case 'J':case 'j':
L_Sample_Ringbuffer168:
L_Sample_Ringbuffer169:
;Protocol.c,508 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,509 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,513 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,514 :: 		case 'F':case 'f':
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
;Protocol.c,515 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,516 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,520 :: 		break;
J	L_Sample_Ringbuffer163
NOP	
;Protocol.c,522 :: 		}
L_Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer498
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer498:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer500
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer500:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer502
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer502:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer504:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer506:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer508
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer508:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer510:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer512:
L_Sample_Ringbuffer163:
;Protocol.c,523 :: 		}
L_Sample_Ringbuffer161:
;Protocol.c,527 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer514:
;Protocol.c,528 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,529 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,530 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer173
NOP	
;Protocol.c,531 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer175:
L_Sample_Ringbuffer176:
;Protocol.c,532 :: 		case 'J':case 'j':
L_Sample_Ringbuffer177:
L_Sample_Ringbuffer178:
;Protocol.c,533 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,534 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,538 :: 		break;
J	L_Sample_Ringbuffer174
NOP	
;Protocol.c,539 :: 		case 'F':case 'f':
L_Sample_Ringbuffer179:
L_Sample_Ringbuffer180:
;Protocol.c,540 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,541 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,545 :: 		break;
J	L_Sample_Ringbuffer174
NOP	
;Protocol.c,546 :: 		}
L_Sample_Ringbuffer173:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer516:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer518:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer520:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer522:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer524:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer526:
L_Sample_Ringbuffer174:
;Protocol.c,547 :: 		}
L_Sample_Ringbuffer172:
;Protocol.c,550 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer528:
;Protocol.c,551 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,552 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,553 :: 		case 'J':case 'j':
L_Sample_Ringbuffer184:
L_Sample_Ringbuffer185:
;Protocol.c,554 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,555 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,559 :: 		break;
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,560 :: 		case 'F':case 'f':
L_Sample_Ringbuffer186:
L_Sample_Ringbuffer187:
;Protocol.c,561 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 36(SP)
;Protocol.c,562 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 36
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,566 :: 		break;
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,568 :: 		}
L_Sample_Ringbuffer182:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer530:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer532:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer534:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer536:
L_Sample_Ringbuffer183:
;Protocol.c,569 :: 		}
L_Sample_Ringbuffer181:
;Protocol.c,570 :: 		}else {
J	L_Sample_Ringbuffer188
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,571 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,572 :: 		}
L_Sample_Ringbuffer188:
;Protocol.c,573 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,574 :: 		case 'M':
L_Sample_Ringbuffer189:
;Protocol.c,575 :: 		case 'm':
L_Sample_Ringbuffer190:
;Protocol.c,577 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,578 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,579 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,585 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer538:
;Protocol.c,586 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer192
NOP	
;Protocol.c,587 :: 		case 'S':
L_Sample_Ringbuffer194:
;Protocol.c,588 :: 		case 's':
L_Sample_Ringbuffer195:
;Protocol.c,590 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,591 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 28(SP)
;Protocol.c,592 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,596 :: 		break;
J	L_Sample_Ringbuffer193
NOP	
;Protocol.c,597 :: 		}
L_Sample_Ringbuffer192:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer542:
L_Sample_Ringbuffer193:
;Protocol.c,598 :: 		}
L_Sample_Ringbuffer191:
;Protocol.c,599 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,600 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,601 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,602 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer543:
;Protocol.c,603 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,604 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,605 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,609 :: 		}
L_Sample_Ringbuffer204:
;Protocol.c,613 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer545:
;Protocol.c,614 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 111
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,615 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,616 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer206
NOP	
;Protocol.c,617 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
;Protocol.c,618 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer210:
L_Sample_Ringbuffer211:
;Protocol.c,619 :: 		case 'A':case 'a':
L_Sample_Ringbuffer212:
L_Sample_Ringbuffer213:
;Protocol.c,620 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 28(SP)
;Protocol.c,621 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,625 :: 		break;
J	L_Sample_Ringbuffer207
NOP	
;Protocol.c,626 :: 		case 'F':
L_Sample_Ringbuffer214:
;Protocol.c,627 :: 		case 'f':
L_Sample_Ringbuffer215:
;Protocol.c,630 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 34(SP)
;Protocol.c,631 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 34
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,636 :: 		break;
J	L_Sample_Ringbuffer207
NOP	
;Protocol.c,637 :: 		}
L_Sample_Ringbuffer206:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer547:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer549:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer551
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer551:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer553:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer555:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer557:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L_Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer559:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer561
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer561:
L_Sample_Ringbuffer207:
;Protocol.c,638 :: 		}
L_Sample_Ringbuffer205:
;Protocol.c,639 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,640 :: 		case 'F':
L_Sample_Ringbuffer216:
;Protocol.c,642 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer562
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer562:
;Protocol.c,643 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 102
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,644 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 102
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 34(SP)
;Protocol.c,645 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 34
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 32(SP)
;Protocol.c,649 :: 		}
L_Sample_Ringbuffer217:
;Protocol.c,650 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,652 :: 		}
L_Sample_Ringbuffer98:
LH	R4, 204(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer564
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer564:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer566
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer566:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer568
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer568:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer570:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer572
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer572:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer574
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer574:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer576
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer576:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer578
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer578:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer580
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer580:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer582
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer582:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer584
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer584:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer586
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer586:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer588:
L_Sample_Ringbuffer99:
;Protocol.c,351 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer272:
L__Sample_Ringbuffer271:
;Protocol.c,653 :: 		}
L_Sample_Ringbuffer94:
L_Sample_Ringbuffer19:
;Protocol.c,655 :: 		if(query == 1){     status = STATUS_OK;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer589
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer589:
SH	R0, 32(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer218:
;Protocol.c,656 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer590:
ORI	R2, R0, 1
SH	R2, 32(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer220:
;Protocol.c,657 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer591
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer591:
ORI	R2, R0, 3
SH	R2, 32(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer222:
;Protocol.c,660 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 32(SP)
;Protocol.c,661 :: 		end:
___Sample_Ringbuffer_end:
;Protocol.c,664 :: 		if(!status)
LH	R2, 32(SP)
BEQ	R2, R0, L__Sample_Ringbuffer592
NOP	
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer592:
;Protocol.c,665 :: 		report_status_message(status);
LH	R25, 32(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer223:
;Protocol.c,666 :: 		}
L_Sample_Ringbuffer13:
;Protocol.c,669 :: 		return status;
LH	R2, 32(SP)
;Protocol.c,670 :: 		}
;Protocol.c,669 :: 		return status;
;Protocol.c,670 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 208
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,676 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,678 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,679 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,680 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,681 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit224:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit594
NOP	
J	L_Protocol_strsplit225
NOP	
L_Protocol_strsplit594:
;Protocol.c,682 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,683 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit596
NOP	
J	L_Protocol_strsplit250
NOP	
L_Protocol_strsplit596:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit598
NOP	
J	L_Protocol_strsplit249
NOP	
L_Protocol_strsplit598:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit599
NOP	
J	L_Protocol_strsplit248
NOP	
L_Protocol_strsplit599:
J	L_Protocol_strsplit229
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit250:
L_Protocol_strsplit249:
L_Protocol_strsplit248:
;Protocol.c,684 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,685 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,686 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,687 :: 		continue;
J	L_Protocol_strsplit226
NOP	
;Protocol.c,688 :: 		}else{
L_Protocol_strsplit229:
;Protocol.c,689 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,691 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit600
NOP	
J	L_Protocol_strsplit231
NOP	
L_Protocol_strsplit600:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,692 :: 		break;
J	L_Protocol_strsplit225
NOP	
L_Protocol_strsplit231:
;Protocol.c,693 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit226:
;Protocol.c,681 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,693 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit225:
;Protocol.c,694 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,695 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,696 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,701 :: 		static int strsplit2(char arg[arr_size][str_size],char *str){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,703 :: 		Str_Initialize(arg);
JAL	_Str_Initialize+0
NOP	
;Protocol.c,704 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,705 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,706 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit2232:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2602
NOP	
J	L_Protocol_strsplit2281
NOP	
L_Protocol_strsplit2602:
;Protocol.c,707 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,708 :: 		if(*(str+i) < 0x30 || *(str+i) > 0x39 || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_strsplit2603
NOP	
J	L_Protocol_strsplit2280
NOP	
L_Protocol_strsplit2603:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_strsplit2604
NOP	
J	L_Protocol_strsplit2279
NOP	
L_Protocol_strsplit2604:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2606
NOP	
J	L_Protocol_strsplit2278
NOP	
L_Protocol_strsplit2606:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2607
NOP	
J	L_Protocol_strsplit2277
NOP	
L_Protocol_strsplit2607:
J	L_Protocol_strsplit2237
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit2280:
L_Protocol_strsplit2279:
L_Protocol_strsplit2278:
L_Protocol_strsplit2277:
;Protocol.c,709 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,710 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,711 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,713 :: 		}else{
J	L_Protocol_strsplit2238
NOP	
L_Protocol_strsplit2237:
;Protocol.c,714 :: 		arg[kk][ii++] = *(str+i);
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
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
;Protocol.c,715 :: 		}
L_Protocol_strsplit2238:
;Protocol.c,716 :: 		if(*(str+i)==0)
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2608
NOP	
J	L_Protocol_strsplit2239
NOP	
L_Protocol_strsplit2608:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,717 :: 		break;
SEH	R3, R6
J	L_Protocol_strsplit2233
NOP	
L_Protocol_strsplit2239:
;Protocol.c,706 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,718 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
J	L_Protocol_strsplit2232
NOP	
L_Protocol_strsplit2281:
;Protocol.c,706 :: 		for (i = 0; i < len;i++){
SEH	R3, R6
;Protocol.c,718 :: 		}
L_Protocol_strsplit2233:
;Protocol.c,719 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,720 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,721 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,725 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,728 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,729 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,731 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,732 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str240:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str611
NOP	
J	L_Protocol_cpy_val_from_str241
NOP	
L_Protocol_cpy_val_from_str611:
;Protocol.c,733 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,734 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,735 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str240
NOP	
L_Protocol_cpy_val_from_str241:
;Protocol.c,736 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,738 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,739 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,744 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,746 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,748 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,750 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int242:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int613
NOP	
J	L_Protocol_str2int243
NOP	
L_Protocol_str2int613:
;Protocol.c,751 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,752 :: 		while(DMA_IsOn(1));
L_Protocol_str2int245:
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
BNE	R2, R0, L_Protocol_str2int615
NOP	
J	L_Protocol_str2int246
NOP	
L_Protocol_str2int615:
J	L_Protocol_str2int245
NOP	
L_Protocol_str2int246:
;Protocol.c,750 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,753 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int242
NOP	
L_Protocol_str2int243:
;Protocol.c,755 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,756 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
