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
BNE	R2, R0, L__Str_Initialize478
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize478:
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
BNE	R2, R0, L_Protocol_strsplit481
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit481:
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
BNE	R3, R2, L_Protocol_strsplit483
NOP	
J	L_Protocol_strsplit403
NOP	
L_Protocol_strsplit483:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit485
NOP	
J	L_Protocol_strsplit402
NOP	
L_Protocol_strsplit485:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit486
NOP	
J	L_Protocol_strsplit401
NOP	
L_Protocol_strsplit486:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit403:
L_Protocol_strsplit402:
L_Protocol_strsplit401:
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
BEQ	R2, R0, L_Protocol_strsplit487
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit487:
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
BNE	R2, R0, L_Protocol_strsplit2489
NOP	
J	L_Protocol_strsplit2418
NOP	
L_Protocol_strsplit2489:
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
BNE	R3, R2, L_Protocol_strsplit2491
NOP	
J	L_Protocol_strsplit2409
NOP	
L_Protocol_strsplit2491:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2493
NOP	
J	L_Protocol_strsplit2408
NOP	
L_Protocol_strsplit2493:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2494
NOP	
J	L_Protocol_strsplit2407
NOP	
L_Protocol_strsplit2494:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2409:
L_Protocol_strsplit2408:
L_Protocol_strsplit2407:
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
BEQ	R2, R0, L_Protocol_strsplit2495
NOP	
J	L_Protocol_strsplit2416
NOP	
L_Protocol_strsplit2495:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2497
NOP	
J	L_Protocol_strsplit2417
NOP	
L_Protocol_strsplit2497:
L_Protocol_strsplit2405:
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2498
NOP	
J	L_Protocol_strsplit2414
NOP	
L_Protocol_strsplit2498:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2499
NOP	
J	L_Protocol_strsplit2415
NOP	
L_Protocol_strsplit2499:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2404:
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
J	L_Protocol_strsplit2411
NOP	
L_Protocol_strsplit2414:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2411:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2410
NOP	
L_Protocol_strsplit2415:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2410:
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
J	L_Protocol_strsplit2413
NOP	
L_Protocol_strsplit2416:
L_Protocol_strsplit2413:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2412
NOP	
L_Protocol_strsplit2417:
L_Protocol_strsplit2412:
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
BEQ	R2, R0, L_Protocol_strsplit2500
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2500:
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
L_Protocol_strsplit2418:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str503
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str503:
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
BNE	R2, R0, L_Protocol_str2int505
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int505:
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
BNE	R2, R0, L_Protocol_str2int507
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int507:
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
BNE	R2, R0, L__protocol_execute_runtime510
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime510:
;Protocol.c,206 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime512
NOP	
J	L__protocol_execute_runtime420
NOP	
L__protocol_execute_runtime512:
;Protocol.c,212 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,215 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime514
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime514:
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
L__protocol_execute_runtime419:
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
BNE	R2, R0, L__protocol_execute_runtime516
NOP	
J	L__protocol_execute_runtime419
NOP	
L__protocol_execute_runtime516:
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
L__protocol_execute_runtime420:
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,233 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,236 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime518
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime518:
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
BNE	R2, R0, L__protocol_execute_runtime520
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime520:
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
BNE	R2, R0, L__protocol_execute_runtime522
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime522:
;Protocol.c,250 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,251 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,255 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime524
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime524:
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
BNE	R2, R0, L__protocol_execute_runtime526
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime526:
;Protocol.c,262 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime528
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime528:
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
BNE	R2, R0, L__protocol_system_check531
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check531:
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
BNE	R2, R0, L__protocol_system_check533
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check533:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,307 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check534
NOP	
J	L__protocol_system_check423
NOP	
L__protocol_system_check534:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check536
NOP	
J	L__protocol_system_check422
NOP	
L__protocol_system_check536:
L__protocol_system_check421:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check423:
L__protocol_system_check422:
;Protocol.c,311 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check537
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check537:
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
;Protocol.c,329 :: 		dif = Get_Difference();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Get_Difference+0
NOP	
; dif start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,330 :: 		if(!dif){
BEQ	R2, R0, L__Sample_Gocde_Line539
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line539:
; dif end address is: 12 (R3)
;Protocol.c,338 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line541
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line541:
;Protocol.c,339 :: 		char *ptr = (char*)RXBUFF;
; ptr start address is: 16 (R4)
LUI	R30, 40960
ORI	R30, R30, 8192
MOVZ	R4, R30, R0
;Protocol.c,340 :: 		if(*ptr == '?'){
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line542
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line542:
;Protocol.c,341 :: 		Do_Critical_Msg(*ptr);
LBU	R25, 0(R4)
; ptr end address is: 16 (R4)
JAL	Protocol_Do_Critical_Msg+0
NOP	
;Protocol.c,342 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,343 :: 		DCH0DAT  = (DCH0DAT == '?')? '\n':'\n';
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line543
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line543:
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
;Protocol.c,344 :: 		}
L_Sample_Gocde_Line54:
;Protocol.c,345 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,346 :: 		}else{
J	L_Sample_Gocde_Line57
NOP	
L_Sample_Gocde_Line52:
;Protocol.c,349 :: 		Str_clear(str,64);
; dif start address is: 12 (R3)
ADDIU	R2, SP, 14
SH	R3, 12(SP)
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R3, 12(SP)
;Protocol.c,351 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
SH	R3, 12(SP)
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R3, 12(SP)
;Protocol.c,354 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line544
NOP	
J	L_Sample_Gocde_Line58
NOP	
L__Sample_Gocde_Line544:
;Protocol.c,355 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
;Protocol.c,356 :: 		}else {//if(bit_istrue(startup,bit(START_MSG))){
J	L_Sample_Gocde_Line59
NOP	
L_Sample_Gocde_Line58:
;Protocol.c,358 :: 		int msg_type = Check_Query_Type(str,dif);
; dif start address is: 12 (R3)
ADDIU	R2, SP, 14
SEH	R26, R3
; dif end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
;Protocol.c,366 :: 		if(msg_type == STATUS_GCODE){
SEH	R3, R2
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Gocde_Line545
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line545:
;Protocol.c,368 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,370 :: 		}
L_Sample_Gocde_Line59:
;Protocol.c,372 :: 		}
L_Sample_Gocde_Line57:
;Protocol.c,373 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,375 :: 		}
;Protocol.c,373 :: 		return STATUS_OK;
;Protocol.c,375 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,380 :: 		static void Do_Startup_Msg(char *str_,int dif_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,381 :: 		char *temp_str = str_;//if more than 6 chars sent here ????
; temp_str start address is: 16 (R4)
MOVZ	R4, R25, R0
;Protocol.c,384 :: 		for(i = 0;i <= dif_;i++){
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
BEQ	R2, R0, L_Protocol_Do_Startup_Msg547
NOP	
J	L_Protocol_Do_Startup_Msg62
NOP	
L_Protocol_Do_Startup_Msg547:
; temp_str end address is: 16 (R4)
;Protocol.c,385 :: 		if(temp_str[i] == '?'){
; temp_str start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg548
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg548:
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
;Protocol.c,386 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,387 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,388 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,389 :: 		break;
J	L_Protocol_Do_Startup_Msg62
NOP	
;Protocol.c,390 :: 		}
L_Protocol_Do_Startup_Msg64:
;Protocol.c,384 :: 		for(i = 0;i <= dif_;i++){
; i start address is: 20 (R5)
; temp_str start address is: 16 (R4)
ADDIU	R2, R5, 1
SEH	R5, R2
;Protocol.c,391 :: 		}
; temp_str end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Protocol_Do_Startup_Msg61
NOP	
L_Protocol_Do_Startup_Msg62:
;Protocol.c,392 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
Protocol_Do_Critical_Msg:
;Protocol.c,396 :: 		static void Do_Critical_Msg(char ch_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Protocol.c,401 :: 		switch(ch_){
J	L_Protocol_Do_Critical_Msg65
NOP	
;Protocol.c,402 :: 		case CMD_STATUS_REPORT: sys.execute |= EXEC_STATUS_REPORT; break; // Set as true
L_Protocol_Do_Critical_Msg67:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,403 :: 		case CMD_CYCLE_START:   sys.execute |= EXEC_CYCLE_START; break; // Set as true
L_Protocol_Do_Critical_Msg68:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,404 :: 		case CMD_FEED_HOLD:     sys.execute |= EXEC_FEED_HOLD; break; // Set as true
L_Protocol_Do_Critical_Msg69:
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,405 :: 		case CMD_RESET:         mc_reset(); break; // Call motion control reset routine.
L_Protocol_Do_Critical_Msg70:
JAL	_mc_reset+0
NOP	
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,406 :: 		default: break;
L_Protocol_Do_Critical_Msg71:
J	L_Protocol_Do_Critical_Msg66
NOP	
;Protocol.c,407 :: 		}
L_Protocol_Do_Critical_Msg65:
ANDI	R3, R25, 255
ORI	R2, R0, 63
BNE	R3, R2, L_Protocol_Do_Critical_Msg551
NOP	
J	L_Protocol_Do_Critical_Msg67
NOP	
L_Protocol_Do_Critical_Msg551:
ANDI	R3, R25, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Do_Critical_Msg553
NOP	
J	L_Protocol_Do_Critical_Msg68
NOP	
L_Protocol_Do_Critical_Msg553:
ANDI	R3, R25, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Do_Critical_Msg555
NOP	
J	L_Protocol_Do_Critical_Msg69
NOP	
L_Protocol_Do_Critical_Msg555:
ANDI	R3, R25, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Do_Critical_Msg557
NOP	
J	L_Protocol_Do_Critical_Msg70
NOP	
L_Protocol_Do_Critical_Msg557:
J	L_Protocol_Do_Critical_Msg71
NOP	
L_Protocol_Do_Critical_Msg66:
;Protocol.c,408 :: 		}
L_end_Do_Critical_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Protocol_Do_Critical_Msg
Protocol_Check_Query_Type:
;Protocol.c,412 :: 		static int Check_Query_Type(char *str_,int dif_){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,420 :: 		if(str_[0] == '$'){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type559
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type559:
;Protocol.c,421 :: 		switch(str_[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type73
NOP	
;Protocol.c,422 :: 		case '\r' :case '\n' :
L_Protocol_Check_Query_Type75:
L_Protocol_Check_Query_Type76:
;Protocol.c,423 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,424 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,425 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,426 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type77:
;Protocol.c,427 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,428 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,429 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,430 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type78:
;Protocol.c,431 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,432 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,433 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,434 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type79:
;Protocol.c,435 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,436 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,437 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,438 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type80:
;Protocol.c,439 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,447 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type560
NOP	
J	L_Protocol_Check_Query_Type81
NOP	
L_Protocol_Check_Query_Type560:
;Protocol.c,448 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,449 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,450 :: 		} else {
J	L_Protocol_Check_Query_Type82
NOP	
L_Protocol_Check_Query_Type81:
;Protocol.c,451 :: 		if (sys.state) { status = STATUS_IDLE_ERROR; }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type562
NOP	
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type562:
ORI	R2, R0, 11
SH	R2, 24(SP)
L_Protocol_Check_Query_Type83:
;Protocol.c,452 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,453 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,454 :: 		}
L_Protocol_Check_Query_Type82:
;Protocol.c,455 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,456 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type84:
;Protocol.c,457 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type563
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type563:
;Protocol.c,458 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,459 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,461 :: 		}
L_Protocol_Check_Query_Type85:
;Protocol.c,462 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,463 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,464 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type86:
;Protocol.c,465 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,466 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L_Protocol_Check_Query_Type565
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type565:
;Protocol.c,467 :: 		int axis_to_home = 0;
;Protocol.c,470 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type567
NOP	
J	L_Protocol_Check_Query_Type429
NOP	
L_Protocol_Check_Query_Type567:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type569
NOP	
J	L_Protocol_Check_Query_Type428
NOP	
L_Protocol_Check_Query_Type569:
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type429:
L_Protocol_Check_Query_Type428:
;Protocol.c,471 :: 		int i = 0;
;Protocol.c,472 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,475 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,476 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Protocol_Check_Query_Type91:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Check_Query_Type570
NOP	
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type570:
;Protocol.c,477 :: 		Set_Axisword(i);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,476 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,477 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type92:
;Protocol.c,480 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type572
NOP	
J	L_Protocol_Check_Query_Type94
NOP	
L_Protocol_Check_Query_Type572:
;Protocol.c,481 :: 		status = ALARM_ABORT_CYCLE;
ORI	R2, R0, 65534
SH	R2, 24(SP)
;Protocol.c,482 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,483 :: 		}
L_Protocol_Check_Query_Type94:
;Protocol.c,484 :: 		} else {
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type90:
;Protocol.c,485 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 24(SP)
;Protocol.c,486 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,487 :: 		}
L_Protocol_Check_Query_Type95:
;Protocol.c,488 :: 		} else {
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type87:
;Protocol.c,489 :: 		status = STATUS_SETTING_DISABLED;
ORI	R2, R0, 7
SH	R2, 24(SP)
;Protocol.c,490 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,491 :: 		}
L_Protocol_Check_Query_Type96:
;Protocol.c,494 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,495 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,496 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type97:
;Protocol.c,497 :: 		if ( str_[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type573
NOP	
J	L_Protocol_Check_Query_Type98
NOP	
L_Protocol_Check_Query_Type573:
;Protocol.c,498 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type99:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type574
NOP	
J	L_Protocol_Check_Query_Type100
NOP	
L_Protocol_Check_Query_Type574:
;Protocol.c,499 :: 		if ((settings_read_startup_line(helper_var, str_))) {
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
BNE	R2, R0, L_Protocol_Check_Query_Type576
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type576:
;Protocol.c,500 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,501 :: 		} else {
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type102:
;Protocol.c,502 :: 		report_startup_line(helper_var,str_);
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
;Protocol.c,503 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,504 :: 		}
L_Protocol_Check_Query_Type103:
;Protocol.c,498 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,509 :: 		}
; helper_var end address is: 12 (R3)
J	L_Protocol_Check_Query_Type99
NOP	
L_Protocol_Check_Query_Type100:
;Protocol.c,510 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,511 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type98:
;Protocol.c,512 :: 		int N_Val = 0;
;Protocol.c,513 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,518 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type577
NOP	
J	L_Protocol_Check_Query_Type431
NOP	
L_Protocol_Check_Query_Type577:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type578
NOP	
J	L_Protocol_Check_Query_Type430
NOP	
L_Protocol_Check_Query_Type578:
L_Protocol_Check_Query_Type426:
;Protocol.c,519 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,521 :: 		num[0] = str_[2];
ADDIU	R3, SP, 26
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Protocol.c,522 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,529 :: 		}else {
J	L_Protocol_Check_Query_Type108
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,518 :: 		if ( str_[2] >= '0'  &&  str_[2] <= '9' ) {
L_Protocol_Check_Query_Type431:
L_Protocol_Check_Query_Type430:
;Protocol.c,531 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,532 :: 		}
L_Protocol_Check_Query_Type108:
;Protocol.c,535 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type580
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type580:
; helper_var end address is: 28 (R7)
;Protocol.c,536 :: 		int str_len = 0;
;Protocol.c,537 :: 		if(str_[3] != '='){
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type582
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type582:
; N_Val end address is: 16 (R4)
;Protocol.c,540 :: 		helper_var = strlen((str_));
JAL	_strlen+0
NOP	
;Protocol.c,549 :: 		str_len = strlen(str_);
JAL	_strlen+0
NOP	
;Protocol.c,554 :: 		}else{
J	L_Protocol_Check_Query_Type111
NOP	
L_Protocol_Check_Query_Type110:
;Protocol.c,555 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,563 :: 		settings_store_startup_line(N_Val,str_+4);
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,564 :: 		}
L_Protocol_Check_Query_Type111:
;Protocol.c,566 :: 		}
L_Protocol_Check_Query_Type109:
;Protocol.c,568 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,569 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,570 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type112:
L_Protocol_Check_Query_Type113:
L_Protocol_Check_Query_Type114:
L_Protocol_Check_Query_Type115:
L_Protocol_Check_Query_Type116:
L_Protocol_Check_Query_Type117:
;Protocol.c,571 :: 		case '6': case '7': case '8': case '9':
L_Protocol_Check_Query_Type118:
L_Protocol_Check_Query_Type119:
L_Protocol_Check_Query_Type120:
L_Protocol_Check_Query_Type121:
;Protocol.c,575 :: 		if((str_[2] == '=')||(str_[3] == '=')){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type584
NOP	
J	L_Protocol_Check_Query_Type433
NOP	
L_Protocol_Check_Query_Type584:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type586
NOP	
J	L_Protocol_Check_Query_Type432
NOP	
L_Protocol_Check_Query_Type586:
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type433:
L_Protocol_Check_Query_Type432:
;Protocol.c,576 :: 		char str_val[9]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
ORI	R24, R24, lo_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,577 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,578 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,579 :: 		if(str_[2] == '='){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type587
NOP	
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type587:
;Protocol.c,581 :: 		strncpy(str_val,(str_+1),1);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,582 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type589
NOP	
J	L_Protocol_Check_Query_Type436
NOP	
L_Protocol_Check_Query_Type589:
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
L_Protocol_Check_Query_Type436:
L_Protocol_Check_Query_Type126:
;Protocol.c,583 :: 		strncpy(str_val,(str_+3),strlen((str_+3)));
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
;Protocol.c,584 :: 		}else if(str_[3] == '='){
SEH	R7, R6
J	L_Protocol_Check_Query_Type127
NOP	
L_Protocol_Check_Query_Type125:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type590
NOP	
J	L_Protocol_Check_Query_Type438
NOP	
L_Protocol_Check_Query_Type590:
;Protocol.c,586 :: 		strncpy(str_val,(str_+1),2);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,587 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type592
NOP	
J	L_Protocol_Check_Query_Type437
NOP	
L_Protocol_Check_Query_Type592:
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
L_Protocol_Check_Query_Type437:
SEH	R5, R6
L_Protocol_Check_Query_Type129:
;Protocol.c,588 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
;Protocol.c,589 :: 		strncpy(str_val,(str_+4),strlen((str_+4)));
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
;Protocol.c,590 :: 		}
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type438:
;Protocol.c,584 :: 		}else if(str_[3] == '='){
SEH	R7, R6
;Protocol.c,590 :: 		}
L_Protocol_Check_Query_Type128:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Protocol_Check_Query_Type127:
;Protocol.c,593 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Protocol_Check_Query_Type593
NOP	
J	L_Protocol_Check_Query_Type435
NOP	
L_Protocol_Check_Query_Type593:
; value end address is: 8 (R2)
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type595
NOP	
J	L_Protocol_Check_Query_Type434
NOP	
L_Protocol_Check_Query_Type595:
J	L_Protocol_Check_Query_Type132
NOP	
L_Protocol_Check_Query_Type435:
L_Protocol_Check_Query_Type434:
;Protocol.c,594 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
;Protocol.c,595 :: 		}
L_Protocol_Check_Query_Type132:
;Protocol.c,596 :: 		value = atof(str_val);
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,601 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,602 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,603 :: 		}
L_Protocol_Check_Query_Type124:
;Protocol.c,604 :: 		break;
J	L_Protocol_Check_Query_Type74
NOP	
;Protocol.c,605 :: 		}
L_Protocol_Check_Query_Type73:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type597
NOP	
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type597:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type599
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type599:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type601
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type601:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type603
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type603:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type605
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type605:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type607
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type607:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type609
NOP	
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type609:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type611
NOP	
J	L_Protocol_Check_Query_Type86
NOP	
L_Protocol_Check_Query_Type611:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type613
NOP	
J	L_Protocol_Check_Query_Type97
NOP	
L_Protocol_Check_Query_Type613:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type615
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type615:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type617
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type617:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type619
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type619:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type621
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type621:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type623
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type623:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type625
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type625:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type627
NOP	
J	L_Protocol_Check_Query_Type118
NOP	
L_Protocol_Check_Query_Type627:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type629
NOP	
J	L_Protocol_Check_Query_Type119
NOP	
L_Protocol_Check_Query_Type629:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type631
NOP	
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type631:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type633
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type633:
L_Protocol_Check_Query_Type74:
;Protocol.c,608 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type634
NOP	
J	L_Protocol_Check_Query_Type133
NOP	
L_Protocol_Check_Query_Type634:
;Protocol.c,609 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Protocol_Check_Query_Type133:
;Protocol.c,611 :: 		return status;
LH	R2, 24(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,612 :: 		}else
L_Protocol_Check_Query_Type72:
;Protocol.c,613 :: 		return STATUS_GCODE;
ORI	R2, R0, 20
;Protocol.c,616 :: 		}
;Protocol.c,613 :: 		return STATUS_GCODE;
;Protocol.c,616 :: 		}
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
;Protocol.c,619 :: 		static int Do_Gcode(char *str_,int dif_){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Protocol.c,622 :: 		int num_of_strings = strsplit2(gcode,str_,0x20);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,641 :: 		}
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
;Protocol.c,647 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,657 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,658 :: 		int axis_to_run = 0;
;Protocol.c,665 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,668 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer638
NOP	
J	L__Sample_Ringbuffer450
NOP	
L__Sample_Ringbuffer638:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer639
NOP	
J	L__Sample_Ringbuffer449
NOP	
L__Sample_Ringbuffer639:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer448:
;Protocol.c,669 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,670 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,671 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,672 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,668 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer450:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer449:
;Protocol.c,675 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer640
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer640:
; dif end address is: 20 (R5)
;Protocol.c,677 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer642:
;Protocol.c,678 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,679 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer140
NOP	
L__Sample_Ringbuffer643:
;Protocol.c,684 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,685 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer644:
;Protocol.c,686 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer141:
;Protocol.c,687 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,688 :: 		}
L_Sample_Ringbuffer140:
;Protocol.c,689 :: 		}
L_Sample_Ringbuffer139:
;Protocol.c,690 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,691 :: 		}else if(dif > 0){
L_Sample_Ringbuffer138:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer645:
;Protocol.c,692 :: 		int modal_response = 0;
;Protocol.c,693 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,695 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,696 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,697 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,702 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,704 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,726 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer646:
;Protocol.c,731 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,732 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,733 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,734 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,735 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,736 :: 		}
L_Sample_Ringbuffer144:
;Protocol.c,745 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,748 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer145
NOP	
L__Sample_Ringbuffer647:
;Protocol.c,749 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,750 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer648:
;Protocol.c,751 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer146:
;Protocol.c,752 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,753 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer145:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer148
NOP	
L__Sample_Ringbuffer649:
;Protocol.c,755 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer149
NOP	
L__Sample_Ringbuffer650:
;Protocol.c,756 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,757 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,758 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,759 :: 		}
L_Sample_Ringbuffer149:
;Protocol.c,760 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer150
NOP	
;Protocol.c,761 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer152:
;Protocol.c,762 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,763 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,764 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,765 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer153:
;Protocol.c,766 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,767 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,768 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,769 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer154:
;Protocol.c,770 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,771 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,772 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,773 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer155:
;Protocol.c,774 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,775 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,778 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer651:
;Protocol.c,779 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer156:
;Protocol.c,780 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,781 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,782 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer157:
;Protocol.c,783 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,787 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer652
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer652:
;Protocol.c,788 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,789 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,790 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,791 :: 		} else {
L_Sample_Ringbuffer158:
;Protocol.c,793 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer654:
;Protocol.c,794 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,795 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,796 :: 		}
L_Sample_Ringbuffer160:
;Protocol.c,798 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,799 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,801 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,802 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,804 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer161:
;Protocol.c,805 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,806 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer655
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer655:
;Protocol.c,807 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,808 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,810 :: 		}
L_Sample_Ringbuffer162:
;Protocol.c,811 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,812 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,813 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer163:
;Protocol.c,814 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,816 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer657
NOP	
J	L_Sample_Ringbuffer164
NOP	
L__Sample_Ringbuffer657:
;Protocol.c,817 :: 		int axis_to_home = 0;
;Protocol.c,820 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer659
NOP	
J	L__Sample_Ringbuffer452
NOP	
L__Sample_Ringbuffer659:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer661
NOP	
J	L__Sample_Ringbuffer451
NOP	
L__Sample_Ringbuffer661:
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer452:
L__Sample_Ringbuffer451:
;Protocol.c,821 :: 		int i = 0;
;Protocol.c,822 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,825 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,826 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer168:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer662
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer662:
;Protocol.c,827 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,826 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,827 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer168
NOP	
L_Sample_Ringbuffer169:
;Protocol.c,830 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer171
NOP	
L__Sample_Ringbuffer664:
;Protocol.c,831 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,832 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,833 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,834 :: 		} else {
J	L_Sample_Ringbuffer172
NOP	
L_Sample_Ringbuffer167:
;Protocol.c,835 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,836 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,837 :: 		}
L_Sample_Ringbuffer172:
;Protocol.c,838 :: 		} else {
J	L_Sample_Ringbuffer173
NOP	
L_Sample_Ringbuffer164:
;Protocol.c,839 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,840 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,841 :: 		}
L_Sample_Ringbuffer173:
;Protocol.c,844 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,845 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,846 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,847 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer174:
;Protocol.c,848 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,849 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer665:
;Protocol.c,850 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer176:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer666
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer666:
;Protocol.c,851 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer668
NOP	
J	L_Sample_Ringbuffer179
NOP	
L__Sample_Ringbuffer668:
;Protocol.c,853 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,854 :: 		} else {
J	L_Sample_Ringbuffer180
NOP	
L_Sample_Ringbuffer179:
;Protocol.c,855 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,856 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,857 :: 		}
L_Sample_Ringbuffer180:
;Protocol.c,850 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,862 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer176
NOP	
L_Sample_Ringbuffer177:
;Protocol.c,863 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,864 :: 		}else { // Store startup line
L_Sample_Ringbuffer175:
;Protocol.c,865 :: 		int N_Val = 0;
;Protocol.c,866 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,871 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer669
NOP	
J	L__Sample_Ringbuffer454
NOP	
L__Sample_Ringbuffer669:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer670
NOP	
J	L__Sample_Ringbuffer453
NOP	
L__Sample_Ringbuffer670:
L__Sample_Ringbuffer446:
;Protocol.c,872 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,874 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,875 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,882 :: 		}else {
J	L_Sample_Ringbuffer185
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,871 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer454:
L__Sample_Ringbuffer453:
;Protocol.c,883 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,884 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,885 :: 		}
L_Sample_Ringbuffer185:
;Protocol.c,888 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer672
NOP	
J	L_Sample_Ringbuffer186
NOP	
L__Sample_Ringbuffer672:
; helper_var end address is: 28 (R7)
;Protocol.c,889 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer674
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer674:
; N_Val end address is: 16 (R4)
;Protocol.c,892 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,893 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,901 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,906 :: 		}else{
J	L_Sample_Ringbuffer188
NOP	
L_Sample_Ringbuffer187:
;Protocol.c,907 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,915 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,916 :: 		}
L_Sample_Ringbuffer188:
;Protocol.c,918 :: 		}
L_Sample_Ringbuffer186:
;Protocol.c,920 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,921 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,922 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer189:
;Protocol.c,923 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,924 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,925 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,926 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer190:
;Protocol.c,927 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,928 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,930 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer191:
;Protocol.c,931 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,932 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,933 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,934 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
;Protocol.c,935 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
L_Sample_Ringbuffer200:
L_Sample_Ringbuffer201:
;Protocol.c,939 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer676
NOP	
J	L__Sample_Ringbuffer456
NOP	
L__Sample_Ringbuffer676:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L__Sample_Ringbuffer455
NOP	
L__Sample_Ringbuffer678:
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer456:
L__Sample_Ringbuffer455:
;Protocol.c,940 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,941 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,942 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,943 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer679
NOP	
J	L_Sample_Ringbuffer205
NOP	
L__Sample_Ringbuffer679:
;Protocol.c,945 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,946 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer681
NOP	
J	L__Sample_Ringbuffer473
NOP	
L__Sample_Ringbuffer681:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer473:
L_Sample_Ringbuffer206:
;Protocol.c,947 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,948 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer207
NOP	
L_Sample_Ringbuffer205:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer682
NOP	
J	L__Sample_Ringbuffer475
NOP	
L__Sample_Ringbuffer682:
;Protocol.c,950 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,951 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer684
NOP	
J	L__Sample_Ringbuffer474
NOP	
L__Sample_Ringbuffer684:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer209
NOP	
L__Sample_Ringbuffer474:
SEH	R5, R6
L_Sample_Ringbuffer209:
;Protocol.c,952 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,953 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,954 :: 		}
J	L_Sample_Ringbuffer208
NOP	
L__Sample_Ringbuffer475:
;Protocol.c,948 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,954 :: 		}
L_Sample_Ringbuffer208:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer207:
;Protocol.c,957 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer685
NOP	
J	L__Sample_Ringbuffer458
NOP	
L__Sample_Ringbuffer685:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer687
NOP	
J	L__Sample_Ringbuffer457
NOP	
L__Sample_Ringbuffer687:
J	L_Sample_Ringbuffer212
NOP	
L__Sample_Ringbuffer458:
L__Sample_Ringbuffer457:
;Protocol.c,958 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,959 :: 		}
L_Sample_Ringbuffer212:
;Protocol.c,960 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,965 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,968 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,969 :: 		}
L_Sample_Ringbuffer204:
;Protocol.c,970 :: 		break;
J	L_Sample_Ringbuffer151
NOP	
;Protocol.c,971 :: 		}
L_Sample_Ringbuffer150:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer689
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer689:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer691
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer691:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer693
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer693:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer695
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer695:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer697
NOP	
J	L_Sample_Ringbuffer157
NOP	
L__Sample_Ringbuffer697:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer699
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer699:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer701
NOP	
J	L_Sample_Ringbuffer163
NOP	
L__Sample_Ringbuffer701:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer703
NOP	
J	L_Sample_Ringbuffer174
NOP	
L__Sample_Ringbuffer703:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer705
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer705:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer707
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer707:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer709
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer709:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer711
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer711:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer713
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer713:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer715
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer715:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer717
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer717:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer719
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer719:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer721
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer721:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer723
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer723:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer725
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer725:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer727
NOP	
J	L_Sample_Ringbuffer200
NOP	
L__Sample_Ringbuffer727:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer729
NOP	
J	L_Sample_Ringbuffer201
NOP	
L__Sample_Ringbuffer729:
L_Sample_Ringbuffer151:
;Protocol.c,973 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer213
NOP	
L_Sample_Ringbuffer148:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer730
NOP	
J	L__Sample_Ringbuffer472
NOP	
L__Sample_Ringbuffer730:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer731
NOP	
J	L__Sample_Ringbuffer471
NOP	
L__Sample_Ringbuffer731:
L__Sample_Ringbuffer443:
;Protocol.c,974 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,975 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer217
NOP	
;Protocol.c,976 :: 		case 'G':case 'g':
L_Sample_Ringbuffer219:
L_Sample_Ringbuffer220:
;Protocol.c,978 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer221
NOP	
L__Sample_Ringbuffer732:
;Protocol.c,979 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,980 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer733
NOP	
J	L_Sample_Ringbuffer222
NOP	
L__Sample_Ringbuffer733:
;Protocol.c,981 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,984 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer735
NOP	
J	L__Sample_Ringbuffer461
NOP	
L__Sample_Ringbuffer735:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer737
NOP	
J	L__Sample_Ringbuffer460
NOP	
L__Sample_Ringbuffer737:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer739
NOP	
J	L__Sample_Ringbuffer459
NOP	
L__Sample_Ringbuffer739:
SEH	R2, R4
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer461:
L__Sample_Ringbuffer460:
L__Sample_Ringbuffer459:
;Protocol.c,985 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer225:
;Protocol.c,986 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer226
NOP	
L_Sample_Ringbuffer222:
;Protocol.c,988 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,989 :: 		}
L_Sample_Ringbuffer226:
;Protocol.c,991 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,993 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer740
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer740:
; ?FLOC___Sample_Ringbuffer?T515 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T515 end address is: 12 (R3)
J	L_Sample_Ringbuffer228
NOP	
L_Sample_Ringbuffer227:
; ?FLOC___Sample_Ringbuffer?T515 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T515 end address is: 12 (R3)
L_Sample_Ringbuffer228:
; ?FLOC___Sample_Ringbuffer?T515 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T515 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1003 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer742
NOP	
J	L_Sample_Ringbuffer229
NOP	
L__Sample_Ringbuffer742:
;Protocol.c,1004 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1006 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer230
NOP	
;Protocol.c,1007 :: 		case 'G':case 'g':
L_Sample_Ringbuffer232:
L_Sample_Ringbuffer233:
;Protocol.c,1008 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer743
NOP	
J	L_Sample_Ringbuffer234
NOP	
L__Sample_Ringbuffer743:
;Protocol.c,1009 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1012 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer745
NOP	
J	L__Sample_Ringbuffer464
NOP	
L__Sample_Ringbuffer745:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer747
NOP	
J	L__Sample_Ringbuffer463
NOP	
L__Sample_Ringbuffer747:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer749
NOP	
J	L__Sample_Ringbuffer462
NOP	
L__Sample_Ringbuffer749:
SEH	R2, R4
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer464:
L__Sample_Ringbuffer463:
L__Sample_Ringbuffer462:
;Protocol.c,1013 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer237:
;Protocol.c,1014 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer238
NOP	
L_Sample_Ringbuffer234:
;Protocol.c,1016 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1017 :: 		}
L_Sample_Ringbuffer238:
;Protocol.c,1019 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1021 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer750
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer750:
; ?FLOC___Sample_Ringbuffer?T538 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T538 end address is: 12 (R3)
J	L_Sample_Ringbuffer240
NOP	
L_Sample_Ringbuffer239:
; ?FLOC___Sample_Ringbuffer?T538 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T538 end address is: 12 (R3)
L_Sample_Ringbuffer240:
; ?FLOC___Sample_Ringbuffer?T538 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T538 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1027 :: 		break;
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1028 :: 		case 'X':case 'x':
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,1029 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer244:
;Protocol.c,1030 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer245:
L_Sample_Ringbuffer246:
;Protocol.c,1031 :: 		case 'A':case 'a':
L_Sample_Ringbuffer247:
L_Sample_Ringbuffer248:
;Protocol.c,1033 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1034 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1038 :: 		break;
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1039 :: 		case 'L':case 'l':
L_Sample_Ringbuffer249:
L_Sample_Ringbuffer250:
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
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1046 :: 		case 'F':case 'f':
L_Sample_Ringbuffer251:
L_Sample_Ringbuffer252:
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
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1053 :: 		case 'P':case 'p':
L_Sample_Ringbuffer253:
L_Sample_Ringbuffer254:
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
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1060 :: 		case 'S':case 's':
L_Sample_Ringbuffer255:
L_Sample_Ringbuffer256:
;Protocol.c,1061 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1062 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1066 :: 		break;
J	L_Sample_Ringbuffer231
NOP	
;Protocol.c,1067 :: 		}
L_Sample_Ringbuffer230:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer752
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer752:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer754
NOP	
J	L_Sample_Ringbuffer233
NOP	
L__Sample_Ringbuffer754:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer756
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer756:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer758
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer758:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer760
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer760:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer762
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer762:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer764
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer764:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer766
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer766:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer768
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer768:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer770
NOP	
J	L_Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer770:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer772
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer772:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer774
NOP	
J	L_Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer774:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer776
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer776:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer778
NOP	
J	L_Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer778:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer780
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer780:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer782
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer782:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer784
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer784:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer786
NOP	
J	L_Sample_Ringbuffer256
NOP	
L__Sample_Ringbuffer786:
L_Sample_Ringbuffer231:
;Protocol.c,1068 :: 		}
L_Sample_Ringbuffer229:
;Protocol.c,1073 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer788
NOP	
J	L_Sample_Ringbuffer257
NOP	
L__Sample_Ringbuffer788:
;Protocol.c,1074 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,1075 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer258
NOP	
;Protocol.c,1076 :: 		case 'G':case 'g':
L_Sample_Ringbuffer260:
L_Sample_Ringbuffer261:
;Protocol.c,1077 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer789
NOP	
J	L_Sample_Ringbuffer262
NOP	
L__Sample_Ringbuffer789:
;Protocol.c,1078 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1081 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer791
NOP	
J	L__Sample_Ringbuffer467
NOP	
L__Sample_Ringbuffer791:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer793
NOP	
J	L__Sample_Ringbuffer466
NOP	
L__Sample_Ringbuffer793:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer795
NOP	
J	L__Sample_Ringbuffer465
NOP	
L__Sample_Ringbuffer795:
SEH	R2, R4
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer467:
L__Sample_Ringbuffer466:
L__Sample_Ringbuffer465:
;Protocol.c,1082 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer265:
;Protocol.c,1083 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer266
NOP	
L_Sample_Ringbuffer262:
;Protocol.c,1085 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1086 :: 		}
L_Sample_Ringbuffer266:
;Protocol.c,1088 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1090 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer796
NOP	
J	L_Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer796:
; ?FLOC___Sample_Ringbuffer?T600 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T600 end address is: 12 (R3)
J	L_Sample_Ringbuffer268
NOP	
L_Sample_Ringbuffer267:
; ?FLOC___Sample_Ringbuffer?T600 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T600 end address is: 12 (R3)
L_Sample_Ringbuffer268:
; ?FLOC___Sample_Ringbuffer?T600 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T600 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1094 :: 		break;
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1095 :: 		case 'X':case 'x':
L_Sample_Ringbuffer269:
L_Sample_Ringbuffer270:
;Protocol.c,1096 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer271:
L_Sample_Ringbuffer272:
;Protocol.c,1097 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer273:
L_Sample_Ringbuffer274:
;Protocol.c,1098 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer275:
L_Sample_Ringbuffer276:
;Protocol.c,1099 :: 		case 'I':case 'i':
L_Sample_Ringbuffer277:
L_Sample_Ringbuffer278:
;Protocol.c,1100 :: 		case 'J':case 'j':
L_Sample_Ringbuffer279:
L_Sample_Ringbuffer280:
;Protocol.c,1102 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1103 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1107 :: 		break;
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1108 :: 		case 'L':case 'l':
L_Sample_Ringbuffer281:
L_Sample_Ringbuffer282:
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
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1115 :: 		case 'F':case 'f':
L_Sample_Ringbuffer283:
L_Sample_Ringbuffer284:
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
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1122 :: 		case 'P':case 'p':
L_Sample_Ringbuffer285:
L_Sample_Ringbuffer286:
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
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1129 :: 		case 'S':case 's':
L_Sample_Ringbuffer287:
L_Sample_Ringbuffer288:
;Protocol.c,1130 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1131 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1135 :: 		break;
J	L_Sample_Ringbuffer259
NOP	
;Protocol.c,1136 :: 		}
L_Sample_Ringbuffer258:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer798
NOP	
J	L_Sample_Ringbuffer260
NOP	
L__Sample_Ringbuffer798:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer800
NOP	
J	L_Sample_Ringbuffer261
NOP	
L__Sample_Ringbuffer800:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer802
NOP	
J	L_Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer802:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer804
NOP	
J	L_Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer804:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer806
NOP	
J	L_Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer806:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer808
NOP	
J	L_Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer808:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer810
NOP	
J	L_Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer810:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer812
NOP	
J	L_Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer812:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer814
NOP	
J	L_Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer814:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer816
NOP	
J	L_Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer816:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer818
NOP	
J	L_Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer818:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer820
NOP	
J	L_Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer820:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer822
NOP	
J	L_Sample_Ringbuffer279
NOP	
L__Sample_Ringbuffer822:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer824
NOP	
J	L_Sample_Ringbuffer280
NOP	
L__Sample_Ringbuffer824:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer826
NOP	
J	L_Sample_Ringbuffer281
NOP	
L__Sample_Ringbuffer826:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer828
NOP	
J	L_Sample_Ringbuffer282
NOP	
L__Sample_Ringbuffer828:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer830
NOP	
J	L_Sample_Ringbuffer283
NOP	
L__Sample_Ringbuffer830:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer832
NOP	
J	L_Sample_Ringbuffer284
NOP	
L__Sample_Ringbuffer832:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer834
NOP	
J	L_Sample_Ringbuffer285
NOP	
L__Sample_Ringbuffer834:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer836
NOP	
J	L_Sample_Ringbuffer286
NOP	
L__Sample_Ringbuffer836:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer838
NOP	
J	L_Sample_Ringbuffer287
NOP	
L__Sample_Ringbuffer838:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer840
NOP	
J	L_Sample_Ringbuffer288
NOP	
L__Sample_Ringbuffer840:
L_Sample_Ringbuffer259:
;Protocol.c,1137 :: 		}
L_Sample_Ringbuffer257:
;Protocol.c,1141 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer842
NOP	
J	L_Sample_Ringbuffer289
NOP	
L__Sample_Ringbuffer842:
;Protocol.c,1142 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,1143 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer290
NOP	
;Protocol.c,1144 :: 		case 'G':case 'g':
L_Sample_Ringbuffer292:
L_Sample_Ringbuffer293:
;Protocol.c,1145 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer843
NOP	
J	L_Sample_Ringbuffer294
NOP	
L__Sample_Ringbuffer843:
;Protocol.c,1146 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1149 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer845
NOP	
J	L__Sample_Ringbuffer470
NOP	
L__Sample_Ringbuffer845:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer847
NOP	
J	L__Sample_Ringbuffer469
NOP	
L__Sample_Ringbuffer847:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer849
NOP	
J	L__Sample_Ringbuffer468
NOP	
L__Sample_Ringbuffer849:
SEH	R2, R4
J	L_Sample_Ringbuffer297
NOP	
L__Sample_Ringbuffer470:
L__Sample_Ringbuffer469:
L__Sample_Ringbuffer468:
;Protocol.c,1150 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer297:
;Protocol.c,1151 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer298
NOP	
L_Sample_Ringbuffer294:
;Protocol.c,1153 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1154 :: 		}
L_Sample_Ringbuffer298:
;Protocol.c,1156 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1158 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer850
NOP	
J	L_Sample_Ringbuffer299
NOP	
L__Sample_Ringbuffer850:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T667 end address is: 12 (R3)
J	L_Sample_Ringbuffer300
NOP	
L_Sample_Ringbuffer299:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T667 end address is: 12 (R3)
L_Sample_Ringbuffer300:
; ?FLOC___Sample_Ringbuffer?T667 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T667 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1162 :: 		break;
J	L_Sample_Ringbuffer291
NOP	
;Protocol.c,1163 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer301:
L_Sample_Ringbuffer302:
L_Sample_Ringbuffer303:
L_Sample_Ringbuffer304:
;Protocol.c,1164 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer305:
L_Sample_Ringbuffer306:
;Protocol.c,1165 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer307:
L_Sample_Ringbuffer308:
L_Sample_Ringbuffer309:
L_Sample_Ringbuffer310:
;Protocol.c,1171 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1172 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1176 :: 		break;
J	L_Sample_Ringbuffer291
NOP	
;Protocol.c,1177 :: 		case 'F': case 'f':
L_Sample_Ringbuffer311:
L_Sample_Ringbuffer312:
;Protocol.c,1178 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1179 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1183 :: 		break;
J	L_Sample_Ringbuffer291
NOP	
;Protocol.c,1184 :: 		}
L_Sample_Ringbuffer290:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer852
NOP	
J	L_Sample_Ringbuffer292
NOP	
L__Sample_Ringbuffer852:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer854
NOP	
J	L_Sample_Ringbuffer293
NOP	
L__Sample_Ringbuffer854:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer856
NOP	
J	L_Sample_Ringbuffer301
NOP	
L__Sample_Ringbuffer856:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer858
NOP	
J	L_Sample_Ringbuffer302
NOP	
L__Sample_Ringbuffer858:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer860
NOP	
J	L_Sample_Ringbuffer303
NOP	
L__Sample_Ringbuffer860:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer862
NOP	
J	L_Sample_Ringbuffer304
NOP	
L__Sample_Ringbuffer862:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer864
NOP	
J	L_Sample_Ringbuffer305
NOP	
L__Sample_Ringbuffer864:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer866
NOP	
J	L_Sample_Ringbuffer306
NOP	
L__Sample_Ringbuffer866:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer868
NOP	
J	L_Sample_Ringbuffer307
NOP	
L__Sample_Ringbuffer868:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer870
NOP	
J	L_Sample_Ringbuffer308
NOP	
L__Sample_Ringbuffer870:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer872
NOP	
J	L_Sample_Ringbuffer309
NOP	
L__Sample_Ringbuffer872:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer874
NOP	
J	L_Sample_Ringbuffer310
NOP	
L__Sample_Ringbuffer874:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer876
NOP	
J	L_Sample_Ringbuffer311
NOP	
L__Sample_Ringbuffer876:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer878
NOP	
J	L_Sample_Ringbuffer312
NOP	
L__Sample_Ringbuffer878:
L_Sample_Ringbuffer291:
;Protocol.c,1185 :: 		}
L_Sample_Ringbuffer289:
;Protocol.c,1190 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer880
NOP	
J	L_Sample_Ringbuffer313
NOP	
L__Sample_Ringbuffer880:
;Protocol.c,1191 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,1192 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer314
NOP	
;Protocol.c,1193 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer316:
L_Sample_Ringbuffer317:
;Protocol.c,1194 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer318:
L_Sample_Ringbuffer319:
;Protocol.c,1195 :: 		case 'J':case 'j':
L_Sample_Ringbuffer320:
L_Sample_Ringbuffer321:
;Protocol.c,1196 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1197 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1201 :: 		break;
J	L_Sample_Ringbuffer315
NOP	
;Protocol.c,1202 :: 		case 'F':case 'f':
L_Sample_Ringbuffer322:
L_Sample_Ringbuffer323:
;Protocol.c,1203 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1204 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1208 :: 		break;
J	L_Sample_Ringbuffer315
NOP	
;Protocol.c,1210 :: 		}
L_Sample_Ringbuffer314:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer882
NOP	
J	L_Sample_Ringbuffer316
NOP	
L__Sample_Ringbuffer882:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer884
NOP	
J	L_Sample_Ringbuffer317
NOP	
L__Sample_Ringbuffer884:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer886
NOP	
J	L_Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer886:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer888
NOP	
J	L_Sample_Ringbuffer319
NOP	
L__Sample_Ringbuffer888:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer890
NOP	
J	L_Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer890:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer892
NOP	
J	L_Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer892:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer894
NOP	
J	L_Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer894:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer896
NOP	
J	L_Sample_Ringbuffer323
NOP	
L__Sample_Ringbuffer896:
L_Sample_Ringbuffer315:
;Protocol.c,1211 :: 		}
L_Sample_Ringbuffer313:
;Protocol.c,1215 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer898
NOP	
J	L_Sample_Ringbuffer324
NOP	
L__Sample_Ringbuffer898:
;Protocol.c,1216 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,1217 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,1218 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer325
NOP	
;Protocol.c,1219 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer327:
L_Sample_Ringbuffer328:
;Protocol.c,1220 :: 		case 'J':case 'j':
L_Sample_Ringbuffer329:
L_Sample_Ringbuffer330:
;Protocol.c,1221 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1222 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,1226 :: 		break;
J	L_Sample_Ringbuffer326
NOP	
;Protocol.c,1227 :: 		case 'F':case 'f':
L_Sample_Ringbuffer331:
L_Sample_Ringbuffer332:
;Protocol.c,1228 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1229 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1233 :: 		break;
J	L_Sample_Ringbuffer326
NOP	
;Protocol.c,1234 :: 		}
L_Sample_Ringbuffer325:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer900
NOP	
J	L_Sample_Ringbuffer327
NOP	
L__Sample_Ringbuffer900:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer902
NOP	
J	L_Sample_Ringbuffer328
NOP	
L__Sample_Ringbuffer902:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer904
NOP	
J	L_Sample_Ringbuffer329
NOP	
L__Sample_Ringbuffer904:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer906
NOP	
J	L_Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer906:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer908
NOP	
J	L_Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer908:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer910
NOP	
J	L_Sample_Ringbuffer332
NOP	
L__Sample_Ringbuffer910:
L_Sample_Ringbuffer326:
;Protocol.c,1235 :: 		}
L_Sample_Ringbuffer324:
;Protocol.c,1238 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer912
NOP	
J	L_Sample_Ringbuffer333
NOP	
L__Sample_Ringbuffer912:
;Protocol.c,1239 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,1240 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer334
NOP	
;Protocol.c,1241 :: 		case 'J':case 'j':
L_Sample_Ringbuffer336:
L_Sample_Ringbuffer337:
;Protocol.c,1242 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1243 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1247 :: 		break;
J	L_Sample_Ringbuffer335
NOP	
;Protocol.c,1248 :: 		case 'F':case 'f':
L_Sample_Ringbuffer338:
L_Sample_Ringbuffer339:
;Protocol.c,1249 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1250 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1254 :: 		break;
J	L_Sample_Ringbuffer335
NOP	
;Protocol.c,1256 :: 		}
L_Sample_Ringbuffer334:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer914
NOP	
J	L_Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer914:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer916
NOP	
J	L_Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer916:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer918
NOP	
J	L_Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer918:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer920
NOP	
J	L_Sample_Ringbuffer339
NOP	
L__Sample_Ringbuffer920:
L_Sample_Ringbuffer335:
;Protocol.c,1257 :: 		}
L_Sample_Ringbuffer333:
;Protocol.c,1258 :: 		}
L_Sample_Ringbuffer221:
;Protocol.c,1259 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer921
NOP	
J	L_Sample_Ringbuffer340
NOP	
L__Sample_Ringbuffer921:
; ?FLOC___Sample_Ringbuffer?T773 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T773 end address is: 8 (R2)
J	L_Sample_Ringbuffer341
NOP	
L_Sample_Ringbuffer340:
; ?FLOC___Sample_Ringbuffer?T773 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T773 end address is: 8 (R2)
L_Sample_Ringbuffer341:
; ?FLOC___Sample_Ringbuffer?T773 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T773 end address is: 8 (R2)
;Protocol.c,1260 :: 		break;
J	L_Sample_Ringbuffer218
NOP	
;Protocol.c,1261 :: 		case 'M':
L_Sample_Ringbuffer342:
;Protocol.c,1262 :: 		case 'm':
L_Sample_Ringbuffer343:
;Protocol.c,1264 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1265 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,1266 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,1272 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer923
NOP	
J	L_Sample_Ringbuffer344
NOP	
L__Sample_Ringbuffer923:
;Protocol.c,1273 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer345
NOP	
;Protocol.c,1274 :: 		case 'S':
L_Sample_Ringbuffer347:
;Protocol.c,1275 :: 		case 's':
L_Sample_Ringbuffer348:
;Protocol.c,1277 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1278 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,1279 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1283 :: 		}
J	L_Sample_Ringbuffer346
NOP	
L_Sample_Ringbuffer345:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer925
NOP	
J	L_Sample_Ringbuffer347
NOP	
L__Sample_Ringbuffer925:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer927
NOP	
J	L_Sample_Ringbuffer348
NOP	
L__Sample_Ringbuffer927:
L_Sample_Ringbuffer346:
;Protocol.c,1284 :: 		}
L_Sample_Ringbuffer344:
;Protocol.c,1285 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1286 :: 		break;
J	L_Sample_Ringbuffer218
NOP	
;Protocol.c,1287 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer349:
L_Sample_Ringbuffer350:
L_Sample_Ringbuffer351:
L_Sample_Ringbuffer352:
;Protocol.c,1288 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer353:
L_Sample_Ringbuffer354:
L_Sample_Ringbuffer355:
L_Sample_Ringbuffer356:
;Protocol.c,1289 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer357:
L_Sample_Ringbuffer358:
L_Sample_Ringbuffer359:
L_Sample_Ringbuffer360:
;Protocol.c,1290 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer928
NOP	
J	L_Sample_Ringbuffer361
NOP	
L__Sample_Ringbuffer928:
;Protocol.c,1291 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1292 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1293 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1297 :: 		}
L_Sample_Ringbuffer361:
;Protocol.c,1301 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer930
NOP	
J	L_Sample_Ringbuffer362
NOP	
L__Sample_Ringbuffer930:
;Protocol.c,1302 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,1303 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1304 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer363
NOP	
;Protocol.c,1305 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer365:
L_Sample_Ringbuffer366:
;Protocol.c,1306 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer367:
L_Sample_Ringbuffer368:
;Protocol.c,1307 :: 		case 'A':case 'a':
L_Sample_Ringbuffer369:
L_Sample_Ringbuffer370:
;Protocol.c,1308 :: 		case 'I':case 'i':
L_Sample_Ringbuffer371:
L_Sample_Ringbuffer372:
;Protocol.c,1309 :: 		case 'J':case 'j':
L_Sample_Ringbuffer373:
L_Sample_Ringbuffer374:
;Protocol.c,1310 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1311 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1315 :: 		break;
J	L_Sample_Ringbuffer364
NOP	
;Protocol.c,1316 :: 		case 'F':
L_Sample_Ringbuffer375:
;Protocol.c,1317 :: 		case 'f':
L_Sample_Ringbuffer376:
;Protocol.c,1320 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1321 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1326 :: 		break;
J	L_Sample_Ringbuffer364
NOP	
;Protocol.c,1327 :: 		}
L_Sample_Ringbuffer363:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer932
NOP	
J	L_Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer932:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer934
NOP	
J	L_Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer934:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer936
NOP	
J	L_Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer936:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer938
NOP	
J	L_Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer938:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer940
NOP	
J	L_Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer940:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer942
NOP	
J	L_Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer942:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer944
NOP	
J	L_Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer944:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer946
NOP	
J	L_Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer946:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer948
NOP	
J	L_Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer948:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer950
NOP	
J	L_Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer950:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer952
NOP	
J	L_Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer952:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer954
NOP	
J	L_Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer954:
L_Sample_Ringbuffer364:
;Protocol.c,1328 :: 		}
L_Sample_Ringbuffer362:
;Protocol.c,1329 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1330 :: 		break;
J	L_Sample_Ringbuffer218
NOP	
;Protocol.c,1331 :: 		case 'F':
L_Sample_Ringbuffer377:
;Protocol.c,1333 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer955
NOP	
J	L_Sample_Ringbuffer378
NOP	
L__Sample_Ringbuffer955:
;Protocol.c,1334 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1335 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1336 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1340 :: 		}
L_Sample_Ringbuffer378:
;Protocol.c,1341 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1342 :: 		break;
J	L_Sample_Ringbuffer218
NOP	
;Protocol.c,1343 :: 		}
L_Sample_Ringbuffer217:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer957
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer957:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer959
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer959:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer961
NOP	
J	L_Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer961:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer963
NOP	
J	L_Sample_Ringbuffer343
NOP	
L__Sample_Ringbuffer963:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer965
NOP	
J	L_Sample_Ringbuffer349
NOP	
L__Sample_Ringbuffer965:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer967
NOP	
J	L_Sample_Ringbuffer350
NOP	
L__Sample_Ringbuffer967:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer969
NOP	
J	L_Sample_Ringbuffer351
NOP	
L__Sample_Ringbuffer969:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer971
NOP	
J	L_Sample_Ringbuffer352
NOP	
L__Sample_Ringbuffer971:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer973
NOP	
J	L_Sample_Ringbuffer353
NOP	
L__Sample_Ringbuffer973:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer975
NOP	
J	L_Sample_Ringbuffer354
NOP	
L__Sample_Ringbuffer975:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer977
NOP	
J	L_Sample_Ringbuffer355
NOP	
L__Sample_Ringbuffer977:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer979
NOP	
J	L_Sample_Ringbuffer356
NOP	
L__Sample_Ringbuffer979:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer981
NOP	
J	L_Sample_Ringbuffer357
NOP	
L__Sample_Ringbuffer981:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer983
NOP	
J	L_Sample_Ringbuffer358
NOP	
L__Sample_Ringbuffer983:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer985
NOP	
J	L_Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer985:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer987
NOP	
J	L_Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer987:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer989
NOP	
J	L_Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer989:
L_Sample_Ringbuffer218:
;Protocol.c,973 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer472:
L__Sample_Ringbuffer471:
;Protocol.c,1344 :: 		}
L_Sample_Ringbuffer213:
;Protocol.c,1345 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,1351 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer990
NOP	
J	L_Sample_Ringbuffer379
NOP	
L__Sample_Ringbuffer990:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer380
NOP	
L_Sample_Ringbuffer379:
;Protocol.c,1352 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer991
NOP	
J	L_Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer991:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer382
NOP	
L_Sample_Ringbuffer381:
;Protocol.c,1353 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer992
NOP	
J	L_Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer992:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer384
NOP	
L_Sample_Ringbuffer383:
;Protocol.c,1354 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer993
NOP	
J	L_Sample_Ringbuffer385
NOP	
L__Sample_Ringbuffer993:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer386
NOP	
L_Sample_Ringbuffer385:
;Protocol.c,1355 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer994
NOP	
J	L_Sample_Ringbuffer387
NOP	
L__Sample_Ringbuffer994:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer388
NOP	
L_Sample_Ringbuffer387:
;Protocol.c,1356 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer995
NOP	
J	L_Sample_Ringbuffer389
NOP	
L__Sample_Ringbuffer995:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer390
NOP	
L_Sample_Ringbuffer389:
;Protocol.c,1357 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer996
NOP	
J	L_Sample_Ringbuffer391
NOP	
L__Sample_Ringbuffer996:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer392
NOP	
L_Sample_Ringbuffer391:
;Protocol.c,1358 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer997
NOP	
J	L_Sample_Ringbuffer393
NOP	
L__Sample_Ringbuffer997:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer394
NOP	
L_Sample_Ringbuffer393:
;Protocol.c,1359 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer998
NOP	
J	L_Sample_Ringbuffer395
NOP	
L__Sample_Ringbuffer998:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer395:
;Protocol.c,1360 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer999
NOP	
J	L_Sample_Ringbuffer397
NOP	
L__Sample_Ringbuffer999:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer397:
L_Sample_Ringbuffer394:
L_Sample_Ringbuffer392:
L_Sample_Ringbuffer390:
L_Sample_Ringbuffer388:
L_Sample_Ringbuffer386:
L_Sample_Ringbuffer384:
L_Sample_Ringbuffer382:
L_Sample_Ringbuffer380:
;Protocol.c,1363 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,1364 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,1367 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,1368 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,1371 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer1000
NOP	
J	L_Sample_Ringbuffer398
NOP	
L__Sample_Ringbuffer1000:
; ?FLOC___Sample_Ringbuffer?T886 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T886 end address is: 8 (R2)
J	L_Sample_Ringbuffer399
NOP	
L_Sample_Ringbuffer398:
; ?FLOC___Sample_Ringbuffer?T886 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T886 end address is: 8 (R2)
L_Sample_Ringbuffer399:
; ?FLOC___Sample_Ringbuffer?T886 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T886 end address is: 8 (R2)
;Protocol.c,1373 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,1375 :: 		}
L_Sample_Ringbuffer143:
;Protocol.c,1378 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,1379 :: 		}
;Protocol.c,1378 :: 		return status;
;Protocol.c,1379 :: 		}
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
