_Str_Initialize:
;Protocol.c,7 :: 		void Str_Initialize(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,10 :: 		for(i = 0; i <= arr_size;i++){
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
BNE	R2, R0, L__Str_Initialize22
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize22:
;Protocol.c,11 :: 		memset(gcode[i],0,str_size);
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
;Protocol.c,10 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,12 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,13 :: 		}
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
;Protocol.c,16 :: 		void Sample_Ringbuffer(){
ADDIU	SP, SP, -112
SW	RA, 0(SP)
;Protocol.c,19 :: 		int dif = 0,i,j;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Protocol.c,23 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,25 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer24
NOP	
J	L_Sample_Ringbuffer3
NOP	
L__Sample_Ringbuffer24:
;Protocol.c,27 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 18
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,28 :: 		dma_printf("\n%s",str);
ADDIU	R3, SP, 18
ORI	R30, R0, 10
SB	R30, 88(SP)
ORI	R30, R0, 37
SB	R30, 89(SP)
ORI	R30, R0, 115
SB	R30, 90(SP)
MOVZ	R30, R0, R0
SB	R30, 91(SP)
ADDIU	R2, SP, 88
ADDIU	SP, SP, -8
SW	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,29 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer4:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer26
NOP	
J	L_Sample_Ringbuffer5
NOP	
L__Sample_Ringbuffer26:
J	L_Sample_Ringbuffer4
NOP	
L_Sample_Ringbuffer5:
;Protocol.c,30 :: 		SplitInstruction(gcode,str,0x20);
ADDIU	R2, SP, 18
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_SplitInstruction+0
NOP	
;Protocol.c,31 :: 		switch(gcode[0][0]){
J	L_Sample_Ringbuffer6
NOP	
;Protocol.c,32 :: 		case 'G':
L_Sample_Ringbuffer8:
;Protocol.c,34 :: 		CopyStr(temp,"01", 2);
ORI	R30, R0, 48
SB	R30, 92(SP)
ORI	R30, R0, 49
SB	R30, 93(SP)
MOVZ	R30, R0, R0
SB	R30, 94(SP)
ADDIU	R3, SP, 92
ADDIU	R2, SP, 68
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_CopyStr+0
NOP	
;Protocol.c,35 :: 		for(i=0;i<2;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Sample_Ringbuffer9:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer27
NOP	
J	L_Sample_Ringbuffer10
NOP	
L__Sample_Ringbuffer27:
;Protocol.c,36 :: 		dma_printf("\n%c",temp[i]);
ADDIU	R3, SP, 68
SEH	R2, R4
ADDU	R2, R3, R2
LBU	R3, 0(R2)
ORI	R30, R0, 10
SB	R30, 95(SP)
ORI	R30, R0, 37
SB	R30, 96(SP)
ORI	R30, R0, 99
SB	R30, 97(SP)
MOVZ	R30, R0, R0
SB	R30, 98(SP)
ADDIU	R2, SP, 95
SH	R4, 16(SP)
ADDIU	SP, SP, -8
SB	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
; i end address is: 16 (R4)
LH	R4, 16(SP)
SEH	R3, R4
;Protocol.c,37 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer12:
; i start address is: 12 (R3)
SH	R3, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R3, 16(SP)
BNE	R2, R0, L__Sample_Ringbuffer29
NOP	
J	L_Sample_Ringbuffer13
NOP	
L__Sample_Ringbuffer29:
J	L_Sample_Ringbuffer12
NOP	
L_Sample_Ringbuffer13:
;Protocol.c,35 :: 		for(i=0;i<2;i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,38 :: 		}
; i end address is: 16 (R4)
J	L_Sample_Ringbuffer9
NOP	
L_Sample_Ringbuffer10:
;Protocol.c,41 :: 		dma_printf("\n%s\n%s\n%s\n%s",gcode[0],gcode[1],gcode[2],gcode[3]);
ADDIU	R23, SP, 99
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr4_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 99
LUI	R2, hi_addr(_gcode+180)
ORI	R2, R2, lo_addr(_gcode+180)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_gcode+120)
ORI	R2, R2, lo_addr(_gcode+120)
SW	R2, 12(SP)
LUI	R2, hi_addr(_gcode+60)
ORI	R2, R2, lo_addr(_gcode+60)
SW	R2, 8(SP)
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Protocol.c,42 :: 		while(DMA_Busy(1));
L_Sample_Ringbuffer14:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer31
NOP	
J	L_Sample_Ringbuffer15
NOP	
L__Sample_Ringbuffer31:
J	L_Sample_Ringbuffer14
NOP	
L_Sample_Ringbuffer15:
;Protocol.c,43 :: 		break;
J	L_Sample_Ringbuffer7
NOP	
;Protocol.c,44 :: 		case 'M':
L_Sample_Ringbuffer16:
;Protocol.c,45 :: 		break;
J	L_Sample_Ringbuffer7
NOP	
;Protocol.c,47 :: 		}
L_Sample_Ringbuffer6:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer33
NOP	
J	L_Sample_Ringbuffer8
NOP	
L__Sample_Ringbuffer33:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer35
NOP	
J	L_Sample_Ringbuffer16
NOP	
L__Sample_Ringbuffer35:
L_Sample_Ringbuffer7:
;Protocol.c,49 :: 		}
L_Sample_Ringbuffer3:
;Protocol.c,51 :: 		}
L_end_Sample_Ringbuffer:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 112
JR	RA
NOP	
; end of _Sample_Ringbuffer
_SplitInstruction:
;Protocol.c,56 :: 		void SplitInstruction(char arg[arr_size][str_size],char *str,char c){
;Protocol.c,58 :: 		i = j = 0;
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;Protocol.c,59 :: 		while(*str != '\0'){
L_SplitInstruction17:
; i start address is: 16 (R4)
; j start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__SplitInstruction38
NOP	
J	L_SplitInstruction18
NOP	
L__SplitInstruction38:
;Protocol.c,60 :: 		if(*str == c){
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__SplitInstruction39
NOP	
J	L__SplitInstruction20
NOP	
L__SplitInstruction39:
;Protocol.c,61 :: 		*(arg[i]+j)='\0';
SEH	R3, R4
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
; j end address is: 20 (R5)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,62 :: 		j = 0;
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
;Protocol.c,63 :: 		i++;
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,64 :: 		str++;
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;Protocol.c,65 :: 		}
J	L_SplitInstruction19
NOP	
L__SplitInstruction20:
;Protocol.c,60 :: 		if(*str == c){
;Protocol.c,65 :: 		}
L_SplitInstruction19:
;Protocol.c,66 :: 		*(arg[i]+j) = *str;
; i start address is: 16 (R4)
; j start address is: 20 (R5)
SEH	R3, R4
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R3, R3, R2
LBU	R2, 0(R26)
SB	R2, 0(R3)
;Protocol.c,67 :: 		j++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,68 :: 		str++;
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Protocol.c,69 :: 		}
J	L_SplitInstruction17
NOP	
L_SplitInstruction18:
;Protocol.c,70 :: 		*(arg[i]+j)='\0';
SEH	R3, R4
; i end address is: 16 (R4)
ORI	R2, R0, 60
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
; j end address is: 20 (R5)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,71 :: 		}
L_end_SplitInstruction:
JR	RA
NOP	
; end of _SplitInstruction
_CopyStr:
;Protocol.c,73 :: 		int CopyStr(char *to,char *from, int len){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,75 :: 		strcpy(to,from);
JAL	_strcpy+0
NOP	
;Protocol.c,76 :: 		return  1;
ORI	R2, R0, 1
;Protocol.c,77 :: 		}
L_end_CopyStr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CopyStr
