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
BNE	R2, R0, L__Str_Initialize476
NOP	
J	L_Str_Initialize1
NOP	
L__Str_Initialize476:
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
BNE	R2, R0, L_Protocol_strsplit479
NOP	
J	L_Protocol_strsplit4
NOP	
L_Protocol_strsplit479:
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
BNE	R3, R2, L_Protocol_strsplit481
NOP	
J	L_Protocol_strsplit401
NOP	
L_Protocol_strsplit481:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit483
NOP	
J	L_Protocol_strsplit400
NOP	
L_Protocol_strsplit483:
SEH	R2, R9
; err end address is: 36 (R9)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit484
NOP	
J	L_Protocol_strsplit399
NOP	
L_Protocol_strsplit484:
J	L_Protocol_strsplit8
NOP	
; lasti end address is: 28 (R7)
L_Protocol_strsplit401:
L_Protocol_strsplit400:
L_Protocol_strsplit399:
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
BEQ	R2, R0, L_Protocol_strsplit485
NOP	
J	L_Protocol_strsplit10
NOP	
L_Protocol_strsplit485:
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
BNE	R2, R0, L_Protocol_strsplit2487
NOP	
J	L_Protocol_strsplit2416
NOP	
L_Protocol_strsplit2487:
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
BNE	R3, R2, L_Protocol_strsplit2489
NOP	
J	L_Protocol_strsplit2407
NOP	
L_Protocol_strsplit2489:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_strsplit2491
NOP	
J	L_Protocol_strsplit2406
NOP	
L_Protocol_strsplit2491:
SEH	R2, R10
; err end address is: 40 (R10)
SLTI	R2, R2, 50
BNE	R2, R0, L_Protocol_strsplit2492
NOP	
J	L_Protocol_strsplit2405
NOP	
L_Protocol_strsplit2492:
J	L_Protocol_strsplit216
NOP	
; lasti end address is: 32 (R8)
L_Protocol_strsplit2407:
L_Protocol_strsplit2406:
L_Protocol_strsplit2405:
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
BEQ	R2, R0, L_Protocol_strsplit2493
NOP	
J	L_Protocol_strsplit2414
NOP	
L_Protocol_strsplit2493:
LBU	R2, 0(R26)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_strsplit2495
NOP	
J	L_Protocol_strsplit2415
NOP	
L_Protocol_strsplit2495:
L_Protocol_strsplit2403:
;Protocol.c,95 :: 		if(!track_char && *(str+i) > 0x39){
BEQ	R6, R0, L_Protocol_strsplit2496
NOP	
J	L_Protocol_strsplit2412
NOP	
L_Protocol_strsplit2496:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BEQ	R2, R0, L_Protocol_strsplit2497
NOP	
J	L_Protocol_strsplit2413
NOP	
L_Protocol_strsplit2497:
; lasti end address is: 32 (R8)
L_Protocol_strsplit2402:
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
J	L_Protocol_strsplit2409
NOP	
L_Protocol_strsplit2412:
SEH	R2, R8
SEH	R3, R9
L_Protocol_strsplit2409:
; lasti start address is: 8 (R2)
; ii start address is: 12 (R3)
; kk start address is: 28 (R7)
SH	R7, 4(SP)
; lasti end address is: 8 (R2)
; ii end address is: 12 (R3)
; kk end address is: 28 (R7)
SEH	R7, R2
LH	R2, 4(SP)
J	L_Protocol_strsplit2408
NOP	
L_Protocol_strsplit2413:
SEH	R2, R7
SEH	R7, R8
SEH	R3, R9
L_Protocol_strsplit2408:
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
J	L_Protocol_strsplit2411
NOP	
L_Protocol_strsplit2414:
L_Protocol_strsplit2411:
; lasti start address is: 32 (R8)
; ii start address is: 36 (R9)
; kk start address is: 28 (R7)
; lasti end address is: 32 (R8)
; ii end address is: 36 (R9)
; kk end address is: 28 (R7)
J	L_Protocol_strsplit2410
NOP	
L_Protocol_strsplit2415:
L_Protocol_strsplit2410:
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
BEQ	R2, R0, L_Protocol_strsplit2498
NOP	
J	L_Protocol_strsplit224
NOP	
L_Protocol_strsplit2498:
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
L_Protocol_strsplit2416:
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
BNE	R2, R0, L_Protocol_cpy_val_from_str501
NOP	
J	L_Protocol_cpy_val_from_str26
NOP	
L_Protocol_cpy_val_from_str501:
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
BNE	R2, R0, L_Protocol_str2int503
NOP	
J	L_Protocol_str2int28
NOP	
L_Protocol_str2int503:
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
BNE	R2, R0, L_Protocol_str2int505
NOP	
J	L_Protocol_str2int31
NOP	
L_Protocol_str2int505:
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
BNE	R2, R0, L__protocol_execute_runtime508
NOP	
J	L_protocol_execute_runtime32
NOP	
L__protocol_execute_runtime508:
;Protocol.c,206 :: 		int rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LH	R4, Offset(_sys+18)(GP)
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime510
NOP	
J	L__protocol_execute_runtime418
NOP	
L__protocol_execute_runtime510:
;Protocol.c,212 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,215 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime512
NOP	
J	L_protocol_execute_runtime34
NOP	
L__protocol_execute_runtime512:
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
L__protocol_execute_runtime417:
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
BNE	R2, R0, L__protocol_execute_runtime514
NOP	
J	L__protocol_execute_runtime417
NOP	
L__protocol_execute_runtime514:
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
L__protocol_execute_runtime418:
;Protocol.c,211 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Protocol.c,233 :: 		}
L_protocol_execute_runtime33:
;Protocol.c,236 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime516
NOP	
J	L_protocol_execute_runtime39
NOP	
L__protocol_execute_runtime516:
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
BNE	R2, R0, L__protocol_execute_runtime518
NOP	
J	L_protocol_execute_runtime40
NOP	
L__protocol_execute_runtime518:
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
BNE	R2, R0, L__protocol_execute_runtime520
NOP	
J	L_protocol_execute_runtime41
NOP	
L__protocol_execute_runtime520:
;Protocol.c,250 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,251 :: 		}
L_protocol_execute_runtime41:
;Protocol.c,255 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime522
NOP	
J	L_protocol_execute_runtime42
NOP	
L__protocol_execute_runtime522:
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
BNE	R2, R0, L__protocol_execute_runtime524
NOP	
J	L_protocol_execute_runtime43
NOP	
L__protocol_execute_runtime524:
;Protocol.c,262 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime526
NOP	
J	L_protocol_execute_runtime44
NOP	
L__protocol_execute_runtime526:
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
BNE	R2, R0, L__protocol_system_check529
NOP	
J	L_protocol_system_check45
NOP	
L__protocol_system_check529:
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
BNE	R2, R0, L__protocol_system_check531
NOP	
J	L_protocol_system_check46
NOP	
L__protocol_system_check531:
ORI	R2, R0, 1
SH	R2, Offset(_sys+16)(GP)
L_protocol_system_check46:
;Protocol.c,307 :: 		if (sys.state == STATE_INIT && bit_istrue(settings.flags,BITFLAG_HOMING_ENABLE)) { sys.state = STATE_ALARM; }
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__protocol_system_check532
NOP	
J	L__protocol_system_check421
NOP	
L__protocol_system_check532:
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_system_check534
NOP	
J	L__protocol_system_check420
NOP	
L__protocol_system_check534:
L__protocol_system_check419:
ORI	R2, R0, 6
SH	R2, Offset(_sys+2)(GP)
L__protocol_system_check421:
L__protocol_system_check420:
;Protocol.c,311 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__protocol_system_check535
NOP	
J	L_protocol_system_check50
NOP	
L__protocol_system_check535:
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
; dif start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,332 :: 		if(!dif){
BEQ	R2, R0, L__Sample_Gocde_Line537
NOP	
J	L_Sample_Gocde_Line52
NOP	
L__Sample_Gocde_Line537:
; dif end address is: 16 (R4)
;Protocol.c,340 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Gocde_Line539
NOP	
J	L_Sample_Gocde_Line53
NOP	
L__Sample_Gocde_Line539:
;Protocol.c,341 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,342 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Gocde_Line540
NOP	
J	L_Sample_Gocde_Line54
NOP	
L__Sample_Gocde_Line540:
;Protocol.c,349 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Gocde_Line541
NOP	
J	L_Sample_Gocde_Line55
NOP	
L__Sample_Gocde_Line541:
;Protocol.c,350 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Gocde_Line55:
;Protocol.c,352 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,354 :: 		}
L_Sample_Gocde_Line54:
;Protocol.c,355 :: 		}
L_Sample_Gocde_Line53:
;Protocol.c,356 :: 		}else{
J	L_Sample_Gocde_Line56
NOP	
L_Sample_Gocde_Line52:
;Protocol.c,359 :: 		Str_clear(str,64);
; dif start address is: 16 (R4)
ADDIU	R2, SP, 14
SH	R4, 12(SP)
ORI	R26, R0, 64
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
LH	R4, 12(SP)
;Protocol.c,361 :: 		Get_Line(str,dif);
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
LH	R4, 12(SP)
;Protocol.c,364 :: 		if(bit_isfalse(startup,bit(START_MSG))){
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BEQ	R2, R0, L__Sample_Gocde_Line542
NOP	
J	L_Sample_Gocde_Line57
NOP	
L__Sample_Gocde_Line542:
;Protocol.c,365 :: 		Do_Startup_Msg(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Startup_Msg+0
NOP	
;Protocol.c,366 :: 		}else if(bit_istrue(startup,bit(START_MSG))){
J	L_Sample_Gocde_Line58
NOP	
L_Sample_Gocde_Line57:
; dif start address is: 16 (R4)
LBU	R2, Offset(Protocol_startup+0)(GP)
ANDI	R2, R2, 1
ANDI	R2, R2, 255
BNE	R2, R0, L__Sample_Gocde_Line544
NOP	
J	L_Sample_Gocde_Line59
NOP	
L__Sample_Gocde_Line544:
;Protocol.c,368 :: 		int msg_type = Check_Query_Type(str,dif);
ADDIU	R2, SP, 14
SH	R4, 12(SP)
SEH	R26, R4
MOVZ	R25, R2, R0
JAL	Protocol_Check_Query_Type+0
NOP	
LH	R4, 12(SP)
;Protocol.c,371 :: 		if(msg_type == STATUS_GCODE){
SEH	R3, R2
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Gocde_Line545
NOP	
J	L_Sample_Gocde_Line60
NOP	
L__Sample_Gocde_Line545:
;Protocol.c,376 :: 		Do_Gcode(str,dif);
ADDIU	R2, SP, 14
SEH	R26, R4
; dif end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Protocol_Do_Gcode+0
NOP	
;Protocol.c,377 :: 		}
L_Sample_Gocde_Line60:
;Protocol.c,379 :: 		}
L_Sample_Gocde_Line59:
L_Sample_Gocde_Line58:
;Protocol.c,381 :: 		}
L_Sample_Gocde_Line56:
;Protocol.c,382 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Protocol.c,384 :: 		}
;Protocol.c,382 :: 		return STATUS_OK;
;Protocol.c,384 :: 		}
L_end_Sample_Gocde_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _Sample_Gocde_Line
Protocol_Do_Startup_Msg:
;Protocol.c,388 :: 		static void Do_Startup_Msg(char *str,int _dif_){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Protocol.c,391 :: 		for(i = 0;i <= _dif_;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Protocol_Do_Startup_Msg61:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R26
SLT	R2, R2, R3
BEQ	R2, R0, L_Protocol_Do_Startup_Msg547
NOP	
J	L_Protocol_Do_Startup_Msg62
NOP	
L_Protocol_Do_Startup_Msg547:
;Protocol.c,392 :: 		if(str[i] == '?'){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L_Protocol_Do_Startup_Msg548
NOP	
J	L_Protocol_Do_Startup_Msg64
NOP	
L_Protocol_Do_Startup_Msg548:
;Protocol.c,393 :: 		bit_true(startup,bit(START_MSG));
LBU	R2, Offset(Protocol_startup+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,394 :: 		report_init_message();
SH	R4, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
JAL	_report_init_message+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R4, 4(SP)
;Protocol.c,395 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,396 :: 		}
L_Protocol_Do_Startup_Msg64:
;Protocol.c,391 :: 		for(i = 0;i <= _dif_;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Protocol.c,397 :: 		}
; i end address is: 16 (R4)
J	L_Protocol_Do_Startup_Msg61
NOP	
L_Protocol_Do_Startup_Msg62:
;Protocol.c,398 :: 		}
L_end_Do_Startup_Msg:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Protocol_Do_Startup_Msg
Protocol_Check_Query_Type:
;Protocol.c,401 :: 		static int Check_Query_Type(char *str,int dif){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Protocol.c,409 :: 		if(str[0] == '$'){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BEQ	R3, R2, L_Protocol_Check_Query_Type550
NOP	
J	L_Protocol_Check_Query_Type65
NOP	
L_Protocol_Check_Query_Type550:
;Protocol.c,410 :: 		switch(str[1]){
ADDIU	R2, R25, 1
SW	R2, 40(SP)
J	L_Protocol_Check_Query_Type66
NOP	
;Protocol.c,411 :: 		case '\r' :case '\n' :
L_Protocol_Check_Query_Type68:
L_Protocol_Check_Query_Type69:
;Protocol.c,412 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,413 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,414 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,415 :: 		case '$': // Prints Grbl setting
L_Protocol_Check_Query_Type70:
;Protocol.c,416 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,417 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,418 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,419 :: 		case '#' : // Print gcode parameters
L_Protocol_Check_Query_Type71:
;Protocol.c,420 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,421 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,422 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,423 :: 		case 'G' : // Prints gcode parser state
L_Protocol_Check_Query_Type72:
;Protocol.c,424 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,425 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,426 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,427 :: 		case 'C' : // Set check g-code mode
L_Protocol_Check_Query_Type73:
;Protocol.c,428 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,436 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L_Protocol_Check_Query_Type551
NOP	
J	L_Protocol_Check_Query_Type74
NOP	
L_Protocol_Check_Query_Type551:
;Protocol.c,437 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,438 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,439 :: 		} else {
J	L_Protocol_Check_Query_Type75
NOP	
L_Protocol_Check_Query_Type74:
;Protocol.c,440 :: 		if (sys.state) { status = STATUS_IDLE_ERROR; }
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type553
NOP	
J	L_Protocol_Check_Query_Type76
NOP	
L_Protocol_Check_Query_Type553:
ORI	R2, R0, 11
SH	R2, 24(SP)
L_Protocol_Check_Query_Type76:
;Protocol.c,441 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,442 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,443 :: 		}
L_Protocol_Check_Query_Type75:
;Protocol.c,444 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,445 :: 		case 'X' : // Disable alarm lock
L_Protocol_Check_Query_Type77:
;Protocol.c,446 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L_Protocol_Check_Query_Type554
NOP	
J	L_Protocol_Check_Query_Type78
NOP	
L_Protocol_Check_Query_Type554:
;Protocol.c,447 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,448 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,450 :: 		}
L_Protocol_Check_Query_Type78:
;Protocol.c,451 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,452 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,453 :: 		case 'H' : // Perform homing cycle $H
L_Protocol_Check_Query_Type79:
;Protocol.c,454 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,455 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L_Protocol_Check_Query_Type556
NOP	
J	L_Protocol_Check_Query_Type80
NOP	
L_Protocol_Check_Query_Type556:
;Protocol.c,456 :: 		int axis_to_home = 0;
;Protocol.c,459 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type558
NOP	
J	L_Protocol_Check_Query_Type427
NOP	
L_Protocol_Check_Query_Type558:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_Protocol_Check_Query_Type560
NOP	
J	L_Protocol_Check_Query_Type426
NOP	
L_Protocol_Check_Query_Type560:
J	L_Protocol_Check_Query_Type83
NOP	
L_Protocol_Check_Query_Type427:
L_Protocol_Check_Query_Type426:
;Protocol.c,460 :: 		int i = 0;
;Protocol.c,461 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,464 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,465 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Protocol_Check_Query_Type84:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L_Protocol_Check_Query_Type561
NOP	
J	L_Protocol_Check_Query_Type85
NOP	
L_Protocol_Check_Query_Type561:
;Protocol.c,466 :: 		Set_Axisword(i);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,465 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,466 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Protocol_Check_Query_Type84
NOP	
L_Protocol_Check_Query_Type85:
;Protocol.c,469 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Protocol_Check_Query_Type563
NOP	
J	L_Protocol_Check_Query_Type87
NOP	
L_Protocol_Check_Query_Type563:
;Protocol.c,470 :: 		status = ALARM_ABORT_CYCLE;
ORI	R2, R0, 65534
SH	R2, 24(SP)
;Protocol.c,471 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,472 :: 		}
L_Protocol_Check_Query_Type87:
;Protocol.c,473 :: 		} else {
J	L_Protocol_Check_Query_Type88
NOP	
L_Protocol_Check_Query_Type83:
;Protocol.c,474 :: 		status = STATUS_IDLE_ERROR;
ORI	R2, R0, 11
SH	R2, 24(SP)
;Protocol.c,475 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,476 :: 		}
L_Protocol_Check_Query_Type88:
;Protocol.c,477 :: 		} else {
J	L_Protocol_Check_Query_Type89
NOP	
L_Protocol_Check_Query_Type80:
;Protocol.c,478 :: 		status = STATUS_SETTING_DISABLED;
ORI	R2, R0, 7
SH	R2, 24(SP)
;Protocol.c,479 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,480 :: 		}
L_Protocol_Check_Query_Type89:
;Protocol.c,483 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,484 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,485 :: 		case 'N' : // Startup lines. $N
L_Protocol_Check_Query_Type90:
;Protocol.c,486 :: 		if ( str[2] < 0x20 ) { // Print startup lines
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BNE	R2, R0, L_Protocol_Check_Query_Type564
NOP	
J	L_Protocol_Check_Query_Type91
NOP	
L_Protocol_Check_Query_Type564:
;Protocol.c,487 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Protocol_Check_Query_Type92:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L_Protocol_Check_Query_Type565
NOP	
J	L_Protocol_Check_Query_Type93
NOP	
L_Protocol_Check_Query_Type565:
;Protocol.c,488 :: 		if ((settings_read_startup_line(helper_var, str))) {
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
BNE	R2, R0, L_Protocol_Check_Query_Type567
NOP	
J	L_Protocol_Check_Query_Type95
NOP	
L_Protocol_Check_Query_Type567:
;Protocol.c,489 :: 		report_status_message(STATUS_SETTING_READ_FAIL);
SH	R3, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 10
JAL	_report_status_message+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R3, 16(SP)
;Protocol.c,490 :: 		} else {
J	L_Protocol_Check_Query_Type96
NOP	
L_Protocol_Check_Query_Type95:
;Protocol.c,491 :: 		report_startup_line(helper_var,str);
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
;Protocol.c,492 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,493 :: 		}
L_Protocol_Check_Query_Type96:
;Protocol.c,487 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,498 :: 		}
; helper_var end address is: 12 (R3)
J	L_Protocol_Check_Query_Type92
NOP	
L_Protocol_Check_Query_Type93:
;Protocol.c,499 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,500 :: 		}else { // Store startup line
L_Protocol_Check_Query_Type91:
;Protocol.c,501 :: 		int N_Val = 0;
;Protocol.c,502 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,507 :: 		if ( str[2] >= '0'  &&  str[2] <= '9' ) {
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 48
BEQ	R2, R0, L_Protocol_Check_Query_Type568
NOP	
J	L_Protocol_Check_Query_Type429
NOP	
L_Protocol_Check_Query_Type568:
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 58
BNE	R2, R0, L_Protocol_Check_Query_Type569
NOP	
J	L_Protocol_Check_Query_Type428
NOP	
L_Protocol_Check_Query_Type569:
L_Protocol_Check_Query_Type424:
;Protocol.c,508 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
;Protocol.c,510 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 26
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,511 :: 		N_Val = atoi(num);
SW	R25, 16(SP)
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,518 :: 		}else {
J	L_Protocol_Check_Query_Type101
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,507 :: 		if ( str[2] >= '0'  &&  str[2] <= '9' ) {
L_Protocol_Check_Query_Type429:
L_Protocol_Check_Query_Type428:
;Protocol.c,520 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,521 :: 		}
L_Protocol_Check_Query_Type101:
;Protocol.c,524 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L_Protocol_Check_Query_Type571
NOP	
J	L_Protocol_Check_Query_Type102
NOP	
L_Protocol_Check_Query_Type571:
; helper_var end address is: 28 (R7)
;Protocol.c,525 :: 		int str_len = 0;
;Protocol.c,526 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type573
NOP	
J	L_Protocol_Check_Query_Type103
NOP	
L_Protocol_Check_Query_Type573:
; N_Val end address is: 16 (R4)
;Protocol.c,529 :: 		helper_var = strlen((gcode[0]));
SW	R25, 16(SP)
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
LW	R25, 16(SP)
;Protocol.c,530 :: 		strncpy(str,(gcode[0]),helper_var);
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
JAL	_strncpy+0
NOP	
;Protocol.c,538 :: 		str_len = strlen(str);
JAL	_strlen+0
NOP	
;Protocol.c,543 :: 		}else{
J	L_Protocol_Check_Query_Type104
NOP	
L_Protocol_Check_Query_Type103:
;Protocol.c,544 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,552 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, R25, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,553 :: 		}
L_Protocol_Check_Query_Type104:
;Protocol.c,555 :: 		}
L_Protocol_Check_Query_Type102:
;Protocol.c,557 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,558 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,559 :: 		case '~': //*~ (cycle start)
L_Protocol_Check_Query_Type105:
;Protocol.c,560 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,561 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,562 :: 		case '!': //*! (feed hold)
L_Protocol_Check_Query_Type106:
;Protocol.c,563 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,564 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,565 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Protocol_Check_Query_Type107:
;Protocol.c,566 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,567 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,568 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Protocol_Check_Query_Type108:
L_Protocol_Check_Query_Type109:
L_Protocol_Check_Query_Type110:
L_Protocol_Check_Query_Type111:
L_Protocol_Check_Query_Type112:
L_Protocol_Check_Query_Type113:
;Protocol.c,569 :: 		case '6': case '7': case '8': case '9':
L_Protocol_Check_Query_Type114:
L_Protocol_Check_Query_Type115:
L_Protocol_Check_Query_Type116:
L_Protocol_Check_Query_Type117:
;Protocol.c,573 :: 		if((str[2] == '=')||(str[3] == '=')){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type575
NOP	
J	L_Protocol_Check_Query_Type431
NOP	
L_Protocol_Check_Query_Type575:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L_Protocol_Check_Query_Type577
NOP	
J	L_Protocol_Check_Query_Type430
NOP	
L_Protocol_Check_Query_Type577:
J	L_Protocol_Check_Query_Type120
NOP	
L_Protocol_Check_Query_Type431:
L_Protocol_Check_Query_Type430:
;Protocol.c,574 :: 		char str_val[9]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
ORI	R24, R24, lo_addr(?ICSProtocol_Check_Query_Type_str_val_L3+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,575 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,576 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,577 :: 		if(str[2] == '='){
ADDIU	R2, R25, 2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type578
NOP	
J	L_Protocol_Check_Query_Type121
NOP	
L_Protocol_Check_Query_Type578:
;Protocol.c,579 :: 		strncpy(str_val,(str+1),1);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,580 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
LW	R25, 16(SP)
BNE	R2, R0, L_Protocol_Check_Query_Type580
NOP	
J	L_Protocol_Check_Query_Type434
NOP	
L_Protocol_Check_Query_Type580:
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
J	L_Protocol_Check_Query_Type122
NOP	
L_Protocol_Check_Query_Type434:
L_Protocol_Check_Query_Type122:
;Protocol.c,581 :: 		strncpy(str_val,(str+3),strlen((str+3)));
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
;Protocol.c,582 :: 		}else if(str[3] == '='){
SEH	R7, R6
J	L_Protocol_Check_Query_Type123
NOP	
L_Protocol_Check_Query_Type121:
ADDIU	R2, R25, 3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BEQ	R3, R2, L_Protocol_Check_Query_Type581
NOP	
J	L_Protocol_Check_Query_Type436
NOP	
L_Protocol_Check_Query_Type581:
;Protocol.c,584 :: 		strncpy(str_val,(str+1),2);
ADDIU	R3, R25, 1
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 2
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,585 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
ADDIU	R2, SP, 28
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
ADDIU	R2, SP, 28
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Protocol_Check_Query_Type125
NOP	
L_Protocol_Check_Query_Type435:
SEH	R5, R6
L_Protocol_Check_Query_Type125:
;Protocol.c,586 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 28
SW	R25, 16(SP)
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
;Protocol.c,587 :: 		strncpy(str_val,(str+4),strlen((str+4)));
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
;Protocol.c,588 :: 		}
J	L_Protocol_Check_Query_Type124
NOP	
L_Protocol_Check_Query_Type436:
;Protocol.c,582 :: 		}else if(str[3] == '='){
SEH	R7, R6
;Protocol.c,588 :: 		}
L_Protocol_Check_Query_Type124:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Protocol_Check_Query_Type123:
;Protocol.c,591 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Protocol_Check_Query_Type584
NOP	
J	L_Protocol_Check_Query_Type433
NOP	
L_Protocol_Check_Query_Type584:
; value end address is: 8 (R2)
ADDIU	R2, SP, 28
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L_Protocol_Check_Query_Type586
NOP	
J	L_Protocol_Check_Query_Type432
NOP	
L_Protocol_Check_Query_Type586:
J	L_Protocol_Check_Query_Type128
NOP	
L_Protocol_Check_Query_Type433:
L_Protocol_Check_Query_Type432:
;Protocol.c,592 :: 		status = STATUS_UNSUPPORTED_STATEMENT;
ORI	R2, R0, 3
SH	R2, 24(SP)
;Protocol.c,593 :: 		}
L_Protocol_Check_Query_Type128:
;Protocol.c,594 :: 		value = atof(str_val);
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,599 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,600 :: 		status = STATUS_OK;
SH	R0, 24(SP)
;Protocol.c,601 :: 		}
L_Protocol_Check_Query_Type120:
;Protocol.c,602 :: 		break;
J	L_Protocol_Check_Query_Type67
NOP	
;Protocol.c,603 :: 		}
L_Protocol_Check_Query_Type66:
LW	R4, 40(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L_Protocol_Check_Query_Type588
NOP	
J	L_Protocol_Check_Query_Type68
NOP	
L_Protocol_Check_Query_Type588:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L_Protocol_Check_Query_Type590
NOP	
J	L_Protocol_Check_Query_Type69
NOP	
L_Protocol_Check_Query_Type590:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 36
BNE	R3, R2, L_Protocol_Check_Query_Type592
NOP	
J	L_Protocol_Check_Query_Type70
NOP	
L_Protocol_Check_Query_Type592:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 35
BNE	R3, R2, L_Protocol_Check_Query_Type594
NOP	
J	L_Protocol_Check_Query_Type71
NOP	
L_Protocol_Check_Query_Type594:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 71
BNE	R3, R2, L_Protocol_Check_Query_Type596
NOP	
J	L_Protocol_Check_Query_Type72
NOP	
L_Protocol_Check_Query_Type596:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 67
BNE	R3, R2, L_Protocol_Check_Query_Type598
NOP	
J	L_Protocol_Check_Query_Type73
NOP	
L_Protocol_Check_Query_Type598:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L_Protocol_Check_Query_Type600
NOP	
J	L_Protocol_Check_Query_Type77
NOP	
L_Protocol_Check_Query_Type600:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 72
BNE	R3, R2, L_Protocol_Check_Query_Type602
NOP	
J	L_Protocol_Check_Query_Type79
NOP	
L_Protocol_Check_Query_Type602:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 78
BNE	R3, R2, L_Protocol_Check_Query_Type604
NOP	
J	L_Protocol_Check_Query_Type90
NOP	
L_Protocol_Check_Query_Type604:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 126
BNE	R3, R2, L_Protocol_Check_Query_Type606
NOP	
J	L_Protocol_Check_Query_Type105
NOP	
L_Protocol_Check_Query_Type606:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 33
BNE	R3, R2, L_Protocol_Check_Query_Type608
NOP	
J	L_Protocol_Check_Query_Type106
NOP	
L_Protocol_Check_Query_Type608:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 24
BNE	R3, R2, L_Protocol_Check_Query_Type610
NOP	
J	L_Protocol_Check_Query_Type107
NOP	
L_Protocol_Check_Query_Type610:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BNE	R3, R2, L_Protocol_Check_Query_Type612
NOP	
J	L_Protocol_Check_Query_Type108
NOP	
L_Protocol_Check_Query_Type612:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BNE	R3, R2, L_Protocol_Check_Query_Type614
NOP	
J	L_Protocol_Check_Query_Type109
NOP	
L_Protocol_Check_Query_Type614:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BNE	R3, R2, L_Protocol_Check_Query_Type616
NOP	
J	L_Protocol_Check_Query_Type110
NOP	
L_Protocol_Check_Query_Type616:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 51
BNE	R3, R2, L_Protocol_Check_Query_Type618
NOP	
J	L_Protocol_Check_Query_Type111
NOP	
L_Protocol_Check_Query_Type618:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 52
BNE	R3, R2, L_Protocol_Check_Query_Type620
NOP	
J	L_Protocol_Check_Query_Type112
NOP	
L_Protocol_Check_Query_Type620:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 53
BNE	R3, R2, L_Protocol_Check_Query_Type622
NOP	
J	L_Protocol_Check_Query_Type113
NOP	
L_Protocol_Check_Query_Type622:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 54
BNE	R3, R2, L_Protocol_Check_Query_Type624
NOP	
J	L_Protocol_Check_Query_Type114
NOP	
L_Protocol_Check_Query_Type624:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 55
BNE	R3, R2, L_Protocol_Check_Query_Type626
NOP	
J	L_Protocol_Check_Query_Type115
NOP	
L_Protocol_Check_Query_Type626:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 56
BNE	R3, R2, L_Protocol_Check_Query_Type628
NOP	
J	L_Protocol_Check_Query_Type116
NOP	
L_Protocol_Check_Query_Type628:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 57
BNE	R3, R2, L_Protocol_Check_Query_Type630
NOP	
J	L_Protocol_Check_Query_Type117
NOP	
L_Protocol_Check_Query_Type630:
L_Protocol_Check_Query_Type67:
;Protocol.c,606 :: 		if(!SV.homed)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L_Protocol_Check_Query_Type631
NOP	
J	L_Protocol_Check_Query_Type129
NOP	
L_Protocol_Check_Query_Type631:
;Protocol.c,607 :: 		report_status_message(status);
LH	R25, 24(SP)
JAL	_report_status_message+0
NOP	
L_Protocol_Check_Query_Type129:
;Protocol.c,609 :: 		return status;
LH	R2, 24(SP)
J	L_end_Check_Query_Type
NOP	
;Protocol.c,610 :: 		}else
L_Protocol_Check_Query_Type65:
;Protocol.c,611 :: 		return STATUS_GCODE;
ORI	R2, R0, 20
;Protocol.c,614 :: 		}
;Protocol.c,611 :: 		return STATUS_GCODE;
;Protocol.c,614 :: 		}
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
;Protocol.c,617 :: 		static int Do_Gcode(char *str,int dif){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Protocol.c,620 :: 		int num_of_strings = strsplit2(gcode,str,0x20);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 32
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
; num_of_strings start address is: 16 (R4)
SEH	R4, R2
; num_of_strings end address is: 16 (R4)
;Protocol.c,622 :: 		while(DMA_IsOn(1));
L_Protocol_Do_Gcode131:
; num_of_strings start address is: 16 (R4)
SH	R4, 16(SP)
SH	R26, 18(SP)
SW	R25, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 20(SP)
LH	R26, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L_Protocol_Do_Gcode634
NOP	
J	L_Protocol_Do_Gcode132
NOP	
L_Protocol_Do_Gcode634:
J	L_Protocol_Do_Gcode131
NOP	
L_Protocol_Do_Gcode132:
;Protocol.c,630 :: 		%s:=\n"
ADDIU	R23, SP, 24
ADDIU	R22, R23, 45
LUI	R24, hi_addr(?ICSProtocol_?lstr1_Protocol+0)
ORI	R24, R24, lo_addr(?ICSProtocol_?lstr1_Protocol+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 24
;Protocol.c,637 :: 		,gcode[5]);
LUI	R2, hi_addr(_gcode+320)
ORI	R2, R2, lo_addr(_gcode+320)
SH	R26, 16(SP)
SW	R25, 20(SP)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
;Protocol.c,636 :: 		,gcode[4]
LUI	R2, hi_addr(_gcode+256)
ORI	R2, R2, lo_addr(_gcode+256)
SW	R2, 24(SP)
;Protocol.c,635 :: 		,gcode[3]
LUI	R2, hi_addr(_gcode+192)
ORI	R2, R2, lo_addr(_gcode+192)
SW	R2, 20(SP)
;Protocol.c,634 :: 		,gcode[2]
LUI	R2, hi_addr(_gcode+128)
ORI	R2, R2, lo_addr(_gcode+128)
SW	R2, 16(SP)
;Protocol.c,633 :: 		,gcode[1]
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
SW	R2, 12(SP)
;Protocol.c,632 :: 		,gcode[0]
LUI	R2, hi_addr(_gcode+0)
ORI	R2, R2, lo_addr(_gcode+0)
SW	R2, 8(SP)
;Protocol.c,631 :: 		,num_of_strings
SH	R4, 4(SP)
; num_of_strings end address is: 16 (R4)
;Protocol.c,630 :: 		%s:=\n"
SW	R3, 0(SP)
;Protocol.c,637 :: 		,gcode[5]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 32
LW	R25, 20(SP)
LH	R26, 16(SP)
;Protocol.c,639 :: 		}
L_end_Do_Gcode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of Protocol_Do_Gcode
_Sample_Ringbuffer:
;Protocol.c,645 :: 		int Sample_Ringbuffer(){
ADDIU	SP, SP, -128
SW	RA, 0(SP)
;Protocol.c,655 :: 		int F_1_Once=0,no_of_axis=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;Protocol.c,656 :: 		int axis_to_run = 0;
;Protocol.c,663 :: 		dif = Get_Difference();
JAL	_Get_Difference+0
NOP	
; dif start address is: 20 (R5)
SEH	R5, R2
;Protocol.c,666 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BNE	R2, R0, L__Sample_Ringbuffer637
NOP	
J	L__Sample_Ringbuffer448
NOP	
L__Sample_Ringbuffer637:
LBU	R2, Offset(Protocol_startup+0)(GP)
BEQ	R2, R0, L__Sample_Ringbuffer638
NOP	
J	L__Sample_Ringbuffer447
NOP	
L__Sample_Ringbuffer638:
; dif end address is: 20 (R5)
L__Sample_Ringbuffer446:
;Protocol.c,667 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,668 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LH	R3, Offset(_sys+18)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,669 :: 		report_realtime_status();
JAL	_report_realtime_status+0
NOP	
;Protocol.c,670 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,666 :: 		if(bit_istrue(sys.execute,EXEC_STATUS_REPORT)&& !startup){
L__Sample_Ringbuffer448:
; dif start address is: 20 (R5)
L__Sample_Ringbuffer447:
;Protocol.c,673 :: 		if(dif == 0){
SEH	R2, R5
BEQ	R2, R0, L__Sample_Ringbuffer639
NOP	
J	L_Sample_Ringbuffer136
NOP	
L__Sample_Ringbuffer639:
; dif end address is: 20 (R5)
;Protocol.c,675 :: 		if(DMA0_ReadDstPtr()){
JAL	_DMA0_ReadDstPtr+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer641
NOP	
J	L_Sample_Ringbuffer137
NOP	
L__Sample_Ringbuffer641:
;Protocol.c,676 :: 		ptr = (char*)RXBUFF;
; ptr start address is: 12 (R3)
LUI	R3, 40960
ORI	R3, R3, 8192
;Protocol.c,677 :: 		if(*ptr == '?'){
LBU	R2, 0(R3)
; ptr end address is: 12 (R3)
ANDI	R3, R2, 255
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer642
NOP	
J	L_Sample_Ringbuffer138
NOP	
L__Sample_Ringbuffer642:
;Protocol.c,682 :: 		DMA_Abort(0);
MOVZ	R25, R0, R0
JAL	_DMA_Abort+0
NOP	
;Protocol.c,683 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer643
NOP	
J	L_Sample_Ringbuffer139
NOP	
L__Sample_Ringbuffer643:
;Protocol.c,684 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer139:
;Protocol.c,685 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,686 :: 		}
L_Sample_Ringbuffer138:
;Protocol.c,687 :: 		}
L_Sample_Ringbuffer137:
;Protocol.c,688 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,689 :: 		}else if(dif > 0){
L_Sample_Ringbuffer136:
; dif start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer644
NOP	
J	L_Sample_Ringbuffer141
NOP	
L__Sample_Ringbuffer644:
;Protocol.c,690 :: 		int modal_response = 0;
;Protocol.c,691 :: 		F_1_Once = no_of_axis = query = 0 ; //for buffer and axis refreshing
SH	R0, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,693 :: 		Str_clear(str,str_len+2);    //reset the string to empty
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
ADDIU	R3, R2, 2
ADDIU	R2, SP, 34
SEH	R26, R3
MOVZ	R25, R2, R0
JAL	_Str_clear+0
NOP	
;Protocol.c,694 :: 		Get_Line(str,dif);         //get the line sent from PC
ADDIU	R2, SP, 34
SEH	R26, R5
; dif end address is: 20 (R5)
MOVZ	R25, R2, R0
JAL	_Get_Line+0
NOP	
;Protocol.c,695 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,700 :: 		num_of_strings = strsplit2(gcode,str,0x20);
ADDIU	R2, SP, 34
ORI	R27, R0, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	Protocol_strsplit2+0
NOP	
;Protocol.c,702 :: 		str_len = strlen(gcode[0]);
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,724 :: 		if(DCH0DAT == '?'){
LW	R3, Offset(DCH0DAT+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer645
NOP	
J	L_Sample_Ringbuffer142
NOP	
L__Sample_Ringbuffer645:
;Protocol.c,729 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Protocol.c,730 :: 		DCH0DAT = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Protocol.c,731 :: 		status = STATUS_OK;
SH	R0, 28(SP)
;Protocol.c,732 :: 		startup = 1;
ORI	R2, R0, 1
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,733 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,734 :: 		}
L_Sample_Ringbuffer142:
;Protocol.c,743 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,746 :: 		if(gcode[0][0] =='?'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 63
BEQ	R3, R2, L__Sample_Ringbuffer646
NOP	
J	L_Sample_Ringbuffer143
NOP	
L__Sample_Ringbuffer646:
;Protocol.c,747 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,748 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer647
NOP	
J	L_Sample_Ringbuffer144
NOP	
L__Sample_Ringbuffer647:
;Protocol.c,749 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer144:
;Protocol.c,750 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,751 :: 		}else if(gcode[0][0] =='$'){
L_Sample_Ringbuffer143:
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 36
BEQ	R3, R2, L__Sample_Ringbuffer648
NOP	
J	L_Sample_Ringbuffer146
NOP	
L__Sample_Ringbuffer648:
;Protocol.c,753 :: 		if(str_len < 2){
LH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer649
NOP	
J	L_Sample_Ringbuffer147
NOP	
L__Sample_Ringbuffer649:
;Protocol.c,754 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,755 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,756 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,757 :: 		}
L_Sample_Ringbuffer147:
;Protocol.c,758 :: 		switch(gcode[0][1]){
J	L_Sample_Ringbuffer148
NOP	
;Protocol.c,759 :: 		case '?': // Prints Grbl setting
L_Sample_Ringbuffer150:
;Protocol.c,760 :: 		report_grbl_help();
JAL	_report_grbl_help+0
NOP	
;Protocol.c,761 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,762 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,763 :: 		case '$': // Prints Grbl setting
L_Sample_Ringbuffer151:
;Protocol.c,764 :: 		report_grbl_settings();
JAL	_report_grbl_settings+0
NOP	
;Protocol.c,765 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,766 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,767 :: 		case '#' : // Print gcode parameters
L_Sample_Ringbuffer152:
;Protocol.c,768 :: 		report_gcode_parameters();
JAL	_report_gcode_parameters+0
NOP	
;Protocol.c,769 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,770 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,771 :: 		case 'G' : // Prints gcode parser state
L_Sample_Ringbuffer153:
;Protocol.c,772 :: 		startup = 0;
SB	R0, Offset(Protocol_startup+0)(GP)
;Protocol.c,773 :: 		report_gcode_modes();
JAL	_report_gcode_modes+0
NOP	
;Protocol.c,776 :: 		if(bit_isfalse(sys.execute,EXEC_STATUS_REPORT))
LH	R2, Offset(_sys+18)(GP)
ANDI	R2, R2, 1
SEH	R2, R2
BEQ	R2, R0, L__Sample_Ringbuffer650
NOP	
J	L_Sample_Ringbuffer154
NOP	
L__Sample_Ringbuffer650:
;Protocol.c,777 :: 		bit_true(sys.execute,EXEC_STATUS_REPORT);
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_sys+18)(GP)
L_Sample_Ringbuffer154:
;Protocol.c,778 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,779 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,780 :: 		case 'C' : // Set check g-code mode
L_Sample_Ringbuffer155:
;Protocol.c,781 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,785 :: 		if ( sys.state == STATE_CHECK_MODE ) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer651
NOP	
J	L_Sample_Ringbuffer156
NOP	
L__Sample_Ringbuffer651:
;Protocol.c,786 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,787 :: 		report_feedback_message(MESSAGE_DISABLED);
ORI	R25, R0, 5
JAL	_report_feedback_message+0
NOP	
;Protocol.c,788 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,789 :: 		} else {
L_Sample_Ringbuffer156:
;Protocol.c,791 :: 		if (sys.state) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer653
NOP	
J	L_Sample_Ringbuffer158
NOP	
L__Sample_Ringbuffer653:
;Protocol.c,792 :: 		query = 4;
ORI	R2, R0, 4
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,793 :: 		goto report;//return(STATUS_IDLE_ERROR);
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,794 :: 		}
L_Sample_Ringbuffer158:
;Protocol.c,796 :: 		sys.state = STATE_CHECK_MODE;
ORI	R2, R0, 7
SH	R2, Offset(_sys+2)(GP)
;Protocol.c,797 :: 		report_feedback_message(MESSAGE_ENABLED);
ORI	R25, R0, 4
JAL	_report_feedback_message+0
NOP	
;Protocol.c,799 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,800 :: 		goto report;
J	___Sample_Ringbuffer_report
NOP	
;Protocol.c,802 :: 		case 'X' : // Disable alarm lock
L_Sample_Ringbuffer159:
;Protocol.c,803 :: 		startup = 2; //for 1st scan to get ugs to connect
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,804 :: 		if (sys.state == STATE_ALARM) {
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer654
NOP	
J	L_Sample_Ringbuffer160
NOP	
L__Sample_Ringbuffer654:
;Protocol.c,805 :: 		report_feedback_message(MESSAGE_ALARM_UNLOCK);
ORI	R25, R0, 3
JAL	_report_feedback_message+0
NOP	
;Protocol.c,806 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Protocol.c,808 :: 		}
L_Sample_Ringbuffer160:
;Protocol.c,809 :: 		query = 1; //status ok response
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,810 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,811 :: 		case 'H' : // Perform homing cycle $H
L_Sample_Ringbuffer161:
;Protocol.c,812 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,814 :: 		if (bit_istrue(settings.flags,FLAG_HOMING_ENABLE)) {
LHU	R2, Offset(_settings+42)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 65535
BNE	R2, R0, L__Sample_Ringbuffer656
NOP	
J	L_Sample_Ringbuffer162
NOP	
L__Sample_Ringbuffer656:
;Protocol.c,815 :: 		int axis_to_home = 0;
;Protocol.c,818 :: 		if ( sys.state==STATE_IDLE || sys.state==STATE_ALARM ) {
LH	R2, Offset(_sys+2)(GP)
BNE	R2, R0, L__Sample_Ringbuffer658
NOP	
J	L__Sample_Ringbuffer450
NOP	
L__Sample_Ringbuffer658:
LH	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__Sample_Ringbuffer660
NOP	
J	L__Sample_Ringbuffer449
NOP	
L__Sample_Ringbuffer660:
J	L_Sample_Ringbuffer165
NOP	
L__Sample_Ringbuffer450:
L__Sample_Ringbuffer449:
;Protocol.c,819 :: 		int i = 0;
;Protocol.c,820 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Protocol.c,823 :: 		Set_modalgroup(HOME_ALL);
ORI	R25, R0, 10
JAL	_Set_modalgroup+0
NOP	
;Protocol.c,824 :: 		for(i=0;i<=NoOfAxis;i++)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Sample_Ringbuffer166:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer661
NOP	
J	L_Sample_Ringbuffer167
NOP	
L__Sample_Ringbuffer661:
;Protocol.c,825 :: 		Set_Axisword(i);
SH	R3, 20(SP)
SEH	R25, R3
JAL	_Set_Axisword+0
NOP	
LH	R3, 20(SP)
;Protocol.c,824 :: 		for(i=0;i<=NoOfAxis;i++)
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,825 :: 		Set_Axisword(i);
; i end address is: 12 (R3)
J	L_Sample_Ringbuffer166
NOP	
L_Sample_Ringbuffer167:
;Protocol.c,828 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L__Sample_Ringbuffer663
NOP	
J	L_Sample_Ringbuffer169
NOP	
L__Sample_Ringbuffer663:
;Protocol.c,829 :: 		query = 5; //ALARM_ABORT
ORI	R2, R0, 5
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,830 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,831 :: 		}
L_Sample_Ringbuffer169:
;Protocol.c,832 :: 		} else {
J	L_Sample_Ringbuffer170
NOP	
L_Sample_Ringbuffer165:
;Protocol.c,833 :: 		query = 6;//return(STATUS_IDLE_ERROR);
ORI	R2, R0, 6
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,834 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,835 :: 		}
L_Sample_Ringbuffer170:
;Protocol.c,836 :: 		} else {
J	L_Sample_Ringbuffer171
NOP	
L_Sample_Ringbuffer162:
;Protocol.c,837 :: 		query = 7;//return(STATUS_SETTING_DISABLED);
ORI	R2, R0, 7
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,838 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,839 :: 		}
L_Sample_Ringbuffer171:
;Protocol.c,842 :: 		SV.homed = true;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 4
SB	R2, Offset(_SV+2)(GP)
;Protocol.c,843 :: 		query = 21;
ORI	R2, R0, 21
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,844 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,845 :: 		case 'N' : // Startup lines. $N
L_Sample_Ringbuffer172:
;Protocol.c,846 :: 		startup = 2;
ORI	R2, R0, 2
SB	R2, Offset(Protocol_startup+0)(GP)
;Protocol.c,847 :: 		if ( gcode[0][2] < 0x20 ) { // Print startup lines
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 32
BNE	R2, R0, L__Sample_Ringbuffer664
NOP	
J	L_Sample_Ringbuffer173
NOP	
L__Sample_Ringbuffer664:
;Protocol.c,848 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
; helper_var start address is: 12 (R3)
MOVZ	R3, R0, R0
; helper_var end address is: 12 (R3)
L_Sample_Ringbuffer174:
; helper_var start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 2
BNE	R2, R0, L__Sample_Ringbuffer665
NOP	
J	L_Sample_Ringbuffer175
NOP	
L__Sample_Ringbuffer665:
;Protocol.c,849 :: 		if ((settings_read_startup_line(helper_var, gcode[0]))) {
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_settings_read_startup_line+0
NOP	
LH	R3, 20(SP)
BNE	R2, R0, L__Sample_Ringbuffer667
NOP	
J	L_Sample_Ringbuffer177
NOP	
L__Sample_Ringbuffer667:
;Protocol.c,851 :: 		query = 8;
ORI	R2, R0, 8
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,852 :: 		} else {
J	L_Sample_Ringbuffer178
NOP	
L_Sample_Ringbuffer177:
;Protocol.c,853 :: 		report_startup_line(helper_var,gcode[0]);
SH	R3, 20(SP)
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
SEH	R25, R3
JAL	_report_startup_line+0
NOP	
LH	R3, 20(SP)
;Protocol.c,854 :: 		query = 1; //report status is ok continue
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,855 :: 		}
L_Sample_Ringbuffer178:
;Protocol.c,848 :: 		for (helper_var=0; helper_var < N_STARTUP_LINE; helper_var++) {
ADDIU	R2, R3, 1
SEH	R3, R2
;Protocol.c,860 :: 		}
; helper_var end address is: 12 (R3)
J	L_Sample_Ringbuffer174
NOP	
L_Sample_Ringbuffer175:
;Protocol.c,861 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,862 :: 		}else { // Store startup line
L_Sample_Ringbuffer173:
;Protocol.c,863 :: 		int N_Val = 0;
;Protocol.c,864 :: 		helper_var = 1;  // Set helper_var to flag storing method.
; helper_var start address is: 28 (R7)
ORI	R7, R0, 1
;Protocol.c,869 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 48
BEQ	R2, R0, L__Sample_Ringbuffer668
NOP	
J	L__Sample_Ringbuffer452
NOP	
L__Sample_Ringbuffer668:
LBU	R2, Offset(_gcode+2)(GP)
SLTIU	R2, R2, 58
BNE	R2, R0, L__Sample_Ringbuffer669
NOP	
J	L__Sample_Ringbuffer451
NOP	
L__Sample_Ringbuffer669:
L__Sample_Ringbuffer444:
;Protocol.c,870 :: 		char num[] = "0";
ORI	R30, R0, 48
SB	R30, 113(SP)
MOVZ	R30, R0, R0
SB	R30, 114(SP)
;Protocol.c,872 :: 		num[0] = gcode[0][2];
ADDIU	R3, SP, 113
LBU	R2, Offset(_gcode+2)(GP)
SB	R2, 0(R3)
;Protocol.c,873 :: 		N_Val = atoi(num);
MOVZ	R25, R3, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,880 :: 		}else {
J	L_Sample_Ringbuffer183
NOP	
; helper_var end address is: 28 (R7)
; N_Val end address is: 16 (R4)
;Protocol.c,869 :: 		if ( gcode[0][2] >= '0'  &&  gcode[0][2] <= '9' ) {
L__Sample_Ringbuffer452:
L__Sample_Ringbuffer451:
;Protocol.c,881 :: 		query = 2; //STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 2
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,882 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,883 :: 		}
L_Sample_Ringbuffer183:
;Protocol.c,886 :: 		if (helper_var) { // Store startup line
; N_Val start address is: 16 (R4)
; helper_var start address is: 28 (R7)
BNE	R7, R0, L__Sample_Ringbuffer671
NOP	
J	L_Sample_Ringbuffer184
NOP	
L__Sample_Ringbuffer671:
; helper_var end address is: 28 (R7)
;Protocol.c,887 :: 		if(gcode[0][3] != '='){
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer673
NOP	
J	L_Sample_Ringbuffer185
NOP	
L__Sample_Ringbuffer673:
; N_Val end address is: 16 (R4)
;Protocol.c,890 :: 		helper_var = strlen((gcode[0]));
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_strlen+0
NOP	
;Protocol.c,891 :: 		strncpy(str,(gcode[0]),helper_var);
ADDIU	R3, SP, 34
SEH	R27, R2
LUI	R26, hi_addr(_gcode+0)
ORI	R26, R26, lo_addr(_gcode+0)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Protocol.c,899 :: 		str_len = strlen(str);
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SH	R2, Offset(Sample_Ringbuffer_str_len_L0+0)(GP)
;Protocol.c,904 :: 		}else{
J	L_Sample_Ringbuffer186
NOP	
L_Sample_Ringbuffer185:
;Protocol.c,905 :: 		int str_length = 0;
; N_Val start address is: 16 (R4)
;Protocol.c,913 :: 		settings_store_startup_line(N_Val,str+4);
ADDIU	R2, SP, 34
ADDIU	R2, R2, 4
MOVZ	R26, R2, R0
SEH	R25, R4
; N_Val end address is: 16 (R4)
JAL	_settings_store_startup_line+0
NOP	
;Protocol.c,914 :: 		}
L_Sample_Ringbuffer186:
;Protocol.c,916 :: 		}
L_Sample_Ringbuffer184:
;Protocol.c,918 :: 		query = 1; //STATUS_OK;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,919 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,920 :: 		case '~': //*~ (cycle start)
L_Sample_Ringbuffer187:
;Protocol.c,921 :: 		sys.execute |= EXEC_CYCLE_START;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,922 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,923 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,924 :: 		case '!': //*! (feed hold)
L_Sample_Ringbuffer188:
;Protocol.c,925 :: 		sys.execute |= EXEC_FEED_HOLD;
LH	R2, Offset(_sys+18)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_sys+18)(GP)
;Protocol.c,926 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,928 :: 		case 0x18: // *ctrl-x (reset Grbl)
L_Sample_Ringbuffer189:
;Protocol.c,929 :: 		mc_reset();
JAL	_mc_reset+0
NOP	
;Protocol.c,930 :: 		query = 1;  //STATUS_OK
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,931 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,932 :: 		case '0': case '1': case '2': case'3':  case '4': case '5':
L_Sample_Ringbuffer190:
L_Sample_Ringbuffer191:
L_Sample_Ringbuffer192:
L_Sample_Ringbuffer193:
L_Sample_Ringbuffer194:
L_Sample_Ringbuffer195:
;Protocol.c,933 :: 		case '6': case '7': case '8': case '9':
L_Sample_Ringbuffer196:
L_Sample_Ringbuffer197:
L_Sample_Ringbuffer198:
L_Sample_Ringbuffer199:
;Protocol.c,937 :: 		if((gcode[0][2] == '=')||(gcode[0][3] == '=')){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer675
NOP	
J	L__Sample_Ringbuffer454
NOP	
L__Sample_Ringbuffer675:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BNE	R3, R2, L__Sample_Ringbuffer677
NOP	
J	L__Sample_Ringbuffer453
NOP	
L__Sample_Ringbuffer677:
J	L_Sample_Ringbuffer202
NOP	
L__Sample_Ringbuffer454:
L__Sample_Ringbuffer453:
;Protocol.c,938 :: 		char str_val[9]={0};
ADDIU	R23, SP, 115
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICSSample_Ringbuffer_str_val_L4+0)
ORI	R24, R24, lo_addr(?ICSSample_Ringbuffer_str_val_L4+0)
JAL	___CC2DW+0
NOP	
;Protocol.c,939 :: 		int N_Val = 0;
; N_Val start address is: 24 (R6)
MOVZ	R6, R0, R0
;Protocol.c,940 :: 		float value = 0.00;
; value start address is: 8 (R2)
MTC1	R0, S1
;Protocol.c,941 :: 		if(gcode[0][2] == '='){
LBU	R3, Offset(_gcode+2)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer678
NOP	
J	L_Sample_Ringbuffer203
NOP	
L__Sample_Ringbuffer678:
;Protocol.c,943 :: 		strncpy(str_val,gcode[0]+1,1);
ADDIU	R2, SP, 115
ORI	R27, R0, 1
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
BNE	R2, R0, L__Sample_Ringbuffer680
NOP	
J	L__Sample_Ringbuffer471
NOP	
L__Sample_Ringbuffer680:
; N_Val end address is: 24 (R6)
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; N_Val start address is: 24 (R6)
SEH	R6, R2
; N_Val end address is: 24 (R6)
J	L_Sample_Ringbuffer204
NOP	
L__Sample_Ringbuffer471:
L_Sample_Ringbuffer204:
;Protocol.c,945 :: 		strncpy(str_val,gcode[0]+3,strlen(gcode[0]+3));
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
;Protocol.c,946 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
J	L_Sample_Ringbuffer205
NOP	
L_Sample_Ringbuffer203:
LBU	R3, Offset(_gcode+3)(GP)
ORI	R2, R0, 61
BEQ	R3, R2, L__Sample_Ringbuffer681
NOP	
J	L__Sample_Ringbuffer473
NOP	
L__Sample_Ringbuffer681:
;Protocol.c,948 :: 		strncpy(str_val,gcode[0]+1,2);
ADDIU	R2, SP, 115
ORI	R27, R0, 2
LUI	R26, hi_addr(_gcode+1)
ORI	R26, R26, lo_addr(_gcode+1)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Protocol.c,949 :: 		if(isdigit(str_val[0])){N_Val = atoi(str_val);}
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
; N_Val start address is: 20 (R5)
SEH	R5, R2
; N_Val end address is: 20 (R5)
J	L_Sample_Ringbuffer207
NOP	
L__Sample_Ringbuffer472:
SEH	R5, R6
L_Sample_Ringbuffer207:
;Protocol.c,950 :: 		memset(str_val,0,9);
; N_Val start address is: 20 (R5)
ADDIU	R2, SP, 115
ORI	R27, R0, 9
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Protocol.c,951 :: 		strncpy(str_val,gcode[0]+4,strlen(gcode[0]+4));
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
;Protocol.c,952 :: 		}
J	L_Sample_Ringbuffer206
NOP	
L__Sample_Ringbuffer473:
;Protocol.c,946 :: 		}else if(gcode[0][3] == '='){
SEH	R7, R6
;Protocol.c,952 :: 		}
L_Sample_Ringbuffer206:
; N_Val start address is: 28 (R7)
; N_Val end address is: 28 (R7)
L_Sample_Ringbuffer205:
;Protocol.c,955 :: 		if((value < 0.0) || (!isdigit(str_val[0]))){
; N_Val start address is: 28 (R7)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__Sample_Ringbuffer684
NOP	
J	L__Sample_Ringbuffer456
NOP	
L__Sample_Ringbuffer684:
; value end address is: 8 (R2)
ADDIU	R2, SP, 115
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__Sample_Ringbuffer686
NOP	
J	L__Sample_Ringbuffer455
NOP	
L__Sample_Ringbuffer686:
J	L_Sample_Ringbuffer210
NOP	
L__Sample_Ringbuffer456:
L__Sample_Ringbuffer455:
;Protocol.c,956 :: 		query = 3;//STATUS_UNSUPPORTED_STATEMENT
ORI	R2, R0, 3
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,957 :: 		}
L_Sample_Ringbuffer210:
;Protocol.c,958 :: 		value = atof(str_val);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
;Protocol.c,963 :: 		settings_store_global_setting(N_Val,value);
MOV.S 	S12, S0
SEH	R25, R7
; N_Val end address is: 28 (R7)
JAL	_settings_store_global_setting+0
NOP	
;Protocol.c,966 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,967 :: 		}
L_Sample_Ringbuffer202:
;Protocol.c,968 :: 		break;
J	L_Sample_Ringbuffer149
NOP	
;Protocol.c,969 :: 		}
L_Sample_Ringbuffer148:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 63
BNE	R3, R2, L__Sample_Ringbuffer688
NOP	
J	L_Sample_Ringbuffer150
NOP	
L__Sample_Ringbuffer688:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 36
BNE	R3, R2, L__Sample_Ringbuffer690
NOP	
J	L_Sample_Ringbuffer151
NOP	
L__Sample_Ringbuffer690:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 35
BNE	R3, R2, L__Sample_Ringbuffer692
NOP	
J	L_Sample_Ringbuffer152
NOP	
L__Sample_Ringbuffer692:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer694
NOP	
J	L_Sample_Ringbuffer153
NOP	
L__Sample_Ringbuffer694:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 67
BNE	R3, R2, L__Sample_Ringbuffer696
NOP	
J	L_Sample_Ringbuffer155
NOP	
L__Sample_Ringbuffer696:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer698
NOP	
J	L_Sample_Ringbuffer159
NOP	
L__Sample_Ringbuffer698:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 72
BNE	R3, R2, L__Sample_Ringbuffer700
NOP	
J	L_Sample_Ringbuffer161
NOP	
L__Sample_Ringbuffer700:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 78
BNE	R3, R2, L__Sample_Ringbuffer702
NOP	
J	L_Sample_Ringbuffer172
NOP	
L__Sample_Ringbuffer702:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 126
BNE	R3, R2, L__Sample_Ringbuffer704
NOP	
J	L_Sample_Ringbuffer187
NOP	
L__Sample_Ringbuffer704:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 33
BNE	R3, R2, L__Sample_Ringbuffer706
NOP	
J	L_Sample_Ringbuffer188
NOP	
L__Sample_Ringbuffer706:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 24
BNE	R3, R2, L__Sample_Ringbuffer708
NOP	
J	L_Sample_Ringbuffer189
NOP	
L__Sample_Ringbuffer708:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 48
BNE	R3, R2, L__Sample_Ringbuffer710
NOP	
J	L_Sample_Ringbuffer190
NOP	
L__Sample_Ringbuffer710:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 49
BNE	R3, R2, L__Sample_Ringbuffer712
NOP	
J	L_Sample_Ringbuffer191
NOP	
L__Sample_Ringbuffer712:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 50
BNE	R3, R2, L__Sample_Ringbuffer714
NOP	
J	L_Sample_Ringbuffer192
NOP	
L__Sample_Ringbuffer714:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 51
BNE	R3, R2, L__Sample_Ringbuffer716
NOP	
J	L_Sample_Ringbuffer193
NOP	
L__Sample_Ringbuffer716:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 52
BNE	R3, R2, L__Sample_Ringbuffer718
NOP	
J	L_Sample_Ringbuffer194
NOP	
L__Sample_Ringbuffer718:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 53
BNE	R3, R2, L__Sample_Ringbuffer720
NOP	
J	L_Sample_Ringbuffer195
NOP	
L__Sample_Ringbuffer720:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 54
BNE	R3, R2, L__Sample_Ringbuffer722
NOP	
J	L_Sample_Ringbuffer196
NOP	
L__Sample_Ringbuffer722:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 55
BNE	R3, R2, L__Sample_Ringbuffer724
NOP	
J	L_Sample_Ringbuffer197
NOP	
L__Sample_Ringbuffer724:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 56
BNE	R3, R2, L__Sample_Ringbuffer726
NOP	
J	L_Sample_Ringbuffer198
NOP	
L__Sample_Ringbuffer726:
LBU	R3, Offset(_gcode+1)(GP)
ORI	R2, R0, 57
BNE	R3, R2, L__Sample_Ringbuffer728
NOP	
J	L_Sample_Ringbuffer199
NOP	
L__Sample_Ringbuffer728:
L_Sample_Ringbuffer149:
;Protocol.c,971 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
J	L_Sample_Ringbuffer211
NOP	
L_Sample_Ringbuffer146:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 65
BEQ	R2, R0, L__Sample_Ringbuffer729
NOP	
J	L__Sample_Ringbuffer470
NOP	
L__Sample_Ringbuffer729:
LBU	R2, Offset(_gcode+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 91
BNE	R2, R0, L__Sample_Ringbuffer730
NOP	
J	L__Sample_Ringbuffer469
NOP	
L__Sample_Ringbuffer730:
L__Sample_Ringbuffer441:
;Protocol.c,972 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,973 :: 		switch(*(*gcode+0)+0){
LBU	R2, Offset(_gcode+0)(GP)
SH	R2, 124(SP)
J	L_Sample_Ringbuffer215
NOP	
;Protocol.c,974 :: 		case 'G':case 'g':
L_Sample_Ringbuffer217:
L_Sample_Ringbuffer218:
;Protocol.c,976 :: 		if (*(*(gcode)+0)=='G'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 71
BEQ	R3, R2, L__Sample_Ringbuffer731
NOP	
J	L_Sample_Ringbuffer219
NOP	
L__Sample_Ringbuffer731:
;Protocol.c,977 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,978 :: 		if(i < 3){ //G00 - G99
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer732
NOP	
J	L_Sample_Ringbuffer220
NOP	
L__Sample_Ringbuffer732:
;Protocol.c,979 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,982 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer734
NOP	
J	L__Sample_Ringbuffer459
NOP	
L__Sample_Ringbuffer734:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer736
NOP	
J	L__Sample_Ringbuffer458
NOP	
L__Sample_Ringbuffer736:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer738
NOP	
J	L__Sample_Ringbuffer457
NOP	
L__Sample_Ringbuffer738:
SEH	R2, R4
J	L_Sample_Ringbuffer223
NOP	
L__Sample_Ringbuffer459:
L__Sample_Ringbuffer458:
L__Sample_Ringbuffer457:
;Protocol.c,983 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer223:
;Protocol.c,984 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer224
NOP	
L_Sample_Ringbuffer220:
;Protocol.c,986 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,987 :: 		}
L_Sample_Ringbuffer224:
;Protocol.c,989 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,991 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer739
NOP	
J	L_Sample_Ringbuffer225
NOP	
L__Sample_Ringbuffer739:
; ?FLOC___Sample_Ringbuffer?T534 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T534 end address is: 12 (R3)
J	L_Sample_Ringbuffer226
NOP	
L_Sample_Ringbuffer225:
; ?FLOC___Sample_Ringbuffer?T534 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T534 end address is: 12 (R3)
L_Sample_Ringbuffer226:
; ?FLOC___Sample_Ringbuffer?T534 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T534 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1001 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer741
NOP	
J	L_Sample_Ringbuffer227
NOP	
L__Sample_Ringbuffer741:
;Protocol.c,1002 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1004 :: 		switch(*(*(gcode+1)+0)) {
J	L_Sample_Ringbuffer228
NOP	
;Protocol.c,1005 :: 		case 'G':case 'g':
L_Sample_Ringbuffer230:
L_Sample_Ringbuffer231:
;Protocol.c,1006 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer742
NOP	
J	L_Sample_Ringbuffer232
NOP	
L__Sample_Ringbuffer742:
;Protocol.c,1007 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1010 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer744
NOP	
J	L__Sample_Ringbuffer462
NOP	
L__Sample_Ringbuffer744:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer746
NOP	
J	L__Sample_Ringbuffer461
NOP	
L__Sample_Ringbuffer746:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer748
NOP	
J	L__Sample_Ringbuffer460
NOP	
L__Sample_Ringbuffer748:
SEH	R2, R4
J	L_Sample_Ringbuffer235
NOP	
L__Sample_Ringbuffer462:
L__Sample_Ringbuffer461:
L__Sample_Ringbuffer460:
;Protocol.c,1011 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer235:
;Protocol.c,1012 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer236
NOP	
L_Sample_Ringbuffer232:
;Protocol.c,1014 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1015 :: 		}
L_Sample_Ringbuffer236:
;Protocol.c,1017 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1019 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer749
NOP	
J	L_Sample_Ringbuffer237
NOP	
L__Sample_Ringbuffer749:
; ?FLOC___Sample_Ringbuffer?T557 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T557 end address is: 12 (R3)
J	L_Sample_Ringbuffer238
NOP	
L_Sample_Ringbuffer237:
; ?FLOC___Sample_Ringbuffer?T557 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T557 end address is: 12 (R3)
L_Sample_Ringbuffer238:
; ?FLOC___Sample_Ringbuffer?T557 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T557 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1025 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1026 :: 		case 'X':case 'x':
L_Sample_Ringbuffer239:
L_Sample_Ringbuffer240:
;Protocol.c,1027 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer241:
L_Sample_Ringbuffer242:
;Protocol.c,1028 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer243:
L_Sample_Ringbuffer244:
;Protocol.c,1029 :: 		case 'A':case 'a':
L_Sample_Ringbuffer245:
L_Sample_Ringbuffer246:
;Protocol.c,1031 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1032 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1036 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1037 :: 		case 'L':case 'l':
L_Sample_Ringbuffer247:
L_Sample_Ringbuffer248:
;Protocol.c,1038 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1039 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1043 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1044 :: 		case 'F':case 'f':
L_Sample_Ringbuffer249:
L_Sample_Ringbuffer250:
;Protocol.c,1045 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1046 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1050 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1051 :: 		case 'P':case 'p':
L_Sample_Ringbuffer251:
L_Sample_Ringbuffer252:
;Protocol.c,1052 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1053 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1057 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1058 :: 		case 'S':case 's':
L_Sample_Ringbuffer253:
L_Sample_Ringbuffer254:
;Protocol.c,1059 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1060 :: 		status = Instruction_Values((gcode+1),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1064 :: 		break;
J	L_Sample_Ringbuffer229
NOP	
;Protocol.c,1065 :: 		}
L_Sample_Ringbuffer228:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer751
NOP	
J	L_Sample_Ringbuffer230
NOP	
L__Sample_Ringbuffer751:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer753
NOP	
J	L_Sample_Ringbuffer231
NOP	
L__Sample_Ringbuffer753:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer755
NOP	
J	L_Sample_Ringbuffer239
NOP	
L__Sample_Ringbuffer755:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer757
NOP	
J	L_Sample_Ringbuffer240
NOP	
L__Sample_Ringbuffer757:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer759
NOP	
J	L_Sample_Ringbuffer241
NOP	
L__Sample_Ringbuffer759:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer761
NOP	
J	L_Sample_Ringbuffer242
NOP	
L__Sample_Ringbuffer761:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer763
NOP	
J	L_Sample_Ringbuffer243
NOP	
L__Sample_Ringbuffer763:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer765
NOP	
J	L_Sample_Ringbuffer244
NOP	
L__Sample_Ringbuffer765:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer767
NOP	
J	L_Sample_Ringbuffer245
NOP	
L__Sample_Ringbuffer767:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer769
NOP	
J	L_Sample_Ringbuffer246
NOP	
L__Sample_Ringbuffer769:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer771
NOP	
J	L_Sample_Ringbuffer247
NOP	
L__Sample_Ringbuffer771:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer773
NOP	
J	L_Sample_Ringbuffer248
NOP	
L__Sample_Ringbuffer773:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer775
NOP	
J	L_Sample_Ringbuffer249
NOP	
L__Sample_Ringbuffer775:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer777
NOP	
J	L_Sample_Ringbuffer250
NOP	
L__Sample_Ringbuffer777:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer779
NOP	
J	L_Sample_Ringbuffer251
NOP	
L__Sample_Ringbuffer779:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer781
NOP	
J	L_Sample_Ringbuffer252
NOP	
L__Sample_Ringbuffer781:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer783
NOP	
J	L_Sample_Ringbuffer253
NOP	
L__Sample_Ringbuffer783:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer785
NOP	
J	L_Sample_Ringbuffer254
NOP	
L__Sample_Ringbuffer785:
L_Sample_Ringbuffer229:
;Protocol.c,1066 :: 		}
L_Sample_Ringbuffer227:
;Protocol.c,1071 :: 		if(*(*(gcode+2)+0) != 0){
LBU	R2, Offset(_gcode+128)(GP)
BNE	R2, R0, L__Sample_Ringbuffer787
NOP	
J	L_Sample_Ringbuffer255
NOP	
L__Sample_Ringbuffer787:
;Protocol.c,1072 :: 		i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
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
;Protocol.c,1073 :: 		switch(*(*(gcode+2)+0)) {
J	L_Sample_Ringbuffer256
NOP	
;Protocol.c,1074 :: 		case 'G':case 'g':
L_Sample_Ringbuffer258:
L_Sample_Ringbuffer259:
;Protocol.c,1075 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer788
NOP	
J	L_Sample_Ringbuffer260
NOP	
L__Sample_Ringbuffer788:
;Protocol.c,1076 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1079 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer790
NOP	
J	L__Sample_Ringbuffer465
NOP	
L__Sample_Ringbuffer790:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer792
NOP	
J	L__Sample_Ringbuffer464
NOP	
L__Sample_Ringbuffer792:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer794
NOP	
J	L__Sample_Ringbuffer463
NOP	
L__Sample_Ringbuffer794:
SEH	R2, R4
J	L_Sample_Ringbuffer263
NOP	
L__Sample_Ringbuffer465:
L__Sample_Ringbuffer464:
L__Sample_Ringbuffer463:
;Protocol.c,1080 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer263:
;Protocol.c,1081 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer264
NOP	
L_Sample_Ringbuffer260:
;Protocol.c,1083 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1084 :: 		}
L_Sample_Ringbuffer264:
;Protocol.c,1086 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1088 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer795
NOP	
J	L_Sample_Ringbuffer265
NOP	
L__Sample_Ringbuffer795:
; ?FLOC___Sample_Ringbuffer?T619 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T619 end address is: 12 (R3)
J	L_Sample_Ringbuffer266
NOP	
L_Sample_Ringbuffer265:
; ?FLOC___Sample_Ringbuffer?T619 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T619 end address is: 12 (R3)
L_Sample_Ringbuffer266:
; ?FLOC___Sample_Ringbuffer?T619 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T619 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1092 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1093 :: 		case 'X':case 'x':
L_Sample_Ringbuffer267:
L_Sample_Ringbuffer268:
;Protocol.c,1094 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer269:
L_Sample_Ringbuffer270:
;Protocol.c,1095 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer271:
L_Sample_Ringbuffer272:
;Protocol.c,1096 :: 		case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer273:
L_Sample_Ringbuffer274:
;Protocol.c,1097 :: 		case 'I':case 'i':
L_Sample_Ringbuffer275:
L_Sample_Ringbuffer276:
;Protocol.c,1098 :: 		case 'J':case 'j':
L_Sample_Ringbuffer277:
L_Sample_Ringbuffer278:
;Protocol.c,1100 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1101 :: 		status = Instruction_Values((gcode+2),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1105 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1106 :: 		case 'L':case 'l':
L_Sample_Ringbuffer279:
L_Sample_Ringbuffer280:
;Protocol.c,1107 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1108 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1112 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1113 :: 		case 'F':case 'f':
L_Sample_Ringbuffer281:
L_Sample_Ringbuffer282:
;Protocol.c,1114 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1115 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1119 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1120 :: 		case 'P':case 'p':
L_Sample_Ringbuffer283:
L_Sample_Ringbuffer284:
;Protocol.c,1121 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1122 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1126 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1127 :: 		case 'S':case 's':
L_Sample_Ringbuffer285:
L_Sample_Ringbuffer286:
;Protocol.c,1128 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1129 :: 		status = Instruction_Values(gcode[2],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1133 :: 		break;
J	L_Sample_Ringbuffer257
NOP	
;Protocol.c,1134 :: 		}
L_Sample_Ringbuffer256:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer797
NOP	
J	L_Sample_Ringbuffer258
NOP	
L__Sample_Ringbuffer797:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer799
NOP	
J	L_Sample_Ringbuffer259
NOP	
L__Sample_Ringbuffer799:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer801
NOP	
J	L_Sample_Ringbuffer267
NOP	
L__Sample_Ringbuffer801:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer803
NOP	
J	L_Sample_Ringbuffer268
NOP	
L__Sample_Ringbuffer803:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer805
NOP	
J	L_Sample_Ringbuffer269
NOP	
L__Sample_Ringbuffer805:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer807
NOP	
J	L_Sample_Ringbuffer270
NOP	
L__Sample_Ringbuffer807:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer809
NOP	
J	L_Sample_Ringbuffer271
NOP	
L__Sample_Ringbuffer809:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer811
NOP	
J	L_Sample_Ringbuffer272
NOP	
L__Sample_Ringbuffer811:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer813
NOP	
J	L_Sample_Ringbuffer273
NOP	
L__Sample_Ringbuffer813:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer815
NOP	
J	L_Sample_Ringbuffer274
NOP	
L__Sample_Ringbuffer815:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer817
NOP	
J	L_Sample_Ringbuffer275
NOP	
L__Sample_Ringbuffer817:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer819
NOP	
J	L_Sample_Ringbuffer276
NOP	
L__Sample_Ringbuffer819:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer821
NOP	
J	L_Sample_Ringbuffer277
NOP	
L__Sample_Ringbuffer821:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer823
NOP	
J	L_Sample_Ringbuffer278
NOP	
L__Sample_Ringbuffer823:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 76
BNE	R3, R2, L__Sample_Ringbuffer825
NOP	
J	L_Sample_Ringbuffer279
NOP	
L__Sample_Ringbuffer825:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 108
BNE	R3, R2, L__Sample_Ringbuffer827
NOP	
J	L_Sample_Ringbuffer280
NOP	
L__Sample_Ringbuffer827:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer829
NOP	
J	L_Sample_Ringbuffer281
NOP	
L__Sample_Ringbuffer829:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer831
NOP	
J	L_Sample_Ringbuffer282
NOP	
L__Sample_Ringbuffer831:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 80
BNE	R3, R2, L__Sample_Ringbuffer833
NOP	
J	L_Sample_Ringbuffer283
NOP	
L__Sample_Ringbuffer833:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 112
BNE	R3, R2, L__Sample_Ringbuffer835
NOP	
J	L_Sample_Ringbuffer284
NOP	
L__Sample_Ringbuffer835:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer837
NOP	
J	L_Sample_Ringbuffer285
NOP	
L__Sample_Ringbuffer837:
LBU	R3, Offset(_gcode+128)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer839
NOP	
J	L_Sample_Ringbuffer286
NOP	
L__Sample_Ringbuffer839:
L_Sample_Ringbuffer257:
;Protocol.c,1135 :: 		}
L_Sample_Ringbuffer255:
;Protocol.c,1139 :: 		if(*(*(gcode+3)+0) != 0){
LBU	R2, Offset(_gcode+192)(GP)
BNE	R2, R0, L__Sample_Ringbuffer841
NOP	
J	L_Sample_Ringbuffer287
NOP	
L__Sample_Ringbuffer841:
;Protocol.c,1140 :: 		i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
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
;Protocol.c,1141 :: 		switch(*(*(gcode+3)+0)) {
J	L_Sample_Ringbuffer288
NOP	
;Protocol.c,1142 :: 		case 'G':case 'g':
L_Sample_Ringbuffer290:
L_Sample_Ringbuffer291:
;Protocol.c,1143 :: 		if(i < 3){ //G00 - G99
SEH	R2, R4
; i end address is: 16 (R4)
SLTI	R2, R2, 3
BNE	R2, R0, L__Sample_Ringbuffer842
NOP	
J	L_Sample_Ringbuffer292
NOP	
L__Sample_Ringbuffer842:
;Protocol.c,1144 :: 		G_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; G_Val start address is: 16 (R4)
SEH	R4, R2
;Protocol.c,1147 :: 		if(G_Val == 28 || G_Val == 30 || G_Val == 92)
SEH	R3, R2
ORI	R2, R0, 28
BNE	R3, R2, L__Sample_Ringbuffer844
NOP	
J	L__Sample_Ringbuffer468
NOP	
L__Sample_Ringbuffer844:
SEH	R3, R4
ORI	R2, R0, 30
BNE	R3, R2, L__Sample_Ringbuffer846
NOP	
J	L__Sample_Ringbuffer467
NOP	
L__Sample_Ringbuffer846:
SEH	R3, R4
ORI	R2, R0, 92
BNE	R3, R2, L__Sample_Ringbuffer848
NOP	
J	L__Sample_Ringbuffer466
NOP	
L__Sample_Ringbuffer848:
SEH	R2, R4
J	L_Sample_Ringbuffer295
NOP	
L__Sample_Ringbuffer468:
L__Sample_Ringbuffer467:
L__Sample_Ringbuffer466:
;Protocol.c,1148 :: 		G_Val *= 10;
ORI	R2, R0, 10
MUL	R2, R4, R2
; G_Val end address is: 16 (R4)
; G_Val start address is: 12 (R3)
SEH	R3, R2
; G_Val end address is: 12 (R3)
SEH	R2, R3
L_Sample_Ringbuffer295:
;Protocol.c,1149 :: 		}else{
; G_Val start address is: 8 (R2)
; G_Val end address is: 8 (R2)
J	L_Sample_Ringbuffer296
NOP	
L_Sample_Ringbuffer292:
;Protocol.c,1151 :: 		G_Val = (int)(atof(temp)*10.0);
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
;Protocol.c,1152 :: 		}
L_Sample_Ringbuffer296:
;Protocol.c,1154 :: 		motion_mode = G_Mode(G_Val);
; G_Val start address is: 8 (R2)
SEH	R25, R2
; G_Val end address is: 8 (R2)
JAL	_G_Mode+0
NOP	
;Protocol.c,1156 :: 		query = (motion_mode == MOTION_MODE_NULL)? 1:20;
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer849
NOP	
J	L_Sample_Ringbuffer297
NOP	
L__Sample_Ringbuffer849:
; ?FLOC___Sample_Ringbuffer?T686 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Sample_Ringbuffer?T686 end address is: 12 (R3)
J	L_Sample_Ringbuffer298
NOP	
L_Sample_Ringbuffer297:
; ?FLOC___Sample_Ringbuffer?T686 start address is: 12 (R3)
ORI	R3, R0, 20
; ?FLOC___Sample_Ringbuffer?T686 end address is: 12 (R3)
L_Sample_Ringbuffer298:
; ?FLOC___Sample_Ringbuffer?T686 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Sample_Ringbuffer?T686 end address is: 12 (R3)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1160 :: 		break;
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1161 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer299:
L_Sample_Ringbuffer300:
L_Sample_Ringbuffer301:
L_Sample_Ringbuffer302:
;Protocol.c,1162 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer303:
L_Sample_Ringbuffer304:
;Protocol.c,1163 :: 		case 'R':case 'r':case 'I':case 'i':
L_Sample_Ringbuffer305:
L_Sample_Ringbuffer306:
L_Sample_Ringbuffer307:
L_Sample_Ringbuffer308:
;Protocol.c,1169 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1170 :: 		status = Instruction_Values((gcode+3),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1174 :: 		break;
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1175 :: 		case 'F': case 'f':
L_Sample_Ringbuffer309:
L_Sample_Ringbuffer310:
;Protocol.c,1176 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1177 :: 		status = Instruction_Values((gcode+3),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+192)
ORI	R25, R25, lo_addr(_gcode+192)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1181 :: 		break;
J	L_Sample_Ringbuffer289
NOP	
;Protocol.c,1182 :: 		}
L_Sample_Ringbuffer288:
; i start address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer851
NOP	
J	L_Sample_Ringbuffer290
NOP	
L__Sample_Ringbuffer851:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer853
NOP	
J	L_Sample_Ringbuffer291
NOP	
L__Sample_Ringbuffer853:
; i end address is: 16 (R4)
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer855
NOP	
J	L_Sample_Ringbuffer299
NOP	
L__Sample_Ringbuffer855:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer857
NOP	
J	L_Sample_Ringbuffer300
NOP	
L__Sample_Ringbuffer857:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer859
NOP	
J	L_Sample_Ringbuffer301
NOP	
L__Sample_Ringbuffer859:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer861
NOP	
J	L_Sample_Ringbuffer302
NOP	
L__Sample_Ringbuffer861:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer863
NOP	
J	L_Sample_Ringbuffer303
NOP	
L__Sample_Ringbuffer863:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer865
NOP	
J	L_Sample_Ringbuffer304
NOP	
L__Sample_Ringbuffer865:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 82
BNE	R3, R2, L__Sample_Ringbuffer867
NOP	
J	L_Sample_Ringbuffer305
NOP	
L__Sample_Ringbuffer867:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 114
BNE	R3, R2, L__Sample_Ringbuffer869
NOP	
J	L_Sample_Ringbuffer306
NOP	
L__Sample_Ringbuffer869:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer871
NOP	
J	L_Sample_Ringbuffer307
NOP	
L__Sample_Ringbuffer871:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer873
NOP	
J	L_Sample_Ringbuffer308
NOP	
L__Sample_Ringbuffer873:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer875
NOP	
J	L_Sample_Ringbuffer309
NOP	
L__Sample_Ringbuffer875:
LBU	R3, Offset(_gcode+192)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer877
NOP	
J	L_Sample_Ringbuffer310
NOP	
L__Sample_Ringbuffer877:
L_Sample_Ringbuffer289:
;Protocol.c,1183 :: 		}
L_Sample_Ringbuffer287:
;Protocol.c,1188 :: 		if(*(*(gcode+4)+0) != 0){
LBU	R2, Offset(_gcode+256)(GP)
BNE	R2, R0, L__Sample_Ringbuffer879
NOP	
J	L_Sample_Ringbuffer311
NOP	
L__Sample_Ringbuffer879:
;Protocol.c,1189 :: 		i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
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
;Protocol.c,1190 :: 		switch(*(*(gcode+4))) {
J	L_Sample_Ringbuffer312
NOP	
;Protocol.c,1191 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer314:
L_Sample_Ringbuffer315:
;Protocol.c,1192 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer316:
L_Sample_Ringbuffer317:
;Protocol.c,1193 :: 		case 'J':case 'j':
L_Sample_Ringbuffer318:
L_Sample_Ringbuffer319:
;Protocol.c,1194 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1195 :: 		status = Instruction_Values((gcode+4),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1199 :: 		break;
J	L_Sample_Ringbuffer313
NOP	
;Protocol.c,1200 :: 		case 'F':case 'f':
L_Sample_Ringbuffer320:
L_Sample_Ringbuffer321:
;Protocol.c,1201 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1202 :: 		status = Instruction_Values((gcode+4),&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+256)
ORI	R25, R25, lo_addr(_gcode+256)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1206 :: 		break;
J	L_Sample_Ringbuffer313
NOP	
;Protocol.c,1208 :: 		}
L_Sample_Ringbuffer312:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer881
NOP	
J	L_Sample_Ringbuffer314
NOP	
L__Sample_Ringbuffer881:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer883
NOP	
J	L_Sample_Ringbuffer315
NOP	
L__Sample_Ringbuffer883:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer885
NOP	
J	L_Sample_Ringbuffer316
NOP	
L__Sample_Ringbuffer885:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer887
NOP	
J	L_Sample_Ringbuffer317
NOP	
L__Sample_Ringbuffer887:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer889
NOP	
J	L_Sample_Ringbuffer318
NOP	
L__Sample_Ringbuffer889:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer891
NOP	
J	L_Sample_Ringbuffer319
NOP	
L__Sample_Ringbuffer891:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer893
NOP	
J	L_Sample_Ringbuffer320
NOP	
L__Sample_Ringbuffer893:
LBU	R3, Offset(_gcode+256)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer895
NOP	
J	L_Sample_Ringbuffer321
NOP	
L__Sample_Ringbuffer895:
L_Sample_Ringbuffer313:
;Protocol.c,1209 :: 		}
L_Sample_Ringbuffer311:
;Protocol.c,1213 :: 		if(*(*(gcode+5)+0) != 0){
LBU	R2, Offset(_gcode+320)(GP)
BNE	R2, R0, L__Sample_Ringbuffer897
NOP	
J	L_Sample_Ringbuffer322
NOP	
L__Sample_Ringbuffer897:
;Protocol.c,1214 :: 		xyz[4] = *(*(gcode+5)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 4
LBU	R2, Offset(_gcode+320)(GP)
SB	R2, 0(R3)
;Protocol.c,1215 :: 		i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
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
;Protocol.c,1216 :: 		switch(*(*(gcode+5))) {
J	L_Sample_Ringbuffer323
NOP	
;Protocol.c,1217 :: 		case 'Z':case 'z':no_of_axis++;
L_Sample_Ringbuffer325:
L_Sample_Ringbuffer326:
;Protocol.c,1218 :: 		case 'J':case 'j':
L_Sample_Ringbuffer327:
L_Sample_Ringbuffer328:
;Protocol.c,1219 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1220 :: 		Instruction_Values(gcode[5],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
;Protocol.c,1224 :: 		break;
J	L_Sample_Ringbuffer324
NOP	
;Protocol.c,1225 :: 		case 'F':case 'f':
L_Sample_Ringbuffer329:
L_Sample_Ringbuffer330:
;Protocol.c,1226 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1227 :: 		status = Instruction_Values(gcode[5],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+320)
ORI	R25, R25, lo_addr(_gcode+320)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1231 :: 		break;
J	L_Sample_Ringbuffer324
NOP	
;Protocol.c,1232 :: 		}
L_Sample_Ringbuffer323:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer899
NOP	
J	L_Sample_Ringbuffer325
NOP	
L__Sample_Ringbuffer899:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer901
NOP	
J	L_Sample_Ringbuffer326
NOP	
L__Sample_Ringbuffer901:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer903
NOP	
J	L_Sample_Ringbuffer327
NOP	
L__Sample_Ringbuffer903:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer905
NOP	
J	L_Sample_Ringbuffer328
NOP	
L__Sample_Ringbuffer905:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer907
NOP	
J	L_Sample_Ringbuffer329
NOP	
L__Sample_Ringbuffer907:
LBU	R3, Offset(_gcode+320)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer909
NOP	
J	L_Sample_Ringbuffer330
NOP	
L__Sample_Ringbuffer909:
L_Sample_Ringbuffer324:
;Protocol.c,1233 :: 		}
L_Sample_Ringbuffer322:
;Protocol.c,1236 :: 		if(*(*(gcode+6)+0) != 0){
LBU	R2, Offset(_gcode+384)(GP)
BNE	R2, R0, L__Sample_Ringbuffer911
NOP	
J	L_Sample_Ringbuffer331
NOP	
L__Sample_Ringbuffer911:
;Protocol.c,1237 :: 		i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
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
;Protocol.c,1238 :: 		switch(*(*(gcode+6))) {
J	L_Sample_Ringbuffer332
NOP	
;Protocol.c,1239 :: 		case 'J':case 'j':
L_Sample_Ringbuffer334:
L_Sample_Ringbuffer335:
;Protocol.c,1240 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1241 :: 		status = Instruction_Values(gcode[6],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1245 :: 		break;
J	L_Sample_Ringbuffer333
NOP	
;Protocol.c,1246 :: 		case 'F':case 'f':
L_Sample_Ringbuffer336:
L_Sample_Ringbuffer337:
;Protocol.c,1247 :: 		O_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Protocol.c,1248 :: 		status = Instruction_Values(gcode[6],&O_Val);
ADDIU	R2, SP, 32
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+384)
ORI	R25, R25, lo_addr(_gcode+384)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1252 :: 		break;
J	L_Sample_Ringbuffer333
NOP	
;Protocol.c,1254 :: 		}
L_Sample_Ringbuffer332:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer913
NOP	
J	L_Sample_Ringbuffer334
NOP	
L__Sample_Ringbuffer913:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer915
NOP	
J	L_Sample_Ringbuffer335
NOP	
L__Sample_Ringbuffer915:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer917
NOP	
J	L_Sample_Ringbuffer336
NOP	
L__Sample_Ringbuffer917:
LBU	R3, Offset(_gcode+384)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer919
NOP	
J	L_Sample_Ringbuffer337
NOP	
L__Sample_Ringbuffer919:
L_Sample_Ringbuffer333:
;Protocol.c,1255 :: 		}
L_Sample_Ringbuffer331:
;Protocol.c,1256 :: 		}
L_Sample_Ringbuffer219:
;Protocol.c,1257 :: 		query = (query==20)? 20:query;
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer920
NOP	
J	L_Sample_Ringbuffer338
NOP	
L__Sample_Ringbuffer920:
; ?FLOC___Sample_Ringbuffer?T792 start address is: 8 (R2)
ORI	R2, R0, 20
; ?FLOC___Sample_Ringbuffer?T792 end address is: 8 (R2)
J	L_Sample_Ringbuffer339
NOP	
L_Sample_Ringbuffer338:
; ?FLOC___Sample_Ringbuffer?T792 start address is: 8 (R2)
LH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T792 end address is: 8 (R2)
L_Sample_Ringbuffer339:
; ?FLOC___Sample_Ringbuffer?T792 start address is: 8 (R2)
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
; ?FLOC___Sample_Ringbuffer?T792 end address is: 8 (R2)
;Protocol.c,1258 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,1259 :: 		case 'M':
L_Sample_Ringbuffer340:
;Protocol.c,1260 :: 		case 'm':
L_Sample_Ringbuffer341:
;Protocol.c,1262 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1263 :: 		M_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;Protocol.c,1264 :: 		M_Instruction(M_Val);     //debugging instructions
SEH	R25, R2
JAL	_M_Instruction+0
NOP	
;Protocol.c,1270 :: 		if((*(gcode+1)) != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_gcode+64)
ORI	R2, R2, lo_addr(_gcode+64)
BNE	R3, R2, L__Sample_Ringbuffer922
NOP	
J	L_Sample_Ringbuffer342
NOP	
L__Sample_Ringbuffer922:
;Protocol.c,1271 :: 		switch(*(*(gcode+1))){
J	L_Sample_Ringbuffer343
NOP	
;Protocol.c,1272 :: 		case 'S':
L_Sample_Ringbuffer345:
;Protocol.c,1273 :: 		case 's':
L_Sample_Ringbuffer346:
;Protocol.c,1275 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1276 :: 		XYZ_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
SWC1	S0, 24(SP)
;Protocol.c,1277 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1281 :: 		}
J	L_Sample_Ringbuffer344
NOP	
L_Sample_Ringbuffer343:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 83
BNE	R3, R2, L__Sample_Ringbuffer924
NOP	
J	L_Sample_Ringbuffer345
NOP	
L__Sample_Ringbuffer924:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 115
BNE	R3, R2, L__Sample_Ringbuffer926
NOP	
J	L_Sample_Ringbuffer346
NOP	
L__Sample_Ringbuffer926:
L_Sample_Ringbuffer344:
;Protocol.c,1282 :: 		}
L_Sample_Ringbuffer342:
;Protocol.c,1283 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1284 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,1285 :: 		case 'X':case 'x':case 'Y':case 'y':
L_Sample_Ringbuffer347:
L_Sample_Ringbuffer348:
L_Sample_Ringbuffer349:
L_Sample_Ringbuffer350:
;Protocol.c,1286 :: 		case 'Z':case 'z':case 'A':case 'a': no_of_axis++;
L_Sample_Ringbuffer351:
L_Sample_Ringbuffer352:
L_Sample_Ringbuffer353:
L_Sample_Ringbuffer354:
;Protocol.c,1287 :: 		case 'I':case 'i':case 'J':case 'j':
L_Sample_Ringbuffer355:
L_Sample_Ringbuffer356:
L_Sample_Ringbuffer357:
L_Sample_Ringbuffer358:
;Protocol.c,1288 :: 		if(*(*(gcode)+0)=='X'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 88
BEQ	R3, R2, L__Sample_Ringbuffer927
NOP	
J	L_Sample_Ringbuffer359
NOP	
L__Sample_Ringbuffer927:
;Protocol.c,1289 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1290 :: 		XYZ_Val = atof(temp);//no_of_axis++;
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1291 :: 		status = Instruction_Values(gcode[0],&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1295 :: 		}
L_Sample_Ringbuffer359:
;Protocol.c,1299 :: 		if(*(*(gcode+1)+0) != 0){
LBU	R2, Offset(_gcode+64)(GP)
BNE	R2, R0, L__Sample_Ringbuffer929
NOP	
J	L_Sample_Ringbuffer360
NOP	
L__Sample_Ringbuffer929:
;Protocol.c,1300 :: 		xyz[1] = *(*(gcode+1)+0);no_of_axis++;
ADDIU	R2, SP, 107
ADDIU	R3, R2, 1
LBU	R2, Offset(_gcode+64)(GP)
SB	R2, 0(R3)
;Protocol.c,1301 :: 		i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
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
;Protocol.c,1302 :: 		switch(*(*(gcode+1))) {
J	L_Sample_Ringbuffer361
NOP	
;Protocol.c,1303 :: 		case 'Y':case 'y':
L_Sample_Ringbuffer363:
L_Sample_Ringbuffer364:
;Protocol.c,1304 :: 		case 'Z':case 'z':
L_Sample_Ringbuffer365:
L_Sample_Ringbuffer366:
;Protocol.c,1305 :: 		case 'A':case 'a':
L_Sample_Ringbuffer367:
L_Sample_Ringbuffer368:
;Protocol.c,1306 :: 		case 'I':case 'i':
L_Sample_Ringbuffer369:
L_Sample_Ringbuffer370:
;Protocol.c,1307 :: 		case 'J':case 'j':
L_Sample_Ringbuffer371:
L_Sample_Ringbuffer372:
;Protocol.c,1308 :: 		XYZ_Val = atof(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atof+0
NOP	
SWC1	S0, 24(SP)
;Protocol.c,1309 :: 		status = Instruction_Values((gcode+1),&XYZ_Val);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+64)
ORI	R25, R25, lo_addr(_gcode+64)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1313 :: 		break;
J	L_Sample_Ringbuffer362
NOP	
;Protocol.c,1314 :: 		case 'F':
L_Sample_Ringbuffer373:
;Protocol.c,1315 :: 		case 'f':
L_Sample_Ringbuffer374:
;Protocol.c,1318 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1319 :: 		status = Instruction_Values((gcode+2),&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+128)
ORI	R25, R25, lo_addr(_gcode+128)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1324 :: 		break;
J	L_Sample_Ringbuffer362
NOP	
;Protocol.c,1325 :: 		}
L_Sample_Ringbuffer361:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer931
NOP	
J	L_Sample_Ringbuffer363
NOP	
L__Sample_Ringbuffer931:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer933
NOP	
J	L_Sample_Ringbuffer364
NOP	
L__Sample_Ringbuffer933:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer935
NOP	
J	L_Sample_Ringbuffer365
NOP	
L__Sample_Ringbuffer935:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer937
NOP	
J	L_Sample_Ringbuffer366
NOP	
L__Sample_Ringbuffer937:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer939
NOP	
J	L_Sample_Ringbuffer367
NOP	
L__Sample_Ringbuffer939:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer941
NOP	
J	L_Sample_Ringbuffer368
NOP	
L__Sample_Ringbuffer941:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer943
NOP	
J	L_Sample_Ringbuffer369
NOP	
L__Sample_Ringbuffer943:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer945
NOP	
J	L_Sample_Ringbuffer370
NOP	
L__Sample_Ringbuffer945:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer947
NOP	
J	L_Sample_Ringbuffer371
NOP	
L__Sample_Ringbuffer947:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer949
NOP	
J	L_Sample_Ringbuffer372
NOP	
L__Sample_Ringbuffer949:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer951
NOP	
J	L_Sample_Ringbuffer373
NOP	
L__Sample_Ringbuffer951:
LBU	R3, Offset(_gcode+64)(GP)
ORI	R2, R0, 102
BNE	R3, R2, L__Sample_Ringbuffer953
NOP	
J	L_Sample_Ringbuffer374
NOP	
L__Sample_Ringbuffer953:
L_Sample_Ringbuffer362:
;Protocol.c,1326 :: 		}
L_Sample_Ringbuffer360:
;Protocol.c,1327 :: 		query = 20;
ORI	R2, R0, 20
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1328 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,1329 :: 		case 'F':
L_Sample_Ringbuffer375:
;Protocol.c,1331 :: 		if (*(*(gcode)+0)=='F'){
LBU	R3, Offset(_gcode+0)(GP)
ORI	R2, R0, 70
BEQ	R3, R2, L__Sample_Ringbuffer954
NOP	
J	L_Sample_Ringbuffer376
NOP	
L__Sample_Ringbuffer954:
;Protocol.c,1332 :: 		i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
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
;Protocol.c,1333 :: 		F_Val = atoi(temp);
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, 30(SP)
;Protocol.c,1334 :: 		status = Instruction_Values(gcode[0],&F_Val);
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gcode+0)
ORI	R25, R25, lo_addr(_gcode+0)
JAL	_Instruction_Values+0
NOP	
SH	R2, 28(SP)
;Protocol.c,1338 :: 		}
L_Sample_Ringbuffer376:
;Protocol.c,1339 :: 		query = 1;
ORI	R2, R0, 1
SH	R2, Offset(Sample_Ringbuffer_query_L0+0)(GP)
;Protocol.c,1340 :: 		break;
J	L_Sample_Ringbuffer216
NOP	
;Protocol.c,1341 :: 		}
L_Sample_Ringbuffer215:
LH	R4, 124(SP)
SEH	R3, R4
ORI	R2, R0, 71
BNE	R3, R2, L__Sample_Ringbuffer956
NOP	
J	L_Sample_Ringbuffer217
NOP	
L__Sample_Ringbuffer956:
SEH	R3, R4
ORI	R2, R0, 103
BNE	R3, R2, L__Sample_Ringbuffer958
NOP	
J	L_Sample_Ringbuffer218
NOP	
L__Sample_Ringbuffer958:
SEH	R3, R4
ORI	R2, R0, 77
BNE	R3, R2, L__Sample_Ringbuffer960
NOP	
J	L_Sample_Ringbuffer340
NOP	
L__Sample_Ringbuffer960:
SEH	R3, R4
ORI	R2, R0, 109
BNE	R3, R2, L__Sample_Ringbuffer962
NOP	
J	L_Sample_Ringbuffer341
NOP	
L__Sample_Ringbuffer962:
SEH	R3, R4
ORI	R2, R0, 88
BNE	R3, R2, L__Sample_Ringbuffer964
NOP	
J	L_Sample_Ringbuffer347
NOP	
L__Sample_Ringbuffer964:
SEH	R3, R4
ORI	R2, R0, 120
BNE	R3, R2, L__Sample_Ringbuffer966
NOP	
J	L_Sample_Ringbuffer348
NOP	
L__Sample_Ringbuffer966:
SEH	R3, R4
ORI	R2, R0, 89
BNE	R3, R2, L__Sample_Ringbuffer968
NOP	
J	L_Sample_Ringbuffer349
NOP	
L__Sample_Ringbuffer968:
SEH	R3, R4
ORI	R2, R0, 121
BNE	R3, R2, L__Sample_Ringbuffer970
NOP	
J	L_Sample_Ringbuffer350
NOP	
L__Sample_Ringbuffer970:
SEH	R3, R4
ORI	R2, R0, 90
BNE	R3, R2, L__Sample_Ringbuffer972
NOP	
J	L_Sample_Ringbuffer351
NOP	
L__Sample_Ringbuffer972:
SEH	R3, R4
ORI	R2, R0, 122
BNE	R3, R2, L__Sample_Ringbuffer974
NOP	
J	L_Sample_Ringbuffer352
NOP	
L__Sample_Ringbuffer974:
SEH	R3, R4
ORI	R2, R0, 65
BNE	R3, R2, L__Sample_Ringbuffer976
NOP	
J	L_Sample_Ringbuffer353
NOP	
L__Sample_Ringbuffer976:
SEH	R3, R4
ORI	R2, R0, 97
BNE	R3, R2, L__Sample_Ringbuffer978
NOP	
J	L_Sample_Ringbuffer354
NOP	
L__Sample_Ringbuffer978:
SEH	R3, R4
ORI	R2, R0, 73
BNE	R3, R2, L__Sample_Ringbuffer980
NOP	
J	L_Sample_Ringbuffer355
NOP	
L__Sample_Ringbuffer980:
SEH	R3, R4
ORI	R2, R0, 105
BNE	R3, R2, L__Sample_Ringbuffer982
NOP	
J	L_Sample_Ringbuffer356
NOP	
L__Sample_Ringbuffer982:
SEH	R3, R4
ORI	R2, R0, 74
BNE	R3, R2, L__Sample_Ringbuffer984
NOP	
J	L_Sample_Ringbuffer357
NOP	
L__Sample_Ringbuffer984:
SEH	R3, R4
ORI	R2, R0, 106
BNE	R3, R2, L__Sample_Ringbuffer986
NOP	
J	L_Sample_Ringbuffer358
NOP	
L__Sample_Ringbuffer986:
SEH	R3, R4
ORI	R2, R0, 70
BNE	R3, R2, L__Sample_Ringbuffer988
NOP	
J	L_Sample_Ringbuffer375
NOP	
L__Sample_Ringbuffer988:
L_Sample_Ringbuffer216:
;Protocol.c,971 :: 		}else if((*(*gcode+0)+0)>64 && (*(*gcode+0)+0)<91){//[A ... Z]
L__Sample_Ringbuffer470:
L__Sample_Ringbuffer469:
;Protocol.c,1342 :: 		}
L_Sample_Ringbuffer211:
;Protocol.c,1343 :: 		report:
___Sample_Ringbuffer_report:
;Protocol.c,1349 :: 		if(query == 1){status = STATUS_OK;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Sample_Ringbuffer989
NOP	
J	L_Sample_Ringbuffer377
NOP	
L__Sample_Ringbuffer989:
SH	R0, 28(SP)
J	L_Sample_Ringbuffer378
NOP	
L_Sample_Ringbuffer377:
;Protocol.c,1350 :: 		else if(query == 2){status = STATUS_BAD_NUMBER_FORMAT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Sample_Ringbuffer990
NOP	
J	L_Sample_Ringbuffer379
NOP	
L__Sample_Ringbuffer990:
ORI	R2, R0, 1
SH	R2, 28(SP)
J	L_Sample_Ringbuffer380
NOP	
L_Sample_Ringbuffer379:
;Protocol.c,1351 :: 		else if(query == 3){status = STATUS_UNSUPPORTED_STATEMENT;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Sample_Ringbuffer991
NOP	
J	L_Sample_Ringbuffer381
NOP	
L__Sample_Ringbuffer991:
ORI	R2, R0, 3
SH	R2, 28(SP)
J	L_Sample_Ringbuffer382
NOP	
L_Sample_Ringbuffer381:
;Protocol.c,1352 :: 		else if(query == 4){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Sample_Ringbuffer992
NOP	
J	L_Sample_Ringbuffer383
NOP	
L__Sample_Ringbuffer992:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer384
NOP	
L_Sample_Ringbuffer383:
;Protocol.c,1353 :: 		else if(query == 5){status = ALARM_ABORT_CYCLE;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__Sample_Ringbuffer993
NOP	
J	L_Sample_Ringbuffer385
NOP	
L__Sample_Ringbuffer993:
ORI	R2, R0, 65534
SH	R2, 28(SP)
J	L_Sample_Ringbuffer386
NOP	
L_Sample_Ringbuffer385:
;Protocol.c,1354 :: 		else if(query == 6){status = STATUS_IDLE_ERROR;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Sample_Ringbuffer994
NOP	
J	L_Sample_Ringbuffer387
NOP	
L__Sample_Ringbuffer994:
ORI	R2, R0, 11
SH	R2, 28(SP)
J	L_Sample_Ringbuffer388
NOP	
L_Sample_Ringbuffer387:
;Protocol.c,1355 :: 		else if(query == 7){status = STATUS_SETTING_DISABLED;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Sample_Ringbuffer995
NOP	
J	L_Sample_Ringbuffer389
NOP	
L__Sample_Ringbuffer995:
ORI	R2, R0, 7
SH	R2, 28(SP)
J	L_Sample_Ringbuffer390
NOP	
L_Sample_Ringbuffer389:
;Protocol.c,1356 :: 		else if(query == 8){status = STATUS_SETTING_READ_FAIL;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__Sample_Ringbuffer996
NOP	
J	L_Sample_Ringbuffer391
NOP	
L__Sample_Ringbuffer996:
ORI	R2, R0, 10
SH	R2, 28(SP)
J	L_Sample_Ringbuffer392
NOP	
L_Sample_Ringbuffer391:
;Protocol.c,1357 :: 		else if(query == 20){status = STATUS_COMMAND_EXECUTE_MOTION; goto ret;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Sample_Ringbuffer997
NOP	
J	L_Sample_Ringbuffer393
NOP	
L__Sample_Ringbuffer997:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_ret
NOP	
L_Sample_Ringbuffer393:
;Protocol.c,1358 :: 		else if(query == 21){status = STATUS_COMMAND_EXECUTE_MOTION; goto end;}
LH	R3, Offset(Sample_Ringbuffer_query_L0+0)(GP)
ORI	R2, R0, 21
BEQ	R3, R2, L__Sample_Ringbuffer998
NOP	
J	L_Sample_Ringbuffer395
NOP	
L__Sample_Ringbuffer998:
ORI	R2, R0, 20
SH	R2, 28(SP)
J	___Sample_Ringbuffer_end
NOP	
L_Sample_Ringbuffer395:
L_Sample_Ringbuffer392:
L_Sample_Ringbuffer390:
L_Sample_Ringbuffer388:
L_Sample_Ringbuffer386:
L_Sample_Ringbuffer384:
L_Sample_Ringbuffer382:
L_Sample_Ringbuffer380:
L_Sample_Ringbuffer378:
;Protocol.c,1361 :: 		report_status_message(status);
LH	R25, 28(SP)
JAL	_report_status_message+0
NOP	
;Protocol.c,1362 :: 		goto end;
J	___Sample_Ringbuffer_end
NOP	
;Protocol.c,1365 :: 		ret:
___Sample_Ringbuffer_ret:
;Protocol.c,1366 :: 		modal_response = Check_group_multiple_violations();
JAL	_Check_group_multiple_violations+0
NOP	
; modal_response start address is: 12 (R3)
SEH	R3, R2
;Protocol.c,1369 :: 		status = (modal_response > 0)? modal_response:status;
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Sample_Ringbuffer999
NOP	
J	L_Sample_Ringbuffer396
NOP	
L__Sample_Ringbuffer999:
; ?FLOC___Sample_Ringbuffer?T905 start address is: 8 (R2)
SEH	R2, R3
; modal_response end address is: 12 (R3)
; ?FLOC___Sample_Ringbuffer?T905 end address is: 8 (R2)
J	L_Sample_Ringbuffer397
NOP	
L_Sample_Ringbuffer396:
; ?FLOC___Sample_Ringbuffer?T905 start address is: 8 (R2)
LH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T905 end address is: 8 (R2)
L_Sample_Ringbuffer397:
; ?FLOC___Sample_Ringbuffer?T905 start address is: 8 (R2)
SH	R2, 28(SP)
; ?FLOC___Sample_Ringbuffer?T905 end address is: 8 (R2)
;Protocol.c,1371 :: 		end: return status;
___Sample_Ringbuffer_end:
LH	R2, 28(SP)
J	L_end_Sample_Ringbuffer
NOP	
;Protocol.c,1373 :: 		}
L_Sample_Ringbuffer141:
;Protocol.c,1376 :: 		return status;
LH	R2, 28(SP)
;Protocol.c,1377 :: 		}
;Protocol.c,1376 :: 		return status;
;Protocol.c,1377 :: 		}
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
