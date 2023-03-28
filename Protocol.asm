_Init_Protocol:
;Protocol.c,35 :: 		void Init_Protocol(){
;Protocol.c,36 :: 		startup = 0;
SB	R0, Offset(-1610603008)(GP)
;Protocol.c,37 :: 		}
L_end_Init_Protocol:
JR	RA
NOP	
; end of _Init_Protocol
_Str_Initialize:
;Protocol.c,40 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,42 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize228
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize228:
;Protocol.c,43 :: 		memset(arg[i],0,str_size);
SEH	R2, R5
SLL	R2, R2, 6
ADDU	R2, R25, R2
SW	R25, 12(SP)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 12(SP)
;Protocol.c,42 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,44 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,45 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,47 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,48 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,49 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
Protocol_strsplit:
;Protocol.c,54 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,56 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,57 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,58 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,59 :: 		for (i = 0; i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_strsplit3:
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
; lasti start address is: 28 (R7)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit231
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit231:
;Protocol.c,60 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,61 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit233
NOP	
J	L_Protocol_strsplit178
NOP	
L_Protocol_strsplit233:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit235
NOP	
J	L_Protocol_strsplit177
NOP	
L_Protocol_strsplit235:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit236
NOP	
J	L_Protocol_strsplit176
NOP	
L_Protocol_strsplit236:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit178:
L_Protocol_strsplit177:
L_Protocol_strsplit176:
;Protocol.c,62 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,63 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,64 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,65 :: 		continue;
J	L_Protocol_strsplit5
NOP	
;Protocol.c,66 :: 		}else{
L_Protocol_strsplit8:
;Protocol.c,67 :: 		arg[kk][ii++] = *(str+i);
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R8, 1
SEH	R8, R2
;Protocol.c,69 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit237
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit237:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,70 :: 		break;
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit10:
;Protocol.c,71 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit5:
;Protocol.c,59 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,71 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit3
NOP	
L_Protocol_strsplit4:
;Protocol.c,72 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,73 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,74 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,79 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,81 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,82 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,85 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,86 :: 		for (i = 0;i < len;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
L_Protocol_strsplit211:
; i start address is: 20 (R5)
; track_char start address is: 24 (R6)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti start address is: 32 (R8)
; len start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_strsplit2239
NOP	
J	L_Protocol_strsplit2193
NOP	
L_Protocol_strsplit2239:
;Protocol.c,87 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,88 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2241
NOP	
J	L_Protocol_strsplit2184
NOP	
L_Protocol_strsplit2241:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2243
NOP	
J	L_Protocol_strsplit2183
NOP	
L_Protocol_strsplit2243:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2244
NOP	
J	L_Protocol_strsplit2182
NOP	
L_Protocol_strsplit2244:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2184:
L_Protocol_strsplit2183:
L_Protocol_strsplit2182:
;Protocol.c,89 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
; kk end address is: 28 (R7)
; kk start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,90 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,91 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,92 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,93 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit213
NOP	
;Protocol.c,94 :: 		}else{
L_Protocol_strsplit216:
;Protocol.c,95 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2245
NOP	
J	L_Protocol_strsplit2191
NOP	
L_Protocol_strsplit2245:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2247
NOP	
J	L_Protocol_strsplit2192
NOP	
L_Protocol_strsplit2247:
L_Protocol_strsplit2180:
;Protocol.c,96 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2248
NOP	
J	L_Protocol_strsplit2189
NOP	
L_Protocol_strsplit2248:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2249
NOP	
J	L_Protocol_strsplit2190
NOP	
L_Protocol_strsplit2249:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2179:
;Protocol.c,97 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,98 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,99 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,96 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2186
NOP	
L_Protocol_strsplit2189:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2186:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2185
NOP	
L_Protocol_strsplit2190:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2185:
;Protocol.c,95 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2188
NOP	
L_Protocol_strsplit2191:
L_Protocol_strsplit2188:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2187
NOP	
L_Protocol_strsplit2192:
L_Protocol_strsplit2187:
;Protocol.c,102 :: 		arg[kk][ii++] = *(str+i);
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
; lasti start address is: 32 (R8)
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R9, 1
; ii end address is: 36 (R9)
; ii start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,104 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2250
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2250:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,105 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit224:
;Protocol.c,106 :: 		}
; i start address is: 20 (R5)
; lasti start address is: 32 (R8)
; track_char start address is: 24 (R6)
; ii start address is: 12 (R3)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; kk end address is: 28 (R7)
SEH	R9, R3
; len start address is: 16 (R4)
L_Protocol_strsplit213:
;Protocol.c,86 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,106 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit2193:
;Protocol.c,86 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,106 :: 		}
L_Protocol_strsplit212:
;Protocol.c,107 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,108 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,109 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,113 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,116 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,117 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,119 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,120 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str25:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str253
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str253:
;Protocol.c,121 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,122 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,123 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str25
NOP	
L_Protocol_cpy_val_from_str26:
;Protocol.c,124 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,126 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,127 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,132 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,134 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,136 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,138 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int27:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int255
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int255:
;Protocol.c,139 :: 		result = result * base + ( *(str+i) - 0x30 );
LH	R2, 14(SP)
MUL	R3, R2, R26
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -48
ADDU	R2, R3, R2
SH	R2, 14(SP)
; i end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,140 :: 		while(DMA_IsOn(1));
L_Protocol_str2int30:
; i start address is: 12 (R3)
SH	R3, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R3, 4(SP)
BNE	R2, R0, L_Protocol_str2int257
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int257:
J	L_Protocol_str2int30
NOP	
L_Protocol_str2int31:
;Protocol.c,138 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,141 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int27
NOP	
L_Protocol_str2int28:
;Protocol.c,143 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,144 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,163 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,164 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+26)(GP)
BNE	R2, R0, L__protocol_execute_runtime260
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime260:
;Protocol.c,165 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+26)(GP)
;Protocol.c,170 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime262
NOP	
J	L__protocol_execute_runtime195
NOP	
L__protocol_execute_runtime262:
;Protocol.c,171 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,174 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime264
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime264:
;Protocol.c,175 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,176 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,177 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,178 :: 		do {
J	L_protocol_execute_runtime35
NOP	
L__protocol_execute_runtime194:
;Protocol.c,182 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,178 :: 		do {
L_protocol_execute_runtime35:
;Protocol.c,182 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime266
NOP	
J	L__protocol_execute_runtime194
NOP	
L__protocol_execute_runtime266:
; rt_exec end address is: 12 (R3)
;Protocol.c,185 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime38
NOP	
L_protocol_execute_runtime34:
;Protocol.c,189 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,190 :: 		}
L_protocol_execute_runtime38:
;Protocol.c,191 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,192 :: 		}
J	L_protocol_execute_runtime33
NOP	
L__protocol_execute_runtime195:
;Protocol.c,170 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,192 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,195 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime268
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime268:
; rt_exec end address is: 16 (R4)
;Protocol.c,196 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,197 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,198 :: 		}
L_protocol_execute_runtime39:
;Protocol.c,201 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime270
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime270:
;Protocol.c,202 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,203 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,204 :: 		}
L_protocol_execute_runtime40:
;Protocol.c,207 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime272
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime272:
;Protocol.c,209 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,210 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,214 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime274
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime274:
;Protocol.c,216 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,217 :: 		}
L_protocol_execute_runtime42:
;Protocol.c,219 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime276
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime276:
;Protocol.c,221 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime278
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime278:
;Protocol.c,222 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,223 :: 		}
L_protocol_execute_runtime44:
;Protocol.c,224 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,225 :: 		}
L_protocol_execute_runtime43:
;Protocol.c,226 :: 		}
L_protocol_execute_runtime32:
;Protocol.c,230 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,234 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,238 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check281
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check281:
;Protocol.c,251 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,254 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,255 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,256 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check283
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check283:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check46:
;Protocol.c,266 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check284
NOP	
J	L__protocol_system_check198
NOP	
L__protocol_system_check284:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check286
NOP	
J	L__protocol_system_check197
NOP	
L__protocol_system_check286:
L__protocol_system_check196:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check198:
L__protocol_system_check197:
;Protocol.c,270 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check287
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check287:
;Protocol.c,271 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,272 :: 		} else {
J	L_protocol_system_check51
NOP	
L_protocol_system_check50:
;Protocol.c,274 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,276 :: 		}
L_protocol_system_check51:
;Protocol.c,277 :: 		}
L_protocol_system_check45:
;Protocol.c,278 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
_Sample_Gocde_Line:
;Protocol.c,283 :: 		int Sample_Gocde_Line(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Protocol.c,288 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,289 :: 		if(dif <= 0){
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__Sample_Gocde_Line289
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line289:
; dif end address is: 16 (R4)
;Protocol.c,297 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line291
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line291:
;Protocol.c,298 :: 		char *ptr = (char*)RXBUFF;
; ptr start address is: 16 (R4)
LUI	R30, 40960
ORI	R30, R30, 8192
MOVZ	R4, R30, R0
;Protocol.c,299 :: 		if(*ptr == '?' || *ptr == '~' || *ptr == '!' || *ptr == 0x18){
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Gocde_Line293
NOP	
J	L__Sample_Gocde_Line225
NOP	
L__Sample_Gocde_Line293:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Gocde_Line295
NOP	
J	L__Sample_Gocde_Line224
NOP	
L__Sample_Gocde_Line295:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Gocde_Line297
NOP	
J	L__Sample_Gocde_Line223
NOP	
L__Sample_Gocde_Line297:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Gocde_Line299
NOP	
J	L__Sample_Gocde_Line222
NOP	
L__Sample_Gocde_Line299:
; ptr end address is: 16 (R4)
J	L_Sample_Gocde_Line56
NOP	
L__Sample_Gocde_Line225:
; ptr start address is: 16 (R4)
L__Sample_Gocde_Line224:
L__Sample_Gocde_Line223:
L__Sample_Gocde_Line222:
;Protocol.c,300 :: 		Do_Critical_Msg(*ptr);
LBU	R25, 0(R4)
; ptr end address is: 16 (R4)
JAL	Protocol_Do_Critical_Msg+0
NOP	
;Protocol.c,301 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,303 :: 		}
L_Sample_Gocde_Line56:
;Protocol.c,304 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,305 :: 		}else{
J	L_Sample_Gocde_Line57
NOP	
L_Sample_Gocde_Line52:
;Protocol.c,307 :: 		int msg_type= 0;
; dif start address is: 16 (R4)
;Protocol.c,308 :: 		int modal_response = 0;
;Protocol.c,309 :: 		state = STATUS_OK;
SH	R0, 78(SP)
;Protocol.c,312 :: 		Str_clear(str,64);
ADDIU	R2, SP, 14
SH	R4, 12(SP)
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R4, 12(SP)
;Protocol.c,315 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R4, 12(SP)
;Protocol.c,318 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(-1610603008)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line300
NOP	
J	L_Sample_Gocde_Line58
NOP	
L__Sample_Gocde_Line300:
;Protocol.c,319 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
;Protocol.c,320 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,321 :: 		}//else if(bit_istrue(startup,bit(START_MSG))){
L_Sample_Gocde_Line58:
;Protocol.c,324 :: 		if(str[0] == '?')return state;
; dif start address is: 16 (R4)
ADDIU	R2, SP, 14
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line301
NOP	
J	L_Sample_Gocde_Line59
NOP	
L__Sample_Gocde_Line301:
; dif end address is: 16 (R4)
LH	R2, 78(SP)
J	L_end_Sample_Gocde_Line
NOP	
L_Sample_Gocde_Line59:
;Protocol.c,327 :: 		state = Check_Query_Type(str,dif);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
LH	R4, 12(SP)
SH	R2, 78(SP)
;Protocol.c,330 :: 		if(state == STATUS_COMMAND_EXECUTE_MOTION){
SEH	R3, R2
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Gocde_Line302
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line302:
;Protocol.c,331 :: 		state = Do_Gcode(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Gcode+0
NOP	
SH	R2, 78(SP)
;Protocol.c,332 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
;Protocol.c,337 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,338 :: 		}
L_Sample_Gocde_Line57:
;Protocol.c,339 :: 		return state;
LH	R2, 78(SP)
;Protocol.c,341 :: 		}
;Protocol.c,339 :: 		return state;
;Protocol.c,341 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,346 :: 		static void Do_Startup_Msg(char *str_,int dif_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,347 :: 		char *temp_str = str_;//if more than 6 chars sent here ????
; temp_str start address is: 16 (R4)
MOVZ	R4, R25, R0
;Protocol.c,350 :: 		for(i = 0;i <= dif_;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Protocol_Do_Startup_Msg61:
; i start address is: 20 (R5)
; temp_str start address is: 16 (R4)
; temp_str end address is: 16 (R4)
SEH	R3, R5
SEH	R2, R26
SLT	R2, R2, R3
BEQ	R2, R0, L_Protocol_Do_Startup_Msg304
NOP	
J	L_Protocol_Do_Startup_Msg62
NOP	
L_Protocol_Do_Startup_Msg304:
; temp_str end address is: 16 (R4)
;Protocol.c,351 :: 		if(temp_str[i] == '?'){
; temp_str start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg305
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg305:
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
;Protocol.c,352 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(-1610603008)(GP)
ORI	R2, R2, 1
SB	R2, Offset(-1610603008)(GP)
;Protocol.c,353 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,354 :: 		break;
J	L_Protocol_Do_Startup_Msg62
NOP	
;Protocol.c,355 :: 		}
L_Protocol_Do_Startup_Msg64:
;Protocol.c,350 :: 		for(i = 0;i <= dif_;i++){
; i start address is: 20 (R5)
; temp_str start address is: 16 (R4)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,356 :: 		}
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Protocol_Do_Startup_Msg61
NOP	
L_Protocol_Do_Startup_Msg62:
;Protocol.c,357 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,358 :: 		SV.homed = false; //release homed
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,359 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
Protocol_Do_Critical_Msg:
;Protocol.c,363 :: 		static void Do_Critical_Msg(char ch_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,368 :: 		switch(ch_){
J	L_Protocol_Do_Critical_Msg65
NOP	
;Protocol.c,369 :: 		case CMD_STATUS_REPORT: sys.execute |= EXEC_STATUS_REPORT; break; // Set as true
L_Protocol_Do_Critical_Msg67:
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+26)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,370 :: 		case CMD_CYCLE_START:   sys.execute |= EXEC_CYCLE_START; break; // Set as true
L_Protocol_Do_Critical_Msg68:
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+26)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,371 :: 		case CMD_FEED_HOLD:     sys.execute |= EXEC_FEED_HOLD; break; // Set as true
L_Protocol_Do_Critical_Msg69:
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+26)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,372 :: 		case CMD_RESET:         mc_reset(); break; // Call motion control reset routine.
L_Protocol_Do_Critical_Msg70:
JAL	_mc_reset+0
NOP	
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,373 :: 		default: break;
L_Protocol_Do_Critical_Msg71:
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,374 :: 		}
L_Protocol_Do_Critical_Msg65:
ANDI	R3, R25, 255
ORI	R2, R0, 63
BNE	R3, R2, L_Protocol_Do_Critical_Msg308
NOP	
J	L_Protocol_Do_Critical_Msg67
NOP	
L_Protocol_Do_Critical_Msg308:
ANDI	R3, R25, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Do_Critical_Msg310
NOP	
J	L_Protocol_Do_Critical_Msg68
NOP	
L_Protocol_Do_Critical_Msg310:
ANDI	R3, R25, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Do_Critical_Msg312
NOP	
J	L_Protocol_Do_Critical_Msg69
NOP	
L_Protocol_Do_Critical_Msg312:
ANDI	R3, R25, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Do_Critical_Msg314
NOP	
J	L_Protocol_Do_Critical_Msg70
NOP	
L_Protocol_Do_Critical_Msg314:
J	L_Protocol_Do_Critical_Msg71
NOP	
L_Protocol_Do_Critical_Msg66:
;Protocol.c,375 :: 		}
L_end_Do_Critical_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Critical_Msg
Protocol_Check_Query_Type:
;Protocol.c,379 :: 		static int Check_Query_Type(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,387 :: 		if(str_[0] == '$'){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type316
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type316:
;Protocol.c,388 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type73
NOP	
;Protocol.c,389 :: 		case '\r' :case '\n' :
L_Protocol_Check_Query_Type75:
L_Protocol_Check_Query_Type76:
;Protocol.c,390 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,391 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,392 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,393 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type77:
;Protocol.c,394 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,395 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,396 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,397 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type78:
;Protocol.c,398 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,399 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,400 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,401 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type79:
;Protocol.c,402 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,403 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,404 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,405 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type80:
;Protocol.c,406 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,414 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type317
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type317:
;Protocol.c,415 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,416 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,417 :: 		} else {
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type81:
;Protocol.c,418 :: 		if (sys.state) { status = STATUS_IDLE_ERROR; }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type319
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type319:
ORI	R2, R0, 11
SH	R2, 24(SP)
L_Protocol_Check_Query_Type83:
;Protocol.c,419 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,420 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,421 :: 		}
L_Protocol_Check_Query_Type82:
;Protocol.c,422 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,423 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type84:
;Protocol.c,424 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type320
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type320:
;Protocol.c,425 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,426 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,428 :: 		}
L_Protocol_Check_Query_Type85:
;Protocol.c,429 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,430 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,431 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type86:
;Protocol.c,432 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,433 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L_Protocol_Check_Query_Type322
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type322:
;Protocol.c,434 :: 		int axis_to_home = 0;
;Protocol.c,437 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type324
NOP	
J	L_Protocol_Check_Query_Type204
NOP	
L_Protocol_Check_Query_Type324:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type326
NOP	
J	L_Protocol_Check_Query_Type203
NOP	
L_Protocol_Check_Query_Type326:
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type204:
L_Protocol_Check_Query_Type203:
;Protocol.c,438 :: 		int i = 0;
;Protocol.c,439 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,442 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,443 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Protocol_Check_Query_Type91:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 5
BNE	R2, R0, L_Protocol_Check_Query_Type327
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type327:
;Protocol.c,444 :: 		Set_Axisword(i);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,443 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,444 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type92:
;Protocol.c,447 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type329
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type329:
;Protocol.c,448 :: 		status = ALARM_ABORT_CYCLE;
ORI	R2, R0, 65534
SH	R2, 24(SP)
;Protocol.c,449 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,450 :: 		}
L_Protocol_Check_Query_Type94:
;Protocol.c,451 :: 		} else {
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type90:
;Protocol.c,452 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 24(SP)
;Protocol.c,453 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,454 :: 		}
L_Protocol_Check_Query_Type95:
;Protocol.c,455 :: 		} else {
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type87:
;Protocol.c,456 :: 		status = STATUS_SETTING_DISABLED;
ORI	R2, R0, 7
SH	R2, 24(SP)
;Protocol.c,457 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,458 :: 		}
L_Protocol_Check_Query_Type96:
;Protocol.c,461 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,462 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,463 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type97:
;Protocol.c,464 :: 		if ( str_[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type330
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type330:
;Protocol.c,465 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type99:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type331
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type331:
;Protocol.c,466 :: 		if ((settings_read_startup_line(helper_var, str_))) {
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type333
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type333:
;Protocol.c,467 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,468 :: 		} else {
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type102:
;Protocol.c,469 :: 		report_startup_line(helper_var,str_);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,470 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,471 :: 		}
L_Protocol_Check_Query_Type103:
;Protocol.c,465 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,476 :: 		}
; helper_var end address is: 12 (R3)
J	L_Protocol_Check_Query_Type99
NOP	
L_Protocol_Check_Query_Type100:
;Protocol.c,477 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,478 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type98:
;Protocol.c,479 :: 		int N_Val = 0;
;Protocol.c,480 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,485 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type334
NOP	
J	L_Protocol_Check_Query_Type206
NOP	
L_Protocol_Check_Query_Type334:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type335
NOP	
J	L_Protocol_Check_Query_Type205
NOP	
L_Protocol_Check_Query_Type335:
L_Protocol_Check_Query_Type201:
;Protocol.c,486 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,488 :: 		num[0] = str_[2];
ADDIU	R3, SP, 26
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,489 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,496 :: 		}else {
J	L_Protocol_Check_Query_Type108
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,485 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
L_Protocol_Check_Query_Type206:
L_Protocol_Check_Query_Type205:
;Protocol.c,498 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,499 :: 		}
L_Protocol_Check_Query_Type108:
;Protocol.c,502 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type337
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type337:
; helper_var end address is: 28 (R7)
;Protocol.c,503 :: 		int str_len = 0;
;Protocol.c,504 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type339
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type339:
; N_Val end address is: 16 (R4)
;Protocol.c,507 :: 		helper_var = strlen((str_));
JAL	_strlen+0
NOP	
;Protocol.c,516 :: 		str_len = strlen(str_);
JAL	_strlen+0
NOP	
;Protocol.c,521 :: 		}else{
J	L_Protocol_Check_Query_Type111
NOP	
L_Protocol_Check_Query_Type110:
;Protocol.c,522 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,530 :: 		settings_store_startup_line(N_Val,str_+4);
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,531 :: 		}
L_Protocol_Check_Query_Type111:
;Protocol.c,533 :: 		}
L_Protocol_Check_Query_Type109:
;Protocol.c,535 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,536 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,537 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type112:
L_Protocol_Check_Query_Type113:
L_Protocol_Check_Query_Type114:
L_Protocol_Check_Query_Type115:
L_Protocol_Check_Query_Type116:
L_Protocol_Check_Query_Type117:
;Protocol.c,538 :: 		case '6': case '7': case '8': case '9':
L_Protocol_Check_Query_Type118:
L_Protocol_Check_Query_Type119:
L_Protocol_Check_Query_Type120:
L_Protocol_Check_Query_Type121:
;Protocol.c,542 :: 		if((str_[2] == '=')||(str_[3] == '=')){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type341
NOP	
J	L_Protocol_Check_Query_Type208
NOP	
L_Protocol_Check_Query_Type341:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type343
NOP	
J	L_Protocol_Check_Query_Type207
NOP	
L_Protocol_Check_Query_Type343:
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type208:
L_Protocol_Check_Query_Type207:
;Protocol.c,543 :: 		char str_val[9]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
ORI	R24, R24, lo_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,544 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,545 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,546 :: 		if(str_[2] == '='){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type344
NOP	
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type344:
;Protocol.c,548 :: 		strncpy(str_val,(str_+1),1);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,549 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type346
NOP	
J	L_Protocol_Check_Query_Type211
NOP	
L_Protocol_Check_Query_Type346:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Protocol_Check_Query_Type126
NOP	
L_Protocol_Check_Query_Type211:
L_Protocol_Check_Query_Type126:
;Protocol.c,550 :: 		strncpy(str_val,(str_+3),strlen((str_+3)));
; N_Val start address is: 24 (R6)
ADDIU	R2, R25, 3
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
ADDIU	R4, R25, 3
ADDIU	R3, SP, 28
SEH	R27, R2
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,551 :: 		}else if(str_[3] == '='){
SEH	R7, R6
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type125:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type347
NOP	
J	L_Protocol_Check_Query_Type213
NOP	
L_Protocol_Check_Query_Type347:
;Protocol.c,553 :: 		strncpy(str_val,(str_+1),2);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,554 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type349
NOP	
J	L_Protocol_Check_Query_Type212
NOP	
L_Protocol_Check_Query_Type349:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Protocol_Check_Query_Type129
NOP	
L_Protocol_Check_Query_Type212:
SEH	R5, R6
L_Protocol_Check_Query_Type129:
;Protocol.c,555 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
;Protocol.c,556 :: 		strncpy(str_val,(str_+4),strlen((str_+4)));
ADDIU	R2, R25, 4
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
ADDIU	R4, R25, 4
ADDIU	R3, SP, 28
SH	R5, 16(SP)
SEH	R27, R2
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
; N_Val end address is: 20 (R5)
LH	R5, 16(SP)
SEH	R7, R5
;Protocol.c,557 :: 		}
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type213:
;Protocol.c,551 :: 		}else if(str_[3] == '='){
SEH	R7, R6
;Protocol.c,557 :: 		}
L_Protocol_Check_Query_Type128:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Protocol_Check_Query_Type127:
;Protocol.c,560 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Protocol_Check_Query_Type350
NOP	
J	L_Protocol_Check_Query_Type210
NOP	
L_Protocol_Check_Query_Type350:
; value end address is: 8 (R2)
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type352
NOP	
J	L_Protocol_Check_Query_Type209
NOP	
L_Protocol_Check_Query_Type352:
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type210:
L_Protocol_Check_Query_Type209:
;Protocol.c,561 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
;Protocol.c,562 :: 		}
L_Protocol_Check_Query_Type132:
;Protocol.c,563 :: 		value = atof(str_val);
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,568 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,569 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,570 :: 		}
L_Protocol_Check_Query_Type124:
;Protocol.c,571 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,572 :: 		}
L_Protocol_Check_Query_Type73:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type354
NOP	
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type354:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type356
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type356:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type358
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type358:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type360
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type360:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type362
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type362:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type364
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type364:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type366
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type366:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type368
NOP	
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type368:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type370
NOP	
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type370:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type372
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type372:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type374
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type374:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type376
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type376:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type378
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type378:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type380
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type380:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type382
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type382:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type384
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type384:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type386
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type386:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type388
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type388:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type390
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type390:
L_Protocol_Check_Query_Type74:
;Protocol.c,575 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type391
NOP	
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type391:
;Protocol.c,576 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Protocol_Check_Query_Type133:
;Protocol.c,578 :: 		return status;
LH	R2, 24(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,579 :: 		}else{
L_Protocol_Check_Query_Type72:
;Protocol.c,580 :: 		status = STATUS_COMMAND_EXECUTE_MOTION;
ORI	R2, R0, 20
SH	R2, 24(SP)
;Protocol.c,582 :: 		return status;
ORI	R2, R0, 20
;Protocol.c,583 :: 		}
;Protocol.c,582 :: 		return status;
;Protocol.c,583 :: 		}
L_end_Check_Query_Type:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Protocol_Check_Query_Type
Protocol_Do_Gcode:
;Protocol.c,586 :: 		static int Do_Gcode(char str_[64],int dif_){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Protocol.c,588 :: 		float XYZ_Val = 0.0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R30, R0, R0
SW	R30, 44(SP)
MOVZ	R30, R0, R0
SH	R30, 48(SP)
;Protocol.c,590 :: 		int  Val = 0;
;Protocol.c,594 :: 		num_of_strings = strsplit2(gcode,str_,0x20);
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
SH	R2, 40(SP)
;Protocol.c,599 :: 		for(i=0; i < num_of_strings; i++){
SH	R0, 38(SP)
L_Protocol_Do_Gcode135:
LH	R3, 40(SP)
LH	R2, 38(SP)
SLT	R2, R2, R3
BNE	R2, R0, L_Protocol_Do_Gcode393
NOP	
J	L_Protocol_Do_Gcode136
NOP	
L_Protocol_Do_Gcode393:
;Protocol.c,600 :: 		j = cpy_val_from_str(temp,gcode[i],1,strlen(gcode[i]));
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 20(SP)
LH	R3, 38(SP)
SLL	R4, R3, 6
LUI	R3, hi_addr(_gcode+0)
ORI	R3, R3, lo_addr(_gcode+0)
ADDU	R4, R3, R4
ADDIU	R3, SP, 28
SH	R26, 20(SP)
SW	R25, 24(SP)
SEH	R28, R2
ORI	R27, R0, 1
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
; j start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,601 :: 		switch(gcode[i][0]){
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SW	R2, 56(SP)
J	L_Protocol_Do_Gcode138
NOP	
;Protocol.c,602 :: 		case 'G':case'g':
L_Protocol_Do_Gcode140:
L_Protocol_Do_Gcode141:
;Protocol.c,603 :: 		if(j < 3){ //G00 - G99
SEH	R2, R5
; j end address is: 20 (R5)
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Do_Gcode394
NOP	
J	L_Protocol_Do_Gcode142
NOP	
L_Protocol_Do_Gcode394:
;Protocol.c,604 :: 		Val = atoi(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 20(SP)
SH	R2, 48(SP)
;Protocol.c,607 :: 		if(Val == 28 || Val == 30 || Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L_Protocol_Do_Gcode396
NOP	
J	L_Protocol_Do_Gcode218
NOP	
L_Protocol_Do_Gcode396:
LH	R3, 48(SP)
ORI	R2, R0, 30
BNE	R3, R2, L_Protocol_Do_Gcode398
NOP	
J	L_Protocol_Do_Gcode217
NOP	
L_Protocol_Do_Gcode398:
LH	R3, 48(SP)
ORI	R2, R0, 92
BNE	R3, R2, L_Protocol_Do_Gcode400
NOP	
J	L_Protocol_Do_Gcode216
NOP	
L_Protocol_Do_Gcode400:
J	L_Protocol_Do_Gcode145
NOP	
L_Protocol_Do_Gcode218:
L_Protocol_Do_Gcode217:
L_Protocol_Do_Gcode216:
;Protocol.c,608 :: 		Val *= 10;
LH	R3, 48(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 48(SP)
L_Protocol_Do_Gcode145:
;Protocol.c,609 :: 		}else{
J	L_Protocol_Do_Gcode146
NOP	
L_Protocol_Do_Gcode142:
;Protocol.c,611 :: 		Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LW	R25, 20(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 48(SP)
;Protocol.c,612 :: 		}
L_Protocol_Do_Gcode146:
;Protocol.c,613 :: 		mode = G_Mode(Val);
SH	R26, 20(SP)
SW	R25, 24(SP)
LH	R25, 48(SP)
JAL	_G_Mode+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,614 :: 		status = STATUS_OK;
SH	R0, 42(SP)
;Protocol.c,620 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,621 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Protocol_Do_Gcode147:
L_Protocol_Do_Gcode148:
L_Protocol_Do_Gcode149:
L_Protocol_Do_Gcode150:
;Protocol.c,622 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Protocol_Do_Gcode151:
L_Protocol_Do_Gcode152:
L_Protocol_Do_Gcode153:
L_Protocol_Do_Gcode154:
;Protocol.c,623 :: 		case 'I':case 'i':case 'J':case 'j':
L_Protocol_Do_Gcode155:
L_Protocol_Do_Gcode156:
L_Protocol_Do_Gcode157:
L_Protocol_Do_Gcode158:
;Protocol.c,624 :: 		case 'K':case 'k':case 'F':case 'f':
L_Protocol_Do_Gcode159:
L_Protocol_Do_Gcode160:
L_Protocol_Do_Gcode161:
L_Protocol_Do_Gcode162:
;Protocol.c,625 :: 		status = STATUS_OK;
SH	R0, 42(SP)
;Protocol.c,626 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LW	R25, 20(SP)
SWC1	S0, 44(SP)
;Protocol.c,627 :: 		status = Instruction_Values(gcode[i],&XYZ_Val);
ADDIU	R4, SP, 44
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SH	R26, 20(SP)
SW	R25, 24(SP)
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_Instruction_Values+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
SH	R2, 42(SP)
;Protocol.c,629 :: 		if(gcode[i][0] == 'F' || gcode[i][0] == 'f')
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_Do_Gcode402
NOP	
J	L_Protocol_Do_Gcode220
NOP	
L_Protocol_Do_Gcode402:
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_Do_Gcode404
NOP	
J	L_Protocol_Do_Gcode219
NOP	
L_Protocol_Do_Gcode404:
J	L_Protocol_Do_Gcode165
NOP	
L_Protocol_Do_Gcode220:
L_Protocol_Do_Gcode219:
;Protocol.c,630 :: 		status = STATUS_OK;
SH	R0, 42(SP)
J	L_Protocol_Do_Gcode166
NOP	
L_Protocol_Do_Gcode165:
;Protocol.c,632 :: 		status = STATUS_COMMAND_EXECUTE_MOTION;
ORI	R2, R0, 20
SH	R2, 42(SP)
L_Protocol_Do_Gcode166:
;Protocol.c,638 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,639 :: 		case 'P':case 'p':case 'L':case 'l':
L_Protocol_Do_Gcode167:
L_Protocol_Do_Gcode168:
L_Protocol_Do_Gcode169:
L_Protocol_Do_Gcode170:
;Protocol.c,640 :: 		case 'S':case 's':
L_Protocol_Do_Gcode171:
L_Protocol_Do_Gcode172:
;Protocol.c,641 :: 		Val = atoi(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 20(SP)
SH	R2, 48(SP)
;Protocol.c,642 :: 		status = Instruction_Values(gcode[i],&Val);
ADDIU	R4, SP, 48
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SH	R26, 20(SP)
SW	R25, 24(SP)
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_Instruction_Values+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
SH	R2, 42(SP)
;Protocol.c,643 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,644 :: 		case 'M':case'm':
L_Protocol_Do_Gcode173:
L_Protocol_Do_Gcode174:
;Protocol.c,645 :: 		Val = atoi(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 20(SP)
SH	R2, 48(SP)
;Protocol.c,646 :: 		flow = M_Mode(Val);
SH	R26, 20(SP)
SW	R25, 24(SP)
SEH	R25, R2
JAL	_M_Mode+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,651 :: 		status = STATUS_OK;
SH	R0, 42(SP)
;Protocol.c,652 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,653 :: 		}//switch
L_Protocol_Do_Gcode138:
; j start address is: 20 (R5)
LW	R4, 56(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode406
NOP	
J	L_Protocol_Do_Gcode140
NOP	
L_Protocol_Do_Gcode406:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_Do_Gcode408
NOP	
J	L_Protocol_Do_Gcode141
NOP	
L_Protocol_Do_Gcode408:
; j end address is: 20 (R5)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Do_Gcode410
NOP	
J	L_Protocol_Do_Gcode147
NOP	
L_Protocol_Do_Gcode410:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_Do_Gcode412
NOP	
J	L_Protocol_Do_Gcode148
NOP	
L_Protocol_Do_Gcode412:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_Do_Gcode414
NOP	
J	L_Protocol_Do_Gcode149
NOP	
L_Protocol_Do_Gcode414:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_Do_Gcode416
NOP	
J	L_Protocol_Do_Gcode150
NOP	
L_Protocol_Do_Gcode416:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_Do_Gcode418
NOP	
J	L_Protocol_Do_Gcode151
NOP	
L_Protocol_Do_Gcode418:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_Do_Gcode420
NOP	
J	L_Protocol_Do_Gcode152
NOP	
L_Protocol_Do_Gcode420:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_Do_Gcode422
NOP	
J	L_Protocol_Do_Gcode153
NOP	
L_Protocol_Do_Gcode422:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_Do_Gcode424
NOP	
J	L_Protocol_Do_Gcode154
NOP	
L_Protocol_Do_Gcode424:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Do_Gcode426
NOP	
J	L_Protocol_Do_Gcode155
NOP	
L_Protocol_Do_Gcode426:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 105
BNE	R3, R2, L_Protocol_Do_Gcode428
NOP	
J	L_Protocol_Do_Gcode156
NOP	
L_Protocol_Do_Gcode428:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Do_Gcode430
NOP	
J	L_Protocol_Do_Gcode157
NOP	
L_Protocol_Do_Gcode430:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 106
BNE	R3, R2, L_Protocol_Do_Gcode432
NOP	
J	L_Protocol_Do_Gcode158
NOP	
L_Protocol_Do_Gcode432:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L_Protocol_Do_Gcode434
NOP	
J	L_Protocol_Do_Gcode159
NOP	
L_Protocol_Do_Gcode434:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 107
BNE	R3, R2, L_Protocol_Do_Gcode436
NOP	
J	L_Protocol_Do_Gcode160
NOP	
L_Protocol_Do_Gcode436:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_Do_Gcode438
NOP	
J	L_Protocol_Do_Gcode161
NOP	
L_Protocol_Do_Gcode438:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_Do_Gcode440
NOP	
J	L_Protocol_Do_Gcode162
NOP	
L_Protocol_Do_Gcode440:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_Do_Gcode442
NOP	
J	L_Protocol_Do_Gcode167
NOP	
L_Protocol_Do_Gcode442:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 112
BNE	R3, R2, L_Protocol_Do_Gcode444
NOP	
J	L_Protocol_Do_Gcode168
NOP	
L_Protocol_Do_Gcode444:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_Do_Gcode446
NOP	
J	L_Protocol_Do_Gcode169
NOP	
L_Protocol_Do_Gcode446:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 108
BNE	R3, R2, L_Protocol_Do_Gcode448
NOP	
J	L_Protocol_Do_Gcode170
NOP	
L_Protocol_Do_Gcode448:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_Do_Gcode450
NOP	
J	L_Protocol_Do_Gcode171
NOP	
L_Protocol_Do_Gcode450:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 115
BNE	R3, R2, L_Protocol_Do_Gcode452
NOP	
J	L_Protocol_Do_Gcode172
NOP	
L_Protocol_Do_Gcode452:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_Do_Gcode454
NOP	
J	L_Protocol_Do_Gcode173
NOP	
L_Protocol_Do_Gcode454:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 109
BNE	R3, R2, L_Protocol_Do_Gcode456
NOP	
J	L_Protocol_Do_Gcode174
NOP	
L_Protocol_Do_Gcode456:
L_Protocol_Do_Gcode139:
;Protocol.c,599 :: 		for(i=0; i < num_of_strings; i++){
LH	R2, 38(SP)
ADDIU	R2, R2, 1
SH	R2, 38(SP)
;Protocol.c,654 :: 		}//for
J	L_Protocol_Do_Gcode135
NOP	
L_Protocol_Do_Gcode136:
;Protocol.c,657 :: 		return status;
LH	R2, 42(SP)
;Protocol.c,658 :: 		}
;Protocol.c,657 :: 		return status;
;Protocol.c,658 :: 		}
L_end_Do_Gcode:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of Protocol_Do_Gcode
