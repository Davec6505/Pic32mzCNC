_SetInitialSizes:
;Kinematics.c,33 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,34 :: 		int i = 0;
;Kinematics.c,36 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,38 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes88
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes88:
;Kinematics.c,39 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 76
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
;Kinematics.c,38 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,40 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,41 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,46 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,47 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection90
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection90:
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
;Kinematics.c,48 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection5
NOP	
;Kinematics.c,49 :: 		case X:
L_Kinematics_Set_Axisdirection7:
;Kinematics.c,50 :: 		DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,51 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,52 :: 		case Y:
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,53 :: 		DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,54 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,55 :: 		case Z:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,56 :: 		DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
XORI	R2, R4, 1
; dir end address is: 16 (R4)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,57 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,58 :: 		case A:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,59 :: 		DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
; dir start address is: 16 (R4)
ANDI	R3, R4, 1
; dir end address is: 16 (R4)
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,60 :: 		break;
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,61 :: 		default: break;
L_Kinematics_Set_Axisdirection11:
J	L_Kinematics_Set_Axisdirection6
NOP	
;Kinematics.c,62 :: 		}
L_Kinematics_Set_Axisdirection5:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection92
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection92:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection94
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection94:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection96
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection96:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection98
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection98:
; dir end address is: 16 (R4)
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection6:
;Kinematics.c,63 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,77 :: 		void SingleAxisStep(float newxyz,float speed,int axis_No){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Kinematics.c,78 :: 		long  absxyz = 0;
SW	R26, 4(SP)
;Kinematics.c,79 :: 		long  tempA  = 0;
MOVZ	R30, R0, R0
SW	R30, 68(SP)
;Kinematics.c,80 :: 		int   dir    = 0;
;Kinematics.c,83 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,86 :: 		while(DMA_IsOn(1));
L_SingleAxisStep12:
SH	R25, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LH	R25, 8(SP)
BNE	R2, R0, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep101:
J	L_SingleAxisStep12
NOP	
L_SingleAxisStep13:
;Kinematics.c,89 :: 		,newxyz,(int)gc.absolute_mode);
LBU	R2, Offset(_gc+5)(GP)
SH	R2, 76(SP)
;Kinematics.c,88 :: 		,tempA,beltsteps2mm(STPS[axis_No].steps_abs_position,axis_No)
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
LW	R2, 0(R2)
SH	R25, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
SEH	R26, R25
MOVZ	R25, R2, R0
JAL	_beltsteps2mm+0
NOP	
LWC1	S12, 16(SP)
;Kinematics.c,87 :: 		dma_printf("cur_pos:= %l\tabsxyz:= %f\tnewxyz:= %f\tG90:= %d\n"
ADDIU	R23, SP, 20
ADDIU	R22, R23, 47
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
;Kinematics.c,89 :: 		,newxyz,(int)gc.absolute_mode);
LH	R2, 76(SP)
SWC1	S12, 16(SP)
ADDIU	SP, SP, -20
SH	R2, 16(SP)
SWC1	S12, 12(SP)
;Kinematics.c,88 :: 		,tempA,beltsteps2mm(STPS[axis_No].steps_abs_position,axis_No)
SWC1	S0, 8(SP)
LW	R2, 88(SP)
SW	R2, 4(SP)
;Kinematics.c,87 :: 		dma_printf("cur_pos:= %l\tabsxyz:= %f\tnewxyz:= %f\tG90:= %d\n"
SW	R3, 0(SP)
;Kinematics.c,89 :: 		,newxyz,(int)gc.absolute_mode);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LH	R25, 8(SP)
;Kinematics.c,92 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep102
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep102:
;Kinematics.c,94 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 8(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LH	R25, 8(SP)
;Kinematics.c,97 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 80
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 72
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 68(SP)
;Kinematics.c,99 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep103
NOP	
J	L_SingleAxisStep15
NOP	
L__SingleAxisStep103:
;Kinematics.c,100 :: 		return;
J	L_end_SingleAxisStep
NOP	
;Kinematics.c,101 :: 		}
L_SingleAxisStep15:
;Kinematics.c,102 :: 		}else{
J	L_SingleAxisStep16
NOP	
L_SingleAxisStep14:
;Kinematics.c,103 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 8(SP)
SWC1	S13, 12(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 12(SP)
LH	R25, 8(SP)
SW	R2, 68(SP)
;Kinematics.c,104 :: 		}
L_SingleAxisStep16:
;Kinematics.c,105 :: 		SingleAxisStart(tempA,speed,axis_No);
SH	R25, 8(SP)
MOV.S 	S12, S13
SEH	R26, R25
LW	R25, 68(SP)
JAL	Kinematics_SingleAxisStart+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,107 :: 		}
L_end_SingleAxisStep:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _SingleAxisStep
Kinematics_SingleAxisStart:
;Kinematics.c,109 :: 		static void SingleAxisStart(long dist,float speed,int axis_No){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,110 :: 		long speed_ = 0;
SW	R25, 4(SP)
;Kinematics.c,112 :: 		STPS[axis_No].dist = labs(dist);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 20(SP)
JAL	_labs+0
NOP	
LW	R3, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,113 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,114 :: 		speed_cntr_Move(dist , speed, axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,119 :: 		Set_Axisdirection(dist,axis_No);
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,120 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart105
NOP	
J	L_Kinematics_SingleAxisStart17
NOP	
L_Kinematics_SingleAxisStart105:
; ?FLOC__Kinematics_SingleAxisStart?T64 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T64 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart18
NOP	
L_Kinematics_SingleAxisStart17:
; ?FLOC__Kinematics_SingleAxisStart?T64 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T64 end address is: 16 (R4)
L_Kinematics_SingleAxisStart18:
; ?FLOC__Kinematics_SingleAxisStart?T64 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T64 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,121 :: 		SV.Single_Dual = SINGLE;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 5, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,122 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R0, 0(R2)
;Kinematics.c,123 :: 		STPS[axis_No].dist = labs(dist) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 20(SP)
JAL	_labs+0
NOP	
SEH	R4, R26
ORI	R3, R0, 80
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 40
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 20(SP)
SW	R3, 0(R2)
;Kinematics.c,124 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,125 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R25, 0(R2)
;Kinematics.c,127 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,128 :: 		}
L_end_SingleAxisStart:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,133 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Kinematics.c,137 :: 		if(SV.prevA == axis_a){
LWC1	S0, Offset(_SV+40)(GP)
C.EQ.S 	0, S0, S12
BC1T	0, L__DualAxisStep107
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep107:
;Kinematics.c,138 :: 		bit_false(SV.mode_complete,bit(axisA));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,139 :: 		SV.prevA = axis_a;
SWC1	S12, Offset(_SV+40)(GP)
;Kinematics.c,140 :: 		}
L_DualAxisStep19:
;Kinematics.c,141 :: 		if(SV.prevB == axis_b){
LWC1	S0, Offset(_SV+44)(GP)
C.EQ.S 	0, S0, S13
BC1T	0, L__DualAxisStep108
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep108:
;Kinematics.c,142 :: 		bit_false(SV.mode_complete,bit(axisB));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Kinematics.c,143 :: 		SV.prevB = axis_b;
SWC1	S13, Offset(_SV+44)(GP)
;Kinematics.c,144 :: 		}
L_DualAxisStep20:
;Kinematics.c,150 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S14, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S14, S0
;Kinematics.c,153 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep109
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep109:
;Kinematics.c,155 :: 		tempA = belt_steps(axis_a,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
SW	R2, 20(SP)
;Kinematics.c,156 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,159 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 80
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 72
LW	R4, 0(R3)
LW	R3, 20(SP)
SUBU	R3, R3, R4
SW	R3, 20(SP)
;Kinematics.c,160 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 80
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 72
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 24(SP)
;Kinematics.c,162 :: 		}else{
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
;Kinematics.c,163 :: 		tempA = belt_steps(axis_a,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
SW	R2, 20(SP)
;Kinematics.c,164 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
SW	R2, 24(SP)
;Kinematics.c,165 :: 		}
L_DualAxisStep22:
;Kinematics.c,168 :: 		temp1 = labs(tempA);
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	_labs+0
NOP	
SW	R2, 28(SP)
;Kinematics.c,169 :: 		temp2 = labs(tempB);
LW	R25, 24(SP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
SW	R2, 32(SP)
;Kinematics.c,170 :: 		SV.over = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,171 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+20)(GP)
;Kinematics.c,174 :: 		SV.Single_Dual = DUAL;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,175 :: 		Single_Axis_Enable(axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,176 :: 		Single_Axis_Enable(axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
;Kinematics.c,180 :: 		Set_Axisdirection(tempA,axisA);
SH	R25, 6(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,181 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep110
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep110:
; ?FLOC___DualAxisStep?T135 start address is: 32 (R8)
ORI	R8, R0, 255
SEB	R4, R8
; ?FLOC___DualAxisStep?T135 end address is: 32 (R8)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T135 start address is: 32 (R8)
ORI	R8, R0, 1
; ?FLOC___DualAxisStep?T135 end address is: 32 (R8)
SEB	R4, R8
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T135 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T135 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,182 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,183 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep111:
; ?FLOC___DualAxisStep?T143 start address is: 32 (R8)
ORI	R8, R0, 255
SEB	R4, R8
; ?FLOC___DualAxisStep?T143 end address is: 32 (R8)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
; ?FLOC___DualAxisStep?T143 start address is: 32 (R8)
ORI	R8, R0, 1
; ?FLOC___DualAxisStep?T143 end address is: 32 (R8)
SEB	R4, R8
L_DualAxisStep26:
; ?FLOC___DualAxisStep?T143 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T143 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,188 :: 		STPS[axisA].dist =  labs(tempA);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 64(SP)
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	_labs+0
NOP	
LW	R3, 64(SP)
SW	R2, 0(R3)
;Kinematics.c,189 :: 		STPS[axisB].dist =  labs(tempB);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 64(SP)
LW	R25, 24(SP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
LW	R3, 64(SP)
SW	R2, 0(R3)
;Kinematics.c,192 :: 		while(DMA_IsOn(1));
L_DualAxisStep27:
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
BNE	R2, R0, L__DualAxisStep113
NOP	
J	L_DualAxisStep28
NOP	
L__DualAxisStep113:
J	L_DualAxisStep27
NOP	
L_DualAxisStep28:
;Kinematics.c,194 :: 		,STPS[axisA].dist,STPS[axisB].dist);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R3, 0(R2)
;Kinematics.c,193 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n"
ADDIU	R23, SP, 36
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 36
;Kinematics.c,194 :: 		,STPS[axisA].dist,STPS[axisB].dist);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
ADDIU	SP, SP, -12
SW	R4, 8(SP)
SW	R3, 4(SP)
;Kinematics.c,193 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n"
SW	R2, 0(SP)
;Kinematics.c,194 :: 		,STPS[axisA].dist,STPS[axisB].dist);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,197 :: 		if(temp1 >= temp2){//SV.dA >= SV.dB){
LW	R3, 32(SP)
LW	R2, 28(SP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep114:
;Kinematics.c,198 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
SEH	R26, R25
MOV.S 	S12, S14
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,199 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,200 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,201 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//STPS[axisB].dist,STPS[axisA].dist);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,202 :: 		STPS[axisA].master = MASTER;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,203 :: 		STPS[axisB].master = SLAVE;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,204 :: 		}else{
J	L_DualAxisStep30
NOP	
L_DualAxisStep29:
;Kinematics.c,205 :: 		speed_cntr_Move(tempB,speed,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S14
LW	R25, 24(SP)
JAL	_speed_cntr_Move+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,206 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,207 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,208 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//STPS[axisA].dist,STPS[axisB].dist);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,209 :: 		STPS[axisA].master = SLAVE;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,210 :: 		STPS[axisB].master = MASTER;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,211 :: 		}
L_DualAxisStep30:
;Kinematics.c,214 :: 		SV.prevA = axis_a;
SWC1	S12, Offset(_SV+40)(GP)
;Kinematics.c,215 :: 		SV.prevB = axis_b;
SWC1	S13, Offset(_SV+44)(GP)
;Kinematics.c,217 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,218 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,219 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,220 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 68
LW	R2, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,222 :: 		Start_Interpolation(axisA,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
JAL	_Start_Interpolation+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,223 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,259 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -196
SW	RA, 0(SP)
; axis_1 start address is: 20 (R5)
LH	R5, 196(SP)
LH	R2, 198(SP)
SH	R2, 198(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 200(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 201(SP)
;Kinematics.c,260 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 180
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,265 :: 		int count = 0;
;Kinematics.c,266 :: 		char limit_error = 0;
;Kinematics.c,268 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S4, 0(R2)
ADD.S 	S3, S0, S4
SWC1	S3, 24(SP)
;Kinematics.c,269 :: 		center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
ADDU	R2, R27, R3
LWC1	S2, 0(R2)
ADD.S 	S1, S0, S2
SWC1	S1, 28(SP)
;Kinematics.c,270 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
SWC1	S0, 32(SP)
;Kinematics.c,271 :: 		r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
SWC1	S0, 36(SP)
;Kinematics.c,272 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,273 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S1
; rt_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,274 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 198(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
SUB.S 	S0, S0, S1
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,276 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 180
ADDU	R2, R2, R3
SWC1	S1, 0(R2)
;Kinematics.c,283 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S5
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S4
SUB.S 	S2, S1, S0
;Kinematics.c,284 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S4
; rt_axis0 end address is: 32 (R8)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S5
; rt_axis1 end address is: 40 (R10)
ADD.S 	S0, S1, S0
;Kinematics.c,292 :: 		angular_travel = atan2(y,x);
SW	R26, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LW	R26, 4(SP)
; angular_travel start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,295 :: 		if(isclockwise > 0) {
ANDI	R2, R7, 255
; isclockwise end address is: 28 (R7)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc31
NOP	
L__mc_arc116:
;Kinematics.c,296 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc117
NOP	
J	L__mc_arc85
NOP	
L__mc_arc117:
;Kinematics.c,297 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
SUB.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc32
NOP	
L__mc_arc85:
;Kinematics.c,296 :: 		if (angular_travel >= 0)
;Kinematics.c,297 :: 		angular_travel -= PIx2;
L_mc_arc32:
;Kinematics.c,298 :: 		}else {
; angular_travel start address is: 32 (R8)
J	L_mc_arc33
NOP	
L_mc_arc31:
;Kinematics.c,299 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc118
NOP	
J	L__mc_arc86
NOP	
L__mc_arc118:
;Kinematics.c,300 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S4, S1
J	L_mc_arc34
NOP	
L__mc_arc86:
;Kinematics.c,299 :: 		if(angular_travel <= 0)
;Kinematics.c,300 :: 		angular_travel += PIx2;
L_mc_arc34:
;Kinematics.c,301 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc33:
;Kinematics.c,320 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
; angular_travel start address is: 32 (R8)
SWC1	S12, 4(SP)
MOV.S 	S12, S3
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
MUL.S 	S1, S4, S13
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
;Kinematics.c,321 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc119
NOP	
J	L_mc_arc35
NOP	
L__mc_arc119:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 32 (R8)
; mm_of_travel end address is: 16 (R4)
; axis_1 end address is: 20 (R5)
J	L_end_mc_arc
NOP	
L_mc_arc35:
;Kinematics.c,323 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
; axis_1 start address is: 20 (R5)
; mm_of_travel start address is: 16 (R4)
; angular_travel start address is: 32 (R8)
; linear_travel start address is: 24 (R6)
; invert_feed_rate start address is: 24 (R6)
LWC1	S0, Offset(_settings+36)(GP)
DIV.S 	S0, S2, S0
; mm_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
SWC1	S0, 48(SP)
;Kinematics.c,328 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc121
NOP	
J	L_mc_arc36
NOP	
L__mc_arc121:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,329 :: 		feed_rate *= segments;
LWC1	S0, 48(SP)
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc36:
;Kinematics.c,332 :: 		theta_per_segment = angular_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
SWC1	S2, 40(SP)
;Kinematics.c,337 :: 		linear_per_segment = linear_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S0, S3, S0
; linear_travel end address is: 24 (R6)
SWC1	S0, 44(SP)
;Kinematics.c,340 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 52(SP)
;Kinematics.c,341 :: 		sin_T = theta_per_segment;
SWC1	S2, 56(SP)
;Kinematics.c,344 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 180
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,345 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,346 :: 		DisableStepperInterrupt(X);
SH	R5, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
MOVZ	R25, R0, R0
JAL	_DisableStepperInterrupt+0
NOP	
;Kinematics.c,347 :: 		DisableStepperInterrupt(Y);
ORI	R25, R0, 1
JAL	_DisableStepperInterrupt+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R5, 4(SP)
;Kinematics.c,361 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, 68(SP)
; axis_1 end address is: 20 (R5)
L_mc_arc37:
; axis_1 start address is: 20 (R5)
LWC1	S1, 48(SP)
LWC1	S0, 68(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc122
NOP	
J	L_mc_arc38
NOP	
L__mc_arc122:
;Kinematics.c,363 :: 		if (count < settings.n_arc_correction) {
LHU	R3, Offset(_settings+48)(GP)
LH	R2, 192(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc123
NOP	
J	L_mc_arc40
NOP	
L__mc_arc123:
;Kinematics.c,365 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 56(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 52(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,366 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 52(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 56(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 32(SP)
;Kinematics.c,367 :: 		r_axis1 = r_axisi;
SWC1	S3, 36(SP)
;Kinematics.c,368 :: 		count++;
LH	R2, 192(SP)
ADDIU	R2, R2, 1
SH	R2, 192(SP)
;Kinematics.c,369 :: 		} else {
J	L_mc_arc41
NOP	
L_mc_arc40:
;Kinematics.c,372 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 68(SP)
MUL.S 	S0, S0, S1
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,373 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 68(SP)
MUL.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,374 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S3, S1, S5
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 32(SP)
;Kinematics.c,375 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S5
; cos_Ti end address is: 40 (R10)
SUB.S 	S0, S1, S0
SWC1	S0, 36(SP)
;Kinematics.c,376 :: 		count = 0;
SH	R0, 192(SP)
;Kinematics.c,377 :: 		}
L_mc_arc41:
;Kinematics.c,380 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 180
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,381 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,382 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 198(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 44(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,383 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 60(SP)
;Kinematics.c,384 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,386 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc125
NOP	
J	L_mc_arc42
NOP	
L__mc_arc125:
;Kinematics.c,387 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 60(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 60(SP)
;Kinematics.c,388 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 64(SP)
;Kinematics.c,389 :: 		}
L_mc_arc42:
;Kinematics.c,392 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,393 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,401 :: 		if(position[axis_0] > target[axis_0]){
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc126
NOP	
J	L_mc_arc43
NOP	
L__mc_arc126:
;Kinematics.c,402 :: 		if(nPx < target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 60(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc127
NOP	
J	L_mc_arc44
NOP	
L__mc_arc127:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 60(SP)
L_mc_arc44:
;Kinematics.c,403 :: 		}else if(position[axis_0] < target[axis_0]){
J	L_mc_arc45
NOP	
L_mc_arc43:
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc128
NOP	
J	L_mc_arc46
NOP	
L__mc_arc128:
;Kinematics.c,404 :: 		if(nPx > target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 60(SP)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc129
NOP	
J	L_mc_arc47
NOP	
L__mc_arc129:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 60(SP)
L_mc_arc47:
;Kinematics.c,405 :: 		}
L_mc_arc46:
L_mc_arc45:
;Kinematics.c,407 :: 		if(position[axis_1] > target[axis_1]){
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc130
NOP	
J	L_mc_arc48
NOP	
L__mc_arc130:
;Kinematics.c,408 :: 		if(nPy <= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc131
NOP	
J	L_mc_arc49
NOP	
L__mc_arc131:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc49:
;Kinematics.c,409 :: 		}else if(position[axis_1] < target[axis_1]){
J	L_mc_arc50
NOP	
L_mc_arc48:
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc132
NOP	
J	L_mc_arc51
NOP	
L__mc_arc132:
;Kinematics.c,410 :: 		if(nPy >= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc133
NOP	
J	L_mc_arc52
NOP	
L__mc_arc133:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc52:
;Kinematics.c,411 :: 		}
L_mc_arc51:
L_mc_arc50:
;Kinematics.c,414 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
SH	R5, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
SEH	R26, R5
SEH	R25, R28
MOV.S 	S14, S12
LWC1	S13, 64(SP)
LWC1	S12, 60(SP)
JAL	_DualAxisStep+0
NOP	
; axis_1 end address is: 20 (R5)
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R5, 4(SP)
SEH	R3, R5
;Kinematics.c,418 :: 		while(1){
L_mc_arc53:
;Kinematics.c,424 :: 		if(!Get_Axis_IEnable_States()||SV.mode_complete < 1)
; axis_1 start address is: 12 (R3)
SH	R3, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
JAL	_Get_Axis_IEnable_States+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R3, 4(SP)
BNE	R2, R0, L__mc_arc135
NOP	
J	L__mc_arc84
NOP	
L__mc_arc135:
LH	R2, Offset(_SV+2)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__mc_arc136
NOP	
J	L__mc_arc83
NOP	
L__mc_arc136:
J	L_mc_arc57
NOP	
L__mc_arc84:
L__mc_arc83:
;Kinematics.c,425 :: 		break;
J	L_mc_arc54
NOP	
L_mc_arc57:
;Kinematics.c,426 :: 		}
J	L_mc_arc53
NOP	
L_mc_arc54:
;Kinematics.c,427 :: 		SV.mode_complete = 0;
SH	R0, Offset(_SV+2)(GP)
; axis_1 end address is: 12 (R3)
SEH	R4, R3
;Kinematics.c,433 :: 		while(DMA_IsOn(1));
L_mc_arc58:
; axis_1 start address is: 16 (R4)
SH	R4, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R4, 4(SP)
BNE	R2, R0, L__mc_arc138
NOP	
J	L_mc_arc59
NOP	
L__mc_arc138:
J	L_mc_arc58
NOP	
L_mc_arc59:
;Kinematics.c,439 :: 		,i,segments,nPx,nPy,target[axis_0],target[axis_1],SV.mode_complete);
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
;Kinematics.c,438 :: 		[SV.mode_complete:= %d\r\n"
ADDIU	R23, SP, 72
ADDIU	R22, R23, 105
LUI	R24, hi_addr(?ICS?lstr3_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 72
;Kinematics.c,439 :: 		,i,segments,nPx,nPy,target[axis_0],target[axis_1],SV.mode_complete);
LH	R2, Offset(_SV+2)(GP)
SH	R4, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
ADDIU	SP, SP, -32
SH	R2, 28(SP)
SWC1	S1, 24(SP)
SWC1	S0, 20(SP)
LW	R2, 96(SP)
SW	R2, 16(SP)
LW	R2, 92(SP)
SW	R2, 12(SP)
LW	R2, 80(SP)
SW	R2, 8(SP)
LW	R2, 100(SP)
SW	R2, 4(SP)
;Kinematics.c,438 :: 		[SV.mode_complete:= %d\r\n"
SW	R3, 0(SP)
;Kinematics.c,439 :: 		,i,segments,nPx,nPy,target[axis_0],target[axis_1],SV.mode_complete);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R4, 4(SP)
;Kinematics.c,361 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LWC1	S1, 68(SP)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 68(SP)
;Kinematics.c,442 :: 		}
SEH	R5, R4
; axis_1 end address is: 16 (R4)
J	L_mc_arc37
NOP	
L_mc_arc38:
;Kinematics.c,444 :: 		SV.cir = 0;
; axis_1 start address is: 20 (R5)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,446 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SH	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SEH	R26, R5
SEH	R25, R28
; axis_1 end address is: 20 (R5)
MOV.S 	S14, S12
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 4(SP)
;Kinematics.c,448 :: 		SV.mode_complete = 0;
SH	R0, Offset(_SV+2)(GP)
;Kinematics.c,454 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 196
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,458 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,459 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,460 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,468 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,469 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection141
NOP	
J	L_GetAxisDirection60
NOP	
L__GetAxisDirection141:
; ?FLOC___GetAxisDirection?T514 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T514 end address is: 8 (R2)
J	L_GetAxisDirection61
NOP	
L_GetAxisDirection60:
; ?FLOC___GetAxisDirection?T514 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T514 end address is: 8 (R2)
L_GetAxisDirection61:
; ?FLOC___GetAxisDirection?T514 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T514 end address is: 8 (R2)
;Kinematics.c,470 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,482 :: 		int Home(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,486 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home143
NOP	
J	L_Home62
NOP	
L__Home143:
;Kinematics.c,487 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,490 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 4(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 4(SP)
SH	R25, 4(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,493 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,496 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,499 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,502 :: 		EnableStepper(axis);//sort this out
SH	R25, 4(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,505 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,508 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__Home144
NOP	
J	L_Home63
NOP	
L__Home144:
;Kinematics.c,510 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,512 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,513 :: 		}
L_Home63:
;Kinematics.c,517 :: 		Home_Axis(-(max_sizes[axis]+100.0),speed,axis);
LWC1	S0, Offset(Home_speed_L0+0)(GP)
CVT32.W 	S2, S0
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_max_sizes+0)
ORI	R2, R2, lo_addr(_max_sizes+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S1, S1, S0
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SH	R25, 4(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,527 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,528 :: 		}
L_Home62:
;Kinematics.c,532 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home145
NOP	
J	L_Home64
NOP	
L__Home145:
;Kinematics.c,537 :: 		if(FN(axis)){
SH	R25, 4(SP)
JAL	_FN+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home147
NOP	
J	L_Home65
NOP	
L__Home147:
;Kinematics.c,540 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,541 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,550 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home148
NOP	
J	L_Home66
NOP	
L__Home148:
;Kinematics.c,552 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home149
NOP	
J	L_Home67
NOP	
L__Home149:
;Kinematics.c,555 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home150
NOP	
J	L_Home68
NOP	
L__Home150:
;Kinematics.c,557 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,558 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,561 :: 		VDelay_ms((unsigned long)settings.homing_debounce_delay);
LHU	R2, Offset(_settings+54)(GP)
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_VDelay_ms+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,565 :: 		Home_Axis(12.0,settings.homing_feed_rate, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,567 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home69
NOP	
L_Home68:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home151
NOP	
J	L_Home70
NOP	
L__Home151:
;Kinematics.c,569 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,570 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,571 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,573 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,576 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,588 :: 		Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
LWC1	S12, Offset(_settings+32)(GP)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,590 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,591 :: 		}
L_Home70:
L_Home69:
;Kinematics.c,592 :: 		}
L_Home67:
;Kinematics.c,597 :: 		}
L_Home66:
;Kinematics.c,598 :: 		}
L_Home65:
;Kinematics.c,606 :: 		if(FP(axis)){
SH	R25, 4(SP)
JAL	_FP+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home153
NOP	
J	L_Home71
NOP	
L__Home153:
;Kinematics.c,608 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,609 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home155
NOP	
J	L_Home72
NOP	
L__Home155:
;Kinematics.c,610 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,613 :: 		Home_Axis(-290.00,settings.homing_feed_rate,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,614 :: 		}
L_Home72:
;Kinematics.c,623 :: 		}
L_Home71:
;Kinematics.c,624 :: 		}
L_Home64:
;Kinematics.c,625 :: 		return axis;
SEH	R2, R25
;Kinematics.c,626 :: 		}
L_end_Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,629 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,631 :: 		StopAxis(axis);
SH	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 4(SP)
;Kinematics.c,632 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,642 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R2, 16(SP)
SH	R25, 4(SP)
SWC1	S13, 8(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 8(SP)
LH	R25, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,644 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,646 :: 		speed = Get_Step_Rate(speed,axis);
SH	R25, 4(SP)
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
LH	R25, 4(SP)
MOV.S 	S13, S0
;Kinematics.c,647 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
MTC1	R2, S1
CVT32.W 	S1, S1
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,648 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,650 :: 		static void ResetHoming(){
;Kinematics.c,651 :: 		int i = 0;
;Kinematics.c,652 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming73:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming158
NOP	
J	L_Kinematics_ResetHoming74
NOP	
L_Kinematics_ResetHoming158:
;Kinematics.c,653 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,654 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,652 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,655 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming73
NOP	
L_Kinematics_ResetHoming74:
;Kinematics.c,656 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,663 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,665 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset160
NOP	
J	L_mc_reset76
NOP	
L__mc_reset160:
;Kinematics.c,666 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,676 :: 		switch (sys.state) {
J	L_mc_reset77
NOP	
;Kinematics.c,677 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset79:
L_mc_reset80:
L_mc_reset81:
;Kinematics.c,678 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,679 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,680 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,681 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,682 :: 		}
J	L_mc_reset78
NOP	
L_mc_reset77:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset162
NOP	
J	L_mc_reset79
NOP	
L__mc_reset162:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset164
NOP	
J	L_mc_reset80
NOP	
L__mc_reset164:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset166
NOP	
J	L_mc_reset81
NOP	
L__mc_reset166:
L_mc_reset78:
;Kinematics.c,683 :: 		}
L_mc_reset76:
;Kinematics.c,684 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
