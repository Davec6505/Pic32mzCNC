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
BEQ	R25, R0, L__settings_init128
NOP	
J	L_settings_init0
NOP	
L__settings_init128:
; ptr end address is: 8 (R2)
;Globals.c,38 :: 		sys.abort           = 0;
SB	R0, Offset(_sys+0)(GP)
;Globals.c,39 :: 		sys.state           = 0;
SB	R0, Offset(_sys+1)(GP)
;Globals.c,40 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,41 :: 		sys.execute         = 0;
SB	R0, Offset(_sys+25)(GP)
;Globals.c,42 :: 		sys.auto_start      = 0;
SB	R0, Offset(_sys+24)(GP)
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
BEQ	R3, R2, L__settings_init129
NOP	
J	L__settings_init125
NOP	
L__settings_init129:
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
SWR	R2, Offset(_settings+0)(GP)
SWL	R2, Offset(_settings+3)(GP)
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
SWR	R2, Offset(_settings+4)(GP)
SWL	R2, Offset(_settings+7)(GP)
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
SWR	R2, Offset(_settings+8)(GP)
SWL	R2, Offset(_settings+11)(GP)
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
SWR	R2, Offset(_settings+12)(GP)
SWL	R2, Offset(_settings+15)(GP)
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
SWR	R2, Offset(_settings+16)(GP)
SWL	R2, Offset(_settings+19)(GP)
;Globals.c,77 :: 		buffA[D_FEED_RATE_OFFSET]  = flt2ulong(settings.default_feed_rate);
LWC1	S12, Offset(_settings+16)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,79 :: 		settings.default_seek_rate = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SWR	R2, Offset(_settings+20)(GP)
SWL	R2, Offset(_settings+23)(GP)
;Globals.c,80 :: 		buffA[D_SEEK_RATE_OFFSET]  = flt2ulong(settings.default_seek_rate);
LWC1	S12, Offset(_settings+20)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,82 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SWR	R2, Offset(_settings+24)(GP)
SWL	R2, Offset(_settings+27)(GP)
;Globals.c,83 :: 		buffA[H_FEED_RATE_OFFSET]   = flt2ulong(settings.homing_feed_rate);
LWC1	S12, Offset(_settings+24)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,85 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SWR	R2, Offset(_settings+28)(GP)
SWL	R2, Offset(_settings+31)(GP)
;Globals.c,86 :: 		buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(settings.homing_seek_rate);
LWC1	S12, Offset(_settings+28)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,88 :: 		settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SWR	R2, Offset(_settings+32)(GP)
SWL	R2, Offset(_settings+35)(GP)
;Globals.c,89 :: 		buffA[H_PULL_OFF_OFFSET]    = flt2ulong(settings.homing_pulloff);
LWC1	S12, Offset(_settings+32)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,91 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SWR	R2, Offset(_settings+36)(GP)
SWL	R2, Offset(_settings+39)(GP)
;Globals.c,92 :: 		buffA[MM_ARC_SEG_OFFSET]    =  flt2ulong(settings.mm_per_arc_segment);
LWC1	S12, Offset(_settings+36)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,94 :: 		settings.acceleration      = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SWR	R2, Offset(_settings+40)(GP)
SWL	R2, Offset(_settings+43)(GP)
;Globals.c,95 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(settings.acceleration);
LWC1	S12, Offset(_settings+40)(GP)
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,97 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SWR	R2, Offset(_settings+44)(GP)
SWL	R2, Offset(_settings+47)(GP)
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
;Globals.c,116 :: 		if (DEFAULT_REPORT_INCHES) { settings.flags |= BITFLAG_REPORT_INCHES; }
L_settings_init3:
;Globals.c,117 :: 		if (DEFAULT_AUTO_START) { settings.flags |= BITFLAG_AUTO_START; }
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,118 :: 		if (DEFAULT_INVERT_ST_ENABLE) { settings.flags |= BITFLAG_INVERT_ST_ENABLE; }
L_settings_init5:
;Globals.c,119 :: 		if (DEFAULT_HARD_LIMIT_ENABLE) { settings.flags |= BITFLAG_HARD_LIMIT_ENABLE; }
L_settings_init6:
;Globals.c,120 :: 		if (DEFAULT_HOMING_ENABLE) { settings.flags |= BITFLAG_HOMING_ENABLE; }
L_settings_init7:
;Globals.c,121 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,126 :: 		buffA[FLASH_LOADED_OFFSET] = 0x7FFFFFFF;
LUI	R2, 32767
ORI	R2, R2, 65535
SW	R2, Offset(-1610611216)(GP)
;Globals.c,130 :: 		has_data = 1;
; has_data start address is: 8 (R2)
ORI	R2, R0, 1
; has_data end address is: 8 (R2)
;Globals.c,132 :: 		while(has_data){
L_settings_init8:
; has_data start address is: 8 (R2)
BNE	R2, R0, L__settings_init131
NOP	
J	L__settings_init124
NOP	
L__settings_init131:
; has_data end address is: 8 (R2)
;Globals.c,134 :: 		has_data = (unsigned long)NVMWriteRow(&add,buffA);
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
;Globals.c,135 :: 		retry_flash_write++;
LH	R2, 14(SP)
ADDIU	R2, R2, 1
SH	R2, 14(SP)
;Globals.c,142 :: 		if(retry_flash_write > FLASH_RETRY_COUNT)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__settings_init132
NOP	
J	L_settings_init10
NOP	
L__settings_init132:
MOVZ	R2, R3, R0
J	L_settings_init9
NOP	
L_settings_init10:
;Globals.c,143 :: 		}
MOVZ	R2, R3, R0
; has_data end address is: 12 (R3)
J	L_settings_init8
NOP	
L__settings_init124:
;Globals.c,132 :: 		while(has_data){
;Globals.c,143 :: 		}
L_settings_init9:
;Globals.c,146 :: 		}//else{
; has_data start address is: 8 (R2)
; has_data end address is: 8 (R2)
J	L_settings_init2
NOP	
L__settings_init125:
;Globals.c,52 :: 		if(has_data == -1){
MOVZ	R2, R3, R0
;Globals.c,146 :: 		}//else{
L_settings_init2:
;Globals.c,147 :: 		if(has_data){
; has_data start address is: 8 (R2)
BNE	R2, R0, L__settings_init134
NOP	
J	L_settings_init11
NOP	
L__settings_init134:
; has_data end address is: 8 (R2)
;Globals.c,148 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,149 :: 		}
L_settings_init11:
;Globals.c,151 :: 		settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+0)(GP)
;Globals.c,152 :: 		settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+4)(GP)
;Globals.c,153 :: 		settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+8)(GP)
;Globals.c,155 :: 		settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+16)(GP)
;Globals.c,156 :: 		settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,157 :: 		settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,158 :: 		settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,159 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,160 :: 		settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,161 :: 		settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET]);
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,162 :: 		settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,163 :: 		settings.n_arc_correction       = (unsigned int)buffA[N_ARC_CORREC_OFFSET];
LW	R2, Offset(-1610612420)(GP)
SH	R2, Offset(_settings+48)(GP)
;Globals.c,164 :: 		settings.flags                  = (unsigned int)buffA[FLAGS_OFFSET];
LW	R2, Offset(-1610612416)(GP)
SH	R2, Offset(_settings+50)(GP)
;Globals.c,165 :: 		settings.stepper_idle_lock_time = (unsigned int)buffA[STEP_IDLE_DLY_OFFSET];// If max value 255, steppers do not disable.
LW	R2, Offset(-1610612412)(GP)
SH	R2, Offset(_settings+56)(GP)
;Globals.c,166 :: 		settings.microsteps             = (unsigned int)buffA[MICROSTEPS_OFFSET];
LW	R2, Offset(-1610612400)(GP)
SH	R2, Offset(_settings+58)(GP)
;Globals.c,167 :: 		settings.p_usec                 = (unsigned int)buffA[P_USEC_OFFSET];
LW	R2, Offset(-1610612456)(GP)
SH	R2, Offset(_settings+60)(GP)
;Globals.c,168 :: 		settings.decimal_places         = (unsigned int)buffA[DEC_PLACES_OFFSET];
LW	R2, Offset(-1610612392)(GP)
SH	R2, Offset(_settings+62)(GP)
;Globals.c,169 :: 		settings.homing_debounce_delay  = (unsigned int)buffA[H_DEBNC_DLY_OFFSET];
LW	R2, Offset(-1610612408)(GP)
SH	R2, Offset(_settings+54)(GP)
;Globals.c,170 :: 		settings.invert_mask            = (unsigned int)buffA[INVERT_MASK_OFFSET];
LW	R2, Offset(-1610612384)(GP)
SH	R2, Offset(_settings+66)(GP)
;Globals.c,173 :: 		}
L_settings_init1:
;Globals.c,174 :: 		}
L_end_settings_init:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_init
Globals_set_ram_loaded_indicator:
;Globals.c,186 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,187 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,188 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,189 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,192 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,193 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,194 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,197 :: 		int read_ram_loaded_indicator(){
;Globals.c,198 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,199 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
Globals_set_coord_data_read_indicator:
;Globals.c,205 :: 		static void set_coord_data_read_indicator(int flag){
;Globals.c,206 :: 		bit_true(coord_read,flag);
LH	R2, Offset(Globals_coord_read+0)(GP)
OR	R2, R2, R25
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,207 :: 		}
L_end_set_coord_data_read_indicator:
JR	RA
NOP	
; end of Globals_set_coord_data_read_indicator
Globals_rst_single_coord_read_indicators:
;Globals.c,210 :: 		static void rst_single_coord_read_indicators(int flag){
;Globals.c,211 :: 		bit_false(coord_read,flag);
NOR	R3, R25, R0
LH	R2, Offset(Globals_coord_read+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,212 :: 		}
L_end_rst_single_coord_read_indicators:
JR	RA
NOP	
; end of Globals_rst_single_coord_read_indicators
Globals_rst_coord_read_indicator:
;Globals.c,215 :: 		static void rst_coord_read_indicator(){
;Globals.c,216 :: 		coord_read = 0;
SH	R0, Offset(Globals_coord_read+0)(GP)
;Globals.c,217 :: 		}
L_end_rst_coord_read_indicator:
JR	RA
NOP	
; end of Globals_rst_coord_read_indicator
_read_coord_data_indicator:
;Globals.c,220 :: 		int read_coord_data_indicator(){
;Globals.c,221 :: 		return coord_read;
LH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,222 :: 		}
L_end_read_coord_data_indicator:
JR	RA
NOP	
; end of _read_coord_data_indicator
_read_row_from_flash:
;Globals.c,232 :: 		int read_row_from_flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,236 :: 		ptr = addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Globals.c,237 :: 		data_count = 0;
; data_count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Globals.c,238 :: 		for(j = 0;j < 512;j++){
SW	R0, Offset(_j+0)(GP)
; data_count end address is: 20 (R5)
L_read_row_from_flash12:
; data_count start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 512
BNE	R2, R0, L__read_row_from_flash143
NOP	
J	L_read_row_from_flash13
NOP	
L__read_row_from_flash143:
; ptr end address is: 16 (R4)
;Globals.c,239 :: 		buffA[j] = *(ptr+j);
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
;Globals.c,240 :: 		if(buffA[j] != -1)data_count++;
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__read_row_from_flash145
NOP	
J	L__read_row_from_flash123
NOP	
L__read_row_from_flash145:
ADDIU	R2, R5, 1
SEH	R5, R2
; data_count end address is: 20 (R5)
J	L_read_row_from_flash15
NOP	
L__read_row_from_flash123:
L_read_row_from_flash15:
;Globals.c,238 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 20 (R5)
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,245 :: 		}
; ptr end address is: 16 (R4)
J	L_read_row_from_flash12
NOP	
L_read_row_from_flash13:
;Globals.c,249 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R5
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,252 :: 		return data_count;
SEH	R2, R5
; data_count end address is: 20 (R5)
;Globals.c,253 :: 		}
L_end_read_row_from_flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _read_row_from_flash
_settings_write_coord_data:
;Globals.c,282 :: 		unsigned int settings_write_coord_data(int coord_select,float *coord){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Globals.c,284 :: 		int res=0,recipe = 0;
SW	R25, 4(SP)
;Globals.c,285 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 20
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSsettings_write_coord_data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSsettings_write_coord_data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,286 :: 		unsigned long temp[4] = {0};
;Globals.c,288 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,291 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,293 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_write_coord_data147
NOP	
J	L_settings_write_coord_data16
NOP	
L__settings_write_coord_data147:
;Globals.c,295 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R4, 8(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LH	R4, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,299 :: 		error = (int)NVMErasePage(&add);
SH	R4, 8(SP)
SW	R26, 12(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,300 :: 		}
L_settings_write_coord_data16:
;Globals.c,304 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_write_coord_data149
NOP	
J	L_settings_write_coord_data17
NOP	
L__settings_write_coord_data149:
; recipe end address is: 16 (R4)
;Globals.c,309 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_write_coord_data
NOP	
;Globals.c,310 :: 		}
L_settings_write_coord_data17:
;Globals.c,312 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_settings_write_coord_data18
NOP	
;Globals.c,313 :: 		case 0:break;
L_settings_write_coord_data20:
J	L_settings_write_coord_data19
NOP	
;Globals.c,315 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_coord_data21:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,316 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_coord_data22:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,317 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_coord_data23:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,318 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_coord_data24:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,319 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_coord_data25:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,320 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_coord_data26:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,321 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_coord_data27:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,322 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_coord_data28:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,323 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_coord_data29:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,325 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
L_settings_write_coord_data30:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,326 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
L_settings_write_coord_data31:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_coord_data19
NOP	
;Globals.c,327 :: 		}
L_settings_write_coord_data18:
SEH	R2, R4
BNE	R2, R0, L__settings_write_coord_data151
NOP	
J	L_settings_write_coord_data20
NOP	
L__settings_write_coord_data151:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_coord_data153
NOP	
J	L_settings_write_coord_data21
NOP	
L__settings_write_coord_data153:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_coord_data155
NOP	
J	L_settings_write_coord_data22
NOP	
L__settings_write_coord_data155:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_coord_data157
NOP	
J	L_settings_write_coord_data23
NOP	
L__settings_write_coord_data157:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_coord_data159
NOP	
J	L_settings_write_coord_data24
NOP	
L__settings_write_coord_data159:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_coord_data161
NOP	
J	L_settings_write_coord_data25
NOP	
L__settings_write_coord_data161:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_coord_data163
NOP	
J	L_settings_write_coord_data26
NOP	
L__settings_write_coord_data163:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_coord_data165
NOP	
J	L_settings_write_coord_data27
NOP	
L__settings_write_coord_data165:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_coord_data167
NOP	
J	L_settings_write_coord_data28
NOP	
L__settings_write_coord_data167:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_coord_data169
NOP	
J	L_settings_write_coord_data29
NOP	
L__settings_write_coord_data169:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_coord_data171
NOP	
J	L_settings_write_coord_data30
NOP	
L__settings_write_coord_data171:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_coord_data173
NOP	
J	L_settings_write_coord_data31
NOP	
L__settings_write_coord_data173:
L_settings_write_coord_data19:
;Globals.c,329 :: 		j = i = 0;
SW	R0, Offset(_i+0)(GP)
LW	R2, Offset(_i+0)(GP)
SW	R2, Offset(_j+0)(GP)
;Globals.c,330 :: 		for (i=0;i<3;i++){
SW	R0, Offset(_i+0)(GP)
; recipe end address is: 16 (R4)
L_settings_write_coord_data32:
; recipe start address is: 16 (R4)
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L__settings_write_coord_data174
NOP	
J	L_settings_write_coord_data33
NOP	
L__settings_write_coord_data174:
;Globals.c,331 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,330 :: 		for (i=0;i<3;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,336 :: 		}
J	L_settings_write_coord_data32
NOP	
L_settings_write_coord_data33:
;Globals.c,339 :: 		i = (recipe-1)*4 ;
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
;Globals.c,342 :: 		for(j = 0;j<4;j++){
SW	R0, Offset(_j+0)(GP)
L_settings_write_coord_data35:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_write_coord_data175
NOP	
J	L_settings_write_coord_data36
NOP	
L__settings_write_coord_data175:
;Globals.c,343 :: 		buffA[i] =  wdata[j];
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
;Globals.c,344 :: 		i++;
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,342 :: 		for(j = 0;j<4;j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,345 :: 		}
J	L_settings_write_coord_data35
NOP	
L_settings_write_coord_data36:
;Globals.c,348 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,349 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,365 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,366 :: 		}
;Globals.c,365 :: 		return res;
;Globals.c,366 :: 		}
L_end_settings_write_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _settings_write_coord_data
_settings_read_coord_data:
;Globals.c,373 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,376 :: 		if(!read_ram_loaded_indicator()){
SW	R25, 4(SP)
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data177
NOP	
J	L_settings_read_coord_data38
NOP	
L__settings_read_coord_data177:
;Globals.c,377 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,378 :: 		read_row_from_flash(add);
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,379 :: 		}
L_settings_read_coord_data38:
;Globals.c,381 :: 		if(!read_coord_data_indicator()){
JAL	_read_coord_data_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data178
NOP	
J	L_settings_read_coord_data39
NOP	
L__settings_read_coord_data178:
;Globals.c,382 :: 		unsigned long temp = 0UL;
;Globals.c,383 :: 		float value = 0.00;
;Globals.c,384 :: 		for(i = 0; i < 9; i++){
SW	R0, Offset(_i+0)(GP)
L_settings_read_coord_data40:
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 9
BNE	R2, R0, L__settings_read_coord_data179
NOP	
J	L_settings_read_coord_data41
NOP	
L__settings_read_coord_data179:
;Globals.c,385 :: 		for(j = 0 ; j < NoOfAxis; j++){
SW	R0, Offset(_j+0)(GP)
L_settings_read_coord_data43:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_read_coord_data180
NOP	
J	L_settings_read_coord_data44
NOP	
L__settings_read_coord_data180:
;Globals.c,386 :: 		temp = buffA[(i*NoOfAxis) + j];
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
;Globals.c,388 :: 		if(temp == -1)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__settings_read_coord_data181
NOP	
J	L__settings_read_coord_data126
NOP	
L__settings_read_coord_data181:
; temp end address is: 12 (R3)
;Globals.c,389 :: 		temp = 0UL;
; temp start address is: 8 (R2)
MOVZ	R2, R0, R0
; temp end address is: 8 (R2)
J	L_settings_read_coord_data46
NOP	
L__settings_read_coord_data126:
;Globals.c,388 :: 		if(temp == -1)
MOVZ	R2, R3, R0
;Globals.c,389 :: 		temp = 0UL;
L_settings_read_coord_data46:
;Globals.c,390 :: 		value = ulong2flt(temp);
; temp start address is: 8 (R2)
MOVZ	R25, R2, R0
; temp end address is: 8 (R2)
JAL	_ulong2flt+0
NOP	
;Globals.c,391 :: 		coord_system[i].coord[j] = value;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,385 :: 		for(j = 0 ; j < NoOfAxis; j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,399 :: 		}
J	L_settings_read_coord_data43
NOP	
L_settings_read_coord_data44:
;Globals.c,384 :: 		for(i = 0; i < 9; i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,400 :: 		}
J	L_settings_read_coord_data40
NOP	
L_settings_read_coord_data41:
;Globals.c,402 :: 		set_coord_data_read_indicator(COORD_READ_FLAG);
MOVZ	R25, R0, R0
JAL	Globals_set_coord_data_read_indicator+0
NOP	
;Globals.c,403 :: 		}
L_settings_read_coord_data39:
;Globals.c,404 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,411 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Globals.c,417 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,420 :: 		j=0;
SW	R0, Offset(_j+0)(GP)
;Globals.c,421 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
SEH	R2, R2
SW	R2, Offset(_i+0)(GP)
; recipe end address is: 20 (R5)
L_settings_write_one_coord47:
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R3, R2
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_write_one_coord183
NOP	
J	L_settings_write_one_coord48
NOP	
L__settings_write_one_coord183:
;Globals.c,423 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 16
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,424 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,425 :: 		buffA[i] = temp[j];
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
;Globals.c,426 :: 		j++;
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,421 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,431 :: 		}
; recipe end address is: 20 (R5)
J	L_settings_write_one_coord47
NOP	
L_settings_write_one_coord48:
;Globals.c,433 :: 		switch(coord_select){
J	L_settings_write_one_coord50
NOP	
;Globals.c,435 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,436 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,437 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,438 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,439 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,440 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,441 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,442 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,443 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord60:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,445 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G281;break;
L_settings_write_one_coord61:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,446 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G301;break;
L_settings_write_one_coord62:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, Offset(Globals_add+0)(GP)
J	L_settings_write_one_coord51
NOP	
;Globals.c,447 :: 		}
L_settings_write_one_coord50:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord185
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord185:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord187
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord187:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord189
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord189:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord191
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord191:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord193
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord193:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord195
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord195:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord197
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord197:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord199
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord199:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord201
NOP	
J	L_settings_write_one_coord60
NOP	
L__settings_write_one_coord201:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord203
NOP	
J	L_settings_write_one_coord61
NOP	
L__settings_write_one_coord203:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord205
NOP	
J	L_settings_write_one_coord62
NOP	
L__settings_write_one_coord205:
L_settings_write_one_coord51:
;Globals.c,449 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_write_one_coord206
NOP	
J	L_settings_write_one_coord63
NOP	
L__settings_write_one_coord206:
;Globals.c,451 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R25, 4(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,455 :: 		error = (int)NVMErasePage(&add);
SW	R26, 4(SP)
SH	R25, 8(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,456 :: 		}
L_settings_write_one_coord63:
;Globals.c,460 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_write_one_coord208
NOP	
J	L_settings_write_one_coord64
NOP	
L__settings_write_one_coord208:
;Globals.c,465 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_write_one_coord
NOP	
;Globals.c,466 :: 		}
L_settings_write_one_coord64:
;Globals.c,470 :: 		if(!error)
LHU	R2, Offset(_error+0)(GP)
BEQ	R2, R0, L__settings_write_one_coord209
NOP	
J	L_settings_write_one_coord65
NOP	
L__settings_write_one_coord209:
;Globals.c,471 :: 		set_ram_loaded_indicator(NVMWriteQuad (&add, temp));
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
L_settings_write_one_coord65:
;Globals.c,473 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,474 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,479 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,482 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line66
NOP	
;Globals.c,483 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line68:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line67
NOP	
;Globals.c,484 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line69:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line67
NOP	
;Globals.c,485 :: 		}
L_settings_read_startup_line66:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line212
NOP	
J	L_settings_read_startup_line68
NOP	
L__settings_read_startup_line212:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line214
NOP	
J	L_settings_read_startup_line69
NOP	
L__settings_read_startup_line214:
L_settings_read_startup_line67:
;Globals.c,487 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,495 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,496 :: 		}
;Globals.c,495 :: 		return STATUS_OK;
;Globals.c,496 :: 		}
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
;Globals.c,500 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,505 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
; str_len start address is: 16 (R4)
SEH	R4, R2
;Globals.c,514 :: 		add  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,517 :: 		switch(n){
J	L_settings_store_startup_line70
NOP	
;Globals.c,518 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line72:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line71
NOP	
;Globals.c,519 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line73:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line71
NOP	
;Globals.c,520 :: 		}
L_settings_store_startup_line70:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line217
NOP	
J	L_settings_store_startup_line72
NOP	
L__settings_store_startup_line217:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line219
NOP	
J	L_settings_store_startup_line73
NOP	
L__settings_store_startup_line219:
L_settings_store_startup_line71:
;Globals.c,522 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_startup_line220
NOP	
J	L_settings_store_startup_line74
NOP	
L__settings_store_startup_line220:
;Globals.c,524 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R4, 12(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
LH	R4, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,528 :: 		error = (int)NVMErasePage(&add);
SH	R4, 12(SP)
SW	R26, 16(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,529 :: 		}
L_settings_store_startup_line74:
;Globals.c,533 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_store_startup_line222
NOP	
J	L_settings_store_startup_line75
NOP	
L__settings_store_startup_line222:
; str_len end address is: 16 (R4)
;Globals.c,538 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_store_startup_line
NOP	
;Globals.c,539 :: 		}
L_settings_store_startup_line75:
;Globals.c,542 :: 		for(i=start_offset;i<start_offset+16;i++)
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
SW	R2, Offset(_i+0)(GP)
; str_len end address is: 16 (R4)
L_settings_store_startup_line76:
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R3, R2, 16
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_store_startup_line223
NOP	
J	L_settings_store_startup_line77
NOP	
L__settings_store_startup_line223:
;Globals.c,543 :: 		buffA[i] = 0;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,542 :: 		for(i=start_offset;i<start_offset+16;i++)
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,543 :: 		buffA[i] = 0;
J	L_settings_store_startup_line76
NOP	
L_settings_store_startup_line77:
;Globals.c,547 :: 		memcpy(buffA+start_offset,line,str_len);
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
;Globals.c,559 :: 		set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
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
;Globals.c,561 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,562 :: 		}
;Globals.c,561 :: 		return error;
;Globals.c,562 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,567 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Globals.c,568 :: 		int val_temp = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,570 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,572 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting225
NOP	
J	L_settings_store_global_setting79
NOP	
L__settings_store_global_setting225:
;Globals.c,574 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
SH	R25, 12(SP)
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,578 :: 		error = (int)NVMErasePage(&add);
SWC1	S12, 16(SP)
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
LWC1	S12, 16(SP)
LH	R25, 12(SP)
SH	R2, Offset(_error+0)(GP)
;Globals.c,579 :: 		}
L_settings_store_global_setting79:
;Globals.c,583 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting227:
;Globals.c,588 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_store_global_setting
NOP	
;Globals.c,589 :: 		}
L_settings_store_global_setting80:
;Globals.c,599 :: 		switch(parameter) {
J	L_settings_store_global_setting81
NOP	
;Globals.c,600 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting83:
L_settings_store_global_setting84:
L_settings_store_global_setting85:
;Globals.c,601 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting228
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting228:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting86:
;Globals.c,603 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
SWC1	S12, 0(R2)
;Globals.c,605 :: 		buffA[SPMMX_OFFSET+parameter] = flt2ulong(value);
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
;Globals.c,616 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,617 :: 		case 3:
L_settings_store_global_setting87:
;Globals.c,618 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting229:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting88:
;Globals.c,619 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,620 :: 		settings.p_usec = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,622 :: 		buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,623 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,624 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting89:
SWC1	S12, Offset(_settings+16)(GP)
;Globals.c,625 :: 		buffA[D_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,626 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,627 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting90:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,628 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,629 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,630 :: 		case 6:
L_settings_store_global_setting91:
;Globals.c,631 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,632 :: 		buffA[INVERT_MASK_OFFSET] = flt2ulong(floor(value));
JAL	_floor+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612384)(GP)
;Globals.c,633 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,634 :: 		case 7:
L_settings_store_global_setting92:
;Globals.c,635 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,636 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+56)(GP)
;Globals.c,637 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,638 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,639 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting93:
;Globals.c,640 :: 		settings.acceleration = value*60.0*60.0;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,641 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,642 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,643 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting94:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,644 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,645 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,646 :: 		case 10:
L_settings_store_global_setting95:
;Globals.c,647 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,648 :: 		settings.mm_per_arc_segment = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,649 :: 		buffA[MM_ARC_SEG_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612432)(GP)
;Globals.c,650 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,651 :: 		case 11:
L_settings_store_global_setting96:
;Globals.c,652 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,653 :: 		settings.n_arc_correction = val_temp;
SH	R2, Offset(_settings+48)(GP)
;Globals.c,654 :: 		buffA[N_ARC_CORREC_OFFSET] = (int)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612420)(GP)
;Globals.c,655 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,656 :: 		case 12:
L_settings_store_global_setting97:
;Globals.c,657 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,658 :: 		settings.decimal_places = val_temp;
SH	R2, Offset(_settings+62)(GP)
;Globals.c,659 :: 		buffA[DEC_PLACES_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612392)(GP)
;Globals.c,660 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,661 :: 		case 13:
L_settings_store_global_setting98:
;Globals.c,662 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting231:
;Globals.c,663 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+50)(GP)
;Globals.c,664 :: 		}else{
J	L_settings_store_global_setting100
NOP	
L_settings_store_global_setting99:
;Globals.c,665 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,666 :: 		}
L_settings_store_global_setting100:
;Globals.c,667 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,668 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,669 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting101:
;Globals.c,670 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting233:
;Globals.c,671 :: 		settings.flags |= BITFLAG_AUTO_START;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,672 :: 		}else{
J	L_settings_store_global_setting103
NOP	
L_settings_store_global_setting102:
;Globals.c,673 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,674 :: 		}
L_settings_store_global_setting103:
;Globals.c,675 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,676 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,677 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting104:
;Globals.c,678 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting235
NOP	
J	L_settings_store_global_setting105
NOP	
L__settings_store_global_setting235:
;Globals.c,679 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+50)(GP)
;Globals.c,680 :: 		}else{
J	L_settings_store_global_setting106
NOP	
L_settings_store_global_setting105:
;Globals.c,681 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,682 :: 		}
L_settings_store_global_setting106:
;Globals.c,683 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,684 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,685 :: 		case 16:
L_settings_store_global_setting107:
;Globals.c,686 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting237
NOP	
J	L_settings_store_global_setting108
NOP	
L__settings_store_global_setting237:
;Globals.c,687 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+50)(GP)
;Globals.c,688 :: 		}else{
J	L_settings_store_global_setting109
NOP	
L_settings_store_global_setting108:
;Globals.c,689 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,690 :: 		}
L_settings_store_global_setting109:
;Globals.c,691 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,693 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,694 :: 		case 17:
L_settings_store_global_setting110:
;Globals.c,695 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting239
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting239:
;Globals.c,696 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+50)(GP)
;Globals.c,697 :: 		}else{
J	L_settings_store_global_setting112
NOP	
L_settings_store_global_setting111:
;Globals.c,698 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,699 :: 		}
L_settings_store_global_setting112:
;Globals.c,700 :: 		buffA[FLAGS_OFFSET] |= settings.flags;
LHU	R3, Offset(_settings+50)(GP)
LW	R2, Offset(-1610612416)(GP)
OR	R2, R2, R3
SW	R2, Offset(-1610612416)(GP)
;Globals.c,701 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,702 :: 		case 18:
L_settings_store_global_setting113:
;Globals.c,703 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,704 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,705 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,706 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,707 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting114:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,708 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,709 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,710 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting115:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,711 :: 		buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,712 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,713 :: 		case 21:
L_settings_store_global_setting116:
;Globals.c,714 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,715 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+54)(GP)
;Globals.c,716 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,717 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,718 :: 		case 22:
L_settings_store_global_setting117:
;Globals.c,719 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,720 :: 		settings.homing_pulloff = val_temp;
SEH	R3, R2
MTC1	R3, S0
CVT32.W 	S0, S0
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,721 :: 		buffA[H_PULL_OFF_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612436)(GP)
;Globals.c,722 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,723 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting118:
;Globals.c,724 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,725 :: 		if(val_temp == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__settings_store_global_setting240
NOP	
J	L_settings_store_global_setting119
NOP	
L__settings_store_global_setting240:
;Globals.c,733 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting120
NOP	
L__settings_store_global_setting241:
;Globals.c,736 :: 		set_ram_loaded_indicator(read_row_from_flash(add));
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,740 :: 		error = (int)NVMErasePage(&add);
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,741 :: 		}
L_settings_store_global_setting120:
;Globals.c,745 :: 		if(error){
LHU	R2, Offset(_error+0)(GP)
BNE	R2, R0, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting121
NOP	
L__settings_store_global_setting243:
;Globals.c,750 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
J	L_end_settings_store_global_setting
NOP	
;Globals.c,751 :: 		}
L_settings_store_global_setting121:
;Globals.c,758 :: 		set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,764 :: 		}
L_settings_store_global_setting119:
;Globals.c,765 :: 		break;
J	L_settings_store_global_setting82
NOP	
;Globals.c,766 :: 		default:
L_settings_store_global_setting122:
;Globals.c,767 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,768 :: 		}
L_settings_store_global_setting81:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting91
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting261:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting94
NOP	
L__settings_store_global_setting263:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting265
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting265:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting267
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting267:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting269
NOP	
J	L_settings_store_global_setting97
NOP	
L__settings_store_global_setting269:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting271
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting271:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting273
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting273:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting275
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting275:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting277
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting277:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting279
NOP	
J	L_settings_store_global_setting110
NOP	
L__settings_store_global_setting279:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting281
NOP	
J	L_settings_store_global_setting113
NOP	
L__settings_store_global_setting281:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting283
NOP	
J	L_settings_store_global_setting114
NOP	
L__settings_store_global_setting283:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting285
NOP	
J	L_settings_store_global_setting115
NOP	
L__settings_store_global_setting285:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting287
NOP	
J	L_settings_store_global_setting116
NOP	
L__settings_store_global_setting287:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting289
NOP	
J	L_settings_store_global_setting117
NOP	
L__settings_store_global_setting289:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting291
NOP	
J	L_settings_store_global_setting118
NOP	
L__settings_store_global_setting291:
J	L_settings_store_global_setting122
NOP	
L_settings_store_global_setting82:
;Globals.c,769 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,770 :: 		}
;Globals.c,769 :: 		return(STATUS_OK);
;Globals.c,770 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _settings_store_global_setting
