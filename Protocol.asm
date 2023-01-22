_Str_Initialize:
;Protocol.c,10 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,12 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 11
BNE	R2, R0, L__Str_Initialize189
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize189:
;Protocol.c,13 :: 		memset(arg[i],0,str_size);
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SW	R25, 12(SP)
ORI	R27, R0, 60
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 12(SP)
;Protocol.c,12 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,14 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,15 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,17 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,18 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,19 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
_Sample_Ringbuffer:
;Protocol.c,23 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -104
SW	RA, 0(SP)
;Protocol.c,38 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,42 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)){
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Ringbuffer193
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer193:
;Protocol.c,43 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,44 :: 		report_realtime_status();
SH	R4, 20(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 20(SP)
;Protocol.c,45 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,47 :: 		if(dif == 0)
SEH	R2, R4
BEQ	R2, R0, L__Sample_Ringbuffer194
NOP	
J	L_Sample_Ringbuffer4
NOP	
L__Sample_Ringbuffer194:
; dif end address is: 16 (R4)
;Protocol.c,48 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer4:
;Protocol.c,49 :: 		else if(dif > 0){
; dif start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer195
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer195:
;Protocol.c,51 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,53 :: 		Str_clear(str,str_len);    //reset the string to empty
ADDIU	R2, SP, 24
SH	R4, 20(SP)
LH	R26, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R4, 20(SP)
;Protocol.c,54 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,55 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,58 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,69 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer196
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer196:
;Protocol.c,74 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,75 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,76 :: 		status = 0;
SH	R0, 22(SP)
;Protocol.c,77 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,78 :: 		}
L_Sample_Ringbuffer7:
;Protocol.c,80 :: 		if(gcode[0][0] =='$'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer197
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer197:
;Protocol.c,90 :: 		if(str_len == 2){
LH	R3, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer198
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer198:
;Protocol.c,91 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,92 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,93 :: 		status = 0;
SH	R0, 22(SP)
;Protocol.c,94 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,95 :: 		}
L_Sample_Ringbuffer9:
;Protocol.c,97 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,98 :: 		case '?': // Prints Grbl settings
L_Sample_Ringbuffer12:
;Protocol.c,100 :: 		sys.execute |= EXEC_STATUS_REPORT;
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
;Protocol.c,101 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,102 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,103 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,104 :: 		case '$': // Prints Grbl settings
L_Sample_Ringbuffer13:
;Protocol.c,106 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,107 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,108 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,109 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer14:
;Protocol.c,111 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,112 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,113 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,114 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer15:
;Protocol.c,117 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,118 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,121 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Ringbuffer199
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer199:
;Protocol.c,122 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LBU	R2, Offset(_sys+25)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_sys+25)(GP)
L_Sample_Ringbuffer16:
;Protocol.c,123 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,124 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer17:
;Protocol.c,128 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer200
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer200:
;Protocol.c,129 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,131 :: 		} else {
J	L_Sample_Ringbuffer19
NOP	
L_Sample_Ringbuffer18:
;Protocol.c,132 :: 		if (sys.state) { return(STATUS_IDLE_ERROR); }
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer202
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer202:
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
L_Sample_Ringbuffer20:
;Protocol.c,133 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SB	R2, Offset(_sys+1)(GP)
;Protocol.c,134 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,135 :: 		}
L_Sample_Ringbuffer19:
;Protocol.c,136 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,137 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer21:
;Protocol.c,139 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer203
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer203:
;Protocol.c,140 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,141 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,143 :: 		}
L_Sample_Ringbuffer22:
;Protocol.c,144 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,145 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,146 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer23:
;Protocol.c,147 :: 		if (bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer205:
;Protocol.c,149 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LBU	R2, Offset(_sys+1)(GP)
BNE	R2, R0, L__Sample_Ringbuffer207
NOP	
J	L__Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer207:
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer209
NOP	
J	L__Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer209:
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer182:
L__Sample_Ringbuffer181:
;Protocol.c,151 :: 		if (!sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer210
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer210:
;Protocol.c,153 :: 		} // Execute startup scripts after successful homing.
L_Sample_Ringbuffer28:
;Protocol.c,154 :: 		} else {
J	L_Sample_Ringbuffer29
NOP	
L_Sample_Ringbuffer27:
;Protocol.c,155 :: 		return(STATUS_IDLE_ERROR);
ORI	R2, R0, 11
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,156 :: 		}
L_Sample_Ringbuffer29:
;Protocol.c,157 :: 		} else {
J	L_Sample_Ringbuffer30
NOP	
L_Sample_Ringbuffer24:
;Protocol.c,158 :: 		return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,159 :: 		}
L_Sample_Ringbuffer30:
;Protocol.c,160 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,161 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer31:
;Protocol.c,162 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,163 :: 		default :  // Storing setting methods  */
L_Sample_Ringbuffer32:
;Protocol.c,164 :: 		break;
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,165 :: 		}
L_Sample_Ringbuffer10:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer212:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer214:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer216:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer218
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer218:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer220:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer222:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer224:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer226:
J	L_Sample_Ringbuffer32
NOP	
L_Sample_Ringbuffer11:
;Protocol.c,166 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
J	L_Sample_Ringbuffer33
NOP	
L_Sample_Ringbuffer8:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer227
NOP	
J	L__Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer227:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer228
NOP	
J	L__Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer228:
L__Sample_Ringbuffer179:
;Protocol.c,167 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 100(SP)
J	L_Sample_Ringbuffer37
NOP	
;Protocol.c,168 :: 		case 'G':case 'g':
L_Sample_Ringbuffer39:
L_Sample_Ringbuffer40:
;Protocol.c,170 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer229
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer229:
;Protocol.c,171 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,172 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer230:
;Protocol.c,173 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,176 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L__Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer232:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer234
NOP	
J	L__Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer234:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer236
NOP	
J	L__Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer236:
SEH	R2, R4
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer185:
L__Sample_Ringbuffer184:
L__Sample_Ringbuffer183:
;Protocol.c,177 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer45:
;Protocol.c,178 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer46
NOP	
L_Sample_Ringbuffer42:
;Protocol.c,180 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 74
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
;Protocol.c,181 :: 		}
L_Sample_Ringbuffer46:
;Protocol.c,183 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,193 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer238
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer238:
;Protocol.c,195 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,196 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer48
NOP	
;Protocol.c,197 :: 		case 'X':case 'x':
L_Sample_Ringbuffer50:
L_Sample_Ringbuffer51:
;Protocol.c,198 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer52:
L_Sample_Ringbuffer53:
;Protocol.c,199 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer54:
L_Sample_Ringbuffer55:
;Protocol.c,200 :: 		case 'A':case 'a':
L_Sample_Ringbuffer56:
L_Sample_Ringbuffer57:
;Protocol.c,201 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,202 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,206 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,207 :: 		case 'L':case 'l':
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer59:
;Protocol.c,208 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,209 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,213 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,214 :: 		case 'F':case 'f':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
;Protocol.c,215 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,216 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,220 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,221 :: 		case 'P':case 'p':
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
;Protocol.c,222 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,223 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,227 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,228 :: 		case 'S':case 's':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,229 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,230 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,234 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,235 :: 		}
L_Sample_Ringbuffer48:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer240:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer242
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer242:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer244
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer244:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer246
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer246:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer248:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer252:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer254:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer256
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer256:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer258:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer260:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer262:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer264:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer266:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer270:
L_Sample_Ringbuffer49:
;Protocol.c,236 :: 		}
L_Sample_Ringbuffer47:
;Protocol.c,241 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer272:
;Protocol.c,243 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,244 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer67
NOP	
;Protocol.c,245 :: 		case 'X':case 'x':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
;Protocol.c,246 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
;Protocol.c,247 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer73:
L_Sample_Ringbuffer74:
;Protocol.c,248 :: 		case 'A':case 'a':
L_Sample_Ringbuffer75:
L_Sample_Ringbuffer76:
;Protocol.c,249 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,250 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,254 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,255 :: 		case 'L':case 'l':
L_Sample_Ringbuffer77:
L_Sample_Ringbuffer78:
;Protocol.c,256 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,257 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,261 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,262 :: 		case 'F':case 'f':
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer80:
;Protocol.c,263 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,264 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,268 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,269 :: 		case 'P':case 'p':
L_Sample_Ringbuffer81:
L_Sample_Ringbuffer82:
;Protocol.c,270 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,271 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,275 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,276 :: 		case 'S':case 's':
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer84:
;Protocol.c,277 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,278 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,282 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,283 :: 		}
L_Sample_Ringbuffer67:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer276:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer278:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer280:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer282:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer284:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer286:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer288:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer300:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer304:
L_Sample_Ringbuffer68:
;Protocol.c,284 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,288 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer306:
;Protocol.c,290 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,291 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,292 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer88:
L_Sample_Ringbuffer89:
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
;Protocol.c,293 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer92:
L_Sample_Ringbuffer93:
L_Sample_Ringbuffer94:
L_Sample_Ringbuffer95:
;Protocol.c,294 :: 		case 'I':case 'i':
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
;Protocol.c,295 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,296 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,300 :: 		break;
J	L_Sample_Ringbuffer87
NOP	
;Protocol.c,301 :: 		case 'F': case 'f':
L_Sample_Ringbuffer98:
L_Sample_Ringbuffer99:
;Protocol.c,302 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,303 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,307 :: 		break;
J	L_Sample_Ringbuffer87
NOP	
;Protocol.c,308 :: 		}
L_Sample_Ringbuffer86:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer330:
L_Sample_Ringbuffer87:
;Protocol.c,309 :: 		}
L_Sample_Ringbuffer85:
;Protocol.c,314 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer332:
;Protocol.c,315 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+240)
ORI	R26, R26, lo_addr(_gcode+240)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,316 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,317 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
;Protocol.c,318 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
;Protocol.c,319 :: 		case 'J':case 'j':
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,320 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,321 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,325 :: 		break;
J	L_Sample_Ringbuffer102
NOP	
;Protocol.c,326 :: 		case 'F':case 'f':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
;Protocol.c,327 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,328 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,332 :: 		break;
J	L_Sample_Ringbuffer102
NOP	
;Protocol.c,334 :: 		}
L_Sample_Ringbuffer101:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer348:
L_Sample_Ringbuffer102:
;Protocol.c,335 :: 		}
L_Sample_Ringbuffer100:
;Protocol.c,339 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer350:
;Protocol.c,340 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,341 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+300)
ORI	R26, R26, lo_addr(_gcode+300)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,342 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer112
NOP	
;Protocol.c,343 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,344 :: 		case 'J':case 'j':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
;Protocol.c,345 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,346 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,350 :: 		break;
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,351 :: 		case 'F':case 'f':
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,352 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,353 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,357 :: 		break;
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,358 :: 		}
L_Sample_Ringbuffer112:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer352:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer354:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer356:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer358:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer360:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer362:
L_Sample_Ringbuffer113:
;Protocol.c,359 :: 		}
L_Sample_Ringbuffer111:
;Protocol.c,362 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer364:
;Protocol.c,363 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+360)
ORI	R26, R26, lo_addr(_gcode+360)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,364 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer121
NOP	
;Protocol.c,365 :: 		case 'J':case 'j':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,366 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,367 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,371 :: 		break;
J	L_Sample_Ringbuffer122
NOP	
;Protocol.c,372 :: 		case 'F':case 'f':
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,373 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,374 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,378 :: 		break;
J	L_Sample_Ringbuffer122
NOP	
;Protocol.c,380 :: 		}
L_Sample_Ringbuffer121:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer366:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer368:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer370:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer372:
L_Sample_Ringbuffer122:
;Protocol.c,381 :: 		}
L_Sample_Ringbuffer120:
;Protocol.c,382 :: 		}else {
J	L_Sample_Ringbuffer127
NOP	
L_Sample_Ringbuffer41:
;Protocol.c,383 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,384 :: 		}
L_Sample_Ringbuffer127:
;Protocol.c,385 :: 		break;
J	L_Sample_Ringbuffer38
NOP	
;Protocol.c,386 :: 		case 'M':
L_Sample_Ringbuffer128:
;Protocol.c,387 :: 		case 'm':
L_Sample_Ringbuffer129:
;Protocol.c,389 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,390 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,391 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,397 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer374:
;Protocol.c,398 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer131
NOP	
;Protocol.c,399 :: 		case 'S':
L_Sample_Ringbuffer133:
;Protocol.c,400 :: 		case 's':
L_Sample_Ringbuffer134:
;Protocol.c,402 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,403 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 96(SP)
;Protocol.c,404 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,408 :: 		break;
J	L_Sample_Ringbuffer132
NOP	
;Protocol.c,409 :: 		}
L_Sample_Ringbuffer131:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer376:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer378:
L_Sample_Ringbuffer132:
;Protocol.c,410 :: 		}
L_Sample_Ringbuffer130:
;Protocol.c,411 :: 		break;
J	L_Sample_Ringbuffer38
NOP	
;Protocol.c,412 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer135:
L_Sample_Ringbuffer136:
L_Sample_Ringbuffer137:
L_Sample_Ringbuffer138:
;Protocol.c,413 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer139:
L_Sample_Ringbuffer140:
L_Sample_Ringbuffer141:
L_Sample_Ringbuffer142:
;Protocol.c,414 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer379
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer379:
;Protocol.c,415 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,416 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,417 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,421 :: 		}
L_Sample_Ringbuffer143:
;Protocol.c,425 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer381
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer381:
;Protocol.c,426 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,427 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,428 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer145
NOP	
;Protocol.c,429 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer147:
L_Sample_Ringbuffer148:
;Protocol.c,430 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer149:
L_Sample_Ringbuffer150:
;Protocol.c,431 :: 		case 'A':case 'a':
L_Sample_Ringbuffer151:
L_Sample_Ringbuffer152:
;Protocol.c,432 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,433 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,437 :: 		break;
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,438 :: 		case 'F':
L_Sample_Ringbuffer153:
;Protocol.c,439 :: 		case 'f':
L_Sample_Ringbuffer154:
;Protocol.c,442 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,443 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,448 :: 		break;
J	L_Sample_Ringbuffer146
NOP	
;Protocol.c,450 :: 		}
L_Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer383
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer383:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer385
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer385:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer387
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer387:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer389
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer389:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer391
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer391:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer393
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer393:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer395
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer395:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer397
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer397:
L_Sample_Ringbuffer146:
;Protocol.c,451 :: 		}
L_Sample_Ringbuffer144:
;Protocol.c,452 :: 		break;
J	L_Sample_Ringbuffer38
NOP	
;Protocol.c,453 :: 		case 'F':
L_Sample_Ringbuffer155:
;Protocol.c,455 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer398
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer398:
;Protocol.c,456 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 74
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,457 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,458 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,462 :: 		}
L_Sample_Ringbuffer156:
;Protocol.c,463 :: 		break;
J	L_Sample_Ringbuffer38
NOP	
;Protocol.c,465 :: 		}
L_Sample_Ringbuffer37:
LH	R4, 100(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer400
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer400:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer402
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer402:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer404
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer404:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer406
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer406:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer408
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer408:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer410
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer410:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer412
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer412:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer414
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer414:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer416
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer416:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer418
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer418:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer420
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer420:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer422
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer422:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer424
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer424:
L_Sample_Ringbuffer38:
;Protocol.c,166 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){
L__Sample_Ringbuffer187:
L__Sample_Ringbuffer186:
;Protocol.c,466 :: 		}
L_Sample_Ringbuffer33:
;Protocol.c,468 :: 		if(query){
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer426
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer426:
;Protocol.c,469 :: 		status = 0;
SH	R0, 22(SP)
;Protocol.c,470 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,471 :: 		}
L_Sample_Ringbuffer157:
;Protocol.c,473 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,474 :: 		end:asm{NOP};
___Sample_Ringbuffer_end:
NOP	
;Protocol.c,476 :: 		if(!status)
LH	R2, 22(SP)
BEQ	R2, R0, L__Sample_Ringbuffer427
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer427:
;Protocol.c,477 :: 		report_status_message(status);
LH	R25, 22(SP)
JAL	_report_status_message+0
NOP	
L_Sample_Ringbuffer158:
;Protocol.c,480 :: 		}
L_Sample_Ringbuffer6:
;Protocol.c,483 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,484 :: 		}
;Protocol.c,483 :: 		return status;
;Protocol.c,484 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 104
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,489 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,491 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,492 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,493 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,494 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit159:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit429
NOP	
J	L_Protocol_strsplit160
NOP	
L_Protocol_strsplit429:
;Protocol.c,495 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,496 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit431
NOP	
J	L_Protocol_strsplit177
NOP	
L_Protocol_strsplit431:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit433
NOP	
J	L_Protocol_strsplit176
NOP	
L_Protocol_strsplit433:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit434
NOP	
J	L_Protocol_strsplit175
NOP	
L_Protocol_strsplit434:
J	L_Protocol_strsplit164
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit177:
L_Protocol_strsplit176:
L_Protocol_strsplit175:
;Protocol.c,497 :: 		arg[kk++][ii] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,498 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,499 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,500 :: 		continue;
J	L_Protocol_strsplit161
NOP	
;Protocol.c,501 :: 		}else{
L_Protocol_strsplit164:
;Protocol.c,502 :: 		arg[kk][ii++] = *(str+i);
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R8
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R8, 1
SEH	R8, R2
;Protocol.c,504 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit435
NOP	
J	L_Protocol_strsplit166
NOP	
L_Protocol_strsplit435:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,505 :: 		break;
J	L_Protocol_strsplit160
NOP	
L_Protocol_strsplit166:
;Protocol.c,506 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit161:
;Protocol.c,494 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,506 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit159
NOP	
L_Protocol_strsplit160:
;Protocol.c,507 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,508 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,509 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,513 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,516 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,517 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,519 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,520 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str167:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str438
NOP	
J	L_Protocol_cpy_val_from_str168
NOP	
L_Protocol_cpy_val_from_str438:
;Protocol.c,521 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,522 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,523 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str167
NOP	
L_Protocol_cpy_val_from_str168:
;Protocol.c,524 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,526 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,527 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,532 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,534 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,536 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,538 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int169:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int440
NOP	
J	L_Protocol_str2int170
NOP	
L_Protocol_str2int440:
;Protocol.c,539 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,540 :: 		while(DMA_IsOn(1));
L_Protocol_str2int172:
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
BNE	R2, R0, L_Protocol_str2int442
NOP	
J	L_Protocol_str2int173
NOP	
L_Protocol_str2int442:
J	L_Protocol_str2int172
NOP	
L_Protocol_str2int173:
;Protocol.c,538 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,541 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int169
NOP	
L_Protocol_str2int170:
;Protocol.c,543 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,544 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
