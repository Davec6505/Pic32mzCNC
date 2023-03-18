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
BNE	R2, R0, L__Str_Initialize388
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize388:
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
BNE	R2, R0, L_Protocol_strsplit391
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit391:
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
BNE	R3, R2, L_Protocol_strsplit393
NOP	
J	L_Protocol_strsplit328
NOP	
L_Protocol_strsplit393:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit395
NOP	
J	L_Protocol_strsplit327
NOP	
L_Protocol_strsplit395:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit396
NOP	
J	L_Protocol_strsplit326
NOP	
L_Protocol_strsplit396:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit328:
L_Protocol_strsplit327:
L_Protocol_strsplit326:
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
BEQ	R2, R0, L_Protocol_strsplit397
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit397:
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
BNE	R2, R0, L_Protocol_strsplit2399
NOP	
J	L_Protocol_strsplit2343
NOP	
L_Protocol_strsplit2399:
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
BNE	R3, R2, L_Protocol_strsplit2401
NOP	
J	L_Protocol_strsplit2334
NOP	
L_Protocol_strsplit2401:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2403
NOP	
J	L_Protocol_strsplit2333
NOP	
L_Protocol_strsplit2403:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2404
NOP	
J	L_Protocol_strsplit2332
NOP	
L_Protocol_strsplit2404:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2334:
L_Protocol_strsplit2333:
L_Protocol_strsplit2332:
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
BEQ	R2, R0, L_Protocol_strsplit2405
NOP	
J	L_Protocol_strsplit2341
NOP	
L_Protocol_strsplit2405:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2407
NOP	
J	L_Protocol_strsplit2342
NOP	
L_Protocol_strsplit2407:
L_Protocol_strsplit2330:
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2408
NOP	
J	L_Protocol_strsplit2339
NOP	
L_Protocol_strsplit2408:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2409
NOP	
J	L_Protocol_strsplit2340
NOP	
L_Protocol_strsplit2409:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2329:
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
J	L_Protocol_strsplit2336
NOP	
L_Protocol_strsplit2339:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2336:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2335
NOP	
L_Protocol_strsplit2340:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2335:
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
J	L_Protocol_strsplit2338
NOP	
L_Protocol_strsplit2341:
L_Protocol_strsplit2338:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2337
NOP	
L_Protocol_strsplit2342:
L_Protocol_strsplit2337:
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
BEQ	R2, R0, L_Protocol_strsplit2410
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2410:
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
L_Protocol_strsplit2343:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str413
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str413:
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
BNE	R2, R0, L_Protocol_str2int415
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int415:
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
BNE	R2, R0, L_Protocol_str2int417
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int417:
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
BNE	R2, R0, L__protocol_execute_runtime420
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime420:
;Protocol.c,206 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime422
NOP	
J	L__protocol_execute_runtime345
NOP	
L__protocol_execute_runtime422:
;Protocol.c,212 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,215 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime424
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime424:
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
L__protocol_execute_runtime344:
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
BNE	R2, R0, L__protocol_execute_runtime426
NOP	
J	L__protocol_execute_runtime344
NOP	
L__protocol_execute_runtime426:
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
L__protocol_execute_runtime345:
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,233 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,236 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime428
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime428:
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
BNE	R2, R0, L__protocol_execute_runtime430
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime430:
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
BNE	R2, R0, L__protocol_execute_runtime432
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime432:
;Protocol.c,250 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,251 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,255 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime434
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime434:
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
BNE	R2, R0, L__protocol_execute_runtime436
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime436:
;Protocol.c,262 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime438
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime438:
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
BNE	R2, R0, L__protocol_system_check441
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check441:
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
BNE	R2, R0, L__protocol_system_check443
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check443:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,307 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check444
NOP	
J	L__protocol_system_check348
NOP	
L__protocol_system_check444:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check446
NOP	
J	L__protocol_system_check347
NOP	
L__protocol_system_check446:
L__protocol_system_check346:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check348:
L__protocol_system_check347:
;Protocol.c,311 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check447
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check447:
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
ADDIU	SP, SP, -104
SW	RA, 0(SP)
;Protocol.c,331 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
SH	R2, 76(SP)
;Protocol.c,332 :: 		if(dif > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Gocde_Line449
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line449:
;Protocol.c,335 :: 		Str_clear(str,64);
ADDIU	R2, SP, 12
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,337 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 12
LH	R26, 76(SP)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,340 :: 		while(DMA_IsOn(1));
L_Sample_Gocde_Line53:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line451
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line451:
J	L_Sample_Gocde_Line53
NOP	
L_Sample_Gocde_Line54:
;Protocol.c,341 :: 		dma_printf("dif:=%d\n%s\nstr_len:=%d\n",dif,str,str_len);
ADDIU	R4, SP, 12
ADDIU	R23, SP, 78
ADDIU	R22, R23, 24
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 78
LH	R2, Offset(Sample_Gocde_Line_str_len_L0+0)(GP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
SW	R4, 8(SP)
LH	R2, 92(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;Protocol.c,345 :: 		if(bit_isfalse(startup,bit(START_MSG)))
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line452
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line452:
;Protocol.c,346 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 12
LH	R26, 76(SP)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
L_Sample_Gocde_Line55:
;Protocol.c,360 :: 		}
L_Sample_Gocde_Line52:
;Protocol.c,361 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,363 :: 		}
;Protocol.c,361 :: 		return STATUS_OK;
;Protocol.c,363 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 104
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,367 :: 		static void Do_Startup_Msg(char *str,int _dif_){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,370 :: 		for(i = 0;i <= _dif_;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_Do_Startup_Msg56:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R26
SLT	R2, R2, R3
BEQ	R2, R0, L_Protocol_Do_Startup_Msg454
NOP	
J	L_Protocol_Do_Startup_Msg57
NOP	
L_Protocol_Do_Startup_Msg454:
;Protocol.c,371 :: 		if(str[i] == '?'){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg455
NOP	
J	L_Protocol_Do_Startup_Msg59
NOP	
L_Protocol_Do_Startup_Msg455:
;Protocol.c,372 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,373 :: 		report_init_message();
SH	R4, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
JAL	_report_init_message+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R4, 4(SP)
;Protocol.c,374 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,375 :: 		}
L_Protocol_Do_Startup_Msg59:
;Protocol.c,370 :: 		for(i = 0;i <= _dif_;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,376 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_Do_Startup_Msg56
NOP	
L_Protocol_Do_Startup_Msg57:
;Protocol.c,377 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
_Sample_Ringbuffer:
;Protocol.c,385 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,395 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,396 :: 		int axis_to_run = 0;
;Protocol.c,403 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,406 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer458
NOP	
J	L__Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer458:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer459
NOP	
J	L__Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer459:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer358:
;Protocol.c,407 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,408 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,409 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,410 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,406 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer360:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer359:
;Protocol.c,413 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer460
NOP	
J	L_Sample_Ringbuffer63
NOP	
L__Sample_Ringbuffer460:
; dif end address is: 20 (R5)
;Protocol.c,415 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer462
NOP	
J	L_Sample_Ringbuffer64
NOP	
L__Sample_Ringbuffer462:
;Protocol.c,416 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,417 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer463
NOP	
J	L_Sample_Ringbuffer65
NOP	
L__Sample_Ringbuffer463:
;Protocol.c,422 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,423 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer464
NOP	
J	L_Sample_Ringbuffer66
NOP	
L__Sample_Ringbuffer464:
;Protocol.c,424 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer66:
;Protocol.c,425 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,426 :: 		}
L_Sample_Ringbuffer65:
;Protocol.c,427 :: 		}
L_Sample_Ringbuffer64:
;Protocol.c,428 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,429 :: 		}else if(dif > 0){
L_Sample_Ringbuffer63:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer465
NOP	
J	L_Sample_Ringbuffer68
NOP	
L__Sample_Ringbuffer465:
;Protocol.c,430 :: 		int modal_response = 0;
;Protocol.c,431 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,433 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,434 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,435 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,440 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,442 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,464 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer466
NOP	
J	L_Sample_Ringbuffer69
NOP	
L__Sample_Ringbuffer466:
;Protocol.c,469 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,470 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,471 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,472 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,473 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,474 :: 		}
L_Sample_Ringbuffer69:
;Protocol.c,483 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,486 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer467
NOP	
J	L_Sample_Ringbuffer70
NOP	
L__Sample_Ringbuffer467:
;Protocol.c,487 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,488 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer468
NOP	
J	L_Sample_Ringbuffer71
NOP	
L__Sample_Ringbuffer468:
;Protocol.c,489 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer71:
;Protocol.c,490 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,491 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer70:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer469
NOP	
J	L_Sample_Ringbuffer73
NOP	
L__Sample_Ringbuffer469:
;Protocol.c,493 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer470
NOP	
J	L_Sample_Ringbuffer74
NOP	
L__Sample_Ringbuffer470:
;Protocol.c,494 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,495 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,496 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,497 :: 		}
L_Sample_Ringbuffer74:
;Protocol.c,498 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer75
NOP	
;Protocol.c,499 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer77:
;Protocol.c,500 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,501 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,502 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,503 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer78:
;Protocol.c,504 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,505 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,506 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,507 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer79:
;Protocol.c,508 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,509 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,510 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,511 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer80:
;Protocol.c,512 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,513 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,516 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer471
NOP	
J	L_Sample_Ringbuffer81
NOP	
L__Sample_Ringbuffer471:
;Protocol.c,517 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer81:
;Protocol.c,518 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,519 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,520 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer82:
;Protocol.c,521 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,525 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer472
NOP	
J	L_Sample_Ringbuffer83
NOP	
L__Sample_Ringbuffer472:
;Protocol.c,526 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,527 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,528 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,529 :: 		} else {
L_Sample_Ringbuffer83:
;Protocol.c,531 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer474
NOP	
J	L_Sample_Ringbuffer85
NOP	
L__Sample_Ringbuffer474:
;Protocol.c,532 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,533 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,534 :: 		}
L_Sample_Ringbuffer85:
;Protocol.c,536 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,537 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,539 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,540 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,542 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer86:
;Protocol.c,543 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,544 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer475
NOP	
J	L_Sample_Ringbuffer87
NOP	
L__Sample_Ringbuffer475:
;Protocol.c,545 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,546 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,548 :: 		}
L_Sample_Ringbuffer87:
;Protocol.c,549 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,550 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,551 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer88:
;Protocol.c,552 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,554 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer477
NOP	
J	L_Sample_Ringbuffer89
NOP	
L__Sample_Ringbuffer477:
;Protocol.c,555 :: 		int axis_to_home = 0;
;Protocol.c,558 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer479
NOP	
J	L__Sample_Ringbuffer362
NOP	
L__Sample_Ringbuffer479:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer481
NOP	
J	L__Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer481:
J	L_Sample_Ringbuffer92
NOP	
L__Sample_Ringbuffer362:
L__Sample_Ringbuffer361:
;Protocol.c,559 :: 		int i = 0;
;Protocol.c,560 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,563 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,564 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer93:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer482
NOP	
J	L_Sample_Ringbuffer94
NOP	
L__Sample_Ringbuffer482:
;Protocol.c,565 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,564 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,565 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer93
NOP	
L_Sample_Ringbuffer94:
;Protocol.c,568 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer484
NOP	
J	L_Sample_Ringbuffer96
NOP	
L__Sample_Ringbuffer484:
;Protocol.c,569 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,570 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,571 :: 		}
L_Sample_Ringbuffer96:
;Protocol.c,572 :: 		} else {
J	L_Sample_Ringbuffer97
NOP	
L_Sample_Ringbuffer92:
;Protocol.c,573 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,574 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,575 :: 		}
L_Sample_Ringbuffer97:
;Protocol.c,576 :: 		} else {
J	L_Sample_Ringbuffer98
NOP	
L_Sample_Ringbuffer89:
;Protocol.c,577 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,578 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,579 :: 		}
L_Sample_Ringbuffer98:
;Protocol.c,582 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,583 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,584 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,585 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer99:
;Protocol.c,586 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,587 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer485
NOP	
J	L_Sample_Ringbuffer100
NOP	
L__Sample_Ringbuffer485:
;Protocol.c,588 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer101:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer486
NOP	
J	L_Sample_Ringbuffer102
NOP	
L__Sample_Ringbuffer486:
;Protocol.c,589 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer488
NOP	
J	L_Sample_Ringbuffer104
NOP	
L__Sample_Ringbuffer488:
;Protocol.c,591 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,592 :: 		} else {
J	L_Sample_Ringbuffer105
NOP	
L_Sample_Ringbuffer104:
;Protocol.c,593 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,594 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,595 :: 		}
L_Sample_Ringbuffer105:
;Protocol.c,588 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,600 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer101
NOP	
L_Sample_Ringbuffer102:
;Protocol.c,601 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,602 :: 		}else { // Store startup line
L_Sample_Ringbuffer100:
;Protocol.c,603 :: 		int N_Val = 0;
;Protocol.c,604 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,609 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer489
NOP	
J	L__Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer489:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer490
NOP	
J	L__Sample_Ringbuffer363
NOP	
L__Sample_Ringbuffer490:
L__Sample_Ringbuffer356:
;Protocol.c,610 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,612 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,613 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,620 :: 		}else {
J	L_Sample_Ringbuffer110
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,609 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer364:
L__Sample_Ringbuffer363:
;Protocol.c,621 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,622 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,623 :: 		}
L_Sample_Ringbuffer110:
;Protocol.c,626 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer492
NOP	
J	L_Sample_Ringbuffer111
NOP	
L__Sample_Ringbuffer492:
; helper_var end address is: 28 (R7)
;Protocol.c,627 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer494
NOP	
J	L_Sample_Ringbuffer112
NOP	
L__Sample_Ringbuffer494:
; N_Val end address is: 16 (R4)
;Protocol.c,630 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,631 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,639 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,644 :: 		}else{
J	L_Sample_Ringbuffer113
NOP	
L_Sample_Ringbuffer112:
;Protocol.c,645 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,653 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,654 :: 		}
L_Sample_Ringbuffer113:
;Protocol.c,656 :: 		}
L_Sample_Ringbuffer111:
;Protocol.c,658 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,659 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,660 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer114:
;Protocol.c,661 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,662 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,663 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,664 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer115:
;Protocol.c,665 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,666 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,668 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer116:
;Protocol.c,669 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,670 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,671 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,672 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer117:
L_Sample_Ringbuffer118:
L_Sample_Ringbuffer119:
L_Sample_Ringbuffer120:
L_Sample_Ringbuffer121:
L_Sample_Ringbuffer122:
;Protocol.c,673 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer123:
L_Sample_Ringbuffer124:
L_Sample_Ringbuffer125:
L_Sample_Ringbuffer126:
;Protocol.c,677 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer496
NOP	
J	L__Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer496:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer498
NOP	
J	L__Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer498:
J	L_Sample_Ringbuffer129
NOP	
L__Sample_Ringbuffer366:
L__Sample_Ringbuffer365:
;Protocol.c,678 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,679 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,680 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,681 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer499
NOP	
J	L_Sample_Ringbuffer130
NOP	
L__Sample_Ringbuffer499:
;Protocol.c,683 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,684 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer501
NOP	
J	L__Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer501:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer131
NOP	
L__Sample_Ringbuffer383:
L_Sample_Ringbuffer131:
;Protocol.c,685 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,686 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer132
NOP	
L_Sample_Ringbuffer130:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer502
NOP	
J	L__Sample_Ringbuffer385
NOP	
L__Sample_Ringbuffer502:
;Protocol.c,688 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,689 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer504
NOP	
J	L__Sample_Ringbuffer384
NOP	
L__Sample_Ringbuffer504:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer134
NOP	
L__Sample_Ringbuffer384:
SEH	R5, R6
L_Sample_Ringbuffer134:
;Protocol.c,690 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,691 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,692 :: 		}
J	L_Sample_Ringbuffer133
NOP	
L__Sample_Ringbuffer385:
;Protocol.c,686 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,692 :: 		}
L_Sample_Ringbuffer133:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer132:
;Protocol.c,695 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer505
NOP	
J	L__Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer505:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer507
NOP	
J	L__Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer507:
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer368:
L__Sample_Ringbuffer367:
;Protocol.c,696 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,697 :: 		}
L_Sample_Ringbuffer137:
;Protocol.c,698 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,703 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,706 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,707 :: 		}
L_Sample_Ringbuffer129:
;Protocol.c,708 :: 		break;
J	L_Sample_Ringbuffer76
NOP	
;Protocol.c,709 :: 		}
L_Sample_Ringbuffer75:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer509
NOP	
J	L_Sample_Ringbuffer77
NOP	
L__Sample_Ringbuffer509:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer511
NOP	
J	L_Sample_Ringbuffer78
NOP	
L__Sample_Ringbuffer511:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer513
NOP	
J	L_Sample_Ringbuffer79
NOP	
L__Sample_Ringbuffer513:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer515
NOP	
J	L_Sample_Ringbuffer80
NOP	
L__Sample_Ringbuffer515:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer517
NOP	
J	L_Sample_Ringbuffer82
NOP	
L__Sample_Ringbuffer517:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer519
NOP	
J	L_Sample_Ringbuffer86
NOP	
L__Sample_Ringbuffer519:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer521
NOP	
J	L_Sample_Ringbuffer88
NOP	
L__Sample_Ringbuffer521:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer523
NOP	
J	L_Sample_Ringbuffer99
NOP	
L__Sample_Ringbuffer523:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer525
NOP	
J	L_Sample_Ringbuffer114
NOP	
L__Sample_Ringbuffer525:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer527
NOP	
J	L_Sample_Ringbuffer115
NOP	
L__Sample_Ringbuffer527:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer529
NOP	
J	L_Sample_Ringbuffer116
NOP	
L__Sample_Ringbuffer529:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer531
NOP	
J	L_Sample_Ringbuffer117
NOP	
L__Sample_Ringbuffer531:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer533
NOP	
J	L_Sample_Ringbuffer118
NOP	
L__Sample_Ringbuffer533:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer535
NOP	
J	L_Sample_Ringbuffer119
NOP	
L__Sample_Ringbuffer535:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer537
NOP	
J	L_Sample_Ringbuffer120
NOP	
L__Sample_Ringbuffer537:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer539
NOP	
J	L_Sample_Ringbuffer121
NOP	
L__Sample_Ringbuffer539:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer541
NOP	
J	L_Sample_Ringbuffer122
NOP	
L__Sample_Ringbuffer541:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer543
NOP	
J	L_Sample_Ringbuffer123
NOP	
L__Sample_Ringbuffer543:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer545
NOP	
J	L_Sample_Ringbuffer124
NOP	
L__Sample_Ringbuffer545:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer547
NOP	
J	L_Sample_Ringbuffer125
NOP	
L__Sample_Ringbuffer547:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer549
NOP	
J	L_Sample_Ringbuffer126
NOP	
L__Sample_Ringbuffer549:
L_Sample_Ringbuffer76:
;Protocol.c,711 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer138
NOP	
L_Sample_Ringbuffer73:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer550
NOP	
J	L__Sample_Ringbuffer382
NOP	
L__Sample_Ringbuffer550:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer551
NOP	
J	L__Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer551:
L__Sample_Ringbuffer353:
;Protocol.c,712 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,713 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer142
NOP	
;Protocol.c,714 :: 		case 'G':case 'g':
L_Sample_Ringbuffer144:
L_Sample_Ringbuffer145:
;Protocol.c,716 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer552
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer552:
;Protocol.c,717 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,718 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer553
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer553:
;Protocol.c,719 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,722 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer555
NOP	
J	L__Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer555:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer557
NOP	
J	L__Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer557:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer559
NOP	
J	L__Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer559:
SEH	R2, R4
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer371:
L__Sample_Ringbuffer370:
L__Sample_Ringbuffer369:
;Protocol.c,723 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer150:
;Protocol.c,724 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer151
NOP	
L_Sample_Ringbuffer147:
;Protocol.c,726 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,727 :: 		}
L_Sample_Ringbuffer151:
;Protocol.c,729 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,731 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer560
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer560:
; ?FLOC___Sample_Ringbuffer?T362 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T362 end address is: 12 (R3)
J	L_Sample_Ringbuffer153
NOP	
L_Sample_Ringbuffer152:
; ?FLOC___Sample_Ringbuffer?T362 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T362 end address is: 12 (R3)
L_Sample_Ringbuffer153:
; ?FLOC___Sample_Ringbuffer?T362 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T362 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,741 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer562
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer562:
;Protocol.c,742 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,744 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer155
NOP	
;Protocol.c,745 :: 		case 'G':case 'g':
L_Sample_Ringbuffer157:
L_Sample_Ringbuffer158:
;Protocol.c,746 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer563
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer563:
;Protocol.c,747 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,750 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer565
NOP	
J	L__Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer565:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer567
NOP	
J	L__Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer567:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer569
NOP	
J	L__Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer569:
SEH	R2, R4
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer374:
L__Sample_Ringbuffer373:
L__Sample_Ringbuffer372:
;Protocol.c,751 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer162:
;Protocol.c,752 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer163
NOP	
L_Sample_Ringbuffer159:
;Protocol.c,754 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,755 :: 		}
L_Sample_Ringbuffer163:
;Protocol.c,757 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,759 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer570
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer570:
; ?FLOC___Sample_Ringbuffer?T385 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T385 end address is: 12 (R3)
J	L_Sample_Ringbuffer165
NOP	
L_Sample_Ringbuffer164:
; ?FLOC___Sample_Ringbuffer?T385 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T385 end address is: 12 (R3)
L_Sample_Ringbuffer165:
; ?FLOC___Sample_Ringbuffer?T385 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T385 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,765 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,766 :: 		case 'X':case 'x':
L_Sample_Ringbuffer166:
L_Sample_Ringbuffer167:
;Protocol.c,767 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer168:
L_Sample_Ringbuffer169:
;Protocol.c,768 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer170:
L_Sample_Ringbuffer171:
;Protocol.c,769 :: 		case 'A':case 'a':
L_Sample_Ringbuffer172:
L_Sample_Ringbuffer173:
;Protocol.c,771 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,772 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,776 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,777 :: 		case 'L':case 'l':
L_Sample_Ringbuffer174:
L_Sample_Ringbuffer175:
;Protocol.c,778 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,779 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,783 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,784 :: 		case 'F':case 'f':
L_Sample_Ringbuffer176:
L_Sample_Ringbuffer177:
;Protocol.c,785 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,786 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,790 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,791 :: 		case 'P':case 'p':
L_Sample_Ringbuffer178:
L_Sample_Ringbuffer179:
;Protocol.c,792 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,793 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,797 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,798 :: 		case 'S':case 's':
L_Sample_Ringbuffer180:
L_Sample_Ringbuffer181:
;Protocol.c,799 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,800 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,804 :: 		break;
J	L_Sample_Ringbuffer156
NOP	
;Protocol.c,805 :: 		}
L_Sample_Ringbuffer155:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer572
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer572:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer574
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer574:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer576
NOP	
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer576:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer578
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer578:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer580
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer580:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer582
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer582:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer584
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer584:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer586
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer586:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer588
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer588:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer590
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer590:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer592
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer592:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer594
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer594:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer596
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer596:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer598
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer598:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer600
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer600:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer602
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer602:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer604
NOP	
J	L_Sample_Ringbuffer180
NOP	
L__Sample_Ringbuffer604:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer606
NOP	
J	L_Sample_Ringbuffer181
NOP	
L__Sample_Ringbuffer606:
L_Sample_Ringbuffer156:
;Protocol.c,806 :: 		}
L_Sample_Ringbuffer154:
;Protocol.c,811 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer608
NOP	
J	L_Sample_Ringbuffer182
NOP	
L__Sample_Ringbuffer608:
;Protocol.c,812 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,813 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer183
NOP	
;Protocol.c,814 :: 		case 'G':case 'g':
L_Sample_Ringbuffer185:
L_Sample_Ringbuffer186:
;Protocol.c,815 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer609
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer609:
;Protocol.c,816 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,819 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer611
NOP	
J	L__Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer611:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer613
NOP	
J	L__Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer613:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer615
NOP	
J	L__Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer615:
SEH	R2, R4
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer377:
L__Sample_Ringbuffer376:
L__Sample_Ringbuffer375:
;Protocol.c,820 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer190:
;Protocol.c,821 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer191
NOP	
L_Sample_Ringbuffer187:
;Protocol.c,823 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,824 :: 		}
L_Sample_Ringbuffer191:
;Protocol.c,826 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,828 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer616
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer616:
; ?FLOC___Sample_Ringbuffer?T447 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T447 end address is: 12 (R3)
J	L_Sample_Ringbuffer193
NOP	
L_Sample_Ringbuffer192:
; ?FLOC___Sample_Ringbuffer?T447 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T447 end address is: 12 (R3)
L_Sample_Ringbuffer193:
; ?FLOC___Sample_Ringbuffer?T447 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T447 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,832 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,833 :: 		case 'X':case 'x':
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,834 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
;Protocol.c,835 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,836 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,837 :: 		case 'I':case 'i':
L_Sample_Ringbuffer202:
L_Sample_Ringbuffer203:
;Protocol.c,838 :: 		case 'J':case 'j':
L_Sample_Ringbuffer204:
L_Sample_Ringbuffer205:
;Protocol.c,840 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,841 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,845 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,846 :: 		case 'L':case 'l':
L_Sample_Ringbuffer206:
L_Sample_Ringbuffer207:
;Protocol.c,847 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,848 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,852 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,853 :: 		case 'F':case 'f':
L_Sample_Ringbuffer208:
L_Sample_Ringbuffer209:
;Protocol.c,854 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,855 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,859 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,860 :: 		case 'P':case 'p':
L_Sample_Ringbuffer210:
L_Sample_Ringbuffer211:
;Protocol.c,861 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,862 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,866 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,867 :: 		case 'S':case 's':
L_Sample_Ringbuffer212:
L_Sample_Ringbuffer213:
;Protocol.c,868 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,869 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,873 :: 		break;
J	L_Sample_Ringbuffer184
NOP	
;Protocol.c,874 :: 		}
L_Sample_Ringbuffer183:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer618
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer618:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer620
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer620:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer622
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer622:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer624
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer624:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer626
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer626:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer628
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer628:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer630
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer630:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer632
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer632:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer634
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer634:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer636
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer636:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer638
NOP	
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer638:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer640
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer640:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer642:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer644:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer646:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer648:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer650:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer652:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer654:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer656:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer658
NOP	
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer658:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L_Sample_Ringbuffer213
NOP	
L__Sample_Ringbuffer660:
L_Sample_Ringbuffer184:
;Protocol.c,875 :: 		}
L_Sample_Ringbuffer182:
;Protocol.c,879 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer662
NOP	
J	L_Sample_Ringbuffer214
NOP	
L__Sample_Ringbuffer662:
;Protocol.c,880 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,881 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer215
NOP	
;Protocol.c,882 :: 		case 'G':case 'g':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
;Protocol.c,883 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer663
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer663:
;Protocol.c,884 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,887 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer665
NOP	
J	L__Sample_Ringbuffer380
NOP	
L__Sample_Ringbuffer665:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer667
NOP	
J	L__Sample_Ringbuffer379
NOP	
L__Sample_Ringbuffer667:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer669
NOP	
J	L__Sample_Ringbuffer378
NOP	
L__Sample_Ringbuffer669:
SEH	R2, R4
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer380:
L__Sample_Ringbuffer379:
L__Sample_Ringbuffer378:
;Protocol.c,888 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer222:
;Protocol.c,889 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer223
NOP	
L_Sample_Ringbuffer219:
;Protocol.c,891 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,892 :: 		}
L_Sample_Ringbuffer223:
;Protocol.c,894 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,896 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer670:
; ?FLOC___Sample_Ringbuffer?T514 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T514 end address is: 12 (R3)
J	L_Sample_Ringbuffer225
NOP	
L_Sample_Ringbuffer224:
; ?FLOC___Sample_Ringbuffer?T514 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T514 end address is: 12 (R3)
L_Sample_Ringbuffer225:
; ?FLOC___Sample_Ringbuffer?T514 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T514 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,900 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,901 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer226:
L_Sample_Ringbuffer227:
L_Sample_Ringbuffer228:
L_Sample_Ringbuffer229:
;Protocol.c,902 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer230:
L_Sample_Ringbuffer231:
;Protocol.c,903 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer232:
L_Sample_Ringbuffer233:
L_Sample_Ringbuffer234:
L_Sample_Ringbuffer235:
;Protocol.c,909 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,910 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,914 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,915 :: 		case 'F': case 'f':
L_Sample_Ringbuffer236:
L_Sample_Ringbuffer237:
;Protocol.c,916 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,917 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,921 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,922 :: 		}
L_Sample_Ringbuffer215:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer672:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer674:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer676:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer678:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer680
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer680:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer682:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer684
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer684:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer686
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer686:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer688:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer690:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer692:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer694:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer696
NOP	
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer696:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer698
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer698:
L_Sample_Ringbuffer216:
;Protocol.c,923 :: 		}
L_Sample_Ringbuffer214:
;Protocol.c,928 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer700:
;Protocol.c,929 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,930 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer239
NOP	
;Protocol.c,931 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,932 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer244:
;Protocol.c,933 :: 		case 'J':case 'j':
L_Sample_Ringbuffer245:
L_Sample_Ringbuffer246:
;Protocol.c,934 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,935 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,939 :: 		break;
J	L_Sample_Ringbuffer240
NOP	
;Protocol.c,940 :: 		case 'F':case 'f':
L_Sample_Ringbuffer247:
L_Sample_Ringbuffer248:
;Protocol.c,941 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,942 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,946 :: 		break;
J	L_Sample_Ringbuffer240
NOP	
;Protocol.c,948 :: 		}
L_Sample_Ringbuffer239:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer702
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer702:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer704
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer704:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer706
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer706:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer708
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer708:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer710
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer710:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer712
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer712:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer714
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer714:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer716
NOP	
J	L_Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer716:
L_Sample_Ringbuffer240:
;Protocol.c,949 :: 		}
L_Sample_Ringbuffer238:
;Protocol.c,953 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer718
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer718:
;Protocol.c,954 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,955 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,956 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer250
NOP	
;Protocol.c,957 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer252:
L_Sample_Ringbuffer253:
;Protocol.c,958 :: 		case 'J':case 'j':
L_Sample_Ringbuffer254:
L_Sample_Ringbuffer255:
;Protocol.c,959 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,960 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,964 :: 		break;
J	L_Sample_Ringbuffer251
NOP	
;Protocol.c,965 :: 		case 'F':case 'f':
L_Sample_Ringbuffer256:
L_Sample_Ringbuffer257:
;Protocol.c,966 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,967 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,971 :: 		break;
J	L_Sample_Ringbuffer251
NOP	
;Protocol.c,972 :: 		}
L_Sample_Ringbuffer250:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer720
NOP	
J	L_Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer720:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer722
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer722:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer724
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer724:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer726
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer726:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer728
NOP	
J	L_Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer728:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer730
NOP	
J	L_Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer730:
L_Sample_Ringbuffer251:
;Protocol.c,973 :: 		}
L_Sample_Ringbuffer249:
;Protocol.c,976 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer258
NOP	
L__Sample_Ringbuffer732:
;Protocol.c,977 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,978 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,979 :: 		case 'J':case 'j':
L_Sample_Ringbuffer261:
L_Sample_Ringbuffer262:
;Protocol.c,980 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,981 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,985 :: 		break;
J	L_Sample_Ringbuffer260
NOP	
;Protocol.c,986 :: 		case 'F':case 'f':
L_Sample_Ringbuffer263:
L_Sample_Ringbuffer264:
;Protocol.c,987 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,988 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,992 :: 		break;
J	L_Sample_Ringbuffer260
NOP	
;Protocol.c,994 :: 		}
L_Sample_Ringbuffer259:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer734:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L_Sample_Ringbuffer262
NOP	
L__Sample_Ringbuffer736:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer738
NOP	
J	L_Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer738:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer740
NOP	
J	L_Sample_Ringbuffer264
NOP	
L__Sample_Ringbuffer740:
L_Sample_Ringbuffer260:
;Protocol.c,995 :: 		}
L_Sample_Ringbuffer258:
;Protocol.c,996 :: 		}
L_Sample_Ringbuffer146:
;Protocol.c,997 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer741
NOP	
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer741:
; ?FLOC___Sample_Ringbuffer?T620 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T620 end address is: 8 (R2)
J	L_Sample_Ringbuffer266
NOP	
L_Sample_Ringbuffer265:
; ?FLOC___Sample_Ringbuffer?T620 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T620 end address is: 8 (R2)
L_Sample_Ringbuffer266:
; ?FLOC___Sample_Ringbuffer?T620 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T620 end address is: 8 (R2)
;Protocol.c,998 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,999 :: 		case 'M':
L_Sample_Ringbuffer267:
;Protocol.c,1000 :: 		case 'm':
L_Sample_Ringbuffer268:
;Protocol.c,1002 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1003 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,1004 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,1010 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer743
NOP	
J	L_Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer743:
;Protocol.c,1011 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer270
NOP	
;Protocol.c,1012 :: 		case 'S':
L_Sample_Ringbuffer272:
;Protocol.c,1013 :: 		case 's':
L_Sample_Ringbuffer273:
;Protocol.c,1015 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1016 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,1017 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1021 :: 		}
J	L_Sample_Ringbuffer271
NOP	
L_Sample_Ringbuffer270:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer745
NOP	
J	L_Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer745:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer747
NOP	
J	L_Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer747:
L_Sample_Ringbuffer271:
;Protocol.c,1022 :: 		}
L_Sample_Ringbuffer269:
;Protocol.c,1023 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1024 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,1025 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer274:
L_Sample_Ringbuffer275:
L_Sample_Ringbuffer276:
L_Sample_Ringbuffer277:
;Protocol.c,1026 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer278:
L_Sample_Ringbuffer279:
L_Sample_Ringbuffer280:
L_Sample_Ringbuffer281:
;Protocol.c,1027 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer282:
L_Sample_Ringbuffer283:
L_Sample_Ringbuffer284:
L_Sample_Ringbuffer285:
;Protocol.c,1028 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer748
NOP	
J	L_Sample_Ringbuffer286
NOP	
L__Sample_Ringbuffer748:
;Protocol.c,1029 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1030 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1031 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1035 :: 		}
L_Sample_Ringbuffer286:
;Protocol.c,1039 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer750
NOP	
J	L_Sample_Ringbuffer287
NOP	
L__Sample_Ringbuffer750:
;Protocol.c,1040 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,1041 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1042 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer288
NOP	
;Protocol.c,1043 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer290:
L_Sample_Ringbuffer291:
;Protocol.c,1044 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer292:
L_Sample_Ringbuffer293:
;Protocol.c,1045 :: 		case 'A':case 'a':
L_Sample_Ringbuffer294:
L_Sample_Ringbuffer295:
;Protocol.c,1046 :: 		case 'I':case 'i':
L_Sample_Ringbuffer296:
L_Sample_Ringbuffer297:
;Protocol.c,1047 :: 		case 'J':case 'j':
L_Sample_Ringbuffer298:
L_Sample_Ringbuffer299:
;Protocol.c,1048 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1049 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1053 :: 		break;
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1054 :: 		case 'F':
L_Sample_Ringbuffer300:
;Protocol.c,1055 :: 		case 'f':
L_Sample_Ringbuffer301:
;Protocol.c,1058 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1059 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1064 :: 		break;
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1065 :: 		}
L_Sample_Ringbuffer288:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer752
NOP	
J	L_Sample_Ringbuffer290
NOP	
L__Sample_Ringbuffer752:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer754
NOP	
J	L_Sample_Ringbuffer291
NOP	
L__Sample_Ringbuffer754:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer756
NOP	
J	L_Sample_Ringbuffer292
NOP	
L__Sample_Ringbuffer756:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer758
NOP	
J	L_Sample_Ringbuffer293
NOP	
L__Sample_Ringbuffer758:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer760
NOP	
J	L_Sample_Ringbuffer294
NOP	
L__Sample_Ringbuffer760:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer762
NOP	
J	L_Sample_Ringbuffer295
NOP	
L__Sample_Ringbuffer762:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer764
NOP	
J	L_Sample_Ringbuffer296
NOP	
L__Sample_Ringbuffer764:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer766
NOP	
J	L_Sample_Ringbuffer297
NOP	
L__Sample_Ringbuffer766:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer768
NOP	
J	L_Sample_Ringbuffer298
NOP	
L__Sample_Ringbuffer768:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer770
NOP	
J	L_Sample_Ringbuffer299
NOP	
L__Sample_Ringbuffer770:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer772
NOP	
J	L_Sample_Ringbuffer300
NOP	
L__Sample_Ringbuffer772:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer774
NOP	
J	L_Sample_Ringbuffer301
NOP	
L__Sample_Ringbuffer774:
L_Sample_Ringbuffer289:
;Protocol.c,1066 :: 		}
L_Sample_Ringbuffer287:
;Protocol.c,1067 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1068 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,1069 :: 		case 'F':
L_Sample_Ringbuffer302:
;Protocol.c,1071 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer775
NOP	
J	L_Sample_Ringbuffer303
NOP	
L__Sample_Ringbuffer775:
;Protocol.c,1072 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1073 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1074 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1078 :: 		}
L_Sample_Ringbuffer303:
;Protocol.c,1079 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1080 :: 		break;
J	L_Sample_Ringbuffer143
NOP	
;Protocol.c,1081 :: 		}
L_Sample_Ringbuffer142:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer777
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer777:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer779
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer779:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer781
NOP	
J	L_Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer781:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer783
NOP	
J	L_Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer783:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer785
NOP	
J	L_Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer785:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer787
NOP	
J	L_Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer787:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer789
NOP	
J	L_Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer789:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer791
NOP	
J	L_Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer791:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer793
NOP	
J	L_Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer793:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer795
NOP	
J	L_Sample_Ringbuffer279
NOP	
L__Sample_Ringbuffer795:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer797
NOP	
J	L_Sample_Ringbuffer280
NOP	
L__Sample_Ringbuffer797:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer799
NOP	
J	L_Sample_Ringbuffer281
NOP	
L__Sample_Ringbuffer799:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer801
NOP	
J	L_Sample_Ringbuffer282
NOP	
L__Sample_Ringbuffer801:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer803
NOP	
J	L_Sample_Ringbuffer283
NOP	
L__Sample_Ringbuffer803:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer805
NOP	
J	L_Sample_Ringbuffer284
NOP	
L__Sample_Ringbuffer805:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer807
NOP	
J	L_Sample_Ringbuffer285
NOP	
L__Sample_Ringbuffer807:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer809
NOP	
J	L_Sample_Ringbuffer302
NOP	
L__Sample_Ringbuffer809:
L_Sample_Ringbuffer143:
;Protocol.c,711 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer382:
L__Sample_Ringbuffer381:
;Protocol.c,1082 :: 		}
L_Sample_Ringbuffer138:
;Protocol.c,1083 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,1089 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer810
NOP	
J	L_Sample_Ringbuffer304
NOP	
L__Sample_Ringbuffer810:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer305
NOP	
L_Sample_Ringbuffer304:
;Protocol.c,1090 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer811
NOP	
J	L_Sample_Ringbuffer306
NOP	
L__Sample_Ringbuffer811:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer307
NOP	
L_Sample_Ringbuffer306:
;Protocol.c,1091 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer812
NOP	
J	L_Sample_Ringbuffer308
NOP	
L__Sample_Ringbuffer812:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer309
NOP	
L_Sample_Ringbuffer308:
;Protocol.c,1092 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer813
NOP	
J	L_Sample_Ringbuffer310
NOP	
L__Sample_Ringbuffer813:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer311
NOP	
L_Sample_Ringbuffer310:
;Protocol.c,1093 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer814
NOP	
J	L_Sample_Ringbuffer312
NOP	
L__Sample_Ringbuffer814:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer313
NOP	
L_Sample_Ringbuffer312:
;Protocol.c,1094 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer815
NOP	
J	L_Sample_Ringbuffer314
NOP	
L__Sample_Ringbuffer815:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer315
NOP	
L_Sample_Ringbuffer314:
;Protocol.c,1095 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer816
NOP	
J	L_Sample_Ringbuffer316
NOP	
L__Sample_Ringbuffer816:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer317
NOP	
L_Sample_Ringbuffer316:
;Protocol.c,1096 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer817
NOP	
J	L_Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer817:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer319
NOP	
L_Sample_Ringbuffer318:
;Protocol.c,1097 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer818
NOP	
J	L_Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer818:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer320:
;Protocol.c,1098 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer819
NOP	
J	L_Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer819:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer322:
L_Sample_Ringbuffer319:
L_Sample_Ringbuffer317:
L_Sample_Ringbuffer315:
L_Sample_Ringbuffer313:
L_Sample_Ringbuffer311:
L_Sample_Ringbuffer309:
L_Sample_Ringbuffer307:
L_Sample_Ringbuffer305:
;Protocol.c,1101 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,1102 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,1105 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,1106 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,1109 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer820
NOP	
J	L_Sample_Ringbuffer323
NOP	
L__Sample_Ringbuffer820:
; ?FLOC___Sample_Ringbuffer?T733 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T733 end address is: 8 (R2)
J	L_Sample_Ringbuffer324
NOP	
L_Sample_Ringbuffer323:
; ?FLOC___Sample_Ringbuffer?T733 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T733 end address is: 8 (R2)
L_Sample_Ringbuffer324:
; ?FLOC___Sample_Ringbuffer?T733 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T733 end address is: 8 (R2)
;Protocol.c,1111 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,1113 :: 		}
L_Sample_Ringbuffer68:
;Protocol.c,1116 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,1117 :: 		}
;Protocol.c,1116 :: 		return status;
;Protocol.c,1117 :: 		}
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
