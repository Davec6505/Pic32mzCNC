_Settings_Init:
;Globals.c,8 :: 		void Settings_Init(char reset_all){
;Globals.c,9 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init6
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init6:
;Globals.c,10 :: 		settings.steps_per_mm[_X] = DEFAULT_X_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+4)(GP)
;Globals.c,11 :: 		settings.steps_per_mm[_Y] = DEFAULT_Y_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+8)(GP)
;Globals.c,12 :: 		settings.steps_per_mm[_Z] = DEFAULT_Z_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+12)(GP)
;Globals.c,13 :: 		settings.steps_per_mm[_A] = DEFAULT_A_STEPS_PER_MM;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+16)(GP)
;Globals.c,14 :: 		settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
LUI	R2, 16204
ORI	R2, R2, 52429
SW	R2, Offset(_settings+48)(GP)
;Globals.c,15 :: 		settings.default_feed_rate  = DEFAULT_FEEDRATE;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+28)(GP)
;Globals.c,16 :: 		settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
LUI	R2, 17402
ORI	R2, R2, 0
SW	R2, Offset(_settings+32)(GP)
;Globals.c,17 :: 		settings.acceleration       = DEFAULT_ACCELERATION;
LUI	R2, 18188
ORI	R2, R2, 40960
SW	R2, Offset(_settings+52)(GP)
;Globals.c,18 :: 		settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
LUI	R2, 15692
ORI	R2, R2, 52429
SW	R2, Offset(_settings+56)(GP)
;Globals.c,19 :: 		settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
LUI	R2, 16840
ORI	R2, R2, 0
SW	R2, Offset(_settings+36)(GP)
;Globals.c,20 :: 		settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
LUI	R2, 17274
ORI	R2, R2, 0
SW	R2, Offset(_settings+40)(GP)
;Globals.c,21 :: 		settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
ORI	R2, R0, 100
SH	R2, Offset(_settings+60)(GP)
;Globals.c,22 :: 		settings.homing_pulloff        = DEFAULT_HOMING_PULLOFF;
LUI	R2, 16256
ORI	R2, R2, 0
SW	R2, Offset(_settings+44)(GP)
;Globals.c,23 :: 		settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
ORI	R2, R0, 25
SB	R2, Offset(_settings+64)(GP)
;Globals.c,24 :: 		settings.decimal_places = DEFAULT_DECIMAL_PLACES;
ORI	R2, R0, 3
SB	R2, Offset(_settings+65)(GP)
;Globals.c,25 :: 		settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;
ORI	R2, R0, 25
SB	R2, Offset(_settings+66)(GP)
;Globals.c,26 :: 		}
L_Settings_Init0:
;Globals.c,27 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
_Settings_Write_Coord_Data:
;Globals.c,57 :: 		int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,58 :: 		int i,res=0;
; res start address is: 12 (R3)
MOVZ	R3, R0, R0
;Globals.c,59 :: 		unsigned long addr = FLASH_Settings_PAddr;
; addr start address is: 20 (R5)
LUI	R5, 7431
ORI	R5, R5, 40950
;Globals.c,61 :: 		for (i=0;i<sizeof(coord);i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; res end address is: 12 (R3)
; i end address is: 24 (R6)
L_Settings_Write_Coord_Data1:
; i start address is: 24 (R6)
; addr start address is: 20 (R5)
; addr end address is: 20 (R5)
; res start address is: 12 (R3)
SEH	R2, R6
SLTI	R2, R2, 4
BNE	R2, R0, L__Settings_Write_Coord_Data8
NOP	
J	L_Settings_Write_Coord_Data2
NOP	
L__Settings_Write_Coord_Data8:
; addr end address is: 20 (R5)
; res end address is: 12 (R3)
;Globals.c,62 :: 		res = NVMWriteWord(addr*coord_select*i,coord[i]);
; addr start address is: 20 (R5)
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R25
MULTU	R5, R2
MFLO	R3
SEH	R2, R6
MULTU	R3, R2
MFLO	R2
SW	R5, 4(SP)
SH	R6, 8(SP)
SW	R26, 12(SP)
SH	R25, 16(SP)
MOVZ	R26, R4, R0
MOVZ	R25, R2, R0
JAL	_NVMWriteWord+0
NOP	
LH	R25, 16(SP)
LW	R26, 12(SP)
LH	R6, 8(SP)
LW	R5, 4(SP)
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,61 :: 		for (i=0;i<sizeof(coord);i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Globals.c,63 :: 		}
; addr end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Settings_Write_Coord_Data1
NOP	
L_Settings_Write_Coord_Data2:
;Globals.c,65 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,66 :: 		}
L_end_Settings_Write_Coord_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
