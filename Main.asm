_main:
;Main.c,54 :: 		void main() {
ADDIU	SP, SP, -24
;Main.c,57 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 20(SP)
;Main.c,59 :: 		int xyz_ = 0, i,dif;
;Main.c,63 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,64 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,65 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,66 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,67 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,68 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,70 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,71 :: 		EnableInterrupts();
EI	R30
;Main.c,72 :: 		Toggle = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,73 :: 		while(1){
L_main0:
;Main.c,75 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,76 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,77 :: 		if(!status_of_gcode)
LH	R2, 0(SP)
BEQ	R2, R0, L__main26
NOP	
J	L_main2
NOP	
L__main26:
;Main.c,78 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 20(SP)
L_main2:
;Main.c,79 :: 		if(axis_to_run){
LH	R2, 20(SP)
BNE	R2, R0, L__main28
NOP	
J	L_main3
NOP	
L__main28:
;Main.c,80 :: 		while(DMA_Busy(1));
L_main4:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__main30
NOP	
J	L_main5
NOP	
L__main30:
J	L_main4
NOP	
L_main5:
;Main.c,81 :: 		dma_printf("axis_to_run:= %d\n",axis_to_run);
ADDIU	R23, SP, 2
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 2
LH	R2, 20(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Main.c,82 :: 		Temp_Move(axis_to_run);
LH	R25, 20(SP)
JAL	_Temp_Move+0
NOP	
;Main.c,83 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 20(SP)
;Main.c,84 :: 		}
L_main3:
;Main.c,86 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 0(SP)
;Main.c,89 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,93 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main31
NOP	
J	L_main6
NOP	
L__main31:
;Main.c,94 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main6:
;Main.c,100 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,101 :: 		}
J	L_main0
NOP	
;Main.c,102 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,105 :: 		int Temp_Move(int a){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,106 :: 		switch(a){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Temp_Move7
NOP	
;Main.c,107 :: 		case 1: //b0000 0001
L_Temp_Move9:
;Main.c,108 :: 		EnStepperX();
SH	R25, 12(SP)
JAL	_EnStepperX+0
NOP	
;Main.c,109 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,110 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,111 :: 		case 2://b0000 0010
L_Temp_Move10:
;Main.c,112 :: 		EnStepperY();
SH	R25, 12(SP)
JAL	_EnStepperY+0
NOP	
;Main.c,113 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
ORI	R26, R0, 1
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,114 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,115 :: 		case 3://b0000 0011
L_Temp_Move11:
;Main.c,116 :: 		while(DMA_Busy(1));
L_Temp_Move12:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L__Temp_Move35
NOP	
J	L_Temp_Move13
NOP	
L__Temp_Move35:
J	L_Temp_Move12
NOP	
L_Temp_Move13:
;Main.c,117 :: 		dma_printf("X:= %d | Y:=%d\n",gc.next_position[X],gc.next_position[Y]);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 14
LW	R2, Offset(_gc+100)(GP)
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_gc+96)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,118 :: 		EnStepperX();EnStepperY();
JAL	_EnStepperX+0
NOP	
JAL	_EnStepperY+0
NOP	
;Main.c,119 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+100)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,120 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,121 :: 		case 4://b0000 0100
L_Temp_Move14:
;Main.c,122 :: 		EnStepperZ();
SH	R25, 12(SP)
JAL	_EnStepperZ+0
NOP	
;Main.c,123 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
ORI	R26, R0, 2
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+104)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,124 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,125 :: 		case 5://b0000 0101
L_Temp_Move15:
;Main.c,126 :: 		EnStepperX();EnStepperZ();
SH	R25, 12(SP)
JAL	_EnStepperX+0
NOP	
JAL	_EnStepperZ+0
NOP	
;Main.c,127 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+104)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,128 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,129 :: 		case 6://b0000 0110
L_Temp_Move16:
;Main.c,130 :: 		EnStepperY();EnStepperZ();
SH	R25, 12(SP)
JAL	_EnStepperY+0
NOP	
JAL	_EnStepperZ+0
NOP	
;Main.c,131 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+104)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,132 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,133 :: 		case 8://b0000 1000
L_Temp_Move17:
;Main.c,134 :: 		EnStepperA();
SH	R25, 12(SP)
JAL	_EnStepperA+0
NOP	
;Main.c,135 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
ORI	R26, R0, 3
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+108)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,136 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,137 :: 		case 9://b0000 1001
L_Temp_Move18:
;Main.c,138 :: 		EnStepperX();EnStepperA();
SH	R25, 12(SP)
JAL	_EnStepperX+0
NOP	
JAL	_EnStepperA+0
NOP	
;Main.c,139 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,140 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,141 :: 		case 10://b0000 1010
L_Temp_Move19:
;Main.c,142 :: 		EnStepperY();EnStepperA();
SH	R25, 12(SP)
JAL	_EnStepperY+0
NOP	
JAL	_EnStepperA+0
NOP	
;Main.c,143 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,144 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,145 :: 		case 12://b0000 1100
L_Temp_Move20:
;Main.c,146 :: 		EnStepperZ();EnStepperA();
SH	R25, 12(SP)
JAL	_EnStepperZ+0
NOP	
JAL	_EnStepperA+0
NOP	
;Main.c,147 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+104)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,148 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,149 :: 		case 13://Homing X axis
L_Temp_Move21:
;Main.c,150 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,151 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,152 :: 		case 14://Homing Y axis
L_Temp_Move22:
;Main.c,153 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,154 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,155 :: 		case 15://Homing Y axis
L_Temp_Move23:
;Main.c,156 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
LUI	R5, 16880
ORI	R5, R5, 0
LUI	R4, 17174
ORI	R4, R4, 0
LUI	R3, 16880
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
ADDIU	SP, SP, -16
SWC1	S0, 12(SP)
LUI	R2, 16968
ORI	R2, R2, 0
SW	R2, 8(SP)
LUI	R2, 49736
ORI	R2, R2, 0
SW	R2, 4(SP)
SWC1	S0, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 12(SP)
;Main.c,157 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,158 :: 		default: a = 0;
L_Temp_Move24:
MOVZ	R25, R0, R0
;Main.c,159 :: 		break;
J	L_Temp_Move8
NOP	
;Main.c,160 :: 		}
L_Temp_Move7:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move37
NOP	
J	L_Temp_Move9
NOP	
L__Temp_Move37:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move39
NOP	
J	L_Temp_Move10
NOP	
L__Temp_Move39:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move41
NOP	
J	L_Temp_Move11
NOP	
L__Temp_Move41:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move43
NOP	
J	L_Temp_Move14
NOP	
L__Temp_Move43:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move45
NOP	
J	L_Temp_Move15
NOP	
L__Temp_Move45:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move47
NOP	
J	L_Temp_Move16
NOP	
L__Temp_Move47:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move49
NOP	
J	L_Temp_Move17
NOP	
L__Temp_Move49:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move51
NOP	
J	L_Temp_Move18
NOP	
L__Temp_Move51:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move53
NOP	
J	L_Temp_Move19
NOP	
L__Temp_Move53:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move55
NOP	
J	L_Temp_Move20
NOP	
L__Temp_Move55:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Temp_Move57
NOP	
J	L_Temp_Move21
NOP	
L__Temp_Move57:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Temp_Move59
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move59:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Temp_Move61
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move61:
J	L_Temp_Move24
NOP	
L_Temp_Move8:
;Main.c,162 :: 		return a;
SEH	R2, R25
;Main.c,163 :: 		}
;Main.c,162 :: 		return a;
;Main.c,163 :: 		}
L_end_Temp_Move:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Temp_Move
