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
BNE	R2, R0, L__plan_init44
NOP	
J	L_plan_init1
NOP	
L__plan_init44:
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
BEQ	R25, R2, L__speed_cntr_Move46
NOP	
J	L_speed_cntr_Move3
NOP	
L__speed_cntr_Move46:
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
BNE	R25, R0, L__speed_cntr_Move48
NOP	
J	L__speed_cntr_Move39
NOP	
L__speed_cntr_Move48:
ORI	R2, R0, 1
BNE	R7, R2, L__speed_cntr_Move50
NOP	
J	L__speed_cntr_Move38
NOP	
L__speed_cntr_Move50:
L__speed_cntr_Move37:
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
BNE	R2, R0, L__speed_cntr_Move52
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move52:
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
BEQ	R2, R0, L__speed_cntr_Move53
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move53:
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
BEQ	R2, R0, L__speed_cntr_Move54
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move54:
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
BNE	R2, R0, L__speed_cntr_Move55
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move55:
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
BEQ	R2, R0, L__speed_cntr_Move56
NOP	
J	L_speed_cntr_Move14
NOP	
L__speed_cntr_Move56:
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
BNE	R2, R0, L__speed_cntr_Move57
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move57:
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
BEQ	R2, R0, L__speed_cntr_Move58
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move58:
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
L__speed_cntr_Move39:
L__speed_cntr_Move38:
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
;Planner.c,143 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 144 (R36)
LWC1	S18, 76(SP)
; i start address is: 8 (R2)
LWC1	S1, 80(SP)
; j start address is: 16 (R4)
LWC1	S2, 84(SP)
; k start address is: 0 (R0)
LWC1	S0, 88(SP)
; k end address is: 0 (R0)
;Planner.c,144 :: 		unsigned short isclockwise = 0;
;Planner.c,145 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Planner.c,149 :: 		double x = 0.00;
;Planner.c,150 :: 		double y = 0.00;
;Planner.c,151 :: 		double h_x2_div_d = 0.00;
;Planner.c,156 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 44
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
ADDIU	R3, SP, 52
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
ADDIU	R3, SP, 60
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Planner.c,163 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,165 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S18, S0
BC1F	0, L__r_or_ijk60
NOP	
J	L_r_or_ijk19
NOP	
L__r_or_ijk60:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Planner.c,229 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 52
LH	R2, 68(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 44
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 128 (R32)
MOV.S 	S16, S3
;Planner.c,231 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 70(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 136 (R34)
MOV.S 	S17, S2
;Planner.c,235 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S18
MUL.S 	S1, S0, S18
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,238 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 20(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 20(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 72(SP)
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
LWC1	S1, 72(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 152 (R38)
MOV.S 	S19, S0
;Planner.c,240 :: 		if (Get_motionmode() == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
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
BEQ	R3, R2, L__r_or_ijk61
NOP	
J	L__r_or_ijk40
NOP	
L__r_or_ijk61:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S19
; h_x2_div_d end address is: 152 (R38)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk20
NOP	
L__r_or_ijk40:
MOV.S 	S1, S19
L_r_or_ijk20:
;Planner.c,263 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S18
BC1F	0, L__r_or_ijk62
NOP	
J	L__r_or_ijk41
NOP	
L__r_or_ijk62:
;Planner.c,264 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Planner.c,265 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S18
; r end address is: 144 (R36)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Planner.c,266 :: 		}
J	L_r_or_ijk21
NOP	
L__r_or_ijk41:
;Planner.c,263 :: 		if (r < 0) {
MOV.S 	S2, S18
MOV.S 	S3, S1
;Planner.c,266 :: 		}
L_r_or_ijk21:
;Planner.c,269 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Planner.c,271 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Planner.c,272 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk22
NOP	
L_r_or_ijk19:
;Planner.c,275 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
; r start address is: 8 (R2)
MOV.S 	S1, S0
; r end address is: 8 (R2)
MOV.S 	S0, S1
;Planner.c,276 :: 		}
L_r_or_ijk22:
;Planner.c,278 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,279 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk63
NOP	
J	L__r_or_ijk42
NOP	
L__r_or_ijk63:
ORI	R5, R0, 1
; isclockwise end address is: 20 (R5)
J	L_r_or_ijk23
NOP	
L__r_or_ijk42:
L_r_or_ijk23:
;Planner.c,283 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
; isclockwise start address is: 20 (R5)
ADDIU	R4, SP, 60
ADDIU	R3, SP, 52
ADDIU	R2, SP, 44
;Planner.c,284 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -12
SB	R5, 9(SP)
; r end address is: 0 (R0)
LBU	R5, Offset(_gc+2)(GP)
SB	R5, 8(SP)
LW	R5, Offset(_gc+20)(GP)
SW	R5, 4(SP)
;Planner.c,283 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R5, R0, 2
SH	R5, 2(SP)
SH	R26, 0(SP)
;Planner.c,284 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S12, S0
;Planner.c,283 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R4, R0
MOVZ	R25, R2, R0
;Planner.c,284 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
; isclockwise end address is: 20 (R5)
;Planner.c,283 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R3, R0
;Planner.c,284 :: 		gc.frequency, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 12
;Planner.c,285 :: 		}
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _r_or_ijk
_sys_sync_current_position:
;Planner.c,290 :: 		void sys_sync_current_position(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Planner.c,295 :: 		,STPS[Z].steps_abs_position);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LW	R27, Offset(_STPS+280)(GP)
;Planner.c,294 :: 		,STPS[Y].steps_abs_position
LW	R26, Offset(_STPS+180)(GP)
;Planner.c,293 :: 		gc_set_current_position(STPS[X].steps_abs_position
LW	R25, Offset(_STPS+80)(GP)
;Planner.c,295 :: 		,STPS[Z].steps_abs_position);
JAL	_gc_set_current_position+0
NOP	
;Planner.c,296 :: 		}
L_end_sys_sync_current_position:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _sys_sync_current_position
_plan_set_current_position:
;Planner.c,299 :: 		void plan_set_current_position(long x, long y, long z)
;Planner.c,304 :: 		}
L_end_plan_set_current_position:
JR	RA
NOP	
; end of _plan_set_current_position
_plan_reset_absolute_position:
;Planner.c,307 :: 		void plan_reset_absolute_position(){
;Planner.c,308 :: 		int i = 0;
;Planner.c,309 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_plan_reset_absolute_position24:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__plan_reset_absolute_position67
NOP	
J	L_plan_reset_absolute_position25
NOP	
L__plan_reset_absolute_position67:
;Planner.c,310 :: 		STPS[X].steps_abs_position = 0;
SW	R0, Offset(_STPS+80)(GP)
;Planner.c,309 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Planner.c,310 :: 		STPS[X].steps_abs_position = 0;
; i end address is: 12 (R3)
J	L_plan_reset_absolute_position24
NOP	
L_plan_reset_absolute_position25:
;Planner.c,312 :: 		}
L_end_plan_reset_absolute_position:
JR	RA
NOP	
; end of _plan_reset_absolute_position
_sqrt_:
;Planner.c,328 :: 		unsigned long sqrt_(unsigned long x){
;Planner.c,334 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,335 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Planner.c,336 :: 		do
J	L_sqrt_27
NOP	
L__sqrt_35:
;Planner.c,350 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Planner.c,336 :: 		do
L_sqrt_27:
;Planner.c,338 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_69
NOP	
J	L_sqrt_30
NOP	
L__sqrt_69:
;Planner.c,340 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,341 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,342 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_31
NOP	
L_sqrt_30:
;Planner.c,344 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,345 :: 		}
L_sqrt_31:
;Planner.c,346 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,347 :: 		if(f){
BNE	R4, R0, L__sqrt_71
NOP	
J	L__sqrt_36
NOP	
L__sqrt_71:
; f end address is: 16 (R4)
;Planner.c,348 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,349 :: 		}
J	L_sqrt_32
NOP	
L__sqrt_36:
;Planner.c,347 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,349 :: 		}
L_sqrt_32:
;Planner.c,350 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L__sqrt_72
NOP	
J	L__sqrt_35
NOP	
L__sqrt_72:
; q2 end address is: 12 (R3)
;Planner.c,351 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_73
NOP	
J	L_sqrt_33
NOP	
L__sqrt_73:
;Planner.c,352 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,353 :: 		}
L_sqrt_33:
;Planner.c,355 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,357 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
