_plan_init:
;Planner.c,25 :: 		void plan_init(float accel,float decel){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Planner.c,26 :: 		long i = 0;
;Planner.c,27 :: 		for(i = 0; i < NoOfAxis; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_init0:
; i start address is: 16 (R4)
SLTI	R2, R4, 4
BNE	R2, R0, L__plan_init53
NOP	
J	L_plan_init1
NOP	
L__plan_init53:
;Planner.c,29 :: 		STPS[i].acc = lround(accel);
ORI	R2, R0, 96
MULTU	R2, R4
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
SW	R2, 16(SP)
SW	R4, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_lround+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R4, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Planner.c,30 :: 		STPS[i].dec = lround(decel);
ORI	R2, R0, 96
MULTU	R2, R4
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R2, 16(SP)
SW	R4, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S13
JAL	_lround+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R4, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Planner.c,27 :: 		for(i = 0; i < NoOfAxis; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Planner.c,31 :: 		}
; i end address is: 16 (R4)
J	L_plan_init0
NOP	
L_plan_init1:
;Planner.c,32 :: 		acc = lround(accel);
SWC1	S13, 4(SP)
JAL	_lround+0
NOP	
LWC1	S13, 4(SP)
SW	R2, Offset(-1610598144)(GP)
;Planner.c,33 :: 		dec = lround(decel);
MOV.S 	S12, S13
JAL	_lround+0
NOP	
SW	R2, Offset(-1610598140)(GP)
;Planner.c,34 :: 		set_calculation_constants();
JAL	_set_calculation_constants+0
NOP	
;Planner.c,35 :: 		}
L_end_plan_init:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _plan_init
_set_calculation_constants:
;Planner.c,40 :: 		void set_calculation_constants(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Planner.c,44 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_set_calculation_constants3:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__set_calculation_constants55
NOP	
J	L_set_calculation_constants4
NOP	
L__set_calculation_constants55:
;Planner.c,46 :: 		alpha[i] = (PIx2 / (settings.steps_per_mm[i])); //step_per_mm will have M_STEP already accounted for.
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R4, R2, R3
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
DIV.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Planner.c,48 :: 		a_t_x100[i] = (alpha[i] * T1_FREQ * 100.00);
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
;Planner.c,50 :: 		a_sq[i] = lround(alpha[i] * 2 * SQ_MASK);
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
;Planner.c,52 :: 		spr_x_mstep[i] = SPRU(settings.steps_per_mm[i]);
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
;Planner.c,44 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Planner.c,53 :: 		}
; i end address is: 20 (R5)
J	L_set_calculation_constants3
NOP	
L_set_calculation_constants4:
;Planner.c,54 :: 		}
L_end_set_calculation_constants:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _set_calculation_constants
_Get_Step_Rate:
;Planner.c,58 :: 		float Get_Step_Rate(float speed,int axis){
;Planner.c,61 :: 		speed *= spr_x_mstep[axis];
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10080
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
;Planner.c,62 :: 		return speed;
;Planner.c,63 :: 		}
L_end_Get_Step_Rate:
JR	RA
NOP	
; end of _Get_Step_Rate
_speed_cntr_Move:
;Planner.c,79 :: 		void speed_cntr_Move(long mmSteps, float speed, int axis_No){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Planner.c,81 :: 		long abs_mmSteps = labs(mmSteps);
SW	R25, 4(SP)
JAL	_labs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
MOVZ	R6, R2, R0
;Planner.c,82 :: 		long n_start = 0;
; n_start start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,85 :: 		bit_true(SV.mode_complete,bit(axis_No));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(_SV+1)(GP)
OR	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Planner.c,89 :: 		speed = Get_Step_Rate(speed,axis_No);//*= spr_x_mstep[axis_No];
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_Get_Step_Rate+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
MOV.S 	S12, S0
;Planner.c,94 :: 		if(abs_mmSteps == 1){
ORI	R2, R0, 1
BEQ	R6, R2, L__speed_cntr_Move58
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move58:
; abs_mmSteps end address is: 24 (R6)
;Planner.c,95 :: 		STPS[axis_No].accel_count = -1;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Planner.c,96 :: 		STPS[axis_No].run_state = DECEL;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Planner.c,97 :: 		STPS[axis_No].step_delay = 10000;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 10000
SW	R2, 0(R3)
;Planner.c,99 :: 		STPS[axis_No].scurve_steps = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Planner.c,101 :: 		STPS[axis_No].accel_a_plus_end = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Planner.c,102 :: 		STPS[axis_No].accel_a_minus_start = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Planner.c,104 :: 		STPS[axis_No].decel_d_blendin = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
SW	R0, 0(R2)
;Planner.c,105 :: 		STPS[axis_No].decel_d_blendout = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Planner.c,106 :: 		}     // Just a short delay so main() can act on 'running'.
MOVZ	R4, R5, R0
J	L_speed_cntr_Move7
NOP	
L_speed_cntr_Move6:
;Planner.c,107 :: 		else if((mmSteps != 0)&&(abs_mmSteps != 1)){
; abs_mmSteps start address is: 24 (R6)
BNE	R25, R0, L__speed_cntr_Move60
NOP	
J	L__speed_cntr_Move47
NOP	
L__speed_cntr_Move60:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move62
NOP	
J	L__speed_cntr_Move48
NOP	
L__speed_cntr_Move62:
L__speed_cntr_Move44:
;Planner.c,110 :: 		temp_speed = speed * alpha[axis_No] * 100.0;
SEH	R2, R26
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
MUL.S 	S1, S12, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S1, S0
; temp_speed start address is: 128 (R32)
MOV.S 	S16, S1
;Planner.c,115 :: 		STPS[axis_No].min_delay =  lround(a_t_x100[axis_No] / temp_speed);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
SW	R2, 28(SP)
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
DIV.S 	S0, S0, S1
SWC1	S16, 8(SP)
SW	R5, 12(SP)
SW	R6, 16(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
MOV.S 	S12, S0
JAL	_lround+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
LW	R6, 16(SP)
LW	R5, 12(SP)
LWC1	S16, 8(SP)
LW	R3, 28(SP)
SW	R2, 0(R3)
;Planner.c,122 :: 		STPS[axis_No].step_delay = labs((long)(T1_FREQ_148 * sqrt_(a_sq[axis_No] / acc)) / 100);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 28(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R3, 0(R2)
LW	R2, Offset(-1610598144)(GP)
DIV	R3, R2
MFLO	R2
SW	R5, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_sqrt_+0
NOP	
LW	R25, 12(SP)
LW	R5, 8(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LUI	R2, 18213
ORI	R2, R2, 2560
MTC1	R2, S0
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R3, S0
ORI	R2, R0, 100
DIV	R3, R2
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_labs+0
NOP	
LW	R25, 8(SP)
LW	R3, 28(SP)
SW	R2, 0(R3)
;Planner.c,125 :: 		if(STPS[axis_No].step_delay > minSpeed){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SLTI	R2, R2, 30211
BEQ	R2, R0, L__speed_cntr_Move63
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move63:
; n_start end address is: 20 (R5)
;Planner.c,126 :: 		STPS[axis_No].StartUp_delay = minSpeed;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
ORI	R2, R0, 30210
SW	R2, 0(R3)
;Planner.c,128 :: 		max_s_limit = a_t_x100[axis_No] / (float)minSpeed;
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 18156
ORI	R2, R2, 1024
MTC1	R2, S0
DIV.S 	S0, S1, S0
;Planner.c,129 :: 		n_start = (long)((max_s_limit*max_s_limit)/((alpha[axis_No]*x20000*(float)acc)/100.00));
MUL.S 	S2, S0, S0
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 18076
ORI	R2, R2, 16384
MTC1	R2, S0
MUL.S 	S1, S1, S0
LWC1	S0, Offset(-1610598144)(GP)
CVT32.W 	S0, S0
MUL.S 	S1, S1, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
DIV.S 	S0, S2, S0
CVT36.S 	S0, S0
MFC1	R2, S0
; n_start start address is: 28 (R7)
MOVZ	R7, R2, R0
;Planner.c,131 :: 		}else
; n_start end address is: 28 (R7)
J	L_speed_cntr_Move12
NOP	
L_speed_cntr_Move11:
;Planner.c,132 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
; n_start start address is: 20 (R5)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
; n_start end address is: 20 (R5)
MOVZ	R7, R5, R0
L_speed_cntr_Move12:
;Planner.c,138 :: 		STPS[axis_No].max_step_lim = (long)((temp_speed*temp_speed)/((alpha[axis_No]*x20000*(float)acc)/100.00));
; n_start start address is: 28 (R7)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 72
MUL.S 	S2, S16, S16
; temp_speed end address is: 128 (R32)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 18076
ORI	R2, R2, 16384
MTC1	R2, S0
MUL.S 	S1, S1, S0
LWC1	S0, Offset(-1610598144)(GP)
CVT32.W 	S0, S0
MUL.S 	S1, S1, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
DIV.S 	S0, S2, S0
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, 0(R4)
;Planner.c,142 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move64
NOP	
J	L_speed_cntr_Move13
NOP	
L__speed_cntr_Move64:
;Planner.c,143 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 72
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,144 :: 		}
L_speed_cntr_Move13:
;Planner.c,148 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * dec) / (acc + dec);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 48
LW	R2, Offset(-1610598140)(GP)
MUL	R4, R6, R2
LW	R3, Offset(-1610598140)(GP)
LW	R2, Offset(-1610598144)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
SW	R2, 0(R5)
;Planner.c,149 :: 		if(STPS[axis_No].accel_lim > STPS[axis_No].max_step_lim)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 48
LW	R3, 0(R2)
ADDIU	R2, R4, 72
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__speed_cntr_Move65
NOP	
J	L_speed_cntr_Move14
NOP	
L__speed_cntr_Move65:
;Planner.c,150 :: 		STPS[axis_No].accel_lim = STPS[axis_No].max_step_lim;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ADDIU	R2, R2, 72
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move14:
;Planner.c,153 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move66
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move66:
;Planner.c,154 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,155 :: 		}
L_speed_cntr_Move15:
;Planner.c,158 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 48
LW	R3, 0(R2)
ADDIU	R2, R4, 72
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L__speed_cntr_Move67
NOP	
J	L_speed_cntr_Move16
NOP	
L__speed_cntr_Move67:
;Planner.c,159 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - abs_mmSteps;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SUBU	R2, R2, R6
SW	R2, 0(R3)
;Planner.c,160 :: 		}else{
J	L_speed_cntr_Move17
NOP	
L_speed_cntr_Move16:
;Planner.c,161 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * acc)/dec);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 72
LW	R3, 0(R2)
LW	R2, Offset(-1610598144)(GP)
MUL	R3, R3, R2
LW	R2, Offset(-1610598140)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Planner.c,162 :: 		}
L_speed_cntr_Move17:
;Planner.c,164 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move68
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move68:
;Planner.c,165 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
L_speed_cntr_Move18:
;Planner.c,168 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move69
NOP	
J	L_speed_cntr_Move19
NOP	
L__speed_cntr_Move69:
;Planner.c,169 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R26
ORI	R2, R0, 96
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
;Planner.c,170 :: 		}
J	L_speed_cntr_Move20
NOP	
L_speed_cntr_Move19:
;Planner.c,172 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R26
ORI	R2, R0, 96
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
;Planner.c,173 :: 		}
L_speed_cntr_Move20:
;Planner.c,177 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 80
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move70
NOP	
J	L_speed_cntr_Move21
NOP	
L__speed_cntr_Move70:
;Planner.c,178 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].min_delay);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 28(SP)
ADDIU	R2, R3, 20
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R3, 28(SP)
SW	R2, 0(R3)
;Planner.c,179 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,180 :: 		}else{
J	L_speed_cntr_Move22
NOP	
L_speed_cntr_Move21:
;Planner.c,181 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].StartUp_delay);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 28(SP)
ADDIU	R2, R3, 80
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R3, 28(SP)
SW	R2, 0(R3)
;Planner.c,182 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 1
SH	R2, 0(R3)
;Planner.c,183 :: 		}
L_speed_cntr_Move22:
;Planner.c,186 :: 		if(settings.s_curve_percentage > 0){
LHU	R2, Offset(_settings+74)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__speed_cntr_Move71
NOP	
J	L_speed_cntr_Move23
NOP	
L__speed_cntr_Move71:
;Planner.c,189 :: 		STPS[axis_No].scurve_steps = (STPS[axis_No].accel_lim * settings.s_curve_percentage) / 200;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
ADDIU	R2, R2, 48
LW	R3, 0(R2)
LHU	R2, Offset(_settings+74)(GP)
MUL	R3, R3, R2
ORI	R2, R0, 200
DIV	R3, R2
MFLO	R2
SW	R2, 0(R4)
;Planner.c,191 :: 		if(STPS[axis_No].scurve_steps < 2){
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SLTI	R2, R2, 2
BNE	R2, R0, L__speed_cntr_Move72
NOP	
J	L_speed_cntr_Move24
NOP	
L__speed_cntr_Move72:
;Planner.c,192 :: 		STPS[axis_No].scurve_steps = 2;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ORI	R2, R0, 2
SW	R2, 0(R3)
;Planner.c,193 :: 		}
L_speed_cntr_Move24:
;Planner.c,196 :: 		if(STPS[axis_No].scurve_steps > (STPS[axis_No].accel_lim / 2))
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 52
LW	R4, 0(R2)
ADDIU	R2, R3, 48
LW	R3, 0(R2)
ORI	R2, R0, 2
DIV	R3, R2
MFLO	R2
SLT	R2, R2, R4
BNE	R2, R0, L__speed_cntr_Move73
NOP	
J	L_speed_cntr_Move25
NOP	
L__speed_cntr_Move73:
;Planner.c,198 :: 		STPS[axis_No].scurve_steps =
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
;Planner.c,199 :: 		STPS[axis_No].accel_lim / 2;
ADDIU	R2, R2, 48
LW	R3, 0(R2)
ORI	R2, R0, 2
DIV	R3, R2
MFLO	R2
SW	R2, 0(R4)
;Planner.c,200 :: 		}
L_speed_cntr_Move25:
;Planner.c,203 :: 		STPS[axis_No].accel_a_plus_end = STPS[axis_No].scurve_steps;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 56
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SW	R2, 0(R3)
;Planner.c,205 :: 		STPS[axis_No].accel_a_minus_start = STPS[axis_No].accel_lim - STPS[axis_No].scurve_steps;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 60
ADDIU	R2, R5, 48
LW	R3, 0(R2)
ADDIU	R2, R5, 52
LW	R2, 0(R2)
SUBU	R2, R3, R2
SW	R2, 0(R4)
;Planner.c,210 :: 		STPS[axis_No].decel_d_blendout = abs_mmSteps - STPS[axis_No].scurve_steps;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SUBU	R2, R6, R2
; abs_mmSteps end address is: 24 (R6)
SW	R2, 0(R3)
;Planner.c,213 :: 		STPS[axis_No].decel_d_blendin = STPS[axis_No].decel_start + STPS[axis_No].scurve_steps;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 64
ADDIU	R2, R5, 12
LW	R3, 0(R2)
ADDIU	R2, R5, 52
LW	R2, 0(R2)
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Planner.c,214 :: 		}
L_speed_cntr_Move23:
;Planner.c,107 :: 		else if((mmSteps != 0)&&(abs_mmSteps != 1)){
MOVZ	R2, R7, R0
J	L__speed_cntr_Move46
NOP	
; n_start end address is: 28 (R7)
L__speed_cntr_Move47:
MOVZ	R2, R5, R0
L__speed_cntr_Move46:
; n_start start address is: 8 (R2)
MOVZ	R4, R2, R0
; n_start end address is: 8 (R2)
J	L__speed_cntr_Move45
NOP	
L__speed_cntr_Move48:
MOVZ	R4, R5, R0
L__speed_cntr_Move45:
;Planner.c,216 :: 		}
; n_start start address is: 16 (R4)
; n_start end address is: 16 (R4)
L_speed_cntr_Move7:
;Planner.c,218 :: 		STPS[axis_No].step_count  = 0;
; n_start start address is: 16 (R4)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Planner.c,219 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R0, 0(R2)
;Planner.c,221 :: 		STPS[axis_No].accel_count = n_start;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
SW	R4, 0(R2)
; n_start end address is: 16 (R4)
;Planner.c,274 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,287 :: 		float r, float i, float j, float k, int axis_A,int axis_B,int dir){
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
;Planner.c,288 :: 		char isclockwise = 0;
;Planner.c,290 :: 		float position[NoOfAxis]={0.0};
ADDIU	R23, SP, 48
ADDIU	R22, R23, 48
LUI	R24, hi_addr(?ICSr_or_ijk_position_L0+0)
ORI	R24, R24, lo_addr(?ICSr_or_ijk_position_L0+0)
JAL	___CC2DW+0
NOP	
;Planner.c,291 :: 		float target[NoOfAxis]={0.0};
;Planner.c,292 :: 		float offset[NoOfAxis]={0.0};
;Planner.c,293 :: 		float x = 0.00;
;Planner.c,294 :: 		float y = 0.00;
;Planner.c,295 :: 		float h_x2_div_d = 0.00;
;Planner.c,296 :: 		float speed = 0.00;
;Planner.c,301 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 48
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,302 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,303 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,304 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 64
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,305 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,306 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,307 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 80
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Planner.c,308 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,310 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S18, S0
BC1F	0, L__r_or_ijk75
NOP	
J	L_r_or_ijk26
NOP	
L__r_or_ijk75:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Planner.c,374 :: 		x = target[axis_plane_a] - position[axis_plane_a];
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
;Planner.c,376 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 44(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 136 (R34)
MOV.S 	S17, S2
;Planner.c,380 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S18
MUL.S 	S1, S0, S18
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,383 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
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
;Planner.c,385 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
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
J	L_r_or_ijk27
NOP	
L__r_or_ijk49:
MOV.S 	S1, S19
L_r_or_ijk27:
;Planner.c,408 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S18
BC1F	0, L__r_or_ijk77
NOP	
J	L__r_or_ijk50
NOP	
L__r_or_ijk77:
;Planner.c,409 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Planner.c,410 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S18
; r end address is: 144 (R36)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; h_x2_div_d end address is: 24 (R6)
; r end address is: 16 (R4)
;Planner.c,411 :: 		}
J	L_r_or_ijk28
NOP	
L__r_or_ijk50:
;Planner.c,408 :: 		if (r < 0) {
MOV.S 	S2, S18
MOV.S 	S3, S1
;Planner.c,411 :: 		}
L_r_or_ijk28:
;Planner.c,414 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Planner.c,416 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Planner.c,417 :: 		} else {
; r end address is: 16 (R4)
J	L_r_or_ijk29
NOP	
L_r_or_ijk26:
;Planner.c,420 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Planner.c,421 :: 		}
L_r_or_ijk29:
;Planner.c,423 :: 		isclockwise = 0;
; r start address is: 16 (R4)
; isclockwise start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,424 :: 		if (dir == CW) { isclockwise = 1; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk78
NOP	
J	L__r_or_ijk51
NOP	
L__r_or_ijk78:
ORI	R5, R0, 1
; isclockwise end address is: 20 (R5)
J	L_r_or_ijk30
NOP	
L__r_or_ijk51:
L_r_or_ijk30:
;Planner.c,433 :: 		speed = RPS_FROM_MMPMIN(gc.feed_rate);
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
;Planner.c,435 :: 		speed = Get_Step_Rate(speed,axis_A);
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
;Planner.c,438 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ADDIU	R4, SP, 80
ADDIU	R3, SP, 64
ADDIU	R2, SP, 48
;Planner.c,439 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -8
SB	R5, 5(SP)
; r end address is: 16 (R4)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 4(SP)
;Planner.c,438 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,439 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S12, S0
;Planner.c,438 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,439 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S13, S2
; isclockwise end address is: 20 (R5)
;Planner.c,438 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,439 :: 		speed, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
;Planner.c,440 :: 		}
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
;Planner.c,445 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,446 :: 		plan_set_current_position();
JAL	_plan_set_current_position+0
NOP	
;Planner.c,447 :: 		}
L_end_sys_sync_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,450 :: 		void plan_set_current_position(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Planner.c,451 :: 		int i = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Planner.c,452 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_set_current_position31:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_set_current_position81
NOP	
J	L_plan_set_current_position32
NOP	
L__plan_set_current_position81:
;Planner.c,453 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+32)
ORI	R2, R2, lo_addr(_gc+32)
ADDU	R2, R2, R3
SW	R2, 16(SP)
SEH	R3, R4
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 88
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Planner.c,452 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,453 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
; i end address is: 16 (R4)
J	L_plan_set_current_position31
NOP	
L_plan_set_current_position32:
;Planner.c,460 :: 		}
L_end_plan_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _plan_set_current_position
_sqrt_:
;Planner.c,477 :: 		long sqrt_(long x){
;Planner.c,483 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,484 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; q2 end address is: 12 (R3)
; xr end address is: 20 (R5)
;Planner.c,485 :: 		do
J	L_sqrt_34
NOP	
L__sqrt_42:
;Planner.c,499 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R3, R2, R0
MOVZ	R5, R4, R0
;Planner.c,485 :: 		do
L_sqrt_34:
;Planner.c,487 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_83
NOP	
J	L_sqrt_37
NOP	
L__sqrt_83:
;Planner.c,489 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,490 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,491 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_38
NOP	
L_sqrt_37:
;Planner.c,493 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,494 :: 		}
L_sqrt_38:
;Planner.c,495 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,496 :: 		if(f){
BNE	R4, R0, L__sqrt_85
NOP	
J	L__sqrt_43
NOP	
L__sqrt_85:
; f end address is: 16 (R4)
;Planner.c,497 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,498 :: 		}
J	L_sqrt_39
NOP	
L__sqrt_43:
;Planner.c,496 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,498 :: 		}
L_sqrt_39:
;Planner.c,499 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
; q2 end address is: 12 (R3)
; q2 start address is: 8 (R2)
BEQ	R2, R0, L__sqrt_86
NOP	
J	L__sqrt_42
NOP	
L__sqrt_86:
; q2 end address is: 8 (R2)
;Planner.c,500 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_87
NOP	
J	L_sqrt_40
NOP	
L__sqrt_87:
;Planner.c,501 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,502 :: 		}
L_sqrt_40:
;Planner.c,504 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,506 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
