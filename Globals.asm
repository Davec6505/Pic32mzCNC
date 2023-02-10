_settings_init:
;Globals.c,21 :: 		void settings_init(short reset_all){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Globals.c,22 :: 		int has_data = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,24 :: 		if(!reset_all){
BEQ	R25, R0, L__settings_init122
NOP	
J	L_settings_init0
NOP	
L__settings_init122:
;Globals.c,26 :: 		sys.abort           = 0;
SB	R0, Offset(_sys+0)(GP)
;Globals.c,27 :: 		sys.state           = 0;
SB	R0, Offset(_sys+1)(GP)
;Globals.c,28 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,29 :: 		sys.execute         = 0;
SB	R0, Offset(_sys+25)(GP)
;Globals.c,30 :: 		sys.auto_start      = 0;
SB	R0, Offset(_sys+24)(GP)
;Globals.c,31 :: 		}else{
J	L_settings_init1
NOP	
L_settings_init0:
;Globals.c,32 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,33 :: 		has_data = read_row_from_flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,39 :: 		if(!has_data){
BEQ	R2, R0, L__settings_init123
NOP	
J	L_settings_init2
NOP	
L__settings_init123:
;Globals.c,41 :: 		settings.steps_per_mm[X]   = DEFAULT_X_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+0)(GP)
;Globals.c,42 :: 		buffA[SPMMX_OFFSET]        = flt2ulong(settings.steps_per_mm[X]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612480)(GP)
;Globals.c,43 :: 		settings.steps_per_mm[Y]   = DEFAULT_Y_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+4)(GP)
;Globals.c,44 :: 		buffA[SPMMY_OFFSET]        = flt2ulong(settings.steps_per_mm[Y]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612476)(GP)
;Globals.c,45 :: 		settings.steps_per_mm[Z]   = DEFAULT_Z_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+8)(GP)
;Globals.c,46 :: 		buffA[SPMMZ_OFFSET]        = flt2ulong(settings.steps_per_mm[Z]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612472)(GP)
;Globals.c,47 :: 		settings.steps_per_mm[A]   = DEFAULT_A_STEPS_PER_MM;
ORI	R2, R0, 250
SW	R2, Offset(_settings+12)(GP)
;Globals.c,49 :: 		settings.p_usec            = DEFAUT_P_USEC;
ORI	R2, R0, 100
SH	R2, Offset(_settings+60)(GP)
;Globals.c,50 :: 		buffA[P_USEC_OFFSET]       = settings.p_usec;
ORI	R2, R0, 100
SW	R2, Offset(-1610612456)(GP)
;Globals.c,52 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+36)(GP)
;Globals.c,53 :: 		buffA[MM_ARC_SEG_OFFSET]    =  flt2ulong(settings.mm_per_arc_segment);
LUI	R2, 16204
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,55 :: 		settings.default_feed_rate = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+16)(GP)
;Globals.c,56 :: 		buffA[D_FEED_RATE_OFFSET]  = flt2ulong(settings.default_feed_rate);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,58 :: 		settings.default_seek_rate = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,59 :: 		buffA[D_SEEK_RATE_OFFSET]  = flt2ulong(settings.default_seek_rate);
LUI	R2, 17402
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,61 :: 		settings.acceleration      = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+40)(GP)
;Globals.c,62 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(settings.acceleration);
LUI	R2, 18188
ORI	R2, R2, 40960
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,64 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+44)(GP)
;Globals.c,65 :: 		buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(settings.junction_deviation);
LUI	R2, 15692
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,67 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,68 :: 		buffA[H_FEED_RATE_OFFSET]   = flt2ulong(settings.homing_feed_rate);
LUI	R2, 16840
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,70 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,71 :: 		buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(settings.homing_seek_rate);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,73 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+54)(GP)
;Globals.c,74 :: 		buffA[H_DEBNC_DLY_OFFSET]   = flt2ulong(settings.homing_debounce_delay);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612408)(GP)
;Globals.c,76 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,77 :: 		buffA[H_PULL_OFF_OFFSET]    = flt2ulong(settings.homing_pulloff);
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,79 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+56)(GP)
;Globals.c,80 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = flt2ulong(settings.stepper_idle_lock_time);
LUI	R2, 16840
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612404)(GP)
;Globals.c,82 :: 		settings.decimal_places     = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+62)(GP)
;Globals.c,83 :: 		buffA[DEC_PLACES_OFFSET]    = flt2ulong(settings.decimal_places);
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612392)(GP)
;Globals.c,85 :: 		settings.n_arc_correction   = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+48)(GP)
;Globals.c,86 :: 		buffA[N_ARC_CORREC_OFFSET]  = flt2ulong(N_ARC_CORREC_OFFSET);
LUI	R2, 17054
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612420)(GP)
;Globals.c,90 :: 		has_data = (int)NVMWriteRow(&add,buffA);
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
;Globals.c,91 :: 		set_ram_loaded_indicator(has_data);
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,93 :: 		}else{
J	L_settings_init3
NOP	
L_settings_init2:
;Globals.c,94 :: 		settings.flags = 0;  //not to sure about this
SH	R0, Offset(_settings+50)(GP)
;Globals.c,95 :: 		if (DEFAULT_REPORT_INCHES) { settings.flags |= BITFLAG_REPORT_INCHES; }
L_settings_init4:
;Globals.c,96 :: 		if (DEFAULT_AUTO_START) { settings.flags |= BITFLAG_AUTO_START; }
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,97 :: 		if (DEFAULT_INVERT_ST_ENABLE) { settings.flags |= BITFLAG_INVERT_ST_ENABLE; }
L_settings_init6:
;Globals.c,98 :: 		if (DEFAULT_HARD_LIMIT_ENABLE) { settings.flags |= BITFLAG_HARD_LIMIT_ENABLE; }
L_settings_init7:
;Globals.c,99 :: 		if (DEFAULT_HOMING_ENABLE) { settings.flags |= BITFLAG_HOMING_ENABLE; }
L_settings_init8:
;Globals.c,101 :: 		settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+0)(GP)
;Globals.c,102 :: 		settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,103 :: 		settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,105 :: 		settings.p_usec                 = ulong2flt(buffA[P_USEC_OFFSET]);
LW	R25, Offset(-1610612456)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+60)(GP)
;Globals.c,106 :: 		settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,107 :: 		settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+16)(GP)
;Globals.c,108 :: 		settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,109 :: 		settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,110 :: 		settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,111 :: 		settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,112 :: 		settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,113 :: 		settings.homing_debounce_delay  = ulong2flt(buffA[H_DEBNC_DLY_OFFSET]);
LW	R25, Offset(-1610612408)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+54)(GP)
;Globals.c,114 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,115 :: 		settings.stepper_idle_lock_time = ulong2flt(buffA[STEP_IDLE_DLY_OFFSET]);// If max value 255, steppers do not disable.
LW	R25, Offset(-1610612412)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+56)(GP)
;Globals.c,116 :: 		settings.decimal_places         = ulong2flt(buffA[DEC_PLACES_OFFSET]);
LW	R25, Offset(-1610612392)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+62)(GP)
;Globals.c,117 :: 		settings.n_arc_correction       = ulong2flt(buffA[N_ARC_CORREC_OFFSET]);
LW	R25, Offset(-1610612420)(GP)
JAL	_ulong2flt+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+48)(GP)
;Globals.c,119 :: 		}
L_settings_init3:
;Globals.c,120 :: 		}
L_settings_init1:
;Globals.c,121 :: 		}
L_end_settings_init:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _settings_init
Globals_set_ram_loaded_indicator:
;Globals.c,133 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,134 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,135 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,136 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,139 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,140 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,141 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,144 :: 		int read_ram_loaded_indicator(){
;Globals.c,145 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,146 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
Globals_set_coord_data_read_indicator:
;Globals.c,152 :: 		static void set_coord_data_read_indicator(int flag){
;Globals.c,153 :: 		bit_true(coord_read,flag);
LH	R2, Offset(Globals_coord_read+0)(GP)
OR	R2, R2, R25
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,154 :: 		}
L_end_set_coord_data_read_indicator:
JR	RA
NOP	
; end of Globals_set_coord_data_read_indicator
Globals_rst_single_coord_read_indicators:
;Globals.c,157 :: 		static void rst_single_coord_read_indicators(int flag){
;Globals.c,158 :: 		bit_false(coord_read,flag);
NOR	R3, R25, R0
LH	R2, Offset(Globals_coord_read+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,159 :: 		}
L_end_rst_single_coord_read_indicators:
JR	RA
NOP	
; end of Globals_rst_single_coord_read_indicators
Globals_rst_coord_read_indicator:
;Globals.c,162 :: 		static void rst_coord_read_indicator(){
;Globals.c,163 :: 		coord_read = 0;
SH	R0, Offset(Globals_coord_read+0)(GP)
;Globals.c,164 :: 		}
L_end_rst_coord_read_indicator:
JR	RA
NOP	
; end of Globals_rst_coord_read_indicator
_read_coord_data_indicator:
;Globals.c,167 :: 		int read_coord_data_indicator(){
;Globals.c,168 :: 		return coord_read;
LH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,169 :: 		}
L_end_read_coord_data_indicator:
JR	RA
NOP	
; end of _read_coord_data_indicator
_read_row_from_flash:
;Globals.c,179 :: 		int read_row_from_flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,183 :: 		ptr = addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Globals.c,184 :: 		data_count = 0;
; data_count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Globals.c,185 :: 		for(j = 0;j < 512;j++){
SW	R0, Offset(_j+0)(GP)
; data_count end address is: 20 (R5)
L_read_row_from_flash9:
; data_count start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 512
BNE	R2, R0, L__read_row_from_flash132
NOP	
J	L_read_row_from_flash10
NOP	
L__read_row_from_flash132:
; ptr end address is: 16 (R4)
;Globals.c,186 :: 		buffA[j] = *(ptr+j);
; ptr start address is: 16 (R4)
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,187 :: 		if(buffA[j] != -1)data_count++;
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__read_row_from_flash134
NOP	
J	L__read_row_from_flash119
NOP	
L__read_row_from_flash134:
ADDIU	R2, R5, 1
SEH	R5, R2
; data_count end address is: 20 (R5)
J	L_read_row_from_flash12
NOP	
L__read_row_from_flash119:
L_read_row_from_flash12:
;Globals.c,185 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 20 (R5)
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,192 :: 		}
; ptr end address is: 16 (R4)
J	L_read_row_from_flash9
NOP	
L_read_row_from_flash10:
;Globals.c,196 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R5
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,199 :: 		return data_count;
SEH	R2, R5
; data_count end address is: 20 (R5)
;Globals.c,200 :: 		}
L_end_read_row_from_flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _read_row_from_flash
_Settings_Write_Coord_Data:
;Globals.c,229 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Globals.c,231 :: 		int res=0,recipe = 0;
SW	R25, 4(SP)
;Globals.c,232 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 20
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,233 :: 		unsigned long temp[4] = {0};
;Globals.c,235 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,238 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,241 :: 		read_row_from_flash(add);
SH	R4, 8(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,245 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,247 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__Settings_Write_Coord_Data137
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data137:
; recipe end address is: 16 (R4)
;Globals.c,252 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,253 :: 		}
L_Settings_Write_Coord_Data13:
;Globals.c,255 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data14
NOP	
;Globals.c,256 :: 		case 0:break;
L_Settings_Write_Coord_Data16:
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,258 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,259 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,260 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,261 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,262 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,263 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,264 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,265 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,266 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,268 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data26:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,269 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data27:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,270 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data28:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,271 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data29:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,272 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data30:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,273 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data31:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_Settings_Write_Coord_Data15
NOP	
;Globals.c,274 :: 		}
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
;Globals.c,276 :: 		j = i = 0;
SW	R0, Offset(_i+0)(GP)
LW	R2, Offset(_i+0)(GP)
SW	R2, Offset(_j+0)(GP)
;Globals.c,277 :: 		for (i=0;i<3;i++){
SW	R0, Offset(_i+0)(GP)
; recipe end address is: 16 (R4)
L_Settings_Write_Coord_Data32:
; recipe start address is: 16 (R4)
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L__Settings_Write_Coord_Data170
NOP	
J	L_Settings_Write_Coord_Data33
NOP	
L__Settings_Write_Coord_Data170:
;Globals.c,278 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R3, SP, 20
LW	R2, Offset(_i+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 36(SP)
LW	R2, Offset(_i+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R26, R2
SH	R4, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LH	R4, 8(SP)
LW	R3, 36(SP)
SW	R2, 0(R3)
;Globals.c,277 :: 		for (i=0;i<3;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,283 :: 		}
J	L_Settings_Write_Coord_Data32
NOP	
L_Settings_Write_Coord_Data33:
;Globals.c,286 :: 		i = (recipe-1)*4 ;
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
;Globals.c,289 :: 		for(j = 0;j<4;j++){
SW	R0, Offset(_j+0)(GP)
L_Settings_Write_Coord_Data35:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__Settings_Write_Coord_Data171
NOP	
J	L_Settings_Write_Coord_Data36
NOP	
L__Settings_Write_Coord_Data171:
;Globals.c,290 :: 		buffA[i] =  wdata[j];
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 20
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,291 :: 		i++;
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,289 :: 		for(j = 0;j<4;j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,292 :: 		}
J	L_Settings_Write_Coord_Data35
NOP	
L_Settings_Write_Coord_Data36:
;Globals.c,295 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,296 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,312 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,313 :: 		}
;Globals.c,312 :: 		return res;
;Globals.c,313 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,320 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,323 :: 		if(!read_ram_loaded_indicator()){
SW	R25, 4(SP)
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data173
NOP	
J	L_settings_read_coord_data38
NOP	
L__settings_read_coord_data173:
;Globals.c,324 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,325 :: 		read_row_from_flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,326 :: 		}
L_settings_read_coord_data38:
;Globals.c,328 :: 		if(!read_coord_data_indicator()){
JAL	_read_coord_data_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data174
NOP	
J	L_settings_read_coord_data39
NOP	
L__settings_read_coord_data174:
;Globals.c,329 :: 		unsigned long temp = 0UL;
;Globals.c,330 :: 		float value = 0.00;
;Globals.c,331 :: 		for(i = 0; i < 9; i++){
SW	R0, Offset(_i+0)(GP)
L_settings_read_coord_data40:
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 9
BNE	R2, R0, L__settings_read_coord_data175
NOP	
J	L_settings_read_coord_data41
NOP	
L__settings_read_coord_data175:
;Globals.c,332 :: 		for(j = 0 ; j < NoOfAxis; j++){
SW	R0, Offset(_j+0)(GP)
L_settings_read_coord_data43:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_read_coord_data176
NOP	
J	L_settings_read_coord_data44
NOP	
L__settings_read_coord_data176:
;Globals.c,333 :: 		temp = buffA[(i*NoOfAxis) + j];
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(_j+0)(GP)
ADDU	R2, R3, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 12 (R3)
MOVZ	R3, R2, R0
;Globals.c,335 :: 		if(temp == -1)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__settings_read_coord_data177
NOP	
J	L__settings_read_coord_data120
NOP	
L__settings_read_coord_data177:
; temp end address is: 12 (R3)
;Globals.c,336 :: 		temp = 0UL;
; temp start address is: 8 (R2)
MOVZ	R2, R0, R0
; temp end address is: 8 (R2)
J	L_settings_read_coord_data46
NOP	
L__settings_read_coord_data120:
;Globals.c,335 :: 		if(temp == -1)
MOVZ	R2, R3, R0
;Globals.c,336 :: 		temp = 0UL;
L_settings_read_coord_data46:
;Globals.c,337 :: 		value = ulong2flt(temp);
; temp start address is: 8 (R2)
MOVZ	R25, R2, R0
; temp end address is: 8 (R2)
JAL	_ulong2flt+0
NOP	
;Globals.c,338 :: 		coord_system[i].coord[j] = value;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,332 :: 		for(j = 0 ; j < NoOfAxis; j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,346 :: 		}
J	L_settings_read_coord_data43
NOP	
L_settings_read_coord_data44:
;Globals.c,331 :: 		for(i = 0; i < 9; i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,347 :: 		}
J	L_settings_read_coord_data40
NOP	
L_settings_read_coord_data41:
;Globals.c,349 :: 		set_coord_data_read_indicator(COORD_READ_FLAG);
MOVZ	R25, R0, R0
JAL	Globals_set_coord_data_read_indicator+0
NOP	
;Globals.c,350 :: 		}
L_settings_read_coord_data39:
;Globals.c,351 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,356 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Globals.c,362 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,365 :: 		j=0;
SW	R0, Offset(_j+0)(GP)
;Globals.c,366 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
; recipe end address is: 20 (R5)
L_settings_write_one_coord47:
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R3, R2
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_write_one_coord179
NOP	
J	L_settings_write_one_coord48
NOP	
L__settings_write_one_coord179:
;Globals.c,368 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 16
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,369 :: 		temp[j] = flt2ulong(coord_data[j]);
ADDIU	R3, SP, 32
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 48(SP)
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
SH	R5, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
LH	R5, 4(SP)
LW	R3, 48(SP)
SW	R2, 0(R3)
;Globals.c,370 :: 		buffA[i] = temp[j];
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 32
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,371 :: 		j++;
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,366 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,376 :: 		}
; recipe end address is: 20 (R5)
J	L_settings_write_one_coord47
NOP	
L_settings_write_one_coord48:
;Globals.c,378 :: 		switch(coord_select){
J	L_settings_write_one_coord50
NOP	
;Globals.c,380 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,381 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,382 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,383 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,384 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,385 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,386 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,387 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,388 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,390 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,391 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,392 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,393 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord64:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,394 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord65:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,395 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord66:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, Offset(_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,396 :: 		}
L_settings_write_one_coord50:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord181
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord181:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord183
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord183:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord185
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord185:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord187
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord187:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord189
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord189:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord191
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord191:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord193
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord193:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord195
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord195:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord197
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord197:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord199
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord199:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord201
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord201:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord203
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord203:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord205
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord205:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord207
NOP	
J	L_settings_write_one_coord65
NOP	
L__settings_write_one_coord207:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord209
NOP	
J	L_settings_write_one_coord66
NOP	
L__settings_write_one_coord209:
L_settings_write_one_coord51:
;Globals.c,399 :: 		error =  NVMWriteQuad (add, temp);
ADDIU	R2, SP, 32
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LW	R25, Offset(_add+0)(GP)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,400 :: 		set_ram_loaded_indicator(error);
SH	R25, 4(SP)
LHU	R25, Offset(_error+0)(GP)
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,402 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,403 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,408 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,411 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line67
NOP	
;Globals.c,412 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line69:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line68
NOP	
;Globals.c,413 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line70:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line68
NOP	
;Globals.c,414 :: 		}
L_settings_read_startup_line67:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line212
NOP	
J	L_settings_read_startup_line69
NOP	
L__settings_read_startup_line212:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line214
NOP	
J	L_settings_read_startup_line70
NOP	
L__settings_read_startup_line214:
L_settings_read_startup_line68:
;Globals.c,416 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,424 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,425 :: 		}
;Globals.c,424 :: 		return STATUS_OK;
;Globals.c,425 :: 		}
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
;Globals.c,429 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,434 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
; str_len start address is: 16 (R4)
SEH	R4, R2
;Globals.c,443 :: 		add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,446 :: 		switch(n){
J	L_settings_store_startup_line71
NOP	
;Globals.c,447 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line73:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line72
NOP	
;Globals.c,448 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line74:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line72
NOP	
;Globals.c,449 :: 		}
L_settings_store_startup_line71:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line217
NOP	
J	L_settings_store_startup_line73
NOP	
L__settings_store_startup_line217:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line219
NOP	
J	L_settings_store_startup_line74
NOP	
L__settings_store_startup_line219:
L_settings_store_startup_line72:
;Globals.c,452 :: 		read_row_from_flash(add);
SH	R4, 12(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,456 :: 		error = (int)NVMErasePage(add);
SW	R26, 16(SP)
LW	R25, Offset(_add+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,459 :: 		for(i=start_offset;i<start_offset+16;i++)
LW	R2, 20(SP)
SW	R2, Offset(_i+0)(GP)
; str_len end address is: 16 (R4)
L_settings_store_startup_line75:
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R3, R2, 16
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_store_startup_line220
NOP	
J	L_settings_store_startup_line76
NOP	
L__settings_store_startup_line220:
;Globals.c,460 :: 		buffA[i] = 0;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,459 :: 		for(i=start_offset;i<start_offset+16;i++)
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,460 :: 		buffA[i] = 0;
J	L_settings_store_startup_line75
NOP	
L_settings_store_startup_line76:
;Globals.c,464 :: 		memcpy(buffA+start_offset,line,str_len);
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
;Globals.c,475 :: 		error = (int)NVMWriteRow(&add,buffA);
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
SH	R2, Offset(_error+0)(GP)
;Globals.c,476 :: 		set_ram_loaded_indicator(error);
SH	R25, 12(SP)
LHU	R25, Offset(_error+0)(GP)
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,478 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,479 :: 		}
;Globals.c,478 :: 		return error;
;Globals.c,479 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,484 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,485 :: 		int val_temp = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,487 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(_add+0)(GP)
;Globals.c,495 :: 		switch(parameter) {
J	L_settings_store_global_setting78
NOP	
;Globals.c,496 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting80:
L_settings_store_global_setting81:
L_settings_store_global_setting82:
;Globals.c,497 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting222
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting222:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting83:
;Globals.c,499 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,501 :: 		buffA[SPMMX_OFFSET + parameter] = flt2ulong(value);
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 12(SP)
JAL	_flt2ulong+0
NOP	
LW	R3, 12(SP)
SW	R2, 0(R3)
;Globals.c,502 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,503 :: 		case 3:
L_settings_store_global_setting84:
;Globals.c,504 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting223
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting223:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting85:
;Globals.c,505 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,506 :: 		settings.p_usec = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,508 :: 		buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,509 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,510 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting86:
SWC1	S12, Offset(_settings+16)(GP)
;Globals.c,511 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,512 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,513 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting87:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,514 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,515 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,516 :: 		case 6:
L_settings_store_global_setting88:
;Globals.c,517 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,518 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612384)(GP)
;Globals.c,519 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,520 :: 		case 7:
L_settings_store_global_setting89:
;Globals.c,521 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,522 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+56)(GP)
;Globals.c,523 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,524 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,525 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting90:
;Globals.c,526 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,527 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,528 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,529 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting91:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,530 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,531 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,532 :: 		case 10:
L_settings_store_global_setting92:
;Globals.c,533 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,534 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,535 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,536 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,537 :: 		case 11:
L_settings_store_global_setting93:
;Globals.c,538 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,539 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+48)(GP)
;Globals.c,540 :: 		buffA[N_ARC_CORREC_OFFSET] = (int)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,541 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,542 :: 		case 12:
L_settings_store_global_setting94:
;Globals.c,543 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,544 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+62)(GP)
;Globals.c,545 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,546 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,547 :: 		case 13:
L_settings_store_global_setting95:
;Globals.c,548 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting225
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting225:
;Globals.c,549 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+50)(GP)
;Globals.c,550 :: 		}else{
J	L_settings_store_global_setting97
NOP	
L_settings_store_global_setting96:
;Globals.c,551 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LH	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,552 :: 		}
L_settings_store_global_setting97:
;Globals.c,553 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,554 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,555 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting98:
;Globals.c,556 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting227:
;Globals.c,557 :: 		settings.flags |= BITFLAG_AUTO_START;
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,558 :: 		}else{
J	L_settings_store_global_setting100
NOP	
L_settings_store_global_setting99:
;Globals.c,559 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LH	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,560 :: 		}
L_settings_store_global_setting100:
;Globals.c,561 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,562 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,563 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting101:
;Globals.c,564 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting229:
;Globals.c,565 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+50)(GP)
;Globals.c,566 :: 		}else{
J	L_settings_store_global_setting103
NOP	
L_settings_store_global_setting102:
;Globals.c,567 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LH	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,568 :: 		}
L_settings_store_global_setting103:
;Globals.c,569 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,570 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,571 :: 		case 16:
L_settings_store_global_setting104:
;Globals.c,572 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting105
NOP	
L__settings_store_global_setting231:
;Globals.c,573 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+50)(GP)
;Globals.c,574 :: 		}else{
J	L_settings_store_global_setting106
NOP	
L_settings_store_global_setting105:
;Globals.c,575 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LH	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,576 :: 		}
L_settings_store_global_setting106:
;Globals.c,577 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,579 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,580 :: 		case 17:
L_settings_store_global_setting107:
;Globals.c,581 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting108
NOP	
L__settings_store_global_setting233:
;Globals.c,582 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LH	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+50)(GP)
;Globals.c,583 :: 		}else{
J	L_settings_store_global_setting109
NOP	
L_settings_store_global_setting108:
;Globals.c,584 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LH	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,585 :: 		}
L_settings_store_global_setting109:
;Globals.c,586 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LH	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,587 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,588 :: 		case 18:
L_settings_store_global_setting110:
;Globals.c,589 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,590 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,591 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,592 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,593 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting111:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,594 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,595 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,596 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting112:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,597 :: 		buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,598 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,599 :: 		case 21:
L_settings_store_global_setting113:
;Globals.c,600 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,601 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+54)(GP)
;Globals.c,602 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,603 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,604 :: 		case 22:
L_settings_store_global_setting114:
;Globals.c,605 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,606 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,607 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,608 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,609 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting115:
;Globals.c,610 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,611 :: 		if(val_temp == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__settings_store_global_setting234
NOP	
J	L_settings_store_global_setting116
NOP	
L__settings_store_global_setting234:
;Globals.c,612 :: 		error = (int)NVMWriteRow(&add,buffA);
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(_add+0)
ORI	R25, R25, lo_addr(_add+0)
JAL	_NVMWriteRow+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,618 :: 		if(!error){
LHU	R2, Offset(_error+0)(GP)
BEQ	R2, R0, L__settings_store_global_setting235
NOP	
J	L_settings_store_global_setting117
NOP	
L__settings_store_global_setting235:
;Globals.c,620 :: 		error = read_row_from_flash(add);
LW	R25, Offset(_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,625 :: 		}
L_settings_store_global_setting117:
;Globals.c,626 :: 		}
L_settings_store_global_setting116:
;Globals.c,627 :: 		break;
J	L_settings_store_global_setting79
NOP	
;Globals.c,628 :: 		default:
L_settings_store_global_setting118:
;Globals.c,629 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,630 :: 		}
L_settings_store_global_setting78:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting237
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting237:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting239
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting239:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting241:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting243:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting94
NOP	
L__settings_store_global_setting261:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting263:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting265
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting265:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting267
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting267:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting269
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting269:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting271
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting271:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting273
NOP	
J	L_settings_store_global_setting110
NOP	
L__settings_store_global_setting273:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting275
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting275:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting277
NOP	
J	L_settings_store_global_setting112
NOP	
L__settings_store_global_setting277:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting279
NOP	
J	L_settings_store_global_setting113
NOP	
L__settings_store_global_setting279:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting281
NOP	
J	L_settings_store_global_setting114
NOP	
L__settings_store_global_setting281:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting283
NOP	
J	L_settings_store_global_setting115
NOP	
L__settings_store_global_setting283:
J	L_settings_store_global_setting118
NOP	
L_settings_store_global_setting79:
;Globals.c,631 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,632 :: 		}
;Globals.c,631 :: 		return(STATUS_OK);
;Globals.c,632 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_store_global_setting
