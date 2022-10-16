_SingleAxisStep:
<<<<<<< HEAD
;Kinematics.c,21 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,27 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,29 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,30 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,31 :: 		Single_Axis_Enable(X);
=======
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
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,32 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,33 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,34 :: 		Single_Axis_Enable(Y);
=======
;Kinematics.c,33 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,34 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,35 :: 		Single_Axis_Enable(Y);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,35 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,36 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,37 :: 		Single_Axis_Enable(Z);
=======
;Kinematics.c,36 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,37 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,38 :: 		Single_Axis_Enable(Z);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,38 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,39 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,40 :: 		Single_Axis_Enable(A);
=======
;Kinematics.c,39 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,40 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,41 :: 		Single_Axis_Enable(A);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,41 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,42 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,43 :: 		}
=======
;Kinematics.c,42 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,43 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,44 :: 		}
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,44 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,45 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
=======
;Kinematics.c,45 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,46 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
>>>>>>> patch2
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
<<<<<<< HEAD
;Kinematics.c,46 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
=======
;Kinematics.c,47 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,48 :: 		if(newxyz < 0)
=======
;Kinematics.c,49 :: 		if(newxyz < 0)
>>>>>>> patch2
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep95
NOP	
J	L_SingleAxisStep7
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__SingleAxisStep124:
;Kinematics.c,49 :: 		dir = CCW;
=======
L__SingleAxisStep93:
=======
L__SingleAxisStep95:
>>>>>>> patch2
;Kinematics.c,50 :: 		dir = CCW;
>>>>>>> patch2
=======
L__SingleAxisStep93:
;Kinematics.c,50 :: 		dir = CCW;
>>>>>>> patch2
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
<<<<<<< HEAD
;Kinematics.c,51 :: 		dir = CW;
=======
;Kinematics.c,52 :: 		dir = CW;
>>>>>>> patch2
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
<<<<<<< HEAD
;Kinematics.c,53 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,54 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,55 :: 		DIR_StepX = dir;
=======
;Kinematics.c,54 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,55 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,56 :: 		DIR_StepX = dir;
>>>>>>> patch2
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,56 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,57 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,58 :: 		DIR_StepY = dir;
=======
;Kinematics.c,57 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,58 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,59 :: 		DIR_StepY = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,59 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,60 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,61 :: 		DIR_StepZ = dir;
=======
;Kinematics.c,60 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,61 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,62 :: 		DIR_StepZ = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,62 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,63 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,64 :: 		DIR_StepA = dir;
=======
;Kinematics.c,63 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,64 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,65 :: 		DIR_StepA = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,65 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,66 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,67 :: 		}
=======
;Kinematics.c,66 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,67 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,68 :: 		}
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,69 :: 		STPS[axis_No].step_count = 0;
=======
;Kinematics.c,70 :: 		STPS[axis_No].step_count = 0;
>>>>>>> patch2
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,71 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,73 :: 		}
=======
;Kinematics.c,72 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,74 :: 		}
>>>>>>> patch2
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
<<<<<<< HEAD
;Kinematics.c,78 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
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
<<<<<<< HEAD
;Kinematics.c,88 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,90 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,91 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,92 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,93 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,94 :: 		Multi_Axis_Enable(axis_xyz);
=======
=======
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
<<<<<<< HEAD
>>>>>>> patch2
;Kinematics.c,86 :: 		SV.d2 = 0;
=======
;Kinematics.c,85 :: 		SV.d2 = 0;
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,96 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
=======
;Kinematics.c,95 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,96 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,97 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,100 :: 		SV.dirx = SV.dx > 0? 1:-1;
=======
;Kinematics.c,98 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
=======
;Kinematics.c,97 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
>>>>>>> patch2
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,98 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
<<<<<<< HEAD
;Kinematics.c,102 :: 		SV.dirx = SV.dx > 0? 1:-1;
<<<<<<< HEAD
>>>>>>> patch2
=======
>>>>>>> patch2
=======
;Kinematics.c,101 :: 		SV.dirx = SV.dx > 0? 1:-1;
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,101 :: 		SV.diry = SV.dy > 0? 1:-1;
=======
;Kinematics.c,103 :: 		SV.diry = SV.dy > 0? 1:-1;
>>>>>>> patch2
=======
;Kinematics.c,103 :: 		SV.diry = SV.dy > 0? 1:-1;
>>>>>>> patch2
=======
;Kinematics.c,102 :: 		SV.diry = SV.dy > 0? 1:-1;
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,104 :: 		if(SV.dirx < 0)
=======
;Kinematics.c,106 :: 		if(SV.dirx < 0)
>>>>>>> patch2
=======
;Kinematics.c,105 :: 		if(SV.dirx < 0)
>>>>>>> patch2
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep23
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__DualAxisStep136:
;Kinematics.c,105 :: 		DIR_StepX = CCW;
=======
=======
>>>>>>> patch2
L__DualAxisStep105:
;Kinematics.c,107 :: 		DIR_StepX = CCW;
>>>>>>> patch2
=======
L__DualAxisStep107:
;Kinematics.c,106 :: 		DIR_StepX = CCW;
>>>>>>> patch2
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,107 :: 		DIR_StepX = CW;
=======
;Kinematics.c,109 :: 		DIR_StepX = CW;
>>>>>>> patch2
=======
;Kinematics.c,108 :: 		DIR_StepX = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,109 :: 		if(SV.diry < 0)
=======
;Kinematics.c,111 :: 		if(SV.diry < 0)
>>>>>>> patch2
=======
;Kinematics.c,110 :: 		if(SV.diry < 0)
>>>>>>> patch2
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep25
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__DualAxisStep137:
;Kinematics.c,110 :: 		DIR_StepY = CCW;
=======
=======
>>>>>>> patch2
L__DualAxisStep106:
;Kinematics.c,112 :: 		DIR_StepY = CCW;
>>>>>>> patch2
=======
L__DualAxisStep108:
;Kinematics.c,111 :: 		DIR_StepY = CCW;
>>>>>>> patch2
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,112 :: 		DIR_StepY = CW;
=======
;Kinematics.c,114 :: 		DIR_StepY = CW;
>>>>>>> patch2
=======
;Kinematics.c,113 :: 		DIR_StepY = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,114 :: 		SV.dx = abs(SV.dx);
=======
;Kinematics.c,116 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
=======
;Kinematics.c,115 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,115 :: 		SV.dy = abs(SV.dy);
=======
;Kinematics.c,117 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,116 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,117 :: 		if(SV.dx > SV.dy)
=======
;Kinematics.c,119 :: 		if(SV.dx > SV.dy)
>>>>>>> patch2
=======
;Kinematics.c,119 :: 		if(SV.dx > SV.dy){
>>>>>>> patch2
=======
;Kinematics.c,118 :: 		if(SV.dx > SV.dy){
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep27
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__DualAxisStep138:
;Kinematics.c,118 :: 		SV.d2 = 2*(SV.dy - SV.dx);
=======
=======
>>>>>>> patch2
L__DualAxisStep107:
;Kinematics.c,120 :: 		SV.d2 = 2*(SV.dy - SV.dx);
>>>>>>> patch2
=======
L__DualAxisStep109:
;Kinematics.c,119 :: 		SV.d2 = 2*(SV.dy - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,120 :: 		}
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,120 :: 		SV.d2 = 2* (SV.dx - SV.dy);
=======
;Kinematics.c,122 :: 		SV.d2 = 2* (SV.dx - SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,125 :: 		SV.d2 = 2* (SV.dx - SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,122 :: 		SV.d2 = 2* (SV.dx - SV.dy);
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,128 :: 		}
L_DualAxisStep28:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,122 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,123 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,124 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,126 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,127 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,128 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,129 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,130 :: 		Multi_Axis_Enable(axis_xyz);
=======
;Kinematics.c,124 :: 		STPS[X].step_count = 0;
=======
;Kinematics.c,130 :: 		STPS[X].step_count = 0;
>>>>>>> patch2
=======
;Kinematics.c,130 :: 		}
L_DualAxisStep30:
;Kinematics.c,132 :: 		STPS[X].step_count = 0;
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,135 :: 		case xz:
L_DualAxisStep29:
<<<<<<< HEAD
;Kinematics.c,130 :: 		AxisPulse[1] = &XZ_Interpolate;
=======
;Kinematics.c,136 :: 		AxisPulse[1] = &XZ_Interpolate;
>>>>>>> patch2
=======
;Kinematics.c,137 :: 		case xz:
L_DualAxisStep31:
;Kinematics.c,138 :: 		AxisPulse[1] = &XZ_Interpolate;
>>>>>>> patch2
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,139 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,132 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
=======
;Kinematics.c,138 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
=======
;Kinematics.c,140 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,132 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,133 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,136 :: 		SV.dirx = SV.dx > 0?1:-1;
=======
;Kinematics.c,134 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
=======
;Kinematics.c,140 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
>>>>>>> patch2
=======
;Kinematics.c,142 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
>>>>>>> patch2
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,143 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,138 :: 		SV.dirx = SV.dx > 0?1:-1;
>>>>>>> patch2
=======
;Kinematics.c,144 :: 		SV.dirx = SV.dx > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep108:
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T58 start address is: 12 (R3)
=======
; ?FLOC___DualAxisStep?T70 start address is: 12 (R3)
>>>>>>> patch2
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T70 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T70 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T70 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T70 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T70 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,137 :: 		SV.dirz = SV.dz > 0?1:-1;
=======
;Kinematics.c,139 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
=======
;Kinematics.c,145 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep109:
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T60 start address is: 12 (R3)
=======
; ?FLOC___DualAxisStep?T72 start address is: 12 (R3)
>>>>>>> patch2
=======
;Kinematics.c,146 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep111:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
>>>>>>> patch2
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
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T72 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,140 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
=======
;Kinematics.c,142 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
>>>>>>> patch2
=======
;Kinematics.c,148 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep110
=======
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,147 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep112
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,141 :: 		else DIR_StepX = CW;
=======
;Kinematics.c,143 :: 		else DIR_StepX = CW;
>>>>>>> patch2
=======
;Kinematics.c,149 :: 		else DIR_StepX = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,143 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
=======
;Kinematics.c,145 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
=======
;Kinematics.c,151 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+68)(GP)
=======
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
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,144 :: 		else DIR_StepZ = CW;
=======
;Kinematics.c,146 :: 		else DIR_StepZ = CW;
>>>>>>> patch2
=======
;Kinematics.c,152 :: 		else DIR_StepZ = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,146 :: 		SV.dx = abs(SV.dx);
=======
;Kinematics.c,148 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
=======
;Kinematics.c,154 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
=======
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
>>>>>>> patch2
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,147 :: 		SV.dz = abs(SV.dz);
=======
;Kinematics.c,149 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,155 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,157 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,149 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
=======
;Kinematics.c,151 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
>>>>>>> patch2
=======
;Kinematics.c,157 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
>>>>>>> patch2
=======
;Kinematics.c,159 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
>>>>>>> patch2
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
<<<<<<< HEAD
L_DualAxisStep38:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,150 :: 		else d2 = 2* (SV.dx - SV.dz);
=======
;Kinematics.c,152 :: 		else d2 = 2* (SV.dx - SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,158 :: 		else d2 = 2* (SV.dx - SV.dz);
>>>>>>> patch2
=======
L_DualAxisStep40:
;Kinematics.c,160 :: 		else d2 = 2* (SV.dx - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
<<<<<<< HEAD
L_DualAxisStep39:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,152 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,153 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,154 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,155 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,156 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,157 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,158 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,159 :: 		Multi_Axis_Enable(axis_xyz);
=======
;Kinematics.c,154 :: 		STPS[X].step_count = 0;
=======
;Kinematics.c,160 :: 		STPS[X].step_count = 0;
>>>>>>> patch2
=======
L_DualAxisStep41:
;Kinematics.c,162 :: 		STPS[X].step_count = 0;
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,164 :: 		case yz:
L_DualAxisStep40:
<<<<<<< HEAD
;Kinematics.c,159 :: 		AxisPulse[1] = &YZ_Interpolate;
=======
;Kinematics.c,165 :: 		AxisPulse[1] = &YZ_Interpolate;
>>>>>>> patch2
=======
;Kinematics.c,166 :: 		case yz:
L_DualAxisStep42:
;Kinematics.c,167 :: 		AxisPulse[1] = &YZ_Interpolate;
>>>>>>> patch2
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,168 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,161 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
=======
;Kinematics.c,167 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
=======
;Kinematics.c,169 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,162 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,163 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,166 :: 		SV.diry = SV.dy > 0?1:-1;
=======
;Kinematics.c,164 :: 		SV.dy   = newx - SV.pz;
=======
;Kinematics.c,170 :: 		SV.dy   = newx - SV.pz;
>>>>>>> patch2
=======
;Kinematics.c,172 :: 		SV.dy   = newx - SV.pz;
>>>>>>> patch2
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,173 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,168 :: 		SV.diry = SV.dy > 0?1:-1;
>>>>>>> patch2
=======
;Kinematics.c,174 :: 		SV.diry = SV.dy > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep113:
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T76 start address is: 12 (R3)
=======
; ?FLOC___DualAxisStep?T88 start address is: 12 (R3)
>>>>>>> patch2
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T88 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T88 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T88 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T88 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T88 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,167 :: 		SV.dirz = SV.dz > 0?1:-1;
=======
;Kinematics.c,169 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
=======
;Kinematics.c,175 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep114:
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T78 start address is: 12 (R3)
=======
; ?FLOC___DualAxisStep?T90 start address is: 12 (R3)
>>>>>>> patch2
=======
;Kinematics.c,176 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep116:
; ?FLOC___DualAxisStep?T89 start address is: 12 (R3)
>>>>>>> patch2
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
<<<<<<< HEAD
; ?FLOC___DualAxisStep?T90 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,170 :: 		if(SV.diry < 0)DIR_StepY = CCW;
=======
;Kinematics.c,172 :: 		if(SV.diry < 0)DIR_StepY = CCW;
>>>>>>> patch2
=======
;Kinematics.c,178 :: 		if(SV.diry < 0)DIR_StepY = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep115
=======
; ?FLOC___DualAxisStep?T89 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,177 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep117
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,171 :: 		else DIR_StepY = CW;
=======
;Kinematics.c,173 :: 		else DIR_StepY = CW;
>>>>>>> patch2
=======
;Kinematics.c,179 :: 		else DIR_StepY = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,172 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
=======
;Kinematics.c,174 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
=======
;Kinematics.c,180 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+68)(GP)
=======
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
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,173 :: 		else DIR_StepZ = CW;
=======
;Kinematics.c,175 :: 		else DIR_StepZ = CW;
>>>>>>> patch2
=======
;Kinematics.c,181 :: 		else DIR_StepZ = CW;
>>>>>>> patch2
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,175 :: 		SV.dy = abs(SV.dy);
=======
;Kinematics.c,177 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,183 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
=======
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
>>>>>>> patch2
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,176 :: 		SV.dz = abs(SV.dz);
=======
;Kinematics.c,178 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,184 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,186 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,178 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
=======
;Kinematics.c,180 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,186 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
>>>>>>> patch2
=======
;Kinematics.c,188 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
>>>>>>> patch2
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
<<<<<<< HEAD
L_DualAxisStep49:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,179 :: 		else d2 = 2* (SV.dy - SV.dz);
=======
;Kinematics.c,181 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
>>>>>>> patch2
=======
;Kinematics.c,187 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
>>>>>>> patch2
=======
L_DualAxisStep51:
;Kinematics.c,189 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
L_DualAxisStep50:
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,181 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,182 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,183 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,184 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,185 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,187 :: 		}
=======
;Kinematics.c,183 :: 		STPS[Y].step_count = 0;
=======
;Kinematics.c,189 :: 		STPS[Y].step_count = 0;
>>>>>>> patch2
=======
L_DualAxisStep52:
;Kinematics.c,191 :: 		STPS[Y].step_count = 0;
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,189 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,195 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,197 :: 		}
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,188 :: 		}
=======
;Kinematics.c,190 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,196 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,198 :: 		}
>>>>>>> patch2
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
<<<<<<< HEAD
<<<<<<< HEAD
_XY_Interpolate:
;Kinematics.c,193 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,195 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate156
NOP	
J	L__XY_Interpolate102
NOP	
L__XY_Interpolate156:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate157
NOP	
J	L__XY_Interpolate101
NOP	
L__XY_Interpolate157:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate102:
L__XY_Interpolate101:
;Kinematics.c,196 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,197 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,198 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,199 :: 		}
L_XY_Interpolate54:
;Kinematics.c,201 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate158
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate158:
;Kinematics.c,202 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,203 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate159
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate159:
;Kinematics.c,204 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,205 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,206 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,207 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,208 :: 		}
L_XY_Interpolate57:
;Kinematics.c,209 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,210 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,211 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate160
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate160:
;Kinematics.c,212 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,213 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,214 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,215 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,216 :: 		}
L_XY_Interpolate60:
;Kinematics.c,217 :: 		}
L_XY_Interpolate58:
;Kinematics.c,218 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,220 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,222 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate162
NOP	
J	L__XZ_Interpolate105
NOP	
L__XZ_Interpolate162:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate163
NOP	
J	L__XZ_Interpolate104
NOP	
L__XZ_Interpolate163:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate105:
L__XZ_Interpolate104:
;Kinematics.c,223 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,224 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,226 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,227 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,229 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate164
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate164:
;Kinematics.c,230 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,231 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate165
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate165:
;Kinematics.c,232 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,234 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,235 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,236 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,238 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,239 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,240 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate166
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate166:
;Kinematics.c,241 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,243 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,244 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,245 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,246 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,247 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,249 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,250 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate168
NOP	
J	L__YZ_Interpolate108
NOP	
L__YZ_Interpolate168:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate169
NOP	
J	L__YZ_Interpolate107
NOP	
L__YZ_Interpolate169:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate108:
L__YZ_Interpolate107:
;Kinematics.c,251 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,252 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,253 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,254 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,256 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate170
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate170:
;Kinematics.c,257 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,258 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate171
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate171:
;Kinematics.c,259 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,261 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,262 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,263 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,264 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,265 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,266 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate172
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate172:
;Kinematics.c,267 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,269 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,270 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,271 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,272 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,274 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_r_or_ijk:
;Kinematics.c,279 :: 		void r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k){
ADDIU	SP, SP, -76
=======
_r_or_ijk:
;Kinematics.c,209 :: 		void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,double r, double i, double j, double k, int axis_xyz){
ADDIU	SP, SP, -100
>>>>>>> patch2
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
<<<<<<< HEAD
; r start address is: 16 (R4)
LWC1	S2, 76(SP)
; i start address is: 0 (R0)
LWC1	S0, 80(SP)
; j start address is: 8 (R2)
LWC1	S1, 84(SP)
; k start address is: 24 (R6)
LWC1	S3, 88(SP)
; k end address is: 24 (R6)
;Kinematics.c,280 :: 		uint8_t char_counter = 0;
;Kinematics.c,285 :: 		uint16_t modal_group_words = 0;  // Bitflag variable to track and check modal group words in block
;Kinematics.c,286 :: 		uint8_t axis_words = 0;          // Bitflag to track which XYZ(ABC) parameters exist in block
;Kinematics.c,288 :: 		float inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,289 :: 		uint8_t absolute_override = false; // true(1) = absolute motion for this block only {G53}
;Kinematics.c,290 :: 		uint8_t non_modal_action = NON_MODAL_NONE; // Tracks the actions of modal group 0 (non-modal)
;Kinematics.c,293 :: 		float x = 0.00;
;Kinematics.c,294 :: 		float y = 0.00;
;Kinematics.c,295 :: 		float h_x2_div_d = 0.00;
;Kinematics.c,296 :: 		uint8_t isclockwise = 0;
;Kinematics.c,298 :: 		gc.position[X] = xCur;
SWC1	S12, Offset(_gc+12)(GP)
;Kinematics.c,299 :: 		gc.position[Y] = yCur;
SWC1	S13, Offset(_gc+16)(GP)
;Kinematics.c,300 :: 		target[X] = xFin;
ADDIU	R2, SP, 24
SWC1	S14, 0(R2)
;Kinematics.c,301 :: 		target[Y] = yFin;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,302 :: 		offset[X] = i;
ADDIU	R2, SP, 48
SWC1	S0, 0(R2)
; i end address is: 0 (R0)
;Kinematics.c,303 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S1, 0(R2)
; j end address is: 8 (R2)
;Kinematics.c,304 :: 		gc.plane_axis_0 = X;
SB	R0, Offset(_gc+25)(GP)
;Kinematics.c,305 :: 		gc.plane_axis_1 = Y;
ORI	R2, R0, 1
SB	R2, Offset(_gc+26)(GP)
;Kinematics.c,306 :: 		gc.plane_axis_2 = Z;
ORI	R2, R0, 2
SB	R2, Offset(_gc+27)(GP)
;Kinematics.c,307 :: 		if (r != 0) { // Arc Radius Mode
=======
; r start address is: 32 (R8)
LWC1	S4, 100(SP)
; i start address is: 8 (R2)
LWC1	S1, 104(SP)
; j start address is: 16 (R4)
LWC1	S2, 108(SP)
; k start address is: 0 (R0)
LWC1	S0, 112(SP)
; k end address is: 0 (R0)
;Kinematics.c,210 :: 		unsigned short isclockwise = 0;
;Kinematics.c,211 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,215 :: 		double x = 0.00;
;Kinematics.c,216 :: 		double y = 0.00;
; y start address is: 24 (R6)
MTC1	R0, S3
;Kinematics.c,217 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,221 :: 		position[X] = Cur_axis_a;
ADDIU	R2, SP, 20
SWC1	S12, 0(R2)
;Kinematics.c,222 :: 		position[Y] = Cur_axis_b;
ADDIU	R2, R2, 4
SWC1	S13, 0(R2)
;Kinematics.c,223 :: 		target[X] = Fin_axis_a;
ADDIU	R2, SP, 44
SWC1	S14, 0(R2)
;Kinematics.c,224 :: 		target[Y] = Fin_axis_b;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,225 :: 		offset[X] = i;
ADDIU	R2, SP, 68
SWC1	S1, 0(R2)
;Kinematics.c,226 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S2, 0(R2)
;Kinematics.c,227 :: 		if(axis_xyz == xy){
SEH	R2, R25
BEQ	R2, R0, L__r_or_ijk125
NOP	
J	L_r_or_ijk52
NOP	
L__r_or_ijk125:
; y end address is: 24 (R6)
;Kinematics.c,228 :: 		axis_plane_a = X;
SH	R0, 92(SP)
;Kinematics.c,229 :: 		axis_plane_b = Y;
ORI	R2, R0, 1
SH	R2, 94(SP)
;Kinematics.c,230 :: 		}else if(axis_xyz == xz){
J	L_r_or_ijk53
NOP	
L_r_or_ijk52:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__r_or_ijk126
NOP	
J	L_r_or_ijk54
NOP	
L__r_or_ijk126:
; y end address is: 24 (R6)
;Kinematics.c,231 :: 		axis_plane_a = X;
SH	R0, 92(SP)
;Kinematics.c,232 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 94(SP)
;Kinematics.c,233 :: 		}else if(axis_xyz == yz){
J	L_r_or_ijk55
NOP	
=======
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
>>>>>>> patch2
L_r_or_ijk54:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__r_or_ijk129
NOP	
J	L_r_or_ijk56
NOP	
<<<<<<< HEAD
L__r_or_ijk127:
<<<<<<< HEAD
;Kinematics.c,234 :: 		axis_plane_a = y;
=======
;Kinematics.c,240 :: 		axis_plane_a = y;
>>>>>>> patch2
=======
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
>>>>>>> patch2
MOV.S 	S0, S3
; y end address is: 24 (R6)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 92(SP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,235 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 94(SP)
;Kinematics.c,236 :: 		}
L_r_or_ijk56:
L_r_or_ijk55:
L_r_or_ijk53:
;Kinematics.c,238 :: 		if (r != 0) { // Arc Radius Mode
>>>>>>> patch2
=======
;Kinematics.c,241 :: 		axis_plane_b = Z;
=======
;Kinematics.c,243 :: 		axis_plane_b = Z;
>>>>>>> patch2
ORI	R2, R0, 2
SH	R2, 94(SP)
;Kinematics.c,244 :: 		}
L_r_or_ijk58:
L_r_or_ijk57:
L_r_or_ijk55:
<<<<<<< HEAD
L_r_or_ijk53:
;Kinematics.c,244 :: 		if (r != 0) { // Arc Radius Mode
>>>>>>> patch2
=======
;Kinematics.c,246 :: 		if (r != 0) { // Arc Radius Mode
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S4, S0
BC1F	0, L__r_or_ijk131
NOP	
J	L_r_or_ijk59
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__r_or_ijk174:
;Kinematics.c,359 :: 		x = target[gc.plane_axis_0]-gc.position[gc.plane_axis_0];
ADDIU	R4, SP, 24
LBU	R2, Offset(_gc+25)(GP)
=======
L__r_or_ijk128:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,302 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 44
LHU	R2, 92(SP)
>>>>>>> patch2
=======
L__r_or_ijk128:
=======
L__r_or_ijk131:
>>>>>>> patch2
; i end address is: 8 (R2)
; j end address is: 16 (R4)
;Kinematics.c,310 :: 		x = target[axis_plane_a] - position[axis_plane_a];
ADDIU	R5, SP, 44
LHU	R2, 92(SP)
>>>>>>> patch2
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 20
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
<<<<<<< HEAD
<<<<<<< HEAD
SUB.S 	S0, S1, S0
; x start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,360 :: 		y = target[gc.plane_axis_1]-gc.position[gc.plane_axis_1];
LBU	R2, Offset(_gc+26)(GP)
=======
SUB.S 	S3, S1, S0
; x start address is: 40 (R10)
MOV.S 	S5, S3
;Kinematics.c,304 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 94(SP)
>>>>>>> patch2
=======
SUB.S 	S3, S1, S0
; x start address is: 40 (R10)
MOV.S 	S5, S3
;Kinematics.c,312 :: 		y = target[axis_plane_b] - position[axis_plane_b];
LHU	R2, 94(SP)
>>>>>>> patch2
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
<<<<<<< HEAD
<<<<<<< HEAD
SUB.S 	S0, S1, S0
; y start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,362 :: 		clear_vector(offset);
ADDIU	R2, SP, 48
ORI	R27, R0, 24
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Kinematics.c,365 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
=======
SUB.S 	S2, S1, S0
; y start address is: 48 (R12)
MOV.S 	S6, S2
;Kinematics.c,308 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
>>>>>>> patch2
=======
SUB.S 	S2, S1, S0
; y start address is: 48 (R12)
MOV.S 	S6, S2
<<<<<<< HEAD
;Kinematics.c,314 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
>>>>>>> patch2
=======
;Kinematics.c,316 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
>>>>>>> patch2
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S4
MUL.S 	S1, S0, S4
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,368 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SWC1	S2, 20(SP)
=======
;Kinematics.c,311 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
>>>>>>> patch2
=======
;Kinematics.c,317 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
>>>>>>> patch2
=======
;Kinematics.c,319 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,370 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
=======
;Kinematics.c,313 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
>>>>>>> patch2
=======
;Kinematics.c,319 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
>>>>>>> patch2
=======
;Kinematics.c,321 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__r_or_ijk112:
MOV.S 	S5, S1
L_r_or_ijk80:
;Kinematics.c,393 :: 		if (r < 0) {
; h_x2_div_d start address is: 40 (R10)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S2
BC1F	0, L__r_or_ijk176
NOP	
J	L__r_or_ijk113
NOP	
L__r_or_ijk176:
;Kinematics.c,394 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
; h_x2_div_d end address is: 40 (R10)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,395 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
MOV.S 	S2, S0
; h_x2_div_d end address is: 8 (R2)
; r end address is: 16 (R4)
MOV.S 	S5, S1
;Kinematics.c,396 :: 		}
J	L_r_or_ijk81
NOP	
L__r_or_ijk113:
;Kinematics.c,393 :: 		if (r < 0) {
;Kinematics.c,396 :: 		}
L_r_or_ijk81:
;Kinematics.c,398 :: 		offset[gc.plane_axis_0] = 0.5*(x-(y*h_x2_div_d));
=======
L__r_or_ijk81:
L_r_or_ijk58:
;Kinematics.c,336 :: 		if (r < 0) {
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S4
BC1F	0, L__r_or_ijk130
NOP	
J	L__r_or_ijk82
NOP	
L__r_or_ijk130:
;Kinematics.c,337 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,338 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
; r end address is: 32 (R8)
>>>>>>> patch2
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
;Kinematics.c,339 :: 		}
J	L_r_or_ijk59
NOP	
L__r_or_ijk82:
;Kinematics.c,336 :: 		if (r < 0) {
MOV.S 	S2, S4
MOV.S 	S3, S1
;Kinematics.c,339 :: 		}
L_r_or_ijk59:
;Kinematics.c,342 :: 		i =  0.5*(x-(y*h_x2_div_d));
=======
L__r_or_ijk81:
L_r_or_ijk58:
;Kinematics.c,342 :: 		if (r < 0) {
=======
L__r_or_ijk83:
L_r_or_ijk60:
;Kinematics.c,344 :: 		if (r < 0) {
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,345 :: 		}
L_r_or_ijk59:
;Kinematics.c,348 :: 		i =  0.5*(x-(y*h_x2_div_d));
>>>>>>> patch2
=======
;Kinematics.c,347 :: 		}
L_r_or_ijk61:
;Kinematics.c,350 :: 		i =  0.5*(x-(y*h_x2_div_d));
>>>>>>> patch2
; r start address is: 16 (R4)
; h_x2_div_d start address is: 24 (R6)
MUL.S 	S0, S6, S3
SUB.S 	S1, S5, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 0(R3)
;Kinematics.c,399 :: 		offset[gc.plane_axis_1] = 0.5*(y+(x*h_x2_div_d));
LBU	R2, Offset(_gc+26)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
MUL.S 	S0, S3, S5
; x end address is: 24 (R6)
; h_x2_div_d end address is: 40 (R10)
ADD.S 	S1, S4, S0
; y end address is: 32 (R8)
=======
; i start address is: 0 (R0)
; i end address is: 0 (R0)
;Kinematics.c,344 :: 		j =  0.5*(y+(x*h_x2_div_d));
=======
; i start address is: 0 (R0)
; i end address is: 0 (R0)
<<<<<<< HEAD
;Kinematics.c,350 :: 		j =  0.5*(y+(x*h_x2_div_d));
>>>>>>> patch2
=======
;Kinematics.c,352 :: 		j =  0.5*(y+(x*h_x2_div_d));
>>>>>>> patch2
MUL.S 	S0, S5, S3
; x end address is: 40 (R10)
; h_x2_div_d end address is: 24 (R6)
ADD.S 	S1, S6, S0
; y end address is: 48 (R12)
<<<<<<< HEAD
>>>>>>> patch2
=======
>>>>>>> patch2
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 0(R3)
;Kinematics.c,401 :: 		} else {
=======
; j start address is: 0 (R0)
; j end address is: 0 (R0)
;Kinematics.c,345 :: 		} else {
>>>>>>> patch2
=======
; j start address is: 0 (R0)
; j end address is: 0 (R0)
<<<<<<< HEAD
;Kinematics.c,351 :: 		} else {
>>>>>>> patch2
=======
;Kinematics.c,353 :: 		} else {
>>>>>>> patch2
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk62
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_r_or_ijk79:
;Kinematics.c,404 :: 		r = hypot(offset[X], offset[Y]); // Compute arc radius for mc_arc
ADDIU	R3, SP, 48
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
MOV.S 	S13, S1
MOV.S 	S12, S0
=======
L_r_or_ijk57:
;Kinematics.c,348 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
=======
L_r_or_ijk57:
;Kinematics.c,354 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
>>>>>>> patch2
=======
L_r_or_ijk59:
;Kinematics.c,356 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
>>>>>>> patch2
; j start address is: 16 (R4)
; i start address is: 8 (R2)
MOV.S 	S13, S2
; j end address is: 16 (R4)
MOV.S 	S12, S1
; i end address is: 8 (R2)
<<<<<<< HEAD
>>>>>>> patch2
=======
>>>>>>> patch2
JAL	_hypot+0
NOP	
; r start address is: 8 (R2)
MOV.S 	S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,405 :: 		SerialPrint(r);
SWC1	S1, 20(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
=======
>>>>>>> patch2
; r end address is: 8 (R2)
MOV.S 	S0, S1
<<<<<<< HEAD
;Kinematics.c,406 :: 		}
L_r_or_ijk82:
;Kinematics.c,409 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 20 (R5)
MOVZ	R5, R0, R0
;Kinematics.c,410 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
=======
;Kinematics.c,349 :: 		}
L_r_or_ijk60:
;Kinematics.c,352 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,353 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
>>>>>>> patch2
=======
; r end address is: 8 (R2)
MOV.S 	S0, S1
;Kinematics.c,357 :: 		}
L_r_or_ijk62:
;Kinematics.c,360 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
<<<<<<< HEAD
;Kinematics.c,359 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
>>>>>>> patch2
=======
;Kinematics.c,361 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__r_or_ijk114:
L_r_or_ijk83:
;Kinematics.c,413 :: 		gc.inverse_feed_rate_mode = 1; //??
; isclockwise start address is: 20 (R5)
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
;Kinematics.c,414 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,415 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,416 :: 		r, isclockwise);
MOV.S 	S13, S0
; r end address is: 0 (R0)
;Kinematics.c,415 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,414 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R4, R0
MOVZ	R26, R3, R0
LUI	R25, hi_addr(_gc+12)
ORI	R25, R25, lo_addr(_gc+12)
;Kinematics.c,416 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R5, 3(SP)
; isclockwise end address is: 20 (R5)
;Kinematics.c,415 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
ORI	R2, R0, 1
SB	R2, 2(SP)
;Kinematics.c,414 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
=======
L__r_or_ijk83:
L_r_or_ijk61:
;Kinematics.c,356 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
=======
L__r_or_ijk83:
L_r_or_ijk61:
;Kinematics.c,362 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
=======
L__r_or_ijk85:
L_r_or_ijk63:
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
; isclockwise start address is: 24 (R6)
ADDIU	R5, SP, 68
ADDIU	R4, SP, 44
ADDIU	R3, SP, 20
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,357 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,358 :: 		r, isclockwise);
MOV.S 	S13, S0
; r end address is: 0 (R0)
;Kinematics.c,357 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,356 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
=======
;Kinematics.c,363 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
=======
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
>>>>>>> patch2
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,366 :: 		r, isclockwise);
MOV.S 	S13, S0
; r end address is: 0 (R0)
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
<<<<<<< HEAD
;Kinematics.c,362 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
=======
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,358 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
;Kinematics.c,357 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,356 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
=======
;Kinematics.c,364 :: 		r, isclockwise);
=======
;Kinematics.c,366 :: 		r, isclockwise);
>>>>>>> patch2
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
;Kinematics.c,365 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
<<<<<<< HEAD
;Kinematics.c,362 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
=======
;Kinematics.c,364 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,416 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,417 :: 		}
=======
;Kinematics.c,358 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,359 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,364 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,365 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,366 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,367 :: 		}
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,422 :: 		uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise){
=======
;Kinematics.c,364 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
>>>>>>> patch2
ADDIU	SP, SP, -84
SW	RA, 0(SP)
LBU	R2, 84(SP)
SB	R2, 84(SP)
LBU	R2, 85(SP)
SB	R2, 85(SP)
<<<<<<< HEAD
; invert_feed_rate start address is: 48 (R12)
LBU	R12, 86(SP)
; isclockwise start address is: 16 (R4)
LBU	R4, 87(SP)
;Kinematics.c,424 :: 		float center_axis0             = position[X] + offset[X];
LWC1	S6, 0(R25)
LWC1	S5, 0(R27)
ADD.S 	S4, S6, S5
SWC1	S4, 24(SP)
;Kinematics.c,425 :: 		float center_axis1             = position[Y] + offset[Y];
=======
; invert_feed_rate start address is: 16 (R4)
LBU	R4, 86(SP)
; isclockwise start address is: 20 (R5)
LBU	R5, 87(SP)
;Kinematics.c,366 :: 		double center_axis0            = position[X] + offset[X];
=======
;Kinematics.c,370 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
=======
;Kinematics.c,372 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,372 :: 		double center_axis0            = position[X] + offset[X];
>>>>>>> patch2
=======
;Kinematics.c,374 :: 		double center_axis0            = position[X] + offset[X];
>>>>>>> patch2
LWC1	S6, 0(R25)
LWC1	S5, 0(R27)
ADD.S 	S4, S6, S5
SWC1	S4, 20(SP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,367 :: 		double center_axis1             = position[Y] + offset[Y];
>>>>>>> patch2
=======
;Kinematics.c,373 :: 		double center_axis1             = position[Y] + offset[Y];
>>>>>>> patch2
=======
;Kinematics.c,375 :: 		double center_axis1             = position[Y] + offset[Y];
>>>>>>> patch2
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R27, 4
LWC1	S0, 0(R2)
ADD.S 	S3, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S3, 28(SP)
;Kinematics.c,426 :: 		float linear_travel            = target[X] - position[X];
=======
SWC1	S3, 24(SP)
;Kinematics.c,368 :: 		double linear_travel           = target[X] - position[X];
>>>>>>> patch2
=======
SWC1	S3, 24(SP)
<<<<<<< HEAD
;Kinematics.c,374 :: 		double linear_travel           = target[X] - position[X];
>>>>>>> patch2
=======
;Kinematics.c,376 :: 		double linear_travel           = target[X] - position[X];
>>>>>>> patch2
LWC1	S2, 0(R26)
SUB.S 	S0, S2, S6
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,427 :: 		float r_axis0                  = -offset[X];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 32(SP)
;Kinematics.c,428 :: 		float r_axis1                  = -offset[Y];
=======
;Kinematics.c,369 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
=======
;Kinematics.c,375 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
>>>>>>> patch2
=======
;Kinematics.c,377 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,370 :: 		double r_axis1                 = -offset[Y];
>>>>>>> patch2
=======
;Kinematics.c,376 :: 		double r_axis1                 = -offset[Y];
>>>>>>> patch2
=======
;Kinematics.c,378 :: 		double r_axis1                 = -offset[Y];
>>>>>>> patch2
ADDIU	R2, R27, 4
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 36(SP)
;Kinematics.c,429 :: 		float rt_axis0                 = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,430 :: 		float rt_axis1                 = target[Y] - center_axis1;
=======
SWC1	S0, 32(SP)
;Kinematics.c,371 :: 		double rt_axis0                = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,372 :: 		double rt_axis1                 = target[Y] - center_axis1;
>>>>>>> patch2
=======
SWC1	S0, 32(SP)
;Kinematics.c,379 :: 		double rt_axis0                = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
<<<<<<< HEAD
;Kinematics.c,378 :: 		double rt_axis1                 = target[Y] - center_axis1;
>>>>>>> patch2
=======
;Kinematics.c,380 :: 		double rt_axis1                 = target[Y] - center_axis1;
>>>>>>> patch2
ADDIU	R2, R26, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,431 :: 		float theta_per_segment        = 0.00;
;Kinematics.c,432 :: 		float linear_per_segment       = 0.00;
;Kinematics.c,433 :: 		float millimeters_of_travel    = 0.00;
;Kinematics.c,434 :: 		uint16_t segments              = 0;
;Kinematics.c,435 :: 		float cos_T = 0.00;
;Kinematics.c,436 :: 		float sin_T = 0.00;
;Kinematics.c,443 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 60(SP)
;Kinematics.c,446 :: 		float angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 32(SP)
=======
;Kinematics.c,373 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,374 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,375 :: 		double angular_travel          = 0.00;
;Kinematics.c,376 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,377 :: 		uint16_t segments              = 0;
;Kinematics.c,378 :: 		double cos_T                   = 0.00;
;Kinematics.c,379 :: 		double sin_T                   = 0.00;
;Kinematics.c,386 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 56(SP)
;Kinematics.c,391 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 28(SP)
>>>>>>> patch2
=======
;Kinematics.c,379 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,380 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,381 :: 		double angular_travel          = 0.00;
;Kinematics.c,382 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,383 :: 		uint16_t segments              = 0;
;Kinematics.c,384 :: 		double cos_T                   = 0.00;
;Kinematics.c,385 :: 		double sin_T                   = 0.00;
;Kinematics.c,392 :: 		int8_t count = 0;
=======
;Kinematics.c,381 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,382 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,383 :: 		double angular_travel          = 0.00;
;Kinematics.c,384 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,385 :: 		uint16_t segments              = 0;
;Kinematics.c,386 :: 		double cos_T                   = 0.00;
;Kinematics.c,387 :: 		double sin_T                   = 0.00;
;Kinematics.c,394 :: 		int8_t count = 0;
>>>>>>> patch2
MOVZ	R30, R0, R0
SB	R30, 60(SP)
;Kinematics.c,399 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 28(SP)
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 56(SP)
;Kinematics.c,447 :: 		if (isclockwise) { // Correct atan2 output per direction
BNE	R4, R0, L__mc_arc180
=======
SWC1	S0, 68(SP)
;Kinematics.c,393 :: 		if (isclockwise) {
BNE	R5, R0, L__mc_arc134
>>>>>>> patch2
NOP	
J	L_mc_arc62
NOP	
<<<<<<< HEAD
L__mc_arc180:
; isclockwise end address is: 16 (R4)
;Kinematics.c,448 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 56(SP)
=======
L__mc_arc134:
; isclockwise end address is: 20 (R5)
;Kinematics.c,395 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 68(SP)
>>>>>>> patch2
=======
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
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc138
NOP	
J	L_mc_arc65
NOP	
<<<<<<< HEAD
L__mc_arc135:
<<<<<<< HEAD
LWC1	S1, 68(SP)
=======
=======
L__mc_arc138:
>>>>>>> patch2
LWC1	S1, 72(SP)
>>>>>>> patch2
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 56(SP)
L_mc_arc85:
;Kinematics.c,449 :: 		} else {
J	L_mc_arc86
NOP	
L_mc_arc84:
;Kinematics.c,450 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 56(SP)
=======
SWC1	S0, 68(SP)
L_mc_arc63:
;Kinematics.c,396 :: 		} else {
J	L_mc_arc64
NOP	
L_mc_arc62:
;Kinematics.c,397 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 68(SP)
>>>>>>> patch2
=======
SWC1	S0, 72(SP)
L_mc_arc65:
;Kinematics.c,404 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc64:
;Kinematics.c,405 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 72(SP)
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc139
NOP	
J	L_mc_arc67
NOP	
<<<<<<< HEAD
L__mc_arc136:
<<<<<<< HEAD
LWC1	S1, 68(SP)
=======
=======
L__mc_arc139:
>>>>>>> patch2
LWC1	S1, 72(SP)
>>>>>>> patch2
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S0, 56(SP)
L_mc_arc87:
;Kinematics.c,451 :: 		}
L_mc_arc86:
;Kinematics.c,452 :: 		SerialPrint(angular_travel);
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
LWC1	S12, 56(SP)
JAL	_SerialPrint+0
NOP	
;Kinematics.c,453 :: 		SerialPrint(linear_travel);
MOV.S 	S12, S6
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,454 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
=======
SWC1	S0, 68(SP)
L_mc_arc65:
;Kinematics.c,398 :: 		}
L_mc_arc64:
;Kinematics.c,401 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
>>>>>>> patch2
=======
SWC1	S0, 72(SP)
<<<<<<< HEAD
L_mc_arc65:
;Kinematics.c,404 :: 		}
L_mc_arc64:
;Kinematics.c,407 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
>>>>>>> patch2
=======
L_mc_arc67:
;Kinematics.c,406 :: 		}
L_mc_arc66:
;Kinematics.c,409 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
>>>>>>> patch2
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
<<<<<<< HEAD
LWC1	S1, 68(SP)
=======
LWC1	S1, 72(SP)
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,455 :: 		if (millimeters_of_travel == 0.0) { return; }
=======
;Kinematics.c,402 :: 		if (millimeters_of_travel == 0.0) { return; }
>>>>>>> patch2
=======
;Kinematics.c,408 :: 		if (millimeters_of_travel == 0.0) { return; }
>>>>>>> patch2
=======
;Kinematics.c,410 :: 		if (millimeters_of_travel == 0.0) { return; }
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_mc_arc88:
;Kinematics.c,456 :: 		SerialPrint(millimeters_of_travel);
; millimeters_of_travel start address is: 16 (R4)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 48 (R12)
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S2
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,457 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
=======
L_mc_arc66:
;Kinematics.c,404 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; millimeters_of_travel start address is: 16 (R4)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 16 (R4)
>>>>>>> patch2
=======
L_mc_arc66:
;Kinematics.c,410 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
=======
L_mc_arc68:
;Kinematics.c,412 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
>>>>>>> patch2
; millimeters_of_travel start address is: 16 (R4)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 16 (R4)
>>>>>>> patch2
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
<<<<<<< HEAD
SH	R2, 72(SP)
<<<<<<< HEAD
;Kinematics.c,458 :: 		SerialPrint(segments);
ANDI	R2, R2, 65535
MTC1	R2, S0
CVT32.W 	S0, S0
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,462 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R12, R0, L__mc_arc185
=======
;Kinematics.c,409 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R4, R0, L__mc_arc139
NOP	
J	L_mc_arc67
>>>>>>> patch2
NOP	
L__mc_arc139:
; invert_feed_rate end address is: 16 (R4)
LHU	R2, 72(SP)
=======
SH	R2, 76(SP)
;Kinematics.c,417 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R4, R0, L__mc_arc142
NOP	
J	L_mc_arc69
NOP	
L__mc_arc142:
; invert_feed_rate end address is: 16 (R4)
LHU	R2, 76(SP)
>>>>>>> patch2
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_mc_arc89:
;Kinematics.c,463 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 56(SP)
=======
L_mc_arc67:
;Kinematics.c,410 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 68(SP)
>>>>>>> patch2
=======
L_mc_arc67:
;Kinematics.c,416 :: 		angular_travel = angular_travel * rad2deg;
=======
L_mc_arc69:
;Kinematics.c,418 :: 		angular_travel = angular_travel * rad2deg;
>>>>>>> patch2
LWC1	S1, 72(SP)
>>>>>>> patch2
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,464 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,465 :: 		SerialPrint(theta_per_segment);
SW	R27, 4(SP)
SW	R25, 8(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,466 :: 		linear_per_segment = linear_travel/segments;
=======
;Kinematics.c,411 :: 		theta_per_segment = angular_travel/segments;
>>>>>>> patch2
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 60(SP)
;Kinematics.c,415 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
<<<<<<< HEAD
SWC1	S0, 68(SP)
;Kinematics.c,467 :: 		SerialPrint(linear_per_segment);
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,493 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LWC1	S1, 64(SP)
=======
SWC1	S0, 64(SP)
;Kinematics.c,442 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
>>>>>>> patch2
=======
;Kinematics.c,417 :: 		theta_per_segment = angular_travel/segments;
=======
;Kinematics.c,419 :: 		theta_per_segment = angular_travel/segments;
>>>>>>> patch2
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 64(SP)
;Kinematics.c,423 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 68(SP)
<<<<<<< HEAD
;Kinematics.c,448 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
>>>>>>> patch2
=======
;Kinematics.c,450 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
>>>>>>> patch2
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
<<<<<<< HEAD
SWC1	S0, 76(SP)
<<<<<<< HEAD
;Kinematics.c,494 :: 		SerialPrint(cos_T);
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,495 :: 		sin_T = theta_per_segment;
LWC1	S0, 64(SP)
SWC1	S0, 80(SP)
;Kinematics.c,496 :: 		SerialPrint(sin_T);
LWC1	S12, 64(SP)
JAL	_SerialPrint+0
NOP	
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,498 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 40
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,499 :: 		nPy = arc_target[Y] = position[Y];
=======
;Kinematics.c,443 :: 		sin_T = theta_per_segment;
SWC1	S2, 80(SP)
;Kinematics.c,445 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,446 :: 		nPy = arc_target[Y] = position[Y];
>>>>>>> patch2
=======
SWC1	S0, 80(SP)
;Kinematics.c,451 :: 		sin_T = theta_per_segment;
SWC1	S2, 84(SP)
;Kinematics.c,453 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,452 :: 		nPy = arc_target[Y] = position[Y];
>>>>>>> patch2
=======
;Kinematics.c,454 :: 		nPy = arc_target[Y] = position[Y];
>>>>>>> patch2
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,500 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
=======
;Kinematics.c,447 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
>>>>>>> patch2
ORI	R2, R0, 1
SH	R2, 48(SP)
L_mc_arc68:
LHU	R3, 72(SP)
LHU	R2, 48(SP)
=======
;Kinematics.c,453 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
=======
;Kinematics.c,455 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
>>>>>>> patch2
ORI	R2, R0, 1
SH	R2, 52(SP)
L_mc_arc70:
LHU	R3, 76(SP)
LHU	R2, 52(SP)
>>>>>>> patch2
SLTU	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__mc_arc140
NOP	
J	L_mc_arc69
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
L__mc_arc186:
;Kinematics.c,501 :: 		SerialPrint((float)i);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
SW	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,502 :: 		if (count < settings.n_arc_correction) {
=======
L__mc_arc140:
;Kinematics.c,448 :: 		if (count < settings.n_arc_correction) {
>>>>>>> patch2
LBU	R3, Offset(_settings+62)(GP)
LB	R2, 56(SP)
=======
L__mc_arc140:
;Kinematics.c,454 :: 		if (count < settings.n_arc_correction) {
LBU	R3, Offset(_settings+62)(GP)
LB	R2, 60(SP)
>>>>>>> patch2
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc141
NOP	
J	L_mc_arc71
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
L__mc_arc187:
;Kinematics.c,504 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
=======
L__mc_arc141:
;Kinematics.c,450 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
>>>>>>> patch2
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 76(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
<<<<<<< HEAD
;Kinematics.c,505 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
=======
;Kinematics.c,451 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
>>>>>>> patch2
LWC1	S1, 76(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
<<<<<<< HEAD
SWC1	S0, 32(SP)
;Kinematics.c,506 :: 		r_axis1 = r_axisi;
SWC1	S3, 36(SP)
;Kinematics.c,507 :: 		count++;
LB	R2, 60(SP)
ADDIU	R2, R2, 1
SB	R2, 60(SP)
;Kinematics.c,508 :: 		} else {
J	L_mc_arc94
NOP	
L_mc_arc93:
;Kinematics.c,511 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 52(SP)
=======
SWC1	S0, 28(SP)
;Kinematics.c,452 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,453 :: 		count++;
LB	R2, 56(SP)
ADDIU	R2, R2, 1
SB	R2, 56(SP)
;Kinematics.c,454 :: 		} else {
J	L_mc_arc72
NOP	
L_mc_arc71:
;Kinematics.c,457 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 48(SP)
>>>>>>> patch2
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
=======
L__mc_arc141:
;Kinematics.c,456 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
=======
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
>>>>>>> patch2
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
>>>>>>> patch2
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
<<<<<<< HEAD
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
<<<<<<< HEAD
;Kinematics.c,512 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
=======
;Kinematics.c,458 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 48(SP)
>>>>>>> patch2
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
=======
SWC1	S0, 48(SP)
;Kinematics.c,466 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
>>>>>>> patch2
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,513 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
=======
;Kinematics.c,459 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
>>>>>>> patch2
=======
;Kinematics.c,465 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
>>>>>>> patch2
=======
;Kinematics.c,467 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
>>>>>>> patch2
ANDI	R2, R28, 255
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
<<<<<<< HEAD
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LBU	R2, 84(SP)
=======
SUB.S 	S2, S1, S4
LWC1	S1, 48(SP)
MUL.S 	S3, S2, S1
LBU	R2, 88(SP)
>>>>>>> patch2
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
<<<<<<< HEAD
<<<<<<< HEAD
SWC1	S1, 32(SP)
;Kinematics.c,514 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
=======
SWC1	S1, 28(SP)
;Kinematics.c,460 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
>>>>>>> patch2
=======
SWC1	S1, 28(SP)
<<<<<<< HEAD
;Kinematics.c,466 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
>>>>>>> patch2
=======
;Kinematics.c,468 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
<<<<<<< HEAD
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
<<<<<<< HEAD
SWC1	S0, 36(SP)
;Kinematics.c,515 :: 		count = 0;
SB	R0, 60(SP)
;Kinematics.c,516 :: 		}
L_mc_arc94:
;Kinematics.c,519 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 40
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,520 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,521 :: 		arc_target[axis_linear] += linear_per_segment;
=======
SWC1	S0, 32(SP)
;Kinematics.c,461 :: 		count = 0;
SB	R0, 56(SP)
;Kinematics.c,462 :: 		}
L_mc_arc72:
;Kinematics.c,465 :: 		arc_target[X] = center_axis0 + r_axis0;
=======
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,469 :: 		count = 0;
SB	R0, 60(SP)
<<<<<<< HEAD
;Kinematics.c,468 :: 		}
L_mc_arc72:
;Kinematics.c,471 :: 		arc_target[X] = center_axis0 + r_axis0;
>>>>>>> patch2
=======
;Kinematics.c,470 :: 		}
L_mc_arc74:
;Kinematics.c,473 :: 		arc_target[X] = center_axis0 + r_axis0;
>>>>>>> patch2
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,466 :: 		arc_target[Y] = center_axis1 + r_axis1;
=======
;Kinematics.c,472 :: 		arc_target[Y] = center_axis1 + r_axis1;
>>>>>>> patch2
=======
;Kinematics.c,474 :: 		arc_target[Y] = center_axis1 + r_axis1;
>>>>>>> patch2
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,467 :: 		arc_target[axis_linear] += linear_per_segment;
>>>>>>> patch2
LBU	R2, 85(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,522 :: 		nPx =  arc_target[X] - position[X];
=======
;Kinematics.c,468 :: 		nPx =  arc_target[X] - position[X];
>>>>>>> patch2
=======
;Kinematics.c,473 :: 		arc_target[axis_linear] += linear_per_segment;
=======
;Kinematics.c,475 :: 		arc_target[axis_linear] += linear_per_segment;
>>>>>>> patch2
LBU	R2, 89(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,474 :: 		nPx =  arc_target[X] - position[X];
>>>>>>> patch2
=======
;Kinematics.c,476 :: 		nPx =  arc_target[X] - position[X];
>>>>>>> patch2
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,523 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,524 :: 		nPy =  arc_target[Y] - position[Y];
=======
;Kinematics.c,469 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,470 :: 		nPy =  arc_target[Y] - position[Y];
>>>>>>> patch2
=======
;Kinematics.c,475 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,476 :: 		nPy =  arc_target[Y] - position[Y];
>>>>>>> patch2
=======
;Kinematics.c,477 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,478 :: 		nPy =  arc_target[Y] - position[Y];
>>>>>>> patch2
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
<<<<<<< HEAD
<<<<<<< HEAD
; nPy start address is: 128 (R32)
MOV.S 	S16, S0
;Kinematics.c,525 :: 		position[Y] = arc_target[Y];
=======
SWC1	S0, 52(SP)
;Kinematics.c,471 :: 		position[Y] = arc_target[Y];
>>>>>>> patch2
=======
SWC1	S0, 56(SP)
<<<<<<< HEAD
;Kinematics.c,477 :: 		position[Y] = arc_target[Y];
>>>>>>> patch2
=======
;Kinematics.c,479 :: 		position[Y] = arc_target[Y];
>>>>>>> patch2
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,526 :: 		SerialPrint(nPx);
SW	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
MOV.S 	S12, S2
JAL	_SerialPrint+0
NOP	
;Kinematics.c,527 :: 		SerialPrint(nPy);
MOV.S 	S12, S16
JAL	_SerialPrint+0
NOP	
=======
>>>>>>> patch2
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
<<<<<<< HEAD
;Kinematics.c,528 :: 		while(1){
L_mc_arc95:
;Kinematics.c,529 :: 		if(!OC5IE_bit && !OC2IE_bit)
=======
;Kinematics.c,472 :: 		while(1){
L_mc_arc73:
;Kinematics.c,473 :: 		if(!OC5IE_bit && !OC2IE_bit)
>>>>>>> patch2
=======
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
<<<<<<< HEAD
;Kinematics.c,478 :: 		while(1){
L_mc_arc73:
;Kinematics.c,479 :: 		if(!OC5IE_bit && !OC2IE_bit)
>>>>>>> patch2
=======
;Kinematics.c,480 :: 		while(1){
L_mc_arc75:
;Kinematics.c,481 :: 		if(!OC5IE_bit && !OC2IE_bit)
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L__mc_arc189:
L__mc_arc109:
;Kinematics.c,530 :: 		break;
J	L_mc_arc96
NOP	
;Kinematics.c,529 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc111:
L__mc_arc110:
;Kinematics.c,531 :: 		}
J	L_mc_arc95
NOP	
L_mc_arc96:
;Kinematics.c,538 :: 		STPS[X].mmToTravel = calcSteps(nPx,8.06);
LUI	R2, 16640
ORI	R2, R2, 62915
SWC1	S16, 4(SP)
SB	R28, 8(SP)
SW	R27, 12(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
MTC1	R2, S13
MOV.S 	S12, S0
; nPx end address is: 0 (R0)
JAL	_calcSteps+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LW	R27, 12(SP)
LBU	R28, 8(SP)
LWC1	S16, 4(SP)
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,540 :: 		STPS[Y].mmToTravel = calcSteps(nPy,8.06);
LUI	R2, 16640
ORI	R2, R2, 62915
=======
L__mc_arc143:
L__mc_arc78:
;Kinematics.c,474 :: 		break;
J	L_mc_arc74
NOP	
;Kinematics.c,473 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc80:
L__mc_arc79:
;Kinematics.c,475 :: 		}
J	L_mc_arc73
NOP	
L_mc_arc74:
;Kinematics.c,482 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
>>>>>>> patch2
=======
L__mc_arc143:
L__mc_arc78:
;Kinematics.c,480 :: 		break;
J	L_mc_arc74
NOP	
;Kinematics.c,479 :: 		if(!OC5IE_bit && !OC2IE_bit)
=======
L__mc_arc146:
>>>>>>> patch2
L__mc_arc80:
;Kinematics.c,482 :: 		break;
J	L_mc_arc76
NOP	
<<<<<<< HEAD
L_mc_arc74:
;Kinematics.c,488 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
>>>>>>> patch2
=======
;Kinematics.c,481 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc82:
L__mc_arc81:
;Kinematics.c,483 :: 		}
J	L_mc_arc75
NOP	
L_mc_arc76:
;Kinematics.c,490 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
>>>>>>> patch2
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,484 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 52(SP)
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Kinematics.c,542 :: 		STPS[X].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+8)(GP)
;Kinematics.c,543 :: 		STPS[Y].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+76)(GP)
;Kinematics.c,544 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Kinematics.c,486 :: 		STPS[X].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+8)(GP)
;Kinematics.c,487 :: 		STPS[Y].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+76)(GP)
;Kinematics.c,488 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
=======
;Kinematics.c,490 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
=======
;Kinematics.c,492 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
>>>>>>> patch2
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
<<<<<<< HEAD
;Kinematics.c,494 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
=======
;Kinematics.c,496 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,500 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,548 :: 		}
J	L_mc_arc90
NOP	
L_mc_arc91:
;Kinematics.c,551 :: 		}
=======
;Kinematics.c,447 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 48(SP)
ADDIU	R2, R2, 1
SH	R2, 48(SP)
;Kinematics.c,492 :: 		}
J	L_mc_arc68
NOP	
L_mc_arc69:
;Kinematics.c,495 :: 		}
>>>>>>> patch2
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 84
=======
;Kinematics.c,453 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
=======
;Kinematics.c,455 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
>>>>>>> patch2
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
>>>>>>> patch2
JR	RA
NOP	
; end of _mc_arc
_hypot:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,553 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,554 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
=======
;Kinematics.c,497 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,498 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
>>>>>>> patch2
=======
;Kinematics.c,503 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,504 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
>>>>>>> patch2
=======
;Kinematics.c,505 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,506 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
>>>>>>> patch2
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,555 :: 		}
=======
;Kinematics.c,499 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,505 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,507 :: 		}
>>>>>>> patch2
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_SerialPrint:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,557 :: 		void SerialPrint(float r){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,558 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,559 :: 		int str_lenA = 0;
;Kinematics.c,560 :: 		str_lenA = strlen(txtA);
=======
;Kinematics.c,501 :: 		void SerialPrint(float r){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,502 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,503 :: 		int str_lenA = 0;
;Kinematics.c,504 :: 		str_lenA = strlen(txtA);
>>>>>>> patch2
=======
;Kinematics.c,507 :: 		void SerialPrint(float r){
=======
;Kinematics.c,509 :: 		void SerialPrint(float r){
>>>>>>> patch2
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,510 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
<<<<<<< HEAD
;Kinematics.c,509 :: 		int str_lenA = 0;
;Kinematics.c,510 :: 		str_lenA = strlen(txtA);
>>>>>>> patch2
=======
;Kinematics.c,511 :: 		int str_lenA = 0;
;Kinematics.c,512 :: 		str_lenA = strlen(txtA);
>>>>>>> patch2
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strlen+0
NOP	
; str_lenA start address is: 44 (R11)
SEH	R11, R2
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,561 :: 		memset(txtB,0,30);
=======
;Kinematics.c,505 :: 		memset(txtB,0,30);
>>>>>>> patch2
=======
;Kinematics.c,511 :: 		memset(txtB,0,30);
>>>>>>> patch2
=======
;Kinematics.c,513 :: 		memset(txtB,0,30);
>>>>>>> patch2
ORI	R27, R0, 30
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_memset+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,563 :: 		sprintf(txt,"%0.2f",r);
=======
;Kinematics.c,507 :: 		sprintf(txt,"%0.2f",r);
>>>>>>> patch2
=======
;Kinematics.c,513 :: 		sprintf(txt,"%0.2f",r);
>>>>>>> patch2
=======
;Kinematics.c,515 :: 		sprintf(txt,"%0.2f",r);
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,564 :: 		strncpy(txtB, " ",strlen(txt));
=======
;Kinematics.c,508 :: 		strncpy(txtB, " ",strlen(txt));
>>>>>>> patch2
=======
;Kinematics.c,514 :: 		strncpy(txtB, " ",strlen(txt));
>>>>>>> patch2
=======
;Kinematics.c,516 :: 		strncpy(txtB, " ",strlen(txt));
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,565 :: 		strncat(txtB, txt,strlen(txt));
=======
;Kinematics.c,509 :: 		strncat(txtB, txt,strlen(txt));
>>>>>>> patch2
=======
;Kinematics.c,515 :: 		strncat(txtB, txt,strlen(txt));
>>>>>>> patch2
=======
;Kinematics.c,517 :: 		strncat(txtB, txt,strlen(txt));
>>>>>>> patch2
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,566 :: 		str_len += strlen(txt);
=======
;Kinematics.c,510 :: 		str_len += strlen(txt);
>>>>>>> patch2
=======
;Kinematics.c,516 :: 		str_len += strlen(txt);
>>>>>>> patch2
=======
;Kinematics.c,518 :: 		str_len += strlen(txt);
>>>>>>> patch2
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,567 :: 		strncat(txtB,txtA,str_lenA);
=======
;Kinematics.c,511 :: 		strncat(txtB,txtA,str_lenA);
>>>>>>> patch2
=======
;Kinematics.c,517 :: 		strncat(txtB,txtA,str_lenA);
>>>>>>> patch2
=======
;Kinematics.c,519 :: 		strncat(txtB,txtA,str_lenA);
>>>>>>> patch2
SEH	R27, R11
; str_lenA end address is: 44 (R11)
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,625 :: 		UART2_Write_Text(txtB);
=======
;Kinematics.c,569 :: 		UART2_Write_Text(txtB);
>>>>>>> patch2
=======
;Kinematics.c,575 :: 		UART2_Write_Text(txtB);
>>>>>>> patch2
=======
;Kinematics.c,577 :: 		UART2_Write_Text(txtB);
>>>>>>> patch2
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
;Kinematics.c,634 :: 		}
=======
;Kinematics.c,578 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,584 :: 		}
>>>>>>> patch2
=======
;Kinematics.c,586 :: 		}
>>>>>>> patch2
L_end_SerialPrint:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SerialPrint
