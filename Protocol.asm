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
BNE	R2, R0, L__Str_Initialize177
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize177:
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
ADDIU	SP, SP, -108
SW	RA, 0(SP)
;Protocol.c,38 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,40 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer180
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer180:
;Protocol.c,41 :: 		G_Initialise();
SH	R3, 20(SP)
JAL	_G_Initialise+0
NOP	
;Protocol.c,44 :: 		Str_clear(str,str_len);    //reset the string to empty
ADDIU	R2, SP, 24
LH	R26, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R3, 20(SP)
;Protocol.c,45 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 24
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,46 :: 		str_len = strlen(str);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,48 :: 		num_of_strings = strsplit(gcode,str,0x20);
ADDIU	R2, SP, 24
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit+0
NOP	
;Protocol.c,59 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 104(SP)
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,60 :: 		case 'G':case 'g':
L_Sample_Ringbuffer6:
L_Sample_Ringbuffer7:
;Protocol.c,62 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer181
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer181:
;Protocol.c,63 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,64 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer182
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer182:
;Protocol.c,65 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 90(SP)
;Protocol.c,68 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer184
NOP	
J	L__Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer184:
LH	R3, 90(SP)
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer186
NOP	
J	L__Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer186:
LH	R3, 90(SP)
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer188
NOP	
J	L__Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer188:
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer175:
L__Sample_Ringbuffer174:
L__Sample_Ringbuffer173:
;Protocol.c,69 :: 		G_Val *= 10;
LH	R3, 90(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 90(SP)
L_Sample_Ringbuffer12:
;Protocol.c,70 :: 		}else{
J	L_Sample_Ringbuffer13
NOP	
L_Sample_Ringbuffer9:
;Protocol.c,72 :: 		G_Val = (int)(atof(temp)*10.0);
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
SH	R2, 90(SP)
;Protocol.c,73 :: 		}
L_Sample_Ringbuffer13:
;Protocol.c,75 :: 		motion_mode = G_Mode(G_Val);
LH	R25, 90(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,77 :: 		PrintDebug(*(*(gcode)+0),temp,&G_Val);
ADDIU	R3, SP, 90
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+0)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,85 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer190
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer190:
;Protocol.c,87 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,88 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer15
NOP	
;Protocol.c,89 :: 		case 'X':case 'x':
L_Sample_Ringbuffer17:
L_Sample_Ringbuffer18:
;Protocol.c,90 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer19:
L_Sample_Ringbuffer20:
;Protocol.c,91 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer21:
L_Sample_Ringbuffer22:
;Protocol.c,92 :: 		case 'A':case 'a':
L_Sample_Ringbuffer23:
L_Sample_Ringbuffer24:
;Protocol.c,93 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,94 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,96 :: 		PrintDebug(*gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,98 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,99 :: 		case 'L':case 'l':
L_Sample_Ringbuffer25:
L_Sample_Ringbuffer26:
;Protocol.c,100 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,101 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,103 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,105 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,106 :: 		case 'F':case 'f':
L_Sample_Ringbuffer27:
L_Sample_Ringbuffer28:
;Protocol.c,107 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,108 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,110 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,112 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,113 :: 		case 'P':case 'p':
L_Sample_Ringbuffer29:
L_Sample_Ringbuffer30:
;Protocol.c,114 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,115 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,117 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,119 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,120 :: 		case 'S':case 's':
L_Sample_Ringbuffer31:
L_Sample_Ringbuffer32:
;Protocol.c,121 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,122 :: 		status = Instruction_Values(gcode[1],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,124 :: 		PrintDebug(*gcode[1],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+60)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,126 :: 		break;
J	L_Sample_Ringbuffer16
NOP	
;Protocol.c,127 :: 		}
L_Sample_Ringbuffer15:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer192
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer192:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer194
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer194:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer196
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer196:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer198
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer198:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer200
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer200:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer202
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer202:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer204
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer204:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer206
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer206:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer208
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer208:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer210
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer210:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer212
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer212:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer214
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer214:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer216
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer216:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer218
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer218:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer220
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer220:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer222
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer222:
L_Sample_Ringbuffer16:
;Protocol.c,128 :: 		}
L_Sample_Ringbuffer14:
;Protocol.c,133 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+120)(GP)
BNE	R2, R0, L__Sample_Ringbuffer224
NOP	
J	L_Sample_Ringbuffer33
NOP	
L__Sample_Ringbuffer224:
;Protocol.c,135 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,136 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer34
NOP	
;Protocol.c,137 :: 		case 'X':case 'x':
L_Sample_Ringbuffer36:
L_Sample_Ringbuffer37:
;Protocol.c,138 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer38:
L_Sample_Ringbuffer39:
;Protocol.c,139 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer40:
L_Sample_Ringbuffer41:
;Protocol.c,140 :: 		case 'A':case 'a':
L_Sample_Ringbuffer42:
L_Sample_Ringbuffer43:
;Protocol.c,141 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,142 :: 		status = Instruction_Values(gcode[2],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,144 :: 		PrintDebug(*gcode[2],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,146 :: 		break;
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,147 :: 		case 'L':case 'l':
L_Sample_Ringbuffer44:
L_Sample_Ringbuffer45:
;Protocol.c,148 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,149 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,151 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,153 :: 		break;
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,154 :: 		case 'F':case 'f':
L_Sample_Ringbuffer46:
L_Sample_Ringbuffer47:
;Protocol.c,155 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,156 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,158 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,160 :: 		break;
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,161 :: 		case 'P':case 'p':
L_Sample_Ringbuffer48:
L_Sample_Ringbuffer49:
;Protocol.c,162 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,163 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,165 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,167 :: 		break;
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,168 :: 		case 'S':case 's':
L_Sample_Ringbuffer50:
L_Sample_Ringbuffer51:
;Protocol.c,169 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,170 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,172 :: 		PrintDebug(*gcode[2],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+120)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,174 :: 		break;
J	L_Sample_Ringbuffer35
NOP	
;Protocol.c,175 :: 		}
L_Sample_Ringbuffer34:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer226
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer226:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer228
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer228:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer230
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer230:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer232
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer232:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer234
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer234:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer236
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer236:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer238
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer238:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer240
NOP	
J	L_Sample_Ringbuffer43
NOP	
L__Sample_Ringbuffer240:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer242
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer242:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer244
NOP	
J	L_Sample_Ringbuffer45
NOP	
L__Sample_Ringbuffer244:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer246
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer246:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer248
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer248:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer250
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer252
NOP	
J	L_Sample_Ringbuffer49
NOP	
L__Sample_Ringbuffer252:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer254
NOP	
J	L_Sample_Ringbuffer50
NOP	
L__Sample_Ringbuffer254:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer256
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer256:
L_Sample_Ringbuffer35:
;Protocol.c,176 :: 		}
L_Sample_Ringbuffer33:
;Protocol.c,180 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+180)(GP)
BNE	R2, R0, L__Sample_Ringbuffer258
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer258:
;Protocol.c,182 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,183 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer53
NOP	
;Protocol.c,184 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer55:
L_Sample_Ringbuffer56:
L_Sample_Ringbuffer57:
L_Sample_Ringbuffer58:
;Protocol.c,185 :: 		case 'Z':case 'z':case 'R':case 'r':
L_Sample_Ringbuffer59:
L_Sample_Ringbuffer60:
L_Sample_Ringbuffer61:
L_Sample_Ringbuffer62:
;Protocol.c,186 :: 		case 'I':case 'i':
L_Sample_Ringbuffer63:
L_Sample_Ringbuffer64:
;Protocol.c,187 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,188 :: 		status = Instruction_Values(gcode[3],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,190 :: 		PrintDebug(*gcode[3],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,192 :: 		break;
J	L_Sample_Ringbuffer54
NOP	
;Protocol.c,193 :: 		case 'F': case 'f':
L_Sample_Ringbuffer65:
L_Sample_Ringbuffer66:
;Protocol.c,194 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,195 :: 		status = Instruction_Values(gcode[3],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,197 :: 		PrintDebug(*gcode[3],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+180)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,199 :: 		break;
J	L_Sample_Ringbuffer54
NOP	
;Protocol.c,200 :: 		}
L_Sample_Ringbuffer53:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer260
NOP	
J	L_Sample_Ringbuffer55
NOP	
L__Sample_Ringbuffer260:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer262
NOP	
J	L_Sample_Ringbuffer56
NOP	
L__Sample_Ringbuffer262:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer264
NOP	
J	L_Sample_Ringbuffer57
NOP	
L__Sample_Ringbuffer264:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer266
NOP	
J	L_Sample_Ringbuffer58
NOP	
L__Sample_Ringbuffer266:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer268
NOP	
J	L_Sample_Ringbuffer59
NOP	
L__Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer270
NOP	
J	L_Sample_Ringbuffer60
NOP	
L__Sample_Ringbuffer270:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer272
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer272:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer274
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer274:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer276
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer276:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer278
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer278:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer280
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer280:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer282
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer282:
L_Sample_Ringbuffer54:
;Protocol.c,201 :: 		}
L_Sample_Ringbuffer52:
;Protocol.c,206 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+240)(GP)
BNE	R2, R0, L__Sample_Ringbuffer284
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer284:
;Protocol.c,207 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,208 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer68
NOP	
;Protocol.c,209 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer70:
L_Sample_Ringbuffer71:
;Protocol.c,210 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer72:
L_Sample_Ringbuffer73:
;Protocol.c,211 :: 		case 'J':case 'j':
L_Sample_Ringbuffer74:
L_Sample_Ringbuffer75:
;Protocol.c,212 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,213 :: 		status = Instruction_Values(gcode[4],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,215 :: 		PrintDebug(*gcode[4],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,217 :: 		break;
J	L_Sample_Ringbuffer69
NOP	
;Protocol.c,218 :: 		case 'F':case 'f':
L_Sample_Ringbuffer76:
L_Sample_Ringbuffer77:
;Protocol.c,219 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,220 :: 		status = Instruction_Values(gcode[4],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+240)
ORI	R25, R25, lo_addr(_gcode+240)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,222 :: 		PrintDebug(*gcode[4],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+240)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,224 :: 		break;
J	L_Sample_Ringbuffer69
NOP	
;Protocol.c,226 :: 		}
L_Sample_Ringbuffer68:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer286
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer286:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer288
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer288:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer290
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer290:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer292
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer292:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer294
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer294:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer296
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer296:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer298
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer298:
LBU	R3, Offset(_gcode+240)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer300
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer300:
L_Sample_Ringbuffer69:
;Protocol.c,227 :: 		}
L_Sample_Ringbuffer67:
;Protocol.c,231 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+300)(GP)
BNE	R2, R0, L__Sample_Ringbuffer302
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer302:
;Protocol.c,232 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+300)(GP)
SB	R2, 0(R3)
;Protocol.c,233 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,234 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer79
NOP	
;Protocol.c,235 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer81:
L_Sample_Ringbuffer82:
;Protocol.c,236 :: 		case 'J':case 'j':
L_Sample_Ringbuffer83:
L_Sample_Ringbuffer84:
;Protocol.c,237 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,238 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,240 :: 		PrintDebug(*gcode[5],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,242 :: 		break;
J	L_Sample_Ringbuffer80
NOP	
;Protocol.c,243 :: 		case 'F':case 'f':
L_Sample_Ringbuffer85:
L_Sample_Ringbuffer86:
;Protocol.c,244 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,245 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+300)
ORI	R25, R25, lo_addr(_gcode+300)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,247 :: 		PrintDebug(*gcode[5],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LBU	R25, Offset(_gcode+300)(GP)
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,249 :: 		break;
J	L_Sample_Ringbuffer80
NOP	
;Protocol.c,250 :: 		}
L_Sample_Ringbuffer79:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer304
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer304:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer306
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer306:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer308
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer308:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer310
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer310:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer312
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+300)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer314
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer314:
L_Sample_Ringbuffer80:
;Protocol.c,251 :: 		}
L_Sample_Ringbuffer78:
;Protocol.c,254 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+360)(GP)
BNE	R2, R0, L__Sample_Ringbuffer316
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer316:
;Protocol.c,255 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,256 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer88
NOP	
;Protocol.c,257 :: 		case 'J':case 'j':
L_Sample_Ringbuffer90:
L_Sample_Ringbuffer91:
;Protocol.c,258 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,259 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,261 :: 		PrintDebug(gcode[6],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,263 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,264 :: 		case 'F':case 'f':
L_Sample_Ringbuffer92:
L_Sample_Ringbuffer93:
;Protocol.c,265 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 96(SP)
;Protocol.c,266 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 96
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+360)
ORI	R25, R25, lo_addr(_gcode+360)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,268 :: 		PrintDebug(gcode[6],temp,&O_Val);
ADDIU	R3, SP, 96
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,270 :: 		break;
J	L_Sample_Ringbuffer89
NOP	
;Protocol.c,272 :: 		}
L_Sample_Ringbuffer88:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer318
NOP	
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer318:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer320
NOP	
J	L_Sample_Ringbuffer91
NOP	
L__Sample_Ringbuffer320:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer322
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer322:
LBU	R3, Offset(_gcode+360)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer324
NOP	
J	L_Sample_Ringbuffer93
NOP	
L__Sample_Ringbuffer324:
L_Sample_Ringbuffer89:
;Protocol.c,273 :: 		}
L_Sample_Ringbuffer87:
;Protocol.c,274 :: 		}else {
J	L_Sample_Ringbuffer94
NOP	
L_Sample_Ringbuffer8:
;Protocol.c,275 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,276 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,277 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,278 :: 		case 'M':
L_Sample_Ringbuffer95:
;Protocol.c,279 :: 		case 'm':
L_Sample_Ringbuffer96:
;Protocol.c,281 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,282 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 94(SP)
;Protocol.c,283 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,285 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 94
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,289 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer326
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer326:
;Protocol.c,290 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer98
NOP	
;Protocol.c,291 :: 		case 'S':
L_Sample_Ringbuffer100:
;Protocol.c,292 :: 		case 's':
L_Sample_Ringbuffer101:
;Protocol.c,294 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,295 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 100(SP)
;Protocol.c,296 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,298 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,300 :: 		break;
J	L_Sample_Ringbuffer99
NOP	
;Protocol.c,301 :: 		}
L_Sample_Ringbuffer98:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer328
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer328:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer330
NOP	
J	L_Sample_Ringbuffer101
NOP	
L__Sample_Ringbuffer330:
L_Sample_Ringbuffer99:
;Protocol.c,302 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,303 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,304 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer102:
L_Sample_Ringbuffer103:
L_Sample_Ringbuffer104:
L_Sample_Ringbuffer105:
;Protocol.c,305 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Sample_Ringbuffer106:
L_Sample_Ringbuffer107:
L_Sample_Ringbuffer108:
L_Sample_Ringbuffer109:
;Protocol.c,306 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer331
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer331:
;Protocol.c,307 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,308 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,309 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,311 :: 		PrintDebug(gcode[0],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+0)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,313 :: 		}
L_Sample_Ringbuffer110:
;Protocol.c,317 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+60)(GP)
BNE	R2, R0, L__Sample_Ringbuffer333
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer333:
;Protocol.c,318 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 83
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+60)(GP)
SB	R2, 0(R3)
;Protocol.c,319 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,320 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer112
NOP	
;Protocol.c,321 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer114:
L_Sample_Ringbuffer115:
;Protocol.c,322 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
;Protocol.c,323 :: 		case 'A':case 'a':
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
;Protocol.c,324 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 100(SP)
;Protocol.c,325 :: 		status = Instruction_Values(gcode[1],&XYZ_Val);
ADDIU	R2, SP, 100
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,327 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 100
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,329 :: 		break;
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,330 :: 		case 'F':
L_Sample_Ringbuffer120:
;Protocol.c,331 :: 		case 'f':
L_Sample_Ringbuffer121:
;Protocol.c,334 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,335 :: 		status = Instruction_Values(gcode[2],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,337 :: 		PrintDebug(gcode[1],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+60)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,340 :: 		break;
J	L_Sample_Ringbuffer113
NOP	
;Protocol.c,342 :: 		}
L_Sample_Ringbuffer112:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer335
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer335:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer337
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer337:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer339
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer339:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer341
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer341:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer343
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer345
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer347
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer347:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer349
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer349:
L_Sample_Ringbuffer113:
;Protocol.c,343 :: 		}
L_Sample_Ringbuffer111:
;Protocol.c,344 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,345 :: 		case 'F':
L_Sample_Ringbuffer122:
;Protocol.c,347 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer350
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer350:
;Protocol.c,348 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,349 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 74
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 92(SP)
;Protocol.c,350 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 92
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,352 :: 		PrintDebug(gcode[6],temp,&F_Val);
ADDIU	R3, SP, 92
ADDIU	R2, SP, 74
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
ORI	R25, R0, lo_addr(_gcode+360)
ANDI	R25, R25, 255
JAL	Protocol_PrintDebug+0
NOP	
;Protocol.c,354 :: 		}
L_Sample_Ringbuffer123:
;Protocol.c,355 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,357 :: 		}
L_Sample_Ringbuffer4:
LH	R4, 104(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer352
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer352:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer354
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer354:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer356
NOP	
J	L_Sample_Ringbuffer95
NOP	
L__Sample_Ringbuffer356:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer358
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer358:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer360
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer360:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer362
NOP	
J	L_Sample_Ringbuffer103
NOP	
L__Sample_Ringbuffer362:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer364
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer364:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer366
NOP	
J	L_Sample_Ringbuffer105
NOP	
L__Sample_Ringbuffer366:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer368
NOP	
J	L_Sample_Ringbuffer106
NOP	
L__Sample_Ringbuffer368:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer370
NOP	
J	L_Sample_Ringbuffer107
NOP	
L__Sample_Ringbuffer370:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer372
NOP	
J	L_Sample_Ringbuffer108
NOP	
L__Sample_Ringbuffer372:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer374
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer374:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer376
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer376:
L_Sample_Ringbuffer5:
;Protocol.c,359 :: 		status = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
SH	R2, 22(SP)
;Protocol.c,362 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,363 :: 		return status;
LH	R2, 22(SP)
;Protocol.c,364 :: 		}
;Protocol.c,363 :: 		return status;
;Protocol.c,364 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 108
JR	RA
NOP	
; end of _Sample_Ringbuffer
Protocol_strsplit:
;Protocol.c,369 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,371 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,372 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,373 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,374 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit124:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit378
NOP	
J	L_Protocol_strsplit125
NOP	
L_Protocol_strsplit378:
;Protocol.c,375 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,376 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit380
NOP	
J	L_Protocol_strsplit171
NOP	
L_Protocol_strsplit380:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit382
NOP	
J	L_Protocol_strsplit170
NOP	
L_Protocol_strsplit382:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit383
NOP	
J	L_Protocol_strsplit169
NOP	
L_Protocol_strsplit383:
J	L_Protocol_strsplit129
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit171:
L_Protocol_strsplit170:
L_Protocol_strsplit169:
;Protocol.c,377 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,378 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,379 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,380 :: 		continue;
J	L_Protocol_strsplit126
NOP	
;Protocol.c,381 :: 		}else{
L_Protocol_strsplit129:
;Protocol.c,382 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,384 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit384
NOP	
J	L_Protocol_strsplit131
NOP	
L_Protocol_strsplit384:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,385 :: 		break;
J	L_Protocol_strsplit125
NOP	
L_Protocol_strsplit131:
;Protocol.c,386 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit126:
;Protocol.c,374 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,386 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit124
NOP	
L_Protocol_strsplit125:
;Protocol.c,387 :: 		arg[kk][0] = 0;
SEH	R3, R6
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,388 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,389 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_cpy_val_from_str:
;Protocol.c,393 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,396 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,397 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,399 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,400 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str132:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str387
NOP	
J	L_Protocol_cpy_val_from_str133
NOP	
L_Protocol_cpy_val_from_str387:
;Protocol.c,401 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,402 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,403 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str132
NOP	
L_Protocol_cpy_val_from_str133:
;Protocol.c,404 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,406 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,407 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,412 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,414 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,416 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,418 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int134:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int389
NOP	
J	L_Protocol_str2int135
NOP	
L_Protocol_str2int389:
;Protocol.c,419 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,420 :: 		while(DMA_IsOn(1));
L_Protocol_str2int137:
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
BNE	R2, R0, L_Protocol_str2int391
NOP	
J	L_Protocol_str2int138
NOP	
L_Protocol_str2int391:
J	L_Protocol_str2int137
NOP	
L_Protocol_str2int138:
;Protocol.c,418 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,421 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int134
NOP	
L_Protocol_str2int135:
;Protocol.c,423 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,424 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
Protocol_PrintDebug:
;Protocol.c,429 :: 		static void PrintDebug(char c,char *strB,void *ptr){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Protocol.c,433 :: 		switch(c){
J	L_Protocol_PrintDebug139
NOP	
;Protocol.c,434 :: 		case 'G':case 'g':
L_Protocol_PrintDebug141:
L_Protocol_PrintDebug142:
;Protocol.c,435 :: 		case 'F':case 'f':
L_Protocol_PrintDebug143:
L_Protocol_PrintDebug144:
;Protocol.c,436 :: 		case 'M':case 'm':
L_Protocol_PrintDebug145:
L_Protocol_PrintDebug146:
;Protocol.c,437 :: 		case 'S':case 's':
L_Protocol_PrintDebug147:
L_Protocol_PrintDebug148:
;Protocol.c,438 :: 		case 'P':case 'p':
L_Protocol_PrintDebug149:
L_Protocol_PrintDebug150:
;Protocol.c,439 :: 		case 'L':case 'l':
L_Protocol_PrintDebug151:
L_Protocol_PrintDebug152:
;Protocol.c,440 :: 		case 'T':case 't':
L_Protocol_PrintDebug153:
L_Protocol_PrintDebug154:
;Protocol.c,441 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,442 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug155:
; G_Val start address is: 12 (R3)
SH	R3, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug394
NOP	
J	L_Protocol_PrintDebug156
NOP	
L_Protocol_PrintDebug394:
J	L_Protocol_PrintDebug155
NOP	
L_Protocol_PrintDebug156:
;Protocol.c,443 :: 		dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
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
;Protocol.c,444 :: 		break;
J	L_Protocol_PrintDebug140
NOP	
;Protocol.c,445 :: 		case 'X':case 'x':
L_Protocol_PrintDebug157:
L_Protocol_PrintDebug158:
;Protocol.c,446 :: 		case 'Y':case 'y':
L_Protocol_PrintDebug159:
L_Protocol_PrintDebug160:
;Protocol.c,447 :: 		case 'Z':case 'z':
L_Protocol_PrintDebug161:
L_Protocol_PrintDebug162:
;Protocol.c,448 :: 		case 'A':case 'a':
L_Protocol_PrintDebug163:
L_Protocol_PrintDebug164:
;Protocol.c,449 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,450 :: 		while(DMA_IsOn(1));
L_Protocol_PrintDebug165:
; XYZ_Val start address is: 128 (R32)
SWC1	S16, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LWC1	S16, 4(SP)
BNE	R2, R0, L_Protocol_PrintDebug396
NOP	
J	L_Protocol_PrintDebug166
NOP	
L_Protocol_PrintDebug396:
J	L_Protocol_PrintDebug165
NOP	
L_Protocol_PrintDebug166:
;Protocol.c,451 :: 		dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
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
;Protocol.c,452 :: 		break;
J	L_Protocol_PrintDebug140
NOP	
;Protocol.c,453 :: 		default:break;
L_Protocol_PrintDebug167:
J	L_Protocol_PrintDebug140
NOP	
;Protocol.c,454 :: 		}
L_Protocol_PrintDebug139:
ANDI	R3, R25, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_PrintDebug398
NOP	
J	L_Protocol_PrintDebug141
NOP	
L_Protocol_PrintDebug398:
ANDI	R3, R25, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_PrintDebug400
NOP	
J	L_Protocol_PrintDebug142
NOP	
L_Protocol_PrintDebug400:
ANDI	R3, R25, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_PrintDebug402
NOP	
J	L_Protocol_PrintDebug143
NOP	
L_Protocol_PrintDebug402:
ANDI	R3, R25, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_PrintDebug404
NOP	
J	L_Protocol_PrintDebug144
NOP	
L_Protocol_PrintDebug404:
ANDI	R3, R25, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_PrintDebug406
NOP	
J	L_Protocol_PrintDebug145
NOP	
L_Protocol_PrintDebug406:
ANDI	R3, R25, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_PrintDebug408
NOP	
J	L_Protocol_PrintDebug146
NOP	
L_Protocol_PrintDebug408:
ANDI	R3, R25, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_PrintDebug410
NOP	
J	L_Protocol_PrintDebug147
NOP	
L_Protocol_PrintDebug410:
ANDI	R3, R25, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_PrintDebug412
NOP	
J	L_Protocol_PrintDebug148
NOP	
L_Protocol_PrintDebug412:
ANDI	R3, R25, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_PrintDebug414
NOP	
J	L_Protocol_PrintDebug149
NOP	
L_Protocol_PrintDebug414:
ANDI	R3, R25, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_PrintDebug416
NOP	
J	L_Protocol_PrintDebug150
NOP	
L_Protocol_PrintDebug416:
ANDI	R3, R25, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_PrintDebug418
NOP	
J	L_Protocol_PrintDebug151
NOP	
L_Protocol_PrintDebug418:
ANDI	R3, R25, 255
ORI	R2, R0, 108
BNE	R3, R2, L_Protocol_PrintDebug420
NOP	
J	L_Protocol_PrintDebug152
NOP	
L_Protocol_PrintDebug420:
ANDI	R3, R25, 255
ORI	R2, R0, 84
BNE	R3, R2, L_Protocol_PrintDebug422
NOP	
J	L_Protocol_PrintDebug153
NOP	
L_Protocol_PrintDebug422:
ANDI	R3, R25, 255
ORI	R2, R0, 116
BNE	R3, R2, L_Protocol_PrintDebug424
NOP	
J	L_Protocol_PrintDebug154
NOP	
L_Protocol_PrintDebug424:
ANDI	R3, R25, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_PrintDebug426
NOP	
J	L_Protocol_PrintDebug157
NOP	
L_Protocol_PrintDebug426:
ANDI	R3, R25, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_PrintDebug428
NOP	
J	L_Protocol_PrintDebug158
NOP	
L_Protocol_PrintDebug428:
ANDI	R3, R25, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_PrintDebug430
NOP	
J	L_Protocol_PrintDebug159
NOP	
L_Protocol_PrintDebug430:
ANDI	R3, R25, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_PrintDebug432
NOP	
J	L_Protocol_PrintDebug160
NOP	
L_Protocol_PrintDebug432:
ANDI	R3, R25, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_PrintDebug434
NOP	
J	L_Protocol_PrintDebug161
NOP	
L_Protocol_PrintDebug434:
ANDI	R3, R25, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_PrintDebug436
NOP	
J	L_Protocol_PrintDebug162
NOP	
L_Protocol_PrintDebug436:
ANDI	R3, R25, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_PrintDebug438
NOP	
J	L_Protocol_PrintDebug163
NOP	
L_Protocol_PrintDebug438:
ANDI	R3, R25, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_PrintDebug440
NOP	
J	L_Protocol_PrintDebug164
NOP	
L_Protocol_PrintDebug440:
J	L_Protocol_PrintDebug167
NOP	
L_Protocol_PrintDebug140:
;Protocol.c,455 :: 		return;
;Protocol.c,456 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Protocol_PrintDebug
