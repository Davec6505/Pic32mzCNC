_Init_Protocol:
;Protocol.c,41 :: 		void Init_Protocol(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,42 :: 		startup = 0;
SB	R0, Offset(-1610603008)(GP)
;Protocol.c,43 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,44 :: 		}
L_end_Init_Protocol:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_Protocol
_Str_Initialize:
;Protocol.c,52 :: 		void Str_Initialize(char arg[arr_size][str_size]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,54 :: 		for(i = 0; i < arr_size;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Str_Initialize0:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 20
BNE	R2, R0, L__Str_Initialize278
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize278:
;Protocol.c,55 :: 		memset(arg[i],0,str_size);
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
;Protocol.c,54 :: 		for(i = 0; i < arr_size;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,56 :: 		}
; i end address is: 20 (R5)
J	L_Str_Initialize0
NOP	
L_Str_Initialize1:
;Protocol.c,57 :: 		}
L_end_Str_Initialize:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Str_Initialize
_Str_clear:
;Protocol.c,65 :: 		void Str_clear(char *str,int len){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,66 :: 		memset(str,0,len);
SW	R26, 4(SP)
SW	R27, 8(SP)
SEH	R27, R26
MOVZ	R26, R0, R0
JAL	_memset+0
NOP	
;Protocol.c,67 :: 		}
L_end_Str_clear:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Str_clear
Protocol_strsplit:
;Protocol.c,82 :: 		static int strsplit(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,84 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,85 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,86 :: 		ii=kk=err=lasti=0;
; lasti start address is: 28 (R7)
MOVZ	R7, R0, R0
; kk start address is: 24 (R6)
MOVZ	R6, R0, R0
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,87 :: 		for (i = 0; i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit281
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit281:
;Protocol.c,88 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R7
; err start address is: 36 (R9)
SEH	R9, R2
;Protocol.c,89 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit283
NOP	
J	L_Protocol_strsplit219
NOP	
L_Protocol_strsplit283:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit285
NOP	
J	L_Protocol_strsplit218
NOP	
L_Protocol_strsplit285:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit286
NOP	
J	L_Protocol_strsplit217
NOP	
L_Protocol_strsplit286:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit219:
L_Protocol_strsplit218:
L_Protocol_strsplit217:
;Protocol.c,90 :: 		arg[kk++][ii] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R8
; ii end address is: 32 (R8)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,91 :: 		ii=err=0;
; ii start address is: 32 (R8)
MOVZ	R8, R0, R0
;Protocol.c,92 :: 		lasti = i;
; lasti start address is: 28 (R7)
SEH	R7, R5
;Protocol.c,93 :: 		continue;
J	L_Protocol_strsplit5
NOP	
;Protocol.c,94 :: 		}else{
L_Protocol_strsplit8:
;Protocol.c,95 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,97 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit287
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit287:
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,98 :: 		break;
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit10:
;Protocol.c,99 :: 		}
; i start address is: 20 (R5)
; ii start address is: 32 (R8)
; lasti start address is: 28 (R7)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; kk end address is: 24 (R6)
; len start address is: 16 (R4)
L_Protocol_strsplit5:
;Protocol.c,87 :: 		for (i = 0; i < len;i++){
; lasti start address is: 28 (R7)
; ii start address is: 32 (R8)
; kk start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,99 :: 		}
; len end address is: 16 (R4)
; lasti end address is: 28 (R7)
; ii end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit3
NOP	
L_Protocol_strsplit4:
;Protocol.c,100 :: 		arg[kk][0] = 0;
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,101 :: 		return kk;
SEH	R2, R6
; kk end address is: 24 (R6)
;Protocol.c,102 :: 		}
L_end_strsplit:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit
Protocol_strsplit2:
;Protocol.c,124 :: 		static int strsplit2(char arg[arr_size][str_size],char *str, char c){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,126 :: 		Str_Initialize(arg);
SB	R27, 4(SP)
JAL	_Str_Initialize+0
NOP	
LBU	R27, 4(SP)
;Protocol.c,127 :: 		len = strlen(str);
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,130 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,131 :: 		for (i = 0;i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit2289
NOP	
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit2289:
;Protocol.c,133 :: 		err = i - lasti;
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,135 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2291
NOP	
J	L_Protocol_strsplit2225
NOP	
L_Protocol_strsplit2291:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2293
NOP	
J	L_Protocol_strsplit2224
NOP	
L_Protocol_strsplit2293:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2294
NOP	
J	L_Protocol_strsplit2223
NOP	
L_Protocol_strsplit2294:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2225:
L_Protocol_strsplit2224:
L_Protocol_strsplit2223:
;Protocol.c,137 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,138 :: 		ii=err=0;
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
;Protocol.c,140 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,141 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,142 :: 		continue;
SEH	R7, R3
; kk end address is: 12 (R3)
J	L_Protocol_strsplit213
NOP	
;Protocol.c,143 :: 		}else{
L_Protocol_strsplit216:
;Protocol.c,145 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2295
NOP	
J	L_Protocol_strsplit2232
NOP	
L_Protocol_strsplit2295:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2297
NOP	
J	L_Protocol_strsplit2233
NOP	
L_Protocol_strsplit2297:
L_Protocol_strsplit2221:
;Protocol.c,147 :: 		if(!track_char && *(str+i) > 0x39){ //0x39 is ASSCI 0x30 ('0') to 0x39 ('9')
BEQ	R6, R0, L_Protocol_strsplit2298
NOP	
J	L_Protocol_strsplit2230
NOP	
L_Protocol_strsplit2298:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2299
NOP	
J	L_Protocol_strsplit2231
NOP	
L_Protocol_strsplit2299:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2220:
;Protocol.c,149 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,150 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,152 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,147 :: 		if(!track_char && *(str+i) > 0x39){ //0x39 is ASSCI 0x30 ('0') to 0x39 ('9')
J	L_Protocol_strsplit2227
NOP	
L_Protocol_strsplit2230:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2227:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2226
NOP	
L_Protocol_strsplit2231:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2226:
;Protocol.c,145 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; ii end address is: 12 (R3)
; lasti end address is: 28 (R7)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2229
NOP	
L_Protocol_strsplit2232:
L_Protocol_strsplit2229:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2228
NOP	
L_Protocol_strsplit2233:
L_Protocol_strsplit2228:
;Protocol.c,156 :: 		arg[kk][ii++] = *(str+i);
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
SEH	R9, R2
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
;Protocol.c,158 :: 		}
L_Protocol_strsplit213:
;Protocol.c,131 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,158 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit212:
;Protocol.c,160 :: 		arg[kk][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;Protocol.c,162 :: 		return kk;
SEH	R2, R7
; kk end address is: 28 (R7)
;Protocol.c,163 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str_:
;Protocol.c,178 :: 		static int cpy_val_from_str_(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,182 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,184 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,186 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,188 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str_24:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str_302
NOP	
J	L_Protocol_cpy_val_from_str_25
NOP	
L_Protocol_cpy_val_from_str_302:
;Protocol.c,189 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,190 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,191 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str_24
NOP	
L_Protocol_cpy_val_from_str_25:
;Protocol.c,192 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,194 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,195 :: 		}
L_end_cpy_val_from_str_:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str_
Protocol_cpy_val_from_str:
;Protocol.c,207 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char)
;Protocol.c,211 :: 		for (i = 0; i < num_of_char && strB[indx + i] != '\0'; i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_cpy_val_from_str26:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R28
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_cpy_val_from_str304
NOP	
J	L_Protocol_cpy_val_from_str236
NOP	
L_Protocol_cpy_val_from_str304:
ADDU	R2, R27, R4
SEH	R2, R2
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str306
NOP	
J	L_Protocol_cpy_val_from_str235
NOP	
L_Protocol_cpy_val_from_str306:
L_Protocol_cpy_val_from_str234:
;Protocol.c,213 :: 		strA[i] = strB[indx + i];
SEH	R2, R4
ADDU	R3, R25, R2
ADDU	R2, R27, R4
SEH	R2, R2
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,211 :: 		for (i = 0; i < num_of_char && strB[indx + i] != '\0'; i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,214 :: 		}
J	L_Protocol_cpy_val_from_str26
NOP	
;Protocol.c,211 :: 		for (i = 0; i < num_of_char && strB[indx + i] != '\0'; i++)
L_Protocol_cpy_val_from_str236:
L_Protocol_cpy_val_from_str235:
;Protocol.c,216 :: 		strA[i] = '\0';
SEH	R2, R4
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,218 :: 		return i;
SEH	R2, R4
; i end address is: 16 (R4)
;Protocol.c,219 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,229 :: 		static int str2int(const char *str,int base){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,231 :: 		int result = 0;
; result start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,233 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
; len start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,235 :: 		for(i=0; i<len; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; len end address is: 16 (R4)
; result end address is: 24 (R6)
; i end address is: 20 (R5)
L_Protocol_str2int31:
; i start address is: 20 (R5)
; len start address is: 16 (R4)
; result start address is: 24 (R6)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int308
NOP	
J	L_Protocol_str2int32
NOP	
L_Protocol_str2int308:
;Protocol.c,236 :: 		result = result * base + ( *(str+i) - 0x30 );
MUL	R3, R6, R26
; result end address is: 24 (R6)
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -48
ADDU	R2, R3, R2
; result start address is: 24 (R6)
SEH	R6, R2
;Protocol.c,235 :: 		for(i=0; i<len; i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,240 :: 		}
; len end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int32:
;Protocol.c,242 :: 		return result;
SEH	R2, R6
; result end address is: 24 (R6)
;Protocol.c,243 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,269 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,270 :: 		unsigned int pending = Serial_TakeRealtime();
SW	R25, 4(SP)
JAL	_Serial_TakeRealtime+0
NOP	
SH	R2, 10(SP)
;Protocol.c,271 :: 		if(pending & EXEC_RESET){
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime311
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime311:
;Protocol.c,272 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,273 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,274 :: 		pending &= ~EXEC_RESET;
LHU	R3, 10(SP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, 10(SP)
;Protocol.c,275 :: 		}
L_protocol_execute_runtime34:
;Protocol.c,277 :: 		if(Limits_TakeEvent()){
JAL	_Limits_TakeEvent+0
NOP	
BNE	R2, R0, L__protocol_execute_runtime313
NOP	
J	L_protocol_execute_runtime35
NOP	
L__protocol_execute_runtime313:
;Protocol.c,278 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,279 :: 		sys.execute |= EXEC_CRIT_EVENT;
LH	R2, Offset(_sys+26)(GP)
ORI	R2, R2, 64
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,280 :: 		}
L_protocol_execute_runtime35:
;Protocol.c,281 :: 		sys.execute |= pending;
LHU	R3, 10(SP)
LH	R2, Offset(_sys+26)(GP)
OR	R2, R2, R3
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,282 :: 		if (sys.execute) { // Enter only if any bit flag is true
BNE	R2, R0, L__protocol_execute_runtime315
NOP	
J	L_protocol_execute_runtime36
NOP	
L__protocol_execute_runtime315:
;Protocol.c,283 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
LH	R2, Offset(_sys+26)(GP)
SH	R2, 8(SP)
;Protocol.c,288 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime317
NOP	
J	L_protocol_execute_runtime37
NOP	
L__protocol_execute_runtime317:
;Protocol.c,289 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,292 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
LH	R2, 8(SP)
ANDI	R2, R2, 64
BNE	R2, R0, L__protocol_execute_runtime319
NOP	
J	L_protocol_execute_runtime38
NOP	
L__protocol_execute_runtime319:
;Protocol.c,293 :: 		report_alarm_message(ALARM_HARD_LIMIT);
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,294 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
;Protocol.c,295 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,296 :: 		do {
L_protocol_execute_runtime39:
;Protocol.c,297 :: 		Ethernet_Transport_Poll(); // a TCP host's Ctrl-X arrives through here
JAL	_Ethernet_Transport_Poll+0
NOP	
;Protocol.c,298 :: 		if(Serial_TakeRealtime() & EXEC_RESET){
JAL	_Serial_TakeRealtime+0
NOP	
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime321
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime321:
;Protocol.c,299 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,300 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,301 :: 		}
L_protocol_execute_runtime42:
;Protocol.c,302 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime323
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime323:
;Protocol.c,305 :: 		} else {
J	L_protocol_execute_runtime43
NOP	
L_protocol_execute_runtime38:
;Protocol.c,309 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
;Protocol.c,310 :: 		}
L_protocol_execute_runtime43:
;Protocol.c,311 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,312 :: 		}
L_protocol_execute_runtime37:
;Protocol.c,315 :: 		if (rt_exec & EXEC_RESET) {
LH	R2, 8(SP)
ANDI	R2, R2, 16
BNE	R2, R0, L__protocol_execute_runtime325
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime325:
;Protocol.c,316 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,317 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,318 :: 		}
L_protocol_execute_runtime44:
;Protocol.c,321 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
LH	R2, 8(SP)
ANDI	R2, R2, 1
BNE	R2, R0, L__protocol_execute_runtime327
NOP	
J	L_protocol_execute_runtime45
NOP	
L__protocol_execute_runtime327:
;Protocol.c,322 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,323 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,324 :: 		}
L_protocol_execute_runtime45:
;Protocol.c,327 :: 		if (rt_exec & EXEC_FEED_HOLD) {
LH	R2, 8(SP)
ANDI	R2, R2, 8
BNE	R2, R0, L__protocol_execute_runtime329
NOP	
J	L_protocol_execute_runtime46
NOP	
L__protocol_execute_runtime329:
;Protocol.c,330 :: 		if (sys.state == STATE_IDLE) sys.state = STATE_HOLD;
LH	R2, Offset(_sys+2)(GP)
BEQ	R2, R0, L__protocol_execute_runtime330
NOP	
J	L_protocol_execute_runtime47
NOP	
L__protocol_execute_runtime330:
ORI	R2, R0, 4
SH	R2, Offset(_sys+2)(GP)
L_protocol_execute_runtime47:
;Protocol.c,331 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,332 :: 		}
L_protocol_execute_runtime46:
;Protocol.c,336 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
LH	R2, 8(SP)
ANDI	R2, R2, 4
BNE	R2, R0, L__protocol_execute_runtime332
NOP	
J	L_protocol_execute_runtime48
NOP	
L__protocol_execute_runtime332:
;Protocol.c,338 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,339 :: 		}
L_protocol_execute_runtime48:
;Protocol.c,341 :: 		if (rt_exec & EXEC_CYCLE_START) {
LH	R2, 8(SP)
ANDI	R2, R2, 2
BNE	R2, R0, L__protocol_execute_runtime334
NOP	
J	L_protocol_execute_runtime49
NOP	
L__protocol_execute_runtime334:
;Protocol.c,344 :: 		if (sys.state == STATE_HOLD) sys.state = STATE_IDLE;
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__protocol_execute_runtime335
NOP	
J	L_protocol_execute_runtime50
NOP	
L__protocol_execute_runtime335:
SH	R0, Offset(_sys+2)(GP)
L_protocol_execute_runtime50:
;Protocol.c,345 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime337
NOP	
J	L_protocol_execute_runtime51
NOP	
L__protocol_execute_runtime337:
;Protocol.c,346 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
;Protocol.c,347 :: 		}
L_protocol_execute_runtime51:
;Protocol.c,348 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+26)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+26)(GP)
;Protocol.c,349 :: 		}
L_protocol_execute_runtime49:
;Protocol.c,350 :: 		}
L_protocol_execute_runtime36:
;Protocol.c,354 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,363 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,367 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check340
NOP	
J	L_protocol_system_check52
NOP	
L__protocol_system_check340:
;Protocol.c,369 :: 		Reset_Ring();
JAL	_Reset_Ring+0
NOP	
;Protocol.c,380 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,383 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,384 :: 		sys.execute = 0;
SH	R0, Offset(_sys+26)(GP)
;Protocol.c,385 :: 		startup = 0;
SB	R0, Offset(-1610603008)(GP)
;Protocol.c,386 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,387 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check342
NOP	
J	L_protocol_system_check53
NOP	
L__protocol_system_check342:
ORI	R2, R0, 1
SH	R2, Offset(_sys+24)(GP)
L_protocol_system_check53:
;Protocol.c,397 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check343
NOP	
J	L__protocol_system_check239
NOP	
L__protocol_system_check343:
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check345
NOP	
J	L__protocol_system_check238
NOP	
L__protocol_system_check345:
L__protocol_system_check237:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check239:
L__protocol_system_check238:
;Protocol.c,401 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check346
NOP	
J	L_protocol_system_check57
NOP	
L__protocol_system_check346:
;Protocol.c,402 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,403 :: 		} else {
J	L_protocol_system_check58
NOP	
L_protocol_system_check57:
;Protocol.c,405 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,407 :: 		}
L_protocol_system_check58:
;Protocol.c,408 :: 		}
L_protocol_system_check52:
;Protocol.c,409 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
_Sample_Gocde_Line:
;Protocol.c,418 :: 		int Sample_Gocde_Line(){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Protocol.c,422 :: 		result = Serial_ReadLine(str);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_Serial_ReadLine+0
NOP	
; result start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,423 :: 		if(result == SERIAL_LINE_NONE) return STATUS_OK;
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line348
NOP	
J	L_Sample_Gocde_Line59
NOP	
L__Sample_Gocde_Line348:
; result end address is: 16 (R4)
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
L_Sample_Gocde_Line59:
;Protocol.c,424 :: 		if(result == SERIAL_LINE_TOO_LONG || result == SERIAL_LINE_RX_ERROR){
; result start address is: 16 (R4)
SEH	R3, R4
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Sample_Gocde_Line350
NOP	
J	L__Sample_Gocde_Line271
NOP	
L__Sample_Gocde_Line350:
SEH	R3, R4
LUI	R2, 65535
ORI	R2, R2, 65534
BNE	R3, R2, L__Sample_Gocde_Line352
NOP	
J	L__Sample_Gocde_Line270
NOP	
L__Sample_Gocde_Line352:
; result end address is: 16 (R4)
J	L_Sample_Gocde_Line62
NOP	
L__Sample_Gocde_Line271:
; result start address is: 16 (R4)
L__Sample_Gocde_Line270:
;Protocol.c,425 :: 		report_status_message(result == SERIAL_LINE_TOO_LONG ? STATUS_LINE_OVERFLOW : STATUS_SERIAL_RX_ERROR);
SEH	R3, R4
; result end address is: 16 (R4)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__Sample_Gocde_Line353
NOP	
J	L_Sample_Gocde_Line63
NOP	
L__Sample_Gocde_Line353:
; ?FLOC___Sample_Gocde_Line?T183 start address is: 8 (R2)
ORI	R2, R0, 15
; ?FLOC___Sample_Gocde_Line?T183 end address is: 8 (R2)
J	L_Sample_Gocde_Line64
NOP	
L_Sample_Gocde_Line63:
; ?FLOC___Sample_Gocde_Line?T183 start address is: 8 (R2)
ORI	R2, R0, 16
; ?FLOC___Sample_Gocde_Line?T183 end address is: 8 (R2)
L_Sample_Gocde_Line64:
; ?FLOC___Sample_Gocde_Line?T183 start address is: 8 (R2)
SEB	R25, R2
; ?FLOC___Sample_Gocde_Line?T183 end address is: 8 (R2)
JAL	_report_status_message+0
NOP	
;Protocol.c,426 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,427 :: 		}
L_Sample_Gocde_Line62:
;Protocol.c,428 :: 		if(sys.abort || (sys.execute & EXEC_RESET)) return STATUS_NO_REPORT;
LH	R2, Offset(_sys+0)(GP)
BEQ	R2, R0, L__Sample_Gocde_Line354
NOP	
J	L__Sample_Gocde_Line273
NOP	
L__Sample_Gocde_Line354:
LH	R2, Offset(_sys+26)(GP)
ANDI	R2, R2, 16
BEQ	R2, R0, L__Sample_Gocde_Line355
NOP	
J	L__Sample_Gocde_Line272
NOP	
L__Sample_Gocde_Line355:
J	L_Sample_Gocde_Line67
NOP	
L__Sample_Gocde_Line273:
L__Sample_Gocde_Line272:
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
L_Sample_Gocde_Line67:
;Protocol.c,429 :: 		dif = strlen(str);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,430 :: 		if(dif == 0){
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line356
NOP	
J	L_Sample_Gocde_Line68
NOP	
L__Sample_Gocde_Line356:
; dif end address is: 16 (R4)
;Protocol.c,431 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Protocol.c,432 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,433 :: 		}
L_Sample_Gocde_Line68:
;Protocol.c,434 :: 		if(str[0] == '$'){
; dif start address is: 16 (R4)
ADDIU	R2, SP, 12
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Gocde_Line357
NOP	
J	L_Sample_Gocde_Line69
NOP	
L__Sample_Gocde_Line357:
;Protocol.c,435 :: 		Check_Query_Type(str,dif);
ADDIU	R2, SP, 12
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
;Protocol.c,436 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,437 :: 		}
L_Sample_Gocde_Line69:
;Protocol.c,438 :: 		if(sys.state == STATE_ALARM){
; dif start address is: 16 (R4)
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Gocde_Line358
NOP	
J	L_Sample_Gocde_Line70
NOP	
L__Sample_Gocde_Line358:
; dif end address is: 16 (R4)
;Protocol.c,439 :: 		report_status_message(STATUS_ALARM_LOCK);
ORI	R25, R0, 12
JAL	_report_status_message+0
NOP	
;Protocol.c,440 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,441 :: 		}
L_Sample_Gocde_Line70:
;Protocol.c,445 :: 		state = Do_Gcode(str,dif);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 12
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Gcode+0
NOP	
; state start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,451 :: 		if(state != STATUS_OK || sys.state == STATE_CHECK_MODE){
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line359
NOP	
J	L__Sample_Gocde_Line275
NOP	
L__Sample_Gocde_Line359:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__Sample_Gocde_Line361
NOP	
J	L__Sample_Gocde_Line274
NOP	
L__Sample_Gocde_Line361:
; state end address is: 16 (R4)
J	L_Sample_Gocde_Line73
NOP	
L__Sample_Gocde_Line275:
; state start address is: 16 (R4)
L__Sample_Gocde_Line274:
;Protocol.c,452 :: 		report_status_message(state);
SEH	R25, R4
; state end address is: 16 (R4)
JAL	_report_status_message+0
NOP	
;Protocol.c,453 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Protocol.c,454 :: 		return STATUS_NO_REPORT;
ORI	R2, R0, 99
J	L_end_Sample_Gocde_Line
NOP	
;Protocol.c,455 :: 		}
L_Sample_Gocde_Line73:
;Protocol.c,456 :: 		return STATUS_COMMAND_EXECUTE_MOTION;
ORI	R2, R0, 20
;Protocol.c,457 :: 		}
;Protocol.c,456 :: 		return STATUS_COMMAND_EXECUTE_MOTION;
;Protocol.c,457 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Machine_Busy:
;Protocol.c,459 :: 		static int Machine_Busy(){
;Protocol.c,460 :: 		return (sys.state == STATE_CYCLE || sys.state == STATE_HOLD ||
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L_Protocol_Machine_Busy364
NOP	
J	L_Protocol_Machine_Busy75
NOP	
L_Protocol_Machine_Busy364:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_Protocol_Machine_Busy366
NOP	
J	L_Protocol_Machine_Busy75
NOP	
L_Protocol_Machine_Busy366:
;Protocol.c,461 :: 		sys.state == STATE_HOMING || sys.state == STATE_JOG);
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L_Protocol_Machine_Busy368
NOP	
J	L_Protocol_Machine_Busy75
NOP	
L_Protocol_Machine_Busy368:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 8
BNE	R3, R2, L_Protocol_Machine_Busy370
NOP	
J	L_Protocol_Machine_Busy75
NOP	
L_Protocol_Machine_Busy370:
MOVZ	R2, R0, R0
J	L_Protocol_Machine_Busy74
NOP	
L_Protocol_Machine_Busy75:
ORI	R2, R0, 1
L_Protocol_Machine_Busy74:
ANDI	R2, R2, 255
;Protocol.c,462 :: 		}
L_end_Machine_Busy:
JR	RA
NOP	
; end of Protocol_Machine_Busy
Protocol_Check_Query_Type:
;Protocol.c,472 :: 		static int Check_Query_Type(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,475 :: 		int status = STATUS_OK;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SH	R30, 34(SP)
;Protocol.c,482 :: 		if(str_[0] == '$'){
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type372
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type372:
;Protocol.c,484 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type77
NOP	
;Protocol.c,485 :: 		case '$': case '#': case 'G': case 'C': case 'X': case 'H': case 'I':
L_Protocol_Check_Query_Type79:
L_Protocol_Check_Query_Type80:
L_Protocol_Check_Query_Type81:
L_Protocol_Check_Query_Type82:
L_Protocol_Check_Query_Type83:
L_Protocol_Check_Query_Type84:
L_Protocol_Check_Query_Type85:
;Protocol.c,486 :: 		if(str_[2] != 0){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_Check_Query_Type374
NOP	
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type374:
;Protocol.c,487 :: 		report_status_message(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_report_status_message+0
NOP	
;Protocol.c,488 :: 		return STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
J	L_end_Check_Query_Type
NOP	
;Protocol.c,489 :: 		}
L_Protocol_Check_Query_Type86:
;Protocol.c,490 :: 		}
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type77:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type376
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type376:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type378
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type378:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type380
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type380:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type382
NOP	
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type382:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type384
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type384:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type386
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type386:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Check_Query_Type388
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type388:
L_Protocol_Check_Query_Type78:
;Protocol.c,491 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type87
NOP	
;Protocol.c,492 :: 		case '\0': case '\r' :case '\n' :
L_Protocol_Check_Query_Type89:
L_Protocol_Check_Query_Type90:
L_Protocol_Check_Query_Type91:
;Protocol.c,493 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,494 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,495 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,496 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type92:
;Protocol.c,497 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,498 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,499 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,500 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type93:
;Protocol.c,501 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,502 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,503 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,504 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type94:
;Protocol.c,505 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,506 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,507 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,508 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type95:
;Protocol.c,509 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,519 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type389
NOP	
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type389:
;Protocol.c,520 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,521 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,522 :: 		} else if (sys.state) {
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type96:
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type391
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type391:
;Protocol.c,523 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,524 :: 		} else {
J	L_Protocol_Check_Query_Type99
NOP	
L_Protocol_Check_Query_Type98:
;Protocol.c,525 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,526 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,527 :: 		}
L_Protocol_Check_Query_Type99:
L_Protocol_Check_Query_Type97:
;Protocol.c,528 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,529 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type100:
;Protocol.c,530 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type392
NOP	
J	L_Protocol_Check_Query_Type101
NOP	
L_Protocol_Check_Query_Type392:
;Protocol.c,531 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,532 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,534 :: 		}
L_Protocol_Check_Query_Type101:
;Protocol.c,535 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,536 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,537 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type102:
;Protocol.c,540 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 34(SP)
;Protocol.c,541 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,575 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type103:
;Protocol.c,576 :: 		if ( str_[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type393
NOP	
J	L_Protocol_Check_Query_Type104
NOP	
L_Protocol_Check_Query_Type393:
;Protocol.c,577 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
SH	R0, 24(SP)
L_Protocol_Check_Query_Type105:
LH	R2, 24(SP)
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type394
NOP	
J	L_Protocol_Check_Query_Type106
NOP	
L_Protocol_Check_Query_Type394:
;Protocol.c,578 :: 		if ((settings_read_startup_line(helper_var, str_))) {
SH	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
LH	R25, 24(SP)
JAL	_settings_read_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type396
NOP	
J	L_Protocol_Check_Query_Type108
NOP	
L_Protocol_Check_Query_Type396:
;Protocol.c,579 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
;Protocol.c,580 :: 		break;
J	L_Protocol_Check_Query_Type106
NOP	
;Protocol.c,581 :: 		}
L_Protocol_Check_Query_Type108:
;Protocol.c,582 :: 		report_startup_line(helper_var,str_);
SH	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R26, R25, R0
LH	R25, 24(SP)
JAL	_report_startup_line+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
;Protocol.c,577 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
LH	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;Protocol.c,590 :: 		}
J	L_Protocol_Check_Query_Type105
NOP	
L_Protocol_Check_Query_Type106:
;Protocol.c,591 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,592 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type104:
;Protocol.c,593 :: 		int N_Val = 0;
;Protocol.c,594 :: 		helper_var = 1;  // Set helper_var to flag storing method.
ORI	R2, R0, 1
SH	R2, 24(SP)
;Protocol.c,599 :: 		if ( str_[2] >= '0'  &&  str_[2] < '0' + N_STARTUP_LINE ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type397
NOP	
J	L_Protocol_Check_Query_Type244
NOP	
L_Protocol_Check_Query_Type397:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 50
BNE	R2, R0, L_Protocol_Check_Query_Type398
NOP	
J	L_Protocol_Check_Query_Type243
NOP	
L_Protocol_Check_Query_Type398:
L_Protocol_Check_Query_Type242:
;Protocol.c,600 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,602 :: 		num[0] = str_[2];
ADDIU	R3, SP, 26
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,603 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,611 :: 		}else {
J	L_Protocol_Check_Query_Type113
NOP	
; N_Val end address is: 16 (R4)
;Protocol.c,599 :: 		if ( str_[2] >= '0'  &&  str_[2] < '0' + N_STARTUP_LINE ) {
L_Protocol_Check_Query_Type244:
L_Protocol_Check_Query_Type243:
;Protocol.c,612 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 34(SP)
;Protocol.c,613 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,614 :: 		}
L_Protocol_Check_Query_Type113:
;Protocol.c,617 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
LH	R2, 24(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type400
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type400:
;Protocol.c,618 :: 		int str_len = 0;
;Protocol.c,619 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type402
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type402:
; N_Val end address is: 16 (R4)
;Protocol.c,621 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,624 :: 		helper_var = strlen((str_));
JAL	_strlen+0
NOP	
;Protocol.c,636 :: 		str_len = strlen(str_);
JAL	_strlen+0
NOP	
;Protocol.c,642 :: 		}else{
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type115:
;Protocol.c,643 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,653 :: 		if(Machine_Busy())
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type404
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type404:
; N_Val end address is: 16 (R4)
;Protocol.c,654 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type117:
;Protocol.c,655 :: 		else if(settings_store_startup_line(N_Val,str_+4))
; N_Val start address is: 16 (R4)
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type406
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type406:
;Protocol.c,656 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
L_Protocol_Check_Query_Type119:
L_Protocol_Check_Query_Type118:
;Protocol.c,657 :: 		}
L_Protocol_Check_Query_Type116:
;Protocol.c,659 :: 		}
L_Protocol_Check_Query_Type114:
;Protocol.c,661 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,662 :: 		case 'I' : // Print build info (Grbl 1.1)
L_Protocol_Check_Query_Type120:
;Protocol.c,663 :: 		report_build_info();
JAL	_report_build_info+0
NOP	
;Protocol.c,664 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,665 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,666 :: 		case 'J' : // TODO: $J= jogging, parse as a G1 block and run it as STATE_JOG.
L_Protocol_Check_Query_Type121:
;Protocol.c,667 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 34(SP)
;Protocol.c,668 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,669 :: 		case 'R' : // $RST=$ defaults, $RST=# offsets, $RST=* everything
L_Protocol_Check_Query_Type122:
;Protocol.c,670 :: 		if(strncmp(str_+1,"RST=",4)){
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
BNE	R2, R0, L_Protocol_Check_Query_Type408
NOP	
J	L_Protocol_Check_Query_Type123
NOP	
L_Protocol_Check_Query_Type408:
;Protocol.c,671 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,672 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,673 :: 		}
L_Protocol_Check_Query_Type123:
;Protocol.c,674 :: 		switch(str_[5]){
ADDIU	R4, R25, 5
J	L_Protocol_Check_Query_Type124
NOP	
;Protocol.c,675 :: 		case '$': helper_var = SETTINGS_RESTORE_DEFAULTS;   break;
L_Protocol_Check_Query_Type126:
ORI	R2, R0, 1
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type125
NOP	
;Protocol.c,676 :: 		case '#': helper_var = SETTINGS_RESTORE_PARAMETERS; break;
L_Protocol_Check_Query_Type127:
ORI	R2, R0, 2
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type125
NOP	
;Protocol.c,677 :: 		case '*': helper_var = SETTINGS_RESTORE_ALL;        break;
L_Protocol_Check_Query_Type128:
ORI	R2, R0, 255
SH	R2, 24(SP)
J	L_Protocol_Check_Query_Type125
NOP	
;Protocol.c,678 :: 		default : helper_var = 0;                           break;
L_Protocol_Check_Query_Type129:
SH	R0, 24(SP)
J	L_Protocol_Check_Query_Type125
NOP	
;Protocol.c,679 :: 		}
L_Protocol_Check_Query_Type124:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type410
NOP	
J	L_Protocol_Check_Query_Type126
NOP	
L_Protocol_Check_Query_Type410:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type412
NOP	
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type412:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 42
BNE	R3, R2, L_Protocol_Check_Query_Type414
NOP	
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type414:
J	L_Protocol_Check_Query_Type129
NOP	
L_Protocol_Check_Query_Type125:
;Protocol.c,680 :: 		if(!helper_var){
LH	R2, 24(SP)
BEQ	R2, R0, L_Protocol_Check_Query_Type415
NOP	
J	L_Protocol_Check_Query_Type130
NOP	
L_Protocol_Check_Query_Type415:
;Protocol.c,681 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,682 :: 		}else if(Machine_Busy()){
J	L_Protocol_Check_Query_Type131
NOP	
L_Protocol_Check_Query_Type130:
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type417
NOP	
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type417:
;Protocol.c,683 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,684 :: 		}else if(settings_restore(helper_var)){
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type132:
LH	R25, 24(SP)
JAL	_settings_restore+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type419
NOP	
J	L_Protocol_Check_Query_Type134
NOP	
L_Protocol_Check_Query_Type419:
;Protocol.c,685 :: 		status = STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
SH	R2, 34(SP)
;Protocol.c,686 :: 		}else{
J	L_Protocol_Check_Query_Type135
NOP	
L_Protocol_Check_Query_Type134:
;Protocol.c,687 :: 		status = STATUS_OK;
SH	R0, 34(SP)
;Protocol.c,688 :: 		}
L_Protocol_Check_Query_Type135:
L_Protocol_Check_Query_Type133:
L_Protocol_Check_Query_Type131:
;Protocol.c,689 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,690 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type136:
L_Protocol_Check_Query_Type137:
L_Protocol_Check_Query_Type138:
L_Protocol_Check_Query_Type139:
L_Protocol_Check_Query_Type140:
L_Protocol_Check_Query_Type141:
;Protocol.c,691 :: 		case '6': case '7': case '8': case '9': {
L_Protocol_Check_Query_Type142:
L_Protocol_Check_Query_Type143:
L_Protocol_Check_Query_Type144:
L_Protocol_Check_Query_Type145:
;Protocol.c,694 :: 		char *eq = strchr(str_,'=');
SW	R25, 16(SP)
ORI	R26, R0, 61
JAL	_strchr+0
NOP	
LW	R25, 16(SP)
; eq start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,696 :: 		if((eq == 0) || (!isdigit(eq[1]) && eq[1] != '.' && eq[1] != '-')){
BNE	R2, R0, L_Protocol_Check_Query_Type421
NOP	
J	L_Protocol_Check_Query_Type248
NOP	
L_Protocol_Check_Query_Type421:
ADDIU	R2, R4, 1
SW	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BEQ	R2, R0, L_Protocol_Check_Query_Type422
NOP	
J	L_Protocol_Check_Query_Type247
NOP	
L_Protocol_Check_Query_Type422:
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 46
BNE	R3, R2, L_Protocol_Check_Query_Type424
NOP	
J	L_Protocol_Check_Query_Type246
NOP	
L_Protocol_Check_Query_Type424:
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 45
BNE	R3, R2, L_Protocol_Check_Query_Type426
NOP	
J	L_Protocol_Check_Query_Type245
NOP	
L_Protocol_Check_Query_Type426:
; eq end address is: 16 (R4)
J	L_Protocol_Check_Query_Type240
NOP	
L_Protocol_Check_Query_Type247:
; eq start address is: 16 (R4)
L_Protocol_Check_Query_Type246:
L_Protocol_Check_Query_Type245:
J	L_Protocol_Check_Query_Type150
NOP	
; eq end address is: 16 (R4)
L_Protocol_Check_Query_Type240:
L_Protocol_Check_Query_Type248:
;Protocol.c,697 :: 		status = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 34(SP)
;Protocol.c,698 :: 		}else if(Machine_Busy()){
J	L_Protocol_Check_Query_Type151
NOP	
L_Protocol_Check_Query_Type150:
; eq start address is: 16 (R4)
JAL	Protocol_Machine_Busy+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type428
NOP	
J	L_Protocol_Check_Query_Type152
NOP	
L_Protocol_Check_Query_Type428:
; eq end address is: 16 (R4)
;Protocol.c,699 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 34(SP)
;Protocol.c,700 :: 		}else{
J	L_Protocol_Check_Query_Type153
NOP	
L_Protocol_Check_Query_Type152:
;Protocol.c,701 :: 		int N_Val = atoi(str_+1);
; eq start address is: 16 (R4)
ADDIU	R2, R25, 1
SW	R4, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R4, 16(SP)
; N_Val start address is: 28 (R7)
SEH	R7, R2
;Protocol.c,702 :: 		float value = atof(eq+1);
ADDIU	R2, R4, 1
; eq end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,710 :: 		status = settings_store_grbl_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_grbl_setting+0
NOP	
SH	R2, 34(SP)
;Protocol.c,711 :: 		}
L_Protocol_Check_Query_Type153:
L_Protocol_Check_Query_Type151:
;Protocol.c,712 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,714 :: 		default:
L_Protocol_Check_Query_Type154:
;Protocol.c,715 :: 		status = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, 34(SP)
;Protocol.c,716 :: 		break;
J	L_Protocol_Check_Query_Type88
NOP	
;Protocol.c,717 :: 		}       //report on status messages
L_Protocol_Check_Query_Type87:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_Check_Query_Type430
NOP	
J	L_Protocol_Check_Query_Type89
NOP	
L_Protocol_Check_Query_Type430:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type432
NOP	
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type432:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type434
NOP	
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type434:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type436
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type436:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type438
NOP	
J	L_Protocol_Check_Query_Type93
NOP	
L_Protocol_Check_Query_Type438:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type440
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type440:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type442
NOP	
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type442:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type444
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type444:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type446
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type446:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type448
NOP	
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type448:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Check_Query_Type450
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type450:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Check_Query_Type452
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type452:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L_Protocol_Check_Query_Type454
NOP	
J	L_Protocol_Check_Query_Type122
NOP	
L_Protocol_Check_Query_Type454:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type456
NOP	
J	L_Protocol_Check_Query_Type136
NOP	
L_Protocol_Check_Query_Type456:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type458
NOP	
J	L_Protocol_Check_Query_Type137
NOP	
L_Protocol_Check_Query_Type458:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type460
NOP	
J	L_Protocol_Check_Query_Type138
NOP	
L_Protocol_Check_Query_Type460:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type462
NOP	
J	L_Protocol_Check_Query_Type139
NOP	
L_Protocol_Check_Query_Type462:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type464
NOP	
J	L_Protocol_Check_Query_Type140
NOP	
L_Protocol_Check_Query_Type464:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type466
NOP	
J	L_Protocol_Check_Query_Type141
NOP	
L_Protocol_Check_Query_Type466:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type468
NOP	
J	L_Protocol_Check_Query_Type142
NOP	
L_Protocol_Check_Query_Type468:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type470
NOP	
J	L_Protocol_Check_Query_Type143
NOP	
L_Protocol_Check_Query_Type470:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type472
NOP	
J	L_Protocol_Check_Query_Type144
NOP	
L_Protocol_Check_Query_Type472:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type474
NOP	
J	L_Protocol_Check_Query_Type145
NOP	
L_Protocol_Check_Query_Type474:
J	L_Protocol_Check_Query_Type154
NOP	
L_Protocol_Check_Query_Type88:
;Protocol.c,718 :: 		report_status_message(status);
LH	R25, 34(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,720 :: 		return status;
LH	R2, 34(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,721 :: 		}else{
L_Protocol_Check_Query_Type76:
;Protocol.c,724 :: 		return status;
ORI	R2, R0, 20
;Protocol.c,725 :: 		}
;Protocol.c,724 :: 		return status;
;Protocol.c,725 :: 		}
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
;Protocol.c,730 :: 		static int gcode_words(char *line){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,731 :: 		int n = 0, k = 0, in_comment = 0;
; n start address is: 20 (R5)
MOVZ	R5, R0, R0
; k start address is: 24 (R6)
MOVZ	R6, R0, R0
; in_comment start address is: 16 (R4)
MOVZ	R4, R0, R0
;Protocol.c,733 :: 		Str_Initialize(gcode);
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
;Protocol.c,734 :: 		while((ch = *line++) != 0){
L_Protocol_gcode_words156:
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
BNE	R2, R0, L_Protocol_gcode_words477
NOP	
J	L_Protocol_gcode_words157
NOP	
L_Protocol_gcode_words477:
; in_comment end address is: 16 (R4)
; k end address is: 24 (R6)
;Protocol.c,735 :: 		if(in_comment){
; k start address is: 24 (R6)
; in_comment start address is: 16 (R4)
BNE	R4, R0, L_Protocol_gcode_words479
NOP	
J	L_Protocol_gcode_words158
NOP	
L_Protocol_gcode_words479:
;Protocol.c,736 :: 		if(ch == ')') in_comment = 0;
ANDI	R3, R7, 255
; ch end address is: 28 (R7)
ORI	R2, R0, 41
BEQ	R3, R2, L_Protocol_gcode_words480
NOP	
J	L_Protocol_gcode_words262
NOP	
L_Protocol_gcode_words480:
; in_comment end address is: 16 (R4)
; in_comment start address is: 8 (R2)
MOVZ	R2, R0, R0
; in_comment end address is: 8 (R2)
SEH	R4, R2
J	L_Protocol_gcode_words159
NOP	
L_Protocol_gcode_words262:
L_Protocol_gcode_words159:
;Protocol.c,737 :: 		continue;
; in_comment start address is: 16 (R4)
J	L_Protocol_gcode_words156
NOP	
;Protocol.c,738 :: 		}
L_Protocol_gcode_words158:
;Protocol.c,739 :: 		if(ch == '(') { in_comment = 1; continue; }
; ch start address is: 28 (R7)
ANDI	R3, R7, 255
ORI	R2, R0, 40
BEQ	R3, R2, L_Protocol_gcode_words481
NOP	
J	L_Protocol_gcode_words160
NOP	
L_Protocol_gcode_words481:
; ch end address is: 28 (R7)
ORI	R4, R0, 1
J	L_Protocol_gcode_words156
NOP	
L_Protocol_gcode_words160:
;Protocol.c,740 :: 		if(ch == ';') break;
; ch start address is: 28 (R7)
ANDI	R3, R7, 255
ORI	R2, R0, 59
BEQ	R3, R2, L_Protocol_gcode_words482
NOP	
J	L_Protocol_gcode_words161
NOP	
L_Protocol_gcode_words482:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
J	L_Protocol_gcode_words157
NOP	
L_Protocol_gcode_words161:
;Protocol.c,741 :: 		if(ch == ' ' || ch == '\t') continue;
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
ANDI	R3, R7, 255
ORI	R2, R0, 32
BNE	R3, R2, L_Protocol_gcode_words484
NOP	
J	L_Protocol_gcode_words254
NOP	
L_Protocol_gcode_words484:
ANDI	R3, R7, 255
ORI	R2, R0, 9
BNE	R3, R2, L_Protocol_gcode_words486
NOP	
J	L_Protocol_gcode_words253
NOP	
L_Protocol_gcode_words486:
J	L_Protocol_gcode_words164
NOP	
; ch end address is: 28 (R7)
L_Protocol_gcode_words254:
L_Protocol_gcode_words253:
J	L_Protocol_gcode_words156
NOP	
L_Protocol_gcode_words164:
;Protocol.c,742 :: 		ch = toupper(ch);
; ch start address is: 28 (R7)
SW	R25, 4(SP)
; ch end address is: 28 (R7)
ANDI	R25, R7, 255
JAL	_toupper+0
NOP	
LW	R25, 4(SP)
; ch start address is: 28 (R7)
ANDI	R7, R2, 255
;Protocol.c,743 :: 		if(ch >= 'A' && ch <= 'Z'){
ANDI	R2, R2, 255
SLTIU	R2, R2, 65
BEQ	R2, R0, L_Protocol_gcode_words487
NOP	
J	L_Protocol_gcode_words256
NOP	
L_Protocol_gcode_words487:
ANDI	R2, R7, 255
SLTIU	R2, R2, 91
BNE	R2, R0, L_Protocol_gcode_words488
NOP	
J	L_Protocol_gcode_words255
NOP	
L_Protocol_gcode_words488:
; k end address is: 24 (R6)
L_Protocol_gcode_words251:
;Protocol.c,744 :: 		if(n >= arr_size) return -1;
SEH	R2, R5
SLTI	R2, R2, 20
BEQ	R2, R0, L_Protocol_gcode_words489
NOP	
J	L_Protocol_gcode_words168
NOP	
L_Protocol_gcode_words489:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; n end address is: 20 (R5)
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
L_Protocol_gcode_words168:
;Protocol.c,745 :: 		k = 0;
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
MOVZ	R6, R0, R0
;Protocol.c,746 :: 		gcode[n++][k++] = ch;
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
;Protocol.c,747 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
SEH	R5, R3
; n end address is: 12 (R3)
; k end address is: 8 (R2)
SEH	R6, R2
J	L_Protocol_gcode_words169
NOP	
;Protocol.c,743 :: 		if(ch >= 'A' && ch <= 'Z'){
L_Protocol_gcode_words256:
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
L_Protocol_gcode_words255:
;Protocol.c,747 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
BNE	R5, R0, L_Protocol_gcode_words491
NOP	
J	L_Protocol_gcode_words261
NOP	
L_Protocol_gcode_words491:
SW	R25, 4(SP)
ANDI	R25, R7, 255
JAL	_isdigit+0
NOP	
LW	R25, 4(SP)
BEQ	R2, R0, L_Protocol_gcode_words492
NOP	
J	L_Protocol_gcode_words260
NOP	
L_Protocol_gcode_words492:
ANDI	R3, R7, 255
ORI	R2, R0, 46
BNE	R3, R2, L_Protocol_gcode_words494
NOP	
J	L_Protocol_gcode_words259
NOP	
L_Protocol_gcode_words494:
ANDI	R3, R7, 255
ORI	R2, R0, 45
BNE	R3, R2, L_Protocol_gcode_words496
NOP	
J	L_Protocol_gcode_words258
NOP	
L_Protocol_gcode_words496:
ANDI	R3, R7, 255
ORI	R2, R0, 43
BNE	R3, R2, L_Protocol_gcode_words498
NOP	
J	L_Protocol_gcode_words257
NOP	
L_Protocol_gcode_words498:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
; n end address is: 20 (R5)
J	L_Protocol_gcode_words174
NOP	
L_Protocol_gcode_words260:
; n start address is: 20 (R5)
; k start address is: 24 (R6)
; ch start address is: 28 (R7)
; in_comment start address is: 16 (R4)
L_Protocol_gcode_words259:
L_Protocol_gcode_words258:
L_Protocol_gcode_words257:
L_Protocol_gcode_words249:
;Protocol.c,748 :: 		if(k >= str_size-1) return -1;
SEH	R2, R6
SLTI	R2, R2, 63
BEQ	R2, R0, L_Protocol_gcode_words499
NOP	
J	L_Protocol_gcode_words175
NOP	
L_Protocol_gcode_words499:
; in_comment end address is: 16 (R4)
; ch end address is: 28 (R7)
; k end address is: 24 (R6)
; n end address is: 20 (R5)
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
L_Protocol_gcode_words175:
;Protocol.c,749 :: 		gcode[n-1][k++] = ch;
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
;Protocol.c,750 :: 		}else{
J	L_Protocol_gcode_words176
NOP	
; in_comment end address is: 16 (R4)
; k end address is: 8 (R2)
; n end address is: 20 (R5)
L_Protocol_gcode_words174:
;Protocol.c,747 :: 		}else if(n && (isdigit(ch) || ch == '.' || ch == '-' || ch == '+')){
L_Protocol_gcode_words261:
;Protocol.c,751 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_gcode_words
NOP	
;Protocol.c,752 :: 		}
L_Protocol_gcode_words176:
; n start address is: 20 (R5)
; k start address is: 8 (R2)
; k end address is: 8 (R2)
; n end address is: 20 (R5)
SEH	R6, R2
; in_comment start address is: 16 (R4)
L_Protocol_gcode_words169:
;Protocol.c,753 :: 		}
; k start address is: 24 (R6)
; n start address is: 20 (R5)
; in_comment end address is: 16 (R4)
; k end address is: 24 (R6)
J	L_Protocol_gcode_words156
NOP	
L_Protocol_gcode_words157:
;Protocol.c,754 :: 		return n;
SEH	R2, R5
; n end address is: 20 (R5)
;Protocol.c,755 :: 		}
L_end_gcode_words:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Protocol_gcode_words
Protocol_Do_Gcode:
;Protocol.c,767 :: 		static int Do_Gcode(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,770 :: 		int err = STATUS_OK;
MOVZ	R30, R0, R0
SH	R30, 32(SP)
;Protocol.c,773 :: 		G_Begin_Block();
SW	R25, 4(SP)
JAL	_G_Begin_Block+0
NOP	
;Protocol.c,774 :: 		G_Save_State();
JAL	_G_Save_State+0
NOP	
LW	R25, 4(SP)
;Protocol.c,775 :: 		num_of_strings = gcode_words(str_);
JAL	Protocol_gcode_words+0
NOP	
SH	R2, 20(SP)
;Protocol.c,776 :: 		if(num_of_strings < 0) return STATUS_EXPECTED_COMMAND_LETTER;
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L_Protocol_Do_Gcode501
NOP	
J	L_Protocol_Do_Gcode177
NOP	
L_Protocol_Do_Gcode501:
ORI	R2, R0, 2
J	L_end_Do_Gcode
NOP	
L_Protocol_Do_Gcode177:
;Protocol.c,781 :: 		for(pass=0; pass < 2; pass++)
SH	R0, 18(SP)
L_Protocol_Do_Gcode178:
LH	R2, 18(SP)
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Do_Gcode502
NOP	
J	L_Protocol_Do_Gcode179
NOP	
L_Protocol_Do_Gcode502:
;Protocol.c,782 :: 		for(i=0; i < num_of_strings; i++){
SH	R0, 16(SP)
L_Protocol_Do_Gcode181:
LH	R3, 20(SP)
LH	R2, 16(SP)
SLT	R2, R2, R3
BNE	R2, R0, L_Protocol_Do_Gcode503
NOP	
J	L_Protocol_Do_Gcode182
NOP	
L_Protocol_Do_Gcode503:
;Protocol.c,783 :: 		is_mode = (gcode[i][0] == 'G' || gcode[i][0] == 'M');
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode505
NOP	
J	L_Protocol_Do_Gcode185
NOP	
L_Protocol_Do_Gcode505:
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_Do_Gcode507
NOP	
J	L_Protocol_Do_Gcode185
NOP	
L_Protocol_Do_Gcode507:
MOVZ	R2, R0, R0
J	L_Protocol_Do_Gcode184
NOP	
L_Protocol_Do_Gcode185:
ORI	R2, R0, 1
L_Protocol_Do_Gcode184:
; is_mode start address is: 16 (R4)
ANDI	R4, R2, 255
;Protocol.c,784 :: 		if(is_mode != (pass == 0)) continue;
LH	R2, 18(SP)
XORI	R3, R2, 0
SLTIU	R3, R3, 1
SEH	R2, R4
; is_mode end address is: 16 (R4)
BNE	R2, R3, L_Protocol_Do_Gcode510
NOP	
J	L_Protocol_Do_Gcode186
NOP	
L_Protocol_Do_Gcode510:
J	L_Protocol_Do_Gcode183
NOP	
L_Protocol_Do_Gcode186:
;Protocol.c,785 :: 		num = gcode[i]+1;
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SW	R2, 28(SP)
;Protocol.c,786 :: 		if(*num == 0){
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_Do_Gcode511
NOP	
J	L_Protocol_Do_Gcode187
NOP	
L_Protocol_Do_Gcode511:
;Protocol.c,787 :: 		st = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, 24(SP)
;Protocol.c,788 :: 		}else{
J	L_Protocol_Do_Gcode188
NOP	
L_Protocol_Do_Gcode187:
;Protocol.c,789 :: 		st = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,790 :: 		switch(gcode[i][0]){
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
SW	R2, 40(SP)
J	L_Protocol_Do_Gcode189
NOP	
;Protocol.c,791 :: 		case 'G':
L_Protocol_Do_Gcode191:
;Protocol.c,794 :: 		Val = (int)(atof(num)*10.0 + 0.5);
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
;Protocol.c,795 :: 		if(Val % 10 == 0){
ORI	R2, R0, 10
DIV	R3, R2
MFHI	R2
SEH	R2, R2
BEQ	R2, R0, L_Protocol_Do_Gcode512
NOP	
J	L_Protocol_Do_Gcode192
NOP	
L_Protocol_Do_Gcode512:
;Protocol.c,796 :: 		Val /= 10;
LH	R3, 22(SP)
ORI	R2, R0, 10
DIV	R3, R2
MFLO	R2
SH	R2, 22(SP)
;Protocol.c,797 :: 		if(Val == 28 || Val == 30 || Val == 92) Val *= 10;
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L_Protocol_Do_Gcode514
NOP	
J	L_Protocol_Do_Gcode266
NOP	
L_Protocol_Do_Gcode514:
LH	R3, 22(SP)
ORI	R2, R0, 30
BNE	R3, R2, L_Protocol_Do_Gcode516
NOP	
J	L_Protocol_Do_Gcode265
NOP	
L_Protocol_Do_Gcode516:
LH	R3, 22(SP)
ORI	R2, R0, 92
BNE	R3, R2, L_Protocol_Do_Gcode518
NOP	
J	L_Protocol_Do_Gcode264
NOP	
L_Protocol_Do_Gcode518:
J	L_Protocol_Do_Gcode195
NOP	
L_Protocol_Do_Gcode266:
L_Protocol_Do_Gcode265:
L_Protocol_Do_Gcode264:
LH	R3, 22(SP)
ORI	R2, R0, 10
MUL	R2, R3, R2
SH	R2, 22(SP)
L_Protocol_Do_Gcode195:
;Protocol.c,798 :: 		}
L_Protocol_Do_Gcode192:
;Protocol.c,799 :: 		G_Mode(Val);
SH	R26, 4(SP)
SW	R25, 8(SP)
LH	R25, 22(SP)
JAL	_G_Mode+0
NOP	
;Protocol.c,800 :: 		st = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,805 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,806 :: 		case 'M':
L_Protocol_Do_Gcode196:
;Protocol.c,807 :: 		M_Mode(atoi(num));
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
;Protocol.c,808 :: 		st = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 24(SP)
;Protocol.c,809 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,810 :: 		case 'X':case 'Y':case 'Z':case 'A':
L_Protocol_Do_Gcode197:
L_Protocol_Do_Gcode198:
L_Protocol_Do_Gcode199:
L_Protocol_Do_Gcode200:
;Protocol.c,811 :: 		case 'I':case 'J':case 'K':case 'R':case 'F':
L_Protocol_Do_Gcode201:
L_Protocol_Do_Gcode202:
L_Protocol_Do_Gcode203:
L_Protocol_Do_Gcode204:
L_Protocol_Do_Gcode205:
;Protocol.c,812 :: 		XYZ_Val = atof(num);
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atof+0
NOP	
LW	R25, 4(SP)
SWC1	S0, 12(SP)
;Protocol.c,813 :: 		st = Instruction_Values(gcode[i],&XYZ_Val);
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
;Protocol.c,818 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,819 :: 		case 'P':case 'L':
L_Protocol_Do_Gcode206:
L_Protocol_Do_Gcode207:
;Protocol.c,820 :: 		case 'S': // TODO: S is also spindle speed, unused until the spindle is driven.
L_Protocol_Do_Gcode208:
;Protocol.c,821 :: 		if(gcode[i][0] == 'P') gc.dwell = atof(num);
LH	R2, 16(SP)
SLL	R3, R2, 6
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BEQ	R3, R2, L_Protocol_Do_Gcode519
NOP	
J	L_Protocol_Do_Gcode209
NOP	
L_Protocol_Do_Gcode519:
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atof+0
NOP	
LW	R25, 4(SP)
SWC1	S0, Offset(_gc+128)(GP)
L_Protocol_Do_Gcode209:
;Protocol.c,822 :: 		Val = atoi(num);
SW	R25, 4(SP)
LW	R25, 28(SP)
JAL	_atoi+0
NOP	
LW	R25, 4(SP)
SH	R2, 22(SP)
;Protocol.c,823 :: 		st = Instruction_Values(gcode[i],&Val);
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
;Protocol.c,824 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,825 :: 		case 'N': // line numbers are accepted and ignored
L_Protocol_Do_Gcode210:
;Protocol.c,826 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,827 :: 		case 'T': // TODO: tool change needs a tool table and M6.
L_Protocol_Do_Gcode211:
;Protocol.c,828 :: 		default:
L_Protocol_Do_Gcode212:
;Protocol.c,829 :: 		st = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
;Protocol.c,830 :: 		break;
J	L_Protocol_Do_Gcode190
NOP	
;Protocol.c,831 :: 		}
L_Protocol_Do_Gcode189:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Do_Gcode521
NOP	
J	L_Protocol_Do_Gcode191
NOP	
L_Protocol_Do_Gcode521:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 77
BNE	R3, R2, L_Protocol_Do_Gcode523
NOP	
J	L_Protocol_Do_Gcode196
NOP	
L_Protocol_Do_Gcode523:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Do_Gcode525
NOP	
J	L_Protocol_Do_Gcode197
NOP	
L_Protocol_Do_Gcode525:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L_Protocol_Do_Gcode527
NOP	
J	L_Protocol_Do_Gcode198
NOP	
L_Protocol_Do_Gcode527:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L_Protocol_Do_Gcode529
NOP	
J	L_Protocol_Do_Gcode199
NOP	
L_Protocol_Do_Gcode529:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L_Protocol_Do_Gcode531
NOP	
J	L_Protocol_Do_Gcode200
NOP	
L_Protocol_Do_Gcode531:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L_Protocol_Do_Gcode533
NOP	
J	L_Protocol_Do_Gcode201
NOP	
L_Protocol_Do_Gcode533:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L_Protocol_Do_Gcode535
NOP	
J	L_Protocol_Do_Gcode202
NOP	
L_Protocol_Do_Gcode535:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L_Protocol_Do_Gcode537
NOP	
J	L_Protocol_Do_Gcode203
NOP	
L_Protocol_Do_Gcode537:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L_Protocol_Do_Gcode539
NOP	
J	L_Protocol_Do_Gcode204
NOP	
L_Protocol_Do_Gcode539:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L_Protocol_Do_Gcode541
NOP	
J	L_Protocol_Do_Gcode205
NOP	
L_Protocol_Do_Gcode541:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L_Protocol_Do_Gcode543
NOP	
J	L_Protocol_Do_Gcode206
NOP	
L_Protocol_Do_Gcode543:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L_Protocol_Do_Gcode545
NOP	
J	L_Protocol_Do_Gcode207
NOP	
L_Protocol_Do_Gcode545:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L_Protocol_Do_Gcode547
NOP	
J	L_Protocol_Do_Gcode208
NOP	
L_Protocol_Do_Gcode547:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Do_Gcode549
NOP	
J	L_Protocol_Do_Gcode210
NOP	
L_Protocol_Do_Gcode549:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 84
BNE	R3, R2, L_Protocol_Do_Gcode551
NOP	
J	L_Protocol_Do_Gcode211
NOP	
L_Protocol_Do_Gcode551:
J	L_Protocol_Do_Gcode212
NOP	
L_Protocol_Do_Gcode190:
;Protocol.c,832 :: 		}
L_Protocol_Do_Gcode188:
;Protocol.c,833 :: 		if(err == STATUS_OK) err = st;
LH	R2, 32(SP)
BEQ	R2, R0, L_Protocol_Do_Gcode552
NOP	
J	L_Protocol_Do_Gcode213
NOP	
L_Protocol_Do_Gcode552:
LH	R2, 24(SP)
SH	R2, 32(SP)
L_Protocol_Do_Gcode213:
;Protocol.c,834 :: 		}
L_Protocol_Do_Gcode183:
;Protocol.c,782 :: 		for(i=0; i < num_of_strings; i++){
LH	R2, 16(SP)
ADDIU	R2, R2, 1
SH	R2, 16(SP)
;Protocol.c,834 :: 		}
J	L_Protocol_Do_Gcode181
NOP	
L_Protocol_Do_Gcode182:
;Protocol.c,781 :: 		for(pass=0; pass < 2; pass++)
LH	R2, 18(SP)
ADDIU	R2, R2, 1
SH	R2, 18(SP)
;Protocol.c,834 :: 		}
J	L_Protocol_Do_Gcode178
NOP	
L_Protocol_Do_Gcode179:
;Protocol.c,836 :: 		if(err == STATUS_OK) err = Check_group_multiple_violations();
LH	R2, 32(SP)
BEQ	R2, R0, L_Protocol_Do_Gcode553
NOP	
J	L_Protocol_Do_Gcode214
NOP	
L_Protocol_Do_Gcode553:
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_Check_group_multiple_violations+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
SH	R2, 32(SP)
L_Protocol_Do_Gcode214:
;Protocol.c,837 :: 		if(err != STATUS_OK) G_Restore_State();
LH	R2, 32(SP)
BNE	R2, R0, L_Protocol_Do_Gcode555
NOP	
J	L_Protocol_Do_Gcode215
NOP	
L_Protocol_Do_Gcode555:
SH	R26, 4(SP)
SW	R25, 8(SP)
JAL	_G_Restore_State+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
L_Protocol_Do_Gcode215:
;Protocol.c,838 :: 		return err;
LH	R2, 32(SP)
;Protocol.c,839 :: 		}
L_end_Do_Gcode:
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Protocol_Do_Gcode
