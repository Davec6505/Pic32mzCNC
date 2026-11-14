_SetInitialSizes:
;Kinematics.c,33 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,34 :: 		int i = 0;
;Kinematics.c,36 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,38 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes89
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes89:
;Kinematics.c,39 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 84
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
;Kinematics.c,38 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,40 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,41 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,46 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,47 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection91
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection91:
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
;Kinematics.c,48 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,49 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,50 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,51 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,52 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,53 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,54 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,55 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,56 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,57 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,58 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,59 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,60 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,61 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,62 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection93
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection93:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection95
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection95:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection97
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection97:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection99
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection99:
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,63 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,77 :: 		void SingleAxisStep(float newxyz,float speed,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,78 :: 		long  absxyz = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Kinematics.c,79 :: 		long  tempA  = 0;
;Kinematics.c,80 :: 		int   dir    = 0;
;Kinematics.c,83 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,92 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep101:
;Kinematics.c,94 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
;Kinematics.c,97 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 88
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,99 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep102
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep102:
; tempA end address is: 12 (R3)
;Kinematics.c,100 :: 		return;
J	L_end_SingleAxisStep
NOP	
;Kinematics.c,101 :: 		}
L_SingleAxisStep13:
;Kinematics.c,102 :: 		}else{
; tempA start address is: 12 (R3)
MOVZ	R2, R3, R0
; tempA end address is: 12 (R3)
J	L_SingleAxisStep14
NOP	
L_SingleAxisStep12:
;Kinematics.c,103 :: 		tempA = belt_steps(newxyz,axis_No);
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
;Kinematics.c,104 :: 		}
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
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,110 :: 		long speed_ = 0;
;Kinematics.c,112 :: 		STPS[axis_No].dist =labs(dist);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 16(SP)
JAL	_labs+0
NOP	
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,113 :: 		Single_Axis_Enable(axis_No);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,114 :: 		speed_cntr_Move(dist , speed, axis_No);
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,119 :: 		Set_Axisdirection(dist,axis_No);
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,120 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart104
NOP	
J	L_Kinematics_SingleAxisStart15
NOP	
L_Kinematics_SingleAxisStart104:
; ?FLOC__Kinematics_SingleAxisStart?T55 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T55 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart16
NOP	
L_Kinematics_SingleAxisStart15:
; ?FLOC__Kinematics_SingleAxisStart?T55 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T55 end address is: 16 (R4)
L_Kinematics_SingleAxisStart16:
; ?FLOC__Kinematics_SingleAxisStart?T55 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T55 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,121 :: 		SV.Single_Dual = 0;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 5, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,122 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R0, 0(R2)
;Kinematics.c,123 :: 		STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 16(SP)
JAL	_labs+0
NOP	
SEH	R4, R26
ORI	R3, R0, 88
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 48
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 16(SP)
SW	R3, 0(R2)
;Kinematics.c,124 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,125 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R25, 0(R2)
;Kinematics.c,128 :: 		}
L_end_SingleAxisStart:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,133 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Kinematics.c,138 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S14, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S14, S0
;Kinematics.c,141 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep106
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep106:
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
SW	R2, 16(SP)
;Kinematics.c,144 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,156 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 88
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R4, 0(R3)
LW	R3, 16(SP)
SUBU	R3, R3, R4
SW	R3, 16(SP)
;Kinematics.c,157 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 88
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 20(SP)
;Kinematics.c,165 :: 		}else{
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
;Kinematics.c,166 :: 		tempA = belt_steps(axis_a,axisA);
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
SW	R2, 16(SP)
;Kinematics.c,167 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
SW	R2, 20(SP)
;Kinematics.c,168 :: 		}
L_DualAxisStep18:
;Kinematics.c,169 :: 		SV.over = 0;
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,170 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+16)(GP)
;Kinematics.c,173 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,174 :: 		Single_Axis_Enable(axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,175 :: 		Single_Axis_Enable(axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,179 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep107:
;Kinematics.c,180 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,181 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,182 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,183 :: 		}else{
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
;Kinematics.c,184 :: 		SV.prevA = 0;//tempA;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,185 :: 		SV.prevB = 0;//tempB;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,186 :: 		SV.prevC = 0;//tempC;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,187 :: 		}
L_DualAxisStep20:
;Kinematics.c,190 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SEH	R26, R25
LW	R25, 16(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,191 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 16(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep108:
; ?FLOC___DualAxisStep?T119 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T119 end address is: 24 (R6)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T119 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T119 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T119 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T119 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,192 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,193 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep109:
; ?FLOC___DualAxisStep?T127 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T127 end address is: 24 (R6)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T127 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T127 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T127 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T127 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,196 :: 		SV.dA   = tempA;// - SV.prevA;
LW	R2, 16(SP)
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,197 :: 		SV.dB   = tempB;// - SV.prevB;
LW	R2, 20(SP)
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,198 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 24(SP)
SW	R2, Offset(_SV+28)(GP)
;Kinematics.c,201 :: 		SV.dA = labs(SV.dA);
SH	R25, 4(SP)
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,202 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,210 :: 		if(SV.dA == 0 && SV.dB == 0){
LW	R2, Offset(_SV+20)(GP)
BEQ	R2, R0, L__DualAxisStep110
NOP	
J	L__DualAxisStep78
NOP	
L__DualAxisStep110:
LW	R2, Offset(_SV+24)(GP)
BEQ	R2, R0, L__DualAxisStep111
NOP	
J	L__DualAxisStep77
NOP	
L__DualAxisStep111:
L__DualAxisStep76:
;Kinematics.c,211 :: 		SV.mode_complete = 1; //set this to respond with ok
ORI	R2, R0, 1
SB	R2, Offset(_SV+1)(GP)
;Kinematics.c,212 :: 		return;
J	L_end_DualAxisStep
NOP	
;Kinematics.c,210 :: 		if(SV.dA == 0 && SV.dB == 0){
L__DualAxisStep78:
L__DualAxisStep77:
;Kinematics.c,216 :: 		STPS[axisA].dist =labs(tempA);
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 32(SP)
SH	R25, 4(SP)
LW	R25, 16(SP)
JAL	_labs+0
NOP	
LW	R3, 32(SP)
SW	R2, 0(R3)
;Kinematics.c,217 :: 		STPS[axisB].dist =labs(tempB);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 32(SP)
LW	R25, 20(SP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
LW	R3, 32(SP)
SW	R2, 0(R3)
;Kinematics.c,221 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SEH	R26, R25
MOV.S 	S12, S14
LW	R25, 16(SP)
JAL	_speed_cntr_Move+0
NOP	
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,222 :: 		speed_cntr_Move(tempB,speed,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
MOV.S 	S12, S14
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,224 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep112
NOP	
J	L_DualAxisStep28
NOP	
L__DualAxisStep112:
;Kinematics.c,228 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,229 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,230 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,231 :: 		}else{
J	L_DualAxisStep29
NOP	
L_DualAxisStep28:
;Kinematics.c,234 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,235 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,236 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,237 :: 		}
L_DualAxisStep29:
;Kinematics.c,239 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,240 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,241 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,242 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,245 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,281 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
; axis_1 start address is: 24 (R6)
LH	R6, 88(SP)
; axis_linear start address is: 20 (R5)
LH	R5, 90(SP)
; invert_feed_rate start address is: 32 (R8)
LBU	R8, 92(SP)
; isclockwise start address is: 36 (R9)
LBU	R9, 93(SP)
;Kinematics.c,282 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 76
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,287 :: 		int count = 0;
; count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Kinematics.c,288 :: 		char limit_error = 0;
;Kinematics.c,290 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S4, 0(R2)
ADD.S 	S3, S0, S4
; center_axis0 start address is: 184 (R46)
MOV.S 	S23, S3
;Kinematics.c,291 :: 		center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
ADDU	R2, R27, R3
LWC1	S2, 0(R2)
ADD.S 	S1, S0, S2
; center_axis1 start address is: 176 (R44)
MOV.S 	S22, S1
;Kinematics.c,292 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
; r_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,293 :: 		r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
; r_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,294 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,295 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S1
; rt_axis1 start address is: 56 (R14)
MOV.S 	S7, S0
;Kinematics.c,296 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
SUB.S 	S0, S0, S1
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,298 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 76
ADDU	R2, R2, R3
SWC1	S1, 0(R2)
;Kinematics.c,305 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
MUL.S 	S1, S4, S7
MUL.S 	S0, S5, S6
SUB.S 	S2, S1, S0
;Kinematics.c,306 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
MUL.S 	S1, S4, S6
; rt_axis0 end address is: 48 (R12)
MUL.S 	S0, S5, S7
; rt_axis1 end address is: 56 (R14)
ADD.S 	S0, S1, S0
;Kinematics.c,314 :: 		angular_travel = atan2(y,x);
SW	R26, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R26, 4(SP)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,317 :: 		if(isclockwise > 0) {
ANDI	R2, R9, 255
; isclockwise end address is: 36 (R9)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc114
NOP	
J	L_mc_arc30
NOP	
L__mc_arc114:
;Kinematics.c,318 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc115
NOP	
J	L__mc_arc79
NOP	
L__mc_arc115:
;Kinematics.c,319 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
SUB.S 	S0, S1, S0
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc31
NOP	
L__mc_arc79:
;Kinematics.c,318 :: 		if (angular_travel >= 0)
MOV.S 	S6, S1
;Kinematics.c,319 :: 		angular_travel -= PIx2;
L_mc_arc31:
;Kinematics.c,320 :: 		}else {
; angular_travel start address is: 48 (R12)
; angular_travel end address is: 48 (R12)
J	L_mc_arc32
NOP	
L_mc_arc30:
;Kinematics.c,321 :: 		if(angular_travel <= 0)
; angular_travel start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc116
NOP	
J	L__mc_arc80
NOP	
L__mc_arc116:
;Kinematics.c,322 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
ADD.S 	S0, S1, S0
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc33
NOP	
L__mc_arc80:
;Kinematics.c,321 :: 		if(angular_travel <= 0)
MOV.S 	S6, S1
;Kinematics.c,322 :: 		angular_travel += PIx2;
L_mc_arc33:
;Kinematics.c,323 :: 		}
; angular_travel start address is: 48 (R12)
; angular_travel end address is: 48 (R12)
L_mc_arc32:
;Kinematics.c,342 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 48 (R12)
SWC1	S12, 4(SP)
MOV.S 	S12, S3
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S6, S13
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
; mm_of_travel start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,343 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc117
NOP	
J	L_mc_arc34
NOP	
L__mc_arc117:
; invert_feed_rate end address is: 32 (R8)
; r_axis1 end address is: 40 (R10)
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 48 (R12)
; mm_of_travel end address is: 16 (R4)
; r_axis0 end address is: 32 (R8)
; center_axis1 end address is: 176 (R44)
; center_axis0 end address is: 184 (R46)
; axis_linear end address is: 20 (R5)
; axis_1 end address is: 24 (R6)
; count end address is: 28 (R7)
J	L_end_mc_arc
NOP	
L_mc_arc34:
;Kinematics.c,345 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
; count start address is: 28 (R7)
; axis_1 start address is: 24 (R6)
; axis_linear start address is: 20 (R5)
; center_axis0 start address is: 184 (R46)
; center_axis1 start address is: 176 (R44)
; r_axis0 start address is: 32 (R8)
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 48 (R12)
; linear_travel start address is: 24 (R6)
; r_axis1 start address is: 40 (R10)
; invert_feed_rate start address is: 32 (R8)
LWC1	S0, Offset(_settings+36)(GP)
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
; segments start address is: 168 (R42)
MOV.S 	S21, S0
;Kinematics.c,350 :: 		if (invert_feed_rate)
BNE	R8, R0, L__mc_arc119
NOP	
J	L_mc_arc35
NOP	
L__mc_arc119:
; invert_feed_rate end address is: 32 (R8)
;Kinematics.c,351 :: 		feed_rate *= segments;
MUL.S 	S0, S12, S21
MOV.S 	S12, S0
L_mc_arc35:
;Kinematics.c,354 :: 		theta_per_segment = angular_travel/segments;
DIV.S 	S2, S6, S21
; angular_travel end address is: 48 (R12)
; theta_per_segment start address is: 152 (R38)
MOV.S 	S19, S2
;Kinematics.c,359 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S3, S21
; linear_travel end address is: 24 (R6)
; linear_per_segment start address is: 144 (R36)
MOV.S 	S18, S0
;Kinematics.c,362 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; cos_T start address is: 136 (R34)
MOV.S 	S17, S0
;Kinematics.c,363 :: 		sin_T = theta_per_segment;
; sin_T start address is: 128 (R32)
MOV.S 	S16, S2
;Kinematics.c,366 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,367 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,383 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
; i start address is: 160 (R40)
MTC1	R2, S20
; r_axis1 end address is: 40 (R10)
; segments end address is: 168 (R42)
; r_axis0 end address is: 32 (R8)
; axis_1 end address is: 24 (R6)
; count end address is: 28 (R7)
; i end address is: 160 (R40)
MOV.S 	S3, S5
SEH	R4, R7
L_mc_arc36:
; i start address is: 160 (R40)
; sin_T start address is: 128 (R32)
; sin_T end address is: 128 (R32)
; cos_T start address is: 136 (R34)
; cos_T end address is: 136 (R34)
; linear_per_segment start address is: 144 (R36)
; linear_per_segment end address is: 144 (R36)
; theta_per_segment start address is: 152 (R38)
; theta_per_segment end address is: 152 (R38)
; segments start address is: 168 (R42)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
; center_axis1 start address is: 176 (R44)
; center_axis1 end address is: 176 (R44)
; center_axis0 start address is: 184 (R46)
; center_axis0 end address is: 184 (R46)
; count start address is: 16 (R4)
; axis_linear start address is: 20 (R5)
; axis_linear end address is: 20 (R5)
; axis_1 start address is: 24 (R6)
C.LE.S 	0, S21, S20
BC1F	0, L__mc_arc120
NOP	
J	L_mc_arc37
NOP	
L__mc_arc120:
; sin_T end address is: 128 (R32)
; cos_T end address is: 136 (R34)
; linear_per_segment end address is: 144 (R36)
; theta_per_segment end address is: 152 (R38)
; center_axis1 end address is: 176 (R44)
; center_axis0 end address is: 184 (R46)
; axis_linear end address is: 20 (R5)
;Kinematics.c,386 :: 		if (count < settings.n_arc_correction) {
; axis_linear start address is: 20 (R5)
; center_axis0 start address is: 184 (R46)
; center_axis1 start address is: 176 (R44)
; theta_per_segment start address is: 152 (R38)
; linear_per_segment start address is: 144 (R36)
; cos_T start address is: 136 (R34)
; sin_T start address is: 128 (R32)
SEH	R3, R4
LHU	R2, Offset(_settings+48)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__mc_arc121
NOP	
J	L_mc_arc39
NOP	
L__mc_arc121:
;Kinematics.c,388 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
MUL.S 	S1, S4, S16
MUL.S 	S0, S3, S17
ADD.S 	S2, S1, S0
;Kinematics.c,389 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
MUL.S 	S1, S4, S17
; r_axis0 end address is: 32 (R8)
MUL.S 	S0, S3, S16
; r_axis1 end address is: 24 (R6)
SUB.S 	S0, S1, S0
; r_axis0 start address is: 200 (R50)
MOV.S 	S25, S0
;Kinematics.c,390 :: 		r_axis1 = r_axisi;
; r_axis1 start address is: 192 (R48)
MOV.S 	S24, S2
;Kinematics.c,391 :: 		count++;
ADDIU	R2, R4, 1
; count end address is: 16 (R4)
; count start address is: 28 (R7)
SEH	R7, R2
;Kinematics.c,392 :: 		} else {
; count end address is: 28 (R7)
; r_axis1 end address is: 192 (R48)
; r_axis0 end address is: 200 (R50)
J	L_mc_arc40
NOP	
L_mc_arc39:
;Kinematics.c,395 :: 		cos_Ti = cos(i*theta_per_segment);
MUL.S 	S0, S20, S19
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 72(SP)
;Kinematics.c,396 :: 		sin_Ti = sin(i*theta_per_segment);
MUL.S 	S0, S20, S19
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,397 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 72(SP)
MUL.S 	S3, S2, S1
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
; r_axis0 start address is: 200 (R50)
MOV.S 	S25, S1
;Kinematics.c,398 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 72(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
; r_axis1 start address is: 192 (R48)
MOV.S 	S24, S0
;Kinematics.c,399 :: 		count = 0;
; count start address is: 28 (R7)
MOVZ	R7, R0, R0
; count end address is: 28 (R7)
; r_axis1 end address is: 192 (R48)
; r_axis0 end address is: 200 (R50)
;Kinematics.c,400 :: 		}
L_mc_arc40:
;Kinematics.c,403 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
; count start address is: 28 (R7)
; r_axis1 start address is: 192 (R48)
; r_axis0 start address is: 200 (R50)
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S23, S25
SWC1	S0, 0(R2)
;Kinematics.c,404 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S22, S24
SWC1	S0, 0(R2)
;Kinematics.c,405 :: 		arc_target[axis_linear] += linear_per_segment;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S0, S18
SWC1	S0, 0(R2)
;Kinematics.c,406 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,407 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,409 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc123
NOP	
J	L__mc_arc81
NOP	
L__mc_arc123:
;Kinematics.c,410 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S2, S0
MOV.S 	S2, S0
;Kinematics.c,411 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S1, S0
; nPx end address is: 16 (R4)
; nPy end address is: 8 (R2)
MOV.S 	S3, S2
MOV.S 	S2, S1
;Kinematics.c,412 :: 		}
J	L_mc_arc41
NOP	
L__mc_arc81:
;Kinematics.c,409 :: 		if(gc.absolute_mode){
MOV.S 	S3, S2
MOV.S 	S2, S1
;Kinematics.c,412 :: 		}
L_mc_arc41:
;Kinematics.c,415 :: 		STPS[axis_0].step_delay = feed_rate;
; nPy start address is: 16 (R4)
; nPx start address is: 24 (R6)
SEH	R3, R28
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,416 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R6
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,424 :: 		if(position[axis_0] > target[axis_0]){
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc124
NOP	
J	L_mc_arc42
NOP	
L__mc_arc124:
;Kinematics.c,425 :: 		if(nPx < target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S3
BC1F	0, L__mc_arc125
NOP	
J	L__mc_arc82
NOP	
L__mc_arc125:
; nPx end address is: 24 (R6)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPx start address is: 8 (R2)
MOV.S 	S1, S0
; nPx end address is: 8 (R2)
MOV.S 	S3, S1
J	L_mc_arc43
NOP	
L__mc_arc82:
L_mc_arc43:
;Kinematics.c,426 :: 		}else if(position[axis_0] < target[axis_0]){
; nPx start address is: 24 (R6)
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
BC1F	0, L__mc_arc126
NOP	
J	L__mc_arc84
NOP	
L__mc_arc126:
;Kinematics.c,427 :: 		if(nPx > target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LE.S 	0, S3, S0
BC1F	0, L__mc_arc127
NOP	
J	L__mc_arc83
NOP	
L__mc_arc127:
; nPx end address is: 24 (R6)
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
L__mc_arc83:
MOV.S 	S0, S3
L_mc_arc46:
;Kinematics.c,428 :: 		}
; nPx start address is: 0 (R0)
MOV.S 	S3, S0
; nPx end address is: 0 (R0)
J	L_mc_arc45
NOP	
L__mc_arc84:
;Kinematics.c,426 :: 		}else if(position[axis_0] < target[axis_0]){
;Kinematics.c,428 :: 		}
L_mc_arc45:
; nPx start address is: 24 (R6)
; nPx end address is: 24 (R6)
L_mc_arc44:
;Kinematics.c,430 :: 		if(position[axis_1] > target[axis_1]){
; nPx start address is: 24 (R6)
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc128
NOP	
J	L_mc_arc47
NOP	
L__mc_arc128:
;Kinematics.c,431 :: 		if(nPy <= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LT.S 	0, S0, S2
BC1F	0, L__mc_arc129
NOP	
J	L__mc_arc85
NOP	
L__mc_arc129:
; nPy end address is: 16 (R4)
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
; nPy end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc48
NOP	
L__mc_arc85:
MOV.S 	S0, S2
L_mc_arc48:
;Kinematics.c,432 :: 		}else if(position[axis_1] < target[axis_1]){
; nPy start address is: 0 (R0)
; nPy end address is: 0 (R0)
J	L_mc_arc49
NOP	
L_mc_arc47:
; nPy start address is: 16 (R4)
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc130
NOP	
J	L__mc_arc87
NOP	
L__mc_arc130:
;Kinematics.c,433 :: 		if(nPy >= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
C.LT.S 	0, S2, S0
BC1F	0, L__mc_arc131
NOP	
J	L__mc_arc86
NOP	
L__mc_arc131:
; nPy end address is: 16 (R4)
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
; nPy start address is: 8 (R2)
MOV.S 	S1, S0
; nPy end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc51
NOP	
L__mc_arc86:
MOV.S 	S0, S2
L_mc_arc51:
;Kinematics.c,434 :: 		}
; nPy start address is: 0 (R0)
; nPy end address is: 0 (R0)
J	L_mc_arc50
NOP	
L__mc_arc87:
;Kinematics.c,432 :: 		}else if(position[axis_1] < target[axis_1]){
MOV.S 	S0, S2
;Kinematics.c,434 :: 		}
L_mc_arc50:
; nPy start address is: 0 (R0)
; nPy end address is: 0 (R0)
L_mc_arc49:
;Kinematics.c,437 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
; nPy start address is: 0 (R0)
SWC1	S25, 4(SP)
SWC1	S24, 8(SP)
SH	R7, 12(SP)
SH	R6, 14(SP)
SH	R5, 16(SP)
SWC1	S23, 20(SP)
SWC1	S22, 24(SP)
SWC1	S21, 28(SP)
SWC1	S19, 32(SP)
SWC1	S18, 36(SP)
SWC1	S17, 40(SP)
SWC1	S16, 44(SP)
SWC1	S20, 48(SP)
SH	R28, 52(SP)
SW	R27, 56(SP)
SW	R26, 60(SP)
SW	R25, 64(SP)
SWC1	S12, 68(SP)
SEH	R26, R6
SEH	R25, R28
MOV.S 	S14, S12
MOV.S 	S13, S0
; nPy end address is: 0 (R0)
MOV.S 	S12, S3
; nPx end address is: 24 (R6)
JAL	_DualAxisStep+0
NOP	
LWC1	S12, 68(SP)
LW	R25, 64(SP)
LW	R26, 60(SP)
LW	R27, 56(SP)
LH	R28, 52(SP)
LWC1	S20, 48(SP)
LWC1	S16, 44(SP)
LWC1	S17, 40(SP)
LWC1	S18, 36(SP)
LWC1	S19, 32(SP)
LWC1	S21, 28(SP)
LWC1	S22, 24(SP)
LWC1	S23, 20(SP)
LH	R5, 16(SP)
LH	R6, 14(SP)
LH	R7, 12(SP)
LWC1	S24, 8(SP)
LWC1	S25, 4(SP)
;Kinematics.c,450 :: 		}
L_mc_arc53:
;Kinematics.c,383 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S20, S0
MOV.S 	S20, S0
;Kinematics.c,465 :: 		}
; sin_T end address is: 128 (R32)
; cos_T end address is: 136 (R34)
; linear_per_segment end address is: 144 (R36)
; theta_per_segment end address is: 152 (R38)
; segments end address is: 168 (R42)
; center_axis1 end address is: 176 (R44)
; center_axis0 end address is: 184 (R46)
; axis_linear end address is: 20 (R5)
; count end address is: 28 (R7)
; r_axis1 end address is: 192 (R48)
; r_axis0 end address is: 200 (R50)
; i end address is: 160 (R40)
MOV.S 	S3, S24
SEH	R4, R7
MOV.S 	S4, S25
J	L_mc_arc36
NOP	
L_mc_arc37:
;Kinematics.c,467 :: 		SV.cir = 0;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,469 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SEH	R26, R6
SEH	R25, R28
; axis_1 end address is: 24 (R6)
MOV.S 	S14, S12
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,477 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,481 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,482 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,483 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,491 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,492 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection134
NOP	
J	L_GetAxisDirection54
NOP	
L__GetAxisDirection134:
; ?FLOC___GetAxisDirection?T424 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T424 end address is: 8 (R2)
J	L_GetAxisDirection55
NOP	
L_GetAxisDirection54:
; ?FLOC___GetAxisDirection?T424 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T424 end address is: 8 (R2)
L_GetAxisDirection55:
; ?FLOC___GetAxisDirection?T424 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T424 end address is: 8 (R2)
;Kinematics.c,493 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,505 :: 		int Home(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,509 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home136
NOP	
J	L_Home56
NOP	
L__Home136:
;Kinematics.c,510 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,513 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 4(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 4(SP)
SH	R25, 4(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,516 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,519 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,522 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,525 :: 		EnableSteppers();
SH	R25, 4(SP)
JAL	_EnableSteppers+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,528 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,531 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__Home137
NOP	
J	L_Home57
NOP	
L__Home137:
;Kinematics.c,533 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,535 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,536 :: 		}
L_Home57:
;Kinematics.c,540 :: 		Home_Axis(-(max_sizes[axis]+100.0),speed,axis);
LWC1	S0, Offset(Home_speed_L0+0)(GP)
CVT32.W 	S2, S0
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 17096
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
;Kinematics.c,550 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,551 :: 		}
L_Home56:
;Kinematics.c,555 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home138
NOP	
J	L_Home58
NOP	
L__Home138:
;Kinematics.c,560 :: 		if(FN(axis)){
SH	R25, 4(SP)
JAL	_FN+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home140
NOP	
J	L_Home59
NOP	
L__Home140:
;Kinematics.c,563 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,564 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,573 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home141
NOP	
J	L_Home60
NOP	
L__Home141:
;Kinematics.c,575 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home142
NOP	
J	L_Home61
NOP	
L__Home142:
;Kinematics.c,578 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home143
NOP	
J	L_Home62
NOP	
L__Home143:
;Kinematics.c,580 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,581 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,584 :: 		VDelay_ms((unsigned long)settings.homing_debounce_delay);
LHU	R2, Offset(_settings+54)(GP)
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_VDelay_ms+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,588 :: 		Home_Axis(12.0,settings.homing_feed_rate, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,590 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home63
NOP	
L_Home62:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home144
NOP	
J	L_Home64
NOP	
L__Home144:
;Kinematics.c,592 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,593 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,594 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,596 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,599 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,611 :: 		Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
LWC1	S12, Offset(_settings+32)(GP)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,613 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,614 :: 		}
L_Home64:
L_Home63:
;Kinematics.c,615 :: 		}
L_Home61:
;Kinematics.c,620 :: 		}
L_Home60:
;Kinematics.c,621 :: 		}
L_Home59:
;Kinematics.c,629 :: 		if(FP(axis)){
SH	R25, 4(SP)
JAL	_FP+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home146
NOP	
J	L_Home65
NOP	
L__Home146:
;Kinematics.c,631 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,632 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home148
NOP	
J	L_Home66
NOP	
L__Home148:
;Kinematics.c,633 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,636 :: 		Home_Axis(-290.00,settings.homing_feed_rate,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,637 :: 		}
L_Home66:
;Kinematics.c,646 :: 		}
L_Home65:
;Kinematics.c,647 :: 		}
L_Home58:
;Kinematics.c,648 :: 		return axis;
SEH	R2, R25
;Kinematics.c,649 :: 		}
L_end_Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,652 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,654 :: 		StopAxis(axis);
SH	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 4(SP)
;Kinematics.c,655 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,665 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R2, 16(SP)
SH	R25, 4(SP)
SWC1	S13, 8(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 8(SP)
LH	R25, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,667 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,669 :: 		speed = Get_Step_Rate(speed,axis);
SH	R25, 4(SP)
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
LH	R25, 4(SP)
MOV.S 	S13, S0
;Kinematics.c,670 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
LW	R2, 0(R2)
MTC1	R2, S1
CVT32.W 	S1, S1
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,671 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,673 :: 		static void ResetHoming(){
;Kinematics.c,674 :: 		int i = 0;
;Kinematics.c,675 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming67:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming151
NOP	
J	L_Kinematics_ResetHoming68
NOP	
L_Kinematics_ResetHoming151:
;Kinematics.c,676 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,677 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,675 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,678 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming67
NOP	
L_Kinematics_ResetHoming68:
;Kinematics.c,679 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,686 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,688 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset153
NOP	
J	L_mc_reset70
NOP	
L__mc_reset153:
;Kinematics.c,689 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,699 :: 		switch (sys.state) {
J	L_mc_reset71
NOP	
;Kinematics.c,700 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset73:
L_mc_reset74:
L_mc_reset75:
;Kinematics.c,701 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,702 :: 		disableSpindleOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableSpindleOCx+0
NOP	
;Kinematics.c,703 :: 		DisableSteppers();
JAL	_DisableSteppers+0
NOP	
;Kinematics.c,704 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,705 :: 		}
J	L_mc_reset72
NOP	
L_mc_reset71:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset155
NOP	
J	L_mc_reset73
NOP	
L__mc_reset155:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset157
NOP	
J	L_mc_reset74
NOP	
L__mc_reset157:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset159
NOP	
J	L_mc_reset75
NOP	
L__mc_reset159:
L_mc_reset72:
;Kinematics.c,706 :: 		}
L_mc_reset70:
;Kinematics.c,707 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
