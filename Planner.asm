_plan_init:
;Planner.c,14 :: 		void plan_init(long accel,long decel)
;Planner.c,16 :: 		int i = 0;
;Planner.c,17 :: 		for(i = 0; i < NoOfAxis; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_init0:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__plan_init48
NOP	
J	L_plan_init1
NOP	
L__plan_init48:
;Planner.c,18 :: 		STPS[i].acc = accel;
SEH	R3, R4
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R25, 0(R2)
;Planner.c,19 :: 		STPS[i].dec = decel;
SEH	R3, R4
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R26, 0(R2)
;Planner.c,17 :: 		for(i = 0; i < NoOfAxis; i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,20 :: 		}
; i end address is: 16 (R4)
J	L_plan_init0
NOP	
L_plan_init1:
;Planner.c,21 :: 		}
L_end_plan_init:
JR	RA
NOP	
; end of _plan_init
_speed_cntr_Move:
;Planner.c,36 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Planner.c,40 :: 		long abs_mmSteps = labs(mmSteps);
SW	R25, 4(SP)
JAL	_labs+0
NOP	
; abs_mmSteps start address is: 28 (R7)
MOVZ	R7, R2, R0
;Planner.c,45 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move50
NOP	
J	L_speed_cntr_Move3
NOP	
L__speed_cntr_Move50:
; abs_mmSteps end address is: 28 (R7)
;Planner.c,46 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Planner.c,47 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 2
SH	R2, 0(R3)
;Planner.c,48 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Planner.c,49 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Planner.c,51 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move4
NOP	
L_speed_cntr_Move3:
; abs_mmSteps start address is: 28 (R7)
BNE	R25, R0, L__speed_cntr_Move52
NOP	
J	L__speed_cntr_Move44
NOP	
L__speed_cntr_Move52:
ORI	R2, R0, 1
BNE	R7, R2, L__speed_cntr_Move54
NOP	
J	L__speed_cntr_Move43
NOP	
L__speed_cntr_Move54:
L__speed_cntr_Move42:
;Planner.c,57 :: 		if(STPS[axis_No].run_state != STOP)
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
BNE	R2, R0, L__speed_cntr_Move56
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move56:
;Planner.c,58 :: 		temp_speed = last_speed - speed;
LW	R2, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
SUBU	R2, R2, R26
; temp_speed start address is: 24 (R6)
MOVZ	R6, R2, R0
; temp_speed end address is: 24 (R6)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Planner.c,60 :: 		temp_speed = speed;
; temp_speed start address is: 24 (R6)
MOVZ	R6, R26, R0
; temp_speed end address is: 24 (R6)
L_speed_cntr_Move9:
;Planner.c,65 :: 		STPS[axis_No].min_delay =  A_T_x100 / temp_speed;
; temp_speed start address is: 24 (R6)
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 39
ORI	R2, R2, 55125
DIV	R2, R6
MFLO	R2
SW	R2, 0(R3)
;Planner.c,70 :: 		STPS[axis_No].step_delay = labs(T1_FREQ_148 * ((sqrt_(A_SQ / STPS[axis_No].acc))/100));
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 32
LW	R3, 0(R2)
LUI	R2, 10199
ORI	R2, R2, 21760
DIV	R2, R3
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_sqrt_+0
NOP	
ORI	R3, R0, 100
DIVU	R2, R3
MFLO	R3
ORI	R2, R0, 5281
MULTU	R2, R3
MFLO	R2
MOVZ	R25, R2, R0
JAL	_labs+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SW	R2, 0(R3)
;Planner.c,71 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 72
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Planner.c,74 :: 		STPS[axis_No].max_step_lim =(temp_speed*temp_speed)/(long)(2.0*ALPHA*(double)STPS[axis_No].acc*100.0);
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 64
MUL	R3, R6, R6
; temp_speed end address is: 24 (R6)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
MTC1	R2, S0
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
;Planner.c,81 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move57
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move57:
;Planner.c,82 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,83 :: 		}
L_speed_cntr_Move10:
;Planner.c,87 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * STPS[axis_No].dec) / (STPS[axis_No].acc + STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 60
ADDIU	R2, R6, 36
LW	R4, 0(R2)
MUL	R3, R7, R4
; abs_mmSteps end address is: 28 (R7)
ADDIU	R2, R6, 32
LW	R2, 0(R2)
ADDU	R2, R2, R4
DIV	R3, R2
MFLO	R2
SW	R2, 0(R5)
;Planner.c,90 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move58
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move58:
;Planner.c,91 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 60
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,92 :: 		}
L_speed_cntr_Move11:
;Planner.c,95 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 60
LW	R3, 0(R2)
ADDIU	R2, R4, 64
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L__speed_cntr_Move59
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move59:
;Planner.c,96 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
;Planner.c,97 :: 		}else{
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Planner.c,98 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *STPS[axis_No].acc)/STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 16
ADDIU	R2, R5, 64
LW	R3, 0(R2)
ADDIU	R2, R5, 32
LW	R2, 0(R2)
MUL	R3, R3, R2
ADDIU	R2, R5, 36
LW	R2, 0(R2)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Planner.c,99 :: 		}
L_speed_cntr_Move13:
;Planner.c,101 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move60
NOP	
J	L_speed_cntr_Move14
NOP	
L__speed_cntr_Move60:
;Planner.c,102 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
L_speed_cntr_Move14:
;Planner.c,105 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move61
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move61:
;Planner.c,106 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R27
ORI	R2, R0, 100
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
;Planner.c,107 :: 		}
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Planner.c,109 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 100
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
;Planner.c,110 :: 		}
L_speed_cntr_Move16:
;Planner.c,114 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 72
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move62
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move62:
;Planner.c,115 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R27
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
;Planner.c,116 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 3
SH	R2, 0(R3)
;Planner.c,117 :: 		}else{
J	L_speed_cntr_Move18
NOP	
L_speed_cntr_Move17:
;Planner.c,118 :: 		STPS[axis_No].step_delay = labs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 72
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R3, 12(SP)
SW	R2, 0(R3)
;Planner.c,119 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 1
SH	R2, 0(R3)
;Planner.c,120 :: 		}
L_speed_cntr_Move18:
;Planner.c,51 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move44:
L__speed_cntr_Move43:
;Planner.c,122 :: 		}
L_speed_cntr_Move4:
;Planner.c,124 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Planner.c,125 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Planner.c,126 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,127 :: 		SV.Tog                    = 0;
SH	R0, Offset(_SV+4)(GP)
;Planner.c,128 :: 		SV.running                = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Planner.c,129 :: 		last_speed                = speed;
SW	R26, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
;Planner.c,130 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,143 :: 		float r, float i, float j, float k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -144
SW	RA, 0(SP)
SW	R28, 4(SP)
LWC1	S0, 144(SP)
SWC1	S0, 144(SP)
; i start address is: 16 (R4)
LWC1	S2, 148(SP)
; j start address is: 24 (R6)
LWC1	S3, 152(SP)
; k start address is: 0 (R0)
LWC1	S0, 156(SP)
; k end address is: 0 (R0)
;Planner.c,144 :: 		char isclockwise = 0;
;Planner.c,145 :: 		float inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Planner.c,146 :: 		float position[NoOfAxis]={0.0};
ADDIU	R23, SP, 100
ADDIU	R22, R23, 24
LUI	R24, hi_addr(?ICSr_or_ijk_position_L0+0)
ORI	R24, R24, lo_addr(?ICSr_or_ijk_position_L0+0)
JAL	___CC2DW+0
NOP	
;Planner.c,147 :: 		float target[NoOfAxis]={0.0};
;Planner.c,148 :: 		float offset[NoOfAxis]={0.0};
;Planner.c,149 :: 		float x = 0.00;
;Planner.c,150 :: 		float y = 0.00;
;Planner.c,151 :: 		float h_x2_div_d = 0.00;
;Planner.c,156 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 100
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,157 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,158 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,159 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 108
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,160 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,161 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,162 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 116
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,163 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S3, 0(R2)
;Planner.c,165 :: 		if (r != 0.00) { // Arc Radius Mode
LWC1	S1, 144(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__r_or_ijk64
NOP	
J	L_r_or_ijk19
NOP	
L__r_or_ijk64:
; i end address is: 16 (R4)
; j end address is: 24 (R6)
;Planner.c,229 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 108
LH	R2, 18(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 100
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
SWC1	S3, 128(SP)
;Planner.c,231 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 20(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
SWC1	S2, 132(SP)
;Planner.c,235 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LWC1	S1, 144(SP)
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, 144(SP)
MUL.S 	S1, S1, S0
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,238 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 8(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 8(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 140(SP)
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
LWC1	S13, 132(SP)
LWC1	S12, 128(SP)
JAL	_hypot+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
LWC1	S1, 140(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 128 (R32)
MOV.S 	S16, S0
;Planner.c,240 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
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
BEQ	R3, R2, L__r_or_ijk65
NOP	
J	L__r_or_ijk45
NOP	
L__r_or_ijk65:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S16
; h_x2_div_d end address is: 128 (R32)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
MOV.S 	S3, S1
J	L_r_or_ijk20
NOP	
L__r_or_ijk45:
MOV.S 	S3, S16
L_r_or_ijk20:
;Planner.c,263 :: 		if (r < 0) {
; h_x2_div_d start address is: 24 (R6)
LWC1	S1, 144(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__r_or_ijk66
NOP	
J	L__r_or_ijk46
NOP	
L__r_or_ijk66:
;Planner.c,264 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; h_x2_div_d end address is: 24 (R6)
; h_x2_div_d start address is: 16 (R4)
MOV.S 	S2, S0
;Planner.c,265 :: 		r = -r; // Finished with r. Set to positive for mc_arc
LWC1	S1, 144(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 144(SP)
; h_x2_div_d end address is: 16 (R4)
;Planner.c,266 :: 		}
J	L_r_or_ijk21
NOP	
L__r_or_ijk46:
;Planner.c,263 :: 		if (r < 0) {
MOV.S 	S2, S3
;Planner.c,266 :: 		}
L_r_or_ijk21:
;Planner.c,269 :: 		i =  0.5*(x-(y*h_x2_div_d));
; h_x2_div_d start address is: 16 (R4)
LWC1	S0, 132(SP)
MUL.S 	S1, S0, S2
LWC1	S0, 128(SP)
SUB.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Planner.c,271 :: 		j =  0.5*(y+(x*h_x2_div_d));
LWC1	S0, 128(SP)
MUL.S 	S1, S0, S2
; h_x2_div_d end address is: 16 (R4)
LWC1	S0, 132(SP)
ADD.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Planner.c,272 :: 		} else {
J	L_r_or_ijk22
NOP	
L_r_or_ijk19:
;Planner.c,275 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
SWC1	S0, 144(SP)
;Planner.c,276 :: 		}
L_r_or_ijk22:
;Planner.c,278 :: 		isclockwise = false;
SB	R0, 124(SP)
;Planner.c,279 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk67
NOP	
J	L_r_or_ijk23
NOP	
L__r_or_ijk67:
ORI	R2, R0, 1
SB	R2, 124(SP)
L_r_or_ijk23:
;Planner.c,281 :: 		while(DMA_IsOn(1));
L_r_or_ijk24:
SH	R27, 8(SP)
SH	R26, 10(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
BNE	R2, R0, L__r_or_ijk69
NOP	
J	L_r_or_ijk25
NOP	
L__r_or_ijk69:
J	L_r_or_ijk24
NOP	
L_r_or_ijk25:
;Planner.c,284 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
ADDIU	R3, SP, 108
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
;Planner.c,283 :: 		[tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n"
ADDIU	R23, SP, 22
ADDIU	R22, R23, 77
LUI	R24, hi_addr(?ICS?lstr1_Planner+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Planner+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 22
;Planner.c,284 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
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
;Planner.c,283 :: 		[tar[X]:= %f\ttar[Y]:= %f\ttar[Z]:= %f]\n"
SW	R2, 0(SP)
;Planner.c,284 :: 		,position[X],position[Y],position[Z],target[X],target[Y],target[Z]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LH	R25, 12(SP)
LH	R26, 10(SP)
;Planner.c,288 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ADDIU	R4, SP, 116
ADDIU	R3, SP, 108
ADDIU	R2, SP, 100
;Planner.c,289 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
SH	R26, 10(SP)
SH	R25, 12(SP)
LBU	R5, 124(SP)
ADDIU	SP, SP, -12
SB	R5, 9(SP)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 8(SP)
LW	R5, Offset(_gc+20)(GP)
SW	R5, 4(SP)
;Planner.c,288 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,289 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
LWC1	S12, 156(SP)
;Planner.c,288 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,289 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
;Planner.c,288 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,289 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
LH	R26, 10(SP)
LH	R27, 8(SP)
;Planner.c,290 :: 		}
L_end_r_or_ijk:
LW	R28, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 144
JR	RA
NOP	
; end of _r_or_ijk
_sys_sync_current_position:
;Planner.c,295 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Planner.c,297 :: 		plan_set_current_position();
JAL	_plan_set_current_position+0
NOP	
;Planner.c,298 :: 		}
L_end_sys_sync_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,301 :: 		void plan_set_current_position(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Planner.c,302 :: 		int i = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Planner.c,303 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_set_current_position26:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__plan_set_current_position72
NOP	
J	L_plan_set_current_position27
NOP	
L__plan_set_current_position72:
;Planner.c,304 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
SW	R2, 16(SP)
SEH	R3, R4
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
LW	R2, 0(R2)
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LH	R4, 12(SP)
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Planner.c,303 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,304 :: 		gc.position[i] = beltsteps2mm(STPS[i].steps_abs_position,i);
; i end address is: 16 (R4)
J	L_plan_set_current_position26
NOP	
L_plan_set_current_position27:
;Planner.c,311 :: 		}
L_end_plan_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _plan_set_current_position
_plan_reset_absolute_position:
;Planner.c,314 :: 		void plan_reset_absolute_position(){
;Planner.c,315 :: 		int i = 0;
;Planner.c,316 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_plan_reset_absolute_position29:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__plan_reset_absolute_position74
NOP	
J	L_plan_reset_absolute_position30
NOP	
L__plan_reset_absolute_position74:
;Planner.c,317 :: 		STPS[X].steps_abs_position = 0;
SW	R0, Offset(_STPS+80)(GP)
;Planner.c,316 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Planner.c,317 :: 		STPS[X].steps_abs_position = 0;
; i end address is: 12 (R3)
J	L_plan_reset_absolute_position29
NOP	
L_plan_reset_absolute_position30:
;Planner.c,318 :: 		}
L_end_plan_reset_absolute_position:
JR	RA
NOP	
; end of _plan_reset_absolute_position
_sqrt_:
;Planner.c,335 :: 		unsigned long sqrt_(unsigned long x){
;Planner.c,341 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,342 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Planner.c,343 :: 		do
J	L_sqrt_32
NOP	
L__sqrt_40:
;Planner.c,357 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Planner.c,343 :: 		do
L_sqrt_32:
;Planner.c,345 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_76
NOP	
J	L_sqrt_35
NOP	
L__sqrt_76:
;Planner.c,347 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,348 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,349 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_36
NOP	
L_sqrt_35:
;Planner.c,351 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,352 :: 		}
L_sqrt_36:
;Planner.c,353 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,354 :: 		if(f){
BNE	R4, R0, L__sqrt_78
NOP	
J	L__sqrt_41
NOP	
L__sqrt_78:
; f end address is: 16 (R4)
;Planner.c,355 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,356 :: 		}
J	L_sqrt_37
NOP	
L__sqrt_41:
;Planner.c,354 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,356 :: 		}
L_sqrt_37:
;Planner.c,357 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L__sqrt_79
NOP	
J	L__sqrt_40
NOP	
L__sqrt_79:
; q2 end address is: 12 (R3)
;Planner.c,358 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_80
NOP	
J	L_sqrt_38
NOP	
L__sqrt_80:
;Planner.c,359 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,360 :: 		}
L_sqrt_38:
;Planner.c,362 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,364 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
