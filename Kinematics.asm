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
BNE	R2, R0, L__SetInitialSizes117
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes117:
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
BNE	R2, R0, L__SingleAxisStep119
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep119:
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
BNE	R2, R0, L__SingleAxisStep120
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep120:
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
BNE	R2, R0, L__SingleAxisStep122
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep122:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep124
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep124:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep126
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep126:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep128
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep128:
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
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,77 :: 		SV.over=0;
SW	R25, 4(SP)
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
;Kinematics.c,90 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,92 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,94 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep130
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep130:
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
;Kinematics.c,95 :: 		STPS[Y].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep131
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep131:
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
;Kinematics.c,97 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,99 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,100 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,104 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep132
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep132:
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
;Kinematics.c,105 :: 		dirB = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep133
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep133:
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
;Kinematics.c,107 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,108 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,110 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,111 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,113 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep134
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep134:
;Kinematics.c,114 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,116 :: 		SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep26:
;Kinematics.c,118 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep135
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep135:
;Kinematics.c,119 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,120 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+96)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,121 :: 		}else{
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,122 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,123 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+96)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+96)(GP)
;Kinematics.c,124 :: 		}
L_DualAxisStep28:
;Kinematics.c,126 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,127 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,128 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,130 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,131 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,133 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,135 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,137 :: 		STPS[X].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep136
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep136:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T110 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T110 end address is: 12 (R3)
SH	R2, Offset(_STPS+88)(GP)
;Kinematics.c,138 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep137
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep137:
; ?FLOC___DualAxisStep?T113 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T113 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T113 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T113 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T113 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T113 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,140 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,144 :: 		SV.dx   = axis_a - SV.px;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,145 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,147 :: 		dirA = SV.dx > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep138
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep138:
; ?FLOC___DualAxisStep?T117 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T117 end address is: 8 (R2)
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
; ?FLOC___DualAxisStep?T117 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T117 end address is: 8 (R2)
L_DualAxisStep35:
; ?FLOC___DualAxisStep?T117 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T117 end address is: 8 (R2)
;Kinematics.c,148 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep139
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep139:
; ?FLOC___DualAxisStep?T119 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T119 end address is: 8 (R2)
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
; ?FLOC___DualAxisStep?T119 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T119 end address is: 8 (R2)
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T119 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T119 end address is: 8 (R2)
;Kinematics.c,150 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,151 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,153 :: 		SV.dx = labs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,154 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,156 :: 		if(SV.dx > SV.dz)
LW	R3, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep140
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep140:
;Kinematics.c,157 :: 		d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,159 :: 		d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);
SW	R0, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,161 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,162 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,163 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,164 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,165 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,167 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,169 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,170 :: 		STPS[Y].axis_dir = Direction(axis_a);
SLTI	R2, R25, 0
BNE	R2, R0, L__DualAxisStep141
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep141:
; ?FLOC___DualAxisStep?T136 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T136 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T136 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T136 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T136 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T136 end address is: 12 (R3)
SH	R2, Offset(_STPS+180)(GP)
;Kinematics.c,171 :: 		STPS[Z].axis_dir = Direction(axis_b);
SLTI	R2, R26, 0
BNE	R2, R0, L__DualAxisStep142
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep142:
; ?FLOC___DualAxisStep?T139 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T139 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T139 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T139 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T139 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T139 end address is: 12 (R3)
SH	R2, Offset(_STPS+272)(GP)
;Kinematics.c,173 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, Offset(_axis_xyz+0)(GP)
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,177 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,178 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,180 :: 		dirA = SV.dy > 0? CW:CCW;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep143
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep143:
; ?FLOC___DualAxisStep?T143 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T143 end address is: 8 (R2)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
; ?FLOC___DualAxisStep?T143 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T143 end address is: 8 (R2)
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T143 start address is: 8 (R2)
; dirA start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T143 end address is: 8 (R2)
;Kinematics.c,181 :: 		dirB = SV.dz > 0? CW:CCW;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep144
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep144:
; ?FLOC___DualAxisStep?T145 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T145 end address is: 8 (R2)
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
; ?FLOC___DualAxisStep?T145 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T145 end address is: 8 (R2)
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T145 start address is: 8 (R2)
; dirB start address is: 20 (R5)
SEB	R5, R2
; ?FLOC___DualAxisStep?T145 end address is: 8 (R2)
;Kinematics.c,183 :: 		DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
ANDI	R3, R4, 1
; dirA end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,184 :: 		DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R5, 1
; dirB end address is: 20 (R5)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,186 :: 		SV.dy = labs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,187 :: 		SV.dz = labs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,189 :: 		if(SV.dy > SV.dz)
LW	R3, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep145
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep145:
;Kinematics.c,190 :: 		SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,192 :: 		SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep50:
;Kinematics.c,194 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+124)(GP)
;Kinematics.c,195 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+216)(GP)
;Kinematics.c,196 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,197 :: 		break;
J	L_DualAxisStep15
NOP	
;Kinematics.c,198 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep15
NOP	
;Kinematics.c,200 :: 		}
L_DualAxisStep14:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep147
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep147:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep149
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep149:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep151
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep151:
J	L_DualAxisStep51
NOP	
L_DualAxisStep15:
;Kinematics.c,201 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
;Kinematics.c,221 :: 		double r, double i, double j, double k, int axis_A,int axis_B,int dir){
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
;Kinematics.c,222 :: 		unsigned short isclockwise = 0;
;Kinematics.c,223 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,227 :: 		double x = 0.00;
;Kinematics.c,228 :: 		double y = 0.00;
;Kinematics.c,229 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,233 :: 		position[axis_A] = Cur_axis_a;
ADDIU	R3, SP, 28
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S12, 0(R2)
;Kinematics.c,234 :: 		position[axis_B] = Cur_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S13, 0(R2)
;Kinematics.c,235 :: 		target[axis_A] = Fin_axis_a;
ADDIU	R3, SP, 52
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S14, 0(R2)
;Kinematics.c,236 :: 		target[axis_B] = Fin_axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S15, 0(R2)
;Kinematics.c,237 :: 		offset[axis_A] = i;
ADDIU	R3, SP, 76
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S1, 0(R2)
;Kinematics.c,238 :: 		offset[axis_B] = j;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S2, 0(R2)
;Kinematics.c,240 :: 		if (r != 0.00) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S6, S0
BC1F	0, L__r_or_ijk153
NOP	
J	L_r_or_ijk52
NOP	
L__r_or_ijk153:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,304 :: 		x = target[axis_plane_a] - position[axis_plane_a];
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
;Kinematics.c,306 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 102(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 40 (R10)
MOV.S 	S5, S2
;Kinematics.c,310 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S6
MUL.S 	S1, S0, S6
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
;Kinematics.c,313 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
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
;Kinematics.c,315 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk154
NOP	
J	L__r_or_ijk105
NOP	
L__r_or_ijk154:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk53
NOP	
L__r_or_ijk105:
L_r_or_ijk53:
;Kinematics.c,338 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S6
BC1F	0, L__r_or_ijk155
NOP	
J	L__r_or_ijk106
NOP	
L__r_or_ijk155:
;Kinematics.c,339 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,340 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S6
; r end address is: 48 (R12)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,341 :: 		}
J	L_r_or_ijk54
NOP	
L__r_or_ijk106:
;Kinematics.c,338 :: 		if (r < 0) {
MOV.S 	S2, S6
MOV.S 	S3, S1
;Kinematics.c,341 :: 		}
L_r_or_ijk54:
;Kinematics.c,344 :: 		i =  0.5*(x-(y*h_x2_div_d));
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
;Kinematics.c,346 :: 		j =  0.5*(y+(x*h_x2_div_d));
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
;Kinematics.c,347 :: 		} else {
MOV.S 	S16, S2
; r end address is: 16 (R4)
J	L_r_or_ijk55
NOP	
L_r_or_ijk52:
;Kinematics.c,350 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
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
;Kinematics.c,351 :: 		}
L_r_or_ijk55:
;Kinematics.c,352 :: 		dma_printf("Radius:= %f",r);
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
;Kinematics.c,355 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,356 :: 		if (dir == CW) { isclockwise = true; }
SEH	R2, R27
BEQ	R2, R0, L__r_or_ijk156
NOP	
J	L__r_or_ijk107
NOP	
L__r_or_ijk156:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk56
NOP	
L__r_or_ijk107:
L_r_or_ijk56:
;Kinematics.c,360 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 76
ADDIU	R4, SP, 52
ADDIU	R3, SP, 28
;Kinematics.c,361 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
LUI	R2, 17274
ORI	R2, R2, 0
MOV.S 	S13, S16
; r end address is: 128 (R32)
MTC1	R2, S12
;Kinematics.c,360 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
;Kinematics.c,361 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,360 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,361 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,362 :: 		}
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
;Kinematics.c,367 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
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
;Kinematics.c,369 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
ANDI	R2, R28, 255
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,370 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LBU	R2, 84(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,371 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LBU	R2, 85(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,372 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,373 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,374 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,375 :: 		double rt_axis1                 = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,376 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,377 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,378 :: 		double angular_travel          = 0.00;
;Kinematics.c,379 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,380 :: 		uint16_t segments              = 0;
;Kinematics.c,381 :: 		double cos_T                   = 0.00;
;Kinematics.c,382 :: 		double sin_T                   = 0.00;
;Kinematics.c,389 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 57(SP)
;Kinematics.c,395 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,397 :: 		if (isclockwise) {
BNE	R7, R0, L__mc_arc159
NOP	
J	L_mc_arc57
NOP	
L__mc_arc159:
; isclockwise end address is: 28 (R7)
;Kinematics.c,399 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc160
NOP	
J	L_mc_arc58
NOP	
L__mc_arc160:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc58:
;Kinematics.c,400 :: 		} else {
J	L_mc_arc59
NOP	
L_mc_arc57:
;Kinematics.c,401 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 68(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc161
NOP	
J	L_mc_arc60
NOP	
L__mc_arc161:
LWC1	S1, 68(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 68(SP)
L_mc_arc60:
;Kinematics.c,402 :: 		}
L_mc_arc59:
;Kinematics.c,405 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,408 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
;Kinematics.c,413 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R6, R0, L__mc_arc163
NOP	
J	L_mc_arc61
NOP	
L__mc_arc163:
; invert_feed_rate end address is: 24 (R6)
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc61:
;Kinematics.c,414 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 68(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,415 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 60(SP)
;Kinematics.c,419 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 64(SP)
;Kinematics.c,446 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,447 :: 		sin_T = theta_per_segment;
SWC1	S2, 80(SP)
;Kinematics.c,449 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,450 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,451 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 48(SP)
L_mc_arc62:
LHU	R3, 72(SP)
LHU	R2, 48(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc164
NOP	
J	L_mc_arc63
NOP	
L__mc_arc164:
;Kinematics.c,452 :: 		if (count < n_arc_correction) {
LBU	R3, 56(SP)
LB	R2, 57(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc165
NOP	
J	L_mc_arc65
NOP	
L__mc_arc165:
;Kinematics.c,454 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 76(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,455 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 76(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,456 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,457 :: 		count++;
LB	R2, 57(SP)
ADDIU	R2, R2, 1
SB	R2, 57(SP)
;Kinematics.c,458 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc65:
;Kinematics.c,461 :: 		cos_Ti = cos(i*theta_per_segment);
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
;Kinematics.c,462 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 48(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,463 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,464 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,465 :: 		count = 0;
SB	R0, 57(SP)
;Kinematics.c,466 :: 		}
L_mc_arc66:
;Kinematics.c,469 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,470 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,471 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 85(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,472 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,473 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,474 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 52(SP)
;Kinematics.c,475 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
;Kinematics.c,476 :: 		while(1){
L_mc_arc67:
;Kinematics.c,477 :: 		if(!OC5IE_bit && !OC2IE_bit)
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc166
NOP	
J	L__mc_arc104
NOP	
L__mc_arc166:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc167
NOP	
J	L__mc_arc103
NOP	
L__mc_arc167:
L__mc_arc102:
;Kinematics.c,478 :: 		break;
J	L_mc_arc68
NOP	
;Kinematics.c,477 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc104:
L__mc_arc103:
;Kinematics.c,479 :: 		}
J	L_mc_arc67
NOP	
L_mc_arc68:
;Kinematics.c,486 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+68)(GP)
;Kinematics.c,487 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 52(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+160)(GP)
;Kinematics.c,488 :: 		tempA = abs(STPS[X].mmToTravel);
SW	R25, 4(SP)
LW	R25, Offset(_STPS+68)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
;Kinematics.c,489 :: 		tempB = abs(STPS[Y].mmToTravel);
LW	R25, Offset(_STPS+160)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,490 :: 		if(tempA > tempB)
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc168
NOP	
J	L_mc_arc72
NOP	
L__mc_arc168:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
;Kinematics.c,491 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
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
;Kinematics.c,493 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
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
;Kinematics.c,496 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+160)(GP)
LW	R25, Offset(_STPS+68)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,451 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 48(SP)
ADDIU	R2, R2, 1
SH	R2, 48(SP)
;Kinematics.c,500 :: 		}
J	L_mc_arc62
NOP	
L_mc_arc63:
;Kinematics.c,503 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 84
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
_GetAxisDirection:
;Kinematics.c,515 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,516 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection171
NOP	
J	L_GetAxisDirection74
NOP	
L__GetAxisDirection171:
; ?FLOC___GetAxisDirection?T387 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T387 end address is: 8 (R2)
J	L_GetAxisDirection75
NOP	
L_GetAxisDirection74:
; ?FLOC___GetAxisDirection?T387 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T387 end address is: 8 (R2)
L_GetAxisDirection75:
; ?FLOC___GetAxisDirection?T387 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T387 end address is: 8 (R2)
;Kinematics.c,517 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,523 :: 		void ResetHoming(){
;Kinematics.c,524 :: 		int i = 0;
;Kinematics.c,525 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming76:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming173
NOP	
J	L_ResetHoming77
NOP	
L__ResetHoming173:
;Kinematics.c,526 :: 		homing[i].set = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,527 :: 		homing[i].complete = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,528 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,529 :: 		homing[i].rev = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,530 :: 		homing[i].home = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,525 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,531 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming76
NOP	
L_ResetHoming77:
;Kinematics.c,532 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,535 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,536 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,538 :: 		if(!homing[axis].set){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home175
NOP	
J	L_Home79
NOP	
L__Home175:
;Kinematics.c,539 :: 		homing[axis].set = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,540 :: 		homing[axis].complete = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,541 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,542 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,543 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home80
NOP	
L_Home79:
;Kinematics.c,544 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,545 :: 		}
L_Home80:
;Kinematics.c,549 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home177
NOP	
J	L_Home81
NOP	
L__Home177:
;Kinematics.c,550 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home178
NOP	
J	L_Home82
NOP	
L__Home178:
;Kinematics.c,551 :: 		StopX();
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_StopX+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home83
NOP	
L_Home82:
;Kinematics.c,552 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home179
NOP	
J	L_Home84
NOP	
L__Home179:
;Kinematics.c,553 :: 		StopY();
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_StopY+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home84:
L_Home83:
;Kinematics.c,555 :: 		if(!homing[axis].rev){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home180
NOP	
J	L_Home85
NOP	
L__Home180:
;Kinematics.c,556 :: 		homing[axis].rev = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,557 :: 		Inv_Home_Axis(2.0,speed, axis);
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
;Kinematics.c,558 :: 		}
L_Home85:
;Kinematics.c,559 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,560 :: 		}
L_Home81:
;Kinematics.c,562 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home182
NOP	
J	L_Home86
NOP	
L__Home182:
;Kinematics.c,563 :: 		homing[axis].home = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,564 :: 		}
L_Home86:
;Kinematics.c,566 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__Home183
NOP	
J	L__Home115
NOP	
L__Home183:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__Home184
NOP	
J	L__Home114
NOP	
L__Home184:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__Home185
NOP	
J	L__Home113
NOP	
L__Home185:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__Home186
NOP	
J	L__Home112
NOP	
L__Home186:
L__Home109:
;Kinematics.c,568 :: 		if(!homing[axis].home){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home187
NOP	
J	L_Home90
NOP	
L__Home187:
;Kinematics.c,569 :: 		homing[axis].home = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,570 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,571 :: 		}
L_Home90:
;Kinematics.c,573 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home188
NOP	
J	L__Home111
NOP	
L__Home188:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home189
NOP	
J	L__Home110
NOP	
L__Home189:
L__Home108:
;Kinematics.c,574 :: 		homing[axis].complete      = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_homing+0)
ORI	R2, R2, lo_addr(_homing+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,575 :: 		STPS[axis].step_count      = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,576 :: 		STPS[axis].steps_position  = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Kinematics.c,573 :: 		if((homing[axis].home_cnt >= 2)&&(!homing[axis].complete)){
L__Home111:
L__Home110:
;Kinematics.c,566 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home115:
L__Home114:
L__Home113:
L__Home112:
;Kinematics.c,580 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,583 :: 		void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,584 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis191
NOP	
J	L_Home_Axis94
NOP	
L__Home_Axis191:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
J	L_Home_Axis95
NOP	
L_Home_Axis94:
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
L_Home_Axis95:
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,585 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis192
NOP	
J	L_Home_Axis96
NOP	
L__Home_Axis192:
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
; ?FLOC___Home_Axis?T545 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T545 end address is: 0 (R0)
J	L_Home_Axis97
NOP	
L_Home_Axis96:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T545 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T545 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis97:
; ?FLOC___Home_Axis?T545 start address is: 0 (R0)
MOV.S 	S12, S0
;Kinematics.c,586 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
; ?FLOC___Home_Axis?T545 end address is: 0 (R0)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,587 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,588 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,589 :: 		}
L_end_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,591 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,592 :: 		distance = (distance > 10.0)?  10.0 : distance;
SW	R25, 4(SP)
SW	R27, 8(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis194
NOP	
J	L_Inv_Home_Axis98
NOP	
L__Inv_Home_Axis194:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T568 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T568 end address is: 8 (R2)
J	L_Inv_Home_Axis99
NOP	
L_Inv_Home_Axis98:
; ?FLOC___Inv_Home_Axis?T568 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T568 end address is: 8 (R2)
L_Inv_Home_Axis99:
; ?FLOC___Inv_Home_Axis?T568 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,593 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis195
NOP	
J	L_Inv_Home_Axis100
NOP	
L__Inv_Home_Axis195:
; ?FLOC___Inv_Home_Axis?T568 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
J	L_Inv_Home_Axis101
NOP	
L_Inv_Home_Axis100:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
L_Inv_Home_Axis101:
; ?FLOC___Inv_Home_Axis?T570 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T570 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,594 :: 		STPS[axis].mmToTravel = belt_steps(distance);
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
;Kinematics.c,595 :: 		speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
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
;Kinematics.c,596 :: 		SingleAxisStep(STPS[axis].mmToTravel,axis);
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
;Kinematics.c,597 :: 		}
L_end_Inv_Home_Axis:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Inv_Home_Axis
