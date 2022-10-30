_Limit_Initialize:
;Limits.c,36 :: 		void Limit_Initialize(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Limits.c,38 :: 		X_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(X_Min_Limit_Dir+0)
_SX	
;Limits.c,39 :: 		Y_Min_Limit_Dir = 1;
_LX	
ORI	R2, R2, BitMask(Y_Min_Limit_Dir+0)
_SX	
;Limits.c,42 :: 		Limits.X_Limit_Min = 0;
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,43 :: 		Limits.Y_Limit_Min = 0;
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,46 :: 		last_cntX_min = 0;
SH	R0, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,47 :: 		last_cntY_min = 0;
SH	R0, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,48 :: 		last_cntZ_min = 0;
SH	R0, Offset(Limits_last_cntZ_min+0)(GP)
;Limits.c,49 :: 		last_cntA_min = 0;
SH	R0, Offset(Limits_last_cntA_min+0)(GP)
;Limits.c,52 :: 		IEC0  |= 0x21 << 8;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 8448
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,55 :: 		X_Min_Limit_Setup();
JAL	_X_Min_Limit_Setup+0
NOP	
;Limits.c,56 :: 		Y_Min_Limit_Setup();
JAL	_Y_Min_Limit_Setup+0
NOP	
;Limits.c,58 :: 		}
L_end_Limit_Initialize:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Limit_Initialize
_X_Min_Limit_Setup:
;Limits.c,62 :: 		void X_Min_Limit_Setup(){
;Limits.c,69 :: 		IPC2 |= 17 ;
LW	R2, Offset(IPC2+0)(GP)
ORI	R2, R2, 17
SW	R2, Offset(IPC2+0)(GP)
;Limits.c,72 :: 		IEC0 |= 1 << 8;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 256
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,74 :: 		IFS0 |= ~(1 << 8);
LW	R3, Offset(IFS0+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65279
OR	R2, R3, R2
SW	R2, Offset(IFS0+0)(GP)
;Limits.c,75 :: 		}
L_end_X_Min_Limit_Setup:
JR	RA
NOP	
; end of _X_Min_Limit_Setup
_Y_Min_Limit_Setup:
;Limits.c,79 :: 		void Y_Min_Limit_Setup(){
;Limits.c,86 :: 		IPC3 |= 18 << 8;
LW	R2, Offset(IPC3+0)(GP)
ORI	R2, R2, 4608
SW	R2, Offset(IPC3+0)(GP)
;Limits.c,89 :: 		IEC0 |= 1 << 13;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 8192
SW	R2, Offset(IEC0+0)(GP)
;Limits.c,91 :: 		IFS0 |= ~(1 << 13);
LW	R3, Offset(IFS0+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 57343
OR	R2, R3, R2
SW	R2, Offset(IFS0+0)(GP)
;Limits.c,92 :: 		}
L_end_Y_Min_Limit_Setup:
JR	RA
NOP	
; end of _Y_Min_Limit_Setup
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
;Limits.c,100 :: 		INT1IF_bit = 0;
LUI	R2, BitMask(INT1IF_bit+0)
ORI	R2, R2, BitMask(INT1IF_bit+0)
_SX	
;Limits.c,101 :: 		if(!Limits.X_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__X_Min_Limit56
NOP	
J	L_X_Min_Limit0
NOP	
L__X_Min_Limit56:
;Limits.c,102 :: 		Limits.X_Limit_Min = 1;
LBU	R2, Offset(_Limits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_Limits+0)(GP)
L_X_Min_Limit0:
;Limits.c,103 :: 		}
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
;Limits.c,108 :: 		INT2IF_bit = 0;
LUI	R2, BitMask(INT2IF_bit+0)
ORI	R2, R2, BitMask(INT2IF_bit+0)
_SX	
;Limits.c,109 :: 		if(!Limits.Y_Limit_Min)
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Y_Min_Limit58
NOP	
J	L_Y_Min_Limit1
NOP	
L__Y_Min_Limit58:
;Limits.c,110 :: 		Limits.Y_Limit_Min = 1;
LBU	R2, Offset(_Limits+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_Limits+0)(GP)
L_Y_Min_Limit1:
;Limits.c,111 :: 		}
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
_Test_X_Min:
;Limits.c,120 :: 		char Test_X_Min(){
;Limits.c,121 :: 		return (Limits.X_Limit_Min == 1)? 1:0;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_X_Min60
NOP	
J	L_Test_X_Min2
NOP	
L__Test_X_Min60:
; ?FLOC___Test_X_Min?T25 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_X_Min?T25 end address is: 8 (R2)
J	L_Test_X_Min3
NOP	
L_Test_X_Min2:
; ?FLOC___Test_X_Min?T25 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_X_Min?T25 end address is: 8 (R2)
L_Test_X_Min3:
; ?FLOC___Test_X_Min?T25 start address is: 8 (R2)
; ?FLOC___Test_X_Min?T25 end address is: 8 (R2)
;Limits.c,122 :: 		}
L_end_Test_X_Min:
JR	RA
NOP	
; end of _Test_X_Min
_Test_Y_Min:
;Limits.c,126 :: 		char Test_Y_Min(){
;Limits.c,127 :: 		return (Limits.Y_Limit_Min == 1)? 1:0;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Y_Min62
NOP	
J	L_Test_Y_Min4
NOP	
L__Test_Y_Min62:
; ?FLOC___Test_Y_Min?T29 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Test_Y_Min?T29 end address is: 8 (R2)
J	L_Test_Y_Min5
NOP	
L_Test_Y_Min4:
; ?FLOC___Test_Y_Min?T29 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Test_Y_Min?T29 end address is: 8 (R2)
L_Test_Y_Min5:
; ?FLOC___Test_Y_Min?T29 start address is: 8 (R2)
; ?FLOC___Test_Y_Min?T29 end address is: 8 (R2)
;Limits.c,128 :: 		}
L_end_Test_Y_Min:
JR	RA
NOP	
; end of _Test_Y_Min
_Reset_X_Min_Limit:
;Limits.c,137 :: 		void Reset_X_Min_Limit(){
;Limits.c,138 :: 		Limits.X_Limit_Min = ~Limits.X_Limit_Min;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
XORI	R3, R2, 1
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,139 :: 		}
L_end_Reset_X_Min_Limit:
JR	RA
NOP	
; end of _Reset_X_Min_Limit
_Reset_Y_Min_Limit:
;Limits.c,143 :: 		void Reset_Y_Min_Limit(){
;Limits.c,144 :: 		Limits.Y_Limit_Min = ~Limits.Y_Limit_Min;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 1, 1
XORI	R3, R2, 1
LBU	R2, Offset(_Limits+0)(GP)
INS	R2, R3, 1, 1
SB	R2, Offset(_Limits+0)(GP)
;Limits.c,145 :: 		}
L_end_Reset_Y_Min_Limit:
JR	RA
NOP	
; end of _Reset_Y_Min_Limit
_Reset_X_Min_Debounce:
;Limits.c,155 :: 		void Reset_X_Min_Debounce(){
;Limits.c,156 :: 		Limits.X_Min_DeBnc = 0;
SH	R0, Offset(_Limits+36)(GP)
;Limits.c,157 :: 		last_cntX_min = 0;
SH	R0, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,158 :: 		}
L_end_Reset_X_Min_Debounce:
JR	RA
NOP	
; end of _Reset_X_Min_Debounce
_Reset_Y_Min_Debounce:
;Limits.c,162 :: 		void Reset_Y_Min_Debounce(){
;Limits.c,163 :: 		Limits.Y_Min_DeBnc = 0;
SH	R0, Offset(_Limits+38)(GP)
;Limits.c,164 :: 		last_cntY_min = 0;
SH	R0, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,165 :: 		}
L_end_Reset_Y_Min_Debounce:
JR	RA
NOP	
; end of _Reset_Y_Min_Debounce
_Debounce_X_Limits:
;Limits.c,169 :: 		void Debounce_X_Limits(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Limits.c,170 :: 		TX0 = (TMR.clock >> BASE_TMR)&1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R2, R2, 1
ANDI	R3, R2, 1
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,171 :: 		TX1 = Test_X_Min();
JAL	_Test_X_Min+0
NOP	
LBU	R3, Offset(Limits_bits+0)(GP)
INS	R3, R2, 1, 1
SB	R3, Offset(Limits_bits+0)(GP)
;Limits.c,173 :: 		if((!X_Min_Limit)&&(TX1)){
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
BEQ	R2, R0, L__Debounce_X_Limits68
NOP	
J	L__Debounce_X_Limits42
NOP	
L__Debounce_X_Limits68:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__Debounce_X_Limits70
NOP	
J	L__Debounce_X_Limits41
NOP	
L__Debounce_X_Limits70:
L__Debounce_X_Limits36:
;Limits.c,174 :: 		if(TX0 && !TX2){
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Debounce_X_Limits72
NOP	
J	L__Debounce_X_Limits38
NOP	
L__Debounce_X_Limits72:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__Debounce_X_Limits73
NOP	
J	L__Debounce_X_Limits37
NOP	
L__Debounce_X_Limits73:
L__Debounce_X_Limits35:
;Limits.c,175 :: 		TX2 = 1;
LBU	R2, Offset(Limits_bits+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,176 :: 		Limits.X_Min_DeBnc++;
LHU	R2, Offset(_Limits+36)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_Limits+36)(GP)
;Limits.c,178 :: 		dma_printf("LimitX:=%d \r\n",Limits.X_Min_DeBnc);
ADDIU	R23, SP, 4
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr1_Limits+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Limits+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Limits.c,180 :: 		if(Limits.X_Min_DeBnc > last_cntX_min){
LHU	R3, Offset(Limits_last_cntX_min+0)(GP)
LHU	R2, Offset(_Limits+36)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Debounce_X_Limits74
NOP	
J	L_Debounce_X_Limits12
NOP	
L__Debounce_X_Limits74:
;Limits.c,181 :: 		last_cntX_min = Limits.X_Min_DeBnc;
LHU	R2, Offset(_Limits+36)(GP)
SH	R2, Offset(Limits_last_cntX_min+0)(GP)
;Limits.c,182 :: 		}
L_Debounce_X_Limits12:
;Limits.c,183 :: 		}else if(!TX0 && TX2)
J	L_Debounce_X_Limits13
NOP	
;Limits.c,174 :: 		if(TX0 && !TX2){
L__Debounce_X_Limits38:
L__Debounce_X_Limits37:
;Limits.c,183 :: 		}else if(!TX0 && TX2)
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Debounce_X_Limits75
NOP	
J	L__Debounce_X_Limits40
NOP	
L__Debounce_X_Limits75:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__Debounce_X_Limits77
NOP	
J	L__Debounce_X_Limits39
NOP	
L__Debounce_X_Limits77:
L__Debounce_X_Limits34:
;Limits.c,184 :: 		TX2=0;
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,183 :: 		}else if(!TX0 && TX2)
L__Debounce_X_Limits40:
L__Debounce_X_Limits39:
;Limits.c,184 :: 		TX2=0;
L_Debounce_X_Limits13:
;Limits.c,186 :: 		if(Limits.X_Min_DeBnc > X_DEBOUNCE_COUNT)
LHU	R2, Offset(_Limits+36)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Debounce_X_Limits78
NOP	
J	L_Debounce_X_Limits17
NOP	
L__Debounce_X_Limits78:
;Limits.c,187 :: 		Reset_X_Min_Limit();
JAL	_Reset_X_Min_Limit+0
NOP	
L_Debounce_X_Limits17:
;Limits.c,189 :: 		}else if(X_Min_Limit){
J	L_Debounce_X_Limits18
NOP	
;Limits.c,173 :: 		if((!X_Min_Limit)&&(TX1)){
L__Debounce_X_Limits42:
L__Debounce_X_Limits41:
;Limits.c,189 :: 		}else if(X_Min_Limit){
_LX	
EXT	R2, R2, BitPos(X_Min_Limit+0), 1
BNE	R2, R0, L__Debounce_X_Limits80
NOP	
J	L_Debounce_X_Limits19
NOP	
L__Debounce_X_Limits80:
;Limits.c,190 :: 		Reset_X_Min_Debounce();
JAL	_Reset_X_Min_Debounce+0
NOP	
;Limits.c,191 :: 		}
L_Debounce_X_Limits19:
L_Debounce_X_Limits18:
;Limits.c,193 :: 		}
L_end_Debounce_X_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Debounce_X_Limits
_Debounce_Y_Limits:
;Limits.c,197 :: 		void Debounce_Y_Limits(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Limits.c,198 :: 		TY0 = (TMR.clock >> BASE_TMR)&1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R2, R2, 1
ANDI	R3, R2, 1
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R3, 4, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,199 :: 		TY1 = Test_Y_Min();
JAL	_Test_Y_Min+0
NOP	
LBU	R3, Offset(Limits_bits+0)(GP)
INS	R3, R2, 5, 1
SB	R3, Offset(Limits_bits+0)(GP)
;Limits.c,201 :: 		if((!Y_Min_Limit)&&(TY1)){
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
BEQ	R2, R0, L__Debounce_Y_Limits82
NOP	
J	L__Debounce_Y_Limits51
NOP	
L__Debounce_Y_Limits82:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__Debounce_Y_Limits84
NOP	
J	L__Debounce_Y_Limits50
NOP	
L__Debounce_Y_Limits84:
L__Debounce_Y_Limits45:
;Limits.c,202 :: 		if(TY0 && !TY2){
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__Debounce_Y_Limits86
NOP	
J	L__Debounce_Y_Limits47
NOP	
L__Debounce_Y_Limits86:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 6, 1
BEQ	R2, R0, L__Debounce_Y_Limits87
NOP	
J	L__Debounce_Y_Limits46
NOP	
L__Debounce_Y_Limits87:
L__Debounce_Y_Limits44:
;Limits.c,203 :: 		TY2 = 1;
LBU	R2, Offset(Limits_bits+0)(GP)
ORI	R2, R2, 64
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,204 :: 		Limits.Y_Min_DeBnc++;
LHU	R2, Offset(_Limits+38)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_Limits+38)(GP)
;Limits.c,206 :: 		dma_printf("LimitY:=%d \r\n",Limits.Y_Min_DeBnc);
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
;Limits.c,208 :: 		if(Limits.Y_Min_DeBnc > last_cntY_min){
LHU	R3, Offset(Limits_last_cntY_min+0)(GP)
LHU	R2, Offset(_Limits+38)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Debounce_Y_Limits88
NOP	
J	L_Debounce_Y_Limits26
NOP	
L__Debounce_Y_Limits88:
;Limits.c,209 :: 		last_cntY_min = Limits.Y_Min_DeBnc;
LHU	R2, Offset(_Limits+38)(GP)
SH	R2, Offset(Limits_last_cntY_min+0)(GP)
;Limits.c,210 :: 		}
L_Debounce_Y_Limits26:
;Limits.c,211 :: 		}else if(!TY0 && TY2)
J	L_Debounce_Y_Limits27
NOP	
;Limits.c,202 :: 		if(TY0 && !TY2){
L__Debounce_Y_Limits47:
L__Debounce_Y_Limits46:
;Limits.c,211 :: 		}else if(!TY0 && TY2)
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Debounce_Y_Limits89
NOP	
J	L__Debounce_Y_Limits49
NOP	
L__Debounce_Y_Limits89:
LBU	R2, Offset(Limits_bits+0)(GP)
EXT	R2, R2, 6, 1
BNE	R2, R0, L__Debounce_Y_Limits91
NOP	
J	L__Debounce_Y_Limits48
NOP	
L__Debounce_Y_Limits91:
L__Debounce_Y_Limits43:
;Limits.c,212 :: 		TY2=0;
LBU	R2, Offset(Limits_bits+0)(GP)
INS	R2, R0, 6, 1
SB	R2, Offset(Limits_bits+0)(GP)
;Limits.c,211 :: 		}else if(!TY0 && TY2)
L__Debounce_Y_Limits49:
L__Debounce_Y_Limits48:
;Limits.c,212 :: 		TY2=0;
L_Debounce_Y_Limits27:
;Limits.c,214 :: 		if(Limits.Y_Min_DeBnc > Y_DEBOUNCE_COUNT)
LHU	R2, Offset(_Limits+38)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__Debounce_Y_Limits92
NOP	
J	L_Debounce_Y_Limits31
NOP	
L__Debounce_Y_Limits92:
;Limits.c,215 :: 		Reset_Y_Min_Limit();
JAL	_Reset_Y_Min_Limit+0
NOP	
L_Debounce_Y_Limits31:
;Limits.c,217 :: 		}else if(Y_Min_Limit){
J	L_Debounce_Y_Limits32
NOP	
;Limits.c,201 :: 		if((!Y_Min_Limit)&&(TY1)){
L__Debounce_Y_Limits51:
L__Debounce_Y_Limits50:
;Limits.c,217 :: 		}else if(Y_Min_Limit){
_LX	
EXT	R2, R2, BitPos(Y_Min_Limit+0), 1
BNE	R2, R0, L__Debounce_Y_Limits94
NOP	
J	L_Debounce_Y_Limits33
NOP	
L__Debounce_Y_Limits94:
;Limits.c,218 :: 		Reset_Y_Min_Debounce();
JAL	_Reset_Y_Min_Debounce+0
NOP	
;Limits.c,219 :: 		}
L_Debounce_Y_Limits33:
L_Debounce_Y_Limits32:
;Limits.c,220 :: 		}
L_end_Debounce_Y_Limits:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Debounce_Y_Limits
