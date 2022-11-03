_main:
;Main.c,53 :: 		void main() {
ADDIU	SP, SP, -24
;Main.c,58 :: 		int xyz_ = 0, i;
;Main.c,60 :: 		fp = Test_Min;
LUI	R2, hi_addr(_Test_Min+0)
ORI	R2, R2, lo_addr(_Test_Min+0)
SW	R2, Offset(_fp+0)(GP)
;Main.c,61 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,62 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,63 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,64 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,65 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,66 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,67 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,69 :: 		EnableInterrupts();
EI	R30
;Main.c,70 :: 		while(1){
L_main0:
;Main.c,71 :: 		LED1 = Test_Min(X)&0x0001;
MOVZ	R25, R0, R0
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,73 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main56
NOP	
J	L_main2
NOP	
L__main56:
;Main.c,75 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main57
NOP	
J	L_main3
NOP	
L__main57:
;Main.c,76 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,77 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main59
NOP	
J	L__main46
NOP	
L__main59:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main60
NOP	
J	L__main45
NOP	
L__main60:
L__main44:
;Main.c,78 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,79 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,77 :: 		if(LED1 && (oneshot == 0)){
L__main46:
L__main45:
;Main.c,79 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main48
NOP	
L__main61:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main62
NOP	
J	L__main47
NOP	
L__main62:
L__main43:
;Main.c,80 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,79 :: 		}else if(!LED1 && (oneshot == 1))
L__main48:
L__main47:
;Main.c,80 :: 		oneshot = 0;
L_main7:
;Main.c,82 :: 		}
L_main2:
;Main.c,84 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main63
NOP	
J	L_main11
NOP	
L__main63:
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
BEQ	R2, R0, L__main64
NOP	
J	L__main50
NOP	
L__main64:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main65
NOP	
J	L__main49
NOP	
L__main65:
L__main42:
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
;Main.c,98 :: 		sys.homing = 2;
ORI	R2, R0, 2
SB	R2, Offset(_sys+2)(GP)
;Main.c,99 :: 		sys.homing_cnt = 0;
SB	R0, Offset(_sys+3)(GP)
;Main.c,100 :: 		a = 10;
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
;Main.c,89 :: 		if((!SW1)&&(!Toggle)){
L__main50:
L__main49:
;Main.c,103 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main67
NOP	
J	L_main15
NOP	
L__main67:
;Main.c,105 :: 		if(FP(Y)){
ORI	R25, R0, 1
JAL	_FP+0
NOP	
BNE	R2, R0, L__main69
NOP	
J	L_main16
NOP	
L__main69:
;Main.c,106 :: 		StopY();
JAL	_StopY+0
NOP	
;Main.c,107 :: 		a= 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,108 :: 		}
L_main16:
;Main.c,110 :: 		if(FN(Y)){
ORI	R25, R0, 1
JAL	_FN+0
NOP	
BNE	R2, R0, L__main71
NOP	
J	L_main17
NOP	
L__main71:
;Main.c,111 :: 		sys.homing = 1;
ORI	R2, R0, 1
SB	R2, Offset(_sys+2)(GP)
;Main.c,112 :: 		}
L_main17:
;Main.c,114 :: 		if(sys.homing == 1){
LB	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main72
NOP	
J	L_main18
NOP	
L__main72:
;Main.c,115 :: 		a = 10;
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
;Main.c,116 :: 		sys.homing= 2;
ORI	R2, R0, 2
SB	R2, Offset(_sys+2)(GP)
;Main.c,117 :: 		}
L_main18:
;Main.c,118 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main73
NOP	
J	L__main54
NOP	
L__main73:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main74
NOP	
J	L__main53
NOP	
L__main74:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main75
NOP	
J	L__main52
NOP	
L__main75:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main76
NOP	
J	L__main51
NOP	
L__main76:
L__main41:
;Main.c,119 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,120 :: 		if(a < 9){
LHU	R2, Offset(Main_a+0)(GP)
SLTIU	R2, R2, 9
BNE	R2, R0, L__main77
NOP	
J	L_main22
NOP	
L__main77:
;Main.c,121 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,122 :: 		if(a == 9)a=10;
ANDI	R3, R2, 65535
ORI	R2, R0, 9
BEQ	R3, R2, L__main78
NOP	
J	L_main23
NOP	
L__main78:
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
L_main23:
;Main.c,123 :: 		}
L_main22:
;Main.c,118 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main54:
L__main53:
L__main52:
L__main51:
;Main.c,131 :: 		cntr++;
LH	R2, Offset(main_cntr_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(main_cntr_L0+0)(GP)
;Main.c,132 :: 		if(cntr > 10000){
SEH	R2, R2
SLTI	R2, R2, 10001
BEQ	R2, R0, L__main79
NOP	
J	L_main24
NOP	
L__main79:
;Main.c,134 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
ADDIU	R23, SP, 0
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 0
;Main.c,136 :: 		STPS[X].steps_position);
LW	R2, Offset(_STPS+68)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Main.c,135 :: 		a,STPS[X].step_count,STPS[X].axis_dir,
LH	R2, Offset(_STPS+84)(GP)
SH	R2, 12(SP)
LW	R2, Offset(_STPS+32)(GP)
SW	R2, 8(SP)
LHU	R2, Offset(Main_a+0)(GP)
SH	R2, 4(SP)
;Main.c,134 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
SW	R3, 0(SP)
;Main.c,136 :: 		STPS[X].steps_position);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Main.c,147 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,148 :: 		}
L_main24:
;Main.c,150 :: 		}
L_main15:
;Main.c,152 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,154 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,155 :: 		}
J	L_main0
NOP	
;Main.c,156 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,159 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,161 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move25
NOP	
;Main.c,162 :: 		case 0:
L_Temp_Move27:
;Main.c,163 :: 		STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
LUI	R2, 16968
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
J	L_Temp_Move26
NOP	
;Main.c,167 :: 		case 1:
L_Temp_Move28:
;Main.c,168 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
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
J	L_Temp_Move26
NOP	
;Main.c,172 :: 		case 2:
L_Temp_Move29:
;Main.c,173 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,174 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,175 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,176 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,177 :: 		case 3:
L_Temp_Move30:
;Main.c,178 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,179 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,180 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,181 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,182 :: 		case 4:
L_Temp_Move31:
;Main.c,183 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,185 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,186 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,187 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,188 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,189 :: 		case 5:
L_Temp_Move32:
;Main.c,190 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,192 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,193 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,194 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,195 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,196 :: 		case 6:
L_Temp_Move33:
;Main.c,197 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,198 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,199 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,201 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,202 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,203 :: 		case 7:
L_Temp_Move34:
;Main.c,204 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,205 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,206 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,208 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,209 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,210 :: 		case 8:
L_Temp_Move35:
;Main.c,211 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+328)(GP)
;Main.c,212 :: 		speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
ORI	R27, R0, 3
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,221 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+328)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,222 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,223 :: 		case 9:
L_Temp_Move36:
;Main.c,227 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,228 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,229 :: 		case 10://Homing X axis
L_Temp_Move37:
;Main.c,230 :: 		Home_Axis(-300.00,500,Y);
LUI	R2, 50070
ORI	R2, R2, 0
ORI	R26, R0, 1
ORI	R25, R0, 500
MTC1	R2, S12
JAL	_Home_Axis+0
NOP	
;Main.c,231 :: 		a =12;
ORI	R25, R0, 12
;Main.c,232 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,233 :: 		case 11://Homing Y axis
L_Temp_Move38:
;Main.c,234 :: 		Inv_Home_Axis(10.00,100,Y);
LUI	R2, 16672
ORI	R2, R2, 0
ORI	R26, R0, 1
ORI	R25, R0, 100
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
;Main.c,235 :: 		a = 12;
ORI	R25, R0, 12
;Main.c,236 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,237 :: 		case 12://Homing Y axis
L_Temp_Move39:
;Main.c,239 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,240 :: 		default: a = 0;
L_Temp_Move40:
MOVZ	R25, R0, R0
;Main.c,241 :: 		break;
J	L_Temp_Move26
NOP	
;Main.c,242 :: 		}
L_Temp_Move25:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move83
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move83:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move85
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move85:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move87
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move87:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move89
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move89:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move91
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move91:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move93
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move93:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move95
NOP	
J	L_Temp_Move33
NOP	
L__Temp_Move95:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move97
NOP	
J	L_Temp_Move34
NOP	
L__Temp_Move97:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move99
NOP	
J	L_Temp_Move35
NOP	
L__Temp_Move99:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move101
NOP	
J	L_Temp_Move36
NOP	
L__Temp_Move101:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move103
NOP	
J	L_Temp_Move37
NOP	
L__Temp_Move103:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move105
NOP	
J	L_Temp_Move38
NOP	
L__Temp_Move105:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move107
NOP	
J	L_Temp_Move39
NOP	
L__Temp_Move107:
J	L_Temp_Move40
NOP	
L_Temp_Move26:
;Main.c,243 :: 		}
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
