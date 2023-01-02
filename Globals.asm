_Settings_Init:
;Globals.c,9 :: 		void Settings_Init(char reset_all){
;Globals.c,10 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init20
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init20:
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
;Globals.c,58 :: 		int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Globals.c,59 :: 		int res=0;
;Globals.c,60 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 20
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,62 :: 		switch(coord_select){
J	L_Settings_Write_Coord_Data1
NOP	
;Globals.c,63 :: 		case 0:break;
L_Settings_Write_Coord_Data3:
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,64 :: 		case 1: add = FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data4:
LUI	R2, 48408
ORI	R2, R2, 27136
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,65 :: 		case 2: add = FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data5:
LUI	R2, 48408
ORI	R2, R2, 27152
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,66 :: 		case 3: add = FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data6:
LUI	R2, 48408
ORI	R2, R2, 27168
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,67 :: 		case 4: add = FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data7:
LUI	R2, 48408
ORI	R2, R2, 27184
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,68 :: 		case 5: add = FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data8:
LUI	R2, 48408
ORI	R2, R2, 27200
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,69 :: 		case 6: add = FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data9:
LUI	R2, 48408
ORI	R2, R2, 27216
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,70 :: 		case 7: add = FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data10:
LUI	R2, 48408
ORI	R2, R2, 27232
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,71 :: 		case 8: add = FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data11:
LUI	R2, 48408
ORI	R2, R2, 27248
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,72 :: 		case 9: add = FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data12:
LUI	R2, 48408
ORI	R2, R2, 27264
SW	R2, 16(SP)
J	L_Settings_Write_Coord_Data2
NOP	
;Globals.c,73 :: 		}
L_Settings_Write_Coord_Data1:
SEH	R2, R25
BNE	R2, R0, L__Settings_Write_Coord_Data23
NOP	
J	L_Settings_Write_Coord_Data3
NOP	
L__Settings_Write_Coord_Data23:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data25
NOP	
J	L_Settings_Write_Coord_Data4
NOP	
L__Settings_Write_Coord_Data25:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data27
NOP	
J	L_Settings_Write_Coord_Data5
NOP	
L__Settings_Write_Coord_Data27:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data29
NOP	
J	L_Settings_Write_Coord_Data6
NOP	
L__Settings_Write_Coord_Data29:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data31
NOP	
J	L_Settings_Write_Coord_Data7
NOP	
L__Settings_Write_Coord_Data31:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data33
NOP	
J	L_Settings_Write_Coord_Data8
NOP	
L__Settings_Write_Coord_Data33:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data35
NOP	
J	L_Settings_Write_Coord_Data9
NOP	
L__Settings_Write_Coord_Data35:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data37
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data37:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data39
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data39:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data41
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data41:
L_Settings_Write_Coord_Data2:
;Globals.c,79 :: 		for (i=0;i<3;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Settings_Write_Coord_Data13:
; i start address is: 16 (R4)
SLTIU	R2, R4, 3
BNE	R2, R0, L__Settings_Write_Coord_Data42
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data42:
;Globals.c,80 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 20
SLL	R3, R4, 2
ADDU	R2, R2, R3
SW	R2, 36(SP)
ADDU	R2, R26, R3
SW	R4, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
LWC1	S12, 0(R2)
JAL	_flt2ulong+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
LW	R4, 4(SP)
LW	R3, 36(SP)
SW	R2, 0(R3)
;Globals.c,79 :: 		for (i=0;i<3;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,87 :: 		}
; i end address is: 16 (R4)
J	L_Settings_Write_Coord_Data13
NOP	
L_Settings_Write_Coord_Data14:
;Globals.c,88 :: 		res = NVMWriteQuad(&add,wdata);
ADDIU	R3, SP, 20
ADDIU	R2, SP, 16
SW	R26, 4(SP)
SH	R25, 8(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_NVMWriteQuad+0
NOP	
LH	R25, 8(SP)
LW	R26, 4(SP)
; res start address is: 12 (R3)
ANDI	R3, R2, 65535
;Globals.c,91 :: 		add = FLASH_Settings_VAddr_P1;
LUI	R2, 48408
ORI	R2, R2, 27136
SW	R2, 16(SP)
;Globals.c,92 :: 		Delay_us(100);
LUI	R24, 0
ORI	R24, R24, 6666
L_Settings_Write_Coord_Data16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Settings_Write_Coord_Data16
NOP	
;Globals.c,93 :: 		NVMReadRow(add);
SH	R3, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
LW	R25, 16(SP)
JAL	_NVMReadRow+0
NOP	
LH	R25, 12(SP)
LW	R26, 8(SP)
LH	R3, 4(SP)
;Globals.c,96 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,97 :: 		}
L_end_Settings_Write_Coord_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
