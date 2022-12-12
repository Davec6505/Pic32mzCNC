_G_Mode:
;GCODE.c,8 :: 		void G_Mode(int mode){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,9 :: 		gc.motion_mode = mode;
SH	R25, Offset(_gc+2)(GP)
;GCODE.c,11 :: 		while(DMA_Busy(1));
L_G_Mode0:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__G_Mode18
NOP	
J	L_G_Mode1
NOP	
L__G_Mode18:
J	L_G_Mode0
NOP	
L_G_Mode1:
;GCODE.c,12 :: 		dma_printf("gc.motion_mode:= %d\n",mode);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
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
;GCODE.c,14 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,17 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,18 :: 		gc.program_flow = flow;
SB	R25, Offset(_gc+7)(GP)
;GCODE.c,20 :: 		while(DMA_Busy(1));
L_M_Instruction2:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__M_Instruction21
NOP	
J	L_M_Instruction3
NOP	
L__M_Instruction21:
J	L_M_Instruction2
NOP	
L_M_Instruction3:
;GCODE.c,21 :: 		dma_printf("gc.program_flow:= %d\n",flow);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
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
;GCODE.c,23 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _M_Instruction
_G_Instruction:
;GCODE.c,26 :: 		void G_Instruction(char *c,void *any){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,30 :: 		switch(c[0]){
MOVZ	R4, R25, R0
J	L_G_Instruction4
NOP	
;GCODE.c,31 :: 		case 'X':
L_G_Instruction6:
;GCODE.c,32 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,33 :: 		gc.next_position[X] = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,34 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,35 :: 		case 'Y':
L_G_Instruction7:
;GCODE.c,36 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,37 :: 		gc.next_position[Y] = XYZ_Val;
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,38 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,39 :: 		case 'Z':
L_G_Instruction8:
;GCODE.c,40 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,41 :: 		gc.next_position[Z] = XYZ_Val;
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,42 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,43 :: 		case 'A':
L_G_Instruction9:
;GCODE.c,44 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,45 :: 		gc.next_position[A] = XYZ_Val;
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,46 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,47 :: 		case 'E':
L_G_Instruction10:
;GCODE.c,48 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,49 :: 		gc.next_position[B] = XYZ_Val;
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,50 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,51 :: 		case 'F':
L_G_Instruction11:
;GCODE.c,52 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 16(SP)
;GCODE.c,53 :: 		gc.frequency = F_Val;
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,54 :: 		break;
J	L_G_Instruction5
NOP	
;GCODE.c,55 :: 		}
L_G_Instruction4:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__G_Instruction24
NOP	
J	L_G_Instruction6
NOP	
L__G_Instruction24:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__G_Instruction26
NOP	
J	L_G_Instruction7
NOP	
L__G_Instruction26:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__G_Instruction28
NOP	
J	L_G_Instruction8
NOP	
L__G_Instruction28:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__G_Instruction30
NOP	
J	L_G_Instruction9
NOP	
L__G_Instruction30:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__G_Instruction32
NOP	
J	L_G_Instruction10
NOP	
L__G_Instruction32:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__G_Instruction34
NOP	
J	L_G_Instruction11
NOP	
L__G_Instruction34:
L_G_Instruction5:
;GCODE.c,57 :: 		while(DMA_Busy(1));
L_G_Instruction12:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__G_Instruction36
NOP	
J	L_G_Instruction13
NOP	
L__G_Instruction36:
J	L_G_Instruction12
NOP	
L_G_Instruction13:
;GCODE.c,58 :: 		if(c[0] != 'F')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__G_Instruction38
NOP	
J	L_G_Instruction14
NOP	
L__G_Instruction38:
;GCODE.c,59 :: 		dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 18
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 18
LW	R2, 12(SP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
SB	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R26, 4(SP)
J	L_G_Instruction15
NOP	
L_G_Instruction14:
;GCODE.c,61 :: 		dma_printf("\t%c\t%d\n",c[0],F_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 26
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 26
LH	R2, 16(SP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SB	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R26, 4(SP)
L_G_Instruction15:
;GCODE.c,63 :: 		}
L_end_G_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _G_Instruction
