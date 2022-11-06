_main:
;Main.c,54 :: 		void main() {
ADDIU	SP, SP, -80
;Main.c,59 :: 		int xyz_ = 0, i;
;Main.c,62 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,63 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,64 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,65 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,66 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,67 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,68 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,70 :: 		EnableInterrupts();
EI	R30
;Main.c,71 :: 		while(1){
L_main0:
;Main.c,72 :: 		LED1 = Test_Min(X)&0x0001;
MOVZ	R25, R0, R0
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,73 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,74 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,75 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main43
NOP	
J	L_main2
NOP	
L__main43:
;Main.c,77 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main44
NOP	
J	L_main3
NOP	
L__main44:
;Main.c,78 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,80 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main46
NOP	
J	L__main37
NOP	
L__main46:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main47
NOP	
J	L__main36
NOP	
L__main47:
L__main35:
;Main.c,81 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,82 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,80 :: 		if(LED1 && (oneshot == 0)){
L__main37:
L__main36:
;Main.c,82 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main48
NOP	
J	L__main39
NOP	
L__main48:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main49
NOP	
J	L__main38
NOP	
L__main49:
L__main34:
;Main.c,83 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,82 :: 		}else if(!LED1 && (oneshot == 1))
L__main39:
L__main38:
;Main.c,83 :: 		oneshot = 0;
L_main7:
;Main.c,84 :: 		}
L_main2:
;Main.c,86 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main50
NOP	
J	L_main11
NOP	
L__main50:
;Main.c,87 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,88 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,89 :: 		}
L_main11:
;Main.c,91 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main51
NOP	
J	L__main41
NOP	
L__main51:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main52
NOP	
J	L__main40
NOP	
L__main52:
L__main33:
;Main.c,92 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,93 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,94 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,95 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,96 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,97 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,98 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,99 :: 		ResetHoming();
JAL	_ResetHoming+0
NOP	
;Main.c,100 :: 		a = 10;
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
;Main.c,91 :: 		if((!SW1)&&(!Toggle)){
L__main41:
L__main40:
;Main.c,103 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main54
NOP	
J	L_main15
NOP	
L__main54:
;Main.c,106 :: 		if(homing[X].home_cnt >= 2){
LHU	R2, Offset(_homing+2)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main55
NOP	
J	L_main16
NOP	
L__main55:
;Main.c,107 :: 		homing[X].home_cnt = 0;
SH	R0, Offset(_homing+2)(GP)
;Main.c,108 :: 		a = 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,109 :: 		dma_printf("\nXCnt:= %d : a:= %d",homing[X].home_cnt,a);
ADDIU	R23, SP, 0
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 0
ORI	R2, R0, 11
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SH	R0, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,110 :: 		}
L_main16:
;Main.c,111 :: 		if(homing[Y].home_cnt >= 2){
LHU	R2, Offset(_homing+6)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main56
NOP	
J	L_main17
NOP	
L__main56:
;Main.c,112 :: 		homing[Y].home_cnt = 0;
SH	R0, Offset(_homing+6)(GP)
;Main.c,113 :: 		a = 12;
ORI	R2, R0, 12
SH	R2, Offset(Main_a+0)(GP)
;Main.c,114 :: 		dma_printf("\nXCnt:= %d : a:= %d",homing[X].home_cnt,a);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
ORI	R2, R0, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LHU	R2, Offset(_homing+2)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,115 :: 		}
L_main17:
;Main.c,117 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,132 :: 		dma_printf("\na:=\t%d: cnt:=\t%l: dir:=\t%d: abs:=\t%l",
ADDIU	R23, SP, 40
ADDIU	R22, R23, 38
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 40
;Main.c,134 :: 		STPS[X].steps_position);
LW	R2, Offset(_STPS+68)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Main.c,133 :: 		a,STPS[X].step_count,STPS[X].axis_dir,
LH	R2, Offset(_STPS+84)(GP)
SH	R2, 12(SP)
LW	R2, Offset(_STPS+32)(GP)
SW	R2, 8(SP)
LHU	R2, Offset(Main_a+0)(GP)
SH	R2, 4(SP)
;Main.c,132 :: 		dma_printf("\na:=\t%d: cnt:=\t%l: dir:=\t%d: abs:=\t%l",
SW	R3, 0(SP)
;Main.c,134 :: 		STPS[X].steps_position);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Main.c,140 :: 		}
L_main15:
;Main.c,142 :: 		}
J	L_main0
NOP	
;Main.c,143 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,145 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,146 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move18
NOP	
;Main.c,147 :: 		case 0:
L_Temp_Move20:
;Main.c,148 :: 		STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,149 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,154 :: 		case 2:
L_Temp_Move21:
;Main.c,155 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,156 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,157 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,158 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,159 :: 		case 3:
L_Temp_Move22:
;Main.c,160 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,161 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,162 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,163 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,164 :: 		case 4:
L_Temp_Move23:
;Main.c,165 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,167 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,168 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,169 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,170 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,171 :: 		case 5:
L_Temp_Move24:
;Main.c,172 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,174 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,175 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,176 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,177 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,178 :: 		case 6:
L_Temp_Move25:
;Main.c,179 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,180 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,181 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,183 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,184 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,185 :: 		case 7:
L_Temp_Move26:
;Main.c,186 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,187 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,188 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,190 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,191 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,192 :: 		case 8:
L_Temp_Move27:
;Main.c,193 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+328)(GP)
;Main.c,194 :: 		speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
ORI	R27, R0, 3
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,205 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+328)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,206 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,207 :: 		case 9:
L_Temp_Move28:
;Main.c,211 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
LUI	R5, 17174
ORI	R5, R5, 0
LUI	R4, 49942
ORI	R4, R4, 0
LUI	R3, 16968
ORI	R3, R3, 0
LUI	R2, 49736
ORI	R2, R2, 0
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
;Main.c,212 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,213 :: 		case 10://Homing X axis
L_Temp_Move29:
;Main.c,214 :: 		Home(X);
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
;Main.c,215 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,216 :: 		case 11://Homing Y axis
L_Temp_Move30:
;Main.c,217 :: 		Home(Y);
ORI	R25, R0, 1
JAL	_Home+0
NOP	
;Main.c,218 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,219 :: 		case 12://Homing Y axis
L_Temp_Move31:
;Main.c,221 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,222 :: 		default: a = 0;
L_Temp_Move32:
MOVZ	R25, R0, R0
;Main.c,223 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,224 :: 		}
L_Temp_Move18:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move60
NOP	
J	L_Temp_Move20
NOP	
L__Temp_Move60:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move62
NOP	
J	L_Temp_Move21
NOP	
L__Temp_Move62:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move64
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move64:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move66
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move66:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move68
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move82:
J	L_Temp_Move32
NOP	
L_Temp_Move19:
;Main.c,225 :: 		}
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
