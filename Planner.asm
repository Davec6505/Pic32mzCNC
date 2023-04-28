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
SW	R2, Offset(_SV+40)(GP)
;Planner.c,38 :: 		SV.prevB = 0.0;
MOVZ	R2, R0, R0
SW	R2, Offset(_SV+44)(GP)
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
BNE	R2, R0, L__set_calculation_constants54
NOP	
J	L_set_calculation_constants1
NOP	
L__set_calculation_constants54:
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
_speed_cntr_Move:
;Planner.c,82 :: 		void speed_cntr_Move(long mmSteps, float speed, int axis_No){
ADDIU	SP, SP, -260
SW	RA, 0(SP)
;Planner.c,86 :: 		long abs_mmSteps = labs(mmSteps);
JAL	_labs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
MOVZ	R6, R2, R0
;Planner.c,88 :: 		bit_true(SV.mode_complete,bit(axis_No));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_SV+2)(GP)
OR	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Planner.c,91 :: 		speed = Get_Step_Rate(speed,axis_No);//*= spr_x_mstep[axis_No];
SW	R25, 4(SP)
SWC1	S12, 8(SP)
SEH	R25, R26
JAL	_Get_Step_Rate+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
MOV.S 	S12, S0
;Planner.c,96 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move57
NOP	
J	L_speed_cntr_Move3
NOP	
L__speed_cntr_Move57:
;Planner.c,97 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Planner.c,98 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Planner.c,99 :: 		STPS[axis_No].step_delay = 10000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 10000
SW	R2, 0(R3)
;Planner.c,100 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Planner.c,102 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move4
NOP	
L_speed_cntr_Move3:
BNE	R25, R0, L__speed_cntr_Move59
NOP	
J	L__speed_cntr_Move48
NOP	
L__speed_cntr_Move59:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move61
NOP	
J	L__speed_cntr_Move47
NOP	
L__speed_cntr_Move61:
L__speed_cntr_Move46:
;Planner.c,108 :: 		if(STPS[axis_No].run_state != STOP)
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L__speed_cntr_Move63
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move63:
;Planner.c,109 :: 		temp_speed = last_speed - speed;
LWC1	S0, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
SUB.S 	S0, S0, S12
SWC1	S0, 16(SP)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Planner.c,111 :: 		temp_speed = speed;
SWC1	S12, 16(SP)
L_speed_cntr_Move9:
;Planner.c,116 :: 		STPS[axis_No].min_delay =  lround(a_t_x100[axis_No] / temp_speed);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
SW	R2, 256(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 16(SP)
DIV.S 	S0, S1, S0
SW	R6, 4(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
MOV.S 	S12, S0
JAL	_lround+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R6, 4(SP)
LW	R3, 256(SP)
SW	R2, 0(R3)
;Planner.c,121 :: 		STPS[axis_No].step_delay = labs((long)T1_FREQ_148 * ((sqrt_(a_sq[axis_No] / acc)))/100);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 256(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R3, 0(R2)
LW	R2, Offset(-1610598144)(GP)
DIV	R3, R2
MFLO	R2
SW	R25, 4(SP)
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
LW	R25, 4(SP)
LW	R3, 256(SP)
SW	R2, 0(R3)
;Planner.c,123 :: 		if(STPS[axis_No].step_delay > minSpeed)
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SLTI	R2, R2, 30211
BEQ	R2, R0, L__speed_cntr_Move64
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move64:
;Planner.c,124 :: 		STPS[axis_No].StartUp_delay = minSpeed;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ORI	R2, R0, 30210
SW	R2, 0(R3)
J	L_speed_cntr_Move11
NOP	
L_speed_cntr_Move10:
;Planner.c,126 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move11:
;Planner.c,131 :: 		STPS[axis_No].max_step_lim = (long)((temp_speed*temp_speed)/((2*alpha[axis_No]*(float)acc)*100.00));
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 56
LWC1	S1, 16(SP)
LWC1	S0, 16(SP)
MUL.S 	S2, S0, S1
SEH	R2, R26
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
SW	R2, 0(R4)
;Planner.c,134 :: 		if(STPS[axis_No].max_step_lim > (abs_mmSteps>>1)){
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
LW	R3, 0(R2)
SRA	R2, R6, 1
SLT	R2, R2, R3
BNE	R2, R0, L__speed_cntr_Move65
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move65:
;Planner.c,135 :: 		STPS[axis_No].max_step_lim = (abs_mmSteps >> 1);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 56
SRA	R2, R6, 1
SW	R2, 0(R3)
;Planner.c,136 :: 		}
L_speed_cntr_Move12:
;Planner.c,139 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move66
NOP	
J	L_speed_cntr_Move13
NOP	
L__speed_cntr_Move66:
;Planner.c,140 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 56
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,141 :: 		}
L_speed_cntr_Move13:
;Planner.c,145 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * dec) / (acc + dec);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 52
LW	R2, Offset(-1610598140)(GP)
MUL	R4, R6, R2
LW	R3, Offset(-1610598140)(GP)
LW	R2, Offset(-1610598144)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
SW	R2, 0(R5)
;Planner.c,146 :: 		if(STPS[axis_No].accel_lim > STPS[axis_No].max_step_lim)
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 52
LW	R3, 0(R2)
ADDIU	R2, R4, 56
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__speed_cntr_Move67
NOP	
J	L_speed_cntr_Move14
NOP	
L__speed_cntr_Move67:
;Planner.c,147 :: 		STPS[axis_No].accel_lim = STPS[axis_No].max_step_lim;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ADDIU	R2, R2, 56
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move14:
;Planner.c,150 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move68
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move68:
;Planner.c,151 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,152 :: 		}
L_speed_cntr_Move15:
;Planner.c,153 :: 		STPS[axis_No].decel_val = -(STPS[axis_No].max_step_lim * (acc/dec));
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 16
ADDIU	R2, R2, 56
LW	R4, 0(R2)
LW	R3, Offset(-1610598140)(GP)
LW	R2, Offset(-1610598144)(GP)
DIV	R2, R3
MFLO	R2
MUL	R3, R4, R2
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R5)
;Planner.c,156 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move69
NOP	
J	L_speed_cntr_Move16
NOP	
L__speed_cntr_Move69:
;Planner.c,157 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
L_speed_cntr_Move16:
;Planner.c,160 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move70
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move70:
;Planner.c,161 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R26
ORI	R2, R0, 80
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
;Planner.c,162 :: 		}
J	L_speed_cntr_Move18
NOP	
L_speed_cntr_Move17:
;Planner.c,164 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R26
ORI	R2, R0, 80
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
;Planner.c,165 :: 		}
L_speed_cntr_Move18:
;Planner.c,169 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R26
ORI	R2, R0, 80
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
BEQ	R2, R0, L__speed_cntr_Move71
NOP	
J	L_speed_cntr_Move19
NOP	
L__speed_cntr_Move71:
;Planner.c,170 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].min_delay);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 256(SP)
ADDIU	R2, R3, 20
SW	R25, 4(SP)
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R25, 4(SP)
LW	R3, 256(SP)
SW	R2, 0(R3)
;Planner.c,171 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,172 :: 		}else{
J	L_speed_cntr_Move20
NOP	
L_speed_cntr_Move19:
;Planner.c,173 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].StartUp_delay);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 256(SP)
ADDIU	R2, R3, 64
SW	R25, 4(SP)
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R25, 4(SP)
LW	R3, 256(SP)
SW	R2, 0(R3)
;Planner.c,174 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 1
SH	R2, 0(R3)
;Planner.c,175 :: 		}
L_speed_cntr_Move20:
;Planner.c,102 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move48:
L__speed_cntr_Move47:
;Planner.c,177 :: 		}
L_speed_cntr_Move4:
;Planner.c,179 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Planner.c,180 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Planner.c,181 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,182 :: 		SV.running                = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
; abs_mmSteps end address is: 24 (R6)
MOVZ	R11, R6, R0
;Planner.c,188 :: 		while(DMA_IsOn(1));
L_speed_cntr_Move21:
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
BNE	R2, R0, L__speed_cntr_Move73
NOP	
J	L_speed_cntr_Move22
NOP	
L__speed_cntr_Move73:
J	L_speed_cntr_Move21
NOP	
L_speed_cntr_Move22:
;Planner.c,221 :: 		,STPS[axis_No].min_delay
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 20
LW	R10, 0(R2)
;Planner.c,220 :: 		,STPS[axis_No].step_delay
ADDIU	R2, R3, 8
LW	R9, 0(R2)
;Planner.c,219 :: 		,STPS[axis_No].decel_start
ADDIU	R2, R3, 12
LW	R8, 0(R2)
;Planner.c,218 :: 		,STPS[axis_No].decel_val
ADDIU	R2, R3, 16
LW	R7, 0(R2)
;Planner.c,217 :: 		,STPS[axis_No].accel_lim
ADDIU	R2, R3, 52
LW	R6, 0(R2)
;Planner.c,216 :: 		,STPS[axis_No].max_step_lim
ADDIU	R2, R3, 56
LW	R5, 0(R2)
;Planner.c,215 :: 		,a_t_x100[axis_No]
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
;Planner.c,213 :: 		,alpha[axis_No]
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;Planner.c,211 :: 		,a_sq[axis_No]
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R4, 0(R2)
;Planner.c,204 :: 		SV.mode-complete:= %d\n\n"
ADDIU	R23, SP, 20
ADDIU	R22, R23, 233
LUI	R24, hi_addr(?ICS?lstr1_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
;Planner.c,222 :: 		,SV.mode_complete);
LH	R2, Offset(_SV+2)(GP)
SH	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -76
SH	R2, 72(SP)
;Planner.c,221 :: 		,STPS[axis_No].min_delay
SW	R10, 68(SP)
;Planner.c,220 :: 		,STPS[axis_No].step_delay
SW	R9, 64(SP)
;Planner.c,219 :: 		,STPS[axis_No].decel_start
SW	R8, 60(SP)
;Planner.c,218 :: 		,STPS[axis_No].decel_val
SW	R7, 56(SP)
;Planner.c,217 :: 		,STPS[axis_No].accel_lim
SW	R6, 52(SP)
;Planner.c,216 :: 		,STPS[axis_No].max_step_lim
SW	R5, 48(SP)
;Planner.c,215 :: 		,a_t_x100[axis_No]
SWC1	S1, 44(SP)
;Planner.c,214 :: 		,axis_No
SH	R26, 40(SP)
;Planner.c,213 :: 		,alpha[axis_No]
SWC1	S0, 36(SP)
;Planner.c,212 :: 		,axis_No
SH	R26, 32(SP)
;Planner.c,211 :: 		,a_sq[axis_No]
SW	R4, 28(SP)
;Planner.c,210 :: 		,axis_No
SH	R26, 24(SP)
;Planner.c,209 :: 		,abs_mmSteps
SW	R11, 20(SP)
; abs_mmSteps end address is: 44 (R11)
;Planner.c,208 :: 		,mmSteps
SW	R25, 16(SP)
;Planner.c,207 :: 		,temp_speed
LW	R2, 92(SP)
SW	R2, 12(SP)
;Planner.c,206 :: 		,dec
LW	R2, Offset(-1610598140)(GP)
SW	R2, 8(SP)
;Planner.c,205 :: 		,acc
LW	R2, Offset(-1610598144)(GP)
SW	R2, 4(SP)
;Planner.c,204 :: 		SV.mode-complete:= %d\n\n"
SW	R3, 0(SP)
;Planner.c,222 :: 		,SV.mode_complete);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 76
LW	R25, 8(SP)
LH	R26, 4(SP)
;Planner.c,225 :: 		}
L_end_speed_cntr_Move:
LW	RA, 0(SP)
ADDIU	SP, SP, 260
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,238 :: 		float r, float i, float j, float k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 144 (R36)
LWC1	S18, 100(SP)
; i start address is: 8 (R2)
LWC1	S1, 104(SP)
; j start address is: 16 (R4)
LWC1	S2, 108(SP)
; k start address is: 0 (R0)
LWC1	S0, 112(SP)
; k end address is: 0 (R0)
;Planner.c,239 :: 		char isclockwise = 0;
;Planner.c,241 :: 		float position[NoOfAxis]={0.0};
ADDIU	R23, SP, 48
ADDIU	R22, R23, 48
LUI	R24, hi_addr(?ICSr_or_ijk_position_L0+0)
ORI	R24, R24, lo_addr(?ICSr_or_ijk_position_L0+0)
JAL	___CC2DW+0
NOP	
;Planner.c,242 :: 		float target[NoOfAxis]={0.0};
;Planner.c,243 :: 		float offset[NoOfAxis]={0.0};
;Planner.c,244 :: 		float x = 0.00;
;Planner.c,245 :: 		float y = 0.00;
;Planner.c,246 :: 		float h_x2_div_d = 0.00;
;Planner.c,247 :: 		float speed = 0.00;
;Planner.c,252 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 48
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,253 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,254 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,255 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 64
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,256 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,257 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,258 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 80
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Planner.c,259 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,261 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S18, S0
BC1F	0, L__r_or_ijk75
NOP	
J	L_r_or_ijk23
NOP	
L__r_or_ijk75:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Planner.c,325 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 64
LH	R2, 42(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 48
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 128 (R32)
MOV.S 	S16, S3
;Planner.c,327 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 44(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 136 (R34)
MOV.S 	S17, S2
;Planner.c,331 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S18
MUL.S 	S1, S0, S18
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,334 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 20(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 20(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 96(SP)
SWC1	S17, 20(SP)
SWC1	S16, 24(SP)
SWC1	S18, 28(SP)
SH	R27, 32(SP)
SH	R26, 34(SP)
SH	R25, 36(SP)
MOV.S 	S13, S17
MOV.S 	S12, S16
JAL	_hypot+0
NOP	
LH	R25, 36(SP)
LH	R26, 34(SP)
LH	R27, 32(SP)
LWC1	S18, 28(SP)
LWC1	S16, 24(SP)
LWC1	S17, 20(SP)
LWC1	S1, 96(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 152 (R38)
MOV.S 	S19, S0
;Planner.c,336 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
SWC1	S19, 20(SP)
SWC1	S17, 24(SP)
SWC1	S16, 28(SP)
SWC1	S18, 32(SP)
SH	R27, 36(SP)
SH	R26, 38(SP)
SH	R25, 40(SP)
JAL	_Get_motionmode+0
NOP	
LH	R25, 40(SP)
LH	R26, 38(SP)
LH	R27, 36(SP)
LWC1	S18, 32(SP)
LWC1	S16, 28(SP)
LWC1	S17, 24(SP)
LWC1	S19, 20(SP)
SEH	R3, R2
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk76
NOP	
J	L__r_or_ijk49
NOP	
L__r_or_ijk76:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S19
; h_x2_div_d end address is: 152 (R38)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk24
NOP	
L__r_or_ijk49:
MOV.S 	S1, S19
L_r_or_ijk24:
;Planner.c,359 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S18
BC1F	0, L__r_or_ijk77
NOP	
J	L__r_or_ijk50
NOP	
L__r_or_ijk77:
;Planner.c,360 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Planner.c,361 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S18
; r end address is: 144 (R36)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; h_x2_div_d end address is: 24 (R6)
; r end address is: 16 (R4)
;Planner.c,362 :: 		}
J	L_r_or_ijk25
NOP	
L__r_or_ijk50:
;Planner.c,359 :: 		if (r < 0) {
MOV.S 	S2, S18
MOV.S 	S3, S1
;Planner.c,362 :: 		}
L_r_or_ijk25:
;Planner.c,365 :: 		i =  0.5*(x-(y*h_x2_div_d));
; r start address is: 16 (R4)
; h_x2_div_d start address is: 24 (R6)
MUL.S 	S0, S17, S3
SUB.S 	S1, S16, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Planner.c,367 :: 		j =  0.5*(y+(x*h_x2_div_d));
MUL.S 	S0, S16, S3
; x end address is: 128 (R32)
; h_x2_div_d end address is: 24 (R6)
ADD.S 	S1, S17, S0
; y end address is: 136 (R34)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Planner.c,368 :: 		} else {
; r end address is: 16 (R4)
J	L_r_or_ijk26
NOP	
L_r_or_ijk23:
;Planner.c,371 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
; j start address is: 16 (R4)
; i start address is: 8 (R2)
SH	R27, 20(SP)
; j end address is: 16 (R4)
SH	R26, 22(SP)
SH	R25, 24(SP)
MOV.S 	S13, S2
MOV.S 	S12, S1
; i end address is: 8 (R2)
JAL	_hypot+0
NOP	
LH	R25, 24(SP)
LH	R26, 22(SP)
LH	R27, 20(SP)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
;Planner.c,372 :: 		}
L_r_or_ijk26:
;Planner.c,374 :: 		isclockwise = 0;
; r start address is: 16 (R4)
; isclockwise start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,375 :: 		if (dir == CW) { isclockwise = 1; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk78
NOP	
J	L__r_or_ijk51
NOP	
L__r_or_ijk78:
ORI	R5, R0, 1
; isclockwise end address is: 20 (R5)
J	L_r_or_ijk27
NOP	
L__r_or_ijk51:
L_r_or_ijk27:
;Planner.c,384 :: 		speed = RPS_FROM_MMPMIN(gc.feed_rate);
; isclockwise start address is: 20 (R5)
LWC1	S1, Offset(_gc+24)(GP)
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S1, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
;Planner.c,386 :: 		speed = Get_Step_Rate(speed,axis_A);
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
;Planner.c,389 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ADDIU	R4, SP, 80
ADDIU	R3, SP, 64
ADDIU	R2, SP, 48
;Planner.c,390 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -8
SB	R5, 5(SP)
; r end address is: 16 (R4)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 4(SP)
;Planner.c,389 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,390 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S12, S0
;Planner.c,389 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,390 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S13, S2
; isclockwise end address is: 20 (R5)
;Planner.c,389 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,390 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
;Planner.c,391 :: 		}
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _r_or_ijk
_sys_sync_current_position:
;Planner.c,396 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,398 :: 		plan_set_current_position();
JAL	_plan_set_current_position+0
NOP	
;Planner.c,399 :: 		}
L_end_sys_sync_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,402 :: 		void plan_set_current_position(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Planner.c,403 :: 		int i = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Planner.c,404 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_set_current_position28:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_set_current_position81
NOP	
J	L_plan_set_current_position29
NOP	
L__plan_set_current_position81:
;Planner.c,405 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+32)
ORI	R2, R2, lo_addr(_gc+32)
ADDU	R2, R2, R3
SW	R2, 36(SP)
SEH	R3, R4
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 36(SP)
SWC1	S0, 0(R2)
;Planner.c,404 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,405 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
; i end address is: 16 (R4)
J	L_plan_set_current_position28
NOP	
L_plan_set_current_position29:
;Planner.c,408 :: 		while(DMA_IsOn(1));
L_plan_set_current_position31:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__plan_set_current_position83
NOP	
J	L_plan_set_current_position32
NOP	
L__plan_set_current_position83:
J	L_plan_set_current_position31
NOP	
L_plan_set_current_position32:
;Planner.c,409 :: 		dma_printf("x:= %f\ty:= %f\tz:= %f\n",gc.position[X],gc.position[Y],gc.position[Z]);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr2_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Planner+0)
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
;Planner.c,412 :: 		}
L_end_plan_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _plan_set_current_position
_plan_reset_absolute_position:
;Planner.c,415 :: 		void plan_reset_absolute_position(){
;Planner.c,416 :: 		int i = 0;
;Planner.c,417 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_plan_reset_absolute_position33:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_reset_absolute_position85
NOP	
J	L_plan_reset_absolute_position34
NOP	
L__plan_reset_absolute_position85:
;Planner.c,418 :: 		STPS[X].steps_abs_position = 0;
SW	R0, Offset(_STPS+72)(GP)
;Planner.c,417 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Planner.c,418 :: 		STPS[X].steps_abs_position = 0;
; i end address is: 12 (R3)
J	L_plan_reset_absolute_position33
NOP	
L_plan_reset_absolute_position34:
;Planner.c,419 :: 		}
L_end_plan_reset_absolute_position:
JR	RA
NOP	
; end of _plan_reset_absolute_position
_sqrt_:
;Planner.c,436 :: 		long sqrt_(long x){
;Planner.c,442 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,443 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; q2 end address is: 12 (R3)
; xr end address is: 20 (R5)
;Planner.c,444 :: 		do
J	L_sqrt_36
NOP	
L__sqrt_44:
;Planner.c,458 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R3, R2, R0
MOVZ	R5, R4, R0
;Planner.c,444 :: 		do
L_sqrt_36:
;Planner.c,446 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_87
NOP	
J	L_sqrt_39
NOP	
L__sqrt_87:
;Planner.c,448 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,449 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,450 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_40
NOP	
L_sqrt_39:
;Planner.c,452 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,453 :: 		}
L_sqrt_40:
;Planner.c,454 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,455 :: 		if(f){
BNE	R4, R0, L__sqrt_89
NOP	
J	L__sqrt_45
NOP	
L__sqrt_89:
; f end address is: 16 (R4)
;Planner.c,456 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,457 :: 		}
J	L_sqrt_41
NOP	
L__sqrt_45:
;Planner.c,455 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,457 :: 		}
L_sqrt_41:
;Planner.c,458 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
; q2 end address is: 12 (R3)
; q2 start address is: 8 (R2)
BEQ	R2, R0, L__sqrt_90
NOP	
J	L__sqrt_44
NOP	
L__sqrt_90:
; q2 end address is: 8 (R2)
;Planner.c,459 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_91
NOP	
J	L_sqrt_42
NOP	
L__sqrt_91:
;Planner.c,460 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,461 :: 		}
L_sqrt_42:
;Planner.c,463 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,465 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
