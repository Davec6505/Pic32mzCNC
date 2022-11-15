_SetPinMode:
;Stepper.c,23 :: 		void SetPinMode(){
;Stepper.c,26 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,27 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,34 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,35 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,42 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,43 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,50 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,51 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,57 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,61 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,62 :: 		SV.acc = accel;
SW	R25, Offset(_SV+52)(GP)
;Stepper.c,63 :: 		SV.dec = decel;
SW	R26, Offset(_SV+56)(GP)
;Stepper.c,65 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,69 :: 		void EnStepperX(){
;Stepper.c,72 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,73 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,75 :: 		void EnStepperY(){
;Stepper.c,78 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,79 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,80 :: 		void EnStepperZ(){
;Stepper.c,83 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,84 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,85 :: 		void EnStepperA(){
;Stepper.c,88 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,89 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,92 :: 		void DisableStepper(){
;Stepper.c,93 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,94 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,95 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,96 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,97 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,116 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,119 :: 		long abs_mmSteps = abs(mmSteps);
SW	R25, 4(SP)
JAL	_abs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
SEH	R6, R2
;Stepper.c,123 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move131
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move131:
; abs_mmSteps end address is: 24 (R6)
;Stepper.c,124 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,125 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,126 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Stepper.c,127 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,129 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
; abs_mmSteps start address is: 24 (R6)
BNE	R25, R0, L__speed_cntr_Move133
NOP	
J	L__speed_cntr_Move119
NOP	
L__speed_cntr_Move133:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move135
NOP	
J	L__speed_cntr_Move118
NOP	
L__speed_cntr_Move135:
L__speed_cntr_Move117:
;Stepper.c,133 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 39
ORI	R2, R2, 55125
DIV	R2, R26
MFLO	R2
SW	R2, 0(R3)
;Stepper.c,138 :: 		STPS[axis_No].step_delay = abs(T1_FREQ_148 * ((sqrt_(A_SQ / SV.acc))/100));
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
LW	R3, Offset(_SV+52)(GP)
LUI	R2, 10199
ORI	R2, R2, 21760
DIV	R2, R3
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	Stepper_sqrt_+0
NOP	
ORI	R3, R0, 100
DIVU	R2, R3
MFLO	R3
ORI	R2, R0, 5281
MULTU	R3, R2
MFLO	R2
SEH	R25, R2
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,139 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,142 :: 		STPS[axis_No].max_step_lim =(speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 56
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+52)(GP)
CVT32.W 	S1, S0
LUI	R2, 15752
ORI	R2, R2, 58531
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
;Stepper.c,148 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move136
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move136:
;Stepper.c,149 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 56
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,150 :: 		}
L_speed_cntr_Move5:
;Stepper.c,154 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 52
LW	R2, Offset(_SV+56)(GP)
MUL	R4, R6, R2
; abs_mmSteps end address is: 24 (R6)
LW	R3, Offset(_SV+56)(GP)
LW	R2, Offset(_SV+52)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
SW	R2, 0(R5)
;Stepper.c,156 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move137
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move137:
;Stepper.c,157 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,158 :: 		}
L_speed_cntr_Move6:
;Stepper.c,161 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 52
LW	R3, 0(R2)
ADDIU	R2, R4, 56
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L__speed_cntr_Move138
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move138:
;Stepper.c,162 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
;Stepper.c,163 :: 		}else{
J	L_speed_cntr_Move8
NOP	
L_speed_cntr_Move7:
;Stepper.c,164 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *SV.acc)/SV.dec);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 56
LW	R3, 0(R2)
LW	R2, Offset(_SV+52)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+56)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,165 :: 		}
L_speed_cntr_Move8:
;Stepper.c,167 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move139
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move139:
;Stepper.c,168 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
L_speed_cntr_Move9:
;Stepper.c,171 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move140
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move140:
;Stepper.c,172 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SUBU	R3, R25, R2
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,173 :: 		}
J	L_speed_cntr_Move11
NOP	
L_speed_cntr_Move10:
;Stepper.c,175 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 92
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
;Stepper.c,176 :: 		}
L_speed_cntr_Move11:
;Stepper.c,181 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 64
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move141
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move141:
;Stepper.c,182 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,183 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,184 :: 		}else{
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,185 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 64
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,186 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Stepper.c,187 :: 		}
L_speed_cntr_Move13:
;Stepper.c,129 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move119:
L__speed_cntr_Move118:
;Stepper.c,189 :: 		}
L_speed_cntr_Move1:
;Stepper.c,191 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,192 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,193 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,194 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,195 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,196 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+4)(GP)
;Stepper.c,197 :: 		SV.running = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,199 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,208 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,210 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,212 :: 		STPS[axis_No].steps_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 72
ADDIU	R2, R2, 88
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,213 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,214 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,218 :: 		void toggleOCx(int axis_No){
;Stepper.c,219 :: 		switch(axis_No){
J	L_toggleOCx14
NOP	
;Stepper.c,220 :: 		case X:
L_toggleOCx16:
;Stepper.c,221 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081849840)(GP)
;Stepper.c,222 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081849824)(GP)
;Stepper.c,223 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081867760)(GP)
;Stepper.c,224 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081849856)(GP)
;Stepper.c,225 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,226 :: 		case Y:
L_toggleOCx17:
;Stepper.c,227 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081851376)(GP)
;Stepper.c,228 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+100)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081851360)(GP)
;Stepper.c,229 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081866736)(GP)
;Stepper.c,230 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081851392)(GP)
;Stepper.c,231 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,232 :: 		case Z:
L_toggleOCx18:
;Stepper.c,233 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081848816)(GP)
;Stepper.c,234 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+192)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081848800)(GP)
;Stepper.c,235 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081865712)(GP)
;Stepper.c,236 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(-1081848832)(GP)
;Stepper.c,237 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,238 :: 		case A:
L_toggleOCx19:
;Stepper.c,239 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081850864)(GP)
;Stepper.c,240 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+284)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081850848)(GP)
;Stepper.c,241 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081866224)(GP)
;Stepper.c,242 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081850880)(GP)
;Stepper.c,243 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,244 :: 		case B:
L_toggleOCx20:
;Stepper.c,245 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081849328)(GP)
;Stepper.c,246 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+376)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081849312)(GP)
;Stepper.c,247 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081867248)(GP)
;Stepper.c,248 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081849344)(GP)
;Stepper.c,249 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,250 :: 		case C:
L_toggleOCx21:
;Stepper.c,251 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(-1081848304)(GP)
;Stepper.c,252 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+468)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1081848288)(GP)
;Stepper.c,253 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(-1081865200)(GP)
;Stepper.c,254 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(-1081848320)(GP)
;Stepper.c,255 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,256 :: 		default:
L_toggleOCx22:
;Stepper.c,257 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,258 :: 		}
L_toggleOCx14:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx145
NOP	
J	L_toggleOCx16
NOP	
L__toggleOCx145:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx147
NOP	
J	L_toggleOCx17
NOP	
L__toggleOCx147:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx149
NOP	
J	L_toggleOCx18
NOP	
L__toggleOCx149:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx151
NOP	
J	L_toggleOCx19
NOP	
L__toggleOCx151:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx153
NOP	
J	L_toggleOCx20
NOP	
L__toggleOCx153:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx155
NOP	
J	L_toggleOCx21
NOP	
L__toggleOCx155:
J	L_toggleOCx22
NOP	
L_toggleOCx15:
;Stepper.c,260 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,264 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,270 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse23
NOP	
;Stepper.c,271 :: 		case STOP:
L_Pulse25:
;Stepper.c,272 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,273 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,275 :: 		case ACCEL:
L_Pulse26:
;Stepper.c,277 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,278 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 92
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
BEQ	R2, R0, L__Pulse157
NOP	
J	L_Pulse27
NOP	
L__Pulse157:
;Stepper.c,279 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,280 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,281 :: 		}
L_Pulse27:
;Stepper.c,282 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 52
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse158
NOP	
J	L_Pulse28
NOP	
L__Pulse158:
;Stepper.c,283 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,284 :: 		}
L_Pulse28:
;Stepper.c,287 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 92
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
BEQ	R2, R0, L__Pulse159
NOP	
J	L_Pulse29
NOP	
L__Pulse159:
;Stepper.c,288 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,289 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,290 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,291 :: 		}
L_Pulse29:
;Stepper.c,292 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,294 :: 		case RUN:
L_Pulse30:
;Stepper.c,295 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,299 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 92
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
BEQ	R2, R0, L__Pulse160
NOP	
J	L_Pulse31
NOP	
L__Pulse160:
;Stepper.c,300 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,301 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,302 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,303 :: 		}
L_Pulse31:
;Stepper.c,304 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,306 :: 		case DECEL:
L_Pulse32:
;Stepper.c,308 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,311 :: 		if(STPS[axis_No].accel_count > -1 ){
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Pulse161
NOP	
J	L_Pulse33
NOP	
L__Pulse161:
;Stepper.c,312 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,313 :: 		}
L_Pulse33:
;Stepper.c,314 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,315 :: 		default:break;
L_Pulse34:
J	L_Pulse24
NOP	
;Stepper.c,316 :: 		}
L_Pulse23:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse163
NOP	
J	L_Pulse25
NOP	
L__Pulse163:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse165
NOP	
J	L_Pulse26
NOP	
L__Pulse165:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse167
NOP	
J	L_Pulse30
NOP	
L__Pulse167:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse169
NOP	
J	L_Pulse32
NOP	
L__Pulse169:
J	L_Pulse34
NOP	
L_Pulse24:
;Stepper.c,317 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,318 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,322 :: 		void AccDec(int axis_No){
;Stepper.c,323 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,324 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 44
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 60
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
;Stepper.c,325 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 60
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
;Stepper.c,326 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,327 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,332 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,333 :: 		switch(axis_){
J	L_Single_Axis_Enable35
NOP	
;Stepper.c,334 :: 		case X:
L_Single_Axis_Enable37:
;Stepper.c,335 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, 2048
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081849848)(GP)
;Stepper.c,336 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,337 :: 		case Y:
L_Single_Axis_Enable38:
;Stepper.c,338 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081851384)(GP)
;Stepper.c,339 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,340 :: 		case Z:
L_Single_Axis_Enable39:
;Stepper.c,341 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
ORI	R2, R0, 8
SW	R2, Offset(-1082064680)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081848824)(GP)
;Stepper.c,342 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,343 :: 		case A:
L_Single_Axis_Enable40:
;Stepper.c,344 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, 2
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081850872)(GP)
;Stepper.c,345 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,346 :: 		case B:
L_Single_Axis_Enable41:
;Stepper.c,347 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, 32768
SW	R2, Offset(-1082064696)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081849336)(GP)
;Stepper.c,348 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,349 :: 		case C:
L_Single_Axis_Enable42:
;Stepper.c,350 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
ORI	R2, R0, 128
SW	R2, Offset(-1082064680)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081848312)(GP)
;Stepper.c,351 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,352 :: 		default:
L_Single_Axis_Enable43:
;Stepper.c,353 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,354 :: 		}
L_Single_Axis_Enable35:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable173
NOP	
J	L_Single_Axis_Enable37
NOP	
L__Single_Axis_Enable173:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable175
NOP	
J	L_Single_Axis_Enable38
NOP	
L__Single_Axis_Enable175:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable177
NOP	
J	L_Single_Axis_Enable39
NOP	
L__Single_Axis_Enable177:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable179
NOP	
J	L_Single_Axis_Enable40
NOP	
L__Single_Axis_Enable179:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable181
NOP	
J	L_Single_Axis_Enable41
NOP	
L__Single_Axis_Enable181:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable183
NOP	
J	L_Single_Axis_Enable42
NOP	
L__Single_Axis_Enable183:
J	L_Single_Axis_Enable43
NOP	
L_Single_Axis_Enable36:
;Stepper.c,355 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_disableOCx:
;Stepper.c,358 :: 		void disableOCx(){
;Stepper.c,359 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, 2048
SW	R2, Offset(-1082064700)(GP)
ORI	R3, R0, 32768
SW	R3, Offset(-1081849852)(GP)
;Stepper.c,360 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081851388)(GP)
;Stepper.c,361 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
SW	R3, Offset(-1081848828)(GP)
;Stepper.c,363 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, 2
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081850876)(GP)
;Stepper.c,364 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, 32768
SW	R2, Offset(-1082064700)(GP)
SW	R3, Offset(-1081849340)(GP)
;Stepper.c,365 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
ORI	R2, R0, 128
SW	R2, Offset(-1082064684)(GP)
SW	R3, Offset(-1081848316)(GP)
;Stepper.c,366 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,372 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,373 :: 		OC5IF_bit = 0;
LUI	R2, 2048
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,375 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX186
NOP	
J	L_StepX44
NOP	
L__StepX186:
;Stepper.c,376 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,377 :: 		}else{
J	L_StepX45
NOP	
L_StepX44:
;Stepper.c,378 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX188
NOP	
J	L_StepX46
NOP	
L__StepX188:
;Stepper.c,379 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX189
NOP	
J	L_StepX47
NOP	
L__StepX189:
;Stepper.c,380 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX48
NOP	
L_StepX47:
;Stepper.c,381 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX190
NOP	
J	L_StepX49
NOP	
L__StepX190:
;Stepper.c,382 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX50
NOP	
L_StepX49:
;Stepper.c,383 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX191
NOP	
J	L_StepX51
NOP	
L__StepX191:
;Stepper.c,384 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepX51:
L_StepX50:
L_StepX48:
;Stepper.c,385 :: 		}
L_StepX46:
;Stepper.c,386 :: 		}
L_StepX45:
;Stepper.c,387 :: 		}
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
;Stepper.c,392 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,393 :: 		OC2IF_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,395 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY193
NOP	
J	L_StepY52
NOP	
L__StepY193:
;Stepper.c,396 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,397 :: 		}else {
J	L_StepY53
NOP	
L_StepY52:
;Stepper.c,398 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+96)(GP)
LBU	R2, Offset(_STPS+96)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY195
NOP	
J	L_StepY54
NOP	
L__StepY195:
;Stepper.c,399 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY196
NOP	
J	L_StepY55
NOP	
L__StepY196:
;Stepper.c,400 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY56
NOP	
L_StepY55:
;Stepper.c,401 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY197
NOP	
J	L_StepY57
NOP	
L__StepY197:
;Stepper.c,402 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY58
NOP	
L_StepY57:
;Stepper.c,403 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY198
NOP	
J	L_StepY59
NOP	
L__StepY198:
;Stepper.c,404 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepY59:
L_StepY58:
L_StepY56:
;Stepper.c,405 :: 		}
L_StepY54:
;Stepper.c,406 :: 		}
L_StepY53:
;Stepper.c,407 :: 		}
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
;Stepper.c,412 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,413 :: 		OC7IF_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064812)(GP)
;Stepper.c,415 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ200
NOP	
J	L_StepZ60
NOP	
L__StepZ200:
;Stepper.c,416 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,417 :: 		}else{
J	L_StepZ61
NOP	
L_StepZ60:
;Stepper.c,418 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+188)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+188)(GP)
LBU	R2, Offset(_STPS+188)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepZ202
NOP	
J	L_StepZ62
NOP	
L__StepZ202:
;Stepper.c,419 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ203
NOP	
J	L_StepZ63
NOP	
L__StepZ203:
;Stepper.c,420 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ64
NOP	
L_StepZ63:
;Stepper.c,421 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ204
NOP	
J	L_StepZ65
NOP	
L__StepZ204:
;Stepper.c,422 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ66
NOP	
L_StepZ65:
;Stepper.c,423 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ205
NOP	
J	L_StepZ67
NOP	
L__StepZ205:
;Stepper.c,424 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepZ67:
L_StepZ66:
L_StepZ64:
;Stepper.c,426 :: 		}
L_StepZ62:
;Stepper.c,427 :: 		}
L_StepZ61:
;Stepper.c,429 :: 		}
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
;Stepper.c,434 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,435 :: 		OC3IF_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064828)(GP)
;Stepper.c,437 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA207
NOP	
J	L_StepA68
NOP	
L__StepA207:
;Stepper.c,438 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,439 :: 		}else{
J	L_StepA69
NOP	
L_StepA68:
;Stepper.c,440 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+280)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+280)(GP)
LBU	R2, Offset(_STPS+280)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepA209
NOP	
J	L_StepA70
NOP	
L__StepA209:
;Stepper.c,441 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA210
NOP	
J	L_StepA71
NOP	
L__StepA210:
;Stepper.c,442 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA72
NOP	
L_StepA71:
;Stepper.c,443 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA211
NOP	
J	L_StepA73
NOP	
L__StepA211:
;Stepper.c,444 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA74
NOP	
L_StepA73:
;Stepper.c,445 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA212
NOP	
J	L_StepA75
NOP	
L__StepA212:
;Stepper.c,446 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepA75:
L_StepA74:
L_StepA72:
;Stepper.c,447 :: 		}
L_StepA70:
;Stepper.c,448 :: 		}
L_StepA69:
;Stepper.c,449 :: 		}
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
;Stepper.c,456 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,457 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 36
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__SingleStepAxis214
NOP	
J	L_SingleStepAxis76
NOP	
L__SingleStepAxis214:
;Stepper.c,458 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,459 :: 		}
J	L_SingleStepAxis77
NOP	
L_SingleStepAxis76:
;Stepper.c,461 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,462 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,463 :: 		}
L_SingleStepAxis77:
;Stepper.c,464 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_StopAxis:
;Stepper.c,466 :: 		void StopAxis(int axis){
;Stepper.c,467 :: 		switch(axis){
J	L_StopAxis78
NOP	
;Stepper.c,468 :: 		case X:
L_StopAxis80:
;Stepper.c,469 :: 		OC5IE_bit = 0;
LUI	R2, 2048
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,470 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081849852)(GP)
;Stepper.c,471 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,472 :: 		case Y:
L_StopAxis81:
;Stepper.c,473 :: 		OC2IE_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,474 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081851388)(GP)
;Stepper.c,475 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,476 :: 		case Z:
L_StopAxis82:
;Stepper.c,477 :: 		OC7IE_bit = 0;
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
;Stepper.c,478 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081848828)(GP)
;Stepper.c,479 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,480 :: 		case A:
L_StopAxis83:
;Stepper.c,481 :: 		OC3IE_bit = 0;
LUI	R2, 2
SW	R2, Offset(-1082064700)(GP)
;Stepper.c,482 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(-1081850876)(GP)
;Stepper.c,483 :: 		break;
J	L_StopAxis79
NOP	
;Stepper.c,484 :: 		default : break;
L_StopAxis84:
J	L_StopAxis79
NOP	
;Stepper.c,485 :: 		}
L_StopAxis78:
SEH	R2, R25
BNE	R2, R0, L__StopAxis217
NOP	
J	L_StopAxis80
NOP	
L__StopAxis217:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis219
NOP	
J	L_StopAxis81
NOP	
L__StopAxis219:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis221
NOP	
J	L_StopAxis82
NOP	
L__StopAxis221:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis223
NOP	
J	L_StopAxis83
NOP	
L__StopAxis223:
J	L_StopAxis84
NOP	
L_StopAxis79:
;Stepper.c,486 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 8
SB	R2, 0(R3)
;Stepper.c,487 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_Axis_Interpolate:
;Stepper.c,494 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,496 :: 		if((STPS[axisA].step_count > SV.dx)||(STPS[axisB].step_count > SV.dy)){
SW	R25, 4(SP)
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
LW	R3, 0(R2)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate225
NOP	
J	L__Axis_Interpolate122
NOP	
L__Axis_Interpolate225:
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
LW	R3, 0(R2)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate226
NOP	
J	L__Axis_Interpolate121
NOP	
L__Axis_Interpolate226:
J	L_Axis_Interpolate87
NOP	
L__Axis_Interpolate122:
L__Axis_Interpolate121:
;Stepper.c,497 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,498 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Stepper.c,499 :: 		return;
J	L_end_Axis_Interpolate
NOP	
;Stepper.c,500 :: 		}
L_Axis_Interpolate87:
;Stepper.c,502 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate227
NOP	
J	L_Axis_Interpolate88
NOP	
L__Axis_Interpolate227:
;Stepper.c,503 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,504 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate228
NOP	
J	L_Axis_Interpolate89
NOP	
L__Axis_Interpolate228:
;Stepper.c,505 :: 		Pulse(axisA);
JAL	_Pulse+0
NOP	
L_Axis_Interpolate89:
;Stepper.c,506 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate229
NOP	
J	L_Axis_Interpolate90
NOP	
L__Axis_Interpolate229:
;Stepper.c,507 :: 		SV.d2 += BresIncVal(SV.dy);//2*SV.dy;//
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,508 :: 		}else{
J	L_Axis_Interpolate91
NOP	
L_Axis_Interpolate90:
;Stepper.c,509 :: 		SV.d2 += BresDiffVal(SV.dy,SV.dx);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,510 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,511 :: 		}
L_Axis_Interpolate91:
;Stepper.c,512 :: 		}else{
J	L_Axis_Interpolate92
NOP	
L_Axis_Interpolate88:
;Stepper.c,513 :: 		Step_Cycle(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 8(SP)
;Stepper.c,514 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Axis_Interpolate230
NOP	
J	L_Axis_Interpolate93
NOP	
L__Axis_Interpolate230:
;Stepper.c,515 :: 		Pulse(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Pulse+0
NOP	
LH	R25, 8(SP)
L_Axis_Interpolate93:
;Stepper.c,516 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate231
NOP	
J	L_Axis_Interpolate94
NOP	
L__Axis_Interpolate231:
;Stepper.c,517 :: 		SV.d2 += BresIncVal(SV.dx);//2 * SV.dx;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,518 :: 		}else{
J	L_Axis_Interpolate95
NOP	
L_Axis_Interpolate94:
;Stepper.c,519 :: 		SV.d2 += BresDiffVal(SV.dx,SV.dy);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,520 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,521 :: 		}
L_Axis_Interpolate95:
;Stepper.c,522 :: 		}
L_Axis_Interpolate92:
;Stepper.c,523 :: 		}
L_end_Axis_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Axis_Interpolate
_min_:
;Stepper.c,534 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,535 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_233
NOP	
J	L_min_96
NOP	
L__min_233:
;Stepper.c,536 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,537 :: 		}
L_min_96:
;Stepper.c,539 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,541 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,551 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,557 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,558 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,559 :: 		do
J	L_Stepper_sqrt_98
NOP	
L_Stepper_sqrt_115:
;Stepper.c,573 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,559 :: 		do
L_Stepper_sqrt_98:
;Stepper.c,561 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_235
NOP	
J	L_Stepper_sqrt_101
NOP	
L_Stepper_sqrt_235:
;Stepper.c,563 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,564 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,565 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_102
NOP	
L_Stepper_sqrt_101:
;Stepper.c,567 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,568 :: 		}
L_Stepper_sqrt_102:
;Stepper.c,569 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,570 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_237
NOP	
J	L_Stepper_sqrt_116
NOP	
L_Stepper_sqrt_237:
; f end address is: 16 (R4)
;Stepper.c,571 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,572 :: 		}
J	L_Stepper_sqrt_103
NOP	
L_Stepper_sqrt_116:
;Stepper.c,570 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,572 :: 		}
L_Stepper_sqrt_103:
;Stepper.c,573 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_238
NOP	
J	L_Stepper_sqrt_115
NOP	
L_Stepper_sqrt_238:
; q2 end address is: 12 (R3)
;Stepper.c,574 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_239
NOP	
J	L_Stepper_sqrt_104
NOP	
L_Stepper_sqrt_239:
;Stepper.c,575 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,576 :: 		}
L_Stepper_sqrt_104:
;Stepper.c,578 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,580 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,604 :: 		void CycleStop(){
;Stepper.c,606 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,607 :: 		for(ii = 0;ii<NoOfAxis;ii++){
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
;Stepper.c,608 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,609 :: 		if(ii > NoOfAxis)break;
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
;Stepper.c,607 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,610 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop106
NOP	
L_CycleStop107:
;Stepper.c,611 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,613 :: 		void CycleStart(){
;Stepper.c,616 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart244
NOP	
J	L_CycleStart110
NOP	
L__CycleStart244:
;Stepper.c,617 :: 		for(ii = 0; ii < NoOfAxis;ii++){
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
;Stepper.c,618 :: 		if(ii > NoOfAxis)break;
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
;Stepper.c,619 :: 		STPS[ii].microSec++;
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
;Stepper.c,617 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,620 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart111
NOP	
L_CycleStart112:
;Stepper.c,621 :: 		}
L_CycleStart110:
;Stepper.c,622 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
