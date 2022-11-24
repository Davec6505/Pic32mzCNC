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
_StepperConstants:
;Stepper.c,56 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,57 :: 		SV.acc = accel;
SW	R25, Offset(_SV+52)(GP)
;Stepper.c,58 :: 		SV.dec = decel;
SW	R26, Offset(_SV+56)(GP)
;Stepper.c,60 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,64 :: 		void EnStepperX(){
;Stepper.c,67 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,68 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,70 :: 		void EnStepperY(){
;Stepper.c,73 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,74 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,75 :: 		void EnStepperZ(){
;Stepper.c,78 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,79 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,80 :: 		void EnStepperA(){
;Stepper.c,83 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,84 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,87 :: 		void DisableStepper(){
;Stepper.c,88 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,89 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,90 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,91 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,92 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_Step_Cycle:
;Stepper.c,105 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,107 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 40
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,109 :: 		STPS[axis_No].steps_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 100
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
;Stepper.c,110 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,111 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,115 :: 		void toggleOCx(int axis_No){
;Stepper.c,116 :: 		switch(axis_No){
J	L_toggleOCx0
NOP	
;Stepper.c,117 :: 		case X:
L_toggleOCx2:
;Stepper.c,118 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081849840)(GP)
;Stepper.c,119 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081849824)(GP)
;Stepper.c,120 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081867760)(GP)
;Stepper.c,121 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081849856)(GP)
;Stepper.c,122 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,123 :: 		case Y:
L_toggleOCx3:
;Stepper.c,124 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081851376)(GP)
;Stepper.c,125 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+108)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081851360)(GP)
;Stepper.c,126 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081866736)(GP)
;Stepper.c,127 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081851392)(GP)
;Stepper.c,128 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,129 :: 		case Z:
L_toggleOCx4:
;Stepper.c,130 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081848816)(GP)
;Stepper.c,131 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+208)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081848800)(GP)
;Stepper.c,132 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081865712)(GP)
;Stepper.c,133 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081848832)(GP)
;Stepper.c,134 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,135 :: 		case A:
L_toggleOCx5:
;Stepper.c,136 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081850864)(GP)
;Stepper.c,137 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+308)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081850848)(GP)
;Stepper.c,138 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081866224)(GP)
;Stepper.c,139 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081850880)(GP)
;Stepper.c,140 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,141 :: 		case B:
L_toggleOCx6:
;Stepper.c,142 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081849328)(GP)
;Stepper.c,143 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+408)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081849312)(GP)
;Stepper.c,144 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081867248)(GP)
;Stepper.c,145 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081849344)(GP)
;Stepper.c,146 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,147 :: 		case C:
L_toggleOCx7:
;Stepper.c,148 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081848304)(GP)
;Stepper.c,149 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+508)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081848288)(GP)
;Stepper.c,150 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081865200)(GP)
;Stepper.c,151 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081848320)(GP)
;Stepper.c,152 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,153 :: 		default:
L_toggleOCx8:
;Stepper.c,154 :: 		break;
J	L_toggleOCx1
NOP	
;Stepper.c,155 :: 		}
L_toggleOCx0:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx95
NOP	
J	L_toggleOCx2
NOP	
L__toggleOCx95:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx97
NOP	
J	L_toggleOCx3
NOP	
L__toggleOCx97:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx99
NOP	
J	L_toggleOCx4
NOP	
L__toggleOCx99:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx101
NOP	
J	L_toggleOCx5
NOP	
L__toggleOCx101:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx103
NOP	
J	L_toggleOCx6
NOP	
L__toggleOCx103:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx105
NOP	
J	L_toggleOCx7
NOP	
L__toggleOCx105:
J	L_toggleOCx8
NOP	
L_toggleOCx1:
;Stepper.c,157 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,161 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,167 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse9
NOP	
;Stepper.c,168 :: 		case STOP:
L_Pulse11:
;Stepper.c,169 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,170 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,172 :: 		case ACCEL:
L_Pulse12:
;Stepper.c,174 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,175 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 100
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
BEQ	R2, R0, L__Pulse107
NOP	
J	L_Pulse13
NOP	
L__Pulse107:
;Stepper.c,176 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,177 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,178 :: 		}
L_Pulse13:
;Stepper.c,179 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R3, R25
ORI	R2, R0, 100
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
BNE	R2, R0, L__Pulse108
NOP	
J	L_Pulse14
NOP	
L__Pulse108:
;Stepper.c,180 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,181 :: 		}
L_Pulse14:
;Stepper.c,184 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
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
J	L_Pulse15
NOP	
L__Pulse109:
;Stepper.c,185 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,186 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,187 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,188 :: 		}
L_Pulse15:
;Stepper.c,189 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,191 :: 		case RUN:
L_Pulse16:
;Stepper.c,192 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,196 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
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
BEQ	R2, R0, L__Pulse110
NOP	
J	L_Pulse17
NOP	
L__Pulse110:
;Stepper.c,197 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,198 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,199 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,200 :: 		}
L_Pulse17:
;Stepper.c,201 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,203 :: 		case DECEL:
L_Pulse18:
;Stepper.c,205 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,208 :: 		if(STPS[axis_No].accel_count > -1 ){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Pulse111
NOP	
J	L_Pulse19
NOP	
L__Pulse111:
;Stepper.c,209 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,210 :: 		}
L_Pulse19:
;Stepper.c,211 :: 		break;
J	L_Pulse10
NOP	
;Stepper.c,212 :: 		default:break;
L_Pulse20:
J	L_Pulse10
NOP	
;Stepper.c,213 :: 		}
L_Pulse9:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse113
NOP	
J	L_Pulse11
NOP	
L__Pulse113:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse115
NOP	
J	L_Pulse12
NOP	
L__Pulse115:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse117
NOP	
J	L_Pulse16
NOP	
L__Pulse117:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse119
NOP	
J	L_Pulse18
NOP	
L__Pulse119:
J	L_Pulse20
NOP	
L_Pulse10:
;Stepper.c,214 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,215 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,219 :: 		void AccDec(int axis_No){
;Stepper.c,220 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,221 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 100
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
;Stepper.c,222 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 100
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
;Stepper.c,223 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,224 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,229 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,230 :: 		switch(axis_){
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,231 :: 		case X:
L_Single_Axis_Enable23:
;Stepper.c,232 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, 2048
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081849848)(GP)
;Stepper.c,233 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,234 :: 		case Y:
L_Single_Axis_Enable24:
;Stepper.c,235 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081851384)(GP)
;Stepper.c,236 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,237 :: 		case Z:
L_Single_Axis_Enable25:
;Stepper.c,238 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
ORI	R2, R0, 8
SW	R2, Offset(-1082064680)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081848824)(GP)
;Stepper.c,239 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,240 :: 		case A:
L_Single_Axis_Enable26:
;Stepper.c,241 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, 2
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081850872)(GP)
;Stepper.c,242 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,243 :: 		case B:
L_Single_Axis_Enable27:
;Stepper.c,244 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, 32768
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081849336)(GP)
;Stepper.c,245 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,246 :: 		case C:
L_Single_Axis_Enable28:
;Stepper.c,247 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
ORI	R2, R0, 128
SW	R2, Offset(-1082064680)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081848312)(GP)
;Stepper.c,248 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,249 :: 		default:
L_Single_Axis_Enable29:
;Stepper.c,250 :: 		break;
J	L_Single_Axis_Enable22
NOP	
;Stepper.c,251 :: 		}
L_Single_Axis_Enable21:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable123
NOP	
J	L_Single_Axis_Enable23
NOP	
L__Single_Axis_Enable123:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable125
NOP	
J	L_Single_Axis_Enable24
NOP	
L__Single_Axis_Enable125:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable127
NOP	
J	L_Single_Axis_Enable25
NOP	
L__Single_Axis_Enable127:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable129
NOP	
J	L_Single_Axis_Enable26
NOP	
L__Single_Axis_Enable129:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable131
NOP	
J	L_Single_Axis_Enable27
NOP	
L__Single_Axis_Enable131:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable133
NOP	
J	L_Single_Axis_Enable28
NOP	
L__Single_Axis_Enable133:
J	L_Single_Axis_Enable29
NOP	
L_Single_Axis_Enable22:
;Stepper.c,252 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_disableOCx:
;Stepper.c,255 :: 		void disableOCx(){
;Stepper.c,256 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, 2048
SW	R2, Offset(-1082064700)(GP)
ORI	R3, R0, 32768
SW	R3, Offset(-1081849852)(GP)
;Stepper.c,257 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081851388)(GP)
;Stepper.c,258 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
SW	R3, Offset(-1081848828)(GP)
;Stepper.c,260 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, 2
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081850876)(GP)
;Stepper.c,261 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, 32768
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081849340)(GP)
;Stepper.c,262 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
ORI	R2, R0, 128
SW	R2, Offset(-1082064684)(GP)
SW	R3, Offset(-1081848316)(GP)
;Stepper.c,263 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,269 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,270 :: 		OC5IF_bit = 0;
LUI	R2, 2048
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,272 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX136
NOP	
J	L_StepX30
NOP	
L__StepX136:
;Stepper.c,273 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,274 :: 		}else{
J	L_StepX31
NOP	
L_StepX30:
;Stepper.c,275 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX138
NOP	
J	L_StepX32
NOP	
L__StepX138:
;Stepper.c,276 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX139
NOP	
J	L_StepX33
NOP	
L__StepX139:
;Stepper.c,277 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX34
NOP	
L_StepX33:
;Stepper.c,278 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX140
NOP	
J	L_StepX35
NOP	
L__StepX140:
;Stepper.c,279 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX36
NOP	
L_StepX35:
;Stepper.c,280 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX141
NOP	
J	L_StepX37
NOP	
L__StepX141:
;Stepper.c,281 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepX37:
L_StepX36:
L_StepX34:
;Stepper.c,282 :: 		}
L_StepX32:
;Stepper.c,283 :: 		}
L_StepX31:
;Stepper.c,284 :: 		}
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
;Stepper.c,289 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,290 :: 		OC2IF_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,292 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY143
NOP	
J	L_StepY38
NOP	
L__StepY143:
;Stepper.c,293 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,294 :: 		}else {
J	L_StepY39
NOP	
L_StepY38:
;Stepper.c,295 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+104)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+104)(GP)
LBU	R2, Offset(_STPS+104)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY145
NOP	
J	L_StepY40
NOP	
L__StepY145:
;Stepper.c,296 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY146
NOP	
J	L_StepY41
NOP	
L__StepY146:
;Stepper.c,297 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY42
NOP	
L_StepY41:
;Stepper.c,298 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY147
NOP	
J	L_StepY43
NOP	
L__StepY147:
;Stepper.c,299 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY44
NOP	
L_StepY43:
;Stepper.c,300 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY148
NOP	
J	L_StepY45
NOP	
L__StepY148:
;Stepper.c,301 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepY45:
L_StepY44:
L_StepY42:
;Stepper.c,302 :: 		}
L_StepY40:
;Stepper.c,303 :: 		}
L_StepY39:
;Stepper.c,304 :: 		}
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
;Stepper.c,309 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,310 :: 		OC7IF_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064812)(GP)
;Stepper.c,312 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ150
NOP	
J	L_StepZ46
NOP	
L__StepZ150:
;Stepper.c,313 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,314 :: 		}else{
J	L_StepZ47
NOP	
L_StepZ46:
;Stepper.c,315 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+204)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+204)(GP)
LBU	R2, Offset(_STPS+204)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepZ152
NOP	
J	L_StepZ48
NOP	
L__StepZ152:
;Stepper.c,316 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ153
NOP	
J	L_StepZ49
NOP	
L__StepZ153:
;Stepper.c,317 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ50
NOP	
L_StepZ49:
;Stepper.c,318 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ154
NOP	
J	L_StepZ51
NOP	
L__StepZ154:
;Stepper.c,319 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ52
NOP	
L_StepZ51:
;Stepper.c,320 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ155
NOP	
J	L_StepZ53
NOP	
L__StepZ155:
;Stepper.c,321 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepZ53:
L_StepZ52:
L_StepZ50:
;Stepper.c,323 :: 		}
L_StepZ48:
;Stepper.c,324 :: 		}
L_StepZ47:
;Stepper.c,326 :: 		}
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
;Stepper.c,331 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,332 :: 		OC3IF_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,334 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA157
NOP	
J	L_StepA54
NOP	
L__StepA157:
;Stepper.c,335 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,336 :: 		}else{
J	L_StepA55
NOP	
L_StepA54:
;Stepper.c,337 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+304)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+304)(GP)
LBU	R2, Offset(_STPS+304)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepA159
NOP	
J	L_StepA56
NOP	
L__StepA159:
;Stepper.c,338 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA160
NOP	
J	L_StepA57
NOP	
L__StepA160:
;Stepper.c,339 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA58
NOP	
L_StepA57:
;Stepper.c,340 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA161
NOP	
J	L_StepA59
NOP	
L__StepA161:
;Stepper.c,341 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA60
NOP	
L_StepA59:
;Stepper.c,342 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA162
NOP	
J	L_StepA61
NOP	
L__StepA162:
;Stepper.c,343 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepA61:
L_StepA60:
L_StepA58:
;Stepper.c,344 :: 		}
L_StepA56:
;Stepper.c,345 :: 		}
L_StepA55:
;Stepper.c,346 :: 		}
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
;Stepper.c,353 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,354 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
SEH	R3, R25
ORI	R2, R0, 100
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
BEQ	R2, R0, L__SingleStepAxis164
NOP	
J	L_SingleStepAxis62
NOP	
L__SingleStepAxis164:
;Stepper.c,355 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,356 :: 		}
J	L_SingleStepAxis63
NOP	
L_SingleStepAxis62:
;Stepper.c,358 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,359 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,360 :: 		}
L_SingleStepAxis63:
;Stepper.c,361 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_StopAxis:
;Stepper.c,363 :: 		void StopAxis(int axis){
;Stepper.c,364 :: 		switch(axis){
J	L_StopAxis64
NOP	
;Stepper.c,365 :: 		case X:
L_StopAxis66:
;Stepper.c,366 :: 		OC5IE_bit = 0;
LUI	R2, 2048
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,367 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081849852)(GP)
;Stepper.c,368 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,369 :: 		case Y:
L_StopAxis67:
;Stepper.c,370 :: 		OC2IE_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,371 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081851388)(GP)
;Stepper.c,372 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,373 :: 		case Z:
L_StopAxis68:
;Stepper.c,374 :: 		OC7IE_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
;Stepper.c,375 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081848828)(GP)
;Stepper.c,376 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,377 :: 		case A:
L_StopAxis69:
;Stepper.c,378 :: 		OC3IE_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,379 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081850876)(GP)
;Stepper.c,380 :: 		break;
J	L_StopAxis65
NOP	
;Stepper.c,381 :: 		default : break;
L_StopAxis70:
J	L_StopAxis65
NOP	
;Stepper.c,382 :: 		}
L_StopAxis64:
SEH	R2, R25
BNE	R2, R0, L__StopAxis167
NOP	
J	L_StopAxis66
NOP	
L__StopAxis167:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis169
NOP	
J	L_StopAxis67
NOP	
L__StopAxis169:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis171
NOP	
J	L_StopAxis68
NOP	
L__StopAxis171:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis173
NOP	
J	L_StopAxis69
NOP	
L__StopAxis173:
J	L_StopAxis70
NOP	
L_StopAxis65:
;Stepper.c,383 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 8
SB	R2, 0(R3)
;Stepper.c,384 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_Axis_Interpolate:
;Stepper.c,391 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,393 :: 		if((STPS[axisA].step_count > SV.dx)||(STPS[axisB].step_count > SV.dy)){
SW	R25, 4(SP)
SEH	R3, R25
ORI	R2, R0, 100
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
J	L__Axis_Interpolate84
NOP	
L__Axis_Interpolate175:
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate176
NOP	
J	L__Axis_Interpolate83
NOP	
L__Axis_Interpolate176:
J	L_Axis_Interpolate73
NOP	
L__Axis_Interpolate84:
L__Axis_Interpolate83:
;Stepper.c,394 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,395 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Stepper.c,396 :: 		return;
J	L_end_Axis_Interpolate
NOP	
;Stepper.c,397 :: 		}
L_Axis_Interpolate73:
;Stepper.c,399 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate177
NOP	
J	L_Axis_Interpolate74
NOP	
L__Axis_Interpolate177:
;Stepper.c,400 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,401 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate178
NOP	
J	L_Axis_Interpolate75
NOP	
L__Axis_Interpolate178:
;Stepper.c,402 :: 		Pulse(axisA);
JAL	_Pulse+0
NOP	
L_Axis_Interpolate75:
;Stepper.c,403 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate179
NOP	
J	L_Axis_Interpolate76
NOP	
L__Axis_Interpolate179:
;Stepper.c,404 :: 		SV.d2 += BresIncVal(SV.dy);//2*SV.dy;//
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,405 :: 		}else{
J	L_Axis_Interpolate77
NOP	
L_Axis_Interpolate76:
;Stepper.c,406 :: 		SV.d2 += BresDiffVal(SV.dy,SV.dx);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,407 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,408 :: 		}
L_Axis_Interpolate77:
;Stepper.c,409 :: 		}else{
J	L_Axis_Interpolate78
NOP	
L_Axis_Interpolate74:
;Stepper.c,410 :: 		Step_Cycle(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 8(SP)
;Stepper.c,411 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate180
NOP	
J	L_Axis_Interpolate79
NOP	
L__Axis_Interpolate180:
;Stepper.c,412 :: 		Pulse(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Pulse+0
NOP	
LH	R25, 8(SP)
L_Axis_Interpolate79:
;Stepper.c,413 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate181
NOP	
J	L_Axis_Interpolate80
NOP	
L__Axis_Interpolate181:
;Stepper.c,414 :: 		SV.d2 += BresIncVal(SV.dx);//2 * SV.dx;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,415 :: 		}else{
J	L_Axis_Interpolate81
NOP	
L_Axis_Interpolate80:
;Stepper.c,416 :: 		SV.d2 += BresDiffVal(SV.dx,SV.dy);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,417 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,418 :: 		}
L_Axis_Interpolate81:
;Stepper.c,419 :: 		}
L_Axis_Interpolate78:
;Stepper.c,420 :: 		}
L_end_Axis_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Axis_Interpolate
