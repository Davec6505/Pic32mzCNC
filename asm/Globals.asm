_settings_init:
;Globals.c,41 :: 		void settings_init(short reset_all){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,43 :: 		if(!reset_all){
SW	R25, 4(SP)
BEQ	R25, R0, L__settings_init146
NOP	
J	L_settings_init0
NOP	
L__settings_init146:
;Globals.c,44 :: 		sys.abort           = 0;
SH	R0, Offset(_sys+0)(GP)
;Globals.c,45 :: 		sys.state           = 0;
SH	R0, Offset(_sys+2)(GP)
;Globals.c,46 :: 		sys.homing          = 0;
SH	R0, Offset(_sys+4)(GP)
;Globals.c,47 :: 		sys.execute         = 0;
SH	R0, Offset(_sys+26)(GP)
;Globals.c,48 :: 		sys.auto_start      = 0;
SH	R0, Offset(_sys+24)(GP)
;Globals.c,49 :: 		return;
J	L_end_settings_init
NOP	
;Globals.c,50 :: 		}
L_settings_init0:
;Globals.c,52 :: 		add = (unsigned long)FLASH_Settings_VAddr_FLASH_LOADED;
LUI	R2, 48411
ORI	R2, R2, 50672
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,53 :: 		marker = NVMReadWord((void*)add);
LW	R2, Offset(Globals_add+0)(GP)
MOVZ	R25, R2, R0
JAL	_NVMReadWord+0
NOP	
;Globals.c,61 :: 		if(marker != SETTINGS_VALID_MARKER){
LUI	R3, 32767
ORI	R3, R3, 258
BNE	R2, R3, L__settings_init148
NOP	
J	L_settings_init1
NOP	
L__settings_init148:
;Globals.c,62 :: 		settings_blank_row();
JAL	Globals_settings_blank_row+0
NOP	
;Globals.c,63 :: 		settings_default_row();
JAL	Globals_settings_default_row+0
NOP	
;Globals.c,64 :: 		}
L_settings_init1:
;Globals.c,66 :: 		settings_load_row();
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,67 :: 		settings_apply_row();
JAL	Globals_settings_apply_row+0
NOP	
;Globals.c,68 :: 		}
L_end_settings_init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_init
Globals_settings_blank_row:
;Globals.c,73 :: 		static void settings_blank_row(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,75 :: 		for(k = 0; k < 512; k++)
SW	R25, 4(SP)
; k start address is: 16 (R4)
MOVZ	R4, R0, R0
; k end address is: 16 (R4)
L_Globals_settings_blank_row2:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 512
BNE	R2, R0, L_Globals_settings_blank_row150
NOP	
J	L_Globals_settings_blank_row3
NOP	
L_Globals_settings_blank_row150:
;Globals.c,76 :: 		buffA[k] = 0xFFFFFFFF;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R3
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Globals.c,75 :: 		for(k = 0; k < 512; k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,76 :: 		buffA[k] = 0xFFFFFFFF;
; k end address is: 16 (R4)
J	L_Globals_settings_blank_row2
NOP	
L_Globals_settings_blank_row3:
;Globals.c,77 :: 		for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
; k start address is: 16 (R4)
MOVZ	R4, R0, R0
; k end address is: 16 (R4)
L_Globals_settings_blank_row5:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 44
BNE	R2, R0, L_Globals_settings_blank_row151
NOP	
J	L_Globals_settings_blank_row6
NOP	
L_Globals_settings_blank_row151:
;Globals.c,78 :: 		buffA[k] = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,77 :: 		for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,78 :: 		buffA[k] = 0;
; k end address is: 16 (R4)
J	L_Globals_settings_blank_row5
NOP	
L_Globals_settings_blank_row6:
;Globals.c,79 :: 		for(k = Line0_Offset; k < (Line1_Offset+16); k++)
; k start address is: 16 (R4)
ORI	R4, R0, 384
; k end address is: 16 (R4)
L_Globals_settings_blank_row8:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 416
BNE	R2, R0, L_Globals_settings_blank_row152
NOP	
J	L_Globals_settings_blank_row9
NOP	
L_Globals_settings_blank_row152:
;Globals.c,80 :: 		buffA[k] = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,79 :: 		for(k = Line0_Offset; k < (Line1_Offset+16); k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,80 :: 		buffA[k] = 0;
; k end address is: 16 (R4)
J	L_Globals_settings_blank_row8
NOP	
L_Globals_settings_blank_row9:
;Globals.c,81 :: 		set_ram_loaded_indicator(1);
ORI	R25, R0, 1
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,82 :: 		rst_coord_read_indicator();
JAL	Globals_rst_coord_read_indicator+0
NOP	
;Globals.c,83 :: 		}
L_end_settings_blank_row:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Globals_settings_blank_row
Globals_settings_default_row:
;Globals.c,87 :: 		static void settings_default_row(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,88 :: 		unsigned long flags = 0;
MOVZ	R30, R0, R0
SW	R30, 4(SP)
;Globals.c,90 :: 		buffA[SPMMX_OFFSET]         = flt2ulong(DEFAULT_X_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612480)(GP)
;Globals.c,91 :: 		buffA[SPMMY_OFFSET]         = flt2ulong(DEFAULT_Y_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612476)(GP)
;Globals.c,92 :: 		buffA[SPMMZ_OFFSET]         = flt2ulong(DEFAULT_Z_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612472)(GP)
;Globals.c,93 :: 		buffA[SPMMA_OFFSET]         = flt2ulong(DEFAULT_A_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612468)(GP)
;Globals.c,94 :: 		buffA[SPMMB_OFFSET]         = flt2ulong(DEFAULT_B_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612464)(GP)
;Globals.c,95 :: 		buffA[SPMMC_OFFSET]         = flt2ulong(DEFAULT_C_STEPS_PER_MM);
LUI	R2, 17210
ORI	R2, R2, 49152
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612460)(GP)
;Globals.c,96 :: 		buffA[P_USEC_OFFSET]        = (unsigned long)DEFAUT_P_USEC;
ORI	R2, R0, 100
SW	R2, Offset(-1610612456)(GP)
;Globals.c,97 :: 		buffA[D_FEED_RATE_OFFSET]   = flt2ulong(DEFAULT_FEEDRATE);
LUI	R2, 17056
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612452)(GP)
;Globals.c,98 :: 		buffA[D_SEEK_RATE_OFFSET]   = flt2ulong(DEFAULT_RAPID_FEEDRATE);
LUI	R2, 17302
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,99 :: 		buffA[H_FEED_RATE_OFFSET]   = flt2ulong(DEFAULT_HOMING_FEEDRATE);
LUI	R2, 16704
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,100 :: 		buffA[H_SEEK_RATE_OFFSET]   = flt2ulong(DEFAULT_HOMING_RAPID_FEEDRATE);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,101 :: 		buffA[H_PULL_OFF_OFFSET]    = flt2ulong(DEFAULT_HOMING_PULLOFF);
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,102 :: 		buffA[MM_ARC_SEG_OFFSET]    = flt2ulong(DEFAULT_MM_PER_ARC_SEGMENT);
LUI	R2, 15948
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,104 :: 		buffA[ACCELERATION_OFFSET]  = flt2ulong(acceleraton);
LUI	R2, 16305
ORI	R2, R2, 51066
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,105 :: 		buffA[JUNCTION_DEV_OFFSET]  = flt2ulong(DEFAULT_JUNCTION_DEVIATION);
LUI	R2, 15692
ORI	R2, R2, 52429
MTC1	R2, S12
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,106 :: 		buffA[N_ARC_CORREC_OFFSET]  = (unsigned long)DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SW	R2, Offset(-1610612420)(GP)
;Globals.c,107 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)DEFAULT_STEPPER_IDLE_LOCK_TIME;
ORI	R2, R0, 25
SW	R2, Offset(-1610612404)(GP)
;Globals.c,108 :: 		buffA[H_DEBNC_DLY_OFFSET]   = (unsigned long)DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SW	R2, Offset(-1610612408)(GP)
;Globals.c,109 :: 		buffA[MICROSTEPS_OFFSET]    = (unsigned long)M_STEP;
ORI	R2, R0, 32
SW	R2, Offset(-1610612400)(GP)
;Globals.c,110 :: 		buffA[DEC_PLACES_OFFSET]    = (unsigned long)DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SW	R2, Offset(-1610612392)(GP)
;Globals.c,111 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)DEFAULT_HOME_DIR_MASK;
ORI	R2, R0, 15
SW	R2, Offset(-1610612388)(GP)
;Globals.c,112 :: 		buffA[INVERT_MASK_OFFSET]   = (unsigned long)DEFAULT_INVERT_MASK;
SW	R0, Offset(-1610612384)(GP)
;Globals.c,113 :: 		buffA[DIR_INVERT_MASK_OFFSET] = (unsigned long)DEFAULT_DIR_INVERT_MASK;
ORI	R2, R0, 5
SW	R2, Offset(-1610612380)(GP)
;Globals.c,114 :: 		buffA[S_CURVE_PERCENTAGE_OFFSET] = (unsigned long)DEFAULT_S_CURVE_PERCENTAGE;
SW	R0, Offset(-1610612376)(GP)
;Globals.c,116 :: 		if (DEFAULT_REPORT_INCHES)    { flags |= BITFLAG_REPORT_INCHES; }       //bit 0
L_Globals_settings_default_row11:
;Globals.c,117 :: 		if (DEFAULT_AUTO_START)       { flags |= BITFLAG_AUTO_START; }          //bit 1
LW	R2, 4(SP)
ORI	R2, R2, 2
SW	R2, 4(SP)
;Globals.c,118 :: 		if (DEFAULT_INVERT_ST_ENABLE) { flags |= BITFLAG_INVERT_ST_ENABLE; }    //bit 2
L_Globals_settings_default_row13:
;Globals.c,119 :: 		if (DEFAULT_HARD_LIMIT_ENABLE){ flags |= BITFLAG_HARD_LIMIT_ENABLE; }   //bit 3
LW	R2, 4(SP)
ORI	R2, R2, 8
;Globals.c,120 :: 		if (DEFAULT_HOMING_ENABLE)    { flags |= BITFLAG_HOMING_ENABLE; }       //bit 4
ORI	R2, R2, 16
SW	R2, 4(SP)
;Globals.c,121 :: 		if (DEFAULT_INVERT_LIMIT_PINS){ flags |= BITFLAG_INVERT_LIMIT_PINS; }   //bit 5
L_Globals_settings_default_row16:
;Globals.c,122 :: 		buffA[FLAGS_OFFSET] = flags;
LW	R2, 4(SP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,123 :: 		}
L_end_settings_default_row:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Globals_settings_default_row
Globals_settings_apply_row:
;Globals.c,131 :: 		static void settings_apply_row(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,134 :: 		settings.steps_per_mm[X]        = ulong2flt(buffA[SPMMX_OFFSET]);
SW	R25, 4(SP)
LW	R25, Offset(-1610612480)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+0)(GP)
;Globals.c,135 :: 		settings.steps_per_mm[Y]        = ulong2flt(buffA[SPMMY_OFFSET]);
LW	R25, Offset(-1610612476)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+4)(GP)
;Globals.c,136 :: 		settings.steps_per_mm[Z]        = ulong2flt(buffA[SPMMZ_OFFSET]);
LW	R25, Offset(-1610612472)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+8)(GP)
;Globals.c,137 :: 		settings.steps_per_mm[A]        = ulong2flt(buffA[SPMMA_OFFSET]);
LW	R25, Offset(-1610612468)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+12)(GP)
;Globals.c,138 :: 		settings.default_feed_rate      = ulong2flt(buffA[D_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612452)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+16)(GP)
;Globals.c,139 :: 		settings.default_seek_rate      = ulong2flt(buffA[D_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612448)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+20)(GP)
;Globals.c,140 :: 		settings.homing_feed_rate       = ulong2flt(buffA[H_FEED_RATE_OFFSET]);
LW	R25, Offset(-1610612444)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+24)(GP)
;Globals.c,141 :: 		settings.homing_seek_rate       = ulong2flt(buffA[H_SEEK_RATE_OFFSET]);
LW	R25, Offset(-1610612440)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+28)(GP)
;Globals.c,142 :: 		settings.homing_pulloff         = ulong2flt(buffA[H_PULL_OFF_OFFSET]);
LW	R25, Offset(-1610612436)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,143 :: 		settings.mm_per_arc_segment     = ulong2flt(buffA[MM_ARC_SEG_OFFSET]);
LW	R25, Offset(-1610612432)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+36)(GP)
;Globals.c,144 :: 		settings.acceleration           = ulong2flt(buffA[ACCELERATION_OFFSET])*sec_sec;
LW	R25, Offset(-1610612428)(GP)
JAL	_ulong2flt+0
NOP	
LUI	R2, 17761
ORI	R2, R2, 0
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,145 :: 		settings.junction_deviation     = ulong2flt(buffA[JUNCTION_DEV_OFFSET]);
LW	R25, Offset(-1610612424)(GP)
JAL	_ulong2flt+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,146 :: 		settings.n_arc_correction       = (unsigned int)buffA[N_ARC_CORREC_OFFSET];
LW	R2, Offset(-1610612420)(GP)
SH	R2, Offset(_settings+48)(GP)
;Globals.c,147 :: 		settings.flags                  = (unsigned int)buffA[FLAGS_OFFSET];
LW	R2, Offset(-1610612416)(GP)
SH	R2, Offset(_settings+50)(GP)
;Globals.c,148 :: 		settings.stepper_idle_lock_time = (unsigned int)buffA[IDLE_LOCK_TMR_OFFSET];
LW	R2, Offset(-1610612404)(GP)
SH	R2, Offset(_settings+56)(GP)
;Globals.c,149 :: 		settings.microsteps             = (unsigned int)buffA[MICROSTEPS_OFFSET];
LW	R2, Offset(-1610612400)(GP)
SH	R2, Offset(_settings+58)(GP)
;Globals.c,150 :: 		settings.p_usec                 = (unsigned int)buffA[P_USEC_OFFSET];
LW	R2, Offset(-1610612456)(GP)
SH	R2, Offset(_settings+60)(GP)
;Globals.c,151 :: 		settings.decimal_places         = (unsigned int)buffA[DEC_PLACES_OFFSET];
LW	R2, Offset(-1610612392)(GP)
SH	R2, Offset(_settings+62)(GP)
;Globals.c,152 :: 		settings.homing_debounce_delay  = (unsigned int)buffA[H_DEBNC_DLY_OFFSET];
LW	R2, Offset(-1610612408)(GP)
SH	R2, Offset(_settings+54)(GP)
;Globals.c,153 :: 		settings.homing_dir_mask        = (unsigned int)buffA[HOME_DIR_MASK_OFFSET];
LW	R2, Offset(-1610612388)(GP)
SH	R2, Offset(_settings+64)(GP)
;Globals.c,154 :: 		settings.invert_mask            = (unsigned int)buffA[INVERT_MASK_OFFSET];
LW	R2, Offset(-1610612384)(GP)
SH	R2, Offset(_settings+66)(GP)
;Globals.c,155 :: 		settings.dir_invert_mask        = (unsigned int)buffA[DIR_INVERT_MASK_OFFSET];
LW	R2, Offset(-1610612380)(GP)
SH	R2, Offset(_settings+68)(GP)
;Globals.c,156 :: 		settings.s_curve_percentage     = (unsigned int)buffA[S_CURVE_PERCENTAGE_OFFSET];
LW	R2, Offset(-1610612376)(GP)
SH	R2, Offset(_settings+74)(GP)
;Globals.c,158 :: 		Stepper_ApplyInvertMasks();
JAL	_Stepper_ApplyInvertMasks+0
NOP	
;Globals.c,159 :: 		}
L_end_settings_apply_row:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Globals_settings_apply_row
_settings_restore:
;Globals.c,174 :: 		int settings_restore(int restore_mask){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,176 :: 		if(restore_mask == SETTINGS_RESTORE_ALL){
SEH	R3, R25
ORI	R2, R0, 255
BEQ	R3, R2, L__settings_restore156
NOP	
J	L_settings_restore17
NOP	
L__settings_restore156:
;Globals.c,178 :: 		for(k = 0; k < 512; k++)
; k start address is: 16 (R4)
MOVZ	R4, R0, R0
; k end address is: 16 (R4)
L_settings_restore18:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 512
BNE	R2, R0, L__settings_restore157
NOP	
J	L_settings_restore19
NOP	
L__settings_restore157:
;Globals.c,179 :: 		buffA[k] = 0xFFFFFFFF;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R3
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Globals.c,178 :: 		for(k = 0; k < 512; k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,179 :: 		buffA[k] = 0xFFFFFFFF;
; k end address is: 16 (R4)
J	L_settings_restore18
NOP	
L_settings_restore19:
;Globals.c,180 :: 		set_ram_loaded_indicator(1);
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,181 :: 		}else{
J	L_settings_restore21
NOP	
L_settings_restore17:
;Globals.c,182 :: 		settings_load_row();
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,183 :: 		}
L_settings_restore21:
;Globals.c,185 :: 		if(restore_mask & SETTINGS_RESTORE_DEFAULTS)
ANDI	R2, R25, 1
BNE	R2, R0, L__settings_restore159
NOP	
J	L_settings_restore22
NOP	
L__settings_restore159:
;Globals.c,186 :: 		settings_default_row();
SH	R25, 4(SP)
JAL	Globals_settings_default_row+0
NOP	
LH	R25, 4(SP)
L_settings_restore22:
;Globals.c,188 :: 		if(restore_mask & SETTINGS_RESTORE_PARAMETERS){
ANDI	R2, R25, 2
BNE	R2, R0, L__settings_restore161
NOP	
J	L_settings_restore23
NOP	
L__settings_restore161:
;Globals.c,189 :: 		for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
; k start address is: 16 (R4)
MOVZ	R4, R0, R0
; k end address is: 16 (R4)
L_settings_restore24:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 44
BNE	R2, R0, L__settings_restore162
NOP	
J	L_settings_restore25
NOP	
L__settings_restore162:
;Globals.c,190 :: 		buffA[k] = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,189 :: 		for(k = 0; k < (NUMBER_OF_DATUMS*NoOfAxis); k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,190 :: 		buffA[k] = 0;
; k end address is: 16 (R4)
J	L_settings_restore24
NOP	
L_settings_restore25:
;Globals.c,191 :: 		}
L_settings_restore23:
;Globals.c,193 :: 		if(restore_mask & SETTINGS_RESTORE_STARTUP_LINES){
ANDI	R2, R25, 4
BNE	R2, R0, L__settings_restore164
NOP	
J	L_settings_restore27
NOP	
L__settings_restore164:
;Globals.c,194 :: 		for(k = Line0_Offset; k < (Line1_Offset+16); k++)
; k start address is: 16 (R4)
ORI	R4, R0, 384
; k end address is: 16 (R4)
L_settings_restore28:
; k start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 416
BNE	R2, R0, L__settings_restore165
NOP	
J	L_settings_restore29
NOP	
L__settings_restore165:
;Globals.c,195 :: 		buffA[k] = 0;
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,194 :: 		for(k = Line0_Offset; k < (Line1_Offset+16); k++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Globals.c,195 :: 		buffA[k] = 0;
; k end address is: 16 (R4)
J	L_settings_restore28
NOP	
L_settings_restore29:
;Globals.c,196 :: 		}
L_settings_restore27:
;Globals.c,198 :: 		k = settings_save_row();
SH	R25, 4(SP)
JAL	Globals_settings_save_row+0
NOP	
LH	R25, 4(SP)
; k start address is: 8 (R2)
;Globals.c,199 :: 		settings_apply_row();
SH	R2, 4(SP)
SH	R25, 6(SP)
JAL	Globals_settings_apply_row+0
NOP	
LH	R25, 6(SP)
LH	R2, 4(SP)
;Globals.c,200 :: 		return k;
; k end address is: 8 (R2)
;Globals.c,201 :: 		}
L_end_settings_restore:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_restore
Globals_set_ram_loaded_indicator:
;Globals.c,226 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,227 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,228 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,229 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,236 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,237 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,238 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,247 :: 		int read_ram_loaded_indicator(){
;Globals.c,248 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,249 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
Globals_set_coord_data_read_indicator:
;Globals.c,258 :: 		static void set_coord_data_read_indicator(int flag){
;Globals.c,259 :: 		bit_true(coord_read,bit(flag));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(Globals_coord_read+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,260 :: 		}
L_end_set_coord_data_read_indicator:
JR	RA
NOP	
; end of Globals_set_coord_data_read_indicator
Globals_rst_single_coord_read_indicators:
;Globals.c,269 :: 		static void rst_single_coord_read_indicators(int flag){
;Globals.c,270 :: 		bit_false(coord_read,bit(flag));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(Globals_coord_read+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,271 :: 		}
L_end_rst_single_coord_read_indicators:
JR	RA
NOP	
; end of Globals_rst_single_coord_read_indicators
Globals_rst_coord_read_indicator:
;Globals.c,278 :: 		static void rst_coord_read_indicator(){
;Globals.c,279 :: 		coord_read = 0;
SH	R0, Offset(Globals_coord_read+0)(GP)
;Globals.c,280 :: 		}
L_end_rst_coord_read_indicator:
JR	RA
NOP	
; end of Globals_rst_coord_read_indicator
_read_coord_data_indicator:
;Globals.c,289 :: 		int read_coord_data_indicator(){
;Globals.c,290 :: 		return coord_read;
LH	R2, Offset(Globals_coord_read+0)(GP)
;Globals.c,291 :: 		}
L_end_read_coord_data_indicator:
JR	RA
NOP	
; end of _read_coord_data_indicator
_read_row_from_flash:
;Globals.c,313 :: 		int read_row_from_flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,317 :: 		ptr = addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Globals.c,318 :: 		data_count = 0;
; data_count start address is: 20 (R5)
MOVZ	R5, R0, R0
;Globals.c,319 :: 		for(j = 0;j < 512;j++){
SW	R0, Offset(_j+0)(GP)
; data_count end address is: 20 (R5)
L_read_row_from_flash31:
; data_count start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 512
BNE	R2, R0, L__read_row_from_flash174
NOP	
J	L_read_row_from_flash32
NOP	
L__read_row_from_flash174:
; ptr end address is: 16 (R4)
;Globals.c,320 :: 		buffA[j] = *(ptr+j);
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
;Globals.c,321 :: 		if(buffA[j] != -1)data_count++;
LW	R2, Offset(_j+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__read_row_from_flash176
NOP	
J	L__read_row_from_flash136
NOP	
L__read_row_from_flash176:
ADDIU	R2, R5, 1
SEH	R5, R2
; data_count end address is: 20 (R5)
J	L_read_row_from_flash34
NOP	
L__read_row_from_flash136:
L_read_row_from_flash34:
;Globals.c,319 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 20 (R5)
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,326 :: 		}
; ptr end address is: 16 (R4)
J	L_read_row_from_flash31
NOP	
L_read_row_from_flash32:
;Globals.c,330 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R5
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,333 :: 		return data_count;
SEH	R2, R5
; data_count end address is: 20 (R5)
;Globals.c,334 :: 		}
L_end_read_row_from_flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _read_row_from_flash
Globals_settings_load_row:
;Globals.c,366 :: 		static void settings_load_row(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,367 :: 		if(!read_ram_loaded_indicator()){
SW	R25, 4(SP)
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L_Globals_settings_load_row178
NOP	
J	L_Globals_settings_load_row35
NOP	
L_Globals_settings_load_row178:
;Globals.c,368 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,369 :: 		read_row_from_flash(add);
LW	R25, Offset(Globals_add+0)(GP)
JAL	_read_row_from_flash+0
NOP	
;Globals.c,370 :: 		set_ram_loaded_indicator(1);
ORI	R25, R0, 1
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,371 :: 		}
L_Globals_settings_load_row35:
;Globals.c,372 :: 		}
L_end_settings_load_row:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Globals_settings_load_row
Globals_settings_save_row:
;Globals.c,381 :: 		static int settings_save_row(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Globals.c,383 :: 		buffA[FLASH_LOADED_OFFSET] = SETTINGS_VALID_MARKER;
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, 32767
ORI	R2, R2, 258
SW	R2, Offset(-1610611216)(GP)
;Globals.c,384 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, Offset(Globals_add+0)(GP)
;Globals.c,385 :: 		error = (int)NVMErasePage(&add);
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMErasePage+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,386 :: 		if(!error){
LHU	R2, Offset(_error+0)(GP)
BEQ	R2, R0, L_Globals_settings_save_row180
NOP	
J	L_Globals_settings_save_row36
NOP	
L_Globals_settings_save_row180:
;Globals.c,387 :: 		error = (int)NVMWriteRow(&add,buffA);
LUI	R26, 40960
ORI	R26, R26, 0
LUI	R25, hi_addr(Globals_add+0)
ORI	R25, R25, lo_addr(Globals_add+0)
JAL	_NVMWriteRow+0
NOP	
SH	R2, Offset(_error+0)(GP)
;Globals.c,388 :: 		}
L_Globals_settings_save_row36:
;Globals.c,395 :: 		rst_coord_read_indicator();
JAL	Globals_rst_coord_read_indicator+0
NOP	
;Globals.c,396 :: 		return error;
LHU	R2, Offset(_error+0)(GP)
;Globals.c,397 :: 		}
;Globals.c,396 :: 		return error;
;Globals.c,397 :: 		}
L_end_settings_save_row:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Globals_settings_save_row
_settings_write_coord_data:
;Globals.c,408 :: 		unsigned int settings_write_coord_data(int coord_select,float *coord){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,410 :: 		if(coord_select < 1 || coord_select > NUMBER_OF_DATUMS)
SEH	R2, R25
SLTI	R2, R2, 1
BEQ	R2, R0, L__settings_write_coord_data182
NOP	
J	L__settings_write_coord_data139
NOP	
L__settings_write_coord_data182:
SEH	R2, R25
SLTI	R2, R2, 12
BNE	R2, R0, L__settings_write_coord_data183
NOP	
J	L__settings_write_coord_data138
NOP	
L__settings_write_coord_data183:
J	L_settings_write_coord_data39
NOP	
L__settings_write_coord_data139:
L__settings_write_coord_data138:
;Globals.c,411 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_settings_write_coord_data
NOP	
L_settings_write_coord_data39:
;Globals.c,413 :: 		settings_load_row();
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,416 :: 		k = (coord_select-1)*NoOfAxis;
ADDIU	R2, R25, -1
SEH	R2, R2
SLL	R2, R2, 2
SH	R2, 8(SP)
;Globals.c,417 :: 		buffA[k]   = flt2ulong(coord[0]);
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 16(SP)
SW	R26, 4(SP)
LWC1	S12, 0(R26)
JAL	_flt2ulong+0
NOP	
LW	R26, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Globals.c,418 :: 		buffA[k+1] = flt2ulong(coord[1]);
LH	R2, 8(SP)
ADDIU	R2, R2, 1
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 16(SP)
ADDIU	R2, R26, 4
SW	R26, 4(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LW	R26, 4(SP)
LW	R3, 16(SP)
SW	R2, 0(R3)
;Globals.c,419 :: 		buffA[k+2] = flt2ulong(coord[2]);
LH	R2, 8(SP)
ADDIU	R2, R2, 2
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 16(SP)
ADDIU	R2, R26, 8
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LW	R3, 16(SP)
SW	R2, 0(R3)
;Globals.c,420 :: 		buffA[k+3] = 0;
LH	R2, 8(SP)
ADDIU	R2, R2, 3
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,422 :: 		return settings_save_row();
JAL	Globals_settings_save_row+0
NOP	
;Globals.c,423 :: 		}
L_end_settings_write_coord_data:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _settings_write_coord_data
_settings_read_coord_data:
;Globals.c,433 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Globals.c,435 :: 		settings_load_row();
SW	R25, 4(SP)
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,437 :: 		if(!read_coord_data_indicator()){
JAL	_read_coord_data_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data185
NOP	
J	L_settings_read_coord_data40
NOP	
L__settings_read_coord_data185:
;Globals.c,438 :: 		unsigned long temp = 0UL;
;Globals.c,439 :: 		for(i = 0; i < NUMBER_OF_DATUMS; i++){
SW	R0, Offset(_i+0)(GP)
L_settings_read_coord_data41:
LW	R2, Offset(_i+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__settings_read_coord_data186
NOP	
J	L_settings_read_coord_data42
NOP	
L__settings_read_coord_data186:
;Globals.c,440 :: 		for(j = 0 ; j < NoOfAxis; j++){
SW	R0, Offset(_j+0)(GP)
L_settings_read_coord_data44:
LW	R2, Offset(_j+0)(GP)
SLTIU	R2, R2, 4
BNE	R2, R0, L__settings_read_coord_data187
NOP	
J	L_settings_read_coord_data45
NOP	
L__settings_read_coord_data187:
;Globals.c,441 :: 		temp = buffA[(i*NoOfAxis) + j];
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(_j+0)(GP)
ADDU	R2, R3, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 16 (R4)
MOVZ	R4, R2, R0
;Globals.c,443 :: 		if(temp == 0xFFFFFFFF)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R4, R2, L__settings_read_coord_data188
NOP	
J	L__settings_read_coord_data140
NOP	
L__settings_read_coord_data188:
;Globals.c,444 :: 		temp = 0UL;
MOVZ	R4, R0, R0
; temp end address is: 16 (R4)
J	L_settings_read_coord_data47
NOP	
L__settings_read_coord_data140:
;Globals.c,443 :: 		if(temp == 0xFFFFFFFF)
;Globals.c,444 :: 		temp = 0UL;
L_settings_read_coord_data47:
;Globals.c,445 :: 		coord_system[i].coord[j] = ulong2flt(temp);
; temp start address is: 16 (R4)
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LW	R2, Offset(_j+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 8(SP)
MOVZ	R25, R4, R0
; temp end address is: 16 (R4)
JAL	_ulong2flt+0
NOP	
LW	R2, 8(SP)
SWC1	S0, 0(R2)
;Globals.c,440 :: 		for(j = 0 ; j < NoOfAxis; j++){
LW	R2, Offset(_j+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_j+0)(GP)
;Globals.c,452 :: 		}
J	L_settings_read_coord_data44
NOP	
L_settings_read_coord_data45:
;Globals.c,439 :: 		for(i = 0; i < NUMBER_OF_DATUMS; i++){
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,453 :: 		}
J	L_settings_read_coord_data41
NOP	
L_settings_read_coord_data42:
;Globals.c,455 :: 		set_coord_data_read_indicator(COORD_READ_FLAG);
MOVZ	R25, R0, R0
JAL	Globals_set_coord_data_read_indicator+0
NOP	
;Globals.c,456 :: 		}
L_settings_read_coord_data40:
;Globals.c,457 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_read_startup_line:
;Globals.c,465 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Globals.c,469 :: 		switch(n){
J	L_settings_read_startup_line48
NOP	
;Globals.c,470 :: 		case 0: k = Line0_Offset; break;
L_settings_read_startup_line50:
; k start address is: 24 (R6)
ORI	R6, R0, 384
; k end address is: 24 (R6)
J	L_settings_read_startup_line49
NOP	
;Globals.c,471 :: 		case 1: k = Line1_Offset; break;
L_settings_read_startup_line51:
; k start address is: 24 (R6)
ORI	R6, R0, 400
; k end address is: 24 (R6)
J	L_settings_read_startup_line49
NOP	
;Globals.c,472 :: 		default: line[0] = 0; return STATUS_INVALID_STATEMENT;
L_settings_read_startup_line52:
SB	R0, 0(R26)
ORI	R2, R0, 6
J	L_end_settings_read_startup_line
NOP	
;Globals.c,473 :: 		}
L_settings_read_startup_line48:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line191
NOP	
J	L_settings_read_startup_line50
NOP	
L__settings_read_startup_line191:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line193
NOP	
J	L_settings_read_startup_line51
NOP	
L__settings_read_startup_line193:
J	L_settings_read_startup_line52
NOP	
L_settings_read_startup_line49:
;Globals.c,474 :: 		settings_load_row();
; k start address is: 24 (R6)
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,475 :: 		src = (char*)(buffA + k);
SEH	R2, R6
; k end address is: 24 (R6)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
; src start address is: 16 (R4)
MOVZ	R4, R2, R0
;Globals.c,476 :: 		for(k = 0; k < LINE_BUFFER_SIZE-1; k++){
; k start address is: 20 (R5)
MOVZ	R5, R0, R0
; k end address is: 20 (R5)
L_settings_read_startup_line53:
; k start address is: 20 (R5)
; src start address is: 16 (R4)
; src end address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 63
BNE	R2, R0, L__settings_read_startup_line194
NOP	
J	L__settings_read_startup_line144
NOP	
L__settings_read_startup_line194:
; src end address is: 16 (R4)
;Globals.c,477 :: 		if(src[k] == 0) break;
; src start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__settings_read_startup_line195
NOP	
J	L_settings_read_startup_line56
NOP	
L__settings_read_startup_line195:
; src end address is: 16 (R4)
SEH	R3, R5
J	L_settings_read_startup_line54
NOP	
L_settings_read_startup_line56:
;Globals.c,478 :: 		if(src[k] < 0x20 || src[k] > 0x7E){ k = 0; break; }
; src start address is: 16 (R4)
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__settings_read_startup_line196
NOP	
J	L__settings_read_startup_line143
NOP	
L__settings_read_startup_line196:
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 127
BNE	R2, R0, L__settings_read_startup_line197
NOP	
J	L__settings_read_startup_line142
NOP	
L__settings_read_startup_line197:
J	L_settings_read_startup_line59
NOP	
; src end address is: 16 (R4)
; k end address is: 20 (R5)
L__settings_read_startup_line143:
L__settings_read_startup_line142:
; k start address is: 12 (R3)
MOVZ	R3, R0, R0
; k end address is: 12 (R3)
J	L_settings_read_startup_line54
NOP	
L_settings_read_startup_line59:
;Globals.c,479 :: 		line[k] = src[k];
; k start address is: 20 (R5)
; src start address is: 16 (R4)
SEH	R2, R5
ADDU	R3, R26, R2
SEH	R2, R5
ADDU	R2, R4, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Globals.c,476 :: 		for(k = 0; k < LINE_BUFFER_SIZE-1; k++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Globals.c,480 :: 		}
; src end address is: 16 (R4)
; k end address is: 20 (R5)
J	L_settings_read_startup_line53
NOP	
L__settings_read_startup_line144:
;Globals.c,476 :: 		for(k = 0; k < LINE_BUFFER_SIZE-1; k++){
SEH	R3, R5
;Globals.c,480 :: 		}
L_settings_read_startup_line54:
;Globals.c,481 :: 		line[k] = 0;
; k start address is: 12 (R3)
SEH	R2, R3
; k end address is: 12 (R3)
ADDU	R2, R26, R2
SB	R0, 0(R2)
;Globals.c,489 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,490 :: 		}
L_end_settings_read_startup_line:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _settings_read_startup_line
_settings_store_startup_line:
;Globals.c,499 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,504 :: 		str_len = strlen(line);
SW	R27, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 8(SP)
; str_len start address is: 24 (R6)
SEH	R6, R2
;Globals.c,513 :: 		switch(n){
J	L_settings_store_startup_line60
NOP	
;Globals.c,514 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line62:
; start_offset start address is: 8 (R2)
ORI	R2, R0, 384
MOVZ	R7, R2, R0
; start_offset end address is: 8 (R2)
J	L_settings_store_startup_line61
NOP	
;Globals.c,515 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line63:
; start_offset start address is: 8 (R2)
ORI	R2, R0, 400
MOVZ	R7, R2, R0
; str_len end address is: 24 (R6)
; start_offset end address is: 8 (R2)
J	L_settings_store_startup_line61
NOP	
;Globals.c,516 :: 		default: return STATUS_INVALID_STATEMENT;
L_settings_store_startup_line64:
ORI	R2, R0, 6
J	L_end_settings_store_startup_line
NOP	
;Globals.c,517 :: 		}
L_settings_store_startup_line60:
; str_len start address is: 24 (R6)
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line200
NOP	
J	L_settings_store_startup_line62
NOP	
L__settings_store_startup_line200:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line202
NOP	
J	L_settings_store_startup_line63
NOP	
L__settings_store_startup_line202:
; str_len end address is: 24 (R6)
J	L_settings_store_startup_line64
NOP	
L_settings_store_startup_line61:
;Globals.c,519 :: 		settings_load_row();
; start_offset start address is: 28 (R7)
; str_len start address is: 24 (R6)
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,522 :: 		for(i=start_offset;i<start_offset+16;i++)
SW	R7, Offset(_i+0)(GP)
; str_len end address is: 24 (R6)
; start_offset end address is: 28 (R7)
SEH	R5, R6
MOVZ	R4, R7, R0
L_settings_store_startup_line65:
; start_offset start address is: 16 (R4)
; str_len start address is: 20 (R5)
ADDIU	R3, R4, 16
LW	R2, Offset(_i+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__settings_store_startup_line203
NOP	
J	L_settings_store_startup_line66
NOP	
L__settings_store_startup_line203:
;Globals.c,523 :: 		buffA[i] = 0;
LW	R2, Offset(_i+0)(GP)
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,522 :: 		for(i=start_offset;i<start_offset+16;i++)
LW	R2, Offset(_i+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_i+0)(GP)
;Globals.c,523 :: 		buffA[i] = 0;
J	L_settings_store_startup_line65
NOP	
L_settings_store_startup_line66:
;Globals.c,527 :: 		memcpy(buffA+start_offset,line,str_len);
SLL	R3, R4, 2
; start_offset end address is: 16 (R4)
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SH	R25, 8(SP)
; str_len end address is: 20 (R5)
SEH	R27, R5
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R25, 8(SP)
;Globals.c,537 :: 		return settings_save_row();
SW	R26, 8(SP)
SH	R25, 12(SP)
JAL	Globals_settings_save_row+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
;Globals.c,538 :: 		}
;Globals.c,537 :: 		return settings_save_row();
;Globals.c,538 :: 		}
L_end_settings_store_startup_line:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,547 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,548 :: 		int val_temp = 0;
;Globals.c,550 :: 		settings_load_row();
JAL	Globals_settings_load_row+0
NOP	
;Globals.c,560 :: 		switch(parameter) {
J	L_settings_store_global_setting68
NOP	
;Globals.c,561 :: 		case 0: case 1: case 2: //$100..$102 steps per revolution for X, Y, Z
L_settings_store_global_setting70:
L_settings_store_global_setting71:
L_settings_store_global_setting72:
;Globals.c,562 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting205
NOP	
J	L_settings_store_global_setting73
NOP	
L__settings_store_global_setting205:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting73:
;Globals.c,563 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
SWC1	S12, 0(R2)
;Globals.c,564 :: 		buffA[SPMMX_OFFSET+parameter] = flt2ulong(value);
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R2, 4(SP)
JAL	_flt2ulong+0
NOP	
LW	R3, 4(SP)
SW	R2, 0(R3)
;Globals.c,566 :: 		set_calculation_constants();
JAL	_set_calculation_constants+0
NOP	
;Globals.c,577 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,578 :: 		case 3:
L_settings_store_global_setting74:
;Globals.c,579 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting206
NOP	
J	L_settings_store_global_setting75
NOP	
L__settings_store_global_setting206:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting75:
;Globals.c,580 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,581 :: 		settings.p_usec = val_temp;
SH	R2, Offset(_settings+60)(GP)
;Globals.c,582 :: 		buffA[P_USEC_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612456)(GP)
;Globals.c,583 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,584 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting76:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,585 :: 		buffA[D_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612448)(GP)
;Globals.c,586 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,587 :: 		case 6: //$2 step port invert mask, bits X..A
L_settings_store_global_setting77:
;Globals.c,588 :: 		settings.invert_mask = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+66)(GP)
;Globals.c,589 :: 		buffA[INVERT_MASK_OFFSET] = (unsigned long)floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(-1610612384)(GP)
;Globals.c,590 :: 		Stepper_ApplyInvertMasks();
JAL	_Stepper_ApplyInvertMasks+0
NOP	
;Globals.c,591 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,592 :: 		case 7:
L_settings_store_global_setting78:
;Globals.c,593 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,594 :: 		settings.stepper_idle_lock_time = val_temp;
SH	R2, Offset(_settings+56)(GP)
;Globals.c,595 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,596 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,597 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting79:
;Globals.c,598 :: 		settings.acceleration = value*sec_sec ;
LUI	R2, 17761
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S12, S0
SWC1	S0, Offset(_settings+40)(GP)
;Globals.c,599 :: 		buffA[ACCELERATION_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612428)(GP)
;Globals.c,600 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,601 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting80:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,602 :: 		buffA[JUNCTION_DEV_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612424)(GP)
;Globals.c,603 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,604 :: 		case 10:
L_settings_store_global_setting81:
;Globals.c,605 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting207
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting207:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting82:
;Globals.c,606 :: 		settings.mm_per_arc_segment = value;
SWC1	S12, Offset(_settings+36)(GP)
;Globals.c,607 :: 		buffA[MM_ARC_SEG_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612432)(GP)
;Globals.c,608 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,609 :: 		case 13:
L_settings_store_global_setting83:
;Globals.c,610 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting209
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting209:
;Globals.c,611 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+50)(GP)
;Globals.c,612 :: 		}else{
J	L_settings_store_global_setting85
NOP	
L_settings_store_global_setting84:
;Globals.c,613 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,614 :: 		}
L_settings_store_global_setting85:
;Globals.c,615 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,616 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,617 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting86:
;Globals.c,618 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting211
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting211:
;Globals.c,619 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+50)(GP)
;Globals.c,620 :: 		}else{
J	L_settings_store_global_setting88
NOP	
L_settings_store_global_setting87:
;Globals.c,621 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,622 :: 		}
L_settings_store_global_setting88:
;Globals.c,623 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,624 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,625 :: 		case 16:
L_settings_store_global_setting89:
;Globals.c,626 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting213
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting213:
;Globals.c,627 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+50)(GP)
;Globals.c,628 :: 		}else{
J	L_settings_store_global_setting91
NOP	
L_settings_store_global_setting90:
;Globals.c,629 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,630 :: 		}
L_settings_store_global_setting91:
;Globals.c,631 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,633 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,634 :: 		case 17:
L_settings_store_global_setting92:
;Globals.c,635 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting215
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting215:
;Globals.c,636 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+50)(GP)
;Globals.c,637 :: 		}else{
J	L_settings_store_global_setting94
NOP	
L_settings_store_global_setting93:
;Globals.c,638 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,639 :: 		}
L_settings_store_global_setting94:
;Globals.c,640 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,641 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,642 :: 		case 18:
L_settings_store_global_setting95:
;Globals.c,643 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,644 :: 		settings.homing_dir_mask = val_temp;
SH	R2, Offset(_settings+64)(GP)
;Globals.c,645 :: 		buffA[HOME_DIR_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612388)(GP)
;Globals.c,646 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,647 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting96:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,648 :: 		buffA[H_FEED_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612444)(GP)
;Globals.c,649 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,650 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting97:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,651 :: 		buffA[H_SEEK_RATE_OFFSET] = flt2ulong(value);
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612440)(GP)
;Globals.c,652 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,653 :: 		case 21:
L_settings_store_global_setting98:
;Globals.c,654 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,655 :: 		settings.homing_debounce_delay = val_temp;
SH	R2, Offset(_settings+54)(GP)
;Globals.c,656 :: 		buffA[H_DEBNC_DLY_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,657 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,658 :: 		case 22:
L_settings_store_global_setting99:
;Globals.c,659 :: 		settings.homing_pulloff = fabs(value);
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+32)(GP)
;Globals.c,660 :: 		buffA[H_PULL_OFF_OFFSET] = flt2ulong(fabs(value));
JAL	_fabs+0
NOP	
MOV.S 	S12, S0
JAL	_flt2ulong+0
NOP	
SW	R2, Offset(-1610612436)(GP)
;Globals.c,661 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,662 :: 		case 23: //$3 direction port invert mask, bits X..A
L_settings_store_global_setting100:
;Globals.c,663 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,664 :: 		settings.dir_invert_mask = val_temp;
SH	R2, Offset(_settings+68)(GP)
;Globals.c,665 :: 		buffA[DIR_INVERT_MASK_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612380)(GP)
;Globals.c,666 :: 		Stepper_ApplyInvertMasks();
JAL	_Stepper_ApplyInvertMasks+0
NOP	
;Globals.c,667 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,668 :: 		case 24: //$5 invert the limit pins (active high switches)
L_settings_store_global_setting101:
;Globals.c,669 :: 		if (round(value)){
JAL	_round+0
NOP	
BNE	R2, R0, L__settings_store_global_setting217
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting217:
;Globals.c,670 :: 		settings.flags |= BITFLAG_INVERT_LIMIT_PINS;
LHU	R2, Offset(_settings+50)(GP)
ORI	R2, R2, 32
SH	R2, Offset(_settings+50)(GP)
;Globals.c,671 :: 		}else{
J	L_settings_store_global_setting103
NOP	
L_settings_store_global_setting102:
;Globals.c,672 :: 		settings.flags &= ~BITFLAG_INVERT_LIMIT_PINS;
LHU	R3, Offset(_settings+50)(GP)
ORI	R2, R0, 65503
AND	R2, R3, R2
SH	R2, Offset(_settings+50)(GP)
;Globals.c,673 :: 		}
L_settings_store_global_setting103:
;Globals.c,674 :: 		buffA[FLAGS_OFFSET] = (unsigned long)settings.flags;
LHU	R2, Offset(_settings+50)(GP)
SW	R2, Offset(-1610612416)(GP)
;Globals.c,675 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,676 :: 		case 25: //  s_curve_percentage
L_settings_store_global_setting104:
;Globals.c,677 :: 		val_temp = round(value);
JAL	_round+0
NOP	
;Globals.c,678 :: 		settings.s_curve_percentage = val_temp;
SH	R2, Offset(_settings+74)(GP)
;Globals.c,679 :: 		buffA[S_CURVE_PERCENTAGE_OFFSET] = (unsigned long)val_temp;
SEH	R2, R2
SW	R2, Offset(-1610612376)(GP)
;Globals.c,680 :: 		break;
J	L_settings_store_global_setting69
NOP	
;Globals.c,681 :: 		default:
L_settings_store_global_setting105:
;Globals.c,682 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,683 :: 		}
L_settings_store_global_setting68:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting219
NOP	
J	L_settings_store_global_setting70
NOP	
L__settings_store_global_setting219:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting221
NOP	
J	L_settings_store_global_setting71
NOP	
L__settings_store_global_setting221:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting223
NOP	
J	L_settings_store_global_setting72
NOP	
L__settings_store_global_setting223:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting225
NOP	
J	L_settings_store_global_setting74
NOP	
L__settings_store_global_setting225:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting227
NOP	
J	L_settings_store_global_setting76
NOP	
L__settings_store_global_setting227:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting229
NOP	
J	L_settings_store_global_setting77
NOP	
L__settings_store_global_setting229:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting231
NOP	
J	L_settings_store_global_setting78
NOP	
L__settings_store_global_setting231:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting233
NOP	
J	L_settings_store_global_setting79
NOP	
L__settings_store_global_setting233:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting235
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting235:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting237
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting237:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting239
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting239:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting241
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting241:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting243
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting243:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting245
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting245:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting247
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting247:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting249
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting249:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting251
NOP	
J	L_settings_store_global_setting97
NOP	
L__settings_store_global_setting251:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting253
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting253:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting255
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting255:
SEH	R3, R25
ORI	R2, R0, 23
BNE	R3, R2, L__settings_store_global_setting257
NOP	
J	L_settings_store_global_setting100
NOP	
L__settings_store_global_setting257:
SEH	R3, R25
ORI	R2, R0, 24
BNE	R3, R2, L__settings_store_global_setting259
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting259:
SEH	R3, R25
ORI	R2, R0, 25
BNE	R3, R2, L__settings_store_global_setting261
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting261:
J	L_settings_store_global_setting105
NOP	
L_settings_store_global_setting69:
;Globals.c,684 :: 		if(settings_save_row()){ return(STATUS_SETTING_READ_FAIL); }
JAL	Globals_settings_save_row+0
NOP	
BNE	R2, R0, L__settings_store_global_setting263
NOP	
J	L_settings_store_global_setting106
NOP	
L__settings_store_global_setting263:
ORI	R2, R0, 10
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting106:
;Globals.c,685 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,686 :: 		}
L_end_settings_store_global_setting:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_store_global_setting
_settings_store_grbl_setting:
;Globals.c,698 :: 		int settings_store_grbl_setting(int parameter, float value) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,700 :: 		switch(parameter) {
SW	R25, 4(SP)
J	L_settings_store_grbl_setting107
NOP	
;Globals.c,701 :: 		case 0:   internal = 3;  break; // step pulse usec
L_settings_store_grbl_setting109:
; internal start address is: 8 (R2)
ORI	R2, R0, 3
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,702 :: 		case 1:   internal = 7;  break; // step idle delay
L_settings_store_grbl_setting110:
; internal start address is: 8 (R2)
ORI	R2, R0, 7
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,703 :: 		case 2:   internal = 6;  break; // step port invert mask
L_settings_store_grbl_setting111:
; internal start address is: 8 (R2)
ORI	R2, R0, 6
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,704 :: 		case 3:   internal = 23; break; // direction port invert mask
L_settings_store_grbl_setting112:
; internal start address is: 8 (R2)
ORI	R2, R0, 23
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,705 :: 		case 4:   internal = 15; break; // step enable invert
L_settings_store_grbl_setting113:
; internal start address is: 8 (R2)
ORI	R2, R0, 15
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,706 :: 		case 5:   internal = 24; break; // limit pins invert
L_settings_store_grbl_setting114:
; internal start address is: 8 (R2)
ORI	R2, R0, 24
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,707 :: 		case 11:  internal = 9;  break; // junction deviation
L_settings_store_grbl_setting115:
; internal start address is: 8 (R2)
ORI	R2, R0, 9
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,708 :: 		case 12:  internal = 10; break; // arc tolerance (mm per arc segment)
L_settings_store_grbl_setting116:
; internal start address is: 8 (R2)
ORI	R2, R0, 10
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,709 :: 		case 13:  internal = 13; break; // report inches
L_settings_store_grbl_setting117:
; internal start address is: 8 (R2)
ORI	R2, R0, 13
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,710 :: 		case 14:  internal = 25; break; // s_curve_percentage
L_settings_store_grbl_setting118:
; internal start address is: 8 (R2)
ORI	R2, R0, 25
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,711 :: 		case 21:  internal = 16; break; // hard limits
L_settings_store_grbl_setting119:
; internal start address is: 8 (R2)
ORI	R2, R0, 16
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,712 :: 		case 22:  internal = 17; break; // homing enable
L_settings_store_grbl_setting120:
; internal start address is: 8 (R2)
ORI	R2, R0, 17
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,713 :: 		case 23:  internal = 18; break; // homing dir mask
L_settings_store_grbl_setting121:
; internal start address is: 8 (R2)
ORI	R2, R0, 18
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,714 :: 		case 24:  internal = 19; break; // homing feed
L_settings_store_grbl_setting122:
; internal start address is: 8 (R2)
ORI	R2, R0, 19
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,715 :: 		case 25:  internal = 20; break; // homing seek
L_settings_store_grbl_setting123:
; internal start address is: 8 (R2)
ORI	R2, R0, 20
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,716 :: 		case 26:  internal = 21; break; // homing debounce
L_settings_store_grbl_setting124:
; internal start address is: 8 (R2)
ORI	R2, R0, 21
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,717 :: 		case 27:  internal = 22; break; // homing pull-off
L_settings_store_grbl_setting125:
; internal start address is: 8 (R2)
ORI	R2, R0, 22
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,718 :: 		case 100: case 101: case 102: internal = parameter - 100; break; // steps/mm
L_settings_store_grbl_setting126:
L_settings_store_grbl_setting127:
L_settings_store_grbl_setting128:
ADDIU	R2, R25, -100
; internal start address is: 8 (R2)
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,719 :: 		case 110: case 111: case 112: internal = 5;  break; // shared max rate
L_settings_store_grbl_setting129:
L_settings_store_grbl_setting130:
L_settings_store_grbl_setting131:
; internal start address is: 8 (R2)
ORI	R2, R0, 5
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,720 :: 		case 120: case 121: case 122: internal = 8;  break; // shared acceleration
L_settings_store_grbl_setting132:
L_settings_store_grbl_setting133:
L_settings_store_grbl_setting134:
; internal start address is: 8 (R2)
ORI	R2, R0, 8
; internal end address is: 8 (R2)
J	L_settings_store_grbl_setting108
NOP	
;Globals.c,721 :: 		default:  return(STATUS_INVALID_STATEMENT);
L_settings_store_grbl_setting135:
ORI	R2, R0, 6
J	L_end_settings_store_grbl_setting
NOP	
;Globals.c,722 :: 		}
L_settings_store_grbl_setting107:
SEH	R2, R25
BNE	R2, R0, L__settings_store_grbl_setting266
NOP	
J	L_settings_store_grbl_setting109
NOP	
L__settings_store_grbl_setting266:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_grbl_setting268
NOP	
J	L_settings_store_grbl_setting110
NOP	
L__settings_store_grbl_setting268:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_grbl_setting270
NOP	
J	L_settings_store_grbl_setting111
NOP	
L__settings_store_grbl_setting270:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_grbl_setting272
NOP	
J	L_settings_store_grbl_setting112
NOP	
L__settings_store_grbl_setting272:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_grbl_setting274
NOP	
J	L_settings_store_grbl_setting113
NOP	
L__settings_store_grbl_setting274:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_grbl_setting276
NOP	
J	L_settings_store_grbl_setting114
NOP	
L__settings_store_grbl_setting276:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_grbl_setting278
NOP	
J	L_settings_store_grbl_setting115
NOP	
L__settings_store_grbl_setting278:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_grbl_setting280
NOP	
J	L_settings_store_grbl_setting116
NOP	
L__settings_store_grbl_setting280:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_grbl_setting282
NOP	
J	L_settings_store_grbl_setting117
NOP	
L__settings_store_grbl_setting282:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_grbl_setting284
NOP	
J	L_settings_store_grbl_setting118
NOP	
L__settings_store_grbl_setting284:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_grbl_setting286
NOP	
J	L_settings_store_grbl_setting119
NOP	
L__settings_store_grbl_setting286:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_grbl_setting288
NOP	
J	L_settings_store_grbl_setting120
NOP	
L__settings_store_grbl_setting288:
SEH	R3, R25
ORI	R2, R0, 23
BNE	R3, R2, L__settings_store_grbl_setting290
NOP	
J	L_settings_store_grbl_setting121
NOP	
L__settings_store_grbl_setting290:
SEH	R3, R25
ORI	R2, R0, 24
BNE	R3, R2, L__settings_store_grbl_setting292
NOP	
J	L_settings_store_grbl_setting122
NOP	
L__settings_store_grbl_setting292:
SEH	R3, R25
ORI	R2, R0, 25
BNE	R3, R2, L__settings_store_grbl_setting294
NOP	
J	L_settings_store_grbl_setting123
NOP	
L__settings_store_grbl_setting294:
SEH	R3, R25
ORI	R2, R0, 26
BNE	R3, R2, L__settings_store_grbl_setting296
NOP	
J	L_settings_store_grbl_setting124
NOP	
L__settings_store_grbl_setting296:
SEH	R3, R25
ORI	R2, R0, 27
BNE	R3, R2, L__settings_store_grbl_setting298
NOP	
J	L_settings_store_grbl_setting125
NOP	
L__settings_store_grbl_setting298:
SEH	R3, R25
ORI	R2, R0, 100
BNE	R3, R2, L__settings_store_grbl_setting300
NOP	
J	L_settings_store_grbl_setting126
NOP	
L__settings_store_grbl_setting300:
SEH	R3, R25
ORI	R2, R0, 101
BNE	R3, R2, L__settings_store_grbl_setting302
NOP	
J	L_settings_store_grbl_setting127
NOP	
L__settings_store_grbl_setting302:
SEH	R3, R25
ORI	R2, R0, 102
BNE	R3, R2, L__settings_store_grbl_setting304
NOP	
J	L_settings_store_grbl_setting128
NOP	
L__settings_store_grbl_setting304:
SEH	R3, R25
ORI	R2, R0, 110
BNE	R3, R2, L__settings_store_grbl_setting306
NOP	
J	L_settings_store_grbl_setting129
NOP	
L__settings_store_grbl_setting306:
SEH	R3, R25
ORI	R2, R0, 111
BNE	R3, R2, L__settings_store_grbl_setting308
NOP	
J	L_settings_store_grbl_setting130
NOP	
L__settings_store_grbl_setting308:
SEH	R3, R25
ORI	R2, R0, 112
BNE	R3, R2, L__settings_store_grbl_setting310
NOP	
J	L_settings_store_grbl_setting131
NOP	
L__settings_store_grbl_setting310:
SEH	R3, R25
ORI	R2, R0, 120
BNE	R3, R2, L__settings_store_grbl_setting312
NOP	
J	L_settings_store_grbl_setting132
NOP	
L__settings_store_grbl_setting312:
SEH	R3, R25
ORI	R2, R0, 121
BNE	R3, R2, L__settings_store_grbl_setting314
NOP	
J	L_settings_store_grbl_setting133
NOP	
L__settings_store_grbl_setting314:
SEH	R3, R25
ORI	R2, R0, 122
BNE	R3, R2, L__settings_store_grbl_setting316
NOP	
J	L_settings_store_grbl_setting134
NOP	
L__settings_store_grbl_setting316:
J	L_settings_store_grbl_setting135
NOP	
L_settings_store_grbl_setting108:
;Globals.c,723 :: 		return settings_store_global_setting(internal, value);
; internal start address is: 8 (R2)
SEH	R25, R2
; internal end address is: 8 (R2)
JAL	_settings_store_global_setting+0
NOP	
;Globals.c,724 :: 		}
;Globals.c,723 :: 		return settings_store_global_setting(internal, value);
;Globals.c,724 :: 		}
L_end_settings_store_grbl_setting:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _settings_store_grbl_setting
