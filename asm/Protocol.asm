_Init_Protocol:
;Protocol.c,35 :: 		void Init_Protocol(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,36 :: 		startup = 0;
SB	R0, Offset(-1610603008)(GP)
;Protocol.c,37 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,38 :: 		}
L_end_Init_Protocol:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_Protocol
_Str_Initialize:
;Protocol.c,41 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,43 :: 		for(i = 0; i < arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 20
BNE	R2, R0, L__Str_Initialize274
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize274:
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
;Protocol.c,43 :: 		for(i = 0; i < arr_size;i++){
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
BNE	R2, R0, L_Protocol_strsplit277
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit277:
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
BNE	R3, R2, L_Protocol_strsplit279
NOP	
J	L_Protocol_strsplit217
NOP	
L_Protocol_strsplit279:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit281
NOP	
J	L_Protocol_strsplit216
NOP	
L_Protocol_strsplit281:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit282
NOP	
J	L_Protocol_strsplit215
NOP	
L_Protocol_strsplit282:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit217:
L_Protocol_strsplit216:
L_Protocol_strsplit215:
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
BEQ	R2, R0, L_Protocol_strsplit283
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit283:
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
BNE	R2, R0, L_Protocol_strsplit2285
NOP	
J	L_Protocol_strsplit2232
NOP	
L_Protocol_strsplit2285:
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
BNE	R3, R2, L_Protocol_strsplit2287
NOP	
J	L_Protocol_strsplit2223
NOP	
L_Protocol_strsplit2287:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2289
NOP	
J	L_Protocol_strsplit2222
NOP	
L_Protocol_strsplit2289:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2290
NOP	
J	L_Protocol_strsplit2221
NOP	
L_Protocol_strsplit2290:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2223:
L_Protocol_strsplit2222:
L_Protocol_strsplit2221:
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
BEQ	R2, R0, L_Protocol_strsplit2291
NOP	
J	L_Protocol_strsplit2230
NOP	
L_Protocol_strsplit2291:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2293
NOP	
J	L_Protocol_strsplit2231
NOP	
L_Protocol_strsplit2293:
L_Protocol_strsplit2219:
;Protocol.c,97 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2294
NOP	
J	L_Protocol_strsplit2228
NOP	
L_Protocol_strsplit2294:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2295
NOP	
J	L_Protocol_strsplit2229
NOP	
L_Protocol_strsplit2295:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2218:
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
J	L_Protocol_strsplit2225
NOP	
L_Protocol_strsplit2228:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2225:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2224
NOP	
L_Protocol_strsplit2229:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2224:
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
J	L_Protocol_strsplit2227
NOP	
L_Protocol_strsplit2230:
L_Protocol_strsplit2227:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2226
NOP	
L_Protocol_strsplit2231:
L_Protocol_strsplit2226:
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
BEQ	R2, R0, L_Protocol_strsplit2296
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2296:
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
L_Protocol_strsplit2232:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str299
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str299:
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
BNE	R2, R0, L_Protocol_str2int301
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int301:
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
BNE	R2, R0, L_Protocol_str2int303
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int303:
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
;Protocol.c,165 :: 		unsigned int pending = Serial_TakeRealtime();
SW	R25, 4(SP)
JAL	_Serial_TakeRealtime+0
NOP	
SH	R2, 10(SP)
;Protocol.c,166 :: 		if(pending & EXEC_RESET){
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime306
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime306:
;Protocol.c,167 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,168 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,169 :: 		pending &= ~EXEC_RESET;
LHU	R3, 10(SP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, 10(SP)
;Protocol.c,170 :: 		}
L_protocol_execute_runtime32:
;Protocol.c,172 :: 		if(Limits_TakeEvent()){
JAL	_Limits_TakeEvent+0
NOP	
BNE	R2, R0, L__protocol_execute_runtime308
NOP	
J	L_protocol_execute_runtime33
NOP	
L__protocol_execute_runtime308:
;Protocol.c,173 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,174 :: 		sys.execute |= EXEC_CRIT_EVENT;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 64
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,175 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,176 :: 		sys.execute |= pending;
LHU	R3, 10(SP)
LH	R2, Offset(_sys+26)(GP)
OR	R2, R2, R3
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,177 :: 		if (sys.execute) { // Enter only if any bit flag is true
BNE	R2, R0, L__protocol_execute_runtime310
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime310:
;Protocol.c,178 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
LH	R2, Offset(_sys+26)(GP)
SH	R2, 8(SP)
;Protocol.c,183 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime312
NOP	
J	L_protocol_execute_runtime35
NOP	
L__protocol_execute_runtime312:
;Protocol.c,184 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,187 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
LH	R2, 8(SP)
ANDI	R2, R2, 64
BNE	R2, R0, L__protocol_execute_runtime314
NOP	
J	L_protocol_execute_runtime36
NOP	
L__protocol_execute_runtime314:
;Protocol.c,188 :: 		report_alarm_message(ALARM_HARD_LIMIT);
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,189 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
;Protocol.c,190 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,191 :: 		do {
L_protocol_execute_runtime37:
;Protocol.c,192 :: 		Ethernet_Transport_Poll(); // a TCP host's Ctrl-X arrives through here
JAL	_Ethernet_Transport_Poll+0
NOP	
;Protocol.c,193 :: 		if(Serial_TakeRealtime() & EXEC_RESET){
JAL	_Serial_TakeRealtime+0
NOP	
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime316
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime316:
;Protocol.c,194 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,195 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,196 :: 		}
L_protocol_execute_runtime40:
;Protocol.c,197 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime318
NOP	
J	L_protocol_execute_runtime37
NOP	
L__protocol_execute_runtime318:
;Protocol.c,200 :: 		} else {
J	L_protocol_execute_runtime41
NOP	
L_protocol_execute_runtime36:
;Protocol.c,204 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
;Protocol.c,205 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,206 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,207 :: 		}
L_protocol_execute_runtime35:
;Protocol.c,210 :: 		if (rt_exec & EXEC_RESET) {
LH	R2, 8(SP)
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime320
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime320:
;Protocol.c,211 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,212 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,213 :: 		}
L_protocol_execute_runtime42:
;Protocol.c,216 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
LH	R2, 8(SP)
ANDI	R2, R2, 1
BNE	R2, R0, L__protocol_execute_runtime322
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime322:
;Protocol.c,217 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,218 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,219 :: 		}
L_protocol_execute_runtime43:
;Protocol.c,222 :: 		if (rt_exec & EXEC_FEED_HOLD) {
LH	R2, 8(SP)
ANDI	R2, R2, 8
BNE	R2, R0, L__protocol_execute_runtime324
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime324:
;Protocol.c,225 :: 		if (sys.state == STATE_IDLE) sys.state = STATE_HOLD;
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__protocol_execute_runtime325
NOP	
J	L_protocol_execute_runtime45
NOP	
L__protocol_execute_runtime325:
ORI	R2, R0, 4
SH	R2, Offset(_sys+2)(GP)
L_protocol_execute_runtime45:
;Protocol.c,226 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,227 :: 		}
L_protocol_execute_runtime44:
;Protocol.c,231 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
LH	R2, 8(SP)
ANDI	R2, R2, 4
BNE	R2, R0, L__protocol_execute_runtime327
NOP	
J	L_protocol_execute_runtime46
NOP	
L__protocol_execute_runtime327:
;Protocol.c,233 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,234 :: 		}
L_protocol_execute_runtime46:
;Protocol.c,236 :: 		if (rt_exec & EXEC_CYCLE_START) {
LH	R2, 8(SP)
ANDI	R2, R2, 2
BNE	R2, R0, L__protocol_execute_runtime329
NOP	
J	L_protocol_execute_runtime47
NOP	
L__protocol_execute_runtime329:
;Protocol.c,239 :: 		if (sys.state == STATE_HOLD) sys.state = STATE_IDLE;
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__protocol_execute_runtime330
NOP	
J	L_protocol_execute_runtime48
NOP	
L__protocol_execute_runtime330:
SH	R0, Offset(_sys+2)(GP)
L_protocol_execute_runtime48:
;Protocol.c,240 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime332
NOP	
J	L_protocol_execute_runtime49
NOP	
L__protocol_execute_runtime332:
;Protocol.c,241 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,242 :: 		}
L_protocol_execute_runtime49:
;Protocol.c,243 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,244 :: 		}
L_protocol_execute_runtime47:
;Protocol.c,245 :: 		}
L_protocol_execute_runtime34:
;Protocol.c,249 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,253 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,257 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check335
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check335:
;Protocol.c,259 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,270 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,273 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,274 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,275 :: 		startup = 0;
SB	R0, Offset(-1610603008)(GP)
;Protocol.c,276 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,277 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check337
NOP	
J	L_protocol_system_check51
NOP	
L__protocol_system_check337:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check51:
;Protocol.c,287 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check338
NOP	
J	L__protocol_system_check235
NOP	
L__protocol_system_check338:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check340
NOP	
J	L__protocol_system_check234
NOP	
L__protocol_system_check340:
L__protocol_system_check233:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check235:
L__protocol_system_check234:
;Protocol.c,291 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check341
NOP	
J	L_protocol_system_check55
NOP	
L__protocol_system_check341:
;Protocol.c,292 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,293 :: 		} else {
J	L_protocol_system_check56
NOP	
L_protocol_system_check55:
;Protocol.c,295 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,297 :: 		}
L_protocol_system_check56:
;Protocol.c,298 :: 		}
L_protocol_system_check50:
;Protocol.c,299 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
_Sample_Gocde_Line:
;Protocol.c,304 :: 		int Sample_Gocde_Line(){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Protocol.c,307 :: 		result = Serial_ReadLine(str);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_Serial_ReadLine+0
NOP	
; result start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,308 :: 		if(result == SERIAL_LINE_NONE) return STATUS_OK;
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line343
NOP	
J	L_Sample_Gocde_Line57
NOP	
L__Sample_Gocde_Line343:
; result end address is: 16 (R4)
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
L_Sample_Gocde_Line57:
;Protocol.c,309 :: 		if(result == SERIAL_LINE_TOO_LONG || result == SERIAL_LINE_RX_ERROR){
; result start address is: 16 (R4)
SEH	R3, R4
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Sample_Gocde_Line345
NOP	
J	L__Sample_Gocde_Line267
NOP	
L__Sample_Gocde_Line345:
SEH	R3, R4
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__Sample_Gocde_Line347
NOP	
J	L__Sample_Gocde_Line266
NOP	
L__Sample_Gocde_Line347:
; result end address is: 16 (R4)
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line267:
; result start address is: 16 (R4)
L__Sample_Gocde_Line266:
;Protocol.c,310 :: 		report_status_message(result == SERIAL_LINE_TOO_LONG ? STATUS_LINE_OVERFLOW : STATUS_SERIAL_RX_ERROR);
SEH	R3, R4
; result end address is: 16 (R4)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__Sample_Gocde_Line348
NOP	
J	L_Sample_Gocde_Line61
NOP	
L__Sample_Gocde_Line348:
; ?FLOC___Sample_Gocde_Line?T171 start address is: 8 (R2)
ORI	R2, R0, 15
; ?FLOC___Sample_Gocde_Line?T171 end address is: 8 (R2)
J	L_Sample_Gocde_Line62
NOP	
L_Sample_Gocde_Line61:
; ?FLOC___Sample_Gocde_Line?T171 start address is: 8 (R2)
ORI	R2, R0, 16
; ?FLOC___Sample_Gocde_Line?T171 end address is: 8 (R2)
L_Sample_Gocde_Line62:
; ?FLOC___Sample_Gocde_Line?T171 start address is: 8 (R2)
SEB	R25, R2
; ?FLOC___Sample_Gocde_Line?T171 end address is: 8 (R2)
JAL	_report_status_message+0
NOP	
;Protocol.c,311 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,312 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,313 :: 		if(sys.abort || (sys.execute & EXEC_RESET)) return STATUS_NO_REPORT;
LH	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Gocde_Line349
NOP	
J	L__Sample_Gocde_Line269
NOP	
L__Sample_Gocde_Line349:
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
BEQ	R2, R0, L__Sample_Gocde_Line350
NOP	
J	L__Sample_Gocde_Line268
NOP	
L__Sample_Gocde_Line350:
J	L_Sample_Gocde_Line65
NOP	
L__Sample_Gocde_Line269:
L__Sample_Gocde_Line268:
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
L_Sample_Gocde_Line65:
;Protocol.c,314 :: 		dif = strlen(str);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,315 :: 		if(dif == 0){
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line351
NOP	
J	L_Sample_Gocde_Line66
NOP	
L__Sample_Gocde_Line351:
; dif end address is: 16 (R4)
;Protocol.c,316 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Protocol.c,317 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,318 :: 		}
L_Sample_Gocde_Line66:
;Protocol.c,319 :: 		if(str[0] == '$'){
; dif start address is: 16 (R4)
ADDIU	R2, SP, 12
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Gocde_Line352
NOP	
J	L_Sample_Gocde_Line67
NOP	
L__Sample_Gocde_Line352:
;Protocol.c,320 :: 		Check_Query_Type(str,dif);
ADDIU	R2, SP, 12
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
;Protocol.c,321 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,322 :: 		}
L_Sample_Gocde_Line67:
;Protocol.c,323 :: 		if(sys.state == STATE_ALARM){
; dif start address is: 16 (R4)
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Gocde_Line353
NOP	
J	L_Sample_Gocde_Line68
NOP	
L__Sample_Gocde_Line353:
; dif end address is: 16 (R4)
;Protocol.c,324 :: 		report_status_message(STATUS_ALARM_LOCK);
ORI	R25, R0, 12
JAL	_report_status_message+0
NOP	
;Protocol.c,325 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,326 :: 		}
L_Sample_Gocde_Line68:
;Protocol.c,330 :: 		state = Do_Gcode(str,dif);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 12
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Gcode+0
NOP	
; state start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,335 :: 		if(state != STATUS_OK || sys.state == STATE_CHECK_MODE){
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line354
NOP	
J	L__Sample_Gocde_Line271
NOP	
L__Sample_Gocde_Line354:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__Sample_Gocde_Line356
NOP	
J	L__Sample_Gocde_Line270
NOP	
L__Sample_Gocde_Line356:
; state end address is: 16 (R4)
J	L_Sample_Gocde_Line71
NOP	
L__Sample_Gocde_Line271:
; state start address is: 16 (R4)
L__Sample_Gocde_Line270:
;Protocol.c,336 :: 		report_status_message(state);
SEH	R25, R4
; state end address is: 16 (R4)
JAL	_report_status_message+0
NOP	
;Protocol.c,337 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Protocol.c,338 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,339 :: 		}
L_Sample_Gocde_Line71:
;Protocol.c,340 :: 		return STATUS_COMMAND_EXECUTE_MOTION;
ORI	R2, R0, 20
;Protocol.c,341 :: 		}
;Protocol.c,340 :: 		return STATUS_COMMAND_EXECUTE_MOTION;
;Protocol.c,341 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Machine_Busy:
;Protocol.c,343 :: 		static int Machine_Busy(){
;Protocol.c,344 :: 		return (sys.state == STATE_CYCLE || sys.state == STATE_HOLD ||
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L_Protocol_Machine_Busy359
NOP	
J	L_Protocol_Machine_Busy73
NOP	
L_Protocol_Machine_Busy359:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_Protocol_Machine_Busy361
NOP	
J	L_Protocol_Machine_Busy73
NOP	
L_Protocol_Machine_Busy361:
;Protocol.c,345 :: 		sys.state == STATE_HOMING || sys.state == STATE_JOG);
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L_Protocol_Machine_Busy363
NOP	
J	L_Protocol_Machine_Busy73
NOP	
L_Protocol_Machine_Busy363:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 8
BNE	R3, R2, L_Protocol_Machine_Busy365
NOP	
J	L_Protocol_Machine_Busy73
NOP	
L_Protocol_Machine_Busy365:
MOVZ	R2, R0, R0
J	L_Protocol_Machine_Busy72
NOP	
L_Protocol_Machine_Busy73:
ORI	R2, R0, 1
L_Protocol_Machine_Busy72:
ANDI	R2, R2, 255
;Protocol.c,346 :: 		}
L_end_Machine_Busy:
JR	RA
NOP	
; end of Protocol_Machine_Busy
Protocol_Check_Query_Type:
;Protocol.c,350 :: 		static int Check_Query_Type(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,353 :: 		int status = STATUS_OK;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SH	R30, 34(SP)
;Protocol.c,358 :: 		if(str_[0] == '$'){
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type367
NOP	
J	L_Protocol_Check_Query_Type74
NOP	
L_Protocol_Check_Query_Type367:
;Protocol.c,360 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type75
NOP	
;Protocol.c,361 :: 		case '$': case '#': case 'G': case 'C': case 'X': case 'H': case 'I':
L_Protocol_Check_Query_Type77:
L_Protocol_Check_Query_Type78:
L_Protocol_Check_Query_Type79:
L_Protocol_Check_Query_Type80:
L_Protocol_Check_Query_Type81:
L_Protocol_Check_Query_Type82:
L_Protocol_Check_Query_Type83:
;Protocol.c,362 :: 		if(str_[2] != 0){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_Check_Query_Type369
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type369:
;Protocol.c,363 :: 		report_status_message(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_report_status_message+0
NOP	
;Protocol.c,364 :: 		return STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
J	L_end_Check_Query_Type
NOP	
;Protocol.c,365 :: 		}
L_Protocol_Check_Query_Type84:
;Protocol.c,366 :: 		}
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type75:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type371
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type371:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type373
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type373:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type375
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type375:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type377
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type377:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type379
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type379:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type381
NOP	
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type381:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Check_Query_Type383
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type383:
L_Protocol_Check_Query_Type76:
;Protocol.c,367 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type85
NOP	
;Protocol.c,368 :: 		case '\0': case '\r' :case '\n' :
L_Protocol_Check_Query_Type87:
L_Protocol_Check_Query_Type88:
L_Protocol_Check_Query_Type89:
;Protocol.c,369 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,370 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,371 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,372 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type90:
;Protocol.c,373 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,374 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,375 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,376 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type91:
;Protocol.c,377 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,378 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,379 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,380 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type92:
;Protocol.c,381 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,382 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,383 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,384 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type93:
;Protocol.c,385 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,393 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type384
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type384:
;Protocol.c,394 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,395 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,396 :: 		} else if (sys.state) {
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type94:
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type386
NOP	
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type386:
;Protocol.c,397 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,398 :: 		} else {
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type96:
;Protocol.c,399 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,400 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,401 :: 		}
L_Protocol_Check_Query_Type97:
L_Protocol_Check_Query_Type95:
;Protocol.c,402 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,403 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type98:
;Protocol.c,404 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type387
NOP	
J	L_Protocol_Check_Query_Type99
NOP	
L_Protocol_Check_Query_Type387:
;Protocol.c,405 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,406 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,408 :: 		}
L_Protocol_Check_Query_Type99:
;Protocol.c,409 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,410 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,411 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type100:
;Protocol.c,414 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 34(SP)
;Protocol.c,415 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,449 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type101:
;Protocol.c,450 :: 		if ( str_[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type388
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type388:
;Protocol.c,451 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
SH	R0, 24(SP)
L_Protocol_Check_Query_Type103:
LH	R2, 24(SP)
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type389
NOP	
J	L_Protocol_Check_Query_Type104
NOP	
L_Protocol_Check_Query_Type389:
;Protocol.c,452 :: 		if ((settings_read_startup_line(helper_var, str_))) {
SH	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
LH	R25, 24(SP)
JAL	_settings_read_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type391
NOP	
J	L_Protocol_Check_Query_Type106
NOP	
L_Protocol_Check_Query_Type391:
;Protocol.c,453 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
;Protocol.c,454 :: 		break;
J	L_Protocol_Check_Query_Type104
NOP	
;Protocol.c,455 :: 		}
L_Protocol_Check_Query_Type106:
;Protocol.c,456 :: 		report_startup_line(helper_var,str_);
SH	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
LH	R25, 24(SP)
JAL	_report_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
;Protocol.c,451 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
LH	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;Protocol.c,461 :: 		}
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type104:
;Protocol.c,462 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,463 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type102:
;Protocol.c,464 :: 		int N_Val = 0;
;Protocol.c,465 :: 		helper_var = 1;  // Set helper_var to flag storing method.
ORI	R2, R0, 1
SH	R2, 24(SP)
;Protocol.c,470 :: 		if ( str_[2] >= '0'  &&  str_[2] < '0' + N_STARTUP_LINE ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type392
NOP	
J	L_Protocol_Check_Query_Type240
NOP	
L_Protocol_Check_Query_Type392:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 50
BNE	R2, R0, L_Protocol_Check_Query_Type393
NOP	
J	L_Protocol_Check_Query_Type239
NOP	
L_Protocol_Check_Query_Type393:
L_Protocol_Check_Query_Type238:
;Protocol.c,471 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,473 :: 		num[0] = str_[2];
ADDIU	R3, SP, 26
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,474 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,481 :: 		}else {
J	L_Protocol_Check_Query_Type111
NOP	
; N_Val end address is: 16 (R4)
;Protocol.c,470 :: 		if ( str_[2] >= '0'  &&  str_[2] < '0' + N_STARTUP_LINE ) {
L_Protocol_Check_Query_Type240:
L_Protocol_Check_Query_Type239:
;Protocol.c,482 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 34(SP)
;Protocol.c,483 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,484 :: 		}
L_Protocol_Check_Query_Type111:
;Protocol.c,487 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
LH	R2, 24(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type395
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type395:
;Protocol.c,488 :: 		int str_len = 0;
;Protocol.c,489 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type397
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type397:
; N_Val end address is: 16 (R4)
;Protocol.c,491 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,494 :: 		helper_var = strlen((str_));
JAL	_strlen+0
NOP	
;Protocol.c,503 :: 		str_len = strlen(str_);
JAL	_strlen+0
NOP	
;Protocol.c,508 :: 		}else{
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type113:
;Protocol.c,509 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,517 :: 		if(Machine_Busy())
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type399
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type399:
; N_Val end address is: 16 (R4)
;Protocol.c,518 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type115:
;Protocol.c,519 :: 		else if(settings_store_startup_line(N_Val,str_+4))
; N_Val start address is: 16 (R4)
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type401
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type401:
;Protocol.c,520 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
L_Protocol_Check_Query_Type117:
L_Protocol_Check_Query_Type116:
;Protocol.c,521 :: 		}
L_Protocol_Check_Query_Type114:
;Protocol.c,523 :: 		}
L_Protocol_Check_Query_Type112:
;Protocol.c,525 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,526 :: 		case 'I' : // Print build info (Grbl 1.1)
L_Protocol_Check_Query_Type118:
;Protocol.c,527 :: 		report_build_info();
JAL	_report_build_info+0
NOP	
;Protocol.c,528 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,529 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,530 :: 		case 'J' : // TODO: $J= jogging, parse as a G1 block and run it as STATE_JOG.
L_Protocol_Check_Query_Type119:
;Protocol.c,531 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 34(SP)
;Protocol.c,532 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,533 :: 		case 'R' : // $RST=$ defaults, $RST=# offsets, $RST=* everything
L_Protocol_Check_Query_Type120:
;Protocol.c,534 :: 		if(strncmp(str_+1,"RST=",4)){
ORI	R30, R0, 82
SB	R30, 28(SP)
ORI	R30, R0, 83
SB	R30, 29(SP)
ORI	R30, R0, 84
SB	R30, 30(SP)
ORI	R30, R0, 61
SB	R30, 31(SP)
MOVZ	R30, R0, R0
SB	R30, 32(SP)
ADDIU	R3, SP, 28
ADDIU	R2, R25, 1
SW	R25, 16(SP)
ORI	R27, R0, 4
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type403
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type403:
;Protocol.c,535 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,536 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,537 :: 		}
L_Protocol_Check_Query_Type121:
;Protocol.c,538 :: 		switch(str_[5]){
ADDIU	R4, R25, 5
J	L_Protocol_Check_Query_Type122
NOP	
;Protocol.c,539 :: 		case '$': helper_var = SETTINGS_RESTORE_DEFAULTS;   break;
L_Protocol_Check_Query_Type124:
ORI	R2, R0, 1
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type123
NOP	
;Protocol.c,540 :: 		case '#': helper_var = SETTINGS_RESTORE_PARAMETERS; break;
L_Protocol_Check_Query_Type125:
ORI	R2, R0, 2
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type123
NOP	
;Protocol.c,541 :: 		case '*': helper_var = SETTINGS_RESTORE_ALL;        break;
L_Protocol_Check_Query_Type126:
ORI	R2, R0, 255
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type123
NOP	
;Protocol.c,542 :: 		default : helper_var = 0;                           break;
L_Protocol_Check_Query_Type127:
SH	R0, 24(SP)
J	L_Protocol_Check_Query_Type123
NOP	
;Protocol.c,543 :: 		}
L_Protocol_Check_Query_Type122:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type405
NOP	
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type405:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type407
NOP	
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type407:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 42
BNE	R3, R2, L_Protocol_Check_Query_Type409
NOP	
J	L_Protocol_Check_Query_Type126
NOP	
L_Protocol_Check_Query_Type409:
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type123:
;Protocol.c,544 :: 		if(!helper_var){
LH	R2, 24(SP)
BEQ	R2, R0, L_Protocol_Check_Query_Type410
NOP	
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type410:
;Protocol.c,545 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,546 :: 		}else if(Machine_Busy()){
J	L_Protocol_Check_Query_Type129
NOP	
L_Protocol_Check_Query_Type128:
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type412
NOP	
J	L_Protocol_Check_Query_Type130
NOP	
L_Protocol_Check_Query_Type412:
;Protocol.c,547 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,548 :: 		}else if(settings_restore(helper_var)){
J	L_Protocol_Check_Query_Type131
NOP	
L_Protocol_Check_Query_Type130:
LH	R25, 24(SP)
JAL	_settings_restore+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type414
NOP	
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type414:
;Protocol.c,549 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
;Protocol.c,550 :: 		}else{
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type132:
;Protocol.c,551 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,552 :: 		}
L_Protocol_Check_Query_Type133:
L_Protocol_Check_Query_Type131:
L_Protocol_Check_Query_Type129:
;Protocol.c,553 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,554 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type134:
L_Protocol_Check_Query_Type135:
L_Protocol_Check_Query_Type136:
L_Protocol_Check_Query_Type137:
L_Protocol_Check_Query_Type138:
L_Protocol_Check_Query_Type139:
;Protocol.c,555 :: 		case '6': case '7': case '8': case '9': {
L_Protocol_Check_Query_Type140:
L_Protocol_Check_Query_Type141:
L_Protocol_Check_Query_Type142:
L_Protocol_Check_Query_Type143:
;Protocol.c,557 :: 		char *eq = strchr(str_,'=');
SW	R25, 16(SP)
ORI	R26, R0, 61
JAL	_strchr+0
NOP	
LW	R25, 16(SP)
; eq start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,558 :: 		if((eq == 0) || (!isdigit(eq[1]) && eq[1] != '.' && eq[1] != '-')){
BNE	R2, R0, L_Protocol_Check_Query_Type416
NOP	
J	L_Protocol_Check_Query_Type244
NOP	
L_Protocol_Check_Query_Type416:
ADDIU	R2, R4, 1
SW	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BEQ	R2, R0, L_Protocol_Check_Query_Type417
NOP	
J	L_Protocol_Check_Query_Type243
NOP	
L_Protocol_Check_Query_Type417:
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 46
BNE	R3, R2, L_Protocol_Check_Query_Type419
NOP	
J	L_Protocol_Check_Query_Type242
NOP	
L_Protocol_Check_Query_Type419:
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 45
BNE	R3, R2, L_Protocol_Check_Query_Type421
NOP	
J	L_Protocol_Check_Query_Type241
NOP	
L_Protocol_Check_Query_Type421:
; eq end address is: 16 (R4)
J	L_Protocol_Check_Query_Type236
NOP	
L_Protocol_Check_Query_Type243:
; eq start address is: 16 (R4)
L_Protocol_Check_Query_Type242:
L_Protocol_Check_Query_Type241:
J	L_Protocol_Check_Query_Type148
NOP	
; eq end address is: 16 (R4)
L_Protocol_Check_Query_Type236:
L_Protocol_Check_Query_Type244:
;Protocol.c,559 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 34(SP)
;Protocol.c,560 :: 		}else if(Machine_Busy()){
J	L_Protocol_Check_Query_Type149
NOP	
L_Protocol_Check_Query_Type148:
; eq start address is: 16 (R4)
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type423
NOP	
J	L_Protocol_Check_Query_Type150
NOP	
L_Protocol_Check_Query_Type423:
; eq end address is: 16 (R4)
;Protocol.c,561 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,562 :: 		}else{
J	L_Protocol_Check_Query_Type151
NOP	
L_Protocol_Check_Query_Type150:
;Protocol.c,563 :: 		int N_Val = atoi(str_+1);
; eq start address is: 16 (R4)
ADDIU	R2, R25, 1
SW	R4, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R4, 16(SP)
; N_Val start address is: 28 (R7)
SEH	R7, R2
;Protocol.c,564 :: 		float value = atof(eq+1);
ADDIU	R2, R4, 1
; eq end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,569 :: 		status = settings_store_grbl_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_grbl_setting+0
NOP	
SH	R2, 34(SP)
;Protocol.c,570 :: 		}
L_Protocol_Check_Query_Type151:
L_Protocol_Check_Query_Type149:
;Protocol.c,571 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,573 :: 		default:
L_Protocol_Check_Query_Type152:
;Protocol.c,574 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,575 :: 		break;
J	L_Protocol_Check_Query_Type86
NOP	
;Protocol.c,576 :: 		}       //report on status messages
L_Protocol_Check_Query_Type85:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_Check_Query_Type425
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type425:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type427
NOP	
J	L_Protocol_Check_Query_Type88
NOP	
L_Protocol_Check_Query_Type427:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type429
NOP	
J	L_Protocol_Check_Query_Type89
NOP	
L_Protocol_Check_Query_Type429:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type431
NOP	
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type431:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type433
NOP	
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type433:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type435
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type435:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type437
NOP	
J	L_Protocol_Check_Query_Type93
NOP	
L_Protocol_Check_Query_Type437:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type439
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type439:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type441
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type441:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type443
NOP	
J	L_Protocol_Check_Query_Type101
NOP	
L_Protocol_Check_Query_Type443:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Check_Query_Type445
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type445:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Check_Query_Type447
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type447:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L_Protocol_Check_Query_Type449
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type449:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type451
NOP	
J	L_Protocol_Check_Query_Type134
NOP	
L_Protocol_Check_Query_Type451:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type453
NOP	
J	L_Protocol_Check_Query_Type135
NOP	
L_Protocol_Check_Query_Type453:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type455
NOP	
J	L_Protocol_Check_Query_Type136
NOP	
L_Protocol_Check_Query_Type455:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type457
NOP	
J	L_Protocol_Check_Query_Type137
NOP	
L_Protocol_Check_Query_Type457:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type459
NOP	
J	L_Protocol_Check_Query_Type138
NOP	
L_Protocol_Check_Query_Type459:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type461
NOP	
J	L_Protocol_Check_Query_Type139
NOP	
L_Protocol_Check_Query_Type461:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type463
NOP	
J	L_Protocol_Check_Query_Type140
NOP	
L_Protocol_Check_Query_Type463:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type465
NOP	
J	L_Protocol_Check_Query_Type141
NOP	
L_Protocol_Check_Query_Type465:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type467
NOP	
J	L_Protocol_Check_Query_Type142
NOP	
L_Protocol_Check_Query_Type467:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type469
NOP	
J	L_Protocol_Check_Query_Type143
NOP	
L_Protocol_Check_Query_Type469:
J	L_Protocol_Check_Query_Type152
NOP	
L_Protocol_Check_Query_Type86:
;Protocol.c,577 :: 		report_status_message(status);
LH	R25, 34(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,579 :: 		return status;
LH	R2, 34(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,580 :: 		}else{
L_Protocol_Check_Query_Type74:
;Protocol.c,583 :: 		return status;
ORI	R2, R0, 20
;Protocol.c,584 :: 		}
;Protocol.c,583 :: 		return status;
;Protocol.c,584 :: 		}
L_end_Check_Query_Type:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Protocol_Check_Query_Type
Protocol_gcode_words:
;Protocol.c,589 :: 		static int gcode_words(char *line){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,590 :: 		int n = 0, k = 0, in_comment = 0;
; n start address is: 20 (R5)
MOVZ	R5, R0, R0
; k start address is: 24 (R6)
MOVZ	R6, R0, R0
; in_comment start address is: 16 (R4)
MOVZ	R4, R0, R0
;Protocol.c,592 :: 		Str_Initialize(gcode);
SH	R4, 4(SP)
SH	R5, 6(SP)
SW	R25, 8(SP)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Str_Initialize+0
NOP	
; n end address is: 20 (R5)
LW	R25, 8(SP)
LH	R5, 6(SP)
LH	R4, 4(SP)
;Protocol.c,593 :: 		while((ch = *line++) != 0){
L_Protocol_gcode_words154:
; in_comment start address is: 16 (R4)
; in_comment end address is: 16 (R4)
; k start address is: 24 (R6)
; k end address is: 24 (R6)
; n start address is: 20 (R5)
MOVZ	R3, R25, R0
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
LBU	R2, 0(R3)
; ch start address is: 28 (R7)
ANDI	R7, R2, 255
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_gcode_words472
NOP	
J	L_Protocol_gcode_words155
NOP	
L_Protocol_gcode_words472:
; in_comment end address is: 16 (R4)
; k end address is: 24 (R6)
;Protocol.c,594 :: 		if(in_comment){
; k start address is: 24 (R6)
; in_comment start address is: 16 (R4)
BNE	R4, R0, L_Protocol_gcode_words474
NOP	
J	L_Protocol_gcode_words156
NOP	
L_Protocol_gcode_words474:
;Protocol.c,595 :: 		if(ch == ')') in_comment = 0;
ANDI	R3, R7, 255
; ch end address is: 28 (R7)
ORI	R2, R0, 41
BEQ	R3, R2, L_Protocol_gcode_words475
NOP	
J	L_Protocol_gcode_words258
NOP	
L_Protocol_gcode_words475:
; in_comment end address is: 16 (R4)
; in_comment start address is: 8 (R2)
MOVZ	R2, R0, R0
; in_comment end address is: 8 (R2)
SEH	R4, R2
J	L_Protocol_gcode_words157
NOP	
L_Protocol_gcode_words258:
L_Protocol_gcode_words157:
;Protocol.c,596 :: 		continue;
; in_comment start address is: 16 (R4)
J	L_Protocol_gcode_words154
NOP	
;Protocol.c,597 :: 		}
L_Protocol_gcode_words156:
;Protocol.c,598 :: 		if(ch == '(') { in_comment = 1; continue; }
; ch start address is: 28 (R7)
ANDI	R3, R7, 255
ORI	R2, R0, 40
BEQ	R3, R2, L_Protocol_gcode_words476
NOP	
J	L_Protocol_gcode_words158
NOP	
L_Protocol_gcode_words476:
; ch end address is: 28 (R7)
ORI	R4, R0, 1
J	L_Protocol_gcode_words154
NOP	
L_Protocol_gcode_words158:
;Protocol.c,599 :: 		if(ch == ';') break;
; ch start address is: 28 (R7)
ANDI	R3, R7, 255
ORI	R2, R0, 59
BEQ	R3, R2, L_Protocol_gcode_words477
NOP	
J	L_Protocol_gcode_words159
NOP	
L_Protocol_gcode_words477:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
J	L_Protocol_gcode_words155
NOP	
L_Protocol_gcode_words159:
;Protocol.c,600 :: 		if(ch == ' ' || ch == '\t') continue;
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
ANDI	R3, R7, 255
ORI	R2, R0, 32
BNE	R3, R2, L_Protocol_gcode_words479
NOP	
J	L_Protocol_gcode_words250
NOP	
L_Protocol_gcode_words479:
ANDI	R3, R7, 255
ORI	R2, R0, 9
BNE	R3, R2, L_Protocol_gcode_words481
NOP	
J	L_Protocol_gcode_words249
NOP	
L_Protocol_gcode_words481:
J	L_Protocol_gcode_words162
NOP	
; ch end address is: 28 (R7)
L_Protocol_gcode_words250:
L_Protocol_gcode_words249:
J	L_Protocol_gcode_words154
NOP	
L_Protocol_gcode_words162:
;Protocol.c,601 :: 		ch = toupper(ch);
; ch start address is: 28 (R7)
SW	R25, 4(SP)
; ch end address is: 28 (R7)
ANDI	R25, R7, 255
JAL	_toupper+0
NOP	
LW	R25, 4(SP)
; ch start address is: 28 (R7)
ANDI	R7, R2, 255
;Protocol.c,602 :: 		if(ch >= 'A' && ch <= 'Z'){
ANDI	R2, R2, 255
SLTIU	R2, R2, 65
BEQ	R2, R0, L_Protocol_gcode_words482
NOP	
J	L_Protocol_gcode_words252
NOP	
L_Protocol_gcode_words482:
ANDI	R2, R7, 255
SLTIU	R2, R2, 91
BNE	R2, R0, L_Protocol_gcode_words483
NOP	
J	L_Protocol_gcode_words251
NOP	
L_Protocol_gcode_words483:
; k end address is: 24 (R6)
L_Protocol_gcode_words247:
;Protocol.c,603 :: 		if(n >= arr_size) return -1;
SEH	R2, R5
SLTI	R2, R2, 20
BEQ	R2, R0, L_Protocol_gcode_words484
NOP	
J	L_Protocol_gcode_words166
NOP	
L_Protocol_gcode_words484:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; n end address is: 20 (R5)
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
L_Protocol_gcode_words166:
;Protocol.c,604 :: 		k = 0;
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
MOVZ	R6, R0, R0
;Protocol.c,605 :: 		gcode[n++][k++] = ch;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SB	R7, 0(R2)
; ch end address is: 28 (R7)
ADDIU	R2, R5, 1
; n end address is: 20 (R5)
; n start address is: 12 (R3)
SEH	R3, R2
ADDIU	R2, R6, 1
; k end address is: 24 (R6)
; k start address is: 8 (R2)
;Protocol.c,606 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
SEH	R5, R3
; n end address is: 12 (R3)
; k end address is: 8 (R2)
SEH	R6, R2
J	L_Protocol_gcode_words167
NOP	
;Protocol.c,602 :: 		if(ch >= 'A' && ch <= 'Z'){
L_Protocol_gcode_words252:
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
L_Protocol_gcode_words251:
;Protocol.c,606 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
BNE	R5, R0, L_Protocol_gcode_words486
NOP	
J	L_Protocol_gcode_words257
NOP	
L_Protocol_gcode_words486:
SW	R25, 4(SP)
ANDI	R25, R7, 255
JAL	_isdigit+0
NOP	
LW	R25, 4(SP)
BEQ	R2, R0, L_Protocol_gcode_words487
NOP	
J	L_Protocol_gcode_words256
NOP	
L_Protocol_gcode_words487:
ANDI	R3, R7, 255
ORI	R2, R0, 46
BNE	R3, R2, L_Protocol_gcode_words489
NOP	
J	L_Protocol_gcode_words255
NOP	
L_Protocol_gcode_words489:
ANDI	R3, R7, 255
ORI	R2, R0, 45
BNE	R3, R2, L_Protocol_gcode_words491
NOP	
J	L_Protocol_gcode_words254
NOP	
L_Protocol_gcode_words491:
ANDI	R3, R7, 255
ORI	R2, R0, 43
BNE	R3, R2, L_Protocol_gcode_words493
NOP	
J	L_Protocol_gcode_words253
NOP	
L_Protocol_gcode_words493:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
; n end address is: 20 (R5)
J	L_Protocol_gcode_words172
NOP	
L_Protocol_gcode_words256:
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
L_Protocol_gcode_words255:
L_Protocol_gcode_words254:
L_Protocol_gcode_words253:
L_Protocol_gcode_words245:
;Protocol.c,607 :: 		if(k >= str_size-1) return -1;
SEH	R2, R6
SLTI	R2, R2, 63
BEQ	R2, R0, L_Protocol_gcode_words494
NOP	
J	L_Protocol_gcode_words173
NOP	
L_Protocol_gcode_words494:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
; n end address is: 20 (R5)
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
L_Protocol_gcode_words173:
;Protocol.c,608 :: 		gcode[n-1][k++] = ch;
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
ADDIU	R2, R5, -1
SEH	R2, R2
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R3, R2, R3
SEH	R2, R6
ADDU	R2, R3, R2
SB	R7, 0(R2)
; ch end address is: 28 (R7)
ADDIU	R2, R6, 1
; k end address is: 24 (R6)
; k start address is: 8 (R2)
;Protocol.c,609 :: 		}else{
J	L_Protocol_gcode_words174
NOP	
; in_comment end address is: 16 (R4)
; k end address is: 8 (R2)
; n end address is: 20 (R5)
L_Protocol_gcode_words172:
;Protocol.c,606 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
L_Protocol_gcode_words257:
;Protocol.c,610 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
;Protocol.c,611 :: 		}
L_Protocol_gcode_words174:
; n start address is: 20 (R5)
; k start address is: 8 (R2)
; k end address is: 8 (R2)
; n end address is: 20 (R5)
SEH	R6, R2
; in_comment start address is: 16 (R4)
L_Protocol_gcode_words167:
;Protocol.c,612 :: 		}
; k start address is: 24 (R6)
; n start address is: 20 (R5)
; in_comment end address is: 16 (R4)
; k end address is: 24 (R6)
J	L_Protocol_gcode_words154
NOP	
L_Protocol_gcode_words155:
;Protocol.c,613 :: 		return n;
SEH	R2, R5
; n end address is: 20 (R5)
;Protocol.c,614 :: 		}
L_end_gcode_words:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Protocol_gcode_words
Protocol_Do_Gcode:
;Protocol.c,619 :: 		static int Do_Gcode(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,622 :: 		int err = STATUS_OK;
MOVZ	R30, R0, R0
SH	R30, 32(SP)
;Protocol.c,625 :: 		G_Begin_Block();
SW	R25, 4(SP)
JAL	_G_Begin_Block+0
NOP	
;Protocol.c,626 :: 		G_Save_State();
JAL	_G_Save_State+0
NOP	
LW	R25, 4(SP)
;Protocol.c,627 :: 		num_of_strings = gcode_words(str_);
JAL	Protocol_gcode_words+0
NOP	
SH	R2, 20(SP)
;Protocol.c,628 :: 		if(num_of_strings < 0) return STATUS_EXPECTED_COMMAND_LETTER;
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L_Protocol_Do_Gcode496
NOP	
J	L_Protocol_Do_Gcode175
NOP	
L_Protocol_Do_Gcode496:
ORI	R2, R0, 2
J	L_end_Do_Gcode
NOP	
L_Protocol_Do_Gcode175:
;Protocol.c,633 :: 		for(pass=0; pass < 2; pass++)
SH	R0, 18(SP)
L_Protocol_Do_Gcode176:
LH	R2, 18(SP)
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Do_Gcode497
NOP	
J	L_Protocol_Do_Gcode177
NOP	
L_Protocol_Do_Gcode497:
;Protocol.c,634 :: 		for(i=0; i < num_of_strings; i++){
SH	R0, 16(SP)
L_Protocol_Do_Gcode179:
LH	R3, 20(SP)
LH	R2, 16(SP)
SLT	R2, R2, R3
BNE	R2, R0, L_Protocol_Do_Gcode498
NOP	
J	L_Protocol_Do_Gcode180
NOP	
L_Protocol_Do_Gcode498:
;Protocol.c,635 :: 		is_mode = (gcode[i][0] == 'G' || gcode[i][0] == 'M');
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode500
NOP	
J	L_Protocol_Do_Gcode183
NOP	
L_Protocol_Do_Gcode500:
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_Do_Gcode502
NOP	
J	L_Protocol_Do_Gcode183
NOP	
L_Protocol_Do_Gcode502:
MOVZ	R2, R0, R0
J	L_Protocol_Do_Gcode182
NOP	
L_Protocol_Do_Gcode183:
ORI	R2, R0, 1
L_Protocol_Do_Gcode182:
; is_mode start address is: 16 (R4)
ANDI	R4, R2, 255
;Protocol.c,636 :: 		if(is_mode != (pass == 0)) continue;
LH	R2, 18(SP)
XORI	R3, R2, 0
SLTIU	R3, R3, 1
SEH	R2, R4
; is_mode end address is: 16 (R4)
BNE	R2, R3, L_Protocol_Do_Gcode505
NOP	
J	L_Protocol_Do_Gcode184
NOP	
L_Protocol_Do_Gcode505:
J	L_Protocol_Do_Gcode181
NOP	
L_Protocol_Do_Gcode184:
;Protocol.c,637 :: 		num = gcode[i]+1;
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 28(SP)
;Protocol.c,638 :: 		if(*num == 0){
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_Do_Gcode506
NOP	
J	L_Protocol_Do_Gcode185
NOP	
L_Protocol_Do_Gcode506:
;Protocol.c,639 :: 		st = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 24(SP)
;Protocol.c,640 :: 		}else{
J	L_Protocol_Do_Gcode186
NOP	
L_Protocol_Do_Gcode185:
;Protocol.c,641 :: 		st = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,642 :: 		switch(gcode[i][0]){
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SW	R2, 40(SP)
J	L_Protocol_Do_Gcode187
NOP	
;Protocol.c,643 :: 		case 'G':
L_Protocol_Do_Gcode189:
;Protocol.c,646 :: 		Val = (int)(atof(num)*10.0 + 0.5);
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atof+0
NOP	
LW	R25, 4(SP)
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S1, S0, S1
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
CVT36.S 	S0, S0
MFC1	R3, S0
SH	R3, 22(SP)
;Protocol.c,647 :: 		if(Val % 10 == 0){
ORI	R2, R0, 10
DIV	R3, R2
MFHI	R2
SEH	R2, R2
BEQ	R2, R0, L_Protocol_Do_Gcode507
NOP	
J	L_Protocol_Do_Gcode190
NOP	
L_Protocol_Do_Gcode507:
;Protocol.c,648 :: 		Val /= 10;
LH	R3, 22(SP)
ORI	R2, R0, 10
DIV	R3, R2
MFLO	R2
SH	R2, 22(SP)
;Protocol.c,649 :: 		if(Val == 28 || Val == 30 || Val == 92) Val *= 10;
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L_Protocol_Do_Gcode509
NOP	
J	L_Protocol_Do_Gcode262
NOP	
L_Protocol_Do_Gcode509:
LH	R3, 22(SP)
ORI	R2, R0, 30
BNE	R3, R2, L_Protocol_Do_Gcode511
NOP	
J	L_Protocol_Do_Gcode261
NOP	
L_Protocol_Do_Gcode511:
LH	R3, 22(SP)
ORI	R2, R0, 92
BNE	R3, R2, L_Protocol_Do_Gcode513
NOP	
J	L_Protocol_Do_Gcode260
NOP	
L_Protocol_Do_Gcode513:
J	L_Protocol_Do_Gcode193
NOP	
L_Protocol_Do_Gcode262:
L_Protocol_Do_Gcode261:
L_Protocol_Do_Gcode260:
LH	R3, 22(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 22(SP)
L_Protocol_Do_Gcode193:
;Protocol.c,650 :: 		}
L_Protocol_Do_Gcode190:
;Protocol.c,651 :: 		G_Mode(Val);
SH	R26, 4(SP)
SW	R25, 8(SP)
LH	R25, 22(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,652 :: 		st = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,657 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,658 :: 		case 'M':
L_Protocol_Do_Gcode194:
;Protocol.c,659 :: 		M_Mode(atoi(num));
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atoi+0
NOP	
LW	R25, 4(SP)
SH	R26, 4(SP)
SW	R25, 8(SP)
SEH	R25, R2
JAL	_M_Mode+0
NOP	
;Protocol.c,660 :: 		st = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,661 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,662 :: 		case 'X':case 'Y':case 'Z':case 'A':
L_Protocol_Do_Gcode195:
L_Protocol_Do_Gcode196:
L_Protocol_Do_Gcode197:
L_Protocol_Do_Gcode198:
;Protocol.c,663 :: 		case 'I':case 'J':case 'K':case 'R':case 'F':
L_Protocol_Do_Gcode199:
L_Protocol_Do_Gcode200:
L_Protocol_Do_Gcode201:
L_Protocol_Do_Gcode202:
L_Protocol_Do_Gcode203:
;Protocol.c,664 :: 		XYZ_Val = atof(num);
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atof+0
NOP	
LW	R25, 4(SP)
SWC1	S0, 12(SP)
;Protocol.c,665 :: 		st = Instruction_Values(gcode[i],&XYZ_Val);
ADDIU	R4, SP, 12
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SH	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_Instruction_Values+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,670 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,671 :: 		case 'P':case 'L':
L_Protocol_Do_Gcode204:
L_Protocol_Do_Gcode205:
;Protocol.c,672 :: 		case 'S': // TODO: S is also spindle speed, unused until the spindle is driven.
L_Protocol_Do_Gcode206:
;Protocol.c,673 :: 		if(gcode[i][0] == 'P') gc.dwell = atof(num);
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BEQ	R3, R2, L_Protocol_Do_Gcode514
NOP	
J	L_Protocol_Do_Gcode207
NOP	
L_Protocol_Do_Gcode514:
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atof+0
NOP	
LW	R25, 4(SP)
SWC1	S0, Offset(_gc+128)(GP)
L_Protocol_Do_Gcode207:
;Protocol.c,674 :: 		Val = atoi(num);
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atoi+0
NOP	
LW	R25, 4(SP)
SH	R2, 22(SP)
;Protocol.c,675 :: 		st = Instruction_Values(gcode[i],&Val);
ADDIU	R4, SP, 22
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SH	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_Instruction_Values+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,676 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,677 :: 		case 'N': // line numbers are accepted and ignored
L_Protocol_Do_Gcode208:
;Protocol.c,678 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,679 :: 		case 'T': // TODO: tool change needs a tool table and M6.
L_Protocol_Do_Gcode209:
;Protocol.c,680 :: 		default:
L_Protocol_Do_Gcode210:
;Protocol.c,681 :: 		st = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
;Protocol.c,682 :: 		break;
J	L_Protocol_Do_Gcode188
NOP	
;Protocol.c,683 :: 		}
L_Protocol_Do_Gcode187:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode516
NOP	
J	L_Protocol_Do_Gcode189
NOP	
L_Protocol_Do_Gcode516:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_Do_Gcode518
NOP	
J	L_Protocol_Do_Gcode194
NOP	
L_Protocol_Do_Gcode518:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Do_Gcode520
NOP	
J	L_Protocol_Do_Gcode195
NOP	
L_Protocol_Do_Gcode520:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_Do_Gcode522
NOP	
J	L_Protocol_Do_Gcode196
NOP	
L_Protocol_Do_Gcode522:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_Do_Gcode524
NOP	
J	L_Protocol_Do_Gcode197
NOP	
L_Protocol_Do_Gcode524:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_Do_Gcode526
NOP	
J	L_Protocol_Do_Gcode198
NOP	
L_Protocol_Do_Gcode526:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Do_Gcode528
NOP	
J	L_Protocol_Do_Gcode199
NOP	
L_Protocol_Do_Gcode528:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Do_Gcode530
NOP	
J	L_Protocol_Do_Gcode200
NOP	
L_Protocol_Do_Gcode530:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L_Protocol_Do_Gcode532
NOP	
J	L_Protocol_Do_Gcode201
NOP	
L_Protocol_Do_Gcode532:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L_Protocol_Do_Gcode534
NOP	
J	L_Protocol_Do_Gcode202
NOP	
L_Protocol_Do_Gcode534:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_Do_Gcode536
NOP	
J	L_Protocol_Do_Gcode203
NOP	
L_Protocol_Do_Gcode536:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_Do_Gcode538
NOP	
J	L_Protocol_Do_Gcode204
NOP	
L_Protocol_Do_Gcode538:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_Do_Gcode540
NOP	
J	L_Protocol_Do_Gcode205
NOP	
L_Protocol_Do_Gcode540:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_Do_Gcode542
NOP	
J	L_Protocol_Do_Gcode206
NOP	
L_Protocol_Do_Gcode542:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Do_Gcode544
NOP	
J	L_Protocol_Do_Gcode208
NOP	
L_Protocol_Do_Gcode544:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 84
BNE	R3, R2, L_Protocol_Do_Gcode546
NOP	
J	L_Protocol_Do_Gcode209
NOP	
L_Protocol_Do_Gcode546:
J	L_Protocol_Do_Gcode210
NOP	
L_Protocol_Do_Gcode188:
;Protocol.c,684 :: 		}
L_Protocol_Do_Gcode186:
;Protocol.c,685 :: 		if(err == STATUS_OK) err = st;
LH	R2, 32(SP)
BEQ	R2, R0, L_Protocol_Do_Gcode547
NOP	
J	L_Protocol_Do_Gcode211
NOP	
L_Protocol_Do_Gcode547:
LH	R2, 24(SP)
SH	R2, 32(SP)
L_Protocol_Do_Gcode211:
;Protocol.c,686 :: 		}
L_Protocol_Do_Gcode181:
;Protocol.c,634 :: 		for(i=0; i < num_of_strings; i++){
LH	R2, 16(SP)
ADDIU	R2, R2, 1
SH	R2, 16(SP)
;Protocol.c,686 :: 		}
J	L_Protocol_Do_Gcode179
NOP	
L_Protocol_Do_Gcode180:
;Protocol.c,633 :: 		for(pass=0; pass < 2; pass++)
LH	R2, 18(SP)
ADDIU	R2, R2, 1
SH	R2, 18(SP)
;Protocol.c,686 :: 		}
J	L_Protocol_Do_Gcode176
NOP	
L_Protocol_Do_Gcode177:
;Protocol.c,688 :: 		if(err == STATUS_OK) err = Check_group_multiple_violations();
LH	R2, 32(SP)
BEQ	R2, R0, L_Protocol_Do_Gcode548
NOP	
J	L_Protocol_Do_Gcode212
NOP	
L_Protocol_Do_Gcode548:
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_Check_group_multiple_violations+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 32(SP)
L_Protocol_Do_Gcode212:
;Protocol.c,689 :: 		if(err != STATUS_OK) G_Restore_State();
LH	R2, 32(SP)
BNE	R2, R0, L_Protocol_Do_Gcode550
NOP	
J	L_Protocol_Do_Gcode213
NOP	
L_Protocol_Do_Gcode550:
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_G_Restore_State+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
L_Protocol_Do_Gcode213:
;Protocol.c,690 :: 		return err;
LH	R2, 32(SP)
;Protocol.c,691 :: 		}
L_end_Do_Gcode:
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Protocol_Do_Gcode
