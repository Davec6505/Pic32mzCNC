_read_float:
;Nut_Bolts.c,14 :: 		int read_float(char *line, uint8_t *char_counter, float *float_ptr)
ADDIU	SP, SP, -4
;Nut_Bolts.c,17 :: 		char *ptr = line + *char_counter;
LBU	R2, 0(R26)
ANDI	R2, R2, 255
ADDU	R2, R25, R2
; ptr start address is: 32 (R8)
MOVZ	R8, R2, R0
;Nut_Bolts.c,20 :: 		long intval = 0;
; intval start address is: 16 (R4)
MOVZ	R4, R0, R0
;Nut_Bolts.c,21 :: 		short exp = 0;
; exp start address is: 20 (R5)
MOVZ	R5, R0, R0
;Nut_Bolts.c,22 :: 		char ndigit = 0;
; ndigit start address is: 24 (R6)
MOVZ	R6, R0, R0
;Nut_Bolts.c,25 :: 		isnegative = isdecimal = false;
LBU	R2, 1(SP)
INS	R2, R0, 1, 1
SB	R2, 1(SP)
LBU	R2, 1(SP)
EXT	R3, R2, 1, 1
LBU	R2, 1(SP)
INS	R2, R3, 0, 1
SB	R2, 1(SP)
;Nut_Bolts.c,28 :: 		c = *ptr++;
LBU	R3, 0(R8)
; c start address is: 28 (R7)
ANDI	R7, R3, 255
ADDIU	R2, R8, 1
MOVZ	R8, R2, R0
;Nut_Bolts.c,31 :: 		isnegative = false;
LBU	R2, 1(SP)
INS	R2, R0, 0, 1
SB	R2, 1(SP)
;Nut_Bolts.c,32 :: 		if (c == '-') {
ANDI	R3, R3, 255
ORI	R2, R0, 45
BEQ	R3, R2, L__read_float39
NOP	
J	L_read_float0
NOP	
L__read_float39:
; c end address is: 28 (R7)
;Nut_Bolts.c,33 :: 		isnegative = true;
LBU	R2, 1(SP)
ORI	R2, R2, 1
SB	R2, 1(SP)
;Nut_Bolts.c,34 :: 		c = *ptr++;
LBU	R2, 0(R8)
; c start address is: 12 (R3)
ANDI	R3, R2, 255
ADDIU	R2, R8, 1
; ptr end address is: 32 (R8)
; ptr start address is: 8 (R2)
;Nut_Bolts.c,35 :: 		} else if (c == '+') {
; c end address is: 12 (R3)
; ptr end address is: 8 (R2)
J	L_read_float1
NOP	
L_read_float0:
; ptr start address is: 32 (R8)
; c start address is: 28 (R7)
ANDI	R3, R7, 255
ORI	R2, R0, 43
BEQ	R3, R2, L__read_float40
NOP	
J	L__read_float32
NOP	
L__read_float40:
; c end address is: 28 (R7)
;Nut_Bolts.c,36 :: 		c = *ptr++;
LBU	R2, 0(R8)
; c start address is: 12 (R3)
ANDI	R3, R2, 255
ADDIU	R2, R8, 1
; ptr end address is: 32 (R8)
; ptr start address is: 28 (R7)
MOVZ	R7, R2, R0
; ptr end address is: 28 (R7)
; c end address is: 12 (R3)
ANDI	R2, R3, 255
MOVZ	R3, R7, R0
;Nut_Bolts.c,37 :: 		}
J	L_read_float2
NOP	
L__read_float32:
;Nut_Bolts.c,35 :: 		} else if (c == '+') {
MOVZ	R3, R8, R0
ANDI	R2, R7, 255
;Nut_Bolts.c,37 :: 		}
L_read_float2:
; ptr start address is: 12 (R3)
; c start address is: 8 (R2)
SB	R2, 0(SP)
; c end address is: 8 (R2)
; ptr end address is: 12 (R3)
MOVZ	R2, R3, R0
LBU	R3, 0(SP)
L_read_float1:
;Nut_Bolts.c,40 :: 		while(1) {
; c start address is: 12 (R3)
; ptr start address is: 8 (R2)
SB	R6, 0(SP)
; intval end address is: 16 (R4)
; ndigit end address is: 24 (R6)
; c end address is: 12 (R3)
; exp end address is: 20 (R5)
; ptr end address is: 8 (R2)
MOVZ	R7, R4, R0
MOVZ	R4, R2, R0
SEB	R6, R5
LBU	R5, 0(SP)
L_read_float3:
;Nut_Bolts.c,41 :: 		c -= '0';
; ptr start address is: 16 (R4)
; c start address is: 12 (R3)
; ndigit start address is: 20 (R5)
; exp start address is: 24 (R6)
; intval start address is: 28 (R7)
ADDIU	R2, R3, -48
; c end address is: 12 (R3)
; c start address is: 32 (R8)
ANDI	R8, R2, 255
;Nut_Bolts.c,42 :: 		if (c <= 9) {
ANDI	R2, R2, 255
SLTIU	R2, R2, 10
BNE	R2, R0, L__read_float41
NOP	
J	L_read_float5
NOP	
L__read_float41:
;Nut_Bolts.c,43 :: 		ndigit++;
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;Nut_Bolts.c,44 :: 		if (ndigit <= MAX_INT_DIGITS) {
ANDI	R2, R2, 255
SLTIU	R2, R2, 9
BNE	R2, R0, L__read_float42
NOP	
J	L_read_float6
NOP	
L__read_float42:
;Nut_Bolts.c,45 :: 		if (isdecimal) { exp--; }
LBU	R2, 1(SP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__read_float44
NOP	
J	L__read_float33
NOP	
L__read_float44:
ADDIU	R2, R6, -1
SEB	R6, R2
; exp end address is: 24 (R6)
J	L_read_float7
NOP	
L__read_float33:
L_read_float7:
;Nut_Bolts.c,46 :: 		intval = (((intval << 2) + intval) << 1) + c; // intval*10 + c
; exp start address is: 24 (R6)
SLL	R2, R7, 2
ADDU	R2, R2, R7
; intval end address is: 28 (R7)
SLL	R3, R2, 1
ANDI	R2, R8, 255
; c end address is: 32 (R8)
ADDU	R2, R3, R2
; intval start address is: 8 (R2)
;Nut_Bolts.c,47 :: 		} else {
MOVZ	R7, R2, R0
; intval end address is: 8 (R2)
J	L_read_float8
NOP	
L_read_float6:
;Nut_Bolts.c,48 :: 		if (!(isdecimal)) { exp++; }  // Drop overflow digits
; intval start address is: 28 (R7)
LBU	R2, 1(SP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__read_float45
NOP	
J	L__read_float34
NOP	
L__read_float45:
ADDIU	R2, R6, 1
; exp end address is: 24 (R6)
; exp start address is: 12 (R3)
SEB	R3, R2
; exp end address is: 12 (R3)
SEB	R6, R3
J	L_read_float9
NOP	
L__read_float34:
L_read_float9:
;Nut_Bolts.c,49 :: 		}
; exp start address is: 24 (R6)
; intval end address is: 28 (R7)
; exp end address is: 24 (R6)
L_read_float8:
;Nut_Bolts.c,50 :: 		} else if (c == (('.'-'0') & 0xff)  &&  !(isdecimal)) {
; exp start address is: 24 (R6)
; intval start address is: 28 (R7)
J	L_read_float10
NOP	
L_read_float5:
; c start address is: 32 (R8)
ANDI	R3, R8, 255
; c end address is: 32 (R8)
ORI	R2, R0, 254
BEQ	R3, R2, L__read_float46
NOP	
J	L__read_float31
NOP	
L__read_float46:
LBU	R2, 1(SP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__read_float47
NOP	
J	L__read_float30
NOP	
L__read_float47:
L__read_float29:
;Nut_Bolts.c,51 :: 		isdecimal = true;
LBU	R2, 1(SP)
ORI	R2, R2, 2
SB	R2, 1(SP)
;Nut_Bolts.c,52 :: 		} else {
J	L_read_float14
NOP	
;Nut_Bolts.c,50 :: 		} else if (c == (('.'-'0') & 0xff)  &&  !(isdecimal)) {
L__read_float31:
L__read_float30:
;Nut_Bolts.c,53 :: 		break;
J	L_read_float4
NOP	
;Nut_Bolts.c,54 :: 		}
L_read_float14:
; exp end address is: 24 (R6)
; ndigit end address is: 20 (R5)
L_read_float10:
; intval end address is: 28 (R7)
;Nut_Bolts.c,55 :: 		c = *ptr++;
; intval start address is: 28 (R7)
; exp start address is: 24 (R6)
; ndigit start address is: 20 (R5)
LBU	R2, 0(R4)
; c start address is: 12 (R3)
ANDI	R3, R2, 255
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Nut_Bolts.c,56 :: 		}
; c end address is: 12 (R3)
J	L_read_float3
NOP	
L_read_float4:
;Nut_Bolts.c,59 :: 		if (!ndigit) { return(false); };
BEQ	R5, R0, L__read_float48
NOP	
J	L_read_float15
NOP	
L__read_float48:
; intval end address is: 28 (R7)
; exp end address is: 24 (R6)
; ndigit end address is: 20 (R5)
; ptr end address is: 16 (R4)
MOVZ	R2, R0, R0
J	L_end_read_float
NOP	
L_read_float15:
;Nut_Bolts.c,63 :: 		fval = (float)intval;
; ptr start address is: 16 (R4)
; exp start address is: 24 (R6)
; intval start address is: 28 (R7)
MTC1	R7, S0
; intval end address is: 28 (R7)
CVT32.W 	S1, S0
; fval start address is: 16 (R4)
MOV.S 	S2, S1
;Nut_Bolts.c,67 :: 		if (fval != 0) {
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__read_float49
NOP	
J	L__read_float37
NOP	
L__read_float49:
; exp end address is: 24 (R6)
; ptr end address is: 16 (R4)
; fval end address is: 16 (R4)
MOVZ	R3, R4, R0
SEB	R5, R6
MOV.S 	S1, S2
;Nut_Bolts.c,68 :: 		while (exp <= -2) {
L_read_float17:
; fval start address is: 8 (R2)
; exp start address is: 20 (R5)
; ptr start address is: 12 (R3)
SEB	R2, R5
SLTI	R2, R2, -1
BNE	R2, R0, L__read_float50
NOP	
J	L_read_float18
NOP	
L__read_float50:
;Nut_Bolts.c,69 :: 		fval *= 0.01;
LUI	R2, 15395
ORI	R2, R2, 55050
MTC1	R2, S0
MUL.S 	S0, S1, S0
MOV.S 	S1, S0
;Nut_Bolts.c,70 :: 		exp += 2;
ADDIU	R2, R5, 2
ANDI	R5, R2, 255
;Nut_Bolts.c,71 :: 		}
J	L_read_float17
NOP	
L_read_float18:
;Nut_Bolts.c,72 :: 		if (exp < 0) {
SEB	R2, R5
SLTI	R2, R2, 0
BNE	R2, R0, L__read_float51
NOP	
J	L_read_float19
NOP	
L__read_float51:
; exp end address is: 20 (R5)
;Nut_Bolts.c,73 :: 		fval *= 0.1;
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
MUL.S 	S0, S1, S0
; fval end address is: 8 (R2)
; fval start address is: 0 (R0)
;Nut_Bolts.c,74 :: 		} else if (exp > 0) {
MOVZ	R2, R3, R0
; fval end address is: 0 (R0)
J	L_read_float20
NOP	
L_read_float19:
; fval start address is: 8 (R2)
; exp start address is: 20 (R5)
SEB	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__read_float52
NOP	
J	L__read_float36
NOP	
L__read_float52:
; exp end address is: 20 (R5)
SEB	R4, R5
;Nut_Bolts.c,75 :: 		do {
J	L_read_float22
NOP	
L__read_float35:
;Nut_Bolts.c,77 :: 		} while (--exp > 0);
;Nut_Bolts.c,75 :: 		do {
L_read_float22:
;Nut_Bolts.c,76 :: 		fval *= 10.0;
; ptr start address is: 12 (R3)
; exp start address is: 16 (R4)
; ptr end address is: 12 (R3)
; exp start address is: 16 (R4)
; fval start address is: 8 (R2)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
MOV.S 	S1, S0
; fval end address is: 8 (R2)
;Nut_Bolts.c,77 :: 		} while (--exp > 0);
ADDIU	R2, R4, -1
SEB	R4, R2
; exp end address is: 16 (R4)
SEB	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__read_float53
NOP	
J	L__read_float35
NOP	
L__read_float53:
; exp end address is: 16 (R4)
; fval end address is: 8 (R2)
; ptr end address is: 12 (R3)
MOV.S 	S0, S1
MOVZ	R2, R3, R0
;Nut_Bolts.c,78 :: 		}
J	L_read_float21
NOP	
L__read_float36:
;Nut_Bolts.c,74 :: 		} else if (exp > 0) {
MOV.S 	S0, S1
MOVZ	R2, R3, R0
;Nut_Bolts.c,78 :: 		}
L_read_float21:
; ptr start address is: 8 (R2)
; fval start address is: 0 (R0)
; fval end address is: 0 (R0)
; ptr end address is: 8 (R2)
L_read_float20:
;Nut_Bolts.c,79 :: 		}
; fval start address is: 0 (R0)
; ptr start address is: 8 (R2)
MOVZ	R3, R2, R0
; fval end address is: 0 (R0)
; ptr end address is: 8 (R2)
MOV.S 	S1, S0
J	L_read_float16
NOP	
L__read_float37:
;Nut_Bolts.c,67 :: 		if (fval != 0) {
MOV.S 	S1, S2
MOVZ	R3, R4, R0
;Nut_Bolts.c,79 :: 		}
L_read_float16:
;Nut_Bolts.c,82 :: 		if (isnegative) {
; fval start address is: 8 (R2)
; ptr start address is: 12 (R3)
LBU	R2, 1(SP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__read_float55
NOP	
J	L_read_float25
NOP	
L__read_float55:
;Nut_Bolts.c,83 :: 		*float_ptr = -fval;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; fval end address is: 8 (R2)
SWC1	S0, 0(R27)
;Nut_Bolts.c,84 :: 		} else {
J	L_read_float26
NOP	
L_read_float25:
;Nut_Bolts.c,85 :: 		*float_ptr = fval;
; fval start address is: 8 (R2)
SWC1	S1, 0(R27)
; fval end address is: 8 (R2)
;Nut_Bolts.c,86 :: 		}
L_read_float26:
;Nut_Bolts.c,88 :: 		*char_counter = ptr - line - 1; // Set char_counter to next statement
SUBU	R2, R3, R25
; ptr end address is: 12 (R3)
ADDIU	R2, R2, -1
SB	R2, 0(R26)
;Nut_Bolts.c,90 :: 		return(true);
ORI	R2, R0, 1
;Nut_Bolts.c,91 :: 		}
L_end_read_float:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _read_float
_flt2ulong:
;Nut_Bolts.c,94 :: 		unsigned long flt2ulong(float f_){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SWC1	S12, 20(SP)
;Nut_Bolts.c,95 :: 		unsigned long ul_ = 0;
MOVZ	R30, R0, R0
SW	R30, 16(SP)
;Nut_Bolts.c,96 :: 		memcpy(&ul_,&f_,sizeof(float));
ADDIU	R3, SP, 20
ADDIU	R2, SP, 16
ORI	R27, R0, 4
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Nut_Bolts.c,98 :: 		return ul_;
LW	R2, 16(SP)
;Nut_Bolts.c,99 :: 		}
;Nut_Bolts.c,98 :: 		return ul_;
;Nut_Bolts.c,99 :: 		}
L_end_flt2ulong:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _flt2ulong
_ulong2flt:
;Nut_Bolts.c,102 :: 		float ulong2flt(unsigned long ul_){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R25, 20(SP)
;Nut_Bolts.c,103 :: 		float f_ = 0.0;
MOVZ	R30, R0, R0
SW	R30, 16(SP)
;Nut_Bolts.c,104 :: 		memcpy(&f_,&ul_,sizeof(unsigned long ));
ADDIU	R3, SP, 20
ADDIU	R2, SP, 16
ORI	R27, R0, 4
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Nut_Bolts.c,106 :: 		return f_;
LWC1	S0, 16(SP)
;Nut_Bolts.c,107 :: 		}
;Nut_Bolts.c,106 :: 		return f_;
;Nut_Bolts.c,107 :: 		}
L_end_ulong2flt:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ulong2flt
_round:
;Nut_Bolts.c,110 :: 		int round(double val){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Nut_Bolts.c,111 :: 		double temp = 0.00,tempC = 0.00,tempF = 0.00,dec = 0.00;
;Nut_Bolts.c,112 :: 		tempC = ceil(val);
JAL	_ceil+0
NOP	
SWC1	S0, 8(SP)
;Nut_Bolts.c,113 :: 		tempF = floor(val);
JAL	_floor+0
NOP	
; tempF start address is: 16 (R4)
MOV.S 	S2, S0
;Nut_Bolts.c,114 :: 		dec = val - tempF;
SUB.S 	S1, S12, S0
;Nut_Bolts.c,115 :: 		temp = (dec > 0.5)? tempC : tempF;
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S1, S0
BC1F	0, L__round59
NOP	
J	L_round27
NOP	
L__round59:
; tempF end address is: 16 (R4)
LWC1	S0, 8(SP)
SWC1	S0, 4(SP)
J	L_round28
NOP	
L_round27:
; tempF start address is: 16 (R4)
SWC1	S2, 4(SP)
; tempF end address is: 16 (R4)
L_round28:
;Nut_Bolts.c,116 :: 		return (int)temp;
LWC1	S0, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
;Nut_Bolts.c,117 :: 		}
L_end_round:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _round
