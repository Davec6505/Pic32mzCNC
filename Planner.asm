_plan_init:
;Planner.c,22 :: 		void plan_init(float accel,float decel){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Planner.c,23 :: 		int i = 0;
;Planner.c,24 :: 		for(i = 0; i < NoOfAxis; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_init0:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_init53
NOP	
J	L_plan_init1
NOP	
L__plan_init53:
;Planner.c,25 :: 		STPS[i].acc = lround(accel);
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 12(SP)
SH	R4, 4(SP)
SWC1	S13, 8(SP)
JAL	_lround+0
NOP	
LWC1	S13, 8(SP)
LH	R4, 4(SP)
LW	R3, 12(SP)
SW	R2, 0(R3)
;Planner.c,26 :: 		STPS[i].dec = lround(decel);
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R2, 12(SP)
SH	R4, 4(SP)
MOV.S 	S12, S13
JAL	_lround+0
NOP	
LH	R4, 4(SP)
LW	R3, 12(SP)
SW	R2, 0(R3)
;Planner.c,24 :: 		for(i = 0; i < NoOfAxis; i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,27 :: 		}
; i end address is: 16 (R4)
J	L_plan_init0
NOP	
L_plan_init1:
;Planner.c,28 :: 		set_calculation_constants();
JAL	_set_calculation_constants+0
NOP	
;Planner.c,29 :: 		}
L_end_plan_init:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _plan_init
_set_calculation_constants:
;Planner.c,34 :: 		void set_calculation_constants(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Planner.c,38 :: 		for(i=0;i<NoOfAxis;i++){
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
;Planner.c,40 :: 		alpha[i] = (PIx2 / settings.steps_per_mm[i]);
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
;Planner.c,42 :: 		a_t_x100[i] = lround(alpha[i] * T1_FREQ * 100.00);
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
SW	R2, 8(SP)
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 18750
ORI	R2, R2, 48160
MTC1	R2, S0
MUL.S 	S1, S1, S0
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SH	R5, 4(SP)
MOV.S 	S12, S0
JAL	_lround+0
NOP	
LH	R5, 4(SP)
LW	R3, 8(SP)
SW	R2, 0(R3)
;Planner.c,44 :: 		a_sq[i] = lround(alpha[i] * 2 * SQ_MASK);
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
;Planner.c,38 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Planner.c,45 :: 		}
; i end address is: 20 (R5)
J	L_set_calculation_constants3
NOP	
L_set_calculation_constants4:
;Planner.c,46 :: 		}
L_end_set_calculation_constants:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _set_calculation_constants
_speed_cntr_Move:
;Planner.c,61 :: 		void speed_cntr_Move(long mmSteps, long speed, int axis_No){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Planner.c,65 :: 		long abs_mmSteps = labs(mmSteps);
SW	R25, 4(SP)
JAL	_labs+0
NOP	
; abs_mmSteps start address is: 28 (R7)
MOVZ	R7, R2, R0
;Planner.c,67 :: 		STPS[axis_No].dist =  abs_mmSteps;
SEH	R4, R27
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 48
SW	R2, 0(R3)
;Planner.c,72 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move57
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move57:
; abs_mmSteps end address is: 28 (R7)
;Planner.c,73 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 28
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Planner.c,74 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Planner.c,75 :: 		STPS[axis_No].step_delay = 10000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ORI	R2, R0, 10000
SW	R2, 0(R3)
;Planner.c,76 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Planner.c,78 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move7
NOP	
L_speed_cntr_Move6:
; abs_mmSteps start address is: 28 (R7)
BNE	R25, R0, L__speed_cntr_Move59
NOP	
J	L__speed_cntr_Move49
NOP	
L__speed_cntr_Move59:
ORI	R2, R0, 1
BNE	R7, R2, L__speed_cntr_Move61
NOP	
J	L__speed_cntr_Move48
NOP	
L__speed_cntr_Move61:
L__speed_cntr_Move47:
;Planner.c,84 :: 		if(STPS[axis_No].run_state != STOP)
SEH	R3, R27
ORI	R2, R0, 92
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
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move63:
;Planner.c,85 :: 		temp_speed = last_speed - speed;
LW	R2, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
SUBU	R2, R2, R26
; temp_speed start address is: 24 (R6)
MOVZ	R6, R2, R0
; temp_speed end address is: 24 (R6)
J	L_speed_cntr_Move12
NOP	
L_speed_cntr_Move11:
;Planner.c,87 :: 		temp_speed = speed;
; temp_speed start address is: 24 (R6)
MOVZ	R6, R26, R0
; temp_speed end address is: 24 (R6)
L_speed_cntr_Move12:
;Planner.c,92 :: 		STPS[axis_No].min_delay =  a_t_x100[axis_No] / temp_speed;
; temp_speed start address is: 24 (R6)
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R2, R27
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9792
ADDU	R2, R2, R3
LW	R2, 0(R2)
DIV	R2, R6
MFLO	R2
SW	R2, 0(R4)
;Planner.c,97 :: 		STPS[axis_No].step_delay = labs((long)T1_FREQ_148 * ((sqrt_(a_sq[axis_No] / STPS[axis_No].acc))/100));
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 12
SW	R2, 24(SP)
SEH	R2, R27
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 9856
ADDU	R2, R2, R3
LW	R3, 0(R2)
ADDIU	R2, R4, 36
LW	R2, 0(R2)
DIV	R3, R2
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_sqrt_+0
NOP	
ORI	R3, R0, 100
DIV	R2, R3
MFLO	R3
ORI	R2, R0, 5281
MUL	R2, R2, R3
MOVZ	R25, R2, R0
JAL	_labs+0
NOP	
LW	R25, 8(SP)
LW	R3, 24(SP)
SW	R2, 0(R3)
;Planner.c,98 :: 		if(STPS[axis_No].step_delay > minSpeed)
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SLTI	R2, R2, 30211
BEQ	R2, R0, L__speed_cntr_Move64
NOP	
J	L_speed_cntr_Move13
NOP	
L__speed_cntr_Move64:
;Planner.c,99 :: 		STPS[axis_No].StartUp_delay = minSpeed;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
ORI	R2, R0, 30210
SW	R2, 0(R3)
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move13:
;Planner.c,101 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move14:
;Planner.c,104 :: 		STPS[axis_No].max_step_lim =(temp_speed*temp_speed)/(lround)(2.0*alpha[axis_No]*100.0*(float)STPS[axis_No].acc);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 68
SW	R2, 28(SP)
MUL	R2, R6, R6
; temp_speed end address is: 24 (R6)
SW	R2, 24(SP)
SEH	R2, R27
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10016
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16384
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S1, S0
ADDIU	R2, R4, 36
LW	R2, 0(R2)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S1, S0
SW	R7, 8(SP)
SH	R27, 12(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
MOV.S 	S12, S0
JAL	_lround+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LH	R27, 12(SP)
LW	R7, 8(SP)
LW	R3, 24(SP)
DIV	R3, R2
MFLO	R3
LW	R2, 28(SP)
SW	R3, 0(R2)
;Planner.c,111 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move65
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move65:
;Planner.c,112 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,113 :: 		}
L_speed_cntr_Move15:
;Planner.c,117 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * STPS[axis_No].dec) / (STPS[axis_No].acc + STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 64
ADDIU	R2, R6, 40
LW	R4, 0(R2)
MUL	R3, R7, R4
; abs_mmSteps end address is: 28 (R7)
ADDIU	R2, R6, 36
LW	R2, 0(R2)
ADDU	R2, R2, R4
DIV	R3, R2
MFLO	R2
SW	R2, 0(R5)
;Planner.c,120 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move66
NOP	
J	L_speed_cntr_Move16
NOP	
L__speed_cntr_Move66:
;Planner.c,121 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,122 :: 		}
L_speed_cntr_Move16:
;Planner.c,125 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 64
LW	R3, 0(R2)
ADDIU	R2, R4, 68
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L__speed_cntr_Move67
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move67:
;Planner.c,126 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
ADDIU	R2, R2, 64
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
;Planner.c,127 :: 		}else{
J	L_speed_cntr_Move18
NOP	
L_speed_cntr_Move17:
;Planner.c,128 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * STPS[axis_No].acc)/STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 20
ADDIU	R2, R5, 68
LW	R3, 0(R2)
ADDIU	R2, R5, 36
LW	R2, 0(R2)
MUL	R3, R3, R2
ADDIU	R2, R5, 40
LW	R2, 0(R2)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Planner.c,129 :: 		}
L_speed_cntr_Move18:
;Planner.c,131 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 20
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move68
NOP	
J	L_speed_cntr_Move19
NOP	
L__speed_cntr_Move68:
;Planner.c,132 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
L_speed_cntr_Move19:
;Planner.c,135 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move69
NOP	
J	L_speed_cntr_Move20
NOP	
L__speed_cntr_Move69:
;Planner.c,136 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SUBU	R3, R25, R2
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Planner.c,137 :: 		}
J	L_speed_cntr_Move21
NOP	
L_speed_cntr_Move20:
;Planner.c,139 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 20
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
;Planner.c,140 :: 		}
L_speed_cntr_Move21:
;Planner.c,144 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 76
LW	R3, 0(R2)
ADDIU	R2, R4, 24
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move70
NOP	
J	L_speed_cntr_Move22
NOP	
L__speed_cntr_Move70:
;Planner.c,145 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].min_delay);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 12
SW	R2, 24(SP)
ADDIU	R2, R3, 24
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R3, 24(SP)
SW	R2, 0(R3)
;Planner.c,146 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,147 :: 		}else{
J	L_speed_cntr_Move23
NOP	
L_speed_cntr_Move22:
;Planner.c,148 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 12
SW	R2, 24(SP)
ADDIU	R2, R3, 76
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R3, 24(SP)
SW	R2, 0(R3)
;Planner.c,149 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 1
SH	R2, 0(R3)
;Planner.c,150 :: 		}
L_speed_cntr_Move23:
;Planner.c,78 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move49:
L__speed_cntr_Move48:
;Planner.c,152 :: 		}
L_speed_cntr_Move7:
;Planner.c,154 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Planner.c,155 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Planner.c,156 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 28
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,157 :: 		SV.Tog                    = 0;
SB	R0, Offset(_SV+1)(GP)
;Planner.c,158 :: 		SV.running                = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Planner.c,159 :: 		last_speed                = speed;
SW	R26, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
;Planner.c,183 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,196 :: 		float r, float i, float j, float k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -168
SW	RA, 0(SP)
SW	R28, 4(SP)
LWC1	S0, 168(SP)
SWC1	S0, 168(SP)
; i start address is: 16 (R4)
LWC1	S2, 172(SP)
; j start address is: 24 (R6)
LWC1	S3, 176(SP)
; k start address is: 0 (R0)
LWC1	S0, 180(SP)
; k end address is: 0 (R0)
;Planner.c,197 :: 		char isclockwise = 0;
;Planner.c,198 :: 		float inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Planner.c,199 :: 		float position[NoOfAxis]={0.0};
ADDIU	R23, SP, 100
ADDIU	R22, R23, 48
LUI	R24, hi_addr(?ICSr_or_ijk_position_L0+0)
ORI	R24, R24, lo_addr(?ICSr_or_ijk_position_L0+0)
JAL	___CC2DW+0
NOP	
;Planner.c,200 :: 		float target[NoOfAxis]={0.0};
;Planner.c,201 :: 		float offset[NoOfAxis]={0.0};
;Planner.c,202 :: 		float x = 0.00;
;Planner.c,203 :: 		float y = 0.00;
;Planner.c,204 :: 		float h_x2_div_d = 0.00;
;Planner.c,209 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 100
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,210 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,211 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,212 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 116
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,213 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,214 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,215 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 132
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,216 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S3, 0(R2)
;Planner.c,218 :: 		if (r != 0.00) { // Arc Radius Mode
LWC1	S1, 168(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__r_or_ijk72
NOP	
J	L_r_or_ijk24
NOP	
L__r_or_ijk72:
; i end address is: 16 (R4)
; j end address is: 24 (R6)
;Planner.c,282 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 116
LH	R2, 18(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 100
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
SWC1	S3, 152(SP)
;Planner.c,284 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 20(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
SWC1	S2, 156(SP)
;Planner.c,288 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LWC1	S1, 168(SP)
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, 168(SP)
MUL.S 	S1, S1, S0
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,291 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 8(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 8(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 164(SP)
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
LWC1	S13, 156(SP)
LWC1	S12, 152(SP)
JAL	_hypot+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
LWC1	S1, 164(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 128 (R32)
MOV.S 	S16, S0
;Planner.c,293 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
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
BEQ	R3, R2, L__r_or_ijk73
NOP	
J	L__r_or_ijk50
NOP	
L__r_or_ijk73:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S16
; h_x2_div_d end address is: 128 (R32)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
MOV.S 	S3, S1
J	L_r_or_ijk25
NOP	
L__r_or_ijk50:
MOV.S 	S3, S16
L_r_or_ijk25:
;Planner.c,316 :: 		if (r < 0) {
; h_x2_div_d start address is: 24 (R6)
LWC1	S1, 168(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__r_or_ijk74
NOP	
J	L__r_or_ijk51
NOP	
L__r_or_ijk74:
;Planner.c,317 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; h_x2_div_d end address is: 24 (R6)
; h_x2_div_d start address is: 16 (R4)
MOV.S 	S2, S0
;Planner.c,318 :: 		r = -r; // Finished with r. Set to positive for mc_arc
LWC1	S1, 168(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 168(SP)
; h_x2_div_d end address is: 16 (R4)
;Planner.c,319 :: 		}
J	L_r_or_ijk26
NOP	
L__r_or_ijk51:
;Planner.c,316 :: 		if (r < 0) {
MOV.S 	S2, S3
;Planner.c,319 :: 		}
L_r_or_ijk26:
;Planner.c,322 :: 		i =  0.5*(x-(y*h_x2_div_d));
; h_x2_div_d start address is: 16 (R4)
LWC1	S0, 156(SP)
MUL.S 	S1, S0, S2
LWC1	S0, 152(SP)
SUB.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Planner.c,324 :: 		j =  0.5*(y+(x*h_x2_div_d));
LWC1	S0, 152(SP)
MUL.S 	S1, S0, S2
; h_x2_div_d end address is: 16 (R4)
LWC1	S0, 156(SP)
ADD.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Planner.c,325 :: 		} else {
J	L_r_or_ijk27
NOP	
L_r_or_ijk24:
;Planner.c,328 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
SWC1	S0, 168(SP)
;Planner.c,329 :: 		}
L_r_or_ijk27:
;Planner.c,331 :: 		isclockwise = false;
SB	R0, 148(SP)
;Planner.c,332 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk75
NOP	
J	L_r_or_ijk28
NOP	
L__r_or_ijk75:
ORI	R2, R0, 1
SB	R2, 148(SP)
L_r_or_ijk28:
;Planner.c,334 :: 		while(DMA_IsOn(1));
L_r_or_ijk29:
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
BNE	R2, R0, L__r_or_ijk77
NOP	
J	L_r_or_ijk30
NOP	
L__r_or_ijk77:
J	L_r_or_ijk29
NOP	
L_r_or_ijk30:
;Planner.c,337 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
ADDIU	R3, SP, 116
ADDIU	R2, R3, 8
LWC1	S5, 0(R2)
ADDIU	R2, R3, 4
LWC1	S4, 0(R2)
LWC1	S3, 0(R3)
ADDIU	R3, SP, 100
ADDIU	R2, R3, 8
LWC1	S2, 0(R2)
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
;Planner.c,336 :: 		[pos[X]:= %f\tpos[Y]:= %f\tpos[Z]:= %f][tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n\n"
ADDIU	R23, SP, 22
ADDIU	R22, R23, 78
LUI	R24, hi_addr(?ICS?lstr1_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 22
;Planner.c,337 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
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
;Planner.c,336 :: 		[pos[X]:= %f\tpos[Y]:= %f\tpos[Z]:= %f][tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n\n"
SW	R2, 0(SP)
;Planner.c,337 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LH	R25, 12(SP)
LH	R26, 10(SP)
;Planner.c,341 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ADDIU	R4, SP, 132
ADDIU	R3, SP, 116
ADDIU	R2, SP, 100
;Planner.c,342 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
SH	R26, 10(SP)
SH	R25, 12(SP)
LBU	R5, 148(SP)
ADDIU	SP, SP, -12
SB	R5, 9(SP)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 8(SP)
LW	R5, Offset(_gc+20)(GP)
SW	R5, 4(SP)
;Planner.c,341 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,342 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
LWC1	S12, 180(SP)
;Planner.c,341 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,342 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
;Planner.c,341 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,342 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
;Planner.c,343 :: 		}
L_end_r_or_ijk:
LW	R28, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 168
JR	RA
NOP	
; end of _r_or_ijk
_sys_sync_current_position:
;Planner.c,348 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,350 :: 		plan_set_current_position();
JAL	_plan_set_current_position+0
NOP	
;Planner.c,351 :: 		}
L_end_sys_sync_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,354 :: 		void plan_set_current_position(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Planner.c,355 :: 		int i = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Planner.c,356 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_set_current_position31:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_set_current_position80
NOP	
J	L_plan_set_current_position32
NOP	
L__plan_set_current_position80:
;Planner.c,357 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
SW	R2, 16(SP)
SEH	R3, R4
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Planner.c,356 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,357 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
; i end address is: 16 (R4)
J	L_plan_set_current_position31
NOP	
L_plan_set_current_position32:
;Planner.c,364 :: 		}
L_end_plan_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _plan_set_current_position
_plan_reset_absolute_position:
;Planner.c,367 :: 		void plan_reset_absolute_position(){
;Planner.c,368 :: 		int i = 0;
;Planner.c,369 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_plan_reset_absolute_position34:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L__plan_reset_absolute_position82
NOP	
J	L_plan_reset_absolute_position35
NOP	
L__plan_reset_absolute_position82:
;Planner.c,370 :: 		STPS[X].steps_abs_position = 0;
SW	R0, Offset(_STPS+84)(GP)
;Planner.c,369 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Planner.c,370 :: 		STPS[X].steps_abs_position = 0;
; i end address is: 12 (R3)
J	L_plan_reset_absolute_position34
NOP	
L_plan_reset_absolute_position35:
;Planner.c,371 :: 		}
L_end_plan_reset_absolute_position:
JR	RA
NOP	
; end of _plan_reset_absolute_position
_sqrt_:
;Planner.c,388 :: 		long sqrt_(long x){
;Planner.c,394 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,395 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; q2 end address is: 12 (R3)
; xr end address is: 20 (R5)
;Planner.c,396 :: 		do
J	L_sqrt_37
NOP	
L__sqrt_45:
;Planner.c,410 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R3, R2, R0
MOVZ	R5, R4, R0
;Planner.c,396 :: 		do
L_sqrt_37:
;Planner.c,398 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_84
NOP	
J	L_sqrt_40
NOP	
L__sqrt_84:
;Planner.c,400 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,401 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,402 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_41
NOP	
L_sqrt_40:
;Planner.c,404 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,405 :: 		}
L_sqrt_41:
;Planner.c,406 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,407 :: 		if(f){
BNE	R4, R0, L__sqrt_86
NOP	
J	L__sqrt_46
NOP	
L__sqrt_86:
; f end address is: 16 (R4)
;Planner.c,408 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,409 :: 		}
J	L_sqrt_42
NOP	
L__sqrt_46:
;Planner.c,407 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,409 :: 		}
L_sqrt_42:
;Planner.c,410 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
; q2 end address is: 12 (R3)
; q2 start address is: 8 (R2)
BEQ	R2, R0, L__sqrt_87
NOP	
J	L__sqrt_45
NOP	
L__sqrt_87:
; q2 end address is: 8 (R2)
;Planner.c,411 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_88
NOP	
J	L_sqrt_43
NOP	
L__sqrt_88:
;Planner.c,412 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,413 :: 		}
L_sqrt_43:
;Planner.c,415 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,417 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
