_G_Instruction:
;GCODE.c,4 :: 		void G_Instruction(int _G_){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,5 :: 		dma_printf("\n%d",_G_);
ORI	R30, R0, 10
SB	R30, 4(SP)
ORI	R30, R0, 37
SB	R30, 5(SP)
ORI	R30, R0, 100
SB	R30, 6(SP)
MOVZ	R30, R0, R0
SB	R30, 7(SP)
ADDIU	R2, SP, 4
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,6 :: 		}
L_end_G_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _G_Instruction
