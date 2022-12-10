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
BNE	R2, R0, L__Str_Initialize38
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize38:
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
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Protocol.c,21 :: 		int dif = 0,i,j;
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
BEQ	R2, R0, L__Sample_Ringbuffer40
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer40:
;Protocol.c,31 :: 		Get_Line(str,dif);
SEH	R26, R3
; dif end address is: 12 (R3)
LUI	R25, hi_addr(_str+0)
ORI	R25, R25, lo_addr(_str+0)
JAL	_Get_Line+0
NOP	
;Protocol.c,35 :: 		strsplit(gcode,str,0x20);
ORI	R27, R0, 32
LUI	R26, hi_addr(_str+0)
ORI	R26, R26, lo_addr(_str+0)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strsplit+0
NOP	
;Protocol.c,36 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer4
NOP	
;Protocol.c,37 :: 		case 'G':
L_Sample_Ringbuffer6:
;Protocol.c,39 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer41
NOP	
J	L_Sample_Ringbuffer7
NOP	
L__Sample_Ringbuffer41:
;Protocol.c,40 :: 		i = cpystr(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
JAL	_cpystr+0
NOP	
;Protocol.c,41 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,42 :: 		G_Instruction(G_Val);
SH	R3, 20(SP)
SEH	R25, R2
JAL	_G_Instruction+0
NOP	
LH	R3, 20(SP)
;Protocol.c,44 :: 		PrintDebug(gcode[0],temp,G_Val);
ADDIU	R2, SP, 22
SEH	R27, R3
; G_Val end address is: 12 (R3)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_PrintDebug+0
NOP	
;Protocol.c,47 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
BNE	R3, R2, L__Sample_Ringbuffer43
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer43:
;Protocol.c,48 :: 		i = cpystr(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
JAL	_cpystr+0
NOP	
;Protocol.c,49 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,54 :: 		}
L_Sample_Ringbuffer8:
;Protocol.c,56 :: 		if((*(gcode+2)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+120)
ORI	R2, R2, lo_addr(_gcode+120)
BNE	R3, R2, L__Sample_Ringbuffer45
NOP	
J	L_Sample_Ringbuffer9
NOP	
L__Sample_Ringbuffer45:
;Protocol.c,57 :: 		i = cpystr(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
JAL	_cpystr+0
NOP	
;Protocol.c,58 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,63 :: 		}
L_Sample_Ringbuffer9:
;Protocol.c,65 :: 		if((*(gcode+3)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+180)
ORI	R2, R2, lo_addr(_gcode+180)
BNE	R3, R2, L__Sample_Ringbuffer47
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer47:
;Protocol.c,66 :: 		i = cpystr(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
JAL	_cpystr+0
NOP	
;Protocol.c,67 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,72 :: 		}
L_Sample_Ringbuffer10:
;Protocol.c,73 :: 		}else if(*(*(gcode+0)+0)=='M'){
J	L_Sample_Ringbuffer11
NOP	
L_Sample_Ringbuffer7:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BEQ	R3, R2, L__Sample_Ringbuffer48
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer48:
;Protocol.c,75 :: 		}else{
J	L_Sample_Ringbuffer13
NOP	
L_Sample_Ringbuffer12:
;Protocol.c,76 :: 		return;
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,77 :: 		}
L_Sample_Ringbuffer13:
L_Sample_Ringbuffer11:
;Protocol.c,78 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,79 :: 		case 'M':
L_Sample_Ringbuffer14:
;Protocol.c,80 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,82 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer50
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer50:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer52
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer52:
L_Sample_Ringbuffer5:
;Protocol.c,84 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,86 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,92 :: 		int strsplit(char arg[arr_size][str_size],char str[50], char c){
;Protocol.c,94 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,95 :: 		for (i = 0; i < 50;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit15:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit54
NOP	
J	L_strsplit16
NOP	
L__strsplit54:
;Protocol.c,96 :: 		err = i - lasti;
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;Protocol.c,97 :: 		if(str[i] == c || str[i] == '\r' || err > 49){
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit56
NOP	
J	L__strsplit36
NOP	
L__strsplit56:
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__strsplit58
NOP	
J	L__strsplit35
NOP	
L__strsplit58:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit59
NOP	
J	L__strsplit34
NOP	
L__strsplit59:
J	L_strsplit20
NOP	
; lasti end address is: 24 (R6)
L__strsplit36:
L__strsplit35:
L__strsplit34:
;Protocol.c,98 :: 		arg[kk][ii] = 0;
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,99 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,100 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,101 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
;Protocol.c,102 :: 		continue;//goto endb;
J	L_strsplit17
NOP	
;Protocol.c,103 :: 		}else{
L_strsplit20:
;Protocol.c,104 :: 		arg[kk][ii] = str[i];
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
;Protocol.c,105 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,108 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit60
NOP	
J	L_strsplit22
NOP	
L__strsplit60:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;Protocol.c,109 :: 		break;
J	L_strsplit16
NOP	
L_strsplit22:
;Protocol.c,110 :: 		}
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit17:
; lasti end address is: 24 (R6)
;Protocol.c,95 :: 		for (i = 0; i < 50;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,110 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit15
NOP	
L_strsplit16:
;Protocol.c,111 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;Protocol.c,112 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_cpystr:
;Protocol.c,114 :: 		int cpystr(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,117 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,118 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,120 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,121 :: 		while(*tmp != 0){
L_cpystr23:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpystr63
NOP	
J	L_cpystr24
NOP	
L__cpystr63:
;Protocol.c,122 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,123 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,124 :: 		}
; tmp end address is: 16 (R4)
J	L_cpystr23
NOP	
L_cpystr24:
;Protocol.c,125 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,127 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,128 :: 		}
L_end_cpystr:
JR	RA
NOP	
; end of _cpystr
_str2int:
;Protocol.c,133 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,135 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,137 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,139 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int25:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int65
NOP	
J	L_str2int26
NOP	
L__str2int65:
;Protocol.c,140 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,141 :: 		while(DMA_Busy(1));
L_str2int28:
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
BNE	R2, R0, L__str2int67
NOP	
J	L_str2int29
NOP	
L__str2int67:
J	L_str2int28
NOP	
L_str2int29:
;Protocol.c,139 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,142 :: 		}
; i end address is: 16 (R4)
J	L_str2int25
NOP	
L_str2int26:
;Protocol.c,144 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,145 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
_PrintDebug:
;Protocol.c,149 :: 		void PrintDebug(char *strA,char *strB,void *ptr){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Protocol.c,151 :: 		if(strA[0] == 'G'){
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BEQ	R3, R2, L__PrintDebug69
NOP	
J	L_PrintDebug30
NOP	
L__PrintDebug69:
;Protocol.c,152 :: 		G_Val = *(int*)ptr;
LH	R2, 0(R27)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
;Protocol.c,153 :: 		while(DMA_Busy(1));
L_PrintDebug31:
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
BNE	R2, R0, L__PrintDebug71
NOP	
J	L_PrintDebug32
NOP	
L__PrintDebug71:
J	L_PrintDebug31
NOP	
L_PrintDebug32:
;Protocol.c,154 :: 		dma_printf("%s\t%s\t%d\r\n",strA,strB,G_Val);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
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
;Protocol.c,155 :: 		}
L_PrintDebug30:
;Protocol.c,156 :: 		}
L_end_PrintDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _PrintDebug
