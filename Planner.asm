_plan_init:
;Planner.c,9 :: 		void plan_init(long accel,long decel)
;Planner.c,11 :: 		int i = 0;
;Planner.c,12 :: 		for(i = 0; i < NoOfAxis; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_plan_init0:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__plan_init41
NOP	
J	L_plan_init1
NOP	
L__plan_init41:
;Planner.c,13 :: 		STPS[i].acc = accel;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R25, 0(R2)
;Planner.c,14 :: 		STPS[i].dec = decel;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R26, 0(R2)
;Planner.c,12 :: 		for(i = 0; i < NoOfAxis; i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Planner.c,15 :: 		}
; i end address is: 16 (R4)
J	L_plan_init0
NOP	
L_plan_init1:
;Planner.c,16 :: 		}
L_end_plan_init:
JR	RA
NOP	
; end of _plan_init
_speed_cntr_Move:
;Planner.c,31 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Planner.c,36 :: 		long abs_mmSteps = abs(mmSteps);
SW	R25, 4(SP)
JAL	_abs+0
NOP	
; abs_mmSteps start address is: 28 (R7)
SEH	R7, R2
;Planner.c,40 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move43
NOP	
J	L_speed_cntr_Move3
NOP	
L__speed_cntr_Move43:
; abs_mmSteps end address is: 28 (R7)
;Planner.c,41 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Planner.c,42 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Planner.c,43 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Planner.c,44 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Planner.c,46 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move4
NOP	
L_speed_cntr_Move3:
; abs_mmSteps start address is: 28 (R7)
BNE	R25, R0, L__speed_cntr_Move45
NOP	
J	L__speed_cntr_Move36
NOP	
L__speed_cntr_Move45:
ORI	R2, R0, 1
BNE	R7, R2, L__speed_cntr_Move47
NOP	
J	L__speed_cntr_Move35
NOP	
L__speed_cntr_Move47:
L__speed_cntr_Move34:
;Planner.c,50 :: 		if(STPS[axis_No].run_state != STOP)
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__speed_cntr_Move49
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move49:
;Planner.c,51 :: 		temp_speed = last_speed - speed;
LW	R2, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
SUBU	R2, R2, R26
; temp_speed start address is: 24 (R6)
MOVZ	R6, R2, R0
; temp_speed end address is: 24 (R6)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Planner.c,53 :: 		temp_speed = speed;
; temp_speed start address is: 24 (R6)
MOVZ	R6, R26, R0
; temp_speed end address is: 24 (R6)
L_speed_cntr_Move9:
;Planner.c,58 :: 		STPS[axis_No].min_delay =  A_T_x100 / temp_speed;
; temp_speed start address is: 24 (R6)
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,63 :: 		STPS[axis_No].step_delay = abs(T1_FREQ_148 * ((sqrt_(A_SQ / STPS[axis_No].acc))/100));
SEH	R3, R27
ORI	R2, R0, 104
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
MULTU	R3, R2
MFLO	R2
SEH	R25, R2
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Planner.c,64 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 72
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Planner.c,67 :: 		STPS[axis_No].max_step_lim =(temp_speed*temp_speed)/(long)(2.0*ALPHA*(double)STPS[axis_No].acc*100.0);
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,73 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move50
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move50:
;Planner.c,74 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 64
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,75 :: 		}
L_speed_cntr_Move10:
;Planner.c,79 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * STPS[axis_No].dec) / (STPS[axis_No].acc + STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,81 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move51
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move51:
;Planner.c,82 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 60
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,83 :: 		}
L_speed_cntr_Move11:
;Planner.c,86 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 104
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
BNE	R2, R0, L__speed_cntr_Move52
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move52:
;Planner.c,87 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,88 :: 		}else{
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Planner.c,89 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *STPS[axis_No].acc)/STPS[axis_No].dec);
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,90 :: 		}
L_speed_cntr_Move13:
;Planner.c,92 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move53
NOP	
J	L_speed_cntr_Move14
NOP	
L__speed_cntr_Move53:
;Planner.c,93 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,96 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
BNE	R2, R0, L__speed_cntr_Move54
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move54:
;Planner.c,97 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,98 :: 		}
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Planner.c,100 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 104
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
;Planner.c,101 :: 		}
L_speed_cntr_Move16:
;Planner.c,106 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 104
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
BEQ	R2, R0, L__speed_cntr_Move55
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move55:
;Planner.c,107 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Planner.c,108 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Planner.c,109 :: 		}else{
J	L_speed_cntr_Move18
NOP	
L_speed_cntr_Move17:
;Planner.c,110 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 72
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Planner.c,111 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Planner.c,112 :: 		}
L_speed_cntr_Move18:
;Planner.c,46 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move36:
L__speed_cntr_Move35:
;Planner.c,114 :: 		}
L_speed_cntr_Move4:
;Planner.c,116 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Planner.c,117 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Planner.c,118 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Planner.c,119 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Planner.c,120 :: 		SV.Tog                    = 0;
SH	R0, Offset(_SV+4)(GP)
;Planner.c,121 :: 		SV.running                = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Planner.c,122 :: 		last_speed                = speed;
SW	R26, Offset(speed_cntr_Move_last_speed_L0+0)(GP)
;Planner.c,124 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_r_or_ijk:
;Planner.c,137 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 144 (R36)
LWC1	S18, 120(SP)
; i start address is: 8 (R2)
LWC1	S1, 124(SP)
; j start address is: 16 (R4)
LWC1	S2, 128(SP)
; k start address is: 0 (R0)
LWC1	S0, 132(SP)
; k end address is: 0 (R0)
;Planner.c,138 :: 		unsigned short isclockwise = 0;
;Planner.c,139 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Planner.c,143 :: 		double x = 0.00;
;Planner.c,144 :: 		double y = 0.00;
;Planner.c,145 :: 		double h_x2_div_d = 0.00;
;Planner.c,150 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 40
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Planner.c,151 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Planner.c,152 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,153 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 64
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Planner.c,154 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Planner.c,155 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Planner.c,156 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 88
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Planner.c,157 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Planner.c,159 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S18, S0
BC1F	0, L__r_or_ijk57
NOP	
J	L_r_or_ijk19
NOP	
L__r_or_ijk57:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Planner.c,223 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 64
LH	R2, 112(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 40
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 128 (R32)
MOV.S 	S16, S3
;Planner.c,225 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 114(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 136 (R34)
MOV.S 	S17, S2
;Planner.c,229 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S18
MUL.S 	S1, S0, S18
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Planner.c,232 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 20(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LH	R25, 20(SP)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 116(SP)
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
LWC1	S1, 116(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Planner.c,234 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LH	R3, Offset(_gc+2)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk58
NOP	
J	L__r_or_ijk37
NOP	
L__r_or_ijk58:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk20
NOP	
L__r_or_ijk37:
L_r_or_ijk20:
;Planner.c,257 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S18
BC1F	0, L__r_or_ijk59
NOP	
J	L__r_or_ijk38
NOP	
L__r_or_ijk59:
;Planner.c,258 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Planner.c,259 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S18
; r end address is: 144 (R36)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Planner.c,260 :: 		}
J	L_r_or_ijk21
NOP	
L__r_or_ijk38:
;Planner.c,257 :: 		if (r < 0) {
MOV.S 	S2, S18
MOV.S 	S3, S1
;Planner.c,260 :: 		}
L_r_or_ijk21:
;Planner.c,263 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Planner.c,265 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Planner.c,266 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk22
NOP	
L_r_or_ijk19:
;Planner.c,269 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Planner.c,270 :: 		}
L_r_or_ijk22:
;Planner.c,272 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Planner.c,273 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk60
NOP	
J	L__r_or_ijk39
NOP	
L__r_or_ijk60:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk23
NOP	
L__r_or_ijk39:
L_r_or_ijk23:
;Planner.c,277 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 88
ADDIU	R4, SP, 64
ADDIU	R3, SP, 40
;Planner.c,278 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
ADDIU	SP, SP, -8
SB	R6, 5(SP)
; r end address is: 0 (R0)
LBU	R6, Offset(_gc+4)(GP)
SB	R6, 4(SP)
;Planner.c,277 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R6, R0, 2
SH	R6, 2(SP)
SH	R26, 0(SP)
;Planner.c,278 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MTC1	R2, S12
;Planner.c,277 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R5, R0
MOVZ	R25, R3, R0
;Planner.c,278 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S13, S0
; isclockwise end address is: 24 (R6)
;Planner.c,277 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R4, R0
;Planner.c,278 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
;Planner.c,279 :: 		}
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _r_or_ijk
_sqrt_:
;Planner.c,294 :: 		unsigned long sqrt_(unsigned long x){
;Planner.c,300 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Planner.c,301 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Planner.c,302 :: 		do
J	L_sqrt_24
NOP	
L__sqrt_32:
;Planner.c,316 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Planner.c,302 :: 		do
L_sqrt_24:
;Planner.c,304 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L__sqrt_62
NOP	
J	L_sqrt_27
NOP	
L__sqrt_62:
;Planner.c,306 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Planner.c,307 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Planner.c,308 :: 		}
; f end address is: 16 (R4)
J	L_sqrt_28
NOP	
L_sqrt_27:
;Planner.c,310 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Planner.c,311 :: 		}
L_sqrt_28:
;Planner.c,312 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Planner.c,313 :: 		if(f){
BNE	R4, R0, L__sqrt_64
NOP	
J	L__sqrt_33
NOP	
L__sqrt_64:
; f end address is: 16 (R4)
;Planner.c,314 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Planner.c,315 :: 		}
J	L_sqrt_29
NOP	
L__sqrt_33:
;Planner.c,313 :: 		if(f){
MOVZ	R4, R5, R0
;Planner.c,315 :: 		}
L_sqrt_29:
;Planner.c,316 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L__sqrt_65
NOP	
J	L__sqrt_32
NOP	
L__sqrt_65:
; q2 end address is: 12 (R3)
;Planner.c,317 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L__sqrt_66
NOP	
J	L_sqrt_30
NOP	
L__sqrt_66:
;Planner.c,318 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Planner.c,319 :: 		}
L_sqrt_30:
;Planner.c,321 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Planner.c,323 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of _sqrt_
