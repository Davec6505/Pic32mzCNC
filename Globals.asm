_Settings_Init:
;Globals.c,11 :: 		void Settings_Init(char reset_all){
;Globals.c,12 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init31
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init31:
;Globals.c,13 :: 		settings.steps_per_mm[_X] = DEFAULT_X_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,14 :: 		settings.steps_per_mm[_Y] = DEFAULT_Y_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,15 :: 		settings.steps_per_mm[_Z] = DEFAULT_Z_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,16 :: 		settings.steps_per_mm[_A] = DEFAULT_A_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+16)(GP)
;Globals.c,17 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,18 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,19 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,20 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+52)(GP)
;Globals.c,21 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+56)(GP)
;Globals.c,22 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,23 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+40)(GP)
;Globals.c,24 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+60)(GP)
;Globals.c,25 :: 		settings.homing_pulloff        = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+44)(GP)
;Globals.c,26 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SB	R2, Offset(_settings+64)(GP)
;Globals.c,27 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SB	R2, Offset(_settings+65)(GP)
;Globals.c,28 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SB	R2, Offset(_settings+66)(GP)
;Globals.c,29 :: 		}
L_Settings_Init0:
;Globals.c,30 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Settings_Write_Coord_Data:
;Globals.c,60 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Globals.c,61 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,62 :: 		int recipe,res=0;
;Globals.c,63 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 48
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,66 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,69 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,73 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
SW	R26, 12(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,74 :: 		asm{NOP};
NOP	
;Globals.c,78 :: 		error = NVMErasePage(add);
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,81 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data34
NOP	
J	L_Settings_Write_Coord_Data1
NOP	
L__Settings_Write_Coord_Data34:
; recipe end address is: 16 (R4)
; error end address is: 12 (R3)
;Globals.c,83 :: 		while(DMA_IsOn(1));
L_Settings_Write_Coord_Data2:
; error start address is: 12 (R3)
SH	R3, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LHU	R3, 8(SP)
BNE	R2, R0, L__Settings_Write_Coord_Data36
NOP	
J	L_Settings_Write_Coord_Data3
NOP	
L__Settings_Write_Coord_Data36:
J	L_Settings_Write_Coord_Data2
NOP	
L_Settings_Write_Coord_Data3:
;Globals.c,84 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 28
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SH	R3, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 16(SP)
LW	R26, 12(SP)
LHU	R3, 8(SP)
;Globals.c,86 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,87 :: 		}
L_Settings_Write_Coord_Data1:
;Globals.c,90 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data4
NOP	
;Globals.c,91 :: 		case 0:break;
L_Settings_Write_Coord_Data6:
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,92 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data7:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,93 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data8:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,94 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data9:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,95 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data10:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,96 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data11:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,97 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data12:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,98 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data13:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,99 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data14:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,100 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data5
NOP	
;Globals.c,101 :: 		}
L_Settings_Write_Coord_Data4:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data38
NOP	
J	L_Settings_Write_Coord_Data6
NOP	
L__Settings_Write_Coord_Data38:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data40
NOP	
J	L_Settings_Write_Coord_Data7
NOP	
L__Settings_Write_Coord_Data40:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data42
NOP	
J	L_Settings_Write_Coord_Data8
NOP	
L__Settings_Write_Coord_Data42:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data44
NOP	
J	L_Settings_Write_Coord_Data9
NOP	
L__Settings_Write_Coord_Data44:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data46
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data46:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data48
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data48:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data50
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data50:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data52
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data52:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data54
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data54:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data56
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data56:
L_Settings_Write_Coord_Data5:
;Globals.c,104 :: 		for (i=0;i<3;i++){
; i start address is: 8 (R2)
MOVZ	R2, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 8 (R2)
SEH	R5, R4
MOVZ	R4, R2, R0
L_Settings_Write_Coord_Data16:
; i start address is: 16 (R4)
; recipe start address is: 20 (R5)
SLTIU	R2, R4, 3
BNE	R2, R0, L__Settings_Write_Coord_Data57
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data57:
;Globals.c,105 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 48
SLL	R3, R4, 2
ADDU	R2, R2, R3
SW	R2, 64(SP)
ADDU	R2, R26, R3
SH	R5, 8(SP)
SW	R4, 12(SP)
SW	R26, 16(SP)
SH	R25, 20(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 20(SP)
LW	R26, 16(SP)
LW	R4, 12(SP)
LH	R5, 8(SP)
LW	R3, 64(SP)
SW	R2, 0(R3)
; recipe end address is: 20 (R5)
; i end address is: 16 (R4)
MOVZ	R6, R4, R0
;Globals.c,107 :: 		while(DMA_IsOn(1));
L_Settings_Write_Coord_Data19:
; recipe start address is: 20 (R5)
; i start address is: 24 (R6)
SW	R6, 8(SP)
SH	R5, 12(SP)
SW	R26, 16(SP)
SH	R25, 20(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 20(SP)
LW	R26, 16(SP)
LH	R5, 12(SP)
LW	R6, 8(SP)
BNE	R2, R0, L__Settings_Write_Coord_Data59
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data59:
J	L_Settings_Write_Coord_Data19
NOP	
L_Settings_Write_Coord_Data20:
;Globals.c,108 :: 		dma_printf("%f\t%l\n",coord[i],wdata[i]);
ADDIU	R2, SP, 48
SLL	R3, R6, 2
ADDU	R2, R2, R3
LW	R4, 0(R2)
ADDU	R2, R26, R3
LWC1	S0, 0(R2)
ORI	R30, R0, 37
SB	R30, 40(SP)
ORI	R30, R0, 102
SB	R30, 41(SP)
ORI	R30, R0, 9
SB	R30, 42(SP)
ORI	R30, R0, 37
SB	R30, 43(SP)
ORI	R30, R0, 108
SB	R30, 44(SP)
ORI	R30, R0, 10
SB	R30, 45(SP)
MOVZ	R30, R0, R0
SB	R30, 46(SP)
ADDIU	R2, SP, 40
SW	R6, 8(SP)
SH	R5, 12(SP)
SW	R26, 16(SP)
SH	R25, 20(SP)
ADDIU	SP, SP, -12
SW	R4, 8(SP)
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 20(SP)
LW	R26, 16(SP)
LH	R5, 12(SP)
LW	R6, 8(SP)
;Globals.c,104 :: 		for (i=0;i<3;i++){
ADDIU	R2, R6, 1
; i end address is: 24 (R6)
; i start address is: 16 (R4)
MOVZ	R4, R2, R0
;Globals.c,113 :: 		}
; i end address is: 16 (R4)
J	L_Settings_Write_Coord_Data16
NOP	
L_Settings_Write_Coord_Data17:
;Globals.c,115 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R5, -1
; recipe end address is: 20 (R5)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,117 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data21:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data60
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data60:
;Globals.c,118 :: 		buff[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 48
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,119 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,117 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,120 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data21
NOP	
L_Settings_Write_Coord_Data22:
;Globals.c,124 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,125 :: 		res = NVMWriteRow(&add,buff);
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
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,128 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,129 :: 		NVMReadRow(add);
SH	R3, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_NVMReadRow+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LH	R3, 8(SP)
;Globals.c,132 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,133 :: 		}
;Globals.c,132 :: 		return res;
;Globals.c,133 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_Save_Row_From_Flash:
;Globals.c,139 :: 		void Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Globals.c,143 :: 		ptr = addr;
SW	R25, 12(SP)
;Globals.c,145 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_Save_Row_From_Flash24:
; j start address is: 20 (R5)
SLTIU	R2, R5, 128
BNE	R2, R0, L__Save_Row_From_Flash62
NOP	
J	L_Save_Row_From_Flash25
NOP	
L__Save_Row_From_Flash62:
;Globals.c,146 :: 		buff[j] = *(ptr+j);
SLL	R4, R5, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
LW	R2, 12(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
; j end address is: 20 (R5)
MOVZ	R4, R5, R0
;Globals.c,148 :: 		while(DMA_IsOn(1));
L_Save_Row_From_Flash27:
; j start address is: 16 (R4)
SW	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R4, 4(SP)
BNE	R2, R0, L__Save_Row_From_Flash64
NOP	
J	L_Save_Row_From_Flash28
NOP	
L__Save_Row_From_Flash64:
J	L_Save_Row_From_Flash27
NOP	
L_Save_Row_From_Flash28:
;Globals.c,149 :: 		dma_printf("buff[%l]:= %l\n",j,buff[j]);
SLL	R3, R4, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
ADDIU	R23, SP, 16
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr3_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SW	R4, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R3, 8(SP)
SW	R4, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R4, 4(SP)
;Globals.c,145 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 20 (R5)
MOVZ	R5, R2, R0
;Globals.c,151 :: 		}
; j end address is: 20 (R5)
J	L_Save_Row_From_Flash24
NOP	
L_Save_Row_From_Flash25:
;Globals.c,152 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Save_Row_From_Flash
