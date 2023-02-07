_Settings_Init:
;Globals.c,13 :: 		void Settings_Init(short reset_all){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Globals.c,14 :: 		int has_data = 0;
SW	R25, 4(SP)
;Globals.c,16 :: 		if(!reset_all){
BEQ	R25, R0, L__Settings_Init121
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init121:
;Globals.c,18 :: 		sys.abort           = 0;
SB	R0, Offset(_sys+0)(GP)
;Globals.c,19 :: 		sys.state           = 0;
SB	R0, Offset(_sys+1)(GP)
;Globals.c,20 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,21 :: 		sys.execute         = 0;
SB	R0, Offset(_sys+25)(GP)
;Globals.c,22 :: 		sys.auto_start      = 0;
SB	R0, Offset(_sys+24)(GP)
;Globals.c,23 :: 		}else{
J	L_Settings_Init1
NOP	
L_Settings_Init0:
;Globals.c,24 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,25 :: 		has_data = Save_Row_From_Flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
; has_data start address is: 12 (R3)
SEH	R3, R2
; has_data end address is: 12 (R3)
;Globals.c,28 :: 		while(DMA_IsOn(1));
L_Settings_Init2:
; has_data start address is: 12 (R3)
SH	R3, 8(SP)
SB	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LB	R25, 10(SP)
LH	R3, 8(SP)
BNE	R2, R0, L__Settings_Init123
NOP	
J	L_Settings_Init3
NOP	
L__Settings_Init123:
J	L_Settings_Init2
NOP	
L_Settings_Init3:
;Globals.c,29 :: 		dma_printf("has_data:= %d\n",has_data);
ADDIU	R23, SP, 11
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 11
SH	R3, 8(SP)
SB	R25, 10(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LB	R25, 10(SP)
LH	R3, 8(SP)
;Globals.c,31 :: 		if(!has_data){
BEQ	R3, R0, L__Settings_Init124
NOP	
J	L_Settings_Init4
NOP	
L__Settings_Init124:
; has_data end address is: 12 (R3)
;Globals.c,33 :: 		settings.steps_per_mm[X] = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,34 :: 		settings.steps_per_mm[Y] = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,35 :: 		settings.steps_per_mm[Z] = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,36 :: 		settings.steps_per_mm[A]    = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+16)(GP)
;Globals.c,37 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+40)(GP)
;Globals.c,38 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,39 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,40 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+44)(GP)
;Globals.c,41 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,42 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,43 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,44 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+58)(GP)
;Globals.c,45 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,46 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+60)(GP)
;Globals.c,47 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+66)(GP)
;Globals.c,48 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+52)(GP)
;Globals.c,50 :: 		}else{
J	L_Settings_Init5
NOP	
L_Settings_Init4:
;Globals.c,52 :: 		settings.steps_per_mm[X] = ulong2flt(buffA[SPMMX_OFFSET]);
SB	R25, 8(SP)
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,53 :: 		settings.steps_per_mm[Y] = ulong2flt(buffA[SPMMX_OFFSET + 1]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,54 :: 		settings.steps_per_mm[Z] = ulong2flt(buffA[SPMMX_OFFSET + 2]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,56 :: 		settings.mm_per_arc_segment = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,57 :: 		settings.default_feed_rate  = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,58 :: 		settings.default_seek_rate  = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,59 :: 		settings.acceleration       = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,60 :: 		settings.junction_deviation = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,61 :: 		settings.homing_feed_rate   = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,62 :: 		settings.homing_seek_rate   = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,63 :: 		settings.homing_debounce_delay  = ulong2flt(buffA[H_DEBNC_DLY_OFFSET]);
LW	R25, Offset(-1610612408)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+58)(GP)
;Globals.c,64 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,65 :: 		settings.stepper_idle_lock_time = ulong2flt(buffA[STEP_IDLE_DLY_OFFSET]);// If max value 255, steppers do not disable.
LW	R25, Offset(-1610612412)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+60)(GP)
;Globals.c,66 :: 		settings.decimal_places         = ulong2flt(buffA[DEC_PLACES_OFFSET]);
LW	R25, Offset(-1610612392)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,67 :: 		settings.n_arc_correction       = ulong2flt(buffA[N_ARC_CORREC_OFFSET]);
LW	R25, Offset(-1610612420)(GP)
JAL	_ulong2flt+0
NOP	
LB	R25, 8(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+52)(GP)
;Globals.c,69 :: 		}
L_Settings_Init5:
;Globals.c,70 :: 		}
L_Settings_Init1:
;Globals.c,71 :: 		}
L_end_Settings_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Settings_Init
_Save_Row_From_Flash:
;Globals.c,81 :: 		int Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Globals.c,86 :: 		ptr = addr;
SW	R25, 12(SP)
;Globals.c,87 :: 		data_count = 0;
SH	R0, 16(SP)
;Globals.c,88 :: 		for(j = 0;j < 512;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
MOVZ	R6, R5, R0
L_Save_Row_From_Flash6:
; j start address is: 24 (R6)
SLTIU	R2, R6, 512
BNE	R2, R0, L__Save_Row_From_Flash126
NOP	
J	L_Save_Row_From_Flash7
NOP	
L__Save_Row_From_Flash126:
;Globals.c,89 :: 		buffA[j] = *(ptr+j);
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
LW	R2, 12(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,90 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash128
NOP	
J	L_Save_Row_From_Flash9
NOP	
L__Save_Row_From_Flash128:
LH	R2, 16(SP)
ADDIU	R2, R2, 1
SH	R2, 16(SP)
L_Save_Row_From_Flash9:
;Globals.c,92 :: 		while(DMA_IsOn(1));
MOVZ	R4, R6, R0
; j end address is: 24 (R6)
L_Save_Row_From_Flash10:
; j start address is: 16 (R4)
SW	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R4, 4(SP)
BNE	R2, R0, L__Save_Row_From_Flash130
NOP	
J	L_Save_Row_From_Flash11
NOP	
L__Save_Row_From_Flash130:
J	L_Save_Row_From_Flash10
NOP	
L_Save_Row_From_Flash11:
;Globals.c,93 :: 		dma_printf("buffA[%l]:= %l\n",j,buffA[j]);
SLL	R3, R4, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
ADDIU	R23, SP, 18
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr2_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 18
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
;Globals.c,88 :: 		for(j = 0;j < 512;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 24 (R6)
MOVZ	R6, R2, R0
;Globals.c,95 :: 		}
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash6
NOP	
L_Save_Row_From_Flash7:
;Globals.c,99 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
LH	R25, 16(SP)
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,102 :: 		return data_count;
LH	R2, 16(SP)
;Globals.c,103 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _Save_Row_From_Flash
Globals_set_ram_loaded_indicator:
;Globals.c,111 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,112 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,113 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,114 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,117 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,118 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,119 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,122 :: 		int read_ram_loaded_indicator(){
;Globals.c,123 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,124 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
_Settings_Write_Coord_Data:
;Globals.c,154 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Globals.c,156 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,157 :: 		int res=0,recipe = 0;
;Globals.c,158 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 24
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,160 :: 		unsigned long temp[4] = {0};
;Globals.c,162 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,165 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,168 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
SW	R26, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,172 :: 		error = (int)NVMErasePage(add);
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,174 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data136
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data136:
; recipe end address is: 16 (R4)
;Globals.c,179 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,180 :: 		}
L_Settings_Write_Coord_Data12:
;Globals.c,182 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data13
NOP	
;Globals.c,183 :: 		case 0:break;
L_Settings_Write_Coord_Data15:
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,185 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,186 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,187 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,188 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,189 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,190 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,191 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,192 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,193 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,195 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,196 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data26:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,197 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data27:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,198 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data28:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,199 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data29:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,200 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data30:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,201 :: 		}
L_Settings_Write_Coord_Data13:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data138
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data138:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data140
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data140:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data142
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data142:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data144
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data144:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data146
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data146:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data148
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data148:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data150
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data150:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data152
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data152:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data154
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data154:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data156
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data156:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data158
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data158:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data160
NOP	
J	L_Settings_Write_Coord_Data26
NOP	
L__Settings_Write_Coord_Data160:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data162
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data162:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data164
NOP	
J	L_Settings_Write_Coord_Data28
NOP	
L__Settings_Write_Coord_Data164:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data166
NOP	
J	L_Settings_Write_Coord_Data29
NOP	
L__Settings_Write_Coord_Data166:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data168
NOP	
J	L_Settings_Write_Coord_Data30
NOP	
L__Settings_Write_Coord_Data168:
L_Settings_Write_Coord_Data14:
;Globals.c,204 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data31:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data169
NOP	
J	L_Settings_Write_Coord_Data32
NOP	
L__Settings_Write_Coord_Data169:
;Globals.c,205 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 24
SLL	R3, R5, 2
ADDU	R2, R2, R3
SW	R2, 40(SP)
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
LW	R3, 40(SP)
SW	R2, 0(R3)
;Globals.c,204 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,213 :: 		}
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data31
NOP	
L_Settings_Write_Coord_Data32:
;Globals.c,215 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,217 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data34:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data170
NOP	
J	L_Settings_Write_Coord_Data35
NOP	
L__Settings_Write_Coord_Data170:
;Globals.c,218 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 24
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,219 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,217 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,220 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data34
NOP	
L_Settings_Write_Coord_Data35:
;Globals.c,224 :: 		res = NVMWriteRow(&add,buffA);
SW	R26, 8(SP)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,225 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,241 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,242 :: 		}
;Globals.c,241 :: 		return res;
;Globals.c,242 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,248 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,250 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,255 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data172
NOP	
J	L_settings_read_coord_data37
NOP	
L__settings_read_coord_data172:
;Globals.c,256 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,257 :: 		Save_Row_From_Flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,258 :: 		}else{
J	L_settings_read_coord_data38
NOP	
L_settings_read_coord_data37:
;Globals.c,259 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data39:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data173
NOP	
J	L_settings_read_coord_data40
NOP	
L__settings_read_coord_data173:
;Globals.c,260 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data42:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data174
NOP	
J	L_settings_read_coord_data43
NOP	
L__settings_read_coord_data174:
;Globals.c,261 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,262 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,263 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,260 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,271 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data42
NOP	
L_settings_read_coord_data43:
;Globals.c,259 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,272 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data39
NOP	
L_settings_read_coord_data40:
;Globals.c,273 :: 		}
L_settings_read_coord_data38:
;Globals.c,274 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,279 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Globals.c,282 :: 		unsigned int error = 0;
;Globals.c,287 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,290 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,291 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
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
BNE	R2, R0, L__settings_write_one_coord176
NOP	
J	L_settings_write_one_coord46
NOP	
L__settings_write_one_coord176:
;Globals.c,293 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,294 :: 		temp[j] = flt2ulong(coord_data[j]);
ADDIU	R2, SP, 40
SLL	R3, R7, 2
ADDU	R2, R2, R3
SW	R2, 56(SP)
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
LW	R3, 56(SP)
SW	R2, 0(R3)
;Globals.c,295 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 40
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,296 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,291 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,301 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord45
NOP	
L_settings_write_one_coord46:
;Globals.c,303 :: 		switch(coord_select){
J	L_settings_write_one_coord48
NOP	
;Globals.c,305 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord50:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,306 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,307 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,308 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,309 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,310 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,311 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,312 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,313 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,315 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,316 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,317 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,318 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,319 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,320 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord64:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord49
NOP	
;Globals.c,321 :: 		}
L_settings_write_one_coord48:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord178
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord178:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord180
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord180:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord182
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord182:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord184
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord184:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord186
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord186:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord188
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord188:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord190
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord190:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord192
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord192:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord194
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord194:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord196
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord196:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord198
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord198:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord200
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord200:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord202
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord202:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord204
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord204:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord206
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord206:
L_settings_write_one_coord49:
;Globals.c,324 :: 		error =  NVMWriteQuad (add, temp);
ADDIU	R2, SP, 40
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LW	R25, Offset(_add+0)(GP)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
; error start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,325 :: 		set_ram_loaded_indicator(error);
SH	R25, 4(SP)
ANDI	R25, R2, 65535
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,327 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
;Globals.c,328 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,333 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,336 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line65
NOP	
;Globals.c,337 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line67:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line66
NOP	
;Globals.c,338 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line68:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line66
NOP	
;Globals.c,339 :: 		}
L_settings_read_startup_line65:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line209
NOP	
J	L_settings_read_startup_line67
NOP	
L__settings_read_startup_line209:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line211
NOP	
J	L_settings_read_startup_line68
NOP	
L__settings_read_startup_line211:
L_settings_read_startup_line66:
;Globals.c,341 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,349 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,350 :: 		}
;Globals.c,349 :: 		return STATUS_OK;
;Globals.c,350 :: 		}
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
;Globals.c,354 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Globals.c,360 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
SH	R2, 24(SP)
;Globals.c,369 :: 		add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,372 :: 		switch(n){
J	L_settings_store_startup_line69
NOP	
;Globals.c,373 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line71:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line70
NOP	
;Globals.c,374 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line72:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line70
NOP	
;Globals.c,375 :: 		}
L_settings_store_startup_line69:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line214
NOP	
J	L_settings_store_startup_line71
NOP	
L__settings_store_startup_line214:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line216
NOP	
J	L_settings_store_startup_line72
NOP	
L__settings_store_startup_line216:
L_settings_store_startup_line70:
;Globals.c,378 :: 		Save_Row_From_Flash(add);
SW	R26, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,382 :: 		error = (int)NVMErasePage(add);
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
;Globals.c,385 :: 		for(i=start_offset;i<start_offset+16;i++)
; i start address is: 20 (R5)
LW	R5, 20(SP)
; i end address is: 20 (R5)
MOVZ	R4, R5, R0
L_settings_store_startup_line73:
; i start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R2, R2, 16
SLTU	R2, R4, R2
BNE	R2, R0, L__settings_store_startup_line217
NOP	
J	L_settings_store_startup_line74
NOP	
L__settings_store_startup_line217:
;Globals.c,386 :: 		buffA[i] = 0;
SLL	R3, R4, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,385 :: 		for(i=start_offset;i<start_offset+16;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
MOVZ	R5, R2, R0
;Globals.c,386 :: 		buffA[i] = 0;
MOVZ	R4, R5, R0
; i end address is: 20 (R5)
J	L_settings_store_startup_line73
NOP	
L_settings_store_startup_line74:
;Globals.c,390 :: 		memcpy(buffA+start_offset,line,str_len);
LW	R2, 20(SP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SH	R25, 12(SP)
LH	R27, 24(SP)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Globals.c,401 :: 		error = (int)NVMWriteRow(&add,buffA);
SW	R26, 12(SP)
SH	R25, 16(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,402 :: 		set_ram_loaded_indicator(error);
SH	R25, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,404 :: 		return error;
SEH	R2, R3
; error end address is: 12 (R3)
;Globals.c,405 :: 		}
;Globals.c,404 :: 		return error;
;Globals.c,405 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,410 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Globals.c,411 :: 		int error = 0,val_temp = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,416 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting219
NOP	
J	L_settings_store_global_setting76
NOP	
L__settings_store_global_setting219:
;Globals.c,417 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,419 :: 		error = Save_Row_From_Flash(add);
SH	R25, 12(SP)
SWC1	S12, 16(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
LWC1	S12, 16(SP)
LH	R25, 12(SP)
;Globals.c,420 :: 		}
L_settings_store_global_setting76:
;Globals.c,422 :: 		switch(parameter) {
J	L_settings_store_global_setting77
NOP	
;Globals.c,423 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting79:
L_settings_store_global_setting80:
L_settings_store_global_setting81:
;Globals.c,424 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting220
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting220:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting82:
;Globals.c,426 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,428 :: 		buffA[SPMMX_OFFSET + parameter] = flt2ulong(value);
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 32(SP)
JAL	_flt2ulong+0
NOP	
LW	R3, 32(SP)
SW	R2, 0(R3)
;Globals.c,429 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,430 :: 		case 3:
L_settings_store_global_setting83:
;Globals.c,431 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting221
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting221:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting84:
;Globals.c,432 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,433 :: 		settings.pulse_microseconds = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,435 :: 		buffA[P_MSEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,436 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,437 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting85:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,438 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,439 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,440 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting86:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,441 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,442 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,443 :: 		case 6:
L_settings_store_global_setting87:
;Globals.c,444 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+70)(GP)
;Globals.c,445 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612384)(GP)
;Globals.c,446 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,447 :: 		case 7:
L_settings_store_global_setting88:
;Globals.c,448 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,449 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,450 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,451 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,452 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting89:
;Globals.c,453 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,454 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,455 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,456 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting90:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,457 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,458 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,459 :: 		case 10:
L_settings_store_global_setting91:
;Globals.c,460 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,461 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,462 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,463 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,464 :: 		case 11:
L_settings_store_global_setting92:
;Globals.c,465 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,466 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+52)(GP)
;Globals.c,467 :: 		buffA[N_ARC_CORREC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,468 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,469 :: 		case 12:
L_settings_store_global_setting93:
;Globals.c,470 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,471 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+66)(GP)
;Globals.c,472 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,473 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,474 :: 		case 13:
L_settings_store_global_setting94:
;Globals.c,475 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting223
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting223:
;Globals.c,476 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+54)(GP)
;Globals.c,477 :: 		}else{
J	L_settings_store_global_setting96
NOP	
L_settings_store_global_setting95:
;Globals.c,478 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,479 :: 		}
L_settings_store_global_setting96:
;Globals.c,480 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,481 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting97:
;Globals.c,482 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting225
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting225:
;Globals.c,483 :: 		settings.flags |= BITFLAG_AUTO_START;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,484 :: 		}else{
J	L_settings_store_global_setting99
NOP	
L_settings_store_global_setting98:
;Globals.c,485 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,486 :: 		}
L_settings_store_global_setting99:
;Globals.c,487 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,488 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting100:
;Globals.c,489 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting227:
;Globals.c,490 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+54)(GP)
;Globals.c,491 :: 		}else{
J	L_settings_store_global_setting102
NOP	
L_settings_store_global_setting101:
;Globals.c,492 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,493 :: 		}
L_settings_store_global_setting102:
;Globals.c,494 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,495 :: 		case 16:
L_settings_store_global_setting103:
;Globals.c,496 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting229:
;Globals.c,497 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+54)(GP)
;Globals.c,498 :: 		}else{
J	L_settings_store_global_setting105
NOP	
L_settings_store_global_setting104:
;Globals.c,499 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,500 :: 		}
L_settings_store_global_setting105:
;Globals.c,502 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,503 :: 		case 17:
L_settings_store_global_setting106:
;Globals.c,504 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting231:
;Globals.c,505 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+54)(GP)
;Globals.c,506 :: 		}else{
J	L_settings_store_global_setting108
NOP	
L_settings_store_global_setting107:
;Globals.c,507 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,508 :: 		}
L_settings_store_global_setting108:
;Globals.c,509 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,510 :: 		case 18:
L_settings_store_global_setting109:
;Globals.c,511 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,512 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+68)(GP)
;Globals.c,513 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,514 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,515 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting110:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,516 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,517 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,518 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting111:
SWC1	S12, Offset(_settings+32)(GP)
;Globals.c,519 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,520 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,521 :: 		case 21:
L_settings_store_global_setting112:
;Globals.c,522 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,523 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+58)(GP)
;Globals.c,524 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,525 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,526 :: 		case 22:
L_settings_store_global_setting113:
;Globals.c,527 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,528 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,529 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,530 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,531 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting114:
;Globals.c,532 :: 		if(value){
BNE	R24, R0, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting115
NOP	
L__settings_store_global_setting233:
;Globals.c,533 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,534 :: 		error = (int)NVMWriteRow(&add,buffA);
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
; error start address is: 12 (R3)
SEH	R3, R2
; error end address is: 12 (R3)
;Globals.c,537 :: 		while(DMA_IsOn(1));
L_settings_store_global_setting116:
; error start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L__settings_store_global_setting235
NOP	
J	L_settings_store_global_setting117
NOP	
L__settings_store_global_setting235:
J	L_settings_store_global_setting116
NOP	
L_settings_store_global_setting117:
;Globals.c,538 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr3_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
SH	R3, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 14(SP)
LH	R3, 12(SP)
;Globals.c,540 :: 		if(!error){
BEQ	R3, R0, L__settings_store_global_setting236
NOP	
J	L_settings_store_global_setting118
NOP	
L__settings_store_global_setting236:
; error end address is: 12 (R3)
;Globals.c,542 :: 		Save_Row_From_Flash(add);
SH	R25, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
LH	R25, 12(SP)
;Globals.c,543 :: 		}
L_settings_store_global_setting118:
;Globals.c,544 :: 		}
L_settings_store_global_setting115:
;Globals.c,545 :: 		break;
J	L_settings_store_global_setting78
NOP	
;Globals.c,546 :: 		default:
L_settings_store_global_setting119:
;Globals.c,547 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,548 :: 		}
L_settings_store_global_setting77:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting238
NOP	
J	L_settings_store_global_setting79
NOP	
L__settings_store_global_setting238:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting240
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting240:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting242
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting242:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting244
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting244:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting246
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting246:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting248
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting248:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting250
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting250:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting252
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting252:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting254
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting254:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting256
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting256:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting258
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting258:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting260
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting260:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting262
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting262:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting264
NOP	
J	L_settings_store_global_setting94
NOP	
L__settings_store_global_setting264:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting266
NOP	
J	L_settings_store_global_setting97
NOP	
L__settings_store_global_setting266:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting268
NOP	
J	L_settings_store_global_setting100
NOP	
L__settings_store_global_setting268:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting270
NOP	
J	L_settings_store_global_setting103
NOP	
L__settings_store_global_setting270:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting272
NOP	
J	L_settings_store_global_setting106
NOP	
L__settings_store_global_setting272:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting274
NOP	
J	L_settings_store_global_setting109
NOP	
L__settings_store_global_setting274:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting276
NOP	
J	L_settings_store_global_setting110
NOP	
L__settings_store_global_setting276:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting278
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting278:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting280
NOP	
J	L_settings_store_global_setting112
NOP	
L__settings_store_global_setting280:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting282
NOP	
J	L_settings_store_global_setting113
NOP	
L__settings_store_global_setting282:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting284
NOP	
J	L_settings_store_global_setting114
NOP	
L__settings_store_global_setting284:
J	L_settings_store_global_setting119
NOP	
L_settings_store_global_setting78:
;Globals.c,549 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,550 :: 		}
;Globals.c,549 :: 		return(STATUS_OK);
;Globals.c,550 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _settings_store_global_setting
