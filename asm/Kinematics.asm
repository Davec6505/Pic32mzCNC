_SetInitialSizes:
;Kinematics.c,13 :: 		void SetInitialSizes(STP axis[6]){
;Kinematics.c,14 :: 		int i = 0;
;Kinematics.c,16 :: 		gc.absolute_mode = 0;
SB	R0, Offset(_gc+5)(GP)
;Kinematics.c,18 :: 		for (i = 0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_SetInitialSizes0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__SetInitialSizes90
NOP	
J	L_SetInitialSizes1
NOP	
L__SetInitialSizes90:
;Kinematics.c,19 :: 		axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
SEH	R3, R5
ORI	R2, R0, 96
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
;Kinematics.c,18 :: 		for (i = 0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,20 :: 		}
; i end address is: 20 (R5)
J	L_SetInitialSizes0
NOP	
L_SetInitialSizes1:
;Kinematics.c,21 :: 		}
L_end_SetInitialSizes:
JR	RA
NOP	
; end of _SetInitialSizes
Kinematics_Set_Axisdirection:
;Kinematics.c,28 :: 		static void Set_Axisdirection(long temp,int axis){
;Kinematics.c,29 :: 		int dir = (temp < 0)? CCW : CW;
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_Set_Axisdirection92
NOP	
J	L_Kinematics_Set_Axisdirection3
NOP	
L_Kinematics_Set_Axisdirection92:
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
;Kinematics.c,30 :: 		int inv = bit_istrue(settings.dir_invert_mask,bit(axis)) ? 1 : 0;
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R3, R2, R3
LHU	R2, Offset(_settings+68)(GP)
AND	R2, R2, R3
ANDI	R2, R2, 65535
BNE	R2, R0, L_Kinematics_Set_Axisdirection94
NOP	
J	L_Kinematics_Set_Axisdirection5
NOP	
L_Kinematics_Set_Axisdirection94:
; ?FLOC__Kinematics_Set_Axisdirection?T21 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC__Kinematics_Set_Axisdirection?T21 end address is: 8 (R2)
J	L_Kinematics_Set_Axisdirection6
NOP	
L_Kinematics_Set_Axisdirection5:
; ?FLOC__Kinematics_Set_Axisdirection?T21 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC__Kinematics_Set_Axisdirection?T21 end address is: 8 (R2)
L_Kinematics_Set_Axisdirection6:
; ?FLOC__Kinematics_Set_Axisdirection?T21 start address is: 8 (R2)
; inv start address is: 20 (R5)
SEB	R5, R2
; ?FLOC__Kinematics_Set_Axisdirection?T21 end address is: 8 (R2)
;Kinematics.c,31 :: 		switch(axis){
J	L_Kinematics_Set_Axisdirection7
NOP	
;Kinematics.c,32 :: 		case X:
L_Kinematics_Set_Axisdirection9:
;Kinematics.c,33 :: 		DIR_StepX = (inv ^ dir) & 0x0001;
XOR	R2, R5, R4
; dir end address is: 16 (R4)
; inv end address is: 20 (R5)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,34 :: 		break;
J	L_Kinematics_Set_Axisdirection8
NOP	
;Kinematics.c,35 :: 		case Y:
L_Kinematics_Set_Axisdirection10:
;Kinematics.c,36 :: 		DIR_StepY = (inv ^ dir) & 0x0001;
; inv start address is: 20 (R5)
; dir start address is: 16 (R4)
XOR	R2, R5, R4
; dir end address is: 16 (R4)
; inv end address is: 20 (R5)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,37 :: 		break;
J	L_Kinematics_Set_Axisdirection8
NOP	
;Kinematics.c,38 :: 		case Z:
L_Kinematics_Set_Axisdirection11:
;Kinematics.c,39 :: 		DIR_StepZ = (inv ^ dir) & 0x0001;
; inv start address is: 20 (R5)
; dir start address is: 16 (R4)
XOR	R2, R5, R4
; dir end address is: 16 (R4)
; inv end address is: 20 (R5)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepZ+0), 1
_SX	
;Kinematics.c,40 :: 		break;
J	L_Kinematics_Set_Axisdirection8
NOP	
;Kinematics.c,41 :: 		case A:
L_Kinematics_Set_Axisdirection12:
;Kinematics.c,42 :: 		DIR_StepA = (inv ^ dir) & 0x0001;
; inv start address is: 20 (R5)
; dir start address is: 16 (R4)
XOR	R2, R5, R4
; dir end address is: 16 (R4)
; inv end address is: 20 (R5)
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(DIR_StepA+0), 1
_SX	
;Kinematics.c,43 :: 		break;
J	L_Kinematics_Set_Axisdirection8
NOP	
;Kinematics.c,44 :: 		default: break;
L_Kinematics_Set_Axisdirection13:
J	L_Kinematics_Set_Axisdirection8
NOP	
;Kinematics.c,45 :: 		}
L_Kinematics_Set_Axisdirection7:
; inv start address is: 20 (R5)
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L_Kinematics_Set_Axisdirection96
NOP	
J	L_Kinematics_Set_Axisdirection9
NOP	
L_Kinematics_Set_Axisdirection96:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L_Kinematics_Set_Axisdirection98
NOP	
J	L_Kinematics_Set_Axisdirection10
NOP	
L_Kinematics_Set_Axisdirection98:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Kinematics_Set_Axisdirection100
NOP	
J	L_Kinematics_Set_Axisdirection11
NOP	
L_Kinematics_Set_Axisdirection100:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Kinematics_Set_Axisdirection102
NOP	
J	L_Kinematics_Set_Axisdirection12
NOP	
L_Kinematics_Set_Axisdirection102:
; dir end address is: 16 (R4)
; inv end address is: 20 (R5)
J	L_Kinematics_Set_Axisdirection13
NOP	
L_Kinematics_Set_Axisdirection8:
;Kinematics.c,46 :: 		}
L_end_Set_Axisdirection:
JR	RA
NOP	
; end of Kinematics_Set_Axisdirection
_SingleAxisStep:
;Kinematics.c,50 :: 		void SingleAxisStep(float newxyz,float speed,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,51 :: 		long  tempA  = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Kinematics.c,54 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,63 :: 		if(gc.absolute_mode == true){
LBU	R3, Offset(_gc+5)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__SingleAxisStep104
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep104:
;Kinematics.c,65 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
;Kinematics.c,68 :: 		tempA = tempA - STPS[axis_No].steps_abs_position;
SEH	R4, R25
ORI	R3, R0, 96
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 88
LW	R3, 0(R3)
SUBU	R2, R2, R3
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
;Kinematics.c,70 :: 		if(tempA== 0){
BEQ	R2, R0, L__SingleAxisStep105
NOP	
J	L_SingleAxisStep15
NOP	
L__SingleAxisStep105:
; tempA end address is: 12 (R3)
;Kinematics.c,71 :: 		return;
J	L_end_SingleAxisStep
NOP	
;Kinematics.c,72 :: 		}
L_SingleAxisStep15:
;Kinematics.c,73 :: 		}else{
; tempA start address is: 12 (R3)
MOVZ	R2, R3, R0
; tempA end address is: 12 (R3)
J	L_SingleAxisStep16
NOP	
L_SingleAxisStep14:
;Kinematics.c,74 :: 		tempA = belt_steps(newxyz,axis_No);
SH	R25, 12(SP)
SWC1	S13, 16(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 16(SP)
LH	R25, 12(SP)
; tempA start address is: 12 (R3)
MOVZ	R3, R2, R0
; tempA end address is: 12 (R3)
MOVZ	R2, R3, R0
;Kinematics.c,75 :: 		}
L_SingleAxisStep16:
;Kinematics.c,76 :: 		SingleAxisStart(tempA,speed,axis_No);
; tempA start address is: 8 (R2)
MOV.S 	S12, S13
SEH	R26, R25
MOVZ	R25, R2, R0
; tempA end address is: 8 (R2)
JAL	Kinematics_SingleAxisStart+0
NOP	
;Kinematics.c,78 :: 		}
L_end_SingleAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
Kinematics_SingleAxisStart:
;Kinematics.c,80 :: 		static void SingleAxisStart(long dist,float speed,int axis_No){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,81 :: 		STPS[axis_No].dist =labs(dist);
SW	R25, 4(SP)
SW	R26, 8(SP)
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R2, 24(SP)
JAL	_labs+0
NOP	
LW	R3, 24(SP)
SW	R2, 0(R3)
;Kinematics.c,82 :: 		EnableSteppers();
SH	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
JAL	_EnableSteppers+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,83 :: 		speed_cntr_Move(dist , speed, axis_No);
SH	R26, 12(SP)
SW	R25, 16(SP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,85 :: 		Set_Axisdirection(dist,axis_No);
JAL	Kinematics_Set_Axisdirection+0
NOP	
;Kinematics.c,86 :: 		STPS[axis_No].axis_dir = Direction(dist);
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SLTI	R2, R25, 0
BNE	R2, R0, L_Kinematics_SingleAxisStart107
NOP	
J	L_Kinematics_SingleAxisStart17
NOP	
L_Kinematics_SingleAxisStart107:
; ?FLOC__Kinematics_SingleAxisStart?T59 start address is: 16 (R4)
ORI	R4, R0, 255
; ?FLOC__Kinematics_SingleAxisStart?T59 end address is: 16 (R4)
J	L_Kinematics_SingleAxisStart18
NOP	
L_Kinematics_SingleAxisStart17:
; ?FLOC__Kinematics_SingleAxisStart?T59 start address is: 16 (R4)
ORI	R4, R0, 1
; ?FLOC__Kinematics_SingleAxisStart?T59 end address is: 16 (R4)
L_Kinematics_SingleAxisStart18:
; ?FLOC__Kinematics_SingleAxisStart?T59 start address is: 16 (R4)
SEB	R2, R4
; ?FLOC__Kinematics_SingleAxisStart?T59 end address is: 16 (R4)
SH	R2, 0(R3)
;Kinematics.c,87 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Kinematics.c,88 :: 		STPS[axis_No].mmToTravel = dist;
SEH	R3, R26
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
SW	R25, 0(R2)
;Kinematics.c,90 :: 		Start_Interpolation(axis_No,bit(axis_No));
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R2, R2, R3
SEH	R25, R26
SEH	R26, R2
JAL	_Start_Interpolation+0
NOP	
;Kinematics.c,91 :: 		}
L_end_SingleAxisStart:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Kinematics_SingleAxisStart
_DualAxisStep:
;Kinematics.c,96 :: 		void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Kinematics.c,98 :: 		target[axisA] = axis_a;
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R5, SP, 12
SEH	R2, R25
SLL	R2, R2, 2
ADDU	R2, R5, R2
SWC1	S12, 0(R2)
;Kinematics.c,99 :: 		target[axisB] = axis_b;
SEH	R2, R26
SLL	R2, R2, 2
ADDU	R2, R5, R2
SWC1	S13, 0(R2)
;Kinematics.c,100 :: 		MultiAxisStep(target,bit(axisA) | bit(axisB),speed);
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R4, R2, R3
SEH	R3, R26
ORI	R2, R0, 1
SLLV	R2, R2, R3
OR	R2, R4, R2
MOV.S 	S12, S14
SEH	R26, R2
MOVZ	R25, R5, R0
JAL	_MultiAxisStep+0
NOP	
;Kinematics.c,101 :: 		}
L_end_DualAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _DualAxisStep
_MultiAxisStep:
;Kinematics.c,104 :: 		void MultiAxisStep(float *target,int axes,float speed){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Kinematics.c,106 :: 		int i, master = -1, moving = 0;
; master start address is: 24 (R6)
ORI	R6, R0, 65535
; moving start address is: 28 (R7)
MOVZ	R7, R0, R0
;Kinematics.c,108 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; moving end address is: 28 (R7)
; master end address is: 24 (R6)
; i end address is: 20 (R5)
L_MultiAxisStep19:
; i start address is: 20 (R5)
; moving start address is: 28 (R7)
; master start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__MultiAxisStep110
NOP	
J	L_MultiAxisStep20
NOP	
L__MultiAxisStep110:
;Kinematics.c,109 :: 		distance[i] = 0;
ADDIU	R3, SP, 24
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;Kinematics.c,110 :: 		if(bit_istrue(axes,bit(i))){
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R26, R2
SEH	R2, R2
BNE	R2, R0, L__MultiAxisStep112
NOP	
J	L__MultiAxisStep86
NOP	
L__MultiAxisStep112:
;Kinematics.c,111 :: 		distance[i] = belt_steps(target[i],i);
ADDIU	R4, SP, 24
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
SW	R2, 40(SP)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SH	R6, 4(SP)
SH	R7, 6(SP)
SH	R5, 8(SP)
SH	R26, 10(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
SEH	R25, R5
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 10(SP)
LH	R5, 8(SP)
LH	R7, 6(SP)
LH	R6, 4(SP)
LW	R3, 40(SP)
SW	R2, 0(R3)
;Kinematics.c,112 :: 		if(gc.absolute_mode)
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__MultiAxisStep114
NOP	
J	L_MultiAxisStep23
NOP	
L__MultiAxisStep114:
;Kinematics.c,113 :: 		distance[i] -= STPS[i].steps_abs_position;
ADDIU	R3, SP, 24
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R4, R3, R2
SEH	R3, R5
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 88
LW	R3, 0(R2)
LW	R2, 0(R4)
SUBU	R2, R2, R3
SW	R2, 0(R4)
L_MultiAxisStep23:
;Kinematics.c,114 :: 		if(distance[i] != 0){
ADDIU	R3, SP, 24
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
BNE	R2, R0, L__MultiAxisStep116
NOP	
J	L__MultiAxisStep85
NOP	
L__MultiAxisStep116:
;Kinematics.c,115 :: 		bit_true(moving,bit(i));
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
OR	R2, R7, R2
; moving end address is: 28 (R7)
; moving start address is: 16 (R4)
SEH	R4, R2
;Kinematics.c,116 :: 		if(master < 0 || labs(distance[i]) > labs(distance[master]))
SEH	R2, R6
SLTI	R2, R2, 0
BEQ	R2, R0, L__MultiAxisStep117
NOP	
J	L__MultiAxisStep84
NOP	
L__MultiAxisStep117:
ADDIU	R3, SP, 24
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R25, 4(SP)
LW	R25, 0(R2)
JAL	_labs+0
NOP	
SW	R2, 40(SP)
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R25, 4(SP)
LW	R3, 40(SP)
SLT	R2, R2, R3
BEQ	R2, R0, L__MultiAxisStep118
NOP	
J	L__MultiAxisStep83
NOP	
L__MultiAxisStep118:
; master end address is: 24 (R6)
J	L_MultiAxisStep27
NOP	
L__MultiAxisStep84:
L__MultiAxisStep83:
;Kinematics.c,117 :: 		master = i;
; master start address is: 8 (R2)
SEH	R2, R5
; master end address is: 8 (R2)
SEH	R6, R2
L_MultiAxisStep27:
;Kinematics.c,118 :: 		}
; master start address is: 24 (R6)
SEH	R7, R4
; moving end address is: 16 (R4)
; master end address is: 24 (R6)
J	L_MultiAxisStep24
NOP	
L__MultiAxisStep85:
;Kinematics.c,114 :: 		if(distance[i] != 0){
;Kinematics.c,118 :: 		}
L_MultiAxisStep24:
;Kinematics.c,119 :: 		}
; master start address is: 24 (R6)
; moving start address is: 28 (R7)
; moving end address is: 28 (R7)
; master end address is: 24 (R6)
J	L_MultiAxisStep22
NOP	
L__MultiAxisStep86:
;Kinematics.c,110 :: 		if(bit_istrue(axes,bit(i))){
;Kinematics.c,119 :: 		}
L_MultiAxisStep22:
;Kinematics.c,108 :: 		for(i=0;i<NoOfAxis;i++){
; moving start address is: 28 (R7)
; master start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Kinematics.c,120 :: 		}
; i end address is: 20 (R5)
J	L_MultiAxisStep19
NOP	
L_MultiAxisStep20:
;Kinematics.c,121 :: 		if(master < 0) return;
SEH	R2, R6
SLTI	R2, R2, 0
BNE	R2, R0, L__MultiAxisStep119
NOP	
J	L_MultiAxisStep28
NOP	
L__MultiAxisStep119:
; moving end address is: 28 (R7)
; master end address is: 24 (R6)
J	L_end_MultiAxisStep
NOP	
L_MultiAxisStep28:
;Kinematics.c,123 :: 		EnableSteppers();
; master start address is: 24 (R6)
; moving start address is: 28 (R7)
SH	R6, 4(SP)
SH	R7, 6(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
SWC1	S12, 16(SP)
JAL	_EnableSteppers+0
NOP	
LWC1	S12, 16(SP)
LW	R25, 12(SP)
LH	R26, 8(SP)
LH	R7, 6(SP)
LH	R6, 4(SP)
;Kinematics.c,124 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 8 (R2)
MOVZ	R2, R0, R0
; moving end address is: 28 (R7)
; master end address is: 24 (R6)
; i end address is: 8 (R2)
SEH	R5, R6
SEH	R6, R7
SEH	R7, R2
L_MultiAxisStep29:
; i start address is: 28 (R7)
; master start address is: 20 (R5)
; moving start address is: 24 (R6)
SEH	R2, R7
SLTI	R2, R2, 4
BNE	R2, R0, L__MultiAxisStep120
NOP	
J	L_MultiAxisStep30
NOP	
L__MultiAxisStep120:
;Kinematics.c,125 :: 		if(bit_istrue(moving,bit(i))){
SEH	R3, R7
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L__MultiAxisStep122
NOP	
J	L_MultiAxisStep32
NOP	
L__MultiAxisStep122:
;Kinematics.c,126 :: 		STPS[i].dist = labs(distance[i]);
SEH	R3, R7
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
SW	R2, 40(SP)
ADDIU	R3, SP, 24
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R25, 4(SP)
LW	R25, 0(R2)
JAL	_labs+0
NOP	
LW	R25, 4(SP)
LW	R3, 40(SP)
SW	R2, 0(R3)
;Kinematics.c,127 :: 		STPS[i].step_count = 0;
SEH	R3, R7
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Kinematics.c,128 :: 		STPS[i].mmToTravel = distance[i];
SEH	R3, R7
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 84
ADDIU	R4, SP, 24
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Kinematics.c,129 :: 		STPS[i].axis_dir = Direction(distance[i]);
SEH	R3, R7
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SLTI	R2, R2, 0
BNE	R2, R0, L__MultiAxisStep123
NOP	
J	L_MultiAxisStep33
NOP	
L__MultiAxisStep123:
ORI	R2, R0, 255
SB	R2, 20(SP)
J	L_MultiAxisStep34
NOP	
L_MultiAxisStep33:
ORI	R2, R0, 1
SB	R2, 20(SP)
L_MultiAxisStep34:
LB	R2, 20(SP)
SH	R2, 0(R3)
;Kinematics.c,130 :: 		Set_Axisdirection(distance[i],i);
ADDIU	R3, SP, 24
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SH	R5, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
SEH	R26, R7
MOVZ	R25, R2, R0
JAL	Kinematics_Set_Axisdirection+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R5, 4(SP)
;Kinematics.c,131 :: 		if(i != master){
SEH	R3, R7
SEH	R2, R5
BNE	R3, R2, L__MultiAxisStep125
NOP	
J	L_MultiAxisStep35
NOP	
L__MultiAxisStep125:
;Kinematics.c,132 :: 		STPS[i].run_state = RUN;
SEH	R3, R7
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Kinematics.c,133 :: 		bit_true(SV.mode_complete,bit(i));
SEH	R3, R7
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(_SV+1)(GP)
OR	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Kinematics.c,134 :: 		}
L_MultiAxisStep35:
;Kinematics.c,135 :: 		}
L_MultiAxisStep32:
;Kinematics.c,124 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R7, 1
SEH	R7, R2
;Kinematics.c,136 :: 		}
; i end address is: 28 (R7)
J	L_MultiAxisStep29
NOP	
L_MultiAxisStep30:
;Kinematics.c,137 :: 		speed_cntr_Move(distance[master],RPS_FROM_MMPMIN(speed),master);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
ADDIU	R3, SP, 24
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SH	R6, 4(SP)
SH	R5, 6(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
SEH	R26, R5
MOV.S 	S12, S0
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LH	R5, 6(SP)
LH	R6, 4(SP)
;Kinematics.c,138 :: 		Start_Interpolation(master,moving);
SH	R26, 4(SP)
; moving end address is: 24 (R6)
SW	R25, 8(SP)
SEH	R26, R6
SEH	R25, R5
; master end address is: 20 (R5)
JAL	_Start_Interpolation+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
;Kinematics.c,139 :: 		}
L_end_MultiAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _MultiAxisStep
_mc_arc:
;Kinematics.c,175 :: 		, float radius, char isclockwise){
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
;Kinematics.c,176 :: 		float arc_target[3] = {0};
ADDIU	R23, SP, 76
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICSmc_arc_arc_target_L0+0)
ORI	R24, R24, lo_addr(?ICSmc_arc_arc_target_L0+0)
JAL	___CC2DW+0
NOP	
;Kinematics.c,181 :: 		int count = 0;
;Kinematics.c,182 :: 		char limit_error = 0;
;Kinematics.c,184 :: 		center_axis0            = position[axis_0] + offset[axis_0];
SEH	R2, R28
SLL	R4, R2, 2
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
ADDU	R2, R27, R4
LWC1	S4, 0(R2)
ADD.S 	S3, S0, S4
SWC1	S3, 24(SP)
;Kinematics.c,185 :: 		center_axis1            = position[axis_1] + offset[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
ADDU	R2, R27, R3
LWC1	S2, 0(R2)
ADD.S 	S1, S0, S2
SWC1	S1, 28(SP)
;Kinematics.c,186 :: 		r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
SWC1	S0, 32(SP)
;Kinematics.c,187 :: 		r_axis1                 = -offset[axis_1];
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
SWC1	S0, 36(SP)
;Kinematics.c,188 :: 		rt_axis0                = target[axis_0] - center_axis0;
ADDU	R2, R26, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,189 :: 		rt_axis1                = target[axis_1] - center_axis1;
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S1
; rt_axis1 start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,190 :: 		linear_travel           = target[axis_linear] - position[axis_linear];
LH	R2, 94(SP)
SLL	R3, R2, 2
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
SUB.S 	S0, S0, S1
; linear_travel start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,192 :: 		arc_target[axis_linear] = position[axis_linear];
ADDIU	R2, SP, 76
ADDU	R2, R2, R3
SWC1	S1, 0(R2)
;Kinematics.c,199 :: 		x = r_axis0*rt_axis1-r_axis1*rt_axis0;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S5
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S4
SUB.S 	S2, S1, S0
;Kinematics.c,200 :: 		y = r_axis0*rt_axis0+r_axis1*rt_axis1;
LWC1	S0, 32(SP)
MUL.S 	S1, S0, S4
; rt_axis0 end address is: 32 (R8)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S5
; rt_axis1 end address is: 40 (R10)
ADD.S 	S0, S1, S0
;Kinematics.c,208 :: 		angular_travel = atan2(y,x);
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
; angular_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,211 :: 		if(isclockwise > 0) {
ANDI	R2, R7, 255
; isclockwise end address is: 28 (R7)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__mc_arc127
NOP	
J	L_mc_arc36
NOP	
L__mc_arc127:
;Kinematics.c,212 :: 		if (angular_travel >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S6, S0
BC1F	0, L__mc_arc128
NOP	
J	L__mc_arc87
NOP	
L__mc_arc128:
;Kinematics.c,213 :: 		angular_travel -= PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
SUB.S 	S0, S6, S0
; angular_travel end address is: 48 (R12)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc37
NOP	
L__mc_arc87:
;Kinematics.c,212 :: 		if (angular_travel >= 0)
;Kinematics.c,213 :: 		angular_travel -= PIx2;
L_mc_arc37:
;Kinematics.c,214 :: 		}else {
; angular_travel start address is: 48 (R12)
MOV.S 	S4, S6
J	L_mc_arc38
NOP	
L_mc_arc36:
;Kinematics.c,215 :: 		if(angular_travel <= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S6
BC1F	0, L__mc_arc129
NOP	
J	L__mc_arc88
NOP	
L__mc_arc129:
;Kinematics.c,216 :: 		angular_travel += PIx2;
LUI	R2, 16585
ORI	R2, R2, 4059
MTC1	R2, S0
ADD.S 	S0, S6, S0
; angular_travel end address is: 48 (R12)
; angular_travel start address is: 8 (R2)
MOV.S 	S1, S0
; angular_travel end address is: 8 (R2)
MOV.S 	S6, S1
J	L_mc_arc39
NOP	
L__mc_arc88:
;Kinematics.c,215 :: 		if(angular_travel <= 0)
;Kinematics.c,216 :: 		angular_travel += PIx2;
L_mc_arc39:
;Kinematics.c,217 :: 		}
; angular_travel start address is: 48 (R12)
MOV.S 	S4, S6
; angular_travel end address is: 48 (R12)
L_mc_arc38:
;Kinematics.c,236 :: 		mm_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
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
;Kinematics.c,237 :: 		if (mm_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc130
NOP	
J	L_mc_arc40
NOP	
L__mc_arc130:
; invert_feed_rate end address is: 24 (R6)
; linear_travel end address is: 24 (R6)
; angular_travel end address is: 32 (R8)
; mm_of_travel end address is: 16 (R4)
; axis_1 end address is: 20 (R5)
J	L_end_mc_arc
NOP	
L_mc_arc40:
;Kinematics.c,239 :: 		segments = floor(mm_of_travel/settings.mm_per_arc_segment);
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
;Kinematics.c,244 :: 		if (invert_feed_rate)
BNE	R6, R0, L__mc_arc132
NOP	
J	L_mc_arc41
NOP	
L__mc_arc132:
; invert_feed_rate end address is: 24 (R6)
;Kinematics.c,245 :: 		feed_rate *= segments;
LWC1	S0, 48(SP)
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc41:
;Kinematics.c,248 :: 		theta_per_segment = angular_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S2, S4, S0
; angular_travel end address is: 32 (R8)
SWC1	S2, 40(SP)
;Kinematics.c,253 :: 		linear_per_segment = linear_travel/segments;
LWC1	S0, 48(SP)
DIV.S 	S0, S3, S0
; linear_travel end address is: 24 (R6)
SWC1	S0, 44(SP)
;Kinematics.c,256 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
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
;Kinematics.c,257 :: 		sin_T = theta_per_segment;
SWC1	S2, 56(SP)
;Kinematics.c,260 :: 		nPx = arc_target[axis_0] = position[axis_0];
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,261 :: 		nPy = arc_target[axis_1] = position[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,277 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, 72(SP)
; axis_1 end address is: 20 (R5)
L_mc_arc42:
; axis_1 start address is: 20 (R5)
LWC1	S1, 48(SP)
LWC1	S0, 72(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc133
NOP	
J	L_mc_arc43
NOP	
L__mc_arc133:
;Kinematics.c,280 :: 		if (count < settings.n_arc_correction) {
LHU	R3, Offset(_settings+48)(GP)
LH	R2, 88(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc134
NOP	
J	L_mc_arc45
NOP	
L__mc_arc134:
;Kinematics.c,282 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 56(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 52(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,283 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 52(SP)
LWC1	S0, 32(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 56(SP)
LWC1	S0, 36(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 32(SP)
;Kinematics.c,284 :: 		r_axis1 = r_axisi;
SWC1	S3, 36(SP)
;Kinematics.c,285 :: 		count++;
LH	R2, 88(SP)
ADDIU	R2, R2, 1
SH	R2, 88(SP)
;Kinematics.c,286 :: 		} else {
J	L_mc_arc46
NOP	
L_mc_arc45:
;Kinematics.c,289 :: 		cos_Ti = cos(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 72(SP)
MUL.S 	S0, S0, S1
SW	R26, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 60(SP)
;Kinematics.c,290 :: 		sin_Ti = sin(i*theta_per_segment);
LWC1	S1, 40(SP)
LWC1	S0, 72(SP)
MUL.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LWC1	S12, 8(SP)
LW	R26, 4(SP)
;Kinematics.c,291 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,292 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 60(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 36(SP)
;Kinematics.c,293 :: 		count = 0;
SH	R0, 88(SP)
;Kinematics.c,294 :: 		}
L_mc_arc46:
;Kinematics.c,297 :: 		arc_target[axis_0] = center_axis0 + r_axis0;
ADDIU	R4, SP, 76
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,298 :: 		arc_target[axis_1] = center_axis1 + r_axis1;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 36(SP)
LWC1	S0, 28(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,299 :: 		arc_target[axis_linear] += linear_per_segment;
LH	R2, 94(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 44(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,300 :: 		nPx =  arc_target[axis_0] - position[axis_0];
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 64(SP)
;Kinematics.c,301 :: 		nPy =  arc_target[axis_1] - position[axis_1];
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
ADDU	R2, R25, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 68(SP)
;Kinematics.c,303 :: 		if(gc.absolute_mode){
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__mc_arc136
NOP	
J	L_mc_arc47
NOP	
L__mc_arc136:
;Kinematics.c,304 :: 		nPx += position[axis_0];// += nPx;//arc_target[axis_0];
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 64(SP)
;Kinematics.c,305 :: 		nPy += position[axis_1];// += nPy;//arc_target[axis_1];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 68(SP)
;Kinematics.c,306 :: 		}
L_mc_arc47:
;Kinematics.c,309 :: 		STPS[axis_0].step_delay = feed_rate;
SEH	R3, R28
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,310 :: 		STPS[axis_1].step_delay = feed_rate;
SEH	R3, R5
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Kinematics.c,318 :: 		if(position[axis_0] > target[axis_0]){
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc137
NOP	
J	L_mc_arc48
NOP	
L__mc_arc137:
;Kinematics.c,319 :: 		if(nPx < target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc138
NOP	
J	L_mc_arc49
NOP	
L__mc_arc138:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc49:
;Kinematics.c,320 :: 		}else if(position[axis_0] < target[axis_0]){
J	L_mc_arc50
NOP	
L_mc_arc48:
SEH	R2, R28
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc139
NOP	
J	L_mc_arc51
NOP	
L__mc_arc139:
;Kinematics.c,321 :: 		if(nPx > target[axis_0]){nPx = target[axis_0];}
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 64(SP)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc140
NOP	
J	L_mc_arc52
NOP	
L__mc_arc140:
SEH	R2, R28
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 64(SP)
L_mc_arc52:
;Kinematics.c,322 :: 		}
L_mc_arc51:
L_mc_arc50:
;Kinematics.c,324 :: 		if(position[axis_1] > target[axis_1]){
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S1, S0
BC1F	0, L__mc_arc141
NOP	
J	L_mc_arc53
NOP	
L__mc_arc141:
;Kinematics.c,325 :: 		if(nPy <= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc142
NOP	
J	L_mc_arc54
NOP	
L__mc_arc142:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 68(SP)
L_mc_arc54:
;Kinematics.c,326 :: 		}else if(position[axis_1] < target[axis_1]){
J	L_mc_arc55
NOP	
L_mc_arc53:
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
C.LE.S 	0, S0, S1
BC1F	0, L__mc_arc143
NOP	
J	L_mc_arc56
NOP	
L__mc_arc143:
;Kinematics.c,327 :: 		if(nPy >= target[axis_1]){nPy = target[axis_1];}
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc144
NOP	
J	L_mc_arc57
NOP	
L__mc_arc144:
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 68(SP)
L_mc_arc57:
;Kinematics.c,328 :: 		}
L_mc_arc56:
L_mc_arc55:
;Kinematics.c,331 :: 		DualAxisStep(nPx,nPy,axis_0,axis_1,feed_rate);//,xy);
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
;Kinematics.c,335 :: 		while(Stepper_Busy()){
L_mc_arc58:
; axis_1 start address is: 12 (R3)
SH	R3, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
JAL	_Stepper_Busy+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R3, 4(SP)
BNE	R2, R0, L__mc_arc146
NOP	
J	L_mc_arc59
NOP	
L__mc_arc146:
;Kinematics.c,336 :: 		protocol_execute_runtime();
SH	R3, 4(SP)
SH	R28, 6(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
SWC1	S12, 20(SP)
JAL	_protocol_execute_runtime+0
NOP	
LWC1	S12, 20(SP)
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R28, 6(SP)
LH	R3, 4(SP)
;Kinematics.c,337 :: 		if(sys.abort) break;
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__mc_arc148
NOP	
J	L_mc_arc60
NOP	
L__mc_arc148:
J	L_mc_arc59
NOP	
L_mc_arc60:
;Kinematics.c,338 :: 		}
J	L_mc_arc58
NOP	
L_mc_arc59:
;Kinematics.c,341 :: 		if (sys.abort) { return; }
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__mc_arc150
NOP	
J	L_mc_arc61
NOP	
L__mc_arc150:
; axis_1 end address is: 12 (R3)
J	L_end_mc_arc
NOP	
L_mc_arc61:
;Kinematics.c,277 :: 		for (i = 1; i<segments; i+=1.00) { // Increment (segments-1)
; axis_1 start address is: 12 (R3)
LWC1	S1, 72(SP)
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 72(SP)
;Kinematics.c,353 :: 		}
SEH	R5, R3
; axis_1 end address is: 12 (R3)
J	L_mc_arc42
NOP	
L_mc_arc43:
;Kinematics.c,355 :: 		SV.cir = 0;
; axis_1 start address is: 20 (R5)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,357 :: 		DualAxisStep(target[axis_0],target[axis_1],axis_0,axis_1,feed_rate);
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
;Kinematics.c,365 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,369 :: 		float hypot(float x, float y){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,370 :: 		return(sqrt((x*x) + (y*y)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,371 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_Home:
;Kinematics.c,382 :: 		int Home(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,386 :: 		if(sys.state == STATE_IDLE){
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__Home153
NOP	
J	L_Home62
NOP	
L__Home153:
;Kinematics.c,387 :: 		speed = settings.homing_seek_rate;
LWC1	S0, Offset(_settings+28)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,390 :: 		Rst_FP(axis);Rst_FN(axis);
SH	R25, 4(SP)
JAL	_Rst_FP+0
NOP	
LH	R25, 4(SP)
SH	R25, 4(SP)
JAL	_Rst_FN+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,393 :: 		bit_false(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,396 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,399 :: 		homing[axis].home_cnt = 0;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,402 :: 		EnableSteppers();
SH	R25, 4(SP)
JAL	_EnableSteppers+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,405 :: 		sys.state = STATE_HOMING;
ORI	R2, R0, 5
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,408 :: 		if(!Test_Port_Pins(axis)){
SH	R25, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
LH	R25, 4(SP)
BEQ	R2, R0, L__Home154
NOP	
J	L_Home63
NOP	
L__Home154:
;Kinematics.c,410 :: 		homing[axis].home_cnt = 1;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 1
SH	R2, 0(R3)
;Kinematics.c,412 :: 		goto HOMED;
J	___Home_HOMED
NOP	
;Kinematics.c,413 :: 		}
L_Home63:
;Kinematics.c,417 :: 		Home_Axis(-(max_sizes[axis]+100.0),speed,axis);
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
;Kinematics.c,427 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,428 :: 		}
L_Home62:
;Kinematics.c,432 :: 		if(sys.state == STATE_HOMING){
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Home155
NOP	
J	L_Home64
NOP	
L__Home155:
;Kinematics.c,437 :: 		if(FN(axis)){
SH	R25, 4(SP)
JAL	_FN+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home157
NOP	
J	L_Home65
NOP	
L__Home157:
;Kinematics.c,440 :: 		HOMED:
___Home_HOMED:
;Kinematics.c,441 :: 		speed = settings.homing_feed_rate;
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(Home_speed_L0+0)(GP)
;Kinematics.c,450 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_COMPLETE)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 32
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home158
NOP	
J	L_Home66
NOP	
L__Home158:
;Kinematics.c,452 :: 		if(bit_isfalse(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Home159
NOP	
J	L_Home67
NOP	
L__Home159:
;Kinematics.c,455 :: 		if(homing[axis].home_cnt == 1){ //at 1st hit of limit
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Home160
NOP	
J	L_Home68
NOP	
L__Home160:
;Kinematics.c,457 :: 		bit_true(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 8
SH	R2, 0(R3)
;Kinematics.c,458 :: 		bit_false(homing[axis].home_state,bit(HOME));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,461 :: 		VDelay_ms((unsigned long)settings.homing_debounce_delay);
LHU	R2, Offset(_settings+54)(GP)
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_VDelay_ms+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,465 :: 		Home_Axis(12.0,settings.homing_feed_rate, axis);
LUI	R2, 16704
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,467 :: 		}else if(homing[axis].home_cnt > 1){//2nd hit of limit
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
BEQ	R2, R0, L__Home161
NOP	
J	L_Home70
NOP	
L__Home161:
;Kinematics.c,469 :: 		bit_true(homing[axis].home_state,bit(HOME_COMPLETE));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R3, R2, R3
LHU	R2, 0(R3)
ORI	R2, R2, 32
SH	R2, 0(R3)
;Kinematics.c,470 :: 		StopAxis(axis);
SH	R25, 4(SP)
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,471 :: 		axis++;
ADDIU	R2, R25, 1
SEH	R25, R2
;Kinematics.c,473 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Kinematics.c,476 :: 		homing[axis].home_cnt = 0;
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,488 :: 		Home_Axis(settings.homing_pulloff,settings.homing_feed_rate, axis);
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
LWC1	S12, Offset(_settings+32)(GP)
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,490 :: 		return axis;
SEH	R2, R25
J	L_end_Home
NOP	
;Kinematics.c,491 :: 		}
L_Home70:
L_Home69:
;Kinematics.c,492 :: 		}
L_Home67:
;Kinematics.c,497 :: 		}
L_Home66:
;Kinematics.c,498 :: 		}
L_Home65:
;Kinematics.c,506 :: 		if(FP(axis)){
SH	R25, 4(SP)
JAL	_FP+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Home163
NOP	
J	L_Home71
NOP	
L__Home163:
;Kinematics.c,508 :: 		homing[axis].home_cnt++;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Kinematics.c,509 :: 		if(bit_istrue(homing[axis].home_state,BIT_HOME_REV)){
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R2, R2, 8
ANDI	R2, R2, 65535
BNE	R2, R0, L__Home165
NOP	
J	L_Home72
NOP	
L__Home165:
;Kinematics.c,510 :: 		bit_false(homing[axis].home_state,bit(HOME_REV));
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R4, R2, R3
LHU	R3, 0(R4)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, 0(R4)
;Kinematics.c,513 :: 		Home_Axis(-290.00,settings.homing_feed_rate,axis);
LUI	R2, 50065
ORI	R2, R2, 0
SH	R25, 4(SP)
LWC1	S13, Offset(_settings+24)(GP)
MTC1	R2, S12
JAL	Kinematics_Home_Axis+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,514 :: 		}
L_Home72:
;Kinematics.c,523 :: 		}
L_Home71:
;Kinematics.c,524 :: 		}
L_Home64:
;Kinematics.c,525 :: 		return axis;
SEH	R2, R25
;Kinematics.c,526 :: 		}
L_end_Home:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Home
Kinematics_Home_Axis:
;Kinematics.c,529 :: 		static void Home_Axis(double distance,float speed,int axis){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,531 :: 		StopAxis(axis);
SH	R25, 4(SP)
SWC1	S13, 8(SP)
SWC1	S12, 12(SP)
JAL	_StopAxis+0
NOP	
LWC1	S12, 12(SP)
LWC1	S13, 8(SP)
LH	R25, 4(SP)
;Kinematics.c,532 :: 		STPS[axis].run_state = STOP ;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Kinematics.c,542 :: 		STPS[axis].mmToTravel = belt_steps(distance,axis);
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
SW	R2, 16(SP)
SH	R25, 4(SP)
SWC1	S13, 8(SP)
JAL	_belt_steps+0
NOP	
LWC1	S13, 8(SP)
LH	R25, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Kinematics.c,544 :: 		speed = RPS_FROM_MMPMIN(speed);
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S1, S13, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MOV.S 	S13, S0
;Kinematics.c,546 :: 		speed = Get_Step_Rate(speed,axis);
SH	R25, 4(SP)
MOV.S 	S12, S0
JAL	_Get_Step_Rate+0
NOP	
LH	R25, 4(SP)
MOV.S 	S13, S0
;Kinematics.c,547 :: 		SingleAxisStep(STPS[axis].mmToTravel, speed,axis);
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
LW	R2, 0(R2)
MTC1	R2, S1
CVT32.W 	S1, S1
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_SingleAxisStep+0
NOP	
;Kinematics.c,548 :: 		}
L_end_Home_Axis:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Kinematics_Home_Axis
Kinematics_ResetHoming:
;Kinematics.c,550 :: 		static void ResetHoming(){
;Kinematics.c,551 :: 		int i = 0;
;Kinematics.c,552 :: 		for(i = 0;i< NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Kinematics_ResetHoming73:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Kinematics_ResetHoming168
NOP	
J	L_Kinematics_ResetHoming74
NOP	
L_Kinematics_ResetHoming168:
;Kinematics.c,553 :: 		homing[i].home_state = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Kinematics.c,554 :: 		homing[i].home_cnt = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(Kinematics_homing+0)
ORI	R2, R2, lo_addr(Kinematics_homing+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
;Kinematics.c,552 :: 		for(i = 0;i< NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Kinematics.c,555 :: 		}
; i end address is: 16 (R4)
J	L_Kinematics_ResetHoming73
NOP	
L_Kinematics_ResetHoming74:
;Kinematics.c,556 :: 		}
L_end_ResetHoming:
JR	RA
NOP	
; end of Kinematics_ResetHoming
_mc_reset:
;Kinematics.c,563 :: 		void mc_reset(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,565 :: 		if (bit_isfalse(sys.execute, EXEC_RESET)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BEQ	R2, R0, L__mc_reset170
NOP	
J	L_mc_reset76
NOP	
L__mc_reset170:
;Kinematics.c,566 :: 		sys.execute |= EXEC_RESET;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,576 :: 		switch (sys.state) {
J	L_mc_reset77
NOP	
;Kinematics.c,577 :: 		case STATE_CYCLE: case STATE_HOLD: case STATE_HOMING: // case STATE_JOG:
L_mc_reset79:
L_mc_reset80:
L_mc_reset81:
;Kinematics.c,578 :: 		sys.execute |= EXEC_ALARM; // Execute alarm state.
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_sys+26)(GP)
;Kinematics.c,579 :: 		disableSpindleOCx(); // Execute alarm force kills steppers. Position likely lost.
JAL	_disableSpindleOCx+0
NOP	
;Kinematics.c,580 :: 		Stepper_Abort();
JAL	_Stepper_Abort+0
NOP	
;Kinematics.c,581 :: 		DisableSteppers();
JAL	_DisableSteppers+0
NOP	
;Kinematics.c,582 :: 		ResetHoming();
JAL	Kinematics_ResetHoming+0
NOP	
;Kinematics.c,583 :: 		}
J	L_mc_reset78
NOP	
L_mc_reset77:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__mc_reset172
NOP	
J	L_mc_reset79
NOP	
L__mc_reset172:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__mc_reset174
NOP	
J	L_mc_reset80
NOP	
L__mc_reset174:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__mc_reset176
NOP	
J	L_mc_reset81
NOP	
L__mc_reset176:
L_mc_reset78:
;Kinematics.c,584 :: 		}
L_mc_reset76:
;Kinematics.c,585 :: 		}
L_end_mc_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _mc_reset
