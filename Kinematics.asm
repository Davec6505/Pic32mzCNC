_SetInitialSizes:
;Kinematics.c,20 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,21 :: 		int i = 0;
;Kinematics.c,23 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+6)(GP)
;Kinematics.c,25 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__SetInitialSizes94
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes94:
;Kinematics.c,26 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 92
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
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
SLTI	R2, R4, 0
BNE	R2, R0, L__SingleAxisStep96
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep96:
; ?FLOC___SingleAxisStep?T22 start address is: 20 (R5)
ORI	R5, R0, 255
; ?FLOC___SingleAxisStep?T22 end address is: 20 (R5)
J	L_SingleAxisStep4
NOP	
L_SingleAxisStep3:
; ?FLOC___SingleAxisStep?T22 start address is: 20 (R5)
ORI	R5, R0, 1
; ?FLOC___SingleAxisStep?T22 end address is: 20 (R5)
L_SingleAxisStep4:
; ?FLOC___SingleAxisStep?T22 start address is: 20 (R5)
SEB	R2, R5
; ?FLOC___SingleAxisStep?T22 end address is: 20 (R5)
SH	R2, 0(R3)
;Kinematics.c,46 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,47 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R0, 0(R2)
;Kinematics.c,49 :: 		STPS[axis_No].dist = tempA - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 44
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SUBU	R2, R4, R2
SW	R2, 0(R3)
;Kinematics.c,50 :: 		STPS[axis_No].dist = labs(tempA);
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 24(SP)
MOVZ	R25, R4, R0
JAL	_labs+0
NOP	
LW	R3, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,51 :: 		dir = (tempA < 0)? CCW : CW;
SLTI	R2, R4, 0
BNE	R2, R0, L__SingleAxisStep97
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep97:
; ?FLOC___SingleAxisStep?T50 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___SingleAxisStep?T50 end address is: 8 (R2)
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep5:
; ?FLOC___SingleAxisStep?T50 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SingleAxisStep?T50 end address is: 8 (R2)
L_SingleAxisStep6:
; ?FLOC___SingleAxisStep?T50 start address is: 8 (R2)
; dir start address is: 20 (R5)
SEB	R5, R2
; ?FLOC___SingleAxisStep?T50 end address is: 8 (R2)
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
BNE	R2, R0, L__SingleAxisStep99
NOP	
J	L_SingleAxisStep9
NOP	
L__SingleAxisStep99:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep10
NOP	
L__SingleAxisStep101:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep103
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep103:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep105
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep105:
; dir end address is: 20 (R5)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep8:
;Kinematics.c,68 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,69 :: 		STPS[axis_No].mmToTravel = tempA;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
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
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Kinematics.c,83 :: 		SV.over=0;
SW	R27, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,84 :: 		SV.dif = 0;
SW	R0, Offset(_SV+8)(GP)
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
;Kinematics.c,96 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+6)(GP)
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep14
NOP	
L__DualAxisStep107:
;Kinematics.c,97 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,98 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,99 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,100 :: 		}else{
J	L_DualAxisStep15
NOP	
L_DualAxisStep14:
;Kinematics.c,101 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,102 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,103 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,104 :: 		}
L_DualAxisStep15:
;Kinematics.c,107 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep108:
; ?FLOC___DualAxisStep?T83 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T83 end address is: 24 (R6)
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
; ?FLOC___DualAxisStep?T83 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T83 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T83 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T83 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,108 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep109
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep109:
; ?FLOC___DualAxisStep?T91 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T91 end address is: 24 (R6)
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T91 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T91 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T91 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T91 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,111 :: 		SV.dA   = tempA - SV.prevA;
LW	R3, Offset(_SV+24)(GP)
LW	R2, 20(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,112 :: 		SV.dB   = tempB - SV.prevB;
LW	R3, Offset(_SV+28)(GP)
LW	R2, 24(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,113 :: 		SV.dC   = tempC - SV.prevC;
LW	R3, Offset(_SV+32)(GP)
LW	R2, 28(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,116 :: 		dirA = SV.dA > 0? CW:CCW;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep110:
; ?FLOC___DualAxisStep?T96 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T96 end address is: 8 (R2)
J	L_DualAxisStep21
NOP	
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T96 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T96 end address is: 8 (R2)
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T96 start address is: 8 (R2)
; dirA start address is: 12 (R3)
SEB	R3, R2
; ?FLOC___DualAxisStep?T96 end address is: 8 (R2)
;Kinematics.c,117 :: 		dirB = SV.dB > 0? CW:CCW;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep22
NOP	
L__DualAxisStep111:
; ?FLOC___DualAxisStep?T98 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___DualAxisStep?T98 end address is: 8 (R2)
J	L_DualAxisStep23
NOP	
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T98 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___DualAxisStep?T98 end address is: 8 (R2)
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T98 start address is: 8 (R2)
; dirB start address is: 16 (R4)
SEB	R4, R2
; ?FLOC___DualAxisStep?T98 end address is: 8 (R2)
;Kinematics.c,119 :: 		DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
XORI	R2, R3, 1
; dirA end address is: 12 (R3)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,120 :: 		DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
ANDI	R3, R4, 1
; dirB end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,123 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,124 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,128 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep112
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep112:
;Kinematics.c,129 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep113:
;Kinematics.c,130 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
L_DualAxisStep25:
;Kinematics.c,132 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,133 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,134 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,135 :: 		}
J	L_DualAxisStep26
NOP	
L_DualAxisStep24:
;Kinematics.c,137 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep114:
;Kinematics.c,138 :: 		speed_cntr_Move(tempB,speed,axisB);
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
L_DualAxisStep27:
;Kinematics.c,140 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,141 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,142 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,143 :: 		}
L_DualAxisStep26:
;Kinematics.c,145 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,146 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,147 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,148 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,150 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,158 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _DualAxisStep
_hypot:
;Kinematics.c,171 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,172 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,173 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_mc_arc:
;Kinematics.c,202 :: 		int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
LH	R2, 84(SP)
SH	R2, 84(SP)
LH	R2, 86(SP)
SH	R2, 86(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 88(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 89(SP)
;Kinematics.c,204 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 20(SP)
;Kinematics.c,205 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LH	R2, 84(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 24(SP)
;Kinematics.c,206 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 86(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,207 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,208 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 32(SP)
;Kinematics.c,209 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,210 :: 		double rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,211 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,212 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,213 :: 		double angular_travel          = 0.00;
;Kinematics.c,214 :: 		double mm_of_travel            = 0.00;
;Kinematics.c,215 :: 		double rads                    = 0.00;
;Kinematics.c,216 :: 		unsigned int segments          = 0;
;Kinematics.c,217 :: 		double cos_T                   = 0.00;
;Kinematics.c,218 :: 		double sin_T                   = 0.00;
;Kinematics.c,224 :: 		unsigned int i = 0;
;Kinematics.c,225 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 56(SP)
ORI	R30, R0, 3
SB	R30, 58(SP)
MOVZ	R30, R0, R0
SB	R30, 59(SP)
;Kinematics.c,226 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,227 :: 		char limit_error = 0;
;Kinematics.c,229 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 36
LH	R2, 86(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,233 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,235 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc118
NOP	
J	L__mc_arc84
NOP	
L__mc_arc118:
; isclockwise end address is: 28 (R7)
;Kinematics.c,237 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc119
NOP	
J	L_mc_arc29
NOP	
L__mc_arc119:
;Kinematics.c,238 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc30
NOP	
L_mc_arc29:
;Kinematics.c,240 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc120
NOP	
J	L__mc_arc83
NOP	
L__mc_arc120:
;Kinematics.c,241 :: 		angular_travel += 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc31
NOP	
L__mc_arc83:
;Kinematics.c,240 :: 		if(angular_travel <= 0)
;Kinematics.c,241 :: 		angular_travel += 2*M_PI;
L_mc_arc31:
;Kinematics.c,242 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc30:
;Kinematics.c,243 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S3, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc28
NOP	
L__mc_arc84:
;Kinematics.c,235 :: 		if(isclockwise) {
MOV.S 	S3, S4
;Kinematics.c,243 :: 		}
L_mc_arc28:
;Kinematics.c,246 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,247 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc121
NOP	
J	L_mc_arc32
NOP	
L__mc_arc121:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; angular_travel end address is: 24 (R6)
; mm_of_travel end address is: 16 (R4)
J	L_end_mc_arc
NOP	
L_mc_arc32:
;Kinematics.c,249 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
SH	R2, 68(SP)
;Kinematics.c,253 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc123
NOP	
J	L_mc_arc33
NOP	
L__mc_arc123:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,254 :: 		feed_rate *= segments;
LHU	R2, 68(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc33:
;Kinematics.c,257 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 68(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S3, S0
; angular_travel end address is: 24 (R6)
SWC1	S2, 60(SP)
;Kinematics.c,261 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 64(SP)
;Kinematics.c,264 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 72(SP)
;Kinematics.c,265 :: 		sin_T = theta_per_segment;
SWC1	S2, 76(SP)
;Kinematics.c,267 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 36
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,268 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 84(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,269 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,270 :: 		i = 0;
SH	R0, 80(SP)
;Kinematics.c,275 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc34:
LHU	R3, 68(SP)
LHU	R2, 80(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc124
NOP	
J	L_mc_arc35
NOP	
L__mc_arc124:
;Kinematics.c,277 :: 		if (count < n_arc_correction) {
LBU	R3, 58(SP)
LH	R2, 56(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc125
NOP	
J	L_mc_arc36
NOP	
L__mc_arc125:
;Kinematics.c,279 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 76(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 72(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,280 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 72(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 76(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,281 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,282 :: 		count++;
LH	R2, 56(SP)
ADDIU	R2, R2, 1
SH	R2, 56(SP)
;Kinematics.c,283 :: 		} else {
J	L_mc_arc37
NOP	
L_mc_arc36:
;Kinematics.c,286 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 80(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 48(SP)
;Kinematics.c,287 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 80(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,288 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 48(SP)
MUL.S 	S3, S2, S1
LH	R2, 84(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
;Kinematics.c,289 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,290 :: 		count = 0;
SH	R0, 56(SP)
;Kinematics.c,291 :: 		}
L_mc_arc37:
;Kinematics.c,294 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,295 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 84(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,296 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 86(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,297 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,298 :: 		position[axis_0] = arc_target[axis_0];
SWC1	S1, 0(R2)
;Kinematics.c,299 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 84(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; nPy start address is: 0 (R0)
;Kinematics.c,300 :: 		position[axis_1] = arc_target[axis_1];
SWC1	S1, 0(R2)
;Kinematics.c,302 :: 		STPS[axis_0].step_delay = 1000;
SEH	R3, R28
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,303 :: 		STPS[axis_1].step_delay = 1000;
LH	R3, 84(SP)
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,311 :: 		SV.cir = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,312 :: 		DualAxisStep(nPx, nPy,axis_0,axis_1,1000);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1000
LH	R26, 84(SP)
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
;Kinematics.c,314 :: 		while(1){
L_mc_arc38:
;Kinematics.c,316 :: 		if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
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
BEQ	R2, R0, L__mc_arc126
NOP	
J	L__mc_arc80
NOP	
L__mc_arc126:
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LH	R25, 84(SP)
JAL	_Test_Port_Pins+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc127
NOP	
J	L__mc_arc79
NOP	
L__mc_arc127:
J	L_mc_arc42
NOP	
L__mc_arc80:
L__mc_arc79:
;Kinematics.c,317 :: 		disableOCx();
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
;Kinematics.c,318 :: 		limit_error = 1;
ORI	R2, R0, 1
SB	R2, 59(SP)
;Kinematics.c,319 :: 		}
L_mc_arc42:
;Kinematics.c,321 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc128
NOP	
J	L__mc_arc82
NOP	
L__mc_arc128:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc129
NOP	
J	L__mc_arc81
NOP	
L__mc_arc129:
L__mc_arc77:
;Kinematics.c,322 :: 		break;
J	L_mc_arc39
NOP	
;Kinematics.c,321 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc82:
L__mc_arc81:
;Kinematics.c,323 :: 		}
J	L_mc_arc38
NOP	
L_mc_arc39:
;Kinematics.c,327 :: 		if(limit_error)
LBU	R2, 59(SP)
BNE	R2, R0, L__mc_arc131
NOP	
J	L_mc_arc46
NOP	
L__mc_arc131:
;Kinematics.c,328 :: 		break;
J	L_mc_arc35
NOP	
L_mc_arc46:
;Kinematics.c,329 :: 		i++;
LHU	R2, 80(SP)
ADDIU	R2, R2, 1
SH	R2, 80(SP)
;Kinematics.c,330 :: 		}
J	L_mc_arc34
NOP	
L_mc_arc35:
;Kinematics.c,333 :: 		while(DMA_Busy(1));
L_mc_arc47:
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
BNE	R2, R0, L__mc_arc133
NOP	
J	L_mc_arc48
NOP	
L__mc_arc133:
J	L_mc_arc47
NOP	
L_mc_arc48:
;Kinematics.c,334 :: 		dma_printf("\n%s","Arc Finnished");
ORI	R30, R0, 10
SB	R30, 52(SP)
ORI	R30, R0, 37
SB	R30, 53(SP)
ORI	R30, R0, 115
SB	R30, 54(SP)
MOVZ	R30, R0, R0
SB	R30, 55(SP)
ADDIU	R3, SP, 52
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
;Kinematics.c,337 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _mc_arc
_GetAxisDirection:
;Kinematics.c,347 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,348 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection135
NOP	
J	L_GetAxisDirection49
NOP	
L__GetAxisDirection135:
; ?FLOC___GetAxisDirection?T346 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T346 end address is: 8 (R2)
J	L_GetAxisDirection50
NOP	
L_GetAxisDirection49:
; ?FLOC___GetAxisDirection?T346 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T346 end address is: 8 (R2)
L_GetAxisDirection50:
; ?FLOC___GetAxisDirection?T346 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T346 end address is: 8 (R2)
;Kinematics.c,349 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,355 :: 		void ResetHoming(){
;Kinematics.c,356 :: 		int i = 0;
;Kinematics.c,357 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming51:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__ResetHoming137
NOP	
J	L_ResetHoming52
NOP	
L__ResetHoming137:
;Kinematics.c,358 :: 		STPS[i].homing.set = 0;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,359 :: 		STPS[i].homing.complete = 0;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,360 :: 		STPS[i].homing.home_cnt = 0;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,361 :: 		STPS[i].homing.rev = 0;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 2, 1
SB	R2, 0(R3)
;Kinematics.c,362 :: 		STPS[i].homing.home = 0;
SEH	R3, R4
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,357 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,363 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming51
NOP	
L_ResetHoming52:
;Kinematics.c,364 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,367 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,368 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,370 :: 		if(!STPS[axis].homing.set){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Home139
NOP	
J	L_Home54
NOP	
L__Home139:
;Kinematics.c,371 :: 		STPS[axis].homing.set = 1;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,372 :: 		STPS[axis].homing.complete = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,373 :: 		STPS[axis].homing.home_cnt = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,374 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,375 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home55
NOP	
L_Home54:
;Kinematics.c,376 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,377 :: 		}
L_Home55:
;Kinematics.c,381 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home141
NOP	
J	L_Home56
NOP	
L__Home141:
;Kinematics.c,382 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home142
NOP	
J	L_Home57
NOP	
L__Home142:
;Kinematics.c,383 :: 		StopAxis(X);
SW	R4, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home58
NOP	
L_Home57:
;Kinematics.c,384 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home143
NOP	
J	L_Home59
NOP	
L__Home143:
;Kinematics.c,385 :: 		StopAxis(Y);
SW	R4, 8(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home59:
L_Home58:
;Kinematics.c,387 :: 		if(!STPS[axis].homing.rev){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
LBU	R2, 0(R2)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Home144
NOP	
J	L_Home60
NOP	
L__Home144:
;Kinematics.c,388 :: 		STPS[axis].homing.rev = 1;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Kinematics.c,389 :: 		Inv_Home_Axis(2.0,speed, axis);
LUI	R2, 16384
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
MOVZ	R25, R4, R0
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,390 :: 		}
L_Home60:
;Kinematics.c,391 :: 		STPS[axis].homing.home_cnt++;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,392 :: 		}
L_Home56:
;Kinematics.c,394 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home146
NOP	
J	L_Home61
NOP	
L__Home146:
;Kinematics.c,395 :: 		STPS[axis].homing.home = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Kinematics.c,396 :: 		}
L_Home61:
;Kinematics.c,398 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__Home147
NOP	
J	L__Home92
NOP	
L__Home147:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__Home148
NOP	
J	L__Home91
NOP	
L__Home148:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__Home149
NOP	
J	L__Home90
NOP	
L__Home149:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__Home150
NOP	
J	L__Home89
NOP	
L__Home150:
L__Home86:
;Kinematics.c,400 :: 		if(!STPS[axis].homing.home){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Home151
NOP	
J	L_Home65
NOP	
L__Home151:
;Kinematics.c,401 :: 		STPS[axis].homing.home = 1;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Kinematics.c,402 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,403 :: 		}
L_Home65:
;Kinematics.c,405 :: 		if((STPS[axis].homing.home_cnt >= 2)&&(!STPS[axis].homing.complete)){
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home152
NOP	
J	L__Home88
NOP	
L__Home152:
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 98
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Home153
NOP	
J	L__Home87
NOP	
L__Home153:
L__Home85:
;Kinematics.c,406 :: 		STPS[axis].homing.complete      = true;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 98
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,407 :: 		STPS[axis].step_count           = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,408 :: 		STPS[axis].steps_abs_position   = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R0, 0(R2)
;Kinematics.c,405 :: 		if((STPS[axis].homing.home_cnt >= 2)&&(!STPS[axis].homing.complete)){
L__Home88:
L__Home87:
;Kinematics.c,398 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home92:
L__Home91:
L__Home90:
L__Home89:
;Kinematics.c,412 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,415 :: 		void Home_Axis(double distance,long speed,int axis){
;Kinematics.c,416 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis155
NOP	
J	L_Home_Axis69
NOP	
L__Home_Axis155:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T556 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T556 end address is: 8 (R2)
J	L_Home_Axis70
NOP	
L_Home_Axis69:
; ?FLOC___Home_Axis?T556 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T556 end address is: 8 (R2)
L_Home_Axis70:
; ?FLOC___Home_Axis?T556 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,417 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis156
NOP	
J	L_Home_Axis71
NOP	
L__Home_Axis156:
; ?FLOC___Home_Axis?T556 end address is: 8 (R2)
; ?FLOC___Home_Axis?T558 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T558 end address is: 0 (R0)
J	L_Home_Axis72
NOP	
L_Home_Axis71:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T558 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T558 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis72:
; ?FLOC___Home_Axis?T558 start address is: 0 (R0)
MOV.S 	S12, S0
; ?FLOC___Home_Axis?T558 end address is: 0 (R0)
;Kinematics.c,421 :: 		}
L_end_Home_Axis:
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,423 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
;Kinematics.c,424 :: 		distance = (distance > 10.0)?  10.0 : distance;
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis158
NOP	
J	L_Inv_Home_Axis73
NOP	
L__Inv_Home_Axis158:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T561 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T561 end address is: 8 (R2)
J	L_Inv_Home_Axis74
NOP	
L_Inv_Home_Axis73:
; ?FLOC___Inv_Home_Axis?T561 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T561 end address is: 8 (R2)
L_Inv_Home_Axis74:
; ?FLOC___Inv_Home_Axis?T561 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,425 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis159
NOP	
J	L_Inv_Home_Axis75
NOP	
L__Inv_Home_Axis159:
; ?FLOC___Inv_Home_Axis?T561 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T563 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T563 end address is: 8 (R2)
J	L_Inv_Home_Axis76
NOP	
L_Inv_Home_Axis75:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T563 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T563 end address is: 8 (R2)
L_Inv_Home_Axis76:
; ?FLOC___Inv_Home_Axis?T563 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T563 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,429 :: 		}
L_end_Inv_Home_Axis:
JR	RA
NOP	
; end of _Inv_Home_Axis
