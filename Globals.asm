_Settings_Init:
;Globals.c,13 :: 		void Settings_Init(short reset_all){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,14 :: 		int has_data = 0;
SW	R25, 4(SP)
;Globals.c,16 :: 		if(!reset_all){
BEQ	R25, R0, L__Settings_Init126
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init126:
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
;Globals.c,31 :: 		if(!has_data){
BEQ	R2, R0, L__Settings_Init127
NOP	
J	L_Settings_Init2
NOP	
L__Settings_Init127:
;Globals.c,33 :: 		settings.steps_per_mm[X]   = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,34 :: 		buffA[SPMMX_OFFSET]        = flt2ulong(settings.steps_per_mm[X]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612480)(GP)
;Globals.c,35 :: 		settings.steps_per_mm[Y]   = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,36 :: 		buffA[SPMMY_OFFSET]        = flt2ulong(settings.steps_per_mm[Y]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612476)(GP)
;Globals.c,37 :: 		settings.steps_per_mm[Z]   = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,38 :: 		buffA[SPMMZ_OFFSET]        = flt2ulong(settings.steps_per_mm[Z]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612472)(GP)
;Globals.c,39 :: 		settings.steps_per_mm[A]   = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+16)(GP)
;Globals.c,41 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+40)(GP)
;Globals.c,42 :: 		buffA[MM_ARC_SEG_OFFSET]    =  flt2ulong(settings.mm_per_arc_segment);
LUI	R2, 16204
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,44 :: 		settings.default_feed_rate = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,45 :: 		buffA[D_FEED_RATE_OFFSET]  = flt2ulong(settings.default_feed_rate);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,47 :: 		settings.default_seek_rate = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,48 :: 		buffA[D_SEEK_RATE_OFFSET]  = flt2ulong(settings.default_seek_rate);
LUI	R2, 17402
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,50 :: 		settings.acceleration      = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+44)(GP)
;Globals.c,51 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(settings.acceleration);
LUI	R2, 18188
ORI	R2, R2, 40960
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,53 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,54 :: 		buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(settings.junction_deviation);
LUI	R2, 15692
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,56 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,57 :: 		buffA[H_FEED_RATE_OFFSET]   = flt2ulong(settings.homing_feed_rate);
LUI	R2, 16840
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,59 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,60 :: 		buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(settings.homing_seek_rate);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,62 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+58)(GP)
;Globals.c,63 :: 		buffA[H_DEBNC_DLY_OFFSET]   = flt2ulong(settings.homing_debounce_delay);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612408)(GP)
;Globals.c,65 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,66 :: 		buffA[H_PULL_OFF_OFFSET]    = flt2ulong(settings.homing_pulloff);
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,68 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+60)(GP)
;Globals.c,69 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = flt2ulong(settings.stepper_idle_lock_time);
LUI	R2, 16840
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612404)(GP)
;Globals.c,71 :: 		settings.decimal_places     = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+66)(GP)
;Globals.c,72 :: 		buffA[DEC_PLACES_OFFSET]    = flt2ulong(settings.decimal_places);
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612392)(GP)
;Globals.c,74 :: 		settings.n_arc_correction   = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+52)(GP)
;Globals.c,75 :: 		buffA[N_ARC_CORREC_OFFSET]  = flt2ulong(N_ARC_CORREC_OFFSET);
LUI	R2, 17054
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612420)(GP)
;Globals.c,82 :: 		}else{
J	L_Settings_Init3
NOP	
L_Settings_Init2:
;Globals.c,83 :: 		settings.flags = 0;
SH	R0, Offset(_settings+54)(GP)
;Globals.c,84 :: 		if (DEFAULT_REPORT_INCHES) { settings.flags |= BITFLAG_REPORT_INCHES; }
L_Settings_Init4:
;Globals.c,85 :: 		if (DEFAULT_AUTO_START) { settings.flags |= BITFLAG_AUTO_START; }
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,86 :: 		if (DEFAULT_INVERT_ST_ENABLE) { settings.flags |= BITFLAG_INVERT_ST_ENABLE; }
L_Settings_Init6:
;Globals.c,87 :: 		if (DEFAULT_HARD_LIMIT_ENABLE) { settings.flags |= BITFLAG_HARD_LIMIT_ENABLE; }
L_Settings_Init7:
;Globals.c,88 :: 		if (DEFAULT_HOMING_ENABLE) { settings.flags |= BITFLAG_HOMING_ENABLE; }
L_Settings_Init8:
;Globals.c,90 :: 		settings.steps_per_mm[X] = ulong2flt(buffA[SPMMX_OFFSET]);
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,91 :: 		settings.steps_per_mm[Y] = ulong2flt(buffA[SPMMX_OFFSET + 1]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,92 :: 		settings.steps_per_mm[Z] = ulong2flt(buffA[SPMMX_OFFSET + 2]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,94 :: 		settings.mm_per_arc_segment = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,95 :: 		settings.default_feed_rate  = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,96 :: 		settings.default_seek_rate  = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,97 :: 		settings.acceleration       = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,98 :: 		settings.junction_deviation = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,99 :: 		settings.homing_feed_rate   = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,100 :: 		settings.homing_seek_rate   = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,101 :: 		settings.homing_debounce_delay  = ulong2flt(buffA[H_DEBNC_DLY_OFFSET]);
LW	R25, Offset(-1610612408)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+58)(GP)
;Globals.c,102 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,103 :: 		settings.stepper_idle_lock_time = ulong2flt(buffA[STEP_IDLE_DLY_OFFSET]);// If max value 255, steppers do not disable.
LW	R25, Offset(-1610612412)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+60)(GP)
;Globals.c,104 :: 		settings.decimal_places         = ulong2flt(buffA[DEC_PLACES_OFFSET]);
LW	R25, Offset(-1610612392)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,105 :: 		settings.n_arc_correction       = ulong2flt(buffA[N_ARC_CORREC_OFFSET]);
LW	R25, Offset(-1610612420)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+52)(GP)
;Globals.c,107 :: 		}
L_Settings_Init3:
;Globals.c,108 :: 		}
L_Settings_Init1:
;Globals.c,109 :: 		}
L_end_Settings_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Settings_Init
_Save_Row_From_Flash:
;Globals.c,119 :: 		int Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,124 :: 		ptr = addr;
; ptr start address is: 20 (R5)
MOVZ	R5, R25, R0
;Globals.c,125 :: 		data_count = 0;
; data_count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,126 :: 		for(j = 0;j < 512;j++){
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; data_count end address is: 28 (R7)
; j end address is: 24 (R6)
L_Save_Row_From_Flash9:
; j start address is: 24 (R6)
; data_count start address is: 28 (R7)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
SLTIU	R2, R6, 512
BNE	R2, R0, L__Save_Row_From_Flash129
NOP	
J	L_Save_Row_From_Flash10
NOP	
L__Save_Row_From_Flash129:
; ptr end address is: 20 (R5)
;Globals.c,127 :: 		buffA[j] = *(ptr+j);
; ptr start address is: 20 (R5)
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
ADDU	R2, R5, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,128 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Save_Row_From_Flash131
NOP	
J	L__Save_Row_From_Flash124
NOP	
L__Save_Row_From_Flash131:
ADDIU	R2, R7, 1
SEH	R7, R2
; data_count end address is: 28 (R7)
J	L_Save_Row_From_Flash12
NOP	
L__Save_Row_From_Flash124:
L_Save_Row_From_Flash12:
;Globals.c,126 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 28 (R7)
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,133 :: 		}
; ptr end address is: 20 (R5)
; j end address is: 24 (R6)
J	L_Save_Row_From_Flash9
NOP	
L_Save_Row_From_Flash10:
;Globals.c,137 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R7
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,140 :: 		return data_count;
SEH	R2, R7
; data_count end address is: 28 (R7)
;Globals.c,141 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Save_Row_From_Flash
Globals_set_ram_loaded_indicator:
;Globals.c,149 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,150 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,151 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,152 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,155 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,156 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,157 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,160 :: 		int read_ram_loaded_indicator(){
;Globals.c,161 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,162 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
_Settings_Write_Coord_Data:
;Globals.c,192 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Globals.c,194 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,195 :: 		int res=0,recipe = 0;
;Globals.c,196 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 24
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,198 :: 		unsigned long temp[4] = {0};
;Globals.c,200 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,203 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,206 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,210 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,212 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data137
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data137:
; recipe end address is: 16 (R4)
;Globals.c,217 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,218 :: 		}
L_Settings_Write_Coord_Data13:
;Globals.c,220 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,221 :: 		case 0:break;
L_Settings_Write_Coord_Data16:
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,223 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,224 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,225 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,226 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,227 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,228 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,229 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,230 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,231 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,233 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data26:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,234 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data27:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,235 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data28:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,236 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data29:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,237 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data30:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,238 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data31:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,239 :: 		}
L_Settings_Write_Coord_Data14:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data139
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data139:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data141
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data141:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data143
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data143:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data145
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data145:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data147
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data147:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data149
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data149:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data151
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data151:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data153
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data153:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data155
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data155:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data157
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data157:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data159
NOP	
J	L_Settings_Write_Coord_Data26
NOP	
L__Settings_Write_Coord_Data159:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data161
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data161:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data163
NOP	
J	L_Settings_Write_Coord_Data28
NOP	
L__Settings_Write_Coord_Data163:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data165
NOP	
J	L_Settings_Write_Coord_Data29
NOP	
L__Settings_Write_Coord_Data165:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data167
NOP	
J	L_Settings_Write_Coord_Data30
NOP	
L__Settings_Write_Coord_Data167:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data169
NOP	
J	L_Settings_Write_Coord_Data31
NOP	
L__Settings_Write_Coord_Data169:
L_Settings_Write_Coord_Data15:
;Globals.c,242 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data32:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data170
NOP	
J	L_Settings_Write_Coord_Data33
NOP	
L__Settings_Write_Coord_Data170:
;Globals.c,243 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,242 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,251 :: 		}
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data32
NOP	
L_Settings_Write_Coord_Data33:
;Globals.c,253 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,255 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data35:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data171
NOP	
J	L_Settings_Write_Coord_Data36
NOP	
L__Settings_Write_Coord_Data171:
;Globals.c,256 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 24
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,257 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,255 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,258 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data35
NOP	
L_Settings_Write_Coord_Data36:
;Globals.c,262 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,263 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,279 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,280 :: 		}
;Globals.c,279 :: 		return res;
;Globals.c,280 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,286 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,288 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,293 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data173
NOP	
J	L_settings_read_coord_data38
NOP	
L__settings_read_coord_data173:
;Globals.c,294 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,295 :: 		Save_Row_From_Flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,296 :: 		}else{
J	L_settings_read_coord_data39
NOP	
L_settings_read_coord_data38:
;Globals.c,297 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data40:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data174
NOP	
J	L_settings_read_coord_data41
NOP	
L__settings_read_coord_data174:
;Globals.c,298 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data43:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data175
NOP	
J	L_settings_read_coord_data44
NOP	
L__settings_read_coord_data175:
;Globals.c,299 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,300 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,301 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,298 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,309 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data43
NOP	
L_settings_read_coord_data44:
;Globals.c,297 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,310 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data40
NOP	
L_settings_read_coord_data41:
;Globals.c,311 :: 		}
L_settings_read_coord_data39:
;Globals.c,312 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,317 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Globals.c,320 :: 		unsigned int error = 0;
;Globals.c,325 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,328 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,329 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
; i start address is: 24 (R6)
SEH	R6, R2
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_settings_write_one_coord46:
; i start address is: 24 (R6)
; j start address is: 28 (R7)
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R2, R2
SLTU	R2, R6, R2
BNE	R2, R0, L__settings_write_one_coord177
NOP	
J	L_settings_write_one_coord47
NOP	
L__settings_write_one_coord177:
;Globals.c,331 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,332 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,333 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 40
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,334 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,329 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,339 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord46
NOP	
L_settings_write_one_coord47:
;Globals.c,341 :: 		switch(coord_select){
J	L_settings_write_one_coord49
NOP	
;Globals.c,343 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,344 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,345 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,346 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,347 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,348 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,349 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,350 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,351 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,353 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,354 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,355 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,356 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,357 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord64:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,358 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord65:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord50
NOP	
;Globals.c,359 :: 		}
L_settings_write_one_coord49:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord179
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord179:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord181
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord181:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord183
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord183:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord185
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord185:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord187
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord187:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord189
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord189:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord191
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord191:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord193
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord193:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord195
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord195:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord197
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord197:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord199
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord199:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord201
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord201:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord203
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord203:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord205
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord205:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord207
NOP	
J	L_settings_write_one_coord65
NOP	
L__settings_write_one_coord207:
L_settings_write_one_coord50:
;Globals.c,362 :: 		error =  NVMWriteQuad (add, temp);
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
;Globals.c,363 :: 		set_ram_loaded_indicator(error);
SH	R25, 4(SP)
ANDI	R25, R2, 65535
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,365 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
;Globals.c,366 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,371 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,374 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line66
NOP	
;Globals.c,375 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line68:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line67
NOP	
;Globals.c,376 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line69:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line67
NOP	
;Globals.c,377 :: 		}
L_settings_read_startup_line66:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line210
NOP	
J	L_settings_read_startup_line68
NOP	
L__settings_read_startup_line210:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line212
NOP	
J	L_settings_read_startup_line69
NOP	
L__settings_read_startup_line212:
L_settings_read_startup_line67:
;Globals.c,379 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,387 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,388 :: 		}
;Globals.c,387 :: 		return STATUS_OK;
;Globals.c,388 :: 		}
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
;Globals.c,392 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Globals.c,398 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
SH	R2, 24(SP)
;Globals.c,407 :: 		add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,410 :: 		switch(n){
J	L_settings_store_startup_line70
NOP	
;Globals.c,411 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line72:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line71
NOP	
;Globals.c,412 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line73:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line71
NOP	
;Globals.c,413 :: 		}
L_settings_store_startup_line70:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line215
NOP	
J	L_settings_store_startup_line72
NOP	
L__settings_store_startup_line215:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line217
NOP	
J	L_settings_store_startup_line73
NOP	
L__settings_store_startup_line217:
L_settings_store_startup_line71:
;Globals.c,416 :: 		Save_Row_From_Flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
;Globals.c,420 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
;Globals.c,423 :: 		for(i=start_offset;i<start_offset+16;i++)
; i start address is: 20 (R5)
LW	R5, 20(SP)
; i end address is: 20 (R5)
MOVZ	R4, R5, R0
L_settings_store_startup_line74:
; i start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R2, R2, 16
SLTU	R2, R4, R2
BNE	R2, R0, L__settings_store_startup_line218
NOP	
J	L_settings_store_startup_line75
NOP	
L__settings_store_startup_line218:
;Globals.c,424 :: 		buffA[i] = 0;
SLL	R3, R4, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,423 :: 		for(i=start_offset;i<start_offset+16;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
MOVZ	R5, R2, R0
;Globals.c,424 :: 		buffA[i] = 0;
MOVZ	R4, R5, R0
; i end address is: 20 (R5)
J	L_settings_store_startup_line74
NOP	
L_settings_store_startup_line75:
;Globals.c,428 :: 		memcpy(buffA+start_offset,line,str_len);
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
;Globals.c,439 :: 		error = (int)NVMWriteRow(&add,buffA);
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
;Globals.c,440 :: 		set_ram_loaded_indicator(error);
SH	R25, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,442 :: 		return error;
SEH	R2, R3
; error end address is: 12 (R3)
;Globals.c,443 :: 		}
;Globals.c,442 :: 		return error;
;Globals.c,443 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,448 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Globals.c,449 :: 		int error = 0,val_temp = 0;
SW	R26, 4(SP)
;Globals.c,451 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,455 :: 		while(DMA_IsOn(1));
L_settings_store_global_setting77:
SH	R25, 8(SP)
SWC1	S12, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LWC1	S12, 12(SP)
LH	R25, 8(SP)
BNE	R2, R0, L__settings_store_global_setting221
NOP	
J	L_settings_store_global_setting78
NOP	
L__settings_store_global_setting221:
J	L_settings_store_global_setting77
NOP	
L_settings_store_global_setting78:
;Globals.c,456 :: 		dma_printf("param:= %d & value:= %f\n",parameter,value);
ADDIU	R23, SP, 16
ADDIU	R22, R23, 25
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R25, 8(SP)
SWC1	S12, 12(SP)
ADDIU	SP, SP, -12
SWC1	S12, 8(SP)
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LWC1	S12, 12(SP)
LH	R25, 8(SP)
;Globals.c,459 :: 		switch(parameter) {
J	L_settings_store_global_setting79
NOP	
;Globals.c,460 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting81:
L_settings_store_global_setting82:
L_settings_store_global_setting83:
;Globals.c,461 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting222
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting222:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting84:
;Globals.c,463 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,465 :: 		buffA[SPMMX_OFFSET + parameter] = flt2ulong(value);
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 68(SP)
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
LW	R3, 68(SP)
SW	R2, 0(R3)
;Globals.c,466 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,467 :: 		case 3:
L_settings_store_global_setting85:
;Globals.c,468 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting223
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting223:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting86:
;Globals.c,469 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,470 :: 		settings.pulse_microseconds = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,472 :: 		buffA[P_MSEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,473 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,474 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting87:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,475 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612452)(GP)
;Globals.c,476 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,477 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting88:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,478 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612448)(GP)
;Globals.c,479 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,480 :: 		case 6:
L_settings_store_global_setting89:
;Globals.c,481 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+70)(GP)
;Globals.c,482 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
SH	R25, 8(SP)
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612384)(GP)
;Globals.c,483 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,484 :: 		case 7:
L_settings_store_global_setting90:
;Globals.c,485 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,486 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,487 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,488 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,489 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting91:
;Globals.c,490 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,491 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612428)(GP)
;Globals.c,492 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,493 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting92:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,494 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
SH	R25, 8(SP)
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612424)(GP)
;Globals.c,495 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,496 :: 		case 10:
L_settings_store_global_setting93:
;Globals.c,497 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,498 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,499 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,500 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,501 :: 		case 11:
L_settings_store_global_setting94:
;Globals.c,502 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,503 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+52)(GP)
;Globals.c,504 :: 		buffA[N_ARC_CORREC_OFFSET] = (int)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,505 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,506 :: 		case 12:
L_settings_store_global_setting95:
;Globals.c,507 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,508 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+66)(GP)
;Globals.c,509 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,510 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,511 :: 		case 13:
L_settings_store_global_setting96:
;Globals.c,512 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting225
NOP	
J	L_settings_store_global_setting97
NOP	
L__settings_store_global_setting225:
;Globals.c,513 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+54)(GP)
;Globals.c,514 :: 		}else{
J	L_settings_store_global_setting98
NOP	
L_settings_store_global_setting97:
;Globals.c,515 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,516 :: 		}
L_settings_store_global_setting98:
;Globals.c,517 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+54)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,518 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,519 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting99:
;Globals.c,520 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting100
NOP	
L__settings_store_global_setting227:
;Globals.c,521 :: 		settings.flags |= BITFLAG_AUTO_START;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,522 :: 		}else{
J	L_settings_store_global_setting101
NOP	
L_settings_store_global_setting100:
;Globals.c,523 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,524 :: 		}
L_settings_store_global_setting101:
;Globals.c,525 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+54)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,526 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,527 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting102:
;Globals.c,528 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting103
NOP	
L__settings_store_global_setting229:
;Globals.c,529 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+54)(GP)
;Globals.c,530 :: 		}else{
J	L_settings_store_global_setting104
NOP	
L_settings_store_global_setting103:
;Globals.c,531 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,532 :: 		}
L_settings_store_global_setting104:
;Globals.c,533 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+54)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,534 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,535 :: 		case 16:
L_settings_store_global_setting105:
;Globals.c,536 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting106
NOP	
L__settings_store_global_setting231:
;Globals.c,537 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+54)(GP)
;Globals.c,538 :: 		}else{
J	L_settings_store_global_setting107
NOP	
L_settings_store_global_setting106:
;Globals.c,539 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,540 :: 		}
L_settings_store_global_setting107:
;Globals.c,541 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+54)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,543 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,544 :: 		case 17:
L_settings_store_global_setting108:
;Globals.c,545 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting109
NOP	
L__settings_store_global_setting233:
;Globals.c,546 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+54)(GP)
;Globals.c,547 :: 		}else{
J	L_settings_store_global_setting110
NOP	
L_settings_store_global_setting109:
;Globals.c,548 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,549 :: 		}
L_settings_store_global_setting110:
;Globals.c,550 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+54)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,551 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,552 :: 		case 18:
L_settings_store_global_setting111:
;Globals.c,553 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,554 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+68)(GP)
;Globals.c,555 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,556 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,557 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting112:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,558 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612444)(GP)
;Globals.c,559 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,560 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting113:
SWC1	S12, Offset(_settings+32)(GP)
;Globals.c,561 :: 		buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
SH	R25, 8(SP)
JAL	_flt2ulong+0
NOP	
LH	R25, 8(SP)
SW	R2, Offset(-1610612440)(GP)
;Globals.c,562 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,563 :: 		case 21:
L_settings_store_global_setting114:
;Globals.c,564 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,565 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+58)(GP)
;Globals.c,566 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,567 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,568 :: 		case 22:
L_settings_store_global_setting115:
;Globals.c,569 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,570 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,571 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,572 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,573 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting116:
;Globals.c,574 :: 		val_temp = round(value);
SH	R25, 8(SP)
JAL	_round+0
NOP	
LH	R25, 8(SP)
;Globals.c,575 :: 		if(val_temp == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__settings_store_global_setting234
NOP	
J	L_settings_store_global_setting117
NOP	
L__settings_store_global_setting234:
;Globals.c,576 :: 		error = (int)NVMWriteRow(&add,buffA);
SH	R25, 8(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
LH	R25, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
; error end address is: 12 (R3)
;Globals.c,579 :: 		while(DMA_IsOn(1));
L_settings_store_global_setting118:
; error start address is: 12 (R3)
SH	R3, 8(SP)
SH	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 10(SP)
LH	R3, 8(SP)
BNE	R2, R0, L__settings_store_global_setting236
NOP	
J	L_settings_store_global_setting119
NOP	
L__settings_store_global_setting236:
J	L_settings_store_global_setting118
NOP	
L_settings_store_global_setting119:
;Globals.c,580 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 41
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr2_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 41
SH	R3, 8(SP)
SH	R25, 10(SP)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 10(SP)
LH	R3, 8(SP)
;Globals.c,582 :: 		if(!error){
BEQ	R3, R0, L__settings_store_global_setting237
NOP	
J	L_settings_store_global_setting120
NOP	
L__settings_store_global_setting237:
; error end address is: 12 (R3)
;Globals.c,584 :: 		error = Save_Row_From_Flash(add);
SH	R25, 8(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_Save_Row_From_Flash+0
NOP	
LH	R25, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
; error end address is: 12 (R3)
;Globals.c,586 :: 		while(DMA_IsOn(1));
L_settings_store_global_setting121:
; error start address is: 12 (R3)
SH	R3, 8(SP)
SH	R25, 10(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 10(SP)
LH	R3, 8(SP)
BNE	R2, R0, L__settings_store_global_setting239
NOP	
J	L_settings_store_global_setting122
NOP	
L__settings_store_global_setting239:
J	L_settings_store_global_setting121
NOP	
L_settings_store_global_setting122:
;Globals.c,587 :: 		dma_printf("error:= %d\n",error);
ADDIU	R23, SP, 53
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr3_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 53
SH	R25, 8(SP)
; error end address is: 12 (R3)
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 8(SP)
;Globals.c,589 :: 		}
L_settings_store_global_setting120:
;Globals.c,590 :: 		}
L_settings_store_global_setting117:
;Globals.c,591 :: 		break;
J	L_settings_store_global_setting80
NOP	
;Globals.c,592 :: 		default:
L_settings_store_global_setting123:
;Globals.c,593 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,594 :: 		}
L_settings_store_global_setting79:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting241:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting243:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting261:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting94
NOP	
L__settings_store_global_setting263:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting265
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting265:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting267
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting267:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting269
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting269:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting271
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting271:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting273
NOP	
J	L_settings_store_global_setting105
NOP	
L__settings_store_global_setting273:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting275
NOP	
J	L_settings_store_global_setting108
NOP	
L__settings_store_global_setting275:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting277
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting277:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting279
NOP	
J	L_settings_store_global_setting112
NOP	
L__settings_store_global_setting279:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting281
NOP	
J	L_settings_store_global_setting113
NOP	
L__settings_store_global_setting281:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting283
NOP	
J	L_settings_store_global_setting114
NOP	
L__settings_store_global_setting283:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting285
NOP	
J	L_settings_store_global_setting115
NOP	
L__settings_store_global_setting285:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting287
NOP	
J	L_settings_store_global_setting116
NOP	
L__settings_store_global_setting287:
J	L_settings_store_global_setting123
NOP	
L_settings_store_global_setting80:
;Globals.c,595 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,596 :: 		}
;Globals.c,595 :: 		return(STATUS_OK);
;Globals.c,596 :: 		}
L_end_settings_store_global_setting:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _settings_store_global_setting
