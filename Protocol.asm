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
BNE	R2, R0, L__Str_Initialize162
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize162:
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
BEQ	R2, R0, L__Sample_Ringbuffer164
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer164:
;Protocol.c,37 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Protocol.c,38 :: 		F_1_Once = no_of_axis = 0 ; //for buffer and axis refreshing
SB	R0, 87(SP)
;Protocol.c,39 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 22
LH	R26, 88(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,40 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 22
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,41 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,42 :: 		case 'G':case 'g':
L_Sample_Ringbuffer6:
L_Sample_Ringbuffer7:
;Protocol.c,44 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer165
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer165:
;Protocol.c,45 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,46 :: 		if(i < 3){
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer166:
;Protocol.c,47 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,48 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L__Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer168:
LH	R3, 90(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L__Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer170:
LH	R3, 90(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer172
NOP	
J	L__Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer172:
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer160:
L__Sample_Ringbuffer159:
L__Sample_Ringbuffer158:
;Protocol.c,49 :: 		G_Val *= 10;
LH	R3, 90(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 90(SP)
L_Sample_Ringbuffer12:
;Protocol.c,50 :: 		}else{  //counter g28.1 etc
J	L_Sample_Ringbuffer13
NOP	
L_Sample_Ringbuffer9:
;Protocol.c,51 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,52 :: 		}
L_Sample_Ringbuffer13:
;Protocol.c,54 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 90(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,56 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 90
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,63 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer174
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer174:
;Protocol.c,65 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,66 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer15
NOP	
;Protocol.c,67 :: 		case 'X':case 'x':
L_Sample_Ringbuffer17:
L_Sample_Ringbuffer18:
;Protocol.c,68 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer19:
L_Sample_Ringbuffer20:
;Protocol.c,69 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer21:
L_Sample_Ringbuffer22:
;Protocol.c,70 :: 		case 'A':case 'a':
L_Sample_Ringbuffer23:
L_Sample_Ringbuffer24:
;Protocol.c,71 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,72 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,74 :: 		PrintDebug(*(*(gcode+1)+0),temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,76 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,77 :: 		case 'F':case 'f':
L_Sample_Ringbuffer25:
L_Sample_Ringbuffer26:
;Protocol.c,78 :: 		case 'P':case 'p':
L_Sample_Ringbuffer27:
L_Sample_Ringbuffer28:
;Protocol.c,79 :: 		case 'S':case 's':
L_Sample_Ringbuffer29:
L_Sample_Ringbuffer30:
;Protocol.c,80 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer175
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer175:
;Protocol.c,81 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,82 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,83 :: 		status = Instruction_Values(gcode[1],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,85 :: 		PrintDebug(*(*(gcode+1)+0),temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,87 :: 		}
L_Sample_Ringbuffer31:
;Protocol.c,88 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,89 :: 		}
L_Sample_Ringbuffer15:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer177
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer177:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer179
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer179:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer181
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer183
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer183:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer185
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer185:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer187
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer187:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer189
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer189:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer191
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer191:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer193
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer193:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer195
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer195:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer197
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer197:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer199
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer199:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer201
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer201:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer203
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer203:
L_Sample_Ringbuffer16:
;Protocol.c,90 :: 		}
L_Sample_Ringbuffer14:
;Protocol.c,94 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer205:
;Protocol.c,96 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,97 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer33
NOP	
;Protocol.c,98 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer35:
L_Sample_Ringbuffer36:
;Protocol.c,99 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer37:
L_Sample_Ringbuffer38:
;Protocol.c,100 :: 		case 'A':case 'a':
L_Sample_Ringbuffer39:
L_Sample_Ringbuffer40:
;Protocol.c,101 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,102 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,104 :: 		PrintDebug(*gcode[2],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,106 :: 		break;
J	L_Sample_Ringbuffer34
NOP	
;Protocol.c,107 :: 		case 'F':case 'f':
L_Sample_Ringbuffer41:
L_Sample_Ringbuffer42:
;Protocol.c,108 :: 		case 'P':case 'p':  //other as msec in dwell
L_Sample_Ringbuffer43:
L_Sample_Ringbuffer44:
;Protocol.c,109 :: 		case 'S':case 's':  //other as in sec in dwell
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer46:
;Protocol.c,110 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer206
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer206:
;Protocol.c,111 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,112 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,113 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,115 :: 		PrintDebug(*gcode[2],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,117 :: 		}
L_Sample_Ringbuffer47:
;Protocol.c,118 :: 		break;
J	L_Sample_Ringbuffer34
NOP	
;Protocol.c,120 :: 		}
L_Sample_Ringbuffer33:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer208
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer208:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer210
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer210:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer212:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer214:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer216:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer218
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer218:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer220:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer222:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer224:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer226:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer228:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer230:
L_Sample_Ringbuffer34:
;Protocol.c,121 :: 		}
L_Sample_Ringbuffer32:
;Protocol.c,124 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer232:
;Protocol.c,126 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,127 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,128 :: 		case 'R':case 'r':
L_Sample_Ringbuffer51:
L_Sample_Ringbuffer52:
;Protocol.c,129 :: 		case 'I':case 'i':
L_Sample_Ringbuffer53:
L_Sample_Ringbuffer54:
;Protocol.c,130 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,131 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,133 :: 		PrintDebug(*gcode[3],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,135 :: 		break;
J	L_Sample_Ringbuffer50
NOP	
;Protocol.c,136 :: 		case 'F':
L_Sample_Ringbuffer55:
;Protocol.c,137 :: 		case 'f':
L_Sample_Ringbuffer56:
;Protocol.c,138 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer233
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer233:
;Protocol.c,139 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,140 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,141 :: 		status = Instruction_Values(gcode[3],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,143 :: 		PrintDebug(*gcode[3],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,145 :: 		}
L_Sample_Ringbuffer57:
;Protocol.c,146 :: 		break;
J	L_Sample_Ringbuffer50
NOP	
;Protocol.c,148 :: 		}
L_Sample_Ringbuffer49:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer235
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer235:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer237
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer237:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer239
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer239:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer241
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer241:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer243
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer243:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer245
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer245:
L_Sample_Ringbuffer50:
;Protocol.c,149 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,153 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer247
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer247:
;Protocol.c,154 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,155 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer59
NOP	
;Protocol.c,156 :: 		case 'J':case 'j':
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,157 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,158 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,160 :: 		PrintDebug(*gcode[4],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,162 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,163 :: 		case 'F':
L_Sample_Ringbuffer63:
;Protocol.c,164 :: 		case 'f':
L_Sample_Ringbuffer64:
;Protocol.c,165 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer248:
;Protocol.c,166 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,167 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,168 :: 		status = Instruction_Values(gcode[4],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,170 :: 		PrintDebug(*gcode[4],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,172 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,173 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,175 :: 		}
L_Sample_Ringbuffer59:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer252:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer254:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer256
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer256:
L_Sample_Ringbuffer60:
;Protocol.c,176 :: 		}
L_Sample_Ringbuffer58:
;Protocol.c,179 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer258:
;Protocol.c,180 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,181 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,182 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer67
NOP	
;Protocol.c,183 :: 		case 'J':case 'j':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
;Protocol.c,184 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,185 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,187 :: 		PrintDebug(*gcode[5],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,189 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,190 :: 		case 'F':
L_Sample_Ringbuffer71:
;Protocol.c,191 :: 		case 'f':
L_Sample_Ringbuffer72:
;Protocol.c,192 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer259
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer259:
;Protocol.c,193 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 87(SP)
;Protocol.c,194 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,195 :: 		status = Instruction_Values(gcode[5],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,197 :: 		PrintDebug(*gcode[5],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,199 :: 		}
L_Sample_Ringbuffer73:
;Protocol.c,200 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,202 :: 		}
L_Sample_Ringbuffer67:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer261
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer261:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer263
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer263:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer265
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer265:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer267
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer267:
L_Sample_Ringbuffer68:
;Protocol.c,203 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,206 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer269
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer269:
;Protocol.c,207 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,208 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,209 :: 		case 'J':case 'j':
L_Sample_Ringbuffer77:
L_Sample_Ringbuffer78:
;Protocol.c,210 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,211 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,213 :: 		PrintDebug(gcode[6],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,215 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,216 :: 		case 'F':
L_Sample_Ringbuffer79:
;Protocol.c,217 :: 		case 'f':
L_Sample_Ringbuffer80:
;Protocol.c,218 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer270:
;Protocol.c,220 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,221 :: 		status = Instruction_Values(gcode[6],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,223 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,225 :: 		}
L_Sample_Ringbuffer81:
;Protocol.c,226 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,228 :: 		}
L_Sample_Ringbuffer75:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer272:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer276:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer278:
L_Sample_Ringbuffer76:
;Protocol.c,229 :: 		}
L_Sample_Ringbuffer74:
;Protocol.c,230 :: 		}else {
J	L_Sample_Ringbuffer82
NOP	
L_Sample_Ringbuffer8:
;Protocol.c,231 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,232 :: 		}
L_Sample_Ringbuffer82:
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,234 :: 		case 'M':
L_Sample_Ringbuffer83:
;Protocol.c,235 :: 		case 'm':
L_Sample_Ringbuffer84:
;Protocol.c,237 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,238 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 94(SP)
;Protocol.c,239 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,241 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 94
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,245 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer280:
;Protocol.c,246 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer86
NOP	
;Protocol.c,247 :: 		case 'S':
L_Sample_Ringbuffer88:
;Protocol.c,248 :: 		case 's':
L_Sample_Ringbuffer89:
;Protocol.c,250 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,251 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 96(SP)
;Protocol.c,252 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,254 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,256 :: 		break;
J	L_Sample_Ringbuffer87
NOP	
;Protocol.c,257 :: 		}
L_Sample_Ringbuffer86:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer282:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer284:
L_Sample_Ringbuffer87:
;Protocol.c,258 :: 		}
L_Sample_Ringbuffer85:
;Protocol.c,259 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,260 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
L_Sample_Ringbuffer92:
L_Sample_Ringbuffer93:
;Protocol.c,261 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer94:
L_Sample_Ringbuffer95:
L_Sample_Ringbuffer96:
L_Sample_Ringbuffer97:
;Protocol.c,262 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer285
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer285:
;Protocol.c,263 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,264 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,265 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,267 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,269 :: 		}
L_Sample_Ringbuffer98:
;Protocol.c,273 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer287
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer287:
;Protocol.c,274 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 81
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,275 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,276 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer100
NOP	
;Protocol.c,277 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
;Protocol.c,278 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,279 :: 		case 'A':case 'a':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
;Protocol.c,280 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 96(SP)
;Protocol.c,281 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,283 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,285 :: 		break;
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,286 :: 		case 'F':
L_Sample_Ringbuffer108:
;Protocol.c,287 :: 		case 'f':
L_Sample_Ringbuffer109:
;Protocol.c,288 :: 		if(!F_1_Once){
LBU	R2, 87(SP)
BEQ	R2, R0, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer288:
;Protocol.c,290 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,291 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,293 :: 		PrintDebug(gcode[1],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,295 :: 		}
L_Sample_Ringbuffer110:
;Protocol.c,296 :: 		break;
J	L_Sample_Ringbuffer101
NOP	
;Protocol.c,298 :: 		}
L_Sample_Ringbuffer100:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer300:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer302:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer304:
L_Sample_Ringbuffer101:
;Protocol.c,299 :: 		}
L_Sample_Ringbuffer99:
;Protocol.c,300 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,301 :: 		case 'F':
L_Sample_Ringbuffer111:
;Protocol.c,303 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer305
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer305:
;Protocol.c,304 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,305 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,306 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,308 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 72
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,310 :: 		}
L_Sample_Ringbuffer112:
;Protocol.c,311 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,313 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer307
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer307:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer309
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer309:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer311
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer311:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer313
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer313:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer315
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer315:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer317
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer317:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer319
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer319:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer321
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer321:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer323
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer325
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer327
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer327:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer329
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer329:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer331:
L_Sample_Ringbuffer5:
;Protocol.c,314 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 20(SP)
;Protocol.c,317 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,318 :: 		return status;
LH	R2, 20(SP)
;Protocol.c,319 :: 		}
;Protocol.c,318 :: 		return status;
;Protocol.c,319 :: 		}
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
;Protocol.c,324 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,326 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,327 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,328 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,329 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit113:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit333
NOP	
J	L_Protocol_strsplit114
NOP	
L_Protocol_strsplit333:
;Protocol.c,330 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,331 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit335
NOP	
J	L_Protocol_strsplit156
NOP	
L_Protocol_strsplit335:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit337
NOP	
J	L_Protocol_strsplit155
NOP	
L_Protocol_strsplit337:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit338
NOP	
J	L_Protocol_strsplit154
NOP	
L_Protocol_strsplit338:
J	L_Protocol_strsplit118
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit156:
L_Protocol_strsplit155:
L_Protocol_strsplit154:
;Protocol.c,332 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,333 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,334 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,335 :: 		continue;
J	L_Protocol_strsplit115
NOP	
;Protocol.c,336 :: 		}else{
L_Protocol_strsplit118:
;Protocol.c,337 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,339 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit339
NOP	
J	L_Protocol_strsplit120
NOP	
L_Protocol_strsplit339:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,340 :: 		break;
J	L_Protocol_strsplit114
NOP	
L_Protocol_strsplit120:
;Protocol.c,341 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit115:
;Protocol.c,329 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,341 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit113
NOP	
L_Protocol_strsplit114:
;Protocol.c,342 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,343 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,344 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,348 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,351 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,352 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,354 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,355 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str121:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str342
NOP	
J	L_Protocol_cpy_val_from_str122
NOP	
L_Protocol_cpy_val_from_str342:
;Protocol.c,356 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,357 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,358 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str121
NOP	
L_Protocol_cpy_val_from_str122:
;Protocol.c,359 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,361 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,362 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,367 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,369 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,371 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,373 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int123:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int344
NOP	
J	L_Protocol_str2int124
NOP	
L_Protocol_str2int344:
;Protocol.c,374 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,375 :: 		while(DMA_Busy(1));
L_Protocol_str2int126:
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
BNE	R2, R0, L_Protocol_str2int346
NOP	
J	L_Protocol_str2int127
NOP	
L_Protocol_str2int346:
J	L_Protocol_str2int126
NOP	
L_Protocol_str2int127:
;Protocol.c,373 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,376 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int123
NOP	
L_Protocol_str2int124:
;Protocol.c,378 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,379 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
Protocol_PrintDebug:
;Protocol.c,384 :: 		static void PrintDebug(char c,char *strB,void *ptr){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Protocol.c,388 :: 		switch(c){
J	L_Protocol_PrintDebug128
NOP	
;Protocol.c,389 :: 		case 'G':case 'g':
L_Protocol_PrintDebug130:
L_Protocol_PrintDebug131:
;Protocol.c,390 :: 		case 'F':case 'f':
L_Protocol_PrintDebug132:
L_Protocol_PrintDebug133:
;Protocol.c,391 :: 		case 'M':case 'm':
L_Protocol_PrintDebug134:
L_Protocol_PrintDebug135:
;Protocol.c,392 :: 		case 'S':case 's':
L_Protocol_PrintDebug136:
L_Protocol_PrintDebug137:
;Protocol.c,393 :: 		case 'P':case 'p':
L_Protocol_PrintDebug138:
L_Protocol_PrintDebug139:
;Protocol.c,394 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,395 :: 		while(DMA_Busy(1));
L_Protocol_PrintDebug140:
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
BNE	R2, R0, L_Protocol_PrintDebug349
NOP	
J	L_Protocol_PrintDebug141
NOP	
L_Protocol_PrintDebug349:
J	L_Protocol_PrintDebug140
NOP	
L_Protocol_PrintDebug141:
;Protocol.c,396 :: 		dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
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
;Protocol.c,397 :: 		break;
J	L_Protocol_PrintDebug129
NOP	
;Protocol.c,398 :: 		case 'X':case 'x':
L_Protocol_PrintDebug142:
L_Protocol_PrintDebug143:
;Protocol.c,399 :: 		case 'Y':case 'y':
L_Protocol_PrintDebug144:
L_Protocol_PrintDebug145:
;Protocol.c,400 :: 		case 'Z':case 'z':
L_Protocol_PrintDebug146:
L_Protocol_PrintDebug147:
;Protocol.c,401 :: 		case 'A':case 'a':
L_Protocol_PrintDebug148:
L_Protocol_PrintDebug149:
;Protocol.c,402 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,403 :: 		while(DMA_Busy(1));
L_Protocol_PrintDebug150:
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
BNE	R2, R0, L_Protocol_PrintDebug351
NOP	
J	L_Protocol_PrintDebug151
NOP	
L_Protocol_PrintDebug351:
J	L_Protocol_PrintDebug150
NOP	
L_Protocol_PrintDebug151:
;Protocol.c,404 :: 		dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
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
;Protocol.c,405 :: 		break;
J	L_Protocol_PrintDebug129
NOP	
;Protocol.c,406 :: 		default:break;
L_Protocol_PrintDebug152:
J	L_Protocol_PrintDebug129
NOP	
;Protocol.c,407 :: 		}
L_Protocol_PrintDebug128:
ANDI	R3, R25, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_PrintDebug353
NOP	
J	L_Protocol_PrintDebug130
NOP	
L_Protocol_PrintDebug353:
ANDI	R3, R25, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_PrintDebug355
NOP	
J	L_Protocol_PrintDebug131
NOP	
L_Protocol_PrintDebug355:
ANDI	R3, R25, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_PrintDebug357
NOP	
J	L_Protocol_PrintDebug132
NOP	
L_Protocol_PrintDebug357:
ANDI	R3, R25, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_PrintDebug359
NOP	
J	L_Protocol_PrintDebug133
NOP	
L_Protocol_PrintDebug359:
ANDI	R3, R25, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_PrintDebug361
NOP	
J	L_Protocol_PrintDebug134
NOP	
L_Protocol_PrintDebug361:
ANDI	R3, R25, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_PrintDebug363
NOP	
J	L_Protocol_PrintDebug135
NOP	
L_Protocol_PrintDebug363:
ANDI	R3, R25, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_PrintDebug365
NOP	
J	L_Protocol_PrintDebug136
NOP	
L_Protocol_PrintDebug365:
ANDI	R3, R25, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_PrintDebug367
NOP	
J	L_Protocol_PrintDebug137
NOP	
L_Protocol_PrintDebug367:
ANDI	R3, R25, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_PrintDebug369
NOP	
J	L_Protocol_PrintDebug138
NOP	
L_Protocol_PrintDebug369:
ANDI	R3, R25, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_PrintDebug371
NOP	
J	L_Protocol_PrintDebug139
NOP	
L_Protocol_PrintDebug371:
ANDI	R3, R25, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_PrintDebug373
NOP	
J	L_Protocol_PrintDebug142
NOP	
L_Protocol_PrintDebug373:
ANDI	R3, R25, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_PrintDebug375
NOP	
J	L_Protocol_PrintDebug143
NOP	
L_Protocol_PrintDebug375:
ANDI	R3, R25, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_PrintDebug377
NOP	
J	L_Protocol_PrintDebug144
NOP	
L_Protocol_PrintDebug377:
ANDI	R3, R25, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_PrintDebug379
NOP	
J	L_Protocol_PrintDebug145
NOP	
L_Protocol_PrintDebug379:
ANDI	R3, R25, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_PrintDebug381
NOP	
J	L_Protocol_PrintDebug146
NOP	
L_Protocol_PrintDebug381:
ANDI	R3, R25, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_PrintDebug383
NOP	
J	L_Protocol_PrintDebug147
NOP	
L_Protocol_PrintDebug383:
ANDI	R3, R25, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_PrintDebug385
NOP	
J	L_Protocol_PrintDebug148
NOP	
L_Protocol_PrintDebug385:
ANDI	R3, R25, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_PrintDebug387
NOP	
J	L_Protocol_PrintDebug149
NOP	
L_Protocol_PrintDebug387:
J	L_Protocol_PrintDebug152
NOP	
L_Protocol_PrintDebug129:
;Protocol.c,408 :: 		return;
;Protocol.c,409 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Protocol_PrintDebug
