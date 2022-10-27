_main:
;Main.c,33 :: 		void main() {
ADDIU	SP, SP, -40
;Main.c,38 :: 		int xyz_ = 0, i;
;Main.c,40 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,42 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,43 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,45 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,46 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,47 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,48 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,50 :: 		EnableInterrupts();
EI	R30
;Main.c,51 :: 		while(1){
L_main0:
;Main.c,53 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main49
NOP	
J	L_main2
NOP	
L__main49:
;Main.c,54 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,55 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main50
NOP	
J	L_main3
NOP	
L__main50:
;Main.c,56 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,57 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main52
NOP	
J	L__main39
NOP	
L__main52:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main53
NOP	
J	L__main38
NOP	
L__main53:
L__main37:
;Main.c,58 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,59 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,57 :: 		if(LED1 && (oneshot == 0)){
L__main39:
L__main38:
;Main.c,59 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main54
NOP	
J	L__main41
NOP	
L__main54:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main55
NOP	
J	L__main40
NOP	
L__main55:
L__main36:
;Main.c,60 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,59 :: 		}else if(!LED1 && (oneshot == 1))
L__main41:
L__main40:
;Main.c,60 :: 		oneshot = 0;
L_main7:
;Main.c,62 :: 		}
L_main2:
;Main.c,66 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main56
NOP	
J	L_main11
NOP	
L__main56:
;Main.c,67 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,68 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,69 :: 		}
L_main11:
;Main.c,71 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main57
NOP	
J	L__main43
NOP	
L__main57:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main58
NOP	
J	L__main42
NOP	
L__main58:
L__main35:
;Main.c,72 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,73 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,74 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,75 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,76 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,77 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,78 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,79 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,80 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,71 :: 		if((!SW1)&&(!Toggle)){
L__main43:
L__main42:
;Main.c,83 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main60
NOP	
J	L_main15
NOP	
L__main60:
;Main.c,84 :: 		cntr++;
LH	R2, Offset(main_cntr_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(main_cntr_L0+0)(GP)
;Main.c,85 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main47
NOP	
L__main61:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main62
NOP	
J	L__main46
NOP	
L__main62:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main63
NOP	
J	L__main45
NOP	
L__main63:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main64
NOP	
J	L__main44
NOP	
L__main64:
L__main34:
;Main.c,86 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,87 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,88 :: 		if(a > 8)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 9
BEQ	R2, R0, L__main65
NOP	
J	L_main19
NOP	
L__main65:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,85 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main47:
L__main46:
L__main45:
L__main44:
;Main.c,98 :: 		if(cntr > 10000){
LH	R2, Offset(main_cntr_L0+0)(GP)
SLTI	R2, R2, 10001
BEQ	R2, R0, L__main66
NOP	
J	L_main20
NOP	
L__main66:
;Main.c,103 :: 		dma_printf("a:=%d:%l:%d:abs:=%l:%l:%d:abs:=%l \r\n",
ADDIU	R23, SP, 0
ADDIU	R22, R23, 37
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 0
;Main.c,106 :: 		sys.axis_dir[Y],sys.steps_position[Y]);
LW	R2, Offset(_sys+20)(GP)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LH	R2, Offset(_sys+2)(GP)
SH	R2, 24(SP)
;Main.c,105 :: 		sys.steps_position[X],STPS[Y].step_count,
LW	R2, Offset(_STPS+100)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_sys+16)(GP)
SW	R2, 16(SP)
;Main.c,104 :: 		a,STPS[X].step_count,sys.axis_dir[X],
LH	R2, Offset(_sys+0)(GP)
SH	R2, 12(SP)
LW	R2, Offset(_STPS+32)(GP)
SW	R2, 8(SP)
LHU	R2, Offset(Main_a+0)(GP)
SH	R2, 4(SP)
;Main.c,103 :: 		dma_printf("a:=%d:%l:%d:abs:=%l:%l:%d:abs:=%l \r\n",
SW	R3, 0(SP)
;Main.c,106 :: 		sys.axis_dir[Y],sys.steps_position[Y]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
;Main.c,108 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,109 :: 		}
L_main20:
;Main.c,110 :: 		}
L_main15:
;Main.c,112 :: 		Debounce_X_Limits();
JAL	_Debounce_X_Limits+0
NOP	
;Main.c,113 :: 		Debounce_Y_Limits();
JAL	_Debounce_Y_Limits+0
NOP	
;Main.c,114 :: 		}
J	L_main0
NOP	
;Main.c,115 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,118 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,120 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move21
NOP	
;Main.c,121 :: 		case 0:
L_Temp_Move23:
;Main.c,122 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,123 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,124 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,125 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,126 :: 		case 2:
L_Temp_Move24:
;Main.c,127 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,128 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,129 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,130 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,131 :: 		case 1:
L_Temp_Move25:
;Main.c,132 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,133 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,134 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,135 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,136 :: 		case 3:
L_Temp_Move26:
;Main.c,137 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,138 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,139 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,140 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,141 :: 		case 4:
L_Temp_Move27:
;Main.c,142 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,144 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,145 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,146 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,147 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,148 :: 		case 5:
L_Temp_Move28:
;Main.c,149 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,151 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,152 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,153 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,154 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,155 :: 		case 6:
L_Temp_Move29:
;Main.c,156 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,157 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,158 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,160 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,161 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,162 :: 		case 7:
L_Temp_Move30:
;Main.c,163 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,164 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,165 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,167 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,168 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,169 :: 		case 8:
L_Temp_Move31:
;Main.c,170 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
;Main.c,171 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
ORI	R27, R0, 3
ORI	R26, R0, 15000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,172 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,173 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,174 :: 		case 9:
L_Temp_Move32:
;Main.c,178 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,179 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,180 :: 		default: a = 0;
L_Temp_Move33:
MOVZ	R25, R0, R0
;Main.c,181 :: 		break;
J	L_Temp_Move22
NOP	
;Main.c,182 :: 		}
L_Temp_Move21:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move70
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move82:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move84
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move84:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move86
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move86:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move88
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move88:
J	L_Temp_Move33
NOP	
L_Temp_Move22:
;Main.c,183 :: 		}
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
_LCD_Display:
;Main.c,185 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,190 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Main+0)
ORI	R2, R2, lo_addr(?lstr_2_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,191 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,193 :: 		sprintf(txt,"%d",STPS[0].decel_start);
LW	R2, Offset(_STPS+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,194 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,198 :: 		sprintf(txt,"%d",STPS[0].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Main+0)
ORI	R2, R2, lo_addr(?lstr_4_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,199 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,201 :: 		sprintf(txt,"%d",STPS[0].min_delay);
LW	R2, Offset(_STPS+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,202 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,206 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+52)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Main+0)
ORI	R2, R2, lo_addr(?lstr_6_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,207 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,209 :: 		sprintf(txt,"%d",STPS[0].decel_val);
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,210 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,211 :: 		}
L_end_LCD_Display:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _LCD_Display
