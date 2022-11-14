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
BNE	R2, R0, L__SetInitialSizes131
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes131:
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
;Kinematics.c,35 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,42 :: 		STPS[axis_No].axis_dir = Direction(newxyz);
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
BNE	R2, R0, L__SingleAxisStep133
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep133:
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
;Kinematics.c,43 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,44 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,46 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,47 :: 		STPS[axis_No].dist = newxyz - STPS[axis_No].psingle;
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
;Kinematics.c,48 :: 		STPS[axis_No].dist = labs(newxyz);
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
;Kinematics.c,49 :: 		dir = (newxyz < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep134
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep134:
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
;Kinematics.c,51 :: 		switch(axis_No){
J	L_SingleAxisStep7
NOP	
;Kinematics.c,52 :: 		case X:
L_SingleAxisStep9:
;Kinematics.c,53 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,54 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,55 :: 		case Y:
L_SingleAxisStep10:
;Kinematics.c,56 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,57 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,58 :: 		case Z:
L_SingleAxisStep11:
;Kinematics.c,59 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,60 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,61 :: 		case A:
L_SingleAxisStep12:
;Kinematics.c,62 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,63 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,64 :: 		default: break;
L_SingleAxisStep13:
J	L_SingleAxisStep8
NOP	
;Kinematics.c,65 :: 		}
L_SingleAxisStep7:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep136
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep136:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep138
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep138:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep140
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep140:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep142
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep142:
; dir end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,66 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,68 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,70 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,77 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,81 :: 		SV.cir = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,82 :: 		SV.over=0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,83 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,85 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,87 :: 		switch(axis_combo){
J	L_DualAxisStep14
NOP	
;Kinematics.c,88 :: 		case xy:
L_DualAxisStep16:
;Kinematics.c,91 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,93 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep144
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep144:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
SH	R2, Offset(_STPS+88)(GP)
;Kinematics.c,94 :: 		STPS[Y].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep145
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep145:
; ?FLOC___DualAxisStep?T74 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T74 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T74 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T74 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T74 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T74 end address is: 12 (R3)
SH	R2, Offset(_STPS+180)(GP)
;Kinematics.c,96 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,98 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,99 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,103 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep146
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep146:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T78 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T78 end address is: 8 (R2)
;Kinematics.c,104 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep147
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep147:
; ?FLOC___DualAxisStep?T80 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T80 end address is: 8 (R2)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T80 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T80 end address is: 8 (R2)
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T80 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T80 end address is: 8 (R2)
;Kinematics.c,106 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,107 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,109 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,110 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,112 :: 		if(SV.dx >= SV.dy)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep148
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep148:
;Kinematics.c,113 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,115 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep26:
;Kinematics.c,117 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep149
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep149:
;Kinematics.c,118 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,119 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+96)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,120 :: 		}else{
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,121 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,122 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,123 :: 		}
L_DualAxisStep28:
;Kinematics.c,125 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,126 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,127 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,128 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,129 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,131 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,133 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep150
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep150:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
SH	R2, Offset(_STPS+88)(GP)
;Kinematics.c,134 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep151
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep151:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,136 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,140 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,141 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,143 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep152
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep152:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
L_DualAxisStep35:
; ?FLOC___DualAxisStep?T114 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T114 end address is: 8 (R2)
;Kinematics.c,144 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep153
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep153:
; ?FLOC___DualAxisStep?T116 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T116 end address is: 8 (R2)
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
; ?FLOC___DualAxisStep?T116 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T116 end address is: 8 (R2)
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T116 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T116 end address is: 8 (R2)
;Kinematics.c,146 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,147 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,149 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,150 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,152 :: 		if(SV.dx > SV.dz)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep154
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep154:
;Kinematics.c,153 :: 		d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,155 :: 		d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);
SW	R0, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,157 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,158 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,159 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,160 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,161 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,163 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,164 :: 		STPS[Y].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep155
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep155:
; ?FLOC___DualAxisStep?T130 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T130 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T130 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T130 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T130 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T130 end address is: 12 (R3)
SH	R2, Offset(_STPS+180)(GP)
;Kinematics.c,165 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep156
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep156:
; ?FLOC___DualAxisStep?T133 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T133 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T133 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T133 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T133 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T133 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,167 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 12(SP)
SW	R25, 16(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;Kinematics.c,171 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,172 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,174 :: 		dirA = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep157
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep157:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T137 start address is: 8 (R2)
; dirA start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T137 end address is: 8 (R2)
;Kinematics.c,175 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep158
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep158:
; ?FLOC___DualAxisStep?T139 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T139 end address is: 8 (R2)
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
; ?FLOC___DualAxisStep?T139 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T139 end address is: 8 (R2)
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T139 start address is: 8 (R2)
; dirB start address is: 20 (R5)
SEB	R5, R2
; ?FLOC___DualAxisStep?T139 end address is: 8 (R2)
;Kinematics.c,177 :: 		DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
ANDI	R3, R4, 1
; dirA end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,178 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R5, 1
; dirB end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,180 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,181 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,183 :: 		if(SV.dy > SV.dz)
LW	R3, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep159
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep159:
;Kinematics.c,184 :: 		SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,186 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep50:
;Kinematics.c,188 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,189 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,190 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,191 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,192 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep15
NOP	
;Kinematics.c,194 :: 		}
L_DualAxisStep14:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep161
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep161:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep163
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep163:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep165
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep165:
J	L_DualAxisStep51
NOP	
L_DualAxisStep15:
;Kinematics.c,196 :: 		SV.px = 0;//SV.dx;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,197 :: 		SV.py = 0;//SV.dy;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,198 :: 		SV.pz = 0;//SV.dz;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,199 :: 		}
L_end_DualAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DualAxisStep
_DualAxisStep2:
;Kinematics.c,201 :: 		void DualAxisStep2(long axis_a,long axis_b,int axisA,int axisB,int xyza){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
; xyza start address is: 12 (R3)
LH	R3, 24(SP)
;Kinematics.c,204 :: 		SV.over=0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,205 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,208 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,211 :: 		Multi_Axis_Enable(xyza);
SH	R28, 12(SP)
; xyza end address is: 12 (R3)
SH	R27, 14(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LH	R27, 14(SP)
LH	R28, 12(SP)
;Kinematics.c,213 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__DualAxisStep2167
NOP	
J	L_DualAxisStep252
NOP	
L__DualAxisStep2167:
;Kinematics.c,214 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,215 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,216 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,217 :: 		}
L_DualAxisStep252:
;Kinematics.c,220 :: 		STPS[axisA].axis_dir = Direction(axis_a);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep2168
NOP	
J	L_DualAxisStep253
NOP	
L__DualAxisStep2168:
; ?FLOC___DualAxisStep2?T162 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep2?T162 end address is: 16 (R4)
J	L_DualAxisStep254
NOP	
L_DualAxisStep253:
; ?FLOC___DualAxisStep2?T162 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep2?T162 end address is: 16 (R4)
L_DualAxisStep254:
; ?FLOC___DualAxisStep2?T162 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep2?T162 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,221 :: 		STPS[axisB].axis_dir = Direction(axis_b);
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 88
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep2169
NOP	
J	L_DualAxisStep255
NOP	
L__DualAxisStep2169:
; ?FLOC___DualAxisStep2?T170 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep2?T170 end address is: 16 (R4)
J	L_DualAxisStep256
NOP	
L_DualAxisStep255:
; ?FLOC___DualAxisStep2?T170 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep2?T170 end address is: 16 (R4)
L_DualAxisStep256:
; ?FLOC___DualAxisStep2?T170 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep2?T170 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,224 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,225 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,229 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep2170
NOP	
J	L_DualAxisStep257
NOP	
L__DualAxisStep2170:
; ?FLOC___DualAxisStep2?T174 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep2?T174 end address is: 8 (R2)
J	L_DualAxisStep258
NOP	
L_DualAxisStep257:
; ?FLOC___DualAxisStep2?T174 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep2?T174 end address is: 8 (R2)
L_DualAxisStep258:
; ?FLOC___DualAxisStep2?T174 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep2?T174 end address is: 8 (R2)
;Kinematics.c,230 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep2171
NOP	
J	L_DualAxisStep259
NOP	
L__DualAxisStep2171:
; ?FLOC___DualAxisStep2?T176 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep2?T176 end address is: 8 (R2)
J	L_DualAxisStep260
NOP	
L_DualAxisStep259:
; ?FLOC___DualAxisStep2?T176 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep2?T176 end address is: 8 (R2)
L_DualAxisStep260:
; ?FLOC___DualAxisStep2?T176 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep2?T176 end address is: 8 (R2)
;Kinematics.c,232 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,233 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,236 :: 		SV.dx = labs(SV.dx);
SW	R25, 12(SP)
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,237 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
LW	R25, 12(SP)
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,239 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep2172
NOP	
J	L_DualAxisStep261
NOP	
L__DualAxisStep2172:
;Kinematics.c,240 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,242 :: 		STPS[axisA].master = 1;
SEH	R3, R27
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
;Kinematics.c,243 :: 		STPS[axisB].master = 0;
SEH	R3, R28
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
;Kinematics.c,244 :: 		}
J	L_DualAxisStep262
NOP	
L_DualAxisStep261:
;Kinematics.c,246 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,248 :: 		STPS[axisA].master = 0;
SEH	R3, R27
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
;Kinematics.c,249 :: 		STPS[axisB].master = 1;
SEH	R3, R28
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
;Kinematics.c,250 :: 		}
L_DualAxisStep262:
;Kinematics.c,252 :: 		STPS[axisA].step_count = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,253 :: 		STPS[axisB].step_count = 0;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,254 :: 		STPS[axisA].mmToTravel = axis_a;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R25, 0(R2)
;Kinematics.c,255 :: 		STPS[axisB].mmToTravel = axis_b;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R26, 0(R2)
;Kinematics.c,256 :: 		STPS[axisA].step_delay  = 2000;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 2000
SW	R2, 0(R3)
;Kinematics.c,257 :: 		STPS[axisB].step_delay = 2000;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 2000
SW	R2, 0(R3)
;Kinematics.c,258 :: 		Axis_Interpolate(axisA,axisB);
SEH	R26, R28
SEH	R25, R27
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,266 :: 		}
L_end_DualAxisStep2:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DualAxisStep2
_r_or_ijk:
;Kinematics.c,285 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
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
;Kinematics.c,286 :: 		unsigned short isclockwise = 0;
;Kinematics.c,287 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,291 :: 		double x = 0.00;
;Kinematics.c,292 :: 		double y = 0.00;
;Kinematics.c,293 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,297 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 24
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,298 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,299 :: 		position[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Kinematics.c,300 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 48
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,301 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,302 :: 		target[2] = 0;
ADDIU	R2, R3, 8
SW	R0, 0(R2)
;Kinematics.c,303 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 72
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,304 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,306 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk174
NOP	
J	L_r_or_ijk63
NOP	
L__r_or_ijk174:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,370 :: 		x = target[axis_plane_a] - position[axis_plane_a];
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
;Kinematics.c,372 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LH	R2, 98(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,376 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,379 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
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
;Kinematics.c,381 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk175
NOP	
J	L__r_or_ijk119
NOP	
L__r_or_ijk175:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk64
NOP	
L__r_or_ijk119:
L_r_or_ijk64:
;Kinematics.c,404 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk176
NOP	
J	L__r_or_ijk120
NOP	
L__r_or_ijk176:
;Kinematics.c,405 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,406 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,407 :: 		}
J	L_r_or_ijk65
NOP	
L__r_or_ijk120:
;Kinematics.c,404 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,407 :: 		}
L_r_or_ijk65:
;Kinematics.c,410 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,412 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,413 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk66
NOP	
L_r_or_ijk63:
;Kinematics.c,416 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Kinematics.c,417 :: 		}
L_r_or_ijk66:
;Kinematics.c,419 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,420 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk177
NOP	
J	L__r_or_ijk121
NOP	
L__r_or_ijk177:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk67
NOP	
L__r_or_ijk121:
L_r_or_ijk67:
;Kinematics.c,424 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 72
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,425 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
ADDIU	SP, SP, -8
SB	R6, 5(SP)
; r end address is: 0 (R0)
LBU	R6, Offset(_gc+2)(GP)
SB	R6, 4(SP)
;Kinematics.c,424 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
ORI	R6, R0, 2
SH	R6, 2(SP)
SH	R26, 0(SP)
;Kinematics.c,425 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MTC1	R2, S12
;Kinematics.c,424 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
SEH	R28, R25
MOVZ	R27, R5, R0
MOVZ	R25, R3, R0
;Kinematics.c,425 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
MOV.S 	S13, S0
; isclockwise end address is: 24 (R6)
;Kinematics.c,424 :: 		mc_arc(position, target, offset, axis_A, axis_B, Z,
MOVZ	R26, R4, R0
;Kinematics.c,425 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 8
;Kinematics.c,426 :: 		}
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
;Kinematics.c,431 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,432 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,433 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_mc_arc:
;Kinematics.c,462 :: 		int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -288
SW	RA, 0(SP)
LH	R2, 288(SP)
SH	R2, 288(SP)
LH	R2, 290(SP)
SH	R2, 290(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 292(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 293(SP)
;Kinematics.c,464 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 28(SP)
;Kinematics.c,465 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LH	R2, 288(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 32(SP)
;Kinematics.c,466 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 290(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,467 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 36(SP)
;Kinematics.c,468 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 40(SP)
;Kinematics.c,469 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,470 :: 		double rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,471 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,472 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,473 :: 		double angular_travel          = 0.00;
;Kinematics.c,474 :: 		double mm_of_travel            = 0.00;
;Kinematics.c,475 :: 		double rads                    = 0.00;
;Kinematics.c,476 :: 		unsigned int segments          = 0;
;Kinematics.c,477 :: 		double cos_T                   = 0.00;
;Kinematics.c,478 :: 		double sin_T                   = 0.00;
;Kinematics.c,484 :: 		unsigned int i = 0;
;Kinematics.c,485 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 258(SP)
ORI	R30, R0, 3
SB	R30, 260(SP)
;Kinematics.c,486 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,488 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 44
LH	R2, 290(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,492 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 36(SP)
MUL.S 	S1, S0, S3
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S4
ADD.S 	S2, S1, S0
LWC1	S0, 36(SP)
MUL.S 	S1, S0, S4
; rt_axis1 end address is: 32 (R8)
LWC1	S0, 40(SP)
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
;Kinematics.c,494 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc181
NOP	
J	L__mc_arc118
NOP	
L__mc_arc181:
; isclockwise end address is: 28 (R7)
;Kinematics.c,496 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc182
NOP	
J	L_mc_arc69
NOP	
L__mc_arc182:
;Kinematics.c,497 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc70
NOP	
L_mc_arc69:
;Kinematics.c,499 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc183
NOP	
J	L__mc_arc117
NOP	
L__mc_arc183:
;Kinematics.c,500 :: 		angular_travel += 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc71
NOP	
L__mc_arc117:
;Kinematics.c,499 :: 		if(angular_travel <= 0)
;Kinematics.c,500 :: 		angular_travel += 2*M_PI;
L_mc_arc71:
;Kinematics.c,501 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc70:
;Kinematics.c,502 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S3, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc68
NOP	
L__mc_arc118:
;Kinematics.c,494 :: 		if(isclockwise) {
MOV.S 	S3, S4
;Kinematics.c,502 :: 		}
L_mc_arc68:
;Kinematics.c,505 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 24 (R6)
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S3, S13
SW	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R25, 4(SP)
; mm_of_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,506 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc184
NOP	
J	L_mc_arc72
NOP	
L__mc_arc184:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; angular_travel end address is: 24 (R6)
; mm_of_travel end address is: 32 (R8)
J	L_end_mc_arc
NOP	
L_mc_arc72:
;Kinematics.c,508 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; mm_of_travel start address is: 32 (R8)
; angular_travel start address is: 24 (R6)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 24 (R6)
LUI	R2, 16204
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S4, S0
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 272(SP)
;Kinematics.c,512 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc186
NOP	
J	L_mc_arc73
NOP	
L__mc_arc186:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,513 :: 		feed_rate *= segments;
LHU	R2, 272(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc73:
;Kinematics.c,516 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 272(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S3, S0
SWC1	S2, 264(SP)
;Kinematics.c,520 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S0
SWC1	S0, 268(SP)
;Kinematics.c,523 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 276(SP)
;Kinematics.c,524 :: 		sin_T = theta_per_segment;
SWC1	S2, 280(SP)
;Kinematics.c,526 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,527 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 288(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,528 :: 		OC5IE_bit = OC2IE_bit = 0;
ORI	R2, R0, 4096
SW	R2, Offset(-1082064700)(GP)
LBU	R2, Offset(-1082064703)(GP)
EXT	R3, R2, 4, 1
LBU	R2, Offset(-1082064701)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(-1082064701)(GP)
;Kinematics.c,529 :: 		i = 0;
SH	R0, 284(SP)
;Kinematics.c,530 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
ADDIU	R23, SP, 68
ADDIU	R22, R23, 127
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 68
;Kinematics.c,531 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
LW	R2, 264(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
LW	R2, 308(SP)
SW	R2, 32(SP)
SWC1	S6, 28(SP)
; linear_travel end address is: 48 (R12)
SWC1	S4, 24(SP)
; mm_of_travel end address is: 32 (R8)
SWC1	S3, 20(SP)
; angular_travel end address is: 24 (R6)
LHU	R2, 312(SP)
SH	R2, 16(SP)
SWC1	S13, 12(SP)
LW	R2, 320(SP)
SW	R2, 8(SP)
LW	R2, 316(SP)
SW	R2, 4(SP)
;Kinematics.c,530 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
SW	R3, 0(SP)
;Kinematics.c,531 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 40
LW	R25, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,532 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc74:
LHU	R3, 272(SP)
LHU	R2, 284(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc187
NOP	
J	L_mc_arc75
NOP	
L__mc_arc187:
;Kinematics.c,534 :: 		if (count < n_arc_correction) {
LBU	R3, 260(SP)
LH	R2, 258(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc188
NOP	
J	L_mc_arc76
NOP	
L__mc_arc188:
;Kinematics.c,536 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 280(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 276(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,537 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 276(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 280(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 36(SP)
;Kinematics.c,538 :: 		r_axis1 = r_axisi;
SWC1	S3, 40(SP)
;Kinematics.c,539 :: 		count++;
LH	R2, 258(SP)
ADDIU	R2, R2, 1
SH	R2, 258(SP)
;Kinematics.c,540 :: 		} else {
J	L_mc_arc77
NOP	
L_mc_arc76:
;Kinematics.c,543 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 284(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 264(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 56(SP)
;Kinematics.c,544 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 284(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 264(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,545 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 56(SP)
MUL.S 	S3, S2, S1
LH	R2, 288(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 36(SP)
;Kinematics.c,546 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 56(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 40(SP)
;Kinematics.c,547 :: 		count = 0;
SH	R0, 258(SP)
;Kinematics.c,548 :: 		}
L_mc_arc77:
;Kinematics.c,551 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,552 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 288(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,553 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 290(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 268(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,554 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 60(SP)
;Kinematics.c,555 :: 		position[axis_0] = arc_target[axis_0];
SWC1	S1, 0(R2)
;Kinematics.c,556 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 288(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,557 :: 		position[axis_1] = arc_target[axis_1];
SWC1	S1, 0(R2)
;Kinematics.c,559 :: 		tempA = belt_steps(nPx);//calcSteps(nPx,8.06);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LWC1	S12, 60(SP)
JAL	_belt_steps+0
NOP	
SW	R2, 20(SP)
;Kinematics.c,560 :: 		tempB = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 64(SP)
JAL	_belt_steps+0
NOP	
SW	R2, 24(SP)
;Kinematics.c,563 :: 		if(!DMA_Busy(1));
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc189
NOP	
J	L_mc_arc78
NOP	
L__mc_arc189:
L_mc_arc78:
;Kinematics.c,564 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
ADDIU	R23, SP, 195
ADDIU	R22, R23, 58
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 195
;Kinematics.c,565 :: 		i,segments,nPx,nPy,tempA,tempB);
LW	R2, 24(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, 48(SP)
SW	R2, 20(SP)
LW	R2, 92(SP)
SW	R2, 16(SP)
LW	R2, 88(SP)
SW	R2, 12(SP)
LHU	R2, 300(SP)
SH	R2, 8(SP)
LHU	R2, 312(SP)
SH	R2, 4(SP)
;Kinematics.c,564 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
SW	R3, 0(SP)
;Kinematics.c,565 :: 		i,segments,nPx,nPy,tempA,tempB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,567 :: 		SV.cir = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,568 :: 		DualAxisStep2(tempA, tempB,axis_0,axis_1,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SEH	R27, R28
LH	R28, 288(SP)
LW	R26, 24(SP)
LW	R25, 20(SP)
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_DualAxisStep2+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,570 :: 		while(1){
L_mc_arc79:
;Kinematics.c,571 :: 		if(!OC5IE_bit && !OC2IE_bit)
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__mc_arc190
NOP	
J	L__mc_arc116
NOP	
L__mc_arc190:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__mc_arc191
NOP	
J	L__mc_arc115
NOP	
L__mc_arc191:
L__mc_arc114:
;Kinematics.c,572 :: 		break;
J	L_mc_arc80
NOP	
;Kinematics.c,571 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc116:
L__mc_arc115:
;Kinematics.c,573 :: 		}
J	L_mc_arc79
NOP	
L_mc_arc80:
;Kinematics.c,578 :: 		i++;
LHU	R2, 284(SP)
ADDIU	R2, R2, 1
SH	R2, 284(SP)
;Kinematics.c,579 :: 		}
J	L_mc_arc74
NOP	
L_mc_arc75:
;Kinematics.c,582 :: 		while(DMA_Busy(1));
L_mc_arc84:
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
BNE	R2, R0, L__mc_arc193
NOP	
J	L_mc_arc85
NOP	
L__mc_arc193:
J	L_mc_arc84
NOP	
L_mc_arc85:
;Kinematics.c,583 :: 		dma_printf("\n%s","Arc Finnished");
ORI	R30, R0, 10
SB	R30, 253(SP)
ORI	R30, R0, 37
SB	R30, 254(SP)
ORI	R30, R0, 115
SB	R30, 255(SP)
MOVZ	R30, R0, R0
SB	R30, 256(SP)
ADDIU	R3, SP, 253
LUI	R2, hi_addr(?lstr_4_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_4_Kinematics+0)
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
;Kinematics.c,587 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 288
JR	RA
NOP	
; end of _mc_arc
_GetAxisDirection:
;Kinematics.c,597 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,598 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection195
NOP	
J	L_GetAxisDirection86
NOP	
L__GetAxisDirection195:
; ?FLOC___GetAxisDirection?T488 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T488 end address is: 8 (R2)
J	L_GetAxisDirection87
NOP	
L_GetAxisDirection86:
; ?FLOC___GetAxisDirection?T488 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T488 end address is: 8 (R2)
L_GetAxisDirection87:
; ?FLOC___GetAxisDirection?T488 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T488 end address is: 8 (R2)
;Kinematics.c,599 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,605 :: 		void ResetHoming(){
;Kinematics.c,606 :: 		int i = 0;
;Kinematics.c,607 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming88:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming197
NOP	
J	L_ResetHoming89
NOP	
L__ResetHoming197:
;Kinematics.c,608 :: 		homing[i].set = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,609 :: 		homing[i].complete = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,610 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,611 :: 		homing[i].rev = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,612 :: 		homing[i].home = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,607 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,613 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming88
NOP	
L_ResetHoming89:
;Kinematics.c,614 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,617 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,618 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,620 :: 		if(!homing[axis].set){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home199
NOP	
J	L_Home91
NOP	
L__Home199:
;Kinematics.c,621 :: 		homing[axis].set = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,622 :: 		homing[axis].complete = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,623 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,624 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,625 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home92
NOP	
L_Home91:
;Kinematics.c,626 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,627 :: 		}
L_Home92:
;Kinematics.c,631 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home201
NOP	
J	L_Home93
NOP	
L__Home201:
;Kinematics.c,632 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home202
NOP	
J	L_Home94
NOP	
L__Home202:
;Kinematics.c,633 :: 		StopAxis(X);
SW	R4, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home95
NOP	
L_Home94:
;Kinematics.c,634 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home203
NOP	
J	L_Home96
NOP	
L__Home203:
;Kinematics.c,635 :: 		StopAxis(Y);
SW	R4, 8(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home96:
L_Home95:
;Kinematics.c,637 :: 		if(!homing[axis].rev){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home204
NOP	
J	L_Home97
NOP	
L__Home204:
;Kinematics.c,638 :: 		homing[axis].rev = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,639 :: 		Inv_Home_Axis(2.0,speed, axis);
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
;Kinematics.c,640 :: 		}
L_Home97:
;Kinematics.c,641 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,642 :: 		}
L_Home93:
;Kinematics.c,644 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home206
NOP	
J	L_Home98
NOP	
L__Home206:
;Kinematics.c,645 :: 		homing[axis].home = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,646 :: 		}
L_Home98:
;Kinematics.c,648 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
LBU	R2, Offset(-1082064701)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home207
NOP	
J	L__Home129
NOP	
L__Home207:
LBU	R2, Offset(-1082064703)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home208
NOP	
J	L__Home128
NOP	
L__Home208:
LBU	R2, Offset(-1082064688)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Home209
NOP	
J	L__Home127
NOP	
L__Home209:
LBU	R2, Offset(-1082064702)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home210
NOP	
J	L__Home126
NOP	
L__Home210:
L__Home123:
;Kinematics.c,650 :: 		if(!homing[axis].home){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home211
NOP	
J	L_Home102
NOP	
L__Home211:
;Kinematics.c,651 :: 		homing[axis].home = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,652 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,653 :: 		}
L_Home102:
;Kinematics.c,655 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home212
NOP	
J	L__Home125
NOP	
L__Home212:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home213
NOP	
J	L__Home124
NOP	
L__Home213:
L__Home122:
;Kinematics.c,656 :: 		homing[axis].complete      = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,657 :: 		STPS[axis].step_count      = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,658 :: 		STPS[axis].steps_position  = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Kinematics.c,655 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
L__Home125:
L__Home124:
;Kinematics.c,648 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home129:
L__Home128:
L__Home127:
L__Home126:
;Kinematics.c,662 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,665 :: 		void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,666 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis215
NOP	
J	L_Home_Axis106
NOP	
L__Home_Axis215:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T644 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T644 end address is: 8 (R2)
J	L_Home_Axis107
NOP	
L_Home_Axis106:
; ?FLOC___Home_Axis?T644 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T644 end address is: 8 (R2)
L_Home_Axis107:
; ?FLOC___Home_Axis?T644 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,667 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis216
NOP	
J	L_Home_Axis108
NOP	
L__Home_Axis216:
; ?FLOC___Home_Axis?T644 end address is: 8 (R2)
; ?FLOC___Home_Axis?T646 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T646 end address is: 0 (R0)
J	L_Home_Axis109
NOP	
L_Home_Axis108:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T646 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T646 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis109:
; ?FLOC___Home_Axis?T646 start address is: 0 (R0)
MOV.S 	S12, S0
;Kinematics.c,668 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
; ?FLOC___Home_Axis?T646 end address is: 0 (R0)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,669 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,670 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,671 :: 		}
L_end_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,673 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,674 :: 		distance = (distance > 10.0)?  10.0 : distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis218
NOP	
J	L_Inv_Home_Axis110
NOP	
L__Inv_Home_Axis218:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T669 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T669 end address is: 8 (R2)
J	L_Inv_Home_Axis111
NOP	
L_Inv_Home_Axis110:
; ?FLOC___Inv_Home_Axis?T669 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T669 end address is: 8 (R2)
L_Inv_Home_Axis111:
; ?FLOC___Inv_Home_Axis?T669 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,675 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis219
NOP	
J	L_Inv_Home_Axis112
NOP	
L__Inv_Home_Axis219:
; ?FLOC___Inv_Home_Axis?T669 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T671 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T671 end address is: 8 (R2)
J	L_Inv_Home_Axis113
NOP	
L_Inv_Home_Axis112:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T671 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T671 end address is: 8 (R2)
L_Inv_Home_Axis113:
; ?FLOC___Inv_Home_Axis?T671 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T671 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,676 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
;Kinematics.c,677 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,678 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,679 :: 		}
L_end_Inv_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Inv_Home_Axis
