_SetPinMode:
;Stepper.c,27 :: 		void SetPinMode(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,29 :: 		Timer8CallbackInitialize(dds_tick);
SW	R25, 4(SP)
LUI	R25, hi_addr(_dds_tick+0)
ORI	R25, R25, lo_addr(_dds_tick+0)
JAL	_Timer8CallbackInitialize+0
NOP	
;Stepper.c,32 :: 		EN_Steppers      = 1;
_LX	
ORI	R2, R2, BitMask(EN_Steppers+0)
_SX	
;Stepper.c,33 :: 		EN_Steppers_Dir  = 0;
_LX	
INS	R2, R0, BitPos(EN_Steppers_Dir+0), 1
_SX	
;Stepper.c,36 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,39 :: 		PLS_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirX+0), 1
_SX	
;Stepper.c,43 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,46 :: 		PLS_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirY+0), 1
_SX	
;Stepper.c,50 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,53 :: 		PLS_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirZ+0), 1
_SX	
;Stepper.c,57 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,60 :: 		PLS_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirA+0), 1
_SX	
;Stepper.c,62 :: 		PLS_StepX = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepX+0), 1
_SX	
;Stepper.c,63 :: 		PLS_StepY = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepY+0), 1
_SX	
;Stepper.c,64 :: 		PLS_StepZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepZ+0), 1
_SX	
;Stepper.c,65 :: 		PLS_StepA = 0;
_LX	
INS	R2, R0, BitPos(PLS_StepA+0), 1
_SX	
;Stepper.c,66 :: 		}
L_end_SetPinMode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SetPinMode
_dds_tick:
;Stepper.c,74 :: 		void dds_tick(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,78 :: 		PLS_StepX = step_idle[X];
SW	R25, 4(SP)
LBU	R3, Offset(Stepper_step_idle+0)(GP)
_LX	
INS	R2, R3, BitPos(PLS_StepX+0), 1
_SX	
;Stepper.c,79 :: 		PLS_StepY = step_idle[Y];
LBU	R3, Offset(Stepper_step_idle+1)(GP)
_LX	
INS	R2, R3, BitPos(PLS_StepY+0), 1
_SX	
;Stepper.c,80 :: 		PLS_StepZ = step_idle[Z];
LBU	R3, Offset(Stepper_step_idle+2)(GP)
_LX	
INS	R2, R3, BitPos(PLS_StepZ+0), 1
_SX	
;Stepper.c,81 :: 		PLS_StepA = step_idle[A];
LBU	R3, Offset(Stepper_step_idle+3)(GP)
_LX	
INS	R2, R3, BitPos(PLS_StepA+0), 1
_SX	
;Stepper.c,83 :: 		m = eng_master;
; m start address is: 32 (R8)
LH	R8, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,84 :: 		if(m < 0) return;
SEH	R2, R8
SLTI	R2, R2, 0
BNE	R2, R0, L__dds_tick76
NOP	
J	L_dds_tick0
NOP	
L__dds_tick76:
; m end address is: 32 (R8)
J	L_end_dds_tick
NOP	
L_dds_tick0:
;Stepper.c,87 :: 		dds_master.old_phase = dds_master.phase;
; m start address is: 32 (R8)
LW	R2, Offset(Stepper_dds_master+0)(GP)
SW	R2, Offset(Stepper_dds_master+8)(GP)
;Stepper.c,88 :: 		dds_master.phase += dds_master.increment;
LW	R3, Offset(Stepper_dds_master+4)(GP)
LW	R2, Offset(Stepper_dds_master+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_dds_master+0)(GP)
;Stepper.c,91 :: 		if(dds_master.phase >= dds_master.old_phase) return;
LW	R3, Offset(Stepper_dds_master+8)(GP)
LW	R2, Offset(Stepper_dds_master+0)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L__dds_tick77
NOP	
J	L_dds_tick1
NOP	
L__dds_tick77:
; m end address is: 32 (R8)
J	L_end_dds_tick
NOP	
L_dds_tick1:
;Stepper.c,94 :: 		Step_Cycle(m);
; m start address is: 32 (R8)
SEH	R25, R8
JAL	Stepper_Step_Cycle+0
NOP	
;Stepper.c,95 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; m end address is: 32 (R8)
; i end address is: 20 (R5)
L_dds_tick2:
; i start address is: 20 (R5)
; m start address is: 32 (R8)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__dds_tick78
NOP	
J	L_dds_tick3
NOP	
L__dds_tick78:
;Stepper.c,96 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
SEH	R3, R5
SEH	R2, R8
BNE	R3, R2, L__dds_tick80
NOP	
J	L__dds_tick68
NOP	
L__dds_tick80:
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(Stepper_eng_axes+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__dds_tick82
NOP	
J	L__dds_tick67
NOP	
L__dds_tick82:
L__dds_tick66:
;Stepper.c,98 :: 		gap = (unsigned long)STPS[m].dist - (unsigned long)STPS[i].dist;
SEH	R3, R8
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R4, 0(R2)
SEH	R3, R5
ORI	R2, R0, 96
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
;Stepper.c,99 :: 		if(eng_err[i] >= gap){
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SLTU	R2, R2, R4
BEQ	R2, R0, L__dds_tick83
NOP	
J	L_dds_tick8
NOP	
L__dds_tick83:
;Stepper.c,100 :: 		eng_err[i] -= gap;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
SUBU	R2, R2, R6
; gap end address is: 24 (R6)
SW	R2, 0(R3)
;Stepper.c,101 :: 		Step_Cycle(i);
SEH	R25, R5
JAL	Stepper_Step_Cycle+0
NOP	
;Stepper.c,102 :: 		}else{
J	L_dds_tick9
NOP	
L_dds_tick8:
;Stepper.c,103 :: 		eng_err[i] += (unsigned long)STPS[i].dist;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 96
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
;Stepper.c,104 :: 		}
L_dds_tick9:
;Stepper.c,96 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
L__dds_tick68:
L__dds_tick67:
;Stepper.c,95 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,106 :: 		}
; i end address is: 20 (R5)
J	L_dds_tick2
NOP	
L_dds_tick3:
;Stepper.c,109 :: 		Pulse(m);
SEH	R25, R8
JAL	_Pulse+0
NOP	
;Stepper.c,110 :: 		if(STPS[m].run_state == STOP){
SEH	R3, R8
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__dds_tick84
NOP	
J	L_dds_tick10
NOP	
L__dds_tick84:
;Stepper.c,111 :: 		for(i=0;i<NoOfAxis;i++){
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
BNE	R2, R0, L__dds_tick85
NOP	
J	L_dds_tick12
NOP	
L__dds_tick85:
; m end address is: 16 (R4)
;Stepper.c,112 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
; m start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
BNE	R3, R2, L__dds_tick87
NOP	
J	L__dds_tick70
NOP	
L__dds_tick87:
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(Stepper_eng_axes+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__dds_tick89
NOP	
J	L__dds_tick69
NOP	
L__dds_tick89:
L__dds_tick65:
;Stepper.c,113 :: 		STPS[i].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,114 :: 		bit_false(SV.mode_complete,bit(i));
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,112 :: 		if(i != m && bit_istrue(eng_axes,bit(i))){
L__dds_tick70:
L__dds_tick69:
;Stepper.c,111 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,116 :: 		}
; m end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_dds_tick11
NOP	
L_dds_tick12:
;Stepper.c,117 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,118 :: 		return;
J	L_end_dds_tick
NOP	
;Stepper.c,119 :: 		}
L_dds_tick10:
;Stepper.c,120 :: 		dds_master.increment = Dds_Increment(STPS[m].step_delay);
; m start address is: 32 (R8)
SEH	R3, R8
; m end address is: 32 (R8)
ORI	R2, R0, 96
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
;Stepper.c,121 :: 		}
L_end_dds_tick:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _dds_tick
Stepper_Dds_Increment:
;Stepper.c,125 :: 		static unsigned long Dds_Increment(long step_delay){
;Stepper.c,127 :: 		if(step_delay < DDS_MIN_DELAY) step_delay = DDS_MIN_DELAY;
SLTI	R2, R25, 125
BNE	R2, R0, L_Stepper_Dds_Increment91
NOP	
J	L_Stepper_Dds_Increment17
NOP	
L_Stepper_Dds_Increment91:
ORI	R25, R0, 125
L_Stepper_Dds_Increment17:
;Stepper.c,128 :: 		q = 0xFFFFFFFF / (unsigned long)step_delay;
LUI	R2, 65535
ORI	R2, R2, 65535
DIVU	R2, R25
MFLO	R2
;Stepper.c,129 :: 		return (q >> 1) * DDS_T1_RATIO_X2;
SRL	R3, R2, 1
ORI	R2, R0, 125
MULTU	R3, R2
MFLO	R2
;Stepper.c,130 :: 		}
L_end_Dds_Increment:
JR	RA
NOP	
; end of Stepper_Dds_Increment
_Start_Interpolation:
;Stepper.c,134 :: 		void Start_Interpolation(int m,int axes){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,136 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,137 :: 		if(STPS[m].dist <= 0 || STPS[m].run_state == STOP){
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Start_Interpolation93
NOP	
J	L__Start_Interpolation73
NOP	
L__Start_Interpolation93:
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L__Start_Interpolation95
NOP	
J	L__Start_Interpolation72
NOP	
L__Start_Interpolation95:
J	L_Start_Interpolation20
NOP	
L__Start_Interpolation73:
L__Start_Interpolation72:
;Stepper.c,138 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Start_Interpolation21:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Start_Interpolation96
NOP	
J	L_Start_Interpolation22
NOP	
L__Start_Interpolation96:
;Stepper.c,139 :: 		if(bit_istrue(axes,bit(i))){
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R26, R2
SEH	R2, R2
BNE	R2, R0, L__Start_Interpolation98
NOP	
J	L_Start_Interpolation24
NOP	
L__Start_Interpolation98:
;Stepper.c,140 :: 		STPS[i].run_state = STOP;
SEH	R3, R4
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,141 :: 		bit_false(SV.mode_complete,bit(i));
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,142 :: 		}
L_Start_Interpolation24:
;Stepper.c,138 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,143 :: 		}
; i end address is: 16 (R4)
J	L_Start_Interpolation21
NOP	
L_Start_Interpolation22:
;Stepper.c,144 :: 		return;
J	L_end_Start_Interpolation
NOP	
;Stepper.c,145 :: 		}
L_Start_Interpolation20:
;Stepper.c,146 :: 		eng_axes = axes;
SH	R26, Offset(Stepper_eng_axes+0)(GP)
;Stepper.c,147 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Start_Interpolation25:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Start_Interpolation99
NOP	
J	L_Start_Interpolation26
NOP	
L__Start_Interpolation99:
;Stepper.c,148 :: 		eng_err[i] = (unsigned long)STPS[m].dist >> 1;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(Stepper_eng_err+0)
ORI	R2, R2, lo_addr(Stepper_eng_err+0)
ADDU	R4, R2, R3
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SRL	R2, R2, 1
SW	R2, 0(R4)
;Stepper.c,147 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,148 :: 		eng_err[i] = (unsigned long)STPS[m].dist >> 1;
; i end address is: 20 (R5)
J	L_Start_Interpolation25
NOP	
L_Start_Interpolation26:
;Stepper.c,149 :: 		dds_master.phase     = 0;
SW	R0, Offset(Stepper_dds_master+0)(GP)
;Stepper.c,150 :: 		dds_master.increment = Dds_Increment(STPS[m].step_delay);
SEH	R3, R25
ORI	R2, R0, 96
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
;Stepper.c,151 :: 		eng_master = m;
SH	R25, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,152 :: 		}
L_end_Start_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Start_Interpolation
_Stepper_Abort:
;Stepper.c,160 :: 		void Stepper_Abort(){
;Stepper.c,162 :: 		eng_master = -1;
ORI	R2, R0, 65535
SH	R2, Offset(Stepper_eng_master+0)(GP)
;Stepper.c,163 :: 		eng_axes = 0;
SH	R0, Offset(Stepper_eng_axes+0)(GP)
;Stepper.c,164 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Stepper_Abort28:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Stepper_Abort101
NOP	
J	L_Stepper_Abort29
NOP	
L__Stepper_Abort101:
;Stepper.c,165 :: 		STPS[i].run_state = STOP;
SEH	R3, R4
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,164 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,165 :: 		STPS[i].run_state = STOP;
; i end address is: 16 (R4)
J	L_Stepper_Abort28
NOP	
L_Stepper_Abort29:
;Stepper.c,166 :: 		}
L_end_Stepper_Abort:
JR	RA
NOP	
; end of _Stepper_Abort
_Stepper_Busy:
;Stepper.c,172 :: 		int Stepper_Busy(){
;Stepper.c,173 :: 		return eng_master >= 0;
LH	R2, Offset(Stepper_eng_master+0)(GP)
SLTI	R2, R2, 0
XORI	R2, R2, 1
;Stepper.c,174 :: 		}
L_end_Stepper_Busy:
JR	RA
NOP	
; end of _Stepper_Busy
_Stepper_ApplyInvertMasks:
;Stepper.c,185 :: 		void Stepper_ApplyInvertMasks(){
;Stepper.c,187 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Stepper_ApplyInvertMasks31:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Stepper_ApplyInvertMasks105
NOP	
J	L_Stepper_ApplyInvertMasks32
NOP	
L__Stepper_ApplyInvertMasks105:
;Stepper.c,188 :: 		step_idle[i] = bit_istrue(settings.invert_mask,bit(i)) ? 1 : 0;
SEH	R3, R5
LUI	R2, hi_addr(Stepper_step_idle+0)
ORI	R2, R2, lo_addr(Stepper_step_idle+0)
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LHU	R2, Offset(_settings+66)(GP)
AND	R2, R2, R3
ANDI	R2, R2, 65535
BNE	R2, R0, L__Stepper_ApplyInvertMasks107
NOP	
J	L_Stepper_ApplyInvertMasks34
NOP	
L__Stepper_ApplyInvertMasks107:
; ?FLOC___Stepper_ApplyInvertMasks?T164 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Stepper_ApplyInvertMasks?T164 end address is: 8 (R2)
J	L_Stepper_ApplyInvertMasks35
NOP	
L_Stepper_ApplyInvertMasks34:
; ?FLOC___Stepper_ApplyInvertMasks?T164 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Stepper_ApplyInvertMasks?T164 end address is: 8 (R2)
L_Stepper_ApplyInvertMasks35:
; ?FLOC___Stepper_ApplyInvertMasks?T164 start address is: 8 (R2)
SB	R2, 0(R4)
; ?FLOC___Stepper_ApplyInvertMasks?T164 end address is: 8 (R2)
;Stepper.c,187 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Stepper.c,188 :: 		step_idle[i] = bit_istrue(settings.invert_mask,bit(i)) ? 1 : 0;
; i end address is: 20 (R5)
J	L_Stepper_ApplyInvertMasks31
NOP	
L_Stepper_ApplyInvertMasks32:
;Stepper.c,189 :: 		}
L_end_Stepper_ApplyInvertMasks:
JR	RA
NOP	
; end of _Stepper_ApplyInvertMasks
_EnableSteppers:
;Stepper.c,196 :: 		void EnableSteppers(){
;Stepper.c,197 :: 		EN_Steppers = bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE) ? 1 : 0;
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 4
ANDI	R2, R2, 65535
BNE	R2, R0, L__EnableSteppers110
NOP	
J	L_EnableSteppers36
NOP	
L__EnableSteppers110:
; ?FLOC___EnableSteppers?T167 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___EnableSteppers?T167 end address is: 12 (R3)
J	L_EnableSteppers37
NOP	
L_EnableSteppers36:
; ?FLOC___EnableSteppers?T167 start address is: 12 (R3)
MOVZ	R3, R0, R0
; ?FLOC___EnableSteppers?T167 end address is: 12 (R3)
L_EnableSteppers37:
; ?FLOC___EnableSteppers?T167 start address is: 12 (R3)
_LX	
INS	R2, R3, BitPos(EN_Steppers+0), 1
; ?FLOC___EnableSteppers?T167 end address is: 12 (R3)
_SX	
;Stepper.c,198 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_DisableSteppers:
;Stepper.c,204 :: 		void DisableSteppers(){
;Stepper.c,205 :: 		EN_Steppers = bit_istrue(settings.flags,BITFLAG_INVERT_ST_ENABLE) ? 0 : 1;
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 4
ANDI	R2, R2, 65535
BNE	R2, R0, L__DisableSteppers113
NOP	
J	L_DisableSteppers38
NOP	
L__DisableSteppers113:
; ?FLOC___DisableSteppers?T170 start address is: 12 (R3)
MOVZ	R3, R0, R0
; ?FLOC___DisableSteppers?T170 end address is: 12 (R3)
J	L_DisableSteppers39
NOP	
L_DisableSteppers38:
; ?FLOC___DisableSteppers?T170 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DisableSteppers?T170 end address is: 12 (R3)
L_DisableSteppers39:
; ?FLOC___DisableSteppers?T170 start address is: 12 (R3)
_LX	
INS	R2, R3, BitPos(EN_Steppers+0), 1
; ?FLOC___DisableSteppers?T170 end address is: 12 (R3)
_SX	
;Stepper.c,206 :: 		}
L_end_DisableSteppers:
JR	RA
NOP	
; end of _DisableSteppers
_GET_RunState:
;Stepper.c,213 :: 		int GET_RunState(int axis_No){
;Stepper.c,214 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,215 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_StopAxis:
;Stepper.c,223 :: 		void StopAxis(int axis){
;Stepper.c,224 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 1
SB	R2, 0(R3)
;Stepper.c,225 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableSpindleOCx:
;Stepper.c,232 :: 		void disableSpindleOCx(){
;Stepper.c,233 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
ORI	R2, R0, 8
SW	R2, Offset(-1082064684)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(-1081848828)(GP)
;Stepper.c,234 :: 		}
L_end_disableSpindleOCx:
JR	RA
NOP	
; end of _disableSpindleOCx
Stepper_Step_Cycle:
;Stepper.c,248 :: 		static void Step_Cycle(int axis_No){
;Stepper.c,249 :: 		switch(axis_No){
J	L_Stepper_Step_Cycle40
NOP	
;Stepper.c,250 :: 		case X: PLS_StepX = !step_idle[X]; break;
L_Stepper_Step_Cycle42:
LBU	R2, Offset(Stepper_step_idle+0)(GP)
SLTIU	R3, R2, 1
_LX	
INS	R2, R3, BitPos(PLS_StepX+0), 1
_SX	
J	L_Stepper_Step_Cycle41
NOP	
;Stepper.c,251 :: 		case Y: PLS_StepY = !step_idle[Y]; break;
L_Stepper_Step_Cycle43:
LBU	R2, Offset(Stepper_step_idle+1)(GP)
SLTIU	R3, R2, 1
_LX	
INS	R2, R3, BitPos(PLS_StepY+0), 1
_SX	
J	L_Stepper_Step_Cycle41
NOP	
;Stepper.c,252 :: 		case Z: PLS_StepZ = !step_idle[Z]; break;
L_Stepper_Step_Cycle44:
LBU	R2, Offset(Stepper_step_idle+2)(GP)
SLTIU	R3, R2, 1
_LX	
INS	R2, R3, BitPos(PLS_StepZ+0), 1
_SX	
J	L_Stepper_Step_Cycle41
NOP	
;Stepper.c,253 :: 		case A: PLS_StepA = !step_idle[A]; break;
L_Stepper_Step_Cycle45:
LBU	R2, Offset(Stepper_step_idle+3)(GP)
SLTIU	R3, R2, 1
_LX	
INS	R2, R3, BitPos(PLS_StepA+0), 1
_SX	
J	L_Stepper_Step_Cycle41
NOP	
;Stepper.c,254 :: 		default: break;
L_Stepper_Step_Cycle46:
J	L_Stepper_Step_Cycle41
NOP	
;Stepper.c,255 :: 		}
L_Stepper_Step_Cycle40:
SEH	R2, R25
BNE	R2, R0, L_Stepper_Step_Cycle123
NOP	
J	L_Stepper_Step_Cycle42
NOP	
L_Stepper_Step_Cycle123:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Step_Cycle125
NOP	
J	L_Stepper_Step_Cycle43
NOP	
L_Stepper_Step_Cycle125:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Step_Cycle127
NOP	
J	L_Stepper_Step_Cycle44
NOP	
L_Stepper_Step_Cycle127:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Step_Cycle129
NOP	
J	L_Stepper_Step_Cycle45
NOP	
L_Stepper_Step_Cycle129:
J	L_Stepper_Step_Cycle46
NOP	
L_Stepper_Step_Cycle41:
;Stepper.c,257 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 36
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,259 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 88
ADDIU	R2, R2, 2
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,260 :: 		}
L_end_Step_Cycle:
JR	RA
NOP	
; end of Stepper_Step_Cycle
_Pulse:
;Stepper.c,269 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,270 :: 		long remaining = STPS[axis_No].dist - STPS[axis_No].step_count;
SEH	R3, R25
ORI	R2, R0, 96
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
;Stepper.c,272 :: 		if(STPS[axis_No].run_state != STOP && remaining <= 0)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L__Pulse132
NOP	
J	L__Pulse64
NOP	
L__Pulse132:
SLTI	R2, R7, 1
BNE	R2, R0, L__Pulse133
NOP	
J	L__Pulse63
NOP	
L__Pulse133:
L__Pulse62:
;Stepper.c,273 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,272 :: 		if(STPS[axis_No].run_state != STOP && remaining <= 0)
L__Pulse64:
L__Pulse63:
;Stepper.c,275 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 4(SP)
J	L_Pulse50
NOP	
; remaining end address is: 28 (R7)
;Stepper.c,276 :: 		case STOP:
L_Pulse52:
;Stepper.c,277 :: 		StopAxis(axis_No);
JAL	_StopAxis+0
NOP	
;Stepper.c,279 :: 		bit_false(SV.mode_complete,bit(axis_No));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,280 :: 		break;
J	L_Pulse51
NOP	
;Stepper.c,281 :: 		case ACCEL:
L_Pulse53:
;Stepper.c,283 :: 		AccDec(axis_No);
; remaining start address is: 28 (R7)
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,284 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 96
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
BEQ	R2, R0, L__Pulse134
NOP	
J	L_Pulse54
NOP	
L__Pulse134:
;Stepper.c,285 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,286 :: 		}
L_Pulse54:
;Stepper.c,287 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 36
LW	R3, 0(R2)
ADDIU	R2, R4, 72
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse135
NOP	
J	L_Pulse55
NOP	
L__Pulse135:
;Stepper.c,288 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,289 :: 		}
L_Pulse55:
;Stepper.c,292 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 96
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
BEQ	R2, R0, L__Pulse136
NOP	
J	L_Pulse56
NOP	
L__Pulse136:
;Stepper.c,293 :: 		STPS[axis_No].accel_count = -remaining;
SEH	R3, R25
ORI	R2, R0, 96
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
;Stepper.c,294 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R0, 0(R2)
;Stepper.c,295 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,296 :: 		}
L_Pulse56:
;Stepper.c,297 :: 		break;
J	L_Pulse51
NOP	
;Stepper.c,298 :: 		case RUN:
L_Pulse57:
;Stepper.c,299 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
; remaining start address is: 28 (R7)
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,302 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 96
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
BEQ	R2, R0, L__Pulse137
NOP	
J	L_Pulse58
NOP	
L__Pulse137:
;Stepper.c,303 :: 		STPS[axis_No].accel_count = -remaining;
SEH	R3, R25
ORI	R2, R0, 96
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
;Stepper.c,304 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 76
SW	R0, 0(R2)
;Stepper.c,305 :: 		STPS[axis_No].run_state =  DECEL;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,306 :: 		}
L_Pulse58:
;Stepper.c,307 :: 		break;
J	L_Pulse51
NOP	
;Stepper.c,308 :: 		case DECEL:
L_Pulse59:
;Stepper.c,310 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,311 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].StartUp_delay)
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 80
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse138
NOP	
J	L_Pulse60
NOP	
L__Pulse138:
;Stepper.c,312 :: 		STPS[axis_No].step_delay = STPS[axis_No].StartUp_delay;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 80
LW	R2, 0(R2)
SW	R2, 0(R3)
L_Pulse60:
;Stepper.c,313 :: 		break;
J	L_Pulse51
NOP	
;Stepper.c,314 :: 		default:break;
L_Pulse61:
J	L_Pulse51
NOP	
;Stepper.c,315 :: 		}
L_Pulse50:
; remaining start address is: 28 (R7)
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L__Pulse140
NOP	
J	L_Pulse52
NOP	
L__Pulse140:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse142
NOP	
J	L_Pulse53
NOP	
L__Pulse142:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse144
NOP	
J	L_Pulse57
NOP	
L__Pulse144:
; remaining end address is: 28 (R7)
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse146
NOP	
J	L_Pulse59
NOP	
L__Pulse146:
J	L_Pulse61
NOP	
L_Pulse51:
;Stepper.c,316 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,317 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
Stepper_AccDec:
;Stepper.c,325 :: 		static void AccDec(int axis_No){
;Stepper.c,326 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,327 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 44
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 76
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
;Stepper.c,328 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 76
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
;Stepper.c,329 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 96
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,330 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
