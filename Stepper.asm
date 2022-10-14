_SetPinMode:
;Stepper.c,22 :: 		void SetPinMode(){
;Stepper.c,25 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,26 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,33 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,34 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,41 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,42 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,49 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,50 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,55 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,59 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,60 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,61 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,62 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,66 :: 		void EnStepperX(){
;Stepper.c,69 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,70 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,72 :: 		void EnStepperY(){
;Stepper.c,75 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,76 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,77 :: 		void EnStepperZ(){
;Stepper.c,80 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,81 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,82 :: 		void EnStepperA(){
;Stepper.c,85 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,86 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,88 :: 		void DisableStepper(){
;Stepper.c,89 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,90 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,91 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,92 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,93 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,111 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Stepper.c,115 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R25, R2, L__speed_cntr_Move154
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move154:
;Stepper.c,116 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
=======
BEQ	R25, R2, L__speed_cntr_Move156
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move156:
;Stepper.c,117 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,118 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,119 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Stepper.c,120 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,122 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
<<<<<<< HEAD
;Stepper.c,123 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move156
NOP	
J	L__speed_cntr_Move129
NOP	
L__speed_cntr_Move156:
=======
;Stepper.c,124 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move158
NOP	
J	L__speed_cntr_Move131
NOP	
L__speed_cntr_Move158:
>>>>>>> patch2
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
<<<<<<< HEAD
BNE	R3, R2, L__speed_cntr_Move158
NOP	
J	L__speed_cntr_Move128
NOP	
L__speed_cntr_Move158:
L__speed_cntr_Move127:
;Stepper.c,127 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
=======
BNE	R3, R2, L__speed_cntr_Move160
NOP	
J	L__speed_cntr_Move130
NOP	
L__speed_cntr_Move160:
L__speed_cntr_Move129:
;Stepper.c,128 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 37
ORI	R2, R2, 29535
DIV	R2, R26
MFLO	R2
SW	R2, 0(R3)
;Stepper.c,133 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 40(SP)
LW	R3, Offset(_SV+56)(GP)
LUI	R2, 9587
ORI	R2, R2, 24384
DIV	R2, R3
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	Stepper_sqrt_+0
NOP	
ORI	R3, R0, 5281
MULTU	R3, R2
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
MOVZ	R25, R2, R0
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 40(SP)
SW	R3, 0(R2)
;Stepper.c,134 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 60
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,139 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+56)(GP)
CVT32.W 	S1, S0
LUI	R2, 15744
ORI	R2, R2, 44534
MTC1	R2, S0
MUL.S 	S1, S0, S1
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
CVT36.S 	S0, S0
MFC1	R2, S0
DIV	R3, R2
MFLO	R2
SW	R2, 0(R4)
;Stepper.c,144 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move159
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move159:
;Stepper.c,144 :: 		STPS[axis_No].max_step_lim = 1;
=======
BEQ	R2, R0, L__speed_cntr_Move161
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move161:
;Stepper.c,145 :: 		STPS[axis_No].max_step_lim = 1;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,146 :: 		}
L_speed_cntr_Move5:
;Stepper.c,150 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R2, 40(SP)
JAL	_abs+0
NOP	
LW	R3, Offset(_SV+60)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+60)(GP)
LW	R2, Offset(_SV+56)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R3
LW	R2, 40(SP)
SW	R3, 0(R2)
;Stepper.c,153 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move160
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move160:
;Stepper.c,153 :: 		STPS[axis_No].accel_lim = 1;
=======
BEQ	R2, R0, L__speed_cntr_Move162
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move162:
;Stepper.c,154 :: 		STPS[axis_No].accel_lim = 1;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,155 :: 		}
L_speed_cntr_Move6:
;Stepper.c,158 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 48
LW	R3, 0(R2)
ADDIU	R2, R4, 52
LW	R2, 0(R2)
SLT	R2, R2, R3
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move161
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move161:
;Stepper.c,158 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move162
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move162:
=======
BEQ	R2, R0, L__speed_cntr_Move163
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move163:
;Stepper.c,159 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move164
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move164:
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Stepper.c,160 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 48
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
L_speed_cntr_Move9:
;Stepper.c,161 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,162 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 52
LW	R3, 0(R2)
LW	R2, Offset(_SV+56)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+60)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,163 :: 		}
L_speed_cntr_Move10:
;Stepper.c,165 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move163
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move163:
;Stepper.c,165 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
=======
BEQ	R2, R0, L__speed_cntr_Move165
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move165:
;Stepper.c,166 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
<<<<<<< HEAD
BNE	R2, R0, L__speed_cntr_Move164
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move164:
=======
BNE	R2, R0, L__speed_cntr_Move166
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move166:
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 16
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,167 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move13:
;Stepper.c,168 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,170 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
<<<<<<< HEAD
BNE	R2, R0, L__speed_cntr_Move165
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move165:
=======
BNE	R2, R0, L__speed_cntr_Move167
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move167:
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R2, 40(SP)
JAL	_abs+0
NOP	
SEH	R4, R27
ORI	R3, R0, 68
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 16
LW	R3, 0(R3)
SEH	R2, R2
MUL	R3, R2, R3
LW	R2, 40(SP)
SW	R3, 0(R2)
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Stepper.c,171 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move16:
;Stepper.c,172 :: 		}
L_speed_cntr_Move14:
;Stepper.c,174 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move166
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move166:
;Stepper.c,174 :: 		STPS[axis_No].decel_val = -1;
=======
BEQ	R2, R0, L__speed_cntr_Move168
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move168:
;Stepper.c,175 :: 		STPS[axis_No].decel_val = -1;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,176 :: 		}
L_speed_cntr_Move17:
;Stepper.c,179 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 60
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move167
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move167:
;Stepper.c,179 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
=======
BEQ	R2, R0, L__speed_cntr_Move169
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move169:
;Stepper.c,180 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,181 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,182 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,183 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 40(SP)
ADDIU	R2, R3, 60
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 40(SP)
SW	R3, 0(R2)
;Stepper.c,184 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Stepper.c,185 :: 		}
L_speed_cntr_Move19:
<<<<<<< HEAD
;Stepper.c,123 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move129:
L__speed_cntr_Move128:
;Stepper.c,186 :: 		}
=======
;Stepper.c,124 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move131:
L__speed_cntr_Move130:
;Stepper.c,187 :: 		}
>>>>>>> patch2
L_speed_cntr_Move1:
;Stepper.c,189 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,190 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,191 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,192 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,193 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,194 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+4)(GP)
;Stepper.c,195 :: 		SV.running = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,197 :: 		sprintf(txt_,"%d",STPS[axis_No].mmToTravel);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Stepper+0)
ORI	R2, R2, lo_addr(?lstr_1_Stepper+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Stepper.c,198 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,199 :: 		UART2_Write_Text(" : ");
ORI	R30, R0, 32
SB	R30, 21(SP)
ORI	R30, R0, 58
SB	R30, 22(SP)
ORI	R30, R0, 32
SB	R30, 23(SP)
MOVZ	R30, R0, R0
SB	R30, 24(SP)
ADDIU	R2, SP, 21
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,200 :: 		sprintf(txt_,"%d",STPS[axis_No].step_delay);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Stepper+0)
ORI	R2, R2, lo_addr(?lstr_3_Stepper+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Stepper.c,201 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,202 :: 		UART2_Write_Text(" : ");
ORI	R30, R0, 32
SB	R30, 25(SP)
ORI	R30, R0, 58
SB	R30, 26(SP)
ORI	R30, R0, 32
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R2, SP, 25
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,203 :: 		sprintf(txt_,"%d",STPS[axis_No].min_delay);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
LW	R2, 0(R2)
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Stepper+0)
ORI	R2, R2, lo_addr(?lstr_5_Stepper+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Stepper.c,204 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,205 :: 		UART2_Write_Text(" : ");
ORI	R30, R0, 32
SB	R30, 29(SP)
ORI	R30, R0, 58
SB	R30, 30(SP)
ORI	R30, R0, 32
SB	R30, 31(SP)
MOVZ	R30, R0, R0
SB	R30, 32(SP)
ADDIU	R2, SP, 29
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,206 :: 		sprintf(txt_,"%d",STPS[axis_No].accel_lim);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Stepper+0)
ORI	R2, R2, lo_addr(?lstr_7_Stepper+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Stepper.c,207 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,208 :: 		UART2_Write_Text(" : ");
ORI	R30, R0, 32
SB	R30, 33(SP)
ORI	R30, R0, 58
SB	R30, 34(SP)
ORI	R30, R0, 32
SB	R30, 35(SP)
MOVZ	R30, R0, R0
SB	R30, 36(SP)
ADDIU	R2, SP, 33
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,209 :: 		sprintf(txt_,"%d",STPS[axis_No].decel_start);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Stepper+0)
ORI	R2, R2, lo_addr(?lstr_9_Stepper+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Stepper.c,210 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Stepper.c,211 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Stepper.c,212 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,221 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,222 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,223 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,227 :: 		void toggleOCx(int axis_No){
;Stepper.c,228 :: 		switch(axis_No){
J	L_toggleOCx20
NOP	
;Stepper.c,229 :: 		case X:
L_toggleOCx22:
;Stepper.c,230 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,231 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,232 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,233 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,234 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,235 :: 		case Y:
L_toggleOCx23:
;Stepper.c,236 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,237 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,238 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,239 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,240 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,241 :: 		case Z:
L_toggleOCx24:
;Stepper.c,242 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,243 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,244 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,245 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,246 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,247 :: 		case A:
L_toggleOCx25:
;Stepper.c,248 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,249 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,250 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,251 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,252 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,253 :: 		case B:
L_toggleOCx26:
;Stepper.c,254 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,255 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,256 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,257 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,258 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,259 :: 		case C:
L_toggleOCx27:
;Stepper.c,260 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,261 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,262 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,263 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,264 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,265 :: 		default:
L_toggleOCx28:
;Stepper.c,266 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,267 :: 		}
L_toggleOCx20:
SEH	R2, R25
<<<<<<< HEAD
BNE	R2, R0, L__toggleOCx171
NOP	
J	L_toggleOCx22
NOP	
L__toggleOCx171:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx173
NOP	
J	L_toggleOCx23
NOP	
L__toggleOCx173:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx175
NOP	
J	L_toggleOCx24
NOP	
L__toggleOCx175:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx177
NOP	
J	L_toggleOCx25
NOP	
L__toggleOCx177:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx179
NOP	
J	L_toggleOCx26
NOP	
L__toggleOCx179:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx181
NOP	
J	L_toggleOCx27
NOP	
L__toggleOCx181:
=======
BNE	R2, R0, L__toggleOCx173
NOP	
J	L_toggleOCx22
NOP	
L__toggleOCx173:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx175
NOP	
J	L_toggleOCx23
NOP	
L__toggleOCx175:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx177
NOP	
J	L_toggleOCx24
NOP	
L__toggleOCx177:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx179
NOP	
J	L_toggleOCx25
NOP	
L__toggleOCx179:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx181
NOP	
J	L_toggleOCx26
NOP	
L__toggleOCx181:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx183
NOP	
J	L_toggleOCx27
NOP	
L__toggleOCx183:
>>>>>>> patch2
J	L_toggleOCx28
NOP	
L_toggleOCx21:
;Stepper.c,269 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,273 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,279 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse29
NOP	
;Stepper.c,280 :: 		case STOP:
L_Pulse31:
;Stepper.c,281 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,282 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,284 :: 		case ACCEL:
L_Pulse32:
;Stepper.c,289 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,290 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 68
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
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse183
NOP	
J	L_Pulse33
NOP	
L__Pulse183:
;Stepper.c,269 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
=======
BEQ	R2, R0, L__Pulse185
NOP	
J	L_Pulse33
NOP	
L__Pulse185:
;Stepper.c,292 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,293 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,294 :: 		}
L_Pulse33:
;Stepper.c,295 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__Pulse184
NOP	
J	L_Pulse34
NOP	
L__Pulse184:
;Stepper.c,273 :: 		STPS[axis_No].run_state  = RUN;
=======
BNE	R2, R0, L__Pulse186
NOP	
J	L_Pulse34
NOP	
L__Pulse186:
;Stepper.c,296 :: 		STPS[axis_No].run_state  = RUN;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,297 :: 		}
L_Pulse34:
;Stepper.c,298 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse185
NOP	
J	L_Pulse35
NOP	
L__Pulse185:
;Stepper.c,276 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
=======
BEQ	R2, R0, L__Pulse187
NOP	
J	L_Pulse35
NOP	
L__Pulse187:
;Stepper.c,299 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,300 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,301 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,302 :: 		}
L_Pulse35:
;Stepper.c,303 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,305 :: 		case RUN:
L_Pulse36:
;Stepper.c,306 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,308 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse186
NOP	
J	L_Pulse37
NOP	
L__Pulse186:
;Stepper.c,286 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
=======
BEQ	R2, R0, L__Pulse188
NOP	
J	L_Pulse37
NOP	
L__Pulse188:
;Stepper.c,309 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,310 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,312 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,313 :: 		}
L_Pulse37:
;Stepper.c,314 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,316 :: 		case DECEL:
L_Pulse38:
;Stepper.c,321 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,325 :: 		if(STPS[axis_No].accel_count >= 0 ){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse187
NOP	
J	L_Pulse39
NOP	
L__Pulse187:
;Stepper.c,303 :: 		STPS[axis_No].run_state = STOP;
=======
BEQ	R2, R0, L__Pulse189
NOP	
J	L_Pulse39
NOP	
L__Pulse189:
;Stepper.c,326 :: 		STPS[axis_No].run_state = STOP;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,327 :: 		}
L_Pulse39:
;Stepper.c,328 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,329 :: 		default:break;
L_Pulse40:
J	L_Pulse30
NOP	
;Stepper.c,330 :: 		}
L_Pulse29:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
<<<<<<< HEAD
BNE	R2, R0, L__Pulse189
NOP	
J	L_Pulse31
NOP	
L__Pulse189:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse191
NOP	
J	L_Pulse32
NOP	
L__Pulse191:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse193
NOP	
J	L_Pulse36
NOP	
L__Pulse193:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse195
NOP	
J	L_Pulse38
NOP	
L__Pulse195:
=======
BNE	R2, R0, L__Pulse191
NOP	
J	L_Pulse31
NOP	
L__Pulse191:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse193
NOP	
J	L_Pulse32
NOP	
L__Pulse193:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse195
NOP	
J	L_Pulse36
NOP	
L__Pulse195:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse197
NOP	
J	L_Pulse38
NOP	
L__Pulse197:
>>>>>>> patch2
J	L_Pulse40
NOP	
L_Pulse30:
;Stepper.c,331 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,332 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,336 :: 		void AccDec(int axis_No){
;Stepper.c,337 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,338 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 40
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 56
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
;Stepper.c,339 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 56
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
;Stepper.c,340 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,342 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,347 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,348 :: 		switch(axis_){
J	L_Single_Axis_Enable41
NOP	
;Stepper.c,349 :: 		case X:
L_Single_Axis_Enable43:
;Stepper.c,350 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,351 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,352 :: 		case Y:
L_Single_Axis_Enable44:
;Stepper.c,353 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,354 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,355 :: 		case Z:
L_Single_Axis_Enable45:
;Stepper.c,356 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,357 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,358 :: 		case A:
L_Single_Axis_Enable46:
;Stepper.c,359 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,360 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,361 :: 		case B:
L_Single_Axis_Enable47:
;Stepper.c,362 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,363 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,364 :: 		case C:
L_Single_Axis_Enable48:
;Stepper.c,365 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,366 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,367 :: 		default:
L_Single_Axis_Enable49:
;Stepper.c,368 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,369 :: 		}
L_Single_Axis_Enable41:
ANDI	R2, R25, 255
<<<<<<< HEAD
BNE	R2, R0, L__Single_Axis_Enable199
NOP	
J	L_Single_Axis_Enable43
NOP	
L__Single_Axis_Enable199:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable201
NOP	
J	L_Single_Axis_Enable44
NOP	
L__Single_Axis_Enable201:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable203
NOP	
J	L_Single_Axis_Enable45
NOP	
L__Single_Axis_Enable203:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable205
NOP	
J	L_Single_Axis_Enable46
NOP	
L__Single_Axis_Enable205:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable207
NOP	
J	L_Single_Axis_Enable47
NOP	
L__Single_Axis_Enable207:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable209
NOP	
J	L_Single_Axis_Enable48
NOP	
L__Single_Axis_Enable209:
=======
BNE	R2, R0, L__Single_Axis_Enable201
NOP	
J	L_Single_Axis_Enable43
NOP	
L__Single_Axis_Enable201:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable203
NOP	
J	L_Single_Axis_Enable44
NOP	
L__Single_Axis_Enable203:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable205
NOP	
J	L_Single_Axis_Enable45
NOP	
L__Single_Axis_Enable205:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable207
NOP	
J	L_Single_Axis_Enable46
NOP	
L__Single_Axis_Enable207:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable209
NOP	
J	L_Single_Axis_Enable47
NOP	
L__Single_Axis_Enable209:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable211
NOP	
J	L_Single_Axis_Enable48
NOP	
L__Single_Axis_Enable211:
>>>>>>> patch2
J	L_Single_Axis_Enable49
NOP	
L_Single_Axis_Enable42:
;Stepper.c,370 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,375 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,376 :: 		switch(axis){
J	L_Multi_Axis_Enable50
NOP	
;Stepper.c,377 :: 		case xy:
L_Multi_Axis_Enable52:
;Stepper.c,378 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,379 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,380 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,381 :: 		case xz:
L_Multi_Axis_Enable53:
;Stepper.c,382 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,383 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,384 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,385 :: 		case yz:
L_Multi_Axis_Enable54:
;Stepper.c,386 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,387 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,388 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,389 :: 		case xa:
L_Multi_Axis_Enable55:
;Stepper.c,390 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,391 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,392 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,393 :: 		case ya:
L_Multi_Axis_Enable56:
;Stepper.c,394 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,395 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,396 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,397 :: 		case za:
L_Multi_Axis_Enable57:
;Stepper.c,398 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,399 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,400 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,401 :: 		default:
L_Multi_Axis_Enable58:
;Stepper.c,402 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,403 :: 		}
L_Multi_Axis_Enable50:
ANDI	R2, R25, 255
<<<<<<< HEAD
BNE	R2, R0, L__Multi_Axis_Enable212
NOP	
J	L_Multi_Axis_Enable52
NOP	
L__Multi_Axis_Enable212:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable214
NOP	
J	L_Multi_Axis_Enable53
NOP	
L__Multi_Axis_Enable214:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable216
NOP	
J	L_Multi_Axis_Enable54
NOP	
L__Multi_Axis_Enable216:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable218
NOP	
J	L_Multi_Axis_Enable55
NOP	
L__Multi_Axis_Enable218:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable220
NOP	
J	L_Multi_Axis_Enable56
NOP	
L__Multi_Axis_Enable220:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable222
NOP	
J	L_Multi_Axis_Enable57
NOP	
L__Multi_Axis_Enable222:
=======
BNE	R2, R0, L__Multi_Axis_Enable214
NOP	
J	L_Multi_Axis_Enable52
NOP	
L__Multi_Axis_Enable214:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable216
NOP	
J	L_Multi_Axis_Enable53
NOP	
L__Multi_Axis_Enable216:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable218
NOP	
J	L_Multi_Axis_Enable54
NOP	
L__Multi_Axis_Enable218:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable220
NOP	
J	L_Multi_Axis_Enable55
NOP	
L__Multi_Axis_Enable220:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable222
NOP	
J	L_Multi_Axis_Enable56
NOP	
L__Multi_Axis_Enable222:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable224
NOP	
J	L_Multi_Axis_Enable57
NOP	
L__Multi_Axis_Enable224:
>>>>>>> patch2
J	L_Multi_Axis_Enable58
NOP	
L_Multi_Axis_Enable51:
;Stepper.c,404 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,406 :: 		void disableOCx(){
;Stepper.c,407 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,408 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,409 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,411 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,412 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,413 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,414 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,419 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,420 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,421 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,423 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__StepX225
NOP	
J	L_StepX59
NOP	
L__StepX225:
;Stepper.c,401 :: 		SingleStepX();
=======
BEQ	R2, R0, L__StepX227
NOP	
J	L_StepX59
NOP	
L__StepX227:
;Stepper.c,424 :: 		SingleStepX();
>>>>>>> patch2
JAL	_SingleStepX+0
NOP	
J	L_StepX60
NOP	
L_StepX59:
<<<<<<< HEAD
;Stepper.c,403 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
=======
;Stepper.c,426 :: 		if(STPS[X].master = 1)
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX229
>>>>>>> patch2
NOP	
J	L_StepX61
NOP	
L__StepX229:
;Stepper.c,427 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepX61:
;Stepper.c,428 :: 		}
L_StepX60:
;Stepper.c,429 :: 		}
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
_SingleStepX:
;Stepper.c,431 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,407 :: 		if(/*(STPS[X].step_count >= STPS[X].dist)||*/(SV.Tog == 1)){
SW	R25, 4(SP)
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleStepX227
NOP	
J	L_SingleStepX61
NOP	
L__SingleStepX227:
;Stepper.c,408 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,409 :: 		}
=======
;Stepper.c,432 :: 		if((STPS[X].step_count >= STPS[X].dist)/*||(SV.Tog == 1)*/){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX231
NOP	
>>>>>>> patch2
J	L_SingleStepX62
NOP	
L__SingleStepX231:
;Stepper.c,433 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,434 :: 		}
J	L_SingleStepX63
NOP	
L_SingleStepX62:
;Stepper.c,436 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,437 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,438 :: 		}
L_SingleStepX63:
;Stepper.c,439 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,442 :: 		void StopX(){
;Stepper.c,443 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,444 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,445 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,451 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,452 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,453 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,455 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__StepY230
NOP	
J	L_StepY63
NOP	
L__StepY230:
;Stepper.c,430 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY64
NOP	
L_StepY63:
;Stepper.c,432 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
=======
BEQ	R2, R0, L__StepY234
NOP	
J	L_StepY64
NOP	
L__StepY234:
;Stepper.c,456 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY65
>>>>>>> patch2
NOP	
L_StepY64:
;Stepper.c,458 :: 		if(STPS[Y].master = 1)
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
LBU	R2, Offset(_STPS+72)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY236
NOP	
J	L_StepY66
NOP	
L__StepY236:
;Stepper.c,459 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepY66:
;Stepper.c,460 :: 		}
L_StepY65:
;Stepper.c,461 :: 		}
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
_SingleStepY:
;Stepper.c,463 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,436 :: 		if(/*(STPS[Y].step_count >= STPS[Y].dist)||*/(SV.Tog == 1)){  //i think this is where the problem lies
SW	R25, 4(SP)
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleStepY232
=======
;Stepper.c,464 :: 		if(/*(STPS[Y].step_count >= STPS[Y].dist)||*/(SV.Tog == 1)){  //i think this is where the problem lies
SW	R25, 4(SP)
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleStepY238
>>>>>>> patch2
NOP	
J	L_SingleStepY67
NOP	
<<<<<<< HEAD
L__SingleStepY232:
;Stepper.c,437 :: 		StopY();
=======
L__SingleStepY238:
;Stepper.c,465 :: 		StopY();
>>>>>>> patch2
JAL	_StopY+0
NOP	
;Stepper.c,466 :: 		}
J	L_SingleStepY68
NOP	
L_SingleStepY67:
;Stepper.c,468 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,469 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,470 :: 		}
L_SingleStepY68:
;Stepper.c,471 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,473 :: 		void StopY(){
;Stepper.c,474 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,475 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,476 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,482 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,483 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,484 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,486 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__StepZ235
=======
BEQ	R2, R0, L__StepZ241
>>>>>>> patch2
NOP	
J	L_StepZ69
NOP	
<<<<<<< HEAD
L__StepZ235:
;Stepper.c,458 :: 		SingleStepZ();
=======
L__StepZ241:
;Stepper.c,487 :: 		SingleStepZ();
>>>>>>> patch2
JAL	_SingleStepZ+0
NOP	
J	L_StepZ70
NOP	
L_StepZ69:
;Stepper.c,489 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepZ70:
;Stepper.c,491 :: 		}
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
_SingleStepZ:
;Stepper.c,493 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
<<<<<<< HEAD
;Stepper.c,465 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
=======
;Stepper.c,494 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepZ237
NOP	
J	L__SingleStepZ132
NOP	
L__SingleStepZ237:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepZ239
NOP	
J	L__SingleStepZ131
NOP	
L__SingleStepZ239:
J	L_SingleStepZ71
NOP	
L__SingleStepZ132:
L__SingleStepZ131:
;Stepper.c,466 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,467 :: 		}
J	L_SingleStepZ72
NOP	
L_SingleStepZ71:
;Stepper.c,469 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,470 :: 		}
L_SingleStepZ72:
;Stepper.c,471 :: 		}
=======
BNE	R2, R0, L__SingleStepZ243
NOP	
J	L__SingleStepZ134
NOP	
L__SingleStepZ243:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepZ245
NOP	
J	L__SingleStepZ133
NOP	
L__SingleStepZ245:
J	L_SingleStepZ73
NOP	
L__SingleStepZ134:
L__SingleStepZ133:
;Stepper.c,495 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,496 :: 		}
J	L_SingleStepZ74
NOP	
L_SingleStepZ73:
;Stepper.c,498 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,499 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,500 :: 		}
L_SingleStepZ74:
;Stepper.c,501 :: 		}
>>>>>>> patch2
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,503 :: 		void StopZ(){
;Stepper.c,504 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,505 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,506 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
<<<<<<< HEAD
;Stepper.c,482 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,512 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
>>>>>>> patch2
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
;Stepper.c,483 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,484 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,486 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA242
NOP	
J	L_StepA73
NOP	
L__StepA242:
;Stepper.c,487 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA74
NOP	
L_StepA73:
;Stepper.c,489 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,513 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,514 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,516 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA248
NOP	
J	L_StepA75
NOP	
L__StepA248:
;Stepper.c,517 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA76
NOP	
L_StepA75:
;Stepper.c,519 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch2
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
<<<<<<< HEAD
L_StepA74:
;Stepper.c,491 :: 		}
=======
L_StepA76:
;Stepper.c,521 :: 		}
>>>>>>> patch2
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
_SingleStepA:
<<<<<<< HEAD
;Stepper.c,493 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,494 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
=======
;Stepper.c,523 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,524 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepA244
NOP	
J	L__SingleStepA135
NOP	
L__SingleStepA244:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepA246
NOP	
J	L__SingleStepA134
NOP	
L__SingleStepA246:
J	L_SingleStepA77
NOP	
L__SingleStepA135:
L__SingleStepA134:
;Stepper.c,495 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,496 :: 		}
J	L_SingleStepA78
NOP	
L_SingleStepA77:
;Stepper.c,498 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,499 :: 		}
L_SingleStepA78:
;Stepper.c,500 :: 		}
=======
BNE	R2, R0, L__SingleStepA250
NOP	
J	L__SingleStepA137
NOP	
L__SingleStepA250:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepA252
NOP	
J	L__SingleStepA136
NOP	
L__SingleStepA252:
J	L_SingleStepA79
NOP	
L__SingleStepA137:
L__SingleStepA136:
;Stepper.c,525 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,526 :: 		}
J	L_SingleStepA80
NOP	
L_SingleStepA79:
;Stepper.c,528 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,529 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,530 :: 		}
L_SingleStepA80:
;Stepper.c,531 :: 		}
>>>>>>> patch2
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
<<<<<<< HEAD
;Stepper.c,502 :: 		void StopA(){
;Stepper.c,503 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,504 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,505 :: 		}
=======
;Stepper.c,533 :: 		void StopA(){
;Stepper.c,534 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,535 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,536 :: 		}
>>>>>>> patch2
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_XY_Interpolate:
<<<<<<< HEAD
;Stepper.c,509 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,511 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)/*||(SV.Tog == 1)*/){
=======
;Stepper.c,542 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,544 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)/*||(SV.Tog == 1)*/){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__XY_Interpolate249
NOP	
J	L__XY_Interpolate138
NOP	
L__XY_Interpolate249:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate250
NOP	
J	L__XY_Interpolate137
NOP	
L__XY_Interpolate250:
J	L_XY_Interpolate81
NOP	
L__XY_Interpolate138:
L__XY_Interpolate137:
;Stepper.c,512 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,513 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,514 :: 		UART2_Write_Text("Stopped");
ADDIU	R23, SP, 8
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr1_Stepper+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Stepper+0)
=======
BEQ	R2, R0, L__XY_Interpolate255
NOP	
J	L__XY_Interpolate140
NOP	
L__XY_Interpolate255:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate256
NOP	
J	L__XY_Interpolate139
NOP	
L__XY_Interpolate256:
J	L_XY_Interpolate83
NOP	
L__XY_Interpolate140:
L__XY_Interpolate139:
;Stepper.c,545 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,546 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,547 :: 		UART2_Write_Text("Stopped");
ADDIU	R23, SP, 8
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr10_Stepper+0)
ORI	R24, R24, lo_addr(?ICS?lstr10_Stepper+0)
>>>>>>> patch2
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;Stepper.c,515 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,516 :: 		}
L_XY_Interpolate81:
;Stepper.c,518 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate251
NOP	
J	L_XY_Interpolate82
NOP	
L__XY_Interpolate251:
;Stepper.c,519 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,520 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate252
NOP	
J	L_XY_Interpolate83
NOP	
L__XY_Interpolate252:
;Stepper.c,521 :: 		SV.d2 += 2*SV.dy;
=======
;Stepper.c,548 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,549 :: 		}
L_XY_Interpolate83:
;Stepper.c,551 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XY_Interpolate257
NOP	
J	L_XY_Interpolate84
NOP	
L__XY_Interpolate257:
;Stepper.c,552 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,553 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,554 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate258
NOP	
J	L_XY_Interpolate85
NOP	
L__XY_Interpolate258:
;Stepper.c,555 :: 		SV.d2 += 2*SV.dy;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,522 :: 		}else{
J	L_XY_Interpolate84
NOP	
L_XY_Interpolate83:
;Stepper.c,523 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
=======
;Stepper.c,556 :: 		}else{
J	L_XY_Interpolate86
NOP	
L_XY_Interpolate85:
;Stepper.c,557 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,524 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,525 :: 		}
L_XY_Interpolate84:
;Stepper.c,526 :: 		}else{
J	L_XY_Interpolate85
NOP	
L_XY_Interpolate82:
;Stepper.c,527 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,528 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate253
NOP	
J	L_XY_Interpolate86
NOP	
L__XY_Interpolate253:
;Stepper.c,529 :: 		SV.d2 += 2 * SV.dx;
=======
;Stepper.c,558 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,559 :: 		}
L_XY_Interpolate86:
;Stepper.c,560 :: 		}else{
J	L_XY_Interpolate87
NOP	
L_XY_Interpolate84:
;Stepper.c,561 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,562 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,563 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate259
NOP	
J	L_XY_Interpolate88
NOP	
L__XY_Interpolate259:
;Stepper.c,564 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,530 :: 		}else{
J	L_XY_Interpolate87
NOP	
L_XY_Interpolate86:
;Stepper.c,531 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
=======
;Stepper.c,565 :: 		}else{
J	L_XY_Interpolate89
NOP	
L_XY_Interpolate88:
;Stepper.c,566 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,532 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,533 :: 		}
L_XY_Interpolate87:
;Stepper.c,534 :: 		}
L_XY_Interpolate85:
;Stepper.c,535 :: 		}
=======
;Stepper.c,567 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,568 :: 		}
L_XY_Interpolate89:
;Stepper.c,569 :: 		}
L_XY_Interpolate87:
;Stepper.c,570 :: 		}
>>>>>>> patch2
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,537 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,539 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
=======
;Stepper.c,572 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,574 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__XZ_Interpolate255
NOP	
J	L__XZ_Interpolate142
NOP	
L__XZ_Interpolate255:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate256
NOP	
J	L__XZ_Interpolate141
NOP	
L__XZ_Interpolate256:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XZ_Interpolate258
NOP	
J	L__XZ_Interpolate140
NOP	
L__XZ_Interpolate258:
J	L_XZ_Interpolate90
NOP	
L__XZ_Interpolate142:
L__XZ_Interpolate141:
L__XZ_Interpolate140:
;Stepper.c,540 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,541 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,543 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,544 :: 		}
L_XZ_Interpolate90:
;Stepper.c,546 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate259
NOP	
J	L_XZ_Interpolate91
NOP	
L__XZ_Interpolate259:
;Stepper.c,547 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,548 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate260
NOP	
J	L_XZ_Interpolate92
NOP	
L__XZ_Interpolate260:
;Stepper.c,549 :: 		SV.d2 += 2*SV.dz;
=======
BEQ	R2, R0, L__XZ_Interpolate261
NOP	
J	L__XZ_Interpolate144
NOP	
L__XZ_Interpolate261:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate262
NOP	
J	L__XZ_Interpolate143
NOP	
L__XZ_Interpolate262:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XZ_Interpolate264
NOP	
J	L__XZ_Interpolate142
NOP	
L__XZ_Interpolate264:
J	L_XZ_Interpolate92
NOP	
L__XZ_Interpolate144:
L__XZ_Interpolate143:
L__XZ_Interpolate142:
;Stepper.c,575 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,576 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,578 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,579 :: 		}
L_XZ_Interpolate92:
;Stepper.c,581 :: 		if(SV.dx >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XZ_Interpolate265
NOP	
J	L_XZ_Interpolate93
NOP	
L__XZ_Interpolate265:
;Stepper.c,582 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,583 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,584 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate266
NOP	
J	L_XZ_Interpolate94
NOP	
L__XZ_Interpolate266:
;Stepper.c,585 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_XZ_Interpolate93
NOP	
L_XZ_Interpolate92:
;Stepper.c,551 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
=======
J	L_XZ_Interpolate95
NOP	
L_XZ_Interpolate94:
;Stepper.c,587 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,552 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,553 :: 		}
L_XZ_Interpolate93:
;Stepper.c,555 :: 		}else{
J	L_XZ_Interpolate94
NOP	
L_XZ_Interpolate91:
;Stepper.c,556 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,557 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate261
NOP	
J	L_XZ_Interpolate95
NOP	
L__XZ_Interpolate261:
;Stepper.c,558 :: 		SV.d2 += 2 * SV.dx;
=======
;Stepper.c,588 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,589 :: 		}
L_XZ_Interpolate95:
;Stepper.c,591 :: 		}else{
J	L_XZ_Interpolate96
NOP	
L_XZ_Interpolate93:
;Stepper.c,592 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,593 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,594 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate267
NOP	
J	L_XZ_Interpolate97
NOP	
L__XZ_Interpolate267:
;Stepper.c,595 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_XZ_Interpolate96
NOP	
L_XZ_Interpolate95:
;Stepper.c,560 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
=======
J	L_XZ_Interpolate98
NOP	
L_XZ_Interpolate97:
;Stepper.c,597 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,561 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,562 :: 		}
L_XZ_Interpolate96:
;Stepper.c,563 :: 		}
L_XZ_Interpolate94:
;Stepper.c,564 :: 		}
=======
;Stepper.c,598 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,599 :: 		}
L_XZ_Interpolate98:
;Stepper.c,600 :: 		}
L_XZ_Interpolate96:
;Stepper.c,601 :: 		}
>>>>>>> patch2
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,565 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,566 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)/*||(SV.Tog == 1)*/){
=======
;Stepper.c,602 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,603 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)/*||(SV.Tog == 1)*/){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__YZ_Interpolate263
NOP	
J	L__YZ_Interpolate145
NOP	
L__YZ_Interpolate263:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate264
NOP	
J	L__YZ_Interpolate144
NOP	
L__YZ_Interpolate264:
J	L_YZ_Interpolate99
NOP	
L__YZ_Interpolate145:
L__YZ_Interpolate144:
;Stepper.c,567 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,568 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,569 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,570 :: 		}
L_YZ_Interpolate99:
;Stepper.c,572 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate265
NOP	
J	L_YZ_Interpolate100
NOP	
L__YZ_Interpolate265:
;Stepper.c,573 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,574 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate266
NOP	
J	L_YZ_Interpolate101
NOP	
L__YZ_Interpolate266:
;Stepper.c,575 :: 		SV.d2 += 2*SV.dz;
=======
BEQ	R2, R0, L__YZ_Interpolate269
NOP	
J	L__YZ_Interpolate147
NOP	
L__YZ_Interpolate269:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate270
NOP	
J	L__YZ_Interpolate146
NOP	
L__YZ_Interpolate270:
J	L_YZ_Interpolate101
NOP	
L__YZ_Interpolate147:
L__YZ_Interpolate146:
;Stepper.c,604 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,605 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,606 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,607 :: 		}
L_YZ_Interpolate101:
;Stepper.c,609 :: 		if(SV.dy >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__YZ_Interpolate271
NOP	
J	L_YZ_Interpolate102
NOP	
L__YZ_Interpolate271:
;Stepper.c,610 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,611 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,612 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate272
NOP	
J	L_YZ_Interpolate103
NOP	
L__YZ_Interpolate272:
;Stepper.c,613 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_YZ_Interpolate102
NOP	
L_YZ_Interpolate101:
;Stepper.c,577 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
=======
J	L_YZ_Interpolate104
NOP	
L_YZ_Interpolate103:
;Stepper.c,615 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,578 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,579 :: 		}
L_YZ_Interpolate102:
;Stepper.c,580 :: 		}else{
J	L_YZ_Interpolate103
NOP	
L_YZ_Interpolate100:
;Stepper.c,581 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,582 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate267
NOP	
J	L_YZ_Interpolate104
NOP	
L__YZ_Interpolate267:
;Stepper.c,583 :: 		SV.d2 += 2 * SV.dy;
=======
;Stepper.c,616 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,617 :: 		}
L_YZ_Interpolate104:
;Stepper.c,618 :: 		}else{
J	L_YZ_Interpolate105
NOP	
L_YZ_Interpolate102:
;Stepper.c,619 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,620 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,621 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate273
NOP	
J	L_YZ_Interpolate106
NOP	
L__YZ_Interpolate273:
;Stepper.c,622 :: 		SV.d2 += 2 * SV.dy;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_YZ_Interpolate105
NOP	
L_YZ_Interpolate104:
;Stepper.c,585 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
=======
J	L_YZ_Interpolate107
NOP	
L_YZ_Interpolate106:
;Stepper.c,624 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,586 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,587 :: 		}
L_YZ_Interpolate105:
;Stepper.c,588 :: 		}
L_YZ_Interpolate103:
;Stepper.c,590 :: 		}
=======
;Stepper.c,625 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,626 :: 		}
L_YZ_Interpolate107:
;Stepper.c,627 :: 		}
L_YZ_Interpolate105:
;Stepper.c,629 :: 		}
>>>>>>> patch2
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_min_:
<<<<<<< HEAD
;Stepper.c,600 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,601 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_269
NOP	
J	L_min_106
NOP	
L__min_269:
;Stepper.c,602 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,603 :: 		}
L_min_106:
;Stepper.c,605 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,607 :: 		}
=======
;Stepper.c,639 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,640 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_275
NOP	
J	L_min_108
NOP	
L__min_275:
;Stepper.c,641 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,642 :: 		}
L_min_108:
;Stepper.c,644 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,646 :: 		}
>>>>>>> patch2
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
<<<<<<< HEAD
;Stepper.c,617 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,623 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,624 :: 		q2 = 0x40000000L;           // higest possible result bit
=======
;Stepper.c,656 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,662 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,663 :: 		q2 = 0x40000000L;           // higest possible result bit
>>>>>>> patch2
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
<<<<<<< HEAD
;Stepper.c,625 :: 		do
J	L_Stepper_sqrt_108
NOP	
L_Stepper_sqrt_125:
;Stepper.c,639 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,625 :: 		do
L_Stepper_sqrt_108:
;Stepper.c,627 :: 		if((xr + q2) <= x)
=======
;Stepper.c,664 :: 		do
J	L_Stepper_sqrt_110
NOP	
L_Stepper_sqrt_127:
;Stepper.c,678 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,664 :: 		do
L_Stepper_sqrt_110:
;Stepper.c,666 :: 		if((xr + q2) <= x)
>>>>>>> patch2
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
<<<<<<< HEAD
BEQ	R2, R0, L_Stepper_sqrt_271
NOP	
J	L_Stepper_sqrt_111
NOP	
L_Stepper_sqrt_271:
;Stepper.c,629 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,630 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,631 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_112
NOP	
L_Stepper_sqrt_111:
;Stepper.c,633 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,634 :: 		}
L_Stepper_sqrt_112:
;Stepper.c,635 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,636 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_273
NOP	
J	L_Stepper_sqrt_126
NOP	
L_Stepper_sqrt_273:
; f end address is: 16 (R4)
;Stepper.c,637 :: 		xr += q2;               // test flag
=======
BEQ	R2, R0, L_Stepper_sqrt_277
NOP	
J	L_Stepper_sqrt_113
NOP	
L_Stepper_sqrt_277:
;Stepper.c,668 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,669 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,670 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_114
NOP	
L_Stepper_sqrt_113:
;Stepper.c,672 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,673 :: 		}
L_Stepper_sqrt_114:
;Stepper.c,674 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,675 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_279
NOP	
J	L_Stepper_sqrt_128
NOP	
L_Stepper_sqrt_279:
; f end address is: 16 (R4)
;Stepper.c,676 :: 		xr += q2;               // test flag
>>>>>>> patch2
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
<<<<<<< HEAD
;Stepper.c,638 :: 		}
J	L_Stepper_sqrt_113
NOP	
L_Stepper_sqrt_126:
;Stepper.c,636 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,638 :: 		}
L_Stepper_sqrt_113:
;Stepper.c,639 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_274
NOP	
J	L_Stepper_sqrt_125
NOP	
L_Stepper_sqrt_274:
; q2 end address is: 12 (R3)
;Stepper.c,640 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_275
NOP	
J	L_Stepper_sqrt_114
NOP	
L_Stepper_sqrt_275:
;Stepper.c,641 :: 		return xr +1;             // add for rounding
=======
;Stepper.c,677 :: 		}
J	L_Stepper_sqrt_115
NOP	
L_Stepper_sqrt_128:
;Stepper.c,675 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,677 :: 		}
L_Stepper_sqrt_115:
;Stepper.c,678 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_280
NOP	
J	L_Stepper_sqrt_127
NOP	
L_Stepper_sqrt_280:
; q2 end address is: 12 (R3)
;Stepper.c,679 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_281
NOP	
J	L_Stepper_sqrt_116
NOP	
L_Stepper_sqrt_281:
;Stepper.c,680 :: 		return xr +1;             // add for rounding
>>>>>>> patch2
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
<<<<<<< HEAD
;Stepper.c,642 :: 		}
L_Stepper_sqrt_114:
;Stepper.c,644 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,646 :: 		}
=======
;Stepper.c,681 :: 		}
L_Stepper_sqrt_116:
;Stepper.c,683 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,685 :: 		}
>>>>>>> patch2
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
<<<<<<< HEAD
;Stepper.c,671 :: 		void CycleStop(){
;Stepper.c,673 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,674 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop116:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop277
NOP	
J	L_CycleStop117
NOP	
L__CycleStop277:
;Stepper.c,675 :: 		STPS[ii].microSec = 0;
=======
;Stepper.c,710 :: 		void CycleStop(){
;Stepper.c,712 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,713 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop118:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop283
NOP	
J	L_CycleStop119
NOP	
L__CycleStop283:
;Stepper.c,714 :: 		STPS[ii].microSec = 0;
>>>>>>> patch2
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
<<<<<<< HEAD
;Stepper.c,676 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop278
NOP	
J	L_CycleStop119
NOP	
L__CycleStop278:
; ii end address is: 16 (R4)
J	L_CycleStop117
NOP	
L_CycleStop119:
;Stepper.c,674 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,677 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop116
NOP	
L_CycleStop117:
;Stepper.c,678 :: 		}
=======
;Stepper.c,715 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop284
NOP	
J	L_CycleStop121
NOP	
L__CycleStop284:
; ii end address is: 16 (R4)
J	L_CycleStop119
NOP	
L_CycleStop121:
;Stepper.c,713 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,716 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop118
NOP	
L_CycleStop119:
;Stepper.c,717 :: 		}
>>>>>>> patch2
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
<<<<<<< HEAD
;Stepper.c,680 :: 		void CycleStart(){
;Stepper.c,683 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart280
NOP	
J	L_CycleStart120
NOP	
L__CycleStart280:
;Stepper.c,684 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart121:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart281
NOP	
J	L_CycleStart122
NOP	
L__CycleStart281:
;Stepper.c,685 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart282
NOP	
J	L_CycleStart124
NOP	
L__CycleStart282:
; ii end address is: 16 (R4)
J	L_CycleStart122
NOP	
L_CycleStart124:
;Stepper.c,686 :: 		STPS[ii].microSec++;
=======
;Stepper.c,719 :: 		void CycleStart(){
;Stepper.c,722 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart286
NOP	
J	L_CycleStart122
NOP	
L__CycleStart286:
;Stepper.c,723 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart123:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart287
NOP	
J	L_CycleStart124
NOP	
L__CycleStart287:
;Stepper.c,724 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart288
NOP	
J	L_CycleStart126
NOP	
L__CycleStart288:
; ii end address is: 16 (R4)
J	L_CycleStart124
NOP	
L_CycleStart126:
;Stepper.c,725 :: 		STPS[ii].microSec++;
>>>>>>> patch2
; ii start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
<<<<<<< HEAD
;Stepper.c,684 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,687 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart121
NOP	
L_CycleStart122:
;Stepper.c,688 :: 		}
L_CycleStart120:
;Stepper.c,689 :: 		}
=======
;Stepper.c,723 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,726 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart123
NOP	
L_CycleStart124:
;Stepper.c,727 :: 		}
L_CycleStart122:
;Stepper.c,728 :: 		}
>>>>>>> patch2
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
