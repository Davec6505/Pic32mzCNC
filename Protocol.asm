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
BNE	R2, R0, L__Str_Initialize191
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize191:
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
BNE	R2, R0, L_Protocol_strsplit194
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit194:
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
BNE	R3, R2, L_Protocol_strsplit196
NOP	
J	L_Protocol_strsplit149
NOP	
L_Protocol_strsplit196:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit198
NOP	
J	L_Protocol_strsplit148
NOP	
L_Protocol_strsplit198:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit199
NOP	
J	L_Protocol_strsplit147
NOP	
L_Protocol_strsplit199:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit149:
L_Protocol_strsplit148:
L_Protocol_strsplit147:
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
BEQ	R2, R0, L_Protocol_strsplit200
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit200:
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
BNE	R2, R0, L_Protocol_strsplit2202
NOP	
J	L_Protocol_strsplit2164
NOP	
L_Protocol_strsplit2202:
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
BNE	R3, R2, L_Protocol_strsplit2204
NOP	
J	L_Protocol_strsplit2155
NOP	
L_Protocol_strsplit2204:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2206
NOP	
J	L_Protocol_strsplit2154
NOP	
L_Protocol_strsplit2206:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2207
NOP	
J	L_Protocol_strsplit2153
NOP	
L_Protocol_strsplit2207:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2155:
L_Protocol_strsplit2154:
L_Protocol_strsplit2153:
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
BEQ	R2, R0, L_Protocol_strsplit2208
NOP	
J	L_Protocol_strsplit2162
NOP	
L_Protocol_strsplit2208:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2210
NOP	
J	L_Protocol_strsplit2163
NOP	
L_Protocol_strsplit2210:
L_Protocol_strsplit2151:
;Protocol.c,97 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2211
NOP	
J	L_Protocol_strsplit2160
NOP	
L_Protocol_strsplit2211:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2212
NOP	
J	L_Protocol_strsplit2161
NOP	
L_Protocol_strsplit2212:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2150:
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
J	L_Protocol_strsplit2157
NOP	
L_Protocol_strsplit2160:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2157:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2156
NOP	
L_Protocol_strsplit2161:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2156:
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
J	L_Protocol_strsplit2159
NOP	
L_Protocol_strsplit2162:
L_Protocol_strsplit2159:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2158
NOP	
L_Protocol_strsplit2163:
L_Protocol_strsplit2158:
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
BEQ	R2, R0, L_Protocol_strsplit2213
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2213:
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
L_Protocol_strsplit2164:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str216
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str216:
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
BNE	R2, R0, L_Protocol_str2int218
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int218:
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
BNE	R2, R0, L_Protocol_str2int220
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int220:
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
BNE	R2, R0, L__protocol_execute_runtime223
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime223:
;Protocol.c,166 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,171 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime225
NOP	
J	L__protocol_execute_runtime166
NOP	
L__protocol_execute_runtime225:
;Protocol.c,172 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,175 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime227
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime227:
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
L__protocol_execute_runtime165:
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
BNE	R2, R0, L__protocol_execute_runtime229
NOP	
J	L__protocol_execute_runtime165
NOP	
L__protocol_execute_runtime229:
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
L__protocol_execute_runtime166:
;Protocol.c,171 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,193 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,196 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime231
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime231:
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
BNE	R2, R0, L__protocol_execute_runtime233
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime233:
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
BNE	R2, R0, L__protocol_execute_runtime235
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime235:
;Protocol.c,210 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,215 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime237
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime237:
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
BNE	R2, R0, L__protocol_execute_runtime239
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime239:
;Protocol.c,222 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime241
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime241:
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
BNE	R2, R0, L__protocol_system_check244
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check244:
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
BNE	R2, R0, L__protocol_system_check246
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check246:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,267 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check247
NOP	
J	L__protocol_system_check169
NOP	
L__protocol_system_check247:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check249
NOP	
J	L__protocol_system_check168
NOP	
L__protocol_system_check249:
L__protocol_system_check167:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check169:
L__protocol_system_check168:
;Protocol.c,271 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check250
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check250:
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
BEQ	R2, R0, L__Sample_Gocde_Line252
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line252:
; dif end address is: 16 (R4)
;Protocol.c,298 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line254
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line254:
;Protocol.c,299 :: 		char *ptr = (char*)RXBUFF;
; ptr start address is: 16 (R4)
LUI	R30, 40960
ORI	R30, R30, 8192
MOVZ	R4, R30, R0
;Protocol.c,300 :: 		if(*ptr == '?'){
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line255
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line255:
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
BEQ	R3, R2, L__Sample_Gocde_Line256
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line256:
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
BEQ	R2, R0, L__Sample_Gocde_Line257
NOP	
J	L_Sample_Gocde_Line58
NOP	
L__Sample_Gocde_Line257:
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
BEQ	R3, R2, L__Sample_Gocde_Line258
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line258:
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
BEQ	R2, R0, L_Protocol_Do_Startup_Msg260
NOP	
J	L_Protocol_Do_Startup_Msg62
NOP	
L_Protocol_Do_Startup_Msg260:
; temp_str end address is: 16 (R4)
;Protocol.c,344 :: 		if(temp_str[i] == '?'){
; temp_str start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg261
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg261:
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
BNE	R3, R2, L_Protocol_Do_Critical_Msg264
NOP	
J	L_Protocol_Do_Critical_Msg67
NOP	
L_Protocol_Do_Critical_Msg264:
ANDI	R3, R25, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Do_Critical_Msg266
NOP	
J	L_Protocol_Do_Critical_Msg68
NOP	
L_Protocol_Do_Critical_Msg266:
ANDI	R3, R25, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Do_Critical_Msg268
NOP	
J	L_Protocol_Do_Critical_Msg69
NOP	
L_Protocol_Do_Critical_Msg268:
ANDI	R3, R25, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Do_Critical_Msg270
NOP	
J	L_Protocol_Do_Critical_Msg70
NOP	
L_Protocol_Do_Critical_Msg270:
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
BEQ	R3, R2, L_Protocol_Check_Query_Type272
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type272:
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
BEQ	R3, R2, L_Protocol_Check_Query_Type273
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type273:
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
BNE	R2, R0, L_Protocol_Check_Query_Type275
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type275:
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
BEQ	R3, R2, L_Protocol_Check_Query_Type276
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type276:
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
BNE	R2, R0, L_Protocol_Check_Query_Type278
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type278:
;Protocol.c,426 :: 		int axis_to_home = 0;
;Protocol.c,429 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type280
NOP	
J	L_Protocol_Check_Query_Type175
NOP	
L_Protocol_Check_Query_Type280:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type282
NOP	
J	L_Protocol_Check_Query_Type174
NOP	
L_Protocol_Check_Query_Type282:
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type175:
L_Protocol_Check_Query_Type174:
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
BNE	R2, R0, L_Protocol_Check_Query_Type283
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type283:
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
BNE	R2, R0, L_Protocol_Check_Query_Type285
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type285:
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
BNE	R2, R0, L_Protocol_Check_Query_Type286
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type286:
;Protocol.c,457 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type99:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type287
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type287:
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
BNE	R2, R0, L_Protocol_Check_Query_Type289
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type289:
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
;Protocol.c,462 :: 		status = STATUS_OK;
SH	R0, 24(SP)
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
BEQ	R2, R0, L_Protocol_Check_Query_Type290
NOP	
J	L_Protocol_Check_Query_Type177
NOP	
L_Protocol_Check_Query_Type290:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type291
NOP	
J	L_Protocol_Check_Query_Type176
NOP	
L_Protocol_Check_Query_Type291:
L_Protocol_Check_Query_Type172:
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
L_Protocol_Check_Query_Type177:
L_Protocol_Check_Query_Type176:
;Protocol.c,490 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,491 :: 		}
L_Protocol_Check_Query_Type108:
;Protocol.c,494 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type293
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type293:
; helper_var end address is: 28 (R7)
;Protocol.c,495 :: 		int str_len = 0;
;Protocol.c,496 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type295
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type295:
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
BNE	R3, R2, L_Protocol_Check_Query_Type297
NOP	
J	L_Protocol_Check_Query_Type179
NOP	
L_Protocol_Check_Query_Type297:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type299
NOP	
J	L_Protocol_Check_Query_Type178
NOP	
L_Protocol_Check_Query_Type299:
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type179:
L_Protocol_Check_Query_Type178:
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
BEQ	R3, R2, L_Protocol_Check_Query_Type300
NOP	
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type300:
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
BNE	R2, R0, L_Protocol_Check_Query_Type302
NOP	
J	L_Protocol_Check_Query_Type182
NOP	
L_Protocol_Check_Query_Type302:
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
L_Protocol_Check_Query_Type182:
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
BEQ	R3, R2, L_Protocol_Check_Query_Type303
NOP	
J	L_Protocol_Check_Query_Type184
NOP	
L_Protocol_Check_Query_Type303:
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
BNE	R2, R0, L_Protocol_Check_Query_Type305
NOP	
J	L_Protocol_Check_Query_Type183
NOP	
L_Protocol_Check_Query_Type305:
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
L_Protocol_Check_Query_Type183:
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
L_Protocol_Check_Query_Type184:
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
BC1F	0, L_Protocol_Check_Query_Type306
NOP	
J	L_Protocol_Check_Query_Type181
NOP	
L_Protocol_Check_Query_Type306:
; value end address is: 8 (R2)
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type308
NOP	
J	L_Protocol_Check_Query_Type180
NOP	
L_Protocol_Check_Query_Type308:
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type181:
L_Protocol_Check_Query_Type180:
;Protocol.c,553 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
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
BNE	R3, R2, L_Protocol_Check_Query_Type310
NOP	
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type310:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type312
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type312:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type314
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type314:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type316
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type316:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type318
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type318:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type320
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type320:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type322
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type322:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type324
NOP	
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type324:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type326
NOP	
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type326:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type328
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type328:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type330
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type330:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type332
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type332:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type334
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type334:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type336
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type336:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type338
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type338:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type340
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type340:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type342
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type342:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type344
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type344:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type346
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type346:
L_Protocol_Check_Query_Type74:
;Protocol.c,567 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type347
NOP	
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type347:
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
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Protocol.c,582 :: 		num_of_strings = strsplit2(gcode,str_,0x20);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
SH	R2, 40(SP)
;Protocol.c,584 :: 		for(i=0; i < num_of_strings; i++){
SH	R0, 38(SP)
L_Protocol_Do_Gcode135:
LH	R3, 40(SP)
LH	R2, 38(SP)
SLT	R2, R2, R3
BNE	R2, R0, L_Protocol_Do_Gcode349
NOP	
J	L_Protocol_Do_Gcode136
NOP	
L_Protocol_Do_Gcode349:
;Protocol.c,586 :: 		if (gcode[i][0]=='G'){
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BEQ	R3, R2, L_Protocol_Do_Gcode350
NOP	
J	L_Protocol_Do_Gcode138
NOP	
L_Protocol_Do_Gcode350:
;Protocol.c,587 :: 		int  G_Val = 0;
;Protocol.c,588 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
SW	R25, 20(SP)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
LW	R25, 20(SP)
ADDIU	R3, SP, 28
SH	R26, 20(SP)
SW	R25, 24(SP)
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
SH	R2, 38(SP)
;Protocol.c,589 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Do_Gcode351
NOP	
J	L_Protocol_Do_Gcode139
NOP	
L_Protocol_Do_Gcode351:
;Protocol.c,590 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 20(SP)
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,593 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L_Protocol_Do_Gcode353
NOP	
J	L_Protocol_Do_Gcode188
NOP	
L_Protocol_Do_Gcode353:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L_Protocol_Do_Gcode355
NOP	
J	L_Protocol_Do_Gcode187
NOP	
L_Protocol_Do_Gcode355:
SEH	R3, R4
; G_Val end address is: 16 (R4)
ORI	R2, R0, 92
BNE	R3, R2, L_Protocol_Do_Gcode357
NOP	
J	L_Protocol_Do_Gcode186
NOP	
L_Protocol_Do_Gcode357:
J	L_Protocol_Do_Gcode142
NOP	
L_Protocol_Do_Gcode188:
L_Protocol_Do_Gcode187:
L_Protocol_Do_Gcode186:
;Protocol.c,594 :: 		G_Val *= 10;
L_Protocol_Do_Gcode142:
;Protocol.c,595 :: 		}else{
J	L_Protocol_Do_Gcode143
NOP	
L_Protocol_Do_Gcode139:
;Protocol.c,597 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 28
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LW	R25, 20(SP)
;Protocol.c,598 :: 		}
L_Protocol_Do_Gcode143:
;Protocol.c,607 :: 		}
L_Protocol_Do_Gcode138:
;Protocol.c,609 :: 		while(DMA_IsOn(1));
L_Protocol_Do_Gcode144:
SH	R26, 20(SP)
SW	R25, 24(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 24(SP)
LH	R26, 20(SP)
BNE	R2, R0, L_Protocol_Do_Gcode359
NOP	
J	L_Protocol_Do_Gcode145
NOP	
L_Protocol_Do_Gcode359:
J	L_Protocol_Do_Gcode144
NOP	
L_Protocol_Do_Gcode145:
;Protocol.c,610 :: 		dma_printf("%d [%s]\n",i,gcode[i]);
LH	R2, 38(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
ADDIU	R23, SP, 42
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 42
SH	R26, 20(SP)
SW	R25, 24(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R2, 50(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 24(SP)
LH	R26, 20(SP)
;Protocol.c,584 :: 		for(i=0; i < num_of_strings; i++){
LH	R2, 38(SP)
ADDIU	R2, R2, 1
SH	R2, 38(SP)
;Protocol.c,612 :: 		}
J	L_Protocol_Do_Gcode135
NOP	
L_Protocol_Do_Gcode136:
;Protocol.c,615 :: 		return num_of_strings;
LH	R2, 40(SP)
;Protocol.c,616 :: 		}
;Protocol.c,615 :: 		return num_of_strings;
;Protocol.c,616 :: 		}
L_end_Do_Gcode:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of Protocol_Do_Gcode
