_main:
;Main.c,27 :: 		void main() {
;Main.c,31 :: 		int xyz_ = 0;
;Main.c,32 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,34 :: 		StepperConstants(5000,15500);
ORI	R26, R0, 15500
ORI	R25, R0, 5000
JAL	_StepperConstants+0
NOP	
;Main.c,35 :: 		EnableInterrupts();
EI	R30
;Main.c,36 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,38 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,39 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,40 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,41 :: 		while(1){
L_main0:
;Main.c,43 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__main49
NOP	
J	L_main2
NOP	
L__main49:
;Main.c,36 :: 		LED1 = TMR.clock >> 4;
=======
BEQ	R2, R0, L__main45
NOP	
J	L_main2
NOP	
L__main45:
;Main.c,44 :: 		LED1 = TMR.clock >> 4;
>>>>>>> patch1
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,45 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
<<<<<<< HEAD
BNE	R2, R0, L__main50
NOP	
J	L_main3
NOP	
L__main50:
;Main.c,38 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
=======
BNE	R2, R0, L__main46
NOP	
J	L_main3
NOP	
L__main46:
;Main.c,46 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
>>>>>>> patch1
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,47 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
<<<<<<< HEAD
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
;Main.c,40 :: 		oneshot = 1;
=======
BNE	R2, R0, L__main48
NOP	
J	L__main35
NOP	
L__main48:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main49
NOP	
J	L__main34
NOP	
L__main49:
L__main33:
;Main.c,48 :: 		oneshot = 1;
>>>>>>> patch1
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,51 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
<<<<<<< HEAD
;Main.c,39 :: 		if(LED1 && (oneshot == 0)){
L__main39:
L__main38:
;Main.c,43 :: 		}else if(!LED1 && (oneshot == 1))
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
;Main.c,44 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,43 :: 		}else if(!LED1 && (oneshot == 1))
L__main41:
L__main40:
;Main.c,44 :: 		oneshot = 0;
=======
;Main.c,47 :: 		if(LED1 && (oneshot == 0)){
L__main35:
L__main34:
;Main.c,51 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main50
NOP	
J	L__main37
NOP	
L__main50:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main51
NOP	
J	L__main36
NOP	
L__main51:
L__main32:
;Main.c,52 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,51 :: 		}else if(!LED1 && (oneshot == 1))
L__main37:
L__main36:
;Main.c,52 :: 		oneshot = 0;
>>>>>>> patch1
L_main7:
;Main.c,54 :: 		}
L_main2:
;Main.c,58 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
<<<<<<< HEAD
BEQ	R2, R0, L__main56
NOP	
J	L_main11
NOP	
L__main56:
;Main.c,51 :: 		Toggle  = 0;
=======
BEQ	R2, R0, L__main52
NOP	
J	L_main11
NOP	
L__main52:
;Main.c,59 :: 		Toggle  = 0;
>>>>>>> patch1
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,60 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,61 :: 		}
L_main11:
;Main.c,63 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
<<<<<<< HEAD
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
;Main.c,59 :: 		a = 7;
ORI	R2, R0, 7
SH	R2, Offset(Main_a+0)(GP)
;Main.c,60 :: 		LED1 = 0;
=======
BEQ	R2, R0, L__main53
NOP	
J	L__main39
NOP	
L__main53:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main54
NOP	
J	L__main38
NOP	
L__main54:
L__main31:
;Main.c,64 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,65 :: 		LED1 = 0;
>>>>>>> patch1
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,66 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,67 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,68 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,69 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
<<<<<<< HEAD
;Main.c,65 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,66 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,58 :: 		if((!SW1)&&(!Toggle)){
L__main43:
L__main42:
;Main.c,70 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main60
NOP	
J	L_main15
NOP	
L__main60:
;Main.c,71 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main61
=======
;Main.c,70 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,71 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,63 :: 		if((!SW1)&&(!Toggle)){
L__main39:
L__main38:
;Main.c,75 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main56
NOP	
J	L_main15
NOP	
L__main56:
;Main.c,76 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main57
NOP	
J	L__main43
NOP	
L__main57:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main58
NOP	
J	L__main42
NOP	
L__main58:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main59
NOP	
J	L__main41
NOP	
L__main59:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main60
>>>>>>> patch1
NOP	
J	L__main40
NOP	
<<<<<<< HEAD
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
;Main.c,72 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,73 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,74 :: 		if(a > 6)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 7
BEQ	R2, R0, L__main65
NOP	
J	L_main19
NOP	
L__main65:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,71 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main47:
L__main46:
L__main45:
L__main44:
;Main.c,76 :: 		}
=======
L__main60:
L__main30:
;Main.c,77 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,78 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,79 :: 		if(a > 6)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 7
BEQ	R2, R0, L__main61
NOP	
J	L_main19
NOP	
L__main61:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,76 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main43:
L__main42:
L__main41:
L__main40:
;Main.c,81 :: 		}
>>>>>>> patch1
L_main15:
;Main.c,83 :: 		}
J	L_main0
NOP	
;Main.c,84 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,87 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,89 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move20
NOP	
<<<<<<< HEAD
;Main.c,85 :: 		case 0:
L_Temp_Move22:
;Main.c,86 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
=======
;Main.c,90 :: 		case 0:
L_Temp_Move22:
;Main.c,91 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,92 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,93 :: 		SingleAxisStep(STPS[Z].mmToTravel,Z);
ORI	R26, R0, 2
LW	R25, Offset(_STPS+200)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,89 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,90 :: 		case 1:
L_Temp_Move23:
;Main.c,91 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
=======
;Main.c,94 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,95 :: 		case 1:
L_Temp_Move23:
;Main.c,96 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,97 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,98 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,94 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,95 :: 		case 2:
L_Temp_Move24:
;Main.c,96 :: 		STPS[Y].mmToTravel = calcSteps(202.00,8.06);
=======
;Main.c,99 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,100 :: 		case 2:
L_Temp_Move24:
;Main.c,101 :: 		STPS[Y].mmToTravel = calcSteps(202.00,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17226
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,97 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,98 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,99 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,100 :: 		case 3:
L_Temp_Move25:
;Main.c,101 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
=======
>>>>>>> patch1
;Main.c,102 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,103 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,104 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,105 :: 		case 3:
L_Temp_Move25:
;Main.c,106 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,107 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,108 :: 		STPS[Z].mmToTravel = calcSteps(25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 16842
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,109 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,110 :: 		DualAxisStep(STPS[Y].mmToTravel, STPS[Z].mmToTravel,yz);
ORI	R27, R0, 2
LW	R26, Offset(_STPS+200)(GP)
LW	R25, Offset(_STPS+132)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,106 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,107 :: 		case 4:
L_Temp_Move26:
;Main.c,108 :: 		STPS[X].mmToTravel = calcSteps(228.25,8.06);
=======
;Main.c,111 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,112 :: 		case 4:
L_Temp_Move26:
;Main.c,113 :: 		STPS[X].mmToTravel = calcSteps(228.25,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17252
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,114 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,115 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,116 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,117 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+200)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,113 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,114 :: 		case 5:
L_Temp_Move27:
;Main.c,115 :: 		STPS[X].mmToTravel = calcSteps(-228.25,8.06);
=======
;Main.c,118 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,119 :: 		case 5:
L_Temp_Move27:
;Main.c,120 :: 		STPS[X].mmToTravel = calcSteps(-228.25,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 50020
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,121 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,122 :: 		STPS[Y].mmToTravel = calcSteps(25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 16842
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,123 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,124 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,120 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,121 :: 		case 6:
L_Temp_Move28:
;Main.c,122 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
=======
;Main.c,125 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,126 :: 		case 6:
L_Temp_Move28:
;Main.c,127 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
>>>>>>> patch1
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
;Main.c,128 :: 		speed_cntr_Move(STPS[A].mmToTravel, 25000,A);
ORI	R27, R0, 3
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,129 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,125 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,126 :: 		case 7:
L_Temp_Move29:
;Main.c,127 :: 		if(!Circ.cir_start){
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Temp_Move68
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move68:
;Main.c,128 :: 		SetCircleVals(450.00,250.00,486.00,386.00,-100.00,100.00,280.00,CW);
LUI	R5, 17345
ORI	R5, R5, 0
LUI	R4, 17395
ORI	R4, R4, 0
LUI	R3, 17274
ORI	R3, R3, 0
LUI	R2, 17377
ORI	R2, R2, 0
=======
;Main.c,130 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,132 :: 		default: a = 0;
L_Temp_Move29:
>>>>>>> patch1
MOVZ	R25, R0, R0
;Main.c,133 :: 		break;
J	L_Temp_Move21
NOP	
<<<<<<< HEAD
ADDIU	SP, SP, 12
;Main.c,129 :: 		Circ.cir_start = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_Circ+0)(GP)
;Main.c,130 :: 		}
L_Temp_Move30:
;Main.c,131 :: 		if(Circ.cir_start){
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Temp_Move70
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move70:
;Main.c,133 :: 		if(!Circ.cir_next){
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Temp_Move71
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move71:
;Main.c,134 :: 		Circ.cir_next = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_Circ+0)(GP)
;Main.c,135 :: 		Cir_Interpolation();
JAL	_Cir_Interpolation+0
NOP	
;Main.c,136 :: 		}
L_Temp_Move32:
;Main.c,137 :: 		}
L_Temp_Move31:
;Main.c,138 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,139 :: 		default: a = 0;
L_Temp_Move33:
MOVZ	R25, R0, R0
;Main.c,140 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,141 :: 		}
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move73
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move73:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move75
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move75:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move77
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move77:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move79
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move79:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move81
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move81:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move83
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move83:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move85
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move85:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move87
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move87:
J	L_Temp_Move33
NOP	
L_Temp_Move21:
;Main.c,142 :: 		}
=======
;Main.c,134 :: 		}
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move65
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move65:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move67
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move67:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move69
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move69:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move71
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move71:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move73
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move73:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move75
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move75:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move77
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move77:
J	L_Temp_Move29
NOP	
L_Temp_Move21:
;Main.c,135 :: 		}
>>>>>>> patch1
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
;Main.c,137 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,139 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,140 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,141 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,142 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,146 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Main+0)
ORI	R2, R2, lo_addr(?lstr_1_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,147 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,149 :: 		sprintf(txt,"%d",STPS[0].decel_start);
LW	R2, Offset(_STPS+12)(GP)
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
;Main.c,150 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,154 :: 		sprintf(txt,"%d",STPS[0].step_delay);
LW	R2, Offset(_STPS+8)(GP)
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
;Main.c,155 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,157 :: 		sprintf(txt,"%d",STPS[0].min_delay);
LW	R2, Offset(_STPS+20)(GP)
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
;Main.c,158 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,162 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+52)(GP)
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
;Main.c,163 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,165 :: 		sprintf(txt,"%d",STPS[0].decel_val);
LW	R2, Offset(_STPS+16)(GP)
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
;Main.c,166 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,167 :: 		}
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
