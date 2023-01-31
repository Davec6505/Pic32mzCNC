_Settings_Init:
;Globals.c,11 :: 		void Settings_Init(short reset_all){
;Globals.c,12 :: 		if(!reset_all){
BEQ	R25, R0, L__Settings_Init90
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init90:
;Globals.c,14 :: 		sys.abort           = 0;
SB	R0, Offset(_sys+0)(GP)
;Globals.c,15 :: 		sys.state           = 0;
SB	R0, Offset(_sys+1)(GP)
;Globals.c,16 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,17 :: 		sys.execute         = 0;
SB	R0, Offset(_sys+25)(GP)
;Globals.c,18 :: 		sys.auto_start      = 0;
SB	R0, Offset(_sys+24)(GP)
;Globals.c,19 :: 		}else if(reset_all == 1){
J	L_Settings_Init1
NOP	
L_Settings_Init0:
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Settings_Init91
NOP	
J	L_Settings_Init2
NOP	
L__Settings_Init91:
;Globals.c,21 :: 		settings.steps_per_mm[X] = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,22 :: 		settings.steps_per_mm[Y] = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,23 :: 		settings.steps_per_mm[Z] = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,24 :: 		settings.steps_per_mm[A]    = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+16)(GP)
;Globals.c,25 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+40)(GP)
;Globals.c,26 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,27 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,28 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+44)(GP)
;Globals.c,29 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,30 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,31 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,32 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+58)(GP)
;Globals.c,33 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,34 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+60)(GP)
;Globals.c,35 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+66)(GP)
;Globals.c,36 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+52)(GP)
;Globals.c,38 :: 		}
L_Settings_Init2:
L_Settings_Init1:
;Globals.c,39 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Save_Row_From_Flash:
;Globals.c,69 :: 		int Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Globals.c,72 :: 		ptr = addr;
SW	R25, 16(SP)
;Globals.c,73 :: 		data_count = 0;
SW	R0, 12(SP)
;Globals.c,74 :: 		for(j = 0;j < 512;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
MOVZ	R6, R5, R0
L_Save_Row_From_Flash3:
; j start address is: 24 (R6)
SLTIU	R2, R6, 512
BNE	R2, R0, L__Save_Row_From_Flash93
NOP	
J	L_Save_Row_From_Flash4
NOP	
L__Save_Row_From_Flash93:
;Globals.c,75 :: 		buffA[j] = *(ptr+j);
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
LW	R2, 16(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,76 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash95
NOP	
J	L_Save_Row_From_Flash6
NOP	
L__Save_Row_From_Flash95:
LW	R2, 12(SP)
ADDIU	R2, R2, 1
SW	R2, 12(SP)
L_Save_Row_From_Flash6:
;Globals.c,78 :: 		while(DMA_IsOn(1));
MOVZ	R4, R6, R0
; j end address is: 24 (R6)
L_Save_Row_From_Flash7:
; j start address is: 16 (R4)
SW	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R4, 4(SP)
BNE	R2, R0, L__Save_Row_From_Flash97
NOP	
J	L_Save_Row_From_Flash8
NOP	
L__Save_Row_From_Flash97:
J	L_Save_Row_From_Flash7
NOP	
L_Save_Row_From_Flash8:
;Globals.c,79 :: 		dma_printf("buffA[%l]:= %l\n",j,buffA[j]);
SLL	R3, R4, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
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
;Globals.c,74 :: 		for(j = 0;j < 512;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 24 (R6)
MOVZ	R6, R2, R0
;Globals.c,81 :: 		}
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash3
NOP	
L_Save_Row_From_Flash4:
;Globals.c,83 :: 		return data_count;
LW	R2, 12(SP)
;Globals.c,84 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _Save_Row_From_Flash
_Settings_Write_Coord_Data:
;Globals.c,88 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Globals.c,90 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,91 :: 		int res=0,recipe = 0;
;Globals.c,92 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 48
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,95 :: 		unsigned long temp[4] = {0};
;Globals.c,97 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,100 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,103 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
SW	R26, 12(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,107 :: 		error = (int)NVMErasePage(add);
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,109 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data100
NOP	
J	L_Settings_Write_Coord_Data9
NOP	
L__Settings_Write_Coord_Data100:
; recipe end address is: 16 (R4)
; error end address is: 12 (R3)
;Globals.c,111 :: 		while(DMA_IsOn(1));
L_Settings_Write_Coord_Data10:
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
BNE	R2, R0, L__Settings_Write_Coord_Data102
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data102:
J	L_Settings_Write_Coord_Data10
NOP	
L_Settings_Write_Coord_Data11:
;Globals.c,112 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 28
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr2_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Globals+0)
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
;Globals.c,114 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,115 :: 		}
L_Settings_Write_Coord_Data9:
;Globals.c,117 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,118 :: 		case 0:break;
L_Settings_Write_Coord_Data14:
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,120 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,121 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,122 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,123 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,124 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,125 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,126 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,127 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,128 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,130 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,131 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,132 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data26:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,133 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data27:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,134 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data28:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,135 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data29:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,136 :: 		}
L_Settings_Write_Coord_Data12:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data104
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data104:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data106
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data106:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data108
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data108:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data110
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data110:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data112
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data112:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data114
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data114:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data116
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data116:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data118
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data118:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data120
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data120:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data122
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data122:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data124
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data124:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data126
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data126:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data128
NOP	
J	L_Settings_Write_Coord_Data26
NOP	
L__Settings_Write_Coord_Data128:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data130
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data130:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data132
NOP	
J	L_Settings_Write_Coord_Data28
NOP	
L__Settings_Write_Coord_Data132:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data134
NOP	
J	L_Settings_Write_Coord_Data29
NOP	
L__Settings_Write_Coord_Data134:
L_Settings_Write_Coord_Data13:
;Globals.c,138 :: 		j = i = 0;
;Globals.c,139 :: 		for (i=0;i<3;i++){
; i start address is: 8 (R2)
MOVZ	R2, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 8 (R2)
SEH	R5, R4
MOVZ	R4, R2, R0
L_Settings_Write_Coord_Data30:
; i start address is: 16 (R4)
; recipe start address is: 20 (R5)
SLTIU	R2, R4, 3
BNE	R2, R0, L__Settings_Write_Coord_Data135
NOP	
J	L_Settings_Write_Coord_Data31
NOP	
L__Settings_Write_Coord_Data135:
;Globals.c,140 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,142 :: 		while(DMA_IsOn(1));
L_Settings_Write_Coord_Data33:
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
BNE	R2, R0, L__Settings_Write_Coord_Data137
NOP	
J	L_Settings_Write_Coord_Data34
NOP	
L__Settings_Write_Coord_Data137:
J	L_Settings_Write_Coord_Data33
NOP	
L_Settings_Write_Coord_Data34:
;Globals.c,143 :: 		dma_printf("%f\t%l\n",coord[i],wdata[i]);
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
;Globals.c,139 :: 		for (i=0;i<3;i++){
ADDIU	R2, R6, 1
; i end address is: 24 (R6)
; i start address is: 16 (R4)
MOVZ	R4, R2, R0
;Globals.c,148 :: 		}
; i end address is: 16 (R4)
J	L_Settings_Write_Coord_Data30
NOP	
L_Settings_Write_Coord_Data31:
;Globals.c,150 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R5, -1
; recipe end address is: 20 (R5)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,152 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data35:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data138
NOP	
J	L_Settings_Write_Coord_Data36
NOP	
L__Settings_Write_Coord_Data138:
;Globals.c,153 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 48
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,154 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,152 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,155 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data35
NOP	
L_Settings_Write_Coord_Data36:
;Globals.c,160 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,176 :: 		return res;
;Globals.c,177 :: 		}
;Globals.c,176 :: 		return res;
;Globals.c,177 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,183 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,185 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,189 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data38:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data140
NOP	
J	L_settings_read_coord_data39
NOP	
L__settings_read_coord_data140:
;Globals.c,190 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data41:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data141
NOP	
J	L_settings_read_coord_data42
NOP	
L__settings_read_coord_data141:
;Globals.c,191 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,192 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,193 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,190 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,201 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data41
NOP	
L_settings_read_coord_data42:
;Globals.c,189 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,202 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data38
NOP	
L_settings_read_coord_data39:
;Globals.c,203 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,208 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Globals.c,211 :: 		unsigned int error = 0;
;Globals.c,216 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,219 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,220 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
; i start address is: 24 (R6)
SEH	R6, R2
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_settings_write_one_coord44:
; i start address is: 24 (R6)
; j start address is: 28 (R7)
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R2, R2
SLTU	R2, R6, R2
BNE	R2, R0, L__settings_write_one_coord143
NOP	
J	L_settings_write_one_coord45
NOP	
L__settings_write_one_coord143:
;Globals.c,222 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,223 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,224 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 44
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,225 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,220 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,230 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord44
NOP	
L_settings_write_one_coord45:
;Globals.c,232 :: 		switch(coord_select){
J	L_settings_write_one_coord47
NOP	
;Globals.c,234 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord49:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,235 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord50:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,236 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,237 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,238 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,239 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,240 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,241 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,242 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,244 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,245 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,246 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,247 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,248 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,249 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 40(SP)
J	L_settings_write_one_coord48
NOP	
;Globals.c,250 :: 		}
L_settings_write_one_coord47:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord145
NOP	
J	L_settings_write_one_coord49
NOP	
L__settings_write_one_coord145:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord147
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord147:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord149
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord149:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord151
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord151:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord153
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord153:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord155
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord155:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord157
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord157:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord159
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord159:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord161
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord161:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord163
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord163:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord165
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord165:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord167
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord167:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord169
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord169:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord171
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord171:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord173
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord173:
L_settings_write_one_coord48:
;Globals.c,253 :: 		error =  NVMWriteQuad (add, temp);
ADDIU	R2, SP, 44
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LW	R25, 40(SP)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
;Globals.c,255 :: 		return error;
;Globals.c,256 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,261 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,264 :: 		char str[] = "Hello";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Globals.c,270 :: 		switch(n){
J	L_settings_read_startup_line64
NOP	
;Globals.c,271 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_Row2;break;
L_settings_read_startup_line66:
LUI	R2, 48411
ORI	R2, R2, 49536
SW	R2, 16(SP)
J	L_settings_read_startup_line65
NOP	
;Globals.c,272 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_Row3;break;
L_settings_read_startup_line67:
LUI	R2, 48411
ORI	R2, R2, 49600
SW	R2, 16(SP)
J	L_settings_read_startup_line65
NOP	
;Globals.c,273 :: 		}
L_settings_read_startup_line64:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line176
NOP	
J	L_settings_read_startup_line66
NOP	
L__settings_read_startup_line176:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line178
NOP	
J	L_settings_read_startup_line67
NOP	
L__settings_read_startup_line178:
L_settings_read_startup_line65:
;Globals.c,275 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,292 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,293 :: 		}
;Globals.c,292 :: 		return STATUS_OK;
;Globals.c,293 :: 		}
L_end_settings_read_startup_line:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _settings_read_startup_line
_settings_store_startup_line:
;Globals.c,296 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -136
SW	RA, 0(SP)
;Globals.c,297 :: 		unsigned long line1[16] = {0};
ADDIU	R23, SP, 72
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSsettings_store_startup_line_line1_L0+0)
ORI	R24, R24, lo_addr(?ICSsettings_store_startup_line_line1_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,302 :: 		str_len = strlen(line);
SH	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 4(SP)
SH	R2, 38(SP)
;Globals.c,304 :: 		while(DMA_IsOn(1));
L_settings_store_startup_line68:
SW	R26, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__settings_store_startup_line181
NOP	
J	L_settings_store_startup_line69
NOP	
L__settings_store_startup_line181:
J	L_settings_store_startup_line68
NOP	
L_settings_store_startup_line69:
;Globals.c,305 :: 		dma_printf("*line:= %s\n",line);
ADDIU	R23, SP, 41
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr4_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 41
SW	R26, 4(SP)
SH	R25, 8(SP)
ADDIU	SP, SP, -8
SW	R26, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 8(SP)
;Globals.c,307 :: 		addA    = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 28(SP)
;Globals.c,308 :: 		start_offset = (unsigned long)FLASH_Startup_Line_Offset;
ORI	R2, R0, 384
SW	R2, 20(SP)
;Globals.c,309 :: 		offset  = (unsigned long)n;
SEH	R2, R25
;Globals.c,310 :: 		offset  *= LINE_BUFFER_SIZE_WORDS;
SLL	R2, R2, 4
SW	R2, 24(SP)
;Globals.c,315 :: 		Save_Row_From_Flash(addA);
SH	R25, 8(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,319 :: 		error = (int)NVMErasePage(addA);
LW	R25, 28(SP)
JAL	_NVMErasePage+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R2, 36(SP)
;Globals.c,321 :: 		if(error){
BNE	R2, R0, L__settings_store_startup_line183
NOP	
J	L_settings_store_startup_line70
NOP	
L__settings_store_startup_line183:
;Globals.c,323 :: 		while(DMA_IsOn(1));
L_settings_store_startup_line71:
SW	R26, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__settings_store_startup_line185
NOP	
J	L_settings_store_startup_line72
NOP	
L__settings_store_startup_line185:
J	L_settings_store_startup_line71
NOP	
L_settings_store_startup_line72:
;Globals.c,324 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 53
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr5_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 53
LH	R2, 36(SP)
SW	R26, 4(SP)
SH	R25, 8(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 8(SP)
LW	R26, 4(SP)
;Globals.c,326 :: 		return error;
LH	R2, 36(SP)
J	L_end_settings_store_startup_line
NOP	
;Globals.c,327 :: 		}
L_settings_store_startup_line70:
;Globals.c,331 :: 		len1 = LINE_BUFFER_SIZE_WORDS;
ORI	R2, R0, 16
SW	R2, 32(SP)
;Globals.c,338 :: 		for(i = 0;i < len1;i++){
; i start address is: 40 (R10)
MOVZ	R10, R0, R0
; i end address is: 40 (R10)
L_settings_store_startup_line73:
; i start address is: 40 (R10)
LW	R2, 32(SP)
SLTU	R2, R10, R2
BNE	R2, R0, L__settings_store_startup_line186
NOP	
J	L_settings_store_startup_line74
NOP	
L__settings_store_startup_line186:
;Globals.c,340 :: 		for(j = 0;j < 16;j++){
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
; i end address is: 40 (R10)
; j end address is: 28 (R7)
MOVZ	R6, R10, R0
MOVZ	R5, R7, R0
L_settings_store_startup_line76:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 16
BNE	R2, R0, L__settings_store_startup_line187
NOP	
J	L__settings_store_startup_line88
NOP	
L__settings_store_startup_line187:
;Globals.c,341 :: 		if((i*4)+j < str_len)
SLL	R2, R6, 2
ADDU	R3, R2, R5
LH	R2, 38(SP)
SLTU	R2, R3, R2
BNE	R2, R0, L__settings_store_startup_line188
NOP	
J	L_settings_store_startup_line79
NOP	
L__settings_store_startup_line188:
;Globals.c,342 :: 		temp_char = (line[(i*4)+j]);
SLL	R2, R6, 2
ADDU	R2, R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 40(SP)
J	L_settings_store_startup_line80
NOP	
L_settings_store_startup_line79:
;Globals.c,344 :: 		temp_char = 0;
SB	R0, 40(SP)
L_settings_store_startup_line80:
;Globals.c,346 :: 		line1[i] |= temp_char;
ADDIU	R3, SP, 72
SLL	R2, R6, 2
ADDU	R4, R3, R2
LW	R3, 0(R4)
LBU	R2, 40(SP)
OR	R2, R3, R2
SW	R2, 0(R4)
;Globals.c,347 :: 		if(j < 3)
SLTIU	R2, R5, 3
BNE	R2, R0, L__settings_store_startup_line189
NOP	
J	L_settings_store_startup_line81
NOP	
L__settings_store_startup_line189:
;Globals.c,348 :: 		line1[i] = line1[i] << 8;
ADDIU	R3, SP, 72
SLL	R2, R6, 2
ADDU	R3, R3, R2
LW	R2, 0(R3)
SLL	R2, R2, 8
SW	R2, 0(R3)
L_settings_store_startup_line81:
;Globals.c,350 :: 		while(DMA_IsOn(1));
; j end address is: 20 (R5)
MOVZ	R4, R6, R0
L_settings_store_startup_line82:
; i end address is: 24 (R6)
; i start address is: 16 (R4)
; j start address is: 20 (R5)
SW	R5, 4(SP)
SW	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LW	R4, 8(SP)
LW	R5, 4(SP)
BNE	R2, R0, L__settings_store_startup_line191
NOP	
J	L_settings_store_startup_line83
NOP	
L__settings_store_startup_line191:
J	L_settings_store_startup_line82
NOP	
L_settings_store_startup_line83:
;Globals.c,351 :: 		dma_printf("%c\n",temp_char);
ORI	R30, R0, 37
SB	R30, 65(SP)
ORI	R30, R0, 99
SB	R30, 66(SP)
ORI	R30, R0, 10
SB	R30, 67(SP)
MOVZ	R30, R0, R0
SB	R30, 68(SP)
ADDIU	R3, SP, 65
LBU	R2, 40(SP)
SW	R5, 4(SP)
SW	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 16(SP)
LW	R26, 12(SP)
LW	R4, 8(SP)
LW	R5, 4(SP)
;Globals.c,353 :: 		if(line[(i*4)+j]==0)break;
SLL	R2, R4, 2
ADDU	R2, R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__settings_store_startup_line192
NOP	
J	L_settings_store_startup_line84
NOP	
L__settings_store_startup_line192:
; j end address is: 20 (R5)
MOVZ	R5, R4, R0
J	L_settings_store_startup_line77
NOP	
L_settings_store_startup_line84:
;Globals.c,340 :: 		for(j = 0;j < 16;j++){
; j start address is: 20 (R5)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,354 :: 		}
MOVZ	R6, R4, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_settings_store_startup_line76
NOP	
L__settings_store_startup_line88:
;Globals.c,340 :: 		for(j = 0;j < 16;j++){
MOVZ	R5, R6, R0
;Globals.c,354 :: 		}
L_settings_store_startup_line77:
;Globals.c,355 :: 		buffA[i+start_offset+offset] = line1[i];
; i start address is: 20 (R5)
LW	R2, 20(SP)
ADDU	R3, R5, R2
LW	R2, 24(SP)
ADDU	R2, R3, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 72
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,338 :: 		for(i = 0;i < len1;i++){
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 16 (R4)
MOVZ	R4, R2, R0
;Globals.c,356 :: 		}
MOVZ	R10, R4, R0
; i end address is: 16 (R4)
J	L_settings_store_startup_line73
NOP	
L_settings_store_startup_line74:
;Globals.c,361 :: 		for(i = 0; i < offset + len1;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
MOVZ	R4, R5, R0
L_settings_store_startup_line85:
; i start address is: 16 (R4)
LW	R3, 32(SP)
LW	R2, 24(SP)
ADDU	R2, R2, R3
SLTU	R2, R4, R2
BNE	R2, R0, L__settings_store_startup_line193
NOP	
J	L_settings_store_startup_line86
NOP	
L__settings_store_startup_line193:
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
MOVZ	R5, R2, R0
;Globals.c,366 :: 		}
MOVZ	R4, R5, R0
; i end address is: 20 (R5)
J	L_settings_store_startup_line85
NOP	
L_settings_store_startup_line86:
;Globals.c,368 :: 		error = (int)NVMWriteRow(&addA,buffA);
ADDIU	R2, SP, 28
SW	R26, 4(SP)
SH	R25, 8(SP)
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
;Globals.c,373 :: 		}
L_end_settings_store_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 136
JR	RA
NOP	
; end of _settings_store_startup_line
