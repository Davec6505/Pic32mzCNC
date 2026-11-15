_SetPinMode:
;Stepper.c,24 :: 		void SetPinMode(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,26 :: 		Timer8CallbackInitialize(dds_tick);
SW	R25, 4(SP)
LUI	R25, hi_addr(_dds_tick+0)
ORI	R25, R25, lo_addr(_dds_tick+0)
JAL	_Timer8CallbackInitialize+0
NOP	
;Stepper.c,29 :: 		EN_Steppers      = 1;
_LX	
ORI	R2, R2, BitMask(EN_Steppers+0)
_SX	
;Stepper.c,30 :: 		EN_Steppers_Dir  = 0;
_LX	
INS	R2, R0, BitPos(EN_Steppers_Dir+0), 1
_SX	
;Stepper.c,33 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,36 :: 		PLS_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirX+0), 1
_SX	
;Stepper.c,40 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,43 :: 		PLS_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirY+0), 1
_SX	
;Stepper.c,47 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,50 :: 		PLS_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirZ+0), 1
_SX	
;Stepper.c,54 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,57 :: 		PLS_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirA+0), 1
_SX	
;Stepper.c,59 :: 		PLS_StepX = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepX+0), 1
_SX	
;Stepper.c,60 :: 		PLS_StepY = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepY+0), 1
_SX	
;Stepper.c,61 :: 		PLS_StepZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepZ+0), 1
_SX	
;Stepper.c,62 :: 		PLS_StepA = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepA+0), 1
_SX	
;Stepper.c,63 :: 		}
L_end_SetPinMode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SetPinMode
_dds_tick:
;Stepper.c,71 :: 		void dds_tick(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,75 :: 		PLS_StepX = 0;
SW	R25, 4(SP)
_LX	
INS	R2, R0, BitPos(PLS_StepX+0), 1
_SX	
;Stepper.c,76 :: 		PLS_StepY = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepY+0), 1
_SX	
;Stepper.c,77 :: 		PLS_StepZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepZ+0), 1
_SX	
;Stepper.c,78 :: 		PLS_StepA = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepA+0), 1
_SX	
;Stepper.c,80 :: 		m = eng_master;
; m start address is: 32 (R8)
LH	R8, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,81 :: 		if(m < 0) return;
SEH	R2, R8
SLTI	R2, R2, 0
BNE	R2, R0, L__dds_tick67
NOP	
J	L_dds_tick0
NOP	
L__dds_tick67:
; m end address is: 32 (R8)
J	L_end_dds_tick
NOP	
L_dds_tick0:
;Stepper.c,84 :: 		dds_master.old_phase = dds_master.phase;
; m start address is: 32 (R8)
LW	R2, Offset(Stepper_dds_master+0)(GP)
SW	R2, Offset(Stepper_dds_master+8)(GP)
;Stepper.c,85 :: 		dds_master.phase += dds_master.increment;
LW	R3, Offset(Stepper_dds_master+4)(GP)
LW	R2, Offset(Stepper_dds_master+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_dds_master+0)(GP)
;Stepper.c,86 :: 		if(dds_master.phase >= dds_master.old_phase) return;
LW	R3, Offset(Stepper_dds_master+8)(GP)
LW	R2, Offset(Stepper_dds_master+0)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L__dds_tick68
NOP	
J	L_dds_tick1
NOP	
L__dds_tick68:
; m end address is: 32 (R8)
J	L_end_dds_tick
NOP	
L_dds_tick1:
;Stepper.c,88 :: 		Step_Cycle(m);
; m start address is: 32 (R8)
SEH	R25, R8
JAL	Stepper_Step_Cycle+0
NOP	
;Stepper.c,89 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; m end address is: 32 (R8)
; i end address is: 20 (R5)
L_dds_tick2:
; i start address is: 20 (R5)
; m start address is: 32 (R8)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__dds_tick69
NOP	
J	L_dds_tick3
NOP	
L__dds_tick69:
;Stepper.c,90 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
SEH	R3, R5
SEH	R2, R8
BNE	R3, R2, L__dds_tick71
NOP	
J	L__dds_tick59
NOP	
L__dds_tick71:
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(Stepper_eng_axes+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__dds_tick73
NOP	
J	L__dds_tick58
NOP	
L__dds_tick73:
L__dds_tick57:
;Stepper.c,92 :: 		gap = (unsigned long)STPS[m].dist - (unsigned long)STPS[i].dist;
SEH	R3, R8
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R4, 0(R2)
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SUBU	R4, R4, R2
; gap start address is: 24 (R6)
MOVZ	R6, R4, R0
;Stepper.c,93 :: 		if(eng_err[i] >= gap){
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SLTU	R2, R2, R4
BEQ	R2, R0, L__dds_tick74
NOP	
J	L_dds_tick8
NOP	
L__dds_tick74:
;Stepper.c,94 :: 		eng_err[i] -= gap;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
SUBU	R2, R2, R6
; gap end address is: 24 (R6)
SW	R2, 0(R3)
;Stepper.c,95 :: 		Step_Cycle(i);
SEH	R25, R5
JAL	Stepper_Step_Cycle+0
NOP	
;Stepper.c,96 :: 		}else{
J	L_dds_tick9
NOP	
L_dds_tick8:
;Stepper.c,97 :: 		eng_err[i] += (unsigned long)STPS[i].dist;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, 0(R4)
ADDU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,98 :: 		}
L_dds_tick9:
;Stepper.c,90 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
L__dds_tick59:
L__dds_tick58:
;Stepper.c,89 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,100 :: 		}
; i end address is: 20 (R5)
J	L_dds_tick2
NOP	
L_dds_tick3:
;Stepper.c,103 :: 		Pulse(m);
SEH	R25, R8
JAL	_Pulse+0
NOP	
;Stepper.c,104 :: 		if(STPS[m].run_state == STOP){
SEH	R3, R8
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__dds_tick75
NOP	
J	L_dds_tick10
NOP	
L__dds_tick75:
;Stepper.c,105 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; m end address is: 32 (R8)
; i end address is: 20 (R5)
SEH	R4, R8
L_dds_tick11:
; i start address is: 20 (R5)
; m start address is: 16 (R4)
; m start address is: 16 (R4)
; m end address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__dds_tick76
NOP	
J	L_dds_tick12
NOP	
L__dds_tick76:
; m end address is: 16 (R4)
;Stepper.c,106 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
; m start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
BNE	R3, R2, L__dds_tick78
NOP	
J	L__dds_tick61
NOP	
L__dds_tick78:
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(Stepper_eng_axes+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__dds_tick80
NOP	
J	L__dds_tick60
NOP	
L__dds_tick80:
L__dds_tick56:
;Stepper.c,107 :: 		STPS[i].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,108 :: 		bit_false(SV.mode_complete,bit(i));
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,106 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
L__dds_tick61:
L__dds_tick60:
;Stepper.c,105 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,110 :: 		}
; m end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_dds_tick11
NOP	
L_dds_tick12:
;Stepper.c,111 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,112 :: 		return;
J	L_end_dds_tick
NOP	
;Stepper.c,113 :: 		}
L_dds_tick10:
;Stepper.c,114 :: 		dds_master.increment = Dds_Increment(STPS[m].step_delay);
; m start address is: 32 (R8)
SEH	R3, R8
; m end address is: 32 (R8)
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R25, 0(R2)
JAL	Stepper_Dds_Increment+0
NOP	
SW	R2, Offset(Stepper_dds_master+4)(GP)
;Stepper.c,115 :: 		}
L_end_dds_tick:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _dds_tick
Stepper_Dds_Increment:
;Stepper.c,119 :: 		static unsigned long Dds_Increment(long step_delay){
;Stepper.c,121 :: 		if(step_delay < DDS_MIN_DELAY) step_delay = DDS_MIN_DELAY;
SLTI	R2, R25, 125
BNE	R2, R0, L_Stepper_Dds_Increment82
NOP	
J	L_Stepper_Dds_Increment17
NOP	
L_Stepper_Dds_Increment82:
ORI	R25, R0, 125
L_Stepper_Dds_Increment17:
;Stepper.c,122 :: 		q = 0xFFFFFFFF / (unsigned long)step_delay;
LUI	R2, 65535
ORI	R2, R2, 65535
DIVU	R2, R25
MFLO	R2
;Stepper.c,123 :: 		return (q >> 1) * DDS_T1_RATIO_X2;
SRL	R3, R2, 1
ORI	R2, R0, 125
MULTU	R3, R2
MFLO	R2
;Stepper.c,124 :: 		}
L_end_Dds_Increment:
JR	RA
NOP	
; end of Stepper_Dds_Increment
_Start_Interpolation:
;Stepper.c,128 :: 		void Start_Interpolation(int m,int axes){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,130 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,131 :: 		if(STPS[m].dist <= 0 || STPS[m].run_state == STOP){
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Start_Interpolation84
NOP	
J	L__Start_Interpolation64
NOP	
L__Start_Interpolation84:
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L__Start_Interpolation86
NOP	
J	L__Start_Interpolation63
NOP	
L__Start_Interpolation86:
J	L_Start_Interpolation20
NOP	
L__Start_Interpolation64:
L__Start_Interpolation63:
;Stepper.c,132 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Start_Interpolation21:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Start_Interpolation87
NOP	
J	L_Start_Interpolation22
NOP	
L__Start_Interpolation87:
;Stepper.c,133 :: 		if(bit_istrue(axes,bit(i))){
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R26, R2
SEH	R2, R2
BNE	R2, R0, L__Start_Interpolation89
NOP	
J	L_Start_Interpolation24
NOP	
L__Start_Interpolation89:
;Stepper.c,134 :: 		STPS[i].run_state = STOP;
SEH	R3, R4
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,135 :: 		bit_false(SV.mode_complete,bit(i));
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,136 :: 		}
L_Start_Interpolation24:
;Stepper.c,132 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,137 :: 		}
; i end address is: 16 (R4)
J	L_Start_Interpolation21
NOP	
L_Start_Interpolation22:
;Stepper.c,138 :: 		return;
J	L_end_Start_Interpolation
NOP	
;Stepper.c,139 :: 		}
L_Start_Interpolation20:
;Stepper.c,140 :: 		eng_axes = axes;
SH	R26, Offset(Stepper_eng_axes+0)(GP)
;Stepper.c,141 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Start_Interpolation25:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Start_Interpolation90
NOP	
J	L_Start_Interpolation26
NOP	
L__Start_Interpolation90:
;Stepper.c,142 :: 		eng_err[i] = (unsigned long)STPS[m].dist >> 1;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R4, R2, R3
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SRL	R2, R2, 1
SW	R2, 0(R4)
;Stepper.c,141 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,142 :: 		eng_err[i] = (unsigned long)STPS[m].dist >> 1;
; i end address is: 20 (R5)
J	L_Start_Interpolation25
NOP	
L_Start_Interpolation26:
;Stepper.c,143 :: 		dds_master.phase     = 0;
SW	R0, Offset(Stepper_dds_master+0)(GP)
;Stepper.c,144 :: 		dds_master.increment = Dds_Increment(STPS[m].step_delay);
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SH	R25, 4(SP)
LW	R25, 0(R2)
JAL	Stepper_Dds_Increment+0
NOP	
LH	R25, 4(SP)
SW	R2, Offset(Stepper_dds_master+4)(GP)
;Stepper.c,145 :: 		eng_master = m;
SH	R25, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,146 :: 		}
L_end_Start_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Start_Interpolation
_Stepper_Abort:
;Stepper.c,149 :: 		void Stepper_Abort(){
;Stepper.c,151 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,152 :: 		eng_axes = 0;
SH	R0, Offset(Stepper_eng_axes+0)(GP)
;Stepper.c,153 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Stepper_Abort28:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Stepper_Abort92
NOP	
J	L_Stepper_Abort29
NOP	
L__Stepper_Abort92:
;Stepper.c,154 :: 		STPS[i].run_state = STOP;
SEH	R3, R4
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,153 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,154 :: 		STPS[i].run_state = STOP;
; i end address is: 16 (R4)
J	L_Stepper_Abort28
NOP	
L_Stepper_Abort29:
;Stepper.c,155 :: 		}
L_end_Stepper_Abort:
JR	RA
NOP	
; end of _Stepper_Abort
_Stepper_Busy:
;Stepper.c,157 :: 		int Stepper_Busy(){
;Stepper.c,158 :: 		return eng_master >= 0;
LH	R2, Offset(Stepper_eng_master+0)(GP)
SLTI	R2, R2, 0
XORI	R2, R2, 1
;Stepper.c,159 :: 		}
L_end_Stepper_Busy:
JR	RA
NOP	
; end of _Stepper_Busy
_EnableSteppers:
;Stepper.c,162 :: 		void EnableSteppers(){
;Stepper.c,163 :: 		EN_Steppers = 0;
_LX	
INS	R2, R0, BitPos(EN_Steppers+0), 1
_SX	
;Stepper.c,164 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_DisableSteppers:
;Stepper.c,166 :: 		void DisableSteppers(){
;Stepper.c,167 :: 		EN_Steppers = 1;
_LX	
ORI	R2, R2, BitMask(EN_Steppers+0)
_SX	
;Stepper.c,168 :: 		}
L_end_DisableSteppers:
JR	RA
NOP	
; end of _DisableSteppers
_GET_RunState:
;Stepper.c,170 :: 		int GET_RunState(int axis_No){
;Stepper.c,171 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,172 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_StopAxis:
;Stepper.c,175 :: 		void StopAxis(int axis){
;Stepper.c,176 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Stepper.c,177 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableSpindleOCx:
;Stepper.c,180 :: 		void disableSpindleOCx(){
;Stepper.c,181 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,182 :: 		}
L_end_disableSpindleOCx:
JR	RA
NOP	
; end of _disableSpindleOCx
Stepper_Step_Cycle:
;Stepper.c,191 :: 		static void Step_Cycle(int axis_No){
;Stepper.c,192 :: 		switch(axis_No){
J	L_Stepper_Step_Cycle31
NOP	
;Stepper.c,193 :: 		case X: PLS_StepX = 1; break;
L_Stepper_Step_Cycle33:
_LX	
ORI	R2, R2, BitMask(PLS_StepX+0)
_SX	
J	L_Stepper_Step_Cycle32
NOP	
;Stepper.c,194 :: 		case Y: PLS_StepY = 1; break;
L_Stepper_Step_Cycle34:
_LX	
ORI	R2, R2, BitMask(PLS_StepY+0)
_SX	
J	L_Stepper_Step_Cycle32
NOP	
;Stepper.c,195 :: 		case Z: PLS_StepZ = 1; break;
L_Stepper_Step_Cycle35:
_LX	
ORI	R2, R2, BitMask(PLS_StepZ+0)
_SX	
J	L_Stepper_Step_Cycle32
NOP	
;Stepper.c,196 :: 		case A: PLS_StepA = 1; break;
L_Stepper_Step_Cycle36:
_LX	
ORI	R2, R2, BitMask(PLS_StepA+0)
_SX	
J	L_Stepper_Step_Cycle32
NOP	
;Stepper.c,197 :: 		default: break;
L_Stepper_Step_Cycle37:
J	L_Stepper_Step_Cycle32
NOP	
;Stepper.c,198 :: 		}
L_Stepper_Step_Cycle31:
SEH	R2, R25
BNE	R2, R0, L_Stepper_Step_Cycle102
NOP	
J	L_Stepper_Step_Cycle33
NOP	
L_Stepper_Step_Cycle102:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Step_Cycle104
NOP	
J	L_Stepper_Step_Cycle34
NOP	
L_Stepper_Step_Cycle104:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Step_Cycle106
NOP	
J	L_Stepper_Step_Cycle35
NOP	
L_Stepper_Step_Cycle106:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Step_Cycle108
NOP	
J	L_Stepper_Step_Cycle36
NOP	
L_Stepper_Step_Cycle108:
J	L_Stepper_Step_Cycle37
NOP	
L_Stepper_Step_Cycle32:
;Stepper.c,200 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 36
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,202 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 68
ADDIU	R2, R2, 2
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,203 :: 		}
L_end_Step_Cycle:
JR	RA
NOP	
; end of Stepper_Step_Cycle
_Pulse:
;Stepper.c,210 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,211 :: 		long remaining = STPS[axis_No].dist - STPS[axis_No].step_count;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 36
LW	R2, 0(R2)
SUBU	R2, R3, R2
; remaining start address is: 28 (R7)
MOVZ	R7, R2, R0
;Stepper.c,213 :: 		if(STPS[axis_No].run_state != STOP && remaining <= 0)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L__Pulse111
NOP	
J	L__Pulse55
NOP	
L__Pulse111:
SLTI	R2, R7, 1
BNE	R2, R0, L__Pulse112
NOP	
J	L__Pulse54
NOP	
L__Pulse112:
L__Pulse53:
;Stepper.c,214 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,213 :: 		if(STPS[axis_No].run_state != STOP && remaining <= 0)
L__Pulse55:
L__Pulse54:
;Stepper.c,216 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 4(SP)
J	L_Pulse41
NOP	
; remaining end address is: 28 (R7)
;Stepper.c,217 :: 		case STOP:
L_Pulse43:
;Stepper.c,218 :: 		StopAxis(axis_No);
JAL	_StopAxis+0
NOP	
;Stepper.c,220 :: 		bit_false(SV.mode_complete,bit(axis_No));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,221 :: 		break;
J	L_Pulse42
NOP	
;Stepper.c,222 :: 		case ACCEL:
L_Pulse44:
;Stepper.c,224 :: 		AccDec(axis_No);
; remaining start address is: 28 (R7)
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,225 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse113
NOP	
J	L_Pulse45
NOP	
L__Pulse113:
;Stepper.c,226 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,227 :: 		}
L_Pulse45:
;Stepper.c,228 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 36
LW	R3, 0(R2)
ADDIU	R2, R4, 52
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse114
NOP	
J	L_Pulse46
NOP	
L__Pulse114:
;Stepper.c,229 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,230 :: 		}
L_Pulse46:
;Stepper.c,233 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 36
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse115
NOP	
J	L_Pulse47
NOP	
L__Pulse115:
;Stepper.c,234 :: 		STPS[axis_No].accel_count = -remaining;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
MOVZ	R2, R0, R0
SUBU	R2, R2, R7
; remaining end address is: 28 (R7)
SW	R2, 0(R3)
;Stepper.c,235 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,236 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,237 :: 		}
L_Pulse47:
;Stepper.c,238 :: 		break;
J	L_Pulse42
NOP	
;Stepper.c,239 :: 		case RUN:
L_Pulse48:
;Stepper.c,240 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
; remaining start address is: 28 (R7)
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,243 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 36
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse116
NOP	
J	L_Pulse49
NOP	
L__Pulse116:
;Stepper.c,244 :: 		STPS[axis_No].accel_count = -remaining;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
MOVZ	R2, R0, R0
SUBU	R2, R2, R7
; remaining end address is: 28 (R7)
SW	R2, 0(R3)
;Stepper.c,245 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,246 :: 		STPS[axis_No].run_state =  DECEL;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,247 :: 		}
L_Pulse49:
;Stepper.c,248 :: 		break;
J	L_Pulse42
NOP	
;Stepper.c,249 :: 		case DECEL:
L_Pulse50:
;Stepper.c,251 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,252 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].StartUp_delay)
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 60
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse117
NOP	
J	L_Pulse51
NOP	
L__Pulse117:
;Stepper.c,253 :: 		STPS[axis_No].step_delay = STPS[axis_No].StartUp_delay;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SW	R2, 0(R3)
L_Pulse51:
;Stepper.c,254 :: 		break;
J	L_Pulse42
NOP	
;Stepper.c,255 :: 		default:break;
L_Pulse52:
J	L_Pulse42
NOP	
;Stepper.c,256 :: 		}
L_Pulse41:
; remaining start address is: 28 (R7)
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L__Pulse119
NOP	
J	L_Pulse43
NOP	
L__Pulse119:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse121
NOP	
J	L_Pulse44
NOP	
L__Pulse121:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse123
NOP	
J	L_Pulse48
NOP	
L__Pulse123:
; remaining end address is: 28 (R7)
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse125
NOP	
J	L_Pulse50
NOP	
L__Pulse125:
J	L_Pulse52
NOP	
L_Pulse42:
;Stepper.c,257 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,258 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
Stepper_AccDec:
;Stepper.c,261 :: 		static void AccDec(int axis_No){
;Stepper.c,262 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,263 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 44
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 56
LW	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SW	R2, 0(R5)
;Stepper.c,264 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 56
ADDIU	R2, R5, 8
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SW	R2, 0(R4)
;Stepper.c,265 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,266 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
