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
BNE	R2, R0, L__SetInitialSizes85
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes85:
;Kinematics.c,39 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 64
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection87
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection87:
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
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection89
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection89:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection91
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection91:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection93
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection93:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection95
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection95:
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
BEQ	R3, R2, L__SingleAxisStep97
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep97:
;Kinematics.c,94 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
;Kinematics.c,97 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 68
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 60
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,99 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep98
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep98:
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
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,110 :: 		long speed_ = 0;
SW	R25, 4(SP)
;Kinematics.c,112 :: 		STPS[axis_No].dist = labs(dist);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 20(SP)
JAL	_labs+0
NOP	
LW	R3, 20(SP)
SW	R2, 0(R3)
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
;Kinematics.c,116 :: 		Set_Axisdirection(dist,axis_No);
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,117 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart100
NOP	
J	L_Kinematics_SingleAxisStart15
NOP	
L_Kinematics_SingleAxisStart100:
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
;Kinematics.c,118 :: 		SV.Single_Dual = SINGLE;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,119 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,120 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R25, 0(R2)
;Kinematics.c,122 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,123 :: 		}
L_end_SingleAxisStart:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,128 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Kinematics.c,131 :: 		SV.dif  = 0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+20)(GP)
;Kinematics.c,138 :: 		SV.Single_Dual = DUAL;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,139 :: 		Single_Axis_Enable(axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S14, 12(SP)
SWC1	S13, 16(SP)
SWC1	S12, 20(SP)
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
LWC1	S13, 16(SP)
LWC1	S14, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,140 :: 		Single_Axis_Enable(axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S14, 12(SP)
SWC1	S13, 16(SP)
SWC1	S12, 20(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
LWC1	S13, 16(SP)
LWC1	S14, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,143 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__DualAxisStep102
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep102:
;Kinematics.c,144 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S14, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S14, S0
L_DualAxisStep17:
;Kinematics.c,147 :: 		tempA = belt_steps(axis_a,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S14, 12(SP)
SWC1	S13, 16(SP)
SWC1	S12, 20(SP)
JAL	_belt_steps+0
NOP	
LWC1	S12, 20(SP)
LWC1	S13, 16(SP)
LWC1	S14, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
; tempA start address is: 16 (R4)
MOVZ	R4, R2, R0
;Kinematics.c,148 :: 		tempB = belt_steps(axis_b,axisB);
SW	R4, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S14, 16(SP)
SWC1	S13, 20(SP)
SWC1	S12, 24(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S12, 24(SP)
LWC1	S13, 20(SP)
LWC1	S14, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R4, 8(SP)
; tempB start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,151 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep103
NOP	
J	L__DualAxisStep74
NOP	
L__DualAxisStep103:
;Kinematics.c,153 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SUBU	R2, R4, R2
; tempA end address is: 16 (R4)
; tempA start address is: 24 (R6)
MOVZ	R6, R2, R0
;Kinematics.c,154 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SUBU	R2, R5, R2
MOVZ	R5, R2, R0
; tempB end address is: 20 (R5)
; tempA end address is: 24 (R6)
;Kinematics.c,155 :: 		}
J	L_DualAxisStep18
NOP	
L__DualAxisStep74:
;Kinematics.c,151 :: 		if(gc.absolute_mode == true){
MOVZ	R6, R4, R0
;Kinematics.c,155 :: 		}
L_DualAxisStep18:
;Kinematics.c,158 :: 		Set_Axisdirection(tempA,axisA);
; tempB start address is: 20 (R5)
; tempA start address is: 24 (R6)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
MOVZ	R25, R6, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,159 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R6, 0
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep104:
; ?FLOC___DualAxisStep?T100 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T100 end address is: 16 (R4)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T100 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T100 end address is: 16 (R4)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T100 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T100 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,160 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,161 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R5, 0
BNE	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep105:
; ?FLOC___DualAxisStep?T108 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T108 end address is: 16 (R4)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T108 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T108 end address is: 16 (R4)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T108 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T108 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,164 :: 		STPS[axisA].dist =  labs(tempA);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 28(SP)
SH	R25, 8(SP)
MOVZ	R25, R6, R0
JAL	_labs+0
NOP	
LW	R3, 28(SP)
SW	R2, 0(R3)
;Kinematics.c,165 :: 		STPS[axisB].dist =  labs(tempB);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 28(SP)
MOVZ	R25, R5, R0
JAL	_labs+0
NOP	
LH	R25, 8(SP)
LW	R3, 28(SP)
SW	R2, 0(R3)
;Kinematics.c,174 :: 		if(STPS[axisA].dist >= STPS[axisB].dist){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SLT	R2, R4, R2
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep106:
; tempB end address is: 20 (R5)
;Kinematics.c,175 :: 		/* if(!SV.cir)*/speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
SEH	R26, R25
MOV.S 	S12, S14
MOVZ	R25, R6, R0
; tempA end address is: 24 (R6)
JAL	_speed_cntr_Move+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,176 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,177 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,178 :: 		SV.dif = BresDiffVal(STPS[axisB].dist,STPS[axisA].dist);//2*(SV.dy - SV.dx);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 36
LW	R2, 0(R2)
SUBU	R2, R4, R2
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,179 :: 		STPS[axisA].master = MASTER;
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,180 :: 		STPS[axisB].master = SLAVE;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,181 :: 		if(SV.prevA == axis_a){
LWC1	S0, Offset(_SV+36)(GP)
C.EQ.S 	0, S0, S12
BC1T	0, L__DualAxisStep107
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep107:
;Kinematics.c,182 :: 		bit_false(SV.mode_complete,bit(axisA));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,183 :: 		}
L_DualAxisStep24:
;Kinematics.c,184 :: 		}else{
J	L_DualAxisStep25
NOP	
L_DualAxisStep23:
;Kinematics.c,185 :: 		/* if(!SV.cir)*/speed_cntr_Move(tempB,speed,axisB);
; tempB start address is: 20 (R5)
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
MOV.S 	S12, S14
MOVZ	R25, R5, R0
; tempB end address is: 20 (R5)
JAL	_speed_cntr_Move+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,186 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,187 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,188 :: 		SV.dif = BresDiffVal(STPS[axisA].dist,STPS[axisB].dist);//2* (SV.dx - SV.dy);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R2, R5, 36
LW	R4, 0(R2)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SUBU	R2, R4, R2
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,189 :: 		STPS[axisA].master = SLAVE;
LBU	R2, 0(R5)
INS	R2, R0, 0, 1
SB	R2, 0(R5)
;Kinematics.c,190 :: 		STPS[axisB].master = MASTER;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,191 :: 		if(SV.prevB == axis_b){
LWC1	S0, Offset(_SV+40)(GP)
C.EQ.S 	0, S0, S13
BC1T	0, L__DualAxisStep108
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep108:
;Kinematics.c,192 :: 		bit_false(SV.mode_complete,bit(axisB));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,193 :: 		}
L_DualAxisStep26:
;Kinematics.c,194 :: 		}
L_DualAxisStep25:
;Kinematics.c,197 :: 		SV.prevA = axis_a;
SWC1	S12, Offset(_SV+36)(GP)
;Kinematics.c,198 :: 		SV.prevB = axis_b;
SWC1	S13, Offset(_SV+40)(GP)
;Kinematics.c,200 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,201 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,205 :: 		if(SV.mode_complete == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep109:
;Kinematics.c,206 :: 		StopAxis(axisA);
SH	R26, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R26, 8(SP)
;Kinematics.c,207 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Kinematics.c,208 :: 		return;
J	L_end_DualAxisStep
NOP	
;Kinematics.c,209 :: 		}
L_DualAxisStep27:
;Kinematics.c,211 :: 		Start_Interpolation(axisA,axisB);
JAL	_Start_Interpolation+0
NOP	
;Kinematics.c,212 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,248 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
LH	R2, 80(SP)
SH	R2, 80(SP)
LH	R2, 82(SP)
SH	R2, 82(SP)
; invert_feed_rate start address is: 8 (R2)
LBU	R2, 84(SP)
; invert_feed_rate end address is: 8 (R2)
; isclockwise start address is: 28 (R7)
LBU	R7, 85(SP)
;Kinematics.c,249 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 64
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,255 :: 		int count = 0;
;Kinematics.c,256 :: 		char limit_error = 0;
;Kinematics.c,259 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R6, R2, 2
ADDU	R2, R25, R6
LWC1	S1, 0(R2)
ADDU	R5, R27, R6
LWC1	S0, 0(R5)
ADD.S 	S3, S1, S0
SWC1	S3, 24(SP)
;Kinematics.c,260 :: 		center_axis1            = position[axis_1] + offset[axis_1];
LH	R2, 80(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S1, 0(R2)
ADDU	R3, R27, R4
LWC1	S0, 0(R3)
ADD.S 	S2, S1, S0
SWC1	S2, 28(SP)
;Kinematics.c,261 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
LWC1	S1, 0(R5)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 32(SP)
;Kinematics.c,262 :: 		r_axis1                 = -offset[axis_1];
LWC1	S1, 0(R3)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 36(SP)
;Kinematics.c,263 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R6
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,264 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,265 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 82(SP)
SLL	R4, R2, 2
ADDU	R2, R26, R4
LWC1	S1, 0(R2)
ADDU	R3, R25, R4
LWC1	S0, 0(R3)
SUB.S 	S0, S1, S0
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,267 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 64
ADDU	R2, R2, R4
LWC1	S0, 0(R3)
SWC1	S0, 0(R2)
;Kinematics.c,274 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S5
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S4
SUB.S 	S2, S1, S0
;Kinematics.c,275 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S4
; rt_axis0 end address is: 32 (R8)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S5
; rt_axis1 end address is: 40 (R10)
ADD.S 	S0, S1, S0
;Kinematics.c,283 :: 		angular_travel = atan2(y,x);
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
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,286 :: 		if(isclockwise > 0) {
ANDI	R2, R7, 255
; isclockwise end address is: 28 (R7)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc111
NOP	
J	L_mc_arc28
NOP	
L__mc_arc111:
;Kinematics.c,287 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc112
NOP	
J	L__mc_arc78
NOP	
L__mc_arc112:
;Kinematics.c,288 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
SUB.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc29
NOP	
L__mc_arc78:
;Kinematics.c,287 :: 		if (angular_travel >= 0)
;Kinematics.c,288 :: 		angular_travel -= PIx2;
L_mc_arc29:
;Kinematics.c,289 :: 		}else {
; angular_travel start address is: 32 (R8)
J	L_mc_arc30
NOP	
L_mc_arc28:
;Kinematics.c,290 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc113
NOP	
J	L__mc_arc79
NOP	
L__mc_arc113:
;Kinematics.c,291 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc31
NOP	
L__mc_arc79:
;Kinematics.c,290 :: 		if(angular_travel <= 0)
;Kinematics.c,291 :: 		angular_travel += PIx2;
L_mc_arc31:
;Kinematics.c,292 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc30:
;Kinematics.c,311 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 32 (R8)
SWC1	S12, 4(SP)
MOV.S 	S12, S3
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S4, S13
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
;Kinematics.c,312 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc114
NOP	
J	L_mc_arc32
NOP	
L__mc_arc114:
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 32 (R8)
; mm_of_travel end address is: 16 (R4)
J	L_end_mc_arc
NOP	
L_mc_arc32:
;Kinematics.c,314 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 32 (R8)
; linear_travel start address is: 24 (R6)
LWC1	S0, Offset(_settings+36)(GP)
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
SWC1	S0, 48(SP)
;Kinematics.c,323 :: 		theta_per_segment = angular_travel/segments;
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
SWC1	S2, 40(SP)
;Kinematics.c,328 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S3, S0
; linear_travel end address is: 24 (R6)
SWC1	S0, 44(SP)
;Kinematics.c,331 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 52(SP)
;Kinematics.c,332 :: 		sin_T = theta_per_segment;
SWC1	S2, 56(SP)
;Kinematics.c,335 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 64
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,336 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,337 :: 		DisableStepperInterrupt(X);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
MOVZ	R25, R0, R0
JAL	_DisableStepperInterrupt+0
NOP	
;Kinematics.c,338 :: 		DisableStepperInterrupt(Y);
ORI	R25, R0, 1
JAL	_DisableStepperInterrupt+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,352 :: 		for (i = FLOAT_INC1; i<segments; i+=FLOAT_INC1) {
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, 60(SP)
L_mc_arc33:
LWC1	S1, 48(SP)
LWC1	S0, 60(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc115
NOP	
J	L_mc_arc34
NOP	
L__mc_arc115:
;Kinematics.c,353 :: 		if (count < settings.n_arc_correction) {
LHU	R3, Offset(_settings+48)(GP)
LH	R2, 76(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc36
NOP	
L__mc_arc116:
;Kinematics.c,355 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 56(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 52(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,356 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 52(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 56(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 32(SP)
;Kinematics.c,357 :: 		r_axis1 = r_axisi;
SWC1	S3, 36(SP)
;Kinematics.c,358 :: 		count++;
LH	R2, 76(SP)
ADDIU	R2, R2, 1
SH	R2, 76(SP)
;Kinematics.c,359 :: 		} else {
J	L_mc_arc37
NOP	
L_mc_arc36:
;Kinematics.c,362 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 60(SP)
MUL.S 	S0, S0, S1
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,363 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 60(SP)
MUL.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,364 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R4, R27, R2
LWC1	S2, 0(R4)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S2
MUL.S 	S2, S1, S3
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R3, R27, R2
LWC1	S1, 0(R3)
MUL.S 	S1, S1, S0
ADD.S 	S1, S2, S1
SWC1	S1, 32(SP)
;Kinematics.c,365 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
LWC1	S2, 0(R4)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S2
MUL.S 	S1, S1, S0
LWC1	S0, 0(R3)
MUL.S 	S0, S0, S3
; cos_Ti end address is: 24 (R6)
SUB.S 	S0, S1, S0
SWC1	S0, 36(SP)
;Kinematics.c,366 :: 		count = 0;
SH	R0, 76(SP)
;Kinematics.c,367 :: 		}
L_mc_arc37:
;Kinematics.c,370 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 64
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,371 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,372 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 82(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 44(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,373 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPx start address is: 128 (R32)
MOV.S 	S16, S0
;Kinematics.c,374 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 80(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPy start address is: 136 (R34)
MOV.S 	S17, S0
;Kinematics.c,376 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc118
NOP	
J	L__mc_arc80
NOP	
L__mc_arc118:
;Kinematics.c,377 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S16, S0
; nPx end address is: 128 (R32)
; nPx start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,378 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S17, S0
; nPy end address is: 136 (R34)
; nPy start address is: 16 (R4)
MOV.S 	S2, S0
; nPy end address is: 16 (R4)
; nPx end address is: 8 (R2)
MOV.S 	S0, S2
;Kinematics.c,379 :: 		}
J	L_mc_arc38
NOP	
L__mc_arc80:
;Kinematics.c,376 :: 		if(gc.absolute_mode){
MOV.S 	S0, S17
MOV.S 	S1, S16
;Kinematics.c,379 :: 		}
L_mc_arc38:
;Kinematics.c,402 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
; nPy start address is: 0 (R0)
; nPx start address is: 8 (R2)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
LH	R26, 80(SP)
SEH	R25, R28
MOV.S 	S14, S12
MOV.S 	S13, S0
; nPy end address is: 0 (R0)
MOV.S 	S12, S1
; nPx end address is: 8 (R2)
JAL	_DualAxisStep+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,407 :: 		while(1){
L_mc_arc39:
;Kinematics.c,412 :: 		if(!Get_Axis_IEnable_States()||SV.mode_complete < 1)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
JAL	_Get_Axis_IEnable_States+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BNE	R2, R0, L__mc_arc120
NOP	
J	L__mc_arc77
NOP	
L__mc_arc120:
LH	R2, Offset(_SV+2)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__mc_arc121
NOP	
J	L__mc_arc76
NOP	
L__mc_arc121:
J	L_mc_arc43
NOP	
L__mc_arc77:
L__mc_arc76:
;Kinematics.c,413 :: 		break;
J	L_mc_arc40
NOP	
L_mc_arc43:
;Kinematics.c,414 :: 		}
J	L_mc_arc39
NOP	
L_mc_arc40:
;Kinematics.c,352 :: 		for (i = FLOAT_INC1; i<segments; i+=FLOAT_INC1) {
LWC1	S1, 60(SP)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 60(SP)
;Kinematics.c,436 :: 		}
J	L_mc_arc33
NOP	
L_mc_arc34:
;Kinematics.c,439 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
LH	R2, 80(SP)
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
LH	R26, 80(SP)
SEH	R25, R28
MOV.S 	S14, S12
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,446 :: 		SV.mode_complete = 0;
SH	R0, Offset(_SV+2)(GP)
;Kinematics.c,447 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,451 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,452 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,453 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,461 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,462 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection124
NOP	
J	L_GetAxisDirection44
NOP	
L__GetAxisDirection124:
; ?FLOC___GetAxisDirection?T423 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T423 end address is: 8 (R2)
J	L_GetAxisDirection45
NOP	
L_GetAxisDirection44:
; ?FLOC___GetAxisDirection?T423 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T423 end address is: 8 (R2)
L_GetAxisDirection45:
; ?FLOC___GetAxisDirection?T423 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T423 end address is: 8 (R2)
;Kinematics.c,463 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
__Home:
;Kinematics.c,475 :: 		int _Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,478 :: 		float mm2run = -1.0;
; mm2run start address is: 128 (R32)
LUI	R32, 49024
ORI	R32, R32, 0
;Kinematics.c,480 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L___Home126
NOP	
J	L__Home46
NOP	
L___Home126:
;Kinematics.c,482 :: 		sys.state= STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,484 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,485 :: 		homing[axis].home_state = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,488 :: 		err_cntr = 0;
SW	R0, Offset(_Home_err_cntr_L0+0)(GP)
;Kinematics.c,491 :: 		EnableStepper(axis);//sort this out
SWC1	S16, 4(SP)
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
LWC1	S16, 4(SP)
;Kinematics.c,498 :: 		}
L__Home46:
;Kinematics.c,500 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L___Home127
NOP	
J	L__Home47
NOP	
L___Home127:
;Kinematics.c,502 :: 		switch(homing[axis].home_state){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SW	R2, 12(SP)
J	L__Home48
NOP	
;Kinematics.c,503 :: 		case 0: //start homing
L__Home50:
;Kinematics.c,506 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,509 :: 		if(!Test_Port_Pins(axis)){
SWC1	S16, 4(SP)
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
LWC1	S16, 4(SP)
BEQ	R2, R0, L___Home128
NOP	
J	L__Home51
NOP	
L___Home128:
;Kinematics.c,512 :: 		speed = 20.0;//settings.homing_feed_rate;
LUI	R2, 16800
ORI	R2, R2, 0
SW	R2, Offset(_Home_speed_L0+0)(GP)
;Kinematics.c,515 :: 		homing[axis].home_state = HOME_BACK_OFF;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
ORI	R2, R0, 3
SH	R2, 0(R3)
;Kinematics.c,518 :: 		Home_Axis(mm2run,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MOV.S 	S12, S16
; mm2run end address is: 128 (R32)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,524 :: 		}
J	L__Home52
NOP	
L__Home51:
;Kinematics.c,528 :: 		speed = 15.0;
LUI	R2, 16752
ORI	R2, R2, 0
SW	R2, Offset(_Home_speed_L0+0)(GP)
;Kinematics.c,530 :: 		mm2run = To_Millimeters(max_sizes[axis]);
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
SH	R25, 4(SP)
LWC1	S12, 0(R2)
JAL	_To_Millimeters+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,531 :: 		Home_Axis(-mm2run,speed,axis);
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SH	R25, 4(SP)
LWC1	S13, Offset(_Home_speed_L0+0)(GP)
MOV.S 	S12, S0
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,533 :: 		homing[axis].home_state = HOME;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
ORI	R2, R0, 2
SH	R2, 0(R3)
;Kinematics.c,539 :: 		}
L__Home52:
;Kinematics.c,541 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,542 :: 		case HOME: //Home
L__Home53:
;Kinematics.c,544 :: 		if(Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L___Home130
NOP	
J	L__Home54
NOP	
L___Home130:
;Kinematics.c,545 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,546 :: 		}
L__Home54:
;Kinematics.c,548 :: 		speed = 5.0;
LUI	R2, 16544
ORI	R2, R2, 0
SW	R2, Offset(_Home_speed_L0+0)(GP)
;Kinematics.c,550 :: 		homing[axis].home_state = HOME_BACK_OFF;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
ORI	R2, R0, 3
SH	R2, 0(R3)
;Kinematics.c,556 :: 		if(homing[axis].home_state == HOME_BACK_OFF)
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 3
BEQ	R3, R2, L___Home131
NOP	
J	L__Home56
NOP	
L___Home131:
;Kinematics.c,558 :: 		mm2run = To_Millimeters(2.5);
LUI	R2, 16416
ORI	R2, R2, 0
SH	R25, 4(SP)
MTC1	R2, S12
JAL	_To_Millimeters+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,559 :: 		Home_Axis(mm2run,speed, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_Home_speed_L0+0)(GP)
MOV.S 	S12, S0
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,566 :: 		}
L__Home56:
;Kinematics.c,567 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,568 :: 		case HOME_BACK_OFF: //Home retract off home position
L__Home57:
;Kinematics.c,570 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L___Home132
NOP	
J	L__Home58
NOP	
L___Home132:
;Kinematics.c,571 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,572 :: 		}
L__Home58:
;Kinematics.c,574 :: 		if((GET_RunState(axis) == STOP) || (err_cntr > 500000)){
SH	R25, 4(SP)
JAL	_GET_RunState+0
NOP	
LH	R25, 4(SP)
SEH	R2, R2
BNE	R2, R0, L___Home134
NOP	
J	L___Home83
NOP	
L___Home134:
LW	R3, Offset(_Home_err_cntr_L0+0)(GP)
LUI	R2, 7
ORI	R2, R2, 41248
SLT	R2, R2, R3
BEQ	R2, R0, L___Home135
NOP	
J	L___Home82
NOP	
L___Home135:
J	L__Home61
NOP	
L___Home83:
L___Home82:
;Kinematics.c,576 :: 		mm2run = To_Millimeters(20.0);
LUI	R2, 16800
ORI	R2, R2, 0
SH	R25, 4(SP)
MTC1	R2, S12
JAL	_To_Millimeters+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,577 :: 		Home_Axis(-mm2run,speed,axis);
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SH	R25, 4(SP)
LWC1	S13, Offset(_Home_speed_L0+0)(GP)
MOV.S 	S12, S0
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,578 :: 		homing[axis].home_state = BACK_HOME;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
ORI	R2, R0, 4
SH	R2, 0(R3)
;Kinematics.c,585 :: 		}
L__Home61:
;Kinematics.c,586 :: 		err_cntr++;
LW	R2, Offset(_Home_err_cntr_L0+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_Home_err_cntr_L0+0)(GP)
;Kinematics.c,587 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,588 :: 		case BACK_HOME: //Back to home slowly
L__Home62:
;Kinematics.c,590 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L___Home136
NOP	
J	L__Home63
NOP	
L___Home136:
;Kinematics.c,591 :: 		homing[axis].home_state = HOME_COMPLETE;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
ORI	R2, R0, 5
SH	R2, 0(R3)
;Kinematics.c,592 :: 		}
L__Home63:
;Kinematics.c,594 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,595 :: 		case HOME_COMPLETE: //Home Complete
L__Home64:
;Kinematics.c,598 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,602 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,605 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,612 :: 		break;
J	L__Home49
NOP	
;Kinematics.c,613 :: 		}
L__Home48:
; mm2run start address is: 128 (R32)
LW	R4, 12(SP)
LHU	R2, 0(R4)
ANDI	R2, R2, 65535
BNE	R2, R0, L___Home138
NOP	
J	L__Home50
NOP	
L___Home138:
; mm2run end address is: 128 (R32)
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 2
BNE	R3, R2, L___Home140
NOP	
J	L__Home53
NOP	
L___Home140:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 3
BNE	R3, R2, L___Home142
NOP	
J	L__Home57
NOP	
L___Home142:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 4
BNE	R3, R2, L___Home144
NOP	
J	L__Home62
NOP	
L___Home144:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 5
BNE	R3, R2, L___Home146
NOP	
J	L__Home64
NOP	
L___Home146:
L__Home49:
;Kinematics.c,614 :: 		}
L__Home47:
;Kinematics.c,615 :: 		return axis;
SEH	R2, R25
;Kinematics.c,616 :: 		}
L_end__Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of __Home
Kinematics_Home_Axis:
;Kinematics.c,620 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,622 :: 		StopAxis(axis);
SW	R25, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
SWC1	S13, 16(SP)
SWC1	S12, 20(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 20(SP)
LWC1	S13, 16(SP)
LH	R25, 12(SP)
;Kinematics.c,623 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,633 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R2, 24(SP)
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
LW	R3, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,638 :: 		SingleAxisStart(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
LW	R2, 0(R2)
MOV.S 	S12, S13
SEH	R26, R25
MOVZ	R25, R2, R0
JAL	Kinematics_SingleAxisStart+0
NOP	
;Kinematics.c,640 :: 		}
L_end_Home_Axis:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,645 :: 		static void ResetHoming(){
;Kinematics.c,646 :: 		int i = 0;
;Kinematics.c,647 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming65:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming149
NOP	
J	L_Kinematics_ResetHoming66
NOP	
L_Kinematics_ResetHoming149:
;Kinematics.c,648 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,649 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,647 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,650 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming65
NOP	
L_Kinematics_ResetHoming66:
;Kinematics.c,651 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,659 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,661 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset151
NOP	
J	L_mc_reset68
NOP	
L__mc_reset151:
;Kinematics.c,662 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,672 :: 		switch (sys.state) {
J	L_mc_reset69
NOP	
;Kinematics.c,673 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset71:
L_mc_reset72:
L_mc_reset73:
;Kinematics.c,674 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,675 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,676 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,677 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,678 :: 		}
J	L_mc_reset70
NOP	
L_mc_reset69:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset153
NOP	
J	L_mc_reset71
NOP	
L__mc_reset153:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset155
NOP	
J	L_mc_reset72
NOP	
L__mc_reset155:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset157
NOP	
J	L_mc_reset73
NOP	
L__mc_reset157:
L_mc_reset70:
;Kinematics.c,679 :: 		}
L_mc_reset68:
;Kinematics.c,680 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
