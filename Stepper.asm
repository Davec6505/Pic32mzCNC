_SetPinMode:
;Stepper.c,18 :: 		void SetPinMode(){
;Stepper.c,21 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,22 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,29 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,30 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,37 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,38 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,45 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,46 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,52 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_EnStepperX:
;Stepper.c,56 :: 		void EnStepperX(){
;Stepper.c,59 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,60 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,62 :: 		void EnStepperY(){
;Stepper.c,65 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,66 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,67 :: 		void EnStepperZ(){
;Stepper.c,70 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,71 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,72 :: 		void EnStepperA(){
;Stepper.c,75 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,76 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,79 :: 		void DisableStepper(){
;Stepper.c,80 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,81 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,82 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,83 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,84 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_Step_Cycle:
;Stepper.c,97 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,99 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 40
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,101 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 80
ADDIU	R2, R2, 96
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,102 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,103 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,107 :: 		void toggleOCx(int axis_No){
;Stepper.c,108 :: 		switch(axis_No){
J	L_toggleOCx0
NOP	
;Stepper.c,109 :: 		case X:
L_toggleOCx2:
;Stepper.c,110 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,111 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,112 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,113 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,114 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,115 :: 		case Y:
L_toggleOCx3:
;Stepper.c,116 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,117 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+112)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,118 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,119 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,120 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,121 :: 		case Z:
L_toggleOCx4:
;Stepper.c,122 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,123 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+216)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,124 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,125 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,126 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,127 :: 		case A:
L_toggleOCx5:
;Stepper.c,128 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,129 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+320)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,130 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,131 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,132 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,133 :: 		case B:
L_toggleOCx6:
;Stepper.c,134 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,135 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+424)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,136 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,137 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,138 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,139 :: 		case C:
L_toggleOCx7:
;Stepper.c,140 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,141 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+528)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,142 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,143 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,144 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,145 :: 		default:
L_toggleOCx8:
;Stepper.c,146 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,147 :: 		}
L_toggleOCx0:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx94
NOP	
J	L_toggleOCx2
NOP	
L__toggleOCx94:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx96
NOP	
J	L_toggleOCx3
NOP	
L__toggleOCx96:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx98
NOP	
J	L_toggleOCx4
NOP	
L__toggleOCx98:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx100
NOP	
J	L_toggleOCx5
NOP	
L__toggleOCx100:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx102
NOP	
J	L_toggleOCx6
NOP	
L__toggleOCx102:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx104
NOP	
J	L_toggleOCx7
NOP	
L__toggleOCx104:
J	L_toggleOCx8
NOP	
L_toggleOCx1:
;Stepper.c,149 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,153 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,159 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse9
NOP	
;Stepper.c,160 :: 		case STOP:
L_Pulse11:
;Stepper.c,161 :: 		STPS[axis_No].run_state  = STOP;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,162 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,163 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,165 :: 		case ACCEL:
L_Pulse12:
;Stepper.c,167 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,168 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse106
NOP	
J	L_Pulse13
NOP	
L__Pulse106:
;Stepper.c,169 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,170 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,171 :: 		}
L_Pulse13:
;Stepper.c,172 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 60
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse107
NOP	
J	L_Pulse14
NOP	
L__Pulse107:
;Stepper.c,173 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,174 :: 		}
L_Pulse14:
;Stepper.c,177 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse108
NOP	
J	L_Pulse15
NOP	
L__Pulse108:
;Stepper.c,178 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,179 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,180 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,181 :: 		}
L_Pulse15:
;Stepper.c,182 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,184 :: 		case RUN:
L_Pulse16:
;Stepper.c,185 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,189 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse109
NOP	
J	L_Pulse17
NOP	
L__Pulse109:
;Stepper.c,190 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,191 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,192 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,193 :: 		}
L_Pulse17:
;Stepper.c,194 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,196 :: 		case DECEL:
L_Pulse18:
;Stepper.c,198 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,201 :: 		if(STPS[axis_No].accel_count > -1 ){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Pulse110
NOP	
J	L_Pulse19
NOP	
L__Pulse110:
;Stepper.c,202 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,203 :: 		}
L_Pulse19:
;Stepper.c,204 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,205 :: 		default:break;
L_Pulse20:
J	L_Pulse10
NOP	
;Stepper.c,206 :: 		}
L_Pulse9:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse112
NOP	
J	L_Pulse11
NOP	
L__Pulse112:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse114
NOP	
J	L_Pulse12
NOP	
L__Pulse114:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse116
NOP	
J	L_Pulse16
NOP	
L__Pulse116:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse118
NOP	
J	L_Pulse18
NOP	
L__Pulse118:
J	L_Pulse20
NOP	
L_Pulse10:
;Stepper.c,207 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,208 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,212 :: 		void AccDec(int axis_No){
;Stepper.c,213 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,214 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 52
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 68
LW	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SW	R2, 0(R5)
;Stepper.c,215 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 68
ADDIU	R2, R5, 8
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SW	R2, 0(R4)
;Stepper.c,216 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,217 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,222 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,223 :: 		switch(axis_){
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,224 :: 		case X:
L_Single_Axis_Enable23:
;Stepper.c,225 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,226 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,227 :: 		case Y:
L_Single_Axis_Enable24:
;Stepper.c,228 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,229 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,230 :: 		case Z:
L_Single_Axis_Enable25:
;Stepper.c,231 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,232 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,233 :: 		case A:
L_Single_Axis_Enable26:
;Stepper.c,234 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,235 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,236 :: 		case B:
L_Single_Axis_Enable27:
;Stepper.c,237 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,238 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,239 :: 		case C:
L_Single_Axis_Enable28:
;Stepper.c,240 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,241 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,242 :: 		default:
L_Single_Axis_Enable29:
;Stepper.c,243 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,244 :: 		}
L_Single_Axis_Enable21:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable122
NOP	
J	L_Single_Axis_Enable23
NOP	
L__Single_Axis_Enable122:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable124
NOP	
J	L_Single_Axis_Enable24
NOP	
L__Single_Axis_Enable124:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable126
NOP	
J	L_Single_Axis_Enable25
NOP	
L__Single_Axis_Enable126:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable128
NOP	
J	L_Single_Axis_Enable26
NOP	
L__Single_Axis_Enable128:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable130
NOP	
J	L_Single_Axis_Enable27
NOP	
L__Single_Axis_Enable130:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable132
NOP	
J	L_Single_Axis_Enable28
NOP	
L__Single_Axis_Enable132:
J	L_Single_Axis_Enable29
NOP	
L_Single_Axis_Enable22:
;Stepper.c,245 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_disableOCx:
;Stepper.c,248 :: 		void disableOCx(){
;Stepper.c,249 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,250 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,251 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,253 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,254 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,255 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,256 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,262 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,263 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,265 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX135
NOP	
J	L_StepX30
NOP	
L__StepX135:
;Stepper.c,266 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,267 :: 		}else{
J	L_StepX31
NOP	
L_StepX30:
;Stepper.c,268 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX137
NOP	
J	L_StepX32
NOP	
L__StepX137:
;Stepper.c,269 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX138
NOP	
J	L_StepX33
NOP	
L__StepX138:
;Stepper.c,270 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX34
NOP	
L_StepX33:
;Stepper.c,271 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX139
NOP	
J	L_StepX35
NOP	
L__StepX139:
;Stepper.c,272 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX36
NOP	
L_StepX35:
;Stepper.c,273 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX140
NOP	
J	L_StepX37
NOP	
L__StepX140:
;Stepper.c,274 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepX37:
L_StepX36:
L_StepX34:
;Stepper.c,275 :: 		}
L_StepX32:
;Stepper.c,276 :: 		}
L_StepX31:
;Stepper.c,277 :: 		}
L_end_StepX:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepX
_StepY:
<<<<<<< HEAD
;Stepper.c,393 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,282 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
>>>>>>> patch1
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,394 :: 		OC2IF_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,396 :: 		if(SV.Single_Dual == 0){
=======
;Stepper.c,283 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,285 :: 		if(SV.Single_Dual == 0){
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY142
NOP	
J	L_StepY38
NOP	
<<<<<<< HEAD
L__StepY193:
;Stepper.c,397 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,398 :: 		}else {
J	L_StepY53
NOP	
L_StepY52:
;Stepper.c,399 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+96)(GP)
=======
L__StepY142:
;Stepper.c,286 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,287 :: 		}else {
J	L_StepY39
NOP	
L_StepY38:
;Stepper.c,288 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+108)(GP)
>>>>>>> patch1
ORI	R2, R2, 16
SB	R2, Offset(_STPS+108)(GP)
LBU	R2, Offset(_STPS+108)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY144
NOP	
J	L_StepY40
NOP	
<<<<<<< HEAD
L__StepY195:
;Stepper.c,400 :: 		if(axis_xyz == xy )
=======
L__StepY144:
;Stepper.c,289 :: 		if(axis_xyz == xy )
>>>>>>> patch1
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY145
NOP	
J	L_StepY41
NOP	
<<<<<<< HEAD
L__StepY196:
;Stepper.c,401 :: 		Axis_Interpolate(X,Y);
=======
L__StepY145:
;Stepper.c,290 :: 		Axis_Interpolate(X,Y);
>>>>>>> patch1
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY42
NOP	
<<<<<<< HEAD
L_StepY55:
;Stepper.c,402 :: 		else if(axis_xyz == yz)
=======
L_StepY41:
;Stepper.c,291 :: 		else if(axis_xyz == yz)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY146
NOP	
J	L_StepY43
NOP	
<<<<<<< HEAD
L__StepY197:
;Stepper.c,403 :: 		Axis_Interpolate(Y,Z);
=======
L__StepY146:
;Stepper.c,292 :: 		Axis_Interpolate(Y,Z);
>>>>>>> patch1
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY44
NOP	
<<<<<<< HEAD
L_StepY57:
;Stepper.c,404 :: 		else if(axis_xyz == ya)
=======
L_StepY43:
;Stepper.c,293 :: 		else if(axis_xyz == ya)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY147
NOP	
J	L_StepY45
NOP	
<<<<<<< HEAD
L__StepY198:
;Stepper.c,405 :: 		Axis_Interpolate(Y,A);
=======
L__StepY147:
;Stepper.c,294 :: 		Axis_Interpolate(Y,A);
>>>>>>> patch1
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
<<<<<<< HEAD
L_StepY59:
L_StepY58:
L_StepY56:
;Stepper.c,406 :: 		}
L_StepY54:
;Stepper.c,407 :: 		}
L_StepY53:
;Stepper.c,408 :: 		}
=======
L_StepY45:
L_StepY44:
L_StepY42:
;Stepper.c,295 :: 		}
L_StepY40:
;Stepper.c,296 :: 		}
L_StepY39:
;Stepper.c,297 :: 		}
>>>>>>> patch1
L_end_StepY:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepY
_StepZ:
<<<<<<< HEAD
;Stepper.c,413 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,302 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
>>>>>>> patch1
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,414 :: 		OC7IF_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064812)(GP)
;Stepper.c,416 :: 		if(SV.Single_Dual == 0){
=======
;Stepper.c,303 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,305 :: 		if(SV.Single_Dual == 0){
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ149
NOP	
J	L_StepZ46
NOP	
<<<<<<< HEAD
L__StepZ200:
;Stepper.c,417 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,418 :: 		}else{
J	L_StepZ61
NOP	
L_StepZ60:
;Stepper.c,419 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+188)(GP)
=======
L__StepZ149:
;Stepper.c,306 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,307 :: 		}else{
J	L_StepZ47
NOP	
L_StepZ46:
;Stepper.c,308 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+212)(GP)
>>>>>>> patch1
ORI	R2, R2, 16
SB	R2, Offset(_STPS+212)(GP)
LBU	R2, Offset(_STPS+212)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepZ151
NOP	
J	L_StepZ48
NOP	
<<<<<<< HEAD
L__StepZ202:
;Stepper.c,420 :: 		if(axis_xyz == xz)
=======
L__StepZ151:
;Stepper.c,309 :: 		if(axis_xyz == xz)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ152
NOP	
J	L_StepZ49
NOP	
<<<<<<< HEAD
L__StepZ203:
;Stepper.c,421 :: 		Axis_Interpolate(X,Z);
=======
L__StepZ152:
;Stepper.c,310 :: 		Axis_Interpolate(X,Z);
>>>>>>> patch1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ50
NOP	
<<<<<<< HEAD
L_StepZ63:
;Stepper.c,422 :: 		else if(axis_xyz == yz)
=======
L_StepZ49:
;Stepper.c,311 :: 		else if(axis_xyz == yz)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ153
NOP	
J	L_StepZ51
NOP	
<<<<<<< HEAD
L__StepZ204:
;Stepper.c,423 :: 		Axis_Interpolate(Y,Z);
=======
L__StepZ153:
;Stepper.c,312 :: 		Axis_Interpolate(Y,Z);
>>>>>>> patch1
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ52
NOP	
<<<<<<< HEAD
L_StepZ65:
;Stepper.c,424 :: 		else if(axis_xyz == za)
=======
L_StepZ51:
;Stepper.c,313 :: 		else if(axis_xyz == za)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ154
NOP	
J	L_StepZ53
NOP	
<<<<<<< HEAD
L__StepZ205:
;Stepper.c,425 :: 		Axis_Interpolate(Z,A);
=======
L__StepZ154:
;Stepper.c,314 :: 		Axis_Interpolate(Z,A);
>>>>>>> patch1
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
<<<<<<< HEAD
L_StepZ67:
L_StepZ66:
L_StepZ64:
;Stepper.c,427 :: 		}
L_StepZ62:
;Stepper.c,428 :: 		}
L_StepZ61:
;Stepper.c,430 :: 		}
=======
L_StepZ53:
L_StepZ52:
L_StepZ50:
;Stepper.c,316 :: 		}
L_StepZ48:
;Stepper.c,317 :: 		}
L_StepZ47:
;Stepper.c,319 :: 		}
>>>>>>> patch1
L_end_StepZ:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepZ
_StepA:
<<<<<<< HEAD
;Stepper.c,435 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,324 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
>>>>>>> patch1
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,436 :: 		OC3IF_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,438 :: 		if(SV.Single_Dual == 0){
=======
;Stepper.c,325 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,327 :: 		if(SV.Single_Dual == 0){
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA156
NOP	
J	L_StepA54
NOP	
<<<<<<< HEAD
L__StepA207:
;Stepper.c,439 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,440 :: 		}else{
J	L_StepA69
NOP	
L_StepA68:
;Stepper.c,441 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+280)(GP)
=======
L__StepA156:
;Stepper.c,328 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,329 :: 		}else{
J	L_StepA55
NOP	
L_StepA54:
;Stepper.c,330 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+316)(GP)
>>>>>>> patch1
ORI	R2, R2, 16
SB	R2, Offset(_STPS+316)(GP)
LBU	R2, Offset(_STPS+316)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepA158
NOP	
J	L_StepA56
NOP	
<<<<<<< HEAD
L__StepA209:
;Stepper.c,442 :: 		if(axis_xyz == xa)
=======
L__StepA158:
;Stepper.c,331 :: 		if(axis_xyz == xa)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA159
NOP	
J	L_StepA57
NOP	
<<<<<<< HEAD
L__StepA210:
;Stepper.c,443 :: 		Axis_Interpolate(X,A);
=======
L__StepA159:
;Stepper.c,332 :: 		Axis_Interpolate(X,A);
>>>>>>> patch1
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA58
NOP	
<<<<<<< HEAD
L_StepA71:
;Stepper.c,444 :: 		else if(axis_xyz == ya)
=======
L_StepA57:
;Stepper.c,333 :: 		else if(axis_xyz == ya)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA160
NOP	
J	L_StepA59
NOP	
<<<<<<< HEAD
L__StepA211:
;Stepper.c,445 :: 		Axis_Interpolate(Y,A);
=======
L__StepA160:
;Stepper.c,334 :: 		Axis_Interpolate(Y,A);
>>>>>>> patch1
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA60
NOP	
<<<<<<< HEAD
L_StepA73:
;Stepper.c,446 :: 		else if(axis_xyz == za)
=======
L_StepA59:
;Stepper.c,335 :: 		else if(axis_xyz == za)
>>>>>>> patch1
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA161
NOP	
J	L_StepA61
NOP	
<<<<<<< HEAD
L__StepA212:
;Stepper.c,447 :: 		Axis_Interpolate(Z,A);
=======
L__StepA161:
;Stepper.c,336 :: 		Axis_Interpolate(Z,A);
>>>>>>> patch1
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
<<<<<<< HEAD
L_StepA75:
L_StepA74:
L_StepA72:
;Stepper.c,448 :: 		}
L_StepA70:
;Stepper.c,449 :: 		}
L_StepA69:
;Stepper.c,450 :: 		}
=======
L_StepA61:
L_StepA60:
L_StepA58:
;Stepper.c,337 :: 		}
L_StepA56:
;Stepper.c,338 :: 		}
L_StepA55:
;Stepper.c,339 :: 		}
>>>>>>> patch1
L_end_StepA:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepA
_SingleStepAxis:
<<<<<<< HEAD
;Stepper.c,457 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,458 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
=======
;Stepper.c,346 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,347 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
>>>>>>> patch1
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 44
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__SingleStepAxis163
NOP	
J	L_SingleStepAxis62
NOP	
<<<<<<< HEAD
L__SingleStepAxis214:
;Stepper.c,459 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,460 :: 		}
J	L_SingleStepAxis77
NOP	
L_SingleStepAxis76:
;Stepper.c,462 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,463 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,464 :: 		}
L_SingleStepAxis77:
;Stepper.c,465 :: 		}
=======
L__SingleStepAxis163:
;Stepper.c,348 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,349 :: 		}
J	L_SingleStepAxis63
NOP	
L_SingleStepAxis62:
;Stepper.c,351 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,352 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,353 :: 		}
L_SingleStepAxis63:
;Stepper.c,354 :: 		}
>>>>>>> patch1
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_StopAxis:
<<<<<<< HEAD
;Stepper.c,467 :: 		void StopAxis(int axis){
;Stepper.c,468 :: 		switch(axis){
J	L_StopAxis78
NOP	
;Stepper.c,469 :: 		case X:
L_StopAxis80:
;Stepper.c,470 :: 		OC5IE_bit = 0;
LUI	R2, 2048
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,471 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081849852)(GP)
;Stepper.c,472 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,473 :: 		case Y:
L_StopAxis81:
;Stepper.c,474 :: 		OC2IE_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,475 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081851388)(GP)
;Stepper.c,476 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,477 :: 		case Z:
L_StopAxis82:
;Stepper.c,478 :: 		OC7IE_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
;Stepper.c,479 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081848828)(GP)
;Stepper.c,480 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,481 :: 		case A:
L_StopAxis83:
;Stepper.c,482 :: 		OC3IE_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,483 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081850876)(GP)
;Stepper.c,484 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,485 :: 		default : break;
L_StopAxis84:
J	L_StopAxis79
NOP	
;Stepper.c,486 :: 		}
L_StopAxis78:
=======
;Stepper.c,356 :: 		void StopAxis(int axis){
;Stepper.c,357 :: 		switch(axis){
J	L_StopAxis64
NOP	
;Stepper.c,358 :: 		case X:
L_StopAxis66:
;Stepper.c,359 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,360 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,361 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,362 :: 		case Y:
L_StopAxis67:
;Stepper.c,363 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,364 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,365 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,366 :: 		case Z:
L_StopAxis68:
;Stepper.c,367 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,368 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,369 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,370 :: 		case A:
L_StopAxis69:
;Stepper.c,371 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,372 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,373 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,374 :: 		default : break;
L_StopAxis70:
J	L_StopAxis65
NOP	
;Stepper.c,375 :: 		}
L_StopAxis64:
>>>>>>> patch1
SEH	R2, R25
BNE	R2, R0, L__StopAxis166
NOP	
J	L_StopAxis66
NOP	
L__StopAxis166:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis168
NOP	
J	L_StopAxis67
NOP	
L__StopAxis168:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis170
NOP	
J	L_StopAxis68
NOP	
L__StopAxis170:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis172
NOP	
J	L_StopAxis69
NOP	
L__StopAxis172:
J	L_StopAxis70
NOP	
<<<<<<< HEAD
L_StopAxis79:
;Stepper.c,487 :: 		STPS[axis].stopAxis = 1;
=======
L_StopAxis65:
;Stepper.c,376 :: 		STPS[axis].stopAxis = 1;
>>>>>>> patch1
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 8
SB	R2, 0(R3)
<<<<<<< HEAD
;Stepper.c,488 :: 		}
=======
;Stepper.c,377 :: 		}
>>>>>>> patch1
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_Axis_Interpolate:
<<<<<<< HEAD
;Stepper.c,495 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,497 :: 		if((STPS[axisA].step_count > SV.dx)||(STPS[axisB].step_count > SV.dy)){
=======
;Stepper.c,384 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,386 :: 		if((STPS[axisA].step_count > SV.dA)||(STPS[axisB].step_count > SV.dB)){
>>>>>>> patch1
SW	R25, 4(SP)
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate174
NOP	
J	L__Axis_Interpolate84
NOP	
L__Axis_Interpolate174:
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate175
NOP	
J	L__Axis_Interpolate83
NOP	
L__Axis_Interpolate175:
J	L_Axis_Interpolate73
NOP	
<<<<<<< HEAD
J	L__Axis_Interpolate121
NOP	
L__Axis_Interpolate226:
J	L_Axis_Interpolate87
NOP	
L__Axis_Interpolate122:
L__Axis_Interpolate121:
;Stepper.c,498 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,499 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Stepper.c,500 :: 		return;
J	L_end_Axis_Interpolate
NOP	
;Stepper.c,501 :: 		}
L_Axis_Interpolate87:
;Stepper.c,503 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate227
NOP	
J	L_Axis_Interpolate88
NOP	
L__Axis_Interpolate227:
;Stepper.c,504 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,505 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate228
NOP	
J	L_Axis_Interpolate89
NOP	
L__Axis_Interpolate228:
;Stepper.c,506 :: 		Pulse(axisA);
JAL	_Pulse+0
NOP	
L_Axis_Interpolate89:
;Stepper.c,507 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate229
NOP	
J	L_Axis_Interpolate90
NOP	
L__Axis_Interpolate229:
;Stepper.c,508 :: 		SV.d2 += BresIncVal(SV.dy);//2*SV.dy;//
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,509 :: 		}else{
J	L_Axis_Interpolate91
NOP	
L_Axis_Interpolate90:
;Stepper.c,510 :: 		SV.d2 += BresDiffVal(SV.dy,SV.dx);//2 * (SV.dy - SV.dx);//
=======
L__Axis_Interpolate84:
L__Axis_Interpolate83:
;Stepper.c,387 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,388 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Stepper.c,389 :: 		return;
J	L_end_Axis_Interpolate
NOP	
;Stepper.c,390 :: 		}
L_Axis_Interpolate73:
;Stepper.c,392 :: 		if(SV.dA >= SV.dB){
>>>>>>> patch1
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate176
NOP	
J	L_Axis_Interpolate74
NOP	
L__Axis_Interpolate176:
;Stepper.c,393 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,394 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate177
NOP	
J	L_Axis_Interpolate75
NOP	
L__Axis_Interpolate177:
;Stepper.c,395 :: 		Pulse(axisA);
JAL	_Pulse+0
NOP	
L_Axis_Interpolate75:
;Stepper.c,396 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate178
NOP	
J	L_Axis_Interpolate76
NOP	
L__Axis_Interpolate178:
;Stepper.c,397 :: 		SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,398 :: 		}else{
J	L_Axis_Interpolate77
NOP	
L_Axis_Interpolate76:
;Stepper.c,399 :: 		SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
<<<<<<< HEAD
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,511 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,512 :: 		}
L_Axis_Interpolate91:
;Stepper.c,513 :: 		}else{
J	L_Axis_Interpolate92
NOP	
L_Axis_Interpolate88:
;Stepper.c,514 :: 		Step_Cycle(axisB);
=======
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,400 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,401 :: 		}
L_Axis_Interpolate77:
;Stepper.c,402 :: 		}else{
J	L_Axis_Interpolate78
NOP	
L_Axis_Interpolate74:
;Stepper.c,403 :: 		Step_Cycle(axisB);
>>>>>>> patch1
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 8(SP)
<<<<<<< HEAD
;Stepper.c,515 :: 		if(!SV.cir)
=======
;Stepper.c,404 :: 		if(!SV.cir)
>>>>>>> patch1
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate179
NOP	
J	L_Axis_Interpolate79
NOP	
<<<<<<< HEAD
L__Axis_Interpolate230:
;Stepper.c,516 :: 		Pulse(axisB);
=======
L__Axis_Interpolate179:
;Stepper.c,405 :: 		Pulse(axisB);
>>>>>>> patch1
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Pulse+0
NOP	
LH	R25, 8(SP)
<<<<<<< HEAD
L_Axis_Interpolate93:
;Stepper.c,517 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
=======
L_Axis_Interpolate79:
;Stepper.c,406 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
>>>>>>> patch1
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate180
NOP	
J	L_Axis_Interpolate80
NOP	
<<<<<<< HEAD
L__Axis_Interpolate231:
;Stepper.c,518 :: 		SV.d2 += BresIncVal(SV.dx);//2 * SV.dx;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
=======
L__Axis_Interpolate180:
;Stepper.c,407 :: 		SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
<<<<<<< HEAD
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,519 :: 		}else{
J	L_Axis_Interpolate95
NOP	
L_Axis_Interpolate94:
;Stepper.c,520 :: 		SV.d2 += BresDiffVal(SV.dx,SV.dy);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
=======
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,408 :: 		}else{
J	L_Axis_Interpolate81
NOP	
L_Axis_Interpolate80:
;Stepper.c,409 :: 		SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
>>>>>>> patch1
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
<<<<<<< HEAD
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,521 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,522 :: 		}
L_Axis_Interpolate95:
;Stepper.c,523 :: 		}
L_Axis_Interpolate92:
;Stepper.c,524 :: 		}
=======
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,410 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,411 :: 		}
L_Axis_Interpolate81:
;Stepper.c,412 :: 		}
L_Axis_Interpolate78:
;Stepper.c,413 :: 		}
>>>>>>> patch1
L_end_Axis_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Axis_Interpolate
<<<<<<< HEAD
_min_:
;Stepper.c,535 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,536 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_233
NOP	
J	L_min_96
NOP	
L__min_233:
;Stepper.c,537 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,538 :: 		}
L_min_96:
;Stepper.c,540 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,542 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,552 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,558 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,559 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,560 :: 		do
J	L_Stepper_sqrt_98
NOP	
L_Stepper_sqrt_115:
;Stepper.c,574 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,560 :: 		do
L_Stepper_sqrt_98:
;Stepper.c,562 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_235
NOP	
J	L_Stepper_sqrt_101
NOP	
L_Stepper_sqrt_235:
;Stepper.c,564 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,565 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,566 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_102
NOP	
L_Stepper_sqrt_101:
;Stepper.c,568 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,569 :: 		}
L_Stepper_sqrt_102:
;Stepper.c,570 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,571 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_237
NOP	
J	L_Stepper_sqrt_116
NOP	
L_Stepper_sqrt_237:
; f end address is: 16 (R4)
;Stepper.c,572 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,573 :: 		}
J	L_Stepper_sqrt_103
NOP	
L_Stepper_sqrt_116:
;Stepper.c,571 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,573 :: 		}
L_Stepper_sqrt_103:
;Stepper.c,574 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_238
NOP	
J	L_Stepper_sqrt_115
NOP	
L_Stepper_sqrt_238:
; q2 end address is: 12 (R3)
;Stepper.c,575 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_239
NOP	
J	L_Stepper_sqrt_104
NOP	
L_Stepper_sqrt_239:
;Stepper.c,576 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,577 :: 		}
L_Stepper_sqrt_104:
;Stepper.c,579 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,581 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,605 :: 		void CycleStop(){
;Stepper.c,607 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,608 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop106:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop241
NOP	
J	L_CycleStop107
NOP	
L__CycleStop241:
;Stepper.c,609 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,610 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop242
NOP	
J	L_CycleStop109
NOP	
L__CycleStop242:
; ii end address is: 16 (R4)
J	L_CycleStop107
NOP	
L_CycleStop109:
;Stepper.c,608 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,611 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop106
NOP	
L_CycleStop107:
;Stepper.c,612 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,614 :: 		void CycleStart(){
;Stepper.c,617 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart244
NOP	
J	L_CycleStart110
NOP	
L__CycleStart244:
;Stepper.c,618 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart111:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart245
NOP	
J	L_CycleStart112
NOP	
L__CycleStart245:
;Stepper.c,619 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart246
NOP	
J	L_CycleStart114
NOP	
L__CycleStart246:
; ii end address is: 16 (R4)
J	L_CycleStart112
NOP	
L_CycleStart114:
;Stepper.c,620 :: 		STPS[ii].microSec++;
; ii start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,618 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,621 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart111
NOP	
L_CycleStart112:
;Stepper.c,622 :: 		}
L_CycleStart110:
;Stepper.c,623 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
=======
>>>>>>> patch1
