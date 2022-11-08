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
BEQ	R25, R2, L__speed_cntr_Move153
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move153:
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
BNE	R25, R0, L__speed_cntr_Move155
NOP	
J	L__speed_cntr_Move132
NOP	
L__speed_cntr_Move155:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move157
NOP	
J	L__speed_cntr_Move131
NOP	
L__speed_cntr_Move157:
L__speed_cntr_Move130:
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
BEQ	R2, R0, L__speed_cntr_Move158
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move158:
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
BEQ	R2, R0, L__speed_cntr_Move159
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move159:
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
BNE	R2, R0, L__speed_cntr_Move160
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move160:
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
BEQ	R2, R0, L__speed_cntr_Move161
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move161:
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
BNE	R2, R0, L__speed_cntr_Move162
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move162:
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
BEQ	R2, R0, L__speed_cntr_Move163
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move163:
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
L__speed_cntr_Move132:
L__speed_cntr_Move131:
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
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,222 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,223 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,224 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,225 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,226 :: 		case Y:
L_toggleOCx17:
;Stepper.c,227 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,228 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+100)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,229 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,230 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,231 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,232 :: 		case Z:
L_toggleOCx18:
;Stepper.c,233 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,234 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+192)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,235 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,236 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,237 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,238 :: 		case A:
L_toggleOCx19:
;Stepper.c,239 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,240 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+284)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,241 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,242 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,243 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,244 :: 		case B:
L_toggleOCx20:
;Stepper.c,245 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,246 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+376)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,247 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,248 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,249 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,250 :: 		case C:
L_toggleOCx21:
;Stepper.c,251 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,252 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+468)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,253 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,254 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
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
BNE	R2, R0, L__toggleOCx167
NOP	
J	L_toggleOCx16
NOP	
L__toggleOCx167:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx169
NOP	
J	L_toggleOCx17
NOP	
L__toggleOCx169:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx171
NOP	
J	L_toggleOCx18
NOP	
L__toggleOCx171:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx173
NOP	
J	L_toggleOCx19
NOP	
L__toggleOCx173:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx175
NOP	
J	L_toggleOCx20
NOP	
L__toggleOCx175:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx177
NOP	
J	L_toggleOCx21
NOP	
L__toggleOCx177:
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
BEQ	R2, R0, L__Pulse179
NOP	
J	L_Pulse27
NOP	
L__Pulse179:
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
BNE	R2, R0, L__Pulse180
NOP	
J	L_Pulse28
NOP	
L__Pulse180:
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
BEQ	R2, R0, L__Pulse181
NOP	
J	L_Pulse29
NOP	
L__Pulse181:
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
BEQ	R2, R0, L__Pulse182
NOP	
J	L_Pulse31
NOP	
L__Pulse182:
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
BEQ	R2, R0, L__Pulse183
NOP	
J	L_Pulse33
NOP	
L__Pulse183:
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
BNE	R2, R0, L__Pulse185
NOP	
J	L_Pulse25
NOP	
L__Pulse185:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse187
NOP	
J	L_Pulse26
NOP	
L__Pulse187:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse189
NOP	
J	L_Pulse30
NOP	
L__Pulse189:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse191
NOP	
J	L_Pulse32
NOP	
L__Pulse191:
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
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,336 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,337 :: 		case Y:
L_Single_Axis_Enable38:
;Stepper.c,338 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,339 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,340 :: 		case Z:
L_Single_Axis_Enable39:
;Stepper.c,341 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,342 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,343 :: 		case A:
L_Single_Axis_Enable40:
;Stepper.c,344 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,345 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,346 :: 		case B:
L_Single_Axis_Enable41:
;Stepper.c,347 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,348 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,349 :: 		case C:
L_Single_Axis_Enable42:
;Stepper.c,350 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
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
BNE	R2, R0, L__Single_Axis_Enable195
NOP	
J	L_Single_Axis_Enable37
NOP	
L__Single_Axis_Enable195:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable197
NOP	
J	L_Single_Axis_Enable38
NOP	
L__Single_Axis_Enable197:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable199
NOP	
J	L_Single_Axis_Enable39
NOP	
L__Single_Axis_Enable199:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable201
NOP	
J	L_Single_Axis_Enable40
NOP	
L__Single_Axis_Enable201:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable203
NOP	
J	L_Single_Axis_Enable41
NOP	
L__Single_Axis_Enable203:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable205
NOP	
J	L_Single_Axis_Enable42
NOP	
L__Single_Axis_Enable205:
J	L_Single_Axis_Enable43
NOP	
L_Single_Axis_Enable36:
;Stepper.c,355 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,360 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,361 :: 		switch(axis){
J	L_Multi_Axis_Enable44
NOP	
;Stepper.c,362 :: 		case xy:
L_Multi_Axis_Enable46:
;Stepper.c,363 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,364 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,365 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,366 :: 		case xz:
L_Multi_Axis_Enable47:
;Stepper.c,367 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,368 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,369 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,370 :: 		case yz:
L_Multi_Axis_Enable48:
;Stepper.c,371 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,372 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,373 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,374 :: 		case xa:
L_Multi_Axis_Enable49:
;Stepper.c,375 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,376 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,377 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,378 :: 		case ya:
L_Multi_Axis_Enable50:
;Stepper.c,379 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,380 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,381 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,382 :: 		case za:
L_Multi_Axis_Enable51:
;Stepper.c,383 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,384 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,385 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,386 :: 		default:
L_Multi_Axis_Enable52:
;Stepper.c,387 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,388 :: 		}
L_Multi_Axis_Enable44:
ANDI	R2, R25, 255
BNE	R2, R0, L__Multi_Axis_Enable208
NOP	
J	L_Multi_Axis_Enable46
NOP	
L__Multi_Axis_Enable208:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable210
NOP	
J	L_Multi_Axis_Enable47
NOP	
L__Multi_Axis_Enable210:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable212
NOP	
J	L_Multi_Axis_Enable48
NOP	
L__Multi_Axis_Enable212:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable214
NOP	
J	L_Multi_Axis_Enable49
NOP	
L__Multi_Axis_Enable214:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable216
NOP	
J	L_Multi_Axis_Enable50
NOP	
L__Multi_Axis_Enable216:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable218
NOP	
J	L_Multi_Axis_Enable51
NOP	
L__Multi_Axis_Enable218:
J	L_Multi_Axis_Enable52
NOP	
L_Multi_Axis_Enable45:
;Stepper.c,389 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,391 :: 		void disableOCx(){
;Stepper.c,392 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,393 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,394 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,396 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,397 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,398 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,399 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,405 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,406 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,408 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX221
NOP	
J	L_StepX53
NOP	
L__StepX221:
;Stepper.c,410 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,411 :: 		}else{
J	L_StepX54
NOP	
L_StepX53:
;Stepper.c,412 :: 		if(STPS[X].master = 1)
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX223
NOP	
J	L_StepX55
NOP	
L__StepX223:
;Stepper.c,413 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepX55:
;Stepper.c,414 :: 		}
L_StepX54:
;Stepper.c,415 :: 		}
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
;Stepper.c,418 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,419 :: 		if((STPS[X].step_count >= STPS[X].dist)/*||(SV.Tog == 1)*/){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX225
NOP	
J	L_SingleStepX56
NOP	
L__SingleStepX225:
;Stepper.c,420 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,421 :: 		}
J	L_SingleStepX57
NOP	
L_SingleStepX56:
;Stepper.c,423 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,424 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,425 :: 		}
L_SingleStepX57:
;Stepper.c,426 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,429 :: 		void StopX(){
;Stepper.c,430 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,431 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,432 :: 		STPS[X].stopAxis = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_STPS+4)(GP)
;Stepper.c,433 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,439 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,440 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,442 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY228
NOP	
J	L_StepY58
NOP	
L__StepY228:
;Stepper.c,444 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,445 :: 		}else {
J	L_StepY59
NOP	
L_StepY58:
;Stepper.c,446 :: 		if(STPS[Y].master = 1)
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+96)(GP)
LBU	R2, Offset(_STPS+96)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY230
NOP	
J	L_StepY60
NOP	
L__StepY230:
;Stepper.c,447 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepY60:
;Stepper.c,448 :: 		}
L_StepY59:
;Stepper.c,449 :: 		}
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
;Stepper.c,451 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,452 :: 		if((STPS[Y].step_count >= STPS[Y].dist)/*||(SV.Tog == 1)*/){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+128)(GP)
LW	R2, Offset(_STPS+124)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY232
NOP	
J	L_SingleStepY61
NOP	
L__SingleStepY232:
;Stepper.c,453 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,454 :: 		}
J	L_SingleStepY62
NOP	
L_SingleStepY61:
;Stepper.c,456 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,457 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,458 :: 		}
L_SingleStepY62:
;Stepper.c,459 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,461 :: 		void StopY(){
;Stepper.c,462 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,463 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,464 :: 		STPS[Y].stopAxis = 1;
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_STPS+96)(GP)
;Stepper.c,465 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,471 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,472 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,474 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ235
NOP	
J	L_StepZ63
NOP	
L__StepZ235:
;Stepper.c,476 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,477 :: 		}else{
J	L_StepZ64
NOP	
L_StepZ63:
;Stepper.c,478 :: 		if(STPS[Z].master = 1)
LBU	R2, Offset(_STPS+188)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+188)(GP)
LBU	R2, Offset(_STPS+188)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepZ237
NOP	
J	L_StepZ65
NOP	
L__StepZ237:
;Stepper.c,479 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepZ65:
;Stepper.c,480 :: 		}
L_StepZ64:
;Stepper.c,482 :: 		}
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
;Stepper.c,484 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,485 :: 		if((STPS[Z].step_count >= STPS[Z].dist)/*||(SV.Tog == 1)*/){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+220)(GP)
LW	R2, Offset(_STPS+216)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ239
NOP	
J	L_SingleStepZ66
NOP	
L__SingleStepZ239:
;Stepper.c,486 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,487 :: 		}
J	L_SingleStepZ67
NOP	
L_SingleStepZ66:
;Stepper.c,489 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,490 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,491 :: 		}
L_SingleStepZ67:
;Stepper.c,492 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,494 :: 		void StopZ(){
;Stepper.c,495 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,496 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,497 :: 		STPS[Z].stopAxis = 1;
LBU	R2, Offset(_STPS+188)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_STPS+188)(GP)
;Stepper.c,498 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
;Stepper.c,504 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,505 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,507 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA242
NOP	
J	L_StepA68
NOP	
L__StepA242:
;Stepper.c,509 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,510 :: 		}else{
J	L_StepA69
NOP	
L_StepA68:
;Stepper.c,511 :: 		if(STPS[A].master = 1)
LBU	R2, Offset(_STPS+280)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+280)(GP)
LBU	R2, Offset(_STPS+280)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepA244
NOP	
J	L_StepA70
NOP	
L__StepA244:
;Stepper.c,512 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepA70:
;Stepper.c,513 :: 		}
L_StepA69:
;Stepper.c,514 :: 		}
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
;Stepper.c,516 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,517 :: 		if((STPS[A].step_count >= STPS[A].dist)/*||(SV.Tog == 1)*/){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+312)(GP)
LW	R2, Offset(_STPS+308)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepA246
NOP	
J	L_SingleStepA71
NOP	
L__SingleStepA246:
;Stepper.c,518 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,519 :: 		}
J	L_SingleStepA72
NOP	
L_SingleStepA71:
;Stepper.c,521 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,522 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,523 :: 		}
L_SingleStepA72:
;Stepper.c,524 :: 		}
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
;Stepper.c,526 :: 		void StopA(){
;Stepper.c,527 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,528 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,529 :: 		STPS[A].stopAxis = 1;
LBU	R2, Offset(_STPS+280)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_STPS+280)(GP)
;Stepper.c,530 :: 		}
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_SingleStepAxis:
;Stepper.c,537 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,538 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
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
BEQ	R2, R0, L__SingleStepAxis249
NOP	
J	L_SingleStepAxis73
NOP	
L__SingleStepAxis249:
;Stepper.c,539 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,540 :: 		}
J	L_SingleStepAxis74
NOP	
L_SingleStepAxis73:
;Stepper.c,542 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,543 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,544 :: 		}
L_SingleStepAxis74:
;Stepper.c,545 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_StopAxis:
;Stepper.c,547 :: 		void StopAxis(int axis){
;Stepper.c,548 :: 		switch(axis){
J	L_StopAxis75
NOP	
;Stepper.c,549 :: 		case X:
L_StopAxis77:
;Stepper.c,550 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,551 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,552 :: 		break;
J	L_StopAxis76
NOP	
;Stepper.c,553 :: 		case Y:
L_StopAxis78:
;Stepper.c,554 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,555 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,556 :: 		break;
J	L_StopAxis76
NOP	
;Stepper.c,557 :: 		case Z:
L_StopAxis79:
;Stepper.c,558 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,559 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,560 :: 		break;
J	L_StopAxis76
NOP	
;Stepper.c,561 :: 		case A:
L_StopAxis80:
;Stepper.c,562 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,563 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,564 :: 		break;
J	L_StopAxis76
NOP	
;Stepper.c,565 :: 		default : break;
L_StopAxis81:
J	L_StopAxis76
NOP	
;Stepper.c,566 :: 		}
L_StopAxis75:
SEH	R2, R25
BNE	R2, R0, L__StopAxis252
NOP	
J	L_StopAxis77
NOP	
L__StopAxis252:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis254
NOP	
J	L_StopAxis78
NOP	
L__StopAxis254:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis256
NOP	
J	L_StopAxis79
NOP	
L__StopAxis256:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis258
NOP	
J	L_StopAxis80
NOP	
L__StopAxis258:
J	L_StopAxis81
NOP	
L_StopAxis76:
;Stepper.c,567 :: 		STPS[axis].stopAxis = 1;
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
;Stepper.c,568 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_XY_Interpolate:
;Stepper.c,574 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,576 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)||(SV.Tog == 1)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate260
NOP	
J	L__XY_Interpolate136
NOP	
L__XY_Interpolate260:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+124)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate261
NOP	
J	L__XY_Interpolate135
NOP	
L__XY_Interpolate261:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XY_Interpolate263
NOP	
J	L__XY_Interpolate134
NOP	
L__XY_Interpolate263:
J	L_XY_Interpolate84
NOP	
L__XY_Interpolate136:
L__XY_Interpolate135:
L__XY_Interpolate134:
;Stepper.c,577 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,578 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,579 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,580 :: 		}
L_XY_Interpolate84:
;Stepper.c,582 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XY_Interpolate264
NOP	
J	L_XY_Interpolate85
NOP	
L__XY_Interpolate264:
;Stepper.c,583 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,584 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,585 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate265
NOP	
J	L_XY_Interpolate86
NOP	
L__XY_Interpolate265:
;Stepper.c,586 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,587 :: 		}else{
J	L_XY_Interpolate87
NOP	
L_XY_Interpolate86:
;Stepper.c,588 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,589 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,590 :: 		}
L_XY_Interpolate87:
;Stepper.c,591 :: 		}else{
J	L_XY_Interpolate88
NOP	
L_XY_Interpolate85:
;Stepper.c,592 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,593 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,594 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate266
NOP	
J	L_XY_Interpolate89
NOP	
L__XY_Interpolate266:
;Stepper.c,595 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,596 :: 		}else{
J	L_XY_Interpolate90
NOP	
L_XY_Interpolate89:
;Stepper.c,597 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,598 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,599 :: 		}
L_XY_Interpolate90:
;Stepper.c,600 :: 		}
L_XY_Interpolate88:
;Stepper.c,601 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Stepper.c,603 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,605 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate268
NOP	
J	L__XZ_Interpolate140
NOP	
L__XZ_Interpolate268:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+216)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate269
NOP	
J	L__XZ_Interpolate139
NOP	
L__XZ_Interpolate269:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XZ_Interpolate271
NOP	
J	L__XZ_Interpolate138
NOP	
L__XZ_Interpolate271:
J	L_XZ_Interpolate93
NOP	
L__XZ_Interpolate140:
L__XZ_Interpolate139:
L__XZ_Interpolate138:
;Stepper.c,606 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,607 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,608 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,609 :: 		}
L_XZ_Interpolate93:
;Stepper.c,611 :: 		if(SV.dx >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XZ_Interpolate272
NOP	
J	L_XZ_Interpolate94
NOP	
L__XZ_Interpolate272:
;Stepper.c,612 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,613 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,614 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate273
NOP	
J	L_XZ_Interpolate95
NOP	
L__XZ_Interpolate273:
;Stepper.c,615 :: 		SV.d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_XZ_Interpolate96
NOP	
L_XZ_Interpolate95:
;Stepper.c,617 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,618 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,619 :: 		}
L_XZ_Interpolate96:
;Stepper.c,621 :: 		}else{
J	L_XZ_Interpolate97
NOP	
L_XZ_Interpolate94:
;Stepper.c,622 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,623 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,624 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate274
NOP	
J	L_XZ_Interpolate98
NOP	
L__XZ_Interpolate274:
;Stepper.c,625 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_XZ_Interpolate99
NOP	
L_XZ_Interpolate98:
;Stepper.c,627 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,628 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,629 :: 		}
L_XZ_Interpolate99:
;Stepper.c,630 :: 		}
L_XZ_Interpolate97:
;Stepper.c,631 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Stepper.c,632 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,633 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+124)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate276
NOP	
J	L__YZ_Interpolate144
NOP	
L__YZ_Interpolate276:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+216)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate277
NOP	
J	L__YZ_Interpolate143
NOP	
L__YZ_Interpolate277:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__YZ_Interpolate279
NOP	
J	L__YZ_Interpolate142
NOP	
L__YZ_Interpolate279:
J	L_YZ_Interpolate102
NOP	
L__YZ_Interpolate144:
L__YZ_Interpolate143:
L__YZ_Interpolate142:
;Stepper.c,634 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,635 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,636 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,637 :: 		}
L_YZ_Interpolate102:
;Stepper.c,639 :: 		if(SV.dy >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__YZ_Interpolate280
NOP	
J	L_YZ_Interpolate103
NOP	
L__YZ_Interpolate280:
;Stepper.c,640 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,641 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,642 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate281
NOP	
J	L_YZ_Interpolate104
NOP	
L__YZ_Interpolate281:
;Stepper.c,643 :: 		SV.d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_YZ_Interpolate105
NOP	
L_YZ_Interpolate104:
;Stepper.c,645 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,646 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,647 :: 		}
L_YZ_Interpolate105:
;Stepper.c,648 :: 		}else{
J	L_YZ_Interpolate106
NOP	
L_YZ_Interpolate103:
;Stepper.c,649 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,650 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,651 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate282
NOP	
J	L_YZ_Interpolate107
NOP	
L__YZ_Interpolate282:
;Stepper.c,652 :: 		SV.d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_YZ_Interpolate108
NOP	
L_YZ_Interpolate107:
;Stepper.c,654 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,655 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,656 :: 		}
L_YZ_Interpolate108:
;Stepper.c,657 :: 		}
L_YZ_Interpolate106:
;Stepper.c,659 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_min_:
;Stepper.c,670 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,671 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_284
NOP	
J	L_min_109
NOP	
L__min_284:
;Stepper.c,672 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,673 :: 		}
L_min_109:
;Stepper.c,675 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,677 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,687 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,693 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,694 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,695 :: 		do
J	L_Stepper_sqrt_111
NOP	
L_Stepper_sqrt_128:
;Stepper.c,709 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,695 :: 		do
L_Stepper_sqrt_111:
;Stepper.c,697 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_286
NOP	
J	L_Stepper_sqrt_114
NOP	
L_Stepper_sqrt_286:
;Stepper.c,699 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,700 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,701 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_115
NOP	
L_Stepper_sqrt_114:
;Stepper.c,703 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,704 :: 		}
L_Stepper_sqrt_115:
;Stepper.c,705 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,706 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_288
NOP	
J	L_Stepper_sqrt_129
NOP	
L_Stepper_sqrt_288:
; f end address is: 16 (R4)
;Stepper.c,707 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,708 :: 		}
J	L_Stepper_sqrt_116
NOP	
L_Stepper_sqrt_129:
;Stepper.c,706 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,708 :: 		}
L_Stepper_sqrt_116:
;Stepper.c,709 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_289
NOP	
J	L_Stepper_sqrt_128
NOP	
L_Stepper_sqrt_289:
; q2 end address is: 12 (R3)
;Stepper.c,710 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_290
NOP	
J	L_Stepper_sqrt_117
NOP	
L_Stepper_sqrt_290:
;Stepper.c,711 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,712 :: 		}
L_Stepper_sqrt_117:
;Stepper.c,714 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,716 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,740 :: 		void CycleStop(){
;Stepper.c,742 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,743 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop119:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop292
NOP	
J	L_CycleStop120
NOP	
L__CycleStop292:
;Stepper.c,744 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,745 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop293
NOP	
J	L_CycleStop122
NOP	
L__CycleStop293:
; ii end address is: 16 (R4)
J	L_CycleStop120
NOP	
L_CycleStop122:
;Stepper.c,743 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,746 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop119
NOP	
L_CycleStop120:
;Stepper.c,747 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,749 :: 		void CycleStart(){
;Stepper.c,752 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart295
NOP	
J	L_CycleStart123
NOP	
L__CycleStart295:
;Stepper.c,753 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart124:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart296
NOP	
J	L_CycleStart125
NOP	
L__CycleStart296:
;Stepper.c,754 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart297
NOP	
J	L_CycleStart127
NOP	
L__CycleStart297:
; ii end address is: 16 (R4)
J	L_CycleStart125
NOP	
L_CycleStart127:
;Stepper.c,755 :: 		STPS[ii].microSec++;
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
;Stepper.c,753 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,756 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart124
NOP	
L_CycleStart125:
;Stepper.c,757 :: 		}
L_CycleStart123:
;Stepper.c,758 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
