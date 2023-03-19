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
BNE	R2, R0, L__Str_Initialize477
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize477:
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
BNE	R2, R0, L_Protocol_strsplit480
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit480:
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
BNE	R3, R2, L_Protocol_strsplit482
NOP	
J	L_Protocol_strsplit402
NOP	
L_Protocol_strsplit482:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit484
NOP	
J	L_Protocol_strsplit401
NOP	
L_Protocol_strsplit484:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit485
NOP	
J	L_Protocol_strsplit400
NOP	
L_Protocol_strsplit485:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit402:
L_Protocol_strsplit401:
L_Protocol_strsplit400:
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
BEQ	R2, R0, L_Protocol_strsplit486
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit486:
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
BNE	R2, R0, L_Protocol_strsplit2488
NOP	
J	L_Protocol_strsplit2417
NOP	
L_Protocol_strsplit2488:
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
BNE	R3, R2, L_Protocol_strsplit2490
NOP	
J	L_Protocol_strsplit2408
NOP	
L_Protocol_strsplit2490:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2492
NOP	
J	L_Protocol_strsplit2407
NOP	
L_Protocol_strsplit2492:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2493
NOP	
J	L_Protocol_strsplit2406
NOP	
L_Protocol_strsplit2493:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2408:
L_Protocol_strsplit2407:
L_Protocol_strsplit2406:
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
BEQ	R2, R0, L_Protocol_strsplit2494
NOP	
J	L_Protocol_strsplit2415
NOP	
L_Protocol_strsplit2494:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2496
NOP	
J	L_Protocol_strsplit2416
NOP	
L_Protocol_strsplit2496:
L_Protocol_strsplit2404:
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2497
NOP	
J	L_Protocol_strsplit2413
NOP	
L_Protocol_strsplit2497:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2498
NOP	
J	L_Protocol_strsplit2414
NOP	
L_Protocol_strsplit2498:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2403:
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
J	L_Protocol_strsplit2410
NOP	
L_Protocol_strsplit2413:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2410:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2409
NOP	
L_Protocol_strsplit2414:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2409:
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
J	L_Protocol_strsplit2412
NOP	
L_Protocol_strsplit2415:
L_Protocol_strsplit2412:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2411
NOP	
L_Protocol_strsplit2416:
L_Protocol_strsplit2411:
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
BEQ	R2, R0, L_Protocol_strsplit2499
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2499:
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
L_Protocol_strsplit2417:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str502
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str502:
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
BNE	R2, R0, L_Protocol_str2int504
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int504:
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
BNE	R2, R0, L_Protocol_str2int506
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int506:
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
BNE	R2, R0, L__protocol_execute_runtime509
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime509:
;Protocol.c,206 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime511
NOP	
J	L__protocol_execute_runtime419
NOP	
L__protocol_execute_runtime511:
;Protocol.c,212 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,215 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime513
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime513:
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
L__protocol_execute_runtime418:
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
BNE	R2, R0, L__protocol_execute_runtime515
NOP	
J	L__protocol_execute_runtime418
NOP	
L__protocol_execute_runtime515:
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
L__protocol_execute_runtime419:
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,233 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,236 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime517
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime517:
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
BNE	R2, R0, L__protocol_execute_runtime519
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime519:
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
BNE	R2, R0, L__protocol_execute_runtime521
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime521:
;Protocol.c,250 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,251 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,255 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime523
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime523:
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
BNE	R2, R0, L__protocol_execute_runtime525
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime525:
;Protocol.c,262 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime527
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime527:
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
BNE	R2, R0, L__protocol_system_check530
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check530:
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
BNE	R2, R0, L__protocol_system_check532
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check532:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,307 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check533
NOP	
J	L__protocol_system_check422
NOP	
L__protocol_system_check533:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check535
NOP	
J	L__protocol_system_check421
NOP	
L__protocol_system_check535:
L__protocol_system_check420:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check422:
L__protocol_system_check421:
;Protocol.c,311 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check536
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check536:
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
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;Protocol.c,331 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,332 :: 		if(!dif){
BEQ	R2, R0, L__Sample_Gocde_Line538
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line538:
; dif end address is: 12 (R3)
;Protocol.c,340 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line540
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line540:
;Protocol.c,341 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,342 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line541
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line541:
;Protocol.c,349 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,350 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line542
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line542:
;Protocol.c,351 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Gocde_Line55:
;Protocol.c,353 :: 		}
L_Sample_Gocde_Line54:
;Protocol.c,354 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,355 :: 		}else{
J	L_Sample_Gocde_Line56
NOP	
L_Sample_Gocde_Line52:
;Protocol.c,358 :: 		Str_clear(str,64);
; dif start address is: 12 (R3)
ADDIU	R2, SP, 14
SH	R3, 12(SP)
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R3, 12(SP)
;Protocol.c,360 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
SH	R3, 12(SP)
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R3, 12(SP)
;Protocol.c,363 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line543
NOP	
J	L_Sample_Gocde_Line57
NOP	
L__Sample_Gocde_Line543:
;Protocol.c,364 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
;Protocol.c,365 :: 		}else if(bit_istrue(startup,bit(START_MSG))){
J	L_Sample_Gocde_Line58
NOP	
L_Sample_Gocde_Line57:
; dif start address is: 12 (R3)
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Gocde_Line545
NOP	
J	L_Sample_Gocde_Line59
NOP	
L__Sample_Gocde_Line545:
;Protocol.c,367 :: 		int msg_type = Check_Query_Type(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
; msg_type start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,370 :: 		if(msg_type == STATUS_GCODE){
SEH	R3, R2
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Gocde_Line546
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line546:
; msg_type end address is: 16 (R4)
SEH	R3, R4
;Protocol.c,372 :: 		while(DMA_IsOn(1));
L_Sample_Gocde_Line61:
; msg_type start address is: 12 (R3)
SH	R3, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R3, 12(SP)
BNE	R2, R0, L__Sample_Gocde_Line548
NOP	
J	L_Sample_Gocde_Line62
NOP	
L__Sample_Gocde_Line548:
J	L_Sample_Gocde_Line61
NOP	
L_Sample_Gocde_Line62:
;Protocol.c,373 :: 		dma_printf("msg-type:= %d\n",msg_type);
ADDIU	R23, SP, 78
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 78
ADDIU	SP, SP, -8
SH	R3, 4(SP)
; msg_type end address is: 12 (R3)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Protocol.c,376 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,378 :: 		}
L_Sample_Gocde_Line59:
L_Sample_Gocde_Line58:
;Protocol.c,380 :: 		}
L_Sample_Gocde_Line56:
;Protocol.c,381 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,383 :: 		}
;Protocol.c,381 :: 		return STATUS_OK;
;Protocol.c,383 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,387 :: 		static void Do_Startup_Msg(char *str,int _dif_){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,390 :: 		for(i = 0;i <= _dif_;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_Do_Startup_Msg63:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R26
SLT	R2, R2, R3
BEQ	R2, R0, L_Protocol_Do_Startup_Msg550
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg550:
;Protocol.c,391 :: 		if(str[i] == '?'){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg551
NOP	
J	L_Protocol_Do_Startup_Msg66
NOP	
L_Protocol_Do_Startup_Msg551:
;Protocol.c,392 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,393 :: 		report_init_message();
SH	R4, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
JAL	_report_init_message+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R4, 4(SP)
;Protocol.c,394 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,395 :: 		}
L_Protocol_Do_Startup_Msg66:
;Protocol.c,390 :: 		for(i = 0;i <= _dif_;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,396 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_Do_Startup_Msg63
NOP	
L_Protocol_Do_Startup_Msg64:
;Protocol.c,397 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
Protocol_Check_Query_Type:
;Protocol.c,400 :: 		static int Check_Query_Type(char *str,int dif){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Protocol.c,408 :: 		if(str[0] == '$'){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type553
NOP	
J	L_Protocol_Check_Query_Type67
NOP	
L_Protocol_Check_Query_Type553:
;Protocol.c,409 :: 		switch(str[1]){
ADDIU	R2, R25, 1
SW	R2, 56(SP)
J	L_Protocol_Check_Query_Type68
NOP	
;Protocol.c,410 :: 		case '\r' :case '\n' :
L_Protocol_Check_Query_Type70:
L_Protocol_Check_Query_Type71:
;Protocol.c,411 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,412 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,413 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,414 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type72:
;Protocol.c,415 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,416 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,417 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,418 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type73:
;Protocol.c,419 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,420 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,421 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,422 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type74:
;Protocol.c,423 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,424 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,425 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,426 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type75:
;Protocol.c,427 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,435 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type554
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type554:
;Protocol.c,436 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,437 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,438 :: 		} else {
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type76:
;Protocol.c,439 :: 		if (sys.state) { status = STATUS_IDLE_ERROR; }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type556
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type556:
ORI	R2, R0, 11
SH	R2, 32(SP)
L_Protocol_Check_Query_Type78:
;Protocol.c,440 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,441 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,442 :: 		}
L_Protocol_Check_Query_Type77:
;Protocol.c,443 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,444 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type79:
;Protocol.c,445 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type557
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type557:
;Protocol.c,446 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,447 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,449 :: 		}
L_Protocol_Check_Query_Type80:
;Protocol.c,450 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,451 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,452 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type81:
;Protocol.c,453 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,454 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L_Protocol_Check_Query_Type559
NOP	
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type559:
;Protocol.c,455 :: 		int axis_to_home = 0;
;Protocol.c,458 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type561
NOP	
J	L_Protocol_Check_Query_Type428
NOP	
L_Protocol_Check_Query_Type561:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type563
NOP	
J	L_Protocol_Check_Query_Type427
NOP	
L_Protocol_Check_Query_Type563:
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type428:
L_Protocol_Check_Query_Type427:
;Protocol.c,459 :: 		int i = 0;
;Protocol.c,460 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,463 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,464 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Protocol_Check_Query_Type86:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Check_Query_Type564
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type564:
;Protocol.c,465 :: 		Set_Axisword(i);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,464 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,465 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type87:
;Protocol.c,468 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type566
NOP	
J	L_Protocol_Check_Query_Type89
NOP	
L_Protocol_Check_Query_Type566:
;Protocol.c,469 :: 		status = ALARM_ABORT_CYCLE;
ORI	R2, R0, 65534
SH	R2, 32(SP)
;Protocol.c,470 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,471 :: 		}
L_Protocol_Check_Query_Type89:
;Protocol.c,472 :: 		} else {
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type85:
;Protocol.c,473 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 32(SP)
;Protocol.c,474 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,475 :: 		}
L_Protocol_Check_Query_Type90:
;Protocol.c,476 :: 		} else {
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type82:
;Protocol.c,477 :: 		status = STATUS_SETTING_DISABLED;
ORI	R2, R0, 7
SH	R2, 32(SP)
;Protocol.c,478 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,479 :: 		}
L_Protocol_Check_Query_Type91:
;Protocol.c,482 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,483 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,484 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type92:
;Protocol.c,485 :: 		if ( str[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type567
NOP	
J	L_Protocol_Check_Query_Type93
NOP	
L_Protocol_Check_Query_Type567:
;Protocol.c,486 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type94:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type568
NOP	
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type568:
;Protocol.c,487 :: 		if ((settings_read_startup_line(helper_var, str))) {
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
BNE	R2, R0, L_Protocol_Check_Query_Type570
NOP	
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type570:
;Protocol.c,488 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,489 :: 		} else {
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type97:
;Protocol.c,490 :: 		report_startup_line(helper_var,str);
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
;Protocol.c,491 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,492 :: 		}
L_Protocol_Check_Query_Type98:
;Protocol.c,486 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,497 :: 		}
; helper_var end address is: 12 (R3)
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type95:
;Protocol.c,498 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,499 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type93:
;Protocol.c,500 :: 		int N_Val = 0;
;Protocol.c,501 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,506 :: 		if ( str[2] >= '0'  &&  str[2] <= '9' ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type571
NOP	
J	L_Protocol_Check_Query_Type430
NOP	
L_Protocol_Check_Query_Type571:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type572
NOP	
J	L_Protocol_Check_Query_Type429
NOP	
L_Protocol_Check_Query_Type572:
L_Protocol_Check_Query_Type425:
;Protocol.c,507 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 34(SP)
MOVZ	R30, R0, R0
SB	R30, 35(SP)
;Protocol.c,509 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 34
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,510 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,517 :: 		}else {
J	L_Protocol_Check_Query_Type103
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,506 :: 		if ( str[2] >= '0'  &&  str[2] <= '9' ) {
L_Protocol_Check_Query_Type430:
L_Protocol_Check_Query_Type429:
;Protocol.c,519 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,520 :: 		}
L_Protocol_Check_Query_Type103:
;Protocol.c,523 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type574
NOP	
J	L_Protocol_Check_Query_Type104
NOP	
L_Protocol_Check_Query_Type574:
; helper_var end address is: 28 (R7)
;Protocol.c,524 :: 		int str_len = 0;
;Protocol.c,525 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type576
NOP	
J	L_Protocol_Check_Query_Type105
NOP	
L_Protocol_Check_Query_Type576:
; N_Val end address is: 16 (R4)
;Protocol.c,528 :: 		helper_var = strlen((gcode[0]));
SW	R25, 16(SP)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
;Protocol.c,529 :: 		strncpy(str,(gcode[0]),helper_var);
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
JAL	_strncpy+0
NOP	
;Protocol.c,537 :: 		str_len = strlen(str);
JAL	_strlen+0
NOP	
;Protocol.c,542 :: 		}else{
J	L_Protocol_Check_Query_Type106
NOP	
L_Protocol_Check_Query_Type105:
;Protocol.c,543 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,551 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,552 :: 		}
L_Protocol_Check_Query_Type106:
;Protocol.c,554 :: 		}
L_Protocol_Check_Query_Type104:
;Protocol.c,556 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,557 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,558 :: 		case '~': //*~ (cycle start)
L_Protocol_Check_Query_Type107:
;Protocol.c,559 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,560 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,561 :: 		case '!': //*! (feed hold)
L_Protocol_Check_Query_Type108:
;Protocol.c,562 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,563 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,564 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Protocol_Check_Query_Type109:
;Protocol.c,565 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,566 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,567 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type110:
L_Protocol_Check_Query_Type111:
L_Protocol_Check_Query_Type112:
L_Protocol_Check_Query_Type113:
L_Protocol_Check_Query_Type114:
L_Protocol_Check_Query_Type115:
;Protocol.c,568 :: 		case '6': case '7': case '8': case '9':
L_Protocol_Check_Query_Type116:
L_Protocol_Check_Query_Type117:
L_Protocol_Check_Query_Type118:
L_Protocol_Check_Query_Type119:
;Protocol.c,572 :: 		if((str[2] == '=')||(str[3] == '=')){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type578
NOP	
J	L_Protocol_Check_Query_Type432
NOP	
L_Protocol_Check_Query_Type578:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type580
NOP	
J	L_Protocol_Check_Query_Type431
NOP	
L_Protocol_Check_Query_Type580:
J	L_Protocol_Check_Query_Type122
NOP	
L_Protocol_Check_Query_Type432:
L_Protocol_Check_Query_Type431:
;Protocol.c,573 :: 		char str_val[9]={0};
ADDIU	R23, SP, 46
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
ORI	R24, R24, lo_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,574 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,575 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,576 :: 		if(str[2] == '='){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type581
NOP	
J	L_Protocol_Check_Query_Type123
NOP	
L_Protocol_Check_Query_Type581:
;Protocol.c,578 :: 		strncpy(str_val,(str+1),1);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 46
SW	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,579 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 46
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type583
NOP	
J	L_Protocol_Check_Query_Type435
NOP	
L_Protocol_Check_Query_Type583:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 46
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type435:
L_Protocol_Check_Query_Type124:
;Protocol.c,580 :: 		strncpy(str_val,(str+3),strlen((str+3)));
; N_Val start address is: 24 (R6)
ADDIU	R2, R25, 3
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
ADDIU	R4, R25, 3
ADDIU	R3, SP, 46
SEH	R27, R2
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,581 :: 		}else if(str[3] == '='){
SEH	R7, R6
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type123:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type584
NOP	
J	L_Protocol_Check_Query_Type437
NOP	
L_Protocol_Check_Query_Type584:
;Protocol.c,583 :: 		strncpy(str_val,(str+1),2);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 46
SW	R25, 16(SP)
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,584 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 46
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type586
NOP	
J	L_Protocol_Check_Query_Type436
NOP	
L_Protocol_Check_Query_Type586:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 46
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type436:
SEH	R5, R6
L_Protocol_Check_Query_Type127:
;Protocol.c,585 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 46
SW	R25, 16(SP)
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
;Protocol.c,586 :: 		strncpy(str_val,(str+4),strlen((str+4)));
ADDIU	R2, R25, 4
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
ADDIU	R4, R25, 4
ADDIU	R3, SP, 46
SH	R5, 16(SP)
SEH	R27, R2
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
; N_Val end address is: 20 (R5)
LH	R5, 16(SP)
SEH	R7, R5
;Protocol.c,587 :: 		}
J	L_Protocol_Check_Query_Type126
NOP	
L_Protocol_Check_Query_Type437:
;Protocol.c,581 :: 		}else if(str[3] == '='){
SEH	R7, R6
;Protocol.c,587 :: 		}
L_Protocol_Check_Query_Type126:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Protocol_Check_Query_Type125:
;Protocol.c,590 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Protocol_Check_Query_Type587
NOP	
J	L_Protocol_Check_Query_Type434
NOP	
L_Protocol_Check_Query_Type587:
; value end address is: 8 (R2)
ADDIU	R2, SP, 46
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type589
NOP	
J	L_Protocol_Check_Query_Type433
NOP	
L_Protocol_Check_Query_Type589:
J	L_Protocol_Check_Query_Type130
NOP	
L_Protocol_Check_Query_Type434:
L_Protocol_Check_Query_Type433:
;Protocol.c,591 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 32(SP)
;Protocol.c,592 :: 		}
L_Protocol_Check_Query_Type130:
;Protocol.c,593 :: 		value = atof(str_val);
ADDIU	R2, SP, 46
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
; value start address is: 8 (R2)
MOV.S 	S1, S0
; N_Val end address is: 28 (R7)
; value end address is: 8 (R2)
SEH	R4, R7
MOV.S 	S16, S1
;Protocol.c,595 :: 		while(DMA_IsOn(1));
L_Protocol_Check_Query_Type131:
; value start address is: 128 (R32)
; N_Val start address is: 16 (R4)
SH	R4, 16(SP)
SWC1	S16, 20(SP)
SH	R26, 24(SP)
SW	R25, 28(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 28(SP)
LH	R26, 24(SP)
LWC1	S16, 20(SP)
LH	R4, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type591
NOP	
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type591:
J	L_Protocol_Check_Query_Type131
NOP	
L_Protocol_Check_Query_Type132:
;Protocol.c,596 :: 		dma_printf("%d\t%s\t%f\n",N_Val,str_val,value);
ADDIU	R3, SP, 46
ADDIU	R23, SP, 36
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSProtocol_?lstr2_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr2_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 36
SH	R4, 16(SP)
SWC1	S16, 20(SP)
SH	R26, 24(SP)
SW	R25, 28(SP)
ADDIU	SP, SP, -16
SWC1	S16, 12(SP)
SW	R3, 8(SP)
SH	R4, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 28(SP)
LH	R26, 24(SP)
LWC1	S16, 20(SP)
LH	R4, 16(SP)
;Protocol.c,598 :: 		settings_store_global_setting(N_Val,value);
SH	R26, 16(SP)
; value end address is: 128 (R32)
SW	R25, 20(SP)
MOV.S 	S12, S16
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_global_setting+0
NOP	
LW	R25, 20(SP)
LH	R26, 16(SP)
;Protocol.c,599 :: 		status = STATUS_OK;
SH	R0, 32(SP)
;Protocol.c,600 :: 		}
L_Protocol_Check_Query_Type122:
;Protocol.c,601 :: 		break;
J	L_Protocol_Check_Query_Type69
NOP	
;Protocol.c,602 :: 		}
L_Protocol_Check_Query_Type68:
LW	R4, 56(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type593
NOP	
J	L_Protocol_Check_Query_Type70
NOP	
L_Protocol_Check_Query_Type593:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type595
NOP	
J	L_Protocol_Check_Query_Type71
NOP	
L_Protocol_Check_Query_Type595:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type597
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type597:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type599
NOP	
J	L_Protocol_Check_Query_Type73
NOP	
L_Protocol_Check_Query_Type599:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type601
NOP	
J	L_Protocol_Check_Query_Type74
NOP	
L_Protocol_Check_Query_Type601:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type603
NOP	
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type603:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type605
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type605:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type607
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type607:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type609
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type609:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Check_Query_Type611
NOP	
J	L_Protocol_Check_Query_Type107
NOP	
L_Protocol_Check_Query_Type611:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Check_Query_Type613
NOP	
J	L_Protocol_Check_Query_Type108
NOP	
L_Protocol_Check_Query_Type613:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Check_Query_Type615
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type615:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type617
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type617:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type619
NOP	
J	L_Protocol_Check_Query_Type111
NOP	
L_Protocol_Check_Query_Type619:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type621
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type621:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type623
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type623:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type625
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type625:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type627
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type627:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type629
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type629:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type631
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type631:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type633
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type633:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type635
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type635:
L_Protocol_Check_Query_Type69:
;Protocol.c,605 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type636
NOP	
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type636:
;Protocol.c,606 :: 		report_status_message(status);
LH	R25, 32(SP)
JAL	_report_status_message+0
NOP	
L_Protocol_Check_Query_Type133:
;Protocol.c,608 :: 		return status;
LH	R2, 32(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,609 :: 		}
L_Protocol_Check_Query_Type67:
;Protocol.c,610 :: 		return STATUS_GCODE;
ORI	R2, R0, 20
;Protocol.c,611 :: 		}
;Protocol.c,610 :: 		return STATUS_GCODE;
;Protocol.c,611 :: 		}
L_end_Check_Query_Type:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of Protocol_Check_Query_Type
Protocol_Do_Gcode:
;Protocol.c,614 :: 		static int Do_Gcode(char *str,int dif){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,616 :: 		int num_of_strings = strsplit2(gcode,str,0x20);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,634 :: 		}
L_end_Do_Gcode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Protocol_Do_Gcode
_Sample_Ringbuffer:
;Protocol.c,640 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,650 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,651 :: 		int axis_to_run = 0;
;Protocol.c,658 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,661 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer640
NOP	
J	L__Sample_Ringbuffer449
NOP	
L__Sample_Ringbuffer640:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer641
NOP	
J	L__Sample_Ringbuffer448
NOP	
L__Sample_Ringbuffer641:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer447:
;Protocol.c,662 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,663 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,664 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,665 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,661 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer449:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer448:
;Protocol.c,668 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer642:
; dif end address is: 20 (R5)
;Protocol.c,670 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer644:
;Protocol.c,671 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,672 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer645:
;Protocol.c,677 :: 		DMA0_Abort();
JAL	_DMA0_Abort+0
NOP	
;Protocol.c,678 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer646:
;Protocol.c,679 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer140:
;Protocol.c,680 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,681 :: 		}
L_Sample_Ringbuffer139:
;Protocol.c,682 :: 		}
L_Sample_Ringbuffer138:
;Protocol.c,683 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,684 :: 		}else if(dif > 0){
L_Sample_Ringbuffer137:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer647:
;Protocol.c,685 :: 		int modal_response = 0;
;Protocol.c,686 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,688 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,689 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,690 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,695 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,697 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,719 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer648:
;Protocol.c,724 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,725 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,726 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,727 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,728 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,729 :: 		}
L_Sample_Ringbuffer143:
;Protocol.c,738 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,741 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer649:
;Protocol.c,742 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,743 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer650:
;Protocol.c,744 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer145:
;Protocol.c,745 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,746 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer144:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer651:
;Protocol.c,748 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer652:
;Protocol.c,749 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,750 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,751 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,752 :: 		}
L_Sample_Ringbuffer148:
;Protocol.c,753 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,754 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer151:
;Protocol.c,755 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,756 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,757 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,758 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer152:
;Protocol.c,759 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,760 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,761 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,762 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer153:
;Protocol.c,763 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,764 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,765 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,766 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer154:
;Protocol.c,767 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,768 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,771 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer653:
;Protocol.c,772 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer155:
;Protocol.c,773 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,774 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,775 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer156:
;Protocol.c,776 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,780 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer654:
;Protocol.c,781 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,782 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,783 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,784 :: 		} else {
L_Sample_Ringbuffer157:
;Protocol.c,786 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer656:
;Protocol.c,787 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,788 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,789 :: 		}
L_Sample_Ringbuffer159:
;Protocol.c,791 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,792 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,794 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,795 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,797 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer160:
;Protocol.c,798 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,799 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer657:
;Protocol.c,800 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,801 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,803 :: 		}
L_Sample_Ringbuffer161:
;Protocol.c,804 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,805 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,806 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer162:
;Protocol.c,807 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,809 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer659
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer659:
;Protocol.c,810 :: 		int axis_to_home = 0;
;Protocol.c,813 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer661
NOP	
J	L__Sample_Ringbuffer451
NOP	
L__Sample_Ringbuffer661:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer663
NOP	
J	L__Sample_Ringbuffer450
NOP	
L__Sample_Ringbuffer663:
J	L_Sample_Ringbuffer166
NOP	
L__Sample_Ringbuffer451:
L__Sample_Ringbuffer450:
;Protocol.c,814 :: 		int i = 0;
;Protocol.c,815 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,818 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,819 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer167:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer168
NOP	
L__Sample_Ringbuffer664:
;Protocol.c,820 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,819 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,820 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer167
NOP	
L_Sample_Ringbuffer168:
;Protocol.c,823 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer170
NOP	
L__Sample_Ringbuffer666:
;Protocol.c,824 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,825 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,826 :: 		}
L_Sample_Ringbuffer170:
;Protocol.c,827 :: 		} else {
J	L_Sample_Ringbuffer171
NOP	
L_Sample_Ringbuffer166:
;Protocol.c,828 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,829 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,830 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,831 :: 		} else {
J	L_Sample_Ringbuffer172
NOP	
L_Sample_Ringbuffer163:
;Protocol.c,832 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,833 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,834 :: 		}
L_Sample_Ringbuffer172:
;Protocol.c,837 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,838 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,839 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,840 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer173:
;Protocol.c,841 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,842 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer667
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer667:
;Protocol.c,843 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer175:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer176
NOP	
L__Sample_Ringbuffer668:
;Protocol.c,844 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer670
NOP	
J	L_Sample_Ringbuffer178
NOP	
L__Sample_Ringbuffer670:
;Protocol.c,846 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,847 :: 		} else {
J	L_Sample_Ringbuffer179
NOP	
L_Sample_Ringbuffer178:
;Protocol.c,848 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,849 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,850 :: 		}
L_Sample_Ringbuffer179:
;Protocol.c,843 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,855 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer175
NOP	
L_Sample_Ringbuffer176:
;Protocol.c,856 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,857 :: 		}else { // Store startup line
L_Sample_Ringbuffer174:
;Protocol.c,858 :: 		int N_Val = 0;
;Protocol.c,859 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,864 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer671
NOP	
J	L__Sample_Ringbuffer453
NOP	
L__Sample_Ringbuffer671:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer672
NOP	
J	L__Sample_Ringbuffer452
NOP	
L__Sample_Ringbuffer672:
L__Sample_Ringbuffer445:
;Protocol.c,865 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,867 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,868 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,875 :: 		}else {
J	L_Sample_Ringbuffer184
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,864 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer453:
L__Sample_Ringbuffer452:
;Protocol.c,876 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,877 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,878 :: 		}
L_Sample_Ringbuffer184:
;Protocol.c,881 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer674:
; helper_var end address is: 28 (R7)
;Protocol.c,882 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer676:
; N_Val end address is: 16 (R4)
;Protocol.c,885 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,886 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,894 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,899 :: 		}else{
J	L_Sample_Ringbuffer187
NOP	
L_Sample_Ringbuffer186:
;Protocol.c,900 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,908 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,909 :: 		}
L_Sample_Ringbuffer187:
;Protocol.c,911 :: 		}
L_Sample_Ringbuffer185:
;Protocol.c,913 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,914 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,915 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer188:
;Protocol.c,916 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,917 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,918 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,919 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer189:
;Protocol.c,920 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,921 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,923 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer190:
;Protocol.c,924 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,925 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,926 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,927 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
;Protocol.c,928 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
;Protocol.c,932 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L__Sample_Ringbuffer455
NOP	
L__Sample_Ringbuffer678:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer680
NOP	
J	L__Sample_Ringbuffer454
NOP	
L__Sample_Ringbuffer680:
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer455:
L__Sample_Ringbuffer454:
;Protocol.c,933 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,934 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,935 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,936 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer681:
;Protocol.c,938 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,939 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer683
NOP	
J	L__Sample_Ringbuffer472
NOP	
L__Sample_Ringbuffer683:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer472:
L_Sample_Ringbuffer205:
;Protocol.c,940 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,941 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer206
NOP	
L_Sample_Ringbuffer204:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer684
NOP	
J	L__Sample_Ringbuffer474
NOP	
L__Sample_Ringbuffer684:
;Protocol.c,943 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,944 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer686
NOP	
J	L__Sample_Ringbuffer473
NOP	
L__Sample_Ringbuffer686:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer473:
SEH	R5, R6
L_Sample_Ringbuffer208:
;Protocol.c,945 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,946 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,947 :: 		}
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer474:
;Protocol.c,941 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,947 :: 		}
L_Sample_Ringbuffer207:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer206:
;Protocol.c,950 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer687
NOP	
J	L__Sample_Ringbuffer457
NOP	
L__Sample_Ringbuffer687:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer689
NOP	
J	L__Sample_Ringbuffer456
NOP	
L__Sample_Ringbuffer689:
J	L_Sample_Ringbuffer211
NOP	
L__Sample_Ringbuffer457:
L__Sample_Ringbuffer456:
;Protocol.c,951 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,952 :: 		}
L_Sample_Ringbuffer211:
;Protocol.c,953 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,958 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,961 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,962 :: 		}
L_Sample_Ringbuffer203:
;Protocol.c,963 :: 		break;
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,964 :: 		}
L_Sample_Ringbuffer149:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer691
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer691:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer693
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer693:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer695
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer695:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer697
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer697:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer699
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer699:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer701
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer701:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer703
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer703:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer705
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer705:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer707:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer709:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer711
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer711:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer713
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer713:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer715
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer715:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer717
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer717:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer719
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer719:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer721
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer721:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer723
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer723:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer725
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer725:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer727
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer727:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer729
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer729:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer731
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer731:
L_Sample_Ringbuffer150:
;Protocol.c,966 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer212
NOP	
L_Sample_Ringbuffer147:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer732
NOP	
J	L__Sample_Ringbuffer471
NOP	
L__Sample_Ringbuffer732:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer733
NOP	
J	L__Sample_Ringbuffer470
NOP	
L__Sample_Ringbuffer733:
L__Sample_Ringbuffer442:
;Protocol.c,967 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,968 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,969 :: 		case 'G':case 'g':
L_Sample_Ringbuffer218:
L_Sample_Ringbuffer219:
;Protocol.c,971 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer734:
;Protocol.c,972 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,973 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer735
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer735:
;Protocol.c,974 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,977 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer737
NOP	
J	L__Sample_Ringbuffer460
NOP	
L__Sample_Ringbuffer737:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer739
NOP	
J	L__Sample_Ringbuffer459
NOP	
L__Sample_Ringbuffer739:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer741
NOP	
J	L__Sample_Ringbuffer458
NOP	
L__Sample_Ringbuffer741:
SEH	R2, R4
J	L_Sample_Ringbuffer224
NOP	
L__Sample_Ringbuffer460:
L__Sample_Ringbuffer459:
L__Sample_Ringbuffer458:
;Protocol.c,978 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer224:
;Protocol.c,979 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer225
NOP	
L_Sample_Ringbuffer221:
;Protocol.c,981 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,982 :: 		}
L_Sample_Ringbuffer225:
;Protocol.c,984 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,986 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer742
NOP	
J	L_Sample_Ringbuffer226
NOP	
L__Sample_Ringbuffer742:
; ?FLOC___Sample_Ringbuffer?T523 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T523 end address is: 12 (R3)
J	L_Sample_Ringbuffer227
NOP	
L_Sample_Ringbuffer226:
; ?FLOC___Sample_Ringbuffer?T523 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T523 end address is: 12 (R3)
L_Sample_Ringbuffer227:
; ?FLOC___Sample_Ringbuffer?T523 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T523 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,996 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer744
NOP	
J	L_Sample_Ringbuffer228
NOP	
L__Sample_Ringbuffer744:
;Protocol.c,997 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,999 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1000 :: 		case 'G':case 'g':
L_Sample_Ringbuffer231:
L_Sample_Ringbuffer232:
;Protocol.c,1001 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer745
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer745:
;Protocol.c,1002 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1005 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer747
NOP	
J	L__Sample_Ringbuffer463
NOP	
L__Sample_Ringbuffer747:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer749
NOP	
J	L__Sample_Ringbuffer462
NOP	
L__Sample_Ringbuffer749:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer751
NOP	
J	L__Sample_Ringbuffer461
NOP	
L__Sample_Ringbuffer751:
SEH	R2, R4
J	L_Sample_Ringbuffer236
NOP	
L__Sample_Ringbuffer463:
L__Sample_Ringbuffer462:
L__Sample_Ringbuffer461:
;Protocol.c,1006 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer236:
;Protocol.c,1007 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer237
NOP	
L_Sample_Ringbuffer233:
;Protocol.c,1009 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1010 :: 		}
L_Sample_Ringbuffer237:
;Protocol.c,1012 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1014 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer752
NOP	
J	L_Sample_Ringbuffer238
NOP	
L__Sample_Ringbuffer752:
; ?FLOC___Sample_Ringbuffer?T546 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T546 end address is: 12 (R3)
J	L_Sample_Ringbuffer239
NOP	
L_Sample_Ringbuffer238:
; ?FLOC___Sample_Ringbuffer?T546 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T546 end address is: 12 (R3)
L_Sample_Ringbuffer239:
; ?FLOC___Sample_Ringbuffer?T546 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T546 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1020 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1021 :: 		case 'X':case 'x':
L_Sample_Ringbuffer240:
L_Sample_Ringbuffer241:
;Protocol.c,1022 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer242:
L_Sample_Ringbuffer243:
;Protocol.c,1023 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer244:
L_Sample_Ringbuffer245:
;Protocol.c,1024 :: 		case 'A':case 'a':
L_Sample_Ringbuffer246:
L_Sample_Ringbuffer247:
;Protocol.c,1026 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1027 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1031 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1032 :: 		case 'L':case 'l':
L_Sample_Ringbuffer248:
L_Sample_Ringbuffer249:
;Protocol.c,1033 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1034 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1038 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1039 :: 		case 'F':case 'f':
L_Sample_Ringbuffer250:
L_Sample_Ringbuffer251:
;Protocol.c,1040 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1041 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1045 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1046 :: 		case 'P':case 'p':
L_Sample_Ringbuffer252:
L_Sample_Ringbuffer253:
;Protocol.c,1047 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1048 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1052 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1053 :: 		case 'S':case 's':
L_Sample_Ringbuffer254:
L_Sample_Ringbuffer255:
;Protocol.c,1054 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1055 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1059 :: 		break;
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1060 :: 		}
L_Sample_Ringbuffer229:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer754
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer754:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer756
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer756:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer758
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer758:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer760
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer760:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer762
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer762:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer764
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer764:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer766
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer766:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer768
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer768:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer770
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer770:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer772
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer772:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer774
NOP	
J	L_Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer774:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer776
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer776:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer778
NOP	
J	L_Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer778:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer780
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer780:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer782
NOP	
J	L_Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer782:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer784
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer784:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer786
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer786:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer788
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer788:
L_Sample_Ringbuffer230:
;Protocol.c,1061 :: 		}
L_Sample_Ringbuffer228:
;Protocol.c,1066 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer790
NOP	
J	L_Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer790:
;Protocol.c,1067 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,1068 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1069 :: 		case 'G':case 'g':
L_Sample_Ringbuffer259:
L_Sample_Ringbuffer260:
;Protocol.c,1070 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer791
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer791:
;Protocol.c,1071 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1074 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer793
NOP	
J	L__Sample_Ringbuffer466
NOP	
L__Sample_Ringbuffer793:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer795
NOP	
J	L__Sample_Ringbuffer465
NOP	
L__Sample_Ringbuffer795:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer797
NOP	
J	L__Sample_Ringbuffer464
NOP	
L__Sample_Ringbuffer797:
SEH	R2, R4
J	L_Sample_Ringbuffer264
NOP	
L__Sample_Ringbuffer466:
L__Sample_Ringbuffer465:
L__Sample_Ringbuffer464:
;Protocol.c,1075 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer264:
;Protocol.c,1076 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer265
NOP	
L_Sample_Ringbuffer261:
;Protocol.c,1078 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1079 :: 		}
L_Sample_Ringbuffer265:
;Protocol.c,1081 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1083 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer798
NOP	
J	L_Sample_Ringbuffer266
NOP	
L__Sample_Ringbuffer798:
; ?FLOC___Sample_Ringbuffer?T608 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T608 end address is: 12 (R3)
J	L_Sample_Ringbuffer267
NOP	
L_Sample_Ringbuffer266:
; ?FLOC___Sample_Ringbuffer?T608 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T608 end address is: 12 (R3)
L_Sample_Ringbuffer267:
; ?FLOC___Sample_Ringbuffer?T608 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T608 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1087 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1088 :: 		case 'X':case 'x':
L_Sample_Ringbuffer268:
L_Sample_Ringbuffer269:
;Protocol.c,1089 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer270:
L_Sample_Ringbuffer271:
;Protocol.c,1090 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer272:
L_Sample_Ringbuffer273:
;Protocol.c,1091 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer274:
L_Sample_Ringbuffer275:
;Protocol.c,1092 :: 		case 'I':case 'i':
L_Sample_Ringbuffer276:
L_Sample_Ringbuffer277:
;Protocol.c,1093 :: 		case 'J':case 'j':
L_Sample_Ringbuffer278:
L_Sample_Ringbuffer279:
;Protocol.c,1095 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1096 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1100 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1101 :: 		case 'L':case 'l':
L_Sample_Ringbuffer280:
L_Sample_Ringbuffer281:
;Protocol.c,1102 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1103 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1107 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1108 :: 		case 'F':case 'f':
L_Sample_Ringbuffer282:
L_Sample_Ringbuffer283:
;Protocol.c,1109 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1110 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1114 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1115 :: 		case 'P':case 'p':
L_Sample_Ringbuffer284:
L_Sample_Ringbuffer285:
;Protocol.c,1116 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1117 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1121 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1122 :: 		case 'S':case 's':
L_Sample_Ringbuffer286:
L_Sample_Ringbuffer287:
;Protocol.c,1123 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1124 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1128 :: 		break;
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1129 :: 		}
L_Sample_Ringbuffer257:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer800
NOP	
J	L_Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer800:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer802
NOP	
J	L_Sample_Ringbuffer260
NOP	
L__Sample_Ringbuffer802:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer804
NOP	
J	L_Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer804:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer806
NOP	
J	L_Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer806:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer808
NOP	
J	L_Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer808:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer810
NOP	
J	L_Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer810:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer812
NOP	
J	L_Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer812:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer814
NOP	
J	L_Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer814:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer816
NOP	
J	L_Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer816:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer818
NOP	
J	L_Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer818:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer820
NOP	
J	L_Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer820:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer822
NOP	
J	L_Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer822:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer824
NOP	
J	L_Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer824:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer826
NOP	
J	L_Sample_Ringbuffer279
NOP	
L__Sample_Ringbuffer826:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer828
NOP	
J	L_Sample_Ringbuffer280
NOP	
L__Sample_Ringbuffer828:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer830
NOP	
J	L_Sample_Ringbuffer281
NOP	
L__Sample_Ringbuffer830:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer832
NOP	
J	L_Sample_Ringbuffer282
NOP	
L__Sample_Ringbuffer832:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer834
NOP	
J	L_Sample_Ringbuffer283
NOP	
L__Sample_Ringbuffer834:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer836
NOP	
J	L_Sample_Ringbuffer284
NOP	
L__Sample_Ringbuffer836:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer838
NOP	
J	L_Sample_Ringbuffer285
NOP	
L__Sample_Ringbuffer838:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer840
NOP	
J	L_Sample_Ringbuffer286
NOP	
L__Sample_Ringbuffer840:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer842
NOP	
J	L_Sample_Ringbuffer287
NOP	
L__Sample_Ringbuffer842:
L_Sample_Ringbuffer258:
;Protocol.c,1130 :: 		}
L_Sample_Ringbuffer256:
;Protocol.c,1134 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer844
NOP	
J	L_Sample_Ringbuffer288
NOP	
L__Sample_Ringbuffer844:
;Protocol.c,1135 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,1136 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1137 :: 		case 'G':case 'g':
L_Sample_Ringbuffer291:
L_Sample_Ringbuffer292:
;Protocol.c,1138 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer845
NOP	
J	L_Sample_Ringbuffer293
NOP	
L__Sample_Ringbuffer845:
;Protocol.c,1139 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1142 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer847
NOP	
J	L__Sample_Ringbuffer469
NOP	
L__Sample_Ringbuffer847:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer849
NOP	
J	L__Sample_Ringbuffer468
NOP	
L__Sample_Ringbuffer849:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer851
NOP	
J	L__Sample_Ringbuffer467
NOP	
L__Sample_Ringbuffer851:
SEH	R2, R4
J	L_Sample_Ringbuffer296
NOP	
L__Sample_Ringbuffer469:
L__Sample_Ringbuffer468:
L__Sample_Ringbuffer467:
;Protocol.c,1143 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer296:
;Protocol.c,1144 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer297
NOP	
L_Sample_Ringbuffer293:
;Protocol.c,1146 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1147 :: 		}
L_Sample_Ringbuffer297:
;Protocol.c,1149 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1151 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer852
NOP	
J	L_Sample_Ringbuffer298
NOP	
L__Sample_Ringbuffer852:
; ?FLOC___Sample_Ringbuffer?T675 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T675 end address is: 12 (R3)
J	L_Sample_Ringbuffer299
NOP	
L_Sample_Ringbuffer298:
; ?FLOC___Sample_Ringbuffer?T675 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T675 end address is: 12 (R3)
L_Sample_Ringbuffer299:
; ?FLOC___Sample_Ringbuffer?T675 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T675 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1155 :: 		break;
J	L_Sample_Ringbuffer290
NOP	
;Protocol.c,1156 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer300:
L_Sample_Ringbuffer301:
L_Sample_Ringbuffer302:
L_Sample_Ringbuffer303:
;Protocol.c,1157 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer304:
L_Sample_Ringbuffer305:
;Protocol.c,1158 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer306:
L_Sample_Ringbuffer307:
L_Sample_Ringbuffer308:
L_Sample_Ringbuffer309:
;Protocol.c,1164 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1165 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1169 :: 		break;
J	L_Sample_Ringbuffer290
NOP	
;Protocol.c,1170 :: 		case 'F': case 'f':
L_Sample_Ringbuffer310:
L_Sample_Ringbuffer311:
;Protocol.c,1171 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1172 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1176 :: 		break;
J	L_Sample_Ringbuffer290
NOP	
;Protocol.c,1177 :: 		}
L_Sample_Ringbuffer289:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer854
NOP	
J	L_Sample_Ringbuffer291
NOP	
L__Sample_Ringbuffer854:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer856
NOP	
J	L_Sample_Ringbuffer292
NOP	
L__Sample_Ringbuffer856:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer858
NOP	
J	L_Sample_Ringbuffer300
NOP	
L__Sample_Ringbuffer858:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer860
NOP	
J	L_Sample_Ringbuffer301
NOP	
L__Sample_Ringbuffer860:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer862
NOP	
J	L_Sample_Ringbuffer302
NOP	
L__Sample_Ringbuffer862:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer864
NOP	
J	L_Sample_Ringbuffer303
NOP	
L__Sample_Ringbuffer864:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer866
NOP	
J	L_Sample_Ringbuffer304
NOP	
L__Sample_Ringbuffer866:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer868
NOP	
J	L_Sample_Ringbuffer305
NOP	
L__Sample_Ringbuffer868:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer870
NOP	
J	L_Sample_Ringbuffer306
NOP	
L__Sample_Ringbuffer870:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer872
NOP	
J	L_Sample_Ringbuffer307
NOP	
L__Sample_Ringbuffer872:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer874
NOP	
J	L_Sample_Ringbuffer308
NOP	
L__Sample_Ringbuffer874:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer876
NOP	
J	L_Sample_Ringbuffer309
NOP	
L__Sample_Ringbuffer876:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer878
NOP	
J	L_Sample_Ringbuffer310
NOP	
L__Sample_Ringbuffer878:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer880
NOP	
J	L_Sample_Ringbuffer311
NOP	
L__Sample_Ringbuffer880:
L_Sample_Ringbuffer290:
;Protocol.c,1178 :: 		}
L_Sample_Ringbuffer288:
;Protocol.c,1183 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer882
NOP	
J	L_Sample_Ringbuffer312
NOP	
L__Sample_Ringbuffer882:
;Protocol.c,1184 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,1185 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer313
NOP	
;Protocol.c,1186 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer315:
L_Sample_Ringbuffer316:
;Protocol.c,1187 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer317:
L_Sample_Ringbuffer318:
;Protocol.c,1188 :: 		case 'J':case 'j':
L_Sample_Ringbuffer319:
L_Sample_Ringbuffer320:
;Protocol.c,1189 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1190 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1194 :: 		break;
J	L_Sample_Ringbuffer314
NOP	
;Protocol.c,1195 :: 		case 'F':case 'f':
L_Sample_Ringbuffer321:
L_Sample_Ringbuffer322:
;Protocol.c,1196 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1197 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1201 :: 		break;
J	L_Sample_Ringbuffer314
NOP	
;Protocol.c,1203 :: 		}
L_Sample_Ringbuffer313:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer884
NOP	
J	L_Sample_Ringbuffer315
NOP	
L__Sample_Ringbuffer884:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer886
NOP	
J	L_Sample_Ringbuffer316
NOP	
L__Sample_Ringbuffer886:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer888
NOP	
J	L_Sample_Ringbuffer317
NOP	
L__Sample_Ringbuffer888:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer890
NOP	
J	L_Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer890:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer892
NOP	
J	L_Sample_Ringbuffer319
NOP	
L__Sample_Ringbuffer892:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer894
NOP	
J	L_Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer894:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer896
NOP	
J	L_Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer896:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer898
NOP	
J	L_Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer898:
L_Sample_Ringbuffer314:
;Protocol.c,1204 :: 		}
L_Sample_Ringbuffer312:
;Protocol.c,1208 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer900
NOP	
J	L_Sample_Ringbuffer323
NOP	
L__Sample_Ringbuffer900:
;Protocol.c,1209 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,1210 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,1211 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer324
NOP	
;Protocol.c,1212 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer326:
L_Sample_Ringbuffer327:
;Protocol.c,1213 :: 		case 'J':case 'j':
L_Sample_Ringbuffer328:
L_Sample_Ringbuffer329:
;Protocol.c,1214 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1215 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,1219 :: 		break;
J	L_Sample_Ringbuffer325
NOP	
;Protocol.c,1220 :: 		case 'F':case 'f':
L_Sample_Ringbuffer330:
L_Sample_Ringbuffer331:
;Protocol.c,1221 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1222 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1226 :: 		break;
J	L_Sample_Ringbuffer325
NOP	
;Protocol.c,1227 :: 		}
L_Sample_Ringbuffer324:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer902
NOP	
J	L_Sample_Ringbuffer326
NOP	
L__Sample_Ringbuffer902:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer904
NOP	
J	L_Sample_Ringbuffer327
NOP	
L__Sample_Ringbuffer904:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer906
NOP	
J	L_Sample_Ringbuffer328
NOP	
L__Sample_Ringbuffer906:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer908
NOP	
J	L_Sample_Ringbuffer329
NOP	
L__Sample_Ringbuffer908:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer910
NOP	
J	L_Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer910:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer912
NOP	
J	L_Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer912:
L_Sample_Ringbuffer325:
;Protocol.c,1228 :: 		}
L_Sample_Ringbuffer323:
;Protocol.c,1231 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer914
NOP	
J	L_Sample_Ringbuffer332
NOP	
L__Sample_Ringbuffer914:
;Protocol.c,1232 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,1233 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer333
NOP	
;Protocol.c,1234 :: 		case 'J':case 'j':
L_Sample_Ringbuffer335:
L_Sample_Ringbuffer336:
;Protocol.c,1235 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1236 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1240 :: 		break;
J	L_Sample_Ringbuffer334
NOP	
;Protocol.c,1241 :: 		case 'F':case 'f':
L_Sample_Ringbuffer337:
L_Sample_Ringbuffer338:
;Protocol.c,1242 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1243 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1247 :: 		break;
J	L_Sample_Ringbuffer334
NOP	
;Protocol.c,1249 :: 		}
L_Sample_Ringbuffer333:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer916
NOP	
J	L_Sample_Ringbuffer335
NOP	
L__Sample_Ringbuffer916:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer918
NOP	
J	L_Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer918:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer920
NOP	
J	L_Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer920:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer922
NOP	
J	L_Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer922:
L_Sample_Ringbuffer334:
;Protocol.c,1250 :: 		}
L_Sample_Ringbuffer332:
;Protocol.c,1251 :: 		}
L_Sample_Ringbuffer220:
;Protocol.c,1252 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer923
NOP	
J	L_Sample_Ringbuffer339
NOP	
L__Sample_Ringbuffer923:
; ?FLOC___Sample_Ringbuffer?T781 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T781 end address is: 8 (R2)
J	L_Sample_Ringbuffer340
NOP	
L_Sample_Ringbuffer339:
; ?FLOC___Sample_Ringbuffer?T781 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T781 end address is: 8 (R2)
L_Sample_Ringbuffer340:
; ?FLOC___Sample_Ringbuffer?T781 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T781 end address is: 8 (R2)
;Protocol.c,1253 :: 		break;
J	L_Sample_Ringbuffer217
NOP	
;Protocol.c,1254 :: 		case 'M':
L_Sample_Ringbuffer341:
;Protocol.c,1255 :: 		case 'm':
L_Sample_Ringbuffer342:
;Protocol.c,1257 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1258 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,1259 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,1265 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer925
NOP	
J	L_Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer925:
;Protocol.c,1266 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer344
NOP	
;Protocol.c,1267 :: 		case 'S':
L_Sample_Ringbuffer346:
;Protocol.c,1268 :: 		case 's':
L_Sample_Ringbuffer347:
;Protocol.c,1270 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1271 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,1272 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1276 :: 		}
J	L_Sample_Ringbuffer345
NOP	
L_Sample_Ringbuffer344:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer927
NOP	
J	L_Sample_Ringbuffer346
NOP	
L__Sample_Ringbuffer927:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer929
NOP	
J	L_Sample_Ringbuffer347
NOP	
L__Sample_Ringbuffer929:
L_Sample_Ringbuffer345:
;Protocol.c,1277 :: 		}
L_Sample_Ringbuffer343:
;Protocol.c,1278 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1279 :: 		break;
J	L_Sample_Ringbuffer217
NOP	
;Protocol.c,1280 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer348:
L_Sample_Ringbuffer349:
L_Sample_Ringbuffer350:
L_Sample_Ringbuffer351:
;Protocol.c,1281 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer352:
L_Sample_Ringbuffer353:
L_Sample_Ringbuffer354:
L_Sample_Ringbuffer355:
;Protocol.c,1282 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer356:
L_Sample_Ringbuffer357:
L_Sample_Ringbuffer358:
L_Sample_Ringbuffer359:
;Protocol.c,1283 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer930
NOP	
J	L_Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer930:
;Protocol.c,1284 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1285 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1286 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1290 :: 		}
L_Sample_Ringbuffer360:
;Protocol.c,1294 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer932
NOP	
J	L_Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer932:
;Protocol.c,1295 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,1296 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1297 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer362
NOP	
;Protocol.c,1298 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer364:
L_Sample_Ringbuffer365:
;Protocol.c,1299 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer366:
L_Sample_Ringbuffer367:
;Protocol.c,1300 :: 		case 'A':case 'a':
L_Sample_Ringbuffer368:
L_Sample_Ringbuffer369:
;Protocol.c,1301 :: 		case 'I':case 'i':
L_Sample_Ringbuffer370:
L_Sample_Ringbuffer371:
;Protocol.c,1302 :: 		case 'J':case 'j':
L_Sample_Ringbuffer372:
L_Sample_Ringbuffer373:
;Protocol.c,1303 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1304 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1308 :: 		break;
J	L_Sample_Ringbuffer363
NOP	
;Protocol.c,1309 :: 		case 'F':
L_Sample_Ringbuffer374:
;Protocol.c,1310 :: 		case 'f':
L_Sample_Ringbuffer375:
;Protocol.c,1313 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1314 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1319 :: 		break;
J	L_Sample_Ringbuffer363
NOP	
;Protocol.c,1320 :: 		}
L_Sample_Ringbuffer362:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer934
NOP	
J	L_Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer934:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer936
NOP	
J	L_Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer936:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer938
NOP	
J	L_Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer938:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer940
NOP	
J	L_Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer940:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer942
NOP	
J	L_Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer942:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer944
NOP	
J	L_Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer944:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer946
NOP	
J	L_Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer946:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer948
NOP	
J	L_Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer948:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer950
NOP	
J	L_Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer950:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer952
NOP	
J	L_Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer952:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer954
NOP	
J	L_Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer954:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer956
NOP	
J	L_Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer956:
L_Sample_Ringbuffer363:
;Protocol.c,1321 :: 		}
L_Sample_Ringbuffer361:
;Protocol.c,1322 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1323 :: 		break;
J	L_Sample_Ringbuffer217
NOP	
;Protocol.c,1324 :: 		case 'F':
L_Sample_Ringbuffer376:
;Protocol.c,1326 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer957
NOP	
J	L_Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer957:
;Protocol.c,1327 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1328 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1329 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1333 :: 		}
L_Sample_Ringbuffer377:
;Protocol.c,1334 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1335 :: 		break;
J	L_Sample_Ringbuffer217
NOP	
;Protocol.c,1336 :: 		}
L_Sample_Ringbuffer216:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer959
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer959:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer961
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer961:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer963
NOP	
J	L_Sample_Ringbuffer341
NOP	
L__Sample_Ringbuffer963:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer965
NOP	
J	L_Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer965:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer967
NOP	
J	L_Sample_Ringbuffer348
NOP	
L__Sample_Ringbuffer967:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer969
NOP	
J	L_Sample_Ringbuffer349
NOP	
L__Sample_Ringbuffer969:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer971
NOP	
J	L_Sample_Ringbuffer350
NOP	
L__Sample_Ringbuffer971:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer973
NOP	
J	L_Sample_Ringbuffer351
NOP	
L__Sample_Ringbuffer973:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer975
NOP	
J	L_Sample_Ringbuffer352
NOP	
L__Sample_Ringbuffer975:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer977
NOP	
J	L_Sample_Ringbuffer353
NOP	
L__Sample_Ringbuffer977:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer979
NOP	
J	L_Sample_Ringbuffer354
NOP	
L__Sample_Ringbuffer979:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer981
NOP	
J	L_Sample_Ringbuffer355
NOP	
L__Sample_Ringbuffer981:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer983
NOP	
J	L_Sample_Ringbuffer356
NOP	
L__Sample_Ringbuffer983:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer985
NOP	
J	L_Sample_Ringbuffer357
NOP	
L__Sample_Ringbuffer985:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer987
NOP	
J	L_Sample_Ringbuffer358
NOP	
L__Sample_Ringbuffer987:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer989
NOP	
J	L_Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer989:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer991
NOP	
J	L_Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer991:
L_Sample_Ringbuffer217:
;Protocol.c,966 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer471:
L__Sample_Ringbuffer470:
;Protocol.c,1337 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,1338 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,1344 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer992
NOP	
J	L_Sample_Ringbuffer378
NOP	
L__Sample_Ringbuffer992:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer379
NOP	
L_Sample_Ringbuffer378:
;Protocol.c,1345 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer993
NOP	
J	L_Sample_Ringbuffer380
NOP	
L__Sample_Ringbuffer993:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer381
NOP	
L_Sample_Ringbuffer380:
;Protocol.c,1346 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer994
NOP	
J	L_Sample_Ringbuffer382
NOP	
L__Sample_Ringbuffer994:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer383
NOP	
L_Sample_Ringbuffer382:
;Protocol.c,1347 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer995
NOP	
J	L_Sample_Ringbuffer384
NOP	
L__Sample_Ringbuffer995:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer385
NOP	
L_Sample_Ringbuffer384:
;Protocol.c,1348 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer996
NOP	
J	L_Sample_Ringbuffer386
NOP	
L__Sample_Ringbuffer996:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer387
NOP	
L_Sample_Ringbuffer386:
;Protocol.c,1349 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer997
NOP	
J	L_Sample_Ringbuffer388
NOP	
L__Sample_Ringbuffer997:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer389
NOP	
L_Sample_Ringbuffer388:
;Protocol.c,1350 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer998
NOP	
J	L_Sample_Ringbuffer390
NOP	
L__Sample_Ringbuffer998:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer391
NOP	
L_Sample_Ringbuffer390:
;Protocol.c,1351 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer999
NOP	
J	L_Sample_Ringbuffer392
NOP	
L__Sample_Ringbuffer999:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer393
NOP	
L_Sample_Ringbuffer392:
;Protocol.c,1352 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer1000
NOP	
J	L_Sample_Ringbuffer394
NOP	
L__Sample_Ringbuffer1000:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer394:
;Protocol.c,1353 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer1001
NOP	
J	L_Sample_Ringbuffer396
NOP	
L__Sample_Ringbuffer1001:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer396:
L_Sample_Ringbuffer393:
L_Sample_Ringbuffer391:
L_Sample_Ringbuffer389:
L_Sample_Ringbuffer387:
L_Sample_Ringbuffer385:
L_Sample_Ringbuffer383:
L_Sample_Ringbuffer381:
L_Sample_Ringbuffer379:
;Protocol.c,1356 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,1357 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,1360 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,1361 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,1364 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer1002
NOP	
J	L_Sample_Ringbuffer397
NOP	
L__Sample_Ringbuffer1002:
; ?FLOC___Sample_Ringbuffer?T894 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T894 end address is: 8 (R2)
J	L_Sample_Ringbuffer398
NOP	
L_Sample_Ringbuffer397:
; ?FLOC___Sample_Ringbuffer?T894 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T894 end address is: 8 (R2)
L_Sample_Ringbuffer398:
; ?FLOC___Sample_Ringbuffer?T894 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T894 end address is: 8 (R2)
;Protocol.c,1366 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,1368 :: 		}
L_Sample_Ringbuffer142:
;Protocol.c,1371 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,1372 :: 		}
;Protocol.c,1371 :: 		return status;
;Protocol.c,1372 :: 		}
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
