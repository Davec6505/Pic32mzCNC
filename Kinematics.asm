_SetInitialSizes:
;Kinematics.c,32 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,33 :: 		int i = 0;
;Kinematics.c,35 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,37 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
<<<<<<< HEAD
SLTI	R2, R2, 2
BNE	R2, R0, L__SetInitialSizes76
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes76:
=======
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes95
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes95:
>>>>>>> patch10
;Kinematics.c,38 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 88
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
;Kinematics.c,37 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,39 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,40 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,45 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,46 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
<<<<<<< HEAD
BNE	R2, R0, L_Kinematics_Set_Axisdirection78
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection78:
=======
BNE	R2, R0, L_Kinematics_Set_Axisdirection97
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection97:
>>>>>>> patch10
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
J	L_Kinematics_Set_Axisdirection4
NOP	
L_Kinematics_Set_Axisdirection3:
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
L_Kinematics_Set_Axisdirection4:
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
; dir start address is: 16 (R4)
SEB	R4, R2
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
;Kinematics.c,47 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,48 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,49 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,50 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,51 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,52 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,53 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,54 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,55 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,56 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,57 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,58 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,59 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,60 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,61 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
<<<<<<< HEAD
BNE	R2, R0, L_Kinematics_Set_Axisdirection80
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection80:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection82
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection82:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection84
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection84:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection86
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection86:
=======
BNE	R2, R0, L_Kinematics_Set_Axisdirection99
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection99:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection101
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection101:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection103
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection103:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection105
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection105:
>>>>>>> patch10
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,62 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,76 :: 		void SingleAxisStep(float newxyz,float speed,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,77 :: 		long  absxyz = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Kinematics.c,78 :: 		long  tempA  = 0;
;Kinematics.c,79 :: 		int   dir    = 0;
;Kinematics.c,82 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,91 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__SingleAxisStep88
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep88:
;Kinematics.c,82 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SEH	R25, R26
=======
BEQ	R3, R2, L__SingleAxisStep107
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep107:
;Kinematics.c,93 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
>>>>>>> patch10
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
;Kinematics.c,96 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,97 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep108
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep108:
; tempA end address is: 12 (R3)
;Kinematics.c,98 :: 		SV.mode_complete = 1;
ORI	R3, R0, 1
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,99 :: 		return;
J	L_end_SingleAxisStep
NOP	
;Kinematics.c,100 :: 		}
L_SingleAxisStep13:
;Kinematics.c,101 :: 		}else{
; tempA start address is: 12 (R3)
MOVZ	R2, R3, R0
; tempA end address is: 12 (R3)
J	L_SingleAxisStep14
NOP	
L_SingleAxisStep12:
;Kinematics.c,102 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
; tempA end address is: 12 (R3)
MOVZ	R2, R3, R0
;Kinematics.c,103 :: 		}
L_SingleAxisStep14:
;Kinematics.c,105 :: 		SingleAxisStart(tempA,speed,axis_No);
; tempA start address is: 8 (R2)
MOV.S 	S12, S13
SEH	R26, R25
MOVZ	R25, R2, R0
; tempA end address is: 8 (R2)
JAL	Kinematics_SingleAxisStart+0
NOP	
;Kinematics.c,107 :: 		}
L_end_SingleAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
Kinematics_SingleAxisStart:
;Kinematics.c,109 :: 		static void SingleAxisStart(long dist,float speed,int axis_No){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,110 :: 		long speed_ = 0;
SW	R25, 4(SP)
;Kinematics.c,113 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,114 :: 		speed_cntr_Move(dist , speed, axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,119 :: 		Set_Axisdirection(dist,axis_No);
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,120 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
<<<<<<< HEAD
ADDIU	R3, R2, 96
SLTI	R2, R5, 0
BNE	R2, R0, L__SingleAxisStep89
=======
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart110
>>>>>>> patch10
NOP	
J	L_Kinematics_SingleAxisStart15
NOP	
<<<<<<< HEAD
L__SingleAxisStep89:
; ?FLOC___SingleAxisStep?T46 start address is: 16 (R4)
=======
L_Kinematics_SingleAxisStart110:
; ?FLOC__Kinematics_SingleAxisStart?T49 start address is: 16 (R4)
>>>>>>> patch10
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T49 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart16
NOP	
L_Kinematics_SingleAxisStart15:
; ?FLOC__Kinematics_SingleAxisStart?T49 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T49 end address is: 16 (R4)
L_Kinematics_SingleAxisStart16:
; ?FLOC__Kinematics_SingleAxisStart?T49 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T49 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,121 :: 		SV.Single_Dual = 0;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 5, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,122 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Kinematics.c,123 :: 		STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R2, 20(SP)
JAL	_labs+0
NOP	
SEH	R4, R26
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 52
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 20(SP)
SW	R3, 0(R2)
;Kinematics.c,124 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,125 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R25, 0(R2)
;Kinematics.c,127 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,128 :: 		}
L_end_SingleAxisStart:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,133 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,138 :: 		speed = RPM_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S14, S0
MOV.S 	S14, S0
;Kinematics.c,141 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__DualAxisStep91
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep91:
;Kinematics.c,126 :: 		tempA = belt_steps(axis_a,axisA);//ulong2flt( STPS[axisA].steps_abs_position);
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
SW	R2, 20(SP)
;Kinematics.c,127 :: 		tempB = belt_steps(axis_b,axisB);//ulong2flt( STPS[axisB].steps_abs_position);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,129 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R4, 0(R3)
LW	R3, 20(SP)
SUBU	R3, R3, R4
SW	R3, 20(SP)
;Kinematics.c,130 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 24(SP)
;Kinematics.c,131 :: 		}else{
=======
BEQ	R3, R2, L__DualAxisStep112
NOP	
>>>>>>> patch10
J	L_DualAxisStep17
NOP	
L__DualAxisStep112:
;Kinematics.c,143 :: 		tempA = belt_steps(axis_a,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,144 :: 		tempB = belt_steps(axis_b,axisB);
SW	R5, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S14, 12(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S14, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R5, 4(SP)
;Kinematics.c,155 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R3, R5, R3
; tempA end address is: 20 (R5)
; tempA start address is: 24 (R6)
MOVZ	R6, R3, R0
;Kinematics.c,156 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempB start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,163 :: 		}else{
; tempB end address is: 20 (R5)
; tempA end address is: 24 (R6)
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
;Kinematics.c,164 :: 		tempA = belt_steps(axis_a,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,165 :: 		tempB = belt_steps(axis_b,axisB);
SW	R3, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S14, 12(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S14, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R3, 4(SP)
; tempB start address is: 20 (R5)
MOVZ	R5, R2, R0
; tempA end address is: 12 (R3)
; tempB end address is: 20 (R5)
MOVZ	R6, R3, R0
;Kinematics.c,166 :: 		}
L_DualAxisStep18:
;Kinematics.c,167 :: 		SV.over = 0;
; tempB start address is: 20 (R5)
; tempA start address is: 24 (R6)
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,168 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+16)(GP)
;Kinematics.c,171 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,172 :: 		Single_Axis_Enable(axisA);
SW	R6, 4(SP)
SW	R5, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S14, 16(SP)
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S14, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,173 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S14, 16(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S14, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R5, 8(SP)
LW	R6, 4(SP)
;Kinematics.c,177 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__DualAxisStep92
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep92:
;Kinematics.c,146 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,147 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,148 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,149 :: 		}else{
=======
BEQ	R2, R0, L__DualAxisStep113
NOP	
>>>>>>> patch10
J	L_DualAxisStep19
NOP	
L__DualAxisStep113:
;Kinematics.c,178 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+32)(GP)
<<<<<<< HEAD
;Kinematics.c,153 :: 		}
L_DualAxisStep19:
;Kinematics.c,156 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,157 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep93
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep93:
; ?FLOC___DualAxisStep?T104 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T104 end address is: 24 (R6)
J	L_DualAxisStep21
NOP	
=======
;Kinematics.c,179 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,180 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,181 :: 		}else{
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
;Kinematics.c,182 :: 		SV.prevA = 0;//tempA;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,183 :: 		SV.prevB = 0;//tempB;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,184 :: 		SV.prevC = 0;//tempC;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,185 :: 		}
>>>>>>> patch10
L_DualAxisStep20:
;Kinematics.c,188 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SEH	R26, R25
MOVZ	R25, R6, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,189 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
<<<<<<< HEAD
ADDIU	R3, R2, 96
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep94
=======
ADDIU	R3, R2, 2
SLTI	R2, R6, 0
BNE	R2, R0, L__DualAxisStep114
>>>>>>> patch10
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep114:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
J	L_DualAxisStep22
NOP	
<<<<<<< HEAD
L__DualAxisStep94:
; ?FLOC___DualAxisStep?T112 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T112 end address is: 24 (R6)
J	L_DualAxisStep23
NOP	
=======
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
>>>>>>> patch10
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,190 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,191 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R5, 0
BNE	R2, R0, L__DualAxisStep115
NOP	
<<<<<<< HEAD
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,171 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep95
=======
J	L_DualAxisStep23
>>>>>>> patch10
NOP	
L__DualAxisStep115:
; ?FLOC___DualAxisStep?T120 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T120 end address is: 16 (R4)
J	L_DualAxisStep24
NOP	
<<<<<<< HEAD
L__DualAxisStep95:
;Kinematics.c,172 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep96
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep96:
;Kinematics.c,173 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
L_DualAxisStep25:
;Kinematics.c,175 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,176 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,177 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,178 :: 		}
J	L_DualAxisStep26
NOP	
L_DualAxisStep24:
;Kinematics.c,180 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep97
=======
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T120 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T120 end address is: 16 (R4)
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T120 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T120 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,194 :: 		SV.dA   = tempA;// - SV.prevA;
SW	R6, Offset(_SV+20)(GP)
;Kinematics.c,195 :: 		SV.dB   = tempB;// - SV.prevB;
SW	R5, Offset(_SV+24)(GP)
;Kinematics.c,196 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 20(SP)
SW	R2, Offset(_SV+28)(GP)
;Kinematics.c,199 :: 		SV.dA = labs(SV.dA);
SH	R25, 4(SP)
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
>>>>>>> patch10
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,200 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
<<<<<<< HEAD
L__DualAxisStep97:
;Kinematics.c,181 :: 		speed_cntr_Move(tempB,speed,axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SW	R27, 12(SP)
LW	R25, 24(SP)
SEH	R27, R26
LW	R26, 12(SP)
=======
LH	R25, 4(SP)
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,208 :: 		if(SV.dA == 0 && SV.dB == 0){
LW	R2, Offset(_SV+20)(GP)
BEQ	R2, R0, L__DualAxisStep116
NOP	
J	L__DualAxisStep81
NOP	
L__DualAxisStep116:
LW	R2, Offset(_SV+24)(GP)
BEQ	R2, R0, L__DualAxisStep117
NOP	
J	L__DualAxisStep80
NOP	
L__DualAxisStep117:
; tempB end address is: 20 (R5)
; tempA end address is: 24 (R6)
L__DualAxisStep79:
;Kinematics.c,209 :: 		SV.mode_complete = 1; //set this to respond with ok
ORI	R3, R0, 1
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,210 :: 		return;
J	L_end_DualAxisStep
NOP	
;Kinematics.c,208 :: 		if(SV.dA == 0 && SV.dB == 0){
L__DualAxisStep81:
; tempA start address is: 24 (R6)
; tempB start address is: 20 (R5)
L__DualAxisStep80:
;Kinematics.c,213 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep28
NOP	
L__DualAxisStep118:
;Kinematics.c,215 :: 		speed_cntr_Move(tempA,speed,axisA);
SW	R6, 4(SP)
SW	R5, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R26, R25
MOV.S 	S12, S14
MOVZ	R25, R6, R0
>>>>>>> patch10
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R5, 8(SP)
LW	R6, 4(SP)
;Kinematics.c,217 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,218 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 28
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,221 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,222 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,223 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,224 :: 		}else{
J	L_DualAxisStep29
NOP	
L_DualAxisStep28:
;Kinematics.c,226 :: 		speed_cntr_Move(tempB,speed,axisB);
SW	R6, 4(SP)
SW	R5, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
MOV.S 	S12, S14
MOVZ	R25, R5, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R5, 8(SP)
LW	R6, 4(SP)
;Kinematics.c,228 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,229 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 28
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,232 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,233 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,234 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,235 :: 		}
L_DualAxisStep29:
;Kinematics.c,237 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,238 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,239 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R6, 0(R2)
; tempA end address is: 24 (R6)
;Kinematics.c,240 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R5, 0(R2)
; tempB end address is: 20 (R5)
;Kinematics.c,242 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,244 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
<<<<<<< HEAD
;Kinematics.c,238 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -352
SW	RA, 0(SP)
LH	R2, 352(SP)
SH	R2, 352(SP)
LH	R2, 354(SP)
SH	R2, 354(SP)
LW	R2, 356(SP)
SW	R2, 356(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 360(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 361(SP)
;Kinematics.c,240 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 32(SP)
;Kinematics.c,241 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
LH	R2, 352(SP)
=======
;Kinematics.c,280 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
; axis_1 start address is: 20 (R5)
LH	R5, 80(SP)
; axis_linear start address is: 24 (R6)
LH	R6, 82(SP)
; invert_feed_rate start address is: 32 (R8)
LBU	R8, 84(SP)
; isclockwise start address is: 36 (R9)
LBU	R9, 85(SP)
;Kinematics.c,281 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 68
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,286 :: 		int count = 0;
; count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Kinematics.c,287 :: 		char limit_error = 0;
;Kinematics.c,289 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
>>>>>>> patch10
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
<<<<<<< HEAD
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 36(SP)
;Kinematics.c,242 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 354(SP)
=======
LWC1	S4, 0(R2)
ADD.S 	S3, S0, S4
; center_axis0 start address is: 88 (R22)
MOV.S 	S11, S3
;Kinematics.c,290 :: 		center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R5
>>>>>>> patch10
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
<<<<<<< HEAD
SUB.S 	S0, S1, S0
; linear_travel start address is: 192 (R48)
MOV.S 	S24, S0
;Kinematics.c,243 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 40(SP)
;Kinematics.c,244 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 44(SP)
;Kinematics.c,245 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,246 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,247 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,248 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,249 :: 		float angular_travel          = 0.00;
;Kinematics.c,250 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,251 :: 		float rads                    = 0.00;
;Kinematics.c,252 :: 		long  segments                = 0;
;Kinematics.c,253 :: 		float cos_T                   = 0.00;
;Kinematics.c,254 :: 		float sin_T                   = 0.00;
;Kinematics.c,260 :: 		long i                         = 0;
;Kinematics.c,261 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 320(SP)
ORI	R30, R0, 3
SB	R30, 322(SP)
MOVZ	R30, R0, R0
SB	R30, 323(SP)
;Kinematics.c,262 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,263 :: 		char limit_error = 0;
;Kinematics.c,265 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 48
LH	R2, 354(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,270 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 40(SP)
MUL.S 	S1, S0, S3
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S4
ADD.S 	S2, S1, S0
LWC1	S0, 40(SP)
MUL.S 	S1, S0, S4
; rt_axis1 end address is: 32 (R8)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S3
; rt_axis0 end address is: 24 (R6)
SUB.S 	S0, S1, S0
SWC1	S12, 4(SP)
=======
ADDU	R2, R27, R3
LWC1	S2, 0(R2)
ADD.S 	S1, S0, S2
; center_axis1 start address is: 80 (R20)
MOV.S 	S10, S1
;Kinematics.c,291 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
; r_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,292 :: 		r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
; r_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,293 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,294 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S1
; rt_axis1 start address is: 56 (R14)
MOV.S 	S7, S0
;Kinematics.c,295 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
SUB.S 	S0, S0, S1
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,297 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 68
ADDU	R2, R2, R3
SWC1	S1, 0(R2)
;Kinematics.c,304 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
MUL.S 	S1, S4, S7
MUL.S 	S0, S5, S6
SUB.S 	S2, S1, S0
;Kinematics.c,305 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
MUL.S 	S1, S4, S6
; rt_axis0 end address is: 48 (R12)
MUL.S 	S0, S5, S7
; rt_axis1 end address is: 56 (R14)
ADD.S 	S0, S1, S0
;Kinematics.c,313 :: 		angular_travel = atan2(y,x);
SW	R26, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
>>>>>>> patch10
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
<<<<<<< HEAD
LWC1	S12, 4(SP)
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,273 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc100
NOP	
J	L__mc_arc74
NOP	
L__mc_arc100:
; isclockwise end address is: 28 (R7)
;Kinematics.c,275 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc101
NOP	
J	L_mc_arc29
NOP	
L__mc_arc101:
;Kinematics.c,276 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc30
NOP	
L_mc_arc29:
;Kinematics.c,278 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc102
NOP	
J	L__mc_arc73
NOP	
L__mc_arc102:
;Kinematics.c,279 :: 		angular_travel += 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
=======
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R26, 4(SP)
>>>>>>> patch10
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,316 :: 		if(isclockwise > 0) {
ANDI	R2, R9, 255
; isclockwise end address is: 36 (R9)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc120
NOP	
J	L_mc_arc30
NOP	
L__mc_arc120:
;Kinematics.c,317 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc121
NOP	
J	L__mc_arc85
NOP	
L__mc_arc121:
;Kinematics.c,318 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
SUB.S 	S0, S1, S0
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
<<<<<<< HEAD
MOV.S 	S4, S1
J	L_mc_arc31
NOP	
L__mc_arc73:
;Kinematics.c,278 :: 		if(angular_travel <= 0)
;Kinematics.c,279 :: 		angular_travel += 2*M_PI;
L_mc_arc31:
;Kinematics.c,280 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc30:
;Kinematics.c,281 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S21, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc28
NOP	
L__mc_arc74:
;Kinematics.c,273 :: 		if(isclockwise) {
MOV.S 	S21, S4
;Kinematics.c,281 :: 		}
L_mc_arc28:
;Kinematics.c,284 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 168 (R42)
SWC1	S12, 4(SP)
MOV.S 	S12, S24
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S21, S12
=======
MOV.S 	S6, S1
J	L_mc_arc31
NOP	
L__mc_arc85:
;Kinematics.c,317 :: 		if (angular_travel >= 0)
MOV.S 	S6, S1
;Kinematics.c,318 :: 		angular_travel -= PIx2;
L_mc_arc31:
;Kinematics.c,319 :: 		}else {
; angular_travel start address is: 48 (R12)
; angular_travel end address is: 48 (R12)
J	L_mc_arc32
NOP	
L_mc_arc30:
;Kinematics.c,320 :: 		if(angular_travel <= 0)
; angular_travel start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc122
NOP	
J	L__mc_arc86
NOP	
L__mc_arc122:
;Kinematics.c,321 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
ADD.S 	S0, S1, S0
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc33
NOP	
L__mc_arc86:
;Kinematics.c,320 :: 		if(angular_travel <= 0)
MOV.S 	S6, S1
;Kinematics.c,321 :: 		angular_travel += PIx2;
L_mc_arc33:
;Kinematics.c,322 :: 		}
; angular_travel start address is: 48 (R12)
; angular_travel end address is: 48 (R12)
L_mc_arc32:
;Kinematics.c,341 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 48 (R12)
SWC1	S12, 4(SP)
MOV.S 	S12, S3
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S6, S13
>>>>>>> patch10
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
<<<<<<< HEAD
SWC1	S0, 332(SP)
;Kinematics.c,285 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc103
=======
; mm_of_travel start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,342 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc123
>>>>>>> patch10
NOP	
J	L_mc_arc34
NOP	
<<<<<<< HEAD
L__mc_arc103:
; invert_feed_rate end address is: 24 (R6)
; angular_travel end address is: 168 (R42)
; linear_travel end address is: 192 (R48)
J	L_end_mc_arc
NOP	
L_mc_arc32:
;Kinematics.c,287 :: 		segments = (long)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; linear_travel start address is: 192 (R48)
; angular_travel start address is: 168 (R42)
; invert_feed_rate start address is: 24 (R6)
LWC1	S1, 332(SP)
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S1, S0
=======
L__mc_arc123:
; invert_feed_rate end address is: 32 (R8)
; r_axis1 end address is: 40 (R10)
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 48 (R12)
; mm_of_travel end address is: 16 (R4)
; count end address is: 28 (R7)
; r_axis0 end address is: 32 (R8)
; axis_1 end address is: 20 (R5)
; axis_linear end address is: 24 (R6)
; center_axis0 end address is: 88 (R22)
; center_axis1 end address is: 80 (R20)
J	L_end_mc_arc
NOP	
L_mc_arc34:
;Kinematics.c,344 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
; center_axis1 start address is: 80 (R20)
; center_axis0 start address is: 88 (R22)
; axis_linear start address is: 24 (R6)
; axis_1 start address is: 20 (R5)
; r_axis0 start address is: 32 (R8)
; count start address is: 28 (R7)
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 48 (R12)
; linear_travel start address is: 24 (R6)
; r_axis1 start address is: 40 (R10)
; invert_feed_rate start address is: 32 (R8)
LWC1	S0, Offset(_settings+36)(GP)
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
>>>>>>> patch10
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
<<<<<<< HEAD
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, 336(SP)
;Kinematics.c,292 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc105
NOP	
J	L_mc_arc33
NOP	
L__mc_arc105:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,293 :: 		feed_rate *= segments;
LW	R3, 336(SP)
LW	R2, 356(SP)
MUL	R2, R2, R3
SW	R2, 356(SP)
L_mc_arc33:
;Kinematics.c,296 :: 		theta_per_segment = angular_travel/(float)segments;
LWC1	S0, 336(SP)
CVT32.W 	S0, S0
DIV.S 	S2, S21, S0
SWC1	S2, 324(SP)
;Kinematics.c,301 :: 		linear_per_segment = linear_travel/(float)segments;
DIV.S 	S0, S24, S0
SWC1	S0, 328(SP)
;Kinematics.c,304 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
=======
; segments start address is: 72 (R18)
MOV.S 	S9, S0
;Kinematics.c,349 :: 		if (invert_feed_rate)
BNE	R8, R0, L__mc_arc125
NOP	
J	L_mc_arc35
NOP	
L__mc_arc125:
; invert_feed_rate end address is: 32 (R8)
;Kinematics.c,350 :: 		feed_rate *= segments;
MUL.S 	S0, S12, S9
MOV.S 	S12, S0
L_mc_arc35:
;Kinematics.c,353 :: 		theta_per_segment = angular_travel/segments;
DIV.S 	S2, S6, S9
; angular_travel end address is: 48 (R12)
; theta_per_segment start address is: 64 (R16)
MOV.S 	S8, S2
;Kinematics.c,358 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S3, S9
; linear_travel end address is: 24 (R6)
; linear_per_segment start address is: 56 (R14)
MOV.S 	S7, S0
;Kinematics.c,361 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
>>>>>>> patch10
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
<<<<<<< HEAD
SWC1	S0, 340(SP)
;Kinematics.c,305 :: 		sin_T = theta_per_segment;
SWC1	S2, 344(SP)
;Kinematics.c,307 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 48
=======
; cos_T start address is: 136 (R34)
MOV.S 	S17, S0
;Kinematics.c,362 :: 		sin_T = theta_per_segment;
; sin_T start address is: 128 (R32)
MOV.S 	S16, S2
;Kinematics.c,365 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 68
>>>>>>> patch10
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
<<<<<<< HEAD
;Kinematics.c,308 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 352(SP)
=======
;Kinematics.c,366 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R5
>>>>>>> patch10
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,367 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
<<<<<<< HEAD
;Kinematics.c,310 :: 		i = 0;
SW	R0, 348(SP)
; angular_travel end address is: 168 (R42)
; linear_travel end address is: 192 (R48)
;Kinematics.c,313 :: 		while(DMA_IsOn(1));
L_mc_arc34:
; angular_travel start address is: 168 (R42)
; linear_travel start address is: 192 (R48)
SWC1	S24, 4(SP)
SWC1	S21, 8(SP)
SH	R28, 12(SP)
SW	R27, 16(SP)
SW	R26, 20(SP)
SW	R25, 24(SP)
SWC1	S12, 28(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 28(SP)
LW	R25, 24(SP)
LW	R26, 20(SP)
LW	R27, 16(SP)
LH	R28, 12(SP)
LWC1	S21, 8(SP)
LWC1	S24, 4(SP)
BNE	R2, R0, L__mc_arc107
=======
;Kinematics.c,381 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
; i start address is: 0 (R0)
MTC1	R2, S0
; r_axis1 end address is: 40 (R10)
; i end address is: 0 (R0)
; count end address is: 28 (R7)
; r_axis0 end address is: 32 (R8)
; axis_1 end address is: 20 (R5)
; axis_linear end address is: 24 (R6)
; center_axis0 end address is: 88 (R22)
; center_axis1 end address is: 80 (R20)
; segments end address is: 72 (R18)
; theta_per_segment end address is: 64 (R16)
; linear_per_segment end address is: 56 (R14)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
MOV.S 	S3, S5
MOV.S 	S5, S0
SEH	R4, R7
L_mc_arc36:
; i start address is: 40 (R10)
; sin_T start address is: 128 (R32)
; cos_T start address is: 136 (R34)
; linear_per_segment start address is: 56 (R14)
; theta_per_segment start address is: 64 (R16)
; segments start address is: 72 (R18)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
; center_axis1 start address is: 80 (R20)
; center_axis0 start address is: 88 (R22)
; count start address is: 16 (R4)
; axis_linear start address is: 24 (R6)
; axis_1 start address is: 20 (R5)
C.LE.S 	0, S9, S5
BC1F	0, L__mc_arc126
>>>>>>> patch10
NOP	
J	L_mc_arc37
NOP	
<<<<<<< HEAD
L__mc_arc107:
J	L_mc_arc34
NOP	
L_mc_arc35:
;Kinematics.c,316 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
ADDIU	R23, SP, 68
ADDIU	R22, R23, 145
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 68
;Kinematics.c,318 :: 		,linear_travel,linear_per_segment,theta_per_segment,gc.frequency);
LW	R2, Offset(_gc+20)(GP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -44
SW	R2, 40(SP)
LW	R2, 368(SP)
SW	R2, 36(SP)
LW	R2, 372(SP)
SW	R2, 32(SP)
SWC1	S24, 28(SP)
; linear_travel end address is: 192 (R48)
;Kinematics.c,317 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel
LW	R2, 376(SP)
SW	R2, 24(SP)
SWC1	S21, 20(SP)
; angular_travel end address is: 168 (R42)
LW	R2, 380(SP)
SW	R2, 16(SP)
SWC1	S12, 12(SP)
LW	R2, 388(SP)
SW	R2, 8(SP)
LW	R2, 384(SP)
SW	R2, 4(SP)
;Kinematics.c,316 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
SW	R3, 0(SP)
;Kinematics.c,318 :: 		,linear_travel,linear_per_segment,theta_per_segment,gc.frequency);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 44
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,321 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc36:
LW	R3, 336(SP)
LW	R2, 348(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc108
NOP	
J	L_mc_arc37
NOP	
L__mc_arc108:
;Kinematics.c,323 :: 		if (count < n_arc_correction) {
LBU	R3, 322(SP)
LH	R2, 320(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc109
NOP	
J	L_mc_arc38
NOP	
L__mc_arc109:
;Kinematics.c,325 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 344(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 340(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,326 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 340(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 344(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 40(SP)
;Kinematics.c,327 :: 		r_axis1 = r_axisi;
SWC1	S3, 44(SP)
;Kinematics.c,328 :: 		count++;
LH	R2, 320(SP)
ADDIU	R2, R2, 1
SH	R2, 320(SP)
;Kinematics.c,329 :: 		} else {
J	L_mc_arc39
NOP	
L_mc_arc38:
;Kinematics.c,332 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S0, 348(SP)
CVT32.W 	S1, S0
LWC1	S0, 324(SP)
MUL.S 	S0, S1, S0
=======
L__mc_arc126:
;Kinematics.c,384 :: 		if (count < settings.n_arc_correction) {
SEH	R3, R4
LHU	R2, Offset(_settings+48)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__mc_arc127
NOP	
J	L_mc_arc39
NOP	
L__mc_arc127:
;Kinematics.c,386 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
MUL.S 	S1, S4, S16
MUL.S 	S0, S3, S17
ADD.S 	S2, S1, S0
;Kinematics.c,387 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
MUL.S 	S1, S4, S17
; r_axis0 end address is: 32 (R8)
MUL.S 	S0, S3, S16
; r_axis1 end address is: 24 (R6)
SUB.S 	S0, S1, S0
; r_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,388 :: 		r_axis1 = r_axisi;
; r_axis1 start address is: 16 (R4)
;Kinematics.c,389 :: 		count++;
ADDIU	R2, R4, 1
; count end address is: 16 (R4)
; count start address is: 28 (R7)
SEH	R7, R2
;Kinematics.c,390 :: 		} else {
; count end address is: 28 (R7)
; r_axis1 end address is: 16 (R4)
; r_axis0 end address is: 24 (R6)
J	L_mc_arc40
NOP	
L_mc_arc39:
;Kinematics.c,393 :: 		cos_Ti = cos(i*theta_per_segment);
MUL.S 	S0, S5, S8
>>>>>>> patch10
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
<<<<<<< HEAD
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,333 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S0, 348(SP)
CVT32.W 	S1, S0
LWC1	S0, 324(SP)
MUL.S 	S0, S1, S0
=======
; cos_Ti start address is: 112 (R28)
MOV.S 	S14, S0
;Kinematics.c,394 :: 		sin_Ti = sin(i*theta_per_segment);
MUL.S 	S0, S5, S8
>>>>>>> patch10
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,395 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
<<<<<<< HEAD
MUL.S 	S3, S1, S5
LH	R2, 352(SP)
=======
MUL.S 	S3, S1, S14
SEH	R2, R5
>>>>>>> patch10
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
<<<<<<< HEAD
SWC1	S1, 40(SP)
;Kinematics.c,335 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
=======
; r_axis0 start address is: 24 (R6)
MOV.S 	S3, S1
;Kinematics.c,396 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
>>>>>>> patch10
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
<<<<<<< HEAD
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 44(SP)
;Kinematics.c,336 :: 		count = 0;
SH	R0, 320(SP)
;Kinematics.c,337 :: 		}
L_mc_arc39:
;Kinematics.c,340 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 48
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,341 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 44(SP)
LWC1	S0, 36(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,342 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 354(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 328(SP)
ADD.S 	S0, S1, S0
=======
MUL.S 	S0, S2, S14
; cos_Ti end address is: 112 (R28)
SUB.S 	S0, S1, S0
; r_axis1 start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,397 :: 		count = 0;
; count start address is: 28 (R7)
MOVZ	R7, R0, R0
; count end address is: 28 (R7)
; r_axis1 end address is: 16 (R4)
; r_axis0 end address is: 24 (R6)
;Kinematics.c,398 :: 		}
L_mc_arc40:
;Kinematics.c,401 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
; count start address is: 28 (R7)
; r_axis1 start address is: 16 (R4)
; r_axis0 start address is: 24 (R6)
ADDIU	R4, SP, 68
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S11, S3
SWC1	S0, 0(R2)
;Kinematics.c,402 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S10, S2
SWC1	S0, 0(R2)
;Kinematics.c,403 :: 		arc_target[axis_linear] += linear_per_segment;
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S0, S7
>>>>>>> patch10
SWC1	S0, 0(R2)
;Kinematics.c,404 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
<<<<<<< HEAD
LWC1	S4, 0(R2)
SUB.S 	S3, S0, S4
;Kinematics.c,344 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 352(SP)
=======
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPx start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,405 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R5
>>>>>>> patch10
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
<<<<<<< HEAD
LWC1	S2, 0(R2)
SUB.S 	S1, S0, S2
;Kinematics.c,346 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
ADD.S 	S0, S3, S4
SWC1	S0, 60(SP)
;Kinematics.c,347 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
ADD.S 	S0, S1, S2
SWC1	S0, 64(SP)
;Kinematics.c,350 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc111
NOP	
J	L_mc_arc40
NOP	
L__mc_arc111:
;Kinematics.c,351 :: 		STPS[axis_0].step_delay = feed_rate;
=======
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,407 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc129
NOP	
J	L__mc_arc87
NOP	
L__mc_arc129:
;Kinematics.c,408 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S4, S0
MOV.S 	S4, S0
;Kinematics.c,409 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S1, S0
; nPx end address is: 32 (R8)
; nPy end address is: 8 (R2)
MOV.S 	S6, S4
MOV.S 	S4, S1
;Kinematics.c,410 :: 		}
J	L_mc_arc41
NOP	
L__mc_arc87:
;Kinematics.c,407 :: 		if(gc.absolute_mode){
MOV.S 	S6, S4
MOV.S 	S4, S1
;Kinematics.c,410 :: 		}
L_mc_arc41:
;Kinematics.c,413 :: 		STPS[axis_0].step_delay = feed_rate;
; nPy start address is: 32 (R8)
; nPx start address is: 48 (R12)
>>>>>>> patch10
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
<<<<<<< HEAD
ADDIU	R3, R2, 8
LW	R2, 356(SP)
SW	R2, 0(R3)
;Kinematics.c,352 :: 		STPS[axis_1].step_delay = feed_rate;
LH	R3, 352(SP)
ORI	R2, R0, 100
=======
ADDIU	R3, R2, 12
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,414 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R5
ORI	R2, R0, 92
>>>>>>> patch10
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
<<<<<<< HEAD
ADDIU	R3, R2, 8
LW	R2, 356(SP)
SW	R2, 0(R3)
;Kinematics.c,353 :: 		}
L_mc_arc40:
;Kinematics.c,355 :: 		SV.cir = 1;//to indicate DualAxisStep of circle!!!
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,356 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LW	R27, 356(SP)
LH	R26, 352(SP)
SEH	R25, R28
LWC1	S13, 64(SP)
LWC1	S12, 60(SP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,358 :: 		while(1){
L_mc_arc41:
;Kinematics.c,365 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc112
NOP	
J	L__mc_arc72
NOP	
L__mc_arc112:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc113
NOP	
J	L__mc_arc71
NOP	
L__mc_arc113:
L__mc_arc70:
;Kinematics.c,366 :: 		break;
J	L_mc_arc42
NOP	
;Kinematics.c,365 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc72:
L__mc_arc71:
;Kinematics.c,367 :: 		}
J	L_mc_arc41
NOP	
L_mc_arc42:
;Kinematics.c,371 :: 		if(limit_error)
LBU	R2, 323(SP)
BNE	R2, R0, L__mc_arc115
NOP	
J	L_mc_arc46
NOP	
L__mc_arc115:
;Kinematics.c,372 :: 		break;
J	L_mc_arc37
NOP	
L_mc_arc46:
;Kinematics.c,373 :: 		i++;
LW	R2, 348(SP)
ADDIU	R2, R2, 1
SW	R2, 348(SP)
;Kinematics.c,375 :: 		if(!DMA_IsOn(1)){
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc47
NOP	
L__mc_arc116:
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
;Kinematics.c,377 :: 		[ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
ADDIU	R23, SP, 213
ADDIU	R22, R23, 106
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 213
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LW	R2, 356(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
SWC1	S1, 24(SP)
SWC1	S0, 20(SP)
LW	R2, 96(SP)
SW	R2, 16(SP)
LW	R2, 92(SP)
SW	R2, 12(SP)
LW	R2, 368(SP)
SW	R2, 8(SP)
LW	R2, 380(SP)
SW	R2, 4(SP)
;Kinematics.c,377 :: 		[ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
SW	R3, 0(SP)
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,379 :: 		}
L_mc_arc47:
;Kinematics.c,382 :: 		}
J	L_mc_arc36
NOP	
L_mc_arc37:
;Kinematics.c,383 :: 		report_status_message(STATUS_OK);
=======
ADDIU	R3, R2, 12
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,422 :: 		if(position[axis_0] > target[axis_0]){
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc130
NOP	
J	L_mc_arc42
NOP	
L__mc_arc130:
;Kinematics.c,423 :: 		if(nPx < target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S6
BC1F	0, L__mc_arc131
NOP	
J	L__mc_arc88
NOP	
L__mc_arc131:
; nPx end address is: 48 (R12)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPx start address is: 8 (R2)
MOV.S 	S1, S0
; nPx end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc43
NOP	
L__mc_arc88:
L_mc_arc43:
;Kinematics.c,424 :: 		}else if(position[axis_0] < target[axis_0]){
; nPx start address is: 48 (R12)
J	L_mc_arc44
NOP	
L_mc_arc42:
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc132
NOP	
J	L__mc_arc90
NOP	
L__mc_arc132:
;Kinematics.c,425 :: 		if(nPx > target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LE.S 	0, S6, S0
BC1F	0, L__mc_arc133
NOP	
J	L__mc_arc89
NOP	
L__mc_arc133:
; nPx end address is: 48 (R12)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPx start address is: 8 (R2)
MOV.S 	S1, S0
; nPx end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc46
NOP	
L__mc_arc89:
MOV.S 	S0, S6
L_mc_arc46:
;Kinematics.c,426 :: 		}
; nPx start address is: 0 (R0)
MOV.S 	S6, S0
; nPx end address is: 0 (R0)
J	L_mc_arc45
NOP	
L__mc_arc90:
;Kinematics.c,424 :: 		}else if(position[axis_0] < target[axis_0]){
;Kinematics.c,426 :: 		}
L_mc_arc45:
; nPx start address is: 48 (R12)
; nPx end address is: 48 (R12)
L_mc_arc44:
;Kinematics.c,428 :: 		if(position[axis_1] > target[axis_1]){
; nPx start address is: 48 (R12)
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc134
NOP	
J	L_mc_arc47
NOP	
L__mc_arc134:
;Kinematics.c,429 :: 		if(nPy <= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc135
NOP	
J	L__mc_arc91
NOP	
L__mc_arc135:
; nPy end address is: 32 (R8)
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
; nPy end address is: 8 (R2)
J	L_mc_arc48
NOP	
L__mc_arc91:
MOV.S 	S1, S4
L_mc_arc48:
;Kinematics.c,430 :: 		}else if(position[axis_1] < target[axis_1]){
; nPy start address is: 8 (R2)
; nPy end address is: 8 (R2)
J	L_mc_arc49
NOP	
L_mc_arc47:
; nPy start address is: 32 (R8)
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc136
NOP	
J	L__mc_arc93
NOP	
L__mc_arc136:
;Kinematics.c,431 :: 		if(nPy >= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc137
NOP	
J	L__mc_arc92
NOP	
L__mc_arc137:
; nPy end address is: 32 (R8)
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
; nPy end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc51
NOP	
L__mc_arc92:
MOV.S 	S0, S4
L_mc_arc51:
;Kinematics.c,432 :: 		}
; nPy start address is: 0 (R0)
MOV.S 	S1, S0
; nPy end address is: 0 (R0)
J	L_mc_arc50
NOP	
L__mc_arc93:
;Kinematics.c,430 :: 		}else if(position[axis_1] < target[axis_1]){
MOV.S 	S1, S4
;Kinematics.c,432 :: 		}
L_mc_arc50:
; nPy start address is: 8 (R2)
; nPy end address is: 8 (R2)
L_mc_arc49:
;Kinematics.c,434 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,gc.frequency);//,xy);
; nPy start address is: 8 (R2)
LWC1	S0, Offset(_gc+20)(GP)
CVT32.W 	S0, S0
SWC1	S3, 4(SP)
SWC1	S2, 8(SP)
SH	R7, 12(SP)
SH	R5, 14(SP)
SH	R6, 16(SP)
SWC1	S11, 20(SP)
SWC1	S10, 24(SP)
SWC1	S9, 28(SP)
SWC1	S8, 32(SP)
SWC1	S7, 36(SP)
SWC1	S17, 40(SP)
SWC1	S16, 44(SP)
SWC1	S5, 48(SP)
SH	R28, 52(SP)
SW	R27, 56(SP)
SW	R26, 60(SP)
SW	R25, 64(SP)
SEH	R26, R5
SEH	R25, R28
MOV.S 	S14, S0
MOV.S 	S13, S1
; nPy end address is: 8 (R2)
MOV.S 	S12, S6
; nPx end address is: 48 (R12)
JAL	_DualAxisStep+0
NOP	
; count end address is: 28 (R7)
; r_axis1 end address is: 16 (R4)
; r_axis0 end address is: 24 (R6)
; i end address is: 40 (R10)
LW	R25, 64(SP)
LW	R26, 60(SP)
LW	R27, 56(SP)
LH	R28, 52(SP)
LWC1	S5, 48(SP)
LWC1	S16, 44(SP)
LWC1	S17, 40(SP)
LWC1	S7, 36(SP)
LWC1	S8, 32(SP)
LWC1	S9, 28(SP)
LWC1	S10, 24(SP)
LWC1	S11, 20(SP)
LH	R6, 16(SP)
LH	R5, 14(SP)
LH	R7, 12(SP)
LWC1	S2, 8(SP)
LWC1	S3, 4(SP)
MOV.S 	S1, S5
MOV.S 	S4, S3
MOV.S 	S3, S2
SEH	R4, R7
;Kinematics.c,438 :: 		while(1){
L_mc_arc52:
;Kinematics.c,445 :: 		if(!OC5IE_bit && !OC2IE_bit)
; i start address is: 8 (R2)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
; r_axis0 start address is: 32 (R8)
; r_axis0 end address is: 32 (R8)
; r_axis1 start address is: 24 (R6)
; r_axis1 end address is: 24 (R6)
; count start address is: 16 (R4)
; count end address is: 16 (R4)
; axis_1 start address is: 20 (R5)
; axis_1 end address is: 20 (R5)
; axis_linear start address is: 24 (R6)
; axis_linear end address is: 24 (R6)
; center_axis0 start address is: 88 (R22)
; center_axis0 end address is: 88 (R22)
; center_axis1 start address is: 80 (R20)
; center_axis1 end address is: 80 (R20)
; segments start address is: 72 (R18)
; segments end address is: 72 (R18)
; theta_per_segment start address is: 64 (R16)
; theta_per_segment end address is: 64 (R16)
; linear_per_segment start address is: 56 (R14)
; linear_per_segment end address is: 56 (R14)
; cos_T start address is: 136 (R34)
; cos_T end address is: 136 (R34)
; sin_T start address is: 128 (R32)
; sin_T end address is: 128 (R32)
; i start address is: 8 (R2)
; i end address is: 8 (R2)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc138
NOP	
J	L__mc_arc84
NOP	
L__mc_arc138:
; r_axis0 end address is: 32 (R8)
; r_axis1 end address is: 24 (R6)
; count end address is: 16 (R4)
; axis_1 end address is: 20 (R5)
; axis_linear end address is: 24 (R6)
; center_axis0 end address is: 88 (R22)
; center_axis1 end address is: 80 (R20)
; segments end address is: 72 (R18)
; theta_per_segment end address is: 64 (R16)
; linear_per_segment end address is: 56 (R14)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
; i end address is: 8 (R2)
; i start address is: 8 (R2)
; sin_T start address is: 128 (R32)
; cos_T start address is: 136 (R34)
; linear_per_segment start address is: 56 (R14)
; theta_per_segment start address is: 64 (R16)
; segments start address is: 72 (R18)
; center_axis1 start address is: 80 (R20)
; center_axis0 start address is: 88 (R22)
; axis_linear start address is: 24 (R6)
; axis_1 start address is: 20 (R5)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc139
NOP	
J	L__mc_arc83
NOP	
L__mc_arc139:
L__mc_arc82:
;Kinematics.c,446 :: 		break;
J	L_mc_arc53
NOP	
;Kinematics.c,445 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc84:
L__mc_arc83:
;Kinematics.c,447 :: 		}
SWC1	S3, 4(SP)
LWC1	S3, 4(SP)
J	L_mc_arc52
NOP	
L_mc_arc53:
;Kinematics.c,381 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
; i end address is: 8 (R2)
; i start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,462 :: 		}
SWC1	S3, 4(SP)
; r_axis0 end address is: 32 (R8)
; r_axis1 end address is: 24 (R6)
; count end address is: 16 (R4)
; axis_linear end address is: 24 (R6)
; center_axis0 end address is: 88 (R22)
; center_axis1 end address is: 80 (R20)
; segments end address is: 72 (R18)
; theta_per_segment end address is: 64 (R16)
; linear_per_segment end address is: 56 (R14)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
; i end address is: 40 (R10)
LWC1	S3, 4(SP)
J	L_mc_arc36
NOP	
L_mc_arc37:
;Kinematics.c,464 :: 		SV.cir = 0;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,466 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,gc.frequency);
LWC1	S0, Offset(_gc+20)(GP)
CVT32.W 	S2, S0
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
>>>>>>> patch10
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SEH	R26, R5
SEH	R25, R28
; axis_1 end address is: 20 (R5)
MOV.S 	S14, S2
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,474 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
<<<<<<< HEAD
ADDIU	SP, SP, 352
=======
ADDIU	SP, SP, 80
>>>>>>> patch10
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,478 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,479 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,480 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,488 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,489 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
<<<<<<< HEAD
BNE	R2, R0, L__GetAxisDirection119
NOP	
J	L_GetAxisDirection48
NOP	
L__GetAxisDirection119:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
J	L_GetAxisDirection49
NOP	
L_GetAxisDirection48:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
L_GetAxisDirection49:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
;Kinematics.c,406 :: 		}
=======
BNE	R2, R0, L__GetAxisDirection142
NOP	
J	L_GetAxisDirection57
NOP	
L__GetAxisDirection142:
; ?FLOC___GetAxisDirection?T462 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T462 end address is: 8 (R2)
J	L_GetAxisDirection58
NOP	
L_GetAxisDirection57:
; ?FLOC___GetAxisDirection?T462 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T462 end address is: 8 (R2)
L_GetAxisDirection58:
; ?FLOC___GetAxisDirection?T462 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T462 end address is: 8 (R2)
;Kinematics.c,490 :: 		}
>>>>>>> patch10
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,502 :: 		int Home(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,506 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__Home121
NOP	
J	L_Home50
NOP	
L__Home121:
;Kinematics.c,423 :: 		speed = 1000;//settings.homing_feed_rate;
ORI	R2, R0, 1000
=======
BEQ	R2, R0, L__Home144
NOP	
J	L_Home59
NOP	
L__Home144:
;Kinematics.c,507 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
>>>>>>> patch10
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,510 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 4(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 4(SP)
SH	R25, 4(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,513 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,516 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,519 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,522 :: 		EnableStepper(axis);//sort this out
SH	R25, 4(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,525 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,528 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
<<<<<<< HEAD
LH	R25, 8(SP)
BEQ	R2, R0, L__Home122
NOP	
J	L_Home51
NOP	
L__Home122:
;Kinematics.c,446 :: 		homing[axis].home_cnt = 1;
=======
LH	R25, 4(SP)
BEQ	R2, R0, L__Home145
NOP	
J	L_Home60
NOP	
L__Home145:
;Kinematics.c,530 :: 		homing[axis].home_cnt = 1;
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,532 :: 		goto HOMED;
J	___Home_HOMED
NOP	
<<<<<<< HEAD
;Kinematics.c,449 :: 		}
L_Home51:
;Kinematics.c,453 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
=======
;Kinematics.c,533 :: 		}
L_Home60:
;Kinematics.c,537 :: 		Home_Axis(-(max_sizes[axis]+100.0),speed,axis);
LWC1	S0, Offset(Home_speed_L0+0)(GP)
CVT32.W 	S2, S0
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 17096
>>>>>>> patch10
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S1, S1, S0
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SH	R25, 4(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,547 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
<<<<<<< HEAD
;Kinematics.c,463 :: 		}
L_Home50:
;Kinematics.c,467 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home123
NOP	
J	L_Home52
NOP	
L__Home123:
;Kinematics.c,472 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home125
NOP	
J	L_Home53
NOP	
L__Home125:
;Kinematics.c,475 :: 		HOMED:
=======
;Kinematics.c,548 :: 		}
L_Home59:
;Kinematics.c,552 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home146
NOP	
J	L_Home61
NOP	
L__Home146:
;Kinematics.c,557 :: 		if(FN(axis)){
SH	R25, 4(SP)
JAL	_FN+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home148
NOP	
J	L_Home62
NOP	
L__Home148:
;Kinematics.c,560 :: 		HOMED:
>>>>>>> patch10
___Home_HOMED:
;Kinematics.c,561 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,570 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
<<<<<<< HEAD
BEQ	R2, R0, L__Home126
NOP	
J	L_Home54
NOP	
L__Home126:
;Kinematics.c,487 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
=======
BEQ	R2, R0, L__Home149
NOP	
J	L_Home63
NOP	
L__Home149:
;Kinematics.c,572 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
<<<<<<< HEAD
BEQ	R2, R0, L__Home127
NOP	
J	L_Home55
NOP	
L__Home127:
;Kinematics.c,490 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
=======
BEQ	R2, R0, L__Home150
NOP	
J	L_Home64
NOP	
L__Home150:
;Kinematics.c,575 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__Home128
NOP	
J	L_Home56
NOP	
L__Home128:
;Kinematics.c,492 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
=======
BEQ	R3, R2, L__Home151
NOP	
J	L_Home65
NOP	
L__Home151:
;Kinematics.c,577 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,578 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,581 :: 		VDelay_ms((unsigned long)settings.homing_debounce_delay);
LHU	R2, Offset(_settings+54)(GP)
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_VDelay_ms+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,585 :: 		Home_Axis(12.0,settings.homing_feed_rate, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
<<<<<<< HEAD
LH	R25, 8(SP)
;Kinematics.c,498 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home57
NOP	
L_Home56:
=======
LH	R25, 4(SP)
;Kinematics.c,587 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home66
NOP	
L_Home65:
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
<<<<<<< HEAD
BEQ	R2, R0, L__Home129
NOP	
J	L_Home58
NOP	
L__Home129:
;Kinematics.c,500 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
=======
BEQ	R2, R0, L__Home152
NOP	
J	L_Home67
NOP	
L__Home152:
;Kinematics.c,589 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,590 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,591 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,593 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,596 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,608 :: 		Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
LWC1	S12, Offset(_settings+32)(GP)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,610 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
<<<<<<< HEAD
;Kinematics.c,520 :: 		}
L_Home58:
L_Home57:
;Kinematics.c,521 :: 		}
L_Home55:
;Kinematics.c,526 :: 		}
L_Home54:
;Kinematics.c,527 :: 		}
L_Home53:
;Kinematics.c,535 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home131
NOP	
J	L_Home59
NOP	
L__Home131:
;Kinematics.c,537 :: 		homing[axis].home_cnt++;
=======
;Kinematics.c,611 :: 		}
L_Home67:
L_Home66:
;Kinematics.c,612 :: 		}
L_Home64:
;Kinematics.c,617 :: 		}
L_Home63:
;Kinematics.c,618 :: 		}
L_Home62:
;Kinematics.c,626 :: 		if(FP(axis)){
SH	R25, 4(SP)
JAL	_FP+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home154
NOP	
J	L_Home68
NOP	
L__Home154:
;Kinematics.c,628 :: 		homing[axis].home_cnt++;
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,629 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
<<<<<<< HEAD
BNE	R2, R0, L__Home133
NOP	
J	L_Home60
NOP	
L__Home133:
;Kinematics.c,539 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
=======
BNE	R2, R0, L__Home156
NOP	
J	L_Home69
NOP	
L__Home156:
;Kinematics.c,630 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
>>>>>>> patch10
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,631 :: 		Home_Axis(-290.00,50.0,axis);
LUI	R3, 16968
ORI	R3, R3, 0
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 4(SP)
MTC1	R3, S13
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
<<<<<<< HEAD
LH	R25, 8(SP)
;Kinematics.c,541 :: 		}
L_Home60:
;Kinematics.c,550 :: 		}
L_Home59:
;Kinematics.c,551 :: 		}
L_Home52:
;Kinematics.c,552 :: 		return axis;
=======
LH	R25, 4(SP)
;Kinematics.c,632 :: 		}
L_Home69:
;Kinematics.c,641 :: 		}
L_Home68:
;Kinematics.c,642 :: 		}
L_Home61:
;Kinematics.c,643 :: 		return axis;
>>>>>>> patch10
SEH	R2, R25
;Kinematics.c,644 :: 		}
L_end_Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,647 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,649 :: 		StopAxis(axis);
SH	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 4(SP)
;Kinematics.c,650 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,660 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R2, 16(SP)
SH	R25, 4(SP)
SWC1	S13, 8(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 8(SP)
LH	R25, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,661 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
LW	R2, 0(R2)
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,662 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,664 :: 		static void ResetHoming(){
;Kinematics.c,665 :: 		int i = 0;
;Kinematics.c,666 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
<<<<<<< HEAD
L_Kinematics_ResetHoming61:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L_Kinematics_ResetHoming136
NOP	
J	L_Kinematics_ResetHoming62
NOP	
L_Kinematics_ResetHoming136:
;Kinematics.c,576 :: 		homing[i].home_state = 0;
=======
L_Kinematics_ResetHoming70:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming159
NOP	
J	L_Kinematics_ResetHoming71
NOP	
L_Kinematics_ResetHoming159:
;Kinematics.c,667 :: 		homing[i].home_state = 0;
>>>>>>> patch10
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,668 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,666 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,669 :: 		}
; i end address is: 16 (R4)
<<<<<<< HEAD
J	L_Kinematics_ResetHoming61
NOP	
L_Kinematics_ResetHoming62:
;Kinematics.c,579 :: 		}
=======
J	L_Kinematics_ResetHoming70
NOP	
L_Kinematics_ResetHoming71:
;Kinematics.c,670 :: 		}
>>>>>>> patch10
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,677 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,679 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
<<<<<<< HEAD
BEQ	R2, R0, L__mc_reset138
NOP	
J	L_mc_reset64
NOP	
L__mc_reset138:
;Kinematics.c,589 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+18)(GP)
;Kinematics.c,599 :: 		switch (sys.state) {
J	L_mc_reset65
NOP	
;Kinematics.c,600 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset67:
L_mc_reset68:
L_mc_reset69:
;Kinematics.c,601 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+18)(GP)
=======
BEQ	R2, R0, L__mc_reset161
NOP	
J	L_mc_reset73
NOP	
L__mc_reset161:
;Kinematics.c,680 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,690 :: 		switch (sys.state) {
J	L_mc_reset74
NOP	
;Kinematics.c,691 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset76:
L_mc_reset77:
L_mc_reset78:
;Kinematics.c,692 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
>>>>>>> patch10
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,693 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,694 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,695 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
<<<<<<< HEAD
;Kinematics.c,605 :: 		}
J	L_mc_reset66
NOP	
L_mc_reset65:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset140
NOP	
J	L_mc_reset67
NOP	
L__mc_reset140:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset142
NOP	
J	L_mc_reset68
NOP	
L__mc_reset142:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset144
NOP	
J	L_mc_reset69
NOP	
L__mc_reset144:
L_mc_reset66:
;Kinematics.c,606 :: 		}
L_mc_reset64:
;Kinematics.c,607 :: 		}
=======
;Kinematics.c,696 :: 		}
J	L_mc_reset75
NOP	
L_mc_reset74:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset163
NOP	
J	L_mc_reset76
NOP	
L__mc_reset163:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset165
NOP	
J	L_mc_reset77
NOP	
L__mc_reset165:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset167
NOP	
J	L_mc_reset78
NOP	
L__mc_reset167:
L_mc_reset75:
;Kinematics.c,697 :: 		}
L_mc_reset73:
;Kinematics.c,698 :: 		}
>>>>>>> patch10
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
