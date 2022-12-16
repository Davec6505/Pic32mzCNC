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
BNE	R2, R0, L__Str_Initialize102
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize102:
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
;Protocol.c,19 :: 		void Sample_Ringbuffer(){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;Protocol.c,31 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,33 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer104
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer104:
;Protocol.c,34 :: 		F_1_Once = no_of_axis = 0 ; //for buffer and axis refreshing
SB	R0, 82(SP)
;Protocol.c,35 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 20
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,36 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 20
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strsplit+0
NOP	
;Protocol.c,37 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,38 :: 		case 'G':
L_Sample_Ringbuffer6:
;Protocol.c,40 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer105
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer105:
;Protocol.c,41 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,42 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,43 :: 		G_Mode(G_Val);
SEH	R25, R2
JAL	_G_Mode+0
NOP	
;Protocol.c,52 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer107
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer107:
;Protocol.c,53 :: 		xyz[0] = *(*(gcode+1)+0); no_of_axis++;
ADDIU	R3, SP, 76
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,54 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,55 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer9
NOP	
;Protocol.c,56 :: 		case 'X':case 'x':
L_Sample_Ringbuffer11:
L_Sample_Ringbuffer12:
;Protocol.c,57 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer13:
L_Sample_Ringbuffer14:
;Protocol.c,58 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer15:
L_Sample_Ringbuffer16:
;Protocol.c,59 :: 		case 'A':case 'a':
L_Sample_Ringbuffer17:
L_Sample_Ringbuffer18:
;Protocol.c,60 :: 		case 'E':case 'e':
L_Sample_Ringbuffer19:
L_Sample_Ringbuffer20:
;Protocol.c,61 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,62 :: 		Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,66 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,67 :: 		case 'F':
L_Sample_Ringbuffer21:
;Protocol.c,68 :: 		case 'f':
L_Sample_Ringbuffer22:
;Protocol.c,69 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer108
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer108:
;Protocol.c,70 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,71 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,72 :: 		Instruction_Values(*gcode[1],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,77 :: 		}
L_Sample_Ringbuffer23:
;Protocol.c,78 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,79 :: 		}
L_Sample_Ringbuffer9:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer110
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer110:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer112
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer112:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer114
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer114:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer116
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer116:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer118
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer118:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer120
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer120:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer122
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer122:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer124
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer124:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer126
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer128
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer130
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer130:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer132
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer132:
L_Sample_Ringbuffer10:
;Protocol.c,80 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,84 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer134
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer134:
;Protocol.c,85 :: 		xyz[1] = *(*(gcode+2)+0);no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+120)(GP)
SB	R2, 0(R3)
;Protocol.c,86 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,87 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer25
NOP	
;Protocol.c,89 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer27:
L_Sample_Ringbuffer28:
;Protocol.c,90 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer29:
L_Sample_Ringbuffer30:
;Protocol.c,91 :: 		case 'A':case 'a':
L_Sample_Ringbuffer31:
L_Sample_Ringbuffer32:
;Protocol.c,92 :: 		case 'E':case 'e':
L_Sample_Ringbuffer33:
L_Sample_Ringbuffer34:
;Protocol.c,93 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,94 :: 		Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,98 :: 		break;
J	L_Sample_Ringbuffer26
NOP	
;Protocol.c,99 :: 		case 'F':
L_Sample_Ringbuffer35:
;Protocol.c,100 :: 		case 'f':
L_Sample_Ringbuffer36:
;Protocol.c,101 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer135
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer135:
;Protocol.c,102 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,103 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,104 :: 		Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,108 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,109 :: 		break;
J	L_Sample_Ringbuffer26
NOP	
;Protocol.c,111 :: 		}
L_Sample_Ringbuffer25:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer137
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer137:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer139
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer139:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer141
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer141:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer143
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer143:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer145
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer147
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer149
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer149:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer151
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer151:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer153
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer153:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer155
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer155:
L_Sample_Ringbuffer26:
;Protocol.c,112 :: 		}
L_Sample_Ringbuffer24:
;Protocol.c,115 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer157
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer157:
;Protocol.c,116 :: 		xyz[2] = *(*(gcode+3)+0); no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 2
LBU	R2, Offset(_gcode+180)(GP)
SB	R2, 0(R3)
;Protocol.c,117 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,118 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer39
NOP	
;Protocol.c,123 :: 		case 'E':case 'e':
L_Sample_Ringbuffer41:
L_Sample_Ringbuffer42:
;Protocol.c,124 :: 		case 'R':case 'r':
L_Sample_Ringbuffer43:
L_Sample_Ringbuffer44:
;Protocol.c,125 :: 		case 'I':case 'i':
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer46:
;Protocol.c,126 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,127 :: 		Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,131 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,132 :: 		case 'F':
L_Sample_Ringbuffer47:
;Protocol.c,133 :: 		case 'f':
L_Sample_Ringbuffer48:
;Protocol.c,134 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer158
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer158:
;Protocol.c,135 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,136 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,137 :: 		Instruction_Values(gcode[3],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,141 :: 		}
L_Sample_Ringbuffer49:
;Protocol.c,142 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,144 :: 		}
L_Sample_Ringbuffer39:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer160
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer160:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer162
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer164
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer164:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer166:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer168:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer172
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer174
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer174:
L_Sample_Ringbuffer40:
;Protocol.c,145 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,149 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer176
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer176:
;Protocol.c,150 :: 		xyz[3] = *(*(gcode+4)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 3
LBU	R2, Offset(_gcode+240)(GP)
SB	R2, 0(R3)
;Protocol.c,151 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+240)
ORI	R26, R26, lo_addr(_gcode+240)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,152 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer51
NOP	
;Protocol.c,153 :: 		case 'J':case 'j':
L_Sample_Ringbuffer53:
L_Sample_Ringbuffer54:
;Protocol.c,154 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,155 :: 		Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,159 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,160 :: 		case 'F':
L_Sample_Ringbuffer55:
;Protocol.c,161 :: 		case 'f':
L_Sample_Ringbuffer56:
;Protocol.c,162 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer177
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer177:
;Protocol.c,163 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,164 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,165 :: 		Instruction_Values(gcode[4],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,169 :: 		}
L_Sample_Ringbuffer57:
;Protocol.c,170 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,172 :: 		}
L_Sample_Ringbuffer51:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer179
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer179:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer181
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer183
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer183:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer185
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer185:
L_Sample_Ringbuffer52:
;Protocol.c,173 :: 		}
L_Sample_Ringbuffer50:
;Protocol.c,176 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer187
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer187:
;Protocol.c,177 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,178 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+300)
ORI	R26, R26, lo_addr(_gcode+300)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,179 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer59
NOP	
;Protocol.c,180 :: 		case 'J':case 'j':
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,181 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,182 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,186 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,187 :: 		case 'F':
L_Sample_Ringbuffer63:
;Protocol.c,188 :: 		case 'f':
L_Sample_Ringbuffer64:
;Protocol.c,189 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer188
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer188:
;Protocol.c,190 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,191 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,192 :: 		Instruction_Values(gcode[5],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,196 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,197 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,199 :: 		}
L_Sample_Ringbuffer59:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer190
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer190:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer192
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer192:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer194
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer194:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer196
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer196:
L_Sample_Ringbuffer60:
;Protocol.c,200 :: 		}
L_Sample_Ringbuffer58:
;Protocol.c,203 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer198
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer198:
;Protocol.c,204 :: 		xyz[5] = *(*(gcode+6)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 5
LBU	R2, Offset(_gcode+360)(GP)
SB	R2, 0(R3)
;Protocol.c,205 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+360)
ORI	R26, R26, lo_addr(_gcode+360)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,206 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer67
NOP	
;Protocol.c,207 :: 		case 'J':case 'j':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
;Protocol.c,208 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 88(SP)
;Protocol.c,209 :: 		Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,213 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,214 :: 		case 'F':
L_Sample_Ringbuffer71:
;Protocol.c,215 :: 		case 'f':
L_Sample_Ringbuffer72:
;Protocol.c,216 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer199
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer199:
;Protocol.c,218 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 84(SP)
;Protocol.c,219 :: 		Instruction_Values(gcode[6],&F_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,223 :: 		}
L_Sample_Ringbuffer73:
;Protocol.c,224 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,226 :: 		}
L_Sample_Ringbuffer67:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer201
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer201:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer203
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer203:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer205:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer207
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer207:
L_Sample_Ringbuffer68:
;Protocol.c,227 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,228 :: 		}else{
J	L_Sample_Ringbuffer74
NOP	
L_Sample_Ringbuffer7:
;Protocol.c,229 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,230 :: 		}
L_Sample_Ringbuffer74:
;Protocol.c,231 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,232 :: 		case 'M':
L_Sample_Ringbuffer75:
;Protocol.c,233 :: 		case 'm':
L_Sample_Ringbuffer76:
;Protocol.c,235 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,236 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,237 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,243 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer209
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer209:
;Protocol.c,244 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer78
NOP	
;Protocol.c,245 :: 		case 'S':
L_Sample_Ringbuffer80:
;Protocol.c,246 :: 		case 's':
L_Sample_Ringbuffer81:
;Protocol.c,248 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 70
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,249 :: 		S_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,250 :: 		Instruction_Values(gcode[1],&S_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,254 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,255 :: 		}
L_Sample_Ringbuffer78:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer211
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer211:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer213
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer213:
L_Sample_Ringbuffer79:
;Protocol.c,256 :: 		}
L_Sample_Ringbuffer77:
;Protocol.c,257 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,258 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer215
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer215:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer217
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer217:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer219
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer219:
L_Sample_Ringbuffer5:
;Protocol.c,259 :: 		Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
;Protocol.c,260 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,261 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,266 :: 		int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,268 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,269 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,270 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,271 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_strsplit82:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__strsplit221
NOP	
J	L_strsplit83
NOP	
L__strsplit221:
;Protocol.c,272 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,273 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit223
NOP	
J	L__strsplit100
NOP	
L__strsplit223:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__strsplit225
NOP	
J	L__strsplit99
NOP	
L__strsplit225:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit226
NOP	
J	L__strsplit98
NOP	
L__strsplit226:
J	L_strsplit87
NOP	
; lasti end address is: 28 (R7)
L__strsplit100:
L__strsplit99:
L__strsplit98:
;Protocol.c,274 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,275 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,276 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,277 :: 		continue;
J	L_strsplit84
NOP	
;Protocol.c,278 :: 		}else{
L_strsplit87:
;Protocol.c,279 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,281 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit227
NOP	
J	L_strsplit89
NOP	
L__strsplit227:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,282 :: 		break;
J	L_strsplit83
NOP	
L_strsplit89:
;Protocol.c,283 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_strsplit84:
;Protocol.c,271 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,283 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_strsplit82
NOP	
L_strsplit83:
;Protocol.c,284 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,285 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,286 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _strsplit
_cpy_val_from_str:
;Protocol.c,290 :: 		int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,293 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,294 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,296 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,297 :: 		while(*tmp != 0){
L_cpy_val_from_str90:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpy_val_from_str230
NOP	
J	L_cpy_val_from_str91
NOP	
L__cpy_val_from_str230:
;Protocol.c,298 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,299 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,300 :: 		}
; tmp end address is: 16 (R4)
J	L_cpy_val_from_str90
NOP	
L_cpy_val_from_str91:
;Protocol.c,301 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,303 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,304 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of _cpy_val_from_str
_str2int:
;Protocol.c,309 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,311 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,313 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,315 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int92:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int232
NOP	
J	L_str2int93
NOP	
L__str2int232:
;Protocol.c,316 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,317 :: 		while(DMA_Busy(1));
L_str2int95:
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
BNE	R2, R0, L__str2int234
NOP	
J	L_str2int96
NOP	
L__str2int234:
J	L_str2int95
NOP	
L_str2int96:
;Protocol.c,315 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,318 :: 		}
; i end address is: 16 (R4)
J	L_str2int92
NOP	
L_str2int93:
;Protocol.c,320 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,321 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
