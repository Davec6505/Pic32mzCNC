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
BEQ	R2, R0, L__X_Min_Limit85
NOP	
J	L_X_Min_Limit0
NOP	
L__X_Min_Limit85:
;Limits.c,105 :: 		Limit[X].Limit_Min = 1;
LBU	R2, Offset(Limits_Limit+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+0)(GP)
L_X_Min_Limit0:
;Limits.c,107 :: 		if(!Limits.X_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__X_Min_Limit86
NOP	
J	L_X_Min_Limit1
NOP	
L__X_Min_Limit86:
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
BEQ	R2, R0, L__Y_Min_Limit88
NOP	
J	L_Y_Min_Limit2
NOP	
L__Y_Min_Limit88:
;Limits.c,116 :: 		Limit[Y].Limit_Min = 1;
LBU	R2, Offset(Limits_Limit+12)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+12)(GP)
L_Y_Min_Limit2:
;Limits.c,118 :: 		if(!Limits.Y_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Y_Min_Limit89
NOP	
J	L_Y_Min_Limit3
NOP	
L__Y_Min_Limit89:
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
;Limits.c,132 :: 		return ((Limit[axis].Limit_Min & 0x0001))? 1:0;
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
BNE	R2, R0, L__Test_Min92
NOP	
J	L_Test_Min4
NOP	
L__Test_Min92:
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
_Test_X_Min:
;Limits.c,135 :: 		char Test_X_Min(){
;Limits.c,136 :: 		return (Limits.X_Limit_Min == 1)? 1:0;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_X_Min94
NOP	
J	L_Test_X_Min6
NOP	
L__Test_X_Min94:
; ?FLOC___Test_X_Min?T48 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_X_Min?T48 end address is: 8 (R2)
J	L_Test_X_Min7
NOP	
L_Test_X_Min6:
; ?FLOC___Test_X_Min?T48 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_X_Min?T48 end address is: 8 (R2)
L_Test_X_Min7:
; ?FLOC___Test_X_Min?T48 start address is: 8 (R2)
; ?FLOC___Test_X_Min?T48 end address is: 8 (R2)
;Limits.c,137 :: 		}
L_end_Test_X_Min:
JR	RA
NOP	
; end of _Test_X_Min
_Test_Y_Min:
;Limits.c,141 :: 		char Test_Y_Min(){
;Limits.c,142 :: 		return (Limits.Y_Limit_Min == 1)? 1:0;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Y_Min96
NOP	
J	L_Test_Y_Min8
NOP	
L__Test_Y_Min96:
; ?FLOC___Test_Y_Min?T52 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_Y_Min?T52 end address is: 8 (R2)
J	L_Test_Y_Min9
NOP	
L_Test_Y_Min8:
; ?FLOC___Test_Y_Min?T52 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_Y_Min?T52 end address is: 8 (R2)
L_Test_Y_Min9:
; ?FLOC___Test_Y_Min?T52 start address is: 8 (R2)
; ?FLOC___Test_Y_Min?T52 end address is: 8 (R2)
;Limits.c,143 :: 		}
L_end_Test_Y_Min:
JR	RA
NOP	
; end of _Test_Y_Min
_Reset_Min_Limit:
;Limits.c,150 :: 		void Reset_Min_Limit(int axis){
;Limits.c,151 :: 		Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
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
;Limits.c,152 :: 		}
L_end_Reset_Min_Limit:
JR	RA
NOP	
; end of _Reset_Min_Limit
_Reset_X_Min_Limit:
;Limits.c,155 :: 		void Reset_X_Min_Limit(){
;Limits.c,156 :: 		Limits.X_Limit_Min = INV ^ Limits.X_Limit_Min;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
XORI	R3, R2, 1
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,157 :: 		}
L_end_Reset_X_Min_Limit:
JR	RA
NOP	
; end of _Reset_X_Min_Limit
_Reset_Y_Min_Limit:
;Limits.c,161 :: 		void Reset_Y_Min_Limit(){
;Limits.c,162 :: 		Limits.Y_Limit_Min = INV ^ Limits.Y_Limit_Min;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
XORI	R3, R2, 1
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R3, 1, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,163 :: 		}
L_end_Reset_Y_Min_Limit:
JR	RA
NOP	
; end of _Reset_Y_Min_Limit
_Reset_Min_Debounce:
;Limits.c,170 :: 		void Reset_Min_Debounce(int axis){
;Limits.c,171 :: 		Limit[axis].Min_DeBnc = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Limits.c,172 :: 		Limit[axis].last_cnt_min = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,173 :: 		}
L_end_Reset_Min_Debounce:
JR	RA
NOP	
; end of _Reset_Min_Debounce
_Reset_X_Min_Debounce:
;Limits.c,176 :: 		void Reset_X_Min_Debounce(){
;Limits.c,177 :: 		Limits.X_Min_DeBnc = 0;
SH	R0, Offset(_Limits+36)(GP)
;Limits.c,178 :: 		last_cntX_min = 0;
SH	R0, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,179 :: 		}
L_end_Reset_X_Min_Debounce:
JR	RA
NOP	
; end of _Reset_X_Min_Debounce
_Reset_Y_Min_Debounce:
;Limits.c,183 :: 		void Reset_Y_Min_Debounce(){
;Limits.c,184 :: 		Limits.Y_Min_DeBnc = 0;
SH	R0, Offset(_Limits+38)(GP)
;Limits.c,185 :: 		last_cntY_min = 0;
SH	R0, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,186 :: 		}
L_end_Reset_Y_Min_Debounce:
JR	RA
NOP	
; end of _Reset_Y_Min_Debounce
_Debounce_Limits:
;Limits.c,191 :: 		void Debounce_Limits(int axis){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Limits.c,192 :: 		Limit[axis].T0 = (TMR.clock >> BASE_TMR)&1;
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
;Limits.c,193 :: 		Limit[axis].T1 = Test_Min(axis)&0x0001;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
SW	R2, 24(SP)
JAL	_Test_Min+0
NOP	
ANDI	R2, R2, 1
ANDI	R4, R2, 255
LW	R3, 24(SP)
LBU	R2, 0(R3)
INS	R2, R4, 4, 1
SB	R2, 0(R3)
;Limits.c,197 :: 		if((!Limit[axis].Pin)&&(Limit[axis].T1)){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_Limits104
NOP	
J	L__Debounce_Limits62
NOP	
L__Debounce_Limits104:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__Debounce_Limits106
NOP	
J	L__Debounce_Limits61
NOP	
L__Debounce_Limits106:
L__Debounce_Limits56:
;Limits.c,198 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Debounce_Limits107
NOP	
J	L__Debounce_Limits58
NOP	
L__Debounce_Limits107:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__Debounce_Limits108
NOP	
J	L__Debounce_Limits57
NOP	
L__Debounce_Limits108:
L__Debounce_Limits55:
;Limits.c,199 :: 		Limit[axis].T2 = 1;
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
;Limits.c,200 :: 		Limit[axis].Min_DeBnc++;
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
;Limits.c,202 :: 		dma_printf("Limit[%d]:=%d\r\n",axis,Limit[axis].Min_DeBnc);
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LHU	R3, 0(R2)
ADDIU	R23, SP, 6
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R3, 8(SP)
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Limits.c,204 :: 		if(Limit[axis].Min_DeBnc > Limit[axis].last_cnt_min){
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
BNE	R2, R0, L__Debounce_Limits109
NOP	
J	L_Debounce_Limits16
NOP	
L__Debounce_Limits109:
;Limits.c,205 :: 		Limit[axis].last_cnt_min = Limit[axis].Min_DeBnc;
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
;Limits.c,206 :: 		}
L_Debounce_Limits16:
;Limits.c,207 :: 		}else if(!Limit[axis].T0 && Limit[axis].T2)
J	L_Debounce_Limits17
NOP	
;Limits.c,198 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
L__Debounce_Limits58:
L__Debounce_Limits57:
;Limits.c,207 :: 		}else if(!Limit[axis].T0 && Limit[axis].T2)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Debounce_Limits110
NOP	
J	L__Debounce_Limits60
NOP	
L__Debounce_Limits110:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__Debounce_Limits112
NOP	
J	L__Debounce_Limits59
NOP	
L__Debounce_Limits112:
L__Debounce_Limits54:
;Limits.c,208 :: 		Limit[axis].T2 = 0;
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
;Limits.c,207 :: 		}else if(!Limit[axis].T0 && Limit[axis].T2)
L__Debounce_Limits60:
L__Debounce_Limits59:
;Limits.c,208 :: 		Limit[axis].T2 = 0;
L_Debounce_Limits17:
;Limits.c,210 :: 		if(Limit[axis].Min_DeBnc > DEBOUNCE_COUNT)
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
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Debounce_Limits113
NOP	
J	L_Debounce_Limits21
NOP	
L__Debounce_Limits113:
;Limits.c,211 :: 		Reset_Min_Limit(axis);
JAL	_Reset_Min_Limit+0
NOP	
L_Debounce_Limits21:
;Limits.c,213 :: 		}else if(Limit[axis].Pin){
J	L_Debounce_Limits22
NOP	
;Limits.c,197 :: 		if((!Limit[axis].Pin)&&(Limit[axis].T1)){
L__Debounce_Limits62:
L__Debounce_Limits61:
;Limits.c,213 :: 		}else if(Limit[axis].Pin){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_Limits115
NOP	
J	L_Debounce_Limits23
NOP	
L__Debounce_Limits115:
;Limits.c,214 :: 		Reset_Min_Debounce(axis);
JAL	_Reset_Min_Debounce+0
NOP	
;Limits.c,215 :: 		}
L_Debounce_Limits23:
L_Debounce_Limits22:
;Limits.c,217 :: 		}
L_end_Debounce_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Debounce_Limits
_Debounce_X_Limits:
;Limits.c,220 :: 		void Debounce_X_Limits(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Limits.c,221 :: 		TX0 = (TMR.clock >> BASE_TMR)&1;
LBU	R2, Offset(_TMR+0)(GP)
ANDI	R3, R2, 1
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,222 :: 		TX1 = Test_X_Min();
JAL	_Test_X_Min+0
NOP	
LBU	R3, Offset(Limits_bits+0)(GP)
INS	R3, R2, 1, 1
SB	R3, Offset(Limits_bits+0)(GP)
;Limits.c,224 :: 		if((!X_Min_Limit)&&(TX1)){
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
BEQ	R2, R0, L__Debounce_X_Limits117
NOP	
J	L__Debounce_X_Limits71
NOP	
L__Debounce_X_Limits117:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__Debounce_X_Limits119
NOP	
J	L__Debounce_X_Limits70
NOP	
L__Debounce_X_Limits119:
L__Debounce_X_Limits65:
;Limits.c,225 :: 		if(TX0 && !TX2){
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_X_Limits121
NOP	
J	L__Debounce_X_Limits67
NOP	
L__Debounce_X_Limits121:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Debounce_X_Limits122
NOP	
J	L__Debounce_X_Limits66
NOP	
L__Debounce_X_Limits122:
L__Debounce_X_Limits64:
;Limits.c,226 :: 		TX2 = 1;
LBU	R2, Offset(Limits_bits+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,227 :: 		Limits.X_Min_DeBnc++;
LHU	R2, Offset(_Limits+36)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_Limits+36)(GP)
;Limits.c,229 :: 		dma_printf("LimitX:=%d \r\n",Limits.X_Min_DeBnc);
ADDIU	R23, SP, 4
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr2_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Limits.c,231 :: 		if(Limits.X_Min_DeBnc > last_cntX_min){
LHU	R3, Offset(Limits_last_cntX_min+0)(GP)
LHU	R2, Offset(_Limits+36)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Debounce_X_Limits123
NOP	
J	L_Debounce_X_Limits30
NOP	
L__Debounce_X_Limits123:
;Limits.c,232 :: 		last_cntX_min = Limits.X_Min_DeBnc;
LHU	R2, Offset(_Limits+36)(GP)
SH	R2, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,233 :: 		}
L_Debounce_X_Limits30:
;Limits.c,234 :: 		}else if(!TX0 && TX2)
J	L_Debounce_X_Limits31
NOP	
;Limits.c,225 :: 		if(TX0 && !TX2){
L__Debounce_X_Limits67:
L__Debounce_X_Limits66:
;Limits.c,234 :: 		}else if(!TX0 && TX2)
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_X_Limits124
NOP	
J	L__Debounce_X_Limits69
NOP	
L__Debounce_X_Limits124:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__Debounce_X_Limits126
NOP	
J	L__Debounce_X_Limits68
NOP	
L__Debounce_X_Limits126:
L__Debounce_X_Limits63:
;Limits.c,235 :: 		TX2=0;
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,234 :: 		}else if(!TX0 && TX2)
L__Debounce_X_Limits69:
L__Debounce_X_Limits68:
;Limits.c,235 :: 		TX2=0;
L_Debounce_X_Limits31:
;Limits.c,237 :: 		if(Limits.X_Min_DeBnc > DEBOUNCE_COUNT)
LHU	R2, Offset(_Limits+36)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Debounce_X_Limits127
NOP	
J	L_Debounce_X_Limits35
NOP	
L__Debounce_X_Limits127:
;Limits.c,238 :: 		Reset_X_Min_Limit();
JAL	_Reset_X_Min_Limit+0
NOP	
L_Debounce_X_Limits35:
;Limits.c,240 :: 		}else if(X_Min_Limit){
J	L_Debounce_X_Limits36
NOP	
;Limits.c,224 :: 		if((!X_Min_Limit)&&(TX1)){
L__Debounce_X_Limits71:
L__Debounce_X_Limits70:
;Limits.c,240 :: 		}else if(X_Min_Limit){
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
BNE	R2, R0, L__Debounce_X_Limits129
NOP	
J	L_Debounce_X_Limits37
NOP	
L__Debounce_X_Limits129:
;Limits.c,241 :: 		Reset_X_Min_Debounce();
JAL	_Reset_X_Min_Debounce+0
NOP	
;Limits.c,242 :: 		}
L_Debounce_X_Limits37:
L_Debounce_X_Limits36:
;Limits.c,244 :: 		}
L_end_Debounce_X_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Debounce_X_Limits
_Debounce_Y_Limits:
;Limits.c,248 :: 		void Debounce_Y_Limits(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Limits.c,249 :: 		TY0 = (TMR.clock >> BASE_TMR)&1;
LBU	R2, Offset(_TMR+0)(GP)
ANDI	R3, R2, 1
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R3, 4, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,250 :: 		TY1 = Test_Y_Min();
JAL	_Test_Y_Min+0
NOP	
LBU	R3, Offset(Limits_bits+0)(GP)
INS	R3, R2, 5, 1
SB	R3, Offset(Limits_bits+0)(GP)
;Limits.c,252 :: 		if((!Y_Min_Limit)&&(TY1)){
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
BEQ	R2, R0, L__Debounce_Y_Limits131
NOP	
J	L__Debounce_Y_Limits80
NOP	
L__Debounce_Y_Limits131:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__Debounce_Y_Limits133
NOP	
J	L__Debounce_Y_Limits79
NOP	
L__Debounce_Y_Limits133:
L__Debounce_Y_Limits74:
;Limits.c,253 :: 		if(TY0 && !TY2){
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__Debounce_Y_Limits135
NOP	
J	L__Debounce_Y_Limits76
NOP	
L__Debounce_Y_Limits135:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 6, 1
BEQ	R2, R0, L__Debounce_Y_Limits136
NOP	
J	L__Debounce_Y_Limits75
NOP	
L__Debounce_Y_Limits136:
L__Debounce_Y_Limits73:
;Limits.c,254 :: 		TY2 = 1;
LBU	R2, Offset(Limits_bits+0)(GP)
ORI	R2, R2, 64
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,255 :: 		Limits.Y_Min_DeBnc++;
LHU	R2, Offset(_Limits+38)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_Limits+38)(GP)
;Limits.c,257 :: 		dma_printf("LimitY:=%d \r\n",Limits.Y_Min_DeBnc);
ADDIU	R23, SP, 4
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr3_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Limits.c,259 :: 		if(Limits.Y_Min_DeBnc > last_cntY_min){
LHU	R3, Offset(Limits_last_cntY_min+0)(GP)
LHU	R2, Offset(_Limits+38)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Debounce_Y_Limits137
NOP	
J	L_Debounce_Y_Limits44
NOP	
L__Debounce_Y_Limits137:
;Limits.c,260 :: 		last_cntY_min = Limits.Y_Min_DeBnc;
LHU	R2, Offset(_Limits+38)(GP)
SH	R2, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,261 :: 		}
L_Debounce_Y_Limits44:
;Limits.c,262 :: 		}else if(!TY0 && TY2)
J	L_Debounce_Y_Limits45
NOP	
;Limits.c,253 :: 		if(TY0 && !TY2){
L__Debounce_Y_Limits76:
L__Debounce_Y_Limits75:
;Limits.c,262 :: 		}else if(!TY0 && TY2)
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Debounce_Y_Limits138
NOP	
J	L__Debounce_Y_Limits78
NOP	
L__Debounce_Y_Limits138:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 6, 1
BNE	R2, R0, L__Debounce_Y_Limits140
NOP	
J	L__Debounce_Y_Limits77
NOP	
L__Debounce_Y_Limits140:
L__Debounce_Y_Limits72:
;Limits.c,263 :: 		TY2=0;
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R0, 6, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,262 :: 		}else if(!TY0 && TY2)
L__Debounce_Y_Limits78:
L__Debounce_Y_Limits77:
;Limits.c,263 :: 		TY2=0;
L_Debounce_Y_Limits45:
;Limits.c,265 :: 		if(Limits.Y_Min_DeBnc > DEBOUNCE_COUNT)
LHU	R2, Offset(_Limits+38)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Debounce_Y_Limits141
NOP	
J	L_Debounce_Y_Limits49
NOP	
L__Debounce_Y_Limits141:
;Limits.c,266 :: 		Reset_Y_Min_Limit();
JAL	_Reset_Y_Min_Limit+0
NOP	
L_Debounce_Y_Limits49:
;Limits.c,268 :: 		}else if(Y_Min_Limit){
J	L_Debounce_Y_Limits50
NOP	
;Limits.c,252 :: 		if((!Y_Min_Limit)&&(TY1)){
L__Debounce_Y_Limits80:
L__Debounce_Y_Limits79:
;Limits.c,268 :: 		}else if(Y_Min_Limit){
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
BNE	R2, R0, L__Debounce_Y_Limits143
NOP	
J	L_Debounce_Y_Limits51
NOP	
L__Debounce_Y_Limits143:
;Limits.c,269 :: 		Reset_Y_Min_Debounce();
JAL	_Reset_Y_Min_Debounce+0
NOP	
;Limits.c,270 :: 		}
L_Debounce_Y_Limits51:
L_Debounce_Y_Limits50:
;Limits.c,271 :: 		}
L_end_Debounce_Y_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Debounce_Y_Limits
_FP:
;Limits.c,279 :: 		char FP(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,280 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
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
;Limits.c,281 :: 		if(Limit[axis].old_val < Limit[axis].new_val){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 2
LBU	R3, 0(R2)
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R3, 255
ANDI	R2, R2, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__FP145
NOP	
J	L_FP52
NOP	
L__FP145:
;Limits.c,282 :: 		Limit[axis].old_val = Limit[axis].new_val;
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
;Limits.c,283 :: 		return 1;
ORI	R2, R0, 1
J	L_end_FP
NOP	
;Limits.c,284 :: 		}
L_FP52:
;Limits.c,285 :: 		return 0;
MOVZ	R2, R0, R0
;Limits.c,286 :: 		}
L_end_FP:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FP
_FN:
;Limits.c,289 :: 		char FN(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,290 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
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
;Limits.c,291 :: 		if(Limit[axis].old_val > Limit[axis].new_val){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 2
LBU	R3, 0(R2)
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R3, 255
ANDI	R2, R2, 255
SLTU	R2, R2, R3
BNE	R2, R0, L__FN147
NOP	
J	L_FN53
NOP	
L__FN147:
;Limits.c,292 :: 		Limit[axis].old_val = Limit[axis].new_val;
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
;Limits.c,293 :: 		return 1;
ORI	R2, R0, 1
J	L_end_FN
NOP	
;Limits.c,294 :: 		}
L_FN53:
;Limits.c,295 :: 		return 0;
MOVZ	R2, R0, R0
;Limits.c,296 :: 		}
L_end_FN:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FN
