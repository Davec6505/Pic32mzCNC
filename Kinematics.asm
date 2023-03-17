_SetInitialSizes:
;Kinematics.c,32 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,33 :: 		int i = 0;
;Kinematics.c,35 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,37 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__SetInitialSizes76
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes76:
;Kinematics.c,38 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
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
;Kinematics.c,37 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,39 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,40 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,45 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,46 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection78
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection78:
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
;Kinematics.c,47 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,48 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,49 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,50 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,51 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,52 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,53 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,54 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,55 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,56 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,57 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,58 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,59 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,60 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,61 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection80
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection80:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection82
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection82:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection84
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection84:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection86
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection86:
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,62 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,75 :: 		void SingleAxisStep(double newxyz,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,76 :: 		long  absxyz = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
;Kinematics.c,77 :: 		long  tempA  = 0;
;Kinematics.c,78 :: 		int   dir    = 0;
;Kinematics.c,80 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep88
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep88:
;Kinematics.c,82 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,85 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,94 :: 		}else{
; tempA end address is: 20 (R5)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep12:
;Kinematics.c,95 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
; tempA end address is: 20 (R5)
;Kinematics.c,96 :: 		}
L_SingleAxisStep13:
;Kinematics.c,98 :: 		Single_Axis_Enable(axis_No);
; tempA start address is: 20 (R5)
SW	R5, 12(SP)
SH	R26, 16(SP)
SW	R25, 20(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
LW	R5, 12(SP)
;Kinematics.c,99 :: 		speed_cntr_Move(tempA , speed , axis_No);
SW	R5, 12(SP)
SH	R26, 16(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R5, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 16(SP)
LW	R5, 12(SP)
;Kinematics.c,104 :: 		Set_Axisdirection(tempA,axis_No);
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,105 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 96
SLTI	R2, R5, 0
BNE	R2, R0, L__SingleAxisStep89
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep89:
; ?FLOC___SingleAxisStep?T46 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___SingleAxisStep?T46 end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep14:
; ?FLOC___SingleAxisStep?T46 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___SingleAxisStep?T46 end address is: 16 (R4)
L_SingleAxisStep15:
; ?FLOC___SingleAxisStep?T46 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___SingleAxisStep?T46 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,106 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,107 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R0, 0(R2)
;Kinematics.c,108 :: 		STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
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
;Kinematics.c,109 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,110 :: 		STPS[axis_No].mmToTravel = tempA;
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
;Kinematics.c,112 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,114 :: 		}
L_end_SingleAxisStep:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,119 :: 		void DualAxisStep(double axis_a,double axis_b,int axisA,int axisB,long speed){//,int xyza){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Kinematics.c,124 :: 		if(gc.absolute_mode == true){
SW	R27, 4(SP)
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep91
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep91:
;Kinematics.c,126 :: 		tempA = belt_steps(axis_a,axisA);//ulong2flt( STPS[axisA].steps_abs_position);
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
;Kinematics.c,127 :: 		tempB = belt_steps(axis_b,axisB);//ulong2flt( STPS[axisB].steps_abs_position);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,129 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R4, 0(R3)
LW	R3, 20(SP)
SUBU	R3, R3, R4
SW	R3, 20(SP)
;Kinematics.c,130 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 80
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 24(SP)
;Kinematics.c,131 :: 		}else{
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
;Kinematics.c,132 :: 		tempA = belt_steps(axis_a,axisA);
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
;Kinematics.c,133 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
SW	R2, 24(SP)
;Kinematics.c,134 :: 		}
L_DualAxisStep17:
;Kinematics.c,135 :: 		SV.over=0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,136 :: 		SV.dif = 0;
SW	R0, Offset(_SV+8)(GP)
;Kinematics.c,139 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,140 :: 		Single_Axis_Enable(axisA);
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,141 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,145 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep92
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep92:
;Kinematics.c,146 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,147 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,148 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,149 :: 		}else{
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
;Kinematics.c,150 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,151 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,152 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,153 :: 		}
L_DualAxisStep19:
;Kinematics.c,156 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,157 :: 		STPS[axisA].axis_dir = Direction(tempA);
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
BNE	R2, R0, L__DualAxisStep93
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep93:
; ?FLOC___DualAxisStep?T104 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T104 end address is: 24 (R6)
J	L_DualAxisStep21
NOP	
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T104 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T104 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T104 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T104 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,158 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,159 :: 		STPS[axisB].axis_dir = Direction(tempB);
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
BNE	R2, R0, L__DualAxisStep94
NOP	
J	L_DualAxisStep22
NOP	
L__DualAxisStep94:
; ?FLOC___DualAxisStep?T112 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T112 end address is: 24 (R6)
J	L_DualAxisStep23
NOP	
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T112 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T112 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,162 :: 		SV.dA   = tempA - SV.prevA;
LW	R3, Offset(_SV+24)(GP)
LW	R2, 20(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,163 :: 		SV.dB   = tempB - SV.prevB;
LW	R3, Offset(_SV+28)(GP)
LW	R2, 24(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,164 :: 		SV.dC   = tempC - SV.prevC;
LW	R3, Offset(_SV+32)(GP)
LW	R2, 28(SP)
SUBU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,167 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,168 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,171 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep95
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep95:
;Kinematics.c,172 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep96
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep96:
;Kinematics.c,173 :: 		speed_cntr_Move(tempA,speed,axisA);
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
;Kinematics.c,175 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,176 :: 		STPS[axisA].master = 1;
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
;Kinematics.c,177 :: 		STPS[axisB].master = 0;
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
;Kinematics.c,178 :: 		}
J	L_DualAxisStep26
NOP	
L_DualAxisStep24:
;Kinematics.c,180 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep97
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep97:
;Kinematics.c,181 :: 		speed_cntr_Move(tempB,speed,axisB);
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
;Kinematics.c,183 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,184 :: 		STPS[axisA].master = 0;
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
;Kinematics.c,185 :: 		STPS[axisB].master = 1;
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
;Kinematics.c,186 :: 		}
L_DualAxisStep26:
;Kinematics.c,188 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,189 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,190 :: 		STPS[axisA].mmToTravel = tempA;
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
;Kinematics.c,191 :: 		STPS[axisB].mmToTravel = tempB;
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
;Kinematics.c,193 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,202 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,238 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -352
SW	RA, 0(SP)
LH	R2, 352(SP)
SH	R2, 352(SP)
LH	R2, 354(SP)
SH	R2, 354(SP)
LW	R2, 356(SP)
SW	R2, 356(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 360(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 361(SP)
;Kinematics.c,240 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 32(SP)
;Kinematics.c,241 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
LH	R2, 352(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 36(SP)
;Kinematics.c,242 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 354(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 192 (R48)
MOV.S 	S24, S0
;Kinematics.c,243 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 40(SP)
;Kinematics.c,244 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 44(SP)
;Kinematics.c,245 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,246 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,247 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,248 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,249 :: 		float angular_travel          = 0.00;
;Kinematics.c,250 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,251 :: 		float rads                    = 0.00;
;Kinematics.c,252 :: 		long  segments                = 0;
;Kinematics.c,253 :: 		float cos_T                   = 0.00;
;Kinematics.c,254 :: 		float sin_T                   = 0.00;
;Kinematics.c,260 :: 		long i                         = 0;
;Kinematics.c,261 :: 		int count = 0;
MOVZ	R30, R0, R0
SH	R30, 320(SP)
ORI	R30, R0, 3
SB	R30, 322(SP)
MOVZ	R30, R0, R0
SB	R30, 323(SP)
;Kinematics.c,262 :: 		char n_arc_correction = 3; //to be sorted int global struct???
;Kinematics.c,263 :: 		char limit_error = 0;
;Kinematics.c,265 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 48
LH	R2, 354(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,270 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
LWC1	S0, 40(SP)
MUL.S 	S1, S0, S3
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S4
ADD.S 	S2, S1, S0
LWC1	S0, 40(SP)
MUL.S 	S1, S0, S4
; rt_axis1 end address is: 32 (R8)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S3
; rt_axis0 end address is: 24 (R6)
SUB.S 	S0, S1, S0
SWC1	S12, 4(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 4(SP)
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,273 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc100
NOP	
J	L__mc_arc74
NOP	
L__mc_arc100:
; isclockwise end address is: 28 (R7)
;Kinematics.c,275 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc101
NOP	
J	L_mc_arc29
NOP	
L__mc_arc101:
;Kinematics.c,276 :: 		angular_travel -= 2*M_PI;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc30
NOP	
L_mc_arc29:
;Kinematics.c,278 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc102
NOP	
J	L__mc_arc73
NOP	
L__mc_arc102:
;Kinematics.c,279 :: 		angular_travel += 2*M_PI;
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
L__mc_arc73:
;Kinematics.c,278 :: 		if(angular_travel <= 0)
;Kinematics.c,279 :: 		angular_travel += 2*M_PI;
L_mc_arc31:
;Kinematics.c,280 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc30:
;Kinematics.c,281 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S21, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc28
NOP	
L__mc_arc74:
;Kinematics.c,273 :: 		if(isclockwise) {
MOV.S 	S21, S4
;Kinematics.c,281 :: 		}
L_mc_arc28:
;Kinematics.c,284 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 168 (R42)
SWC1	S12, 4(SP)
MOV.S 	S12, S24
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S21, S12
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
SWC1	S0, 332(SP)
;Kinematics.c,285 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc103
NOP	
J	L_mc_arc32
NOP	
L__mc_arc103:
; invert_feed_rate end address is: 24 (R6)
; angular_travel end address is: 168 (R42)
; linear_travel end address is: 192 (R48)
J	L_end_mc_arc
NOP	
L_mc_arc32:
;Kinematics.c,287 :: 		segments = (long)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; linear_travel start address is: 192 (R48)
; angular_travel start address is: 168 (R42)
; invert_feed_rate start address is: 24 (R6)
LWC1	S1, 332(SP)
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S1, S0
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, 336(SP)
;Kinematics.c,292 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc105
NOP	
J	L_mc_arc33
NOP	
L__mc_arc105:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,293 :: 		feed_rate *= segments;
LW	R3, 336(SP)
LW	R2, 356(SP)
MUL	R2, R2, R3
SW	R2, 356(SP)
L_mc_arc33:
;Kinematics.c,296 :: 		theta_per_segment = angular_travel/(float)segments;
LWC1	S0, 336(SP)
CVT32.W 	S0, S0
DIV.S 	S2, S21, S0
SWC1	S2, 324(SP)
;Kinematics.c,301 :: 		linear_per_segment = linear_travel/(float)segments;
DIV.S 	S0, S24, S0
SWC1	S0, 328(SP)
;Kinematics.c,304 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 340(SP)
;Kinematics.c,305 :: 		sin_T = theta_per_segment;
SWC1	S2, 344(SP)
;Kinematics.c,307 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 48
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,308 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,309 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,310 :: 		i = 0;
SW	R0, 348(SP)
; angular_travel end address is: 168 (R42)
; linear_travel end address is: 192 (R48)
;Kinematics.c,313 :: 		while(DMA_IsOn(1));
L_mc_arc34:
; angular_travel start address is: 168 (R42)
; linear_travel start address is: 192 (R48)
SWC1	S24, 4(SP)
SWC1	S21, 8(SP)
SH	R28, 12(SP)
SW	R27, 16(SP)
SW	R26, 20(SP)
SW	R25, 24(SP)
SWC1	S12, 28(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 28(SP)
LW	R25, 24(SP)
LW	R26, 20(SP)
LW	R27, 16(SP)
LH	R28, 12(SP)
LWC1	S21, 8(SP)
LWC1	S24, 4(SP)
BNE	R2, R0, L__mc_arc107
NOP	
J	L_mc_arc35
NOP	
L__mc_arc107:
J	L_mc_arc34
NOP	
L_mc_arc35:
;Kinematics.c,316 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
ADDIU	R23, SP, 68
ADDIU	R22, R23, 145
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 68
;Kinematics.c,318 :: 		,linear_travel,linear_per_segment,theta_per_segment,gc.frequency);
LW	R2, Offset(_gc+20)(GP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -44
SW	R2, 40(SP)
LW	R2, 368(SP)
SW	R2, 36(SP)
LW	R2, 372(SP)
SW	R2, 32(SP)
SWC1	S24, 28(SP)
; linear_travel end address is: 192 (R48)
;Kinematics.c,317 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel
LW	R2, 376(SP)
SW	R2, 24(SP)
SWC1	S21, 20(SP)
; angular_travel end address is: 168 (R42)
LW	R2, 380(SP)
SW	R2, 16(SP)
SWC1	S12, 12(SP)
LW	R2, 388(SP)
SW	R2, 8(SP)
LW	R2, 384(SP)
SW	R2, 4(SP)
;Kinematics.c,316 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
SW	R3, 0(SP)
;Kinematics.c,318 :: 		,linear_travel,linear_per_segment,theta_per_segment,gc.frequency);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 44
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,321 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc36:
LW	R3, 336(SP)
LW	R2, 348(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc108
NOP	
J	L_mc_arc37
NOP	
L__mc_arc108:
;Kinematics.c,323 :: 		if (count < n_arc_correction) {
LBU	R3, 322(SP)
LH	R2, 320(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc109
NOP	
J	L_mc_arc38
NOP	
L__mc_arc109:
;Kinematics.c,325 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 344(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 340(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,326 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 340(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 344(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 40(SP)
;Kinematics.c,327 :: 		r_axis1 = r_axisi;
SWC1	S3, 44(SP)
;Kinematics.c,328 :: 		count++;
LH	R2, 320(SP)
ADDIU	R2, R2, 1
SH	R2, 320(SP)
;Kinematics.c,329 :: 		} else {
J	L_mc_arc39
NOP	
L_mc_arc38:
;Kinematics.c,332 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S0, 348(SP)
CVT32.W 	S1, S0
LWC1	S0, 324(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,333 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S0, 348(SP)
CVT32.W 	S1, S0
LWC1	S0, 324(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,334 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 40(SP)
;Kinematics.c,335 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 44(SP)
;Kinematics.c,336 :: 		count = 0;
SH	R0, 320(SP)
;Kinematics.c,337 :: 		}
L_mc_arc39:
;Kinematics.c,340 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 48
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,341 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 44(SP)
LWC1	S0, 36(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,342 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 354(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 328(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,343 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S4, 0(R2)
SUB.S 	S3, S0, S4
;Kinematics.c,344 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 352(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S2, 0(R2)
SUB.S 	S1, S0, S2
;Kinematics.c,346 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
ADD.S 	S0, S3, S4
SWC1	S0, 60(SP)
;Kinematics.c,347 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
ADD.S 	S0, S1, S2
SWC1	S0, 64(SP)
;Kinematics.c,350 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc111
NOP	
J	L_mc_arc40
NOP	
L__mc_arc111:
;Kinematics.c,351 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
LW	R2, 356(SP)
SW	R2, 0(R3)
;Kinematics.c,352 :: 		STPS[axis_1].step_delay = feed_rate;
LH	R3, 352(SP)
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
LW	R2, 356(SP)
SW	R2, 0(R3)
;Kinematics.c,353 :: 		}
L_mc_arc40:
;Kinematics.c,355 :: 		SV.cir = 1;//to indicate DualAxisStep of circle!!!
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_SV+2)(GP)
;Kinematics.c,356 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LW	R27, 356(SP)
LH	R26, 352(SP)
SEH	R25, R28
LWC1	S13, 64(SP)
LWC1	S12, 60(SP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,358 :: 		while(1){
L_mc_arc41:
;Kinematics.c,365 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc112
NOP	
J	L__mc_arc72
NOP	
L__mc_arc112:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc113
NOP	
J	L__mc_arc71
NOP	
L__mc_arc113:
L__mc_arc70:
;Kinematics.c,366 :: 		break;
J	L_mc_arc42
NOP	
;Kinematics.c,365 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc72:
L__mc_arc71:
;Kinematics.c,367 :: 		}
J	L_mc_arc41
NOP	
L_mc_arc42:
;Kinematics.c,371 :: 		if(limit_error)
LBU	R2, 323(SP)
BNE	R2, R0, L__mc_arc115
NOP	
J	L_mc_arc46
NOP	
L__mc_arc115:
;Kinematics.c,372 :: 		break;
J	L_mc_arc37
NOP	
L_mc_arc46:
;Kinematics.c,373 :: 		i++;
LW	R2, 348(SP)
ADDIU	R2, R2, 1
SW	R2, 348(SP)
;Kinematics.c,375 :: 		if(!DMA_IsOn(1)){
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
BEQ	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc47
NOP	
L__mc_arc116:
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LH	R2, 352(SP)
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
;Kinematics.c,377 :: 		[ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
ADDIU	R23, SP, 213
ADDIU	R22, R23, 106
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 213
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LW	R2, 356(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
SWC1	S1, 24(SP)
SWC1	S0, 20(SP)
LW	R2, 96(SP)
SW	R2, 16(SP)
LW	R2, 92(SP)
SW	R2, 12(SP)
LW	R2, 368(SP)
SW	R2, 8(SP)
LW	R2, 380(SP)
SW	R2, 4(SP)
;Kinematics.c,377 :: 		[ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
SW	R3, 0(SP)
;Kinematics.c,378 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,379 :: 		}
L_mc_arc47:
;Kinematics.c,382 :: 		}
J	L_mc_arc36
NOP	
L_mc_arc37:
;Kinematics.c,383 :: 		report_status_message(STATUS_OK);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,390 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 352
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,394 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,395 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,396 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,404 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,405 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection119
NOP	
J	L_GetAxisDirection48
NOP	
L__GetAxisDirection119:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
J	L_GetAxisDirection49
NOP	
L_GetAxisDirection48:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
L_GetAxisDirection49:
; ?FLOC___GetAxisDirection?T361 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T361 end address is: 8 (R2)
;Kinematics.c,406 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,418 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,422 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home121
NOP	
J	L_Home50
NOP	
L__Home121:
;Kinematics.c,423 :: 		speed = 1000;//settings.homing_feed_rate;
ORI	R2, R0, 1000
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,426 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,429 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,432 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,435 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,438 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,441 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,444 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home122
NOP	
J	L_Home51
NOP	
L__Home122:
;Kinematics.c,446 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,448 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,449 :: 		}
L_Home51:
;Kinematics.c,453 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,462 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,463 :: 		}
L_Home50:
;Kinematics.c,467 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home123
NOP	
J	L_Home52
NOP	
L__Home123:
;Kinematics.c,472 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home125
NOP	
J	L_Home53
NOP	
L__Home125:
;Kinematics.c,475 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,476 :: 		speed = 100;//settings.homing_seek_rate;
ORI	R2, R0, 100
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,485 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home126
NOP	
J	L_Home54
NOP	
L__Home126:
;Kinematics.c,487 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home127
NOP	
J	L_Home55
NOP	
L__Home127:
;Kinematics.c,490 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home128
NOP	
J	L_Home56
NOP	
L__Home128:
;Kinematics.c,492 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,493 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,496 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,498 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home57
NOP	
L_Home56:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home129
NOP	
J	L_Home58
NOP	
L__Home129:
;Kinematics.c,500 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,501 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,502 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,504 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,507 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,519 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,520 :: 		}
L_Home58:
L_Home57:
;Kinematics.c,521 :: 		}
L_Home55:
;Kinematics.c,526 :: 		}
L_Home54:
;Kinematics.c,527 :: 		}
L_Home53:
;Kinematics.c,535 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home131
NOP	
J	L_Home59
NOP	
L__Home131:
;Kinematics.c,537 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,538 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home133
NOP	
J	L_Home60
NOP	
L__Home133:
;Kinematics.c,539 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,540 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,541 :: 		}
L_Home60:
;Kinematics.c,550 :: 		}
L_Home59:
;Kinematics.c,551 :: 		}
L_Home52:
;Kinematics.c,552 :: 		return axis;
SEH	R2, R25
;Kinematics.c,553 :: 		}
;Kinematics.c,552 :: 		return axis;
;Kinematics.c,553 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,556 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,558 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,559 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Kinematics.c,569 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
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
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,570 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
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
;Kinematics.c,571 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,573 :: 		static void ResetHoming(){
;Kinematics.c,574 :: 		int i = 0;
;Kinematics.c,575 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming61:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L_Kinematics_ResetHoming136
NOP	
J	L_Kinematics_ResetHoming62
NOP	
L_Kinematics_ResetHoming136:
;Kinematics.c,576 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,577 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,575 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,578 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming61
NOP	
L_Kinematics_ResetHoming62:
;Kinematics.c,579 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,586 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,588 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset138
NOP	
J	L_mc_reset64
NOP	
L__mc_reset138:
;Kinematics.c,589 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+18)(GP)
;Kinematics.c,599 :: 		switch (sys.state) {
J	L_mc_reset65
NOP	
;Kinematics.c,600 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset67:
L_mc_reset68:
L_mc_reset69:
;Kinematics.c,601 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+18)(GP)
;Kinematics.c,602 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,603 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,604 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,605 :: 		}
J	L_mc_reset66
NOP	
L_mc_reset65:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset140
NOP	
J	L_mc_reset67
NOP	
L__mc_reset140:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset142
NOP	
J	L_mc_reset68
NOP	
L__mc_reset142:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset144
NOP	
J	L_mc_reset69
NOP	
L__mc_reset144:
L_mc_reset66:
;Kinematics.c,606 :: 		}
L_mc_reset64:
;Kinematics.c,607 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
