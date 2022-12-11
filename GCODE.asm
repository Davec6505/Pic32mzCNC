_G_Instruction:
;GCODE.c,5 :: 		void G_Instruction(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,6 :: 		while(DMA_Busy(1));
L_G_Instruction0:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__G_Instruction6
NOP	
J	L_G_Instruction1
NOP	
L__G_Instruction6:
J	L_G_Instruction0
NOP	
L_G_Instruction1:
;GCODE.c,7 :: 		dma_printf("%d\r\n",mode);
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 100
SB	R30, 7(SP)
ORI	R30, R0, 13
SB	R30, 8(SP)
ORI	R30, R0, 10
SB	R30, 9(SP)
MOVZ	R30, R0, R0
SB	R30, 10(SP)
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;GCODE.c,8 :: 		}
L_end_G_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _G_Instruction
_M_Instruction:
;GCODE.c,10 :: 		void M_Instruction(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,11 :: 		while(DMA_Busy(1));
L_M_Instruction2:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__M_Instruction9
NOP	
J	L_M_Instruction3
NOP	
L__M_Instruction9:
J	L_M_Instruction2
NOP	
L_M_Instruction3:
;GCODE.c,12 :: 		dma_printf("%d\r\n",mode);
ORI	R30, R0, 37
SB	R30, 6(SP)
ORI	R30, R0, 100
SB	R30, 7(SP)
ORI	R30, R0, 13
SB	R30, 8(SP)
ORI	R30, R0, 10
SB	R30, 9(SP)
MOVZ	R30, R0, R0
SB	R30, 10(SP)
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;GCODE.c,13 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _M_Instruction
