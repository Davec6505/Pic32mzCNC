_Sample_Ringbuffer:
;Protocol.c,5 :: 		void Sample_Ringbuffer(){
ADDIU	SP, SP, -284
SW	RA, 0(SP)
;Protocol.c,8 :: 		int dif = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Protocol.c,11 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,13 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer6
NOP	
J	L_Sample_Ringbuffer0
NOP	
L__Sample_Ringbuffer6:
;Protocol.c,14 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 216
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,16 :: 		SplitStr(gcode,str,0x20);
ADDIU	R3, SP, 216
ADDIU	R2, SP, 16
ORI	R27, R0, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_SplitStr+0
NOP	
;Protocol.c,17 :: 		dma_printf("\n%s \n%s \n%s \n%s",gcode[0],gcode[1],gcode[2],gcode[3]);
ADDIU	R6, SP, 16
ADDIU	R5, R6, 30
ADDIU	R4, R6, 20
ADDIU	R3, R6, 10
ADDIU	R23, SP, 266
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 266
ADDIU	SP, SP, -20
SW	R5, 16(SP)
SW	R4, 12(SP)
SW	R3, 8(SP)
SW	R6, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Protocol.c,18 :: 		}
L_Sample_Ringbuffer0:
;Protocol.c,20 :: 		}
L_end_Sample_Ringbuffer:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 284
JR	RA
NOP	
; end of _Sample_Ringbuffer
_SplitStr:
;Protocol.c,24 :: 		void SplitStr(char arg[str_size][arr_size],char *str,char c){
;Protocol.c,26 :: 		i = j = 0;
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;Protocol.c,28 :: 		while(*str != '\0'){
L_SplitStr1:
; i start address is: 16 (R4)
; j start address is: 20 (R5)
LBU	R2, 0(R26)
ANDI	R2, R2, 255
BNE	R2, R0, L__SplitStr9
NOP	
J	L_SplitStr2
NOP	
L__SplitStr9:
;Protocol.c,29 :: 		if(*str == c){
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__SplitStr10
NOP	
J	L__SplitStr4
NOP	
L__SplitStr10:
;Protocol.c,31 :: 		*(arg[i]+j)='\0';
SEH	R3, R4
ORI	R2, R0, 10
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
; j end address is: 20 (R5)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,32 :: 		j = 0;
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
;Protocol.c,33 :: 		i++;
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,34 :: 		str++;
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;Protocol.c,35 :: 		}
J	L_SplitStr3
NOP	
L__SplitStr4:
;Protocol.c,29 :: 		if(*str == c){
;Protocol.c,35 :: 		}
L_SplitStr3:
;Protocol.c,36 :: 		*(arg[i]+j) = *str;
; i start address is: 16 (R4)
; j start address is: 20 (R5)
SEH	R3, R4
ORI	R2, R0, 10
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R3, R3, R2
LBU	R2, 0(R26)
SB	R2, 0(R3)
;Protocol.c,37 :: 		j++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,38 :: 		str++;
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;Protocol.c,39 :: 		}
J	L_SplitStr1
NOP	
L_SplitStr2:
;Protocol.c,40 :: 		*(arg[i]+j)='\0';
SEH	R3, R4
; i end address is: 16 (R4)
ORI	R2, R0, 10
MULTU	R2, R3
MFLO	R2
ADDU	R3, R25, R2
SEH	R2, R5
; j end address is: 20 (R5)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,41 :: 		}
L_end_SplitStr:
JR	RA
NOP	
; end of _SplitStr
