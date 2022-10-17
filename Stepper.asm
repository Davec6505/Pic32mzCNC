_SetPinMode:
;Stepper.c,21 :: 		void SetPinMode(){
;Stepper.c,24 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,25 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,32 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,33 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,40 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,41 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,48 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,49 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,54 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,58 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,59 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,60 :: 		SV.dec = decel;
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
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,114 :: 		long abs_mmSteps = abs(mmSteps);
SW	R25, 4(SP)
JAL	_abs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
SEH	R6, R2
;Stepper.c,118 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move161
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move161:
; abs_mmSteps end address is: 24 (R6)
;Stepper.c,119 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,120 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,121 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,122 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,124 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
; abs_mmSteps start address is: 24 (R6)
BNE	R25, R0, L__speed_cntr_Move163
NOP	
J	L__speed_cntr_Move128
NOP	
L__speed_cntr_Move163:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move165
NOP	
J	L__speed_cntr_Move127
NOP	
L__speed_cntr_Move165:
L__speed_cntr_Move126:
;Stepper.c,128 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
SEH	R3, R27
ORI	R2, R0, 68
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
;Stepper.c,133 :: 		STPS[axis_No].step_delay = abs(T1_FREQ_148 * ((sqrt_(A_SQ / SV.acc))/100));
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
LW	R3, Offset(_SV+56)(GP)
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
;Stepper.c,137 :: 		STPS[axis_No].max_step_lim =(speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
;Stepper.c,143 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move166
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move166:
;Stepper.c,144 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,145 :: 		}
L_speed_cntr_Move5:
;Stepper.c,149 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 48
LW	R2, Offset(_SV+60)(GP)
MUL	R4, R6, R2
; abs_mmSteps end address is: 24 (R6)
LW	R3, Offset(_SV+60)(GP)
LW	R2, Offset(_SV+56)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
SW	R2, 0(R5)
;Stepper.c,151 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move167
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move167:
;Stepper.c,152 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,153 :: 		}
L_speed_cntr_Move6:
;Stepper.c,156 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
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
SLT	R2, R3, R2
BNE	R2, R0, L__speed_cntr_Move168
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move168:
;Stepper.c,157 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
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
;Stepper.c,158 :: 		}else{
J	L_speed_cntr_Move8
NOP	
L_speed_cntr_Move7:
;Stepper.c,159 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *SV.acc)/SV.dec);
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
;Stepper.c,160 :: 		}
L_speed_cntr_Move8:
;Stepper.c,162 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move169
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move169:
;Stepper.c,163 :: 		STPS[axis_No].decel_val = -1;
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
L_speed_cntr_Move9:
;Stepper.c,166 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move170
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move170:
;Stepper.c,167 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R27
ORI	R2, R0, 68
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
;Stepper.c,168 :: 		}
J	L_speed_cntr_Move11
NOP	
L_speed_cntr_Move10:
;Stepper.c,170 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
;Stepper.c,171 :: 		}
L_speed_cntr_Move11:
;Stepper.c,176 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move171
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move171:
;Stepper.c,177 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,178 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,179 :: 		}else{
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,180 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 60
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,181 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,182 :: 		}
L_speed_cntr_Move13:
;Stepper.c,124 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move128:
L__speed_cntr_Move127:
;Stepper.c,184 :: 		}
L_speed_cntr_Move1:
;Stepper.c,186 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,187 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,188 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,189 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,190 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,191 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+4)(GP)
;Stepper.c,192 :: 		SV.running = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,216 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,225 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,227 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,229 :: 		sys.steps_position[axis_No] += sys.axis_dir[axis_No];
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_sys+16)
ORI	R2, R2, lo_addr(_sys+16)
ADDU	R4, R2, R3
SEH	R2, R25
SLL	R3, R2, 1
LUI	R2, hi_addr(_sys+0)
ORI	R2, R2, lo_addr(_sys+0)
ADDU	R2, R2, R3
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,230 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,231 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,235 :: 		void toggleOCx(int axis_No){
;Stepper.c,236 :: 		switch(axis_No){
J	L_toggleOCx14
NOP	
;Stepper.c,237 :: 		case X:
L_toggleOCx16:
;Stepper.c,238 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,239 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,240 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,241 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,242 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,243 :: 		case Y:
L_toggleOCx17:
;Stepper.c,244 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,245 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,246 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,247 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,248 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,249 :: 		case Z:
L_toggleOCx18:
;Stepper.c,250 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,251 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,252 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,253 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,254 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,255 :: 		case A:
L_toggleOCx19:
;Stepper.c,256 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,257 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,258 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,259 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,260 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,261 :: 		case B:
L_toggleOCx20:
;Stepper.c,262 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,263 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,264 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,265 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,266 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,267 :: 		case C:
L_toggleOCx21:
;Stepper.c,268 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,269 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,270 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,271 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,272 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,273 :: 		default:
L_toggleOCx22:
;Stepper.c,274 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,275 :: 		}
L_toggleOCx14:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx175
NOP	
J	L_toggleOCx16
NOP	
L__toggleOCx175:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx177
NOP	
J	L_toggleOCx17
NOP	
L__toggleOCx177:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx179
NOP	
J	L_toggleOCx18
NOP	
L__toggleOCx179:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx181
NOP	
J	L_toggleOCx19
NOP	
L__toggleOCx181:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx183
NOP	
J	L_toggleOCx20
NOP	
L__toggleOCx183:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx185
NOP	
J	L_toggleOCx21
NOP	
L__toggleOCx185:
J	L_toggleOCx22
NOP	
L_toggleOCx15:
;Stepper.c,277 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,281 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,287 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse23
NOP	
;Stepper.c,288 :: 		case STOP:
L_Pulse25:
;Stepper.c,289 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,290 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,292 :: 		case ACCEL:
L_Pulse26:
;Stepper.c,297 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,298 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse187
NOP	
J	L_Pulse27
NOP	
L__Pulse187:
;Stepper.c,300 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,301 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,302 :: 		}
L_Pulse27:
;Stepper.c,303 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse188
NOP	
J	L_Pulse28
NOP	
L__Pulse188:
;Stepper.c,304 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,305 :: 		}
L_Pulse28:
;Stepper.c,306 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse189
NOP	
J	L_Pulse29
NOP	
L__Pulse189:
;Stepper.c,307 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,308 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,309 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,310 :: 		}
L_Pulse29:
;Stepper.c,311 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,313 :: 		case RUN:
L_Pulse30:
;Stepper.c,314 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,316 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse190
NOP	
J	L_Pulse31
NOP	
L__Pulse190:
;Stepper.c,317 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,318 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,320 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,321 :: 		}
L_Pulse31:
;Stepper.c,322 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,324 :: 		case DECEL:
L_Pulse32:
;Stepper.c,329 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,333 :: 		if(STPS[axis_No].accel_count > -1 ){
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
BEQ	R2, R0, L__Pulse191
NOP	
J	L_Pulse33
NOP	
L__Pulse191:
;Stepper.c,334 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,335 :: 		}
L_Pulse33:
;Stepper.c,336 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,337 :: 		default:break;
L_Pulse34:
J	L_Pulse24
NOP	
;Stepper.c,338 :: 		}
L_Pulse23:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse193
NOP	
J	L_Pulse25
NOP	
L__Pulse193:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse195
NOP	
J	L_Pulse26
NOP	
L__Pulse195:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse197
NOP	
J	L_Pulse30
NOP	
L__Pulse197:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse199
NOP	
J	L_Pulse32
NOP	
L__Pulse199:
J	L_Pulse34
NOP	
L_Pulse24:
;Stepper.c,339 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,340 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,344 :: 		void AccDec(int axis_No){
;Stepper.c,345 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,346 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,347 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,348 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,350 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,355 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,356 :: 		switch(axis_){
J	L_Single_Axis_Enable35
NOP	
;Stepper.c,357 :: 		case X:
L_Single_Axis_Enable37:
;Stepper.c,358 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,359 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,360 :: 		case Y:
L_Single_Axis_Enable38:
;Stepper.c,361 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,362 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,363 :: 		case Z:
L_Single_Axis_Enable39:
;Stepper.c,364 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,365 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,366 :: 		case A:
L_Single_Axis_Enable40:
;Stepper.c,367 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,368 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,369 :: 		case B:
L_Single_Axis_Enable41:
;Stepper.c,370 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,371 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,372 :: 		case C:
L_Single_Axis_Enable42:
;Stepper.c,373 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,374 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,375 :: 		default:
L_Single_Axis_Enable43:
;Stepper.c,376 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,377 :: 		}
L_Single_Axis_Enable35:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable203
NOP	
J	L_Single_Axis_Enable37
NOP	
L__Single_Axis_Enable203:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable205
NOP	
J	L_Single_Axis_Enable38
NOP	
L__Single_Axis_Enable205:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable207
NOP	
J	L_Single_Axis_Enable39
NOP	
L__Single_Axis_Enable207:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable209
NOP	
J	L_Single_Axis_Enable40
NOP	
L__Single_Axis_Enable209:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable211
NOP	
J	L_Single_Axis_Enable41
NOP	
L__Single_Axis_Enable211:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable213
NOP	
J	L_Single_Axis_Enable42
NOP	
L__Single_Axis_Enable213:
J	L_Single_Axis_Enable43
NOP	
L_Single_Axis_Enable36:
;Stepper.c,378 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,383 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,384 :: 		switch(axis){
J	L_Multi_Axis_Enable44
NOP	
;Stepper.c,385 :: 		case xy:
L_Multi_Axis_Enable46:
;Stepper.c,386 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,387 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,388 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,389 :: 		case xz:
L_Multi_Axis_Enable47:
;Stepper.c,390 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,391 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,392 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,393 :: 		case yz:
L_Multi_Axis_Enable48:
;Stepper.c,394 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,395 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,396 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,397 :: 		case xa:
L_Multi_Axis_Enable49:
;Stepper.c,398 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,399 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,400 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,401 :: 		case ya:
L_Multi_Axis_Enable50:
;Stepper.c,402 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,403 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,404 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,405 :: 		case za:
L_Multi_Axis_Enable51:
;Stepper.c,406 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,407 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,408 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,409 :: 		default:
L_Multi_Axis_Enable52:
;Stepper.c,410 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,411 :: 		}
L_Multi_Axis_Enable44:
ANDI	R2, R25, 255
BNE	R2, R0, L__Multi_Axis_Enable216
NOP	
J	L_Multi_Axis_Enable46
NOP	
L__Multi_Axis_Enable216:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable218
NOP	
J	L_Multi_Axis_Enable47
NOP	
L__Multi_Axis_Enable218:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable220
NOP	
J	L_Multi_Axis_Enable48
NOP	
L__Multi_Axis_Enable220:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable222
NOP	
J	L_Multi_Axis_Enable49
NOP	
L__Multi_Axis_Enable222:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable224
NOP	
J	L_Multi_Axis_Enable50
NOP	
L__Multi_Axis_Enable224:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable226
NOP	
J	L_Multi_Axis_Enable51
NOP	
L__Multi_Axis_Enable226:
J	L_Multi_Axis_Enable52
NOP	
L_Multi_Axis_Enable45:
;Stepper.c,412 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,414 :: 		void disableOCx(){
;Stepper.c,415 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,416 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,417 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,419 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,420 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,421 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,422 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,427 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,429 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,434 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX229
NOP	
J	L_StepX53
NOP	
L__StepX229:
;Stepper.c,435 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX54
NOP	
L_StepX53:
;Stepper.c,437 :: 		AxisPulse[SV.Single_Dual]();
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepX54:
;Stepper.c,438 :: 		}
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
<<<<<<< HEAD
;Stepper.c,433 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,434 :: 		if((STPS[X].step_count >= STPS[X].dist)||(SV.Tog == 1)){
=======
;Stepper.c,441 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,442 :: 		if((STPS[X].step_count >= STPS[X].dist)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__SingleStepX231
NOP	
J	L__SingleStepX131
NOP	
L__SingleStepX231:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepX233
NOP	
J	L__SingleStepX130
NOP	
L__SingleStepX233:
J	L_SingleStepX57
NOP	
<<<<<<< HEAD
L__SingleStepX127:
L__SingleStepX126:
;Stepper.c,435 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,436 :: 		}
J	L_SingleStepX58
NOP	
L_SingleStepX57:
;Stepper.c,438 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,439 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,440 :: 		}
L_SingleStepX58:
;Stepper.c,441 :: 		}
=======
L__SingleStepX131:
L__SingleStepX130:
;Stepper.c,443 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,444 :: 		}
J	L_SingleStepX58
NOP	
L_SingleStepX57:
;Stepper.c,446 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,447 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,448 :: 		}
L_SingleStepX58:
;Stepper.c,449 :: 		}
>>>>>>> patch1
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
<<<<<<< HEAD
;Stepper.c,444 :: 		void StopX(){
;Stepper.c,445 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,446 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,447 :: 		}
=======
;Stepper.c,452 :: 		void StopX(){
;Stepper.c,453 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,454 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,455 :: 		}
>>>>>>> patch1
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
<<<<<<< HEAD
;Stepper.c,453 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,461 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,454 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,455 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,457 :: 		if(SV.Single_Dual == 0)
=======
;Stepper.c,463 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,468 :: 		if(SV.Single_Dual == 0)
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY236
NOP	
J	L_StepY59
NOP	
<<<<<<< HEAD
L__StepY224:
;Stepper.c,458 :: 		SingleStepY();
=======
L__StepY236:
;Stepper.c,469 :: 		SingleStepY();
>>>>>>> patch1
JAL	_SingleStepY+0
NOP	
J	L_StepY60
NOP	
L_StepY59:
<<<<<<< HEAD
;Stepper.c,460 :: 		if(STPS[Y].master = 1)
=======
;Stepper.c,471 :: 		if(STPS[Y].master = 1)
>>>>>>> patch1
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
LBU	R2, Offset(_STPS+72)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY238
NOP	
J	L_StepY61
NOP	
<<<<<<< HEAD
L__StepY226:
;Stepper.c,461 :: 		AxisPulse[SV.Single_Dual]();
=======
L__StepY238:
;Stepper.c,472 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepY61:
<<<<<<< HEAD
;Stepper.c,462 :: 		}
L_StepY60:
;Stepper.c,463 :: 		}
=======
;Stepper.c,473 :: 		}
L_StepY60:
;Stepper.c,474 :: 		}
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
_SingleStepY:
<<<<<<< HEAD
;Stepper.c,465 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,466 :: 		if((STPS[Y].step_count >= STPS[Y].dist)||(SV.Tog == 1)){  //i think this is where the problem lies
=======
;Stepper.c,476 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,477 :: 		if((STPS[Y].step_count >= STPS[Y].dist)||(SV.Tog == 1)){  //i think this is where the problem lies
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__SingleStepY240
NOP	
J	L__SingleStepY134
NOP	
L__SingleStepY240:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepY242
NOP	
J	L__SingleStepY133
NOP	
L__SingleStepY242:
J	L_SingleStepY64
NOP	
<<<<<<< HEAD
L__SingleStepY130:
L__SingleStepY129:
;Stepper.c,467 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,468 :: 		}
J	L_SingleStepY65
NOP	
L_SingleStepY64:
;Stepper.c,470 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,471 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,472 :: 		}
L_SingleStepY65:
;Stepper.c,473 :: 		}
=======
L__SingleStepY134:
L__SingleStepY133:
;Stepper.c,478 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,479 :: 		}
J	L_SingleStepY65
NOP	
L_SingleStepY64:
;Stepper.c,481 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,482 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,483 :: 		}
L_SingleStepY65:
;Stepper.c,484 :: 		}
>>>>>>> patch1
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
<<<<<<< HEAD
;Stepper.c,475 :: 		void StopY(){
;Stepper.c,476 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,477 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,478 :: 		}
=======
;Stepper.c,486 :: 		void StopY(){
;Stepper.c,487 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,488 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,489 :: 		}
>>>>>>> patch1
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
<<<<<<< HEAD
;Stepper.c,484 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,495 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,485 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,486 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,488 :: 		if(SV.Single_Dual == 0)
=======
;Stepper.c,497 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,502 :: 		if(SV.Single_Dual == 0)
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ245
NOP	
J	L_StepZ66
NOP	
<<<<<<< HEAD
L__StepZ233:
;Stepper.c,489 :: 		SingleStepZ();
=======
L__StepZ245:
;Stepper.c,503 :: 		SingleStepZ();
>>>>>>> patch1
JAL	_SingleStepZ+0
NOP	
J	L_StepZ67
NOP	
L_StepZ66:
<<<<<<< HEAD
;Stepper.c,491 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,505 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepZ67:
<<<<<<< HEAD
;Stepper.c,493 :: 		}
=======
;Stepper.c,507 :: 		}
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
_SingleStepZ:
<<<<<<< HEAD
;Stepper.c,495 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,496 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
=======
;Stepper.c,509 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,510 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__SingleStepZ247
NOP	
J	L__SingleStepZ137
NOP	
L__SingleStepZ247:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepZ249
NOP	
J	L__SingleStepZ136
NOP	
L__SingleStepZ249:
J	L_SingleStepZ70
NOP	
<<<<<<< HEAD
L__SingleStepZ133:
L__SingleStepZ132:
;Stepper.c,497 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,498 :: 		}
J	L_SingleStepZ71
NOP	
L_SingleStepZ70:
;Stepper.c,500 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,501 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,502 :: 		}
L_SingleStepZ71:
;Stepper.c,503 :: 		}
=======
L__SingleStepZ137:
L__SingleStepZ136:
;Stepper.c,511 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,512 :: 		}
J	L_SingleStepZ71
NOP	
L_SingleStepZ70:
;Stepper.c,514 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,515 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,516 :: 		}
L_SingleStepZ71:
;Stepper.c,517 :: 		}
>>>>>>> patch1
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
<<<<<<< HEAD
;Stepper.c,505 :: 		void StopZ(){
;Stepper.c,506 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,507 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,508 :: 		}
=======
;Stepper.c,519 :: 		void StopZ(){
;Stepper.c,520 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,521 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,522 :: 		}
>>>>>>> patch1
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
<<<<<<< HEAD
;Stepper.c,514 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,528 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,515 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,516 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,518 :: 		if(SV.Single_Dual == 0)
=======
;Stepper.c,530 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,535 :: 		if(SV.Single_Dual == 0)
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA252
NOP	
J	L_StepA72
NOP	
<<<<<<< HEAD
L__StepA240:
;Stepper.c,519 :: 		SingleStepA();
=======
L__StepA252:
;Stepper.c,536 :: 		SingleStepA();
>>>>>>> patch1
JAL	_SingleStepA+0
NOP	
J	L_StepA73
NOP	
L_StepA72:
<<<<<<< HEAD
;Stepper.c,521 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,538 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch1
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_StepA73:
<<<<<<< HEAD
;Stepper.c,523 :: 		}
=======
;Stepper.c,540 :: 		}
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
_SingleStepA:
<<<<<<< HEAD
;Stepper.c,525 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,526 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
=======
;Stepper.c,542 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,543 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__SingleStepA254
NOP	
J	L__SingleStepA140
NOP	
L__SingleStepA254:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepA256
NOP	
J	L__SingleStepA139
NOP	
L__SingleStepA256:
J	L_SingleStepA76
NOP	
<<<<<<< HEAD
L__SingleStepA136:
L__SingleStepA135:
;Stepper.c,527 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,528 :: 		}
J	L_SingleStepA77
NOP	
L_SingleStepA76:
;Stepper.c,530 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,531 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,532 :: 		}
L_SingleStepA77:
;Stepper.c,533 :: 		}
=======
L__SingleStepA140:
L__SingleStepA139:
;Stepper.c,544 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,545 :: 		}
J	L_SingleStepA77
NOP	
L_SingleStepA76:
;Stepper.c,547 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,548 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,549 :: 		}
L_SingleStepA77:
;Stepper.c,550 :: 		}
>>>>>>> patch1
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
<<<<<<< HEAD
;Stepper.c,535 :: 		void StopA(){
;Stepper.c,536 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,537 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,538 :: 		}
=======
;Stepper.c,552 :: 		void StopA(){
;Stepper.c,553 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,554 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,555 :: 		}
>>>>>>> patch1
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_XY_Interpolate:
<<<<<<< HEAD
;Stepper.c,544 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,546 :: 		if(/*(STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)||*/(SV.Tog == 1)){
=======
;Stepper.c,561 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,563 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate259
NOP	
J	L__XY_Interpolate144
NOP	
L__XY_Interpolate259:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate260
NOP	
J	L__XY_Interpolate143
NOP	
L__XY_Interpolate260:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XY_Interpolate262
NOP	
J	L__XY_Interpolate142
NOP	
<<<<<<< HEAD
L__XY_Interpolate247:
;Stepper.c,547 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,548 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,549 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,550 :: 		}
L_XY_Interpolate78:
;Stepper.c,552 :: 		if(SV.dx >= SV.dy){
=======
L__XY_Interpolate262:
J	L_XY_Interpolate80
NOP	
L__XY_Interpolate144:
L__XY_Interpolate143:
L__XY_Interpolate142:
;Stepper.c,564 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,565 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,566 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,567 :: 		}
L_XY_Interpolate80:
;Stepper.c,569 :: 		if(SV.dx >= SV.dy){
>>>>>>> patch1
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XY_Interpolate263
NOP	
J	L_XY_Interpolate81
NOP	
<<<<<<< HEAD
L__XY_Interpolate248:
;Stepper.c,553 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,554 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,555 :: 		if(SV.d2 < 0){
=======
L__XY_Interpolate263:
;Stepper.c,570 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,571 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,572 :: 		if(SV.d2 < 0){
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate264
NOP	
J	L_XY_Interpolate82
NOP	
<<<<<<< HEAD
L__XY_Interpolate249:
;Stepper.c,556 :: 		SV.d2 += 2*SV.dy;
=======
L__XY_Interpolate264:
;Stepper.c,573 :: 		SV.d2 += 2*SV.dy;
>>>>>>> patch1
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,557 :: 		}else{
J	L_XY_Interpolate81
NOP	
L_XY_Interpolate80:
;Stepper.c,558 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
=======
;Stepper.c,574 :: 		}else{
J	L_XY_Interpolate83
NOP	
L_XY_Interpolate82:
;Stepper.c,575 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
>>>>>>> patch1
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,559 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,560 :: 		}
L_XY_Interpolate81:
;Stepper.c,561 :: 		}else{
J	L_XY_Interpolate82
NOP	
L_XY_Interpolate79:
;Stepper.c,562 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,563 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,564 :: 		if(SV.d2 < 0){
=======
;Stepper.c,576 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,577 :: 		}
L_XY_Interpolate83:
;Stepper.c,578 :: 		}else{
J	L_XY_Interpolate84
NOP	
L_XY_Interpolate81:
;Stepper.c,579 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,580 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,581 :: 		if(SV.d2 < 0){
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate265
NOP	
J	L_XY_Interpolate85
NOP	
<<<<<<< HEAD
L__XY_Interpolate250:
;Stepper.c,565 :: 		SV.d2 += 2 * SV.dx;
=======
L__XY_Interpolate265:
;Stepper.c,582 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch1
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,566 :: 		}else{
J	L_XY_Interpolate84
NOP	
L_XY_Interpolate83:
;Stepper.c,567 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
=======
;Stepper.c,583 :: 		}else{
J	L_XY_Interpolate86
NOP	
L_XY_Interpolate85:
;Stepper.c,584 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
>>>>>>> patch1
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,568 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,569 :: 		}
L_XY_Interpolate84:
;Stepper.c,570 :: 		}
L_XY_Interpolate82:
;Stepper.c,571 :: 		}
=======
;Stepper.c,585 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,586 :: 		}
L_XY_Interpolate86:
;Stepper.c,587 :: 		}
L_XY_Interpolate84:
;Stepper.c,588 :: 		}
>>>>>>> patch1
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,573 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,575 :: 		if(/*(STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||*/(SV.Tog == 1)){
=======
;Stepper.c,590 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,592 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate267
NOP	
J	L__XZ_Interpolate148
NOP	
L__XZ_Interpolate267:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate268
NOP	
J	L__XZ_Interpolate147
NOP	
L__XZ_Interpolate268:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__XZ_Interpolate270
NOP	
J	L__XZ_Interpolate146
NOP	
<<<<<<< HEAD
L__XZ_Interpolate252:
;Stepper.c,576 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,577 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,578 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,579 :: 		}
L_XZ_Interpolate85:
;Stepper.c,581 :: 		if(SV.dx >= SV.dz){
=======
L__XZ_Interpolate270:
J	L_XZ_Interpolate89
NOP	
L__XZ_Interpolate148:
L__XZ_Interpolate147:
L__XZ_Interpolate146:
;Stepper.c,593 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,594 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,595 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,596 :: 		}
L_XZ_Interpolate89:
;Stepper.c,598 :: 		if(SV.dx >= SV.dz){
>>>>>>> patch1
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XZ_Interpolate271
NOP	
J	L_XZ_Interpolate90
NOP	
<<<<<<< HEAD
L__XZ_Interpolate253:
;Stepper.c,582 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,583 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,584 :: 		if(SV.d2 < 0)
=======
L__XZ_Interpolate271:
;Stepper.c,599 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,600 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,601 :: 		if(SV.d2 < 0)
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate272
NOP	
J	L_XZ_Interpolate91
NOP	
<<<<<<< HEAD
L__XZ_Interpolate254:
;Stepper.c,585 :: 		SV.d2 += 2*SV.dz;
=======
L__XZ_Interpolate272:
;Stepper.c,602 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch1
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_XZ_Interpolate92
NOP	
<<<<<<< HEAD
L_XZ_Interpolate87:
;Stepper.c,587 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
=======
L_XZ_Interpolate91:
;Stepper.c,604 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
>>>>>>> patch1
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,588 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,589 :: 		}
L_XZ_Interpolate88:
;Stepper.c,591 :: 		}else{
J	L_XZ_Interpolate89
NOP	
L_XZ_Interpolate86:
;Stepper.c,592 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,593 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,594 :: 		if(SV.d2 < 0)
=======
;Stepper.c,605 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,606 :: 		}
L_XZ_Interpolate92:
;Stepper.c,608 :: 		}else{
J	L_XZ_Interpolate93
NOP	
L_XZ_Interpolate90:
;Stepper.c,609 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,610 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,611 :: 		if(SV.d2 < 0)
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate273
NOP	
J	L_XZ_Interpolate94
NOP	
<<<<<<< HEAD
L__XZ_Interpolate255:
;Stepper.c,595 :: 		SV.d2 += 2 * SV.dx;
=======
L__XZ_Interpolate273:
;Stepper.c,612 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch1
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_XZ_Interpolate95
NOP	
<<<<<<< HEAD
L_XZ_Interpolate90:
;Stepper.c,597 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
=======
L_XZ_Interpolate94:
;Stepper.c,614 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
>>>>>>> patch1
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,598 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,599 :: 		}
L_XZ_Interpolate91:
;Stepper.c,600 :: 		}
L_XZ_Interpolate89:
;Stepper.c,601 :: 		}
=======
;Stepper.c,615 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,616 :: 		}
L_XZ_Interpolate95:
;Stepper.c,617 :: 		}
L_XZ_Interpolate93:
;Stepper.c,618 :: 		}
>>>>>>> patch1
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,602 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,603 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
=======
;Stepper.c,619 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,620 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
>>>>>>> patch1
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate275
NOP	
J	L__YZ_Interpolate152
NOP	
L__YZ_Interpolate275:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate276
NOP	
J	L__YZ_Interpolate151
NOP	
L__YZ_Interpolate276:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__YZ_Interpolate278
NOP	
J	L__YZ_Interpolate150
NOP	
L__YZ_Interpolate278:
J	L_YZ_Interpolate98
NOP	
<<<<<<< HEAD
L__YZ_Interpolate140:
L__YZ_Interpolate139:
L__YZ_Interpolate138:
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
L_YZ_Interpolate94:
;Stepper.c,609 :: 		if(SV.dy >= SV.dz){
=======
L__YZ_Interpolate152:
L__YZ_Interpolate151:
L__YZ_Interpolate150:
;Stepper.c,621 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,622 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,623 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,624 :: 		}
L_YZ_Interpolate98:
;Stepper.c,626 :: 		if(SV.dy >= SV.dz){
>>>>>>> patch1
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__YZ_Interpolate279
NOP	
J	L_YZ_Interpolate99
NOP	
<<<<<<< HEAD
L__YZ_Interpolate261:
;Stepper.c,610 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,611 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,612 :: 		if(SV.d2 < 0)
=======
L__YZ_Interpolate279:
;Stepper.c,627 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,628 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,629 :: 		if(SV.d2 < 0)
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate280
NOP	
J	L_YZ_Interpolate100
NOP	
<<<<<<< HEAD
L__YZ_Interpolate262:
;Stepper.c,613 :: 		SV.d2 += 2*SV.dz;
=======
L__YZ_Interpolate280:
;Stepper.c,630 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch1
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_YZ_Interpolate101
NOP	
<<<<<<< HEAD
L_YZ_Interpolate96:
;Stepper.c,615 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
=======
L_YZ_Interpolate100:
;Stepper.c,632 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
>>>>>>> patch1
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,616 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,617 :: 		}
L_YZ_Interpolate97:
;Stepper.c,618 :: 		}else{
J	L_YZ_Interpolate98
NOP	
L_YZ_Interpolate95:
;Stepper.c,619 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,620 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,621 :: 		if(SV.d2 < 0)
=======
;Stepper.c,633 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,634 :: 		}
L_YZ_Interpolate101:
;Stepper.c,635 :: 		}else{
J	L_YZ_Interpolate102
NOP	
L_YZ_Interpolate99:
;Stepper.c,636 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,637 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,638 :: 		if(SV.d2 < 0)
>>>>>>> patch1
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate281
NOP	
J	L_YZ_Interpolate103
NOP	
<<<<<<< HEAD
L__YZ_Interpolate263:
;Stepper.c,622 :: 		SV.d2 += 2 * SV.dy;
=======
L__YZ_Interpolate281:
;Stepper.c,639 :: 		SV.d2 += 2 * SV.dy;
>>>>>>> patch1
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
J	L_YZ_Interpolate104
NOP	
<<<<<<< HEAD
L_YZ_Interpolate99:
;Stepper.c,624 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
=======
L_YZ_Interpolate103:
;Stepper.c,641 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
>>>>>>> patch1
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,625 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,626 :: 		}
L_YZ_Interpolate100:
;Stepper.c,627 :: 		}
L_YZ_Interpolate98:
;Stepper.c,629 :: 		}
=======
;Stepper.c,642 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,643 :: 		}
L_YZ_Interpolate104:
;Stepper.c,644 :: 		}
L_YZ_Interpolate102:
;Stepper.c,646 :: 		}
>>>>>>> patch1
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_min_:
<<<<<<< HEAD
;Stepper.c,639 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,640 :: 		if(x < y){
=======
;Stepper.c,657 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,658 :: 		if(x < y){
>>>>>>> patch1
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_283
NOP	
J	L_min_105
NOP	
<<<<<<< HEAD
L__min_265:
;Stepper.c,641 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,642 :: 		}
L_min_101:
;Stepper.c,644 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,646 :: 		}
=======
L__min_283:
;Stepper.c,659 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,660 :: 		}
L_min_105:
;Stepper.c,662 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,664 :: 		}
>>>>>>> patch1
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
<<<<<<< HEAD
;Stepper.c,656 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,662 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,663 :: 		q2 = 0x40000000L;           // higest possible result bit
=======
;Stepper.c,674 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,680 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,681 :: 		q2 = 0x40000000L;           // higest possible result bit
>>>>>>> patch1
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
<<<<<<< HEAD
;Stepper.c,664 :: 		do
J	L_Stepper_sqrt_103
NOP	
L_Stepper_sqrt_120:
;Stepper.c,678 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,664 :: 		do
L_Stepper_sqrt_103:
;Stepper.c,666 :: 		if((xr + q2) <= x)
=======
;Stepper.c,682 :: 		do
J	L_Stepper_sqrt_107
NOP	
L_Stepper_sqrt_124:
;Stepper.c,696 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,682 :: 		do
L_Stepper_sqrt_107:
;Stepper.c,684 :: 		if((xr + q2) <= x)
>>>>>>> patch1
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_285
NOP	
J	L_Stepper_sqrt_110
NOP	
<<<<<<< HEAD
L_Stepper_sqrt_267:
;Stepper.c,668 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,669 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,670 :: 		}
=======
L_Stepper_sqrt_285:
;Stepper.c,686 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,687 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,688 :: 		}
>>>>>>> patch1
; f end address is: 16 (R4)
J	L_Stepper_sqrt_111
NOP	
<<<<<<< HEAD
L_Stepper_sqrt_106:
;Stepper.c,672 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,673 :: 		}
L_Stepper_sqrt_107:
;Stepper.c,674 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,675 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_269
=======
L_Stepper_sqrt_110:
;Stepper.c,690 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,691 :: 		}
L_Stepper_sqrt_111:
;Stepper.c,692 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,693 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_287
>>>>>>> patch1
NOP	
J	L_Stepper_sqrt_125
NOP	
L_Stepper_sqrt_287:
; f end address is: 16 (R4)
<<<<<<< HEAD
;Stepper.c,676 :: 		xr += q2;               // test flag
=======
;Stepper.c,694 :: 		xr += q2;               // test flag
>>>>>>> patch1
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
<<<<<<< HEAD
;Stepper.c,677 :: 		}
J	L_Stepper_sqrt_108
NOP	
L_Stepper_sqrt_121:
;Stepper.c,675 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,677 :: 		}
L_Stepper_sqrt_108:
;Stepper.c,678 :: 		} while(q2 >>= 2);          // shift twice
=======
;Stepper.c,695 :: 		}
J	L_Stepper_sqrt_112
NOP	
L_Stepper_sqrt_125:
;Stepper.c,693 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,695 :: 		}
L_Stepper_sqrt_112:
;Stepper.c,696 :: 		} while(q2 >>= 2);          // shift twice
>>>>>>> patch1
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_288
NOP	
J	L_Stepper_sqrt_124
NOP	
L_Stepper_sqrt_288:
; q2 end address is: 12 (R3)
<<<<<<< HEAD
;Stepper.c,679 :: 		if(xr < x){
=======
;Stepper.c,697 :: 		if(xr < x){
>>>>>>> patch1
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_289
NOP	
J	L_Stepper_sqrt_113
NOP	
<<<<<<< HEAD
L_Stepper_sqrt_271:
;Stepper.c,680 :: 		return xr +1;             // add for rounding
=======
L_Stepper_sqrt_289:
;Stepper.c,698 :: 		return xr +1;             // add for rounding
>>>>>>> patch1
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
<<<<<<< HEAD
;Stepper.c,681 :: 		}
L_Stepper_sqrt_109:
;Stepper.c,683 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,685 :: 		}
=======
;Stepper.c,699 :: 		}
L_Stepper_sqrt_113:
;Stepper.c,701 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,703 :: 		}
>>>>>>> patch1
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
<<<<<<< HEAD
;Stepper.c,710 :: 		void CycleStop(){
;Stepper.c,712 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,713 :: 		for(ii = 0;ii<NoOfAxis;ii++){
=======
;Stepper.c,728 :: 		void CycleStop(){
;Stepper.c,730 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,731 :: 		for(ii = 0;ii<NoOfAxis;ii++){
>>>>>>> patch1
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop115:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop291
NOP	
J	L_CycleStop116
NOP	
<<<<<<< HEAD
L__CycleStop273:
;Stepper.c,714 :: 		STPS[ii].microSec = 0;
=======
L__CycleStop291:
;Stepper.c,732 :: 		STPS[ii].microSec = 0;
>>>>>>> patch1
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
<<<<<<< HEAD
;Stepper.c,715 :: 		if(ii > NoOfAxis)break;
=======
;Stepper.c,733 :: 		if(ii > NoOfAxis)break;
>>>>>>> patch1
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop292
NOP	
J	L_CycleStop118
NOP	
L__CycleStop292:
; ii end address is: 16 (R4)
J	L_CycleStop116
NOP	
<<<<<<< HEAD
L_CycleStop114:
;Stepper.c,713 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,716 :: 		}
=======
L_CycleStop118:
;Stepper.c,731 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,734 :: 		}
>>>>>>> patch1
; ii end address is: 16 (R4)
J	L_CycleStop115
NOP	
<<<<<<< HEAD
L_CycleStop112:
;Stepper.c,717 :: 		}
=======
L_CycleStop116:
;Stepper.c,735 :: 		}
>>>>>>> patch1
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
<<<<<<< HEAD
;Stepper.c,719 :: 		void CycleStart(){
;Stepper.c,722 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart276
NOP	
J	L_CycleStart115
NOP	
L__CycleStart276:
;Stepper.c,723 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart116:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart277
NOP	
J	L_CycleStart117
NOP	
L__CycleStart277:
;Stepper.c,724 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart278
=======
;Stepper.c,737 :: 		void CycleStart(){
;Stepper.c,740 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart294
>>>>>>> patch1
NOP	
J	L_CycleStart119
NOP	
L__CycleStart294:
;Stepper.c,741 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart120:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart295
NOP	
<<<<<<< HEAD
L_CycleStart119:
;Stepper.c,725 :: 		STPS[ii].microSec++;
=======
J	L_CycleStart121
NOP	
L__CycleStart295:
;Stepper.c,742 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart296
NOP	
J	L_CycleStart123
NOP	
L__CycleStart296:
; ii end address is: 16 (R4)
J	L_CycleStart121
NOP	
L_CycleStart123:
;Stepper.c,743 :: 		STPS[ii].microSec++;
>>>>>>> patch1
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
;Stepper.c,723 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,726 :: 		}
=======
;Stepper.c,741 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,744 :: 		}
>>>>>>> patch1
; ii end address is: 16 (R4)
J	L_CycleStart120
NOP	
<<<<<<< HEAD
L_CycleStart117:
;Stepper.c,727 :: 		}
L_CycleStart115:
;Stepper.c,728 :: 		}
=======
L_CycleStart121:
;Stepper.c,745 :: 		}
L_CycleStart119:
;Stepper.c,746 :: 		}
>>>>>>> patch1
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
