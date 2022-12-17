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
BNE	R2, R0, L__Str_Initialize104
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize104:
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
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;Protocol.c,32 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
SH	R2, 84(SP)
;Protocol.c,34 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer106
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer106:
;Protocol.c,35 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Protocol.c,36 :: 		F_1_Once = no_of_axis = 0 ; //for buffer and axis refreshing
SB	R0, 82(SP)
;Protocol.c,37 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 20
LH	R26, 84(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,38 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 20
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strsplit+0
NOP	
;Protocol.c,39 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,40 :: 		case 'G':
L_Sample_Ringbuffer6:
;Protocol.c,42 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer107
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer107:
;Protocol.c,43 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,44 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,45 :: 		G_Mode(G_Val);
SEH	R25, R2
JAL	_G_Mode+0
NOP	
;Protocol.c,54 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer109
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer109:
;Protocol.c,55 :: 		xyz[0] = *(*(gcode+1)+0); no_of_axis++;
ADDIU	R3, SP, 76
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,56 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,57 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer9
NOP	
;Protocol.c,58 :: 		case 'X':case 'x':
L_Sample_Ringbuffer11:
L_Sample_Ringbuffer12:
;Protocol.c,59 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer13:
L_Sample_Ringbuffer14:
;Protocol.c,60 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer15:
L_Sample_Ringbuffer16:
;Protocol.c,61 :: 		case 'A':case 'a':
L_Sample_Ringbuffer17:
L_Sample_Ringbuffer18:
;Protocol.c,62 :: 		case 'E':case 'e':
L_Sample_Ringbuffer19:
L_Sample_Ringbuffer20:
;Protocol.c,63 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,64 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,68 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,69 :: 		case 'F':
L_Sample_Ringbuffer21:
;Protocol.c,70 :: 		case 'f':
L_Sample_Ringbuffer22:
;Protocol.c,71 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer110
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer110:
;Protocol.c,72 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,73 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,74 :: 		status = Instruction_Values(*gcode[1],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,79 :: 		}
L_Sample_Ringbuffer23:
;Protocol.c,80 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,81 :: 		}
L_Sample_Ringbuffer9:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer112
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer112:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer114
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer114:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer116
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer116:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer118
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer118:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer120
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer120:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer122
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer122:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer124
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer124:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer126
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer128
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer130
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer130:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer132
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer132:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer134
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer134:
L_Sample_Ringbuffer10:
;Protocol.c,82 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,86 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer136
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer136:
;Protocol.c,87 :: 		xyz[1] = *(*(gcode+2)+0);no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+120)(GP)
SB	R2, 0(R3)
;Protocol.c,88 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,89 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer25
NOP	
;Protocol.c,91 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer27:
L_Sample_Ringbuffer28:
;Protocol.c,92 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer29:
L_Sample_Ringbuffer30:
;Protocol.c,93 :: 		case 'A':case 'a':
L_Sample_Ringbuffer31:
L_Sample_Ringbuffer32:
;Protocol.c,94 :: 		case 'E':case 'e':
L_Sample_Ringbuffer33:
L_Sample_Ringbuffer34:
;Protocol.c,95 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,96 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,100 :: 		break;
J	L_Sample_Ringbuffer26
NOP	
;Protocol.c,101 :: 		case 'F':
L_Sample_Ringbuffer35:
;Protocol.c,102 :: 		case 'f':
L_Sample_Ringbuffer36:
;Protocol.c,103 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer137
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer137:
;Protocol.c,104 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,105 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,106 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,110 :: 		}
L_Sample_Ringbuffer37:
;Protocol.c,111 :: 		break;
J	L_Sample_Ringbuffer26
NOP	
;Protocol.c,113 :: 		}
L_Sample_Ringbuffer25:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer139
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer139:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer141
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer141:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer143
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer143:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer145
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer147
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer149
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer149:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer151
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer151:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer153
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer153:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer155
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer155:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer157
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer157:
L_Sample_Ringbuffer26:
;Protocol.c,114 :: 		}
L_Sample_Ringbuffer24:
;Protocol.c,117 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer159
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer159:
;Protocol.c,118 :: 		xyz[2] = *(*(gcode+3)+0); no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 2
LBU	R2, Offset(_gcode+180)(GP)
SB	R2, 0(R3)
;Protocol.c,119 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,120 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer39
NOP	
;Protocol.c,125 :: 		case 'E':case 'e':
L_Sample_Ringbuffer41:
L_Sample_Ringbuffer42:
;Protocol.c,126 :: 		case 'R':case 'r':
L_Sample_Ringbuffer43:
L_Sample_Ringbuffer44:
;Protocol.c,127 :: 		case 'I':case 'i':
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer46:
;Protocol.c,128 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,129 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,133 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,134 :: 		case 'F':
L_Sample_Ringbuffer47:
;Protocol.c,135 :: 		case 'f':
L_Sample_Ringbuffer48:
;Protocol.c,136 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer160
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer160:
;Protocol.c,137 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,138 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,139 :: 		status = Instruction_Values(gcode[3],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,143 :: 		}
L_Sample_Ringbuffer49:
;Protocol.c,144 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,146 :: 		}
L_Sample_Ringbuffer39:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer162
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer164
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer164:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer166:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer168:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer172
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer174
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer174:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer176
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer176:
L_Sample_Ringbuffer40:
;Protocol.c,147 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,151 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer178
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer178:
;Protocol.c,152 :: 		xyz[3] = *(*(gcode+4)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 3
LBU	R2, Offset(_gcode+240)(GP)
SB	R2, 0(R3)
;Protocol.c,153 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,154 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer51
NOP	
;Protocol.c,155 :: 		case 'J':case 'j':
L_Sample_Ringbuffer53:
L_Sample_Ringbuffer54:
;Protocol.c,156 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,157 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,161 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,162 :: 		case 'F':
L_Sample_Ringbuffer55:
;Protocol.c,163 :: 		case 'f':
L_Sample_Ringbuffer56:
;Protocol.c,164 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer179
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer179:
;Protocol.c,165 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,166 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,167 :: 		status = Instruction_Values(gcode[4],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,171 :: 		}
L_Sample_Ringbuffer57:
;Protocol.c,172 :: 		break;
J	L_Sample_Ringbuffer52
NOP	
;Protocol.c,174 :: 		}
L_Sample_Ringbuffer51:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer181
NOP	
J	L_Sample_Ringbuffer53
NOP	
L__Sample_Ringbuffer181:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer183
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer183:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer185
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer185:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer187
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer187:
L_Sample_Ringbuffer52:
;Protocol.c,175 :: 		}
L_Sample_Ringbuffer50:
;Protocol.c,178 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer189
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer189:
;Protocol.c,179 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 76
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,180 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,181 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer59
NOP	
;Protocol.c,182 :: 		case 'J':case 'j':
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,183 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,184 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,188 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,189 :: 		case 'F':
L_Sample_Ringbuffer63:
;Protocol.c,190 :: 		case 'f':
L_Sample_Ringbuffer64:
;Protocol.c,191 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer190
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer190:
;Protocol.c,192 :: 		F_1_Once = 1;
ORI	R2, R0, 1
SB	R2, 82(SP)
;Protocol.c,193 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,194 :: 		status = Instruction_Values(gcode[5],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,198 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,199 :: 		break;
J	L_Sample_Ringbuffer60
NOP	
;Protocol.c,201 :: 		}
L_Sample_Ringbuffer59:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer192
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer192:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer194
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer194:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer196
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer196:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer198
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer198:
L_Sample_Ringbuffer60:
;Protocol.c,202 :: 		}
L_Sample_Ringbuffer58:
;Protocol.c,205 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer200
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer200:
;Protocol.c,206 :: 		xyz[5] = *(*(gcode+6)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 5
LBU	R2, Offset(_gcode+360)(GP)
SB	R2, 0(R3)
;Protocol.c,207 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,208 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer67
NOP	
;Protocol.c,209 :: 		case 'J':case 'j':
L_Sample_Ringbuffer69:
L_Sample_Ringbuffer70:
;Protocol.c,210 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 92(SP)
;Protocol.c,211 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,215 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,216 :: 		case 'F':
L_Sample_Ringbuffer71:
;Protocol.c,217 :: 		case 'f':
L_Sample_Ringbuffer72:
;Protocol.c,218 :: 		if(!F_1_Once){
LBU	R2, 82(SP)
BEQ	R2, R0, L__Sample_Ringbuffer201
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer201:
;Protocol.c,220 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 86(SP)
;Protocol.c,221 :: 		status = Instruction_Values(gcode[6],&F_Val);
ADDIU	R2, SP, 86
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,225 :: 		}
L_Sample_Ringbuffer73:
;Protocol.c,226 :: 		break;
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,228 :: 		}
L_Sample_Ringbuffer67:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer203
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer203:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer205
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer205:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer207
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer207:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer209
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer209:
L_Sample_Ringbuffer68:
;Protocol.c,229 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,230 :: 		}else{
J	L_Sample_Ringbuffer74
NOP	
L_Sample_Ringbuffer7:
;Protocol.c,231 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,232 :: 		}
L_Sample_Ringbuffer74:
;Protocol.c,233 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,234 :: 		case 'M':
L_Sample_Ringbuffer75:
;Protocol.c,235 :: 		case 'm':
L_Sample_Ringbuffer76:
;Protocol.c,237 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,238 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,239 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,245 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer211
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer211:
;Protocol.c,246 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer78
NOP	
;Protocol.c,247 :: 		case 'S':
L_Sample_Ringbuffer80:
;Protocol.c,248 :: 		case 's':
L_Sample_Ringbuffer81:
;Protocol.c,250 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,251 :: 		S_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 88(SP)
;Protocol.c,252 :: 		status = Instruction_Values(gcode[1],&S_Val);
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,256 :: 		break;
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,257 :: 		}
L_Sample_Ringbuffer78:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer213
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer213:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer215
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer215:
L_Sample_Ringbuffer79:
;Protocol.c,258 :: 		}
L_Sample_Ringbuffer77:
;Protocol.c,259 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,260 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer217
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer217:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer219
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer219:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer221
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer221:
L_Sample_Ringbuffer5:
;Protocol.c,261 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
;Protocol.c,263 :: 		PrintStatus(status);
SEH	R25, R2
JAL	_PrintStatus+0
NOP	
;Protocol.c,265 :: 		Movement_Condition(gc.motion_mode);
LH	R25, Offset(_gc+14)(GP)
JAL	_Movement_Condition+0
NOP	
;Protocol.c,266 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,267 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,272 :: 		int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,274 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,275 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,276 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,277 :: 		for (i = 0; i < len;i++){
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
BNE	R2, R0, L__strsplit223
NOP	
J	L_strsplit83
NOP	
L__strsplit223:
;Protocol.c,278 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,279 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit225
NOP	
J	L__strsplit102
NOP	
L__strsplit225:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__strsplit227
NOP	
J	L__strsplit101
NOP	
L__strsplit227:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit228
NOP	
J	L__strsplit100
NOP	
L__strsplit228:
J	L_strsplit87
NOP	
; lasti end address is: 28 (R7)
L__strsplit102:
L__strsplit101:
L__strsplit100:
;Protocol.c,280 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,281 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,282 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,283 :: 		continue;
J	L_strsplit84
NOP	
;Protocol.c,284 :: 		}else{
L_strsplit87:
;Protocol.c,285 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,287 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit229
NOP	
J	L_strsplit89
NOP	
L__strsplit229:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,288 :: 		break;
J	L_strsplit83
NOP	
L_strsplit89:
;Protocol.c,289 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_strsplit84:
;Protocol.c,277 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,289 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_strsplit82
NOP	
L_strsplit83:
;Protocol.c,290 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,291 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,292 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _strsplit
_cpy_val_from_str:
;Protocol.c,296 :: 		int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,299 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,300 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,302 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,303 :: 		while(*tmp != 0){
L_cpy_val_from_str90:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpy_val_from_str232
NOP	
J	L_cpy_val_from_str91
NOP	
L__cpy_val_from_str232:
;Protocol.c,304 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,305 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,306 :: 		}
; tmp end address is: 16 (R4)
J	L_cpy_val_from_str90
NOP	
L_cpy_val_from_str91:
;Protocol.c,307 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,309 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,310 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of _cpy_val_from_str
_str2int:
;Protocol.c,315 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,317 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,319 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,321 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int92:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int234
NOP	
J	L_str2int93
NOP	
L__str2int234:
;Protocol.c,322 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,323 :: 		while(DMA_Busy(1));
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
BNE	R2, R0, L__str2int236
NOP	
J	L_str2int96
NOP	
L__str2int236:
J	L_str2int95
NOP	
L_str2int96:
;Protocol.c,321 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,324 :: 		}
; i end address is: 16 (R4)
J	L_str2int92
NOP	
L_str2int93:
;Protocol.c,326 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,327 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
_PrintStatus:
;Protocol.c,367 :: 		void PrintStatus(int state){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Protocol.c,368 :: 		while(DMA_Busy(1));
L_PrintStatus97:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__PrintStatus239
NOP	
J	L_PrintStatus98
NOP	
L__PrintStatus239:
J	L_PrintStatus97
NOP	
L_PrintStatus98:
;Protocol.c,369 :: 		dma_printf("gc.status:= %d\n",state);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Protocol.c,370 :: 		}
L_end_PrintStatus:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _PrintStatus
