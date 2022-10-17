_main:
;Main.c,31 :: 		void main() {
ADDIU	SP, SP, -112
;Main.c,36 :: 		int xyz_ = 0;
;Main.c,37 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,39 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,40 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,42 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,43 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,44 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,45 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,46 :: 		EnableInterrupts();
EI	R30
;Main.c,47 :: 		while(1){
L_main0:
;Main.c,49 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main48
NOP	
J	L_main2
NOP	
L__main48:
;Main.c,50 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,51 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main49
NOP	
J	L_main3
NOP	
L__main49:
;Main.c,52 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,53 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main51
NOP	
J	L__main38
NOP	
L__main51:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main52
NOP	
J	L__main37
NOP	
L__main52:
L__main36:
;Main.c,54 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,53 :: 		if(LED1 && (oneshot == 0)){
L__main38:
L__main37:
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main53
NOP	
J	L__main40
NOP	
L__main53:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main54
NOP	
J	L__main39
NOP	
L__main54:
L__main35:
;Main.c,58 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
L__main40:
L__main39:
;Main.c,58 :: 		oneshot = 0;
L_main7:
;Main.c,60 :: 		}
L_main2:
;Main.c,64 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main55
NOP	
J	L_main11
NOP	
L__main55:
;Main.c,65 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,66 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,67 :: 		}
L_main11:
;Main.c,69 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main56
NOP	
J	L__main42
NOP	
L__main56:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main57
NOP	
J	L__main41
NOP	
L__main57:
L__main34:
;Main.c,70 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,71 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,72 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,73 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,74 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,75 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,76 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,77 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,78 :: 		sys.steps_position[X] = 0;
SW	R0, Offset(_sys+16)(GP)
;Main.c,69 :: 		if((!SW1)&&(!Toggle)){
L__main42:
L__main41:
;Main.c,81 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main59
NOP	
J	L_main15
NOP	
L__main59:
;Main.c,82 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main60
NOP	
J	L__main46
NOP	
L__main60:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main45
NOP	
L__main61:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main62
NOP	
J	L__main44
NOP	
L__main62:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main63
NOP	
J	L__main43
NOP	
L__main63:
L__main33:
;Main.c,83 :: 		sprintf(txt_,"%d",a);
ADDIU	R3, SP, 0
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Main+0)
ORI	R2, R2, lo_addr(?lstr_1_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,84 :: 		UART2_Write_Text("a:= ");
ORI	R30, R0, 97
SB	R30, 9(SP)
ORI	R30, R0, 58
SB	R30, 10(SP)
ORI	R30, R0, 61
SB	R30, 11(SP)
ORI	R30, R0, 32
SB	R30, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 13(SP)
ADDIU	R2, SP, 9
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,85 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,86 :: 		sprintf(txt_,"%d",STPS[X].step_count);
ADDIU	R3, SP, 0
LW	R2, Offset(_STPS+32)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,87 :: 		UART2_Write_Text(" | step_count[X]:= ");
ADDIU	R23, SP, 14
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr4_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,88 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,89 :: 		sprintf(txt_,"%d",sys.axis_dir[X]);
ADDIU	R3, SP, 0
LH	R2, Offset(_sys+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,90 :: 		UART2_Write_Text(" | axis_dir[X]:= ");
ADDIU	R23, SP, 34
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr6_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,91 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,92 :: 		sprintf(txt_,"%d",sys.steps_position[X]);
ADDIU	R3, SP, 0
LW	R2, Offset(_sys+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,93 :: 		UART2_Write_Text(" | absX:= ");
ADDIU	R23, SP, 52
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr8_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 52
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,94 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,95 :: 		sprintf(txt_,"%d",STPS[Y].step_count);
ADDIU	R3, SP, 0
LW	R2, Offset(_STPS+100)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Main+0)
ORI	R2, R2, lo_addr(?lstr_9_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,96 :: 		UART2_Write_Text(" | step_count[Y]:= ");
ADDIU	R23, SP, 63
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr10_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr10_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 63
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,97 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,98 :: 		sprintf(txt_,"%d",sys.axis_dir[Y]);
ADDIU	R3, SP, 0
LH	R2, Offset(_sys+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Main+0)
ORI	R2, R2, lo_addr(?lstr_11_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,99 :: 		UART2_Write_Text(" | axis_dir[Y]:= ");
ADDIU	R23, SP, 83
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr12_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr12_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 83
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,100 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,101 :: 		sprintf(txt_,"%d",sys.steps_position[Y]);
ADDIU	R3, SP, 0
LW	R2, Offset(_sys+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_13_Main+0)
ORI	R2, R2, lo_addr(?lstr_13_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,102 :: 		UART2_Write_Text(" | absY:= ");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr14_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr14_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 101
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,103 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,104 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Main.c,106 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,107 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,108 :: 		if(a > 8)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 9
BEQ	R2, R0, L__main64
NOP	
J	L_main19
NOP	
L__main64:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,82 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main46:
L__main45:
L__main44:
L__main43:
;Main.c,110 :: 		}
L_main15:
;Main.c,112 :: 		}
J	L_main0
NOP	
;Main.c,113 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,116 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,118 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move20
NOP	
;Main.c,119 :: 		case 0:
L_Temp_Move22:
;Main.c,120 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,121 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,122 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,123 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,124 :: 		case 2:
L_Temp_Move23:
;Main.c,125 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,126 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,127 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,128 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,129 :: 		case 1:
L_Temp_Move24:
;Main.c,130 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,131 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,132 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,133 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,134 :: 		case 3:
L_Temp_Move25:
;Main.c,135 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,136 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,137 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,138 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,139 :: 		case 4:
L_Temp_Move26:
;Main.c,140 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,142 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,143 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,144 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,145 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,146 :: 		case 5:
L_Temp_Move27:
;Main.c,147 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,149 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,150 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,151 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,152 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,153 :: 		case 6:
L_Temp_Move28:
;Main.c,154 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,155 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,156 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,158 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,159 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,160 :: 		case 7:
L_Temp_Move29:
;Main.c,161 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,162 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,163 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,165 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,166 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,167 :: 		case 8:
L_Temp_Move30:
;Main.c,168 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
;Main.c,169 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
ORI	R27, R0, 3
ORI	R26, R0, 15000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,170 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,171 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,172 :: 		case 9:
L_Temp_Move31:
;Main.c,174 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,1.0, 0.00);
LUI	R5, 17174
ORI	R5, R5, 0
LUI	R4, 49942
ORI	R4, R4, 0
LUI	R3, 16968
ORI	R3, R3, 0
LUI	R2, 49736
ORI	R2, R2, 0
MOVZ	R25, R0, R0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
LUI	R2, 16256
ORI	R2, R2, 0
ADDIU	SP, SP, -16
SW	R2, 12(SP)
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
;Main.c,175 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,176 :: 		default: a = 0;
L_Temp_Move32:
MOVZ	R25, R0, R0
;Main.c,177 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,178 :: 		}
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move68
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move82:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move84
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move84:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move86
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move86:
J	L_Temp_Move32
NOP	
L_Temp_Move21:
;Main.c,179 :: 		}
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
;Main.c,181 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,186 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_Main+0)
ORI	R2, R2, lo_addr(?lstr_15_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,187 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,189 :: 		sprintf(txt,"%d",STPS[0].decel_start);
LW	R2, Offset(_STPS+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_16_Main+0)
ORI	R2, R2, lo_addr(?lstr_16_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,190 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,194 :: 		sprintf(txt,"%d",STPS[0].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_17_Main+0)
ORI	R2, R2, lo_addr(?lstr_17_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,195 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,197 :: 		sprintf(txt,"%d",STPS[0].min_delay);
LW	R2, Offset(_STPS+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Main+0)
ORI	R2, R2, lo_addr(?lstr_18_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,198 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,202 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+52)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_19_Main+0)
ORI	R2, R2, lo_addr(?lstr_19_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,203 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,205 :: 		sprintf(txt,"%d",STPS[0].decel_val);
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_20_Main+0)
ORI	R2, R2, lo_addr(?lstr_20_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,206 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,207 :: 		}
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
