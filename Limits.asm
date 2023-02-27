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
;Limits.c,23 :: 		Limit[X].Limit_Min = 0;
LBU	R2, Offset(Limits_Limit+0)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(Limits_Limit+0)(GP)
;Limits.c,24 :: 		Limit[Y].Limit_Min = 0;
LBU	R2, Offset(Limits_Limit+12)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(Limits_Limit+12)(GP)
;Limits.c,27 :: 		IEC0  |= 0x21 << 8;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 8448
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,30 :: 		X_Min_Limit_Setup();
JAL	_X_Min_Limit_Setup+0
NOP	
;Limits.c,31 :: 		Y_Min_Limit_Setup();
JAL	_Y_Min_Limit_Setup+0
NOP	
;Limits.c,37 :: 		}
L_end_Limit_Initialize:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Limit_Initialize
_X_Min_Limit_Setup:
;Limits.c,41 :: 		void X_Min_Limit_Setup(){
;Limits.c,48 :: 		IPC2SET = 17 ;
ORI	R2, R0, 17
SW	R2, Offset(IPC2SET+0)(GP)
;Limits.c,51 :: 		IEC0SET = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(IEC0SET+0)(GP)
;Limits.c,53 :: 		IFS0CLR  = 1 << 8;
ORI	R2, R0, 256
SW	R2, Offset(IFS0CLR+0)(GP)
;Limits.c,54 :: 		}
L_end_X_Min_Limit_Setup:
JR	RA
NOP	
; end of _X_Min_Limit_Setup
_Y_Min_Limit_Setup:
;Limits.c,58 :: 		void Y_Min_Limit_Setup(){
;Limits.c,66 :: 		IPC3SET = 17 << 8;
ORI	R2, R0, 4352
SW	R2, Offset(IPC3SET+0)(GP)
;Limits.c,69 :: 		IEC0SET = 1 << 13;
ORI	R2, R0, 8192
SW	R2, Offset(IEC0SET+0)(GP)
;Limits.c,71 :: 		IFS0CLR = (1 << 13);
ORI	R2, R0, 8192
SW	R2, Offset(IFS0CLR+0)(GP)
;Limits.c,72 :: 		}
L_end_Y_Min_Limit_Setup:
JR	RA
NOP	
; end of _Y_Min_Limit_Setup
_X_Min_Limit:
;Limits.c,79 :: 		void X_Min_Limit() iv IVT_EXTERNAL_1 ilevel 4 ics ICS_AUTO {
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
;Limits.c,80 :: 		INT1IF_bit = 0;
LUI	R2, BitMask(INT1IF_bit+0)
ORI	R2, R2, BitMask(INT1IF_bit+0)
_SX	
;Limits.c,81 :: 		if(!Limit[X].Limit_Min)
LBU	R2, Offset(Limits_Limit+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__X_Min_Limit42
NOP	
J	L_X_Min_Limit0
NOP	
L__X_Min_Limit42:
;Limits.c,82 :: 		Limit[X].Limit_Min = true;
LBU	R2, Offset(Limits_Limit+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+0)(GP)
L_X_Min_Limit0:
;Limits.c,83 :: 		}
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
;Limits.c,87 :: 		void Y_Min_Limit() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_AUTO {
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
;Limits.c,88 :: 		INT2IF_bit = 0;
LUI	R2, BitMask(INT2IF_bit+0)
ORI	R2, R2, BitMask(INT2IF_bit+0)
_SX	
;Limits.c,89 :: 		if(!Limit[Y].Limit_Min)
LBU	R2, Offset(Limits_Limit+12)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Y_Min_Limit44
NOP	
J	L_Y_Min_Limit1
NOP	
L__Y_Min_Limit44:
;Limits.c,90 :: 		Limit[Y].Limit_Min = true;
LBU	R2, Offset(Limits_Limit+12)(GP)
ORI	R2, R2, 2
SB	R2, Offset(Limits_Limit+12)(GP)
L_Y_Min_Limit1:
;Limits.c,91 :: 		}
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
;Limits.c,102 :: 		char Test_Min(int axis){
;Limits.c,103 :: 		return (Limit[axis].Limit_Min & 0x01)? 1:0;
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
BNE	R2, R0, L__Test_Min47
NOP	
J	L_Test_Min2
NOP	
L__Test_Min47:
; ?FLOC___Test_Min?T32 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_Min?T32 end address is: 8 (R2)
J	L_Test_Min3
NOP	
L_Test_Min2:
; ?FLOC___Test_Min?T32 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_Min?T32 end address is: 8 (R2)
L_Test_Min3:
; ?FLOC___Test_Min?T32 start address is: 8 (R2)
; ?FLOC___Test_Min?T32 end address is: 8 (R2)
;Limits.c,104 :: 		}
L_end_Test_Min:
JR	RA
NOP	
; end of _Test_Min
_Reset_Min_Limit:
;Limits.c,110 :: 		void Reset_Min_Limit(int axis){
;Limits.c,111 :: 		Limit[axis].Limit_Min = INV ^ Limit[axis].Limit_Min;
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
;Limits.c,112 :: 		}
L_end_Reset_Min_Limit:
JR	RA
NOP	
; end of _Reset_Min_Limit
_Reset_Min_Debounce:
;Limits.c,118 :: 		void Reset_Min_Debounce(int axis){
;Limits.c,119 :: 		Limit[axis].Min_DeBnc = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Limits.c,120 :: 		Limit[axis].last_cnt_min = 0;
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Limits.c,121 :: 		}
L_end_Reset_Min_Debounce:
JR	RA
NOP	
; end of _Reset_Min_Debounce
_Debounce_Limits:
;Limits.c,126 :: 		void Debounce_Limits(int axis){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Limits.c,127 :: 		Limit[axis].T0 = (TMR.clock >> BASE_TMR)&1;
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
;Limits.c,131 :: 		Limit[axis].Pin = Test_Port_Pins(axis);
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
;Limits.c,133 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_Limits51
NOP	
J	L__Debounce_Limits37
NOP	
L__Debounce_Limits51:
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__Debounce_Limits53
NOP	
J	L__Debounce_Limits36
NOP	
L__Debounce_Limits53:
L__Debounce_Limits31:
;Limits.c,135 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Debounce_Limits54
NOP	
J	L__Debounce_Limits33
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
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__Debounce_Limits55
NOP	
J	L__Debounce_Limits32
NOP	
L__Debounce_Limits55:
L__Debounce_Limits30:
;Limits.c,136 :: 		Limit[axis].T2 = 1;
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
;Limits.c,137 :: 		Limit[axis].Min_DeBnc++;
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
;Limits.c,139 :: 		dma_printf("\nLimit[%d]:=%d\r\n",axis,Limit[axis].Min_DeBnc);
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
;Limits.c,142 :: 		if(Limit[axis].Min_DeBnc > Limit[axis].last_cnt_min){
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
BNE	R2, R0, L__Debounce_Limits56
NOP	
J	L_Debounce_Limits10
NOP	
L__Debounce_Limits56:
;Limits.c,143 :: 		Limit[axis].last_cnt_min = Limit[axis].Min_DeBnc;
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
;Limits.c,144 :: 		}
L_Debounce_Limits10:
;Limits.c,145 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
J	L_Debounce_Limits11
NOP	
;Limits.c,135 :: 		if(!Limit[axis].T0 && !Limit[axis].T2){
L__Debounce_Limits33:
L__Debounce_Limits32:
;Limits.c,145 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__Debounce_Limits58
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
BNE	R2, R0, L__Debounce_Limits60
NOP	
J	L__Debounce_Limits34
NOP	
L__Debounce_Limits60:
L__Debounce_Limits29:
;Limits.c,146 :: 		Limit[axis].T2 = 0;
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
;Limits.c,145 :: 		}else if(Limit[axis].T0 && Limit[axis].T2)
L__Debounce_Limits35:
L__Debounce_Limits34:
;Limits.c,146 :: 		Limit[axis].T2 = 0;
L_Debounce_Limits11:
;Limits.c,149 :: 		if(Limit[axis].Min_DeBnc > DEBOUNCE_COUNT)
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
BEQ	R2, R0, L__Debounce_Limits61
NOP	
J	L_Debounce_Limits15
NOP	
L__Debounce_Limits61:
;Limits.c,150 :: 		Reset_Min_Limit(axis);
JAL	_Reset_Min_Limit+0
NOP	
L_Debounce_Limits15:
;Limits.c,152 :: 		}else if(Limit[axis].Pin){
J	L_Debounce_Limits16
NOP	
;Limits.c,133 :: 		if((!Limit[axis].Pin)&&(Limit[axis].Limit_Min)){
L__Debounce_Limits37:
L__Debounce_Limits36:
;Limits.c,152 :: 		}else if(Limit[axis].Pin){
SEH	R3, R25
ORI	R2, R0, 12
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(Limits_Limit+0)
ORI	R2, R2, lo_addr(Limits_Limit+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_Limits63
NOP	
J	L_Debounce_Limits17
NOP	
L__Debounce_Limits63:
;Limits.c,153 :: 		Reset_Min_Debounce(axis);
JAL	_Reset_Min_Debounce+0
NOP	
;Limits.c,154 :: 		}
L_Debounce_Limits17:
L_Debounce_Limits16:
;Limits.c,156 :: 		}
L_end_Debounce_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Debounce_Limits
_FP:
;Limits.c,164 :: 		char FP(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,165 :: 		char tmp = 0;
;Limits.c,166 :: 		Limit[axis].new_val = Test_Min(axis) & 0x0001;
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
;Limits.c,167 :: 		if(Limit[axis].new_val > Limit[axis].old_Pval){
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
BNE	R2, R0, L__FP65
NOP	
J	L_FP18
NOP	
L__FP65:
;Limits.c,168 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,169 :: 		}else {
; tmp end address is: 16 (R4)
J	L_FP19
NOP	
L_FP18:
;Limits.c,170 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
;Limits.c,171 :: 		}
L_FP19:
;Limits.c,172 :: 		Limit[axis].old_Pval = Limit[axis].new_val;
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
;Limits.c,173 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,174 :: 		}
L_end_FP:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FP
_FN:
;Limits.c,177 :: 		char FN(int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Limits.c,178 :: 		char tmp = 0;
;Limits.c,179 :: 		Limit[axis].new_val = Test_Min(axis) & 0x01;
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
;Limits.c,180 :: 		if(Limit[axis].new_val < Limit[axis].old_Fval){
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
BNE	R2, R0, L__FN67
NOP	
J	L_FN20
NOP	
L__FN67:
;Limits.c,181 :: 		tmp = 1;
; tmp start address is: 16 (R4)
ORI	R4, R0, 1
;Limits.c,182 :: 		}else
; tmp end address is: 16 (R4)
J	L_FN21
NOP	
L_FN20:
;Limits.c,183 :: 		tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
; tmp end address is: 16 (R4)
L_FN21:
;Limits.c,184 :: 		Limit[axis].old_Fval = Limit[axis].new_val;
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
;Limits.c,185 :: 		return tmp;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
;Limits.c,186 :: 		}
L_end_FN:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _FN
_Test_Port_Pins:
;Limits.c,192 :: 		char Test_Port_Pins(int axis){
;Limits.c,193 :: 		char tmp = 0;
; tmp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Limits.c,194 :: 		switch(axis){
J	L_Test_Port_Pins22
NOP	
; tmp end address is: 16 (R4)
;Limits.c,195 :: 		case X:
L_Test_Port_Pins24:
;Limits.c,196 :: 		tmp = X_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,197 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins23
NOP	
;Limits.c,198 :: 		case Y:
L_Test_Port_Pins25:
;Limits.c,199 :: 		tmp = Y_Min_Limit & 0x0001;
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
ANDI	R2, R2, 1
; tmp start address is: 8 (R2)
;Limits.c,200 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins23
NOP	
;Limits.c,201 :: 		case Z:
L_Test_Port_Pins26:
;Limits.c,203 :: 		break;
; tmp start address is: 16 (R4)
ANDI	R2, R4, 255
J	L_Test_Port_Pins23
NOP	
;Limits.c,204 :: 		case A:
L_Test_Port_Pins27:
;Limits.c,206 :: 		break;
ANDI	R2, R4, 255
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins23
NOP	
;Limits.c,207 :: 		default: tmp = 255;
L_Test_Port_Pins28:
; tmp start address is: 8 (R2)
ORI	R2, R0, 255
;Limits.c,208 :: 		break;
; tmp end address is: 8 (R2)
J	L_Test_Port_Pins23
NOP	
;Limits.c,209 :: 		}
L_Test_Port_Pins22:
; tmp start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Test_Port_Pins70
NOP	
J	L_Test_Port_Pins24
NOP	
L__Test_Port_Pins70:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Test_Port_Pins72
NOP	
J	L_Test_Port_Pins25
NOP	
L__Test_Port_Pins72:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Test_Port_Pins74
NOP	
J	L_Test_Port_Pins26
NOP	
L__Test_Port_Pins74:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Test_Port_Pins76
NOP	
J	L_Test_Port_Pins27
NOP	
L__Test_Port_Pins76:
; tmp end address is: 16 (R4)
J	L_Test_Port_Pins28
NOP	
L_Test_Port_Pins23:
;Limits.c,210 :: 		return tmp;
; tmp start address is: 8 (R2)
; tmp end address is: 8 (R2)
;Limits.c,211 :: 		}
L_end_Test_Port_Pins:
JR	RA
NOP	
; end of _Test_Port_Pins
