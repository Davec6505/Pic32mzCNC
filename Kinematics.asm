_SetInitialSizes:
;Kinematics.c,20 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,21 :: 		int i = 0;
;Kinematics.c,23 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,25 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes89
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes89:
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
Kinematics_Set_Axisdirection:
;Kinematics.c,33 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,34 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection91
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection91:
; ?FLOC__Kinematics_Set_Axisdirection?T16 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC__Kinematics_Set_Axisdirection?T16 end address is: 8 (R2)
J	L_Kinematics_Set_Axisdirection4
NOP	
L_Kinematics_Set_Axisdirection3:
; ?FLOC__Kinematics_Set_Axisdirection?T16 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC__Kinematics_Set_Axisdirection?T16 end address is: 8 (R2)
L_Kinematics_Set_Axisdirection4:
; ?FLOC__Kinematics_Set_Axisdirection?T16 start address is: 8 (R2)
; dir start address is: 16 (R4)
SEB	R4, R2
; ?FLOC__Kinematics_Set_Axisdirection?T16 end address is: 8 (R2)
;Kinematics.c,35 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,36 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,37 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,38 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,39 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,40 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,41 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,42 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,43 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,44 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,45 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,46 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,47 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,48 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,49 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection93
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection93:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection95
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection95:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection97
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection97:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection99
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection99:
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,50 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,63 :: 		void SingleAxisStep(double newxyz,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,64 :: 		long tempA = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
;Kinematics.c,65 :: 		int dir = 0;
;Kinematics.c,66 :: 		Single_Axis_Enable(axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
;Kinematics.c,67 :: 		tempA = belt_steps(newxyz);
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,68 :: 		speed_cntr_Move(tempA , speed , axis_No);
SW	R5, 12(SP)
SH	R26, 16(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 16(SP)
LW	R5, 12(SP)
;Kinematics.c,73 :: 		Set_Axisdirection(tempA,axis_No);
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,74 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
SLTI	R2, R5, 0
BNE	R2, R0, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep101:
; ?FLOC___SingleAxisStep?T36 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___SingleAxisStep?T36 end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep12:
; ?FLOC___SingleAxisStep?T36 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___SingleAxisStep?T36 end address is: 16 (R4)
L_SingleAxisStep13:
; ?FLOC___SingleAxisStep?T36 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___SingleAxisStep?T36 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,75 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,76 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R0, 0(R2)
;Kinematics.c,77 :: 		STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R2, 24(SP)
MOVZ	R25, R5, R0
JAL	_labs+0
NOP	
SEH	R4, R26
ORI	R3, R0, 104
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 48
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 24(SP)
SW	R3, 0(R2)
;Kinematics.c,78 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,79 :: 		STPS[axis_No].mmToTravel = tempA;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R5, 0(R2)
; tempA end address is: 20 (R5)
;Kinematics.c,81 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,83 :: 		}
L_end_SingleAxisStep:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,88 :: 		void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){//,int xyza){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Kinematics.c,91 :: 		SV.over=0;
SW	R27, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,92 :: 		SV.dif = 0;
SW	R0, Offset(_SV+8)(GP)
;Kinematics.c,94 :: 		tempA = belt_steps(axis_a);
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
;Kinematics.c,95 :: 		tempB = belt_steps(axis_b);
SH	R26, 12(SP)
SH	R25, 14(SP)
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
SW	R2, 24(SP)
;Kinematics.c,98 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,99 :: 		Single_Axis_Enable(axisA);
SH	R25, 14(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,100 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,104 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep103
NOP	
J	L_DualAxisStep14
NOP	
L__DualAxisStep103:
;Kinematics.c,105 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,106 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,107 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,108 :: 		}else{
J	L_DualAxisStep15
NOP	
L_DualAxisStep14:
;Kinematics.c,109 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,110 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,111 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,112 :: 		}
L_DualAxisStep15:
;Kinematics.c,115 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,116 :: 		STPS[axisA].axis_dir = Direction(tempA);
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
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep104:
; ?FLOC___DualAxisStep?T77 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T77 end address is: 24 (R6)
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
; ?FLOC___DualAxisStep?T77 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T77 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T77 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T77 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,117 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,118 :: 		STPS[axisB].axis_dir = Direction(tempB);
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
BNE	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep105:
; ?FLOC___DualAxisStep?T85 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T85 end address is: 24 (R6)
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T85 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T85 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T85 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T85 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,121 :: 		SV.dA   = tempA - SV.prevA;
LW	R3, Offset(_SV+24)(GP)
LW	R2, 20(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,122 :: 		SV.dB   = tempB - SV.prevB;
LW	R3, Offset(_SV+28)(GP)
LW	R2, 24(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,123 :: 		SV.dC   = tempC - SV.prevC;
LW	R3, Offset(_SV+32)(GP)
LW	R2, 28(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,126 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,127 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,130 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep106:
;Kinematics.c,131 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep107:
;Kinematics.c,132 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
L_DualAxisStep21:
;Kinematics.c,134 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,135 :: 		STPS[axisA].master = 1;
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
;Kinematics.c,136 :: 		STPS[axisB].master = 0;
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
;Kinematics.c,137 :: 		}
J	L_DualAxisStep22
NOP	
L_DualAxisStep20:
;Kinematics.c,139 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep108
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep108:
;Kinematics.c,140 :: 		speed_cntr_Move(tempB,speed,axisB);
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
L_DualAxisStep23:
;Kinematics.c,142 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,143 :: 		STPS[axisA].master = 0;
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
;Kinematics.c,144 :: 		STPS[axisB].master = 1;
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
;Kinematics.c,145 :: 		}
L_DualAxisStep22:
;Kinematics.c,147 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,148 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,149 :: 		STPS[axisA].mmToTravel = tempA;
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
;Kinematics.c,150 :: 		STPS[axisB].mmToTravel = tempB;
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
;Kinematics.c,152 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,161 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,196 :: 		int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -284
SW	RA, 0(SP)
LH	R2, 284(SP)
SH	R2, 284(SP)
LH	R2, 286(SP)
SH	R2, 286(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 288(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 289(SP)
;Kinematics.c,198 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 28(SP)
;Kinematics.c,199 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LH	R2, 284(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 32(SP)
;Kinematics.c,200 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 286(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,201 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 36(SP)
;Kinematics.c,202 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 40(SP)
;Kinematics.c,203 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,204 :: 		double rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,205 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,206 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,207 :: 		double angular_travel          = 0.00;
;Kinematics.c,208 :: 		double mm_of_travel            = 0.00;
;Kinematics.c,209 :: 		double rads                    = 0.00;
;Kinematics.c,210 :: 		unsigned int segments          = 0;
;Kinematics.c,211 :: 		double cos_T                   = 0.00;
;Kinematics.c,212 :: 		double sin_T                   = 0.00;
;Kinematics.c,218 :: 		unsigned int i = 0;
;Kinematics.c,219 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 254(SP)
ORI	R30, R0, 3
SB	R30, 256(SP)
MOVZ	R30, R0, R0
SB	R30, 257(SP)
;Kinematics.c,220 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,221 :: 		char limit_error = 0;
;Kinematics.c,223 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 44
LH	R2, 286(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,227 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,229 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc111
NOP	
J	L__mc_arc79
NOP	
L__mc_arc111:
; isclockwise end address is: 28 (R7)
;Kinematics.c,231 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc112
NOP	
J	L_mc_arc25
NOP	
L__mc_arc112:
;Kinematics.c,232 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc26
NOP	
L_mc_arc25:
;Kinematics.c,234 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc113
NOP	
J	L__mc_arc78
NOP	
L__mc_arc113:
;Kinematics.c,235 :: 		angular_travel += 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc27
NOP	
L__mc_arc78:
;Kinematics.c,234 :: 		if(angular_travel <= 0)
;Kinematics.c,235 :: 		angular_travel += 2*M_PI;
L_mc_arc27:
;Kinematics.c,236 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc26:
;Kinematics.c,237 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S3, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc24
NOP	
L__mc_arc79:
;Kinematics.c,229 :: 		if(isclockwise) {
MOV.S 	S3, S4
;Kinematics.c,237 :: 		}
L_mc_arc24:
;Kinematics.c,240 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,241 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc114
NOP	
J	L_mc_arc28
NOP	
L__mc_arc114:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; angular_travel end address is: 24 (R6)
; mm_of_travel end address is: 32 (R8)
J	L_end_mc_arc
NOP	
L_mc_arc28:
;Kinematics.c,243 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; mm_of_travel start address is: 32 (R8)
; angular_travel start address is: 24 (R6)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 24 (R6)
LUI	R2, 15820
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
SH	R2, 268(SP)
;Kinematics.c,247 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc116
NOP	
J	L_mc_arc29
NOP	
L__mc_arc116:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,248 :: 		feed_rate *= segments;
LHU	R2, 268(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc29:
;Kinematics.c,251 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 268(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S3, S0
SWC1	S2, 260(SP)
;Kinematics.c,255 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S0
SWC1	S0, 264(SP)
;Kinematics.c,258 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 272(SP)
;Kinematics.c,259 :: 		sin_T = theta_per_segment;
SWC1	S2, 276(SP)
;Kinematics.c,261 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,262 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 284(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,263 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,264 :: 		i = 0;
SH	R0, 280(SP)
;Kinematics.c,266 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
ADDIU	R23, SP, 68
ADDIU	R22, R23, 127
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 68
;Kinematics.c,267 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
LW	R2, 260(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
LW	R2, 304(SP)
SW	R2, 32(SP)
SWC1	S6, 28(SP)
; linear_travel end address is: 48 (R12)
SWC1	S4, 24(SP)
; mm_of_travel end address is: 32 (R8)
SWC1	S3, 20(SP)
; angular_travel end address is: 24 (R6)
LHU	R2, 308(SP)
SH	R2, 16(SP)
SWC1	S13, 12(SP)
LW	R2, 316(SP)
SW	R2, 8(SP)
LW	R2, 312(SP)
SW	R2, 4(SP)
;Kinematics.c,266 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
SW	R3, 0(SP)
;Kinematics.c,267 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 40
LW	R25, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,269 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc30:
LHU	R3, 268(SP)
LHU	R2, 280(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc117
NOP	
J	L_mc_arc31
NOP	
L__mc_arc117:
;Kinematics.c,271 :: 		if (count < n_arc_correction) {
LBU	R3, 256(SP)
LH	R2, 254(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc118
NOP	
J	L_mc_arc32
NOP	
L__mc_arc118:
;Kinematics.c,273 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 276(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 272(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,274 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 272(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 276(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 36(SP)
;Kinematics.c,275 :: 		r_axis1 = r_axisi;
SWC1	S3, 40(SP)
;Kinematics.c,276 :: 		count++;
LH	R2, 254(SP)
ADDIU	R2, R2, 1
SH	R2, 254(SP)
;Kinematics.c,277 :: 		} else {
J	L_mc_arc33
NOP	
L_mc_arc32:
;Kinematics.c,280 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 280(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 260(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 56(SP)
;Kinematics.c,281 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 280(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 260(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,282 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 56(SP)
MUL.S 	S3, S2, S1
LH	R2, 284(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 36(SP)
;Kinematics.c,283 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 56(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 40(SP)
;Kinematics.c,284 :: 		count = 0;
SH	R0, 254(SP)
;Kinematics.c,285 :: 		}
L_mc_arc33:
;Kinematics.c,288 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,289 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 284(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,290 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 286(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 264(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,291 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 60(SP)
;Kinematics.c,292 :: 		position[axis_0] = arc_target[axis_0];
SWC1	S1, 0(R2)
;Kinematics.c,293 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 284(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,294 :: 		position[axis_1] = arc_target[axis_1];
SWC1	S1, 0(R2)
;Kinematics.c,296 :: 		STPS[axis_0].step_delay = 1000;
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
;Kinematics.c,297 :: 		STPS[axis_1].step_delay = 1000;
LH	R3, 284(SP)
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,300 :: 		if(!DMA_IsOn(1));
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc119
NOP	
J	L_mc_arc34
NOP	
L__mc_arc119:
L_mc_arc34:
;Kinematics.c,301 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
ADDIU	R23, SP, 195
ADDIU	R22, R23, 58
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 195
;Kinematics.c,302 :: 		i,segments,nPx,nPy,tempA,tempB);
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
LHU	R2, 296(SP)
SH	R2, 8(SP)
LHU	R2, 308(SP)
SH	R2, 4(SP)
;Kinematics.c,301 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
SW	R3, 0(SP)
;Kinematics.c,302 :: 		i,segments,nPx,nPy,tempA,tempB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,305 :: 		SV.cir = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,306 :: 		DualAxisStep(nPx, nPy,axis_0,axis_1,1000);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1000
LH	R26, 284(SP)
SEH	R25, R28
LWC1	S13, 64(SP)
LWC1	S12, 60(SP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,308 :: 		while(1){
L_mc_arc35:
;Kinematics.c,310 :: 		if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
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
BEQ	R2, R0, L__mc_arc120
NOP	
J	L__mc_arc75
NOP	
L__mc_arc120:
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LH	R25, 284(SP)
JAL	_Test_Port_Pins+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc121
NOP	
J	L__mc_arc74
NOP	
L__mc_arc121:
J	L_mc_arc39
NOP	
L__mc_arc75:
L__mc_arc74:
;Kinematics.c,311 :: 		disableOCx();
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
;Kinematics.c,312 :: 		limit_error = 1;
ORI	R2, R0, 1
SB	R2, 257(SP)
;Kinematics.c,313 :: 		}
L_mc_arc39:
;Kinematics.c,315 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc122
NOP	
J	L__mc_arc77
NOP	
L__mc_arc122:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc123
NOP	
J	L__mc_arc76
NOP	
L__mc_arc123:
L__mc_arc72:
;Kinematics.c,316 :: 		break;
J	L_mc_arc36
NOP	
;Kinematics.c,315 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc77:
L__mc_arc76:
;Kinematics.c,317 :: 		}
J	L_mc_arc35
NOP	
L_mc_arc36:
;Kinematics.c,321 :: 		if(limit_error)
LBU	R2, 257(SP)
BNE	R2, R0, L__mc_arc125
NOP	
J	L_mc_arc43
NOP	
L__mc_arc125:
;Kinematics.c,322 :: 		break;
J	L_mc_arc31
NOP	
L_mc_arc43:
;Kinematics.c,323 :: 		i++;
LHU	R2, 280(SP)
ADDIU	R2, R2, 1
SH	R2, 280(SP)
;Kinematics.c,324 :: 		}
J	L_mc_arc30
NOP	
L_mc_arc31:
;Kinematics.c,331 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 284
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,336 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,337 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,338 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,346 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,347 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection128
NOP	
J	L_GetAxisDirection44
NOP	
L__GetAxisDirection128:
; ?FLOC___GetAxisDirection?T333 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T333 end address is: 8 (R2)
J	L_GetAxisDirection45
NOP	
L_GetAxisDirection44:
; ?FLOC___GetAxisDirection?T333 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T333 end address is: 8 (R2)
L_GetAxisDirection45:
; ?FLOC___GetAxisDirection?T333 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T333 end address is: 8 (R2)
;Kinematics.c,348 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_ResetHoming:
;Kinematics.c,354 :: 		void ResetHoming(){
;Kinematics.c,355 :: 		int i = 0;
;Kinematics.c,356 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ResetHoming46:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__ResetHoming130
NOP	
J	L_ResetHoming47
NOP	
L__ResetHoming130:
;Kinematics.c,357 :: 		STPS[i].homing.set = 0;
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
;Kinematics.c,358 :: 		STPS[i].homing.complete = 0;
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
;Kinematics.c,359 :: 		STPS[i].homing.home_cnt = 0;
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
;Kinematics.c,360 :: 		STPS[i].homing.rev = 0;
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
;Kinematics.c,361 :: 		STPS[i].homing.home = 0;
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
;Kinematics.c,356 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,362 :: 		}
; i end address is: 16 (R4)
J	L_ResetHoming46
NOP	
L_ResetHoming47:
;Kinematics.c,363 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of _ResetHoming
_Home:
;Kinematics.c,366 :: 		void Home(int axis){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,367 :: 		long speed = 0;
SW	R26, 4(SP)
;Kinematics.c,369 :: 		if(!STPS[axis].homing.set){
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
BEQ	R2, R0, L__Home132
NOP	
J	L_Home49
NOP	
L__Home132:
;Kinematics.c,370 :: 		STPS[axis].homing.set = 1;
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
;Kinematics.c,371 :: 		STPS[axis].homing.complete = 0;
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
;Kinematics.c,372 :: 		STPS[axis].homing.home_cnt = 0;
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
;Kinematics.c,373 :: 		speed = 2000;
; speed start address is: 16 (R4)
ORI	R4, R0, 2000
;Kinematics.c,374 :: 		}else{
; speed end address is: 16 (R4)
J	L_Home50
NOP	
L_Home49:
;Kinematics.c,375 :: 		speed = 100;
; speed start address is: 16 (R4)
ORI	R4, R0, 100
; speed end address is: 16 (R4)
;Kinematics.c,376 :: 		}
L_Home50:
;Kinematics.c,380 :: 		if(FP(axis)){
; speed start address is: 16 (R4)
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FP+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home134
NOP	
J	L_Home51
NOP	
L__Home134:
;Kinematics.c,381 :: 		if(axis == X)
SEH	R2, R25
BEQ	R2, R0, L__Home135
NOP	
J	L_Home52
NOP	
L__Home135:
;Kinematics.c,382 :: 		StopAxis(X);
SW	R4, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
J	L_Home53
NOP	
L_Home52:
;Kinematics.c,383 :: 		else if(axis == Y)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Home136
NOP	
J	L_Home54
NOP	
L__Home136:
;Kinematics.c,384 :: 		StopAxis(Y);
SW	R4, 8(SP)
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_StopAxis+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
L_Home54:
L_Home53:
;Kinematics.c,386 :: 		if(!STPS[axis].homing.rev){
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
BEQ	R2, R0, L__Home137
NOP	
J	L_Home55
NOP	
L__Home137:
;Kinematics.c,387 :: 		STPS[axis].homing.rev = 1;
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
;Kinematics.c,388 :: 		Inv_Home_Axis(2.0,speed, axis);
LUI	R2, 16384
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
MOVZ	R25, R4, R0
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,389 :: 		}
L_Home55:
;Kinematics.c,390 :: 		STPS[axis].homing.home_cnt++;
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
;Kinematics.c,391 :: 		}
L_Home51:
;Kinematics.c,393 :: 		if(FN(axis)){
SW	R4, 8(SP)
SH	R25, 12(SP)
JAL	_FN+0
NOP	
LH	R25, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Home139
NOP	
J	L_Home56
NOP	
L__Home139:
;Kinematics.c,394 :: 		STPS[axis].homing.home = 0;
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
;Kinematics.c,395 :: 		}
L_Home56:
;Kinematics.c,397 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__Home140
NOP	
J	L__Home87
NOP	
L__Home140:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__Home141
NOP	
J	L__Home86
NOP	
L__Home141:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__Home142
NOP	
J	L__Home85
NOP	
L__Home142:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__Home143
NOP	
J	L__Home84
NOP	
L__Home143:
L__Home81:
;Kinematics.c,399 :: 		if(!STPS[axis].homing.home){
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
BEQ	R2, R0, L__Home144
NOP	
J	L_Home60
NOP	
L__Home144:
;Kinematics.c,400 :: 		STPS[axis].homing.home = 1;
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
;Kinematics.c,401 :: 		Home_Axis(-290.00,speed,axis);
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
;Kinematics.c,402 :: 		}
L_Home60:
;Kinematics.c,404 :: 		if((STPS[axis].homing.home_cnt >= 2)&&(!STPS[axis].homing.complete)){
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
BEQ	R2, R0, L__Home145
NOP	
J	L__Home83
NOP	
L__Home145:
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
BEQ	R2, R0, L__Home146
NOP	
J	L__Home82
NOP	
L__Home146:
L__Home80:
;Kinematics.c,405 :: 		STPS[axis].homing.complete      = true;
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
;Kinematics.c,406 :: 		STPS[axis].step_count           = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,407 :: 		STPS[axis].steps_abs_position   = 0;
SEH	R3, R25
ORI	R2, R0, 104
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R0, 0(R2)
;Kinematics.c,404 :: 		if((STPS[axis].homing.home_cnt >= 2)&&(!STPS[axis].homing.complete)){
L__Home83:
L__Home82:
;Kinematics.c,397 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__Home87:
L__Home86:
L__Home85:
L__Home84:
;Kinematics.c,411 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Home
_Home_Axis:
;Kinematics.c,414 :: 		void Home_Axis(double distance,long speed,int axis){
;Kinematics.c,415 :: 		distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S12
BC1F	0, L__Home_Axis148
NOP	
J	L_Home_Axis64
NOP	
L__Home_Axis148:
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
J	L_Home_Axis65
NOP	
L_Home_Axis64:
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
L_Home_Axis65:
; ?FLOC___Home_Axis?T543 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,416 :: 		distance = (distance < 0.0)? distance : -distance;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Home_Axis149
NOP	
J	L_Home_Axis66
NOP	
L__Home_Axis149:
; ?FLOC___Home_Axis?T543 end address is: 8 (R2)
; ?FLOC___Home_Axis?T545 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC___Home_Axis?T545 end address is: 0 (R0)
J	L_Home_Axis67
NOP	
L_Home_Axis66:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S12
; ?FLOC___Home_Axis?T545 start address is: 8 (R2)
MOV.S 	S1, S0
; ?FLOC___Home_Axis?T545 end address is: 8 (R2)
MOV.S 	S0, S1
L_Home_Axis67:
; ?FLOC___Home_Axis?T545 start address is: 0 (R0)
MOV.S 	S12, S0
; ?FLOC___Home_Axis?T545 end address is: 0 (R0)
;Kinematics.c,420 :: 		}
L_end_Home_Axis:
JR	RA
NOP	
; end of _Home_Axis
_Inv_Home_Axis:
;Kinematics.c,422 :: 		void Inv_Home_Axis(double distance,long speed,int axis){
;Kinematics.c,423 :: 		distance = (distance > 10.0)?  10.0 : distance;
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Inv_Home_Axis151
NOP	
J	L_Inv_Home_Axis68
NOP	
L__Inv_Home_Axis151:
LUI	R2, 16672
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T548 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T548 end address is: 8 (R2)
J	L_Inv_Home_Axis69
NOP	
L_Inv_Home_Axis68:
; ?FLOC___Inv_Home_Axis?T548 start address is: 8 (R2)
MOV.S 	S1, S12
; ?FLOC___Inv_Home_Axis?T548 end address is: 8 (R2)
L_Inv_Home_Axis69:
; ?FLOC___Inv_Home_Axis?T548 start address is: 8 (R2)
MOV.S 	S12, S1
;Kinematics.c,424 :: 		distance *= (distance < 0.0)?  -1.0 : 1.0;
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Inv_Home_Axis152
NOP	
J	L_Inv_Home_Axis70
NOP	
L__Inv_Home_Axis152:
; ?FLOC___Inv_Home_Axis?T548 end address is: 8 (R2)
LUI	R2, 49024
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T550 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T550 end address is: 8 (R2)
J	L_Inv_Home_Axis71
NOP	
L_Inv_Home_Axis70:
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___Inv_Home_Axis?T550 start address is: 8 (R2)
MTC1	R2, S1
; ?FLOC___Inv_Home_Axis?T550 end address is: 8 (R2)
L_Inv_Home_Axis71:
; ?FLOC___Inv_Home_Axis?T550 start address is: 8 (R2)
MUL.S 	S0, S12, S1
; ?FLOC___Inv_Home_Axis?T550 end address is: 8 (R2)
MOV.S 	S12, S0
;Kinematics.c,428 :: 		}
L_end_Inv_Home_Axis:
JR	RA
NOP	
; end of _Inv_Home_Axis
