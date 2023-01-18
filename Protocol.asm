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
BNE	R2, R0, L__Str_Initialize163
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize163:
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
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;Protocol.c,38 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,40 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer166:
;Protocol.c,42 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,44 :: 		Str_clear(str,str_len);    //reset the string to empty
ADDIU	R2, SP, 22
LH	R26, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,45 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 22
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,46 :: 		str_len = strlen(str);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,48 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 22
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,54 :: 		if((*(*gcode+0)+0)=='$'){
LBU	R2, Offset(_gcode+0)(GP)
SEH	R3, R2
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer167
NOP	
J	L_Sample_Ringbuffer4
NOP	
L__Sample_Ringbuffer167:
;Protocol.c,61 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,62 :: 		case '?': // Prints Grbl settings
L_Sample_Ringbuffer7:
;Protocol.c,64 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,65 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,66 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,67 :: 		case '$': // Prints Grbl settings
L_Sample_Ringbuffer8:
;Protocol.c,69 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,70 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,71 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,72 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer9:
;Protocol.c,74 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,75 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,76 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,77 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer10:
;Protocol.c,80 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,81 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,82 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,83 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer11:
;Protocol.c,84 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,85 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer12:
;Protocol.c,87 :: 		if (sys.state == STATE_ALARM) {
LBU	R3, Offset(_sys+1)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer168:
;Protocol.c,88 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,89 :: 		sys.state = STATE_IDLE;
SB	R0, Offset(_sys+1)(GP)
;Protocol.c,91 :: 		}
L_Sample_Ringbuffer13:
;Protocol.c,92 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,93 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,94 :: 		case 'H' : // Perform homing cycle
L_Sample_Ringbuffer14:
;Protocol.c,95 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,96 :: 		case 'N' : // Startup lines.
L_Sample_Ringbuffer15:
;Protocol.c,97 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,98 :: 		default :  // Storing setting methods
L_Sample_Ringbuffer16:
;Protocol.c,99 :: 		break;
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,100 :: 		}
L_Sample_Ringbuffer5:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer172
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer174
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer174:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer176
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer176:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer178
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer178:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer180
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer180:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer182
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer182:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer184
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer184:
J	L_Sample_Ringbuffer16
NOP	
L_Sample_Ringbuffer6:
;Protocol.c,101 :: 		}else{
J	L_Sample_Ringbuffer17
NOP	
L_Sample_Ringbuffer4:
;Protocol.c,102 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 96(SP)
J	L_Sample_Ringbuffer18
NOP	
;Protocol.c,103 :: 		case 'G':case 'g':
L_Sample_Ringbuffer20:
L_Sample_Ringbuffer21:
;Protocol.c,105 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer185
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer185:
;Protocol.c,106 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,107 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer186
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer186:
;Protocol.c,108 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,111 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer188
NOP	
J	L__Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer188:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer190
NOP	
J	L__Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer190:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer192
NOP	
J	L__Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer192:
SEH	R2, R4
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer161:
L__Sample_Ringbuffer160:
L__Sample_Ringbuffer159:
;Protocol.c,112 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer26:
;Protocol.c,113 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer27
NOP	
L_Sample_Ringbuffer23:
;Protocol.c,115 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 72
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
;Protocol.c,116 :: 		}
L_Sample_Ringbuffer27:
;Protocol.c,118 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,128 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer194
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer194:
;Protocol.c,130 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,131 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer29
NOP	
;Protocol.c,132 :: 		case 'X':case 'x':
L_Sample_Ringbuffer31:
L_Sample_Ringbuffer32:
;Protocol.c,133 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer33:
L_Sample_Ringbuffer34:
;Protocol.c,134 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer35:
L_Sample_Ringbuffer36:
;Protocol.c,135 :: 		case 'A':case 'a':
L_Sample_Ringbuffer37:
L_Sample_Ringbuffer38:
;Protocol.c,136 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,137 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,141 :: 		break;
J	L_Sample_Ringbuffer30
NOP	
;Protocol.c,142 :: 		case 'L':case 'l':
L_Sample_Ringbuffer39:
L_Sample_Ringbuffer40:
;Protocol.c,143 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,144 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,148 :: 		break;
J	L_Sample_Ringbuffer30
NOP	
;Protocol.c,149 :: 		case 'F':case 'f':
L_Sample_Ringbuffer41:
L_Sample_Ringbuffer42:
;Protocol.c,150 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,151 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,155 :: 		break;
J	L_Sample_Ringbuffer30
NOP	
;Protocol.c,156 :: 		case 'P':case 'p':
L_Sample_Ringbuffer43:
L_Sample_Ringbuffer44:
;Protocol.c,157 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,158 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,162 :: 		break;
J	L_Sample_Ringbuffer30
NOP	
;Protocol.c,163 :: 		case 'S':case 's':
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer46:
;Protocol.c,164 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,165 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,169 :: 		break;
J	L_Sample_Ringbuffer30
NOP	
;Protocol.c,170 :: 		}
L_Sample_Ringbuffer29:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer196
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer196:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer198
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer198:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer200
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer200:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer202
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer202:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer204
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer204:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer206
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer206:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer208
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer208:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer210
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer210:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer212:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer214:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer216:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer218
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer218:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer220:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer222:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer224:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer226:
L_Sample_Ringbuffer30:
;Protocol.c,171 :: 		}
L_Sample_Ringbuffer28:
;Protocol.c,176 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer228:
;Protocol.c,178 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,179 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer48
NOP	
;Protocol.c,180 :: 		case 'X':case 'x':
L_Sample_Ringbuffer50:
L_Sample_Ringbuffer51:
;Protocol.c,181 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer52:
L_Sample_Ringbuffer53:
;Protocol.c,182 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer54:
L_Sample_Ringbuffer55:
;Protocol.c,183 :: 		case 'A':case 'a':
L_Sample_Ringbuffer56:
L_Sample_Ringbuffer57:
;Protocol.c,184 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,185 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,189 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,190 :: 		case 'L':case 'l':
L_Sample_Ringbuffer58:
L_Sample_Ringbuffer59:
;Protocol.c,191 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,192 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,196 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,197 :: 		case 'F':case 'f':
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
;Protocol.c,198 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,199 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,203 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,204 :: 		case 'P':case 'p':
L_Sample_Ringbuffer62:
L_Sample_Ringbuffer63:
;Protocol.c,205 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,206 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,210 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,211 :: 		case 'S':case 's':
L_Sample_Ringbuffer64:
L_Sample_Ringbuffer65:
;Protocol.c,212 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,213 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,217 :: 		break;
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,218 :: 		}
L_Sample_Ringbuffer48:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer230:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer232:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer234:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer236:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer238
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer238:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer240:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer242
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer242:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer244
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer244:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer246
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer246:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer248:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer252:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer254:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer256
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer256:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer258:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer260:
L_Sample_Ringbuffer49:
;Protocol.c,219 :: 		}
L_Sample_Ringbuffer47:
;Protocol.c,223 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer262:
;Protocol.c,225 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,226 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer67
NOP	
;Protocol.c,227 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
;Protocol.c,228 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer73:
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer75:
L_Sample_Ringbuffer76:
;Protocol.c,229 :: 		case 'I':case 'i':
L_Sample_Ringbuffer77:
L_Sample_Ringbuffer78:
;Protocol.c,230 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,231 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,235 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,236 :: 		case 'F': case 'f':
L_Sample_Ringbuffer79:
L_Sample_Ringbuffer80:
;Protocol.c,237 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,238 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,242 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,243 :: 		}
L_Sample_Ringbuffer67:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer264:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer266:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer270:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer272:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer276:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer278:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer280:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer282:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer284:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer286:
L_Sample_Ringbuffer68:
;Protocol.c,244 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,249 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer288:
;Protocol.c,250 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+240)
ORI	R26, R26, lo_addr(_gcode+240)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,251 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,252 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer84:
L_Sample_Ringbuffer85:
;Protocol.c,253 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer86:
L_Sample_Ringbuffer87:
;Protocol.c,254 :: 		case 'J':case 'j':
L_Sample_Ringbuffer88:
L_Sample_Ringbuffer89:
;Protocol.c,255 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,256 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,260 :: 		break;
J	L_Sample_Ringbuffer83
NOP	
;Protocol.c,261 :: 		case 'F':case 'f':
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
;Protocol.c,262 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,263 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,267 :: 		break;
J	L_Sample_Ringbuffer83
NOP	
;Protocol.c,269 :: 		}
L_Sample_Ringbuffer82:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer300:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer304:
L_Sample_Ringbuffer83:
;Protocol.c,270 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,274 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer306:
;Protocol.c,275 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,276 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+300)
ORI	R26, R26, lo_addr(_gcode+300)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,277 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer93
NOP	
;Protocol.c,278 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
;Protocol.c,279 :: 		case 'J':case 'j':
L_Sample_Ringbuffer97:
L_Sample_Ringbuffer98:
;Protocol.c,280 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,281 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,285 :: 		break;
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,286 :: 		case 'F':case 'f':
L_Sample_Ringbuffer99:
L_Sample_Ringbuffer100:
;Protocol.c,287 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,288 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,292 :: 		break;
J	L_Sample_Ringbuffer94
NOP	
;Protocol.c,293 :: 		}
L_Sample_Ringbuffer93:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer316:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer318:
L_Sample_Ringbuffer94:
;Protocol.c,294 :: 		}
L_Sample_Ringbuffer92:
;Protocol.c,297 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer320:
;Protocol.c,298 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+360)
ORI	R26, R26, lo_addr(_gcode+360)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,299 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer102
NOP	
;Protocol.c,300 :: 		case 'J':case 'j':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,301 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,302 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,306 :: 		break;
J	L_Sample_Ringbuffer103
NOP	
;Protocol.c,307 :: 		case 'F':case 'f':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,308 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,309 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 90
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,313 :: 		break;
J	L_Sample_Ringbuffer103
NOP	
;Protocol.c,315 :: 		}
L_Sample_Ringbuffer102:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer326:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer328:
L_Sample_Ringbuffer103:
;Protocol.c,316 :: 		}
L_Sample_Ringbuffer101:
;Protocol.c,317 :: 		}else {
J	L_Sample_Ringbuffer108
NOP	
L_Sample_Ringbuffer22:
;Protocol.c,318 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,319 :: 		}
L_Sample_Ringbuffer108:
;Protocol.c,320 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,321 :: 		case 'M':
L_Sample_Ringbuffer109:
;Protocol.c,322 :: 		case 'm':
L_Sample_Ringbuffer110:
;Protocol.c,324 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,325 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,326 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,332 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer330:
;Protocol.c,333 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer112
NOP	
;Protocol.c,334 :: 		case 'S':
L_Sample_Ringbuffer114:
;Protocol.c,335 :: 		case 's':
L_Sample_Ringbuffer115:
;Protocol.c,337 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,338 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 92(SP)
;Protocol.c,339 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,343 :: 		break;
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,344 :: 		}
L_Sample_Ringbuffer112:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer334:
L_Sample_Ringbuffer113:
;Protocol.c,345 :: 		}
L_Sample_Ringbuffer111:
;Protocol.c,346 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,347 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,348 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
;Protocol.c,349 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer335:
;Protocol.c,350 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,351 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,352 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,356 :: 		}
L_Sample_Ringbuffer124:
;Protocol.c,360 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer337:
;Protocol.c,361 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,362 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,363 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer126
NOP	
;Protocol.c,364 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer128:
L_Sample_Ringbuffer129:
;Protocol.c,365 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer130:
L_Sample_Ringbuffer131:
;Protocol.c,366 :: 		case 'A':case 'a':
L_Sample_Ringbuffer132:
L_Sample_Ringbuffer133:
;Protocol.c,367 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,368 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,372 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,373 :: 		case 'F':
L_Sample_Ringbuffer134:
;Protocol.c,374 :: 		case 'f':
L_Sample_Ringbuffer135:
;Protocol.c,377 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 88(SP)
;Protocol.c,378 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,383 :: 		break;
J	L_Sample_Ringbuffer127
NOP	
;Protocol.c,385 :: 		}
L_Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer347:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer349:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer353:
L_Sample_Ringbuffer127:
;Protocol.c,386 :: 		}
L_Sample_Ringbuffer125:
;Protocol.c,387 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,388 :: 		case 'F':
L_Sample_Ringbuffer136:
;Protocol.c,390 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer354:
;Protocol.c,391 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 72
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,392 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 88(SP)
;Protocol.c,393 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,397 :: 		}
L_Sample_Ringbuffer137:
;Protocol.c,398 :: 		break;
J	L_Sample_Ringbuffer19
NOP	
;Protocol.c,400 :: 		}
L_Sample_Ringbuffer18:
LH	R4, 96(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer356:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer358:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer360:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer362:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer364:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer366:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer368:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer370:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer372:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer374:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer376:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer378
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer378:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer380
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer380:
L_Sample_Ringbuffer19:
;Protocol.c,401 :: 		}
L_Sample_Ringbuffer17:
;Protocol.c,403 :: 		if(query){
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer382
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer382:
;Protocol.c,404 :: 		status = 0;
SH	R0, 20(SP)
;Protocol.c,405 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,406 :: 		}
L_Sample_Ringbuffer138:
;Protocol.c,408 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 20(SP)
;Protocol.c,409 :: 		end:asm{NOP};
___Sample_Ringbuffer_end:
NOP	
;Protocol.c,413 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,414 :: 		return status;
LH	R2, 20(SP)
;Protocol.c,415 :: 		}
;Protocol.c,414 :: 		return status;
;Protocol.c,415 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,420 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,422 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,423 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,424 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,425 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit139:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit384
NOP	
J	L_Protocol_strsplit140
NOP	
L_Protocol_strsplit384:
;Protocol.c,426 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,427 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit386
NOP	
J	L_Protocol_strsplit157
NOP	
L_Protocol_strsplit386:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit388
NOP	
J	L_Protocol_strsplit156
NOP	
L_Protocol_strsplit388:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit389
NOP	
J	L_Protocol_strsplit155
NOP	
L_Protocol_strsplit389:
J	L_Protocol_strsplit144
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit157:
L_Protocol_strsplit156:
L_Protocol_strsplit155:
;Protocol.c,428 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,429 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,430 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,431 :: 		continue;
J	L_Protocol_strsplit141
NOP	
;Protocol.c,432 :: 		}else{
L_Protocol_strsplit144:
;Protocol.c,433 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,435 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit390
NOP	
J	L_Protocol_strsplit146
NOP	
L_Protocol_strsplit390:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,436 :: 		break;
J	L_Protocol_strsplit140
NOP	
L_Protocol_strsplit146:
;Protocol.c,437 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit141:
;Protocol.c,425 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,437 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit139
NOP	
L_Protocol_strsplit140:
;Protocol.c,438 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,439 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,440 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,444 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,447 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,448 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,450 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,451 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str147:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str393
NOP	
J	L_Protocol_cpy_val_from_str148
NOP	
L_Protocol_cpy_val_from_str393:
;Protocol.c,452 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,453 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,454 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str147
NOP	
L_Protocol_cpy_val_from_str148:
;Protocol.c,455 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,457 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,458 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,463 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,465 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,467 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,469 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int149:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int395
NOP	
J	L_Protocol_str2int150
NOP	
L_Protocol_str2int395:
;Protocol.c,470 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,471 :: 		while(DMA_IsOn(1));
L_Protocol_str2int152:
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
BNE	R2, R0, L_Protocol_str2int397
NOP	
J	L_Protocol_str2int153
NOP	
L_Protocol_str2int397:
J	L_Protocol_str2int152
NOP	
L_Protocol_str2int153:
;Protocol.c,469 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,472 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int149
NOP	
L_Protocol_str2int150:
;Protocol.c,474 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,475 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
