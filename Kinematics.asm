_SetInitialSizes:
;Kinematics.c,25 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,26 :: 		int i = 0;
;Kinematics.c,28 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,30 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes75
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes75:
;Kinematics.c,31 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 100
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
;Kinematics.c,30 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,32 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,33 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,38 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,39 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection77
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection77:
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
J	L_Kinematics_Set_Axisdirection4
NOP	
L_Kinematics_Set_Axisdirection3:
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
L_Kinematics_Set_Axisdirection4:
; ?FLOC__Kinematics_Set_Axisdirection?T17 start address is: 8 (R2)
; dir start address is: 16 (R4)
SEB	R4, R2
; ?FLOC__Kinematics_Set_Axisdirection?T17 end address is: 8 (R2)
;Kinematics.c,40 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,41 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,42 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,43 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,44 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,45 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,46 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,47 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,48 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,49 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,50 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,51 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,52 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,53 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,54 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection79
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection79:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection81
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection81:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection83
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection83:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection85
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection85:
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,55 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,68 :: 		void SingleAxisStep(double newxyz,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,69 :: 		long tempA = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
;Kinematics.c,70 :: 		int dir = 0;
;Kinematics.c,71 :: 		Single_Axis_Enable(axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
;Kinematics.c,72 :: 		tempA = belt_steps(newxyz);
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,73 :: 		speed_cntr_Move(tempA , speed , axis_No);
SW	R5, 12(SP)
SH	R26, 16(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 16(SP)
LW	R5, 12(SP)
;Kinematics.c,78 :: 		Set_Axisdirection(tempA,axis_No);
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,79 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
SLTI	R2, R5, 0
BNE	R2, R0, L__SingleAxisStep87
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep87:
; ?FLOC___SingleAxisStep?T37 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___SingleAxisStep?T37 end address is: 16 (R4)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep12:
; ?FLOC___SingleAxisStep?T37 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___SingleAxisStep?T37 end address is: 16 (R4)
L_SingleAxisStep13:
; ?FLOC___SingleAxisStep?T37 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___SingleAxisStep?T37 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,80 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,81 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R0, 0(R2)
;Kinematics.c,82 :: 		STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 100
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
ORI	R3, R0, 100
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
;Kinematics.c,83 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,84 :: 		STPS[axis_No].mmToTravel = tempA;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R5, 0(R2)
; tempA end address is: 20 (R5)
;Kinematics.c,86 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,88 :: 		}
L_end_SingleAxisStep:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,93 :: 		void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){//,int xyza){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Kinematics.c,96 :: 		SV.over=0;
SW	R27, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,97 :: 		SV.dif = 0;
SW	R0, Offset(_SV+8)(GP)
;Kinematics.c,99 :: 		tempA = belt_steps(axis_a);
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
;Kinematics.c,100 :: 		tempB = belt_steps(axis_b);
SH	R26, 12(SP)
SH	R25, 14(SP)
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
SW	R2, 24(SP)
;Kinematics.c,103 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,104 :: 		Single_Axis_Enable(axisA);
SH	R25, 14(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,105 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,109 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep89
NOP	
J	L_DualAxisStep14
NOP	
L__DualAxisStep89:
;Kinematics.c,110 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,111 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,112 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,113 :: 		}else{
J	L_DualAxisStep15
NOP	
L_DualAxisStep14:
;Kinematics.c,114 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,115 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,116 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,117 :: 		}
L_DualAxisStep15:
;Kinematics.c,120 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,121 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep90
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep90:
; ?FLOC___DualAxisStep?T78 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T78 end address is: 24 (R6)
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
; ?FLOC___DualAxisStep?T78 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T78 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep17:
; ?FLOC___DualAxisStep?T78 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T78 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,122 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,123 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep91
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep91:
; ?FLOC___DualAxisStep?T86 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T86 end address is: 24 (R6)
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T86 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T86 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T86 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T86 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,126 :: 		SV.dA   = tempA - SV.prevA;
LW	R3, Offset(_SV+24)(GP)
LW	R2, 20(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,127 :: 		SV.dB   = tempB - SV.prevB;
LW	R3, Offset(_SV+28)(GP)
LW	R2, 24(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,128 :: 		SV.dC   = tempC - SV.prevC;
LW	R3, Offset(_SV+32)(GP)
LW	R2, 28(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,131 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,132 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,135 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep92
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep92:
;Kinematics.c,136 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep93
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep93:
;Kinematics.c,137 :: 		speed_cntr_Move(tempA,speed,axisA);
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
;Kinematics.c,139 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,140 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,141 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,142 :: 		}
J	L_DualAxisStep22
NOP	
L_DualAxisStep20:
;Kinematics.c,144 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__DualAxisStep94
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep94:
;Kinematics.c,145 :: 		speed_cntr_Move(tempB,speed,axisB);
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
;Kinematics.c,147 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,148 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 4, 1
SB	R2, 0(R3)
;Kinematics.c,149 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Kinematics.c,150 :: 		}
L_DualAxisStep22:
;Kinematics.c,152 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,153 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,154 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,155 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 76
LW	R2, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,157 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,166 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,201 :: 		int axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -280
SW	RA, 0(SP)
LH	R2, 280(SP)
SH	R2, 280(SP)
LH	R2, 282(SP)
SH	R2, 282(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 284(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 285(SP)
;Kinematics.c,203 :: 		double center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 28(SP)
;Kinematics.c,204 :: 		double center_axis1             = position[axis_1] + offset[axis_1];
LH	R2, 280(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 32(SP)
;Kinematics.c,205 :: 		double linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 282(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,206 :: 		double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 36(SP)
;Kinematics.c,207 :: 		double r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 40(SP)
;Kinematics.c,208 :: 		double rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,209 :: 		double rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,210 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,211 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,212 :: 		double angular_travel          = 0.00;
;Kinematics.c,213 :: 		double mm_of_travel            = 0.00;
;Kinematics.c,214 :: 		double rads                    = 0.00;
;Kinematics.c,215 :: 		unsigned int segments          = 0;
;Kinematics.c,216 :: 		double cos_T                   = 0.00;
;Kinematics.c,217 :: 		double sin_T                   = 0.00;
;Kinematics.c,223 :: 		unsigned int i = 0;
;Kinematics.c,224 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 250(SP)
ORI	R30, R0, 3
SB	R30, 252(SP)
MOVZ	R30, R0, R0
SB	R30, 253(SP)
;Kinematics.c,225 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,226 :: 		char limit_error = 0;
;Kinematics.c,228 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 44
LH	R2, 282(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,232 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,234 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc97
NOP	
J	L__mc_arc73
NOP	
L__mc_arc97:
; isclockwise end address is: 28 (R7)
;Kinematics.c,236 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc98
NOP	
J	L_mc_arc25
NOP	
L__mc_arc98:
;Kinematics.c,237 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc26
NOP	
L_mc_arc25:
;Kinematics.c,239 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc99
NOP	
J	L__mc_arc72
NOP	
L__mc_arc99:
;Kinematics.c,240 :: 		angular_travel += 2*M_PI;
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
L__mc_arc72:
;Kinematics.c,239 :: 		if(angular_travel <= 0)
;Kinematics.c,240 :: 		angular_travel += 2*M_PI;
L_mc_arc27:
;Kinematics.c,241 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc26:
;Kinematics.c,242 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S3, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc24
NOP	
L__mc_arc73:
;Kinematics.c,234 :: 		if(isclockwise) {
MOV.S 	S3, S4
;Kinematics.c,242 :: 		}
L_mc_arc24:
;Kinematics.c,245 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,246 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc100
NOP	
J	L_mc_arc28
NOP	
L__mc_arc100:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 48 (R12)
; angular_travel end address is: 24 (R6)
; mm_of_travel end address is: 32 (R8)
J	L_end_mc_arc
NOP	
L_mc_arc28:
;Kinematics.c,248 :: 		segments = (unsigned int)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
SH	R2, 264(SP)
;Kinematics.c,252 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc102
NOP	
J	L_mc_arc29
NOP	
L__mc_arc102:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,253 :: 		feed_rate *= segments;
LHU	R2, 264(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc29:
;Kinematics.c,256 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 264(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S3, S0
SWC1	S2, 256(SP)
;Kinematics.c,260 :: 		linear_per_segment = linear_travel/(double)segments;
DIV.S 	S0, S6, S0
SWC1	S0, 260(SP)
;Kinematics.c,263 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 268(SP)
;Kinematics.c,264 :: 		sin_T = theta_per_segment;
SWC1	S2, 272(SP)
;Kinematics.c,266 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,267 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 280(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,268 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,269 :: 		i = 0;
SH	R0, 276(SP)
;Kinematics.c,271 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
ADDIU	R23, SP, 64
ADDIU	R22, R23, 127
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 64
;Kinematics.c,272 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
LW	R2, 256(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
LW	R2, 300(SP)
SW	R2, 32(SP)
SWC1	S6, 28(SP)
; linear_travel end address is: 48 (R12)
SWC1	S4, 24(SP)
; mm_of_travel end address is: 32 (R8)
SWC1	S3, 20(SP)
; angular_travel end address is: 24 (R6)
LHU	R2, 304(SP)
SH	R2, 16(SP)
SWC1	S13, 12(SP)
LW	R2, 312(SP)
SW	R2, 8(SP)
LW	R2, 308(SP)
SW	R2, 4(SP)
;Kinematics.c,271 :: 		dma_printf("\n[cos_T:=%f : sin_T:=%f][radius:=%f : segments:=%d]\n[angTrav:= %f : mmoftrav:= %f : Lin_trav:= %f]\n[LinPseg:= %f : *pSeg:= %f]",
SW	R3, 0(SP)
;Kinematics.c,272 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel,linear_travel,linear_per_segment,theta_per_segment);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 40
LW	R25, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,274 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc30:
LHU	R3, 264(SP)
LHU	R2, 276(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc103
NOP	
J	L_mc_arc31
NOP	
L__mc_arc103:
;Kinematics.c,276 :: 		if (count < n_arc_correction) {
LBU	R3, 252(SP)
LH	R2, 250(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc104
NOP	
J	L_mc_arc32
NOP	
L__mc_arc104:
;Kinematics.c,278 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 272(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 268(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,279 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 268(SP)
LWC1	S0, 36(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 272(SP)
LWC1	S0, 40(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 36(SP)
;Kinematics.c,280 :: 		r_axis1 = r_axisi;
SWC1	S3, 40(SP)
;Kinematics.c,281 :: 		count++;
LH	R2, 250(SP)
ADDIU	R2, R2, 1
SH	R2, 250(SP)
;Kinematics.c,282 :: 		} else {
J	L_mc_arc33
NOP	
L_mc_arc32:
;Kinematics.c,285 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 276(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 256(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,286 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 276(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 256(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,287 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LH	R2, 280(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 36(SP)
;Kinematics.c,288 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 40(SP)
;Kinematics.c,289 :: 		count = 0;
SH	R0, 250(SP)
;Kinematics.c,290 :: 		}
L_mc_arc33:
;Kinematics.c,293 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 44
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,294 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 280(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,295 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 282(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 260(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,296 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 56(SP)
;Kinematics.c,297 :: 		position[axis_0] = arc_target[axis_0];
SWC1	S1, 0(R2)
;Kinematics.c,298 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 280(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 60(SP)
;Kinematics.c,299 :: 		position[axis_1] = arc_target[axis_1];
SWC1	S1, 0(R2)
;Kinematics.c,301 :: 		STPS[axis_0].step_delay = 1000;
SEH	R3, R28
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,302 :: 		STPS[axis_1].step_delay = 1000;
LH	R3, 280(SP)
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 1000
SW	R2, 0(R3)
;Kinematics.c,305 :: 		if(!DMA_IsOn(1));
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
BEQ	R2, R0, L__mc_arc105
NOP	
J	L_mc_arc34
NOP	
L__mc_arc105:
L_mc_arc34:
;Kinematics.c,306 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
ADDIU	R23, SP, 191
ADDIU	R22, R23, 58
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 191
;Kinematics.c,307 :: 		i,segments,nPx,nPy,tempA,tempB);
LW	R2, 24(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, 48(SP)
SW	R2, 20(SP)
LW	R2, 88(SP)
SW	R2, 16(SP)
LW	R2, 84(SP)
SW	R2, 12(SP)
LHU	R2, 292(SP)
SH	R2, 8(SP)
LHU	R2, 304(SP)
SH	R2, 4(SP)
;Kinematics.c,306 :: 		dma_printf("\ni:= %d : seg: %d : nPx:= %f : nPy:= %f : X:= %l : Y:= %l",
SW	R3, 0(SP)
;Kinematics.c,307 :: 		i,segments,nPx,nPy,tempA,tempB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,310 :: 		SV.cir = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,311 :: 		DualAxisStep(nPx, nPy,axis_0,axis_1,1000);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1000
LH	R26, 280(SP)
SEH	R25, R28
LWC1	S13, 60(SP)
LWC1	S12, 56(SP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,313 :: 		while(1){
L_mc_arc35:
;Kinematics.c,315 :: 		if(Test_Port_Pins(axis_0) || Test_Port_Pins(axis_1)){
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
BEQ	R2, R0, L__mc_arc106
NOP	
J	L__mc_arc69
NOP	
L__mc_arc106:
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LH	R25, 280(SP)
JAL	_Test_Port_Pins+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
BEQ	R2, R0, L__mc_arc107
NOP	
J	L__mc_arc68
NOP	
L__mc_arc107:
J	L_mc_arc39
NOP	
L__mc_arc69:
L__mc_arc68:
;Kinematics.c,316 :: 		disableOCx();
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
;Kinematics.c,317 :: 		limit_error = 1;
ORI	R2, R0, 1
SB	R2, 253(SP)
;Kinematics.c,318 :: 		}
L_mc_arc39:
;Kinematics.c,320 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc108
NOP	
J	L__mc_arc71
NOP	
L__mc_arc108:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc109
NOP	
J	L__mc_arc70
NOP	
L__mc_arc109:
L__mc_arc66:
;Kinematics.c,321 :: 		break;
J	L_mc_arc36
NOP	
;Kinematics.c,320 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc71:
L__mc_arc70:
;Kinematics.c,322 :: 		}
J	L_mc_arc35
NOP	
L_mc_arc36:
;Kinematics.c,326 :: 		if(limit_error)
LBU	R2, 253(SP)
BNE	R2, R0, L__mc_arc111
NOP	
J	L_mc_arc43
NOP	
L__mc_arc111:
;Kinematics.c,327 :: 		break;
J	L_mc_arc31
NOP	
L_mc_arc43:
;Kinematics.c,328 :: 		i++;
LHU	R2, 276(SP)
ADDIU	R2, R2, 1
SH	R2, 276(SP)
;Kinematics.c,329 :: 		}
J	L_mc_arc30
NOP	
L_mc_arc31:
;Kinematics.c,336 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 280
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,341 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,342 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,343 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,351 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,352 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection114
NOP	
J	L_GetAxisDirection44
NOP	
L__GetAxisDirection114:
; ?FLOC___GetAxisDirection?T334 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T334 end address is: 8 (R2)
J	L_GetAxisDirection45
NOP	
L_GetAxisDirection44:
; ?FLOC___GetAxisDirection?T334 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T334 end address is: 8 (R2)
L_GetAxisDirection45:
; ?FLOC___GetAxisDirection?T334 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T334 end address is: 8 (R2)
;Kinematics.c,353 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,365 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,369 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home116
NOP	
J	L_Home46
NOP	
L__Home116:
;Kinematics.c,370 :: 		speed = 1000;//settings.homing_feed_rate;
ORI	R2, R0, 1000
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,373 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,376 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,379 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,382 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,385 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,388 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,391 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home117
NOP	
J	L_Home47
NOP	
L__Home117:
;Kinematics.c,394 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,396 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,397 :: 		}
L_Home47:
;Kinematics.c,401 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,410 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,411 :: 		}
L_Home46:
;Kinematics.c,415 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home118
NOP	
J	L_Home48
NOP	
L__Home118:
;Kinematics.c,423 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home120
NOP	
J	L_Home49
NOP	
L__Home120:
;Kinematics.c,426 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,427 :: 		speed = 100;//settings.homing_seek_rate;
ORI	R2, R0, 100
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,437 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home121
NOP	
J	L_Home50
NOP	
L__Home121:
;Kinematics.c,440 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home122
NOP	
J	L_Home51
NOP	
L__Home122:
;Kinematics.c,443 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home123
NOP	
J	L_Home52
NOP	
L__Home123:
;Kinematics.c,445 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,446 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,449 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,451 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home53
NOP	
L_Home52:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home124
NOP	
J	L_Home54
NOP	
L__Home124:
;Kinematics.c,453 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,454 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,455 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,456 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,457 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,468 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,469 :: 		}
L_Home54:
L_Home53:
;Kinematics.c,470 :: 		}
L_Home51:
;Kinematics.c,475 :: 		}
L_Home50:
;Kinematics.c,476 :: 		}
L_Home49:
;Kinematics.c,484 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home126
NOP	
J	L_Home55
NOP	
L__Home126:
;Kinematics.c,487 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,488 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home128
NOP	
J	L_Home56
NOP	
L__Home128:
;Kinematics.c,489 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,490 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,491 :: 		}
L_Home56:
;Kinematics.c,500 :: 		}
L_Home55:
;Kinematics.c,501 :: 		}
L_Home48:
;Kinematics.c,502 :: 		return axis;
SEH	R2, R25
;Kinematics.c,503 :: 		}
;Kinematics.c,502 :: 		return axis;
;Kinematics.c,503 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,506 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,508 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,509 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Kinematics.c,519 :: 		STPS[axis].mmToTravel = belt_steps(distance);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R2, 16(SP)
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_belt_steps+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,520 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
LW	R2, 0(R2)
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,521 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,523 :: 		static void ResetHoming(){
;Kinematics.c,524 :: 		int i = 0;
;Kinematics.c,525 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming57:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming131
NOP	
J	L_Kinematics_ResetHoming58
NOP	
L_Kinematics_ResetHoming131:
;Kinematics.c,526 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,527 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,525 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,528 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming57
NOP	
L_Kinematics_ResetHoming58:
;Kinematics.c,529 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,536 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,538 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset133
NOP	
J	L_mc_reset60
NOP	
L__mc_reset133:
;Kinematics.c,539 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,549 :: 		switch (sys.state) {
J	L_mc_reset61
NOP	
;Kinematics.c,550 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset63:
L_mc_reset64:
L_mc_reset65:
;Kinematics.c,551 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,552 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,553 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,554 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,555 :: 		}
J	L_mc_reset62
NOP	
L_mc_reset61:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset135
NOP	
J	L_mc_reset63
NOP	
L__mc_reset135:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset137
NOP	
J	L_mc_reset64
NOP	
L__mc_reset137:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset139
NOP	
J	L_mc_reset65
NOP	
L__mc_reset139:
L_mc_reset62:
;Kinematics.c,556 :: 		}
L_mc_reset60:
;Kinematics.c,557 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
