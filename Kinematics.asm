_SingleAxisStep:
;Kinematics.c,22 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,28 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,30 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,31 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,32 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,33 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,34 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,35 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,36 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,37 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,38 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,39 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,40 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,41 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,42 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,43 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,44 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep88
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep88:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep90
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep90:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep92
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep92:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep94
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep94:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,45 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,46 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,47 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,49 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep95
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep95:
;Kinematics.c,50 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,52 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,54 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,55 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,56 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,57 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,58 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,59 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,60 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,61 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,62 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,63 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,64 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,65 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,66 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,67 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,68 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep97
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep97:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep99
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep99:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep101:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep103
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep103:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,70 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,72 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,74 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,79 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,80 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,82 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,83 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,84 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,85 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,89 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,91 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,92 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,93 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,94 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,95 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,97 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,98 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,101 :: 		SV.dirx = SV.dx > 0? 1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep105:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,102 :: 		SV.diry = SV.dy > 0? 1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep106:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,105 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep107:
;Kinematics.c,106 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,108 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,110 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep108:
;Kinematics.c,111 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,113 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,115 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,116 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,118 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep109:
;Kinematics.c,119 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,120 :: 		}
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,122 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,123 :: 		}
L_DualAxisStep28:
;Kinematics.c,124 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep110:
;Kinematics.c,125 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,126 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+72)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,127 :: 		}else{
J	L_DualAxisStep30
NOP	
L_DualAxisStep29:
;Kinematics.c,128 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,129 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,130 :: 		}
L_DualAxisStep30:
;Kinematics.c,132 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,133 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,134 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,136 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,137 :: 		case xz:
L_DualAxisStep31:
;Kinematics.c,138 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,139 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,140 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,142 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,143 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,146 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep111:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,147 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep112
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep112:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
L_DualAxisStep35:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,150 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep113:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
;Kinematics.c,151 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,153 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep114:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,154 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep39:
;Kinematics.c,156 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,157 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,159 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep115
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep115:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep41
NOP	
L_DualAxisStep40:
;Kinematics.c,160 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep41:
;Kinematics.c,162 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,163 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,164 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,165 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,166 :: 		case yz:
L_DualAxisStep42:
;Kinematics.c,167 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,168 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,169 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,172 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,173 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,176 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep116:
; ?FLOC___DualAxisStep?T89 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T89 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T89 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T89 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T89 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T89 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,177 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep117
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep117:
; ?FLOC___DualAxisStep?T91 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T91 end address is: 12 (R3)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
; ?FLOC___DualAxisStep?T91 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T91 end address is: 12 (R3)
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T91 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T91 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,180 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep118:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Kinematics.c,181 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,182 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep119
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep119:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,183 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep50:
;Kinematics.c,185 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,186 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,188 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep120
NOP	
J	L_DualAxisStep51
NOP	
L__DualAxisStep120:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep52
NOP	
L_DualAxisStep51:
;Kinematics.c,189 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep52:
;Kinematics.c,191 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,192 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,193 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,194 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,195 :: 		default: break;
L_DualAxisStep53:
J	L_DualAxisStep17
NOP	
;Kinematics.c,197 :: 		}
L_DualAxisStep16:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep122
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep122:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep124
NOP	
J	L_DualAxisStep31
NOP	
L__DualAxisStep124:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep126
NOP	
J	L_DualAxisStep42
NOP	
L__DualAxisStep126:
J	L_DualAxisStep53
NOP	
L_DualAxisStep17:
;Kinematics.c,198 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,217 :: 		void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,double r, double i, double j, double k, int axis_xyz){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 32 (R8)
LWC1	S4, 100(SP)
; i start address is: 8 (R2)
LWC1	S1, 104(SP)
; j start address is: 16 (R4)
LWC1	S2, 108(SP)
; k start address is: 0 (R0)
LWC1	S0, 112(SP)
; k end address is: 0 (R0)
;Kinematics.c,218 :: 		unsigned short isclockwise = 0;
;Kinematics.c,219 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,223 :: 		double x = 0.00;
;Kinematics.c,224 :: 		double y = 0.00;
; y start address is: 24 (R6)
MTC1	R0, S3
;Kinematics.c,225 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,229 :: 		position[X] = Cur_axis_a;
ADDIU	R2, SP, 20
SWC1	S12, 0(R2)
;Kinematics.c,230 :: 		position[Y] = Cur_axis_b;
ADDIU	R2, R2, 4
SWC1	S13, 0(R2)
;Kinematics.c,231 :: 		target[X] = Fin_axis_a;
ADDIU	R2, SP, 44
SWC1	S14, 0(R2)
;Kinematics.c,232 :: 		target[Y] = Fin_axis_b;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,233 :: 		offset[X] = i;
ADDIU	R2, SP, 68
SWC1	S1, 0(R2)
;Kinematics.c,234 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S2, 0(R2)
;Kinematics.c,235 :: 		if(axis_xyz == xy){
SEH	R2, R25
BEQ	R2, R0, L__r_or_ijk128
NOP	
J	L_r_or_ijk54
NOP	
L__r_or_ijk128:
; y end address is: 24 (R6)
;Kinematics.c,236 :: 		axis_plane_a = X;
SH	R0, 92(SP)
;Kinematics.c,237 :: 		axis_plane_b = Y;
ORI	R2, R0, 1
SH	R2, 94(SP)
;Kinematics.c,238 :: 		}else if(axis_xyz == xz){
J	L_r_or_ijk55
NOP	
L_r_or_ijk54:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__r_or_ijk129
NOP	
J	L_r_or_ijk56
NOP	
L__r_or_ijk129:
; y end address is: 24 (R6)
;Kinematics.c,239 :: 		axis_plane_a = X;
SH	R0, 92(SP)
;Kinematics.c,240 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 94(SP)
;Kinematics.c,241 :: 		}else if(axis_xyz == yz){
J	L_r_or_ijk57
NOP	
L_r_or_ijk56:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 2
BEQ	R3, R2, L__r_or_ijk130
NOP	
J	L_r_or_ijk58
NOP	
L__r_or_ijk130:
;Kinematics.c,242 :: 		axis_plane_a = y;
MOV.S 	S0, S3
; y end address is: 24 (R6)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 92(SP)
;Kinematics.c,243 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 94(SP)
;Kinematics.c,244 :: 		}
L_r_or_ijk58:
L_r_or_ijk57:
L_r_or_ijk55:
;Kinematics.c,246 :: 		if (r != 0) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S4, S0
BC1F	0, L__r_or_ijk131
NOP	
J	L_r_or_ijk59
NOP	
L__r_or_ijk131:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,310 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 44
LHU	R2, 92(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 20
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 40 (R10)
MOV.S 	S5, S3
;Kinematics.c,312 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 94(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 48 (R12)
MOV.S 	S6, S2
;Kinematics.c,316 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S4
MUL.S 	S1, S0, S4
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,319 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 96(SP)
MOV.S 	S13, S6
MOV.S 	S12, S5
JAL	_hypot+0
NOP	
LWC1	S1, 96(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,321 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk132
NOP	
J	L__r_or_ijk83
NOP	
L__r_or_ijk132:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk60
NOP	
L__r_or_ijk83:
L_r_or_ijk60:
;Kinematics.c,344 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S4
BC1F	0, L__r_or_ijk133
NOP	
J	L__r_or_ijk84
NOP	
L__r_or_ijk133:
;Kinematics.c,345 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,346 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
; r end address is: 32 (R8)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,347 :: 		}
J	L_r_or_ijk61
NOP	
L__r_or_ijk84:
;Kinematics.c,344 :: 		if (r < 0) {
MOV.S 	S2, S4
MOV.S 	S3, S1
;Kinematics.c,347 :: 		}
L_r_or_ijk61:
;Kinematics.c,350 :: 		i =  0.5*(x-(y*h_x2_div_d));
; r start address is: 16 (R4)
; h_x2_div_d start address is: 24 (R6)
MUL.S 	S0, S6, S3
SUB.S 	S1, S5, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Kinematics.c,352 :: 		j =  0.5*(y+(x*h_x2_div_d));
MUL.S 	S0, S5, S3
; x end address is: 40 (R10)
; h_x2_div_d end address is: 24 (R6)
ADD.S 	S1, S6, S0
; y end address is: 48 (R12)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Kinematics.c,353 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk62
NOP	
L_r_or_ijk59:
;Kinematics.c,356 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Kinematics.c,357 :: 		}
L_r_or_ijk62:
;Kinematics.c,360 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,361 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__r_or_ijk134
NOP	
J	L__r_or_ijk85
NOP	
L__r_or_ijk134:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk63
NOP	
L__r_or_ijk85:
L_r_or_ijk63:
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 68
ADDIU	R4, SP, 44
ADDIU	R3, SP, 20
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,366 :: 		r, isclockwise);
MOV.S 	S13, S0
; r end address is: 0 (R0)
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,366 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,366 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,367 :: 		}
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
;Kinematics.c,372 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
LBU	R2, 88(SP)
SB	R2, 88(SP)
LBU	R2, 89(SP)
SB	R2, 89(SP)
; invert_feed_rate start address is: 16 (R4)
LBU	R4, 90(SP)
; isclockwise start address is: 20 (R5)
LBU	R5, 91(SP)
;Kinematics.c,374 :: 		double center_axis0            = position[X] + offset[X];
LWC1	S6, 0(R25)
LWC1	S5, 0(R27)
ADD.S 	S4, S6, S5
SWC1	S4, 20(SP)
;Kinematics.c,375 :: 		double center_axis1             = position[Y] + offset[Y];
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R27, 4
LWC1	S0, 0(R2)
ADD.S 	S3, S1, S0
SWC1	S3, 24(SP)
;Kinematics.c,376 :: 		double linear_travel           = target[X] - position[X];
LWC1	S2, 0(R26)
SUB.S 	S0, S2, S6
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,377 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,378 :: 		double r_axis1                 = -offset[Y];
ADDIU	R2, R27, 4
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 32(SP)
;Kinematics.c,379 :: 		double rt_axis0                = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,380 :: 		double rt_axis1                 = target[Y] - center_axis1;
ADDIU	R2, R26, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,381 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,382 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,383 :: 		double angular_travel          = 0.00;
;Kinematics.c,384 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,385 :: 		uint16_t segments              = 0;
;Kinematics.c,386 :: 		double cos_T                   = 0.00;
;Kinematics.c,387 :: 		double sin_T                   = 0.00;
;Kinematics.c,394 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 60(SP)
;Kinematics.c,399 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S4
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S3
ADD.S 	S2, S1, S0
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S3
; rt_axis1 end address is: 24 (R6)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S4
; rt_axis0 end address is: 32 (R8)
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
;Kinematics.c,401 :: 		if (isclockwise) {
BNE	R5, R0, L__mc_arc137
NOP	
J	L_mc_arc64
NOP	
L__mc_arc137:
; isclockwise end address is: 20 (R5)
;Kinematics.c,403 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 72(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc138
NOP	
J	L_mc_arc65
NOP	
L__mc_arc138:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 72(SP)
L_mc_arc65:
;Kinematics.c,404 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc64:
;Kinematics.c,405 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 72(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc139
NOP	
J	L_mc_arc67
NOP	
L__mc_arc139:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 72(SP)
L_mc_arc67:
;Kinematics.c,406 :: 		}
L_mc_arc66:
;Kinematics.c,409 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
; millimeters_of_travel start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,410 :: 		if (millimeters_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc140
NOP	
J	L_mc_arc68
NOP	
L__mc_arc140:
; invert_feed_rate end address is: 16 (R4)
; linear_travel end address is: 48 (R12)
; millimeters_of_travel end address is: 16 (R4)
J	L_end_mc_arc
NOP	
L_mc_arc68:
;Kinematics.c,412 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; millimeters_of_travel start address is: 16 (R4)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 16 (R4)
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S2, S0
; millimeters_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 76(SP)
;Kinematics.c,417 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R4, R0, L__mc_arc142
NOP	
J	L_mc_arc69
NOP	
L__mc_arc142:
; invert_feed_rate end address is: 16 (R4)
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc69:
;Kinematics.c,418 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 72(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,419 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 64(SP)
;Kinematics.c,423 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 68(SP)
;Kinematics.c,450 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,451 :: 		sin_T = theta_per_segment;
SWC1	S2, 84(SP)
;Kinematics.c,453 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,454 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,455 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 52(SP)
L_mc_arc70:
LHU	R3, 76(SP)
LHU	R2, 52(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc143
NOP	
J	L_mc_arc71
NOP	
L__mc_arc143:
;Kinematics.c,456 :: 		if (count < settings.n_arc_correction) {
LBU	R3, Offset(_settings+62)(GP)
LB	R2, 60(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc144
NOP	
J	L_mc_arc73
NOP	
L__mc_arc144:
;Kinematics.c,458 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 84(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,459 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 84(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,460 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,461 :: 		count++;
LB	R2, 60(SP)
ADDIU	R2, R2, 1
SB	R2, 60(SP)
;Kinematics.c,462 :: 		} else {
J	L_mc_arc74
NOP	
L_mc_arc73:
;Kinematics.c,465 :: 		cos_Ti = cos(i*theta_per_segment);
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
;Kinematics.c,466 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,467 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,468 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,469 :: 		count = 0;
SB	R0, 60(SP)
;Kinematics.c,470 :: 		}
L_mc_arc74:
;Kinematics.c,473 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,474 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,475 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 89(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,476 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,477 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,478 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 56(SP)
;Kinematics.c,479 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
;Kinematics.c,480 :: 		while(1){
L_mc_arc75:
;Kinematics.c,481 :: 		if(!OC5IE_bit && !OC2IE_bit)
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc145
NOP	
J	L__mc_arc82
NOP	
L__mc_arc145:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc146
NOP	
J	L__mc_arc81
NOP	
L__mc_arc146:
L__mc_arc80:
;Kinematics.c,482 :: 		break;
J	L_mc_arc76
NOP	
;Kinematics.c,481 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc82:
L__mc_arc81:
;Kinematics.c,483 :: 		}
J	L_mc_arc75
NOP	
L_mc_arc76:
;Kinematics.c,490 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,492 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 56(SP)
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Kinematics.c,494 :: 		STPS[X].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+8)(GP)
;Kinematics.c,495 :: 		STPS[Y].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+76)(GP)
;Kinematics.c,496 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,455 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,500 :: 		}
J	L_mc_arc70
NOP	
L_mc_arc71:
;Kinematics.c,503 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,505 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,506 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,507 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_SerialPrint:
;Kinematics.c,509 :: 		void SerialPrint(float r){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,510 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,511 :: 		int str_lenA = 0;
;Kinematics.c,512 :: 		str_lenA = strlen(txtA);
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strlen+0
NOP	
; str_lenA start address is: 44 (R11)
SEH	R11, R2
;Kinematics.c,513 :: 		memset(txtB,0,30);
ORI	R27, R0, 30
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_memset+0
NOP	
;Kinematics.c,515 :: 		sprintf(txt,"%0.2f",r);
ADDIU	SP, SP, -12
SWC1	S12, 8(SP)
LUI	R2, hi_addr(?lstr_1_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_1_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,516 :: 		strncpy(txtB, " ",strlen(txt));
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
ORI	R30, R0, 32
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R3, SP, 16
SEH	R27, R2
MOVZ	R26, R3, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncpy+0
NOP	
;Kinematics.c,517 :: 		strncat(txtB, txt,strlen(txt));
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,518 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,519 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
; str_lenA end address is: 44 (R11)
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,577 :: 		UART2_Write_Text(txtB);
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_UART2_Write_Text+0
NOP	
;Kinematics.c,586 :: 		}
L_end_SerialPrint:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SerialPrint
