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
BNE	R2, R0, L__SetInitialSizes115
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes115:
;Kinematics.c,24 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
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
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 84
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep117
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep117:
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
;Kinematics.c,42 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,43 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,44 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
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
;Kinematics.c,45 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,63 :: 		dir = (newxyz < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep118
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep118:
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
;Kinematics.c,64 :: 		switch(axis_No){
J	L_SingleAxisStep7
NOP	
;Kinematics.c,65 :: 		case X:
L_SingleAxisStep9:
;Kinematics.c,66 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,67 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,68 :: 		case Y:
L_SingleAxisStep10:
;Kinematics.c,69 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,70 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,71 :: 		case Z:
L_SingleAxisStep11:
;Kinematics.c,72 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,73 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,74 :: 		case A:
L_SingleAxisStep12:
;Kinematics.c,75 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,76 :: 		break;
J	L_SingleAxisStep8
NOP	
;Kinematics.c,77 :: 		default: break;
L_SingleAxisStep13:
J	L_SingleAxisStep8
NOP	
;Kinematics.c,78 :: 		}
L_SingleAxisStep7:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep120
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep120:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep122
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep122:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep124
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep124:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep126
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep126:
; dir end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,79 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,81 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,83 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,90 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,92 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,94 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,95 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,96 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,97 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,100 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,102 :: 		switch(axis_combo){
J	L_DualAxisStep14
NOP	
;Kinematics.c,103 :: 		case xy:
L_DualAxisStep16:
;Kinematics.c,105 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,107 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,109 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep128
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep128:
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
;Kinematics.c,110 :: 		STPS[Y].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep129
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep129:
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
;Kinematics.c,112 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,114 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,115 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,119 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep130
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep130:
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
;Kinematics.c,120 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep131
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep131:
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
;Kinematics.c,122 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,123 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,125 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,126 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,128 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep132
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep132:
;Kinematics.c,129 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,131 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep26:
;Kinematics.c,133 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep133
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep133:
;Kinematics.c,134 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,135 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+92)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+92)(GP)
;Kinematics.c,136 :: 		}else{
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,137 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,138 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+92)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+92)(GP)
;Kinematics.c,139 :: 		}
L_DualAxisStep28:
;Kinematics.c,141 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,142 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+120)(GP)
;Kinematics.c,143 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,145 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,146 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,148 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,150 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,152 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep134
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep134:
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
;Kinematics.c,153 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep135
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep135:
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
;Kinematics.c,155 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,159 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,160 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,162 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep136
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep136:
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
;Kinematics.c,163 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep137
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep137:
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
;Kinematics.c,165 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,166 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
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
;Kinematics.c,171 :: 		if(SV.dx > SV.dz)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep138
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep138:
;Kinematics.c,172 :: 		d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,174 :: 		d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);
SW	R0, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,176 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,177 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+208)(GP)
;Kinematics.c,178 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,179 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,180 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,182 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,184 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,185 :: 		STPS[Y].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep139
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep139:
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
;Kinematics.c,186 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep140
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep140:
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
;Kinematics.c,188 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,192 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,193 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,195 :: 		dirA = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep141
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep141:
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
;Kinematics.c,196 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep142
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep142:
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
;Kinematics.c,198 :: 		DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
ANDI	R3, R4, 1
; dirA end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,199 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R5, 1
; dirB end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,201 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,202 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,204 :: 		if(SV.dy > SV.dz)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep143
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep143:
;Kinematics.c,205 :: 		SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,207 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep50:
;Kinematics.c,209 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+120)(GP)
;Kinematics.c,210 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+208)(GP)
;Kinematics.c,211 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,212 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,213 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep15
NOP	
;Kinematics.c,215 :: 		}
L_DualAxisStep14:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep145
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep145:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep147
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep147:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep149
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep149:
J	L_DualAxisStep51
NOP	
L_DualAxisStep15:
;Kinematics.c,216 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,236 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
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
;Kinematics.c,237 :: 		unsigned short isclockwise = 0;
;Kinematics.c,238 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,242 :: 		double x = 0.00;
;Kinematics.c,243 :: 		double y = 0.00;
;Kinematics.c,244 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,248 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 28
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,249 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,250 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 52
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,251 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,252 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 76
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,253 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,255 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk151
NOP	
J	L_r_or_ijk52
NOP	
L__r_or_ijk151:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,319 :: 		x = target[axis_plane_a] - position[axis_plane_a];
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
;Kinematics.c,321 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 102(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,325 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,328 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
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
;Kinematics.c,330 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk152
NOP	
J	L__r_or_ijk103
NOP	
L__r_or_ijk152:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk53
NOP	
L__r_or_ijk103:
L_r_or_ijk53:
;Kinematics.c,353 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk153
NOP	
J	L__r_or_ijk104
NOP	
L__r_or_ijk153:
;Kinematics.c,354 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,355 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,356 :: 		}
J	L_r_or_ijk54
NOP	
L__r_or_ijk104:
;Kinematics.c,353 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,356 :: 		}
L_r_or_ijk54:
;Kinematics.c,359 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,361 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,362 :: 		} else {
MOV.S 	S16, S2
; r end address is: 16 (R4)
J	L_r_or_ijk55
NOP	
L_r_or_ijk52:
;Kinematics.c,365 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Kinematics.c,366 :: 		}
L_r_or_ijk55:
;Kinematics.c,367 :: 		dma_printf("Radius:= %f",r);
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
;Kinematics.c,370 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,371 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk154
NOP	
J	L__r_or_ijk105
NOP	
L__r_or_ijk154:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk56
NOP	
L__r_or_ijk105:
L_r_or_ijk56:
;Kinematics.c,375 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 76
ADDIU	R4, SP, 52
ADDIU	R3, SP, 28
;Kinematics.c,376 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
MOV.S 	S13, S16
; r end address is: 128 (R32)
MTC1	R2, S12
;Kinematics.c,375 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,376 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,375 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,376 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,377 :: 		}
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
;Kinematics.c,382 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
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
LBU	R2, 84(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,386 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LBU	R2, 85(SP)
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
;Kinematics.c,394 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,395 :: 		uint16_t segments              = 0;
;Kinematics.c,396 :: 		double cos_T                   = 0.00;
;Kinematics.c,397 :: 		double sin_T                   = 0.00;
;Kinematics.c,404 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 57(SP)
;Kinematics.c,410 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,412 :: 		if (isclockwise) {
BNE	R7, R0, L__mc_arc157
NOP	
J	L_mc_arc57
NOP	
L__mc_arc157:
; isclockwise end address is: 28 (R7)
;Kinematics.c,414 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc158
NOP	
J	L_mc_arc58
NOP	
L__mc_arc158:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc58:
;Kinematics.c,415 :: 		} else {
J	L_mc_arc59
NOP	
L_mc_arc57:
;Kinematics.c,416 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc159
NOP	
J	L_mc_arc60
NOP	
L__mc_arc159:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc60:
;Kinematics.c,417 :: 		}
L_mc_arc59:
;Kinematics.c,420 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,423 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
;Kinematics.c,428 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R6, R0, L__mc_arc161
NOP	
J	L_mc_arc61
NOP	
L__mc_arc161:
; invert_feed_rate end address is: 24 (R6)
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc61:
;Kinematics.c,429 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 68(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,430 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 60(SP)
;Kinematics.c,434 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 64(SP)
;Kinematics.c,461 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,462 :: 		sin_T = theta_per_segment;
SWC1	S2, 80(SP)
;Kinematics.c,464 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,465 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,466 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 48(SP)
L_mc_arc62:
LHU	R3, 72(SP)
LHU	R2, 48(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc162
NOP	
J	L_mc_arc63
NOP	
L__mc_arc162:
;Kinematics.c,467 :: 		if (count < n_arc_correction) {
LBU	R3, 56(SP)
LB	R2, 57(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc163
NOP	
J	L_mc_arc65
NOP	
L__mc_arc163:
;Kinematics.c,469 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 76(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,470 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 76(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,471 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,472 :: 		count++;
LB	R2, 57(SP)
ADDIU	R2, R2, 1
SB	R2, 57(SP)
;Kinematics.c,473 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc65:
;Kinematics.c,476 :: 		cos_Ti = cos(i*theta_per_segment);
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
;Kinematics.c,477 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 48(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,478 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,479 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,480 :: 		count = 0;
SB	R0, 57(SP)
;Kinematics.c,481 :: 		}
L_mc_arc66:
;Kinematics.c,484 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,485 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,486 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 85(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,487 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,488 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,489 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 52(SP)
;Kinematics.c,490 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
;Kinematics.c,491 :: 		while(1){
L_mc_arc67:
;Kinematics.c,492 :: 		if(!OC5IE_bit && !OC2IE_bit)
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc164
NOP	
J	L__mc_arc102
NOP	
L__mc_arc164:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc165
NOP	
J	L__mc_arc101
NOP	
L__mc_arc165:
L__mc_arc100:
;Kinematics.c,493 :: 		break;
J	L_mc_arc68
NOP	
;Kinematics.c,492 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc102:
L__mc_arc101:
;Kinematics.c,494 :: 		}
J	L_mc_arc67
NOP	
L_mc_arc68:
;Kinematics.c,501 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,502 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 52(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+152)(GP)
;Kinematics.c,503 :: 		tempA = abs(STPS[X].mmToTravel);
SW	R25, 4(SP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
;Kinematics.c,504 :: 		tempB = abs(STPS[Y].mmToTravel);
LW	R25, Offset(_STPS+152)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,505 :: 		if(tempA > tempB)
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc166
NOP	
J	L_mc_arc72
NOP	
L__mc_arc166:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
;Kinematics.c,506 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
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
;Kinematics.c,508 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
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
;Kinematics.c,511 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
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
;Kinematics.c,466 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 48(SP)
ADDIU	R2, R2, 1
SH	R2, 48(SP)
;Kinematics.c,515 :: 		}
J	L_mc_arc62
NOP	
L_mc_arc63:
;Kinematics.c,518 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,520 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,521 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,522 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,530 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,531 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection169
NOP	
J	L_GetAxisDirection74
NOP	
L__GetAxisDirection169:
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
;Kinematics.c,532 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,538 :: 		void ResetHoming(){
;Kinematics.c,539 :: 		int i = 0;
;Kinematics.c,540 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming76:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming171
NOP	
J	L_ResetHoming77
NOP	
L__ResetHoming171:
;Kinematics.c,541 :: 		homing[i].set = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,542 :: 		homing[i].complete = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,543 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,544 :: 		homing[i].rev = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,545 :: 		homing[i].home = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,540 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,546 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming76
NOP	
L_ResetHoming77:
;Kinematics.c,547 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,550 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,551 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,553 :: 		if(!homing[axis].set){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home173
NOP	
J	L_Home79
NOP	
L__Home173:
;Kinematics.c,554 :: 		homing[axis].set = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,555 :: 		homing[axis].complete = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,556 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,557 :: 		speed = 1000;
; speed start address is: 16 (R4)
ORI	R4, R0, 1000
;Kinematics.c,558 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home80
NOP	
L_Home79:
;Kinematics.c,559 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,560 :: 		}
L_Home80:
;Kinematics.c,564 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home175
NOP	
J	L_Home81
NOP	
L__Home175:
;Kinematics.c,565 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home176
NOP	
J	L_Home82
NOP	
L__Home176:
;Kinematics.c,566 :: 		StopX();
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_StopX+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home83
NOP	
L_Home82:
;Kinematics.c,567 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home177
NOP	
J	L_Home84
NOP	
L__Home177:
;Kinematics.c,568 :: 		StopY();
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_StopY+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home84:
L_Home83:
;Kinematics.c,570 :: 		if(!homing[axis].rev){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home178
NOP	
J	L_Home85
NOP	
L__Home178:
;Kinematics.c,571 :: 		homing[axis].rev = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,572 :: 		Inv_Home_Axis(2.0,speed, axis);
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
;Kinematics.c,573 :: 		}
L_Home85:
;Kinematics.c,574 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,575 :: 		}
L_Home81:
;Kinematics.c,577 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home180
NOP	
J	L_Home86
NOP	
L__Home180:
;Kinematics.c,578 :: 		homing[axis].home = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,580 :: 		}
L_Home86:
;Kinematics.c,582 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__Home181
NOP	
J	L__Home113
NOP	
L__Home181:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__Home182
NOP	
J	L__Home112
NOP	
L__Home182:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__Home183
NOP	
J	L__Home111
NOP	
L__Home183:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__Home184
NOP	
J	L__Home110
NOP	
L__Home184:
L__Home107:
;Kinematics.c,584 :: 		if(!homing[axis].home){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home185
NOP	
J	L_Home90
NOP	
L__Home185:
;Kinematics.c,585 :: 		homing[axis].home = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,586 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,587 :: 		}
L_Home90:
;Kinematics.c,589 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home186
NOP	
J	L__Home109
NOP	
L__Home186:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home187
NOP	
J	L__Home108
NOP	
L__Home187:
L__Home106:
;Kinematics.c,590 :: 		homing[axis].complete      = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,591 :: 		STPS[axis].step_count      = 0;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,592 :: 		STPS[axis].steps_position  = 0;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Kinematics.c,589 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
L__Home109:
L__Home108:
;Kinematics.c,582 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home113:
L__Home112:
L__Home111:
L__Home110:
;Kinematics.c,597 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,600 :: 		void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,602 :: 		distance = (distance < 0.0)? distance : -distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis189
NOP	
J	L_Home_Axis94
NOP	
L__Home_Axis189:
; ?FLOC___Home_Axis?T529 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T529 end address is: 0 (R0)
J	L_Home_Axis95
NOP	
L_Home_Axis94:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T529 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T529 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis95:
; ?FLOC___Home_Axis?T529 start address is: 0 (R0)
MOV.S 	S12, S0
;Kinematics.c,603 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
; ?FLOC___Home_Axis?T529 end address is: 0 (R0)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,604 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,605 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,606 :: 		}
L_end_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,608 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,609 :: 		distance = (distance > 10.0)?  10.0 : distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis191
NOP	
J	L_Inv_Home_Axis96
NOP	
L__Inv_Home_Axis191:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T552 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T552 end address is: 8 (R2)
J	L_Inv_Home_Axis97
NOP	
L_Inv_Home_Axis96:
; ?FLOC___Inv_Home_Axis?T552 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T552 end address is: 8 (R2)
L_Inv_Home_Axis97:
; ?FLOC___Inv_Home_Axis?T552 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,610 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis192
NOP	
J	L_Inv_Home_Axis98
NOP	
L__Inv_Home_Axis192:
; ?FLOC___Inv_Home_Axis?T552 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T554 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T554 end address is: 8 (R2)
J	L_Inv_Home_Axis99
NOP	
L_Inv_Home_Axis98:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T554 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T554 end address is: 8 (R2)
L_Inv_Home_Axis99:
; ?FLOC___Inv_Home_Axis?T554 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T554 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,611 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
;Kinematics.c,612 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,613 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,614 :: 		}
L_end_Inv_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Inv_Home_Axis
