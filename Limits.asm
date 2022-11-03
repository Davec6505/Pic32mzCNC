_Limit_Initialize:
;Limits.c,37 :: 		void Limit_Initialize(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,41 :: 		X_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(X_Min_Limit_Dir+0)
_SX	
;Limits.c,42 :: 		Y_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(Y_Min_Limit_Dir+0)
_SX	
;Limits.c,45 :: 		Limits.X_Limit_Min = 0;
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,46 :: 		Limits.Y_Limit_Min = 0;
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,49 :: 		last_cntX_min = 0;
SH	R0, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,50 :: 		last_cntY_min = 0;
SH	R0, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,51 :: 		last_cntZ_min = 0;
SH	R0, Offset(Limits_last_cntZ_min+0)(GP)
;Limits.c,52 :: 		last_cntA_min = 0;
SH	R0, Offset(Limits_last_cntA_min+0)(GP)
;Limits.c,55 :: 		IEC0  |= 0x21 << 8;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 8448
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,58 :: 		X_Min_Limit_Setup();
JAL	_X_Min_Limit_Setup+0
NOP	
;Limits.c,59 :: 		Y_Min_Limit_Setup();
JAL	_Y_Min_Limit_Setup+0
NOP	
;Limits.c,61 :: 		}
L_end_Limit_Initialize:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Limit_Initialize
_X_Min_Limit_Setup:
;Limits.c,65 :: 		void X_Min_Limit_Setup(){
;Limits.c,72 :: 		IPC2 |= 17 ;
LW	R2, Offset(IPC2+0)(GP)
ORI	R2, R2, 17
SW	R2, Offset(IPC2+0)(GP)
;Limits.c,75 :: 		IEC0 |= 1 << 8;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 256
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,77 :: 		IFS0 |= ~(1 << 8);
LW	R3, Offset(IFS0+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65279
OR	R2, R3, R2
SW	R2, Offset(IFS0+0)(GP)
;Limits.c,78 :: 		}
L_end_X_Min_Limit_Setup:
JR	RA
NOP	
; end of _X_Min_Limit_Setup
_Y_Min_Limit_Setup:
;Limits.c,82 :: 		void Y_Min_Limit_Setup(){
;Limits.c,89 :: 		IPC3 |= 18 << 8;
LW	R2, Offset(IPC3+0)(GP)
ORI	R2, R2, 4608
SW	R2, Offset(IPC3+0)(GP)
;Limits.c,92 :: 		IEC0 |= 1 << 13;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 8192
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,94 :: 		IFS0 |= ~(1 << 13);
LW	R3, Offset(IFS0+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 57343
OR	R2, R3, R2
SW	R2, Offset(IFS0+0)(GP)
;Limits.c,95 :: 		}
L_end_Y_Min_Limit_Setup:
JR	RA
NOP	
; end of _Y_Min_Limit_Setup
_X_Min_Limit:
;Limits.c,102 :: 		void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
;Limits.c,103 :: 		INT1IF_bit = 0;
LUI	R2, BitMask(INT1IF_bit+0)
ORI	R2, R2, BitMask(INT1IF_bit+0)
_SX	
;Limits.c,104 :: 		if(!Limit[X].Limit_Min)
LBU	R2, Offset(Limits_Limit+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__X_Min_Limit44
NOP	
J	L_X_Min_Limit0
NOP	
L__X_Min_Limit44:
;Limits.c,105 :: 		Limit[X].Limit_Min = 1;
LBU	R2, Offset(Limits_Limit+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+0)(GP)
L_X_Min_Limit0:
;Limits.c,107 :: 		if(!Limits.X_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__X_Min_Limit45
NOP	
J	L_X_Min_Limit1
NOP	
L__X_Min_Limit45:
;Limits.c,108 :: 		Limits.X_Limit_Min = 1;
LBU	R2, Offset(_Limits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_Limits+0)(GP)
L_X_Min_Limit1:
;Limits.c,109 :: 		}
L_end_X_Min_Limit:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _X_Min_Limit
_Y_Min_Limit:
;Limits.c,113 :: 		void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
;Limits.c,114 :: 		INT2IF_bit = 0;
LUI	R2, BitMask(INT2IF_bit+0)
ORI	R2, R2, BitMask(INT2IF_bit+0)
_SX	
;Limits.c,115 :: 		if(!Limit[Y].Limit_Min)
LBU	R2, Offset(Limits_Limit+12)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Y_Min_Limit47
NOP	
J	L_Y_Min_Limit2
NOP	
L__Y_Min_Limit47:
;Limits.c,116 :: 		Limit[Y].Limit_Min = 1;
LBU	R2, Offset(Limits_Limit+12)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+12)(GP)
L_Y_Min_Limit2:
;Limits.c,118 :: 		if(!Limits.Y_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Y_Min_Limit48
NOP	
J	L_Y_Min_Limit3
NOP	
L__Y_Min_Limit48:
;Limits.c,119 :: 		Limits.Y_Limit_Min = 1;
LBU	R2, Offset(_Limits+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_Limits+0)(GP)
L_Y_Min_Limit3:
;Limits.c,120 :: 		}
L_end_Y_Min_Limit:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _Y_Min_Limit
_Test_Min:
;Limits.c,131 :: 		char Test_Min(int axis){
;Limits.c,132 :: 		return (Limit[axis].Limit_Min & 0x0001)? 1:0;
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
BNE	R2, R0, L__Test_Min51
NOP	
J	L_Test_Min4
NOP	
L__Test_Min51:
; ?FLOC___Test_Min?T44 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_Min?T44 end address is: 8 (R2)
J	L_Test_Min5
NOP	
L_Test_Min4:
; ?FLOC___Test_Min?T44 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_Min?T44 end address is: 8 (R2)
L_Test_Min5:
; ?FLOC___Test_Min?T44 start address is: 8 (R2)
; ?FLOC___Test_Min?T44 end address is: 8 (R2)
;Limits.c,133 :: 		}
L_end_Test_Min:
JR	RA
NOP	
; end of _Test_Min
_Reset_Min_Limit:
;Limits.c,139 :: 		void Reset_Min_Limit(int axis){
;Limits.c,140 :: 		Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
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
;Limits.c,141 :: 		}
L_end_Reset_Min_Limit:
JR	RA
NOP	
; end of _Reset_Min_Limit
_Reset_Min_Debounce:
;Limits.c,147 :: 		void Reset_Min_Debounce(int axis){
;Limits.c,148 :: 		Limit[axis].Min_DeBnc = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Limits.c,149 :: 		Limit[axis].last_cnt_min = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,150 :: 		}
L_end_Reset_Min_Debounce:
JR	RA
NOP	
; end of _Reset_Min_Debounce
_Debounce_Limits:
;Limits.c,155 :: 		void Debounce_Limits(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,156 :: 		Limit[axis].T0 = (TMR.clock >> BASE_TMR)&1;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
LBU	R2, Offset(_TMR+0)(GP)
ANDI	R2, R2, 1
ANDI	R3, R2, 255
LBU	R2, 0(R4)
INS	R2, R3, 3, 1
SB	R2, 0(R4)
;Limits.c,159 :: 		Limit[axis].Pin = Test_Port_Pins(axis);
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
;Limits.c,161 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_Limits55
NOP	
J	L__Debounce_Limits39
NOP	
L__Debounce_Limits55:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__Debounce_Limits57
NOP	
J	L__Debounce_Limits38
NOP	
L__Debounce_Limits57:
L__Debounce_Limits33:
;Limits.c,162 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Debounce_Limits58
NOP	
J	L__Debounce_Limits35
NOP	
L__Debounce_Limits58:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__Debounce_Limits59
NOP	
J	L__Debounce_Limits34
NOP	
L__Debounce_Limits59:
L__Debounce_Limits32:
;Limits.c,163 :: 		Limit[axis].T2 = 1;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 32
SB	R2, 0(R3)
;Limits.c,164 :: 		Limit[axis].Min_DeBnc++;
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
;Limits.c,168 :: 		if(Limit[axis].Min_DeBnc > Limit[axis].last_cnt_min){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 4
LHU	R3, 0(R2)
ADDIU	R2, R4, 6
LHU	R2, 0(R2)
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__Debounce_Limits60
NOP	
J	L_Debounce_Limits12
NOP	
L__Debounce_Limits60:
;Limits.c,169 :: 		Limit[axis].last_cnt_min = Limit[axis].Min_DeBnc;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, 0(R3)
;Limits.c,170 :: 		}
L_Debounce_Limits12:
;Limits.c,171 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
J	L_Debounce_Limits13
NOP	
;Limits.c,162 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
L__Debounce_Limits35:
L__Debounce_Limits34:
;Limits.c,171 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__Debounce_Limits62
NOP	
J	L__Debounce_Limits37
NOP	
L__Debounce_Limits62:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__Debounce_Limits64
NOP	
J	L__Debounce_Limits36
NOP	
L__Debounce_Limits64:
L__Debounce_Limits31:
;Limits.c,172 :: 		Limit[axis].T2 = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
INS	R2, R0, 5, 1
SB	R2, 0(R3)
;Limits.c,171 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
L__Debounce_Limits37:
L__Debounce_Limits36:
;Limits.c,172 :: 		Limit[axis].T2 = 0;
L_Debounce_Limits13:
;Limits.c,174 :: 		if(Limit[axis].Min_DeBnc > DEBOUNCE_COUNT)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 6
BEQ	R2, R0, L__Debounce_Limits65
NOP	
J	L_Debounce_Limits17
NOP	
L__Debounce_Limits65:
;Limits.c,175 :: 		Reset_Min_Limit(axis);
JAL	_Reset_Min_Limit+0
NOP	
L_Debounce_Limits17:
;Limits.c,177 :: 		}else if(Limit[axis].Pin){
J	L_Debounce_Limits18
NOP	
;Limits.c,161 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
L__Debounce_Limits39:
L__Debounce_Limits38:
;Limits.c,177 :: 		}else if(Limit[axis].Pin){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_Limits67
NOP	
J	L_Debounce_Limits19
NOP	
L__Debounce_Limits67:
;Limits.c,178 :: 		Reset_Min_Debounce(axis);
JAL	_Reset_Min_Debounce+0
NOP	
;Limits.c,179 :: 		}
L_Debounce_Limits19:
L_Debounce_Limits18:
;Limits.c,181 :: 		}
L_end_Debounce_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Debounce_Limits
_FP:
;Limits.c,189 :: 		char FP(int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Limits.c,190 :: 		char tmp = 0;
;Limits.c,191 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 20(SP)
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
LW	R2, 20(SP)
SB	R3, 0(R2)
;Limits.c,192 :: 		if(Limit[axis].new_val > Limit[axis].old_Pval){
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
BNE	R2, R0, L__FP69
NOP	
J	L_FP20
NOP	
L__FP69:
;Limits.c,194 :: 		dma_printf("\t\tFP():=%d\r\n",(int)Limit[axis].new_val);
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Limits.c,196 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,197 :: 		}else {
; tmp end address is: 16 (R4)
J	L_FP21
NOP	
L_FP20:
;Limits.c,198 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
;Limits.c,199 :: 		}
L_FP21:
;Limits.c,200 :: 		Limit[axis].old_Pval = Limit[axis].new_val;
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
;Limits.c,201 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,202 :: 		}
L_end_FP:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _FP
_FN:
;Limits.c,205 :: 		char FN(int axis){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Limits.c,206 :: 		char tmp = 0;
;Limits.c,207 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 20(SP)
JAL	_Test_Min+0
NOP	
ANDI	R3, R2, 1
LW	R2, 20(SP)
SB	R3, 0(R2)
;Limits.c,208 :: 		if(Limit[axis].new_val < Limit[axis].old_Fval){
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
BNE	R2, R0, L__FN71
NOP	
J	L_FN22
NOP	
L__FN71:
;Limits.c,210 :: 		dma_printf("\t\tFN():=%d\r\n",(int)Limit[axis].new_val);
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr2_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Limits.c,212 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,213 :: 		}else
; tmp end address is: 16 (R4)
J	L_FN23
NOP	
L_FN22:
;Limits.c,214 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
L_FN23:
;Limits.c,215 :: 		Limit[axis].old_Fval = Limit[axis].new_val;
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
;Limits.c,216 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,217 :: 		}
L_end_FN:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _FN
_Test_Port_Pins:
;Limits.c,223 :: 		char Test_Port_Pins(int axis){
;Limits.c,224 :: 		char tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Limits.c,225 :: 		switch(axis){
J	L_Test_Port_Pins24
NOP	
; tmp end address is: 16 (R4)
;Limits.c,226 :: 		case X:
L_Test_Port_Pins26:
;Limits.c,227 :: 		tmp = X_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,228 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins25
NOP	
;Limits.c,229 :: 		case Y:
L_Test_Port_Pins27:
;Limits.c,230 :: 		tmp = Y_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,231 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins25
NOP	
;Limits.c,232 :: 		case Z:
L_Test_Port_Pins28:
;Limits.c,234 :: 		break;
; tmp start address is: 16 (R4)
ANDI	R2, R4, 255
J	L_Test_Port_Pins25
NOP	
;Limits.c,235 :: 		case A:
L_Test_Port_Pins29:
;Limits.c,237 :: 		break;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins25
NOP	
;Limits.c,238 :: 		default: tmp = 255;
L_Test_Port_Pins30:
; tmp start address is: 8 (R2)
ORI	R2, R0, 255
;Limits.c,239 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins25
NOP	
;Limits.c,240 :: 		}
L_Test_Port_Pins24:
; tmp start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Test_Port_Pins74
NOP	
J	L_Test_Port_Pins26
NOP	
L__Test_Port_Pins74:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Test_Port_Pins76
NOP	
J	L_Test_Port_Pins27
NOP	
L__Test_Port_Pins76:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Test_Port_Pins78
NOP	
J	L_Test_Port_Pins28
NOP	
L__Test_Port_Pins78:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Test_Port_Pins80
NOP	
J	L_Test_Port_Pins29
NOP	
L__Test_Port_Pins80:
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins30
NOP	
L_Test_Port_Pins25:
;Limits.c,241 :: 		return tmp;
; tmp start address is: 8 (R2)
; tmp end address is: 8 (R2)
;Limits.c,242 :: 		}
L_end_Test_Port_Pins:
JR	RA
NOP	
; end of _Test_Port_Pins
