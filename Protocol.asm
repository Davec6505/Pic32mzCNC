_Str_Initialize:
;Protocol.c,6 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,9 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 11
BNE	R2, R0, L__Str_Initialize81
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize81:
;Protocol.c,10 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,9 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,13 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,14 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Sample_Ringbuffer:
;Protocol.c,17 :: 		void Sample_Ringbuffer(){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;Protocol.c,28 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,30 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer83
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer83:
;Protocol.c,31 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 20
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,32 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 20
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strsplit+0
NOP	
;Protocol.c,33 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,34 :: 		case 'G':
L_Sample_Ringbuffer6:
;Protocol.c,36 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer84
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer84:
;Protocol.c,37 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,38 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,39 :: 		G_Mode(G_Val);
SEH	R25, R2
JAL	_G_Mode+0
NOP	
;Protocol.c,46 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer86
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer86:
;Protocol.c,47 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,48 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer9
NOP	
;Protocol.c,49 :: 		case 'X':
L_Sample_Ringbuffer11:
;Protocol.c,50 :: 		case 'x':
L_Sample_Ringbuffer12:
;Protocol.c,51 :: 		case 'Y':
L_Sample_Ringbuffer13:
;Protocol.c,52 :: 		case 'y':
L_Sample_Ringbuffer14:
;Protocol.c,53 :: 		case 'Z':
L_Sample_Ringbuffer15:
;Protocol.c,54 :: 		case 'z':
L_Sample_Ringbuffer16:
;Protocol.c,55 :: 		case 'A':
L_Sample_Ringbuffer17:
;Protocol.c,56 :: 		case 'a':
L_Sample_Ringbuffer18:
;Protocol.c,57 :: 		case 'E':
L_Sample_Ringbuffer19:
;Protocol.c,58 :: 		case 'e':
L_Sample_Ringbuffer20:
;Protocol.c,59 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 84(SP)
;Protocol.c,60 :: 		G_Instruction(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_G_Instruction+0
NOP	
;Protocol.c,64 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,65 :: 		case 'F':
L_Sample_Ringbuffer21:
;Protocol.c,66 :: 		case 'f':
L_Sample_Ringbuffer22:
;Protocol.c,67 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 82(SP)
;Protocol.c,68 :: 		G_Instruction(*gcode[1],&F_Val);
ADDIU	R2, SP, 82
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	_G_Instruction+0
NOP	
;Protocol.c,72 :: 		break;
J	L_Sample_Ringbuffer10
NOP	
;Protocol.c,73 :: 		}
L_Sample_Ringbuffer9:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer88
NOP	
J	L_Sample_Ringbuffer11
NOP	
L__Sample_Ringbuffer88:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer90
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer90:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer92
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer92:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer94
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer94:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer96
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer96:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer98
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer98:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer100
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer100:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer102
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer102:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer104
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer104:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer106
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer106:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer108
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer108:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer110
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer110:
L_Sample_Ringbuffer10:
;Protocol.c,74 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,76 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer112
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer112:
;Protocol.c,77 :: 		xyz[1] = *(*(gcode+2)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+120)(GP)
SB	R2, 0(R3)
;Protocol.c,78 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,79 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer24
NOP	
;Protocol.c,80 :: 		case 'X':
L_Sample_Ringbuffer26:
;Protocol.c,81 :: 		case 'x':
L_Sample_Ringbuffer27:
;Protocol.c,82 :: 		case 'Y':
L_Sample_Ringbuffer28:
;Protocol.c,83 :: 		case 'y':
L_Sample_Ringbuffer29:
;Protocol.c,84 :: 		case 'Z':
L_Sample_Ringbuffer30:
;Protocol.c,85 :: 		case 'z':
L_Sample_Ringbuffer31:
;Protocol.c,86 :: 		case 'A':
L_Sample_Ringbuffer32:
;Protocol.c,87 :: 		case 'a':
L_Sample_Ringbuffer33:
;Protocol.c,88 :: 		case 'E':
L_Sample_Ringbuffer34:
;Protocol.c,89 :: 		case 'e':
L_Sample_Ringbuffer35:
;Protocol.c,90 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 84(SP)
;Protocol.c,91 :: 		G_Instruction(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_G_Instruction+0
NOP	
;Protocol.c,95 :: 		break;
J	L_Sample_Ringbuffer25
NOP	
;Protocol.c,96 :: 		case 'F':
L_Sample_Ringbuffer36:
;Protocol.c,97 :: 		case 'f':
L_Sample_Ringbuffer37:
;Protocol.c,98 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 82(SP)
;Protocol.c,99 :: 		G_Instruction(gcode[2],&F_Val);
ADDIU	R2, SP, 82
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_G_Instruction+0
NOP	
;Protocol.c,103 :: 		break;
J	L_Sample_Ringbuffer25
NOP	
;Protocol.c,105 :: 		}
L_Sample_Ringbuffer24:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer114
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer114:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer116
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer116:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer118
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer118:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer120
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer120:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer122
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer122:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer124
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer124:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer126
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer126:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer128
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer130
NOP	
J	L_Sample_Ringbuffer34
NOP	
L__Sample_Ringbuffer130:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer132
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer132:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer134
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer134:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer136
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer136:
L_Sample_Ringbuffer25:
;Protocol.c,106 :: 		}
L_Sample_Ringbuffer23:
;Protocol.c,108 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer138
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer138:
;Protocol.c,109 :: 		xyz[2] = *(*(gcode+3)+0);
ADDIU	R2, SP, 76
ADDIU	R3, R2, 2
LBU	R2, Offset(_gcode+180)(GP)
SB	R2, 0(R3)
;Protocol.c,110 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,111 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer39
NOP	
;Protocol.c,112 :: 		case 'X':
L_Sample_Ringbuffer41:
;Protocol.c,113 :: 		case 'x':
L_Sample_Ringbuffer42:
;Protocol.c,114 :: 		case 'Y':
L_Sample_Ringbuffer43:
;Protocol.c,115 :: 		case 'y':
L_Sample_Ringbuffer44:
;Protocol.c,116 :: 		case 'Z':
L_Sample_Ringbuffer45:
;Protocol.c,117 :: 		case 'z':
L_Sample_Ringbuffer46:
;Protocol.c,118 :: 		case 'A':
L_Sample_Ringbuffer47:
;Protocol.c,119 :: 		case 'a':
L_Sample_Ringbuffer48:
;Protocol.c,120 :: 		case 'E':
L_Sample_Ringbuffer49:
;Protocol.c,121 :: 		case 'e':
L_Sample_Ringbuffer50:
;Protocol.c,122 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 84(SP)
;Protocol.c,123 :: 		G_Instruction(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 84
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_G_Instruction+0
NOP	
;Protocol.c,127 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,128 :: 		case 'F':
L_Sample_Ringbuffer51:
;Protocol.c,129 :: 		case 'f':
L_Sample_Ringbuffer52:
;Protocol.c,130 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 82(SP)
;Protocol.c,131 :: 		G_Instruction(gcode[3],&F_Val);
ADDIU	R2, SP, 82
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_G_Instruction+0
NOP	
;Protocol.c,135 :: 		break;
J	L_Sample_Ringbuffer40
NOP	
;Protocol.c,137 :: 		}
L_Sample_Ringbuffer39:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer140
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer140:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer142
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer142:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer144
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer144:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer146
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer146:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer148
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer148:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer150
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer150:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer152
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer152:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer154
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer154:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer156
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer156:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer158
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer158:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer160
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer160:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer162
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer162:
L_Sample_Ringbuffer40:
;Protocol.c,138 :: 		}
L_Sample_Ringbuffer38:
;Protocol.c,139 :: 		}else{
J	L_Sample_Ringbuffer53
NOP	
L_Sample_Ringbuffer7:
;Protocol.c,140 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,141 :: 		}
L_Sample_Ringbuffer53:
;Protocol.c,142 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,143 :: 		case 'M':
L_Sample_Ringbuffer54:
;Protocol.c,144 :: 		case 'm':
L_Sample_Ringbuffer55:
;Protocol.c,146 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,147 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,154 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer164
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer164:
;Protocol.c,155 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer57
NOP	
;Protocol.c,156 :: 		case 'S':
L_Sample_Ringbuffer59:
;Protocol.c,157 :: 		case 's':
L_Sample_Ringbuffer60:
;Protocol.c,159 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,160 :: 		S_Val = atoi(temp);
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,164 :: 		break;
J	L_Sample_Ringbuffer58
NOP	
;Protocol.c,165 :: 		}
L_Sample_Ringbuffer57:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer166:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer168:
L_Sample_Ringbuffer58:
;Protocol.c,166 :: 		}
L_Sample_Ringbuffer56:
;Protocol.c,167 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,168 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer170:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer172
NOP	
J	L_Sample_Ringbuffer54
NOP	
L__Sample_Ringbuffer172:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer174
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer174:
L_Sample_Ringbuffer5:
;Protocol.c,170 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,172 :: 		memset(str,0,30);
ADDIU	R2, SP, 20
ORI	R27, R0, 30
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,173 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,179 :: 		int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,181 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,182 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,183 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,184 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_strsplit61:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__strsplit176
NOP	
J	L_strsplit62
NOP	
L__strsplit176:
;Protocol.c,185 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,186 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit178
NOP	
J	L__strsplit79
NOP	
L__strsplit178:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__strsplit180
NOP	
J	L__strsplit78
NOP	
L__strsplit180:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit181
NOP	
J	L__strsplit77
NOP	
L__strsplit181:
J	L_strsplit66
NOP	
; lasti end address is: 28 (R7)
L__strsplit79:
L__strsplit78:
L__strsplit77:
;Protocol.c,187 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,188 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,189 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,190 :: 		continue;
J	L_strsplit63
NOP	
;Protocol.c,191 :: 		}else{
L_strsplit66:
;Protocol.c,192 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,194 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit182
NOP	
J	L_strsplit68
NOP	
L__strsplit182:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,195 :: 		break;
J	L_strsplit62
NOP	
L_strsplit68:
;Protocol.c,196 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_strsplit63:
;Protocol.c,184 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,196 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_strsplit61
NOP	
L_strsplit62:
;Protocol.c,197 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,198 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,199 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _strsplit
_cpy_val_from_str:
;Protocol.c,201 :: 		int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,204 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,205 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,207 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,208 :: 		while(*tmp != 0){
L_cpy_val_from_str69:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpy_val_from_str185
NOP	
J	L_cpy_val_from_str70
NOP	
L__cpy_val_from_str185:
;Protocol.c,209 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,210 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,211 :: 		}
; tmp end address is: 16 (R4)
J	L_cpy_val_from_str69
NOP	
L_cpy_val_from_str70:
;Protocol.c,212 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,214 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,215 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of _cpy_val_from_str
_str2int:
;Protocol.c,220 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,222 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,224 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,226 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int71:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int187
NOP	
J	L_str2int72
NOP	
L__str2int187:
;Protocol.c,227 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,228 :: 		while(DMA_Busy(1));
L_str2int74:
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
BNE	R2, R0, L__str2int189
NOP	
J	L_str2int75
NOP	
L__str2int189:
J	L_str2int74
NOP	
L_str2int75:
;Protocol.c,226 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,229 :: 		}
; i end address is: 16 (R4)
J	L_str2int71
NOP	
L_str2int72:
;Protocol.c,231 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,232 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
