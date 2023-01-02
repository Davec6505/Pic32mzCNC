_Conditin_Externs:
;Main.c,56 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,57 :: 		PinMode();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_PinMode+0
NOP	
;Main.c,58 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,59 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,60 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,62 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,63 :: 		}
L_end_Conditin_Externs:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,66 :: 		void main() {
ADDIU	SP, SP, -36
;Main.c,67 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,72 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,73 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,74 :: 		EnableInterrupts();
EI	R30
;Main.c,76 :: 		while(1){
L_main0:
;Main.c,78 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,79 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,82 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main79
NOP	
J	L_main2
NOP	
L__main79:
;Main.c,84 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,85 :: 		switch(modal_group){
J	L_main3
NOP	
; modal_group end address is: 16 (R4)
;Main.c,86 :: 		case 0:break;
L_main5:
J	L_main4
NOP	
;Main.c,87 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main6:
;Main.c,88 :: 		modal_action = Non_Modal_Actions(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	_Non_Modal_Actions+0
NOP	
;Main.c,89 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,90 :: 		break;
J	L_main4
NOP	
;Main.c,91 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,92 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,93 :: 		if(axis_to_run){
BNE	R2, R0, L__main81
NOP	
J	L_main8
NOP	
L__main81:
;Main.c,94 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,95 :: 		Temp_Move(axis_to_run);
LH	R25, 0(SP)
JAL	_Temp_Move+0
NOP	
;Main.c,96 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,97 :: 		}
L_main8:
;Main.c,98 :: 		break;
J	L_main4
NOP	
;Main.c,99 :: 		case 8://MODAL_GROUP_2  [G17,G18,G19] Plane selection
L_main9:
;Main.c,100 :: 		break;
J	L_main4
NOP	
;Main.c,101 :: 		case 16://MODAL_GROUP_3 [G90,G91] Distance mode
L_main10:
;Main.c,102 :: 		break;
J	L_main4
NOP	
;Main.c,103 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main11:
;Main.c,104 :: 		break;
J	L_main4
NOP	
;Main.c,105 :: 		case 64://MODAL_GROUP_5 [G93,G94] Feed rate mode
L_main12:
;Main.c,106 :: 		break;
J	L_main4
NOP	
;Main.c,107 :: 		case 128://MODAL_GROUP_6 [G20,G21] Units
L_main13:
;Main.c,108 :: 		break;
J	L_main4
NOP	
;Main.c,109 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main14:
;Main.c,110 :: 		break;
J	L_main4
NOP	
;Main.c,111 :: 		case 512://MODAL_GROUP_12 [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main15:
;Main.c,112 :: 		break;
J	L_main4
NOP	
;Main.c,113 :: 		}
L_main3:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main83
NOP	
J	L_main5
NOP	
L__main83:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main85
NOP	
J	L_main6
NOP	
L__main85:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main87
NOP	
J	L_main7
NOP	
L__main87:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__main89
NOP	
J	L_main9
NOP	
L__main89:
SEH	R3, R4
ORI	R2, R0, 16
BNE	R3, R2, L__main91
NOP	
J	L_main10
NOP	
L__main91:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main93
NOP	
J	L_main11
NOP	
L__main93:
SEH	R3, R4
ORI	R2, R0, 64
BNE	R3, R2, L__main95
NOP	
J	L_main12
NOP	
L__main95:
SEH	R3, R4
ORI	R2, R0, 128
BNE	R3, R2, L__main97
NOP	
J	L_main13
NOP	
L__main97:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main99
NOP	
J	L_main14
NOP	
L__main99:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 512
BNE	R3, R2, L__main101
NOP	
J	L_main15
NOP	
L__main101:
L_main4:
;Main.c,114 :: 		}
L_main2:
;Main.c,115 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,119 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,124 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main102
NOP	
J	L_main16
NOP	
L__main102:
;Main.c,125 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main16:
;Main.c,132 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LHU	R2, Offset(_STPS+6)(GP)
BEQ	R2, R0, L__main103
NOP	
J	L__main76
NOP	
L__main103:
LHU	R2, Offset(_STPS+110)(GP)
BEQ	R2, R0, L__main104
NOP	
J	L__main75
NOP	
L__main104:
J	L_main19
NOP	
L__main76:
L__main75:
;Main.c,133 :: 		while(DMA_IsOn(1));
L_main20:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main106
NOP	
J	L_main21
NOP	
L__main106:
J	L_main20
NOP	
L_main21:
;Main.c,135 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
;Main.c,134 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
ADDIU	R23, SP, 4
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 4
;Main.c,136 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_SV+16)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+144)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
;Main.c,135 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
;Main.c,134 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
SW	R3, 0(SP)
;Main.c,136 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,137 :: 		}
L_main19:
;Main.c,140 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,141 :: 		}
J	L_main0
NOP	
;Main.c,142 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,145 :: 		int Temp_Move(int a){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,146 :: 		switch(a){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Temp_Move22
NOP	
;Main.c,147 :: 		case 1: //b0000 0001
L_Temp_Move24:
;Main.c,148 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+12)(GP)
LWC1	S12, Offset(_gc+68)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,149 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,150 :: 		case 2://b0000 0010
L_Temp_Move25:
;Main.c,151 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+12)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,152 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,153 :: 		case 3://b0000 0011
L_Temp_Move26:
;Main.c,154 :: 		while(DMA_IsOn(1));
L_Temp_Move27:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L__Temp_Move110
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move110:
J	L_Temp_Move27
NOP	
L_Temp_Move28:
;Main.c,155 :: 		dma_printf("X:= %f | Y:=%f\n",gc.next_position[X],gc.next_position[Y]);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 14
LW	R2, Offset(_gc+72)(GP)
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_gc+68)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,156 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+72)(GP)
LWC1	S12, Offset(_gc+68)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,159 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,160 :: 		case 4://b0000 0100
L_Temp_Move29:
;Main.c,161 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+12)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,162 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,163 :: 		case 5://b0000 0101
L_Temp_Move30:
;Main.c,164 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+68)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,165 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,166 :: 		case 6://b0000 0110
L_Temp_Move31:
;Main.c,167 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,168 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,169 :: 		case 8://b0000 1000
L_Temp_Move32:
;Main.c,170 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+12)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,171 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,172 :: 		case 9://b0000 1001
L_Temp_Move33:
;Main.c,173 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+68)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,174 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,175 :: 		case 10://b0000 1010
L_Temp_Move34:
;Main.c,176 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,177 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,178 :: 		case 12://b0000 1100
L_Temp_Move35:
;Main.c,179 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+12)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,180 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,181 :: 		case 13://Homing X axis
L_Temp_Move36:
;Main.c,182 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,183 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,184 :: 		case 14://Homing Y axis
L_Temp_Move37:
;Main.c,185 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,186 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,187 :: 		case 15://Homing Y axis
L_Temp_Move38:
;Main.c,188 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,189 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,190 :: 		default: a = 0;
L_Temp_Move39:
MOVZ	R25, R0, R0
;Main.c,191 :: 		break;
J	L_Temp_Move23
NOP	
;Main.c,192 :: 		}
L_Temp_Move22:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move112
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move112:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move114
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move114:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move116
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move116:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move118
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move118:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move120
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move120:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move122
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move122:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move124
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move124:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move126
NOP	
J	L_Temp_Move33
NOP	
L__Temp_Move126:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move128
NOP	
J	L_Temp_Move34
NOP	
L__Temp_Move128:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move130
NOP	
J	L_Temp_Move35
NOP	
L__Temp_Move130:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Temp_Move132
NOP	
J	L_Temp_Move36
NOP	
L__Temp_Move132:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Temp_Move134
NOP	
J	L_Temp_Move37
NOP	
L__Temp_Move134:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Temp_Move136
NOP	
J	L_Temp_Move38
NOP	
L__Temp_Move136:
J	L_Temp_Move39
NOP	
L_Temp_Move23:
;Main.c,194 :: 		return a;
SEH	R2, R25
;Main.c,195 :: 		}
;Main.c,194 :: 		return a;
;Main.c,195 :: 		}
L_end_Temp_Move:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Temp_Move
_Non_Modal_Actions:
;Main.c,197 :: 		int Non_Modal_Actions(int action){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Main.c,202 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Non_Modal_Actions40
NOP	
;Main.c,203 :: 		case 2:
L_Non_Modal_Actions42:
;Main.c,204 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,206 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+122)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Non_Modal_Actions138
NOP	
J	L_Non_Modal_Actions43
NOP	
L__Non_Modal_Actions138:
;Main.c,207 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+122)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,208 :: 		while(i < dly_time){
L_Non_Modal_Actions44:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Non_Modal_Actions139
NOP	
J	L_Non_Modal_Actions45
NOP	
L__Non_Modal_Actions139:
;Main.c,209 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,210 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Non_Modal_Actions46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Non_Modal_Actions46
NOP	
;Main.c,211 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,212 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Non_Modal_Actions44
NOP	
L_Non_Modal_Actions45:
;Main.c,213 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Non_Modal_Actions48
NOP	
L_Non_Modal_Actions43:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+120)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Non_Modal_Actions140
NOP	
J	L_Non_Modal_Actions49
NOP	
L__Non_Modal_Actions140:
;Main.c,214 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+120)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,215 :: 		while(i < dly_time){
L_Non_Modal_Actions50:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Non_Modal_Actions141
NOP	
J	L_Non_Modal_Actions51
NOP	
L__Non_Modal_Actions141:
;Main.c,216 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,217 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Non_Modal_Actions52:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Non_Modal_Actions52
NOP	
;Main.c,218 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,219 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Non_Modal_Actions50
NOP	
L_Non_Modal_Actions51:
;Main.c,220 :: 		}
L_Non_Modal_Actions49:
L_Non_Modal_Actions48:
;Main.c,221 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,222 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,223 :: 		case 4:
L_Non_Modal_Actions54:
;Main.c,236 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Non_Modal_Actions143
NOP	
J	L__Non_Modal_Actions73
NOP	
L__Non_Modal_Actions143:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L__Non_Modal_Actions145
NOP	
J	L__Non_Modal_Actions72
NOP	
L__Non_Modal_Actions145:
L__Non_Modal_Actions71:
;Main.c,237 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Non_Modal_Actions
NOP	
;Main.c,236 :: 		if(gc.L != 2 && gc.L != 20)
L__Non_Modal_Actions73:
L__Non_Modal_Actions72:
;Main.c,238 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Non_Modal_Actions146
NOP	
J	L_Non_Modal_Actions58
NOP	
L__Non_Modal_Actions146:
;Main.c,240 :: 		result = Settings_Write_Coord_Data(Addre,gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R27, hi_addr(_gc+68)
ORI	R27, R27, lo_addr(_gc+68)
LH	R26, Offset(_gc+120)(GP)
LUI	R25, 48387
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
; result start address is: 12 (R3)
SEH	R3, R2
;Main.c,241 :: 		if(result){
BNE	R2, R0, L__Non_Modal_Actions148
NOP	
J	L_Non_Modal_Actions59
NOP	
L__Non_Modal_Actions148:
; result end address is: 12 (R3)
;Main.c,242 :: 		while(DMA_IsOn(1));
L_Non_Modal_Actions60:
; result start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L__Non_Modal_Actions150
NOP	
J	L_Non_Modal_Actions61
NOP	
L__Non_Modal_Actions150:
J	L_Non_Modal_Actions60
NOP	
L_Non_Modal_Actions61:
;Main.c,243 :: 		dma_printf("res:= %d\n",result);
ADDIU	R23, SP, 16
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R25, 12(SP)
; result end address is: 12 (R3)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 12(SP)
;Main.c,244 :: 		}
L_Non_Modal_Actions59:
;Main.c,245 :: 		NVMReadRow(Add);
SH	R25, 12(SP)
LW	R25, Offset(_Add+0)(GP)
JAL	_NVMReadRow+0
NOP	
LH	R25, 12(SP)
;Main.c,253 :: 		} else {
J	L_Non_Modal_Actions62
NOP	
L_Non_Modal_Actions58:
;Main.c,264 :: 		}
L_Non_Modal_Actions62:
;Main.c,266 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,267 :: 		case 8:
L_Non_Modal_Actions63:
;Main.c,268 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,269 :: 		case 16:
L_Non_Modal_Actions64:
;Main.c,270 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,271 :: 		case 32:
L_Non_Modal_Actions65:
;Main.c,272 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,273 :: 		case 64:
L_Non_Modal_Actions66:
;Main.c,274 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,275 :: 		case 128:
L_Non_Modal_Actions67:
;Main.c,276 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,277 :: 		case 256:
L_Non_Modal_Actions68:
;Main.c,278 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,279 :: 		case 512:
L_Non_Modal_Actions69:
;Main.c,280 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,281 :: 		default: action = -1; //error in action msg ???
L_Non_Modal_Actions70:
ORI	R25, R0, 65535
;Main.c,282 :: 		break;
J	L_Non_Modal_Actions41
NOP	
;Main.c,283 :: 		}
L_Non_Modal_Actions40:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Non_Modal_Actions152
NOP	
J	L_Non_Modal_Actions42
NOP	
L__Non_Modal_Actions152:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Non_Modal_Actions154
NOP	
J	L_Non_Modal_Actions54
NOP	
L__Non_Modal_Actions154:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Non_Modal_Actions156
NOP	
J	L_Non_Modal_Actions63
NOP	
L__Non_Modal_Actions156:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__Non_Modal_Actions158
NOP	
J	L_Non_Modal_Actions64
NOP	
L__Non_Modal_Actions158:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L__Non_Modal_Actions160
NOP	
J	L_Non_Modal_Actions65
NOP	
L__Non_Modal_Actions160:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L__Non_Modal_Actions162
NOP	
J	L_Non_Modal_Actions66
NOP	
L__Non_Modal_Actions162:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L__Non_Modal_Actions164
NOP	
J	L_Non_Modal_Actions67
NOP	
L__Non_Modal_Actions164:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L__Non_Modal_Actions166
NOP	
J	L_Non_Modal_Actions68
NOP	
L__Non_Modal_Actions166:
SEH	R3, R25
ORI	R2, R0, 512
BNE	R3, R2, L__Non_Modal_Actions168
NOP	
J	L_Non_Modal_Actions69
NOP	
L__Non_Modal_Actions168:
J	L_Non_Modal_Actions70
NOP	
L_Non_Modal_Actions41:
;Main.c,284 :: 		return action;
SEH	R2, R25
;Main.c,285 :: 		}
;Main.c,284 :: 		return action;
;Main.c,285 :: 		}
L_end_Non_Modal_Actions:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Non_Modal_Actions
