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
BNE	R2, R0, L__SetInitialSizes85
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes85:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection87
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection87:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection89
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection89:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection91
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection91:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection93
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection93:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection95
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection95:
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
BEQ	R3, R2, L__SingleAxisStep97
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep97:
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
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,94 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep98
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep98:
; tempA end address is: 12 (R3)
;Kinematics.c,95 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SB	R2, Offset(_SV+1)(GP)
;Kinematics.c,96 :: 		return;
J	L_end_SingleAxisStep
NOP	
;Kinematics.c,97 :: 		}
L_SingleAxisStep13:
;Kinematics.c,98 :: 		}else{
; tempA start address is: 12 (R3)
MOVZ	R2, R3, R0
; tempA end address is: 12 (R3)
J	L_SingleAxisStep14
NOP	
L_SingleAxisStep12:
;Kinematics.c,99 :: 		tempA = belt_steps(newxyz,axis_No);
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
;Kinematics.c,100 :: 		}
L_SingleAxisStep14:
;Kinematics.c,102 :: 		SingleAxisStart(tempA,speed,axis_No);
; tempA start address is: 8 (R2)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
; tempA end address is: 8 (R2)
JAL	Kinematics_SingleAxisStart+0
NOP	
;Kinematics.c,104 :: 		}
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
;Kinematics.c,106 :: 		static void SingleAxisStart(long dist,long speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,108 :: 		Single_Axis_Enable(axis_No);
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
;Kinematics.c,109 :: 		speed_cntr_Move(dist , speed , axis_No);
SH	R27, 12(SP)
SW	R25, 16(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LH	R27, 12(SP)
;Kinematics.c,114 :: 		Set_Axisdirection(dist,axis_No);
SEH	R26, R27
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,115 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart100
NOP	
J	L_Kinematics_SingleAxisStart15
NOP	
L_Kinematics_SingleAxisStart100:
; ?FLOC__Kinematics_SingleAxisStart?T47 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T47 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart16
NOP	
L_Kinematics_SingleAxisStart15:
; ?FLOC__Kinematics_SingleAxisStart?T47 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T47 end address is: 16 (R4)
L_Kinematics_SingleAxisStart16:
; ?FLOC__Kinematics_SingleAxisStart?T47 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T47 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,116 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+2)(GP)
;Kinematics.c,117 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Kinematics.c,118 :: 		STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
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
;Kinematics.c,119 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,120 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R27
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R25, 0(R2)
;Kinematics.c,122 :: 		Step_Cycle(axis_No);
SEH	R25, R27
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,123 :: 		}
L_end_SingleAxisStart:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,128 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,long speed){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Kinematics.c,134 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep102
NOP	
J	L_DualAxisStep17
NOP	
L__DualAxisStep102:
;Kinematics.c,136 :: 		tempA = belt_steps(axis_a,axisA);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
SW	R2, 16(SP)
;Kinematics.c,137 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,148 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 92
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R4, 0(R3)
LW	R3, 16(SP)
SUBU	R3, R3, R4
SW	R3, 16(SP)
;Kinematics.c,149 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
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
SW	R2, 20(SP)
;Kinematics.c,156 :: 		}else{
J	L_DualAxisStep18
NOP	
L_DualAxisStep17:
;Kinematics.c,157 :: 		tempA = belt_steps(axis_a,axisA);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LH	R25, 10(SP)
LH	R26, 8(SP)
SW	R2, 16(SP)
;Kinematics.c,158 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
SW	R2, 20(SP)
;Kinematics.c,159 :: 		}
L_DualAxisStep18:
;Kinematics.c,160 :: 		SV.over = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,161 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+20)(GP)
;Kinematics.c,164 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,165 :: 		Single_Axis_Enable(axisA);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,166 :: 		Single_Axis_Enable(axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,170 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep103
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep103:
;Kinematics.c,171 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,172 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,173 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,174 :: 		}else{
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
;Kinematics.c,175 :: 		SV.prevA = 0;//tempA;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,176 :: 		SV.prevB = 0;//tempB;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,177 :: 		SV.prevC = 0;//tempC;
SW	R0, Offset(_SV+44)(GP)
;Kinematics.c,178 :: 		}
L_DualAxisStep20:
;Kinematics.c,181 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SEH	R26, R25
LW	R25, 16(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,182 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 16(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep104:
; ?FLOC___DualAxisStep?T105 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T105 end address is: 24 (R6)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T105 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T105 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T105 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T105 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,183 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,184 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep105:
; ?FLOC___DualAxisStep?T113 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T113 end address is: 24 (R6)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T113 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T113 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T113 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T113 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,187 :: 		SV.dA   = tempA;// - SV.prevA;
LW	R2, 16(SP)
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,188 :: 		SV.dB   = tempB;// - SV.prevB;
LW	R2, 20(SP)
SW	R2, Offset(_SV+28)(GP)
;Kinematics.c,189 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 24(SP)
SW	R2, Offset(_SV+32)(GP)
;Kinematics.c,192 :: 		SV.dA = labs(SV.dA);
SH	R25, 4(SP)
LW	R25, Offset(_SV+24)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,193 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+28)(GP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
SW	R2, Offset(_SV+28)(GP)
;Kinematics.c,196 :: 		while(DMA_IsOn(1));
L_DualAxisStep25:
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
BNE	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep107:
J	L_DualAxisStep25
NOP	
L_DualAxisStep26:
;Kinematics.c,197 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n",SV.dA,SV.dB);
ADDIU	R23, SP, 28
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 28
LW	R2, Offset(_SV+28)(GP)
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_SV+24)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,201 :: 		if(SV.dA == 0 && SV.dB == 0){
LW	R2, Offset(_SV+24)(GP)
BEQ	R2, R0, L__DualAxisStep108
NOP	
J	L__DualAxisStep78
NOP	
L__DualAxisStep108:
LW	R2, Offset(_SV+28)(GP)
BEQ	R2, R0, L__DualAxisStep109
NOP	
J	L__DualAxisStep77
NOP	
L__DualAxisStep109:
L__DualAxisStep76:
;Kinematics.c,202 :: 		SV.Tog = 1; //set this to respond with ok
ORI	R2, R0, 1
SB	R2, Offset(_SV+1)(GP)
;Kinematics.c,203 :: 		return;
J	L_end_DualAxisStep
NOP	
;Kinematics.c,201 :: 		if(SV.dA == 0 && SV.dB == 0){
L__DualAxisStep78:
L__DualAxisStep77:
;Kinematics.c,206 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep110:
;Kinematics.c,208 :: 		speed_cntr_Move(tempA,speed,axisA);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 16(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,210 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
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
;Kinematics.c,211 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
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
;Kinematics.c,214 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,215 :: 		STPS[axisA].master = 1;
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
;Kinematics.c,216 :: 		STPS[axisB].master = 0;
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
;Kinematics.c,217 :: 		}else{
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
;Kinematics.c,219 :: 		speed_cntr_Move(tempB,speed,axisB);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SW	R27, 12(SP)
LW	R25, 20(SP)
SEH	R27, R26
LW	R26, 12(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,221 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
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
;Kinematics.c,222 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
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
;Kinematics.c,225 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,226 :: 		STPS[axisA].master = 0;
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
;Kinematics.c,227 :: 		STPS[axisB].master = 1;
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
;Kinematics.c,228 :: 		}
L_DualAxisStep31:
;Kinematics.c,230 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,231 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,232 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,233 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,235 :: 		Axis_Interpolate(axisA,axisB);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
JAL	_Axis_Interpolate+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,237 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,273 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -356
SW	RA, 0(SP)
LH	R2, 356(SP)
SH	R2, 356(SP)
LH	R2, 358(SP)
SH	R2, 358(SP)
LW	R2, 360(SP)
SW	R2, 360(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 364(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 365(SP)
;Kinematics.c,274 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 304
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,275 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
SWC1	S4, 32(SP)
;Kinematics.c,276 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
LH	R2, 356(SP)
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
SWC1	S2, 36(SP)
;Kinematics.c,277 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 358(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 208 (R52)
MOV.S 	S26, S0
;Kinematics.c,278 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 40(SP)
;Kinematics.c,279 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
SWC1	S0, 44(SP)
;Kinematics.c,280 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,281 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,282 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,283 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,284 :: 		float angular_travel          = 0.00;
;Kinematics.c,285 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,286 :: 		float rads                    = 0.00;
;Kinematics.c,287 :: 		float segments                = 0.00;
;Kinematics.c,288 :: 		float cos_T                   = 0.00;
;Kinematics.c,289 :: 		float sin_T                   = 0.00;
;Kinematics.c,290 :: 		float sin_Ti                  = 0.00;
;Kinematics.c,291 :: 		float cos_Ti                  = 0.00;
;Kinematics.c,292 :: 		float r_axisi                 = 0.00;
;Kinematics.c,293 :: 		float nPx                     = 0.00;
;Kinematics.c,294 :: 		float nPy                     = 0.00;
;Kinematics.c,295 :: 		float i                       = 0.00;
;Kinematics.c,296 :: 		int count                     = 0;
MOVZ	R30, R0, R0
SH	R30, 316(SP)
ORI	R30, R0, 3
SB	R30, 318(SP)
;Kinematics.c,297 :: 		char n_arc_correction         = 3; //to be sorted into global struct???
;Kinematics.c,298 :: 		char limit_error              = 0;
;Kinematics.c,301 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 304
LH	R2, 358(SP)
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,308 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,311 :: 		if(isclockwise) {
BNE	R7, R0, L__mc_arc113
NOP	
J	L__mc_arc83
NOP	
L__mc_arc113:
; isclockwise end address is: 28 (R7)
;Kinematics.c,313 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc114
NOP	
J	L_mc_arc33
NOP	
L__mc_arc114:
;Kinematics.c,314 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
MOV.S 	S4, S0
J	L_mc_arc34
NOP	
L_mc_arc33:
;Kinematics.c,316 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc115
NOP	
J	L__mc_arc82
NOP	
L__mc_arc115:
;Kinematics.c,317 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc35
NOP	
L__mc_arc82:
;Kinematics.c,316 :: 		if(angular_travel <= 0)
;Kinematics.c,317 :: 		angular_travel += PIx2;
L_mc_arc35:
;Kinematics.c,318 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc34:
;Kinematics.c,319 :: 		}
; angular_travel start address is: 32 (R8)
MOV.S 	S23, S4
; angular_travel end address is: 32 (R8)
J	L_mc_arc32
NOP	
L__mc_arc83:
;Kinematics.c,311 :: 		if(isclockwise) {
MOV.S 	S23, S4
;Kinematics.c,319 :: 		}
L_mc_arc32:
;Kinematics.c,322 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 184 (R46)
SWC1	S12, 4(SP)
MOV.S 	S12, S26
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S23, S12
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
SWC1	S0, 328(SP)
;Kinematics.c,323 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc116
NOP	
J	L_mc_arc36
NOP	
L__mc_arc116:
; invert_feed_rate end address is: 24 (R6)
; angular_travel end address is: 184 (R46)
; linear_travel end address is: 208 (R52)
J	L_end_mc_arc
NOP	
L_mc_arc36:
;Kinematics.c,325 :: 		segments = floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
; linear_travel start address is: 208 (R52)
; angular_travel start address is: 184 (R46)
; invert_feed_rate start address is: 24 (R6)
LWC1	S1, 328(SP)
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S1, S0
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
SWC1	S0, 332(SP)
;Kinematics.c,330 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc118
NOP	
J	L_mc_arc37
NOP	
L__mc_arc118:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,331 :: 		feed_rate *= segments;
LWC1	S0, 360(SP)
CVT32.W 	S1, S0
LWC1	S0, 332(SP)
MUL.S 	S0, S1, S0
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, 360(SP)
L_mc_arc37:
;Kinematics.c,334 :: 		theta_per_segment = angular_travel/segments;
LWC1	S0, 332(SP)
DIV.S 	S2, S23, S0
SWC1	S2, 320(SP)
;Kinematics.c,339 :: 		linear_per_segment = linear_travel/segments;
LWC1	S0, 332(SP)
DIV.S 	S0, S26, S0
SWC1	S0, 324(SP)
;Kinematics.c,342 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 336(SP)
;Kinematics.c,343 :: 		sin_T = theta_per_segment;
SWC1	S2, 340(SP)
;Kinematics.c,346 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 304
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,347 :: 		nPy = arc_target[axis_1] = position[axis_1];
LH	R2, 356(SP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,348 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,349 :: 		i = 0.0;
MOVZ	R2, R0, R0
SW	R2, 352(SP)
; angular_travel end address is: 184 (R46)
; linear_travel end address is: 208 (R52)
;Kinematics.c,352 :: 		while(DMA_IsOn(1));
L_mc_arc38:
; angular_travel start address is: 184 (R46)
; linear_travel start address is: 208 (R52)
SWC1	S26, 4(SP)
SWC1	S23, 8(SP)
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
LWC1	S23, 8(SP)
LWC1	S26, 4(SP)
BNE	R2, R0, L__mc_arc120
NOP	
J	L_mc_arc39
NOP	
L__mc_arc120:
J	L_mc_arc38
NOP	
L_mc_arc39:
;Kinematics.c,357 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
ADDIU	R23, SP, 48
ADDIU	R22, R23, 145
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 48
;Kinematics.c,359 :: 		,linear_travel,linear_per_segment,theta_per_segment,feed_rate);
LW	R2, 360(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -44
SW	R2, 40(SP)
LW	R2, 364(SP)
SW	R2, 36(SP)
LW	R2, 368(SP)
SW	R2, 32(SP)
SWC1	S26, 28(SP)
; linear_travel end address is: 208 (R52)
;Kinematics.c,358 :: 		cos_T,sin_T,radius,segments,angular_travel,mm_of_travel
LW	R2, 372(SP)
SW	R2, 24(SP)
SWC1	S23, 20(SP)
; angular_travel end address is: 184 (R46)
LW	R2, 376(SP)
SW	R2, 16(SP)
SWC1	S12, 12(SP)
LW	R2, 384(SP)
SW	R2, 8(SP)
LW	R2, 380(SP)
SW	R2, 4(SP)
;Kinematics.c,357 :: 		[LinPseg:= %f : *pSeg:= %f]\n[gc.freq:= %l]\r\n",
SW	R3, 0(SP)
;Kinematics.c,359 :: 		,linear_travel,linear_per_segment,theta_per_segment,feed_rate);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 44
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,362 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc40:
LWC1	S1, 332(SP)
LWC1	S0, 352(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc121
NOP	
J	L_mc_arc41
NOP	
L__mc_arc121:
;Kinematics.c,364 :: 		if (count < n_arc_correction) {
LBU	R3, 318(SP)
LH	R2, 316(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc122
NOP	
J	L_mc_arc42
NOP	
L__mc_arc122:
;Kinematics.c,366 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 340(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 336(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,367 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 336(SP)
LWC1	S0, 40(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 340(SP)
LWC1	S0, 44(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 40(SP)
;Kinematics.c,368 :: 		r_axis1 = r_axisi;
SWC1	S3, 44(SP)
;Kinematics.c,369 :: 		count++;
LH	R2, 316(SP)
ADDIU	R2, R2, 1
SH	R2, 316(SP)
;Kinematics.c,370 :: 		} else {
J	L_mc_arc43
NOP	
L_mc_arc42:
;Kinematics.c,373 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S1, 320(SP)
LWC1	S0, 352(SP)
MUL.S 	S0, S0, S1
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,374 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S1, 320(SP)
LWC1	S0, 352(SP)
MUL.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,375 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
LH	R2, 356(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 40(SP)
;Kinematics.c,376 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 44(SP)
;Kinematics.c,377 :: 		count = 0;
SH	R0, 316(SP)
;Kinematics.c,378 :: 		}
L_mc_arc43:
;Kinematics.c,381 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 304
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 40(SP)
LWC1	S0, 32(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,382 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
LH	R2, 356(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 44(SP)
LWC1	S0, 36(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,383 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 358(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 324(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,384 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 344(SP)
;Kinematics.c,385 :: 		nPy =  arc_target[axis_1] - position[axis_1];
LH	R2, 356(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 348(SP)
;Kinematics.c,387 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc124
NOP	
J	L_mc_arc44
NOP	
L__mc_arc124:
;Kinematics.c,388 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 344(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 344(SP)
;Kinematics.c,389 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
LH	R2, 356(SP)
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 348(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 348(SP)
;Kinematics.c,390 :: 		}
L_mc_arc44:
;Kinematics.c,393 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
LW	R2, 360(SP)
SW	R2, 0(R3)
;Kinematics.c,394 :: 		STPS[axis_1].step_delay = feed_rate;
LH	R3, 356(SP)
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
LW	R2, 360(SP)
SW	R2, 0(R3)
;Kinematics.c,398 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,gc.frequency);//,xy);
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LW	R27, Offset(_gc+20)(GP)
LH	R26, 356(SP)
SEH	R25, R28
LWC1	S13, 348(SP)
LWC1	S12, 344(SP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,400 :: 		while(1){
L_mc_arc45:
;Kinematics.c,407 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc125
NOP	
J	L__mc_arc81
NOP	
L__mc_arc125:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc126
NOP	
J	L__mc_arc80
NOP	
L__mc_arc126:
L__mc_arc79:
;Kinematics.c,408 :: 		break;
J	L_mc_arc46
NOP	
;Kinematics.c,407 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc81:
L__mc_arc80:
;Kinematics.c,409 :: 		}
J	L_mc_arc45
NOP	
L_mc_arc46:
;Kinematics.c,415 :: 		i+=1.00;
LWC1	S1, 352(SP)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 352(SP)
;Kinematics.c,417 :: 		while(DMA_IsOn(1));
L_mc_arc50:
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
BNE	R2, R0, L__mc_arc128
NOP	
J	L_mc_arc51
NOP	
L__mc_arc128:
J	L_mc_arc50
NOP	
L_mc_arc51:
;Kinematics.c,420 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LH	R2, 356(SP)
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
;Kinematics.c,419 :: 		[ i:= %d\tseg:= %d ][ nPx:= %f\tnPy:= %f ][ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
ADDIU	R23, SP, 193
ADDIU	R22, R23, 106
LUI	R24, hi_addr(?ICS?lstr3_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 193
;Kinematics.c,420 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
LW	R2, 360(SP)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
SWC1	S1, 24(SP)
SWC1	S0, 20(SP)
LW	R2, 380(SP)
SW	R2, 16(SP)
LW	R2, 376(SP)
SW	R2, 12(SP)
LW	R2, 364(SP)
SW	R2, 8(SP)
LW	R2, 384(SP)
SW	R2, 4(SP)
;Kinematics.c,419 :: 		[ i:= %d\tseg:= %d ][ nPx:= %f\tnPy:= %f ][ position[axis_0]:= %f\tposition[axis_1]:= %f ][feed_rate:= %l]\r\n"
SW	R3, 0(SP)
;Kinematics.c,420 :: 		,i,segments,nPx,nPy,position[axis_0],position[axis_1],feed_rate);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,424 :: 		}
J	L_mc_arc40
NOP	
L_mc_arc41:
;Kinematics.c,425 :: 		report_status_message(STATUS_OK);
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
;Kinematics.c,426 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SB	R2, Offset(_SV+1)(GP)
;Kinematics.c,428 :: 		while(DMA_IsOn(1));
L_mc_arc52:
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
BNE	R2, R0, L__mc_arc130
NOP	
J	L_mc_arc53
NOP	
L__mc_arc130:
J	L_mc_arc52
NOP	
L_mc_arc53:
;Kinematics.c,429 :: 		dma_printf("\n%s","Arc Finnished");
ORI	R30, R0, 10
SB	R30, 299(SP)
ORI	R30, R0, 37
SB	R30, 300(SP)
ORI	R30, R0, 115
SB	R30, 301(SP)
MOVZ	R30, R0, R0
SB	R30, 302(SP)
ADDIU	R3, SP, 299
LUI	R2, hi_addr(?lstr_5_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_5_Kinematics+0)
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
;Kinematics.c,432 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 356
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,436 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,437 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,438 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,446 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,447 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection133
NOP	
J	L_GetAxisDirection54
NOP	
L__GetAxisDirection133:
; ?FLOC___GetAxisDirection?T400 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T400 end address is: 8 (R2)
J	L_GetAxisDirection55
NOP	
L_GetAxisDirection54:
; ?FLOC___GetAxisDirection?T400 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T400 end address is: 8 (R2)
L_GetAxisDirection55:
; ?FLOC___GetAxisDirection?T400 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T400 end address is: 8 (R2)
;Kinematics.c,448 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,460 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,464 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home135
NOP	
J	L_Home56
NOP	
L__Home135:
;Kinematics.c,465 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,468 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,471 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,474 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,477 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,480 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,483 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,486 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home136
NOP	
J	L_Home57
NOP	
L__Home136:
;Kinematics.c,488 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,490 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,491 :: 		}
L_Home57:
;Kinematics.c,495 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,504 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,505 :: 		}
L_Home56:
;Kinematics.c,509 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home137
NOP	
J	L_Home58
NOP	
L__Home137:
;Kinematics.c,514 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home139
NOP	
J	L_Home59
NOP	
L__Home139:
;Kinematics.c,517 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,518 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,527 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home140
NOP	
J	L_Home60
NOP	
L__Home140:
;Kinematics.c,529 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home141
NOP	
J	L_Home61
NOP	
L__Home141:
;Kinematics.c,532 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home142
NOP	
J	L_Home62
NOP	
L__Home142:
;Kinematics.c,534 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,535 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,538 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,540 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home63
NOP	
L_Home62:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home143
NOP	
J	L_Home64
NOP	
L__Home143:
;Kinematics.c,542 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,543 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,544 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,546 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,549 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,561 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,562 :: 		}
L_Home64:
L_Home63:
;Kinematics.c,563 :: 		}
L_Home61:
;Kinematics.c,568 :: 		}
L_Home60:
;Kinematics.c,569 :: 		}
L_Home59:
;Kinematics.c,577 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home145
NOP	
J	L_Home65
NOP	
L__Home145:
;Kinematics.c,579 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,580 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home147
NOP	
J	L_Home66
NOP	
L__Home147:
;Kinematics.c,581 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,582 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,583 :: 		}
L_Home66:
;Kinematics.c,592 :: 		}
L_Home65:
;Kinematics.c,593 :: 		}
L_Home58:
;Kinematics.c,594 :: 		return axis;
SEH	R2, R25
;Kinematics.c,595 :: 		}
;Kinematics.c,594 :: 		return axis;
;Kinematics.c,595 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,598 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,600 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,601 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 92
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,611 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
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
;Kinematics.c,612 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
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
;Kinematics.c,613 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,615 :: 		static void ResetHoming(){
;Kinematics.c,616 :: 		int i = 0;
;Kinematics.c,617 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming67:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming150
NOP	
J	L_Kinematics_ResetHoming68
NOP	
L_Kinematics_ResetHoming150:
;Kinematics.c,618 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,619 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,617 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,620 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming67
NOP	
L_Kinematics_ResetHoming68:
;Kinematics.c,621 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,628 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,630 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset152
NOP	
J	L_mc_reset70
NOP	
L__mc_reset152:
;Kinematics.c,631 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,641 :: 		switch (sys.state) {
J	L_mc_reset71
NOP	
;Kinematics.c,642 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset73:
L_mc_reset74:
L_mc_reset75:
;Kinematics.c,643 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,644 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,645 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,646 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,647 :: 		}
J	L_mc_reset72
NOP	
L_mc_reset71:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset154
NOP	
J	L_mc_reset73
NOP	
L__mc_reset154:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset156
NOP	
J	L_mc_reset74
NOP	
L__mc_reset156:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset158
NOP	
J	L_mc_reset75
NOP	
L__mc_reset158:
L_mc_reset72:
;Kinematics.c,648 :: 		}
L_mc_reset70:
;Kinematics.c,649 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
