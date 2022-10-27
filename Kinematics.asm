_SingleAxisStep:
;Kinematics.c,21 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,28 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,29 :: 		sys.axis_dir[axis_No] = GetAxisDirection(newxyz);
SEH	R2, R26
SLL	R3, R2, 1
LUI	R2, hi_addr(_sys+0)
ORI	R2, R2, lo_addr(_sys+0)
ADDU	R2, R2, R3
SW	R2, 16(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R3, 16(SP)
SH	R2, 0(R3)
;Kinematics.c,31 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,32 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,33 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,34 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,35 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,36 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,37 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,38 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,39 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,40 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,41 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,42 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,43 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,44 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,45 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep89
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep89:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep91
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep91:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep93
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep93:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep95
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep95:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,46 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,47 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,48 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
SEH	R3, R26
ORI	R2, R0, 68
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
;Kinematics.c,50 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep96
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep96:
;Kinematics.c,51 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,53 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,55 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,56 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,57 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,58 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,59 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,60 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,61 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,62 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,63 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,64 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,65 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,66 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,67 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,68 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,69 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep98
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep98:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep100
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep100:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep102
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep102:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep104
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep104:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,71 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,73 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,75 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,80 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,81 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,83 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,84 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,85 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,86 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,90 :: 		if(axis_combo == xy){
SEH	R2, R27
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep106:
;Kinematics.c,91 :: 		sys.axis_dir[X] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+0)(GP)
;Kinematics.c,92 :: 		sys.axis_dir[Y] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,93 :: 		}else if(axis_combo == xz){
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
SEH	R3, R27
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep107
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep107:
;Kinematics.c,94 :: 		sys.axis_dir[X] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+0)(GP)
;Kinematics.c,95 :: 		sys.axis_dir[Z] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+4)(GP)
;Kinematics.c,96 :: 		}else if(axis_combo == yz){
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
SEH	R3, R27
ORI	R2, R0, 2
BEQ	R3, R2, L__DualAxisStep108
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep108:
;Kinematics.c,97 :: 		sys.axis_dir[Y] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,98 :: 		sys.axis_dir[Z] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+4)(GP)
;Kinematics.c,99 :: 		}
L_DualAxisStep20:
L_DualAxisStep19:
L_DualAxisStep17:
;Kinematics.c,100 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,102 :: 		switch(axis_combo){
J	L_DualAxisStep21
NOP	
;Kinematics.c,103 :: 		case xy:
L_DualAxisStep23:
;Kinematics.c,104 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,105 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,106 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,108 :: 		SV.dx   = axis_a - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,109 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,112 :: 		SV.dirx = SV.dx > 0? 1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep109:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
J	L_DualAxisStep25
NOP	
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
L_DualAxisStep25:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,113 :: 		SV.diry = SV.dy > 0? 1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep110:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
J	L_DualAxisStep27
NOP	
L_DualAxisStep26:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
L_DualAxisStep27:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,116 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep28
NOP	
L__DualAxisStep111:
;Kinematics.c,117 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep29
NOP	
L_DualAxisStep28:
;Kinematics.c,119 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep29:
;Kinematics.c,122 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep112
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep112:
;Kinematics.c,123 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
;Kinematics.c,125 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep31:
;Kinematics.c,128 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,129 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,131 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep113:
;Kinematics.c,132 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
;Kinematics.c,134 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep33:
;Kinematics.c,136 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep114:
;Kinematics.c,137 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,138 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+72)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,139 :: 		}else{
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,140 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,141 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,142 :: 		}
L_DualAxisStep35:
;Kinematics.c,144 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,145 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,146 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,148 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,149 :: 		case xz:
L_DualAxisStep36:
;Kinematics.c,150 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,151 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,152 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,154 :: 		SV.dx   = axis_a - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,155 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,158 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep115
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep115:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
J	L_DualAxisStep38
NOP	
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
L_DualAxisStep38:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,159 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep116:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,162 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep117
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep117:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
;Kinematics.c,163 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep42:
;Kinematics.c,165 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep118:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Kinematics.c,166 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep44:
;Kinematics.c,168 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,169 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,171 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep119
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep119:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Kinematics.c,172 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep46:
;Kinematics.c,174 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,175 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,176 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,177 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,178 :: 		case yz:
L_DualAxisStep47:
;Kinematics.c,179 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,180 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,181 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,184 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,185 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,188 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep120
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep120:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,189 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep121
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep121:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
L_DualAxisStep51:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,192 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep122
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep122:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Kinematics.c,193 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep53:
;Kinematics.c,194 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep123
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep123:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Kinematics.c,195 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep55:
;Kinematics.c,197 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,198 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,200 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep124
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep124:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Kinematics.c,201 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep57:
;Kinematics.c,203 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,204 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,205 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,206 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,207 :: 		default: break;
L_DualAxisStep58:
J	L_DualAxisStep22
NOP	
;Kinematics.c,209 :: 		}
L_DualAxisStep21:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep126
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep126:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep128
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep128:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep130
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep130:
J	L_DualAxisStep58
NOP	
L_DualAxisStep22:
;Kinematics.c,210 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,230 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
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
;Kinematics.c,231 :: 		unsigned short isclockwise = 0;
;Kinematics.c,232 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,236 :: 		double x = 0.00;
;Kinematics.c,237 :: 		double y = 0.00;
;Kinematics.c,238 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,242 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 28
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,243 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,244 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 52
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,245 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,246 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 76
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,247 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,249 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk132
NOP	
J	L_r_or_ijk59
NOP	
L__r_or_ijk132:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,313 :: 		x = target[axis_plane_a] - position[axis_plane_a];
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
;Kinematics.c,315 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 102(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,319 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,322 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
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
;Kinematics.c,324 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk133
NOP	
J	L__r_or_ijk84
NOP	
L__r_or_ijk133:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk60
NOP	
L__r_or_ijk84:
L_r_or_ijk60:
;Kinematics.c,347 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk134
NOP	
J	L__r_or_ijk85
NOP	
L__r_or_ijk134:
;Kinematics.c,348 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,349 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,350 :: 		}
J	L_r_or_ijk61
NOP	
L__r_or_ijk85:
;Kinematics.c,347 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,350 :: 		}
L_r_or_ijk61:
;Kinematics.c,353 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,355 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,356 :: 		} else {
MOV.S 	S16, S2
; r end address is: 16 (R4)
J	L_r_or_ijk62
NOP	
L_r_or_ijk59:
;Kinematics.c,359 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Kinematics.c,360 :: 		}
L_r_or_ijk62:
;Kinematics.c,361 :: 		dma_printf("Radius:= %f",r);
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
;Kinematics.c,364 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,365 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk135
NOP	
J	L__r_or_ijk86
NOP	
L__r_or_ijk135:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk63
NOP	
L__r_or_ijk86:
L_r_or_ijk63:
;Kinematics.c,369 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 76
ADDIU	R4, SP, 52
ADDIU	R3, SP, 28
;Kinematics.c,370 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
MOV.S 	S13, S16
; r end address is: 128 (R32)
MTC1	R2, S12
;Kinematics.c,369 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,370 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,369 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,370 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,371 :: 		}
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
;Kinematics.c,376 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
LBU	R2, 88(SP)
SB	R2, 88(SP)
LBU	R2, 89(SP)
SB	R2, 89(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 90(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 91(SP)
;Kinematics.c,378 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
ANDI	R2, R28, 255
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,379 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LBU	R2, 88(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,380 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LBU	R2, 89(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,381 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,382 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,383 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,384 :: 		double rt_axis1                 = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,385 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,386 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,387 :: 		double angular_travel          = 0.00;
;Kinematics.c,388 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,389 :: 		uint16_t segments              = 0;
;Kinematics.c,390 :: 		double cos_T                   = 0.00;
;Kinematics.c,391 :: 		double sin_T                   = 0.00;
;Kinematics.c,398 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 61(SP)
;Kinematics.c,404 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
SWC1	S0, 72(SP)
;Kinematics.c,406 :: 		if (isclockwise) {
BNE	R7, R0, L__mc_arc138
NOP	
J	L_mc_arc64
NOP	
L__mc_arc138:
; isclockwise end address is: 28 (R7)
;Kinematics.c,408 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 72(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc139
NOP	
J	L_mc_arc65
NOP	
L__mc_arc139:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 72(SP)
L_mc_arc65:
;Kinematics.c,409 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc64:
;Kinematics.c,410 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 72(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc140
NOP	
J	L_mc_arc67
NOP	
L__mc_arc140:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 72(SP)
L_mc_arc67:
;Kinematics.c,411 :: 		}
L_mc_arc66:
;Kinematics.c,414 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
LWC1	S1, 72(SP)
MUL.S 	S1, S1, S13
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
;Kinematics.c,417 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
SH	R2, 76(SP)
;Kinematics.c,422 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R6, R0, L__mc_arc142
NOP	
J	L_mc_arc68
NOP	
L__mc_arc142:
; invert_feed_rate end address is: 24 (R6)
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc68:
;Kinematics.c,423 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 72(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,424 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 64(SP)
;Kinematics.c,428 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 68(SP)
;Kinematics.c,455 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 80(SP)
;Kinematics.c,456 :: 		sin_T = theta_per_segment;
SWC1	S2, 84(SP)
;Kinematics.c,458 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,459 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,460 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 52(SP)
L_mc_arc69:
LHU	R3, 76(SP)
LHU	R2, 52(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc143
NOP	
J	L_mc_arc70
NOP	
L__mc_arc143:
;Kinematics.c,461 :: 		if (count < n_arc_correction) {
LBU	R3, 60(SP)
LB	R2, 61(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc144
NOP	
J	L_mc_arc72
NOP	
L__mc_arc144:
;Kinematics.c,463 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 84(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,464 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 84(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,465 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,466 :: 		count++;
LB	R2, 61(SP)
ADDIU	R2, R2, 1
SB	R2, 61(SP)
;Kinematics.c,467 :: 		} else {
J	L_mc_arc73
NOP	
L_mc_arc72:
;Kinematics.c,470 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 48(SP)
;Kinematics.c,471 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,472 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
ANDI	R2, R28, 255
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 48(SP)
MUL.S 	S3, S2, S1
LBU	R2, 88(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
;Kinematics.c,473 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,474 :: 		count = 0;
SB	R0, 61(SP)
;Kinematics.c,475 :: 		}
L_mc_arc73:
;Kinematics.c,478 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,479 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,480 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 89(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,481 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,482 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,483 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 56(SP)
;Kinematics.c,484 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
;Kinematics.c,485 :: 		while(1){
L_mc_arc74:
;Kinematics.c,486 :: 		if(!OC5IE_bit && !OC2IE_bit)
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc145
NOP	
J	L__mc_arc83
NOP	
L__mc_arc145:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc146
NOP	
J	L__mc_arc82
NOP	
L__mc_arc146:
L__mc_arc81:
;Kinematics.c,487 :: 		break;
J	L_mc_arc75
NOP	
;Kinematics.c,486 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc83:
L__mc_arc82:
;Kinematics.c,488 :: 		}
J	L_mc_arc74
NOP	
L_mc_arc75:
;Kinematics.c,495 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,496 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 56(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+132)(GP)
;Kinematics.c,497 :: 		tempA = abs(STPS[X].mmToTravel);
SW	R25, 4(SP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
;Kinematics.c,498 :: 		tempB = abs(STPS[Y].mmToTravel);
LW	R25, Offset(_STPS+132)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,499 :: 		if(tempA > tempB)
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc147
NOP	
J	L_mc_arc79
NOP	
L__mc_arc147:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
;Kinematics.c,500 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
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
J	L_mc_arc80
NOP	
L_mc_arc79:
;Kinematics.c,502 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+132)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
L_mc_arc80:
;Kinematics.c,505 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,460 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,509 :: 		}
J	L_mc_arc69
NOP	
L_mc_arc70:
;Kinematics.c,512 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,514 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,515 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,516 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
