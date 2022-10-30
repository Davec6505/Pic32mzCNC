_SetInitialSizes:
;Kinematics.c,18 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,19 :: 		int i = 0;
;Kinematics.c,21 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__SetInitialSizes91
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes91:
;Kinematics.c,22 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 80
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
;Kinematics.c,21 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,23 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,24 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
_SingleAxisStep:
;Kinematics.c,31 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,38 :: 		STPS[axis_No].axis_dir = Direction(newxyz);
SW	R25, 4(SP)
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 84
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep93
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep93:
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
;Kinematics.c,39 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,40 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,41 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,42 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 36
LW	R2, Offset(_SV+48)(GP)
SUBU	R2, R25, R2
SW	R2, 0(R3)
;Kinematics.c,43 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 16(SP)
SW	R25, 8(SP)
LW	R25, 0(R2)
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 16(SP)
SW	R3, 0(R2)
;Kinematics.c,61 :: 		dir = (newxyz < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep94
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep94:
; ?FLOC___SingleAxisStep?T42 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___SingleAxisStep?T42 end address is: 8 (R2)
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep5:
; ?FLOC___SingleAxisStep?T42 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SingleAxisStep?T42 end address is: 8 (R2)
L_SingleAxisStep6:
; ?FLOC___SingleAxisStep?T42 start address is: 8 (R2)
; dir start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___SingleAxisStep?T42 end address is: 8 (R2)
;Kinematics.c,62 :: 		switch(axis_No){
J	L_SingleAxisStep7
NOP	
;Kinematics.c,63 :: 		case X:
L_SingleAxisStep9:
;Kinematics.c,64 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,65 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,66 :: 		case Y:
L_SingleAxisStep10:
;Kinematics.c,67 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,68 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,69 :: 		case Z:
L_SingleAxisStep11:
;Kinematics.c,70 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,71 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,72 :: 		case A:
L_SingleAxisStep12:
;Kinematics.c,73 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,74 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,75 :: 		default: break;
L_SingleAxisStep13:
J	L_SingleAxisStep8
NOP	
;Kinematics.c,76 :: 		}
L_SingleAxisStep7:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep96
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep96:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep98
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep98:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep100
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep100:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep102
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep102:
; dir end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,77 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,79 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,81 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,88 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,90 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,92 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,93 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,94 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,95 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,98 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,100 :: 		switch(axis_combo){
J	L_DualAxisStep14
NOP	
;Kinematics.c,101 :: 		case xy:
L_DualAxisStep16:
;Kinematics.c,103 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,105 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,107 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep104:
; ?FLOC___DualAxisStep?T65 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T65 end address is: 12 (R3)
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T65 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T65 end address is: 12 (R3)
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T65 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T65 end address is: 12 (R3)
SH	R2, Offset(_STPS+84)(GP)
;Kinematics.c,108 :: 		STPS[Y].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep105:
; ?FLOC___DualAxisStep?T68 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T68 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T68 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T68 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T68 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T68 end address is: 12 (R3)
SH	R2, Offset(_STPS+172)(GP)
;Kinematics.c,110 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,112 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,113 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,117 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep106:
; ?FLOC___DualAxisStep?T72 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T72 end address is: 8 (R2)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T72 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T72 end address is: 8 (R2)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T72 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T72 end address is: 8 (R2)
;Kinematics.c,118 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep107:
; ?FLOC___DualAxisStep?T74 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T74 end address is: 8 (R2)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T74 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T74 end address is: 8 (R2)
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T74 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T74 end address is: 8 (R2)
;Kinematics.c,120 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,121 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,123 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,124 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,126 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep108:
;Kinematics.c,127 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,129 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep26:
;Kinematics.c,131 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep109:
;Kinematics.c,132 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,133 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+92)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+92)(GP)
;Kinematics.c,134 :: 		}else{
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,135 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,136 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+92)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+92)(GP)
;Kinematics.c,137 :: 		}
L_DualAxisStep28:
;Kinematics.c,139 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,140 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+120)(GP)
;Kinematics.c,141 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,143 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,144 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,146 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,148 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,150 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep110:
; ?FLOC___DualAxisStep?T104 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T104 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T104 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T104 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T104 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T104 end address is: 12 (R3)
SH	R2, Offset(_STPS+84)(GP)
;Kinematics.c,151 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep111:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T107 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T107 end address is: 12 (R3)
SH	R2, Offset(_STPS+260)(GP)
;Kinematics.c,153 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,157 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,158 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,160 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep112
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep112:
; ?FLOC___DualAxisStep?T111 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T111 end address is: 8 (R2)
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
; ?FLOC___DualAxisStep?T111 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T111 end address is: 8 (R2)
L_DualAxisStep35:
; ?FLOC___DualAxisStep?T111 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T111 end address is: 8 (R2)
;Kinematics.c,161 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep113:
; ?FLOC___DualAxisStep?T113 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T113 end address is: 8 (R2)
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
; ?FLOC___DualAxisStep?T113 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T113 end address is: 8 (R2)
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T113 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T113 end address is: 8 (R2)
;Kinematics.c,163 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,164 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,166 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,167 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,169 :: 		if(SV.dx > SV.dz)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep114:
;Kinematics.c,170 :: 		d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,172 :: 		d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);
SW	R0, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,174 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,175 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+208)(GP)
;Kinematics.c,176 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,177 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,178 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,180 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,182 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,183 :: 		STPS[Y].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep115
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep115:
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
SH	R2, Offset(_STPS+172)(GP)
;Kinematics.c,184 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep116:
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
SH	R2, Offset(_STPS+260)(GP)
;Kinematics.c,186 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,190 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,191 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,193 :: 		dirA = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep117
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep117:
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
;Kinematics.c,194 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep118:
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
;Kinematics.c,196 :: 		DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
ANDI	R3, R4, 1
; dirA end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,197 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R5, 1
; dirB end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,199 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,200 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,202 :: 		if(SV.dy > SV.dz)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep119
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep119:
;Kinematics.c,203 :: 		SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,205 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep50:
;Kinematics.c,207 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+120)(GP)
;Kinematics.c,208 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+208)(GP)
;Kinematics.c,209 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,210 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,211 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep15
NOP	
;Kinematics.c,213 :: 		}
L_DualAxisStep14:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep121
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep121:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep123
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep123:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep125
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep125:
J	L_DualAxisStep51
NOP	
L_DualAxisStep15:
;Kinematics.c,214 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,234 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 48 (R12)
LWC1	S6, 120(SP)
; i start address is: 8 (R2)
LWC1	S1, 124(SP)
; j start address is: 16 (R4)
LWC1	S2, 128(SP)
; k start address is: 0 (R0)
LWC1	S0, 132(SP)
; k end address is: 0 (R0)
;Kinematics.c,235 :: 		unsigned short isclockwise = 0;
;Kinematics.c,236 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,240 :: 		double x = 0.00;
;Kinematics.c,241 :: 		double y = 0.00;
;Kinematics.c,242 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,246 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 28
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,247 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,248 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 52
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,249 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,250 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 76
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,251 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,253 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk127
NOP	
J	L_r_or_ijk52
NOP	
L__r_or_ijk127:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,317 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 52
LHU	R2, 100(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 28
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 32 (R8)
MOV.S 	S4, S3
;Kinematics.c,319 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 102(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,323 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,326 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 116(SP)
MOV.S 	S13, S5
MOV.S 	S12, S4
JAL	_hypot+0
NOP	
LWC1	S1, 116(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,328 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk128
NOP	
J	L__r_or_ijk87
NOP	
L__r_or_ijk128:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk53
NOP	
L__r_or_ijk87:
L_r_or_ijk53:
;Kinematics.c,351 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk129
NOP	
J	L__r_or_ijk88
NOP	
L__r_or_ijk129:
;Kinematics.c,352 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,353 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,354 :: 		}
J	L_r_or_ijk54
NOP	
L__r_or_ijk88:
;Kinematics.c,351 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,354 :: 		}
L_r_or_ijk54:
;Kinematics.c,357 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,359 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,360 :: 		} else {
MOV.S 	S16, S2
; r end address is: 16 (R4)
J	L_r_or_ijk55
NOP	
L_r_or_ijk52:
;Kinematics.c,363 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
MOV.S 	S16, S1
;Kinematics.c,364 :: 		}
L_r_or_ijk55:
;Kinematics.c,365 :: 		dma_printf("Radius:= %f",r);
; r start address is: 128 (R32)
ADDIU	R23, SP, 104
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 104
SWC1	S16, 20(SP)
SH	R27, 24(SP)
ADDIU	SP, SP, -8
SWC1	S16, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R27, 24(SP)
LWC1	S16, 20(SP)
;Kinematics.c,368 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,369 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk130
NOP	
J	L__r_or_ijk89
NOP	
L__r_or_ijk130:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk56
NOP	
L__r_or_ijk89:
L_r_or_ijk56:
;Kinematics.c,373 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 76
ADDIU	R4, SP, 52
ADDIU	R3, SP, 28
;Kinematics.c,374 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
MOV.S 	S13, S16
; r end address is: 128 (R32)
MTC1	R2, S12
;Kinematics.c,373 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,374 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,373 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,374 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,375 :: 		}
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
_mc_arc:
;Kinematics.c,380 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
LBU	R2, 84(SP)
SB	R2, 84(SP)
LBU	R2, 85(SP)
SB	R2, 85(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 86(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 87(SP)
;Kinematics.c,382 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
ANDI	R2, R28, 255
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,383 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LBU	R2, 84(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,384 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LBU	R2, 85(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,385 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,386 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,387 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,388 :: 		double rt_axis1                 = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,389 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,390 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,391 :: 		double angular_travel          = 0.00;
;Kinematics.c,392 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,393 :: 		uint16_t segments              = 0;
;Kinematics.c,394 :: 		double cos_T                   = 0.00;
;Kinematics.c,395 :: 		double sin_T                   = 0.00;
;Kinematics.c,402 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 57(SP)
;Kinematics.c,408 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
SWC1	S0, 68(SP)
;Kinematics.c,410 :: 		if (isclockwise) {
BNE	R7, R0, L__mc_arc133
NOP	
J	L_mc_arc57
NOP	
L__mc_arc133:
; isclockwise end address is: 28 (R7)
;Kinematics.c,412 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc134
NOP	
J	L_mc_arc58
NOP	
L__mc_arc134:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc58:
;Kinematics.c,413 :: 		} else {
J	L_mc_arc59
NOP	
L_mc_arc57:
;Kinematics.c,414 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc135
NOP	
J	L_mc_arc60
NOP	
L__mc_arc135:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc60:
;Kinematics.c,415 :: 		}
L_mc_arc59:
;Kinematics.c,418 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
LWC1	S1, 68(SP)
MUL.S 	S1, S1, S13
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
;Kinematics.c,421 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S1
DIV.S 	S0, S0, S1
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 72(SP)
;Kinematics.c,426 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R6, R0, L__mc_arc137
NOP	
J	L_mc_arc61
NOP	
L__mc_arc137:
; invert_feed_rate end address is: 24 (R6)
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc61:
;Kinematics.c,427 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 68(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,428 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 60(SP)
;Kinematics.c,432 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 64(SP)
;Kinematics.c,459 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 76(SP)
;Kinematics.c,460 :: 		sin_T = theta_per_segment;
SWC1	S2, 80(SP)
;Kinematics.c,462 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,463 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,464 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 48(SP)
L_mc_arc62:
LHU	R3, 72(SP)
LHU	R2, 48(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc138
NOP	
J	L_mc_arc63
NOP	
L__mc_arc138:
;Kinematics.c,465 :: 		if (count < n_arc_correction) {
LBU	R3, 56(SP)
LB	R2, 57(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc139
NOP	
J	L_mc_arc65
NOP	
L__mc_arc139:
;Kinematics.c,467 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 76(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,468 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 76(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,469 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,470 :: 		count++;
LB	R2, 57(SP)
ADDIU	R2, R2, 1
SB	R2, 57(SP)
;Kinematics.c,471 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc65:
;Kinematics.c,474 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 48(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,475 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 48(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,476 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
ANDI	R2, R28, 255
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LBU	R2, 84(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
;Kinematics.c,477 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,478 :: 		count = 0;
SB	R0, 57(SP)
;Kinematics.c,479 :: 		}
L_mc_arc66:
;Kinematics.c,482 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,483 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,484 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 85(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,485 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,486 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,487 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 52(SP)
;Kinematics.c,488 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
;Kinematics.c,489 :: 		while(1){
L_mc_arc67:
;Kinematics.c,490 :: 		if(!OC5IE_bit && !OC2IE_bit)
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc140
NOP	
J	L__mc_arc86
NOP	
L__mc_arc140:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc141
NOP	
J	L__mc_arc85
NOP	
L__mc_arc141:
L__mc_arc84:
;Kinematics.c,491 :: 		break;
J	L_mc_arc68
NOP	
;Kinematics.c,490 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc86:
L__mc_arc85:
;Kinematics.c,492 :: 		}
J	L_mc_arc67
NOP	
L_mc_arc68:
;Kinematics.c,499 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,500 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 52(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+152)(GP)
;Kinematics.c,501 :: 		tempA = abs(STPS[X].mmToTravel);
SW	R25, 4(SP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
;Kinematics.c,502 :: 		tempB = abs(STPS[Y].mmToTravel);
LW	R25, Offset(_STPS+152)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,503 :: 		if(tempA > tempB)
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc142
NOP	
J	L_mc_arc72
NOP	
L__mc_arc142:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
;Kinematics.c,504 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+64)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
J	L_mc_arc73
NOP	
L_mc_arc72:
;Kinematics.c,506 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+152)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
L_mc_arc73:
;Kinematics.c,509 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,464 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 48(SP)
ADDIU	R2, R2, 1
SH	R2, 48(SP)
;Kinematics.c,513 :: 		}
J	L_mc_arc62
NOP	
L_mc_arc63:
;Kinematics.c,516 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,518 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,519 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,520 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,528 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,529 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection145
NOP	
J	L_GetAxisDirection74
NOP	
L__GetAxisDirection145:
; ?FLOC___GetAxisDirection?T381 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T381 end address is: 8 (R2)
J	L_GetAxisDirection75
NOP	
L_GetAxisDirection74:
; ?FLOC___GetAxisDirection?T381 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T381 end address is: 8 (R2)
L_GetAxisDirection75:
; ?FLOC___GetAxisDirection?T381 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T381 end address is: 8 (R2)
;Kinematics.c,530 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home_Axis:
;Kinematics.c,537 :: 		void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,538 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis147
NOP	
J	L_Home_Axis76
NOP	
L__Home_Axis147:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T391 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T391 end address is: 8 (R2)
J	L_Home_Axis77
NOP	
L_Home_Axis76:
; ?FLOC___Home_Axis?T391 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T391 end address is: 8 (R2)
L_Home_Axis77:
; ?FLOC___Home_Axis?T391 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,539 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis148
NOP	
J	L_Home_Axis78
NOP	
L__Home_Axis148:
; ?FLOC___Home_Axis?T391 end address is: 8 (R2)
; ?FLOC___Home_Axis?T393 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T393 end address is: 0 (R0)
J	L_Home_Axis79
NOP	
L_Home_Axis78:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T393 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T393 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis79:
; ?FLOC___Home_Axis?T393 start address is: 0 (R0)
MOV.S 	S12, S0
; ?FLOC___Home_Axis?T393 end address is: 0 (R0)
;Kinematics.c,540 :: 		STPS[axis].mmToTravel = belt_steps(-max_sizes[axis]);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
SW	R2, 20(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SH	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,541 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
SH	R26, 12(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 12(SP)
;Kinematics.c,542 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
MOVZ	R25, R2, R0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,543 :: 		}
L_end_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,545 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,546 :: 		distance = (distance > 10.0)?  10.0 : distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis150
NOP	
J	L_Inv_Home_Axis80
NOP	
L__Inv_Home_Axis150:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T421 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T421 end address is: 8 (R2)
J	L_Inv_Home_Axis81
NOP	
L_Inv_Home_Axis80:
; ?FLOC___Inv_Home_Axis?T421 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T421 end address is: 8 (R2)
L_Inv_Home_Axis81:
; ?FLOC___Inv_Home_Axis?T421 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,547 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis151
NOP	
J	L_Inv_Home_Axis82
NOP	
L__Inv_Home_Axis151:
; ?FLOC___Inv_Home_Axis?T421 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T423 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T423 end address is: 8 (R2)
J	L_Inv_Home_Axis83
NOP	
L_Inv_Home_Axis82:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T423 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T423 end address is: 8 (R2)
L_Inv_Home_Axis83:
; ?FLOC___Inv_Home_Axis?T423 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T423 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,548 :: 		STPS[axis].mmToTravel = belt_steps(distance);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
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
;Kinematics.c,549 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
SH	R26, 12(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 12(SP)
;Kinematics.c,550 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 64
LW	R2, 0(R2)
MOVZ	R25, R2, R0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,551 :: 		}
L_end_Inv_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Inv_Home_Axis
