_SetInitialSizes:
;Kinematics.c,20 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,21 :: 		int i = 0;
;Kinematics.c,23 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__SetInitialSizes119
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes119:
;Kinematics.c,24 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
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
;Kinematics.c,23 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,25 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,26 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
_SingleAxisStep:
;Kinematics.c,33 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,40 :: 		STPS[axis_No].axis_dir = Direction(newxyz);
SW	R25, 4(SP)
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep121
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep121:
; ?FLOC___SingleAxisStep?T20 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___SingleAxisStep?T20 end address is: 16 (R4)
J	L_SingleAxisStep4
NOP	
L_SingleAxisStep3:
; ?FLOC___SingleAxisStep?T20 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___SingleAxisStep?T20 end address is: 16 (R4)
L_SingleAxisStep4:
; ?FLOC___SingleAxisStep?T20 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___SingleAxisStep?T20 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,41 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,42 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,44 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,45 :: 		STPS[axis_No].dist = newxyz - STPS[axis_No].psingle;
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
SUBU	R2, R25, R2
SW	R2, 0(R3)
;Kinematics.c,46 :: 		STPS[axis_No].dist = labs(newxyz);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 16(SP)
JAL	_labs+0
NOP	
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,47 :: 		dir = (newxyz < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep122
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep122:
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
; dir start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___SingleAxisStep?T48 end address is: 8 (R2)
;Kinematics.c,49 :: 		switch(axis_No){
J	L_SingleAxisStep7
NOP	
;Kinematics.c,50 :: 		case X:
L_SingleAxisStep9:
;Kinematics.c,51 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,52 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,53 :: 		case Y:
L_SingleAxisStep10:
;Kinematics.c,54 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,55 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,56 :: 		case Z:
L_SingleAxisStep11:
;Kinematics.c,57 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,58 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,59 :: 		case A:
L_SingleAxisStep12:
;Kinematics.c,60 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,61 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,62 :: 		default: break;
L_SingleAxisStep13:
J	L_SingleAxisStep8
NOP	
;Kinematics.c,63 :: 		}
L_SingleAxisStep7:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep124
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep124:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep126
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep126:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep128
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep128:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep130
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep130:
; dir end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,64 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,66 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,68 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,75 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,77 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,79 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,80 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,81 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,82 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,85 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,87 :: 		switch(axis_combo){
J	L_DualAxisStep14
NOP	
;Kinematics.c,88 :: 		case xy:
L_DualAxisStep16:
;Kinematics.c,90 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,92 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep132
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep132:
; ?FLOC___DualAxisStep?T69 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T69 end address is: 12 (R3)
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T69 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T69 end address is: 12 (R3)
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T69 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T69 end address is: 12 (R3)
SH	R2, Offset(_STPS+88)(GP)
;Kinematics.c,93 :: 		STPS[Y].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep133
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep133:
; ?FLOC___DualAxisStep?T72 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T72 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T72 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T72 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T72 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T72 end address is: 12 (R3)
SH	R2, Offset(_STPS+180)(GP)
;Kinematics.c,95 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,97 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,98 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,102 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep134
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep134:
; ?FLOC___DualAxisStep?T76 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T76 end address is: 8 (R2)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T76 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T76 end address is: 8 (R2)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T76 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T76 end address is: 8 (R2)
;Kinematics.c,103 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep135
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep135:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
;Kinematics.c,105 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,106 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,108 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,109 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,111 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep136
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep136:
;Kinematics.c,112 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,114 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep26:
;Kinematics.c,116 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep137
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep137:
;Kinematics.c,117 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,118 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+96)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,119 :: 		}else{
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,120 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,121 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,122 :: 		}
L_DualAxisStep28:
;Kinematics.c,124 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,125 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,126 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,127 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,128 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,130 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,132 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep138
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep138:
; ?FLOC___DualAxisStep?T105 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T105 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T105 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T105 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T105 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T105 end address is: 12 (R3)
SH	R2, Offset(_STPS+88)(GP)
;Kinematics.c,133 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep139
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep139:
; ?FLOC___DualAxisStep?T108 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T108 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T108 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T108 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T108 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T108 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,135 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,139 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,140 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,142 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep140
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep140:
; ?FLOC___DualAxisStep?T112 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T112 end address is: 8 (R2)
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
; ?FLOC___DualAxisStep?T112 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T112 end address is: 8 (R2)
L_DualAxisStep35:
; ?FLOC___DualAxisStep?T112 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T112 end address is: 8 (R2)
;Kinematics.c,143 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep141
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep141:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
;Kinematics.c,145 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,146 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,148 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,149 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,151 :: 		if(SV.dx > SV.dz)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep142
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep142:
;Kinematics.c,152 :: 		d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,154 :: 		d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);
SW	R0, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,156 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,157 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,158 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,159 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,160 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,162 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,163 :: 		STPS[Y].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep143
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep143:
; ?FLOC___DualAxisStep?T128 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T128 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T128 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T128 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T128 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T128 end address is: 12 (R3)
SH	R2, Offset(_STPS+180)(GP)
;Kinematics.c,164 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep144
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep144:
; ?FLOC___DualAxisStep?T131 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T131 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T131 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T131 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T131 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T131 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,166 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,170 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,171 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,173 :: 		dirA = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep145
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep145:
; ?FLOC___DualAxisStep?T135 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T135 end address is: 8 (R2)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
; ?FLOC___DualAxisStep?T135 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T135 end address is: 8 (R2)
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T135 start address is: 8 (R2)
; dirA start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T135 end address is: 8 (R2)
;Kinematics.c,174 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep146
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep146:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
; dirB start address is: 20 (R5)
SEB	R5, R2
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
;Kinematics.c,176 :: 		DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
ANDI	R3, R4, 1
; dirA end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,177 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R5, 1
; dirB end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,179 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,180 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,182 :: 		if(SV.dy > SV.dz)
LW	R3, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep147
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep147:
;Kinematics.c,183 :: 		SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,185 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep50:
;Kinematics.c,187 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,188 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,189 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,190 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,191 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep15
NOP	
;Kinematics.c,193 :: 		}
L_DualAxisStep14:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep149
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep149:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep151
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep151:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep153
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep153:
J	L_DualAxisStep51
NOP	
L_DualAxisStep15:
;Kinematics.c,194 :: 		}
L_end_DualAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,214 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 48 (R12)
LWC1	S6, 100(SP)
; i start address is: 8 (R2)
LWC1	S1, 104(SP)
; j start address is: 16 (R4)
LWC1	S2, 108(SP)
; k start address is: 0 (R0)
LWC1	S0, 112(SP)
; k end address is: 0 (R0)
;Kinematics.c,215 :: 		unsigned short isclockwise = 0;
;Kinematics.c,216 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,220 :: 		double x = 0.00;
;Kinematics.c,221 :: 		double y = 0.00;
;Kinematics.c,222 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,226 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 20
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,227 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,228 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Kinematics.c,229 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 44
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,230 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,231 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 68
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,232 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,234 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk155
NOP	
J	L_r_or_ijk52
NOP	
L__r_or_ijk155:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,298 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 44
LHU	R2, 92(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 20
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 32 (R8)
MOV.S 	S4, S3
;Kinematics.c,300 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 94(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,304 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,307 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 96(SP)
MOV.S 	S13, S5
MOV.S 	S12, S4
JAL	_hypot+0
NOP	
LWC1	S1, 96(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,309 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk156
NOP	
J	L__r_or_ijk107
NOP	
L__r_or_ijk156:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk53
NOP	
L__r_or_ijk107:
L_r_or_ijk53:
;Kinematics.c,332 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk157
NOP	
J	L__r_or_ijk108
NOP	
L__r_or_ijk157:
;Kinematics.c,333 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,334 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,335 :: 		}
J	L_r_or_ijk54
NOP	
L__r_or_ijk108:
;Kinematics.c,332 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,335 :: 		}
L_r_or_ijk54:
;Kinematics.c,338 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,340 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,341 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk55
NOP	
L_r_or_ijk52:
;Kinematics.c,344 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
; j start address is: 16 (R4)
; i start address is: 8 (R2)
MOV.S 	S13, S2
; j end address is: 16 (R4)
MOV.S 	S12, S1
; i end address is: 8 (R2)
JAL	_hypot+0
NOP	
; r start address is: 8 (R2)
MOV.S 	S1, S0
; r end address is: 8 (R2)
MOV.S 	S0, S1
;Kinematics.c,345 :: 		}
L_r_or_ijk55:
;Kinematics.c,347 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,348 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk158
NOP	
J	L__r_or_ijk109
NOP	
L__r_or_ijk158:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk56
NOP	
L__r_or_ijk109:
L_r_or_ijk56:
;Kinematics.c,352 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 68
ADDIU	R4, SP, 44
ADDIU	R3, SP, 20
;Kinematics.c,353 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
MOV.S 	S13, S0
; r end address is: 0 (R0)
MTC1	R2, S12
;Kinematics.c,352 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,353 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,352 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,353 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,354 :: 		}
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
_mc_arc:
;Kinematics.c,382 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -224
SW	RA, 0(SP)
LBU	R2, 224(SP)
SB	R2, 224(SP)
LBU	R2, 225(SP)
SB	R2, 225(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 226(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 227(SP)
;Kinematics.c,384 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
ANDI	R2, R28, 255
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,385 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LBU	R2, 224(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,386 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LBU	R2, 225(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,387 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,388 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,389 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,390 :: 		double rt_axis1                 = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,391 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,392 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,393 :: 		double angular_travel          = 0.00;
;Kinematics.c,394 :: 		double mm_of_travel   = 0.00;
;Kinematics.c,395 :: 		double rads                    = 0.00;
;Kinematics.c,396 :: 		unsigned int segments          = 0;
;Kinematics.c,397 :: 		double cos_T                   = 0.00;
;Kinematics.c,398 :: 		double sin_T                   = 0.00;
;Kinematics.c,404 :: 		unsigned int i = 0;
MOVZ	R30, R0, R0
SH	R30, 196(SP)
MOVZ	R30, R0, R0
SH	R30, 198(SP)
;Kinematics.c,405 :: 		int count = 0;
;Kinematics.c,408 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 36
LBU	R2, 225(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,409 :: 		rads = radius * deg2rad;
LUI	R2, 15502
ORI	R2, R2, 64054
MTC1	R2, S0
MUL.S 	S0, S13, S0
; rads start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,412 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
SWC1	S12, 4(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 4(SP)
SWC1	S0, 208(SP)
;Kinematics.c,414 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc161
NOP	
J	L_mc_arc57
NOP	
L__mc_arc161:
; isclockwise end address is: 28 (R7)
;Kinematics.c,416 :: 		if (angular_travel >= 0)
LWC1	S1, 208(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc162
NOP	
J	L_mc_arc58
NOP	
L__mc_arc162:
;Kinematics.c,417 :: 		angular_travel -= 2*M_PI;
LWC1	S1, 208(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 208(SP)
J	L_mc_arc59
NOP	
L_mc_arc58:
;Kinematics.c,419 :: 		if(angular_travel <= 0)
LWC1	S1, 208(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc163
NOP	
J	L_mc_arc60
NOP	
L__mc_arc163:
;Kinematics.c,420 :: 		angular_travel += 2*M_PI;
LWC1	S1, 208(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 208(SP)
L_mc_arc60:
;Kinematics.c,421 :: 		}
L_mc_arc59:
;Kinematics.c,422 :: 		}
L_mc_arc57:
;Kinematics.c,425 :: 		mm_of_travel = hypot(angular_travel*rads, fabs(linear_travel));
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
LWC1	S1, 208(SP)
MUL.S 	S1, S1, S5
; rads end address is: 40 (R10)
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
; mm_of_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,426 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc164
NOP	
J	L_mc_arc61
NOP	
L__mc_arc164:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; mm_of_travel end address is: 24 (R6)
J	L_end_mc_arc
NOP	
L_mc_arc61:
;Kinematics.c,428 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; mm_of_travel start address is: 24 (R6)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 24 (R6)
LUI	R2, 16025
ORI	R2, R2, 39322
MTC1	R2, S0
DIV.S 	S0, S3, S0
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 212(SP)
;Kinematics.c,432 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc166
NOP	
J	L_mc_arc62
NOP	
L__mc_arc166:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,433 :: 		feed_rate *= segments;
LHU	R2, 212(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc62:
;Kinematics.c,436 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 212(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 208(SP)
DIV.S 	S2, S0, S1
SWC1	S2, 200(SP)
;Kinematics.c,440 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S1
SWC1	S0, 204(SP)
;Kinematics.c,442 :: 		dma_printf("\nangTrav:= %f : mmoftrav:= %f : Lin_trav:= %f\nLinPseg:= %f : *pSeg:= %f",
ADDIU	R23, SP, 61
ADDIU	R22, R23, 72
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 61
;Kinematics.c,443 :: 		angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -24
SWC1	S2, 20(SP)
SWC1	S0, 16(SP)
SWC1	S6, 12(SP)
; linear_travel end address is: 48 (R12)
SWC1	S3, 8(SP)
; mm_of_travel end address is: 24 (R6)
LW	R2, 232(SP)
SW	R2, 4(SP)
;Kinematics.c,442 :: 		dma_printf("\nangTrav:= %f : mmoftrav:= %f : Lin_trav:= %f\nLinPseg:= %f : *pSeg:= %f",
SW	R3, 0(SP)
;Kinematics.c,443 :: 		angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 24
LW	R25, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,445 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LWC1	S1, 200(SP)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, 200(SP)
MUL.S 	S1, S1, S0
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 216(SP)
;Kinematics.c,446 :: 		sin_T = theta_per_segment;
LWC1	S0, 200(SP)
SWC1	S0, 220(SP)
;Kinematics.c,448 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,449 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,451 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc63:
LHU	R3, 212(SP)
LHU	R2, 196(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc167
NOP	
J	L_mc_arc64
NOP	
L__mc_arc167:
;Kinematics.c,453 :: 		if (count < n_arc_correction) {
LBU	R3, 60(SP)
LH	R2, 198(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc168
NOP	
J	L_mc_arc65
NOP	
L__mc_arc168:
;Kinematics.c,455 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 220(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 216(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,456 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 216(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 220(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,457 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,458 :: 		count++;
LH	R2, 198(SP)
ADDIU	R2, R2, 1
SH	R2, 198(SP)
;Kinematics.c,459 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc65:
;Kinematics.c,462 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 196(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 200(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 48(SP)
;Kinematics.c,463 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 196(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 200(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,464 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
ANDI	R2, R28, 255
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 48(SP)
MUL.S 	S3, S2, S1
LBU	R2, 224(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
;Kinematics.c,465 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,466 :: 		count = 0;
SH	R0, 198(SP)
;Kinematics.c,467 :: 		}
L_mc_arc66:
;Kinematics.c,470 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,471 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,472 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 225(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 204(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,473 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
SWC1	S0, 52(SP)
;Kinematics.c,474 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,475 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 56(SP)
;Kinematics.c,476 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,478 :: 		while(1){
L_mc_arc67:
;Kinematics.c,479 :: 		if(!OC5IE_bit && !OC2IE_bit)
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__mc_arc169
NOP	
J	L__mc_arc106
NOP	
L__mc_arc169:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__mc_arc170
NOP	
J	L__mc_arc105
NOP	
L__mc_arc170:
L__mc_arc104:
;Kinematics.c,480 :: 		break;
J	L_mc_arc68
NOP	
;Kinematics.c,479 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc106:
L__mc_arc105:
;Kinematics.c,481 :: 		}
J	L_mc_arc67
NOP	
L_mc_arc68:
;Kinematics.c,487 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LWC1	S12, 52(SP)
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+68)(GP)
;Kinematics.c,488 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 56(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+160)(GP)
;Kinematics.c,489 :: 		tempA = abs(STPS[X].mmToTravel);
SW	R25, 4(SP)
LW	R25, Offset(_STPS+68)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
;Kinematics.c,490 :: 		tempB = abs(STPS[Y].mmToTravel);
LW	R25, Offset(_STPS+160)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,492 :: 		if(tempA > tempB)
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc171
NOP	
J	L_mc_arc72
NOP	
L__mc_arc171:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
;Kinematics.c,493 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+68)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
J	L_mc_arc73
NOP	
L_mc_arc72:
;Kinematics.c,495 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+160)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
L_mc_arc73:
;Kinematics.c,499 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
ADDIU	R23, SP, 133
ADDIU	R22, R23, 58
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 133
;Kinematics.c,500 :: 		i,segments,nPx,nPy,STPS[X].mmToTravel,STPS[Y].mmToTravel);
LW	R2, Offset(_STPS+160)(GP)
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_STPS+68)(GP)
SW	R2, 20(SP)
LW	R2, 84(SP)
SW	R2, 16(SP)
LW	R2, 80(SP)
SW	R2, 12(SP)
LHU	R2, 240(SP)
SH	R2, 8(SP)
LHU	R2, 224(SP)
SH	R2, 4(SP)
;Kinematics.c,499 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
SW	R3, 0(SP)
;Kinematics.c,500 :: 		i,segments,nPx,nPy,STPS[X].mmToTravel,STPS[Y].mmToTravel);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Kinematics.c,502 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+160)(GP)
LW	R25, Offset(_STPS+68)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,505 :: 		i++;
LHU	R2, 196(SP)
ADDIU	R2, R2, 1
SH	R2, 196(SP)
;Kinematics.c,506 :: 		}
J	L_mc_arc63
NOP	
L_mc_arc64:
;Kinematics.c,509 :: 		while(DMA_Busy(1));
L_mc_arc74:
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
BNE	R2, R0, L__mc_arc173
NOP	
J	L_mc_arc75
NOP	
L__mc_arc173:
J	L_mc_arc74
NOP	
L_mc_arc75:
;Kinematics.c,510 :: 		dma_printf("\n%s","Arc Finnished");
ORI	R30, R0, 10
SB	R30, 191(SP)
ORI	R30, R0, 37
SB	R30, 192(SP)
ORI	R30, R0, 115
SB	R30, 193(SP)
MOVZ	R30, R0, R0
SB	R30, 194(SP)
ADDIU	R3, SP, 191
LUI	R2, hi_addr(?lstr_4_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_4_Kinematics+0)
SB	R28, 4(SP)
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
LBU	R28, 4(SP)
;Kinematics.c,514 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 224
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,519 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,520 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,521 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,529 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,530 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection176
NOP	
J	L_GetAxisDirection76
NOP	
L__GetAxisDirection176:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
J	L_GetAxisDirection77
NOP	
L_GetAxisDirection76:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
L_GetAxisDirection77:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
;Kinematics.c,531 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,537 :: 		void ResetHoming(){
;Kinematics.c,538 :: 		int i = 0;
;Kinematics.c,539 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming78:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming178
NOP	
J	L_ResetHoming79
NOP	
L__ResetHoming178:
;Kinematics.c,540 :: 		homing[i].set = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,541 :: 		homing[i].complete = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,542 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,543 :: 		homing[i].rev = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,544 :: 		homing[i].home = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,539 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,545 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming78
NOP	
L_ResetHoming79:
;Kinematics.c,546 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,549 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,550 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,552 :: 		if(!homing[axis].set){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home180
NOP	
J	L_Home81
NOP	
L__Home180:
;Kinematics.c,553 :: 		homing[axis].set = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,554 :: 		homing[axis].complete = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,555 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,556 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,557 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home82
NOP	
L_Home81:
;Kinematics.c,558 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,559 :: 		}
L_Home82:
;Kinematics.c,563 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home182
NOP	
J	L_Home83
NOP	
L__Home182:
;Kinematics.c,564 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home183
NOP	
J	L_Home84
NOP	
L__Home183:
;Kinematics.c,565 :: 		StopAxis(X);
SW	R4, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home85
NOP	
L_Home84:
;Kinematics.c,566 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home184
NOP	
J	L_Home86
NOP	
L__Home184:
;Kinematics.c,567 :: 		StopAxis(Y);
SW	R4, 8(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home86:
L_Home85:
;Kinematics.c,569 :: 		if(!homing[axis].rev){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home185
NOP	
J	L_Home87
NOP	
L__Home185:
;Kinematics.c,570 :: 		homing[axis].rev = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,571 :: 		Inv_Home_Axis(2.0,speed, axis);
LUI	R2, 16384
ORI	R2, R2, 0
SW	R4, 8(SP)
SH	R25, 12(SP)
SEH	R26, R25
MOVZ	R25, R4, R0
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
;Kinematics.c,572 :: 		}
L_Home87:
;Kinematics.c,573 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,574 :: 		}
L_Home83:
;Kinematics.c,576 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home187
NOP	
J	L_Home88
NOP	
L__Home187:
;Kinematics.c,577 :: 		homing[axis].home = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,578 :: 		}
L_Home88:
;Kinematics.c,580 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home188
NOP	
J	L__Home117
NOP	
L__Home188:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home189
NOP	
J	L__Home116
NOP	
L__Home189:
LBU	R2, Offset(-1082064688)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home190
NOP	
J	L__Home115
NOP	
L__Home190:
LBU	R2, Offset(-1082064702)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home191
NOP	
J	L__Home114
NOP	
L__Home191:
L__Home111:
;Kinematics.c,582 :: 		if(!homing[axis].home){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home192
NOP	
J	L_Home92
NOP	
L__Home192:
;Kinematics.c,583 :: 		homing[axis].home = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,584 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,585 :: 		}
L_Home92:
;Kinematics.c,587 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home193
NOP	
J	L__Home113
NOP	
L__Home193:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home194
NOP	
J	L__Home112
NOP	
L__Home194:
L__Home110:
;Kinematics.c,588 :: 		homing[axis].complete      = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,589 :: 		STPS[axis].step_count      = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,590 :: 		STPS[axis].steps_position  = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Kinematics.c,587 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
L__Home113:
L__Home112:
;Kinematics.c,580 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home117:
L__Home116:
L__Home115:
L__Home114:
;Kinematics.c,594 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,597 :: 		void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,598 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis196
NOP	
J	L_Home_Axis96
NOP	
L__Home_Axis196:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T551 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T551 end address is: 8 (R2)
J	L_Home_Axis97
NOP	
L_Home_Axis96:
; ?FLOC___Home_Axis?T551 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T551 end address is: 8 (R2)
L_Home_Axis97:
; ?FLOC___Home_Axis?T551 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,599 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis197
NOP	
J	L_Home_Axis98
NOP	
L__Home_Axis197:
; ?FLOC___Home_Axis?T551 end address is: 8 (R2)
; ?FLOC___Home_Axis?T553 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T553 end address is: 0 (R0)
J	L_Home_Axis99
NOP	
L_Home_Axis98:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T553 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T553 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis99:
; ?FLOC___Home_Axis?T553 start address is: 0 (R0)
MOV.S 	S12, S0
;Kinematics.c,600 :: 		STPS[axis].mmToTravel = belt_steps(distance);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R2, 20(SP)
SH	R26, 12(SP)
; ?FLOC___Home_Axis?T553 end address is: 0 (R0)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,601 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
SH	R26, 12(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 12(SP)
;Kinematics.c,602 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
MOVZ	R25, R2, R0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,603 :: 		}
L_end_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,605 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,606 :: 		distance = (distance > 10.0)?  10.0 : distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis199
NOP	
J	L_Inv_Home_Axis100
NOP	
L__Inv_Home_Axis199:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T576 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T576 end address is: 8 (R2)
J	L_Inv_Home_Axis101
NOP	
L_Inv_Home_Axis100:
; ?FLOC___Inv_Home_Axis?T576 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T576 end address is: 8 (R2)
L_Inv_Home_Axis101:
; ?FLOC___Inv_Home_Axis?T576 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,607 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis200
NOP	
J	L_Inv_Home_Axis102
NOP	
L__Inv_Home_Axis200:
; ?FLOC___Inv_Home_Axis?T576 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T578 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T578 end address is: 8 (R2)
J	L_Inv_Home_Axis103
NOP	
L_Inv_Home_Axis102:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T578 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T578 end address is: 8 (R2)
L_Inv_Home_Axis103:
; ?FLOC___Inv_Home_Axis?T578 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T578 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,608 :: 		STPS[axis].mmToTravel = belt_steps(distance);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R2, 20(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,609 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
SH	R26, 12(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 12(SP)
;Kinematics.c,610 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
MOVZ	R25, R2, R0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,611 :: 		}
L_end_Inv_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Inv_Home_Axis
