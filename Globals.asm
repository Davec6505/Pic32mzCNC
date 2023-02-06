_Settings_Init:
;Globals.c,11 :: 		void Settings_Init(short reset_all){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,12 :: 		if(!reset_all){
SW	R25, 4(SP)
BEQ	R25, R0, L__Settings_Init118
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init118:
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
BEQ	R3, R2, L__Settings_Init119
NOP	
J	L_Settings_Init2
NOP	
L__Settings_Init119:
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
;Globals.c,37 :: 		}else if(reset_all > 1){
J	L_Settings_Init3
NOP	
L_Settings_Init2:
SEB	R2, R25
SLTI	R2, R2, 2
BEQ	R2, R0, L__Settings_Init120
NOP	
J	L_Settings_Init4
NOP	
L__Settings_Init120:
;Globals.c,39 :: 		if(!read_ram_loaded_indicator())
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__Settings_Init121
NOP	
J	L_Settings_Init5
NOP	
L__Settings_Init121:
;Globals.c,40 :: 		Save_Row_From_Flash((unsigned long)FLASH_Settings_VAddr_P1);
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
L_Settings_Init5:
;Globals.c,42 :: 		settings.steps_per_mm[X] = ulong2flt(buffA[SPMMX_OFFSET]);
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,43 :: 		settings.steps_per_mm[Y] = ulong2flt(buffA[SPMMX_OFFSET + 1]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,44 :: 		settings.steps_per_mm[Z] = ulong2flt(buffA[SPMMX_OFFSET + 2]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,46 :: 		settings.mm_per_arc_segment = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,47 :: 		settings.default_feed_rate  = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,48 :: 		settings.default_seek_rate  = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,49 :: 		settings.acceleration       = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,50 :: 		settings.junction_deviation = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,51 :: 		settings.homing_feed_rate   = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,52 :: 		settings.homing_seek_rate   = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,53 :: 		settings.homing_debounce_delay  = ulong2flt(buffA[H_DEBNC_DLY_OFFSET]);
LW	R25, Offset(-1610612408)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+58)(GP)
;Globals.c,54 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,55 :: 		settings.stepper_idle_lock_time = ulong2flt(buffA[STEP_IDLE_DLY_OFFSET]);// If max value 255, steppers do not disable.
LW	R25, Offset(-1610612412)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+60)(GP)
;Globals.c,56 :: 		settings.decimal_places         = ulong2flt(buffA[DEC_PLACES_OFFSET]);
LW	R25, Offset(-1610612392)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,57 :: 		settings.n_arc_correction       = ulong2flt(buffA[N_ARC_CORREC_OFFSET]);
LW	R25, Offset(-1610612420)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+52)(GP)
;Globals.c,59 :: 		}
L_Settings_Init4:
L_Settings_Init3:
L_Settings_Init1:
;Globals.c,60 :: 		}
L_end_Settings_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Settings_Init
_Save_Row_From_Flash:
;Globals.c,70 :: 		int Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,75 :: 		ptr = addr;
; ptr start address is: 20 (R5)
MOVZ	R5, R25, R0
;Globals.c,76 :: 		data_count = 0;
; data_count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,77 :: 		for(j = 0;j < 512;j++){
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; data_count end address is: 28 (R7)
; j end address is: 24 (R6)
L_Save_Row_From_Flash6:
; j start address is: 24 (R6)
; data_count start address is: 28 (R7)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
SLTIU	R2, R6, 512
BNE	R2, R0, L__Save_Row_From_Flash123
NOP	
J	L_Save_Row_From_Flash7
NOP	
L__Save_Row_From_Flash123:
; ptr end address is: 20 (R5)
;Globals.c,78 :: 		buffA[j] = *(ptr+j);
; ptr start address is: 20 (R5)
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
ADDU	R2, R5, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,79 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash125
NOP	
J	L__Save_Row_From_Flash116
NOP	
L__Save_Row_From_Flash125:
ADDIU	R2, R7, 1
SEH	R7, R2
; data_count end address is: 28 (R7)
J	L_Save_Row_From_Flash9
NOP	
L__Save_Row_From_Flash116:
L_Save_Row_From_Flash9:
;Globals.c,77 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 28 (R7)
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,84 :: 		}
; ptr end address is: 20 (R5)
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash6
NOP	
L_Save_Row_From_Flash7:
;Globals.c,88 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R7
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,91 :: 		return data_count;
SEH	R2, R7
; data_count end address is: 28 (R7)
;Globals.c,92 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Save_Row_From_Flash
Globals_set_ram_loaded_indicator:
;Globals.c,100 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,101 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,102 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,103 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,106 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,107 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,108 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,111 :: 		int read_ram_loaded_indicator(){
;Globals.c,112 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,113 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
_Settings_Write_Coord_Data:
;Globals.c,143 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Globals.c,145 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,146 :: 		int res=0,recipe = 0;
;Globals.c,147 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,150 :: 		unsigned long temp[4] = {0};
;Globals.c,152 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,155 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,158 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,162 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,164 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data131
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data131:
; recipe end address is: 16 (R4)
;Globals.c,169 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,170 :: 		}
L_Settings_Write_Coord_Data10:
;Globals.c,172 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data11
NOP	
;Globals.c,173 :: 		case 0:break;
L_Settings_Write_Coord_Data13:
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,175 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data14:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,176 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,177 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,178 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,179 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,180 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,181 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,182 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,183 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,185 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,186 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,187 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,188 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data26:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,189 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data27:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,190 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data28:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data12
NOP	
;Globals.c,191 :: 		}
L_Settings_Write_Coord_Data11:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data133
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data133:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data135
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data135:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data137
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data137:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data139
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data139:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data141
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data141:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data143
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data143:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data145
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data145:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data147
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data147:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data149
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data149:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data151
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data151:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data153
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data153:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data155
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data155:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data157
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data157:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data159
NOP	
J	L_Settings_Write_Coord_Data26
NOP	
L__Settings_Write_Coord_Data159:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data161
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data161:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data163
NOP	
J	L_Settings_Write_Coord_Data28
NOP	
L__Settings_Write_Coord_Data163:
L_Settings_Write_Coord_Data12:
;Globals.c,194 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data29:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data164
NOP	
J	L_Settings_Write_Coord_Data30
NOP	
L__Settings_Write_Coord_Data164:
;Globals.c,195 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,194 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,203 :: 		}
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data29
NOP	
L_Settings_Write_Coord_Data30:
;Globals.c,205 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,207 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data32:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data165
NOP	
J	L_Settings_Write_Coord_Data33
NOP	
L__Settings_Write_Coord_Data165:
;Globals.c,208 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 28
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,209 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,207 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,210 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data32
NOP	
L_Settings_Write_Coord_Data33:
;Globals.c,214 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,215 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,231 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,232 :: 		}
;Globals.c,231 :: 		return res;
;Globals.c,232 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,238 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,240 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,245 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data167
NOP	
J	L_settings_read_coord_data35
NOP	
L__settings_read_coord_data167:
;Globals.c,246 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
; add start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
;Globals.c,247 :: 		Save_Row_From_Flash(add);
MOVZ	R25, R2, R0
; add end address is: 8 (R2)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,248 :: 		}else{
J	L_settings_read_coord_data36
NOP	
L_settings_read_coord_data35:
;Globals.c,249 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data37:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data168
NOP	
J	L_settings_read_coord_data38
NOP	
L__settings_read_coord_data168:
;Globals.c,250 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data40:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data169
NOP	
J	L_settings_read_coord_data41
NOP	
L__settings_read_coord_data169:
;Globals.c,251 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,252 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,253 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,250 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,261 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data40
NOP	
L_settings_read_coord_data41:
;Globals.c,249 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,262 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data37
NOP	
L_settings_read_coord_data38:
;Globals.c,263 :: 		}
L_settings_read_coord_data36:
;Globals.c,264 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,269 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Globals.c,272 :: 		unsigned int error = 0;
;Globals.c,277 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,280 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,281 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
; i start address is: 24 (R6)
SEH	R6, R2
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_settings_write_one_coord43:
; i start address is: 24 (R6)
; j start address is: 28 (R7)
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R2, R2
SLTU	R2, R6, R2
BNE	R2, R0, L__settings_write_one_coord171
NOP	
J	L_settings_write_one_coord44
NOP	
L__settings_write_one_coord171:
;Globals.c,283 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,284 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,285 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 44
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,286 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,281 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,291 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord43
NOP	
L_settings_write_one_coord44:
;Globals.c,293 :: 		switch(coord_select){
J	L_settings_write_one_coord46
NOP	
;Globals.c,295 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord48:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,296 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord49:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,297 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord50:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,298 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,299 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,300 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,301 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,302 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,303 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,305 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,306 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,307 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,308 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,309 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,310 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 40(SP)
J	L_settings_write_one_coord47
NOP	
;Globals.c,311 :: 		}
L_settings_write_one_coord46:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord173
NOP	
J	L_settings_write_one_coord48
NOP	
L__settings_write_one_coord173:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord175
NOP	
J	L_settings_write_one_coord49
NOP	
L__settings_write_one_coord175:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord177
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord177:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord179
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord179:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord181
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord181:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord183
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord183:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord185
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord185:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord187
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord187:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord189
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord189:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord191
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord191:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord193
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord193:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord195
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord195:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord197
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord197:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord199
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord199:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord201
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord201:
L_settings_write_one_coord47:
;Globals.c,314 :: 		error =  NVMWriteQuad (add, temp);
ADDIU	R2, SP, 44
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LW	R25, 40(SP)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
; error start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,315 :: 		set_ram_loaded_indicator(error);
SH	R25, 4(SP)
ANDI	R25, R2, 65535
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,317 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
;Globals.c,318 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,323 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,327 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line63
NOP	
;Globals.c,328 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line65:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line64
NOP	
;Globals.c,329 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line66:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line64
NOP	
;Globals.c,330 :: 		}
L_settings_read_startup_line63:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line204
NOP	
J	L_settings_read_startup_line65
NOP	
L__settings_read_startup_line204:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line206
NOP	
J	L_settings_read_startup_line66
NOP	
L__settings_read_startup_line206:
L_settings_read_startup_line64:
;Globals.c,332 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,340 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,341 :: 		}
;Globals.c,340 :: 		return STATUS_OK;
;Globals.c,341 :: 		}
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
;Globals.c,345 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Globals.c,351 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
; str_len start address is: 16 (R4)
SEH	R4, R2
;Globals.c,360 :: 		addA  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,363 :: 		switch(n){
J	L_settings_store_startup_line67
NOP	
;Globals.c,364 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line69:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line68
NOP	
;Globals.c,365 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line70:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line68
NOP	
;Globals.c,366 :: 		}
L_settings_store_startup_line67:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line209
NOP	
J	L_settings_store_startup_line69
NOP	
L__settings_store_startup_line209:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line211
NOP	
J	L_settings_store_startup_line70
NOP	
L__settings_store_startup_line211:
L_settings_store_startup_line68:
;Globals.c,369 :: 		Save_Row_From_Flash(addA);
SH	R4, 12(SP)
LW	R25, 24(SP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,373 :: 		error = (int)NVMErasePage(addA);
SW	R26, 16(SP)
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
;Globals.c,376 :: 		for(i=start_offset;i<start_offset+16;i++)
; i start address is: 20 (R5)
LW	R5, 20(SP)
; str_len end address is: 16 (R4)
; i end address is: 20 (R5)
L_settings_store_startup_line71:
; i start address is: 20 (R5)
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R2, R2, 16
SLTU	R2, R5, R2
BNE	R2, R0, L__settings_store_startup_line212
NOP	
J	L_settings_store_startup_line72
NOP	
L__settings_store_startup_line212:
;Globals.c,377 :: 		buffA[i] = 0;
SLL	R3, R5, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,376 :: 		for(i=start_offset;i<start_offset+16;i++)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,377 :: 		buffA[i] = 0;
; i end address is: 20 (R5)
J	L_settings_store_startup_line71
NOP	
L_settings_store_startup_line72:
;Globals.c,381 :: 		memcpy(buffA+start_offset,line,str_len);
LW	R2, 20(SP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SH	R25, 12(SP)
; str_len end address is: 16 (R4)
SEH	R27, R4
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Globals.c,392 :: 		error = (int)NVMWriteRow(&addA,buffA);
ADDIU	R2, SP, 24
SW	R26, 12(SP)
SH	R25, 16(SP)
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,393 :: 		set_ram_loaded_indicator(error);
SH	R25, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,395 :: 		return error;
SEH	R2, R3
; error end address is: 12 (R3)
;Globals.c,396 :: 		}
;Globals.c,395 :: 		return error;
;Globals.c,396 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,401 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,402 :: 		int error = 0,val_temp = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,407 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting214
NOP	
J	L_settings_store_global_setting74
NOP	
L__settings_store_global_setting214:
;Globals.c,408 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
; add start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
;Globals.c,410 :: 		error = Save_Row_From_Flash(add);
SH	R25, 12(SP)
; add end address is: 8 (R2)
MOVZ	R25, R2, R0
JAL	_Save_Row_From_Flash+0
NOP	
LH	R25, 12(SP)
;Globals.c,411 :: 		}
L_settings_store_global_setting74:
;Globals.c,413 :: 		switch(parameter) {
J	L_settings_store_global_setting75
NOP	
;Globals.c,414 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting77:
L_settings_store_global_setting78:
L_settings_store_global_setting79:
;Globals.c,415 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting215
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting215:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting80:
;Globals.c,417 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,419 :: 		buffA[SPMMX_OFFSET + parameter] = flt2ulong(value);
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 20(SP)
JAL	_flt2ulong+0
NOP	
LW	R3, 20(SP)
SW	R2, 0(R3)
;Globals.c,420 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,421 :: 		case 3:
L_settings_store_global_setting81:
;Globals.c,422 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting216
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting216:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting82:
;Globals.c,423 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,424 :: 		settings.pulse_microseconds = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,426 :: 		buffA[P_MSEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,427 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,428 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting83:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,429 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,430 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,431 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting84:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,432 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,433 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,434 :: 		case 6:
L_settings_store_global_setting85:
;Globals.c,435 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+70)(GP)
;Globals.c,436 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612384)(GP)
;Globals.c,437 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,438 :: 		case 7:
L_settings_store_global_setting86:
;Globals.c,439 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,440 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,441 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,442 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,443 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting87:
;Globals.c,444 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,445 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,446 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,447 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting88:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,448 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,449 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,450 :: 		case 10:
L_settings_store_global_setting89:
;Globals.c,451 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,452 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,453 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,454 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,455 :: 		case 11:
L_settings_store_global_setting90:
;Globals.c,456 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,457 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+52)(GP)
;Globals.c,458 :: 		buffA[N_ARC_CORREC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,459 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,460 :: 		case 12:
L_settings_store_global_setting91:
;Globals.c,461 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,462 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+66)(GP)
;Globals.c,463 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,464 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,465 :: 		case 13:
L_settings_store_global_setting92:
;Globals.c,466 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting218
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting218:
;Globals.c,467 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+54)(GP)
;Globals.c,468 :: 		}else{
J	L_settings_store_global_setting94
NOP	
L_settings_store_global_setting93:
;Globals.c,469 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,470 :: 		}
L_settings_store_global_setting94:
;Globals.c,471 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,472 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting95:
;Globals.c,473 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting220
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting220:
;Globals.c,474 :: 		settings.flags |= BITFLAG_AUTO_START;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,475 :: 		}else{
J	L_settings_store_global_setting97
NOP	
L_settings_store_global_setting96:
;Globals.c,476 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,477 :: 		}
L_settings_store_global_setting97:
;Globals.c,478 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,479 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting98:
;Globals.c,480 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting222
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting222:
;Globals.c,481 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+54)(GP)
;Globals.c,482 :: 		}else{
J	L_settings_store_global_setting100
NOP	
L_settings_store_global_setting99:
;Globals.c,483 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,484 :: 		}
L_settings_store_global_setting100:
;Globals.c,485 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,486 :: 		case 16:
L_settings_store_global_setting101:
;Globals.c,487 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting224
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting224:
;Globals.c,488 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+54)(GP)
;Globals.c,489 :: 		}else{
J	L_settings_store_global_setting103
NOP	
L_settings_store_global_setting102:
;Globals.c,490 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,491 :: 		}
L_settings_store_global_setting103:
;Globals.c,493 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,494 :: 		case 17:
L_settings_store_global_setting104:
;Globals.c,495 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting226
NOP	
J	L_settings_store_global_setting105
NOP	
L__settings_store_global_setting226:
;Globals.c,496 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+54)(GP)
;Globals.c,497 :: 		}else{
J	L_settings_store_global_setting106
NOP	
L_settings_store_global_setting105:
;Globals.c,498 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,499 :: 		}
L_settings_store_global_setting106:
;Globals.c,500 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,501 :: 		case 18:
L_settings_store_global_setting107:
;Globals.c,502 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,503 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+68)(GP)
;Globals.c,504 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,505 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,506 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting108:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,507 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,508 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,509 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting109:
SWC1	S12, Offset(_settings+32)(GP)
;Globals.c,510 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,511 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,512 :: 		case 21:
L_settings_store_global_setting110:
;Globals.c,513 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,514 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+58)(GP)
;Globals.c,515 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,516 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,517 :: 		case 22:
L_settings_store_global_setting111:
;Globals.c,518 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,519 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,520 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,521 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,522 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting112:
;Globals.c,526 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R30, 48411
ORI	R30, R30, 49152
SW	R30, 16(SP)
;Globals.c,527 :: 		error = set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
ADDIU	R2, SP, 16
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,528 :: 		if(!error){
BEQ	R2, R0, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting114
NOP	
L__settings_store_global_setting227:
;Globals.c,530 :: 		Save_Row_From_Flash(add);
LW	R25, 16(SP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,531 :: 		}
L_settings_store_global_setting114:
;Globals.c,533 :: 		break;
J	L_settings_store_global_setting76
NOP	
;Globals.c,534 :: 		default:
L_settings_store_global_setting115:
;Globals.c,535 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,536 :: 		}
L_settings_store_global_setting75:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting77
NOP	
L__settings_store_global_setting229:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting78
NOP	
L__settings_store_global_setting231:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting79
NOP	
L__settings_store_global_setting233:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting235
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting235:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting237
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting237:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting239
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting239:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting241:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting243:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting261:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting263:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting265
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting265:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting267
NOP	
J	L_settings_store_global_setting108
NOP	
L__settings_store_global_setting267:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting269
NOP	
J	L_settings_store_global_setting109
NOP	
L__settings_store_global_setting269:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting271
NOP	
J	L_settings_store_global_setting110
NOP	
L__settings_store_global_setting271:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting273
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting273:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting275
NOP	
J	L_settings_store_global_setting112
NOP	
L__settings_store_global_setting275:
J	L_settings_store_global_setting115
NOP	
L_settings_store_global_setting76:
;Globals.c,537 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,538 :: 		}
;Globals.c,537 :: 		return(STATUS_OK);
;Globals.c,538 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_global_setting
