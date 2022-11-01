_main:
;Main.c,53 :: 		void main() {
ADDIU	SP, SP, -24
;Main.c,58 :: 		int xyz_ = 0, i;
;Main.c,60 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,61 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,62 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,63 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,64 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,65 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,66 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,68 :: 		EnableInterrupts();
EI	R30
;Main.c,69 :: 		while(1){
L_main0:
;Main.c,70 :: 		LED1 = Test_Min(X)&0x0001;
MOVZ	R25, R0, R0
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,71 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main54
NOP	
J	L_main2
NOP	
L__main54:
;Main.c,73 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main55
NOP	
J	L_main3
NOP	
L__main55:
;Main.c,74 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,75 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main57
NOP	
J	L__main44
NOP	
L__main57:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main58
NOP	
J	L__main43
NOP	
L__main58:
L__main42:
;Main.c,76 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,77 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,75 :: 		if(LED1 && (oneshot == 0)){
L__main44:
L__main43:
;Main.c,77 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main59
NOP	
J	L__main46
NOP	
L__main59:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main60
NOP	
J	L__main45
NOP	
L__main60:
L__main41:
;Main.c,78 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,77 :: 		}else if(!LED1 && (oneshot == 1))
L__main46:
L__main45:
;Main.c,78 :: 		oneshot = 0;
L_main7:
;Main.c,80 :: 		}
L_main2:
;Main.c,84 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L_main11
NOP	
L__main61:
;Main.c,85 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,86 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,87 :: 		}
L_main11:
;Main.c,89 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main62
NOP	
J	L__main48
NOP	
L__main62:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main63
NOP	
J	L__main47
NOP	
L__main63:
L__main40:
;Main.c,90 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,91 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,92 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,93 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,94 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,95 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,96 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,97 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,98 :: 		sys.homing = 1;
ORI	R2, R0, 1
SB	R2, Offset(_sys+2)(GP)
;Main.c,99 :: 		sys.homing_cnt = 0;
SB	R0, Offset(_sys+3)(GP)
;Main.c,100 :: 		a = 10;
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
;Main.c,89 :: 		if((!SW1)&&(!Toggle)){
L__main48:
L__main47:
;Main.c,103 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main65
NOP	
J	L_main15
NOP	
L__main65:
;Main.c,105 :: 		if(FP(Test_Min(X))){
MOVZ	R25, R0, R0
JAL	_Test_Min+0
NOP	
ANDI	R25, R2, 255
JAL	_FP+0
NOP	
BNE	R2, R0, L__main67
NOP	
J	L_main16
NOP	
L__main67:
;Main.c,107 :: 		StopX();
JAL	_StopX+0
NOP	
;Main.c,108 :: 		Delay_ms(200);
LUI	R24, 203
ORI	R24, R24, 29524
L_main17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main17
NOP	
NOP	
NOP	
;Main.c,109 :: 		}
L_main16:
;Main.c,110 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main68
NOP	
J	L__main52
NOP	
L__main68:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main69
NOP	
J	L__main51
NOP	
L__main69:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main70
NOP	
J	L__main50
NOP	
L__main70:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main71
NOP	
J	L__main49
NOP	
L__main71:
L__main39:
;Main.c,111 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,110 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main52:
L__main51:
L__main50:
L__main49:
;Main.c,121 :: 		cntr++;
LH	R2, Offset(main_cntr_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(main_cntr_L0+0)(GP)
;Main.c,122 :: 		if(cntr > 10000){
SEH	R2, R2
SLTI	R2, R2, 10001
BEQ	R2, R0, L__main72
NOP	
J	L_main22
NOP	
L__main72:
;Main.c,124 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
ADDIU	R23, SP, 0
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 0
;Main.c,126 :: 		STPS[X].steps_position);
LW	R2, Offset(_STPS+68)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Main.c,125 :: 		a,STPS[X].step_count,STPS[X].axis_dir,
LH	R2, Offset(_STPS+84)(GP)
SH	R2, 12(SP)
LW	R2, Offset(_STPS+32)(GP)
SW	R2, 8(SP)
LHU	R2, Offset(Main_a+0)(GP)
SH	R2, 4(SP)
;Main.c,124 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
SW	R3, 0(SP)
;Main.c,126 :: 		STPS[X].steps_position);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Main.c,137 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,138 :: 		}
L_main22:
;Main.c,140 :: 		}
L_main15:
;Main.c,141 :: 		Debounce_X_Limits();
JAL	_Debounce_X_Limits+0
NOP	
;Main.c,142 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,144 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,145 :: 		}
J	L_main0
NOP	
;Main.c,146 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,149 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,151 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move23
NOP	
;Main.c,152 :: 		case 0:
L_Temp_Move25:
;Main.c,153 :: 		STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,154 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,155 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,156 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,157 :: 		case 1:
L_Temp_Move26:
;Main.c,158 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,159 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,160 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,161 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,162 :: 		case 2:
L_Temp_Move27:
;Main.c,163 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
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
;Main.c,165 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,166 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,167 :: 		case 3:
L_Temp_Move28:
;Main.c,168 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,169 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,170 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,171 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,172 :: 		case 4:
L_Temp_Move29:
;Main.c,173 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,175 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,176 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,177 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,178 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,179 :: 		case 5:
L_Temp_Move30:
;Main.c,180 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,182 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,183 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,184 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,185 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,186 :: 		case 6:
L_Temp_Move31:
;Main.c,187 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,188 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,189 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,191 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,192 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,193 :: 		case 7:
L_Temp_Move32:
;Main.c,194 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,195 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,196 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,198 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,199 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,200 :: 		case 8:
L_Temp_Move33:
;Main.c,201 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+328)(GP)
;Main.c,202 :: 		speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
ORI	R27, R0, 3
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,211 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+328)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,212 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,213 :: 		case 9:
L_Temp_Move34:
;Main.c,217 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,218 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,219 :: 		case 10://Homing X axis
L_Temp_Move35:
;Main.c,220 :: 		Home_Axis(-300.00,500,X);
LUI	R2, 50070
ORI	R2, R2, 0
MOVZ	R26, R0, R0
ORI	R25, R0, 500
MTC1	R2, S12
JAL	_Home_Axis+0
NOP	
;Main.c,221 :: 		a =12;
ORI	R25, R0, 12
;Main.c,222 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,223 :: 		case 11://Homing Y axis
L_Temp_Move36:
;Main.c,224 :: 		Inv_Home_Axis(10.00,100,X);
LUI	R2, 16672
ORI	R2, R2, 0
MOVZ	R26, R0, R0
ORI	R25, R0, 100
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
;Main.c,225 :: 		sys.homing = 1;
ORI	R2, R0, 1
SB	R2, Offset(_sys+2)(GP)
;Main.c,226 :: 		a = 12;
ORI	R25, R0, 12
;Main.c,227 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,228 :: 		case 12://Homing Y axis
L_Temp_Move37:
;Main.c,230 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,231 :: 		default: a = 0;
L_Temp_Move38:
MOVZ	R25, R0, R0
;Main.c,232 :: 		break;
J	L_Temp_Move24
NOP	
;Main.c,233 :: 		}
L_Temp_Move23:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move76
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move82:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move84
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move84:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move86
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move86:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move88
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move88:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move90
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move90:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move92
NOP	
J	L_Temp_Move33
NOP	
L__Temp_Move92:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move94
NOP	
J	L_Temp_Move34
NOP	
L__Temp_Move94:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move96
NOP	
J	L_Temp_Move35
NOP	
L__Temp_Move96:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move98
NOP	
J	L_Temp_Move36
NOP	
L__Temp_Move98:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move100
NOP	
J	L_Temp_Move37
NOP	
L__Temp_Move100:
J	L_Temp_Move38
NOP	
L_Temp_Move24:
;Main.c,234 :: 		}
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
