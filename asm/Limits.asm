_Limit_Initialize:
;Limits.c,15 :: 		void Limit_Initialize(){
;Limits.c,16 :: 		int i = 0;
;Limits.c,19 :: 		X_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(X_Min_Limit_Dir+0)
_SX	
;Limits.c,20 :: 		Y_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(Y_Min_Limit_Dir+0)
_SX	
;Limits.c,21 :: 		Z_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(Z_Min_Limit_Dir+0)
_SX	
;Limits.c,23 :: 		Limit[X].Limit_Min = 0;
LBU	R2, Offset(Limits_Limit+0)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(Limits_Limit+0)(GP)
;Limits.c,24 :: 		Limit[Y].Limit_Min = 0;
LBU	R2, Offset(Limits_Limit+12)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(Limits_Limit+12)(GP)
;Limits.c,25 :: 		Limit[Z].Limit_Min = 0;
LBU	R2, Offset(Limits_Limit+24)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(Limits_Limit+24)(GP)
;Limits.c,28 :: 		IEC0CLR  = 0x8021 << 8;
LUI	R2, 128
ORI	R2, R2, 8448
SW	R2, Offset(-1082064700)(GP)
;Limits.c,40 :: 		}
L_end_Limit_Initialize:
JR	RA
NOP	
; end of _Limit_Initialize
Limits_X_Min_Limit_Setup:
;Limits.c,44 :: 		static void X_Min_Limit_Setup(){
;Limits.c,51 :: 		IPC2CLR = 0x1F;
ORI	R2, R0, 31
SW	R2, Offset(-1082064540)(GP)
;Limits.c,52 :: 		IPC2SET = 0x11;
ORI	R2, R0, 17
SW	R2, Offset(-1082064536)(GP)
;Limits.c,53 :: 		IFS0CLR = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(-1082064828)(GP)
;Limits.c,54 :: 		IEC0SET = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(-1082064696)(GP)
;Limits.c,55 :: 		}
L_end_X_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_X_Min_Limit_Setup
Limits_Y_Min_Limit_Setup:
;Limits.c,59 :: 		static void Y_Min_Limit_Setup(){
;Limits.c,67 :: 		IPC3CLR = 0x1F << 8;
ORI	R2, R0, 7936
SW	R2, Offset(-1082064524)(GP)
;Limits.c,68 :: 		IPC3SET = 0x11 << 8;
ORI	R2, R0, 4352
SW	R2, Offset(-1082064520)(GP)
;Limits.c,69 :: 		IFS0CLR = 1 << 13;
ORI	R2, R0, 8192
SW	R2, Offset(-1082064828)(GP)
;Limits.c,70 :: 		IEC0SET = 1 << 13;
ORI	R2, R0, 8192
SW	R2, Offset(-1082064696)(GP)
;Limits.c,71 :: 		}
L_end_Y_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_Y_Min_Limit_Setup
Limits_Z_Min_Limit_Setup:
;Limits.c,75 :: 		static void Z_Min_Limit_Setup(){
;Limits.c,83 :: 		IPC5CLR = 0x1F << 24;
LUI	R2, 7936
SW	R2, Offset(-1082064492)(GP)
;Limits.c,84 :: 		IPC5SET = 0x11 << 24;
LUI	R2, 4352
SW	R2, Offset(-1082064488)(GP)
;Limits.c,85 :: 		IFS0CLR = 1 << 23;
LUI	R2, 128
SW	R2, Offset(-1082064828)(GP)
;Limits.c,86 :: 		IEC0SET = 1 << 23;
LUI	R2, 128
SW	R2, Offset(-1082064696)(GP)
;Limits.c,87 :: 		}
L_end_Z_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_Z_Min_Limit_Setup
_X_Min_Limit:
;Limits.c,94 :: 		void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,95 :: 		INT1IF_bit = 0;
ORI	R2, R0, 256
SW	R2, Offset(-1082064828)(GP)
;Limits.c,96 :: 		Set_Min_Limit(X);
MOVZ	R25, R0, R0
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,97 :: 		}
L_end_X_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _X_Min_Limit
_Y_Min_Limit:
;Limits.c,102 :: 		void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,103 :: 		INT2IF_bit = 0;
ORI	R2, R0, 8192
SW	R2, Offset(-1082064828)(GP)
;Limits.c,104 :: 		Set_Min_Limit(Y);
ORI	R25, R0, 1
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,105 :: 		}
L_end_Y_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Y_Min_Limit
_Z_Min_Limit:
;Limits.c,109 :: 		void Z_Min_Limit() iv IVT_EXTERNAL_4 ilevel 4 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,110 :: 		INT4IF_bit = 0;
LUI	R2, 128
SW	R2, Offset(-1082064828)(GP)
;Limits.c,111 :: 		Set_Min_Limit(Z);
ORI	R25, R0, 2
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,112 :: 		}
L_end_Z_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Z_Min_Limit
_Test_Min:
;Limits.c,121 :: 		char Test_Min(int axis){
;Limits.c,122 :: 		return (Limit[axis].Limit_Min & 0x01)? 1:0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
ANDI	R2, R2, 1
BNE	R2, R0, L__Test_Min43
NOP	
J	L_Test_Min0
NOP	
L__Test_Min43:
; ?FLOC___Test_Min?T23 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_Min?T23 end address is: 8 (R2)
J	L_Test_Min1
NOP	
L_Test_Min0:
; ?FLOC___Test_Min?T23 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_Min?T23 end address is: 8 (R2)
L_Test_Min1:
; ?FLOC___Test_Min?T23 start address is: 8 (R2)
; ?FLOC___Test_Min?T23 end address is: 8 (R2)
;Limits.c,123 :: 		}
L_end_Test_Min:
JR	RA
NOP	
; end of _Test_Min
_Reset_Min_Limit:
;Limits.c,129 :: 		void Reset_Min_Limit(int axis){
;Limits.c,130 :: 		Limit[axis].Limit_Min = false;//INV ^ Limit[axis].Limit_Min;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Limits.c,131 :: 		}
L_end_Reset_Min_Limit:
JR	RA
NOP	
; end of _Reset_Min_Limit
_XOR_Min_Limit:
;Limits.c,133 :: 		void XOR_Min_Limit(int axis){
;Limits.c,134 :: 		Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
LBU	R2, 0(R4)
EXT	R2, R2, 1, 1
XORI	R2, R2, 1
ANDI	R3, R2, 255
LBU	R2, 0(R4)
INS	R2, R3, 1, 1
SB	R2, 0(R4)
;Limits.c,135 :: 		}
L_end_XOR_Min_Limit:
JR	RA
NOP	
; end of _XOR_Min_Limit
_Invert_Min_Limit:
;Limits.c,137 :: 		void Invert_Min_Limit(int axis){
;Limits.c,138 :: 		Limit[axis].Limit_Min = (~Limit[axis].Limit_Min) & 0x01;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
LBU	R2, 0(R4)
EXT	R2, R2, 1, 1
XORI	R2, R2, 1
ANDI	R2, R2, 1
ANDI	R3, R2, 255
LBU	R2, 0(R4)
INS	R2, R3, 1, 1
SB	R2, 0(R4)
;Limits.c,139 :: 		}
L_end_Invert_Min_Limit:
JR	RA
NOP	
; end of _Invert_Min_Limit
_Set_Min_Limit:
;Limits.c,141 :: 		void Set_Min_Limit(int axis){
;Limits.c,143 :: 		if(!Limit[axis].Limit_Min)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Set_Min_Limit48
NOP	
J	L_Set_Min_Limit2
NOP	
L__Set_Min_Limit48:
;Limits.c,144 :: 		Limit[axis].Limit_Min = true;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
L_Set_Min_Limit2:
;Limits.c,145 :: 		}
L_end_Set_Min_Limit:
JR	RA
NOP	
; end of _Set_Min_Limit
Limits_Sample_Limit:
;Limits.c,156 :: 		static void Sample_Limit(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,157 :: 		Limit[axis].Pin = Test_Port_Pins(axis);
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
SW	R2, 4(SP)
JAL	_Test_Port_Pins+0
NOP	
ANDI	R4, R2, 255
LW	R3, 4(SP)
LBU	R2, 0(R3)
INS	R2, R4, 0, 1
SB	R2, 0(R3)
;Limits.c,158 :: 		if(!Limit[axis].Pin){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L_Limits_Sample_Limit50
NOP	
J	L_Limits_Sample_Limit3
NOP	
L_Limits_Sample_Limit50:
;Limits.c,159 :: 		Limit[axis].release_cnt = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,160 :: 		if(Limit[axis].Limit_Min) return;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BNE	R2, R0, L_Limits_Sample_Limit52
NOP	
J	L_Limits_Sample_Limit4
NOP	
L_Limits_Sample_Limit52:
J	L_end_Sample_Limit
NOP	
L_Limits_Sample_Limit4:
;Limits.c,161 :: 		if(++Limit[axis].trip_cnt < LIMIT_TRIP_COUNT) return;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
LHU	R2, 0(R3)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2
BNE	R2, R0, L_Limits_Sample_Limit53
NOP	
J	L_Limits_Sample_Limit5
NOP	
L_Limits_Sample_Limit53:
J	L_end_Sample_Limit
NOP	
L_Limits_Sample_Limit5:
;Limits.c,162 :: 		Limit[axis].Limit_Min = 1;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Limits.c,164 :: 		if(bit_istrue(settings.flags,BITFLAG_HARD_LIMIT_ENABLE) &&
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 8
;Limits.c,165 :: 		(sys.state == STATE_CYCLE || sys.state == STATE_JOG)){
ANDI	R2, R2, 65535
BNE	R2, R0, L_Limits_Sample_Limit55
NOP	
J	L_Limits_Sample_Limit31
NOP	
L_Limits_Sample_Limit55:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L_Limits_Sample_Limit57
NOP	
J	L_Limits_Sample_Limit30
NOP	
L_Limits_Sample_Limit57:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 8
BNE	R3, R2, L_Limits_Sample_Limit59
NOP	
J	L_Limits_Sample_Limit29
NOP	
L_Limits_Sample_Limit59:
J	L_Limits_Sample_Limit10
NOP	
L_Limits_Sample_Limit30:
L_Limits_Sample_Limit29:
L_Limits_Sample_Limit27:
;Limits.c,166 :: 		DisableSteppers();
JAL	_DisableSteppers+0
NOP	
;Limits.c,167 :: 		disableSpindleOCx();
JAL	_disableSpindleOCx+0
NOP	
;Limits.c,168 :: 		limit_event = 1;
ORI	R2, R0, 1
SB	R2, Offset(Limits_limit_event+0)(GP)
;Limits.c,169 :: 		}
L_Limits_Sample_Limit10:
;Limits.c,165 :: 		(sys.state == STATE_CYCLE || sys.state == STATE_JOG)){
L_Limits_Sample_Limit31:
;Limits.c,170 :: 		}else{
J	L_Limits_Sample_Limit11
NOP	
L_Limits_Sample_Limit3:
;Limits.c,171 :: 		Limit[axis].trip_cnt = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Limits.c,172 :: 		if(Limit[axis].Limit_Min && ++Limit[axis].release_cnt > DEBOUNCE_COUNT){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BNE	R2, R0, L_Limits_Sample_Limit61
NOP	
J	L_Limits_Sample_Limit33
NOP	
L_Limits_Sample_Limit61:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
LHU	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
LHU	R2, 0(R3)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 6
BEQ	R2, R0, L_Limits_Sample_Limit62
NOP	
J	L_Limits_Sample_Limit32
NOP	
L_Limits_Sample_Limit62:
L_Limits_Sample_Limit26:
;Limits.c,173 :: 		Limit[axis].Limit_Min = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Limits.c,174 :: 		Limit[axis].release_cnt = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,172 :: 		if(Limit[axis].Limit_Min && ++Limit[axis].release_cnt > DEBOUNCE_COUNT){
L_Limits_Sample_Limit33:
L_Limits_Sample_Limit32:
;Limits.c,176 :: 		}
L_Limits_Sample_Limit11:
;Limits.c,177 :: 		}
L_end_Sample_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Limits_Sample_Limit
_Limits_Sample:
;Limits.c,179 :: 		void Limits_Sample(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,180 :: 		Sample_Limit(X);
SW	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	Limits_Sample_Limit+0
NOP	
;Limits.c,181 :: 		Sample_Limit(Y);
ORI	R25, R0, 1
JAL	Limits_Sample_Limit+0
NOP	
;Limits.c,182 :: 		Sample_Limit(Z);
ORI	R25, R0, 2
JAL	Limits_Sample_Limit+0
NOP	
;Limits.c,183 :: 		}
L_end_Limits_Sample:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Limits_Sample
_Limits_TakeEvent:
;Limits.c,185 :: 		char Limits_TakeEvent(){
;Limits.c,187 :: 		T1IE_bit = 0;
ORI	R2, R0, 16
SW	R2, Offset(-1082064700)(GP)
;Limits.c,188 :: 		event = limit_event;
; event start address is: 12 (R3)
LBU	R3, Offset(Limits_limit_event+0)(GP)
;Limits.c,189 :: 		limit_event = 0;
SB	R0, Offset(Limits_limit_event+0)(GP)
;Limits.c,190 :: 		T1IE_bit = 1;
SW	R2, Offset(-1082064696)(GP)
;Limits.c,191 :: 		return event;
ANDI	R2, R3, 255
; event end address is: 12 (R3)
;Limits.c,192 :: 		}
L_end_Limits_TakeEvent:
JR	RA
NOP	
; end of _Limits_TakeEvent
_FP:
;Limits.c,200 :: 		char FP(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,201 :: 		char tmp = 0;
;Limits.c,202 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 4(SP)
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
LW	R2, 4(SP)
SB	R3, 0(R2)
;Limits.c,203 :: 		if(Limit[axis].new_val > Limit[axis].old_Pval){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 1
LBU	R3, 0(R2)
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R3, R3, 255
ANDI	R2, R2, 255
SLTU	R2, R2, R3
BNE	R2, R0, L__FP66
NOP	
J	L_FP15
NOP	
L__FP66:
;Limits.c,204 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,205 :: 		}else {
; tmp end address is: 16 (R4)
J	L_FP16
NOP	
L_FP15:
;Limits.c,206 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
;Limits.c,207 :: 		}
L_FP16:
;Limits.c,208 :: 		Limit[axis].old_Pval = Limit[axis].new_val;
; tmp start address is: 16 (R4)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ADDIU	R2, R2, 1
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Limits.c,209 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,210 :: 		}
L_end_FP:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FP
_Rst_FP:
;Limits.c,213 :: 		void Rst_FP(int axis){
;Limits.c,214 :: 		Limit[axis].old_Pval = false;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SB	R0, 0(R2)
;Limits.c,215 :: 		}
L_end_Rst_FP:
JR	RA
NOP	
; end of _Rst_FP
_FN:
;Limits.c,218 :: 		char FN(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,219 :: 		char tmp = 0;
;Limits.c,220 :: 		Limit[axis].new_val = Test_Min(axis) & 0x01;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 4(SP)
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
LW	R2, 4(SP)
SB	R3, 0(R2)
;Limits.c,221 :: 		if(Limit[axis].new_val < Limit[axis].old_Fval){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 1
LBU	R3, 0(R2)
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
ANDI	R3, R3, 255
ANDI	R2, R2, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__FN69
NOP	
J	L_FN17
NOP	
L__FN69:
;Limits.c,222 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,223 :: 		}else
; tmp end address is: 16 (R4)
J	L_FN18
NOP	
L_FN17:
;Limits.c,224 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
L_FN18:
;Limits.c,225 :: 		Limit[axis].old_Fval = Limit[axis].new_val;
; tmp start address is: 16 (R4)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 3
ADDIU	R2, R2, 1
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Limits.c,226 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,227 :: 		}
L_end_FN:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FN
_Rst_FN:
;Limits.c,230 :: 		void Rst_FN(int axis){
;Limits.c,231 :: 		Limit[axis].old_Fval = true;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 3
ORI	R2, R0, 1
SB	R2, 0(R3)
;Limits.c,232 :: 		}
L_end_Rst_FN:
JR	RA
NOP	
; end of _Rst_FN
_Test_Port_Pins:
;Limits.c,238 :: 		char Test_Port_Pins(int axis){
;Limits.c,239 :: 		char tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Limits.c,240 :: 		switch(axis){
J	L_Test_Port_Pins19
NOP	
; tmp end address is: 16 (R4)
;Limits.c,241 :: 		case X:
L_Test_Port_Pins21:
;Limits.c,242 :: 		tmp = X_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,243 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins20
NOP	
;Limits.c,244 :: 		case Y:
L_Test_Port_Pins22:
;Limits.c,245 :: 		tmp = Y_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,246 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins20
NOP	
;Limits.c,247 :: 		case Z:
L_Test_Port_Pins23:
;Limits.c,248 :: 		tmp = Z_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Z_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,249 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins20
NOP	
;Limits.c,250 :: 		case A:
L_Test_Port_Pins24:
;Limits.c,252 :: 		break;
; tmp start address is: 16 (R4)
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins20
NOP	
;Limits.c,253 :: 		default: tmp = 255;
L_Test_Port_Pins25:
; tmp start address is: 8 (R2)
ORI	R2, R0, 255
;Limits.c,254 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins20
NOP	
;Limits.c,255 :: 		}
L_Test_Port_Pins19:
; tmp start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Test_Port_Pins73
NOP	
J	L_Test_Port_Pins21
NOP	
L__Test_Port_Pins73:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Test_Port_Pins75
NOP	
J	L_Test_Port_Pins22
NOP	
L__Test_Port_Pins75:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Test_Port_Pins77
NOP	
J	L_Test_Port_Pins23
NOP	
L__Test_Port_Pins77:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Test_Port_Pins79
NOP	
J	L_Test_Port_Pins24
NOP	
L__Test_Port_Pins79:
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins25
NOP	
L_Test_Port_Pins20:
;Limits.c,256 :: 		return tmp;
; tmp start address is: 8 (R2)
; tmp end address is: 8 (R2)
;Limits.c,257 :: 		}
L_end_Test_Port_Pins:
JR	RA
NOP	
; end of _Test_Port_Pins
