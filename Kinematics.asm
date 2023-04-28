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
BNE	R2, R0, L__SetInitialSizes81
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes81:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection83
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection83:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection85
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection85:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection87
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection87:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection89
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection89:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection91
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection91:
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
BNE	R2, R0, L__SingleAxisStep94
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep94:
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
BEQ	R3, R2, L__SingleAxisStep95
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep95:
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
BEQ	R2, R0, L__SingleAxisStep96
NOP	
J	L_SingleAxisStep15
NOP	
L__SingleAxisStep96:
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
BNE	R2, R0, L_Kinematics_SingleAxisStart98
NOP	
J	L_Kinematics_SingleAxisStart17
NOP	
L_Kinematics_SingleAxisStart98:
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
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Kinematics.c,137 :: 		if(SV.prevA == axis_a){
LWC1	S0, Offset(_SV+40)(GP)
C.EQ.S 	0, S0, S12
BC1T	0, L__DualAxisStep100
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep100:
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
BC1T	0, L__DualAxisStep101
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep101:
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
BEQ	R3, R2, L__DualAxisStep102
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep102:
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
;Kinematics.c,168 :: 		SV.over = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,169 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+20)(GP)
;Kinematics.c,172 :: 		SV.Single_Dual = DUAL;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,173 :: 		Single_Axis_Enable(axisA);
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
;Kinematics.c,174 :: 		Single_Axis_Enable(axisB);
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
;Kinematics.c,178 :: 		Set_Axisdirection(tempA,axisA);
SH	R25, 6(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,179 :: 		STPS[axisA].axis_dir = Direction(tempA);
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
BNE	R2, R0, L__DualAxisStep103
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep103:
; ?FLOC___DualAxisStep?T135 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T135 end address is: 24 (R6)
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
; ?FLOC___DualAxisStep?T135 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T135 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T135 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T135 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,180 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,181 :: 		STPS[axisB].axis_dir = Direction(tempB);
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
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep104:
; ?FLOC___DualAxisStep?T143 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T143 end address is: 24 (R6)
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
; ?FLOC___DualAxisStep?T143 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T143 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep26:
; ?FLOC___DualAxisStep?T143 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T143 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,186 :: 		STPS[axisA].dist = SV.dA = labs(tempA);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 56(SP)
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+24)(GP)
LW	R3, 56(SP)
SW	R2, 0(R3)
;Kinematics.c,187 :: 		STPS[axisB].dist = SV.dB = labs(tempB);
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 56(SP)
LW	R25, 24(SP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
SW	R2, Offset(_SV+28)(GP)
LW	R3, 56(SP)
SW	R2, 0(R3)
;Kinematics.c,190 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep28
NOP	
L__DualAxisStep106:
J	L_DualAxisStep27
NOP	
L_DualAxisStep28:
;Kinematics.c,191 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n"
ADDIU	R23, SP, 28
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 28
;Kinematics.c,192 :: 		,SV.dA,SV.dB);
LW	R2, Offset(_SV+28)(GP)
SH	R26, 4(SP)
SH	R25, 6(SP)
SWC1	S14, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_SV+24)(GP)
SW	R2, 4(SP)
;Kinematics.c,191 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n"
SW	R3, 0(SP)
;Kinematics.c,192 :: 		,SV.dA,SV.dB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LWC1	S14, 8(SP)
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,195 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep107:
;Kinematics.c,196 :: 		speed_cntr_Move(tempA,speed,axisA);
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
;Kinematics.c,197 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
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
;Kinematics.c,198 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
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
;Kinematics.c,199 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//STPS[axisB].dist,STPS[axisA].dist);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,200 :: 		STPS[axisA].master = MASTER;
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
;Kinematics.c,201 :: 		STPS[axisB].master = SLAVE;
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
;Kinematics.c,202 :: 		}else{
J	L_DualAxisStep30
NOP	
L_DualAxisStep29:
;Kinematics.c,203 :: 		speed_cntr_Move(tempB,speed,axisB);
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
;Kinematics.c,204 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
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
;Kinematics.c,205 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
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
;Kinematics.c,206 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//STPS[axisA].dist,STPS[axisB].dist);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+28)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,207 :: 		STPS[axisA].master = SLAVE;
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
;Kinematics.c,208 :: 		STPS[axisB].master = MASTER;
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
;Kinematics.c,209 :: 		}
L_DualAxisStep30:
;Kinematics.c,212 :: 		SV.prevA = axis_a;
SWC1	S12, Offset(_SV+40)(GP)
;Kinematics.c,213 :: 		SV.prevB = axis_b;
SWC1	S13, Offset(_SV+44)(GP)
;Kinematics.c,215 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,216 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,217 :: 		STPS[axisA].mmToTravel = tempA;
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
;Kinematics.c,218 :: 		STPS[axisB].mmToTravel = tempB;
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
;Kinematics.c,220 :: 		Start_Interpolation(axisA,axisB);
SH	R26, 4(SP)
SH	R25, 6(SP)
JAL	_Start_Interpolation+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,221 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,257 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
; axis_1 start address is: 20 (R5)
LH	R5, 92(SP)
LH	R2, 94(SP)
SH	R2, 94(SP)
; invert_feed_rate start address is: 24 (R6)
LBU	R6, 96(SP)
; isclockwise start address is: 28 (R7)
LBU	R7, 97(SP)
;Kinematics.c,258 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 76
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,263 :: 		int count = 0;
;Kinematics.c,264 :: 		char limit_error = 0;
;Kinematics.c,266 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S4, 0(R2)
ADD.S 	S3, S0, S4
SWC1	S3, 24(SP)
;Kinematics.c,267 :: 		center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
ADDU	R2, R27, R3
LWC1	S2, 0(R2)
ADD.S 	S1, S0, S2
SWC1	S1, 28(SP)
;Kinematics.c,268 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
SWC1	S0, 32(SP)
;Kinematics.c,269 :: 		r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
SWC1	S0, 36(SP)
;Kinematics.c,270 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,271 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S1
; rt_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,272 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 94(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
SUB.S 	S0, S0, S1
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,274 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 76
ADDU	R2, R2, R3
SWC1	S1, 0(R2)
;Kinematics.c,281 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S5
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S4
SUB.S 	S2, S1, S0
;Kinematics.c,282 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S4
; rt_axis0 end address is: 32 (R8)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S5
; rt_axis1 end address is: 40 (R10)
ADD.S 	S0, S1, S0
;Kinematics.c,290 :: 		angular_travel = atan2(y,x);
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
;Kinematics.c,293 :: 		if(isclockwise > 0) {
ANDI	R2, R7, 255
; isclockwise end address is: 28 (R7)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc109
NOP	
J	L_mc_arc31
NOP	
L__mc_arc109:
;Kinematics.c,294 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc110
NOP	
J	L__mc_arc78
NOP	
L__mc_arc110:
;Kinematics.c,295 :: 		angular_travel -= PIx2;
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
L__mc_arc78:
;Kinematics.c,294 :: 		if (angular_travel >= 0)
;Kinematics.c,295 :: 		angular_travel -= PIx2;
L_mc_arc32:
;Kinematics.c,296 :: 		}else {
; angular_travel start address is: 32 (R8)
J	L_mc_arc33
NOP	
L_mc_arc31:
;Kinematics.c,297 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc111
NOP	
J	L__mc_arc79
NOP	
L__mc_arc111:
;Kinematics.c,298 :: 		angular_travel += PIx2;
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
L__mc_arc79:
;Kinematics.c,297 :: 		if(angular_travel <= 0)
;Kinematics.c,298 :: 		angular_travel += PIx2;
L_mc_arc34:
;Kinematics.c,299 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
L_mc_arc33:
;Kinematics.c,318 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,319 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc112
NOP	
J	L_mc_arc35
NOP	
L__mc_arc112:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 32 (R8)
; mm_of_travel end address is: 16 (R4)
; axis_1 end address is: 20 (R5)
J	L_end_mc_arc
NOP	
L_mc_arc35:
;Kinematics.c,321 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
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
;Kinematics.c,326 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc114
NOP	
J	L_mc_arc36
NOP	
L__mc_arc114:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,327 :: 		feed_rate *= segments;
LWC1	S0, 48(SP)
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc36:
;Kinematics.c,330 :: 		theta_per_segment = angular_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
SWC1	S2, 40(SP)
;Kinematics.c,335 :: 		linear_per_segment = linear_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S0, S3, S0
; linear_travel end address is: 24 (R6)
SWC1	S0, 44(SP)
;Kinematics.c,338 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,339 :: 		sin_T = theta_per_segment;
SWC1	S2, 56(SP)
;Kinematics.c,342 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,343 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,344 :: 		DisableStepperInterrupt(X);
SH	R5, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
MOVZ	R25, R0, R0
JAL	_DisableStepperInterrupt+0
NOP	
;Kinematics.c,345 :: 		DisableStepperInterrupt(Y);
ORI	R25, R0, 1
JAL	_DisableStepperInterrupt+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R5, 4(SP)
;Kinematics.c,359 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, 72(SP)
; axis_1 end address is: 20 (R5)
L_mc_arc37:
; axis_1 start address is: 20 (R5)
LWC1	S1, 48(SP)
LWC1	S0, 72(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc115
NOP	
J	L_mc_arc38
NOP	
L__mc_arc115:
;Kinematics.c,362 :: 		if (count < settings.n_arc_correction) {
LHU	R3, Offset(_settings+48)(GP)
LH	R2, 88(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc40
NOP	
L__mc_arc116:
;Kinematics.c,364 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 56(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 52(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,365 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 52(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 56(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 32(SP)
;Kinematics.c,366 :: 		r_axis1 = r_axisi;
SWC1	S3, 36(SP)
;Kinematics.c,367 :: 		count++;
LH	R2, 88(SP)
ADDIU	R2, R2, 1
SH	R2, 88(SP)
;Kinematics.c,368 :: 		} else {
J	L_mc_arc41
NOP	
L_mc_arc40:
;Kinematics.c,371 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 72(SP)
MUL.S 	S0, S0, S1
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 60(SP)
;Kinematics.c,372 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 72(SP)
MUL.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,373 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 60(SP)
MUL.S 	S3, S2, S1
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 32(SP)
;Kinematics.c,374 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 36(SP)
;Kinematics.c,375 :: 		count = 0;
SH	R0, 88(SP)
;Kinematics.c,376 :: 		}
L_mc_arc41:
;Kinematics.c,379 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,380 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,381 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 94(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 44(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,382 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,383 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 68(SP)
;Kinematics.c,385 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc118
NOP	
J	L_mc_arc42
NOP	
L__mc_arc118:
;Kinematics.c,386 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 64(SP)
;Kinematics.c,387 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 68(SP)
;Kinematics.c,388 :: 		}
L_mc_arc42:
;Kinematics.c,391 :: 		STPS[axis_0].step_delay = feed_rate;
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
;Kinematics.c,392 :: 		STPS[axis_1].step_delay = feed_rate;
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
;Kinematics.c,400 :: 		if(position[axis_0] > target[axis_0]){
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc119
NOP	
J	L_mc_arc43
NOP	
L__mc_arc119:
;Kinematics.c,401 :: 		if(nPx < target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc120
NOP	
J	L_mc_arc44
NOP	
L__mc_arc120:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc44:
;Kinematics.c,402 :: 		}else if(position[axis_0] < target[axis_0]){
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
BC1F	0, L__mc_arc121
NOP	
J	L_mc_arc46
NOP	
L__mc_arc121:
;Kinematics.c,403 :: 		if(nPx > target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc122
NOP	
J	L_mc_arc47
NOP	
L__mc_arc122:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc47:
;Kinematics.c,404 :: 		}
L_mc_arc46:
L_mc_arc45:
;Kinematics.c,406 :: 		if(position[axis_1] > target[axis_1]){
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc123
NOP	
J	L_mc_arc48
NOP	
L__mc_arc123:
;Kinematics.c,407 :: 		if(nPy <= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc124
NOP	
J	L_mc_arc49
NOP	
L__mc_arc124:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 68(SP)
L_mc_arc49:
;Kinematics.c,408 :: 		}else if(position[axis_1] < target[axis_1]){
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
BC1F	0, L__mc_arc125
NOP	
J	L_mc_arc51
NOP	
L__mc_arc125:
;Kinematics.c,409 :: 		if(nPy >= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc126
NOP	
J	L_mc_arc52
NOP	
L__mc_arc126:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 68(SP)
L_mc_arc52:
;Kinematics.c,410 :: 		}
L_mc_arc51:
L_mc_arc50:
;Kinematics.c,413 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
SH	R5, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
SEH	R26, R5
SEH	R25, R28
MOV.S 	S14, S12
LWC1	S13, 68(SP)
LWC1	S12, 64(SP)
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
;Kinematics.c,417 :: 		while(1){
L_mc_arc53:
;Kinematics.c,424 :: 		if(!Get_Axis_IEnable_States())
; axis_1 start address is: 12 (R3)
; axis_1 start address is: 12 (R3)
; axis_1 end address is: 12 (R3)
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
BEQ	R2, R0, L__mc_arc127
NOP	
J	L_mc_arc55
NOP	
L__mc_arc127:
; axis_1 end address is: 12 (R3)
;Kinematics.c,425 :: 		break;
; axis_1 start address is: 12 (R3)
J	L_mc_arc54
NOP	
L_mc_arc55:
;Kinematics.c,426 :: 		}
J	L_mc_arc53
NOP	
L_mc_arc54:
;Kinematics.c,359 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LWC1	S1, 72(SP)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 72(SP)
;Kinematics.c,441 :: 		}
SEH	R5, R3
; axis_1 end address is: 12 (R3)
J	L_mc_arc37
NOP	
L_mc_arc38:
;Kinematics.c,443 :: 		SV.cir = 0;
; axis_1 start address is: 20 (R5)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,445 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
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
;Kinematics.c,453 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,457 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,458 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,459 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,467 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,468 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection130
NOP	
J	L_GetAxisDirection56
NOP	
L__GetAxisDirection130:
; ?FLOC___GetAxisDirection?T491 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T491 end address is: 8 (R2)
J	L_GetAxisDirection57
NOP	
L_GetAxisDirection56:
; ?FLOC___GetAxisDirection?T491 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T491 end address is: 8 (R2)
L_GetAxisDirection57:
; ?FLOC___GetAxisDirection?T491 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T491 end address is: 8 (R2)
;Kinematics.c,469 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,481 :: 		int Home(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,485 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home132
NOP	
J	L_Home58
NOP	
L__Home132:
;Kinematics.c,486 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,489 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 4(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 4(SP)
SH	R25, 4(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,492 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,495 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,498 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,501 :: 		EnableStepper(axis);//sort this out
SH	R25, 4(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,504 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,507 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__Home133
NOP	
J	L_Home59
NOP	
L__Home133:
;Kinematics.c,509 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,511 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,512 :: 		}
L_Home59:
;Kinematics.c,516 :: 		Home_Axis(-(max_sizes[axis]+100.0),speed,axis);
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
;Kinematics.c,526 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,527 :: 		}
L_Home58:
;Kinematics.c,531 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home134
NOP	
J	L_Home60
NOP	
L__Home134:
;Kinematics.c,536 :: 		if(FN(axis)){
SH	R25, 4(SP)
JAL	_FN+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home136
NOP	
J	L_Home61
NOP	
L__Home136:
;Kinematics.c,539 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,540 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,549 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home137
NOP	
J	L_Home62
NOP	
L__Home137:
;Kinematics.c,551 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home138
NOP	
J	L_Home63
NOP	
L__Home138:
;Kinematics.c,554 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home139
NOP	
J	L_Home64
NOP	
L__Home139:
;Kinematics.c,556 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,557 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,560 :: 		VDelay_ms((unsigned long)settings.homing_debounce_delay);
LHU	R2, Offset(_settings+54)(GP)
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_VDelay_ms+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,564 :: 		Home_Axis(12.0,settings.homing_feed_rate, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,566 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home65
NOP	
L_Home64:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home140
NOP	
J	L_Home66
NOP	
L__Home140:
;Kinematics.c,568 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,569 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,570 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,572 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,575 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,587 :: 		Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
LWC1	S12, Offset(_settings+32)(GP)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,589 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,590 :: 		}
L_Home66:
L_Home65:
;Kinematics.c,591 :: 		}
L_Home63:
;Kinematics.c,596 :: 		}
L_Home62:
;Kinematics.c,597 :: 		}
L_Home61:
;Kinematics.c,605 :: 		if(FP(axis)){
SH	R25, 4(SP)
JAL	_FP+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home142
NOP	
J	L_Home67
NOP	
L__Home142:
;Kinematics.c,607 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,608 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home144
NOP	
J	L_Home68
NOP	
L__Home144:
;Kinematics.c,609 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,612 :: 		Home_Axis(-290.00,settings.homing_feed_rate,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,613 :: 		}
L_Home68:
;Kinematics.c,622 :: 		}
L_Home67:
;Kinematics.c,623 :: 		}
L_Home60:
;Kinematics.c,624 :: 		return axis;
SEH	R2, R25
;Kinematics.c,625 :: 		}
L_end_Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,628 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,630 :: 		StopAxis(axis);
SH	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 4(SP)
;Kinematics.c,631 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,641 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
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
;Kinematics.c,643 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,645 :: 		speed = Get_Step_Rate(speed,axis);
SH	R25, 4(SP)
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
LH	R25, 4(SP)
MOV.S 	S13, S0
;Kinematics.c,646 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
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
;Kinematics.c,647 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,649 :: 		static void ResetHoming(){
;Kinematics.c,650 :: 		int i = 0;
;Kinematics.c,651 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming69:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming147
NOP	
J	L_Kinematics_ResetHoming70
NOP	
L_Kinematics_ResetHoming147:
;Kinematics.c,652 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,653 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,651 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,654 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming69
NOP	
L_Kinematics_ResetHoming70:
;Kinematics.c,655 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,662 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,664 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset149
NOP	
J	L_mc_reset72
NOP	
L__mc_reset149:
;Kinematics.c,665 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,675 :: 		switch (sys.state) {
J	L_mc_reset73
NOP	
;Kinematics.c,676 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset75:
L_mc_reset76:
L_mc_reset77:
;Kinematics.c,677 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,678 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,679 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,680 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,681 :: 		}
J	L_mc_reset74
NOP	
L_mc_reset73:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset151
NOP	
J	L_mc_reset75
NOP	
L__mc_reset151:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset153
NOP	
J	L_mc_reset76
NOP	
L__mc_reset153:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset155
NOP	
J	L_mc_reset77
NOP	
L__mc_reset155:
L_mc_reset74:
;Kinematics.c,682 :: 		}
L_mc_reset72:
;Kinematics.c,683 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
