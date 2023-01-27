_Settings_Init:
;Globals.c,12 :: 		void Settings_Init(short reset_all){
;Globals.c,13 :: 		if(!reset_all){
BEQ	R25, R0, L__Settings_Init69
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init69:
;Globals.c,15 :: 		sys.abort           = 0;
SB	R0, Offset(_sys+0)(GP)
;Globals.c,16 :: 		sys.state           = 0;
SB	R0, Offset(_sys+1)(GP)
;Globals.c,17 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,18 :: 		sys.execute         = 0;
SB	R0, Offset(_sys+25)(GP)
;Globals.c,19 :: 		sys.auto_start      = 0;
SB	R0, Offset(_sys+24)(GP)
;Globals.c,20 :: 		}else if(reset_all == 1){
J	L_Settings_Init1
NOP	
L_Settings_Init0:
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Settings_Init70
NOP	
J	L_Settings_Init2
NOP	
L__Settings_Init70:
;Globals.c,22 :: 		settings.steps_per_mm[X] = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,23 :: 		settings.steps_per_mm[Y] = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,24 :: 		settings.steps_per_mm[Z] = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,25 :: 		settings.steps_per_mm[A]    = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+16)(GP)
;Globals.c,26 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+40)(GP)
;Globals.c,27 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,28 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,29 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+44)(GP)
;Globals.c,30 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,31 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,32 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,33 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+58)(GP)
;Globals.c,34 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,35 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+60)(GP)
;Globals.c,36 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+66)(GP)
;Globals.c,37 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+52)(GP)
;Globals.c,39 :: 		}
L_Settings_Init2:
L_Settings_Init1:
;Globals.c,40 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Save_Row_From_Flash:
;Globals.c,70 :: 		int Save_Row_From_Flash(unsigned long addr){
;Globals.c,73 :: 		ptr = addr;
; ptr start address is: 20 (R5)
MOVZ	R5, R25, R0
;Globals.c,74 :: 		data_count = 0;
; data_count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,75 :: 		for(j = 0;j < 128;j++){
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; data_count end address is: 28 (R7)
; j end address is: 24 (R6)
L_Save_Row_From_Flash3:
; j start address is: 24 (R6)
; data_count start address is: 28 (R7)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
SLTIU	R2, R6, 128
BNE	R2, R0, L__Save_Row_From_Flash72
NOP	
J	L_Save_Row_From_Flash4
NOP	
L__Save_Row_From_Flash72:
; ptr end address is: 20 (R5)
;Globals.c,76 :: 		buffA[j] = *(ptr+j);
; ptr start address is: 20 (R5)
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
ADDU	R2, R5, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,77 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash74
NOP	
J	L__Save_Row_From_Flash67
NOP	
L__Save_Row_From_Flash74:
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
; data_count end address is: 28 (R7)
J	L_Save_Row_From_Flash6
NOP	
L__Save_Row_From_Flash67:
L_Save_Row_From_Flash6:
;Globals.c,75 :: 		for(j = 0;j < 128;j++){
; data_count start address is: 28 (R7)
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,82 :: 		}
; ptr end address is: 20 (R5)
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash3
NOP	
L_Save_Row_From_Flash4:
;Globals.c,84 :: 		return data_count;
MOVZ	R2, R7, R0
; data_count end address is: 28 (R7)
;Globals.c,85 :: 		}
L_end_Save_Row_From_Flash:
JR	RA
NOP	
; end of _Save_Row_From_Flash
_Settings_Write_Coord_Data:
;Globals.c,89 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;Globals.c,91 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,92 :: 		int res=0,recipe = 0;
;Globals.c,93 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 56
ADDIU	R22, R23, 32
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,96 :: 		unsigned long temp[4] = {0};
;Globals.c,98 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 28(SP)
;Globals.c,101 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,104 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,108 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, 28(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,110 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data77
NOP	
J	L_Settings_Write_Coord_Data7
NOP	
L__Settings_Write_Coord_Data77:
; recipe end address is: 16 (R4)
;Globals.c,115 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,116 :: 		}
L_Settings_Write_Coord_Data7:
;Globals.c,118 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data8
NOP	
;Globals.c,119 :: 		case 0:break;
L_Settings_Write_Coord_Data10:
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,121 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data11:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,122 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data12:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,123 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data13:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,124 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data14:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,125 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,126 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,127 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,128 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,129 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,131 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,132 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,133 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,134 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,135 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,136 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 28(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,137 :: 		}
L_Settings_Write_Coord_Data8:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data79
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data79:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data81
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data81:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data83
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data83:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data85
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data85:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data87
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data87:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data89
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data89:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data91
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data91:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data93
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data93:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data95
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data95:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data97
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data97:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data99
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data99:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data101
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data101:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data103
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data103:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data105
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data105:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data107
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data107:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data109
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data109:
L_Settings_Write_Coord_Data9:
;Globals.c,140 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
; recipe end address is: 16 (R4)
L_Settings_Write_Coord_Data26:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data110
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data110:
;Globals.c,141 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 56
SLL	R3, R5, 2
ADDU	R2, R2, R3
SW	R2, 96(SP)
ADDU	R2, R26, R3
SH	R4, 8(SP)
SW	R5, 12(SP)
SW	R26, 16(SP)
SH	R25, 20(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 20(SP)
LW	R26, 16(SP)
LW	R5, 12(SP)
LH	R4, 8(SP)
LW	R3, 96(SP)
SW	R2, 0(R3)
;Globals.c,140 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Globals.c,149 :: 		}
; i end address is: 8 (R2)
MOVZ	R5, R2, R0
J	L_Settings_Write_Coord_Data26
NOP	
L_Settings_Write_Coord_Data27:
;Globals.c,151 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,153 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 24 (R6)
L_Settings_Write_Coord_Data29:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data111
NOP	
J	L_Settings_Write_Coord_Data30
NOP	
L__Settings_Write_Coord_Data111:
;Globals.c,154 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 56
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,155 :: 		i++;
ADDIU	R2, R6, 1
; i end address is: 24 (R6)
; i start address is: 12 (R3)
MOVZ	R3, R2, R0
;Globals.c,153 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
; j end address is: 20 (R5)
; j start address is: 8 (R2)
;Globals.c,156 :: 		}
MOVZ	R6, R3, R0
; i end address is: 12 (R3)
; j end address is: 8 (R2)
MOVZ	R5, R2, R0
J	L_Settings_Write_Coord_Data29
NOP	
L_Settings_Write_Coord_Data30:
;Globals.c,161 :: 		res = NVMWriteRow(&add,buffA);
ADDIU	R2, SP, 28
SW	R26, 8(SP)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
SH	R2, 88(SP)
;Globals.c,164 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 28(SP)
;Globals.c,167 :: 		NVMReadQuad(add,temp);
ADDIU	R2, SP, 72
MOVZ	R26, R2, R0
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_NVMReadQuad+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
;Globals.c,168 :: 		for(i = 0;i< 4;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Settings_Write_Coord_Data32:
; i start address is: 16 (R4)
SLTIU	R2, R4, 4
BNE	R2, R0, L__Settings_Write_Coord_Data112
NOP	
J	L_Settings_Write_Coord_Data33
NOP	
L__Settings_Write_Coord_Data112:
;Globals.c,169 :: 		if(temp[i] < 0xFFFFFFFF)  //print conversion??
ADDIU	R3, SP, 72
SLL	R2, R4, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SLTIU	R2, R2, 65535
BNE	R2, R0, L__Settings_Write_Coord_Data113
NOP	
J	L_Settings_Write_Coord_Data35
NOP	
L__Settings_Write_Coord_Data113:
;Globals.c,170 :: 		ptr = ulong2flt(temp[i]);
ADDIU	R3, SP, 72
SLL	R2, R4, 2
ADDU	R2, R3, R2
SW	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
LW	R25, 0(R2)
JAL	_ulong2flt+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LW	R4, 8(SP)
SWC1	S0, 24(SP)
J	L_Settings_Write_Coord_Data36
NOP	
L_Settings_Write_Coord_Data35:
;Globals.c,171 :: 		else ptr = 0.00;
MOVZ	R2, R0, R0
SW	R2, 24(SP)
L_Settings_Write_Coord_Data36:
;Globals.c,172 :: 		while(DMA_IsOn(1));
; i end address is: 16 (R4)
L_Settings_Write_Coord_Data37:
; i start address is: 16 (R4)
SW	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LW	R4, 8(SP)
BNE	R2, R0, L__Settings_Write_Coord_Data115
NOP	
J	L_Settings_Write_Coord_Data38
NOP	
L__Settings_Write_Coord_Data115:
J	L_Settings_Write_Coord_Data37
NOP	
L_Settings_Write_Coord_Data38:
;Globals.c,173 :: 		dma_printf("val:= %f\tbuff[%l]:= %l\n",ptr,i,temp[i]);
ADDIU	R3, SP, 72
SLL	R2, R4, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
ADDIU	R23, SP, 32
ADDIU	R22, R23, 24
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 32
SW	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
SW	R4, 8(SP)
LW	R2, 40(SP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 16(SP)
LW	R26, 12(SP)
LW	R4, 8(SP)
;Globals.c,168 :: 		for(i = 0;i< 4;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,174 :: 		}
; i end address is: 16 (R4)
J	L_Settings_Write_Coord_Data32
NOP	
L_Settings_Write_Coord_Data33:
;Globals.c,177 :: 		return res;
LH	R2, 88(SP)
;Globals.c,178 :: 		}
;Globals.c,177 :: 		return res;
;Globals.c,178 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,184 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,186 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,190 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data39:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data117
NOP	
J	L_settings_read_coord_data40
NOP	
L__settings_read_coord_data117:
;Globals.c,191 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data42:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data118
NOP	
J	L_settings_read_coord_data43
NOP	
L__settings_read_coord_data118:
;Globals.c,192 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,193 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,194 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,191 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,200 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data42
NOP	
L_settings_read_coord_data43:
;Globals.c,190 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,201 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data39
NOP	
L_settings_read_coord_data40:
;Globals.c,202 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,207 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Globals.c,210 :: 		unsigned int error = 0;
;Globals.c,215 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,218 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,219 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
; i start address is: 24 (R6)
SEH	R6, R2
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_settings_write_one_coord45:
; i start address is: 24 (R6)
; j start address is: 28 (R7)
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R2, R2
SLTU	R2, R6, R2
BNE	R2, R0, L__settings_write_one_coord120
NOP	
J	L_settings_write_one_coord46
NOP	
L__settings_write_one_coord120:
;Globals.c,221 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,222 :: 		temp[j] = flt2ulong(coord_data[j]);
ADDIU	R2, SP, 44
SLL	R3, R7, 2
ADDU	R2, R2, R3
SW	R2, 60(SP)
ADDU	R2, R4, R3
SH	R5, 4(SP)
SW	R7, 8(SP)
SW	R6, 12(SP)
SW	R26, 16(SP)
SH	R25, 20(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 20(SP)
LW	R26, 16(SP)
LW	R6, 12(SP)
LW	R7, 8(SP)
LH	R5, 4(SP)
LW	R3, 60(SP)
SW	R2, 0(R3)
;Globals.c,223 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 44
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,224 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,219 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,229 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord45
NOP	
L_settings_write_one_coord46:
;Globals.c,231 :: 		switch(coord_select){
J	L_settings_write_one_coord48
NOP	
;Globals.c,233 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord50:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,234 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,235 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,236 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,237 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,238 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,239 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,240 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,241 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,243 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,244 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,245 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,246 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,247 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,248 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord64:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 40(SP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,249 :: 		}
L_settings_write_one_coord48:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord122
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord122:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord124
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord124:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord126
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord126:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord128
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord128:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord130
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord130:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord132
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord132:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord134
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord134:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord136
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord136:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord138
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord138:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord140
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord140:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord142
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord142:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord144
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord144:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord146
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord146:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord148
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord148:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord150
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord150:
L_settings_write_one_coord49:
;Globals.c,252 :: 		error =  NVMWriteQuad (add, temp);
ADDIU	R2, SP, 44
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LW	R25, 40(SP)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
;Globals.c,254 :: 		return error;
;Globals.c,255 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,260 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,265 :: 		ptr = (unsigned long*)FLASH_Settings_VAddr_Page3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
; ptr start address is: 12 (R3)
LUI	R3, 48411
ORI	R3, R3, 50176
;Globals.c,269 :: 		ptr += (n * (LINE_BUFFER_SIZE_WORDS));
SEH	R2, R25
SLL	R2, R2, 4
SEH	R2, R2
SLL	R2, R2, 2
ADDU	R2, R3, R2
MOVZ	R3, R2, R0
;Globals.c,270 :: 		if(*ptr < 32){//empty string
LW	R2, 0(R2)
SLTIU	R2, R2, 32
BNE	R2, R0, L__settings_read_startup_line152
NOP	
J	L_settings_read_startup_line65
NOP	
L__settings_read_startup_line152:
; ptr end address is: 12 (R3)
;Globals.c,271 :: 		*(line+0) = 0;
SB	R0, 0(R26)
;Globals.c,272 :: 		return STATUS_SETTING_READ_FAIL;
ORI	R2, R0, 10
J	L_end_settings_read_startup_line
NOP	
;Globals.c,273 :: 		}else{
L_settings_read_startup_line65:
;Globals.c,274 :: 		memcpy(line,ptr,LINE_BUFFER_SIZE);
; ptr start address is: 12 (R3)
ORI	R27, R0, 64
MOVZ	R25, R26, R0
; ptr end address is: 12 (R3)
MOVZ	R26, R3, R0
JAL	_memcpy+0
NOP	
;Globals.c,275 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,277 :: 		}
;Globals.c,275 :: 		return STATUS_OK;
;Globals.c,277 :: 		}
L_end_settings_read_startup_line:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_startup_line
_settings_store_startup_line:
;Globals.c,280 :: 		void settings_store_startup_line(uint8_t n, char *line){
;Globals.c,283 :: 		}
L_end_settings_store_startup_line:
JR	RA
NOP	
; end of _settings_store_startup_line
