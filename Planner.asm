_plan_init:
;Planner.c,25 :: 		void plan_init(float accel,float decel){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Planner.c,26 :: 		int i = 0;
;Planner.c,31 :: 		acc = lround(accel);
SWC1	S13, 4(SP)
JAL	_lround+0
NOP	
LWC1	S13, 4(SP)
SW	R2, Offset(-1610598144)(GP)
;Planner.c,32 :: 		dec = lround(decel);
MOV.S 	S12, S13
JAL	_lround+0
NOP	
SW	R2, Offset(-1610598140)(GP)
;Planner.c,33 :: 		set_calculation_constants();
JAL	_set_calculation_constants+0
NOP	
;Planner.c,37 :: 		SV.prevA = 0.0;
MOVZ	R2, R0, R0
SW	R2, Offset(_SV+36)(GP)
;Planner.c,38 :: 		SV.prevB = 0.0;
MOVZ	R2, R0, R0
SW	R2, Offset(_SV+40)(GP)
;Planner.c,39 :: 		}
L_end_plan_init:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _plan_init
_set_calculation_constants:
;Planner.c,44 :: 		void set_calculation_constants(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Planner.c,48 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_set_calculation_constants0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__set_calculation_constants52
NOP	
J	L_set_calculation_constants1
NOP	
L__set_calculation_constants52:
;Planner.c,50 :: 		alpha[i] = (PIx2 / (settings.steps_per_mm[i]*M_STEP));
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R4, R2, R3
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16896
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S1, S0
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
DIV.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Planner.c,52 :: 		a_t_x100[i] = (alpha[i] * T1_FREQ * 100.00);
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R4, R2, R3
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 19134
ORI	R2, R2, 48160
MTC1	R2, S0
MUL.S 	S1, S1, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R4)
;Planner.c,54 :: 		a_sq[i] = lround(alpha[i] * 2 * SQ_MASK);
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
SW	R2, 8(SP)
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16384
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S1, S0
LUI	R2, 20501
ORI	R2, R2, 761
MTC1	R2, S0
MUL.S 	S0, S1, S0
SH	R5, 4(SP)
MOV.S 	S12, S0
JAL	_lround+0
NOP	
LH	R5, 4(SP)
LW	R3, 8(SP)
SW	R2, 0(R3)
;Planner.c,56 :: 		spr_x_mstep[i] = SPRU(settings.steps_per_mm[i]);
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10080
ADDU	R4, R2, R3
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16896
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R4)
;Planner.c,48 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Planner.c,57 :: 		}
; i end address is: 20 (R5)
J	L_set_calculation_constants0
NOP	
L_set_calculation_constants1:
;Planner.c,58 :: 		}
L_end_set_calculation_constants:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _set_calculation_constants
_Get_Step_Rate:
;Planner.c,62 :: 		float Get_Step_Rate(float speed,int axis){
;Planner.c,65 :: 		speed *= spr_x_mstep[axis];
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10080
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
;Planner.c,66 :: 		return speed;
;Planner.c,67 :: 		}
L_end_Get_Step_Rate:
JR	RA
NOP	
; end of _Get_Step_Rate
_Get_Min_Delay:
;Planner.c,73 :: 		long Get_Min_Delay(float _speed,int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,74 :: 		return  lround(a_t_x100[axis] / _speed);
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
DIV.S 	S0, S0, S12
MOV.S 	S12, S0
JAL	_lround+0
NOP	
;Planner.c,75 :: 		}
L_end_Get_Min_Delay:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Get_Min_Delay
_Get_Startup_Delay:
;Planner.c,80 :: 		long Get_Startup_Delay(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Planner.c,81 :: 		return labs(((long)T1_FREQ_148 * sqrt_(a_sq[axis] / acc))/100);;
SW	R25, 4(SP)
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R3, 0(R2)
LW	R2, Offset(-1610598144)(GP)
DIV	R3, R2
MFLO	R2
MOVZ	R25, R2, R0
JAL	_sqrt_+0
NOP	
ORI	R3, R0, 42250
MUL	R3, R3, R2
ORI	R2, R0, 100
DIV	R3, R2
MFLO	R2
MOVZ	R25, R2, R0
JAL	_labs+0
NOP	
;Planner.c,82 :: 		}
;Planner.c,81 :: 		return labs(((long)T1_FREQ_148 * sqrt_(a_sq[axis] / acc))/100);;
;Planner.c,82 :: 		}
L_end_Get_Startup_Delay:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Get_Startup_Delay
_Get_Maxsteplimit_Tofastestspeed:
;Planner.c,88 :: 		long Get_Maxsteplimit_Tofastestspeed(float _speed,int axis){
;Planner.c,89 :: 		return (long)((_speed*_speed)/((2*alpha[axis]*(float)acc)*100.00));
MUL.S 	S2, S12, S12
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16384
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, Offset(-1610598144)(GP)
CVT32.W 	S0, S0
MUL.S 	S1, S1, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
DIV.S 	S0, S2, S0
CVT36.S 	S0, S0
MFC1	R2, S0
;Planner.c,90 :: 		}
L_end_Get_Maxsteplimit_Tofastestspeed:
JR	RA
NOP	
; end of _Get_Maxsteplimit_Tofastestspeed
_Get_Acceleration_Limit:
;Planner.c,95 :: 		long Get_Acceleration_Limit(long mmsteps){
;Planner.c,96 :: 		return (mmsteps * dec) / (acc + dec);
LW	R2, Offset(-1610598140)(GP)
MUL	R4, R25, R2
LW	R3, Offset(-1610598140)(GP)
LW	R2, Offset(-1610598144)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
;Planner.c,97 :: 		}
L_end_Get_Acceleration_Limit:
JR	RA
NOP	
; end of _Get_Acceleration_Limit
_speed_cntr_Move:
;Planner.c,112 :: 		void speed_cntr_Move(long mmSteps, float speed, int axis_No){
ADDIU	SP, SP, -288
SW	RA, 0(SP)
;Planner.c,115 :: 		long startup_dly = 0;
;Planner.c,118 :: 		abs_mmSteps = labs(mmSteps);
JAL	_labs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
MOVZ	R6, R2, R0
;Planner.c,119 :: 		bit_true(SV.mode_complete,bit(axis_No));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_SV+2)(GP)
OR	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Planner.c,122 :: 		speed = Get_Step_Rate(speed,axis_No);//*= spr_x_mstep[axis_No];
SW	R25, 4(SP)
SWC1	S12, 8(SP)
SEH	R25, R26
JAL	_Get_Step_Rate+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
MOV.S 	S12, S0
;Planner.c,127 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move59
NOP	
J	L_speed_cntr_Move3
NOP	
L__speed_cntr_Move59:
;Planner.c,128 :: 		STPS[axis_No].accel_count = -2;        // Move one step...
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65534
SW	R2, 0(R3)
;Planner.c,129 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Planner.c,130 :: 		STPS[axis_No].step_delay = 500;      // Just a short delay so main() can act on 'running'.
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 500
SW	R2, 0(R3)
;Planner.c,132 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move4
NOP	
L_speed_cntr_Move3:
BNE	R25, R0, L__speed_cntr_Move61
NOP	
J	L__speed_cntr_Move47
NOP	
L__speed_cntr_Move61:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move63
NOP	
J	L__speed_cntr_Move46
NOP	
L__speed_cntr_Move63:
L__speed_cntr_Move45:
;Planner.c,141 :: 		temp_speed = speed;
SWC1	S12, 16(SP)
;Planner.c,145 :: 		STPS[axis_No].min_delay = Get_Min_Delay(temp_speed,axis_No);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
SW	R2, 284(SP)
SW	R6, 4(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
LWC1	S12, 16(SP)
JAL	_Get_Min_Delay+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R6, 4(SP)
LW	R3, 284(SP)
SW	R2, 0(R3)
;Planner.c,148 :: 		startup_dly = Get_Startup_Delay(axis_No);
SW	R25, 4(SP)
SEH	R25, R26
JAL	_Get_Startup_Delay+0
NOP	
; startup_dly start address is: 28 (R7)
MOVZ	R7, R2, R0
;Planner.c,151 :: 		STPS[axis_No].max_step_lim = Get_Maxsteplimit_Tofastestspeed(temp_speed, axis_No);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R2, 284(SP)
SEH	R25, R26
LWC1	S12, 16(SP)
JAL	_Get_Maxsteplimit_Tofastestspeed+0
NOP	
LW	R25, 4(SP)
LW	R3, 284(SP)
SW	R2, 0(R3)
;Planner.c,154 :: 		if(STPS[axis_No].max_step_lim > (abs_mmSteps>>1)){
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R3, 0(R2)
SRA	R2, R6, 1
SLT	R2, R2, R3
BNE	R2, R0, L__speed_cntr_Move64
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move64:
;Planner.c,155 :: 		STPS[axis_No].max_step_lim = (abs_mmSteps >> 1);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
SRA	R2, R6, 1
SW	R2, 0(R3)
;Planner.c,156 :: 		}
L_speed_cntr_Move8:
;Planner.c,160 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move65
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move65:
;Planner.c,161 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,162 :: 		}
L_speed_cntr_Move9:
;Planner.c,166 :: 		STPS[axis_No].accel_lim = Get_Acceleration_Limit(abs_mmSteps);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 284(SP)
SW	R25, 4(SP)
MOVZ	R25, R6, R0
JAL	_Get_Acceleration_Limit+0
NOP	
LW	R25, 4(SP)
LW	R3, 284(SP)
SW	R2, 0(R3)
;Planner.c,168 :: 		if(STPS[axis_No].accel_lim > STPS[axis_No].max_step_lim)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__speed_cntr_Move66
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move66:
;Planner.c,169 :: 		STPS[axis_No].accel_lim = STPS[axis_No].max_step_lim;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 44
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move10:
;Planner.c,172 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move67
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move67:
;Planner.c,173 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 44
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,174 :: 		}
L_speed_cntr_Move11:
;Planner.c,175 :: 		STPS[axis_No].decel_val = -(STPS[axis_No].max_step_lim * (acc/dec));
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 16
ADDIU	R2, R2, 48
LW	R4, 0(R2)
LW	R3, Offset(-1610598140)(GP)
LW	R2, Offset(-1610598144)(GP)
DIV	R2, R3
MFLO	R2
MUL	R3, R4, R2
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R5)
;Planner.c,178 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move68
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move68:
;Planner.c,179 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R26
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
L_speed_cntr_Move12:
;Planner.c,182 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move69
NOP	
J	L_speed_cntr_Move13
NOP	
L__speed_cntr_Move69:
;Planner.c,183 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R26
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
;Planner.c,184 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move13:
;Planner.c,186 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R26
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
;Planner.c,187 :: 		}
L_speed_cntr_Move14:
;Planner.c,191 :: 		if(startup_dly <= STPS[axis_No].min_delay){
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SLT	R2, R2, R7
BEQ	R2, R0, L__speed_cntr_Move70
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move70:
; startup_dly end address is: 28 (R7)
;Planner.c,192 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].min_delay);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 284(SP)
ADDIU	R2, R3, 20
SW	R25, 4(SP)
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R25, 4(SP)
LW	R3, 284(SP)
SW	R2, 0(R3)
;Planner.c,193 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,194 :: 		}else{
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Planner.c,195 :: 		STPS[axis_No].step_delay = startup_dly;
; startup_dly start address is: 28 (R7)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R7, 0(R2)
; startup_dly end address is: 28 (R7)
;Planner.c,196 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 1
SH	R2, 0(R3)
;Planner.c,197 :: 		}
L_speed_cntr_Move16:
;Planner.c,132 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move47:
L__speed_cntr_Move46:
;Planner.c,198 :: 		}
L_speed_cntr_Move4:
;Planner.c,199 :: 		if(SV.cir){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__speed_cntr_Move72
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move72:
;Planner.c,200 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R26
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
;Planner.c,201 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,202 :: 		}
L_speed_cntr_Move17:
;Planner.c,203 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Planner.c,204 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Planner.c,205 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
; abs_mmSteps end address is: 24 (R6)
MOVZ	R11, R6, R0
;Planner.c,210 :: 		while(DMA_IsOn(1));
L_speed_cntr_Move18:
; abs_mmSteps start address is: 44 (R11)
SW	R11, 4(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R11, 4(SP)
BNE	R2, R0, L__speed_cntr_Move74
NOP	
J	L_speed_cntr_Move19
NOP	
L__speed_cntr_Move74:
J	L_speed_cntr_Move18
NOP	
L_speed_cntr_Move19:
;Planner.c,243 :: 		,STPS[axis_No].min_delay
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 20
LW	R10, 0(R2)
;Planner.c,242 :: 		,STPS[axis_No].step_delay
ADDIU	R2, R3, 8
LW	R9, 0(R2)
;Planner.c,241 :: 		,STPS[axis_No].decel_start
ADDIU	R2, R3, 12
LW	R8, 0(R2)
;Planner.c,240 :: 		,STPS[axis_No].decel_val
ADDIU	R2, R3, 16
LW	R7, 0(R2)
;Planner.c,239 :: 		,STPS[axis_No].accel_lim
ADDIU	R2, R3, 44
LW	R6, 0(R2)
;Planner.c,238 :: 		,STPS[axis_No].max_step_lim
ADDIU	R2, R3, 48
LW	R5, 0(R2)
;Planner.c,237 :: 		,a_t_x100[axis_No]
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
;Planner.c,235 :: 		,alpha[axis_No]
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;Planner.c,233 :: 		,a_sq[axis_No]
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R4, 0(R2)
;Planner.c,226 :: 		SV.mode-complete:= %d\n\n"
ADDIU	R23, SP, 20
ADDIU	R22, R23, 263
LUI	R24, hi_addr(?ICS?lstr1_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
;Planner.c,244 :: 		,SV.mode_complete);
LH	R2, Offset(_SV+2)(GP)
SH	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -76
SH	R2, 72(SP)
;Planner.c,243 :: 		,STPS[axis_No].min_delay
SW	R10, 68(SP)
;Planner.c,242 :: 		,STPS[axis_No].step_delay
SW	R9, 64(SP)
;Planner.c,241 :: 		,STPS[axis_No].decel_start
SW	R8, 60(SP)
;Planner.c,240 :: 		,STPS[axis_No].decel_val
SW	R7, 56(SP)
;Planner.c,239 :: 		,STPS[axis_No].accel_lim
SW	R6, 52(SP)
;Planner.c,238 :: 		,STPS[axis_No].max_step_lim
SW	R5, 48(SP)
;Planner.c,237 :: 		,a_t_x100[axis_No]
SWC1	S1, 44(SP)
;Planner.c,236 :: 		,axis_No
SH	R26, 40(SP)
;Planner.c,235 :: 		,alpha[axis_No]
SWC1	S0, 36(SP)
;Planner.c,234 :: 		,axis_No
SH	R26, 32(SP)
;Planner.c,233 :: 		,a_sq[axis_No]
SW	R4, 28(SP)
;Planner.c,232 :: 		,axis_No
SH	R26, 24(SP)
;Planner.c,231 :: 		,abs_mmSteps
SW	R11, 20(SP)
; abs_mmSteps end address is: 44 (R11)
;Planner.c,230 :: 		,mmSteps
SW	R25, 16(SP)
;Planner.c,229 :: 		,temp_speed
LW	R2, 92(SP)
SW	R2, 12(SP)
;Planner.c,228 :: 		,dec
LW	R2, Offset(-1610598140)(GP)
SW	R2, 8(SP)
;Planner.c,227 :: 		,acc
LW	R2, Offset(-1610598144)(GP)
SW	R2, 4(SP)
;Planner.c,226 :: 		SV.mode-complete:= %d\n\n"
SW	R3, 0(SP)
;Planner.c,244 :: 		,SV.mode_complete);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 76
LW	R25, 8(SP)
LH	R26, 4(SP)
;Planner.c,247 :: 		}
L_end_speed_cntr_Move:
LW	RA, 0(SP)
ADDIU	SP, SP, 288
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,260 :: 		float r, float i, float j, float k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -172
SW	RA, 0(SP)
SW	R28, 4(SP)
LWC1	S0, 172(SP)
SWC1	S0, 172(SP)
; i start address is: 16 (R4)
LWC1	S2, 176(SP)
; j start address is: 24 (R6)
LWC1	S3, 180(SP)
; k start address is: 0 (R0)
LWC1	S0, 184(SP)
; k end address is: 0 (R0)
;Planner.c,261 :: 		char isclockwise = 0;
;Planner.c,263 :: 		float position[NoOfAxis]={0.0};
ADDIU	R23, SP, 104
ADDIU	R22, R23, 48
LUI	R24, hi_addr(?ICSr_or_ijk_position_L0+0)
ORI	R24, R24, lo_addr(?ICSr_or_ijk_position_L0+0)
JAL	___CC2DW+0
NOP	
;Planner.c,264 :: 		float target[NoOfAxis]={0.0};
;Planner.c,265 :: 		float offset[NoOfAxis]={0.0};
;Planner.c,266 :: 		float x = 0.00;
;Planner.c,267 :: 		float y = 0.00;
;Planner.c,268 :: 		float h_x2_div_d = 0.00;
;Planner.c,269 :: 		float speed = 0.00;
;Planner.c,274 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 104
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,275 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,276 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,277 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 120
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,278 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,279 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,280 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 136
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,281 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S3, 0(R2)
;Planner.c,283 :: 		if (r != 0.00) { // Arc Radius Mode
LWC1	S1, 172(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__r_or_ijk76
NOP	
J	L_r_or_ijk20
NOP	
L__r_or_ijk76:
; i end address is: 16 (R4)
; j end address is: 24 (R6)
;Planner.c,347 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 120
LH	R2, 18(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 104
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
SWC1	S3, 156(SP)
;Planner.c,349 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 20(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
SWC1	S2, 160(SP)
;Planner.c,353 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LWC1	S1, 172(SP)
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, 172(SP)
MUL.S 	S1, S1, S0
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,356 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 8(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 8(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 168(SP)
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
LWC1	S13, 160(SP)
LWC1	S12, 156(SP)
JAL	_hypot+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
LWC1	S1, 168(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 128 (R32)
MOV.S 	S16, S0
;Planner.c,358 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
SWC1	S16, 8(SP)
SH	R27, 12(SP)
SH	R26, 14(SP)
SH	R25, 16(SP)
JAL	_Get_motionmode+0
NOP	
LH	R25, 16(SP)
LH	R26, 14(SP)
LH	R27, 12(SP)
LWC1	S16, 8(SP)
SEH	R3, R2
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk77
NOP	
J	L__r_or_ijk48
NOP	
L__r_or_ijk77:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S16
; h_x2_div_d end address is: 128 (R32)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
MOV.S 	S3, S1
J	L_r_or_ijk21
NOP	
L__r_or_ijk48:
MOV.S 	S3, S16
L_r_or_ijk21:
;Planner.c,381 :: 		if (r < 0) {
; h_x2_div_d start address is: 24 (R6)
LWC1	S1, 172(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__r_or_ijk78
NOP	
J	L__r_or_ijk49
NOP	
L__r_or_ijk78:
;Planner.c,382 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; h_x2_div_d end address is: 24 (R6)
; h_x2_div_d start address is: 16 (R4)
MOV.S 	S2, S0
;Planner.c,383 :: 		r = -r; // Finished with r. Set to positive for mc_arc
LWC1	S1, 172(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 172(SP)
; h_x2_div_d end address is: 16 (R4)
;Planner.c,384 :: 		}
J	L_r_or_ijk22
NOP	
L__r_or_ijk49:
;Planner.c,381 :: 		if (r < 0) {
MOV.S 	S2, S3
;Planner.c,384 :: 		}
L_r_or_ijk22:
;Planner.c,387 :: 		i =  0.5*(x-(y*h_x2_div_d));
; h_x2_div_d start address is: 16 (R4)
LWC1	S0, 160(SP)
MUL.S 	S1, S0, S2
LWC1	S0, 156(SP)
SUB.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Planner.c,389 :: 		j =  0.5*(y+(x*h_x2_div_d));
LWC1	S0, 156(SP)
MUL.S 	S1, S0, S2
; h_x2_div_d end address is: 16 (R4)
LWC1	S0, 160(SP)
ADD.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Planner.c,390 :: 		} else {
J	L_r_or_ijk23
NOP	
L_r_or_ijk20:
;Planner.c,393 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
; j start address is: 24 (R6)
; i start address is: 16 (R4)
SH	R27, 8(SP)
; j end address is: 24 (R6)
SH	R26, 10(SP)
SH	R25, 12(SP)
MOV.S 	S13, S3
MOV.S 	S12, S2
; i end address is: 16 (R4)
JAL	_hypot+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
SWC1	S0, 172(SP)
;Planner.c,394 :: 		}
L_r_or_ijk23:
;Planner.c,396 :: 		isclockwise = 0;
SB	R0, 152(SP)
;Planner.c,397 :: 		if (dir == CW) { isclockwise = 1; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk79
NOP	
J	L_r_or_ijk24
NOP	
L__r_or_ijk79:
ORI	R2, R0, 1
SB	R2, 152(SP)
L_r_or_ijk24:
;Planner.c,399 :: 		while(DMA_IsOn(1));
L_r_or_ijk25:
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
BNE	R2, R0, L__r_or_ijk81
NOP	
J	L_r_or_ijk26
NOP	
L__r_or_ijk81:
J	L_r_or_ijk25
NOP	
L_r_or_ijk26:
;Planner.c,402 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
ADDIU	R3, SP, 120
ADDIU	R2, R3, 8
LWC1	S5, 0(R2)
ADDIU	R2, R3, 4
LWC1	S4, 0(R2)
LWC1	S3, 0(R3)
ADDIU	R3, SP, 104
ADDIU	R2, R3, 8
LWC1	S2, 0(R2)
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
;Planner.c,401 :: 		[pos[X]:= %f\tpos[Y]:= %f\tpos[Z]:= %f][tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n\n"
ADDIU	R23, SP, 22
ADDIU	R22, R23, 80
LUI	R24, hi_addr(?ICS?lstr2_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 22
;Planner.c,402 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
ADDIU	SP, SP, -28
SWC1	S5, 24(SP)
SWC1	S4, 20(SP)
SWC1	S3, 16(SP)
SWC1	S2, 12(SP)
SWC1	S1, 8(SP)
SWC1	S0, 4(SP)
;Planner.c,401 :: 		[pos[X]:= %f\tpos[Y]:= %f\tpos[Z]:= %f][tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n\n"
SW	R2, 0(SP)
;Planner.c,402 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LH	R25, 12(SP)
LH	R26, 10(SP)
;Planner.c,411 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ADDIU	R4, SP, 136
ADDIU	R3, SP, 120
ADDIU	R2, SP, 104
;Planner.c,412 :: 		gc.feed_rate, gc.inverse_feed_rate_mode,r, isclockwise);
SH	R26, 10(SP)
SH	R25, 12(SP)
LBU	R5, 152(SP)
ADDIU	SP, SP, -8
SB	R5, 5(SP)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 4(SP)
;Planner.c,411 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,412 :: 		gc.feed_rate, gc.inverse_feed_rate_mode,r, isclockwise);
LWC1	S12, Offset(_gc+24)(GP)
;Planner.c,411 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,412 :: 		gc.feed_rate, gc.inverse_feed_rate_mode,r, isclockwise);
LWC1	S13, 180(SP)
;Planner.c,411 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,412 :: 		gc.feed_rate, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
;Planner.c,413 :: 		}
L_end_r_or_ijk:
LW	R28, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 172
JR	RA
NOP	
; end of _r_or_ijk
_sys_sync_current_position:
;Planner.c,418 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,420 :: 		plan_set_current_position();
JAL	_plan_set_current_position+0
NOP	
;Planner.c,421 :: 		}
L_end_sys_sync_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,424 :: 		void plan_set_current_position(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Planner.c,425 :: 		int i = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Planner.c,426 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_set_current_position27:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_set_current_position84
NOP	
J	L_plan_set_current_position28
NOP	
L__plan_set_current_position84:
;Planner.c,427 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+32)
ORI	R2, R2, lo_addr(_gc+32)
ADDU	R2, R2, R3
SW	R2, 36(SP)
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 36(SP)
SWC1	S0, 0(R2)
;Planner.c,426 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,427 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
; i end address is: 16 (R4)
J	L_plan_set_current_position27
NOP	
L_plan_set_current_position28:
;Planner.c,430 :: 		while(DMA_IsOn(1));
L_plan_set_current_position30:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__plan_set_current_position86
NOP	
J	L_plan_set_current_position31
NOP	
L__plan_set_current_position86:
J	L_plan_set_current_position30
NOP	
L_plan_set_current_position31:
;Planner.c,431 :: 		dma_printf("x:= %f\ty:= %f\tz:= %f\n",gc.position[X],gc.position[Y],gc.position[Z]);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr3_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 14
LW	R2, Offset(_gc+40)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LW	R2, Offset(_gc+36)(GP)
SW	R2, 8(SP)
LW	R2, Offset(_gc+32)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Planner.c,434 :: 		}
L_end_plan_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _plan_set_current_position
_plan_reset_absolute_position:
;Planner.c,437 :: 		void plan_reset_absolute_position(){
;Planner.c,438 :: 		int i = 0;
;Planner.c,439 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_plan_reset_absolute_position32:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_reset_absolute_position88
NOP	
J	L_plan_reset_absolute_position33
NOP	
L__plan_reset_absolute_position88:
;Planner.c,440 :: 		STPS[X].steps_abs_position = 0;
SW	R0, Offset(_STPS+60)(GP)
;Planner.c,439 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Planner.c,440 :: 		STPS[X].steps_abs_position = 0;
; i end address is: 12 (R3)
J	L_plan_reset_absolute_position32
NOP	
L_plan_reset_absolute_position33:
;Planner.c,441 :: 		}
L_end_plan_reset_absolute_position:
JR	RA
NOP	
; end of _plan_reset_absolute_position
_sqrt_:
;Planner.c,458 :: 		long sqrt_(long x){
;Planner.c,464 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,465 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; q2 end address is: 12 (R3)
; xr end address is: 20 (R5)
;Planner.c,466 :: 		do
J	L_sqrt_35
NOP	
L__sqrt_43:
;Planner.c,480 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R3, R2, R0
MOVZ	R5, R4, R0
;Planner.c,466 :: 		do
L_sqrt_35:
;Planner.c,468 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_90
NOP	
J	L_sqrt_38
NOP	
L__sqrt_90:
;Planner.c,470 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,471 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,472 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_39
NOP	
L_sqrt_38:
;Planner.c,474 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,475 :: 		}
L_sqrt_39:
;Planner.c,476 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,477 :: 		if(f){
BNE	R4, R0, L__sqrt_92
NOP	
J	L__sqrt_44
NOP	
L__sqrt_92:
; f end address is: 16 (R4)
;Planner.c,478 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,479 :: 		}
J	L_sqrt_40
NOP	
L__sqrt_44:
;Planner.c,477 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,479 :: 		}
L_sqrt_40:
;Planner.c,480 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
; q2 end address is: 12 (R3)
; q2 start address is: 8 (R2)
BEQ	R2, R0, L__sqrt_93
NOP	
J	L__sqrt_43
NOP	
L__sqrt_93:
; q2 end address is: 8 (R2)
;Planner.c,481 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_94
NOP	
J	L_sqrt_41
NOP	
L__sqrt_94:
;Planner.c,482 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,483 :: 		}
L_sqrt_41:
;Planner.c,485 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,487 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
