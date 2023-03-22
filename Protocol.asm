_Init_Protocol:
;Protocol.c,36 :: 		void Init_Protocol(){
;Protocol.c,37 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,38 :: 		}
L_end_Init_Protocol:
JR	RA
NOP	
; end of _Init_Protocol
_Str_Initialize:
;Protocol.c,41 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,43 :: 		for(i = 0; i <= arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 21
BNE	R2, R0, L__Str_Initialize210
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize210:
;Protocol.c,44 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,43 :: 		for(i = 0; i <= arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,45 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,46 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,48 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,49 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,50 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
Protocol_strsplit:
;Protocol.c,55 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,57 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,58 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,59 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,60 :: 		for (i = 0; i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit213
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit213:
;Protocol.c,61 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,62 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit215
NOP	
J	L_Protocol_strsplit168
NOP	
L_Protocol_strsplit215:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit217
NOP	
J	L_Protocol_strsplit167
NOP	
L_Protocol_strsplit217:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit218
NOP	
J	L_Protocol_strsplit166
NOP	
L_Protocol_strsplit218:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit168:
L_Protocol_strsplit167:
L_Protocol_strsplit166:
;Protocol.c,63 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,64 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,65 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,66 :: 		continue;
J	L_Protocol_strsplit5
NOP	
;Protocol.c,67 :: 		}else{
L_Protocol_strsplit8:
;Protocol.c,68 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,70 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit219
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit219:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,71 :: 		break;
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit10:
;Protocol.c,72 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit5:
;Protocol.c,60 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,72 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit3
NOP	
L_Protocol_strsplit4:
;Protocol.c,73 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,74 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,75 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,80 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,82 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,83 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,86 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,87 :: 		for (i = 0;i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit2221
NOP	
J	L_Protocol_strsplit2183
NOP	
L_Protocol_strsplit2221:
;Protocol.c,88 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,89 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2223
NOP	
J	L_Protocol_strsplit2174
NOP	
L_Protocol_strsplit2223:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2225
NOP	
J	L_Protocol_strsplit2173
NOP	
L_Protocol_strsplit2225:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2226
NOP	
J	L_Protocol_strsplit2172
NOP	
L_Protocol_strsplit2226:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2174:
L_Protocol_strsplit2173:
L_Protocol_strsplit2172:
;Protocol.c,90 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,91 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,92 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,93 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,94 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit213
NOP	
;Protocol.c,95 :: 		}else{
L_Protocol_strsplit216:
;Protocol.c,96 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2227
NOP	
J	L_Protocol_strsplit2181
NOP	
L_Protocol_strsplit2227:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2229
NOP	
J	L_Protocol_strsplit2182
NOP	
L_Protocol_strsplit2229:
L_Protocol_strsplit2170:
;Protocol.c,97 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2230
NOP	
J	L_Protocol_strsplit2179
NOP	
L_Protocol_strsplit2230:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2231
NOP	
J	L_Protocol_strsplit2180
NOP	
L_Protocol_strsplit2231:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2169:
;Protocol.c,98 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,99 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,100 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,97 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2176
NOP	
L_Protocol_strsplit2179:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2176:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2175
NOP	
L_Protocol_strsplit2180:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2175:
;Protocol.c,96 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2178
NOP	
L_Protocol_strsplit2181:
L_Protocol_strsplit2178:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2177
NOP	
L_Protocol_strsplit2182:
L_Protocol_strsplit2177:
;Protocol.c,103 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,105 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2232
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2232:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,106 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit224:
;Protocol.c,107 :: 		}
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
;Protocol.c,87 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,107 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit2183:
;Protocol.c,87 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,107 :: 		}
L_Protocol_strsplit212:
;Protocol.c,108 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,109 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,110 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,114 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,117 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,118 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,120 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,121 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str25:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str235
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str235:
;Protocol.c,122 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,123 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,124 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str25
NOP	
L_Protocol_cpy_val_from_str26:
;Protocol.c,125 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,127 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,128 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,133 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,135 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,137 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,139 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int27:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int237
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int237:
;Protocol.c,140 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,141 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L_Protocol_str2int239
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int239:
J	L_Protocol_str2int30
NOP	
L_Protocol_str2int31:
;Protocol.c,139 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,142 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int27
NOP	
L_Protocol_str2int28:
;Protocol.c,144 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,145 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,164 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,165 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+18)(GP)
BNE	R2, R0, L__protocol_execute_runtime242
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime242:
;Protocol.c,166 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,171 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime244
NOP	
J	L__protocol_execute_runtime185
NOP	
L__protocol_execute_runtime244:
;Protocol.c,172 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,175 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime246
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime246:
;Protocol.c,176 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,177 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,178 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,179 :: 		do {
J	L_protocol_execute_runtime35
NOP	
L__protocol_execute_runtime184:
;Protocol.c,183 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,179 :: 		do {
L_protocol_execute_runtime35:
;Protocol.c,183 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime248
NOP	
J	L__protocol_execute_runtime184
NOP	
L__protocol_execute_runtime248:
; rt_exec end address is: 12 (R3)
;Protocol.c,186 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime38
NOP	
L_protocol_execute_runtime34:
;Protocol.c,190 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,191 :: 		}
L_protocol_execute_runtime38:
;Protocol.c,192 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,193 :: 		}
J	L_protocol_execute_runtime33
NOP	
L__protocol_execute_runtime185:
;Protocol.c,171 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,193 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,196 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime250
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime250:
; rt_exec end address is: 16 (R4)
;Protocol.c,197 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,198 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,199 :: 		}
L_protocol_execute_runtime39:
;Protocol.c,202 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime252
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime252:
;Protocol.c,203 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,204 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,205 :: 		}
L_protocol_execute_runtime40:
;Protocol.c,208 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime254
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime254:
;Protocol.c,210 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,215 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime256
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime256:
;Protocol.c,217 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,218 :: 		}
L_protocol_execute_runtime42:
;Protocol.c,220 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime258
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime258:
;Protocol.c,222 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime260
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime260:
;Protocol.c,223 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
;Protocol.c,224 :: 		}
L_protocol_execute_runtime44:
;Protocol.c,225 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,226 :: 		}
L_protocol_execute_runtime43:
;Protocol.c,227 :: 		}
L_protocol_execute_runtime32:
;Protocol.c,231 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,235 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,239 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check263
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check263:
;Protocol.c,252 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,255 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,256 :: 		sys.execute = 0;
SH	R0, Offset(_sys+18)(GP)
;Protocol.c,257 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check265
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check265:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,267 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check266
NOP	
J	L__protocol_system_check188
NOP	
L__protocol_system_check266:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check268
NOP	
J	L__protocol_system_check187
NOP	
L__protocol_system_check268:
L__protocol_system_check186:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check188:
L__protocol_system_check187:
;Protocol.c,271 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check269
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check269:
;Protocol.c,272 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,273 :: 		} else {
J	L_protocol_system_check51
NOP	
L_protocol_system_check50:
;Protocol.c,275 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,277 :: 		}
L_protocol_system_check51:
;Protocol.c,278 :: 		}
L_protocol_system_check45:
;Protocol.c,279 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
_Sample_Gocde_Line:
;Protocol.c,284 :: 		int Sample_Gocde_Line(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Protocol.c,289 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,290 :: 		if(!dif){
BEQ	R2, R0, L__Sample_Gocde_Line271
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line271:
; dif end address is: 16 (R4)
;Protocol.c,298 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line273
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line273:
;Protocol.c,299 :: 		char *ptr = (char*)RXBUFF;
; ptr start address is: 16 (R4)
LUI	R30, 40960
ORI	R30, R30, 8192
MOVZ	R4, R30, R0
;Protocol.c,300 :: 		if(*ptr == '?'){
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line274
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line274:
;Protocol.c,301 :: 		Do_Critical_Msg(*ptr);
LBU	R25, 0(R4)
; ptr end address is: 16 (R4)
JAL	Protocol_Do_Critical_Msg+0
NOP	
;Protocol.c,302 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,303 :: 		DCH0DAT  = (DCH0DAT == '?')? '\n':'\n';
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line275
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line275:
; ?FLOC___Sample_Gocde_Line?T163 start address is: 12 (R3)
ORI	R3, R0, 10
; ?FLOC___Sample_Gocde_Line?T163 end address is: 12 (R3)
J	L_Sample_Gocde_Line56
NOP	
L_Sample_Gocde_Line55:
; ?FLOC___Sample_Gocde_Line?T163 start address is: 12 (R3)
ORI	R3, R0, 10
; ?FLOC___Sample_Gocde_Line?T163 end address is: 12 (R3)
L_Sample_Gocde_Line56:
; ?FLOC___Sample_Gocde_Line?T163 start address is: 12 (R3)
ANDI	R2, R3, 255
; ?FLOC___Sample_Gocde_Line?T163 end address is: 12 (R3)
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,304 :: 		}
L_Sample_Gocde_Line54:
;Protocol.c,305 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,306 :: 		}else{
J	L_Sample_Gocde_Line57
NOP	
L_Sample_Gocde_Line52:
;Protocol.c,309 :: 		Str_clear(str,64);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 14
SH	R4, 12(SP)
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R4, 12(SP)
;Protocol.c,312 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R4, 12(SP)
;Protocol.c,315 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line276
NOP	
J	L_Sample_Gocde_Line58
NOP	
L__Sample_Gocde_Line276:
;Protocol.c,316 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
;Protocol.c,317 :: 		}else {//if(bit_istrue(startup,bit(START_MSG))){
J	L_Sample_Gocde_Line59
NOP	
L_Sample_Gocde_Line58:
;Protocol.c,319 :: 		int msg_type = Check_Query_Type(str,dif);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
LH	R4, 12(SP)
;Protocol.c,325 :: 		if(msg_type == STATUS_GCODE){
SEH	R3, R2
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Gocde_Line277
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line277:
;Protocol.c,326 :: 		Do_Gcode(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Gcode+0
NOP	
;Protocol.c,327 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,329 :: 		}
L_Sample_Gocde_Line59:
;Protocol.c,331 :: 		}
L_Sample_Gocde_Line57:
;Protocol.c,332 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,334 :: 		}
;Protocol.c,332 :: 		return STATUS_OK;
;Protocol.c,334 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,339 :: 		static void Do_Startup_Msg(char *str_,int dif_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,340 :: 		char *temp_str = str_;//if more than 6 chars sent here ????
; temp_str start address is: 16 (R4)
MOVZ	R4, R25, R0
;Protocol.c,343 :: 		for(i = 0;i <= dif_;i++){
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
BEQ	R2, R0, L_Protocol_Do_Startup_Msg279
NOP	
J	L_Protocol_Do_Startup_Msg62
NOP	
L_Protocol_Do_Startup_Msg279:
; temp_str end address is: 16 (R4)
;Protocol.c,344 :: 		if(temp_str[i] == '?'){
; temp_str start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg280
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg280:
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
;Protocol.c,345 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,346 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,347 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,348 :: 		break;
J	L_Protocol_Do_Startup_Msg62
NOP	
;Protocol.c,349 :: 		}
L_Protocol_Do_Startup_Msg64:
;Protocol.c,343 :: 		for(i = 0;i <= dif_;i++){
; i start address is: 20 (R5)
; temp_str start address is: 16 (R4)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,350 :: 		}
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Protocol_Do_Startup_Msg61
NOP	
L_Protocol_Do_Startup_Msg62:
;Protocol.c,351 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
Protocol_Do_Critical_Msg:
;Protocol.c,355 :: 		static void Do_Critical_Msg(char ch_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,360 :: 		switch(ch_){
J	L_Protocol_Do_Critical_Msg65
NOP	
;Protocol.c,361 :: 		case CMD_STATUS_REPORT: sys.execute |= EXEC_STATUS_REPORT; break; // Set as true
L_Protocol_Do_Critical_Msg67:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,362 :: 		case CMD_CYCLE_START:   sys.execute |= EXEC_CYCLE_START; break; // Set as true
L_Protocol_Do_Critical_Msg68:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,363 :: 		case CMD_FEED_HOLD:     sys.execute |= EXEC_FEED_HOLD; break; // Set as true
L_Protocol_Do_Critical_Msg69:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,364 :: 		case CMD_RESET:         mc_reset(); break; // Call motion control reset routine.
L_Protocol_Do_Critical_Msg70:
JAL	_mc_reset+0
NOP	
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,365 :: 		default: break;
L_Protocol_Do_Critical_Msg71:
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,366 :: 		}
L_Protocol_Do_Critical_Msg65:
ANDI	R3, R25, 255
ORI	R2, R0, 63
BNE	R3, R2, L_Protocol_Do_Critical_Msg283
NOP	
J	L_Protocol_Do_Critical_Msg67
NOP	
L_Protocol_Do_Critical_Msg283:
ANDI	R3, R25, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Do_Critical_Msg285
NOP	
J	L_Protocol_Do_Critical_Msg68
NOP	
L_Protocol_Do_Critical_Msg285:
ANDI	R3, R25, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Do_Critical_Msg287
NOP	
J	L_Protocol_Do_Critical_Msg69
NOP	
L_Protocol_Do_Critical_Msg287:
ANDI	R3, R25, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Do_Critical_Msg289
NOP	
J	L_Protocol_Do_Critical_Msg70
NOP	
L_Protocol_Do_Critical_Msg289:
J	L_Protocol_Do_Critical_Msg71
NOP	
L_Protocol_Do_Critical_Msg66:
;Protocol.c,367 :: 		}
L_end_Do_Critical_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Critical_Msg
Protocol_Check_Query_Type:
;Protocol.c,371 :: 		static int Check_Query_Type(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,379 :: 		if(str_[0] == '$'){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type291
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type291:
;Protocol.c,380 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type73
NOP	
;Protocol.c,381 :: 		case '\r' :case '\n' :
L_Protocol_Check_Query_Type75:
L_Protocol_Check_Query_Type76:
;Protocol.c,382 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,383 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,384 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,385 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type77:
;Protocol.c,386 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,387 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,388 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,389 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type78:
;Protocol.c,390 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,391 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,392 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,393 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type79:
;Protocol.c,394 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,395 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,396 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,397 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type80:
;Protocol.c,398 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,406 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type292
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type292:
;Protocol.c,407 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,408 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,409 :: 		} else {
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type81:
;Protocol.c,410 :: 		if (sys.state) { status = STATUS_IDLE_ERROR; }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type294
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type294:
ORI	R2, R0, 11
SH	R2, 24(SP)
L_Protocol_Check_Query_Type83:
;Protocol.c,411 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,412 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,413 :: 		}
L_Protocol_Check_Query_Type82:
;Protocol.c,414 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,415 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type84:
;Protocol.c,416 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type295
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type295:
;Protocol.c,417 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,418 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,420 :: 		}
L_Protocol_Check_Query_Type85:
;Protocol.c,421 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,422 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,423 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type86:
;Protocol.c,424 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,425 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L_Protocol_Check_Query_Type297
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type297:
;Protocol.c,426 :: 		int axis_to_home = 0;
;Protocol.c,429 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type299
NOP	
J	L_Protocol_Check_Query_Type194
NOP	
L_Protocol_Check_Query_Type299:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type301
NOP	
J	L_Protocol_Check_Query_Type193
NOP	
L_Protocol_Check_Query_Type301:
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type194:
L_Protocol_Check_Query_Type193:
;Protocol.c,430 :: 		int i = 0;
;Protocol.c,431 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,434 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,435 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Protocol_Check_Query_Type91:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Check_Query_Type302
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type302:
;Protocol.c,436 :: 		Set_Axisword(i);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,435 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,436 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type92:
;Protocol.c,439 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type304
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type304:
;Protocol.c,440 :: 		status = ALARM_ABORT_CYCLE;
ORI	R2, R0, 65534
SH	R2, 24(SP)
;Protocol.c,441 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,442 :: 		}
L_Protocol_Check_Query_Type94:
;Protocol.c,443 :: 		} else {
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type90:
;Protocol.c,444 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 24(SP)
;Protocol.c,445 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,446 :: 		}
L_Protocol_Check_Query_Type95:
;Protocol.c,447 :: 		} else {
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type87:
;Protocol.c,448 :: 		status = STATUS_SETTING_DISABLED;
ORI	R2, R0, 7
SH	R2, 24(SP)
;Protocol.c,449 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,450 :: 		}
L_Protocol_Check_Query_Type96:
;Protocol.c,453 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,454 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,455 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type97:
;Protocol.c,456 :: 		if ( str_[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type305
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type305:
;Protocol.c,457 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type99:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type306
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type306:
;Protocol.c,458 :: 		if ((settings_read_startup_line(helper_var, str_))) {
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
BNE	R2, R0, L_Protocol_Check_Query_Type308
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type308:
;Protocol.c,459 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,460 :: 		} else {
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type102:
;Protocol.c,461 :: 		report_startup_line(helper_var,str_);
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
;Protocol.c,463 :: 		}
L_Protocol_Check_Query_Type103:
;Protocol.c,457 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,468 :: 		}
; helper_var end address is: 12 (R3)
J	L_Protocol_Check_Query_Type99
NOP	
L_Protocol_Check_Query_Type100:
;Protocol.c,469 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,470 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type98:
;Protocol.c,471 :: 		int N_Val = 0;
;Protocol.c,472 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,477 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type309
NOP	
J	L_Protocol_Check_Query_Type196
NOP	
L_Protocol_Check_Query_Type309:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type310
NOP	
J	L_Protocol_Check_Query_Type195
NOP	
L_Protocol_Check_Query_Type310:
L_Protocol_Check_Query_Type191:
;Protocol.c,478 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,480 :: 		num[0] = str_[2];
ADDIU	R3, SP, 26
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,481 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,488 :: 		}else {
J	L_Protocol_Check_Query_Type108
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,477 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
L_Protocol_Check_Query_Type196:
L_Protocol_Check_Query_Type195:
;Protocol.c,490 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,491 :: 		}
L_Protocol_Check_Query_Type108:
;Protocol.c,494 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type312
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type312:
; helper_var end address is: 28 (R7)
;Protocol.c,495 :: 		int str_len = 0;
;Protocol.c,496 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type314
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type314:
; N_Val end address is: 16 (R4)
;Protocol.c,499 :: 		helper_var = strlen((str_));
JAL	_strlen+0
NOP	
;Protocol.c,508 :: 		str_len = strlen(str_);
JAL	_strlen+0
NOP	
;Protocol.c,513 :: 		}else{
J	L_Protocol_Check_Query_Type111
NOP	
L_Protocol_Check_Query_Type110:
;Protocol.c,514 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,522 :: 		settings_store_startup_line(N_Val,str_+4);
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,523 :: 		}
L_Protocol_Check_Query_Type111:
;Protocol.c,525 :: 		}
L_Protocol_Check_Query_Type109:
;Protocol.c,527 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,528 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,529 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type112:
L_Protocol_Check_Query_Type113:
L_Protocol_Check_Query_Type114:
L_Protocol_Check_Query_Type115:
L_Protocol_Check_Query_Type116:
L_Protocol_Check_Query_Type117:
;Protocol.c,530 :: 		case '6': case '7': case '8': case '9':
L_Protocol_Check_Query_Type118:
L_Protocol_Check_Query_Type119:
L_Protocol_Check_Query_Type120:
L_Protocol_Check_Query_Type121:
;Protocol.c,534 :: 		if((str_[2] == '=')||(str_[3] == '=')){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type316
NOP	
J	L_Protocol_Check_Query_Type198
NOP	
L_Protocol_Check_Query_Type316:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type318
NOP	
J	L_Protocol_Check_Query_Type197
NOP	
L_Protocol_Check_Query_Type318:
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type198:
L_Protocol_Check_Query_Type197:
;Protocol.c,535 :: 		char str_val[9]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
ORI	R24, R24, lo_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,536 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,537 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,538 :: 		if(str_[2] == '='){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type319
NOP	
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type319:
;Protocol.c,540 :: 		strncpy(str_val,(str_+1),1);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,541 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type321
NOP	
J	L_Protocol_Check_Query_Type201
NOP	
L_Protocol_Check_Query_Type321:
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
L_Protocol_Check_Query_Type201:
L_Protocol_Check_Query_Type126:
;Protocol.c,542 :: 		strncpy(str_val,(str_+3),strlen((str_+3)));
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
;Protocol.c,543 :: 		}else if(str_[3] == '='){
SEH	R7, R6
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type125:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type322
NOP	
J	L_Protocol_Check_Query_Type203
NOP	
L_Protocol_Check_Query_Type322:
;Protocol.c,545 :: 		strncpy(str_val,(str_+1),2);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,546 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type324
NOP	
J	L_Protocol_Check_Query_Type202
NOP	
L_Protocol_Check_Query_Type324:
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
L_Protocol_Check_Query_Type202:
SEH	R5, R6
L_Protocol_Check_Query_Type129:
;Protocol.c,547 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
;Protocol.c,548 :: 		strncpy(str_val,(str_+4),strlen((str_+4)));
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
;Protocol.c,549 :: 		}
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type203:
;Protocol.c,543 :: 		}else if(str_[3] == '='){
SEH	R7, R6
;Protocol.c,549 :: 		}
L_Protocol_Check_Query_Type128:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Protocol_Check_Query_Type127:
;Protocol.c,552 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Protocol_Check_Query_Type325
NOP	
J	L_Protocol_Check_Query_Type200
NOP	
L_Protocol_Check_Query_Type325:
; value end address is: 8 (R2)
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type327
NOP	
J	L_Protocol_Check_Query_Type199
NOP	
L_Protocol_Check_Query_Type327:
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type200:
L_Protocol_Check_Query_Type199:
;Protocol.c,554 :: 		}
L_Protocol_Check_Query_Type132:
;Protocol.c,555 :: 		value = atof(str_val);
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,560 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,561 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,562 :: 		}
L_Protocol_Check_Query_Type124:
;Protocol.c,563 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,564 :: 		}
L_Protocol_Check_Query_Type73:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type329
NOP	
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type329:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type331
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type331:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type333
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type333:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type335
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type335:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type337
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type337:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type339
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type339:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type341
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type341:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type343
NOP	
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type343:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type345
NOP	
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type345:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type347
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type347:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type349
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type349:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type351
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type351:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type353
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type353:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type355
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type355:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type357
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type357:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type359
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type359:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type361
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type361:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type363
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type363:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type365
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type365:
L_Protocol_Check_Query_Type74:
;Protocol.c,567 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type366
NOP	
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type366:
;Protocol.c,568 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Protocol_Check_Query_Type133:
;Protocol.c,570 :: 		return status;
LH	R2, 24(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,571 :: 		}else
L_Protocol_Check_Query_Type72:
;Protocol.c,572 :: 		return STATUS_GCODE;
ORI	R2, R0, 20
;Protocol.c,575 :: 		}
;Protocol.c,572 :: 		return STATUS_GCODE;
;Protocol.c,575 :: 		}
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
;Protocol.c,578 :: 		static int Do_Gcode(char str_[64],int dif_){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Protocol.c,580 :: 		float XYZ_Val = 0.0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R30, R0, R0
SW	R30, 68(SP)
;Protocol.c,582 :: 		int  G_Val = 0;
;Protocol.c,583 :: 		int axis_to_run = 0;
;Protocol.c,584 :: 		int no_of_axis = 0;
;Protocol.c,587 :: 		num_of_strings = strsplit2(gcode,str_,0x20);
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
SH	R2, 40(SP)
;Protocol.c,589 :: 		for(i=0; i < num_of_strings; i++){
SH	R0, 38(SP)
L_Protocol_Do_Gcode135:
LH	R3, 40(SP)
LH	R2, 38(SP)
SLT	R2, R2, R3
BNE	R2, R0, L_Protocol_Do_Gcode368
NOP	
J	L_Protocol_Do_Gcode136
NOP	
L_Protocol_Do_Gcode368:
;Protocol.c,590 :: 		switch(gcode[i][0]){
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SW	R2, 80(SP)
J	L_Protocol_Do_Gcode138
NOP	
;Protocol.c,591 :: 		case 'G':case'g'://if (gcode[i][0]=='G'){
L_Protocol_Do_Gcode140:
L_Protocol_Do_Gcode141:
;Protocol.c,592 :: 		j = cpy_val_from_str(temp,gcode[i],1,strlen(gcode[i]));
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
;Protocol.c,593 :: 		if(j < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Do_Gcode369
NOP	
J	L_Protocol_Do_Gcode142
NOP	
L_Protocol_Do_Gcode369:
;Protocol.c,594 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 20(SP)
SH	R2, 72(SP)
;Protocol.c,597 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L_Protocol_Do_Gcode371
NOP	
J	L_Protocol_Do_Gcode207
NOP	
L_Protocol_Do_Gcode371:
LH	R3, 72(SP)
ORI	R2, R0, 30
BNE	R3, R2, L_Protocol_Do_Gcode373
NOP	
J	L_Protocol_Do_Gcode206
NOP	
L_Protocol_Do_Gcode373:
LH	R3, 72(SP)
ORI	R2, R0, 92
BNE	R3, R2, L_Protocol_Do_Gcode375
NOP	
J	L_Protocol_Do_Gcode205
NOP	
L_Protocol_Do_Gcode375:
J	L_Protocol_Do_Gcode145
NOP	
L_Protocol_Do_Gcode207:
L_Protocol_Do_Gcode206:
L_Protocol_Do_Gcode205:
;Protocol.c,598 :: 		G_Val *= 10;
LH	R3, 72(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 72(SP)
L_Protocol_Do_Gcode145:
;Protocol.c,599 :: 		}else{
J	L_Protocol_Do_Gcode146
NOP	
L_Protocol_Do_Gcode142:
;Protocol.c,601 :: 		G_Val = (int)(atof(temp)*10.0);
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
SH	R2, 72(SP)
;Protocol.c,602 :: 		}
L_Protocol_Do_Gcode146:
;Protocol.c,603 :: 		mode = G_Mode(G_Val);
SH	R26, 20(SP)
SW	R25, 24(SP)
LH	R25, 72(SP)
JAL	_G_Mode+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,605 :: 		while(DMA_IsOn(1));
L_Protocol_Do_Gcode147:
SH	R26, 20(SP)
SW	R25, 24(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
BNE	R2, R0, L_Protocol_Do_Gcode377
NOP	
J	L_Protocol_Do_Gcode148
NOP	
L_Protocol_Do_Gcode377:
J	L_Protocol_Do_Gcode147
NOP	
L_Protocol_Do_Gcode148:
;Protocol.c,606 :: 		dma_printf("%d [%s][%d]\n",i,gcode[i],G_Val);
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R4, R2, R3
ADDIU	R23, SP, 42
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICSProtocol_?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 42
LH	R2, 72(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
SW	R4, 8(SP)
LH	R2, 54(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,608 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,609 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Protocol_Do_Gcode149:
L_Protocol_Do_Gcode150:
L_Protocol_Do_Gcode151:
L_Protocol_Do_Gcode152:
;Protocol.c,610 :: 		case 'Z':case 'z':case 'A':case 'a':
L_Protocol_Do_Gcode153:
L_Protocol_Do_Gcode154:
L_Protocol_Do_Gcode155:
L_Protocol_Do_Gcode156:
;Protocol.c,612 :: 		case 'I':case 'i':case 'J':case 'j':
L_Protocol_Do_Gcode157:
L_Protocol_Do_Gcode158:
L_Protocol_Do_Gcode159:
L_Protocol_Do_Gcode160:
;Protocol.c,613 :: 		case 'F':case 'f':
L_Protocol_Do_Gcode161:
L_Protocol_Do_Gcode162:
;Protocol.c,614 :: 		j = cpy_val_from_str(temp,gcode[i],1,strlen(gcode[i]));
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
;Protocol.c,615 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LW	R25, 20(SP)
SWC1	S0, 68(SP)
;Protocol.c,616 :: 		status = Instruction_Values(gcode[i],&XYZ_Val);
ADDIU	R4, SP, 68
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
;Protocol.c,618 :: 		while(DMA_IsOn(1));
L_Protocol_Do_Gcode163:
SH	R26, 20(SP)
SW	R25, 24(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
BNE	R2, R0, L_Protocol_Do_Gcode379
NOP	
J	L_Protocol_Do_Gcode164
NOP	
L_Protocol_Do_Gcode379:
J	L_Protocol_Do_Gcode163
NOP	
L_Protocol_Do_Gcode164:
;Protocol.c,619 :: 		dma_printf("%d [%s][%f]\n",i,gcode[i],XYZ_Val);
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R4, R2, R3
ADDIU	R23, SP, 55
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICSProtocol_?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 55
LW	R2, 68(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
SW	R4, 8(SP)
LH	R2, 54(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,621 :: 		break;
J	L_Protocol_Do_Gcode139
NOP	
;Protocol.c,624 :: 		}
L_Protocol_Do_Gcode138:
LW	R4, 80(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode381
NOP	
J	L_Protocol_Do_Gcode140
NOP	
L_Protocol_Do_Gcode381:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 103
BNE	R3, R2, L_Protocol_Do_Gcode383
NOP	
J	L_Protocol_Do_Gcode141
NOP	
L_Protocol_Do_Gcode383:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Do_Gcode385
NOP	
J	L_Protocol_Do_Gcode149
NOP	
L_Protocol_Do_Gcode385:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L_Protocol_Do_Gcode387
NOP	
J	L_Protocol_Do_Gcode150
NOP	
L_Protocol_Do_Gcode387:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_Do_Gcode389
NOP	
J	L_Protocol_Do_Gcode151
NOP	
L_Protocol_Do_Gcode389:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 121
BNE	R3, R2, L_Protocol_Do_Gcode391
NOP	
J	L_Protocol_Do_Gcode152
NOP	
L_Protocol_Do_Gcode391:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_Do_Gcode393
NOP	
J	L_Protocol_Do_Gcode153
NOP	
L_Protocol_Do_Gcode393:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 122
BNE	R3, R2, L_Protocol_Do_Gcode395
NOP	
J	L_Protocol_Do_Gcode154
NOP	
L_Protocol_Do_Gcode395:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_Do_Gcode397
NOP	
J	L_Protocol_Do_Gcode155
NOP	
L_Protocol_Do_Gcode397:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 97
BNE	R3, R2, L_Protocol_Do_Gcode399
NOP	
J	L_Protocol_Do_Gcode156
NOP	
L_Protocol_Do_Gcode399:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Do_Gcode401
NOP	
J	L_Protocol_Do_Gcode157
NOP	
L_Protocol_Do_Gcode401:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 105
BNE	R3, R2, L_Protocol_Do_Gcode403
NOP	
J	L_Protocol_Do_Gcode158
NOP	
L_Protocol_Do_Gcode403:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Do_Gcode405
NOP	
J	L_Protocol_Do_Gcode159
NOP	
L_Protocol_Do_Gcode405:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 106
BNE	R3, R2, L_Protocol_Do_Gcode407
NOP	
J	L_Protocol_Do_Gcode160
NOP	
L_Protocol_Do_Gcode407:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_Do_Gcode409
NOP	
J	L_Protocol_Do_Gcode161
NOP	
L_Protocol_Do_Gcode409:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 102
BNE	R3, R2, L_Protocol_Do_Gcode411
NOP	
J	L_Protocol_Do_Gcode162
NOP	
L_Protocol_Do_Gcode411:
L_Protocol_Do_Gcode139:
;Protocol.c,589 :: 		for(i=0; i < num_of_strings; i++){
LH	R2, 38(SP)
ADDIU	R2, R2, 1
SH	R2, 38(SP)
;Protocol.c,626 :: 		}
J	L_Protocol_Do_Gcode135
NOP	
L_Protocol_Do_Gcode136:
;Protocol.c,629 :: 		return num_of_strings;
LH	R2, 40(SP)
;Protocol.c,630 :: 		}
;Protocol.c,629 :: 		return num_of_strings;
;Protocol.c,630 :: 		}
L_end_Do_Gcode:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of Protocol_Do_Gcode
