_Str_Initialize:
;Protocol.c,10 :: 		void Str_Initialize(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,13 :: 		for(i = 0; i <= arr_size;i++){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 11
BNE	R2, R0, L__Str_Initialize98
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize98:
;Protocol.c,14 :: 		memset(gcode[i],0,str_size);
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
ORI	R27, R0, 60
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,13 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,15 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,16 :: 		}
L_end_Str_Initialize:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Sample_Ringbuffer:
;Protocol.c,19 :: 		void Sample_Ringbuffer(){
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Protocol.c,21 :: 		int dif = 0,i,j,num_of_strings;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,27 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,29 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer100
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer100:
;Protocol.c,31 :: 		Get_Line(str,dif);
SEH	R26, R3
; dif end address is: 12 (R3)
LUI	R25, hi_addr(_str+0)
ORI	R25, R25, lo_addr(_str+0)
JAL	_Get_Line+0
NOP	
;Protocol.c,35 :: 		num_of_strings = strsplit(gcode,str,0x20);
ORI	R27, R0, 32
LUI	R26, hi_addr(_str+0)
ORI	R26, R26, lo_addr(_str+0)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strsplit+0
NOP	
; num_of_strings start address is: 12 (R3)
SEH	R3, R2
; num_of_strings end address is: 12 (R3)
;Protocol.c,36 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer4:
; num_of_strings start address is: 12 (R3)
SH	R3, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer102
NOP	
J	L_Sample_Ringbuffer5
NOP	
L__Sample_Ringbuffer102:
J	L_Sample_Ringbuffer4
NOP	
L_Sample_Ringbuffer5:
;Protocol.c,37 :: 		dma_printf("num_of_strings:= %d\r\n",num_of_strings);
ADDIU	R23, SP, 40
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 40
ADDIU	SP, SP, -8
SH	R3, 4(SP)
; num_of_strings end address is: 12 (R3)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,38 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,39 :: 		case 'G':
L_Sample_Ringbuffer8:
;Protocol.c,41 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer103
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer103:
;Protocol.c,42 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,43 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 28(SP)
;Protocol.c,46 :: 		PrintDebug(gcode[0],temp,&G_Val);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_PrintDebug+0
NOP	
;Protocol.c,51 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer105
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer105:
;Protocol.c,52 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,53 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer11
NOP	
;Protocol.c,54 :: 		case 'X':
L_Sample_Ringbuffer13:
;Protocol.c,55 :: 		case 'Y':
L_Sample_Ringbuffer14:
;Protocol.c,56 :: 		case 'Z':
L_Sample_Ringbuffer15:
;Protocol.c,57 :: 		case 'A':
L_Sample_Ringbuffer16:
;Protocol.c,58 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 36(SP)
;Protocol.c,60 :: 		PrintDebug(gcode[1],temp,&XYZ_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_PrintDebug+0
NOP	
;Protocol.c,62 :: 		break;
J	L_Sample_Ringbuffer12
NOP	
;Protocol.c,63 :: 		case 'E':
L_Sample_Ringbuffer17:
;Protocol.c,64 :: 		case 'e':
L_Sample_Ringbuffer18:
;Protocol.c,65 :: 		case 'F':
L_Sample_Ringbuffer19:
;Protocol.c,66 :: 		case 'f':
L_Sample_Ringbuffer20:
;Protocol.c,67 :: 		EF_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,69 :: 		PrintDebug(gcode[1],temp,&EF_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_PrintDebug+0
NOP	
;Protocol.c,71 :: 		break;
J	L_Sample_Ringbuffer12
NOP	
;Protocol.c,73 :: 		}
L_Sample_Ringbuffer11:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer107
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer107:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer109
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer109:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer111
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer111:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer113
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer113:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer115
NOP	
J	L_Sample_Ringbuffer17
NOP	
L__Sample_Ringbuffer115:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer117
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer117:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer119
NOP	
J	L_Sample_Ringbuffer19
NOP	
L__Sample_Ringbuffer119:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer121
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer121:
L_Sample_Ringbuffer12:
;Protocol.c,74 :: 		}
L_Sample_Ringbuffer10:
;Protocol.c,76 :: 		if((*(gcode+2)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+120)
ORI	R2, R2, lo_addr(_gcode+120)
BNE	R3, R2, L__Sample_Ringbuffer123
NOP	
J	L_Sample_Ringbuffer21
NOP	
L__Sample_Ringbuffer123:
;Protocol.c,77 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,78 :: 		switch(*(*(gcode+2))) {
J	L_Sample_Ringbuffer22
NOP	
;Protocol.c,79 :: 		case 'X':
L_Sample_Ringbuffer24:
;Protocol.c,80 :: 		case 'Y':
L_Sample_Ringbuffer25:
;Protocol.c,81 :: 		case 'Z':
L_Sample_Ringbuffer26:
;Protocol.c,82 :: 		case 'A':
L_Sample_Ringbuffer27:
;Protocol.c,83 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 36(SP)
;Protocol.c,85 :: 		PrintDebug(gcode[2],temp,&XYZ_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_PrintDebug+0
NOP	
;Protocol.c,87 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,88 :: 		case 'E':
L_Sample_Ringbuffer28:
;Protocol.c,89 :: 		case 'e':
L_Sample_Ringbuffer29:
;Protocol.c,90 :: 		case 'F':
L_Sample_Ringbuffer30:
;Protocol.c,91 :: 		case 'f':
L_Sample_Ringbuffer31:
;Protocol.c,92 :: 		EF_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,94 :: 		PrintDebug(gcode[2],temp,&EF_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_PrintDebug+0
NOP	
;Protocol.c,96 :: 		break;
J	L_Sample_Ringbuffer23
NOP	
;Protocol.c,98 :: 		}
L_Sample_Ringbuffer22:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer125
NOP	
J	L_Sample_Ringbuffer24
NOP	
L__Sample_Ringbuffer125:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer127
NOP	
J	L_Sample_Ringbuffer25
NOP	
L__Sample_Ringbuffer127:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer129
NOP	
J	L_Sample_Ringbuffer26
NOP	
L__Sample_Ringbuffer129:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer131
NOP	
J	L_Sample_Ringbuffer27
NOP	
L__Sample_Ringbuffer131:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer133
NOP	
J	L_Sample_Ringbuffer28
NOP	
L__Sample_Ringbuffer133:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer135
NOP	
J	L_Sample_Ringbuffer29
NOP	
L__Sample_Ringbuffer135:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer137
NOP	
J	L_Sample_Ringbuffer30
NOP	
L__Sample_Ringbuffer137:
LBU	R3, Offset(_gcode+120)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer139
NOP	
J	L_Sample_Ringbuffer31
NOP	
L__Sample_Ringbuffer139:
L_Sample_Ringbuffer23:
;Protocol.c,99 :: 		}
L_Sample_Ringbuffer21:
;Protocol.c,101 :: 		if((*(gcode+3)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+180)
ORI	R2, R2, lo_addr(_gcode+180)
BNE	R3, R2, L__Sample_Ringbuffer141
NOP	
J	L_Sample_Ringbuffer32
NOP	
L__Sample_Ringbuffer141:
;Protocol.c,102 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,103 :: 		switch(*(*(gcode+3))) {
J	L_Sample_Ringbuffer33
NOP	
;Protocol.c,104 :: 		case 'X':
L_Sample_Ringbuffer35:
;Protocol.c,105 :: 		case 'Y':
L_Sample_Ringbuffer36:
;Protocol.c,106 :: 		case 'Z':
L_Sample_Ringbuffer37:
;Protocol.c,107 :: 		case 'A':
L_Sample_Ringbuffer38:
;Protocol.c,108 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 36(SP)
;Protocol.c,110 :: 		PrintDebug(gcode[3],temp,&XYZ_Val);
ADDIU	R3, SP, 36
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_PrintDebug+0
NOP	
;Protocol.c,112 :: 		break;
J	L_Sample_Ringbuffer34
NOP	
;Protocol.c,113 :: 		case 'E':
L_Sample_Ringbuffer39:
;Protocol.c,114 :: 		case 'e':
L_Sample_Ringbuffer40:
;Protocol.c,115 :: 		case 'F':
L_Sample_Ringbuffer41:
;Protocol.c,116 :: 		case 'f':
L_Sample_Ringbuffer42:
;Protocol.c,117 :: 		EF_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 30(SP)
;Protocol.c,119 :: 		PrintDebug(gcode[3],temp,&EF_Val);
ADDIU	R3, SP, 30
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_PrintDebug+0
NOP	
;Protocol.c,121 :: 		break;
J	L_Sample_Ringbuffer34
NOP	
;Protocol.c,123 :: 		}
L_Sample_Ringbuffer33:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer143
NOP	
J	L_Sample_Ringbuffer35
NOP	
L__Sample_Ringbuffer143:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer145
NOP	
J	L_Sample_Ringbuffer36
NOP	
L__Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer147
NOP	
J	L_Sample_Ringbuffer37
NOP	
L__Sample_Ringbuffer147:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer149
NOP	
J	L_Sample_Ringbuffer38
NOP	
L__Sample_Ringbuffer149:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 69
BNE	R3, R2, L__Sample_Ringbuffer151
NOP	
J	L_Sample_Ringbuffer39
NOP	
L__Sample_Ringbuffer151:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 101
BNE	R3, R2, L__Sample_Ringbuffer153
NOP	
J	L_Sample_Ringbuffer40
NOP	
L__Sample_Ringbuffer153:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer155
NOP	
J	L_Sample_Ringbuffer41
NOP	
L__Sample_Ringbuffer155:
LBU	R3, Offset(_gcode+180)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer157
NOP	
J	L_Sample_Ringbuffer42
NOP	
L__Sample_Ringbuffer157:
L_Sample_Ringbuffer34:
;Protocol.c,124 :: 		}
L_Sample_Ringbuffer32:
;Protocol.c,125 :: 		}else if(*(*(gcode+0)+0)=='M'){
J	L_Sample_Ringbuffer43
NOP	
L_Sample_Ringbuffer9:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BEQ	R3, R2, L__Sample_Ringbuffer158
NOP	
J	L_Sample_Ringbuffer44
NOP	
L__Sample_Ringbuffer158:
;Protocol.c,127 :: 		}else{
J	L_Sample_Ringbuffer45
NOP	
L_Sample_Ringbuffer44:
;Protocol.c,128 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,129 :: 		}
L_Sample_Ringbuffer45:
L_Sample_Ringbuffer43:
;Protocol.c,130 :: 		break;
J	L_Sample_Ringbuffer7
NOP	
;Protocol.c,131 :: 		case 'M':
L_Sample_Ringbuffer46:
;Protocol.c,132 :: 		case 'm':
L_Sample_Ringbuffer47:
;Protocol.c,134 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,135 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,138 :: 		PrintDebug(gcode[0],temp,&M_Val);
ADDIU	R3, SP, 32
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_PrintDebug+0
NOP	
;Protocol.c,142 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer160
NOP	
J	L_Sample_Ringbuffer48
NOP	
L__Sample_Ringbuffer160:
;Protocol.c,143 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer49
NOP	
;Protocol.c,144 :: 		case 'S':
L_Sample_Ringbuffer51:
;Protocol.c,145 :: 		case 's':
L_Sample_Ringbuffer52:
;Protocol.c,147 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 22
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	_cpy_val_from_str+0
NOP	
;Protocol.c,148 :: 		SE_Val = atoi(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 34(SP)
;Protocol.c,150 :: 		PrintDebug(gcode[1],temp,&SE_Val);
ADDIU	R3, SP, 34
ADDIU	R2, SP, 22
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_PrintDebug+0
NOP	
;Protocol.c,152 :: 		break;
J	L_Sample_Ringbuffer50
NOP	
;Protocol.c,153 :: 		}
L_Sample_Ringbuffer49:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer162
NOP	
J	L_Sample_Ringbuffer51
NOP	
L__Sample_Ringbuffer162:
LBU	R3, Offset(_gcode+60)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer164
NOP	
J	L_Sample_Ringbuffer52
NOP	
L__Sample_Ringbuffer164:
L_Sample_Ringbuffer50:
;Protocol.c,154 :: 		}
L_Sample_Ringbuffer48:
;Protocol.c,155 :: 		break;
J	L_Sample_Ringbuffer7
NOP	
;Protocol.c,156 :: 		}
L_Sample_Ringbuffer6:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer166
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer166:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer168
NOP	
J	L_Sample_Ringbuffer46
NOP	
L__Sample_Ringbuffer168:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer170
NOP	
J	L_Sample_Ringbuffer47
NOP	
L__Sample_Ringbuffer170:
L_Sample_Ringbuffer7:
;Protocol.c,158 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,160 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,166 :: 		int strsplit(char arg[arr_size][str_size],char str[50], char c){
;Protocol.c,168 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,169 :: 		for (i = 0; i < 50;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit53:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit172
NOP	
J	L_strsplit54
NOP	
L__strsplit172:
;Protocol.c,170 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;Protocol.c,171 :: 		if(str[i] == c || str[i] == '\r' || str[i] == '\n' ||  err > 49){
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit174
NOP	
J	L__strsplit96
NOP	
L__strsplit174:
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__strsplit176
NOP	
J	L__strsplit95
NOP	
L__strsplit176:
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__strsplit178
NOP	
J	L__strsplit94
NOP	
L__strsplit178:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit179
NOP	
J	L__strsplit93
NOP	
L__strsplit179:
J	L_strsplit58
NOP	
; lasti end address is: 24 (R6)
L__strsplit96:
L__strsplit95:
L__strsplit94:
L__strsplit93:
;Protocol.c,172 :: 		arg[kk][ii] = 0;
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,173 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,174 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,175 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
;Protocol.c,176 :: 		continue;
J	L_strsplit55
NOP	
;Protocol.c,177 :: 		}else{
L_strsplit58:
;Protocol.c,178 :: 		arg[kk][ii] = str[i];
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R7
ADDU	R3, R3, R2
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,179 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,181 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit180
NOP	
J	L_strsplit60
NOP	
L__strsplit180:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;Protocol.c,182 :: 		break;
J	L_strsplit54
NOP	
L_strsplit60:
;Protocol.c,183 :: 		}
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit55:
; lasti end address is: 24 (R6)
;Protocol.c,169 :: 		for (i = 0; i < 50;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,183 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit53
NOP	
L_strsplit54:
;Protocol.c,184 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;Protocol.c,185 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_cpy_val_from_str:
;Protocol.c,187 :: 		int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,190 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,191 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,193 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,194 :: 		while(*tmp != 0){
L_cpy_val_from_str61:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpy_val_from_str183
NOP	
J	L_cpy_val_from_str62
NOP	
L__cpy_val_from_str183:
;Protocol.c,195 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,196 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,197 :: 		}
; tmp end address is: 16 (R4)
J	L_cpy_val_from_str61
NOP	
L_cpy_val_from_str62:
;Protocol.c,198 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,200 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,201 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of _cpy_val_from_str
_str2int:
;Protocol.c,206 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,208 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,210 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,212 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int63:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int185
NOP	
J	L_str2int64
NOP	
L__str2int185:
;Protocol.c,213 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,214 :: 		while(DMA_Busy(1));
L_str2int66:
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
BNE	R2, R0, L__str2int187
NOP	
J	L_str2int67
NOP	
L__str2int187:
J	L_str2int66
NOP	
L_str2int67:
;Protocol.c,212 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,215 :: 		}
; i end address is: 16 (R4)
J	L_str2int63
NOP	
L_str2int64:
;Protocol.c,217 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,218 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
_PrintDebug:
;Protocol.c,222 :: 		void PrintDebug(char *strA,char *strB,void *ptr){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Protocol.c,226 :: 		switch(strA[0]){
MOVZ	R2, R25, R0
SW	R2, 44(SP)
J	L_PrintDebug68
NOP	
;Protocol.c,227 :: 		case 'G':
L_PrintDebug70:
;Protocol.c,228 :: 		case 'g':
L_PrintDebug71:
;Protocol.c,229 :: 		case 'F':
L_PrintDebug72:
;Protocol.c,230 :: 		case 'f':
L_PrintDebug73:
;Protocol.c,231 :: 		case 'M':
L_PrintDebug74:
;Protocol.c,232 :: 		case 'm':
L_PrintDebug75:
;Protocol.c,233 :: 		case 'S':
L_PrintDebug76:
;Protocol.c,234 :: 		case 's':
L_PrintDebug77:
;Protocol.c,235 :: 		case 'E':
L_PrintDebug78:
;Protocol.c,236 :: 		case 'e':
L_PrintDebug79:
;Protocol.c,237 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,238 :: 		while(DMA_Busy(1));
L_PrintDebug80:
; G_Val start address is: 12 (R3)
SH	R3, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R3, 4(SP)
BNE	R2, R0, L__PrintDebug190
NOP	
J	L_PrintDebug81
NOP	
L__PrintDebug190:
J	L_PrintDebug80
NOP	
L_PrintDebug81:
;Protocol.c,239 :: 		dma_printf("%s\t%s\t%d\r\n",strA,strB,G_Val);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
SW	R27, 4(SP)
; G_Val end address is: 12 (R3)
SW	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -16
SH	R3, 12(SP)
SW	R26, 8(SP)
SW	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,240 :: 		break;
J	L_PrintDebug69
NOP	
;Protocol.c,241 :: 		case 'X':
L_PrintDebug82:
;Protocol.c,242 :: 		case 'x':
L_PrintDebug83:
;Protocol.c,243 :: 		case 'Y':
L_PrintDebug84:
;Protocol.c,244 :: 		case 'y':
L_PrintDebug85:
;Protocol.c,245 :: 		case 'Z':
L_PrintDebug86:
;Protocol.c,246 :: 		case 'z':
L_PrintDebug87:
;Protocol.c,247 :: 		case 'A':
L_PrintDebug88:
;Protocol.c,248 :: 		case 'a':
L_PrintDebug89:
;Protocol.c,249 :: 		XYZ_Val = *(float*)ptr;
LWC1	S0, 0(R27)
; XYZ_Val start address is: 8 (R2)
MOV.S 	S1, S0
; XYZ_Val end address is: 8 (R2)
MOV.S 	S16, S1
;Protocol.c,250 :: 		while(DMA_Busy(1));
L_PrintDebug90:
; XYZ_Val start address is: 128 (R32)
SWC1	S16, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LWC1	S16, 4(SP)
BNE	R2, R0, L__PrintDebug192
NOP	
J	L_PrintDebug91
NOP	
L__PrintDebug192:
J	L_PrintDebug90
NOP	
L_PrintDebug91:
;Protocol.c,251 :: 		dma_printf("%s\t%s\t%f\r\n",strA,strB,XYZ_Val);
ADDIU	R23, SP, 31
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr3_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 31
SW	R27, 4(SP)
; XYZ_Val end address is: 128 (R32)
SW	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -16
SWC1	S16, 12(SP)
SW	R26, 8(SP)
SW	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Protocol.c,252 :: 		break;
J	L_PrintDebug69
NOP	
;Protocol.c,253 :: 		}
L_PrintDebug68:
LW	R4, 44(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L__PrintDebug194
NOP	
J	L_PrintDebug70
NOP	
L__PrintDebug194:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 103
BNE	R3, R2, L__PrintDebug196
NOP	
J	L_PrintDebug71
NOP	
L__PrintDebug196:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__PrintDebug198
NOP	
J	L_PrintDebug72
NOP	
L__PrintDebug198:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L__PrintDebug200
NOP	
J	L_PrintDebug73
NOP	
L__PrintDebug200:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L__PrintDebug202
NOP	
J	L_PrintDebug74
NOP	
L__PrintDebug202:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 109
BNE	R3, R2, L__PrintDebug204
NOP	
J	L_PrintDebug75
NOP	
L__PrintDebug204:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__PrintDebug206
NOP	
J	L_PrintDebug76
NOP	
L__PrintDebug206:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L__PrintDebug208
NOP	
J	L_PrintDebug77
NOP	
L__PrintDebug208:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__PrintDebug210
NOP	
J	L_PrintDebug78
NOP	
L__PrintDebug210:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 101
BNE	R3, R2, L__PrintDebug212
NOP	
J	L_PrintDebug79
NOP	
L__PrintDebug212:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__PrintDebug214
NOP	
J	L_PrintDebug82
NOP	
L__PrintDebug214:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__PrintDebug216
NOP	
J	L_PrintDebug83
NOP	
L__PrintDebug216:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__PrintDebug218
NOP	
J	L_PrintDebug84
NOP	
L__PrintDebug218:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 121
BNE	R3, R2, L__PrintDebug220
NOP	
J	L_PrintDebug85
NOP	
L__PrintDebug220:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__PrintDebug222
NOP	
J	L_PrintDebug86
NOP	
L__PrintDebug222:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 122
BNE	R3, R2, L__PrintDebug224
NOP	
J	L_PrintDebug87
NOP	
L__PrintDebug224:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__PrintDebug226
NOP	
J	L_PrintDebug88
NOP	
L__PrintDebug226:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 97
BNE	R3, R2, L__PrintDebug228
NOP	
J	L_PrintDebug89
NOP	
L__PrintDebug228:
L_PrintDebug69:
;Protocol.c,255 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _PrintDebug
