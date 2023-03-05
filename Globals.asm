_settings_init:
;Globals.c,23 :: 		void settings_init(short reset_all){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,25 :: 		volatile unsigned long has_data = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,28 :: 		int retry_flash_write = 0;
MOVZ	R30, R0, R0
SH	R30, 14(SP)
;Globals.c,32 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,34 :: 		ptr = (unsigned long)FLASH_Settings_VAddr_FLASH_LOADED ;
; ptr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 50672
;Globals.c,36 :: 		if(!reset_all){
BEQ	R25, R0, L__settings_init127
NOP	
J	L_settings_init0
NOP	
L__settings_init127:
; ptr end address is: 8 (R2)
;Globals.c,38 :: 		sys.abort           = 0;
SH	R0, Offset(_sys+0)(GP)
;Globals.c,39 :: 		sys.state           = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,40 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+4)(GP)
;Globals.c,41 :: 		sys.execute         = 0;
SH	R0, Offset(_sys+26)(GP)
;Globals.c,42 :: 		sys.auto_start      = 0;
SH	R0, Offset(_sys+24)(GP)
;Globals.c,43 :: 		}else{
J	L_settings_init1
NOP	
L_settings_init0:
;Globals.c,44 :: 		has_data = NVMReadWord(ptr);//read_row_from_flash(add);
; ptr start address is: 8 (R2)
MOVZ	R25, R2, R0
; ptr end address is: 8 (R2)
JAL	_NVMReadWord+0
NOP	
; has_data start address is: 12 (R3)
MOVZ	R3, R2, R0
;Globals.c,52 :: 		if(has_data == -1){
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__settings_init128
NOP	
J	L__settings_init124
NOP	
L__settings_init128:
; has_data end address is: 12 (R3)
;Globals.c,58 :: 		error = (int)NVMErasePage(&add);
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,67 :: 		settings.steps_per_mm[X]   = DEFAULT_X_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+0)(GP)
;Globals.c,68 :: 		buffA[SPMMX_OFFSET]        = flt2ulong(settings.steps_per_mm[X]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612480)(GP)
;Globals.c,69 :: 		settings.steps_per_mm[Y]   = DEFAULT_Y_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,70 :: 		buffA[SPMMY_OFFSET]        = flt2ulong(settings.steps_per_mm[Y]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612476)(GP)
;Globals.c,71 :: 		settings.steps_per_mm[Z]   = DEFAULT_Z_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,72 :: 		buffA[SPMMZ_OFFSET]        = flt2ulong(settings.steps_per_mm[Z]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612472)(GP)
;Globals.c,73 :: 		settings.steps_per_mm[A]   = DEFAULT_A_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,74 :: 		buffA[SPMMA_OFFSET]        = flt2ulong(settings.steps_per_mm[A]);
LUI	R2, 17274
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612468)(GP)
;Globals.c,76 :: 		settings.default_feed_rate = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+16)(GP)
;Globals.c,77 :: 		buffA[D_FEED_RATE_OFFSET]  = flt2ulong(settings.default_feed_rate);
LWC1	S12, Offset(_settings+16)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,79 :: 		settings.default_seek_rate = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+20)(GP)
;Globals.c,80 :: 		buffA[D_SEEK_RATE_OFFSET]  = flt2ulong(settings.default_seek_rate);
LWC1	S12, Offset(_settings+20)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,82 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+24)(GP)
;Globals.c,83 :: 		buffA[H_FEED_RATE_OFFSET]   = flt2ulong(settings.homing_feed_rate);
LWC1	S12, Offset(_settings+24)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,85 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,86 :: 		buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(settings.homing_seek_rate);
LWC1	S12, Offset(_settings+28)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,88 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,89 :: 		buffA[H_PULL_OFF_OFFSET]    = flt2ulong(settings.homing_pulloff);
LWC1	S12, Offset(_settings+32)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,91 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 15820
ORI	R2, R2, 52429
SW	R2, Offset(_settings+36)(GP)
;Globals.c,92 :: 		buffA[MM_ARC_SEG_OFFSET]    =  flt2ulong(settings.mm_per_arc_segment);
LWC1	S12, Offset(_settings+36)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,94 :: 		settings.acceleration      = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+40)(GP)
;Globals.c,95 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(settings.acceleration);
LWC1	S12, Offset(_settings+40)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,97 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+44)(GP)
;Globals.c,98 :: 		buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(settings.junction_deviation);
LWC1	S12, Offset(_settings+44)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,101 :: 		settings.n_arc_correction   = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SH	R2, Offset(_settings+48)(GP)
;Globals.c,102 :: 		buffA[N_ARC_CORREC_OFFSET]  = (unsigned long)N_ARC_CORREC_OFFSET;
ORI	R2, R0, 79
SW	R2, Offset(-1610612420)(GP)
;Globals.c,104 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SH	R2, Offset(_settings+56)(GP)
;Globals.c,105 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)settings.stepper_idle_lock_time;
LHU	R2, Offset(_settings+56)(GP)
SW	R2, Offset(-1610612404)(GP)
;Globals.c,107 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+54)(GP)
;Globals.c,108 :: 		buffA[H_DEBNC_DLY_OFFSET]   = (unsigned long)settings.homing_debounce_delay;
LHU	R2, Offset(_settings+54)(GP)
SW	R2, Offset(-1610612408)(GP)
;Globals.c,110 :: 		settings.p_usec             = DEFAUT_P_USEC;
ORI	R2, R0, 100
SH	R2, Offset(_settings+60)(GP)
;Globals.c,111 :: 		buffA[P_USEC_OFFSET]        = (unsigned long)settings.p_usec;
LHU	R2, Offset(_settings+60)(GP)
SW	R2, Offset(-1610612456)(GP)
;Globals.c,113 :: 		settings.decimal_places     = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SH	R2, Offset(_settings+62)(GP)
;Globals.c,114 :: 		buffA[DEC_PLACES_OFFSET]    = (unsigned int)settings.decimal_places;
LHU	R2, Offset(_settings+62)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(-1610612392)(GP)
;Globals.c,116 :: 		settings.homing_dir_mask    = DEFAULT_HOME_DIR_MASK;
ORI	R2, R0, 15
SH	R2, Offset(_settings+64)(GP)
;Globals.c,117 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)settings.homing_dir_mask;
LHU	R2, Offset(_settings+64)(GP)
SW	R2, Offset(-1610612388)(GP)
;Globals.c,119 :: 		settings.invert_mask        = DEFAULT_INVERT_MASK;
ORI	R2, R0, 15
SH	R2, Offset(_settings+66)(GP)
;Globals.c,120 :: 		buffA[INVERT_MASK_OFFSET]   = (unsigned long)settings.invert_mask;
LHU	R2, Offset(_settings+66)(GP)
SW	R2, Offset(-1610612384)(GP)
;Globals.c,122 :: 		settings.flags  = 0;
SH	R0, Offset(_settings+50)(GP)
;Globals.c,123 :: 		if (DEFAULT_REPORT_INCHES)    {settings.flags |= BITFLAG_REPORT_INCHES;}
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+50)(GP)
;Globals.c,128 :: 		if (DEFAULT_AUTO_START)       { settings.flags |= (BITFLAG_AUTO_START);}
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,133 :: 		if (DEFAULT_INVERT_ST_ENABLE) { settings.flags |= (BITFLAG_INVERT_ST_ENABLE);}
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+50)(GP)
;Globals.c,138 :: 		if (DEFAULT_HARD_LIMIT_ENABLE){ settings.flags |= (BITFLAG_HARD_LIMIT_ENABLE);}
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+50)(GP)
;Globals.c,143 :: 		if (DEFAULT_HOMING_ENABLE)    { settings.flags |= (BITFLAG_HOMING_ENABLE);}
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+50)(GP)
;Globals.c,148 :: 		buffA[0x50] = ((unsigned long)settings.flags) & 0x1F;
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 31
SW	R2, Offset(-1610612416)(GP)
;Globals.c,159 :: 		buffA[FLASH_LOADED_OFFSET] = 0x7FFFFFFF;
LUI	R2, 32767
ORI	R2, R2, 65535
SW	R2, Offset(-1610611216)(GP)
;Globals.c,163 :: 		has_data = 1;
; has_data start address is: 8 (R2)
ORI	R2, R0, 1
; has_data end address is: 8 (R2)
;Globals.c,165 :: 		while(has_data){
L_settings_init8:
; has_data start address is: 8 (R2)
BNE	R2, R0, L__settings_init130
NOP	
J	L__settings_init123
NOP	
L__settings_init130:
; has_data end address is: 8 (R2)
;Globals.c,167 :: 		has_data = (unsigned long)NVMWriteRow(&add,buffA);
SB	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
LB	R25, 12(SP)
ANDI	R2, R2, 65535
; has_data start address is: 12 (R3)
MOVZ	R3, R2, R0
;Globals.c,168 :: 		retry_flash_write++;
LH	R2, 14(SP)
ADDIU	R2, R2, 1
SH	R2, 14(SP)
;Globals.c,175 :: 		if(retry_flash_write > FLASH_RETRY_COUNT)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__settings_init131
NOP	
J	L_settings_init10
NOP	
L__settings_init131:
MOVZ	R2, R3, R0
J	L_settings_init9
NOP	
L_settings_init10:
;Globals.c,176 :: 		}
MOVZ	R2, R3, R0
; has_data end address is: 12 (R3)
J	L_settings_init8
NOP	
L__settings_init123:
;Globals.c,165 :: 		while(has_data){
;Globals.c,176 :: 		}
L_settings_init9:
;Globals.c,179 :: 		}
; has_data start address is: 8 (R2)
; has_data end address is: 8 (R2)
J	L_settings_init2
NOP	
L__settings_init124:
;Globals.c,52 :: 		if(has_data == -1){
MOVZ	R2, R3, R0
;Globals.c,179 :: 		}
L_settings_init2:
;Globals.c,180 :: 		if(has_data){
; has_data start address is: 8 (R2)
BNE	R2, R0, L__settings_init133
NOP	
J	L_settings_init11
NOP	
L__settings_init133:
; has_data end address is: 8 (R2)
;Globals.c,181 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,182 :: 		}
L_settings_init11:
;Globals.c,184 :: 		settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+0)(GP)
;Globals.c,185 :: 		settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+4)(GP)
;Globals.c,186 :: 		settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+8)(GP)
;Globals.c,188 :: 		settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+16)(GP)
;Globals.c,189 :: 		settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,190 :: 		settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,191 :: 		settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,192 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,193 :: 		settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,194 :: 		settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,195 :: 		settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,196 :: 		settings.n_arc_correction       = (unsigned int)buffA[N_ARC_CORREC_OFFSET];
LW	R2, Offset(-1610612420)(GP)
SH	R2, Offset(_settings+48)(GP)
;Globals.c,197 :: 		settings.flags                  = ((unsigned int)buffA[0x50]);//FLAGS_OFFSET]);
LW	R2, Offset(-1610612416)(GP)
SH	R2, Offset(_settings+50)(GP)
;Globals.c,198 :: 		settings.stepper_idle_lock_time = (unsigned int)buffA[STEP_IDLE_DLY_OFFSET];// If max value 255, steppers do not disable.
LW	R2, Offset(-1610612412)(GP)
SH	R2, Offset(_settings+56)(GP)
;Globals.c,199 :: 		settings.microsteps             = (unsigned int)buffA[MICROSTEPS_OFFSET];
LW	R2, Offset(-1610612400)(GP)
SH	R2, Offset(_settings+58)(GP)
;Globals.c,200 :: 		settings.p_usec                 = (unsigned int)buffA[P_USEC_OFFSET];
LW	R2, Offset(-1610612456)(GP)
SH	R2, Offset(_settings+60)(GP)
;Globals.c,201 :: 		settings.decimal_places         = (unsigned int)buffA[DEC_PLACES_OFFSET];
LW	R2, Offset(-1610612392)(GP)
SH	R2, Offset(_settings+62)(GP)
;Globals.c,202 :: 		settings.homing_debounce_delay  = (unsigned int)buffA[H_DEBNC_DLY_OFFSET];
LW	R2, Offset(-1610612408)(GP)
SH	R2, Offset(_settings+54)(GP)
;Globals.c,203 :: 		settings.homing_dir_mask        = (unsigned int)buffA[HOME_DIR_MASK_OFFSET];
LW	R2, Offset(-1610612388)(GP)
SH	R2, Offset(_settings+64)(GP)
;Globals.c,204 :: 		settings.invert_mask            = (unsigned int)buffA[INVERT_MASK_OFFSET];
LW	R2, Offset(-1610612384)(GP)
SH	R2, Offset(_settings+66)(GP)
;Globals.c,205 :: 		}
L_settings_init1:
;Globals.c,207 :: 		}
L_end_settings_init:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_init
Globals_set_ram_loaded_indicator:
;Globals.c,219 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,220 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,221 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,222 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,225 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,226 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,227 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,230 :: 		int read_ram_loaded_indicator(){
;Globals.c,231 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,232 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
Globals_set_coord_data_read_indicator:
;Globals.c,238 :: 		static void set_coord_data_read_indicator(int flag){
;Globals.c,239 :: 		bit_true(coord_read,flag);
LH	R2, Offset(Globals_coord_read+0)(GP)
OR	R2, R2, R25
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,240 :: 		}
L_end_set_coord_data_read_indicator:
JR	RA
NOP	
; end of Globals_set_coord_data_read_indicator
Globals_rst_single_coord_read_indicators:
;Globals.c,243 :: 		static void rst_single_coord_read_indicators(int flag){
;Globals.c,244 :: 		bit_false(coord_read,flag);
NOR	R3, R25, R0
LH	R2, Offset(Globals_coord_read+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,245 :: 		}
L_end_rst_single_coord_read_indicators:
JR	RA
NOP	
; end of Globals_rst_single_coord_read_indicators
Globals_rst_coord_read_indicator:
;Globals.c,248 :: 		static void rst_coord_read_indicator(){
;Globals.c,249 :: 		coord_read = 0;
SH	R0, Offset(Globals_coord_read+0)(GP)
;Globals.c,250 :: 		}
L_end_rst_coord_read_indicator:
JR	RA
NOP	
; end of Globals_rst_coord_read_indicator
_read_coord_data_indicator:
;Globals.c,253 :: 		int read_coord_data_indicator(){
;Globals.c,254 :: 		return coord_read;
LH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,255 :: 		}
L_end_read_coord_data_indicator:
JR	RA
NOP	
; end of _read_coord_data_indicator
_read_row_from_flash:
;Globals.c,265 :: 		int read_row_from_flash(unsigned long addr){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Globals.c,269 :: 		ptr = addr;
SW	R25, 8(SP)
;Globals.c,270 :: 		data_count = 0;
SH	R0, 12(SP)
;Globals.c,271 :: 		for(j = 0;j < 512;j++){
SW	R0, Offset(_j+0)(GP)
L_read_row_from_flash12:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 512
BNE	R2, R0, L__read_row_from_flash142
NOP	
J	L_read_row_from_flash13
NOP	
L__read_row_from_flash142:
;Globals.c,272 :: 		buffA[j] = *(ptr+j);
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LW	R2, 8(SP)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,273 :: 		if(buffA[j] != -1)data_count++;
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__read_row_from_flash144
NOP	
J	L_read_row_from_flash15
NOP	
L__read_row_from_flash144:
LH	R2, 12(SP)
ADDIU	R2, R2, 1
SH	R2, 12(SP)
L_read_row_from_flash15:
;Globals.c,275 :: 		while(DMA_IsOn(1));
L_read_row_from_flash16:
SW	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L__read_row_from_flash146
NOP	
J	L_read_row_from_flash17
NOP	
L__read_row_from_flash146:
J	L_read_row_from_flash16
NOP	
L_read_row_from_flash17:
;Globals.c,276 :: 		dma_printf("buffA[%l]:= %l\n",j,buffA[j]);
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
ADDIU	R23, SP, 14
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr1_Globals+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Globals+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 14
SW	R25, 4(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, Offset(_j+0)(GP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 4(SP)
;Globals.c,271 :: 		for(j = 0;j < 512;j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,278 :: 		}
J	L_read_row_from_flash12
NOP	
L_read_row_from_flash13:
;Globals.c,282 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
LH	R25, 12(SP)
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,285 :: 		return data_count;
LH	R2, 12(SP)
;Globals.c,286 :: 		}
L_end_read_row_from_flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _read_row_from_flash
_settings_write_coord_data:
;Globals.c,315 :: 		unsigned int settings_write_coord_data(int coord_select,float *coord){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Globals.c,317 :: 		int res=0,recipe = 0;
SW	R25, 4(SP)
;Globals.c,318 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 20
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSsettings_write_coord_data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSsettings_write_coord_data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,319 :: 		unsigned long temp[4] = {0};
;Globals.c,321 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,324 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,326 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_write_coord_data148
NOP	
J	L_settings_write_coord_data18
NOP	
L__settings_write_coord_data148:
;Globals.c,328 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R4, 8(SP)
SW	R26, 12(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,332 :: 		error = (int)NVMErasePage(&add);
SH	R4, 8(SP)
SW	R26, 12(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,333 :: 		}
L_settings_write_coord_data18:
;Globals.c,337 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_write_coord_data150
NOP	
J	L_settings_write_coord_data19
NOP	
L__settings_write_coord_data150:
; recipe end address is: 16 (R4)
;Globals.c,342 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_write_coord_data
NOP	
;Globals.c,343 :: 		}
L_settings_write_coord_data19:
;Globals.c,345 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_settings_write_coord_data20
NOP	
;Globals.c,346 :: 		case 0:break;
L_settings_write_coord_data22:
J	L_settings_write_coord_data21
NOP	
;Globals.c,348 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_coord_data23:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,349 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_coord_data24:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,350 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_coord_data25:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,351 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_coord_data26:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,352 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_coord_data27:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,353 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_coord_data28:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,354 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_coord_data29:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,355 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_coord_data30:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,356 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_coord_data31:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,358 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
L_settings_write_coord_data32:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,359 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
L_settings_write_coord_data33:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data21
NOP	
;Globals.c,360 :: 		}
L_settings_write_coord_data20:
SEH	R2, R4
BNE	R2, R0, L__settings_write_coord_data152
NOP	
J	L_settings_write_coord_data22
NOP	
L__settings_write_coord_data152:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_coord_data154
NOP	
J	L_settings_write_coord_data23
NOP	
L__settings_write_coord_data154:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_coord_data156
NOP	
J	L_settings_write_coord_data24
NOP	
L__settings_write_coord_data156:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_coord_data158
NOP	
J	L_settings_write_coord_data25
NOP	
L__settings_write_coord_data158:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_coord_data160
NOP	
J	L_settings_write_coord_data26
NOP	
L__settings_write_coord_data160:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_coord_data162
NOP	
J	L_settings_write_coord_data27
NOP	
L__settings_write_coord_data162:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_coord_data164
NOP	
J	L_settings_write_coord_data28
NOP	
L__settings_write_coord_data164:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_coord_data166
NOP	
J	L_settings_write_coord_data29
NOP	
L__settings_write_coord_data166:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_coord_data168
NOP	
J	L_settings_write_coord_data30
NOP	
L__settings_write_coord_data168:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_coord_data170
NOP	
J	L_settings_write_coord_data31
NOP	
L__settings_write_coord_data170:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_coord_data172
NOP	
J	L_settings_write_coord_data32
NOP	
L__settings_write_coord_data172:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_coord_data174
NOP	
J	L_settings_write_coord_data33
NOP	
L__settings_write_coord_data174:
L_settings_write_coord_data21:
;Globals.c,362 :: 		j = i = 0;
SW	R0, Offset(_i+0)(GP)
LW	R2, Offset(_i+0)(GP)
SW	R2, Offset(_j+0)(GP)
;Globals.c,363 :: 		for (i=0;i<3;i++){
SW	R0, Offset(_i+0)(GP)
; recipe end address is: 16 (R4)
L_settings_write_coord_data34:
; recipe start address is: 16 (R4)
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L__settings_write_coord_data175
NOP	
J	L_settings_write_coord_data35
NOP	
L__settings_write_coord_data175:
;Globals.c,364 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,363 :: 		for (i=0;i<3;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,369 :: 		}
J	L_settings_write_coord_data34
NOP	
L_settings_write_coord_data35:
;Globals.c,372 :: 		i = (recipe-1)*4 ;
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
;Globals.c,375 :: 		for(j = 0;j<4;j++){
SW	R0, Offset(_j+0)(GP)
L_settings_write_coord_data37:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_write_coord_data176
NOP	
J	L_settings_write_coord_data38
NOP	
L__settings_write_coord_data176:
;Globals.c,376 :: 		buffA[i] =  wdata[j];
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
;Globals.c,377 :: 		i++;
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,375 :: 		for(j = 0;j<4;j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,378 :: 		}
J	L_settings_write_coord_data37
NOP	
L_settings_write_coord_data38:
;Globals.c,381 :: 		res = NVMWriteRow(&add,buffA);
SW	R26, 8(SP)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,382 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,398 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,399 :: 		}
;Globals.c,398 :: 		return res;
;Globals.c,399 :: 		}
L_end_settings_write_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _settings_write_coord_data
_settings_read_coord_data:
;Globals.c,406 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,409 :: 		if(!read_ram_loaded_indicator()){
SW	R25, 4(SP)
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data178
NOP	
J	L_settings_read_coord_data40
NOP	
L__settings_read_coord_data178:
;Globals.c,410 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,411 :: 		read_row_from_flash(add);
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,412 :: 		}
L_settings_read_coord_data40:
;Globals.c,414 :: 		if(!read_coord_data_indicator()){
JAL	_read_coord_data_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data179
NOP	
J	L_settings_read_coord_data41
NOP	
L__settings_read_coord_data179:
;Globals.c,415 :: 		unsigned long temp = 0UL;
;Globals.c,416 :: 		float value = 0.00;
;Globals.c,417 :: 		for(i = 0; i < 9; i++){
SW	R0, Offset(_i+0)(GP)
L_settings_read_coord_data42:
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 9
BNE	R2, R0, L__settings_read_coord_data180
NOP	
J	L_settings_read_coord_data43
NOP	
L__settings_read_coord_data180:
;Globals.c,418 :: 		for(j = 0 ; j < NoOfAxis; j++){
SW	R0, Offset(_j+0)(GP)
L_settings_read_coord_data45:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_read_coord_data181
NOP	
J	L_settings_read_coord_data46
NOP	
L__settings_read_coord_data181:
;Globals.c,419 :: 		temp = buffA[(i*NoOfAxis) + j];
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
;Globals.c,421 :: 		if(temp == -1)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__settings_read_coord_data182
NOP	
J	L__settings_read_coord_data125
NOP	
L__settings_read_coord_data182:
; temp end address is: 12 (R3)
;Globals.c,422 :: 		temp = 0UL;
; temp start address is: 8 (R2)
MOVZ	R2, R0, R0
; temp end address is: 8 (R2)
J	L_settings_read_coord_data48
NOP	
L__settings_read_coord_data125:
;Globals.c,421 :: 		if(temp == -1)
MOVZ	R2, R3, R0
;Globals.c,422 :: 		temp = 0UL;
L_settings_read_coord_data48:
;Globals.c,423 :: 		value = ulong2flt(temp);
; temp start address is: 8 (R2)
MOVZ	R25, R2, R0
; temp end address is: 8 (R2)
JAL	_ulong2flt+0
NOP	
;Globals.c,424 :: 		coord_system[i].coord[j] = value;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,418 :: 		for(j = 0 ; j < NoOfAxis; j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,432 :: 		}
J	L_settings_read_coord_data45
NOP	
L_settings_read_coord_data46:
;Globals.c,417 :: 		for(i = 0; i < 9; i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,433 :: 		}
J	L_settings_read_coord_data42
NOP	
L_settings_read_coord_data43:
;Globals.c,435 :: 		set_coord_data_read_indicator(COORD_READ_FLAG);
MOVZ	R25, R0, R0
JAL	Globals_set_coord_data_read_indicator+0
NOP	
;Globals.c,436 :: 		}
L_settings_read_coord_data41:
;Globals.c,437 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,444 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Globals.c,450 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,453 :: 		j=0;
SW	R0, Offset(_j+0)(GP)
;Globals.c,454 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
; recipe end address is: 20 (R5)
L_settings_write_one_coord49:
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R3, R2
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_write_one_coord184
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord184:
;Globals.c,456 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 16
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,457 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,458 :: 		buffA[i] = temp[j];
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
;Globals.c,459 :: 		j++;
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,454 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,464 :: 		}
; recipe end address is: 20 (R5)
J	L_settings_write_one_coord49
NOP	
L_settings_write_one_coord50:
;Globals.c,466 :: 		switch(coord_select){
J	L_settings_write_one_coord52
NOP	
;Globals.c,468 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,469 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,470 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,471 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,472 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,473 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,474 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,475 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,476 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,478 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
L_settings_write_one_coord63:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,479 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
L_settings_write_one_coord64:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord53
NOP	
;Globals.c,480 :: 		}
L_settings_write_one_coord52:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord186
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord186:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord188
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord188:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord190
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord190:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord192
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord192:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord194
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord194:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord196
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord196:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord198
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord198:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord200
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord200:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord202
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord202:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord204
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord204:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord206
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord206:
L_settings_write_one_coord53:
;Globals.c,482 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_write_one_coord207
NOP	
J	L_settings_write_one_coord65
NOP	
L__settings_write_one_coord207:
;Globals.c,484 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SW	R26, 4(SP)
SH	R25, 8(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R25, 4(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,488 :: 		error = (int)NVMErasePage(&add);
SW	R26, 4(SP)
SH	R25, 8(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,489 :: 		}
L_settings_write_one_coord65:
;Globals.c,493 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_write_one_coord209
NOP	
J	L_settings_write_one_coord66
NOP	
L__settings_write_one_coord209:
;Globals.c,498 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_write_one_coord
NOP	
;Globals.c,499 :: 		}
L_settings_write_one_coord66:
;Globals.c,503 :: 		if(!error)
LHU	R2, Offset(_error+0)(GP)
BEQ	R2, R0, L__settings_write_one_coord210
NOP	
J	L_settings_write_one_coord67
NOP	
L__settings_write_one_coord210:
;Globals.c,504 :: 		set_ram_loaded_indicator(NVMWriteQuad (&add, temp));
ADDIU	R2, SP, 32
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R25, 4(SP)
ANDI	R25, R2, 65535
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
L_settings_write_one_coord67:
;Globals.c,506 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,507 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,512 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,515 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line68
NOP	
;Globals.c,516 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line70:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line69
NOP	
;Globals.c,517 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line71:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line69
NOP	
;Globals.c,518 :: 		}
L_settings_read_startup_line68:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line213
NOP	
J	L_settings_read_startup_line70
NOP	
L__settings_read_startup_line213:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line215
NOP	
J	L_settings_read_startup_line71
NOP	
L__settings_read_startup_line215:
L_settings_read_startup_line69:
;Globals.c,520 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,528 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,529 :: 		}
;Globals.c,528 :: 		return STATUS_OK;
;Globals.c,529 :: 		}
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
;Globals.c,533 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,538 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
; str_len start address is: 16 (R4)
SEH	R4, R2
;Globals.c,547 :: 		add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,550 :: 		switch(n){
J	L_settings_store_startup_line72
NOP	
;Globals.c,551 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line74:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line73
NOP	
;Globals.c,552 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line75:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line73
NOP	
;Globals.c,553 :: 		}
L_settings_store_startup_line72:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line218
NOP	
J	L_settings_store_startup_line74
NOP	
L__settings_store_startup_line218:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line220
NOP	
J	L_settings_store_startup_line75
NOP	
L__settings_store_startup_line220:
L_settings_store_startup_line73:
;Globals.c,555 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_startup_line221
NOP	
J	L_settings_store_startup_line76
NOP	
L__settings_store_startup_line221:
;Globals.c,557 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R4, 12(SP)
SW	R26, 16(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,561 :: 		error = (int)NVMErasePage(&add);
SH	R4, 12(SP)
SW	R26, 16(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,562 :: 		}
L_settings_store_startup_line76:
;Globals.c,566 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_store_startup_line223
NOP	
J	L_settings_store_startup_line77
NOP	
L__settings_store_startup_line223:
; str_len end address is: 16 (R4)
;Globals.c,571 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_store_startup_line
NOP	
;Globals.c,572 :: 		}
L_settings_store_startup_line77:
;Globals.c,575 :: 		for(i=start_offset;i<start_offset+16;i++)
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
SW	R2, Offset(_i+0)(GP)
; str_len end address is: 16 (R4)
L_settings_store_startup_line78:
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R3, R2, 16
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_store_startup_line224
NOP	
J	L_settings_store_startup_line79
NOP	
L__settings_store_startup_line224:
;Globals.c,576 :: 		buffA[i] = 0;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,575 :: 		for(i=start_offset;i<start_offset+16;i++)
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,576 :: 		buffA[i] = 0;
J	L_settings_store_startup_line78
NOP	
L_settings_store_startup_line79:
;Globals.c,580 :: 		memcpy(buffA+start_offset,line,str_len);
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
;Globals.c,592 :: 		set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
SW	R26, 12(SP)
SH	R25, 16(SP)
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
SH	R25, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,594 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,595 :: 		}
;Globals.c,594 :: 		return error;
;Globals.c,595 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,600 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,602 :: 		volatile unsigned long has_data = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,603 :: 		int val_temp = 0;
;Globals.c,605 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,608 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting226
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting226:
;Globals.c,610 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R25, 12(SP)
SWC1	S12, 16(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LWC1	S12, 16(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,611 :: 		}
L_settings_store_global_setting81:
;Globals.c,615 :: 		error = (int)NVMErasePage(&add);
SH	R25, 12(SP)
SWC1	S12, 16(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LWC1	S12, 16(SP)
LH	R25, 12(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,619 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_store_global_setting228
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting228:
;Globals.c,624 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,625 :: 		}
L_settings_store_global_setting82:
;Globals.c,635 :: 		switch(parameter) {
J	L_settings_store_global_setting83
NOP	
;Globals.c,636 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting85:
L_settings_store_global_setting86:
L_settings_store_global_setting87:
;Globals.c,637 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting229:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting88:
;Globals.c,639 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
SWC1	S12, 0(R2)
;Globals.c,641 :: 		buffA[SPMMX_OFFSET+parameter] = flt2ulong(value);
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
;Globals.c,652 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,653 :: 		case 3:
L_settings_store_global_setting89:
;Globals.c,654 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting230
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting230:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting90:
;Globals.c,655 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,656 :: 		settings.p_usec = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,658 :: 		buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,659 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,660 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting91:
SWC1	S12, Offset(_settings+16)(GP)
;Globals.c,661 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,662 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,663 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting92:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,664 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,665 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,666 :: 		case 6:
L_settings_store_global_setting93:
;Globals.c,667 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,668 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612384)(GP)
;Globals.c,669 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,670 :: 		case 7:
L_settings_store_global_setting94:
;Globals.c,671 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,672 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+56)(GP)
;Globals.c,673 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,674 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,675 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting95:
;Globals.c,676 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,677 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,678 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,679 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting96:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,680 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,681 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,682 :: 		case 10:
L_settings_store_global_setting97:
;Globals.c,683 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,684 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,685 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,686 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,687 :: 		case 11:
L_settings_store_global_setting98:
;Globals.c,688 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,689 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+48)(GP)
;Globals.c,690 :: 		buffA[N_ARC_CORREC_OFFSET] = (int)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,691 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,692 :: 		case 12:
L_settings_store_global_setting99:
;Globals.c,693 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,694 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+62)(GP)
;Globals.c,695 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,696 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,697 :: 		case 13:
L_settings_store_global_setting100:
;Globals.c,698 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting232
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting232:
;Globals.c,699 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+50)(GP)
;Globals.c,700 :: 		}else{
J	L_settings_store_global_setting102
NOP	
L_settings_store_global_setting101:
;Globals.c,701 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,702 :: 		}
L_settings_store_global_setting102:
;Globals.c,703 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,704 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,705 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting103:
;Globals.c,706 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting234
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting234:
;Globals.c,707 :: 		settings.flags |= BITFLAG_AUTO_START;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,708 :: 		}else{
J	L_settings_store_global_setting105
NOP	
L_settings_store_global_setting104:
;Globals.c,709 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,710 :: 		}
L_settings_store_global_setting105:
;Globals.c,711 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,712 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,713 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting106:
;Globals.c,714 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting236
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting236:
;Globals.c,715 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+50)(GP)
;Globals.c,716 :: 		}else{
J	L_settings_store_global_setting108
NOP	
L_settings_store_global_setting107:
;Globals.c,717 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,718 :: 		}
L_settings_store_global_setting108:
;Globals.c,719 :: 		buffA[FLAGS_OFFSET] |= (unsigned long)settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,720 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,721 :: 		case 16:
L_settings_store_global_setting109:
;Globals.c,722 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting238
NOP	
J	L_settings_store_global_setting110
NOP	
L__settings_store_global_setting238:
;Globals.c,723 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+50)(GP)
;Globals.c,724 :: 		}else{
J	L_settings_store_global_setting111
NOP	
L_settings_store_global_setting110:
;Globals.c,725 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,726 :: 		}
L_settings_store_global_setting111:
;Globals.c,727 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,729 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,730 :: 		case 17:
L_settings_store_global_setting112:
;Globals.c,731 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting240
NOP	
J	L_settings_store_global_setting113
NOP	
L__settings_store_global_setting240:
;Globals.c,732 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+50)(GP)
;Globals.c,733 :: 		}else{
J	L_settings_store_global_setting114
NOP	
L_settings_store_global_setting113:
;Globals.c,734 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,735 :: 		}
L_settings_store_global_setting114:
;Globals.c,736 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,737 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,738 :: 		case 18:
L_settings_store_global_setting115:
;Globals.c,739 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,740 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,741 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,742 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,743 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting116:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,744 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,745 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,746 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting117:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,747 :: 		buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,748 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,749 :: 		case 21:
L_settings_store_global_setting118:
;Globals.c,750 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,751 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+54)(GP)
;Globals.c,752 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,753 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,754 :: 		case 22:
L_settings_store_global_setting119:
;Globals.c,755 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,756 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,757 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,758 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,759 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting120:
;Globals.c,760 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,761 :: 		if(val_temp == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting121
NOP	
L__settings_store_global_setting241:
;Globals.c,763 :: 		buffA[FLASH_LOADED_OFFSET] = 0x7FFFFFFF;
LUI	R2, 32767
ORI	R2, R2, 65535
SW	R2, Offset(-1610611216)(GP)
;Globals.c,770 :: 		set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,778 :: 		}
L_settings_store_global_setting121:
;Globals.c,779 :: 		break;
J	L_settings_store_global_setting84
NOP	
;Globals.c,780 :: 		default:
L_settings_store_global_setting122:
;Globals.c,781 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,782 :: 		}
L_settings_store_global_setting83:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting243:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting94
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting261:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting97
NOP	
L__settings_store_global_setting263:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting265
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting265:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting267
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting267:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting269
NOP	
J	L_settings_store_global_setting100
NOP	
L__settings_store_global_setting269:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting271
NOP	
J	L_settings_store_global_setting103
NOP	
L__settings_store_global_setting271:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting273
NOP	
J	L_settings_store_global_setting106
NOP	
L__settings_store_global_setting273:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting275
NOP	
J	L_settings_store_global_setting109
NOP	
L__settings_store_global_setting275:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting277
NOP	
J	L_settings_store_global_setting112
NOP	
L__settings_store_global_setting277:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting279
NOP	
J	L_settings_store_global_setting115
NOP	
L__settings_store_global_setting279:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting281
NOP	
J	L_settings_store_global_setting116
NOP	
L__settings_store_global_setting281:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting283
NOP	
J	L_settings_store_global_setting117
NOP	
L__settings_store_global_setting283:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting285
NOP	
J	L_settings_store_global_setting118
NOP	
L__settings_store_global_setting285:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting287
NOP	
J	L_settings_store_global_setting119
NOP	
L__settings_store_global_setting287:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting289
NOP	
J	L_settings_store_global_setting120
NOP	
L__settings_store_global_setting289:
J	L_settings_store_global_setting122
NOP	
L_settings_store_global_setting84:
;Globals.c,783 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,784 :: 		}
;Globals.c,783 :: 		return(STATUS_OK);
;Globals.c,784 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_global_setting
