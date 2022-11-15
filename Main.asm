_main:
;Main.c,54 :: 		void main() {
ADDIU	SP, SP, -84
;Main.c,58 :: 		int xyz_ = 0, i;
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
;Main.c,65 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,66 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,68 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,69 :: 		EnableInterrupts();
EI	R30
;Main.c,70 :: 		while(1){
L_main0:
;Main.c,72 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,73 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,75 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main41
NOP	
J	L_main2
NOP	
L__main41:
;Main.c,76 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,78 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main42
NOP	
J	L_main3
NOP	
L__main42:
;Main.c,79 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main3:
;Main.c,81 :: 		}
L_main2:
;Main.c,83 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main43
NOP	
J	L_main4
NOP	
L__main43:
;Main.c,84 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,85 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,86 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,87 :: 		}
L_main4:
;Main.c,89 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main44
NOP	
J	L__main35
NOP	
L__main44:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main45
NOP	
J	L__main34
NOP	
L__main45:
L__main33:
;Main.c,90 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,91 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,92 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,93 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,94 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,95 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,96 :: 		ResetHoming();
JAL	_ResetHoming+0
NOP	
;Main.c,97 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,89 :: 		if((!SW1)&&(!Toggle)){
L__main35:
L__main34:
;Main.c,100 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main47
NOP	
J	L_main8
NOP	
L__main47:
;Main.c,102 :: 		if((a > 19)){
LHU	R2, Offset(Main_a+0)(GP)
SLTIU	R2, R2, 20
BEQ	R2, R0, L__main48
NOP	
J	L_main9
NOP	
L__main48:
;Main.c,103 :: 		if(homing[X].home_cnt >= 2){
LHU	R2, Offset(_homing+2)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main49
NOP	
J	L_main10
NOP	
L__main49:
;Main.c,104 :: 		homing[X].home_cnt = 0;
SH	R0, Offset(_homing+2)(GP)
;Main.c,105 :: 		a = 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,106 :: 		dma_printf("\nXCnt:= %d : a:= %d",homing[X].home_cnt,a);
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
;Main.c,107 :: 		}
L_main10:
;Main.c,108 :: 		if(homing[Y].home_cnt >= 2){
LHU	R2, Offset(_homing+6)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main50
NOP	
J	L_main11
NOP	
L__main50:
;Main.c,109 :: 		homing[Y].home_cnt = 0;
SH	R0, Offset(_homing+6)(GP)
;Main.c,110 :: 		a = 12;
ORI	R2, R0, 12
SH	R2, Offset(Main_a+0)(GP)
;Main.c,111 :: 		dma_printf("\nXCnt:= %d : a:= %d",homing[X].home_cnt,a);
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
;Main.c,112 :: 		}
L_main11:
;Main.c,113 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,114 :: 		}else{
J	L_main12
NOP	
L_main9:
;Main.c,115 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__main51
NOP	
J	L__main39
NOP	
L__main51:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__main52
NOP	
J	L__main38
NOP	
L__main52:
LBU	R2, Offset(-1082064688)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__main53
NOP	
J	L__main37
NOP	
L__main53:
LBU	R2, Offset(-1082064702)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__main54
NOP	
J	L__main36
NOP	
L__main54:
L__main32:
;Main.c,116 :: 		a = Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
SH	R2, Offset(Main_a+0)(GP)
;Main.c,118 :: 		dma_printf("\na:= %d : Step:=\t%l mm2mve:=\t%l : Step:=\t%l",
ADDIU	R23, SP, 40
ADDIU	R22, R23, 44
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R4, SP, 40
;Main.c,120 :: 		STPS[X].step_count);
LW	R3, Offset(_STPS+32)(GP)
ADDIU	SP, SP, -20
SW	R3, 16(SP)
;Main.c,119 :: 		a,STPS[X].dist,STPS[X].mmToTravel,
LW	R3, Offset(_STPS+68)(GP)
SW	R3, 12(SP)
LW	R3, Offset(_STPS+36)(GP)
SW	R3, 8(SP)
SH	R2, 4(SP)
;Main.c,118 :: 		dma_printf("\na:= %d : Step:=\t%l mm2mve:=\t%l : Step:=\t%l",
SW	R4, 0(SP)
;Main.c,120 :: 		STPS[X].step_count);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Main.c,115 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main39:
L__main38:
L__main37:
L__main36:
;Main.c,123 :: 		}
L_main12:
;Main.c,124 :: 		}
L_main8:
;Main.c,125 :: 		}
J	L_main0
NOP	
;Main.c,126 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,128 :: 		int Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,129 :: 		switch(a){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Temp_Move16
NOP	
;Main.c,130 :: 		case 0:
L_Temp_Move18:
;Main.c,131 :: 		SingleAxisStep(50.00,8000,Y);
LUI	R2, 16968
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 1
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,132 :: 		a = 1;
ORI	R25, R0, 1
;Main.c,133 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,134 :: 		case 1:
L_Temp_Move19:
;Main.c,135 :: 		SingleAxisStep(50.00,8000,X);
LUI	R2, 16968
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,136 :: 		a = 2;
ORI	R25, R0, 2
;Main.c,137 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,138 :: 		case 2:
L_Temp_Move20:
;Main.c,139 :: 		SingleAxisStep(-50.00,8000,Y);
LUI	R2, 49736
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 1
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,140 :: 		a = 3;
ORI	R25, R0, 3
;Main.c,141 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,142 :: 		case 3:
L_Temp_Move21:
;Main.c,143 :: 		SingleAxisStep(-50.00,8000,X);
LUI	R2, 49736
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,144 :: 		a = 4;
ORI	R25, R0, 4
;Main.c,145 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,146 :: 		case 4:
L_Temp_Move22:
;Main.c,147 :: 		DualAxisStep(150.00, 100.00,X,Y,8000);
LUI	R3, 17096
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,148 :: 		a = 5;
ORI	R25, R0, 5
;Main.c,149 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,150 :: 		case 5:
L_Temp_Move23:
;Main.c,151 :: 		DualAxisStep(-150.00, -100.00,X,Y,8000);
LUI	R3, 49864
ORI	R3, R3, 0
LUI	R2, 49942
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,152 :: 		a = 6;
ORI	R25, R0, 6
;Main.c,153 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,154 :: 		case 6:
L_Temp_Move24:
;Main.c,155 :: 		DualAxisStep(150.00, 30.00,X,Y,8000);
LUI	R3, 16880
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,156 :: 		a = 9;
ORI	R25, R0, 9
;Main.c,157 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,158 :: 		case 7:
L_Temp_Move25:
;Main.c,159 :: 		DualAxisStep(-150.00, -30.00,X,Y,8000);
LUI	R3, 49648
ORI	R3, R3, 0
LUI	R2, 49942
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,160 :: 		a = 8;
ORI	R25, R0, 8
;Main.c,161 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,162 :: 		case 8:
L_Temp_Move26:
;Main.c,163 :: 		SingleAxisStep(350.00,10000,A);
LUI	R2, 17327
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 3
ORI	R25, R0, 10000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,164 :: 		a = 9;
ORI	R25, R0, 9
;Main.c,165 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,166 :: 		case 9:
L_Temp_Move27:
;Main.c,170 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,171 :: 		a = 12;
ORI	R25, R0, 12
;Main.c,172 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,173 :: 		case 10://Homing X axis                                                                abcdef
L_Temp_Move28:
;Main.c,174 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,175 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,176 :: 		case 11://Homing Y axis
L_Temp_Move29:
;Main.c,177 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,178 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,179 :: 		case 12://Homing Y axis
L_Temp_Move30:
;Main.c,181 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,182 :: 		default: a = 0;
L_Temp_Move31:
MOVZ	R25, R0, R0
;Main.c,183 :: 		break;
J	L_Temp_Move17
NOP	
;Main.c,184 :: 		}
L_Temp_Move16:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move58
NOP	
J	L_Temp_Move18
NOP	
L__Temp_Move58:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move60
NOP	
J	L_Temp_Move19
NOP	
L__Temp_Move60:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move62
NOP	
J	L_Temp_Move20
NOP	
L__Temp_Move62:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move64
NOP	
J	L_Temp_Move21
NOP	
L__Temp_Move64:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move66
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move66:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move68
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move82:
J	L_Temp_Move31
NOP	
L_Temp_Move17:
;Main.c,186 :: 		return a;
SEH	R2, R25
;Main.c,187 :: 		}
;Main.c,186 :: 		return a;
;Main.c,187 :: 		}
L_end_Temp_Move:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
