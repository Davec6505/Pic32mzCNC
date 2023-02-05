_Settings_Init:
;Globals.c,11 :: 		void Settings_Init(short reset_all){
;Globals.c,12 :: 		if(!reset_all){
BEQ	R25, R0, L__Settings_Init115
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init115:
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
BEQ	R3, R2, L__Settings_Init116
NOP	
J	L_Settings_Init2
NOP	
L__Settings_Init116:
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
;Globals.c,38 :: 		}
L_Settings_Init2:
L_Settings_Init1:
;Globals.c,39 :: 		}
L_end_Settings_Init:
JR	RA
NOP	
; end of _Settings_Init
Globals_Save_Row_From_Flash:
;Globals.c,49 :: 		static int Save_Row_From_Flash(unsigned long addr){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Globals.c,54 :: 		ptr = addr;
; ptr start address is: 20 (R5)
MOVZ	R5, R25, R0
;Globals.c,55 :: 		data_count = 0;
; data_count start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,56 :: 		for(j = 0;j < 512;j++){
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; data_count end address is: 28 (R7)
; j end address is: 24 (R6)
L_Globals_Save_Row_From_Flash3:
; j start address is: 24 (R6)
; data_count start address is: 28 (R7)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
SLTIU	R2, R6, 512
BNE	R2, R0, L_Globals_Save_Row_From_Flash118
NOP	
J	L_Globals_Save_Row_From_Flash4
NOP	
L_Globals_Save_Row_From_Flash118:
; ptr end address is: 20 (R5)
;Globals.c,57 :: 		buffA[j] = *(ptr+j);
; ptr start address is: 20 (R5)
SLL	R4, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R4
ADDU	R2, R5, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Globals.c,58 :: 		if(buffA[j] != -1)data_count++;
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R3, 0(R2)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L_Globals_Save_Row_From_Flash120
NOP	
J	L_Globals_Save_Row_From_Flash113
NOP	
L_Globals_Save_Row_From_Flash120:
ADDIU	R2, R7, 1
SEH	R7, R2
; data_count end address is: 28 (R7)
J	L_Globals_Save_Row_From_Flash6
NOP	
L_Globals_Save_Row_From_Flash113:
L_Globals_Save_Row_From_Flash6:
;Globals.c,56 :: 		for(j = 0;j < 512;j++){
; data_count start address is: 28 (R7)
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,63 :: 		}
; ptr end address is: 20 (R5)
; j end address is: 24 (R6)
J	L_Globals_Save_Row_From_Flash3
NOP	
L_Globals_Save_Row_From_Flash4:
;Globals.c,67 :: 		set_ram_loaded_indicator(data_count);
SW	R25, 4(SP)
SEH	R25, R7
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LW	R25, 4(SP)
;Globals.c,70 :: 		return data_count;
SEH	R2, R7
; data_count end address is: 28 (R7)
;Globals.c,71 :: 		}
L_end_Save_Row_From_Flash:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Globals_Save_Row_From_Flash
Globals_set_ram_loaded_indicator:
;Globals.c,79 :: 		static int set_ram_loaded_indicator(int val){
;Globals.c,80 :: 		ram_loaded = val;
SH	R25, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,81 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,82 :: 		}
L_end_set_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_set_ram_loaded_indicator
Globals_zero_ram_loaded_indicator:
;Globals.c,85 :: 		static void zero_ram_loaded_indicator(){
;Globals.c,86 :: 		ram_loaded = 0;
SH	R0, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,87 :: 		}
L_end_zero_ram_loaded_indicator:
JR	RA
NOP	
; end of Globals_zero_ram_loaded_indicator
_read_ram_loaded_indicator:
;Globals.c,90 :: 		int read_ram_loaded_indicator(){
;Globals.c,91 :: 		return ram_loaded;
LH	R2, Offset(Globals_ram_loaded+0)(GP)
;Globals.c,92 :: 		}
L_end_read_ram_loaded_indicator:
JR	RA
NOP	
; end of _read_ram_loaded_indicator
_Settings_Write_Coord_Data:
;Globals.c,122 :: 		unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Globals.c,124 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,125 :: 		int res=0,recipe = 0;
;Globals.c,126 :: 		unsigned long wdata[4]={0};
ADDIU	R23, SP, 28
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_wdata_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,129 :: 		unsigned long temp[4] = {0};
;Globals.c,131 :: 		add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,134 :: 		recipe = coord_select;
; recipe start address is: 16 (R4)
SEH	R4, R25
;Globals.c,137 :: 		Save_Row_From_Flash(add);
SH	R4, 8(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	Globals_Save_Row_From_Flash+0
NOP	
;Globals.c,141 :: 		error = (int)NVMErasePage(add);
SW	R26, 12(SP)
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 12(SP)
LH	R4, 8(SP)
; error start address is: 12 (R3)
SEH	R3, R2
;Globals.c,143 :: 		if(error){
BNE	R2, R0, L__Settings_Write_Coord_Data126
NOP	
J	L_Settings_Write_Coord_Data7
NOP	
L__Settings_Write_Coord_Data126:
; recipe end address is: 16 (R4)
;Globals.c,148 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
J	L_end_Settings_Write_Coord_Data
NOP	
;Globals.c,149 :: 		}
L_Settings_Write_Coord_Data7:
;Globals.c,151 :: 		switch(recipe){
; recipe start address is: 16 (R4)
J	L_Settings_Write_Coord_Data8
NOP	
;Globals.c,152 :: 		case 0:break;
L_Settings_Write_Coord_Data10:
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,154 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_Settings_Write_Coord_Data11:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,155 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_Settings_Write_Coord_Data12:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,156 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_Settings_Write_Coord_Data13:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,157 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_Settings_Write_Coord_Data14:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,158 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_Settings_Write_Coord_Data15:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,159 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_Settings_Write_Coord_Data16:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,160 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_Settings_Write_Coord_Data17:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,161 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_Settings_Write_Coord_Data18:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,162 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_Settings_Write_Coord_Data19:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,164 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_Settings_Write_Coord_Data20:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,165 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_Settings_Write_Coord_Data21:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,166 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_Settings_Write_Coord_Data22:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,167 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_Settings_Write_Coord_Data23:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,168 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_Settings_Write_Coord_Data24:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,169 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_Settings_Write_Coord_Data25:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 24(SP)
J	L_Settings_Write_Coord_Data9
NOP	
;Globals.c,170 :: 		}
L_Settings_Write_Coord_Data8:
SEH	R2, R4
BNE	R2, R0, L__Settings_Write_Coord_Data128
NOP	
J	L_Settings_Write_Coord_Data10
NOP	
L__Settings_Write_Coord_Data128:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L__Settings_Write_Coord_Data130
NOP	
J	L_Settings_Write_Coord_Data11
NOP	
L__Settings_Write_Coord_Data130:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__Settings_Write_Coord_Data132
NOP	
J	L_Settings_Write_Coord_Data12
NOP	
L__Settings_Write_Coord_Data132:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L__Settings_Write_Coord_Data134
NOP	
J	L_Settings_Write_Coord_Data13
NOP	
L__Settings_Write_Coord_Data134:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__Settings_Write_Coord_Data136
NOP	
J	L_Settings_Write_Coord_Data14
NOP	
L__Settings_Write_Coord_Data136:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__Settings_Write_Coord_Data138
NOP	
J	L_Settings_Write_Coord_Data15
NOP	
L__Settings_Write_Coord_Data138:
SEH	R3, R4
ORI	R2, R0, 6
BNE	R3, R2, L__Settings_Write_Coord_Data140
NOP	
J	L_Settings_Write_Coord_Data16
NOP	
L__Settings_Write_Coord_Data140:
SEH	R3, R4
ORI	R2, R0, 7
BNE	R3, R2, L__Settings_Write_Coord_Data142
NOP	
J	L_Settings_Write_Coord_Data17
NOP	
L__Settings_Write_Coord_Data142:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__Settings_Write_Coord_Data144
NOP	
J	L_Settings_Write_Coord_Data18
NOP	
L__Settings_Write_Coord_Data144:
SEH	R3, R4
ORI	R2, R0, 9
BNE	R3, R2, L__Settings_Write_Coord_Data146
NOP	
J	L_Settings_Write_Coord_Data19
NOP	
L__Settings_Write_Coord_Data146:
SEH	R3, R4
ORI	R2, R0, 10
BNE	R3, R2, L__Settings_Write_Coord_Data148
NOP	
J	L_Settings_Write_Coord_Data20
NOP	
L__Settings_Write_Coord_Data148:
SEH	R3, R4
ORI	R2, R0, 11
BNE	R3, R2, L__Settings_Write_Coord_Data150
NOP	
J	L_Settings_Write_Coord_Data21
NOP	
L__Settings_Write_Coord_Data150:
SEH	R3, R4
ORI	R2, R0, 12
BNE	R3, R2, L__Settings_Write_Coord_Data152
NOP	
J	L_Settings_Write_Coord_Data22
NOP	
L__Settings_Write_Coord_Data152:
SEH	R3, R4
ORI	R2, R0, 13
BNE	R3, R2, L__Settings_Write_Coord_Data154
NOP	
J	L_Settings_Write_Coord_Data23
NOP	
L__Settings_Write_Coord_Data154:
SEH	R3, R4
ORI	R2, R0, 14
BNE	R3, R2, L__Settings_Write_Coord_Data156
NOP	
J	L_Settings_Write_Coord_Data24
NOP	
L__Settings_Write_Coord_Data156:
SEH	R3, R4
ORI	R2, R0, 15
BNE	R3, R2, L__Settings_Write_Coord_Data158
NOP	
J	L_Settings_Write_Coord_Data25
NOP	
L__Settings_Write_Coord_Data158:
L_Settings_Write_Coord_Data9:
;Globals.c,173 :: 		for (i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; recipe end address is: 16 (R4)
; i end address is: 20 (R5)
L_Settings_Write_Coord_Data26:
; i start address is: 20 (R5)
; recipe start address is: 16 (R4)
SLTIU	R2, R5, 3
BNE	R2, R0, L__Settings_Write_Coord_Data159
NOP	
J	L_Settings_Write_Coord_Data27
NOP	
L__Settings_Write_Coord_Data159:
;Globals.c,174 :: 		wdata[i] = flt2ulong(coord[i]);
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
;Globals.c,173 :: 		for (i=0;i<3;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,182 :: 		}
; i end address is: 20 (R5)
J	L_Settings_Write_Coord_Data26
NOP	
L_Settings_Write_Coord_Data27:
;Globals.c,184 :: 		i = (recipe-1)*4 ; //place the new data into the correct position
ADDIU	R2, R4, -1
; recipe end address is: 16 (R4)
SEH	R2, R2
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Globals.c,186 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 24 (R6)
; j end address is: 20 (R5)
L_Settings_Write_Coord_Data29:
; j start address is: 20 (R5)
; i start address is: 24 (R6)
SLTIU	R2, R5, 4
BNE	R2, R0, L__Settings_Write_Coord_Data160
NOP	
J	L_Settings_Write_Coord_Data30
NOP	
L__Settings_Write_Coord_Data160:
;Globals.c,187 :: 		buffA[i] =  wdata[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 28
SLL	R2, R5, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,188 :: 		i++;
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,186 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,189 :: 		}
; i end address is: 24 (R6)
; j end address is: 20 (R5)
J	L_Settings_Write_Coord_Data29
NOP	
L_Settings_Write_Coord_Data30:
;Globals.c,193 :: 		res = NVMWriteRow(&add,buffA);
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
;Globals.c,194 :: 		set_ram_loaded_indicator(res);
SH	R25, 8(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 8(SP)
;Globals.c,210 :: 		return res;
SEH	R2, R3
; res end address is: 12 (R3)
;Globals.c,211 :: 		}
;Globals.c,210 :: 		return res;
;Globals.c,211 :: 		}
L_end_Settings_Write_Coord_Data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
_settings_read_coord_data:
;Globals.c,217 :: 		void settings_read_coord_data(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Globals.c,219 :: 		unsigned int error = 0;
SW	R25, 4(SP)
;Globals.c,224 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_read_coord_data162
NOP	
J	L_settings_read_coord_data32
NOP	
L__settings_read_coord_data162:
;Globals.c,225 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
; add start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
;Globals.c,226 :: 		Save_Row_From_Flash(add);
MOVZ	R25, R2, R0
; add end address is: 8 (R2)
JAL	Globals_Save_Row_From_Flash+0
NOP	
;Globals.c,227 :: 		}else{
J	L_settings_read_coord_data33
NOP	
L_settings_read_coord_data32:
;Globals.c,228 :: 		for(i = 0; i < 9; i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_settings_read_coord_data34:
; i start address is: 16 (R4)
SLTIU	R2, R4, 9
BNE	R2, R0, L__settings_read_coord_data163
NOP	
J	L_settings_read_coord_data35
NOP	
L__settings_read_coord_data163:
;Globals.c,229 :: 		for(j = 0 ; j < NoOfAxis; j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_settings_read_coord_data37:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__settings_read_coord_data164
NOP	
J	L_settings_read_coord_data38
NOP	
L__settings_read_coord_data164:
;Globals.c,230 :: 		temp = buffA[(i*NoOfAxis) + j];
SLL	R2, R4, 2
ADDU	R2, R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
LW	R2, 0(R2)
; temp start address is: 8 (R2)
;Globals.c,231 :: 		ptr = ulong2flt(temp);
SW	R4, 8(SP)
; temp end address is: 8 (R2)
SW	R5, 12(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R5, 12(SP)
LW	R4, 8(SP)
;Globals.c,232 :: 		coord_system[i].coord[j] = ptr;
SLL	R3, R4, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SLL	R2, R5, 2
ADDU	R2, R3, R2
SWC1	S0, 0(R2)
;Globals.c,229 :: 		for(j = 0 ; j < NoOfAxis; j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,240 :: 		}
; j end address is: 20 (R5)
J	L_settings_read_coord_data37
NOP	
L_settings_read_coord_data38:
;Globals.c,228 :: 		for(i = 0; i < 9; i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Globals.c,241 :: 		}
; i end address is: 16 (R4)
J	L_settings_read_coord_data34
NOP	
L_settings_read_coord_data35:
;Globals.c,242 :: 		}
L_settings_read_coord_data33:
;Globals.c,243 :: 		}
L_end_settings_read_coord_data:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _settings_read_coord_data
_settings_write_one_coord:
;Globals.c,248 :: 		unsigned int settings_write_one_coord(int coord_select,float *coord){
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Globals.c,251 :: 		unsigned int error = 0;
;Globals.c,256 :: 		recipe = coord_select * NoOfAxis;
SEH	R2, R25
SLL	R2, R2, 2
; recipe start address is: 20 (R5)
SEH	R5, R2
;Globals.c,259 :: 		j=0;
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
;Globals.c,260 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
; i start address is: 24 (R6)
SEH	R6, R2
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_settings_write_one_coord40:
; i start address is: 24 (R6)
; j start address is: 28 (R7)
; recipe start address is: 20 (R5)
ADDIU	R2, R5, 4
SEH	R2, R2
SLTU	R2, R6, R2
BNE	R2, R0, L__settings_write_one_coord166
NOP	
J	L_settings_write_one_coord41
NOP	
L__settings_write_one_coord166:
;Globals.c,262 :: 		coord_data[j] = *(coord+j);
ADDIU	R4, SP, 24
SLL	R2, R7, 2
ADDU	R3, R4, R2
ADDU	R2, R26, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Globals.c,263 :: 		temp[j] = flt2ulong(coord_data[j]);
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
;Globals.c,264 :: 		buffA[i] = temp[j];
SLL	R3, R6, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R4, R2, R3
ADDIU	R3, SP, 44
SLL	R2, R7, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 0(R4)
;Globals.c,265 :: 		j++;
ADDIU	R2, R7, 1
MOVZ	R7, R2, R0
;Globals.c,260 :: 		for(i = recipe;i< recipe+NoOfAxis;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Globals.c,270 :: 		}
; recipe end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_settings_write_one_coord40
NOP	
L_settings_write_one_coord41:
;Globals.c,272 :: 		switch(coord_select){
J	L_settings_write_one_coord43
NOP	
;Globals.c,274 :: 		case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
L_settings_write_one_coord45:
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,275 :: 		case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
L_settings_write_one_coord46:
LUI	R2, 48411
ORI	R2, R2, 49168
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,276 :: 		case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
L_settings_write_one_coord47:
LUI	R2, 48411
ORI	R2, R2, 49184
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,277 :: 		case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
L_settings_write_one_coord48:
LUI	R2, 48411
ORI	R2, R2, 49200
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,278 :: 		case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
L_settings_write_one_coord49:
LUI	R2, 48411
ORI	R2, R2, 49216
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,279 :: 		case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
L_settings_write_one_coord50:
LUI	R2, 48411
ORI	R2, R2, 49232
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,280 :: 		case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
L_settings_write_one_coord51:
LUI	R2, 48411
ORI	R2, R2, 49248
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,281 :: 		case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
L_settings_write_one_coord52:
LUI	R2, 48411
ORI	R2, R2, 49264
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,282 :: 		case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
L_settings_write_one_coord53:
LUI	R2, 48411
ORI	R2, R2, 49280
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,284 :: 		case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
L_settings_write_one_coord54:
LUI	R2, 48411
ORI	R2, R2, 49296
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,285 :: 		case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
L_settings_write_one_coord55:
LUI	R2, 48411
ORI	R2, R2, 49312
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,286 :: 		case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
L_settings_write_one_coord56:
LUI	R2, 48411
ORI	R2, R2, 49328
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,287 :: 		case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
L_settings_write_one_coord57:
LUI	R2, 48411
ORI	R2, R2, 49344
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,288 :: 		case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
L_settings_write_one_coord58:
LUI	R2, 48411
ORI	R2, R2, 49360
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,289 :: 		case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
L_settings_write_one_coord59:
LUI	R2, 48411
ORI	R2, R2, 49376
SW	R2, 40(SP)
J	L_settings_write_one_coord44
NOP	
;Globals.c,290 :: 		}
L_settings_write_one_coord43:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_write_one_coord168
NOP	
J	L_settings_write_one_coord45
NOP	
L__settings_write_one_coord168:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_write_one_coord170
NOP	
J	L_settings_write_one_coord46
NOP	
L__settings_write_one_coord170:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_write_one_coord172
NOP	
J	L_settings_write_one_coord47
NOP	
L__settings_write_one_coord172:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_write_one_coord174
NOP	
J	L_settings_write_one_coord48
NOP	
L__settings_write_one_coord174:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_write_one_coord176
NOP	
J	L_settings_write_one_coord49
NOP	
L__settings_write_one_coord176:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_write_one_coord178
NOP	
J	L_settings_write_one_coord50
NOP	
L__settings_write_one_coord178:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_write_one_coord180
NOP	
J	L_settings_write_one_coord51
NOP	
L__settings_write_one_coord180:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_write_one_coord182
NOP	
J	L_settings_write_one_coord52
NOP	
L__settings_write_one_coord182:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_write_one_coord184
NOP	
J	L_settings_write_one_coord53
NOP	
L__settings_write_one_coord184:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_write_one_coord186
NOP	
J	L_settings_write_one_coord54
NOP	
L__settings_write_one_coord186:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_write_one_coord188
NOP	
J	L_settings_write_one_coord55
NOP	
L__settings_write_one_coord188:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_write_one_coord190
NOP	
J	L_settings_write_one_coord56
NOP	
L__settings_write_one_coord190:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_write_one_coord192
NOP	
J	L_settings_write_one_coord57
NOP	
L__settings_write_one_coord192:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_write_one_coord194
NOP	
J	L_settings_write_one_coord58
NOP	
L__settings_write_one_coord194:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_write_one_coord196
NOP	
J	L_settings_write_one_coord59
NOP	
L__settings_write_one_coord196:
L_settings_write_one_coord44:
;Globals.c,293 :: 		error =  NVMWriteQuad (add, temp);
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
;Globals.c,294 :: 		set_ram_loaded_indicator(error);
SH	R25, 4(SP)
ANDI	R25, R2, 65535
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 4(SP)
;Globals.c,296 :: 		return error;
ANDI	R2, R3, 65535
; error end address is: 12 (R3)
;Globals.c,297 :: 		}
L_end_settings_write_one_coord:
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _settings_write_one_coord
_settings_read_startup_line:
;Globals.c,302 :: 		int settings_read_startup_line(int n, char *line){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,306 :: 		switch(n){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_settings_read_startup_line60
NOP	
;Globals.c,307 :: 		case 0: char_add = (char*)FLASH_Settings_VAddr_SLine1;break;
L_settings_read_startup_line62:
LUI	R2, 48411
ORI	R2, R2, 50688
SW	R2, 16(SP)
J	L_settings_read_startup_line61
NOP	
;Globals.c,308 :: 		case 1: char_add = (char*)FLASH_Settings_VAddr_SLine2;break;
L_settings_read_startup_line63:
LUI	R2, 48411
ORI	R2, R2, 50752
SW	R2, 16(SP)
J	L_settings_read_startup_line61
NOP	
;Globals.c,309 :: 		}
L_settings_read_startup_line60:
SEH	R2, R25
BNE	R2, R0, L__settings_read_startup_line199
NOP	
J	L_settings_read_startup_line62
NOP	
L__settings_read_startup_line199:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_read_startup_line201
NOP	
J	L_settings_read_startup_line63
NOP	
L__settings_read_startup_line201:
L_settings_read_startup_line61:
;Globals.c,311 :: 		memcpy(line,char_add,64);
ORI	R27, R0, 64
MOVZ	R25, R26, R0
LW	R26, 16(SP)
JAL	_memcpy+0
NOP	
;Globals.c,319 :: 		return STATUS_OK;
MOVZ	R2, R0, R0
;Globals.c,320 :: 		}
;Globals.c,319 :: 		return STATUS_OK;
;Globals.c,320 :: 		}
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
;Globals.c,324 :: 		int settings_store_startup_line(int n, char *line){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Globals.c,330 :: 		str_len = strlen(line);
SW	R25, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LH	R25, 12(SP)
; str_len start address is: 16 (R4)
SEH	R4, R2
;Globals.c,339 :: 		addA  = (unsigned long)FLASH_Settings_VAddr_P1; //C0000
LUI	R2, 48411
ORI	R2, R2, 49152
SW	R2, 24(SP)
;Globals.c,342 :: 		switch(n){
J	L_settings_store_startup_line64
NOP	
;Globals.c,343 :: 		case 0: start_offset = (unsigned long)Line0_Offset;break; //180
L_settings_store_startup_line66:
ORI	R2, R0, 384
SW	R2, 20(SP)
J	L_settings_store_startup_line65
NOP	
;Globals.c,344 :: 		case 1: start_offset = (unsigned long)Line1_Offset;break;
L_settings_store_startup_line67:
ORI	R2, R0, 400
SW	R2, 20(SP)
J	L_settings_store_startup_line65
NOP	
;Globals.c,345 :: 		}
L_settings_store_startup_line64:
SEH	R2, R25
BNE	R2, R0, L__settings_store_startup_line204
NOP	
J	L_settings_store_startup_line66
NOP	
L__settings_store_startup_line204:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_startup_line206
NOP	
J	L_settings_store_startup_line67
NOP	
L__settings_store_startup_line206:
L_settings_store_startup_line65:
;Globals.c,348 :: 		Save_Row_From_Flash(addA);
SH	R4, 12(SP)
LW	R25, 24(SP)
JAL	Globals_Save_Row_From_Flash+0
NOP	
;Globals.c,352 :: 		error = (int)NVMErasePage(addA);
SW	R26, 16(SP)
LW	R25, 24(SP)
JAL	_NVMErasePage+0
NOP	
LW	R26, 16(SP)
LH	R4, 12(SP)
;Globals.c,355 :: 		for(i=start_offset;i<start_offset+16;i++)
; i start address is: 20 (R5)
LW	R5, 20(SP)
; str_len end address is: 16 (R4)
; i end address is: 20 (R5)
L_settings_store_startup_line68:
; i start address is: 20 (R5)
; str_len start address is: 16 (R4)
LW	R2, 20(SP)
ADDIU	R2, R2, 16
SLTU	R2, R5, R2
BNE	R2, R0, L__settings_store_startup_line207
NOP	
J	L_settings_store_startup_line69
NOP	
L__settings_store_startup_line207:
;Globals.c,356 :: 		buffA[i] = 0;
SLL	R3, R5, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Globals.c,355 :: 		for(i=start_offset;i<start_offset+16;i++)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Globals.c,356 :: 		buffA[i] = 0;
; i end address is: 20 (R5)
J	L_settings_store_startup_line68
NOP	
L_settings_store_startup_line69:
;Globals.c,360 :: 		memcpy(buffA+start_offset,line,str_len);
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
;Globals.c,371 :: 		error = (int)NVMWriteRow(&addA,buffA);
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
;Globals.c,372 :: 		set_ram_loaded_indicator(error);
SH	R25, 12(SP)
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
LH	R25, 12(SP)
;Globals.c,374 :: 		return error;
SEH	R2, R3
; error end address is: 12 (R3)
;Globals.c,375 :: 		}
;Globals.c,374 :: 		return error;
;Globals.c,375 :: 		}
L_end_settings_store_startup_line:
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _settings_store_startup_line
_settings_store_global_setting:
;Globals.c,380 :: 		int settings_store_global_setting(int parameter, float value) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Globals.c,381 :: 		int error = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Globals.c,386 :: 		if(!read_ram_loaded_indicator()){
JAL	_read_ram_loaded_indicator+0
NOP	
BEQ	R2, R0, L__settings_store_global_setting209
NOP	
J	L_settings_store_global_setting71
NOP	
L__settings_store_global_setting209:
;Globals.c,387 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
; add start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
;Globals.c,388 :: 		Save_Row_From_Flash(add);
SH	R25, 12(SP)
; add end address is: 8 (R2)
MOVZ	R25, R2, R0
JAL	Globals_Save_Row_From_Flash+0
NOP	
LH	R25, 12(SP)
;Globals.c,389 :: 		}
L_settings_store_global_setting71:
;Globals.c,391 :: 		switch(parameter) {
J	L_settings_store_global_setting72
NOP	
;Globals.c,392 :: 		case 0: case 1: case 2: //| X | Y | Z | ? | ? | ? |
L_settings_store_global_setting74:
L_settings_store_global_setting75:
L_settings_store_global_setting76:
;Globals.c,393 :: 		if (value <= 0.0) { return(STATUS_SETTING_VALUE_NEG); }
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting210
NOP	
J	L_settings_store_global_setting77
NOP	
L__settings_store_global_setting210:
ORI	R2, R0, 8
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting77:
;Globals.c,395 :: 		settings.steps_per_mm[parameter] = value;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,397 :: 		buffA[SPMMX_OFFSET + parameter] = value;
ADDIU	R2, R25, 64
SEH	R2, R2
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 0
ADDU	R3, R2, R3
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, 0(R3)
;Globals.c,398 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,399 :: 		case 3:
L_settings_store_global_setting78:
;Globals.c,400 :: 		if (value < 3) { return(STATUS_SETTING_STEP_PULSE_MIN); }
LUI	R2, 16448
ORI	R2, R2, 0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__settings_store_global_setting211
NOP	
J	L_settings_store_global_setting79
NOP	
L__settings_store_global_setting211:
ORI	R2, R0, 9
J	L_end_settings_store_global_setting
NOP	
L_settings_store_global_setting79:
;Globals.c,401 :: 		settings.pulse_microseconds = round(value);
SWC1	S12, 12(SP)
JAL	_round+0
NOP	
LWC1	S12, 12(SP)
SH	R2, Offset(_settings+64)(GP)
;Globals.c,403 :: 		buffA[P_MSEC_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612456)(GP)
;Globals.c,404 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,405 :: 		case 4: settings.default_feed_rate = value;
L_settings_store_global_setting80:
SWC1	S12, Offset(_settings+20)(GP)
;Globals.c,406 :: 		buffA[D_FEED_RATE_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612452)(GP)
;Globals.c,407 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,408 :: 		case 5: settings.default_seek_rate = value;
L_settings_store_global_setting81:
SWC1	S12, Offset(_settings+24)(GP)
;Globals.c,409 :: 		buffA[D_SEEK_RATE_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612448)(GP)
;Globals.c,410 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,411 :: 		case 6: settings.invert_mask = floor(value);
L_settings_store_global_setting82:
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+70)(GP)
;Globals.c,412 :: 		buffA[INVERT_MASK_OFFSET] = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(-1610612384)(GP)
;Globals.c,413 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,414 :: 		case 7: settings.stepper_idle_lock_time = round(value);
L_settings_store_global_setting83:
SWC1	S12, 12(SP)
JAL	_round+0
NOP	
LWC1	S12, 12(SP)
SH	R2, Offset(_settings+60)(GP)
;Globals.c,415 :: 		buffA[IDLE_LOCK_TMR_OFFSET] = round(value);
JAL	_round+0
NOP	
SEH	R2, R2
SW	R2, Offset(-1610612404)(GP)
;Globals.c,416 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,417 :: 		case 8: // Convert to mm/min^2 for grbl internal use.
L_settings_store_global_setting84:
;Globals.c,418 :: 		settings.acceleration = value*60*60;
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S12, S0
LUI	R2, 17008
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_settings+44)(GP)
;Globals.c,419 :: 		buffA[ACCELERATION_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612428)(GP)
;Globals.c,420 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,421 :: 		case 9: settings.junction_deviation = fabs(value);
L_settings_store_global_setting85:
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_settings+48)(GP)
;Globals.c,422 :: 		buffA[JUNCTION_DEV_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612424)(GP)
;Globals.c,423 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,424 :: 		case 10: settings.mm_per_arc_segment = value;
L_settings_store_global_setting86:
SWC1	S12, Offset(_settings+40)(GP)
;Globals.c,425 :: 		buffA[MM_ARC_SEG_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612432)(GP)
;Globals.c,426 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,427 :: 		case 11: settings.n_arc_correction = round(value);
L_settings_store_global_setting87:
SWC1	S12, 12(SP)
JAL	_round+0
NOP	
LWC1	S12, 12(SP)
SH	R2, Offset(_settings+52)(GP)
;Globals.c,428 :: 		buffA[N_ARC_CORREC_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612420)(GP)
;Globals.c,429 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,430 :: 		case 12: settings.decimal_places = round(value);
L_settings_store_global_setting88:
SWC1	S12, 12(SP)
JAL	_round+0
NOP	
LWC1	S12, 12(SP)
SH	R2, Offset(_settings+66)(GP)
;Globals.c,431 :: 		buffA[DEC_PLACES_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612392)(GP)
;Globals.c,432 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,433 :: 		case 13:
L_settings_store_global_setting89:
;Globals.c,434 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting213
NOP	
J	L_settings_store_global_setting90
NOP	
L__settings_store_global_setting213:
;Globals.c,435 :: 		settings.flags |= BITFLAG_REPORT_INCHES;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 1
SH	R2, Offset(_settings+54)(GP)
;Globals.c,436 :: 		buffA[FLAGS_OFFSET] |= BITFLAG_REPORT_INCHES;
LW	R2, Offset(-1610612416)(GP)
ORI	R2, R2, 1
SW	R2, Offset(-1610612416)(GP)
;Globals.c,437 :: 		}else{
J	L_settings_store_global_setting91
NOP	
L_settings_store_global_setting90:
;Globals.c,438 :: 		settings.flags &= ~BITFLAG_REPORT_INCHES;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65534
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,439 :: 		buffA[FLAGS_OFFSET] &= ~BITFLAG_REPORT_INCHES;
LW	R3, Offset(-1610612416)(GP)
LUI	R2, 65535
ORI	R2, R2, 65534
AND	R2, R3, R2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,440 :: 		}
L_settings_store_global_setting91:
;Globals.c,441 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,442 :: 		case 14: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting92:
;Globals.c,443 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting215
NOP	
J	L_settings_store_global_setting93
NOP	
L__settings_store_global_setting215:
;Globals.c,444 :: 		settings.flags |= BITFLAG_AUTO_START;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,445 :: 		buffA[FLAGS_OFFSET] |= BITFLAG_AUTO_START;
LW	R2, Offset(-1610612416)(GP)
ORI	R2, R2, 2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,446 :: 		}else{
J	L_settings_store_global_setting94
NOP	
L_settings_store_global_setting93:
;Globals.c,447 :: 		settings.flags &= ~BITFLAG_AUTO_START;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,448 :: 		buffA[FLAGS_OFFSET] &= ~BITFLAG_AUTO_START;
LW	R3, Offset(-1610612416)(GP)
LUI	R2, 65535
ORI	R2, R2, 65533
AND	R2, R3, R2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,449 :: 		}
L_settings_store_global_setting94:
;Globals.c,450 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,451 :: 		case 15: // Reset to ensure change. Immediate re-init may cause problems.
L_settings_store_global_setting95:
;Globals.c,452 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting217
NOP	
J	L_settings_store_global_setting96
NOP	
L__settings_store_global_setting217:
;Globals.c,453 :: 		settings.flags |= BITFLAG_INVERT_ST_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 4
SH	R2, Offset(_settings+54)(GP)
;Globals.c,454 :: 		buffA[FLAGS_OFFSET] |= BITFLAG_INVERT_ST_ENABLE;
LW	R2, Offset(-1610612416)(GP)
ORI	R2, R2, 4
SW	R2, Offset(-1610612416)(GP)
;Globals.c,455 :: 		}else{
J	L_settings_store_global_setting97
NOP	
L_settings_store_global_setting96:
;Globals.c,456 :: 		settings.flags &= ~BITFLAG_INVERT_ST_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65531
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,457 :: 		buffA[FLAGS_OFFSET] &= ~BITFLAG_INVERT_ST_ENABLE;
LW	R3, Offset(-1610612416)(GP)
LUI	R2, 65535
ORI	R2, R2, 65531
AND	R2, R3, R2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,458 :: 		}
L_settings_store_global_setting97:
;Globals.c,459 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,460 :: 		case 16:
L_settings_store_global_setting98:
;Globals.c,461 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting219
NOP	
J	L_settings_store_global_setting99
NOP	
L__settings_store_global_setting219:
;Globals.c,462 :: 		settings.flags |= BITFLAG_HARD_LIMIT_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 8
SH	R2, Offset(_settings+54)(GP)
;Globals.c,463 :: 		buffA[FLAGS_OFFSET] |= BITFLAG_INVERT_ST_ENABLE;
LW	R2, Offset(-1610612416)(GP)
ORI	R2, R2, 4
SW	R2, Offset(-1610612416)(GP)
;Globals.c,464 :: 		}else{
J	L_settings_store_global_setting100
NOP	
L_settings_store_global_setting99:
;Globals.c,465 :: 		settings.flags &= ~BITFLAG_HARD_LIMIT_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65527
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,466 :: 		buffA[FLAGS_OFFSET] &= ~BITFLAG_INVERT_ST_ENABLE;
LW	R3, Offset(-1610612416)(GP)
LUI	R2, 65535
ORI	R2, R2, 65531
AND	R2, R3, R2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,467 :: 		}
L_settings_store_global_setting100:
;Globals.c,469 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,470 :: 		case 17:
L_settings_store_global_setting101:
;Globals.c,471 :: 		if (value){
BNE	R24, R0, L__settings_store_global_setting221
NOP	
J	L_settings_store_global_setting102
NOP	
L__settings_store_global_setting221:
;Globals.c,472 :: 		settings.flags |= BITFLAG_HOMING_ENABLE;
LH	R2, Offset(_settings+54)(GP)
ORI	R2, R2, 16
SH	R2, Offset(_settings+54)(GP)
;Globals.c,473 :: 		buffA[FLAGS_OFFSET] |= BITFLAG_HOMING_ENABLE;
LW	R2, Offset(-1610612416)(GP)
ORI	R2, R2, 16
SW	R2, Offset(-1610612416)(GP)
;Globals.c,474 :: 		}else{
J	L_settings_store_global_setting103
NOP	
L_settings_store_global_setting102:
;Globals.c,475 :: 		settings.flags &= ~BITFLAG_HOMING_ENABLE;
LH	R3, Offset(_settings+54)(GP)
ORI	R2, R0, 65519
AND	R2, R3, R2
SH	R2, Offset(_settings+54)(GP)
;Globals.c,476 :: 		buffA[FLAGS_OFFSET] &= ~BITFLAG_HOMING_ENABLE;
LW	R3, Offset(-1610612416)(GP)
LUI	R2, 65535
ORI	R2, R2, 65519
AND	R2, R3, R2
SW	R2, Offset(-1610612416)(GP)
;Globals.c,477 :: 		}
L_settings_store_global_setting103:
;Globals.c,478 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,479 :: 		case 18: settings.homing_dir_mask = floor(value);
L_settings_store_global_setting104:
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_settings+68)(GP)
;Globals.c,480 :: 		buffA[HOME_DIR_MASK_OFFSET] = floor(value);
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(-1610612388)(GP)
;Globals.c,481 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,482 :: 		case 19: settings.homing_feed_rate = value;
L_settings_store_global_setting105:
SWC1	S12, Offset(_settings+28)(GP)
;Globals.c,483 :: 		buffA[H_FEED_RATE_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612444)(GP)
;Globals.c,484 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,485 :: 		case 20: settings.homing_seek_rate = value;
L_settings_store_global_setting106:
SWC1	S12, Offset(_settings+32)(GP)
;Globals.c,486 :: 		buffA[D_SEEK_RATE_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612448)(GP)
;Globals.c,487 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,488 :: 		case 21: settings.homing_debounce_delay = round(value);
L_settings_store_global_setting107:
SWC1	S12, 12(SP)
JAL	_round+0
NOP	
LWC1	S12, 12(SP)
SH	R2, Offset(_settings+58)(GP)
;Globals.c,489 :: 		buffA[H_DEBNC_DLY_OFFSET] = round(value);
JAL	_round+0
NOP	
SEH	R2, R2
SW	R2, Offset(-1610612408)(GP)
;Globals.c,490 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,491 :: 		case 22: settings.homing_pulloff = value;
L_settings_store_global_setting108:
SWC1	S12, Offset(_settings+36)(GP)
;Globals.c,492 :: 		buffA[H_PULL_OFF_OFFSET] = value;
CVT36.S 	S0, S12
MFC1	R2, S0
SW	R2, Offset(-1610612436)(GP)
;Globals.c,493 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,494 :: 		case 99://write buffC back to Row3
L_settings_store_global_setting109:
;Globals.c,497 :: 		unsigned long add = (unsigned long)FLASH_Settings_VAddr_P1;
LUI	R30, 48411
ORI	R30, R30, 49152
SW	R30, 16(SP)
;Globals.c,498 :: 		error = set_ram_loaded_indicator((int)NVMWriteRow(&add,buffA));
ADDIU	R2, SP, 16
LUI	R26, 40960
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_NVMWriteRow+0
NOP	
SEH	R25, R2
JAL	Globals_set_ram_loaded_indicator+0
NOP	
;Globals.c,499 :: 		if(!error){
BEQ	R2, R0, L__settings_store_global_setting222
NOP	
J	L_settings_store_global_setting111
NOP	
L__settings_store_global_setting222:
;Globals.c,501 :: 		Save_Row_From_Flash(add);
LW	R25, 16(SP)
JAL	Globals_Save_Row_From_Flash+0
NOP	
;Globals.c,502 :: 		}
L_settings_store_global_setting111:
;Globals.c,504 :: 		break;
J	L_settings_store_global_setting73
NOP	
;Globals.c,505 :: 		default:
L_settings_store_global_setting112:
;Globals.c,506 :: 		return(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
J	L_end_settings_store_global_setting
NOP	
;Globals.c,507 :: 		}
L_settings_store_global_setting72:
SEH	R2, R25
BNE	R2, R0, L__settings_store_global_setting224
NOP	
J	L_settings_store_global_setting74
NOP	
L__settings_store_global_setting224:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__settings_store_global_setting226
NOP	
J	L_settings_store_global_setting75
NOP	
L__settings_store_global_setting226:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__settings_store_global_setting228
NOP	
J	L_settings_store_global_setting76
NOP	
L__settings_store_global_setting228:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__settings_store_global_setting230
NOP	
J	L_settings_store_global_setting78
NOP	
L__settings_store_global_setting230:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__settings_store_global_setting232
NOP	
J	L_settings_store_global_setting80
NOP	
L__settings_store_global_setting232:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__settings_store_global_setting234
NOP	
J	L_settings_store_global_setting81
NOP	
L__settings_store_global_setting234:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__settings_store_global_setting236
NOP	
J	L_settings_store_global_setting82
NOP	
L__settings_store_global_setting236:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__settings_store_global_setting238
NOP	
J	L_settings_store_global_setting83
NOP	
L__settings_store_global_setting238:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__settings_store_global_setting240
NOP	
J	L_settings_store_global_setting84
NOP	
L__settings_store_global_setting240:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__settings_store_global_setting242
NOP	
J	L_settings_store_global_setting85
NOP	
L__settings_store_global_setting242:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__settings_store_global_setting244
NOP	
J	L_settings_store_global_setting86
NOP	
L__settings_store_global_setting244:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__settings_store_global_setting246
NOP	
J	L_settings_store_global_setting87
NOP	
L__settings_store_global_setting246:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__settings_store_global_setting248
NOP	
J	L_settings_store_global_setting88
NOP	
L__settings_store_global_setting248:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__settings_store_global_setting250
NOP	
J	L_settings_store_global_setting89
NOP	
L__settings_store_global_setting250:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__settings_store_global_setting252
NOP	
J	L_settings_store_global_setting92
NOP	
L__settings_store_global_setting252:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__settings_store_global_setting254
NOP	
J	L_settings_store_global_setting95
NOP	
L__settings_store_global_setting254:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__settings_store_global_setting256
NOP	
J	L_settings_store_global_setting98
NOP	
L__settings_store_global_setting256:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__settings_store_global_setting258
NOP	
J	L_settings_store_global_setting101
NOP	
L__settings_store_global_setting258:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__settings_store_global_setting260
NOP	
J	L_settings_store_global_setting104
NOP	
L__settings_store_global_setting260:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__settings_store_global_setting262
NOP	
J	L_settings_store_global_setting105
NOP	
L__settings_store_global_setting262:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__settings_store_global_setting264
NOP	
J	L_settings_store_global_setting106
NOP	
L__settings_store_global_setting264:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L__settings_store_global_setting266
NOP	
J	L_settings_store_global_setting107
NOP	
L__settings_store_global_setting266:
SEH	R3, R25
ORI	R2, R0, 22
BNE	R3, R2, L__settings_store_global_setting268
NOP	
J	L_settings_store_global_setting108
NOP	
L__settings_store_global_setting268:
SEH	R3, R25
ORI	R2, R0, 99
BNE	R3, R2, L__settings_store_global_setting270
NOP	
J	L_settings_store_global_setting109
NOP	
L__settings_store_global_setting270:
J	L_settings_store_global_setting112
NOP	
L_settings_store_global_setting73:
;Globals.c,508 :: 		return(STATUS_OK);
MOVZ	R2, R0, R0
;Globals.c,509 :: 		}
;Globals.c,508 :: 		return(STATUS_OK);
;Globals.c,509 :: 		}
L_end_settings_store_global_setting:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _settings_store_global_setting
