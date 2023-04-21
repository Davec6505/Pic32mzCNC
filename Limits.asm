_Limit_Initialize:
;Limits.c,15 :: 		void Limit_Initialize(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
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
SW	R2, Offset(IEC0CLR+0)(GP)
;Limits.c,31 :: 		X_Min_Limit_Setup();
JAL	Limits_X_Min_Limit_Setup+0
NOP	
;Limits.c,32 :: 		Y_Min_Limit_Setup();
JAL	Limits_Y_Min_Limit_Setup+0
NOP	
;Limits.c,33 :: 		Z_Min_Limit_Setup();
JAL	Limits_Z_Min_Limit_Setup+0
NOP	
;Limits.c,39 :: 		}
L_end_Limit_Initialize:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Limit_Initialize
Limits_X_Min_Limit_Setup:
;Limits.c,43 :: 		static void X_Min_Limit_Setup(){
;Limits.c,50 :: 		IPC2SET = 11 ;
ORI	R2, R0, 11
SW	R2, Offset(IPC2SET+0)(GP)
;Limits.c,53 :: 		IEC0SET = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(IEC0SET+0)(GP)
;Limits.c,55 :: 		IFS0CLR  = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(IFS0CLR+0)(GP)
;Limits.c,56 :: 		}
L_end_X_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_X_Min_Limit_Setup
Limits_Y_Min_Limit_Setup:
;Limits.c,60 :: 		static void Y_Min_Limit_Setup(){
;Limits.c,68 :: 		IPC3SET = 11 << 8;
ORI	R2, R0, 2816
SW	R2, Offset(IPC3SET+0)(GP)
;Limits.c,71 :: 		IEC0SET = 1 << 13;
ORI	R2, R0, 8192
SW	R2, Offset(IEC0SET+0)(GP)
;Limits.c,73 :: 		IFS0CLR = (1 << 13);
ORI	R2, R0, 8192
SW	R2, Offset(IFS0CLR+0)(GP)
;Limits.c,74 :: 		}
L_end_Y_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_Y_Min_Limit_Setup
Limits_Z_Min_Limit_Setup:
;Limits.c,78 :: 		static void Z_Min_Limit_Setup(){
;Limits.c,86 :: 		IPC5SET = 11 << 24;
LUI	R2, 2816
SW	R2, Offset(IPC5SET+0)(GP)
;Limits.c,89 :: 		IEC0SET = 1 << 23;
LUI	R2, 128
SW	R2, Offset(IEC0SET+0)(GP)
;Limits.c,91 :: 		IFS0CLR = (1 << 23);
LUI	R2, 128
SW	R2, Offset(IFS0CLR+0)(GP)
;Limits.c,92 :: 		}
L_end_Z_Min_Limit_Setup:
JR	RA
NOP	
; end of Limits_Z_Min_Limit_Setup
_X_Min_Limit:
;Limits.c,99 :: 		void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,100 :: 		INT1IF_bit = 0;
LUI	R2, BitMask(INT1IF_bit+0)
ORI	R2, R2, BitMask(INT1IF_bit+0)
_SX	
;Limits.c,101 :: 		Set_Min_Limit(X);
MOVZ	R25, R0, R0
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,102 :: 		}
L_end_X_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
;Limits.c,107 :: 		void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,108 :: 		INT2IF_bit = 0;
LUI	R2, BitMask(INT2IF_bit+0)
ORI	R2, R2, BitMask(INT2IF_bit+0)
_SX	
;Limits.c,109 :: 		Set_Min_Limit(Y);
ORI	R25, R0, 1
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,110 :: 		}
L_end_Y_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
_Z_Min_Limit:
;Limits.c,114 :: 		void Z_Min_Limit() iv IVT_EXTERNAL_4 ilevel 4 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,115 :: 		INT4IF_bit = 0;
LUI	R2, BitMask(INT4IF_bit+0)
ORI	R2, R2, BitMask(INT4IF_bit+0)
_SX	
;Limits.c,116 :: 		Set_Min_Limit(Z);
ORI	R25, R0, 2
JAL	_Set_Min_Limit+0
NOP	
;Limits.c,117 :: 		}
L_end_Z_Min_Limit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
; end of _Z_Min_Limit
_Test_Min:
;Limits.c,126 :: 		char Test_Min(int axis){
;Limits.c,127 :: 		return (Limit[axis].Limit_Min & 0x01)? 1:0;
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
BNE	R2, R0, L__Test_Min46
NOP	
J	L_Test_Min0
NOP	
L__Test_Min46:
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
;Limits.c,128 :: 		}
L_end_Test_Min:
JR	RA
NOP	
; end of _Test_Min
_Reset_Min_Limit:
;Limits.c,134 :: 		void Reset_Min_Limit(int axis){
;Limits.c,135 :: 		Limit[axis].Limit_Min = false;//INV ^ Limit[axis].Limit_Min;
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
;Limits.c,136 :: 		}
L_end_Reset_Min_Limit:
JR	RA
NOP	
; end of _Reset_Min_Limit
_XOR_Min_Limit:
;Limits.c,138 :: 		void XOR_Min_Limit(int axis){
;Limits.c,139 :: 		Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
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
;Limits.c,140 :: 		}
L_end_XOR_Min_Limit:
JR	RA
NOP	
; end of _XOR_Min_Limit
_Invert_Min_Limit:
;Limits.c,142 :: 		void Invert_Min_Limit(int axis){
;Limits.c,143 :: 		Limit[axis].Limit_Min = (~Limit[axis].Limit_Min) & 0x01;
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
;Limits.c,144 :: 		}
L_end_Invert_Min_Limit:
JR	RA
NOP	
; end of _Invert_Min_Limit
_Set_Min_Limit:
;Limits.c,146 :: 		void Set_Min_Limit(int axis){
;Limits.c,148 :: 		if(!Limit[axis].Limit_Min)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Set_Min_Limit51
NOP	
J	L_Set_Min_Limit2
NOP	
L__Set_Min_Limit51:
;Limits.c,149 :: 		Limit[axis].Limit_Min = true;
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
;Limits.c,150 :: 		}
L_end_Set_Min_Limit:
JR	RA
NOP	
; end of _Set_Min_Limit
Limits_Reset_Min_Debounce:
;Limits.c,156 :: 		static void Reset_Min_Debounce(int axis){
;Limits.c,157 :: 		Limit[axis].Min_DeBnc = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Limits.c,158 :: 		Limit[axis].last_cnt_min = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,159 :: 		}
L_end_Reset_Min_Debounce:
JR	RA
NOP	
; end of Limits_Reset_Min_Debounce
_Debounce_Limits:
;Limits.c,163 :: 		void Debounce_Limits(int axis){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Limits.c,164 :: 		Limit[axis].T0 = (TMR.clock >> BASE_TMR)&1;
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
;Limits.c,168 :: 		Limit[axis].Pin = Test_Port_Pins(axis);
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
SW	R2, 24(SP)
JAL	_Test_Port_Pins+0
NOP	
ANDI	R4, R2, 255
LW	R3, 24(SP)
LBU	R2, 0(R3)
INS	R2, R4, 0, 1
SB	R2, 0(R3)
;Limits.c,171 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_Limits54
NOP	
J	L__Debounce_Limits36
NOP	
L__Debounce_Limits54:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__Debounce_Limits56
NOP	
J	L__Debounce_Limits35
NOP	
L__Debounce_Limits56:
L__Debounce_Limits30:
;Limits.c,173 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Debounce_Limits57
NOP	
J	L__Debounce_Limits32
NOP	
L__Debounce_Limits57:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__Debounce_Limits58
NOP	
J	L__Debounce_Limits31
NOP	
L__Debounce_Limits58:
L__Debounce_Limits29:
;Limits.c,174 :: 		Limit[axis].T2 = 1;
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
;Limits.c,175 :: 		Limit[axis].Min_DeBnc++;
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
;Limits.c,177 :: 		dma_printf("\nLimit[%d]:=%d\r\n",axis,Limit[axis].Min_DeBnc);
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
ADDIU	R22, R23, 17
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
;Limits.c,180 :: 		if(Limit[axis].Min_DeBnc > Limit[axis].last_cnt_min){
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
BNE	R2, R0, L__Debounce_Limits59
NOP	
J	L_Debounce_Limits9
NOP	
L__Debounce_Limits59:
;Limits.c,181 :: 		Limit[axis].last_cnt_min = Limit[axis].Min_DeBnc;
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
;Limits.c,182 :: 		}
L_Debounce_Limits9:
;Limits.c,183 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
J	L_Debounce_Limits10
NOP	
;Limits.c,173 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
L__Debounce_Limits32:
L__Debounce_Limits31:
;Limits.c,183 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__Debounce_Limits61
NOP	
J	L__Debounce_Limits34
NOP	
L__Debounce_Limits61:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__Debounce_Limits63
NOP	
J	L__Debounce_Limits33
NOP	
L__Debounce_Limits63:
L__Debounce_Limits28:
;Limits.c,184 :: 		Limit[axis].T2 = 0;
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
;Limits.c,183 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
L__Debounce_Limits34:
L__Debounce_Limits33:
;Limits.c,184 :: 		Limit[axis].T2 = 0;
L_Debounce_Limits10:
;Limits.c,187 :: 		if(Limit[axis].Min_DeBnc > DEBOUNCE_COUNT)
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
BEQ	R2, R0, L__Debounce_Limits64
NOP	
J	L_Debounce_Limits14
NOP	
L__Debounce_Limits64:
;Limits.c,188 :: 		Reset_Min_Limit(axis);
JAL	_Reset_Min_Limit+0
NOP	
L_Debounce_Limits14:
;Limits.c,190 :: 		}else if(Limit[axis].Pin){
J	L_Debounce_Limits15
NOP	
;Limits.c,171 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
L__Debounce_Limits36:
L__Debounce_Limits35:
;Limits.c,190 :: 		}else if(Limit[axis].Pin){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_Limits66
NOP	
J	L_Debounce_Limits16
NOP	
L__Debounce_Limits66:
;Limits.c,191 :: 		Reset_Min_Debounce(axis);
JAL	Limits_Reset_Min_Debounce+0
NOP	
;Limits.c,192 :: 		}
L_Debounce_Limits16:
L_Debounce_Limits15:
;Limits.c,194 :: 		}
L_end_Debounce_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Debounce_Limits
_FP:
;Limits.c,202 :: 		char FP(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,203 :: 		char tmp = 0;
;Limits.c,204 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
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
;Limits.c,205 :: 		if(Limit[axis].new_val > Limit[axis].old_Pval){
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
BNE	R2, R0, L__FP68
NOP	
J	L_FP17
NOP	
L__FP68:
;Limits.c,206 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,207 :: 		}else {
; tmp end address is: 16 (R4)
J	L_FP18
NOP	
L_FP17:
;Limits.c,208 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
;Limits.c,209 :: 		}
L_FP18:
;Limits.c,210 :: 		Limit[axis].old_Pval = Limit[axis].new_val;
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
;Limits.c,211 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,212 :: 		}
L_end_FP:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FP
_Rst_FP:
;Limits.c,215 :: 		void Rst_FP(int axis){
;Limits.c,216 :: 		Limit[axis].old_Pval = false;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SB	R0, 0(R2)
;Limits.c,217 :: 		}
L_end_Rst_FP:
JR	RA
NOP	
; end of _Rst_FP
_FN:
;Limits.c,220 :: 		char FN(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,221 :: 		char tmp = 0;
;Limits.c,222 :: 		Limit[axis].new_val = Test_Min(axis) & 0x01;
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
;Limits.c,223 :: 		if(Limit[axis].new_val < Limit[axis].old_Fval){
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
J	L_FN19
NOP	
L__FN71:
;Limits.c,224 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,225 :: 		}else
; tmp end address is: 16 (R4)
J	L_FN20
NOP	
L_FN19:
;Limits.c,226 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
L_FN20:
;Limits.c,227 :: 		Limit[axis].old_Fval = Limit[axis].new_val;
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
;Limits.c,228 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,229 :: 		}
L_end_FN:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FN
_Rst_FN:
;Limits.c,232 :: 		void Rst_FN(int axis){
;Limits.c,233 :: 		Limit[axis].old_Fval = true;
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
;Limits.c,234 :: 		}
L_end_Rst_FN:
JR	RA
NOP	
; end of _Rst_FN
_Test_Port_Pins:
;Limits.c,240 :: 		char Test_Port_Pins(int axis){
;Limits.c,241 :: 		char tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Limits.c,242 :: 		switch(axis){
J	L_Test_Port_Pins21
NOP	
; tmp end address is: 16 (R4)
;Limits.c,243 :: 		case X:
L_Test_Port_Pins23:
;Limits.c,244 :: 		tmp = X_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,245 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins22
NOP	
;Limits.c,246 :: 		case Y:
L_Test_Port_Pins24:
;Limits.c,247 :: 		tmp = Y_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,248 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins22
NOP	
;Limits.c,249 :: 		case Z:
L_Test_Port_Pins25:
;Limits.c,250 :: 		tmp = Z_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Z_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,251 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins22
NOP	
;Limits.c,252 :: 		case A:
L_Test_Port_Pins26:
;Limits.c,254 :: 		break;
; tmp start address is: 16 (R4)
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins22
NOP	
;Limits.c,255 :: 		default: tmp = 255;
L_Test_Port_Pins27:
; tmp start address is: 8 (R2)
ORI	R2, R0, 255
;Limits.c,256 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins22
NOP	
;Limits.c,257 :: 		}
L_Test_Port_Pins21:
; tmp start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Test_Port_Pins75
NOP	
J	L_Test_Port_Pins23
NOP	
L__Test_Port_Pins75:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Test_Port_Pins77
NOP	
J	L_Test_Port_Pins24
NOP	
L__Test_Port_Pins77:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Test_Port_Pins79
NOP	
J	L_Test_Port_Pins25
NOP	
L__Test_Port_Pins79:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Test_Port_Pins81
NOP	
J	L_Test_Port_Pins26
NOP	
L__Test_Port_Pins81:
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins27
NOP	
L_Test_Port_Pins22:
;Limits.c,258 :: 		return tmp;
; tmp start address is: 8 (R2)
; tmp end address is: 8 (R2)
;Limits.c,259 :: 		}
L_end_Test_Port_Pins:
JR	RA
NOP	
; end of _Test_Port_Pins
