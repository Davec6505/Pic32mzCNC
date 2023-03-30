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
BNE	R2, R0, L__SetInitialSizes73
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes73:
;Kinematics.c,38 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R2
ADDU	R2, R25, R2
ADDIU	R4, R2, 96
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection75
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection75:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection77
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection77:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection79
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection79:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection81
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection81:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection83
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection83:
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
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,77 :: 		long  absxyz = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
;Kinematics.c,78 :: 		long  tempA  = 0;
;Kinematics.c,79 :: 		int   dir    = 0;
;Kinematics.c,81 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep85
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep85:
;Kinematics.c,83 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,86 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 20 (R5)
MOVZ	R5, R2, R0
;Kinematics.c,95 :: 		}else{
; tempA end address is: 20 (R5)
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep12:
;Kinematics.c,96 :: 		tempA = belt_steps(newxyz,axis_No);
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
;Kinematics.c,97 :: 		}
L_SingleAxisStep13:
;Kinematics.c,99 :: 		Single_Axis_Enable(axis_No);
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
;Kinematics.c,100 :: 		speed_cntr_Move(tempA , speed , axis_No);
SW	R5, 12(SP)
SH	R26, 16(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
MOVZ	R25, R5, R0
JAL	_speed_cntr_Move+0
NOP	
LH	R26, 16(SP)
LW	R5, 12(SP)
;Kinematics.c,105 :: 		Set_Axisdirection(tempA,axis_No);
MOVZ	R25, R5, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,106 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R5, 0
BNE	R2, R0, L__SingleAxisStep86
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep86:
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
;Kinematics.c,107 :: 		SV.Single_Dual = 0;
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,108 :: 		STPS[axis_No].psingle  = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Kinematics.c,109 :: 		STPS[axis_No].dist = labs(tempA) - STPS[axis_No].psingle;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
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
ADDIU	R3, R3, 52
LW	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 24(SP)
SW	R3, 0(R2)
;Kinematics.c,110 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,111 :: 		STPS[axis_No].mmToTravel = tempA;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R5, 0(R2)
; tempA end address is: 20 (R5)
;Kinematics.c,113 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,115 :: 		}
L_end_SingleAxisStep:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,120 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,long speed){
ADDIU	SP, SP, -56
SW	RA, 0(SP)
;Kinematics.c,125 :: 		if(gc.absolute_mode == true){
SW	R27, 4(SP)
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep88
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep88:
;Kinematics.c,127 :: 		tempA = belt_steps(axis_a,axisA);
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
;Kinematics.c,128 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,130 :: 		tempA = tempA - STPS[axisA].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R4, 0(R3)
LW	R3, 20(SP)
SUBU	R3, R3, R4
SW	R3, 20(SP)
;Kinematics.c,131 :: 		tempB = tempB - STPS[axisB].steps_abs_position;
SEH	R4, R26
ORI	R3, R0, 100
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 84
LW	R3, 0(R3)
SUBU	R2, R2, R3
SW	R2, 24(SP)
;Kinematics.c,132 :: 		}else{
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
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
SW	R2, 20(SP)
;Kinematics.c,134 :: 		tempB = belt_steps(axis_b,axisB);
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
;Kinematics.c,135 :: 		}
L_DualAxisStep17:
;Kinematics.c,136 :: 		SV.over = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,137 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+8)(GP)
;Kinematics.c,140 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,141 :: 		Single_Axis_Enable(axisA);
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
;Kinematics.c,142 :: 		Single_Axis_Enable(axisB);
SH	R26, 12(SP)
SH	R25, 14(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,157 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R26, R25
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,158 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep89
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep89:
; ?FLOC___DualAxisStep?T103 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T103 end address is: 16 (R4)
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
; ?FLOC___DualAxisStep?T103 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T103 end address is: 16 (R4)
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T103 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T103 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,159 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 8(SP)
LW	R25, 24(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,160 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 24(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep90
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep90:
; ?FLOC___DualAxisStep?T111 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___DualAxisStep?T111 end address is: 16 (R4)
J	L_DualAxisStep21
NOP	
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T111 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___DualAxisStep?T111 end address is: 16 (R4)
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T111 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T111 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,163 :: 		SV.dA   = tempA;// - SV.prevA;
LW	R2, 20(SP)
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,164 :: 		SV.dB   = tempB;// - SV.prevB;
LW	R2, 24(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,165 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 28(SP)
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,168 :: 		SV.dA = labs(SV.dA);
SH	R25, 8(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,169 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,172 :: 		if(!DMA_IsOn(1));
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
BEQ	R2, R0, L__DualAxisStep91
NOP	
J	L_DualAxisStep22
NOP	
L__DualAxisStep91:
L_DualAxisStep22:
;Kinematics.c,173 :: 		dma_printf("SV.dA:= %l\tSV.dB:= %l\n",SV.dA,SV.dB);
ADDIU	R23, SP, 32
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 32
LW	R2, Offset(_SV+16)(GP)
SW	R27, 8(SP)
SH	R26, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 14(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
;Kinematics.c,177 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep92
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep92:
;Kinematics.c,178 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep93
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep93:
;Kinematics.c,179 :: 		speed_cntr_Move(tempA,speed,axisA);
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R26, R27, R0
SEH	R27, R25
LW	R25, 20(SP)
JAL	_speed_cntr_Move+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,180 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,181 :: 		}
L_DualAxisStep24:
;Kinematics.c,183 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,184 :: 		STPS[axisA].master = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,185 :: 		STPS[axisB].master = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,186 :: 		}
J	L_DualAxisStep25
NOP	
L_DualAxisStep23:
;Kinematics.c,188 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep94
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep94:
;Kinematics.c,189 :: 		speed_cntr_Move(tempB,speed,axisB);
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
;Kinematics.c,190 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R4)
;Kinematics.c,191 :: 		}
L_DualAxisStep26:
;Kinematics.c,193 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,194 :: 		STPS[axisA].master = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 0, 1
SB	R2, 0(R3)
;Kinematics.c,195 :: 		STPS[axisB].master = 1;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Kinematics.c,196 :: 		}
L_DualAxisStep25:
;Kinematics.c,198 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,199 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,200 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,201 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,203 :: 		Axis_Interpolate(axisA,axisB);
JAL	_Axis_Interpolate+0
NOP	
;Kinematics.c,208 :: 		}
L_end_DualAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 56
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,244 :: 		, float radius, char isclockwise){
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
;Kinematics.c,246 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
; center_axis0 start address is: 48 (R12)
MOV.S 	S6, S4
;Kinematics.c,247 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
; center_axis1 start address is: 56 (R14)
MOV.S 	S7, S2
;Kinematics.c,248 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
SEH	R2, R7
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,249 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
; r_axis0 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,250 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; r_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,251 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,252 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 72 (R18)
MOV.S 	S9, S0
;Kinematics.c,253 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,254 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,255 :: 		float angular_travel          = 0.00;
;Kinematics.c,256 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,257 :: 		float rads                    = 0.00;
;Kinematics.c,258 :: 		long  segments                = 0;
;Kinematics.c,259 :: 		float cos_T                   = 0.00;
;Kinematics.c,260 :: 		float sin_T                   = 0.00;
;Kinematics.c,266 :: 		long i                         = 0;
;Kinematics.c,267 :: 		int count = 0;
; count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Kinematics.c,268 :: 		char n_arc_correction = 3; //to be sorted int global struct???
; n_arc_correction start address is: 32 (R8)
ORI	R8, R0, 3
;Kinematics.c,269 :: 		char limit_error = 0;
; limit_error start address is: 36 (R9)
MOVZ	R9, R0, R0
;Kinematics.c,271 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 76
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,276 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,279 :: 		if(isclockwise) {
BNE	R10, R0, L__mc_arc97
NOP	
J	L__mc_arc70
NOP	
L__mc_arc97:
; isclockwise end address is: 40 (R10)
;Kinematics.c,281 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc98
NOP	
J	L_mc_arc28
NOP	
L__mc_arc98:
;Kinematics.c,282 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
J	L_mc_arc29
NOP	
L_mc_arc28:
;Kinematics.c,284 :: 		if(angular_travel <= 0)
; angular_travel start address is: 32 (R8)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc99
NOP	
J	L__mc_arc69
NOP	
L__mc_arc99:
;Kinematics.c,285 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc30
NOP	
L__mc_arc69:
;Kinematics.c,284 :: 		if(angular_travel <= 0)
MOV.S 	S0, S4
;Kinematics.c,285 :: 		angular_travel += PIx2;
L_mc_arc30:
;Kinematics.c,286 :: 		}
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
L_mc_arc29:
;Kinematics.c,287 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
J	L_mc_arc27
NOP	
L__mc_arc70:
;Kinematics.c,279 :: 		if(isclockwise) {
;Kinematics.c,287 :: 		}
L_mc_arc27:
;Kinematics.c,290 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,291 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc100
NOP	
J	L_mc_arc31
NOP	
L__mc_arc100:
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
L_mc_arc31:
;Kinematics.c,293 :: 		segments = (long)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
;Kinematics.c,298 :: 		if (invert_feed_rate)
BNE	R12, R0, L__mc_arc102
NOP	
J	L__mc_arc71
NOP	
L__mc_arc102:
; invert_feed_rate end address is: 48 (R12)
;Kinematics.c,299 :: 		feed_rate *= segments;
MUL	R2, R11, R10
MOVZ	R11, R2, R0
; feed_rate end address is: 44 (R11)
J	L_mc_arc32
NOP	
L__mc_arc71:
;Kinematics.c,298 :: 		if (invert_feed_rate)
;Kinematics.c,299 :: 		feed_rate *= segments;
L_mc_arc32:
;Kinematics.c,302 :: 		theta_per_segment = angular_travel/(float)segments;
; feed_rate start address is: 44 (R11)
MTC1	R10, S0
CVT32.W 	S0, S0
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
; theta_per_segment start address is: 32 (R8)
MOV.S 	S4, S2
;Kinematics.c,307 :: 		linear_per_segment = linear_travel/(float)segments;
DIV.S 	S0, S8, S0
; linear_travel end address is: 64 (R16)
; linear_per_segment start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,310 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,311 :: 		sin_T = theta_per_segment;
; sin_T start address is: 128 (R32)
MOV.S 	S16, S2
;Kinematics.c,313 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,314 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,315 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,316 :: 		i = 0;
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
;Kinematics.c,327 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc33:
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
BNE	R2, R0, L__mc_arc103
NOP	
J	L_mc_arc34
NOP	
L__mc_arc103:
;Kinematics.c,329 :: 		if (count < n_arc_correction) {
SEH	R3, R4
ANDI	R2, R10, 255
SLT	R2, R3, R2
BNE	R2, R0, L__mc_arc104
NOP	
J	L_mc_arc35
NOP	
L__mc_arc104:
;Kinematics.c,331 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
MUL.S 	S1, S4, S16
MUL.S 	S0, S3, S17
ADD.S 	S2, S1, S0
;Kinematics.c,332 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
MUL.S 	S1, S4, S17
; r_axis0 end address is: 32 (R8)
MUL.S 	S0, S3, S16
; r_axis1 end address is: 24 (R6)
SUB.S 	S0, S1, S0
; r_axis0 start address is: 80 (R20)
MOV.S 	S10, S0
;Kinematics.c,333 :: 		r_axis1 = r_axisi;
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S2
;Kinematics.c,334 :: 		count++;
ADDIU	R2, R4, 1
; count end address is: 16 (R4)
; count start address is: 48 (R12)
SEH	R12, R2
;Kinematics.c,335 :: 		} else {
SH	R12, 4(SP)
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
LH	R12, 4(SP)
J	L_mc_arc36
NOP	
L_mc_arc35:
;Kinematics.c,338 :: 		cos_Ti = cos(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
; cos_Ti start address is: 88 (R22)
MOV.S 	S11, S0
;Kinematics.c,339 :: 		sin_Ti = sin(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,340 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,341 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
MUL.S 	S0, S2, S11
; cos_Ti end address is: 88 (R22)
SUB.S 	S0, S1, S0
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,342 :: 		count = 0;
; count start address is: 48 (R12)
MOVZ	R12, R0, R0
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
SH	R12, 4(SP)
LH	R12, 4(SP)
;Kinematics.c,343 :: 		}
L_mc_arc36:
;Kinematics.c,346 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
; count start address is: 48 (R12)
; r_axis1 start address is: 48 (R12)
; r_axis0 start address is: 80 (R20)
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S9, S10
SWC1	S0, 0(R2)
;Kinematics.c,347 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S8, S6
SWC1	S0, 0(R2)
;Kinematics.c,348 :: 		arc_target[axis_linear] += linear_per_segment;
SEH	R2, R11
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S0, S5
SWC1	S0, 0(R2)
;Kinematics.c,349 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S4, 0(R2)
SUB.S 	S3, S0, S4
;Kinematics.c,350 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S2, 0(R2)
SUB.S 	S1, S0, S2
;Kinematics.c,352 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
ADD.S 	S0, S3, S4
; nPx start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,353 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
ADD.S 	S0, S1, S2
; nPy start address is: 0 (R0)
;Kinematics.c,356 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc106
NOP	
J	L_mc_arc37
NOP	
L__mc_arc106:
;Kinematics.c,357 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,358 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R6
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,359 :: 		}
L_mc_arc37:
;Kinematics.c,362 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
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
;Kinematics.c,364 :: 		while(1){
L_mc_arc38:
;Kinematics.c,371 :: 		if(!OC5IE_bit && !OC2IE_bit)
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
BEQ	R2, R0, L__mc_arc107
NOP	
J	L__mc_arc68
NOP	
L__mc_arc107:
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
BEQ	R2, R0, L__mc_arc108
NOP	
J	L__mc_arc67
NOP	
L__mc_arc108:
L__mc_arc66:
;Kinematics.c,372 :: 		break;
J	L_mc_arc39
NOP	
;Kinematics.c,371 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc68:
L__mc_arc67:
;Kinematics.c,373 :: 		}
SWC1	S3, 4(SP)
SWC1	S4, 8(SP)
SB	R10, 12(SP)
LBU	R10, 12(SP)
LWC1	S4, 8(SP)
LWC1	S3, 4(SP)
J	L_mc_arc38
NOP	
L_mc_arc39:
;Kinematics.c,377 :: 		if(limit_error)
BNE	R9, R0, L__mc_arc110
NOP	
J	L_mc_arc43
NOP	
L__mc_arc110:
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
;Kinematics.c,378 :: 		break;
J	L_mc_arc34
NOP	
L_mc_arc43:
;Kinematics.c,379 :: 		i++;
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
;Kinematics.c,388 :: 		}
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
J	L_mc_arc33
NOP	
L_mc_arc34:
;Kinematics.c,389 :: 		report_status_message(STATUS_OK);
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
;Kinematics.c,396 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,400 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,401 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,402 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,410 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,411 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection113
NOP	
J	L_GetAxisDirection44
NOP	
L__GetAxisDirection113:
; ?FLOC___GetAxisDirection?T370 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T370 end address is: 8 (R2)
J	L_GetAxisDirection45
NOP	
L_GetAxisDirection44:
; ?FLOC___GetAxisDirection?T370 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T370 end address is: 8 (R2)
L_GetAxisDirection45:
; ?FLOC___GetAxisDirection?T370 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T370 end address is: 8 (R2)
;Kinematics.c,412 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,424 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,428 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home115
NOP	
J	L_Home46
NOP	
L__Home115:
;Kinematics.c,429 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,432 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,435 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,438 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,441 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,444 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,447 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,450 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home116
NOP	
J	L_Home47
NOP	
L__Home116:
;Kinematics.c,452 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,454 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,455 :: 		}
L_Home47:
;Kinematics.c,459 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,468 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,469 :: 		}
L_Home46:
;Kinematics.c,473 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home117
NOP	
J	L_Home48
NOP	
L__Home117:
;Kinematics.c,478 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home119
NOP	
J	L_Home49
NOP	
L__Home119:
;Kinematics.c,481 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,482 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,491 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home120
NOP	
J	L_Home50
NOP	
L__Home120:
;Kinematics.c,493 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home121
NOP	
J	L_Home51
NOP	
L__Home121:
;Kinematics.c,496 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home122
NOP	
J	L_Home52
NOP	
L__Home122:
;Kinematics.c,498 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,499 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,502 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,504 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
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
BEQ	R2, R0, L__Home123
NOP	
J	L_Home54
NOP	
L__Home123:
;Kinematics.c,506 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,507 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,508 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,510 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,513 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,525 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,526 :: 		}
L_Home54:
L_Home53:
;Kinematics.c,527 :: 		}
L_Home51:
;Kinematics.c,532 :: 		}
L_Home50:
;Kinematics.c,533 :: 		}
L_Home49:
;Kinematics.c,541 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home125
NOP	
J	L_Home55
NOP	
L__Home125:
;Kinematics.c,543 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,544 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home127
NOP	
J	L_Home56
NOP	
L__Home127:
;Kinematics.c,545 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,546 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,547 :: 		}
L_Home56:
;Kinematics.c,556 :: 		}
L_Home55:
;Kinematics.c,557 :: 		}
L_Home48:
;Kinematics.c,558 :: 		return axis;
SEH	R2, R25
;Kinematics.c,559 :: 		}
;Kinematics.c,558 :: 		return axis;
;Kinematics.c,559 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,562 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,564 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,565 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,575 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R26
ORI	R2, R0, 100
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
;Kinematics.c,576 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R26
ORI	R2, R0, 100
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
;Kinematics.c,577 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,579 :: 		static void ResetHoming(){
;Kinematics.c,580 :: 		int i = 0;
;Kinematics.c,581 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming57:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming130
NOP	
J	L_Kinematics_ResetHoming58
NOP	
L_Kinematics_ResetHoming130:
;Kinematics.c,582 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,583 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,581 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,584 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming57
NOP	
L_Kinematics_ResetHoming58:
;Kinematics.c,585 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,592 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,594 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset132
NOP	
J	L_mc_reset60
NOP	
L__mc_reset132:
;Kinematics.c,595 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,605 :: 		switch (sys.state) {
J	L_mc_reset61
NOP	
;Kinematics.c,606 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset63:
L_mc_reset64:
L_mc_reset65:
;Kinematics.c,607 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,608 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,609 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,610 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,611 :: 		}
J	L_mc_reset62
NOP	
L_mc_reset61:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset134
NOP	
J	L_mc_reset63
NOP	
L__mc_reset134:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset136
NOP	
J	L_mc_reset64
NOP	
L__mc_reset136:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset138
NOP	
J	L_mc_reset65
NOP	
L__mc_reset138:
L_mc_reset62:
;Kinematics.c,612 :: 		}
L_mc_reset60:
;Kinematics.c,613 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
