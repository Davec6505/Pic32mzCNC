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
BNE	R2, R0, L__Str_Initialize176
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize176:
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
_Sample_Ringbuffer:
;Protocol.c,19 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;Protocol.c,34 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
SH	R2, 88(SP)
;Protocol.c,36 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer178
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer178:
;Protocol.c,37 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Protocol.c,38 :: 		F_1_Once = no_of_axis = 0 ; //for buffer and axis refreshing
SB	R0, 87(SP)
;Protocol.c,39 :: 		Get_Line(str,dif);          //get the line sent from PC
ADDIU	R2, SP, 22
LH	R26, 88(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,42 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 22
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,48 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,49 :: 		case 'G':case 'g':
L_Sample_Ringbuffer6:
L_Sample_Ringbuffer7:
;Protocol.c,51 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer179
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer179:
;Protocol.c,52 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,53 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer180
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer180:
;Protocol.c,54 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,57 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer182
NOP	
J	L__Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer182:
LH	R3, 90(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer184
NOP	
J	L__Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer184:
LH	R3, 90(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer186
NOP	
J	L__Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer186:
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer174:
L__Sample_Ringbuffer173:
L__Sample_Ringbuffer172:
;Protocol.c,58 :: 		G_Val *= 10;
LH	R3, 90(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 90(SP)
L_Sample_Ringbuffer12:
;Protocol.c,59 :: 		}else{
J	L_Sample_Ringbuffer13
NOP	
L_Sample_Ringbuffer9:
;Protocol.c,61 :: 		G_Val = (int)(atof(temp)*10.0);
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
SH	R2, 90(SP)
;Protocol.c,62 :: 		}
L_Sample_Ringbuffer13:
;Protocol.c,64 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 90(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,66 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 90
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,74 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer188
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer188:
;Protocol.c,76 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,77 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer15
NOP	
;Protocol.c,78 :: 		case 'X':case 'x':
L_Sample_Ringbuffer17:
L_Sample_Ringbuffer18:
;Protocol.c,79 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer19:
L_Sample_Ringbuffer20:
;Protocol.c,80 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer21:
L_Sample_Ringbuffer22:
;Protocol.c,81 :: 		case 'A':case 'a':
L_Sample_Ringbuffer23:
L_Sample_Ringbuffer24:
;Protocol.c,82 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,83 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,85 :: 		PrintDebug(*gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,87 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,88 :: 		case 'F':case 'f':
L_Sample_Ringbuffer25:
L_Sample_Ringbuffer26:
;Protocol.c,89 :: 		case 'L':case 'l':
L_Sample_Ringbuffer27:
L_Sample_Ringbuffer28:
;Protocol.c,90 :: 		case 'P':case 'p':
L_Sample_Ringbuffer29:
L_Sample_Ringbuffer30:
;Protocol.c,91 :: 		case 'S':case 's':
L_Sample_Ringbuffer31:
L_Sample_Ringbuffer32:
;Protocol.c,92 :: 		if(!F_1_Once){//check validity of this
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer189
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer189:
;Protocol.c,93 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,94 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,95 :: 		status = Instruction_Values(gcode[1],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,97 :: 		PrintDebug(*gcode[1],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,99 :: 		}
L_Sample_Ringbuffer33:
;Protocol.c,100 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,101 :: 		}
L_Sample_Ringbuffer15:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer191
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer191:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer193
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer193:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer195
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer195:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer197
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer197:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer199
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer199:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer201
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer201:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer203
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer203:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer205:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer207
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer207:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer209
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer209:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer211
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer211:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer213
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer213:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer215
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer215:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer217
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer217:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer219
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer219:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer221
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer221:
L_Sample_Ringbuffer16:
;Protocol.c,102 :: 		}
L_Sample_Ringbuffer14:
;Protocol.c,107 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer223
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer223:
;Protocol.c,109 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,110 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,111 :: 		case 'X':case 'x':
L_Sample_Ringbuffer37:
L_Sample_Ringbuffer38:
;Protocol.c,112 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer39:
L_Sample_Ringbuffer40:
;Protocol.c,113 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer41:
L_Sample_Ringbuffer42:
;Protocol.c,114 :: 		case 'A':case 'a':
L_Sample_Ringbuffer43:
L_Sample_Ringbuffer44:
;Protocol.c,115 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,116 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,118 :: 		PrintDebug(*gcode[2],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,120 :: 		break;
J	L_Sample_Ringbuffer36
NOP	
;Protocol.c,121 :: 		case 'F':case 'f':
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer46:
;Protocol.c,122 :: 		case 'P':case 'p':  //other as msec in dwell
L_Sample_Ringbuffer47:
L_Sample_Ringbuffer48:
;Protocol.c,123 :: 		case 'S':case 's':  //other as in sec in dwell
L_Sample_Ringbuffer49:
L_Sample_Ringbuffer50:
;Protocol.c,124 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer224:
;Protocol.c,125 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,126 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,127 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,129 :: 		PrintDebug(*gcode[2],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,131 :: 		}
L_Sample_Ringbuffer51:
;Protocol.c,132 :: 		break;
J	L_Sample_Ringbuffer36
NOP	
;Protocol.c,134 :: 		}
L_Sample_Ringbuffer35:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer226:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer228:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer230:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer232:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer234:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer236:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer238
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer238:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer240:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer242
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer242:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer244
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer244:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer246
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer246:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer248:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer252:
L_Sample_Ringbuffer36:
;Protocol.c,135 :: 		}
L_Sample_Ringbuffer34:
;Protocol.c,139 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer254:
;Protocol.c,141 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,142 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer53
NOP	
;Protocol.c,143 :: 		case 'X':case 'x':
L_Sample_Ringbuffer55:
L_Sample_Ringbuffer56:
;Protocol.c,144 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer58:
;Protocol.c,145 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
;Protocol.c,146 :: 		case 'R':case 'r':
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,147 :: 		case 'I':case 'i':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
;Protocol.c,148 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,149 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,151 :: 		PrintDebug(*gcode[3],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,153 :: 		break;
J	L_Sample_Ringbuffer54
NOP	
;Protocol.c,154 :: 		case 'F':
L_Sample_Ringbuffer65:
;Protocol.c,155 :: 		case 'f':
L_Sample_Ringbuffer66:
;Protocol.c,156 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer255
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer255:
;Protocol.c,157 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,158 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,159 :: 		status = Instruction_Values(gcode[3],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,161 :: 		PrintDebug(*gcode[3],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,163 :: 		}
L_Sample_Ringbuffer67:
;Protocol.c,164 :: 		break;
J	L_Sample_Ringbuffer54
NOP	
;Protocol.c,166 :: 		}
L_Sample_Ringbuffer53:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer257
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer257:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer259:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer261
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer261:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer263:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer265:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer267:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer269:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer271
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer271:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer273
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer273:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer275
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer275:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer277
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer277:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer279
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer279:
L_Sample_Ringbuffer54:
;Protocol.c,167 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,172 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer281
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer281:
;Protocol.c,173 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,174 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer69
NOP	
;Protocol.c,175 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer71:
L_Sample_Ringbuffer72:
;Protocol.c,176 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer73:
L_Sample_Ringbuffer74:
;Protocol.c,177 :: 		case 'J':case 'j':
L_Sample_Ringbuffer75:
L_Sample_Ringbuffer76:
;Protocol.c,178 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,179 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,181 :: 		PrintDebug(*gcode[4],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,183 :: 		break;
J	L_Sample_Ringbuffer70
NOP	
;Protocol.c,184 :: 		case 'F':
L_Sample_Ringbuffer77:
;Protocol.c,185 :: 		case 'f':
L_Sample_Ringbuffer78:
;Protocol.c,186 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer282:
;Protocol.c,187 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,188 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,189 :: 		status = Instruction_Values(gcode[4],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,191 :: 		PrintDebug(*gcode[4],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,193 :: 		}
L_Sample_Ringbuffer79:
;Protocol.c,194 :: 		break;
J	L_Sample_Ringbuffer70
NOP	
;Protocol.c,196 :: 		}
L_Sample_Ringbuffer69:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer284:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer286:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer288:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer298:
L_Sample_Ringbuffer70:
;Protocol.c,197 :: 		}
L_Sample_Ringbuffer68:
;Protocol.c,201 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer300:
;Protocol.c,202 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,203 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,204 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer81
NOP	
;Protocol.c,205 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer84:
;Protocol.c,206 :: 		case 'J':case 'j':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,207 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,208 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,210 :: 		PrintDebug(*gcode[5],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,212 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,213 :: 		case 'F':
L_Sample_Ringbuffer87:
;Protocol.c,214 :: 		case 'f':
L_Sample_Ringbuffer88:
;Protocol.c,216 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,217 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,218 :: 		status = Instruction_Values(gcode[5],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,220 :: 		PrintDebug(*gcode[5],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,223 :: 		break;
J	L_Sample_Ringbuffer82
NOP	
;Protocol.c,225 :: 		}
L_Sample_Ringbuffer81:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer304:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer312:
L_Sample_Ringbuffer82:
;Protocol.c,226 :: 		}
L_Sample_Ringbuffer80:
;Protocol.c,229 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer314:
;Protocol.c,230 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,231 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer90
NOP	
;Protocol.c,232 :: 		case 'J':case 'j':
L_Sample_Ringbuffer92:
L_Sample_Ringbuffer93:
;Protocol.c,233 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,234 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,236 :: 		PrintDebug(gcode[6],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,238 :: 		break;
J	L_Sample_Ringbuffer91
NOP	
;Protocol.c,239 :: 		case 'F':
L_Sample_Ringbuffer94:
;Protocol.c,240 :: 		case 'f':
L_Sample_Ringbuffer95:
;Protocol.c,241 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer315:
;Protocol.c,243 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,244 :: 		status = Instruction_Values(gcode[6],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,246 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,248 :: 		}
L_Sample_Ringbuffer96:
;Protocol.c,249 :: 		break;
J	L_Sample_Ringbuffer91
NOP	
;Protocol.c,251 :: 		}
L_Sample_Ringbuffer90:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer317:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer319:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer321:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer323:
L_Sample_Ringbuffer91:
;Protocol.c,252 :: 		}
L_Sample_Ringbuffer89:
;Protocol.c,253 :: 		}else {
J	L_Sample_Ringbuffer97
NOP	
L_Sample_Ringbuffer8:
;Protocol.c,254 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,255 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,256 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,257 :: 		case 'M':
L_Sample_Ringbuffer98:
;Protocol.c,258 :: 		case 'm':
L_Sample_Ringbuffer99:
;Protocol.c,260 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,261 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 94(SP)
;Protocol.c,262 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,264 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 94
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,268 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer325:
;Protocol.c,269 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,270 :: 		case 'S':
L_Sample_Ringbuffer103:
;Protocol.c,271 :: 		case 's':
L_Sample_Ringbuffer104:
;Protocol.c,273 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,274 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 96(SP)
;Protocol.c,275 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,277 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,279 :: 		break;
J	L_Sample_Ringbuffer102
NOP	
;Protocol.c,280 :: 		}
L_Sample_Ringbuffer101:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer329:
L_Sample_Ringbuffer102:
;Protocol.c,281 :: 		}
L_Sample_Ringbuffer100:
;Protocol.c,282 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,283 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer105:
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
;Protocol.c,284 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer109:
L_Sample_Ringbuffer110:
L_Sample_Ringbuffer111:
L_Sample_Ringbuffer112:
;Protocol.c,285 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer330:
;Protocol.c,286 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,287 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,288 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,290 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,292 :: 		}
L_Sample_Ringbuffer113:
;Protocol.c,296 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer332
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer332:
;Protocol.c,297 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,298 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,299 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer115
NOP	
;Protocol.c,300 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
;Protocol.c,301 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,302 :: 		case 'A':case 'a':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,303 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,304 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,306 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,308 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,309 :: 		case 'F':
L_Sample_Ringbuffer123:
;Protocol.c,310 :: 		case 'f':
L_Sample_Ringbuffer124:
;Protocol.c,313 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,314 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,316 :: 		PrintDebug(gcode[1],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,319 :: 		break;
J	L_Sample_Ringbuffer116
NOP	
;Protocol.c,321 :: 		}
L_Sample_Ringbuffer115:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer334
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer336
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer336:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer338
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer338:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer340
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer340:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer342
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer342:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer344
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer346
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer346:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer348
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer348:
L_Sample_Ringbuffer116:
;Protocol.c,322 :: 		}
L_Sample_Ringbuffer114:
;Protocol.c,323 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,324 :: 		case 'F':
L_Sample_Ringbuffer125:
;Protocol.c,326 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer349:
;Protocol.c,327 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,328 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,329 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,331 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,333 :: 		}
L_Sample_Ringbuffer126:
;Protocol.c,334 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,336 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer351
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer351:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer353
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer353:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer355
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer355:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer357
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer357:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer359
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer359:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer361
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer363
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer363:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer365
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer365:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer367
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer367:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer369
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer369:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer371
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer371:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer373
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer373:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer375
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer375:
L_Sample_Ringbuffer5:
;Protocol.c,337 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 20(SP)
;Protocol.c,340 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,341 :: 		return status;
LH	R2, 20(SP)
;Protocol.c,342 :: 		}
;Protocol.c,341 :: 		return status;
;Protocol.c,342 :: 		}
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
;Protocol.c,347 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,349 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,350 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,351 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,352 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit127:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit377
NOP	
J	L_Protocol_strsplit128
NOP	
L_Protocol_strsplit377:
;Protocol.c,353 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,354 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit379
NOP	
J	L_Protocol_strsplit170
NOP	
L_Protocol_strsplit379:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit381
NOP	
J	L_Protocol_strsplit169
NOP	
L_Protocol_strsplit381:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit382
NOP	
J	L_Protocol_strsplit168
NOP	
L_Protocol_strsplit382:
J	L_Protocol_strsplit132
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit170:
L_Protocol_strsplit169:
L_Protocol_strsplit168:
;Protocol.c,355 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,356 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,357 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,358 :: 		continue;
J	L_Protocol_strsplit129
NOP	
;Protocol.c,359 :: 		}else{
L_Protocol_strsplit132:
;Protocol.c,360 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,362 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit383
NOP	
J	L_Protocol_strsplit134
NOP	
L_Protocol_strsplit383:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,363 :: 		break;
J	L_Protocol_strsplit128
NOP	
L_Protocol_strsplit134:
;Protocol.c,364 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit129:
;Protocol.c,352 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,364 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit127
NOP	
L_Protocol_strsplit128:
;Protocol.c,365 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,366 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,367 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,371 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,374 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,375 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,377 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,378 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str135:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str386
NOP	
J	L_Protocol_cpy_val_from_str136
NOP	
L_Protocol_cpy_val_from_str386:
;Protocol.c,379 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,380 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,381 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str135
NOP	
L_Protocol_cpy_val_from_str136:
;Protocol.c,382 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,384 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,385 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,390 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,392 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,394 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,396 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int137:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int388
NOP	
J	L_Protocol_str2int138
NOP	
L_Protocol_str2int388:
;Protocol.c,397 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,398 :: 		while(DMA_Busy(1));
L_Protocol_str2int140:
; i start address is: 12 (R3)
SH	R3, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_str2int390
NOP	
J	L_Protocol_str2int141
NOP	
L_Protocol_str2int390:
J	L_Protocol_str2int140
NOP	
L_Protocol_str2int141:
;Protocol.c,396 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,399 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int137
NOP	
L_Protocol_str2int138:
;Protocol.c,401 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,402 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
Protocol_PrintDebug:
;Protocol.c,407 :: 		static void PrintDebug(char c,char *strB,void *ptr){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Protocol.c,411 :: 		switch(c){
J	L_Protocol_PrintDebug142
NOP	
;Protocol.c,412 :: 		case 'G':case 'g':
L_Protocol_PrintDebug144:
L_Protocol_PrintDebug145:
;Protocol.c,413 :: 		case 'F':case 'f':
L_Protocol_PrintDebug146:
L_Protocol_PrintDebug147:
;Protocol.c,414 :: 		case 'M':case 'm':
L_Protocol_PrintDebug148:
L_Protocol_PrintDebug149:
;Protocol.c,415 :: 		case 'S':case 's':
L_Protocol_PrintDebug150:
L_Protocol_PrintDebug151:
;Protocol.c,416 :: 		case 'P':case 'p':
L_Protocol_PrintDebug152:
L_Protocol_PrintDebug153:
;Protocol.c,417 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,418 :: 		while(DMA_Busy(1));
L_Protocol_PrintDebug154:
; G_Val start address is: 12 (R3)
SH	R3, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug393
NOP	
J	L_Protocol_PrintDebug155
NOP	
L_Protocol_PrintDebug393:
J	L_Protocol_PrintDebug154
NOP	
L_Protocol_PrintDebug155:
;Protocol.c,419 :: 		dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
ADDIU	R23, SP, 17
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
SW	R27, 4(SP)
; G_Val end address is: 12 (R3)
SW	R26, 8(SP)
SB	R25, 12(SP)
ADDIU	SP, SP, -16
SH	R3, 12(SP)
SW	R26, 8(SP)
SB	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LBU	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,420 :: 		break;
J	L_Protocol_PrintDebug143
NOP	
;Protocol.c,421 :: 		case 'X':case 'x':
L_Protocol_PrintDebug156:
L_Protocol_PrintDebug157:
;Protocol.c,422 :: 		case 'Y':case 'y':
L_Protocol_PrintDebug158:
L_Protocol_PrintDebug159:
;Protocol.c,423 :: 		case 'Z':case 'z':
L_Protocol_PrintDebug160:
L_Protocol_PrintDebug161:
;Protocol.c,424 :: 		case 'A':case 'a':
L_Protocol_PrintDebug162:
L_Protocol_PrintDebug163:
;Protocol.c,425 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,426 :: 		while(DMA_Busy(1));
L_Protocol_PrintDebug164:
; XYZ_Val start address is: 128 (R32)
SWC1	S16, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LWC1	S16, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug395
NOP	
J	L_Protocol_PrintDebug165
NOP	
L_Protocol_PrintDebug395:
J	L_Protocol_PrintDebug164
NOP	
L_Protocol_PrintDebug165:
;Protocol.c,427 :: 		dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
ADDIU	R23, SP, 27
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 27
SW	R27, 4(SP)
; XYZ_Val end address is: 128 (R32)
SW	R26, 8(SP)
SB	R25, 12(SP)
ADDIU	SP, SP, -16
SWC1	S16, 12(SP)
SW	R26, 8(SP)
SB	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LBU	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,428 :: 		break;
J	L_Protocol_PrintDebug143
NOP	
;Protocol.c,429 :: 		default:break;
L_Protocol_PrintDebug166:
J	L_Protocol_PrintDebug143
NOP	
;Protocol.c,430 :: 		}
L_Protocol_PrintDebug142:
ANDI	R3, R25, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_PrintDebug397
NOP	
J	L_Protocol_PrintDebug144
NOP	
L_Protocol_PrintDebug397:
ANDI	R3, R25, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_PrintDebug399
NOP	
J	L_Protocol_PrintDebug145
NOP	
L_Protocol_PrintDebug399:
ANDI	R3, R25, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_PrintDebug401
NOP	
J	L_Protocol_PrintDebug146
NOP	
L_Protocol_PrintDebug401:
ANDI	R3, R25, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_PrintDebug403
NOP	
J	L_Protocol_PrintDebug147
NOP	
L_Protocol_PrintDebug403:
ANDI	R3, R25, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_PrintDebug405
NOP	
J	L_Protocol_PrintDebug148
NOP	
L_Protocol_PrintDebug405:
ANDI	R3, R25, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_PrintDebug407
NOP	
J	L_Protocol_PrintDebug149
NOP	
L_Protocol_PrintDebug407:
ANDI	R3, R25, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_PrintDebug409
NOP	
J	L_Protocol_PrintDebug150
NOP	
L_Protocol_PrintDebug409:
ANDI	R3, R25, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_PrintDebug411
NOP	
J	L_Protocol_PrintDebug151
NOP	
L_Protocol_PrintDebug411:
ANDI	R3, R25, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_PrintDebug413
NOP	
J	L_Protocol_PrintDebug152
NOP	
L_Protocol_PrintDebug413:
ANDI	R3, R25, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_PrintDebug415
NOP	
J	L_Protocol_PrintDebug153
NOP	
L_Protocol_PrintDebug415:
ANDI	R3, R25, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_PrintDebug417
NOP	
J	L_Protocol_PrintDebug156
NOP	
L_Protocol_PrintDebug417:
ANDI	R3, R25, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_PrintDebug419
NOP	
J	L_Protocol_PrintDebug157
NOP	
L_Protocol_PrintDebug419:
ANDI	R3, R25, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_PrintDebug421
NOP	
J	L_Protocol_PrintDebug158
NOP	
L_Protocol_PrintDebug421:
ANDI	R3, R25, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_PrintDebug423
NOP	
J	L_Protocol_PrintDebug159
NOP	
L_Protocol_PrintDebug423:
ANDI	R3, R25, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_PrintDebug425
NOP	
J	L_Protocol_PrintDebug160
NOP	
L_Protocol_PrintDebug425:
ANDI	R3, R25, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_PrintDebug427
NOP	
J	L_Protocol_PrintDebug161
NOP	
L_Protocol_PrintDebug427:
ANDI	R3, R25, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_PrintDebug429
NOP	
J	L_Protocol_PrintDebug162
NOP	
L_Protocol_PrintDebug429:
ANDI	R3, R25, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_PrintDebug431
NOP	
J	L_Protocol_PrintDebug163
NOP	
L_Protocol_PrintDebug431:
J	L_Protocol_PrintDebug166
NOP	
L_Protocol_PrintDebug143:
;Protocol.c,431 :: 		return;
;Protocol.c,432 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Protocol_PrintDebug
