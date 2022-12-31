_Settings_Init:
;Globals.c,9 :: 		void Settings_Init(char reset_all){
;Globals.c,10 :: 		if(reset_all){
BNE	R25, R0, L__Settings_Init5
NOP	
J	L_Settings_Init0
NOP	
L__Settings_Init5:
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
ADDIU	SP, SP, -2088
SW	RA, 0(SP)
;Globals.c,59 :: 		int res=0;
ADDIU	R23, SP, 28
ADDIU	R22, R23, 2052
LUI	R24, hi_addr(?ICSSettings_Write_Coord_Data_res_L0+0)
ORI	R24, R24, lo_addr(?ICSSettings_Write_Coord_Data_res_L0+0)
JAL	___CC2DW+0
NOP	
;Globals.c,60 :: 		unsigned long wdata[512]={0};
;Globals.c,62 :: 		i = 0;
SW	R0, 16(SP)
;Globals.c,64 :: 		wdata[i] = flt2ulong(coord[i]);
ADDIU	R2, SP, 32
SW	R2, 2084(SP)
SW	R27, 4(SP)
SW	R25, 8(SP)
LWC1	S12, 0(R27)
JAL	_flt2ulong+0
NOP	
LW	R25, 8(SP)
LW	R27, 4(SP)
LW	R3, 2084(SP)
SW	R2, 0(R3)
;Globals.c,65 :: 		while(DMA_IsOn(1));
L_Settings_Write_Coord_Data1:
SW	R27, 4(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
BNE	R2, R0, L__Settings_Write_Coord_Data8
NOP	
J	L_Settings_Write_Coord_Data2
NOP	
L__Settings_Write_Coord_Data8:
J	L_Settings_Write_Coord_Data1
NOP	
L_Settings_Write_Coord_Data2:
;Globals.c,66 :: 		dma_printf("%f\t%l\n",coord[i],wdata[i]);
ADDIU	R4, SP, 32
LW	R2, 16(SP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LW	R4, 0(R2)
ADDU	R2, R27, R3
LWC1	S0, 0(R2)
ORI	R30, R0, 37
SB	R30, 20(SP)
ORI	R30, R0, 102
SB	R30, 21(SP)
ORI	R30, R0, 9
SB	R30, 22(SP)
ORI	R30, R0, 37
SB	R30, 23(SP)
ORI	R30, R0, 108
SB	R30, 24(SP)
ORI	R30, R0, 10
SB	R30, 25(SP)
MOVZ	R30, R0, R0
SB	R30, 26(SP)
ADDIU	R2, SP, 20
SW	R27, 4(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R4, 8(SP)
SWC1	S0, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R27, 4(SP)
;Globals.c,68 :: 		Flash_Write_Word(addr+i,wdata[i]);
ADDIU	R3, SP, 32
LW	R2, 16(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R3, 0(R2)
LW	R2, 16(SP)
ADDU	R2, R25, R2
SH	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_Flash_Write_Word+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
;Globals.c,74 :: 		return res;
LH	R2, 28(SP)
;Globals.c,75 :: 		}
L_end_Settings_Write_Coord_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 2088
JR	RA
NOP	
; end of _Settings_Write_Coord_Data
