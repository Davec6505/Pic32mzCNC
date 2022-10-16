_main:
;Main.c,30 :: 		void main() {
ADDIU	SP, SP, -16
;Main.c,35 :: 		int xyz_ = 0;
;Main.c,36 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,38 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,39 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,41 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,42 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,43 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,44 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,45 :: 		EnableInterrupts();
EI	R30
;Main.c,46 :: 		while(1){
L_main0:
;Main.c,48 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main49
NOP	
J	L_main2
NOP	
L__main49:
;Main.c,49 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,50 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main50
NOP	
J	L_main3
NOP	
L__main50:
;Main.c,51 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,52 :: 		if(LED1 && (oneshot == 0)){
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
;Main.c,53 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,56 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,52 :: 		if(LED1 && (oneshot == 0)){
L__main39:
L__main38:
;Main.c,56 :: 		}else if(!LED1 && (oneshot == 1))
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
;Main.c,57 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,56 :: 		}else if(!LED1 && (oneshot == 1))
L__main41:
L__main40:
;Main.c,57 :: 		oneshot = 0;
L_main7:
;Main.c,59 :: 		}
L_main2:
;Main.c,63 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main56
NOP	
J	L_main11
NOP	
L__main56:
;Main.c,64 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,65 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,66 :: 		}
L_main11:
;Main.c,68 :: 		if((!SW1)&&(!Toggle)){
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
;Main.c,69 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,70 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,71 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,72 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,73 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,74 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,75 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,76 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,68 :: 		if((!SW1)&&(!Toggle)){
L__main43:
L__main42:
;Main.c,80 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main60
NOP	
J	L_main15
NOP	
L__main60:
;Main.c,81 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
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
;Main.c,82 :: 		sprintf(txt_,"%d",a);
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
;Main.c,83 :: 		UART2_Write_Text("a:= ");
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
;Main.c,84 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,85 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Main.c,87 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,88 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,90 :: 		if(a > 8)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 9
BEQ	R2, R0, L__main65
NOP	
J	L_main19
NOP	
L__main65:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,81 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main47:
L__main46:
L__main45:
L__main44:
;Main.c,93 :: 		}
L_main15:
;Main.c,95 :: 		}
J	L_main0
NOP	
;Main.c,96 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,99 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,101 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move20
NOP	
;Main.c,102 :: 		case 0:
L_Temp_Move22:
;Main.c,103 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,104 :: 		speed_cntr_Move(STPS[X].mmToTravel, 5000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,105 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,106 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,107 :: 		case 1:
L_Temp_Move23:
;Main.c,108 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,109 :: 		speed_cntr_Move(STPS[X].mmToTravel, 5000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,110 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,111 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,112 :: 		case 2:
L_Temp_Move24:
;Main.c,113 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,114 :: 		speed_cntr_Move(STPS[X].mmToTravel, 5000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,115 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,116 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,117 :: 		case 3:
L_Temp_Move25:
;Main.c,118 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,119 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,120 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,121 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,122 :: 		case 5:
L_Temp_Move26:
;Main.c,123 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,124 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,125 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,126 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_SingleAxisStep+0
NOP	
;Main.c,127 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,128 :: 		case 4:
L_Temp_Move27:
;Main.c,129 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,131 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,132 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,133 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,134 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,135 :: 		case 5:
L_Temp_Move28:
;Main.c,136 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,138 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,139 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 5000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,140 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,141 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,142 :: 		case 6:
L_Temp_Move29:
;Main.c,143 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,144 :: 		speed_cntr_Move(STPS[X].mmToTravel, 7000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 7000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,145 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,147 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,148 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,149 :: 		case 7:
L_Temp_Move30:
;Main.c,150 :: 		STPS[X].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,151 :: 		speed_cntr_Move(STPS[X].mmToTravel, 5000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 5000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,152 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,154 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,155 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,156 :: 		case 8:
L_Temp_Move31:
;Main.c,157 :: 		STPS[A].mmToTravel = belt_steps(150.00);
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
;Main.c,158 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
ORI	R27, R0, 3
ORI	R26, R0, 15000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,159 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,160 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,162 :: 		case 9:
L_Temp_Move32:
;Main.c,165 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,166 :: 		default: a = 0;
L_Temp_Move33:
MOVZ	R25, R0, R0
;Main.c,167 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,168 :: 		}
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move69
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move69:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move71
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move71:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move73
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move73:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move75
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move75:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move77
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move77:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move79
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move79:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move81
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move81:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move83
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move83:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move85
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move85:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move87
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move87:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move89
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move89:
J	L_Temp_Move33
NOP	
L_Temp_Move21:
;Main.c,169 :: 		}
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
;Main.c,171 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,176 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LW	R2, Offset(_STPS+48)(GP)
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
;Main.c,177 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,179 :: 		sprintf(txt,"%d",STPS[0].decel_start);
LW	R2, Offset(_STPS+12)(GP)
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
;Main.c,180 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,184 :: 		sprintf(txt,"%d",STPS[0].step_delay);
LW	R2, Offset(_STPS+8)(GP)
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
;Main.c,185 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,187 :: 		sprintf(txt,"%d",STPS[0].min_delay);
LW	R2, Offset(_STPS+20)(GP)
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
;Main.c,188 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,192 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+52)(GP)
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
;Main.c,193 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,195 :: 		sprintf(txt,"%d",STPS[0].decel_val);
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Main+0)
ORI	R2, R2, lo_addr(?lstr_8_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,196 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,197 :: 		}
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
