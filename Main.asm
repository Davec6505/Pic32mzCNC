_main:
;Main.c,30 :: 		void main() {
;Main.c,34 :: 		int xyz_ = 0;
;Main.c,35 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,37 :: 		StepperConstants(5000,15500);
ORI	R26, R0, 15500
ORI	R25, R0, 5000
JAL	_StepperConstants+0
NOP	
<<<<<<< HEAD
;Main.c,38 :: 		EnableInterrupts();
EI	R30
;Main.c,39 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,41 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,42 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,43 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,44 :: 		while(1){
L_main0:
;Main.c,46 :: 		if(!Toggle){
=======
;Main.c,38 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,40 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,41 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,42 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,43 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,44 :: 		EnableInterrupts();
EI	R30
;Main.c,45 :: 		while(1){
L_main0:
;Main.c,47 :: 		if(!Toggle){
>>>>>>> patch2
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main46
NOP	
J	L_main2
NOP	
L__main46:
<<<<<<< HEAD
;Main.c,47 :: 		LED1 = TMR.clock >> 4;
=======
;Main.c,48 :: 		LED1 = TMR.clock >> 4;
>>>>>>> patch2
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
<<<<<<< HEAD
;Main.c,48 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
=======
;Main.c,49 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
>>>>>>> patch2
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main47
NOP	
J	L_main3
NOP	
L__main47:
<<<<<<< HEAD
;Main.c,49 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
=======
;Main.c,50 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
>>>>>>> patch2
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
<<<<<<< HEAD
;Main.c,50 :: 		if(LED1 && (oneshot == 0)){
=======
;Main.c,51 :: 		if(LED1 && (oneshot == 0)){
>>>>>>> patch2
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main49
NOP	
J	L__main36
NOP	
L__main49:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main50
NOP	
J	L__main35
NOP	
L__main50:
L__main34:
<<<<<<< HEAD
;Main.c,51 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,54 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,50 :: 		if(LED1 && (oneshot == 0)){
L__main36:
L__main35:
;Main.c,54 :: 		}else if(!LED1 && (oneshot == 1))
=======
;Main.c,52 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,55 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,51 :: 		if(LED1 && (oneshot == 0)){
L__main36:
L__main35:
;Main.c,55 :: 		}else if(!LED1 && (oneshot == 1))
>>>>>>> patch2
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main51
NOP	
J	L__main38
NOP	
L__main51:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main52
NOP	
J	L__main37
NOP	
L__main52:
L__main33:
<<<<<<< HEAD
;Main.c,55 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,54 :: 		}else if(!LED1 && (oneshot == 1))
L__main38:
L__main37:
;Main.c,55 :: 		oneshot = 0;
L_main7:
;Main.c,57 :: 		}
L_main2:
;Main.c,61 :: 		if(!SW2){
=======
;Main.c,56 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,55 :: 		}else if(!LED1 && (oneshot == 1))
L__main38:
L__main37:
;Main.c,56 :: 		oneshot = 0;
L_main7:
;Main.c,58 :: 		}
L_main2:
;Main.c,62 :: 		if(!SW2){
>>>>>>> patch2
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main53
NOP	
J	L_main11
NOP	
L__main53:
<<<<<<< HEAD
;Main.c,62 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,63 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,64 :: 		}
L_main11:
;Main.c,66 :: 		if((!SW1)&&(!Toggle)){
=======
;Main.c,63 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,64 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,65 :: 		}
L_main11:
;Main.c,67 :: 		if((!SW1)&&(!Toggle)){
>>>>>>> patch2
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main54
NOP	
J	L__main40
NOP	
L__main54:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main55
NOP	
J	L__main39
NOP	
L__main55:
L__main32:
<<<<<<< HEAD
;Main.c,67 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,68 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,69 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,70 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,71 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,72 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,73 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,74 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,66 :: 		if((!SW1)&&(!Toggle)){
L__main40:
L__main39:
;Main.c,78 :: 		if(Toggle){
=======
;Main.c,68 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,69 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,70 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,71 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,72 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,73 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,74 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,75 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,67 :: 		if((!SW1)&&(!Toggle)){
L__main40:
L__main39:
;Main.c,79 :: 		if(Toggle){
>>>>>>> patch2
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main57
NOP	
J	L_main15
NOP	
L__main57:
<<<<<<< HEAD
;Main.c,79 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
=======
;Main.c,80 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
>>>>>>> patch2
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main58
NOP	
J	L__main44
NOP	
L__main58:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main59
NOP	
J	L__main43
NOP	
L__main59:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main60
NOP	
J	L__main42
NOP	
L__main60:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main41
NOP	
L__main61:
L__main31:
<<<<<<< HEAD
;Main.c,80 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,81 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,82 :: 		if(a > 6)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 7
=======
;Main.c,81 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,82 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,83 :: 		if(a > 3)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 4
>>>>>>> patch2
BEQ	R2, R0, L__main62
NOP	
J	L_main19
NOP	
L__main62:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
<<<<<<< HEAD
;Main.c,79 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
=======
;Main.c,80 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
>>>>>>> patch2
L__main44:
L__main43:
L__main42:
L__main41:
<<<<<<< HEAD
;Main.c,85 :: 		}
L_main15:
;Main.c,87 :: 		}
J	L_main0
NOP	
;Main.c,88 :: 		}
=======
;Main.c,86 :: 		}
L_main15:
;Main.c,88 :: 		}
J	L_main0
NOP	
;Main.c,89 :: 		}
>>>>>>> patch2
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
<<<<<<< HEAD
;Main.c,91 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,93 :: 		switch(a){
=======
;Main.c,92 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,94 :: 		switch(a){
>>>>>>> patch2
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move20
NOP	
<<<<<<< HEAD
;Main.c,94 :: 		case 0:
L_Temp_Move22:
<<<<<<< HEAD
;Main.c,95 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,96 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,97 :: 		SingleAxisStep(STPS[Z].mmToTravel,Z);
ORI	R26, R0, 2
LW	R25, Offset(_STPS+200)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,98 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,99 :: 		case 1:
L_Temp_Move23:
;Main.c,100 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,101 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
=======
;Main.c,95 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,96 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> patch2
=======
;Main.c,95 :: 		case 0:
L_Temp_Move22:
;Main.c,96 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,97 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,102 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
=======
;Main.c,97 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
>>>>>>> patch2
=======
;Main.c,98 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
>>>>>>> patch2
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,103 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,104 :: 		case 2:
L_Temp_Move24:
;Main.c,105 :: 		STPS[X].mmToTravel = calcSteps(-125.00,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
=======
;Main.c,98 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,99 :: 		case 1:
L_Temp_Move23:
;Main.c,100 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
>>>>>>> patch2
ORI	R2, R2, 0
MTC1	R2, S12
<<<<<<< HEAD
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,106 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
=======
;Main.c,99 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,100 :: 		case 1:
L_Temp_Move23:
;Main.c,101 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,102 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,103 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,104 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,105 :: 		case 2:
L_Temp_Move24:
;Main.c,106 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,107 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
>>>>>>> patch2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,107 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,108 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,109 :: 		case 3:
L_Temp_Move25:
;Main.c,110 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
=======
;Main.c,108 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,109 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,110 :: 		case 3:
L_Temp_Move25:
;Main.c,111 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
>>>>>>> patch2
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,111 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
=======
;Main.c,112 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
>>>>>>> patch2
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,112 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
=======
;Main.c,113 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,114 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,115 :: 		case 4:
L_Temp_Move26:
;Main.c,116 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
>>>>>>> patch2
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,113 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
=======
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,101 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> patch2
=======
;Main.c,117 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,114 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,102 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,103 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,104 :: 		case 2:
L_Temp_Move24:
;Main.c,105 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,106 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,107 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,108 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,109 :: 		case 3:
L_Temp_Move25:
;Main.c,110 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,111 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,112 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,113 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,114 :: 		case 4:
L_Temp_Move26:
;Main.c,115 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,116 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,117 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
=======
;Main.c,118 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
>>>>>>> patch2
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,120 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,121 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,122 :: 		case 5:
L_Temp_Move27:
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
<<<<<<< HEAD
;Main.c,119 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
=======
;Main.c,125 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,127 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,115 :: 		break;
J	L_Temp_Move21
NOP	
<<<<<<< HEAD
;Main.c,116 :: 		case 4:
L_Temp_Move26:
;Main.c,117 :: 		STPS[X].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,118 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,119 :: 		STPS[Y].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,120 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,121 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,122 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,123 :: 		case 5:
L_Temp_Move27:
;Main.c,124 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,125 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
=======
;Main.c,121 :: 		case 5:
L_Temp_Move27:
;Main.c,122 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,123 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,126 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,127 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
=======
;Main.c,124 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,125 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
>>>>>>> patch2
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,128 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,126 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,129 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,130 :: 		case 6:
L_Temp_Move28:
;Main.c,131 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
=======
;Main.c,127 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,128 :: 		case 6:
L_Temp_Move28:
;Main.c,129 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
>>>>>>> patch2
=======
;Main.c,128 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,129 :: 		case 6:
L_Temp_Move28:
;Main.c,130 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
>>>>>>> patch2
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,132 :: 		speed_cntr_Move(STPS[A].mmToTravel, 25000,A);
=======
;Main.c,130 :: 		speed_cntr_Move(STPS[A].mmToTravel, 25000,A);
>>>>>>> patch2
=======
;Main.c,131 :: 		speed_cntr_Move(STPS[A].mmToTravel, 25000,A);
>>>>>>> patch2
ORI	R27, R0, 3
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,133 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
=======
;Main.c,131 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
>>>>>>> patch2
=======
;Main.c,132 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
>>>>>>> patch2
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,134 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,136 :: 		case 7:
L_Temp_Move29:
;Main.c,138 :: 		r_or_ijk(450.00, 250.00, 486.00, 386.00, 0.00, -100.00, 100.00, 0.00);
LUI	R5, 17345
ORI	R5, R5, 0
LUI	R4, 17395
ORI	R4, R4, 0
LUI	R3, 17274
ORI	R3, R3, 0
LUI	R2, 17377
ORI	R2, R2, 0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
ADDIU	SP, SP, -16
SWC1	S0, 12(SP)
LUI	R2, 17096
ORI	R2, R2, 0
SW	R2, 8(SP)
LUI	R2, 49864
ORI	R2, R2, 0
SW	R2, 4(SP)
SWC1	S0, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
;Main.c,139 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,141 :: 		default: a = 0;
L_Temp_Move30:
MOVZ	R25, R0, R0
;Main.c,142 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,143 :: 		}
=======
;Main.c,132 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,133 :: 		case 7:
L_Temp_Move29:
;Main.c,136 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,137 :: 		default: a = 0;
L_Temp_Move30:
MOVZ	R25, R0, R0
;Main.c,138 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,139 :: 		}
>>>>>>> patch2
=======
;Main.c,133 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,134 :: 		case 7:
L_Temp_Move29:
;Main.c,137 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,138 :: 		default: a = 0;
L_Temp_Move30:
MOVZ	R25, R0, R0
;Main.c,139 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,140 :: 		}
>>>>>>> patch2
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move66
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move66:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move68
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move80:
J	L_Temp_Move30
NOP	
L_Temp_Move21:
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,144 :: 		}
=======
;Main.c,140 :: 		}
>>>>>>> patch2
=======
;Main.c,141 :: 		}
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,146 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,148 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
=======
;Main.c,142 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,147 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
>>>>>>> patch2
=======
;Main.c,143 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,148 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
>>>>>>> patch2
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
<<<<<<< HEAD
<<<<<<< HEAD
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,149 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,150 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,151 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,155 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
=======
>>>>>>> patch2
=======
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,156 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
=======
;Main.c,148 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
>>>>>>> patch2
=======
;Main.c,149 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,158 :: 		sprintf(txt,"%d",STPS[0].decel_start);
=======
;Main.c,150 :: 		sprintf(txt,"%d",STPS[0].decel_start);
>>>>>>> patch2
=======
;Main.c,151 :: 		sprintf(txt,"%d",STPS[0].decel_start);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,159 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
=======
;Main.c,151 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
>>>>>>> patch2
=======
;Main.c,152 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,163 :: 		sprintf(txt,"%d",STPS[0].step_delay);
=======
;Main.c,155 :: 		sprintf(txt,"%d",STPS[0].step_delay);
>>>>>>> patch2
=======
;Main.c,156 :: 		sprintf(txt,"%d",STPS[0].step_delay);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,164 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
=======
;Main.c,156 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
>>>>>>> patch2
=======
;Main.c,157 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,166 :: 		sprintf(txt,"%d",STPS[0].min_delay);
=======
;Main.c,158 :: 		sprintf(txt,"%d",STPS[0].min_delay);
>>>>>>> patch2
=======
;Main.c,159 :: 		sprintf(txt,"%d",STPS[0].min_delay);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,167 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
=======
;Main.c,159 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
>>>>>>> patch2
=======
;Main.c,160 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,171 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
=======
;Main.c,163 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
>>>>>>> patch2
=======
;Main.c,164 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,172 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
=======
;Main.c,164 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
>>>>>>> patch2
=======
;Main.c,165 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,174 :: 		sprintf(txt,"%d",STPS[0].decel_val);
=======
;Main.c,166 :: 		sprintf(txt,"%d",STPS[0].decel_val);
>>>>>>> patch2
=======
;Main.c,167 :: 		sprintf(txt,"%d",STPS[0].decel_val);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,175 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
=======
;Main.c,167 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
>>>>>>> patch2
=======
;Main.c,168 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
;Main.c,176 :: 		}
=======
;Main.c,168 :: 		}
>>>>>>> patch2
=======
;Main.c,169 :: 		}
>>>>>>> patch2
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
