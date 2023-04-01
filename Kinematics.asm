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
BNE	R2, R0, L__SetInitialSizes80
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes80:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection82
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection82:
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
BNE	R2, R0, L_Kinematics_Set_Axisdirection84
NOP	
J	L_Kinematics_Set_Axisdirection7
NOP	
L_Kinematics_Set_Axisdirection84:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection86
NOP	
J	L_Kinematics_Set_Axisdirection8
NOP	
L_Kinematics_Set_Axisdirection86:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection88
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection88:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection90
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection90:
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
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Kinematics.c,77 :: 		long  absxyz = 0;
SW	R27, 4(SP)
MOVZ	R30, R0, R0
SW	R30, 60(SP)
;Kinematics.c,78 :: 		long  tempA  = 0;
;Kinematics.c,79 :: 		int   dir    = 0;
;Kinematics.c,81 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep92
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep92:
;Kinematics.c,83 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 8(SP)
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
SW	R2, 64(SP)
;Kinematics.c,89 :: 		while(DMA_IsOn(1));
L_SingleAxisStep13:
SH	R26, 8(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 8(SP)
BNE	R2, R0, L__SingleAxisStep94
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep94:
J	L_SingleAxisStep13
NOP	
L_SingleAxisStep14:
;Kinematics.c,90 :: 		dma_printf("cur_pos:= %l\tabsxyz:= %f\tnewxyz:= %f\n"
ADDIU	R23, SP, 20
ADDIU	R22, R23, 38
LUI	R24, hi_addr(?ICS?lstr1_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
;Kinematics.c,93 :: 		,newxyz);
SH	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -16
SWC1	S12, 12(SP)
;Kinematics.c,92 :: 		,absxyz
LW	R2, 76(SP)
SW	R2, 8(SP)
;Kinematics.c,91 :: 		,tempA
LW	R2, 80(SP)
SW	R2, 4(SP)
;Kinematics.c,90 :: 		dma_printf("cur_pos:= %l\tabsxyz:= %f\tnewxyz:= %f\n"
SW	R3, 0(SP)
;Kinematics.c,93 :: 		,newxyz);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,95 :: 		}else{
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep12:
;Kinematics.c,96 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_belt_steps+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
SW	R2, 64(SP)
;Kinematics.c,97 :: 		}
L_SingleAxisStep15:
;Kinematics.c,99 :: 		Single_Axis_Enable(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,100 :: 		speed_cntr_Move(tempA , speed , axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R27, R26
MOVZ	R26, R25, R0
LW	R25, 64(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,105 :: 		Set_Axisdirection(tempA,axis_No);
SW	R25, 8(SP)
LW	R25, 64(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LW	R25, 8(SP)
;Kinematics.c,106 :: 		STPS[axis_No].axis_dir = Direction(tempA);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 64(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__SingleAxisStep95
NOP	
J	L_SingleAxisStep16
NOP	
L__SingleAxisStep95:
; ?FLOC___SingleAxisStep?T47 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC___SingleAxisStep?T47 end address is: 16 (R4)
J	L_SingleAxisStep17
NOP	
L_SingleAxisStep16:
; ?FLOC___SingleAxisStep?T47 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC___SingleAxisStep?T47 end address is: 16 (R4)
L_SingleAxisStep17:
; ?FLOC___SingleAxisStep?T47 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___SingleAxisStep?T47 end address is: 16 (R4)
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
SW	R2, 72(SP)
SW	R25, 8(SP)
LW	R25, 64(SP)
JAL	_labs+0
NOP	
LW	R25, 8(SP)
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
LW	R2, 72(SP)
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
ADDIU	R3, R2, 80
LW	R2, 64(SP)
SW	R2, 0(R3)
;Kinematics.c,113 :: 		Step_Cycle(axis_No);
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,115 :: 		}
L_end_SingleAxisStep:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,120 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,long speed){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Kinematics.c,125 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep97
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep97:
;Kinematics.c,127 :: 		tempA = belt_steps(axis_a,axisA);
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
;Kinematics.c,128 :: 		tempB = belt_steps(axis_b,axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R25, R26
MOV.S 	S12, S13
JAL	_belt_steps+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
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
LW	R3, 16(SP)
SUBU	R3, R3, R4
SW	R3, 16(SP)
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
SW	R2, 20(SP)
;Kinematics.c,134 :: 		while(DMA_IsOn(1));
L_DualAxisStep19:
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
BNE	R2, R0, L__DualAxisStep99
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep99:
J	L_DualAxisStep19
NOP	
L_DualAxisStep20:
;Kinematics.c,136 :: 		tempA:= %l\ttempB:= %l\n"
ADDIU	R23, SP, 28
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr2_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 28
;Kinematics.c,137 :: 		,tempA,tempB);
LW	R2, 20(SP)
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, 28(SP)
SW	R2, 4(SP)
;Kinematics.c,136 :: 		tempA:= %l\ttempB:= %l\n"
SW	R3, 0(SP)
;Kinematics.c,137 :: 		,tempA,tempB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,139 :: 		}else{
J	L_DualAxisStep21
NOP	
L_DualAxisStep18:
;Kinematics.c,140 :: 		tempA = belt_steps(axis_a,axisA);
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
;Kinematics.c,141 :: 		tempB = belt_steps(axis_b,axisB);
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
;Kinematics.c,142 :: 		}
L_DualAxisStep21:
;Kinematics.c,143 :: 		SV.over = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,144 :: 		SV.dif  = 0;
SW	R0, Offset(_SV+8)(GP)
;Kinematics.c,147 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,148 :: 		Single_Axis_Enable(axisA);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;Kinematics.c,149 :: 		Single_Axis_Enable(axisB);
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R25, R26
JAL	_Single_Axis_Enable+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,153 :: 		if (!gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__DualAxisStep100
NOP	
J	L_DualAxisStep22
NOP	
L__DualAxisStep100:
;Kinematics.c,154 :: 		SV.prevA = 0;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,155 :: 		SV.prevB = 0;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,156 :: 		SV.prevC = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,157 :: 		}else{
J	L_DualAxisStep23
NOP	
L_DualAxisStep22:
;Kinematics.c,158 :: 		SV.prevA = 0;//tempA;
SW	R0, Offset(_SV+24)(GP)
;Kinematics.c,159 :: 		SV.prevB = 0;//tempB;
SW	R0, Offset(_SV+28)(GP)
;Kinematics.c,160 :: 		SV.prevC = 0;//tempC;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,161 :: 		}
L_DualAxisStep23:
;Kinematics.c,164 :: 		Set_Axisdirection(tempA,axisA);
SH	R26, 4(SP)
SH	R25, 6(SP)
SEH	R26, R25
LW	R25, 16(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 6(SP)
LH	R26, 4(SP)
;Kinematics.c,165 :: 		STPS[axisA].axis_dir = Direction(tempA);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 16(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep101
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep101:
; ?FLOC___DualAxisStep?T106 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T106 end address is: 24 (R6)
J	L_DualAxisStep25
NOP	
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T106 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T106 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep25:
; ?FLOC___DualAxisStep?T106 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T106 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,166 :: 		Set_Axisdirection(tempB,axisB);
SH	R25, 4(SP)
LW	R25, 20(SP)
JAL	Kinematics_Set_Axisdirection+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,167 :: 		STPS[axisB].axis_dir = Direction(tempB);
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LW	R2, 20(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep102
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep102:
; ?FLOC___DualAxisStep?T114 start address is: 24 (R6)
ORI	R6, R0, 255
SEB	R4, R6
; ?FLOC___DualAxisStep?T114 end address is: 24 (R6)
J	L_DualAxisStep27
NOP	
L_DualAxisStep26:
; ?FLOC___DualAxisStep?T114 start address is: 24 (R6)
ORI	R6, R0, 1
; ?FLOC___DualAxisStep?T114 end address is: 24 (R6)
SEB	R4, R6
L_DualAxisStep27:
; ?FLOC___DualAxisStep?T114 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC___DualAxisStep?T114 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,170 :: 		SV.dA   = tempA;// - SV.prevA;
LW	R2, 16(SP)
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,171 :: 		SV.dB   = tempB;// - SV.prevB;
LW	R2, 20(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,172 :: 		SV.dC   = tempC;// - SV.prevC;
LW	R2, 24(SP)
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,175 :: 		SV.dA = labs(SV.dA);
SH	R25, 4(SP)
LW	R25, Offset(_SV+12)(GP)
JAL	_labs+0
NOP	
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,176 :: 		SV.dB = labs(SV.dB);
LW	R25, Offset(_SV+16)(GP)
JAL	_labs+0
NOP	
LH	R25, 4(SP)
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,179 :: 		while(DMA_IsOn(1));
L_DualAxisStep28:
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
BNE	R2, R0, L__DualAxisStep104
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep104:
J	L_DualAxisStep28
NOP	
L_DualAxisStep29:
;Kinematics.c,181 :: 		SV.dA:= %l\tSV.dB:= %l\n"
ADDIU	R23, SP, 51
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr3_Kinematics+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Kinematics+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 51
;Kinematics.c,182 :: 		,SV.dA,SV.dB);
LW	R2, Offset(_SV+16)(GP)
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 4(SP)
;Kinematics.c,181 :: 		SV.dA:= %l\tSV.dB:= %l\n"
SW	R3, 0(SP)
;Kinematics.c,182 :: 		,SV.dA,SV.dB);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,186 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep105
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep105:
;Kinematics.c,187 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep106
NOP	
J	L_DualAxisStep31
NOP	
L__DualAxisStep106:
;Kinematics.c,188 :: 		speed_cntr_Move(tempA,speed,axisA);
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
;Kinematics.c,189 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
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
;Kinematics.c,190 :: 		}
L_DualAxisStep31:
;Kinematics.c,192 :: 		SV.dif = BresDiffVal(SV.dB,SV.dA);//2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,193 :: 		STPS[axisA].master = 1;
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
;Kinematics.c,194 :: 		STPS[axisB].master = 0;
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
;Kinematics.c,195 :: 		}
J	L_DualAxisStep32
NOP	
L_DualAxisStep30:
;Kinematics.c,197 :: 		if(!SV.cir){
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__DualAxisStep107
NOP	
J	L_DualAxisStep33
NOP	
L__DualAxisStep107:
;Kinematics.c,198 :: 		speed_cntr_Move(tempB,speed,axisB);
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
;Kinematics.c,199 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
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
;Kinematics.c,200 :: 		}
L_DualAxisStep33:
;Kinematics.c,202 :: 		SV.dif = BresDiffVal(SV.dA,SV.dB);//2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+8)(GP)
;Kinematics.c,203 :: 		STPS[axisA].master = 0;
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
;Kinematics.c,204 :: 		STPS[axisB].master = 1;
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
;Kinematics.c,205 :: 		}
L_DualAxisStep32:
;Kinematics.c,207 :: 		STPS[axisA].step_count = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,208 :: 		STPS[axisB].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
SW	R0, 0(R2)
;Kinematics.c,209 :: 		STPS[axisA].mmToTravel = tempA;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,210 :: 		STPS[axisB].mmToTravel = tempB;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 80
LW	R2, 20(SP)
SW	R2, 0(R3)
;Kinematics.c,212 :: 		Axis_Interpolate(axisA,axisB);
SW	R27, 4(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
JAL	_Axis_Interpolate+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,217 :: 		}
L_end_DualAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _DualAxisStep
_mc_arc:
;Kinematics.c,253 :: 		, float radius, char isclockwise){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
; axis_1 start address is: 24 (R6)
LH	R6, 92(SP)
; axis_linear start address is: 28 (R7)
LH	R7, 94(SP)
; feed_rate start address is: 44 (R11)
LW	R11, 96(SP)
; invert_feed_rate start address is: 48 (R12)
LBU	R12, 100(SP)
; isclockwise start address is: 40 (R10)
LBU	R10, 101(SP)
;Kinematics.c,255 :: 		float center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R5, R2, 2
ADDU	R2, R25, R5
LWC1	S0, 0(R2)
ADDU	R2, R27, R5
LWC1	S5, 0(R2)
ADD.S 	S4, S0, S5
; center_axis0 start address is: 48 (R12)
MOV.S 	S6, S4
;Kinematics.c,256 :: 		float center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S3, 0(R2)
ADD.S 	S2, S0, S3
; center_axis1 start address is: 56 (R14)
MOV.S 	S7, S2
;Kinematics.c,257 :: 		float linear_travel           = target[axis_linear] - position[axis_linear];
SEH	R2, R7
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; linear_travel start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,258 :: 		float r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
; r_axis0 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,259 :: 		float r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S3
; r_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,260 :: 		float rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R5
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,261 :: 		float rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S2
; rt_axis1 start address is: 72 (R18)
MOV.S 	S9, S0
;Kinematics.c,262 :: 		float theta_per_segment       = 0.00;
;Kinematics.c,263 :: 		float linear_per_segment      = 0.00;
;Kinematics.c,264 :: 		float angular_travel          = 0.00;
;Kinematics.c,265 :: 		float mm_of_travel            = 0.00;
;Kinematics.c,266 :: 		float rads                    = 0.00;
;Kinematics.c,267 :: 		long  segments                = 0;
;Kinematics.c,268 :: 		float cos_T                   = 0.00;
;Kinematics.c,269 :: 		float sin_T                   = 0.00;
;Kinematics.c,275 :: 		long i                         = 0;
;Kinematics.c,276 :: 		int count = 0;
; count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Kinematics.c,277 :: 		char n_arc_correction = 3; //to be sorted int global struct???
; n_arc_correction start address is: 32 (R8)
ORI	R8, R0, 3
;Kinematics.c,278 :: 		char limit_error = 0;
; limit_error start address is: 36 (R9)
MOVZ	R9, R0, R0
;Kinematics.c,280 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R3, SP, 76
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R3, R3, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,285 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
;Kinematics.c,288 :: 		if(isclockwise) {
BNE	R10, R0, L__mc_arc110
NOP	
J	L__mc_arc77
NOP	
L__mc_arc110:
; isclockwise end address is: 40 (R10)
;Kinematics.c,290 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S4, S0
BC1F	0, L__mc_arc111
NOP	
J	L_mc_arc35
NOP	
L__mc_arc111:
;Kinematics.c,291 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
J	L_mc_arc36
NOP	
L_mc_arc35:
;Kinematics.c,293 :: 		if(angular_travel <= 0)
; angular_travel start address is: 32 (R8)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S4
BC1F	0, L__mc_arc112
NOP	
J	L__mc_arc76
NOP	
L__mc_arc112:
;Kinematics.c,294 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S4, S0
; angular_travel end address is: 32 (R8)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S0, S1
J	L_mc_arc37
NOP	
L__mc_arc76:
;Kinematics.c,293 :: 		if(angular_travel <= 0)
MOV.S 	S0, S4
;Kinematics.c,294 :: 		angular_travel += PIx2;
L_mc_arc37:
;Kinematics.c,295 :: 		}
; angular_travel start address is: 0 (R0)
MOV.S 	S4, S0
; angular_travel end address is: 0 (R0)
L_mc_arc36:
;Kinematics.c,296 :: 		}
; angular_travel start address is: 32 (R8)
; angular_travel end address is: 32 (R8)
J	L_mc_arc34
NOP	
L__mc_arc77:
;Kinematics.c,288 :: 		if(isclockwise) {
;Kinematics.c,296 :: 		}
L_mc_arc34:
;Kinematics.c,299 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,300 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc113
NOP	
J	L_mc_arc38
NOP	
L__mc_arc113:
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
L_mc_arc38:
;Kinematics.c,302 :: 		segments = (long)floor(mm_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
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
;Kinematics.c,307 :: 		if (invert_feed_rate)
BNE	R12, R0, L__mc_arc115
NOP	
J	L__mc_arc78
NOP	
L__mc_arc115:
; invert_feed_rate end address is: 48 (R12)
;Kinematics.c,308 :: 		feed_rate *= segments;
MUL	R2, R11, R10
MOVZ	R11, R2, R0
; feed_rate end address is: 44 (R11)
J	L_mc_arc39
NOP	
L__mc_arc78:
;Kinematics.c,307 :: 		if (invert_feed_rate)
;Kinematics.c,308 :: 		feed_rate *= segments;
L_mc_arc39:
;Kinematics.c,311 :: 		theta_per_segment = angular_travel/(float)segments;
; feed_rate start address is: 44 (R11)
MTC1	R10, S0
CVT32.W 	S0, S0
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
; theta_per_segment start address is: 32 (R8)
MOV.S 	S4, S2
;Kinematics.c,316 :: 		linear_per_segment = linear_travel/(float)segments;
DIV.S 	S0, S8, S0
; linear_travel end address is: 64 (R16)
; linear_per_segment start address is: 64 (R16)
MOV.S 	S8, S0
;Kinematics.c,319 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,320 :: 		sin_T = theta_per_segment;
; sin_T start address is: 128 (R32)
MOV.S 	S16, S2
;Kinematics.c,322 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,323 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,324 :: 		OC5IE_bit = OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
_LX	
EXT	R3, R2, BitPos(OC2IE_bit+0), 1
_LX	
INS	R2, R3, BitPos(OC5IE_bit+0), 1
_SX	
;Kinematics.c,325 :: 		i = 0;
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
;Kinematics.c,336 :: 		while(i < segments) { // Increment (segments-1)
L_mc_arc40:
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
BNE	R2, R0, L__mc_arc116
NOP	
J	L_mc_arc41
NOP	
L__mc_arc116:
;Kinematics.c,338 :: 		if (count < n_arc_correction) {
SEH	R3, R4
ANDI	R2, R10, 255
SLT	R2, R3, R2
BNE	R2, R0, L__mc_arc117
NOP	
J	L_mc_arc42
NOP	
L__mc_arc117:
;Kinematics.c,340 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
MUL.S 	S1, S4, S16
MUL.S 	S0, S3, S17
ADD.S 	S2, S1, S0
;Kinematics.c,341 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
MUL.S 	S1, S4, S17
; r_axis0 end address is: 32 (R8)
MUL.S 	S0, S3, S16
; r_axis1 end address is: 24 (R6)
SUB.S 	S0, S1, S0
; r_axis0 start address is: 80 (R20)
MOV.S 	S10, S0
;Kinematics.c,342 :: 		r_axis1 = r_axisi;
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S2
;Kinematics.c,343 :: 		count++;
ADDIU	R2, R4, 1
; count end address is: 16 (R4)
; count start address is: 48 (R12)
SEH	R12, R2
;Kinematics.c,344 :: 		} else {
SH	R12, 4(SP)
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
LH	R12, 4(SP)
J	L_mc_arc43
NOP	
L_mc_arc42:
;Kinematics.c,347 :: 		cos_Ti = cos(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 88(SP)
;Kinematics.c,348 :: 		sin_Ti = sin(i*theta_per_segment);
MTC1	R7, S0
CVT32.W 	S0, S0
MUL.S 	S0, S0, S7
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,349 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 88(SP)
MUL.S 	S3, S2, S1
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
; r_axis0 start address is: 80 (R20)
MOV.S 	S10, S1
;Kinematics.c,350 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 88(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
; r_axis1 start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,351 :: 		count = 0;
; count start address is: 48 (R12)
MOVZ	R12, R0, R0
; count end address is: 48 (R12)
; r_axis1 end address is: 48 (R12)
; r_axis0 end address is: 80 (R20)
SH	R12, 4(SP)
LH	R12, 4(SP)
;Kinematics.c,352 :: 		}
L_mc_arc43:
;Kinematics.c,355 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
; count start address is: 48 (R12)
; r_axis1 start address is: 48 (R12)
; r_axis0 start address is: 80 (R20)
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S9, S10
SWC1	S0, 0(R2)
;Kinematics.c,356 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R4, R2
ADD.S 	S0, S8, S6
SWC1	S0, 0(R2)
;Kinematics.c,357 :: 		arc_target[axis_linear] += linear_per_segment;
SEH	R2, R11
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S0, 0(R2)
ADD.S 	S0, S0, S5
SWC1	S0, 0(R2)
;Kinematics.c,358 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S4, 0(R2)
SUB.S 	S3, S0, S4
;Kinematics.c,359 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S2, 0(R2)
SUB.S 	S1, S0, S2
;Kinematics.c,361 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
ADD.S 	S0, S3, S4
; nPx start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,362 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
ADD.S 	S0, S1, S2
; nPy start address is: 0 (R0)
;Kinematics.c,365 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc119
NOP	
J	L_mc_arc44
NOP	
L__mc_arc119:
;Kinematics.c,366 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,367 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R6
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R5, 0(R2)
;Kinematics.c,368 :: 		}
L_mc_arc44:
;Kinematics.c,371 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
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
;Kinematics.c,373 :: 		while(1){
L_mc_arc45:
;Kinematics.c,380 :: 		if(!OC5IE_bit && !OC2IE_bit)
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
BEQ	R2, R0, L__mc_arc120
NOP	
J	L__mc_arc75
NOP	
L__mc_arc120:
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
BEQ	R2, R0, L__mc_arc121
NOP	
J	L__mc_arc74
NOP	
L__mc_arc121:
L__mc_arc73:
;Kinematics.c,381 :: 		break;
J	L_mc_arc46
NOP	
;Kinematics.c,380 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc75:
L__mc_arc74:
;Kinematics.c,382 :: 		}
SWC1	S3, 4(SP)
SWC1	S4, 8(SP)
SB	R10, 12(SP)
LBU	R10, 12(SP)
LWC1	S4, 8(SP)
LWC1	S3, 4(SP)
J	L_mc_arc45
NOP	
L_mc_arc46:
;Kinematics.c,386 :: 		if(limit_error)
BNE	R9, R0, L__mc_arc123
NOP	
J	L_mc_arc50
NOP	
L__mc_arc123:
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
;Kinematics.c,387 :: 		break;
J	L_mc_arc41
NOP	
L_mc_arc50:
;Kinematics.c,388 :: 		i++;
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
;Kinematics.c,397 :: 		}
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
J	L_mc_arc40
NOP	
L_mc_arc41:
;Kinematics.c,398 :: 		report_status_message(STATUS_OK);
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
;Kinematics.c,405 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,409 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,410 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,411 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_GetAxisDirection:
;Kinematics.c,419 :: 		int GetAxisDirection(long mm2move){
;Kinematics.c,420 :: 		return(mm2move < 0)? CCW_:CW_ ;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection126
NOP	
J	L_GetAxisDirection51
NOP	
L__GetAxisDirection126:
; ?FLOC___GetAxisDirection?T372 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T372 end address is: 8 (R2)
J	L_GetAxisDirection52
NOP	
L_GetAxisDirection51:
; ?FLOC___GetAxisDirection?T372 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T372 end address is: 8 (R2)
L_GetAxisDirection52:
; ?FLOC___GetAxisDirection?T372 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T372 end address is: 8 (R2)
;Kinematics.c,421 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
_Home:
;Kinematics.c,433 :: 		int Home(int axis){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,437 :: 		if(sys.state == STATE_IDLE){
SW	R26, 4(SP)
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home128
NOP	
J	L_Home53
NOP	
L__Home128:
;Kinematics.c,438 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,441 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 8(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 8(SP)
SH	R25, 8(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,444 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,447 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,450 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,453 :: 		EnableStepper(axis);//sort this out
SH	R25, 8(SP)
JAL	_EnableStepper+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,456 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,459 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 8(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 8(SP)
BEQ	R2, R0, L__Home129
NOP	
J	L_Home54
NOP	
L__Home129:
;Kinematics.c,461 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,463 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,464 :: 		}
L_Home54:
;Kinematics.c,468 :: 		Home_Axis(-500.0,speed,axis);
LUI	R2, 50170
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
LW	R25, Offset(Home_speed_L0+0)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,477 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,478 :: 		}
L_Home53:
;Kinematics.c,482 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home130
NOP	
J	L_Home55
NOP	
L__Home130:
;Kinematics.c,487 :: 		if(FN(axis)){
SH	R25, 8(SP)
JAL	_FN+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home132
NOP	
J	L_Home56
NOP	
L__Home132:
;Kinematics.c,490 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,491 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,500 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home133
NOP	
J	L_Home57
NOP	
L__Home133:
;Kinematics.c,502 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home134
NOP	
J	L_Home58
NOP	
L__Home134:
;Kinematics.c,505 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home135
NOP	
J	L_Home59
NOP	
L__Home135:
;Kinematics.c,507 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,508 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,511 :: 		Home_Axis(12.0,100, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 100
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,513 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
J	L_Home60
NOP	
L_Home59:
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Home136
NOP	
J	L_Home61
NOP	
L__Home136:
;Kinematics.c,515 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,516 :: 		StopAxis(axis);
SH	R25, 8(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,517 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,519 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,522 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,534 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,535 :: 		}
L_Home61:
L_Home60:
;Kinematics.c,536 :: 		}
L_Home58:
;Kinematics.c,541 :: 		}
L_Home57:
;Kinematics.c,542 :: 		}
L_Home56:
;Kinematics.c,550 :: 		if(FP(axis)){
SH	R25, 8(SP)
JAL	_FP+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L__Home138
NOP	
J	L_Home62
NOP	
L__Home138:
;Kinematics.c,552 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,553 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home140
NOP	
J	L_Home63
NOP	
L__Home140:
;Kinematics.c,554 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,555 :: 		Home_Axis(-290.00,50,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 8(SP)
SEH	R26, R25
ORI	R25, R0, 50
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 8(SP)
;Kinematics.c,556 :: 		}
L_Home63:
;Kinematics.c,565 :: 		}
L_Home62:
;Kinematics.c,566 :: 		}
L_Home55:
;Kinematics.c,567 :: 		return axis;
SEH	R2, R25
;Kinematics.c,568 :: 		}
;Kinematics.c,567 :: 		return axis;
;Kinematics.c,568 :: 		}
L_end_Home:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,571 :: 		static void Home_Axis(double distance,long speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,573 :: 		StopAxis(axis);
SH	R26, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,574 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,584 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
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
;Kinematics.c,585 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
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
;Kinematics.c,586 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,588 :: 		static void ResetHoming(){
;Kinematics.c,589 :: 		int i = 0;
;Kinematics.c,590 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming64:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming143
NOP	
J	L_Kinematics_ResetHoming65
NOP	
L_Kinematics_ResetHoming143:
;Kinematics.c,591 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,592 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,590 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,593 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming64
NOP	
L_Kinematics_ResetHoming65:
;Kinematics.c,594 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,601 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,603 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset145
NOP	
J	L_mc_reset67
NOP	
L__mc_reset145:
;Kinematics.c,604 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,614 :: 		switch (sys.state) {
J	L_mc_reset68
NOP	
;Kinematics.c,615 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset70:
L_mc_reset71:
L_mc_reset72:
;Kinematics.c,616 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,617 :: 		disableOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableOCx+0
NOP	
;Kinematics.c,618 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Kinematics.c,619 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,620 :: 		}
J	L_mc_reset69
NOP	
L_mc_reset68:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset147
NOP	
J	L_mc_reset70
NOP	
L__mc_reset147:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset149
NOP	
J	L_mc_reset71
NOP	
L__mc_reset149:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset151
NOP	
J	L_mc_reset72
NOP	
L__mc_reset151:
L_mc_reset69:
;Kinematics.c,621 :: 		}
L_mc_reset67:
;Kinematics.c,622 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
