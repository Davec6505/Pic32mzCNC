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
BNE	R2, R0, L__Str_Initialize386
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize386:
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
BNE	R2, R0, L_Protocol_strsplit389
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit389:
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
BNE	R3, R2, L_Protocol_strsplit391
NOP	
J	L_Protocol_strsplit326
NOP	
L_Protocol_strsplit391:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit393
NOP	
J	L_Protocol_strsplit325
NOP	
L_Protocol_strsplit393:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit394
NOP	
J	L_Protocol_strsplit324
NOP	
L_Protocol_strsplit394:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit326:
L_Protocol_strsplit325:
L_Protocol_strsplit324:
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
BEQ	R2, R0, L_Protocol_strsplit395
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit395:
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
;Protocol.c,84 :: 		track_char=ii=kk=err=lasti=0;
; lasti start address is: 32 (R8)
MOVZ	R8, R0, R0
; kk start address is: 28 (R7)
MOVZ	R7, R0, R0
; ii start address is: 36 (R9)
MOVZ	R9, R0, R0
; track_char start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,85 :: 		for (i = 0;i < len;i++){
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
BNE	R2, R0, L_Protocol_strsplit2397
NOP	
J	L_Protocol_strsplit2341
NOP	
L_Protocol_strsplit2397:
;Protocol.c,86 :: 		err = i - lasti; //test if string in string is < 49
SUBU	R2, R5, R8
; err start address is: 40 (R10)
SEH	R10, R2
;Protocol.c,87 :: 		if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L_Protocol_strsplit2399
NOP	
J	L_Protocol_strsplit2332
NOP	
L_Protocol_strsplit2399:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2401
NOP	
J	L_Protocol_strsplit2331
NOP	
L_Protocol_strsplit2401:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2402
NOP	
J	L_Protocol_strsplit2330
NOP	
L_Protocol_strsplit2402:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2332:
L_Protocol_strsplit2331:
L_Protocol_strsplit2330:
;Protocol.c,88 :: 		arg[kk++][ii] = 0;
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
;Protocol.c,89 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;Protocol.c,90 :: 		lasti = i;
; lasti start address is: 32 (R8)
SEH	R8, R5
;Protocol.c,91 :: 		track_char++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Protocol.c,92 :: 		continue;
SEH	R9, R7
; ii end address is: 28 (R7)
; kk end address is: 12 (R3)
SEH	R7, R3
J	L_Protocol_strsplit213
NOP	
;Protocol.c,93 :: 		}else{
L_Protocol_strsplit216:
;Protocol.c,94 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 28 (R7)
; ii start address is: 36 (R9)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L_Protocol_strsplit2403
NOP	
J	L_Protocol_strsplit2339
NOP	
L_Protocol_strsplit2403:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2405
NOP	
J	L_Protocol_strsplit2340
NOP	
L_Protocol_strsplit2405:
L_Protocol_strsplit2328:
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2406
NOP	
J	L_Protocol_strsplit2337
NOP	
L_Protocol_strsplit2406:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2407
NOP	
J	L_Protocol_strsplit2338
NOP	
L_Protocol_strsplit2407:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2327:
;Protocol.c,96 :: 		arg[kk++][ii] = 0;
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R9
; ii end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R7, 1
SEH	R7, R2
;Protocol.c,97 :: 		ii=err=0;
; ii start address is: 12 (R3)
MOVZ	R3, R0, R0
;Protocol.c,98 :: 		lasti = i;
; lasti start address is: 8 (R2)
SEH	R2, R5
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
J	L_Protocol_strsplit2334
NOP	
L_Protocol_strsplit2337:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2334:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2333
NOP	
L_Protocol_strsplit2338:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2333:
;Protocol.c,94 :: 		if(i > 0 && (*(str+0) != '$') ){
; kk start address is: 8 (R2)
; ii start address is: 12 (R3)
; lasti start address is: 28 (R7)
SEH	R8, R7
; kk end address is: 8 (R2)
; lasti end address is: 28 (R7)
; ii end address is: 12 (R3)
SEH	R7, R2
SEH	R9, R3
J	L_Protocol_strsplit2336
NOP	
L_Protocol_strsplit2339:
L_Protocol_strsplit2336:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2335
NOP	
L_Protocol_strsplit2340:
L_Protocol_strsplit2335:
;Protocol.c,101 :: 		arg[kk][ii++] = *(str+i);
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
;Protocol.c,103 :: 		if(*(str+i)==0)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L_Protocol_strsplit2408
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2408:
; len end address is: 16 (R4)
; ii end address is: 12 (R3)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; i end address is: 20 (R5)
;Protocol.c,104 :: 		break;
SEH	R3, R7
J	L_Protocol_strsplit212
NOP	
L_Protocol_strsplit224:
;Protocol.c,105 :: 		}
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
;Protocol.c,85 :: 		for (i = 0;i < len;i++){
; track_char start address is: 24 (R6)
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,105 :: 		}
; len end address is: 16 (R4)
; track_char end address is: 24 (R6)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_Protocol_strsplit211
NOP	
L_Protocol_strsplit2341:
;Protocol.c,85 :: 		for (i = 0;i < len;i++){
SEH	R3, R7
;Protocol.c,105 :: 		}
L_Protocol_strsplit212:
;Protocol.c,106 :: 		arg[kk][0] = 0;
; kk start address is: 12 (R3)
SEH	R2, R3
SLL	R2, R2, 6
ADDU	R2, R25, R2
SB	R0, 0(R2)
;Protocol.c,107 :: 		return kk;
SEH	R2, R3
; kk end address is: 12 (R3)
;Protocol.c,108 :: 		}
L_end_strsplit2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Protocol_strsplit2
Protocol_cpy_val_from_str:
;Protocol.c,112 :: 		static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
;Protocol.c,115 :: 		tmp = strB+indx;
SEH	R2, R27
ADDU	R2, R26, R2
; tmp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Protocol.c,116 :: 		*(tmp+num_of_char)=0;
SEH	R2, R28
ADDU	R2, R4, R2
SB	R0, 0(R2)
;Protocol.c,118 :: 		i = 0;
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; tmp end address is: 16 (R4)
; i end address is: 12 (R3)
;Protocol.c,119 :: 		while(*tmp != 0){
L_Protocol_cpy_val_from_str25:
; i start address is: 12 (R3)
; tmp start address is: 16 (R4)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L_Protocol_cpy_val_from_str411
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str411:
;Protocol.c,120 :: 		*strA++ = *tmp++;
LBU	R2, 0(R4)
SB	R2, 0(R25)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Protocol.c,121 :: 		i++;
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,122 :: 		}
; tmp end address is: 16 (R4)
J	L_Protocol_cpy_val_from_str25
NOP	
L_Protocol_cpy_val_from_str26:
;Protocol.c,123 :: 		*strA = '\0';
SB	R0, 0(R25)
;Protocol.c,125 :: 		return i;
SEH	R2, R3
; i end address is: 12 (R3)
;Protocol.c,126 :: 		}
L_end_cpy_val_from_str:
JR	RA
NOP	
; end of Protocol_cpy_val_from_str
Protocol_str2int:
;Protocol.c,131 :: 		static int str2int(char *str,int base){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,133 :: 		int result = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Protocol.c,135 :: 		len = strlen(str);
JAL	_strlen+0
NOP	
SH	R2, 12(SP)
;Protocol.c,137 :: 		for(i=0; i<len; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_str2int27:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 12(SP)
SLT	R2, R3, R2
BNE	R2, R0, L_Protocol_str2int413
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int413:
;Protocol.c,138 :: 		result = result * base + ( *(str+i) - 0x30 );
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
;Protocol.c,139 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L_Protocol_str2int415
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int415:
J	L_Protocol_str2int30
NOP	
L_Protocol_str2int31:
;Protocol.c,137 :: 		for(i=0; i<len; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,140 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_str2int27
NOP	
L_Protocol_str2int28:
;Protocol.c,142 :: 		return result;
LH	R2, 14(SP)
;Protocol.c,143 :: 		}
L_end_str2int:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_str2int
_protocol_execute_runtime:
;Protocol.c,204 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,205 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LH	R2, Offset(_sys+18)(GP)
BNE	R2, R0, L__protocol_execute_runtime418
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime418:
;Protocol.c,206 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime420
NOP	
J	L__protocol_execute_runtime343
NOP	
L__protocol_execute_runtime420:
;Protocol.c,212 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,215 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime422
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime422:
;Protocol.c,216 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SH	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Protocol.c,217 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LH	R4, 8(SP)
;Protocol.c,218 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,219 :: 		do {
J	L_protocol_execute_runtime35
NOP	
L__protocol_execute_runtime342:
;Protocol.c,223 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Protocol.c,219 :: 		do {
L_protocol_execute_runtime35:
;Protocol.c,223 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 16
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime424
NOP	
J	L__protocol_execute_runtime342
NOP	
L__protocol_execute_runtime424:
; rt_exec end address is: 12 (R3)
;Protocol.c,226 :: 		} else {
; rt_exec start address is: 12 (R3)
SEH	R4, R3
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime38
NOP	
L_protocol_execute_runtime34:
;Protocol.c,230 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SH	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LH	R4, 8(SP)
;Protocol.c,231 :: 		}
L_protocol_execute_runtime38:
;Protocol.c,232 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65439
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
; rt_exec end address is: 16 (R4)
;Protocol.c,233 :: 		}
J	L_protocol_execute_runtime33
NOP	
L__protocol_execute_runtime343:
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,233 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,236 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime426
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime426:
; rt_exec end address is: 16 (R4)
;Protocol.c,237 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SH	R2, Offset(_sys+0)(GP)
;Protocol.c,238 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Protocol.c,239 :: 		}
L_protocol_execute_runtime39:
;Protocol.c,242 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime428
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime428:
;Protocol.c,243 :: 		report_realtime_status();
SH	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LH	R4, 8(SP)
;Protocol.c,244 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,245 :: 		}
L_protocol_execute_runtime40:
;Protocol.c,248 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime430
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime430:
;Protocol.c,250 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,251 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,255 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime432
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime432:
;Protocol.c,257 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,258 :: 		}
L_protocol_execute_runtime42:
;Protocol.c,260 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime434
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime434:
;Protocol.c,262 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime436
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime436:
;Protocol.c,263 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
;Protocol.c,264 :: 		}
L_protocol_execute_runtime44:
;Protocol.c,265 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,266 :: 		}
L_protocol_execute_runtime43:
;Protocol.c,267 :: 		}
L_protocol_execute_runtime32:
;Protocol.c,271 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
_protocol_system_check:
;Protocol.c,275 :: 		void protocol_system_check(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Protocol.c,279 :: 		if (sys.abort) {
SW	R25, 4(SP)
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__protocol_system_check439
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check439:
;Protocol.c,292 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Protocol.c,295 :: 		sys.abort = 0;
SH	R0, Offset(_sys+0)(GP)
;Protocol.c,296 :: 		sys.execute = 0;
SH	R0, Offset(_sys+18)(GP)
;Protocol.c,297 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) { sys.auto_start = true; }
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check441
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check441:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,307 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check442
NOP	
J	L__protocol_system_check346
NOP	
L__protocol_system_check442:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check444
NOP	
J	L__protocol_system_check345
NOP	
L__protocol_system_check444:
L__protocol_system_check344:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check346:
L__protocol_system_check345:
;Protocol.c,311 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check445
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check445:
;Protocol.c,312 :: 		report_feedback_message(MESSAGE_ALARM_LOCK);
ORI	R25, R0, 2
JAL	_report_feedback_message+0
NOP	
;Protocol.c,313 :: 		} else {
J	L_protocol_system_check51
NOP	
L_protocol_system_check50:
;Protocol.c,315 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,317 :: 		}
L_protocol_system_check51:
;Protocol.c,318 :: 		}
L_protocol_system_check45:
;Protocol.c,319 :: 		}
L_end_protocol_system_check:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _protocol_system_check
_Sample_Gocde_Line:
;Protocol.c,324 :: 		int Sample_Gocde_Line(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Protocol.c,331 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
SH	R2, 78(SP)
;Protocol.c,332 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Gocde_Line447
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line447:
;Protocol.c,335 :: 		Str_clear(str,64);
ADDIU	R2, SP, 14
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,337 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
LH	R26, 78(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,344 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line448
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line448:
;Protocol.c,347 :: 		for(i = 0;i <= dif;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
SEH	R4, R5
L_Sample_Gocde_Line54:
; i start address is: 16 (R4)
SEH	R3, R4
LH	R2, 78(SP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Sample_Gocde_Line449
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line449:
;Protocol.c,348 :: 		if(str[i] == '?'){
ADDIU	R3, SP, 14
SEH	R2, R4
ADDU	R2, R3, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line450
NOP	
J	L_Sample_Gocde_Line57
NOP	
L__Sample_Gocde_Line450:
;Protocol.c,349 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,350 :: 		report_init_message();
SH	R4, 12(SP)
JAL	_report_init_message+0
NOP	
LH	R4, 12(SP)
;Protocol.c,351 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,352 :: 		}
L_Sample_Gocde_Line57:
;Protocol.c,347 :: 		for(i = 0;i <= dif;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,353 :: 		}
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Sample_Gocde_Line54
NOP	
L_Sample_Gocde_Line55:
;Protocol.c,354 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,355 :: 		}
L_Sample_Gocde_Line52:
;Protocol.c,356 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,358 :: 		}
;Protocol.c,356 :: 		return STATUS_OK;
;Protocol.c,358 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _Sample_Gocde_Line
_Sample_Ringbuffer:
;Protocol.c,367 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,377 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,378 :: 		int axis_to_run = 0;
;Protocol.c,385 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,388 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer453
NOP	
J	L__Sample_Ringbuffer358
NOP	
L__Sample_Ringbuffer453:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer454
NOP	
J	L__Sample_Ringbuffer357
NOP	
L__Sample_Ringbuffer454:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer356:
;Protocol.c,389 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,390 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,391 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,392 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,388 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer358:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer357:
;Protocol.c,395 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer455
NOP	
J	L_Sample_Ringbuffer61
NOP	
L__Sample_Ringbuffer455:
; dif end address is: 20 (R5)
;Protocol.c,397 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer457
NOP	
J	L_Sample_Ringbuffer62
NOP	
L__Sample_Ringbuffer457:
;Protocol.c,398 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,399 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer458
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer458:
;Protocol.c,404 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,405 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer459
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer459:
;Protocol.c,406 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer64:
;Protocol.c,407 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,408 :: 		}
L_Sample_Ringbuffer63:
;Protocol.c,409 :: 		}
L_Sample_Ringbuffer62:
;Protocol.c,410 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,411 :: 		}else if(dif > 0){
L_Sample_Ringbuffer61:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer460:
;Protocol.c,412 :: 		int modal_response = 0;
;Protocol.c,413 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,415 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,416 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,417 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,422 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,424 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,446 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer461
NOP	
J	L_Sample_Ringbuffer67
NOP	
L__Sample_Ringbuffer461:
;Protocol.c,451 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,452 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,453 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,454 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,455 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,456 :: 		}
L_Sample_Ringbuffer67:
;Protocol.c,465 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,468 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer462:
;Protocol.c,469 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,470 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer463:
;Protocol.c,471 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer69:
;Protocol.c,472 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,473 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer68:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer464:
;Protocol.c,475 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer72
NOP	
L__Sample_Ringbuffer465:
;Protocol.c,476 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,477 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,478 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,479 :: 		}
L_Sample_Ringbuffer72:
;Protocol.c,480 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer73
NOP	
;Protocol.c,481 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer75:
;Protocol.c,482 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,483 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,484 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,485 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer76:
;Protocol.c,486 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,487 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,488 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,489 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer77:
;Protocol.c,490 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,491 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,492 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,493 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer78:
;Protocol.c,494 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,495 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,498 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer466:
;Protocol.c,499 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer79:
;Protocol.c,500 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,501 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,502 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer80:
;Protocol.c,503 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,507 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer467:
;Protocol.c,508 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,509 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,510 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,511 :: 		} else {
L_Sample_Ringbuffer81:
;Protocol.c,513 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer469:
;Protocol.c,514 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,515 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,516 :: 		}
L_Sample_Ringbuffer83:
;Protocol.c,518 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,519 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,521 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,522 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,524 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer84:
;Protocol.c,525 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,526 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer470:
;Protocol.c,527 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,528 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,530 :: 		}
L_Sample_Ringbuffer85:
;Protocol.c,531 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,532 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,533 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer86:
;Protocol.c,534 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,536 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer472:
;Protocol.c,537 :: 		int axis_to_home = 0;
;Protocol.c,540 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer474
NOP	
J	L__Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer474:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer476
NOP	
J	L__Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer476:
J	L_Sample_Ringbuffer90
NOP	
L__Sample_Ringbuffer360:
L__Sample_Ringbuffer359:
;Protocol.c,541 :: 		int i = 0;
;Protocol.c,542 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,545 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,546 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer91:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer477:
;Protocol.c,547 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,546 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,547 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer91
NOP	
L_Sample_Ringbuffer92:
;Protocol.c,550 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer479
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer479:
;Protocol.c,551 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,552 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,553 :: 		}
L_Sample_Ringbuffer94:
;Protocol.c,554 :: 		} else {
J	L_Sample_Ringbuffer95
NOP	
L_Sample_Ringbuffer90:
;Protocol.c,555 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,556 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,557 :: 		}
L_Sample_Ringbuffer95:
;Protocol.c,558 :: 		} else {
J	L_Sample_Ringbuffer96
NOP	
L_Sample_Ringbuffer87:
;Protocol.c,559 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,560 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,561 :: 		}
L_Sample_Ringbuffer96:
;Protocol.c,564 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,565 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,566 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,567 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer97:
;Protocol.c,568 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,569 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer480
NOP	
J	L_Sample_Ringbuffer98
NOP	
L__Sample_Ringbuffer480:
;Protocol.c,570 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer99:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer481
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer481:
;Protocol.c,571 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer483
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer483:
;Protocol.c,573 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,574 :: 		} else {
J	L_Sample_Ringbuffer103
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,575 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,576 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,577 :: 		}
L_Sample_Ringbuffer103:
;Protocol.c,570 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,582 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer99
NOP	
L_Sample_Ringbuffer100:
;Protocol.c,583 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,584 :: 		}else { // Store startup line
L_Sample_Ringbuffer98:
;Protocol.c,585 :: 		int N_Val = 0;
;Protocol.c,586 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,591 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer484
NOP	
J	L__Sample_Ringbuffer362
NOP	
L__Sample_Ringbuffer484:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer485
NOP	
J	L__Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer485:
L__Sample_Ringbuffer354:
;Protocol.c,592 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,594 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,595 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,602 :: 		}else {
J	L_Sample_Ringbuffer108
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,591 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer362:
L__Sample_Ringbuffer361:
;Protocol.c,603 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,604 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,605 :: 		}
L_Sample_Ringbuffer108:
;Protocol.c,608 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer487
NOP	
J	L_Sample_Ringbuffer109
NOP	
L__Sample_Ringbuffer487:
; helper_var end address is: 28 (R7)
;Protocol.c,609 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer489
NOP	
J	L_Sample_Ringbuffer110
NOP	
L__Sample_Ringbuffer489:
; N_Val end address is: 16 (R4)
;Protocol.c,612 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,613 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,621 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,626 :: 		}else{
J	L_Sample_Ringbuffer111
NOP	
L_Sample_Ringbuffer110:
;Protocol.c,627 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,635 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,636 :: 		}
L_Sample_Ringbuffer111:
;Protocol.c,638 :: 		}
L_Sample_Ringbuffer109:
;Protocol.c,640 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,641 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,642 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer112:
;Protocol.c,643 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,644 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,645 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,646 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer113:
;Protocol.c,647 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,648 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,650 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer114:
;Protocol.c,651 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,652 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,653 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,654 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer115:
L_Sample_Ringbuffer116:
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
;Protocol.c,655 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
;Protocol.c,659 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer491
NOP	
J	L__Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer491:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer493
NOP	
J	L__Sample_Ringbuffer363
NOP	
L__Sample_Ringbuffer493:
J	L_Sample_Ringbuffer127
NOP	
L__Sample_Ringbuffer364:
L__Sample_Ringbuffer363:
;Protocol.c,660 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,661 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,662 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,663 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer128
NOP	
L__Sample_Ringbuffer494:
;Protocol.c,665 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,666 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer496
NOP	
J	L__Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer496:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer381:
L_Sample_Ringbuffer129:
;Protocol.c,667 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
; N_Val start address is: 24 (R6)
LUI	R25, hi_addr(_gcode+3)
ORI	R25, R25, lo_addr(_gcode+3)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 115
SEH	R27, R2
LUI	R26, hi_addr(_gcode+3)
ORI	R26, R26, lo_addr(_gcode+3)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,668 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer130
NOP	
L_Sample_Ringbuffer128:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer497
NOP	
J	L__Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer497:
;Protocol.c,670 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,671 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer499
NOP	
J	L__Sample_Ringbuffer382
NOP	
L__Sample_Ringbuffer499:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer132
NOP	
L__Sample_Ringbuffer382:
SEH	R5, R6
L_Sample_Ringbuffer132:
;Protocol.c,672 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,673 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
LUI	R25, hi_addr(_gcode+4)
ORI	R25, R25, lo_addr(_gcode+4)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 115
SH	R5, 20(SP)
SEH	R27, R2
LUI	R26, hi_addr(_gcode+4)
ORI	R26, R26, lo_addr(_gcode+4)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
; N_Val end address is: 20 (R5)
LH	R5, 20(SP)
SEH	R7, R5
;Protocol.c,674 :: 		}
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer383:
;Protocol.c,668 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,674 :: 		}
L_Sample_Ringbuffer131:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer130:
;Protocol.c,677 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer500
NOP	
J	L__Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer500:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer502
NOP	
J	L__Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer502:
J	L_Sample_Ringbuffer135
NOP	
L__Sample_Ringbuffer366:
L__Sample_Ringbuffer365:
;Protocol.c,678 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,679 :: 		}
L_Sample_Ringbuffer135:
;Protocol.c,680 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,685 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,688 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,689 :: 		}
L_Sample_Ringbuffer127:
;Protocol.c,690 :: 		break;
J	L_Sample_Ringbuffer74
NOP	
;Protocol.c,691 :: 		}
L_Sample_Ringbuffer73:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer504
NOP	
J	L_Sample_Ringbuffer75
NOP	
L__Sample_Ringbuffer504:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer506
NOP	
J	L_Sample_Ringbuffer76
NOP	
L__Sample_Ringbuffer506:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer508
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer508:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer510
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer510:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer512
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer512:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer514
NOP	
J	L_Sample_Ringbuffer84
NOP	
L__Sample_Ringbuffer514:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer516
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer516:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer518
NOP	
J	L_Sample_Ringbuffer97
NOP	
L__Sample_Ringbuffer518:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer520
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer520:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer522
NOP	
J	L_Sample_Ringbuffer113
NOP	
L__Sample_Ringbuffer522:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer524
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer524:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer526
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer526:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer528
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer528:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer530
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer530:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer532
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer532:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer534
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer534:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer536
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer536:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer538
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer538:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer540
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer540:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer542
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer542:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer544
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer544:
L_Sample_Ringbuffer74:
;Protocol.c,693 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer136
NOP	
L_Sample_Ringbuffer71:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer545
NOP	
J	L__Sample_Ringbuffer380
NOP	
L__Sample_Ringbuffer545:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer546
NOP	
J	L__Sample_Ringbuffer379
NOP	
L__Sample_Ringbuffer546:
L__Sample_Ringbuffer351:
;Protocol.c,694 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,695 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer140
NOP	
;Protocol.c,696 :: 		case 'G':case 'g':
L_Sample_Ringbuffer142:
L_Sample_Ringbuffer143:
;Protocol.c,698 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer547:
;Protocol.c,699 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,700 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer548
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer548:
;Protocol.c,701 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,704 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer550
NOP	
J	L__Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer550:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer552
NOP	
J	L__Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer552:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer554
NOP	
J	L__Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer554:
SEH	R2, R4
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer369:
L__Sample_Ringbuffer368:
L__Sample_Ringbuffer367:
;Protocol.c,705 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer148:
;Protocol.c,706 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer149
NOP	
L_Sample_Ringbuffer145:
;Protocol.c,708 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
;Protocol.c,709 :: 		}
L_Sample_Ringbuffer149:
;Protocol.c,711 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,713 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer555:
; ?FLOC___Sample_Ringbuffer?T360 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T360 end address is: 12 (R3)
J	L_Sample_Ringbuffer151
NOP	
L_Sample_Ringbuffer150:
; ?FLOC___Sample_Ringbuffer?T360 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T360 end address is: 12 (R3)
L_Sample_Ringbuffer151:
; ?FLOC___Sample_Ringbuffer?T360 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T360 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,723 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer557
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer557:
;Protocol.c,724 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,726 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer153
NOP	
;Protocol.c,727 :: 		case 'G':case 'g':
L_Sample_Ringbuffer155:
L_Sample_Ringbuffer156:
;Protocol.c,728 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer558
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer558:
;Protocol.c,729 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,732 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer560
NOP	
J	L__Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer560:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer562
NOP	
J	L__Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer562:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer564
NOP	
J	L__Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer564:
SEH	R2, R4
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer372:
L__Sample_Ringbuffer371:
L__Sample_Ringbuffer370:
;Protocol.c,733 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer160:
;Protocol.c,734 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer161
NOP	
L_Sample_Ringbuffer157:
;Protocol.c,736 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
;Protocol.c,737 :: 		}
L_Sample_Ringbuffer161:
;Protocol.c,739 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,741 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer565:
; ?FLOC___Sample_Ringbuffer?T383 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T383 end address is: 12 (R3)
J	L_Sample_Ringbuffer163
NOP	
L_Sample_Ringbuffer162:
; ?FLOC___Sample_Ringbuffer?T383 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T383 end address is: 12 (R3)
L_Sample_Ringbuffer163:
; ?FLOC___Sample_Ringbuffer?T383 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T383 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,747 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,748 :: 		case 'X':case 'x':
L_Sample_Ringbuffer164:
L_Sample_Ringbuffer165:
;Protocol.c,749 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,750 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer168:
L_Sample_Ringbuffer169:
;Protocol.c,751 :: 		case 'A':case 'a':
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
;Protocol.c,753 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,754 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,758 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,759 :: 		case 'L':case 'l':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,760 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,761 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,765 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,766 :: 		case 'F':case 'f':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,767 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,768 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,772 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,773 :: 		case 'P':case 'p':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,774 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,775 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,779 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,780 :: 		case 'S':case 's':
L_Sample_Ringbuffer178:
L_Sample_Ringbuffer179:
;Protocol.c,781 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,782 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,786 :: 		break;
J	L_Sample_Ringbuffer154
NOP	
;Protocol.c,787 :: 		}
L_Sample_Ringbuffer153:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer567
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer567:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer569
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer569:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer571
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer571:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer573
NOP	
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer573:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer575
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer575:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer577
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer577:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer579
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer579:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer581
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer581:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer583
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer583:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer585
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer585:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer587
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer587:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer589
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer589:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer591
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer591:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer593
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer593:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer595
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer595:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer597
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer597:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer599
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer599:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer601
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer601:
L_Sample_Ringbuffer154:
;Protocol.c,788 :: 		}
L_Sample_Ringbuffer152:
;Protocol.c,793 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer603
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer603:
;Protocol.c,794 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+128)
ORI	R26, R26, lo_addr(_gcode+128)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,795 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer181
NOP	
;Protocol.c,796 :: 		case 'G':case 'g':
L_Sample_Ringbuffer183:
L_Sample_Ringbuffer184:
;Protocol.c,797 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer604
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer604:
;Protocol.c,798 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,801 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer606
NOP	
J	L__Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer606:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer608
NOP	
J	L__Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer608:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer610
NOP	
J	L__Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer610:
SEH	R2, R4
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer375:
L__Sample_Ringbuffer374:
L__Sample_Ringbuffer373:
;Protocol.c,802 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer188:
;Protocol.c,803 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer189
NOP	
L_Sample_Ringbuffer185:
;Protocol.c,805 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
;Protocol.c,806 :: 		}
L_Sample_Ringbuffer189:
;Protocol.c,808 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,810 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer611
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer611:
; ?FLOC___Sample_Ringbuffer?T445 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T445 end address is: 12 (R3)
J	L_Sample_Ringbuffer191
NOP	
L_Sample_Ringbuffer190:
; ?FLOC___Sample_Ringbuffer?T445 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T445 end address is: 12 (R3)
L_Sample_Ringbuffer191:
; ?FLOC___Sample_Ringbuffer?T445 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T445 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,814 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,815 :: 		case 'X':case 'x':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
;Protocol.c,816 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,817 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
;Protocol.c,818 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,819 :: 		case 'I':case 'i':
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,820 :: 		case 'J':case 'j':
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,822 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,823 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,827 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,828 :: 		case 'L':case 'l':
L_Sample_Ringbuffer204:
L_Sample_Ringbuffer205:
;Protocol.c,829 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,830 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,834 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,835 :: 		case 'F':case 'f':
L_Sample_Ringbuffer206:
L_Sample_Ringbuffer207:
;Protocol.c,836 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,837 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,841 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,842 :: 		case 'P':case 'p':
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
;Protocol.c,843 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,844 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,848 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,849 :: 		case 'S':case 's':
L_Sample_Ringbuffer210:
L_Sample_Ringbuffer211:
;Protocol.c,850 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,851 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,855 :: 		break;
J	L_Sample_Ringbuffer182
NOP	
;Protocol.c,856 :: 		}
L_Sample_Ringbuffer181:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer613
NOP	
J	L_Sample_Ringbuffer183
NOP	
L__Sample_Ringbuffer613:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer615
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer615:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer617
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer617:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer619
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer619:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer621
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer621:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer623
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer623:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer625
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer625:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer627
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer627:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer629
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer629:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer631
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer631:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer633
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer633:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer635
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer635:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer637
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer637:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer639
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer639:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer641
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer641:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer643:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer645:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer647:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer649:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer651:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer653:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer655
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer655:
L_Sample_Ringbuffer182:
;Protocol.c,857 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,861 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer657:
;Protocol.c,862 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+192)
ORI	R26, R26, lo_addr(_gcode+192)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
; i start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,863 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer213
NOP	
;Protocol.c,864 :: 		case 'G':case 'g':
L_Sample_Ringbuffer215:
L_Sample_Ringbuffer216:
;Protocol.c,865 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer658
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer658:
;Protocol.c,866 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,869 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L__Sample_Ringbuffer378
NOP	
L__Sample_Ringbuffer660:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer662
NOP	
J	L__Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer662:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer664
NOP	
J	L__Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer664:
SEH	R2, R4
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer378:
L__Sample_Ringbuffer377:
L__Sample_Ringbuffer376:
;Protocol.c,870 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer220:
;Protocol.c,871 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer221
NOP	
L_Sample_Ringbuffer217:
;Protocol.c,873 :: 		G_Val = (int)(atof(temp)*10.0);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
LUI	R2, 16672
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
CVT36.S 	S0, S0
MFC1	R2, S0
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
;Protocol.c,874 :: 		}
L_Sample_Ringbuffer221:
;Protocol.c,876 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,878 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer665:
; ?FLOC___Sample_Ringbuffer?T512 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T512 end address is: 12 (R3)
J	L_Sample_Ringbuffer223
NOP	
L_Sample_Ringbuffer222:
; ?FLOC___Sample_Ringbuffer?T512 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T512 end address is: 12 (R3)
L_Sample_Ringbuffer223:
; ?FLOC___Sample_Ringbuffer?T512 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T512 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,882 :: 		break;
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,883 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer224:
L_Sample_Ringbuffer225:
L_Sample_Ringbuffer226:
L_Sample_Ringbuffer227:
;Protocol.c,884 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer228:
L_Sample_Ringbuffer229:
;Protocol.c,885 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer230:
L_Sample_Ringbuffer231:
L_Sample_Ringbuffer232:
L_Sample_Ringbuffer233:
;Protocol.c,891 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,892 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,896 :: 		break;
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,897 :: 		case 'F': case 'f':
L_Sample_Ringbuffer234:
L_Sample_Ringbuffer235:
;Protocol.c,898 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,899 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,903 :: 		break;
J	L_Sample_Ringbuffer214
NOP	
;Protocol.c,904 :: 		}
L_Sample_Ringbuffer213:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer667
NOP	
J	L_Sample_Ringbuffer215
NOP	
L__Sample_Ringbuffer667:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer669
NOP	
J	L_Sample_Ringbuffer216
NOP	
L__Sample_Ringbuffer669:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer671
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer671:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer673
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer673:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer675
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer675:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer677
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer677:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer679
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer679:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer681:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer683
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer683:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer685
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer685:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer687
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer687:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer689
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer689:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer691
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer691:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer693
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer693:
L_Sample_Ringbuffer214:
;Protocol.c,905 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,910 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer695
NOP	
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer695:
;Protocol.c,911 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+256)
ORI	R26, R26, lo_addr(_gcode+256)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,912 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer237
NOP	
;Protocol.c,913 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer239:
L_Sample_Ringbuffer240:
;Protocol.c,914 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,915 :: 		case 'J':case 'j':
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer244:
;Protocol.c,916 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,917 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,921 :: 		break;
J	L_Sample_Ringbuffer238
NOP	
;Protocol.c,922 :: 		case 'F':case 'f':
L_Sample_Ringbuffer245:
L_Sample_Ringbuffer246:
;Protocol.c,923 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,924 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,928 :: 		break;
J	L_Sample_Ringbuffer238
NOP	
;Protocol.c,930 :: 		}
L_Sample_Ringbuffer237:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer697
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer697:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer699
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer699:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer701
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer701:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer703
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer703:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer705
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer705:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer707:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer709:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer711
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer711:
L_Sample_Ringbuffer238:
;Protocol.c,931 :: 		}
L_Sample_Ringbuffer236:
;Protocol.c,935 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer713
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer713:
;Protocol.c,936 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,937 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+320)
ORI	R26, R26, lo_addr(_gcode+320)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,938 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer248
NOP	
;Protocol.c,939 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer250:
L_Sample_Ringbuffer251:
;Protocol.c,940 :: 		case 'J':case 'j':
L_Sample_Ringbuffer252:
L_Sample_Ringbuffer253:
;Protocol.c,941 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,942 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,946 :: 		break;
J	L_Sample_Ringbuffer249
NOP	
;Protocol.c,947 :: 		case 'F':case 'f':
L_Sample_Ringbuffer254:
L_Sample_Ringbuffer255:
;Protocol.c,948 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,949 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,953 :: 		break;
J	L_Sample_Ringbuffer249
NOP	
;Protocol.c,954 :: 		}
L_Sample_Ringbuffer248:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer715
NOP	
J	L_Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer715:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer717
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer717:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer719
NOP	
J	L_Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer719:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer721
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer721:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer723
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer723:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer725
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer725:
L_Sample_Ringbuffer249:
;Protocol.c,955 :: 		}
L_Sample_Ringbuffer247:
;Protocol.c,958 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer727
NOP	
J	L_Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer727:
;Protocol.c,959 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+384)
ORI	R26, R26, lo_addr(_gcode+384)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,960 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,961 :: 		case 'J':case 'j':
L_Sample_Ringbuffer259:
L_Sample_Ringbuffer260:
;Protocol.c,962 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,963 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,967 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,968 :: 		case 'F':case 'f':
L_Sample_Ringbuffer261:
L_Sample_Ringbuffer262:
;Protocol.c,969 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,970 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,974 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,976 :: 		}
L_Sample_Ringbuffer257:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer729
NOP	
J	L_Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer729:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer731
NOP	
J	L_Sample_Ringbuffer260
NOP	
L__Sample_Ringbuffer731:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer733
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer733:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer735
NOP	
J	L_Sample_Ringbuffer262
NOP	
L__Sample_Ringbuffer735:
L_Sample_Ringbuffer258:
;Protocol.c,977 :: 		}
L_Sample_Ringbuffer256:
;Protocol.c,978 :: 		}
L_Sample_Ringbuffer144:
;Protocol.c,979 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L_Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer736:
; ?FLOC___Sample_Ringbuffer?T618 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T618 end address is: 8 (R2)
J	L_Sample_Ringbuffer264
NOP	
L_Sample_Ringbuffer263:
; ?FLOC___Sample_Ringbuffer?T618 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T618 end address is: 8 (R2)
L_Sample_Ringbuffer264:
; ?FLOC___Sample_Ringbuffer?T618 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T618 end address is: 8 (R2)
;Protocol.c,980 :: 		break;
J	L_Sample_Ringbuffer141
NOP	
;Protocol.c,981 :: 		case 'M':
L_Sample_Ringbuffer265:
;Protocol.c,982 :: 		case 'm':
L_Sample_Ringbuffer266:
;Protocol.c,984 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,985 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,986 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,992 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer738
NOP	
J	L_Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer738:
;Protocol.c,993 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer268
NOP	
;Protocol.c,994 :: 		case 'S':
L_Sample_Ringbuffer270:
;Protocol.c,995 :: 		case 's':
L_Sample_Ringbuffer271:
;Protocol.c,997 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,998 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,999 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1003 :: 		}
J	L_Sample_Ringbuffer269
NOP	
L_Sample_Ringbuffer268:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer740
NOP	
J	L_Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer740:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer742
NOP	
J	L_Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer742:
L_Sample_Ringbuffer269:
;Protocol.c,1004 :: 		}
L_Sample_Ringbuffer267:
;Protocol.c,1005 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1006 :: 		break;
J	L_Sample_Ringbuffer141
NOP	
;Protocol.c,1007 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer272:
L_Sample_Ringbuffer273:
L_Sample_Ringbuffer274:
L_Sample_Ringbuffer275:
;Protocol.c,1008 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer276:
L_Sample_Ringbuffer277:
L_Sample_Ringbuffer278:
L_Sample_Ringbuffer279:
;Protocol.c,1009 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer280:
L_Sample_Ringbuffer281:
L_Sample_Ringbuffer282:
L_Sample_Ringbuffer283:
;Protocol.c,1010 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer743
NOP	
J	L_Sample_Ringbuffer284
NOP	
L__Sample_Ringbuffer743:
;Protocol.c,1011 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,1012 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1013 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1017 :: 		}
L_Sample_Ringbuffer284:
;Protocol.c,1021 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer745
NOP	
J	L_Sample_Ringbuffer285
NOP	
L__Sample_Ringbuffer745:
;Protocol.c,1022 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,1023 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+64)
ORI	R26, R26, lo_addr(_gcode+64)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,1024 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer286
NOP	
;Protocol.c,1025 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer288:
L_Sample_Ringbuffer289:
;Protocol.c,1026 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer290:
L_Sample_Ringbuffer291:
;Protocol.c,1027 :: 		case 'A':case 'a':
L_Sample_Ringbuffer292:
L_Sample_Ringbuffer293:
;Protocol.c,1028 :: 		case 'I':case 'i':
L_Sample_Ringbuffer294:
L_Sample_Ringbuffer295:
;Protocol.c,1029 :: 		case 'J':case 'j':
L_Sample_Ringbuffer296:
L_Sample_Ringbuffer297:
;Protocol.c,1030 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1031 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1035 :: 		break;
J	L_Sample_Ringbuffer287
NOP	
;Protocol.c,1036 :: 		case 'F':
L_Sample_Ringbuffer298:
;Protocol.c,1037 :: 		case 'f':
L_Sample_Ringbuffer299:
;Protocol.c,1040 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1041 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1046 :: 		break;
J	L_Sample_Ringbuffer287
NOP	
;Protocol.c,1047 :: 		}
L_Sample_Ringbuffer286:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer747
NOP	
J	L_Sample_Ringbuffer288
NOP	
L__Sample_Ringbuffer747:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer749
NOP	
J	L_Sample_Ringbuffer289
NOP	
L__Sample_Ringbuffer749:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer751
NOP	
J	L_Sample_Ringbuffer290
NOP	
L__Sample_Ringbuffer751:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer753
NOP	
J	L_Sample_Ringbuffer291
NOP	
L__Sample_Ringbuffer753:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer755
NOP	
J	L_Sample_Ringbuffer292
NOP	
L__Sample_Ringbuffer755:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer757
NOP	
J	L_Sample_Ringbuffer293
NOP	
L__Sample_Ringbuffer757:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer759
NOP	
J	L_Sample_Ringbuffer294
NOP	
L__Sample_Ringbuffer759:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer761
NOP	
J	L_Sample_Ringbuffer295
NOP	
L__Sample_Ringbuffer761:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer763
NOP	
J	L_Sample_Ringbuffer296
NOP	
L__Sample_Ringbuffer763:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer765
NOP	
J	L_Sample_Ringbuffer297
NOP	
L__Sample_Ringbuffer765:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer767
NOP	
J	L_Sample_Ringbuffer298
NOP	
L__Sample_Ringbuffer767:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer769
NOP	
J	L_Sample_Ringbuffer299
NOP	
L__Sample_Ringbuffer769:
L_Sample_Ringbuffer287:
;Protocol.c,1048 :: 		}
L_Sample_Ringbuffer285:
;Protocol.c,1049 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1050 :: 		break;
J	L_Sample_Ringbuffer141
NOP	
;Protocol.c,1051 :: 		case 'F':
L_Sample_Ringbuffer300:
;Protocol.c,1053 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer770
NOP	
J	L_Sample_Ringbuffer301
NOP	
L__Sample_Ringbuffer770:
;Protocol.c,1054 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 98
SEH	R28, R2
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	Protocol_cpy_val_from_str+0
NOP	
;Protocol.c,1055 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1056 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1060 :: 		}
L_Sample_Ringbuffer301:
;Protocol.c,1061 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1062 :: 		break;
J	L_Sample_Ringbuffer141
NOP	
;Protocol.c,1063 :: 		}
L_Sample_Ringbuffer140:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer772
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer772:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer774
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer774:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer776
NOP	
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer776:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer778
NOP	
J	L_Sample_Ringbuffer266
NOP	
L__Sample_Ringbuffer778:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer780
NOP	
J	L_Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer780:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer782
NOP	
J	L_Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer782:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer784
NOP	
J	L_Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer784:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer786
NOP	
J	L_Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer786:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer788
NOP	
J	L_Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer788:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer790
NOP	
J	L_Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer790:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer792
NOP	
J	L_Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer792:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer794
NOP	
J	L_Sample_Ringbuffer279
NOP	
L__Sample_Ringbuffer794:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer796
NOP	
J	L_Sample_Ringbuffer280
NOP	
L__Sample_Ringbuffer796:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer798
NOP	
J	L_Sample_Ringbuffer281
NOP	
L__Sample_Ringbuffer798:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer800
NOP	
J	L_Sample_Ringbuffer282
NOP	
L__Sample_Ringbuffer800:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer802
NOP	
J	L_Sample_Ringbuffer283
NOP	
L__Sample_Ringbuffer802:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer804
NOP	
J	L_Sample_Ringbuffer300
NOP	
L__Sample_Ringbuffer804:
L_Sample_Ringbuffer141:
;Protocol.c,693 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer380:
L__Sample_Ringbuffer379:
;Protocol.c,1064 :: 		}
L_Sample_Ringbuffer136:
;Protocol.c,1065 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,1071 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer805
NOP	
J	L_Sample_Ringbuffer302
NOP	
L__Sample_Ringbuffer805:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer303
NOP	
L_Sample_Ringbuffer302:
;Protocol.c,1072 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer806
NOP	
J	L_Sample_Ringbuffer304
NOP	
L__Sample_Ringbuffer806:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer305
NOP	
L_Sample_Ringbuffer304:
;Protocol.c,1073 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer807
NOP	
J	L_Sample_Ringbuffer306
NOP	
L__Sample_Ringbuffer807:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer307
NOP	
L_Sample_Ringbuffer306:
;Protocol.c,1074 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer808
NOP	
J	L_Sample_Ringbuffer308
NOP	
L__Sample_Ringbuffer808:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer309
NOP	
L_Sample_Ringbuffer308:
;Protocol.c,1075 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer809
NOP	
J	L_Sample_Ringbuffer310
NOP	
L__Sample_Ringbuffer809:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer311
NOP	
L_Sample_Ringbuffer310:
;Protocol.c,1076 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer810
NOP	
J	L_Sample_Ringbuffer312
NOP	
L__Sample_Ringbuffer810:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer313
NOP	
L_Sample_Ringbuffer312:
;Protocol.c,1077 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer811
NOP	
J	L_Sample_Ringbuffer314
NOP	
L__Sample_Ringbuffer811:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer315
NOP	
L_Sample_Ringbuffer314:
;Protocol.c,1078 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer812
NOP	
J	L_Sample_Ringbuffer316
NOP	
L__Sample_Ringbuffer812:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer317
NOP	
L_Sample_Ringbuffer316:
;Protocol.c,1079 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer813
NOP	
J	L_Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer813:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer318:
;Protocol.c,1080 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer814
NOP	
J	L_Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer814:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer320:
L_Sample_Ringbuffer317:
L_Sample_Ringbuffer315:
L_Sample_Ringbuffer313:
L_Sample_Ringbuffer311:
L_Sample_Ringbuffer309:
L_Sample_Ringbuffer307:
L_Sample_Ringbuffer305:
L_Sample_Ringbuffer303:
;Protocol.c,1083 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,1084 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,1087 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,1088 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,1091 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer815
NOP	
J	L_Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer815:
; ?FLOC___Sample_Ringbuffer?T731 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T731 end address is: 8 (R2)
J	L_Sample_Ringbuffer322
NOP	
L_Sample_Ringbuffer321:
; ?FLOC___Sample_Ringbuffer?T731 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T731 end address is: 8 (R2)
L_Sample_Ringbuffer322:
; ?FLOC___Sample_Ringbuffer?T731 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T731 end address is: 8 (R2)
;Protocol.c,1093 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,1095 :: 		}
L_Sample_Ringbuffer66:
;Protocol.c,1098 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,1099 :: 		}
;Protocol.c,1098 :: 		return status;
;Protocol.c,1099 :: 		}
L_end_Sample_Ringbuffer:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 128
JR	RA
NOP	
; end of _Sample_Ringbuffer
