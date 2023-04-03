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
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes74
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes74:
;Kinematics.c,38 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 88
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection76
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection76:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection78
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection78:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection80
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection80:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection82
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection82:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection84
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection84:
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
;Kinematics.c,76 :: 		void SingleAxisStep(float newxyz,long speed,int axis_No){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,77 :: 		long  absxyz = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,78 :: 		long  tempA  = 0;
;Kinematics.c,79 :: 		int   dir    = 0;
;Kinematics.c,88 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep86
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep86:
;Kinematics.c,90 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 16(SP)
SW	R25, 20(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
;Kinematics.c,93 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 8 (R2)
;Kinematics.c,95 :: 		}else{
; tempA end address is: 8 (R2)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep12:
;Kinematics.c,96 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 16(SP)
SW	R25, 20(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
; tempA end address is: 12 (R3)
MOVZ	R2, R3, R0
;Kinematics.c,97 :: 		}
L_SingleAxisStep13:
;Kinematics.c,99 :: 		SingleAxisStart(tempA,speed,axis_No);
; tempA start address is: 8 (R2)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
; tempA end address is: 8 (R2)
JAL	Kinematics_SingleAxisStart+0
NOP	
;Kinematics.c,101 :: 		}
L_end_SingleAxisStep:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SingleAxisStep
Kinematics_SingleAxisStart:
;Kinematics.c,103 :: 		static void SingleAxisStart(long dist,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,105 :: 		Single_Axis_Enable(axis_No);
SW	R25, 4(SP)
SW	R26, 8(SP)
SH	R27, 12(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
SEH	R25, R27
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LH	R27, 12(SP)
;Kinematics.c,106 :: 		speed_cntr_Move(dist , speed , axis_No);
SH	R27, 12(SP)
SW	R25, 16(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LH	R27, 12(SP)
;Kinematics.c,111 :: 		Set_Axisdirection(dist,axis_No);
SEH	R26, R27
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,112 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart88
NOP	
J	L_Kinematics_SingleAxisStart14
NOP	
L_Kinematics_SingleAxisStart88:
; ?FLOC__Kinematics_SingleAxisStart?T46 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T46 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart15
NOP	
L_Kinematics_SingleAxisStart14:
; ?FLOC__Kinematics_SingleAxisStart?T46 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T46 end address is: 16 (R4)
L_Kinematics_SingleAxisStart15:
; ?FLOC__Kinematics_SingleAxisStart?T46 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T46 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,113 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+2)(GP)
;Kinematics.c,114 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Kinematics.c,115 :: 		STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R2, 24(SP)
JAL	_labs+0
NOP	
SEH	R4, R27
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 52
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 24(SP)
SW	R3, 0(R2)
;Kinematics.c,116 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,117 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R25, 0(R2)
;Kinematics.c,119 :: 		Step_Cycle(axis_No);
SEH	R25, R27
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,120 :: 		}
L_end_SingleAxisStart:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,125 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,long speed){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,131 :: 		if(gc.absolute_mode == true){
SW	R27, 4(SP)
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep90
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep90:
;Kinematics.c,133 :: 		tempA = belt_steps(axis_a,axisA);
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,134 :: 		tempB = belt_steps(axis_b,axisB);
SW	R5, 8(SP)
SW	R27, 12(SP)
SH	R26, 16(SP)
SH	R25, 18(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 18(SP)
LH	R26, 16(SP)
LW	R27, 12(SP)
LW	R5, 8(SP)
;Kinematics.c,144 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R3, R5, R3
; tempA end address is: 20 (R5)
; tempA start address is: 24 (R6)
MOVZ	R6, R3, R0
;Kinematics.c,145 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempB start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,152 :: 		}else{
; tempB end address is: 20 (R5)
; tempA end address is: 24 (R6)
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
;Kinematics.c,153 :: 		tempA = belt_steps(axis_a,axisA);
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,154 :: 		tempB = belt_steps(axis_b,axisB);
SW	R3, 8(SP)
SW	R27, 12(SP)
SH	R26, 16(SP)
SH	R25, 18(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 18(SP)
LH	R26, 16(SP)
LW	R27, 12(SP)
LW	R3, 8(SP)
; tempB start address is: 20 (R5)
MOVZ	R5, R2, R0
; tempA end address is: 12 (R3)
; tempB end address is: 20 (R5)
MOVZ	R6, R3, R0
;Kinematics.c,155 :: 		}
L_DualAxisStep17:
;Kinematics.c,156 :: 		SV.over = 0;
; tempB start address is: 20 (R5)
; tempA start address is: 24 (R6)
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,157 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+20)(GP)
;Kinematics.c,160 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,161 :: 		Single_Axis_Enable(axisA);
SW	R6, 8(SP)
SW	R5, 12(SP)
SW	R27, 16(SP)
SH	R26, 20(SP)
SH	R25, 22(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 22(SP)
LH	R26, 20(SP)
;Kinematics.c,162 :: 		Single_Axis_Enable(axisB);
SH	R26, 20(SP)
SH	R25, 22(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 22(SP)
LH	R26, 20(SP)
LW	R27, 16(SP)
LW	R5, 12(SP)
LW	R6, 8(SP)
;Kinematics.c,166 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep91
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep91:
;Kinematics.c,167 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,168 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,169 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,170 :: 		}else{
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
;Kinematics.c,171 :: 		SV.prevA = 0;//tempA;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,172 :: 		SV.prevB = 0;//tempB;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,173 :: 		SV.prevC = 0;//tempC;
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,174 :: 		}
L_DualAxisStep19:
;Kinematics.c,177 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
MOVZ	R25, R6, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,178 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R6, 0
BNE	R2, R0, L__DualAxisStep92
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep92:
; ?FLOC___DualAxisStep?T104 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T104 end address is: 16 (R4)
J	L_DualAxisStep21
NOP	
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T104 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T104 end address is: 16 (R4)
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T104 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T104 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,179 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,180 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R5, 0
BNE	R2, R0, L__DualAxisStep93
NOP	
J	L_DualAxisStep22
NOP	
L__DualAxisStep93:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
J	L_DualAxisStep23
NOP	
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T112 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T112 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,183 :: 		SV.dA   = tempA;// - SV.prevA;
SW	R6, Offset(_SV+24)(GP)
;Kinematics.c,184 :: 		SV.dB   = tempB;// - SV.prevB;
SW	R5, Offset(_SV+28)(GP)
;Kinematics.c,185 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 24(SP)
SW	R2, Offset(_SV+32)(GP)
;Kinematics.c,188 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,189 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+28)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+28)(GP)
;Kinematics.c,197 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+24)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__DualAxisStep94
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep94:
;Kinematics.c,198 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep95
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep95:
;Kinematics.c,199 :: 		speed_cntr_Move(tempA,speed,axisA);
SW	R6, 8(SP)
SW	R5, 12(SP)
SH	R26, 16(SP)
SH	R25, 18(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
MOVZ	R25, R6, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 18(SP)
LH	R26, 16(SP)
LW	R5, 12(SP)
LW	R6, 8(SP)
;Kinematics.c,201 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,202 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 28
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,203 :: 		}
L_DualAxisStep25:
;Kinematics.c,205 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,206 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,207 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,208 :: 		}else{
J	L_DualAxisStep26
NOP	
L_DualAxisStep24:
;Kinematics.c,209 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep96
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep96:
;Kinematics.c,210 :: 		speed_cntr_Move(tempB,speed,axisB);
SW	R6, 8(SP)
SW	R5, 12(SP)
SH	R26, 16(SP)
SH	R25, 18(SP)
SW	R27, 20(SP)
MOVZ	R25, R5, R0
SEH	R27, R26
LW	R26, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 18(SP)
LH	R26, 16(SP)
LW	R5, 12(SP)
LW	R6, 8(SP)
;Kinematics.c,212 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,213 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 28
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,214 :: 		}
L_DualAxisStep27:
;Kinematics.c,216 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,217 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,218 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,219 :: 		}
L_DualAxisStep26:
;Kinematics.c,221 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,222 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,223 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R6, 0(R2)
; tempA end address is: 24 (R6)
;Kinematics.c,224 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R5, 0(R2)
; tempB end address is: 20 (R5)
;Kinematics.c,226 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,228 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,264 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
; axis_1 start address is: 24 (R6)
LH	R6, 88(SP)
; axis_linear start address is: 28 (R7)
LH	R7, 90(SP)
; feed_rate start address is: 44 (R11)
LW	R11, 92(SP)
; invert_feed_rate start address is: 48 (R12)
LBU	R12, 96(SP)
; isclockwise start address is: 40 (R10)
LBU	R10, 97(SP)
;Kinematics.c,266 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
; center_axis0 start address is: 48 (R12)
MOV.S 	S6, S4
;Kinematics.c,267 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
; center_axis1 start address is: 56 (R14)
MOV.S 	S7, S2
;Kinematics.c,268 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
SEH	R2, R7
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,269 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
; r_axis0 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,270 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; r_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,271 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,272 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 72 (R18)
MOV.S 	S9, S0
;Kinematics.c,273 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,274 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,275 :: 		float angular_travel          = 0.00;
;Kinematics.c,276 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,277 :: 		float rads                    = 0.00;
;Kinematics.c,278 :: 		long  segments                = 0;
;Kinematics.c,279 :: 		float cos_T                   = 0.00;
;Kinematics.c,280 :: 		float sin_T                   = 0.00;
;Kinematics.c,286 :: 		long i                         = 0;
;Kinematics.c,287 :: 		int count = 0;
; count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Kinematics.c,288 :: 		char n_arc_correction = 3; //to be sorted int global struct???
; n_arc_correction start address is: 32 (R8)
ORI	R8, R0, 3
;Kinematics.c,289 :: 		char limit_error = 0;
; limit_error start address is: 36 (R9)
MOVZ	R9, R0, R0
;Kinematics.c,291 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 76
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,296 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
MUL.S 	S1, S5, S4
MUL.S 	S0, S3, S9
ADD.S 	S2, S1, S0
MUL.S 	S1, S5, S9
; rt_axis1 end address is: 72 (R18)
MUL.S 	S0, S3, S4
; rt_axis0 end address is: 32 (R8)
SUB.S 	S0, S1, S0
SWC1	S12, 4(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 4(SP)
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,299 :: 		if(isclockwise) {
BNE	R10, R0, L__mc_arc99
NOP	
J	L__mc_arc71
NOP	
L__mc_arc99:
; isclockwise end address is: 40 (R10)
;Kinematics.c,301 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc100
NOP	
J	L_mc_arc29
NOP	
L__mc_arc100:
;Kinematics.c,302 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
J	L_mc_arc30
NOP	
L_mc_arc29:
;Kinematics.c,304 :: 		if(angular_travel <= 0)
; angular_travel start address is: 32 (R8)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc101
NOP	
J	L__mc_arc70
NOP	
L__mc_arc101:
;Kinematics.c,305 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc31
NOP	
L__mc_arc70:
;Kinematics.c,304 :: 		if(angular_travel <= 0)
MOV.S 	S0, S4
;Kinematics.c,305 :: 		angular_travel += PIx2;
L_mc_arc31:
;Kinematics.c,306 :: 		}
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
L_mc_arc30:
;Kinematics.c,307 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
J	L_mc_arc28
NOP	
L__mc_arc71:
;Kinematics.c,299 :: 		if(isclockwise) {
;Kinematics.c,307 :: 		}
L_mc_arc28:
;Kinematics.c,310 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 32 (R8)
SWC1	S12, 4(SP)
MOV.S 	S12, S8
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S4, S12
SW	R25, 4(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LW	R25, 4(SP)
; mm_of_travel start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,311 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc102
NOP	
J	L_mc_arc32
NOP	
L__mc_arc102:
; axis_linear end address is: 28 (R7)
; invert_feed_rate end address is: 48 (R12)
; center_axis0 end address is: 48 (R12)
; center_axis1 end address is: 56 (R14)
; linear_travel end address is: 64 (R16)
; r_axis0 end address is: 40 (R10)
; count end address is: 20 (R5)
; n_arc_correction end address is: 32 (R8)
; angular_travel end address is: 32 (R8)
; mm_of_travel end address is: 16 (R4)
; feed_rate end address is: 44 (R11)
; r_axis1 end address is: 24 (R6)
; axis_1 end address is: 24 (R6)
; limit_error end address is: 36 (R9)
J	L_end_mc_arc
NOP	
L_mc_arc32:
;Kinematics.c,313 :: 		segments = (long)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; limit_error start address is: 36 (R9)
; axis_1 start address is: 24 (R6)
; r_axis1 start address is: 24 (R6)
; feed_rate start address is: 44 (R11)
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 32 (R8)
; n_arc_correction start address is: 32 (R8)
; count start address is: 20 (R5)
; r_axis0 start address is: 40 (R10)
; linear_travel start address is: 64 (R16)
; center_axis1 start address is: 56 (R14)
; center_axis0 start address is: 48 (R12)
; invert_feed_rate start address is: 48 (R12)
; axis_linear start address is: 28 (R7)
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
; segments start address is: 40 (R10)
MOVZ	R10, R2, R0
;Kinematics.c,318 :: 		if (invert_feed_rate)
BNE	R12, R0, L__mc_arc104
NOP	
J	L__mc_arc72
NOP	
L__mc_arc104:
; invert_feed_rate end address is: 48 (R12)
;Kinematics.c,319 :: 		feed_rate *= segments;
MUL	R2, R11, R10
MOVZ	R11, R2, R0
; feed_rate end address is: 44 (R11)
J	L_mc_arc33
NOP	
L__mc_arc72:
;Kinematics.c,318 :: 		if (invert_feed_rate)
;Kinematics.c,319 :: 		feed_rate *= segments;
L_mc_arc33:
;Kinematics.c,322 :: 		theta_per_segment = angular_travel/(float)segments;
; feed_rate start address is: 44 (R11)
MTC1	R10, S0
CVT32.W 	S0, S0
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
; theta_per_segment start address is: 32 (R8)
MOV.S 	S4, S2
;Kinematics.c,327 :: 		linear_per_segment = linear_travel/(float)segments;
DIV.S 	S0, S8, S0
; linear_travel end address is: 64 (R16)
; linear_per_segment start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,330 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; cos_T start address is: 136 (R34)
MOV.S 	S17, S0
;Kinematics.c,331 :: 		sin_T = theta_per_segment;
; sin_T start address is: 128 (R32)
MOV.S 	S16, S2
;Kinematics.c,333 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,334 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,335 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,336 :: 		i = 0;
; i start address is: 8 (R2)
MOVZ	R2, R0, R0
; axis_linear end address is: 28 (R7)
; center_axis0 end address is: 48 (R12)
; center_axis1 end address is: 56 (R14)
; r_axis0 end address is: 40 (R10)
; count end address is: 20 (R5)
; n_arc_correction end address is: 32 (R8)
; segments end address is: 40 (R10)
; feed_rate end address is: 44 (R11)
; theta_per_segment end address is: 32 (R8)
; linear_per_segment end address is: 64 (R16)
; i end address is: 8 (R2)
; r_axis1 end address is: 24 (R6)
; axis_1 end address is: 24 (R6)
; limit_error end address is: 36 (R9)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
SWC1	S4, 4(SP)
SWC1	S3, 8(SP)
SEH	R4, R5
MOVZ	R5, R11, R0
SEH	R11, R7
MOVZ	R7, R2, R0
MOV.S 	S9, S6
MOVZ	R8, R10, R0
ANDI	R10, R8, 255
MOV.S 	S4, S5
MOV.S 	S5, S8
MOV.S 	S8, S7
LWC1	S3, 8(SP)
LWC1	S7, 4(SP)
;Kinematics.c,347 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc34:
; i start address is: 28 (R7)
; sin_T start address is: 128 (R32)
; cos_T start address is: 136 (R34)
; linear_per_segment start address is: 40 (R10)
; theta_per_segment start address is: 56 (R14)
; feed_rate start address is: 20 (R5)
; segments start address is: 32 (R8)
; limit_error start address is: 36 (R9)
; n_arc_correction start address is: 40 (R10)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
; center_axis1 start address is: 64 (R16)
; center_axis0 start address is: 72 (R18)
; axis_linear start address is: 44 (R11)
; axis_1 start address is: 24 (R6)
SLT	R2, R7, R8
BNE	R2, R0, L__mc_arc105
NOP	
J	L_mc_arc35
NOP	
L__mc_arc105:
;Kinematics.c,349 :: 		if (count < n_arc_correction) {
SEH	R3, R4
ANDI	R2, R10, 255
SLT	R2, R3, R2
BNE	R2, R0, L__mc_arc106
NOP	
J	L_mc_arc36
NOP	
L__mc_arc106:
;Kinematics.c,351 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
MUL.S 	S1, S4, S16
MUL.S 	S0, S3, S17
ADD.S 	S2, S1, S0
;Kinematics.c,352 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
MUL.S 	S1, S4, S17
; r_axis0 end address is: 32 (R8)
MUL.S 	S0, S3, S16
; r_axis1 end address is: 24 (R6)
SUB.S 	S0, S1, S0
; r_axis0 start address is: 80 (R20)
MOV.S 	S10, S0
;Kinematics.c,353 :: 		r_axis1 = r_axisi;
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S2
;Kinematics.c,354 :: 		count++;
ADDIU	R2, R4, 1
; count end address is: 16 (R4)
; count start address is: 48 (R12)
SEH	R12, R2
;Kinematics.c,355 :: 		} else {
SH	R12, 4(SP)
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
LH	R12, 4(SP)
J	L_mc_arc37
NOP	
L_mc_arc36:
;Kinematics.c,358 :: 		cos_Ti = cos(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 88 (R22)
MOV.S 	S11, S0
;Kinematics.c,359 :: 		sin_Ti = sin(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,360 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S11
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
; r_axis0 start address is: 80 (R20)
MOV.S 	S10, S1
;Kinematics.c,361 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S11
; cos_Ti end address is: 88 (R22)
SUB.S 	S0, S1, S0
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,362 :: 		count = 0;
; count start address is: 48 (R12)
MOVZ	R12, R0, R0
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
SH	R12, 4(SP)
LH	R12, 4(SP)
;Kinematics.c,363 :: 		}
L_mc_arc37:
;Kinematics.c,366 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
; count start address is: 48 (R12)
; r_axis1 start address is: 48 (R12)
; r_axis0 start address is: 80 (R20)
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S9, S10
SWC1	S0, 0(R2)
;Kinematics.c,367 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S8, S6
SWC1	S0, 0(R2)
;Kinematics.c,368 :: 		arc_target[axis_linear] += linear_per_segment;
SEH	R2, R11
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S0, S5
SWC1	S0, 0(R2)
;Kinematics.c,369 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S4, 0(R2)
SUB.S 	S3, S0, S4
;Kinematics.c,370 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S2, 0(R2)
SUB.S 	S1, S0, S2
;Kinematics.c,372 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
ADD.S 	S0, S3, S4
; nPx start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,373 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
ADD.S 	S0, S1, S2
; nPy start address is: 0 (R0)
;Kinematics.c,376 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc108
NOP	
J	L_mc_arc38
NOP	
L__mc_arc108:
;Kinematics.c,377 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,378 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R6
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,379 :: 		}
L_mc_arc38:
;Kinematics.c,382 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
SWC1	S10, 4(SP)
SWC1	S6, 8(SP)
SH	R12, 12(SP)
SH	R6, 14(SP)
SH	R11, 16(SP)
SWC1	S9, 20(SP)
SWC1	S8, 24(SP)
SB	R10, 28(SP)
SB	R9, 29(SP)
SW	R8, 32(SP)
SW	R5, 36(SP)
SWC1	S7, 40(SP)
SWC1	S5, 44(SP)
SWC1	S17, 48(SP)
SWC1	S16, 52(SP)
SW	R7, 56(SP)
SH	R28, 60(SP)
SW	R27, 64(SP)
SW	R26, 68(SP)
SW	R25, 72(SP)
MOVZ	R27, R5, R0
SEH	R26, R6
SEH	R25, R28
MOV.S 	S13, S0
; nPy end address is: 0 (R0)
MOV.S 	S12, S3
; nPx end address is: 24 (R6)
JAL	_DualAxisStep+0
NOP	
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
; i end address is: 28 (R7)
LW	R25, 72(SP)
LW	R26, 68(SP)
LW	R27, 64(SP)
LH	R28, 60(SP)
LW	R7, 56(SP)
LWC1	S16, 52(SP)
LWC1	S17, 48(SP)
LWC1	S5, 44(SP)
LWC1	S7, 40(SP)
LW	R5, 36(SP)
LW	R8, 32(SP)
LBU	R9, 29(SP)
LBU	R10, 28(SP)
LWC1	S8, 24(SP)
LWC1	S9, 20(SP)
LH	R11, 16(SP)
LH	R6, 14(SP)
LH	R12, 12(SP)
LWC1	S6, 8(SP)
LWC1	S10, 4(SP)
SB	R10, 4(SP)
MOVZ	R3, R7, R0
MOV.S 	S4, S10
MOV.S 	S3, S6
SEH	R4, R12
LBU	R10, 4(SP)
;Kinematics.c,384 :: 		while(1){
L_mc_arc39:
;Kinematics.c,391 :: 		if(!OC5IE_bit && !OC2IE_bit)
; i start address is: 12 (R3)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
; r_axis0 start address is: 32 (R8)
; r_axis0 end address is: 32 (R8)
; r_axis1 start address is: 24 (R6)
; r_axis1 end address is: 24 (R6)
; count start address is: 16 (R4)
; count end address is: 16 (R4)
; axis_1 start address is: 24 (R6)
; axis_1 end address is: 24 (R6)
; axis_linear start address is: 44 (R11)
; axis_linear end address is: 44 (R11)
; center_axis0 start address is: 72 (R18)
; center_axis0 end address is: 72 (R18)
; center_axis1 start address is: 64 (R16)
; center_axis1 end address is: 64 (R16)
; n_arc_correction start address is: 40 (R10)
; n_arc_correction end address is: 40 (R10)
; limit_error start address is: 36 (R9)
; limit_error end address is: 36 (R9)
; segments start address is: 32 (R8)
; segments end address is: 32 (R8)
; feed_rate start address is: 20 (R5)
; feed_rate end address is: 20 (R5)
; theta_per_segment start address is: 56 (R14)
; theta_per_segment end address is: 56 (R14)
; linear_per_segment start address is: 40 (R10)
; linear_per_segment end address is: 40 (R10)
; cos_T start address is: 136 (R34)
; cos_T end address is: 136 (R34)
; sin_T start address is: 128 (R32)
; sin_T end address is: 128 (R32)
; i start address is: 12 (R3)
; i end address is: 12 (R3)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc109
NOP	
J	L__mc_arc69
NOP	
L__mc_arc109:
; r_axis0 end address is: 32 (R8)
; r_axis1 end address is: 24 (R6)
; count end address is: 16 (R4)
; axis_1 end address is: 24 (R6)
; axis_linear end address is: 44 (R11)
; center_axis0 end address is: 72 (R18)
; center_axis1 end address is: 64 (R16)
; n_arc_correction end address is: 40 (R10)
; limit_error end address is: 36 (R9)
; segments end address is: 32 (R8)
; feed_rate end address is: 20 (R5)
; theta_per_segment end address is: 56 (R14)
; linear_per_segment end address is: 40 (R10)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
; i end address is: 12 (R3)
; i start address is: 12 (R3)
; sin_T start address is: 128 (R32)
; cos_T start address is: 136 (R34)
; linear_per_segment start address is: 40 (R10)
; theta_per_segment start address is: 56 (R14)
; feed_rate start address is: 20 (R5)
; segments start address is: 32 (R8)
; limit_error start address is: 36 (R9)
; n_arc_correction start address is: 40 (R10)
; center_axis1 start address is: 64 (R16)
; center_axis0 start address is: 72 (R18)
; axis_linear start address is: 44 (R11)
; axis_1 start address is: 24 (R6)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc110
NOP	
J	L__mc_arc68
NOP	
L__mc_arc110:
L__mc_arc67:
;Kinematics.c,392 :: 		break;
J	L_mc_arc40
NOP	
;Kinematics.c,391 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc69:
L__mc_arc68:
;Kinematics.c,393 :: 		}
SWC1	S3, 4(SP)
SWC1	S4, 8(SP)
SB	R10, 12(SP)
LBU	R10, 12(SP)
LWC1	S4, 8(SP)
LWC1	S3, 4(SP)
J	L_mc_arc39
NOP	
L_mc_arc40:
;Kinematics.c,397 :: 		if(limit_error)
BNE	R9, R0, L__mc_arc112
NOP	
J	L_mc_arc44
NOP	
L__mc_arc112:
; r_axis0 end address is: 32 (R8)
; r_axis1 end address is: 24 (R6)
; count end address is: 16 (R4)
; axis_1 end address is: 24 (R6)
; axis_linear end address is: 44 (R11)
; center_axis0 end address is: 72 (R18)
; center_axis1 end address is: 64 (R16)
; n_arc_correction end address is: 40 (R10)
; limit_error end address is: 36 (R9)
; segments end address is: 32 (R8)
; feed_rate end address is: 20 (R5)
; theta_per_segment end address is: 56 (R14)
; linear_per_segment end address is: 40 (R10)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
; i end address is: 12 (R3)
;Kinematics.c,398 :: 		break;
J	L_mc_arc35
NOP	
L_mc_arc44:
;Kinematics.c,399 :: 		i++;
; i start address is: 12 (R3)
; sin_T start address is: 128 (R32)
; cos_T start address is: 136 (R34)
; linear_per_segment start address is: 40 (R10)
; theta_per_segment start address is: 56 (R14)
; feed_rate start address is: 20 (R5)
; segments start address is: 32 (R8)
; limit_error start address is: 36 (R9)
; n_arc_correction start address is: 40 (R10)
; center_axis1 start address is: 64 (R16)
; center_axis0 start address is: 72 (R18)
; axis_linear start address is: 44 (R11)
; axis_1 start address is: 24 (R6)
; count start address is: 16 (R4)
; r_axis1 start address is: 24 (R6)
; r_axis0 start address is: 32 (R8)
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 28 (R7)
MOVZ	R7, R2, R0
;Kinematics.c,408 :: 		}
SWC1	S5, 4(SP)
; r_axis0 end address is: 32 (R8)
; r_axis1 end address is: 24 (R6)
; count end address is: 16 (R4)
; axis_1 end address is: 24 (R6)
; axis_linear end address is: 44 (R11)
; center_axis0 end address is: 72 (R18)
; center_axis1 end address is: 64 (R16)
; n_arc_correction end address is: 40 (R10)
; limit_error end address is: 36 (R9)
; segments end address is: 32 (R8)
; feed_rate end address is: 20 (R5)
; theta_per_segment end address is: 56 (R14)
; linear_per_segment end address is: 40 (R10)
; cos_T end address is: 136 (R34)
; sin_T end address is: 128 (R32)
; i end address is: 28 (R7)
SW	R8, 8(SP)
SWC1	S3, 12(SP)
LWC1	S3, 12(SP)
LW	R8, 8(SP)
LWC1	S5, 4(SP)
J	L_mc_arc34
NOP	
L_mc_arc35:
;Kinematics.c,409 :: 		report_status_message(STATUS_OK);
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
;Kinematics.c,416 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,420 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,421 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,422 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,430 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,431 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection115
NOP	
J	L_GetAxisDirection45
NOP	
L__GetAxisDirection115:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
J	L_GetAxisDirection46
NOP	
L_GetAxisDirection45:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
L_GetAxisDirection46:
; ?FLOC___GetAxisDirection?T395 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T395 end address is: 8 (R2)
;Kinematics.c,432 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,444 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,448 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home117
NOP	
J	L_Home47
NOP	
L__Home117:
;Kinematics.c,449 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,452 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,455 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,458 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,461 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,464 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,467 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,470 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home118
NOP	
J	L_Home48
NOP	
L__Home118:
;Kinematics.c,472 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,474 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,475 :: 		}
L_Home48:
;Kinematics.c,479 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,488 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,489 :: 		}
L_Home47:
;Kinematics.c,493 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home119
NOP	
J	L_Home49
NOP	
L__Home119:
;Kinematics.c,498 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home121
NOP	
J	L_Home50
NOP	
L__Home121:
;Kinematics.c,501 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,502 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,511 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home122
NOP	
J	L_Home51
NOP	
L__Home122:
;Kinematics.c,513 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home123
NOP	
J	L_Home52
NOP	
L__Home123:
;Kinematics.c,516 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home124
NOP	
J	L_Home53
NOP	
L__Home124:
;Kinematics.c,518 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,519 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,522 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,524 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home54
NOP	
L_Home53:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home125
NOP	
J	L_Home55
NOP	
L__Home125:
;Kinematics.c,526 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,527 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,528 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,530 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,533 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,545 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,546 :: 		}
L_Home55:
L_Home54:
;Kinematics.c,547 :: 		}
L_Home52:
;Kinematics.c,552 :: 		}
L_Home51:
;Kinematics.c,553 :: 		}
L_Home50:
;Kinematics.c,561 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home127
NOP	
J	L_Home56
NOP	
L__Home127:
;Kinematics.c,563 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,564 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home129
NOP	
J	L_Home57
NOP	
L__Home129:
;Kinematics.c,565 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,566 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,567 :: 		}
L_Home57:
;Kinematics.c,576 :: 		}
L_Home56:
;Kinematics.c,577 :: 		}
L_Home49:
;Kinematics.c,578 :: 		return axis;
SEH	R2, R25
;Kinematics.c,579 :: 		}
;Kinematics.c,578 :: 		return axis;
;Kinematics.c,579 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,582 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,584 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,585 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,595 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
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
;Kinematics.c,596 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
LW	R2, 0(R2)
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,597 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,599 :: 		static void ResetHoming(){
;Kinematics.c,600 :: 		int i = 0;
;Kinematics.c,601 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming58:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming132
NOP	
J	L_Kinematics_ResetHoming59
NOP	
L_Kinematics_ResetHoming132:
;Kinematics.c,602 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,603 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,601 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,604 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming58
NOP	
L_Kinematics_ResetHoming59:
;Kinematics.c,605 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,612 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,614 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset134
NOP	
J	L_mc_reset61
NOP	
L__mc_reset134:
;Kinematics.c,615 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,625 :: 		switch (sys.state) {
J	L_mc_reset62
NOP	
;Kinematics.c,626 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset64:
L_mc_reset65:
L_mc_reset66:
;Kinematics.c,627 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,628 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,629 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,630 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,631 :: 		}
J	L_mc_reset63
NOP	
L_mc_reset62:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset136
NOP	
J	L_mc_reset64
NOP	
L__mc_reset136:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset138
NOP	
J	L_mc_reset65
NOP	
L__mc_reset138:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset140
NOP	
J	L_mc_reset66
NOP	
L__mc_reset140:
L_mc_reset63:
;Kinematics.c,632 :: 		}
L_mc_reset61:
;Kinematics.c,633 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
