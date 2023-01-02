_Settings_Init:
;Globals.c,9 :: 		void Settings_Init(char reset_all){
;Globals.c,10 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init8
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init8:
;Globals.c,11 :: 		settings.steps_per_mm[_X] = DEFAULT_X_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,12 :: 		settings.steps_per_mm[_Y] = DEFAULT_Y_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,13 :: 		settings.steps_per_mm[_Z] = DEFAULT_Z_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,14 :: 		settings.steps_per_mm[_A] = DEFAULT_A_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+16)(GP)
;Globals.c,15 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,16 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,17 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,18 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+52)(GP)
;Globals.c,19 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+56)(GP)
;Globals.c,20 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,21 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+40)(GP)
;Globals.c,22 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+60)(GP)
;Globals.c,23 :: 		settings.homing_pulloff        = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+44)(GP)
;Globals.c,24 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SB	R2, Offset(_settings+64)(GP)
;Globals.c,25 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SB	R2, Offset(_settings+65)(GP)
;Globals.c,26 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SB	R2, Offset(_settings+66)(GP)
;Globals.c,27 :: 		}
L_Settings_Init0:
;Globals.c,28 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Settings_Write_Coord_Data:
;Globals.c,58 :: 		int Settings_Write_Coord_Data(unsigned long  addr,int coord_select,float *coord){
ADDIU	SP, SP, -2072
SW	RA, 0(SP)
;Globals.c,59 :: 		int res=0;
; res start address is: 12 (R3)
MOVZ	R3, R0, R0
;Globals.c,60 :: 		unsigned long wdata[512]={0};
ADDIU	R23, SP, 20
ADDIU	R22, R23, 2048
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,67 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; res end address is: 12 (R3)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data1:
; i start address is: 20 (R5)
; res start address is: 12 (R3)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data10
NOP	
J	L__Settings_Write_Coord_Data5
NOP	
L__Settings_Write_Coord_Data10:
; res end address is: 12 (R3)
;Globals.c,68 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 20
SLL	R3, R5, 2
ADDU	R2, R2, R3
SW	R2, 2068(SP)
ADDU	R2, R27, R3
SW	R5, 4(SP)
SW	R27, 8(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
LW	R5, 4(SP)
LW	R3, 2068(SP)
SW	R2, 0(R3)
;Globals.c,73 :: 		res = NVMWriteWord(addr+i*4,wdata[i]);
ADDIU	R2, SP, 20
SLL	R4, R5, 2
ADDU	R2, R2, R4
LW	R3, 0(R2)
ADDU	R2, R25, R4
SW	R5, 4(SP)
SW	R27, 8(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_NVMWriteWord+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
LW	R27, 8(SP)
LW	R5, 4(SP)
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,74 :: 		if(res)break;
BNE	R2, R0, L__Settings_Write_Coord_Data12
NOP	
J	L_Settings_Write_Coord_Data4
NOP	
L__Settings_Write_Coord_Data12:
; i end address is: 20 (R5)
SEH	R2, R3
J	L_Settings_Write_Coord_Data2
NOP	
L_Settings_Write_Coord_Data4:
;Globals.c,67 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,75 :: 		}
; res end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data1
NOP	
L__Settings_Write_Coord_Data5:
;Globals.c,67 :: 		for (i=0;i<3;i++){
SEH	R2, R3
;Globals.c,75 :: 		}
L_Settings_Write_Coord_Data2:
;Globals.c,77 :: 		return res;
; res start address is: 8 (R2)
; res end address is: 8 (R2)
;Globals.c,78 :: 		}
L_end_Settings_Write_Coord_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 2072
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
