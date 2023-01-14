_Settings_Init:
;Globals.c,11 :: 		void Settings_Init(char reset_all){
;Globals.c,12 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init33
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init33:
;Globals.c,13 :: 		settings.steps_per_mm[_X] = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,14 :: 		settings.steps_per_mm[_Y] = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,15 :: 		settings.steps_per_mm[_Z] = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,16 :: 		settings.steps_per_mm[_A] = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+16)(GP)
;Globals.c,17 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+40)(GP)
;Globals.c,18 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,19 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,20 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+44)(GP)
;Globals.c,21 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,22 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,23 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,24 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+52)(GP)
;Globals.c,25 :: 		settings.homing_pulloff        = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,26 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SB	R2, Offset(_settings+56)(GP)
;Globals.c,27 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SB	R2, Offset(_settings+57)(GP)
;Globals.c,28 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SB	R2, Offset(_settings+58)(GP)
;Globals.c,29 :: 		}
L_Settings_Init0:
;Globals.c,30 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Settings_Write_Coord_Data:
;Globals.c,61 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Globals.c,63 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,64 :: 		int res=0,recipe = 0;
;Globals.c,65 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,69 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,72 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,75 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,79 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,81 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data36
NOP	
J	L_Settings_Write_Coord_Data1
NOP	
L__Settings_Write_Coord_Data36:
; recipe end address is: 16 (R4)
;Globals.c,86 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,87 :: 		}
L_Settings_Write_Coord_Data1:
;Globals.c,89 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,90 :: 		case 0:break;
L_Settings_Write_Coord_Data4:
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,92 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data5:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,93 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data6:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,94 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data7:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,95 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data8:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,96 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data9:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,97 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data10:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,98 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data11:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,99 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data12:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,100 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data13:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,102 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data14:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,103 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,104 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,105 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,106 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,107 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data3
NOP	
;Globals.c,108 :: 		}
L_Settings_Write_Coord_Data2:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data38
NOP	
J	L_Settings_Write_Coord_Data4
NOP	
L__Settings_Write_Coord_Data38:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data40
NOP	
J	L_Settings_Write_Coord_Data5
NOP	
L__Settings_Write_Coord_Data40:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data42
NOP	
J	L_Settings_Write_Coord_Data6
NOP	
L__Settings_Write_Coord_Data42:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data44
NOP	
J	L_Settings_Write_Coord_Data7
NOP	
L__Settings_Write_Coord_Data44:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data46
NOP	
J	L_Settings_Write_Coord_Data8
NOP	
L__Settings_Write_Coord_Data46:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data48
NOP	
J	L_Settings_Write_Coord_Data9
NOP	
L__Settings_Write_Coord_Data48:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data50
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data50:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data52
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data52:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data54
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data54:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data56
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data56:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data58
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data58:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data60
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data60:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data62
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data62:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data64
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data64:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data66
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data66:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data68
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data68:
L_Settings_Write_Coord_Data3:
;Globals.c,111 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data20:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data69
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data69:
;Globals.c,112 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 28
SLL	R3, R5, 2
ADDU	R2, R2, R3
SW	R2, 44(SP)
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
LW	R3, 44(SP)
SW	R2, 0(R3)
;Globals.c,111 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,120 :: 		}
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data20
NOP	
L_Settings_Write_Coord_Data21:
;Globals.c,122 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,124 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data23:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data70
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data70:
;Globals.c,125 :: 		buff[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 28
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,126 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,124 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,127 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data23
NOP	
L_Settings_Write_Coord_Data24:
;Globals.c,132 :: 		res = NVMWriteRow(&add,buff);
ADDIU	R2, SP, 24
SW	R26, 8(SP)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
;Globals.c,139 :: 		return res;
;Globals.c,140 :: 		}
;Globals.c,139 :: 		return res;
;Globals.c,140 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_Save_Row_From_Flash:
;Globals.c,146 :: 		int Save_Row_From_Flash(unsigned long addr){
;Globals.c,149 :: 		ptr = addr;
; ptr start address is: 20 (R5)
MOVZ	R5, R25, R0
;Globals.c,150 :: 		data_count = 0;
; data_count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,151 :: 		for(j = 0;j < 128;j++){
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; data_count end address is: 28 (R7)
; j end address is: 24 (R6)
L_Save_Row_From_Flash26:
; j start address is: 24 (R6)
; data_count start address is: 28 (R7)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
SLTIU	R2, R6, 128
BNE	R2, R0, L__Save_Row_From_Flash72
NOP	
J	L_Save_Row_From_Flash27
NOP	
L__Save_Row_From_Flash72:
; ptr end address is: 20 (R5)
;Globals.c,152 :: 		buff[j] = *(ptr+j);
; ptr start address is: 20 (R5)
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
ADDU	R2, R5, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,153 :: 		if(buff[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash74
NOP	
J	L__Save_Row_From_Flash30
NOP	
L__Save_Row_From_Flash74:
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
; data_count end address is: 28 (R7)
J	L_Save_Row_From_Flash29
NOP	
L__Save_Row_From_Flash30:
L_Save_Row_From_Flash29:
;Globals.c,151 :: 		for(j = 0;j < 128;j++){
; data_count start address is: 28 (R7)
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,158 :: 		}
; ptr end address is: 20 (R5)
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash26
NOP	
L_Save_Row_From_Flash27:
;Globals.c,160 :: 		return data_count;
MOVZ	R2, R7, R0
; data_count end address is: 28 (R7)
;Globals.c,161 :: 		}
L_end_Save_Row_From_Flash:
JR	RA
NOP	
; end of _Save_Row_From_Flash
