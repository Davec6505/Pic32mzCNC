_Conditin_Externs:
;Main.c,48 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,49 :: 		PinMode();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_PinMode+0
NOP	
;Main.c,50 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,51 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,52 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,54 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,55 :: 		}
L_end_Conditin_Externs:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,58 :: 		void main() {
ADDIU	SP, SP, -36
;Main.c,63 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,64 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
SH	R0, 0(SP)
;Main.c,65 :: 		EnableInterrupts();
EI	R30
;Main.c,67 :: 		while(1){
L_main0:
;Main.c,69 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,70 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,71 :: 		if(!status_of_gcode)
LH	R2, 2(SP)
BEQ	R2, R0, L__main33
NOP	
J	L_main2
NOP	
L__main33:
;Main.c,72 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
L_main2:
;Main.c,73 :: 		if(axis_to_run){
LH	R2, 0(SP)
BNE	R2, R0, L__main35
NOP	
J	L_main3
NOP	
L__main35:
;Main.c,77 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,78 :: 		Temp_Move(axis_to_run);
LH	R25, 0(SP)
JAL	_Temp_Move+0
NOP	
;Main.c,79 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,80 :: 		}
L_main3:
;Main.c,82 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,85 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LHU	R2, Offset(_STPS+6)(GP)
BEQ	R2, R0, L__main36
NOP	
J	L__main30
NOP	
L__main36:
LHU	R2, Offset(_STPS+110)(GP)
BEQ	R2, R0, L__main37
NOP	
J	L__main29
NOP	
L__main37:
J	L_main6
NOP	
L__main30:
L__main29:
;Main.c,86 :: 		while(DMA_Busy(1));
L_main7:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__main39
NOP	
J	L_main8
NOP	
L__main39:
J	L_main7
NOP	
L_main8:
;Main.c,87 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",(STPS[X].run_state&0xff),STPS[X].step_count,SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
ADDIU	R23, SP, 4
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 4
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_SV+16)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+144)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,88 :: 		}
L_main6:
;Main.c,93 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,97 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main40
NOP	
J	L_main9
NOP	
L__main40:
;Main.c,98 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main9:
;Main.c,105 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,106 :: 		}
J	L_main0
NOP	
;Main.c,107 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,110 :: 		int Temp_Move(int a){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,111 :: 		switch(a){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Temp_Move10
NOP	
;Main.c,112 :: 		case 1: //b0000 0001
L_Temp_Move12:
;Main.c,113 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,114 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,115 :: 		case 2://b0000 0010
L_Temp_Move13:
;Main.c,116 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,117 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,118 :: 		case 3://b0000 0011
L_Temp_Move14:
;Main.c,119 :: 		while(DMA_Busy(1));
L_Temp_Move15:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L__Temp_Move44
NOP	
J	L_Temp_Move16
NOP	
L__Temp_Move44:
J	L_Temp_Move15
NOP	
L_Temp_Move16:
;Main.c,120 :: 		dma_printf("X:= %f | Y:=%f\n",gc.next_position[X],gc.next_position[Y]);
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
;Main.c,121 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+100)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,124 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,125 :: 		case 4://b0000 0100
L_Temp_Move17:
;Main.c,126 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+104)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,127 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,128 :: 		case 5://b0000 0101
L_Temp_Move18:
;Main.c,129 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+104)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,130 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,131 :: 		case 6://b0000 0110
L_Temp_Move19:
;Main.c,132 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+104)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,133 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,134 :: 		case 8://b0000 1000
L_Temp_Move20:
;Main.c,135 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+108)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,136 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,137 :: 		case 9://b0000 1001
L_Temp_Move21:
;Main.c,138 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+96)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,139 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,140 :: 		case 10://b0000 1010
L_Temp_Move22:
;Main.c,141 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+100)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,142 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,143 :: 		case 12://b0000 1100
L_Temp_Move23:
;Main.c,144 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+108)(GP)
LWC1	S12, Offset(_gc+104)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,145 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,146 :: 		case 13://Homing X axis
L_Temp_Move24:
;Main.c,147 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,148 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,149 :: 		case 14://Homing Y axis
L_Temp_Move25:
;Main.c,150 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,151 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,152 :: 		case 15://Homing Y axis
L_Temp_Move26:
;Main.c,153 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,154 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,155 :: 		default: a = 0;
L_Temp_Move27:
MOVZ	R25, R0, R0
;Main.c,156 :: 		break;
J	L_Temp_Move11
NOP	
;Main.c,157 :: 		}
L_Temp_Move10:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move46
NOP	
J	L_Temp_Move12
NOP	
L__Temp_Move46:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move48
NOP	
J	L_Temp_Move13
NOP	
L__Temp_Move48:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move50
NOP	
J	L_Temp_Move14
NOP	
L__Temp_Move50:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move52
NOP	
J	L_Temp_Move17
NOP	
L__Temp_Move52:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move54
NOP	
J	L_Temp_Move18
NOP	
L__Temp_Move54:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move56
NOP	
J	L_Temp_Move19
NOP	
L__Temp_Move56:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move58
NOP	
J	L_Temp_Move20
NOP	
L__Temp_Move58:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move60
NOP	
J	L_Temp_Move21
NOP	
L__Temp_Move60:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move62
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move62:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move64
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move64:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Temp_Move66
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move66:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Temp_Move68
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move70:
J	L_Temp_Move27
NOP	
L_Temp_Move11:
;Main.c,159 :: 		return a;
SEH	R2, R25
;Main.c,160 :: 		}
;Main.c,159 :: 		return a;
;Main.c,160 :: 		}
L_end_Temp_Move:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Temp_Move
