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
BNE	R2, R0, L__Str_Initialize43
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize43:
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
ADDIU	SP, SP, -120
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
BEQ	R2, R0, L__Sample_Ringbuffer45
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer45:
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
;Protocol.c,39 :: 		i = cpystr(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 20
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_cpystr+0
NOP	
;Protocol.c,40 :: 		dma_printf("i:=\t%d \n",i);
ADDIU	R23, SP, 36
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 36
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,41 :: 		while(DMA_Busy(1))
L_Sample_Ringbuffer7:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer47
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer47:
;Protocol.c,42 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
J	L_Sample_Ringbuffer7
NOP	
L_Sample_Ringbuffer8:
;Protocol.c,43 :: 		dma_printf("%s\t%s\t%d \n",gcode[0],temp,G_Val);
ADDIU	R4, SP, 20
ADDIU	R23, SP, 45
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 45
LH	R2, 26(SP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
SW	R4, 8(SP)
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Protocol.c,44 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer9:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer49
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer49:
J	L_Sample_Ringbuffer9
NOP	
L_Sample_Ringbuffer10:
;Protocol.c,46 :: 		i = cpystr(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+60)
ORI	R25, R25, lo_addr(_gcode+60)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 20
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+60)
ORI	R26, R26, lo_addr(_gcode+60)
MOVZ	R25, R3, R0
JAL	_cpystr+0
NOP	
;Protocol.c,47 :: 		dma_printf("i:=\t%d \n",i);
ADDIU	R23, SP, 56
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr3_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 56
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,48 :: 		while(DMA_Busy(1))
L_Sample_Ringbuffer11:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer51
NOP	
J	L_Sample_Ringbuffer12
NOP	
L__Sample_Ringbuffer51:
;Protocol.c,49 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 32(SP)
J	L_Sample_Ringbuffer11
NOP	
L_Sample_Ringbuffer12:
;Protocol.c,50 :: 		dma_printf("%s\t%s\t%f \n",gcode[1],temp,XYZ_Val);
ADDIU	R4, SP, 20
ADDIU	R23, SP, 65
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr4_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 65
LW	R2, 32(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
SW	R4, 8(SP)
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Protocol.c,51 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer13:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer53
NOP	
J	L_Sample_Ringbuffer14
NOP	
L__Sample_Ringbuffer53:
J	L_Sample_Ringbuffer13
NOP	
L_Sample_Ringbuffer14:
;Protocol.c,53 :: 		i = cpystr(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+120)
ORI	R25, R25, lo_addr(_gcode+120)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 20
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+120)
ORI	R26, R26, lo_addr(_gcode+120)
MOVZ	R25, R3, R0
JAL	_cpystr+0
NOP	
;Protocol.c,54 :: 		dma_printf("i:=\t%d \n",i);
ADDIU	R23, SP, 76
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr5_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 76
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,55 :: 		while(DMA_Busy(1))
L_Sample_Ringbuffer15:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer55
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer55:
;Protocol.c,56 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 32(SP)
J	L_Sample_Ringbuffer15
NOP	
L_Sample_Ringbuffer16:
;Protocol.c,57 :: 		dma_printf("%s\t%s\t%f \n",gcode[2],temp,XYZ_Val);
ADDIU	R4, SP, 20
ADDIU	R23, SP, 85
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr6_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 85
LW	R2, 32(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
SW	R4, 8(SP)
LUI	R2, hi_addr(_gcode+120)
ORI	R2, R2, lo_addr(_gcode+120)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Protocol.c,58 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer17:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer57
NOP	
J	L_Sample_Ringbuffer18
NOP	
L__Sample_Ringbuffer57:
J	L_Sample_Ringbuffer17
NOP	
L_Sample_Ringbuffer18:
;Protocol.c,60 :: 		i = cpystr(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+180)
ORI	R25, R25, lo_addr(_gcode+180)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 20
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+180)
ORI	R26, R26, lo_addr(_gcode+180)
MOVZ	R25, R3, R0
JAL	_cpystr+0
NOP	
;Protocol.c,61 :: 		dma_printf("i:=\t%d \n",i);
ADDIU	R23, SP, 96
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr7_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr7_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 96
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,62 :: 		while(DMA_Busy(1))
L_Sample_Ringbuffer19:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer59
NOP	
J	L_Sample_Ringbuffer20
NOP	
L__Sample_Ringbuffer59:
;Protocol.c,63 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 28(SP)
J	L_Sample_Ringbuffer19
NOP	
L_Sample_Ringbuffer20:
;Protocol.c,64 :: 		dma_printf("%s  %s  %d \n",gcode[3],temp,F_Val);
ADDIU	R4, SP, 20
ADDIU	R23, SP, 105
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr8_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 105
LH	R2, 28(SP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
SW	R4, 8(SP)
LUI	R2, hi_addr(_gcode+180)
ORI	R2, R2, lo_addr(_gcode+180)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Protocol.c,65 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer21:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer61
NOP	
J	L_Sample_Ringbuffer22
NOP	
L__Sample_Ringbuffer61:
J	L_Sample_Ringbuffer21
NOP	
L_Sample_Ringbuffer22:
;Protocol.c,67 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,68 :: 		case 'M':
L_Sample_Ringbuffer23:
;Protocol.c,69 :: 		break;
J	L_Sample_Ringbuffer5
NOP	
;Protocol.c,71 :: 		}
L_Sample_Ringbuffer4:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer63
NOP	
J	L_Sample_Ringbuffer6
NOP	
L__Sample_Ringbuffer63:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer65
NOP	
J	L_Sample_Ringbuffer23
NOP	
L__Sample_Ringbuffer65:
L_Sample_Ringbuffer5:
;Protocol.c,73 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,75 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _Sample_Ringbuffer
_strsplit:
;Protocol.c,81 :: 		int strsplit(char arg[arr_size][str_size],char str[50], char c){
;Protocol.c,83 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,84 :: 		for (i = 0; i < 50;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit24:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit67
NOP	
J	L_strsplit25
NOP	
L__strsplit67:
;Protocol.c,85 :: 		err = i - lasti;
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;Protocol.c,86 :: 		if(str[i] == c || err > 49){
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__strsplit69
NOP	
J	L__strsplit41
NOP	
L__strsplit69:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 50
BNE	R2, R0, L__strsplit70
NOP	
J	L__strsplit40
NOP	
L__strsplit70:
J	L_strsplit29
NOP	
; lasti end address is: 24 (R6)
L__strsplit41:
L__strsplit40:
;Protocol.c,87 :: 		arg[kk][ii] = 0;
SEH	R3, R5
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,88 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,89 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,90 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
;Protocol.c,91 :: 		continue;//goto endb;
J	L_strsplit26
NOP	
;Protocol.c,92 :: 		}else{
L_strsplit29:
;Protocol.c,93 :: 		arg[kk][ii] = str[i];
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
;Protocol.c,94 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,97 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit71
NOP	
J	L_strsplit31
NOP	
L__strsplit71:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;Protocol.c,98 :: 		break;
J	L_strsplit25
NOP	
L_strsplit31:
;Protocol.c,99 :: 		}
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit26:
; lasti end address is: 24 (R6)
;Protocol.c,84 :: 		for (i = 0; i < 50;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,99 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit24
NOP	
L_strsplit25:
;Protocol.c,100 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;Protocol.c,101 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_cpystr:
;Protocol.c,103 :: 		int cpystr(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,106 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,107 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,109 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,110 :: 		while(*tmp != 0){
L_cpystr32:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__cpystr74
NOP	
J	L_cpystr33
NOP	
L__cpystr74:
;Protocol.c,111 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,112 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,113 :: 		}
; tmp end address is: 16 (R4)
J	L_cpystr32
NOP	
L_cpystr33:
;Protocol.c,114 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,116 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,117 :: 		}
L_end_cpystr:
JR	RA
NOP	
; end of _cpystr
_str2int:
;Protocol.c,122 :: 		int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,124 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,126 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,128 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_str2int34:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__str2int76
NOP	
J	L_str2int35
NOP	
L__str2int76:
;Protocol.c,129 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,130 :: 		while(DMA_Busy(1));
L_str2int37:
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
BNE	R2, R0, L__str2int78
NOP	
J	L_str2int38
NOP	
L__str2int78:
J	L_str2int37
NOP	
L_str2int38:
;Protocol.c,128 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,131 :: 		}
; i end address is: 16 (R4)
J	L_str2int34
NOP	
L_str2int35:
;Protocol.c,133 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,134 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _str2int
