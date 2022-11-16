_SetInitialSizes:
;Kinematics.c,20 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,21 :: 		int i = 0;
;Kinematics.c,23 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+4)(GP)
;Kinematics.c,25 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__SetInitialSizes101
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes101:
;Kinematics.c,26 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 92
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
;Kinematics.c,25 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,27 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,28 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
_SingleAxisStep:
;Kinematics.c,35 :: 		void SingleAxisStep(double newxyz,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,36 :: 		long tempA = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
;Kinematics.c,37 :: 		int dir = 0;
;Kinematics.c,38 :: 		Single_Axis_Enable(axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
;Kinematics.c,39 :: 		tempA = belt_steps(newxyz);
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
; tempA start address is: 16 (R4)
MOVZ	R4, R2, R0
;Kinematics.c,40 :: 		speed_cntr_Move(tempA , speed , axis_No);
SW	R4, 12(SP)
SH	R26, 16(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 16(SP)
LW	R4, 12(SP)
;Kinematics.c,45 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
SLTI	R2, R4, 0
BNE	R2, R0, L__SingleAxisStep103
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep103:
; ?FLOC___SingleAxisStep?T20 start address is: 20 (R5)
ORI	R5, R0, 255
; ?FLOC___SingleAxisStep?T20 end address is: 20 (R5)
J	L_SingleAxisStep4
NOP	
L_SingleAxisStep3:
; ?FLOC___SingleAxisStep?T20 start address is: 20 (R5)
ORI	R5, R0, 1
; ?FLOC___SingleAxisStep?T20 end address is: 20 (R5)
L_SingleAxisStep4:
; ?FLOC___SingleAxisStep?T20 start address is: 20 (R5)
SEB	R2, R5
; ?FLOC___SingleAxisStep?T20 end address is: 20 (R5)
SH	R2, 0(R3)
;Kinematics.c,46 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,47 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,49 :: 		STPS[axis_No].dist = tempA - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 36
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SUBU	R2, R4, R2
SW	R2, 0(R3)
;Kinematics.c,50 :: 		STPS[axis_No].dist = labs(tempA);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 24(SP)
MOVZ	R25, R4, R0
JAL	_labs+0
NOP	
LW	R3, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,51 :: 		dir = (tempA < 0)? CCW : CW;
SLTI	R2, R4, 0
BNE	R2, R0, L__SingleAxisStep104
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep104:
; ?FLOC___SingleAxisStep?T48 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___SingleAxisStep?T48 end address is: 8 (R2)
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep5:
; ?FLOC___SingleAxisStep?T48 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SingleAxisStep?T48 end address is: 8 (R2)
L_SingleAxisStep6:
; ?FLOC___SingleAxisStep?T48 start address is: 8 (R2)
; dir start address is: 20 (R5)
SEB	R5, R2
; ?FLOC___SingleAxisStep?T48 end address is: 8 (R2)
;Kinematics.c,52 :: 		switch(axis_No){
J	L_SingleAxisStep7
NOP	
;Kinematics.c,53 :: 		case X:
L_SingleAxisStep9:
;Kinematics.c,54 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R5, 1
; dir end address is: 20 (R5)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,55 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,56 :: 		case Y:
L_SingleAxisStep10:
;Kinematics.c,57 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 20 (R5)
ANDI	R3, R5, 1
; dir end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,58 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,59 :: 		case Z:
L_SingleAxisStep11:
;Kinematics.c,60 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 20 (R5)
ANDI	R3, R5, 1
; dir end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,61 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,62 :: 		case A:
L_SingleAxisStep12:
;Kinematics.c,63 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 20 (R5)
ANDI	R3, R5, 1
; dir end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,64 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,65 :: 		default: break;
L_SingleAxisStep13:
J	L_SingleAxisStep8
NOP	
;Kinematics.c,66 :: 		}
L_SingleAxisStep7:
; dir start address is: 20 (R5)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep106
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep106:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep108
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep108:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep110
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep110:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep112
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep112:
; dir end address is: 20 (R5)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,68 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,69 :: 		STPS[axis_No].mmToTravel = tempA;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R4, 0(R2)
; tempA end address is: 16 (R4)
;Kinematics.c,71 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,73 :: 		}
L_end_SingleAxisStep:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,80 :: 		void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){//,int xyza){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,83 :: 		SV.over=0;
SW	R27, 4(SP)
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,84 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,86 :: 		tempA = belt_steps(axis_a);
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
;Kinematics.c,87 :: 		tempB = belt_steps(axis_b);
SH	R26, 12(SP)
SH	R25, 14(SP)
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
SW	R2, 24(SP)
;Kinematics.c,90 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,91 :: 		Single_Axis_Enable(axisA);
SH	R25, 14(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,92 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,95 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep14
NOP	
L__DualAxisStep114:
;Kinematics.c,96 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,97 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,98 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,99 :: 		}
L_DualAxisStep14:
;Kinematics.c,102 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep115
NOP	
J	L_DualAxisStep15
NOP	
L__DualAxisStep115:
; ?FLOC___DualAxisStep?T81 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T81 end address is: 24 (R6)
J	L_DualAxisStep16
NOP	
L_DualAxisStep15:
; ?FLOC___DualAxisStep?T81 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T81 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep16:
; ?FLOC___DualAxisStep?T81 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T81 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,103 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep116:
; ?FLOC___DualAxisStep?T89 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T89 end address is: 24 (R6)
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T89 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T89 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T89 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T89 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,106 :: 		SV.dx   = tempA - SV.px;
LW	R3, Offset(_SV+32)(GP)
LW	R2, 20(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,107 :: 		SV.dy   = tempB - SV.py;
LW	R3, Offset(_SV+36)(GP)
LW	R2, 24(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,111 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep117
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep117:
; ?FLOC___DualAxisStep?T93 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T93 end address is: 8 (R2)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T93 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T93 end address is: 8 (R2)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T93 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T93 end address is: 8 (R2)
;Kinematics.c,112 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep118:
; ?FLOC___DualAxisStep?T95 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T95 end address is: 8 (R2)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T95 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T95 end address is: 8 (R2)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T95 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T95 end address is: 8 (R2)
;Kinematics.c,114 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,115 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,118 :: 		SV.dx = labs(SV.dx);
SH	R25, 8(SP)
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,119 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,123 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep119
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep119:
;Kinematics.c,124 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep120
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep120:
;Kinematics.c,125 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
L_DualAxisStep24:
;Kinematics.c,127 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,128 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,129 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,130 :: 		}
J	L_DualAxisStep25
NOP	
L_DualAxisStep23:
;Kinematics.c,132 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep121
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep121:
;Kinematics.c,133 :: 		speed_cntr_Move(tempB,speed,axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SW	R27, 12(SP)
LW	R25, 24(SP)
SEH	R27, R26
LW	R26, 12(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
L_DualAxisStep26:
;Kinematics.c,135 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,136 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,137 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,138 :: 		}
L_DualAxisStep25:
;Kinematics.c,140 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,141 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,142 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,143 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
LW	R2, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,145 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,153 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,172 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -104
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 48 (R12)
LWC1	S6, 104(SP)
; i start address is: 8 (R2)
LWC1	S1, 108(SP)
; j start address is: 16 (R4)
LWC1	S2, 112(SP)
; k start address is: 0 (R0)
LWC1	S0, 116(SP)
; k end address is: 0 (R0)
;Kinematics.c,173 :: 		unsigned short isclockwise = 0;
;Kinematics.c,174 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,178 :: 		double x = 0.00;
;Kinematics.c,179 :: 		double y = 0.00;
;Kinematics.c,180 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,185 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 24
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,186 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,187 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Kinematics.c,188 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 48
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,189 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,190 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Kinematics.c,191 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 72
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,192 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,194 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk123
NOP	
J	L_r_or_ijk27
NOP	
L__r_or_ijk123:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,258 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 48
LH	R2, 96(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 24
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 32 (R8)
MOV.S 	S4, S3
;Kinematics.c,260 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 98(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,264 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,267 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SH	R25, 20(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 100(SP)
MOV.S 	S13, S5
MOV.S 	S12, S4
JAL	_hypot+0
NOP	
LH	R25, 20(SP)
LWC1	S1, 100(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,269 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk124
NOP	
J	L__r_or_ijk89
NOP	
L__r_or_ijk124:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk28
NOP	
L__r_or_ijk89:
L_r_or_ijk28:
;Kinematics.c,292 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk125
NOP	
J	L__r_or_ijk90
NOP	
L__r_or_ijk125:
;Kinematics.c,293 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,294 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,295 :: 		}
J	L_r_or_ijk29
NOP	
L__r_or_ijk90:
;Kinematics.c,292 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,295 :: 		}
L_r_or_ijk29:
;Kinematics.c,298 :: 		i =  0.5*(x-(y*h_x2_div_d));
; r start address is: 16 (R4)
; h_x2_div_d start address is: 24 (R6)
MUL.S 	S0, S5, S3
SUB.S 	S1, S4, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Kinematics.c,300 :: 		j =  0.5*(y+(x*h_x2_div_d));
MUL.S 	S0, S4, S3
; x end address is: 32 (R8)
; h_x2_div_d end address is: 24 (R6)
ADD.S 	S1, S5, S0
; y end address is: 40 (R10)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Kinematics.c,301 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk30
NOP	
L_r_or_ijk27:
;Kinematics.c,304 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
; j start address is: 16 (R4)
; i start address is: 8 (R2)
SH	R25, 20(SP)
; j end address is: 16 (R4)
MOV.S 	S13, S2
MOV.S 	S12, S1
; i end address is: 8 (R2)
JAL	_hypot+0
NOP	
LH	R25, 20(SP)
; r start address is: 8 (R2)
MOV.S 	S1, S0
; r end address is: 8 (R2)
MOV.S 	S0, S1
;Kinematics.c,305 :: 		}
L_r_or_ijk30:
;Kinematics.c,307 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,308 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk126
NOP	
J	L__r_or_ijk91
NOP	
L__r_or_ijk126:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk31
NOP	
L__r_or_ijk91:
L_r_or_ijk31:
;Kinematics.c,312 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 72
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,313 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
ADDIU	SP, SP, -8
SB	R6, 5(SP)
; r end address is: 0 (R0)
LBU	R6, Offset(_gc+2)(GP)
SB	R6, 4(SP)
;Kinematics.c,312 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R6, R0, 2
SH	R6, 2(SP)
SH	R26, 0(SP)
;Kinematics.c,313 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MTC1	R2, S12
;Kinematics.c,312 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R5, R0
MOVZ	R25, R3, R0
;Kinematics.c,313 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S13, S0
; isclockwise end address is: 24 (R6)
;Kinematics.c,312 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R4, R0
;Kinematics.c,313 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
;Kinematics.c,314 :: 		}
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 104
JR	RA
NOP	
; end of _r_or_ijk
_hypot:
;Kinematics.c,319 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,320 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,321 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_mc_arc:
;Kinematics.c,350 :: 		int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
LH	R2, 80(SP)
SH	R2, 80(SP)
LH	R2, 82(SP)
SH	R2, 82(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 84(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 85(SP)
;Kinematics.c,352 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,353 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LH	R2, 80(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,354 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 82(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,355 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,356 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,357 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,358 :: 		double rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,359 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,360 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,361 :: 		double angular_travel          = 0.00;
;Kinematics.c,362 :: 		double mm_of_travel            = 0.00;
;Kinematics.c,363 :: 		double rads                    = 0.00;
;Kinematics.c,364 :: 		unsigned int segments          = 0;
;Kinematics.c,365 :: 		double cos_T                   = 0.00;
;Kinematics.c,366 :: 		double sin_T                   = 0.00;
;Kinematics.c,372 :: 		unsigned int i = 0;
;Kinematics.c,373 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 52(SP)
ORI	R30, R0, 3
SB	R30, 54(SP)
MOVZ	R30, R0, R0
SB	R30, 55(SP)
;Kinematics.c,374 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,375 :: 		char limit_error = 0;
;Kinematics.c,377 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 36
LH	R2, 82(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,381 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S3
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S4
ADD.S 	S2, S1, S0
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S4
; rt_axis1 end address is: 32 (R8)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S3
; rt_axis0 end address is: 24 (R6)
SUB.S 	S0, S1, S0
SWC1	S13, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 8(SP)
LWC1	S13, 4(SP)
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,383 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc130
NOP	
J	L__mc_arc88
NOP	
L__mc_arc130:
; isclockwise end address is: 28 (R7)
;Kinematics.c,385 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc131
NOP	
J	L_mc_arc33
NOP	
L__mc_arc131:
;Kinematics.c,386 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc34
NOP	
L_mc_arc33:
;Kinematics.c,388 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc132
NOP	
J	L__mc_arc87
NOP	
L__mc_arc132:
;Kinematics.c,389 :: 		angular_travel += 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc35
NOP	
L__mc_arc87:
;Kinematics.c,388 :: 		if(angular_travel <= 0)
;Kinematics.c,389 :: 		angular_travel += 2*M_PI;
L_mc_arc35:
;Kinematics.c,390 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc34:
;Kinematics.c,391 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S3, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc32
NOP	
L__mc_arc88:
;Kinematics.c,383 :: 		if(isclockwise) {
MOV.S 	S3, S4
;Kinematics.c,391 :: 		}
L_mc_arc32:
;Kinematics.c,394 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 24 (R6)
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S3, S13
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
;Kinematics.c,395 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc133
NOP	
J	L_mc_arc36
NOP	
L__mc_arc133:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; angular_travel end address is: 24 (R6)
; mm_of_travel end address is: 16 (R4)
J	L_end_mc_arc
NOP	
L_mc_arc36:
;Kinematics.c,397 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 24 (R6)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 24 (R6)
LUI	R2, 16204
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 64(SP)
;Kinematics.c,401 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc135
NOP	
J	L_mc_arc37
NOP	
L__mc_arc135:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,402 :: 		feed_rate *= segments;
LHU	R2, 64(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc37:
;Kinematics.c,405 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 64(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S3, S0
; angular_travel end address is: 24 (R6)
SWC1	S2, 56(SP)
;Kinematics.c,409 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 60(SP)
;Kinematics.c,412 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 68(SP)
;Kinematics.c,413 :: 		sin_T = theta_per_segment;
SWC1	S2, 72(SP)
;Kinematics.c,415 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 36
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,416 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,417 :: 		OC5IE_bit = OC2IE_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
LBU	R2, Offset(-1082064703)(GP)
EXT	R3, R2, 4, 1
LBU	R2, Offset(-1082064701)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(-1082064701)(GP)
;Kinematics.c,418 :: 		i = 0;
SH	R0, 76(SP)
;Kinematics.c,423 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc38:
LHU	R3, 64(SP)
LHU	R2, 76(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc136
NOP	
J	L_mc_arc39
NOP	
L__mc_arc136:
;Kinematics.c,425 :: 		if (count < n_arc_correction) {
LBU	R3, 54(SP)
LH	R2, 52(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc137
NOP	
J	L_mc_arc40
NOP	
L__mc_arc137:
;Kinematics.c,427 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 72(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 68(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,428 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 68(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 72(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,429 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,430 :: 		count++;
LH	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,431 :: 		} else {
J	L_mc_arc41
NOP	
L_mc_arc40:
;Kinematics.c,434 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 56(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,435 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 56(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,436 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
;Kinematics.c,437 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,438 :: 		count = 0;
SH	R0, 52(SP)
;Kinematics.c,439 :: 		}
L_mc_arc41:
;Kinematics.c,442 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,443 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,444 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 82(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 60(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,445 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,446 :: 		position[axis_0] = arc_target[axis_0];
SWC1	S1, 0(R2)
;Kinematics.c,447 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 80(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPy start address is: 0 (R0)
;Kinematics.c,448 :: 		position[axis_1] = arc_target[axis_1];
SWC1	S1, 0(R2)
;Kinematics.c,450 :: 		STPS[axis_0].step_delay = 1000;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,451 :: 		STPS[axis_1].step_delay = 1000;
LH	R3, 80(SP)
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,459 :: 		SV.cir = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,460 :: 		DualAxisStep(nPx, nPy,axis_0,axis_1,1000);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1000
LH	R26, 80(SP)
SEH	R25, R28
MOV.S 	S13, S0
; nPy end address is: 0 (R0)
MOV.S 	S12, S2
; nPx end address is: 16 (R4)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,462 :: 		while(1){
L_mc_arc42:
;Kinematics.c,464 :: 		if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SEH	R25, R28
JAL	_Test_Port_Pins+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc138
NOP	
J	L__mc_arc84
NOP	
L__mc_arc138:
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LH	R25, 80(SP)
JAL	_Test_Port_Pins+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc139
NOP	
J	L__mc_arc83
NOP	
L__mc_arc139:
J	L_mc_arc46
NOP	
L__mc_arc84:
L__mc_arc83:
;Kinematics.c,465 :: 		disableOCx();
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_disableOCx+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,466 :: 		limit_error = 1;
ORI	R2, R0, 1
SB	R2, 55(SP)
;Kinematics.c,467 :: 		}
L_mc_arc46:
;Kinematics.c,469 :: 		if(!OC5IE_bit && !OC2IE_bit)
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__mc_arc140
NOP	
J	L__mc_arc86
NOP	
L__mc_arc140:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__mc_arc141
NOP	
J	L__mc_arc85
NOP	
L__mc_arc141:
L__mc_arc81:
;Kinematics.c,470 :: 		break;
J	L_mc_arc43
NOP	
;Kinematics.c,469 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc86:
L__mc_arc85:
;Kinematics.c,471 :: 		}
J	L_mc_arc42
NOP	
L_mc_arc43:
;Kinematics.c,475 :: 		if(limit_error)
LBU	R2, 55(SP)
BNE	R2, R0, L__mc_arc143
NOP	
J	L_mc_arc50
NOP	
L__mc_arc143:
;Kinematics.c,476 :: 		break;
J	L_mc_arc39
NOP	
L_mc_arc50:
;Kinematics.c,477 :: 		i++;
LHU	R2, 76(SP)
ADDIU	R2, R2, 1
SH	R2, 76(SP)
;Kinematics.c,478 :: 		}
J	L_mc_arc38
NOP	
L_mc_arc39:
;Kinematics.c,481 :: 		while(DMA_Busy(1));
L_mc_arc51:
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BNE	R2, R0, L__mc_arc145
NOP	
J	L_mc_arc52
NOP	
L__mc_arc145:
J	L_mc_arc51
NOP	
L_mc_arc52:
;Kinematics.c,482 :: 		dma_printf("\n%s","Arc Finnished");
ORI	R30, R0, 10
SB	R30, 48(SP)
ORI	R30, R0, 37
SB	R30, 49(SP)
ORI	R30, R0, 115
SB	R30, 50(SP)
MOVZ	R30, R0, R0
SB	R30, 51(SP)
ADDIU	R3, SP, 48
LUI	R2, hi_addr(?lstr_2_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_2_Kinematics+0)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,485 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _mc_arc
_GetAxisDirection:
;Kinematics.c,495 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,496 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection147
NOP	
J	L_GetAxisDirection53
NOP	
L__GetAxisDirection147:
; ?FLOC___GetAxisDirection?T409 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T409 end address is: 8 (R2)
J	L_GetAxisDirection54
NOP	
L_GetAxisDirection53:
; ?FLOC___GetAxisDirection?T409 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T409 end address is: 8 (R2)
L_GetAxisDirection54:
; ?FLOC___GetAxisDirection?T409 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T409 end address is: 8 (R2)
;Kinematics.c,497 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,503 :: 		void ResetHoming(){
;Kinematics.c,504 :: 		int i = 0;
;Kinematics.c,505 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming55:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming149
NOP	
J	L_ResetHoming56
NOP	
L__ResetHoming149:
;Kinematics.c,506 :: 		homing[i].set = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,507 :: 		homing[i].complete = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,508 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,509 :: 		homing[i].rev = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,510 :: 		homing[i].home = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,505 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,511 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming55
NOP	
L_ResetHoming56:
;Kinematics.c,512 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,515 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,516 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,518 :: 		if(!homing[axis].set){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home151
NOP	
J	L_Home58
NOP	
L__Home151:
;Kinematics.c,519 :: 		homing[axis].set = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,520 :: 		homing[axis].complete = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,521 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,522 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,523 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home59
NOP	
L_Home58:
;Kinematics.c,524 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,525 :: 		}
L_Home59:
;Kinematics.c,529 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home153
NOP	
J	L_Home60
NOP	
L__Home153:
;Kinematics.c,530 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home154
NOP	
J	L_Home61
NOP	
L__Home154:
;Kinematics.c,531 :: 		StopAxis(X);
SW	R4, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home62
NOP	
L_Home61:
;Kinematics.c,532 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home155
NOP	
J	L_Home63
NOP	
L__Home155:
;Kinematics.c,533 :: 		StopAxis(Y);
SW	R4, 8(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home63:
L_Home62:
;Kinematics.c,535 :: 		if(!homing[axis].rev){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home156
NOP	
J	L_Home64
NOP	
L__Home156:
;Kinematics.c,536 :: 		homing[axis].rev = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,537 :: 		Inv_Home_Axis(2.0,speed, axis);
LUI	R2, 16384
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
MOVZ	R25, R4, R0
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,538 :: 		}
L_Home64:
;Kinematics.c,539 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,540 :: 		}
L_Home60:
;Kinematics.c,542 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home158
NOP	
J	L_Home65
NOP	
L__Home158:
;Kinematics.c,543 :: 		homing[axis].home = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,544 :: 		}
L_Home65:
;Kinematics.c,546 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home159
NOP	
J	L__Home99
NOP	
L__Home159:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home160
NOP	
J	L__Home98
NOP	
L__Home160:
LBU	R2, Offset(-1082064688)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home161
NOP	
J	L__Home97
NOP	
L__Home161:
LBU	R2, Offset(-1082064702)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home162
NOP	
J	L__Home96
NOP	
L__Home162:
L__Home93:
;Kinematics.c,548 :: 		if(!homing[axis].home){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home163
NOP	
J	L_Home69
NOP	
L__Home163:
;Kinematics.c,549 :: 		homing[axis].home = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,550 :: 		Home_Axis(-290.00,speed,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
MOVZ	R25, R4, R0
; speed end address is: 16 (R4)
MTC1	R2, S12
JAL	_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,551 :: 		}
L_Home69:
;Kinematics.c,553 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home164
NOP	
J	L__Home95
NOP	
L__Home164:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home165
NOP	
J	L__Home94
NOP	
L__Home165:
L__Home92:
;Kinematics.c,554 :: 		homing[axis].complete      = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,555 :: 		STPS[axis].step_count      = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,556 :: 		STPS[axis].steps_position  = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Kinematics.c,553 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
L__Home95:
L__Home94:
;Kinematics.c,546 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home99:
L__Home98:
L__Home97:
L__Home96:
;Kinematics.c,560 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,563 :: 		void Home_Axis(double distance,long speed,int axis){
;Kinematics.c,564 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis167
NOP	
J	L_Home_Axis73
NOP	
L__Home_Axis167:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T565 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T565 end address is: 8 (R2)
J	L_Home_Axis74
NOP	
L_Home_Axis73:
; ?FLOC___Home_Axis?T565 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T565 end address is: 8 (R2)
L_Home_Axis74:
; ?FLOC___Home_Axis?T565 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,565 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis168
NOP	
J	L_Home_Axis75
NOP	
L__Home_Axis168:
; ?FLOC___Home_Axis?T565 end address is: 8 (R2)
; ?FLOC___Home_Axis?T567 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T567 end address is: 0 (R0)
J	L_Home_Axis76
NOP	
L_Home_Axis75:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T567 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T567 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis76:
; ?FLOC___Home_Axis?T567 start address is: 0 (R0)
MOV.S 	S12, S0
; ?FLOC___Home_Axis?T567 end address is: 0 (R0)
;Kinematics.c,569 :: 		}
L_end_Home_Axis:
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,571 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
;Kinematics.c,572 :: 		distance = (distance > 10.0)?  10.0 : distance;
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis170
NOP	
J	L_Inv_Home_Axis77
NOP	
L__Inv_Home_Axis170:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
J	L_Inv_Home_Axis78
NOP	
L_Inv_Home_Axis77:
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
L_Inv_Home_Axis78:
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,573 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis171
NOP	
J	L_Inv_Home_Axis79
NOP	
L__Inv_Home_Axis171:
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T572 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T572 end address is: 8 (R2)
J	L_Inv_Home_Axis80
NOP	
L_Inv_Home_Axis79:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T572 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T572 end address is: 8 (R2)
L_Inv_Home_Axis80:
; ?FLOC___Inv_Home_Axis?T572 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T572 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,577 :: 		}
L_end_Inv_Home_Axis:
JR	RA
NOP	
; end of _Inv_Home_Axis
