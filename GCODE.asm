_G_Initialise:
;GCODE.c,18 :: 		void G_Initialise(){
;GCODE.c,19 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,20 :: 		non_modal_action  = 0;
SH	R0, Offset(_non_modal_action+0)(GP)
;GCODE.c,21 :: 		modal_group_words = 0;
SH	R0, Offset(_modal_group_words+0)(GP)
;GCODE.c,22 :: 		axis_words        = 0;
SH	R0, Offset(_axis_words+0)(GP)
;GCODE.c,23 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,24 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,25 :: 		inverse_feed_rate = -1;
LUI	R2, 49024
ORI	R2, R2, 0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,26 :: 		absolute_override = 0;
SB	R0, Offset(_absolute_override+0)(GP)
;GCODE.c,27 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
GCODE_To_Millimeters:
;GCODE.c,29 :: 		static float To_Millimeters(float value)
;GCODE.c,31 :: 		return(gc.inches_mode ? (value * MM_PER_INCH) : value);
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters182
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters182:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T4 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T4 end address is: 0 (R0)
J	L_GCODE_To_Millimeters1
NOP	
L_GCODE_To_Millimeters0:
; ?FLOC__GCODE_To_Millimeters?T4 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T4 end address is: 0 (R0)
L_GCODE_To_Millimeters1:
; ?FLOC__GCODE_To_Millimeters?T4 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T4 end address is: 0 (R0)
;GCODE.c,32 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,35 :: 		static void Select_Plane(long x,long y,long z){
;GCODE.c,36 :: 		gc.position[X] = x/settings.steps_per_mm[X];
MTC1	R25, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+0)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,37 :: 		gc.position[Y] = y/settings.steps_per_mm[Y];
MTC1	R26, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+4)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,38 :: 		gc.position[Z] = z/settings.steps_per_mm[Z];
MTC1	R27, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+8)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,39 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
_G_Mode:
;GCODE.c,42 :: 		void G_Mode(int mode){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,44 :: 		gc.motion_mode = mode;
SH	R25, Offset(_gc+14)(GP)
;GCODE.c,45 :: 		Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
;GCODE.c,46 :: 		Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
;GCODE.c,50 :: 		while(DMA_Busy(1));
L_G_Mode2:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__G_Mode186
NOP	
J	L_G_Mode3
NOP	
L__G_Mode186:
J	L_G_Mode2
NOP	
L_G_Mode3:
;GCODE.c,51 :: 		dma_printf("gc.motion_mode:= %d\n",mode);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;GCODE.c,53 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _G_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,56 :: 		static void Set_Modal_Groups(int mode){
;GCODE.c,57 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups4
NOP	
;GCODE.c,58 :: 		case 4: case 10: case 28: case 30: case 53: case 92: group_number = MODAL_GROUP_0; break;
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
ORI	R2, R0, 1
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,59 :: 		case 0: case 1: case 2: case 3: case 80: group_number = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,60 :: 		case 17: case 18: case 19: group_number = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,61 :: 		case 90: case 91: group_number = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,62 :: 		case 93: case 94: group_number = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,63 :: 		case 20: case 21: group_number = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,64 :: 		case 54: case 55: case 56: case 57: case 58: case 59: group_number = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups26:
L_GCODE_Set_Modal_Groups27:
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
L_GCODE_Set_Modal_Groups30:
L_GCODE_Set_Modal_Groups31:
ORI	R2, R0, 9
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,65 :: 		}
L_GCODE_Set_Modal_Groups4:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups189
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups189:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups191
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups191:
SEH	R3, R25
ORI	R2, R0, 28
BNE	R3, R2, L_GCODE_Set_Modal_Groups193
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups193:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_Modal_Groups195
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups195:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups197
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups197:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups199
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups199:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups201
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups201:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups203
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups203:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups205
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups205:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups207
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups207:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups209
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups209:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups211
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups211:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups213
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups213:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups215
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups215:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups217
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups217:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups219
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups219:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups221
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups221:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups223
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups223:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups225
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups225:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups227
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups227:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups229
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups229:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups231
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups231:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups233
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups233:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups235
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups235:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups237
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups237:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups239
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups239:
L_GCODE_Set_Modal_Groups5:
;GCODE.c,66 :: 		}
L_end_Set_Modal_Groups:
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,69 :: 		static char Set_Motion_Mode(int mode){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,71 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,72 :: 		case 0: gc.motion_mode = MOTION_MODE_SEEK; break;
L_GCODE_Set_Motion_Mode34:
SH	R0, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,73 :: 		case 1: gc.motion_mode = MOTION_MODE_LINEAR; break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,74 :: 		case 2: gc.motion_mode = MOTION_MODE_CW_ARC; break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,75 :: 		case 3: gc.motion_mode = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,76 :: 		case 4: non_modal_action = NON_MODAL_DWELL; break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,77 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,78 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode40:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,79 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode41:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,80 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode42:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,81 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,82 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+4)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,83 :: 		case 28: case 30:
L_GCODE_Set_Motion_Mode45:
L_GCODE_Set_Motion_Mode46:
;GCODE.c,84 :: 		int_value = floor(10*mode); // Multiply by 10 to pick up Gxx.1
ORI	R2, R0, 10
MUL	R2, R2, R25
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_int_value+0)(GP)
;GCODE.c,85 :: 		switch(int_value) {
J	L_GCODE_Set_Motion_Mode47
NOP	
;GCODE.c,86 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode49:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,87 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode50:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,88 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode51:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,89 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,90 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 3
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,91 :: 		}
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode47:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode242
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode242:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode244
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode244:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode246
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode246:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode248
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode248:
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode48:
;GCODE.c,92 :: 		break;
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,93 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode54:
ORI	R2, R0, 1
SB	R2, Offset(_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,94 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode55:
L_GCODE_Set_Motion_Mode56:
L_GCODE_Set_Motion_Mode57:
L_GCODE_Set_Motion_Mode58:
L_GCODE_Set_Motion_Mode59:
L_GCODE_Set_Motion_Mode60:
;GCODE.c,95 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+13)(GP)
;GCODE.c,96 :: 		break;
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,97 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 4
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,98 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,99 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode63:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,100 :: 		case 92:
L_GCODE_Set_Motion_Mode64:
;GCODE.c,101 :: 		int_value = floor(10*mode); // Multiply by 10 to pick up G92.1
ORI	R2, R0, 10
MUL	R2, R2, R25
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	_floor+0
NOP	
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_int_value+0)(GP)
;GCODE.c,102 :: 		switch(int_value) {
J	L_GCODE_Set_Motion_Mode65
NOP	
;GCODE.c,103 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode67:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode66
NOP	
;GCODE.c,104 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode68:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode66
NOP	
;GCODE.c,105 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_GCODE_Set_Motion_Mode69:
ORI	R2, R0, 3
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,106 :: 		}
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode65:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode250
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode250:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode252
NOP	
J	L_GCODE_Set_Motion_Mode68
NOP	
L_GCODE_Set_Motion_Mode252:
J	L_GCODE_Set_Motion_Mode69
NOP	
L_GCODE_Set_Motion_Mode66:
;GCODE.c,107 :: 		break;
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,108 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode70:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,109 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode71:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,110 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 3
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,111 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode254
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode254:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode256
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode256:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode258
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode258:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode260
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode260:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode262
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode262:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode264
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode264:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode266
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode266:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode268
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode268:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode270
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode270:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode272
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode272:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode274
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode274:
SEH	R3, R25
ORI	R2, R0, 28
BNE	R3, R2, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode276:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode278:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode280:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode282
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode282:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode284:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode286
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode286:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode288:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode290:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode292:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode294:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode296:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode298:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Motion_Mode300
NOP	
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode300:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode302:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode304
NOP	
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode304:
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,117 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode165
NOP	
L_GCODE_Set_Motion_Mode305:
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode306
NOP	
J	L_GCODE_Set_Motion_Mode164
NOP	
L_GCODE_Set_Motion_Mode306:
J	L_GCODE_Set_Motion_Mode75
NOP	
L_GCODE_Set_Motion_Mode165:
L_GCODE_Set_Motion_Mode164:
;GCODE.c,120 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode308
NOP	
J	L_GCODE_Set_Motion_Mode76
NOP	
L_GCODE_Set_Motion_Mode308:
;GCODE.c,121 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode167
NOP	
L_GCODE_Set_Motion_Mode309:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode166
NOP	
L_GCODE_Set_Motion_Mode311:
L_GCODE_Set_Motion_Mode162:
;GCODE.c,122 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,121 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode167:
L_GCODE_Set_Motion_Mode166:
;GCODE.c,124 :: 		}
L_GCODE_Set_Motion_Mode76:
;GCODE.c,126 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode169
NOP	
L_GCODE_Set_Motion_Mode313:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode81
NOP	
L_GCODE_Set_Motion_Mode315:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode317
NOP	
J	L_GCODE_Set_Motion_Mode81
NOP	
L_GCODE_Set_Motion_Mode317:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode80
NOP	
L_GCODE_Set_Motion_Mode81:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode80:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode318
NOP	
J	L_GCODE_Set_Motion_Mode168
NOP	
L_GCODE_Set_Motion_Mode318:
L_GCODE_Set_Motion_Mode161:
;GCODE.c,127 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,126 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode169:
L_GCODE_Set_Motion_Mode168:
;GCODE.c,130 :: 		if (gc.status_code) { return(gc.status_code); }
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode85
NOP	
L_GCODE_Set_Motion_Mode320:
LBU	R2, Offset(_gc+1)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode85:
;GCODE.c,135 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GCODE_Set_Motion_Mode86:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L_GCODE_Set_Motion_Mode321
NOP	
J	L_GCODE_Set_Motion_Mode87
NOP	
L_GCODE_Set_Motion_Mode321:
;GCODE.c,136 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L_GCODE_Set_Motion_Mode323
NOP	
J	L_GCODE_Set_Motion_Mode89
NOP	
L_GCODE_Set_Motion_Mode323:
;GCODE.c,137 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(_absolute_override+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
L_GCODE_Set_Motion_Mode324:
;GCODE.c,138 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode91
NOP	
L_GCODE_Set_Motion_Mode326:
;GCODE.c,139 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+96)
ORI	R2, R2, lo_addr(_gc+96)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+48)
ORI	R2, R2, lo_addr(_gc+48)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;GCODE.c,140 :: 		} else {
J	L_GCODE_Set_Motion_Mode92
NOP	
L_GCODE_Set_Motion_Mode91:
;GCODE.c,141 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+96)
ORI	R2, R2, lo_addr(_gc+96)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;GCODE.c,142 :: 		}
L_GCODE_Set_Motion_Mode92:
;GCODE.c,143 :: 		}
L_GCODE_Set_Motion_Mode90:
;GCODE.c,144 :: 		} else {
J	L_GCODE_Set_Motion_Mode93
NOP	
L_GCODE_Set_Motion_Mode89:
;GCODE.c,145 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+96)
ORI	R2, R2, lo_addr(_gc+96)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,146 :: 		}
L_GCODE_Set_Motion_Mode93:
;GCODE.c,135 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,147 :: 		}
; i end address is: 20 (R5)
J	L_GCODE_Set_Motion_Mode86
NOP	
L_GCODE_Set_Motion_Mode87:
;GCODE.c,148 :: 		}
L_GCODE_Set_Motion_Mode75:
;GCODE.c,152 :: 		switch (gc.motion_mode) {
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,153 :: 		case MOTION_MODE_CANCEL:
L_GCODE_Set_Motion_Mode96:
;GCODE.c,154 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LH	R2, Offset(_axis_words+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode97
NOP	
L_GCODE_Set_Motion_Mode328:
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
L_GCODE_Set_Motion_Mode97:
;GCODE.c,155 :: 		break;
J	L_GCODE_Set_Motion_Mode95
NOP	
;GCODE.c,156 :: 		case MOTION_MODE_SEEK:
L_GCODE_Set_Motion_Mode98:
;GCODE.c,157 :: 		if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode99
NOP	
L_GCODE_Set_Motion_Mode329:
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode100
NOP	
L_GCODE_Set_Motion_Mode99:
;GCODE.c,161 :: 		}
L_GCODE_Set_Motion_Mode100:
;GCODE.c,162 :: 		break;
J	L_GCODE_Set_Motion_Mode95
NOP	
;GCODE.c,163 :: 		case MOTION_MODE_LINEAR:
L_GCODE_Set_Motion_Mode101:
;GCODE.c,168 :: 		if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode330
NOP	
J	L_GCODE_Set_Motion_Mode102
NOP	
L_GCODE_Set_Motion_Mode330:
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode103
NOP	
L_GCODE_Set_Motion_Mode102:
;GCODE.c,171 :: 		}
L_GCODE_Set_Motion_Mode103:
;GCODE.c,172 :: 		break;
J	L_GCODE_Set_Motion_Mode95
NOP	
;GCODE.c,173 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_GCODE_Set_Motion_Mode104:
L_GCODE_Set_Motion_Mode105:
;GCODE.c,176 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+12)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_axis_words+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(_axis_words+0)(GP)
;GCODE.c,177 :: 		( !gc.r)/*&& gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 ) */){
BNE	R2, R0, L_GCODE_Set_Motion_Mode332
NOP	
J	L_GCODE_Set_Motion_Mode171
NOP	
L_GCODE_Set_Motion_Mode332:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L_GCODE_Set_Motion_Mode334
NOP	
J	L_GCODE_Set_Motion_Mode170
NOP	
L_GCODE_Set_Motion_Mode334:
J	L_GCODE_Set_Motion_Mode108
NOP	
L_GCODE_Set_Motion_Mode171:
L_GCODE_Set_Motion_Mode170:
;GCODE.c,178 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,179 :: 		} else {
J	L_GCODE_Set_Motion_Mode109
NOP	
L_GCODE_Set_Motion_Mode108:
;GCODE.c,180 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+120)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L_GCODE_Set_Motion_Mode335
NOP	
J	L_GCODE_Set_Motion_Mode110
NOP	
L_GCODE_Set_Motion_Mode335:
;GCODE.c,182 :: 		asm{nop;}
NOP	
;GCODE.c,183 :: 		}
L_GCODE_Set_Motion_Mode110:
;GCODE.c,184 :: 		}
L_GCODE_Set_Motion_Mode109:
;GCODE.c,185 :: 		break;
J	L_GCODE_Set_Motion_Mode95
NOP	
;GCODE.c,186 :: 		}
L_GCODE_Set_Motion_Mode94:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode337
NOP	
J	L_GCODE_Set_Motion_Mode96
NOP	
L_GCODE_Set_Motion_Mode337:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode339
NOP	
J	L_GCODE_Set_Motion_Mode98
NOP	
L_GCODE_Set_Motion_Mode339:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode341
NOP	
J	L_GCODE_Set_Motion_Mode101
NOP	
L_GCODE_Set_Motion_Mode341:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode343
NOP	
J	L_GCODE_Set_Motion_Mode104
NOP	
L_GCODE_Set_Motion_Mode343:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode345
NOP	
J	L_GCODE_Set_Motion_Mode105
NOP	
L_GCODE_Set_Motion_Mode345:
L_GCODE_Set_Motion_Mode95:
;GCODE.c,187 :: 		}
L_end_Set_Motion_Mode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
_M_Instruction:
;GCODE.c,192 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,193 :: 		gc.program_flow = flow;
SB	R25, Offset(_gc+6)(GP)
;GCODE.c,194 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,195 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,197 :: 		while(DMA_Busy(1));
L_M_Instruction111:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__M_Instruction348
NOP	
J	L_M_Instruction112
NOP	
L__M_Instruction348:
J	L_M_Instruction111
NOP	
L_M_Instruction112:
;GCODE.c,198 :: 		dma_printf("gc.program_flow:= %d\n",flow);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;GCODE.c,200 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_M_Modal_Commands:
;GCODE.c,202 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,204 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands113
NOP	
;GCODE.c,205 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands115:
L_GCODE_Set_M_Modal_Commands116:
L_GCODE_Set_M_Modal_Commands117:
L_GCODE_Set_M_Modal_Commands118:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands114
NOP	
;GCODE.c,206 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands119:
L_GCODE_Set_M_Modal_Commands120:
L_GCODE_Set_M_Modal_Commands121:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands114
NOP	
;GCODE.c,207 :: 		}
L_GCODE_Set_M_Modal_Commands113:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands351
NOP	
J	L_GCODE_Set_M_Modal_Commands115
NOP	
L_GCODE_Set_M_Modal_Commands351:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands353
NOP	
J	L_GCODE_Set_M_Modal_Commands116
NOP	
L_GCODE_Set_M_Modal_Commands353:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands355
NOP	
J	L_GCODE_Set_M_Modal_Commands117
NOP	
L_GCODE_Set_M_Modal_Commands355:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands357
NOP	
J	L_GCODE_Set_M_Modal_Commands118
NOP	
L_GCODE_Set_M_Modal_Commands357:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands359
NOP	
J	L_GCODE_Set_M_Modal_Commands119
NOP	
L_GCODE_Set_M_Modal_Commands359:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands361
NOP	
J	L_GCODE_Set_M_Modal_Commands120
NOP	
L_GCODE_Set_M_Modal_Commands361:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands363
NOP	
J	L_GCODE_Set_M_Modal_Commands121
NOP	
L_GCODE_Set_M_Modal_Commands363:
L_GCODE_Set_M_Modal_Commands114:
;GCODE.c,208 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,211 :: 		static char Set_M_Commands(int flow){
;GCODE.c,213 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands122
NOP	
;GCODE.c,214 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands124:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,215 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands125:
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,216 :: 		case 2:
L_GCODE_Set_M_Commands126:
;GCODE.c,217 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands127:
ORI	R2, R0, 2
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,218 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands128:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,219 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands129:
ORI	R2, R0, 255
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,220 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands130:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,224 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands131:
ORI	R2, R0, 1
SB	R2, Offset(_gc+8)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,225 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands132:
SB	R0, Offset(_gc+8)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,226 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands133:
ORI	R2, R0, 3
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_M_Commands123
NOP	
;GCODE.c,227 :: 		}
L_GCODE_Set_M_Commands122:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands366
NOP	
J	L_GCODE_Set_M_Commands124
NOP	
L_GCODE_Set_M_Commands366:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands368
NOP	
J	L_GCODE_Set_M_Commands125
NOP	
L_GCODE_Set_M_Commands368:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands370
NOP	
J	L_GCODE_Set_M_Commands126
NOP	
L_GCODE_Set_M_Commands370:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands372
NOP	
J	L_GCODE_Set_M_Commands127
NOP	
L_GCODE_Set_M_Commands372:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands374
NOP	
J	L_GCODE_Set_M_Commands128
NOP	
L_GCODE_Set_M_Commands374:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands376
NOP	
J	L_GCODE_Set_M_Commands129
NOP	
L_GCODE_Set_M_Commands376:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands378
NOP	
J	L_GCODE_Set_M_Commands130
NOP	
L_GCODE_Set_M_Commands378:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands380
NOP	
J	L_GCODE_Set_M_Commands131
NOP	
L_GCODE_Set_M_Commands380:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands382
NOP	
J	L_GCODE_Set_M_Commands132
NOP	
L_GCODE_Set_M_Commands382:
J	L_GCODE_Set_M_Commands133
NOP	
L_GCODE_Set_M_Commands123:
;GCODE.c,228 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,231 :: 		char Check_group_multiple_violations(){
;GCODE.c,232 :: 		if (group_number) {
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations385
NOP	
J	L_Check_group_multiple_violations134
NOP	
L__Check_group_multiple_violations385:
;GCODE.c,233 :: 		if ( bit_istrue(modal_group_words,bit(group_number)) ) {
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations135
NOP	
L__Check_group_multiple_violations387:
;GCODE.c,234 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,235 :: 		} else {
J	L_Check_group_multiple_violations136
NOP	
L_Check_group_multiple_violations135:
;GCODE.c,236 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(_modal_group_words+0)(GP)
;GCODE.c,237 :: 		}
L_Check_group_multiple_violations136:
;GCODE.c,238 :: 		group_number = MODAL_GROUP_NONE; // Reset for next command.
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,239 :: 		}
L_Check_group_multiple_violations134:
;GCODE.c,243 :: 		if (gc.status_code)
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L__Check_group_multiple_violations389
NOP	
J	L_Check_group_multiple_violations137
NOP	
L__Check_group_multiple_violations389:
;GCODE.c,244 :: 		return gc.status_code;
LBU	R2, Offset(_gc+1)(GP)
J	L_end_Check_group_multiple_violations
NOP	
L_Check_group_multiple_violations137:
;GCODE.c,246 :: 		return gc.status_code;
LBU	R2, Offset(_gc+1)(GP)
;GCODE.c,247 :: 		}
L_end_Check_group_multiple_violations:
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,250 :: 		void Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;GCODE.c,254 :: 		switch(c[0]){
MOVZ	R4, R25, R0
J	L_Instruction_Values138
NOP	
;GCODE.c,255 :: 		case 'X':
L_Instruction_Values140:
;GCODE.c,256 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,257 :: 		gc.next_position[X] = XYZ_Val;
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,258 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,259 :: 		case 'Y':
L_Instruction_Values141:
;GCODE.c,260 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,261 :: 		gc.next_position[Y] = XYZ_Val;
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,262 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,263 :: 		case 'Z':
L_Instruction_Values142:
;GCODE.c,264 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,265 :: 		gc.next_position[Z] = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,266 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,267 :: 		case 'A':
L_Instruction_Values143:
;GCODE.c,268 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,269 :: 		gc.next_position[A] = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,270 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,271 :: 		case 'E':
L_Instruction_Values144:
;GCODE.c,272 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,273 :: 		gc.next_position[B] = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,274 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,275 :: 		case 'R':
L_Instruction_Values145:
;GCODE.c,276 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,277 :: 		gc.R = XYZ_Val;
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,278 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,279 :: 		case 'I':
L_Instruction_Values146:
;GCODE.c,280 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,281 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+120)(GP)
;GCODE.c,282 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,283 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+124)(GP)
;GCODE.c,284 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,285 :: 		case 'J':
L_Instruction_Values147:
;GCODE.c,286 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,287 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+128)(GP)
;GCODE.c,288 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,289 :: 		case 'F':
L_Instruction_Values148:
;GCODE.c,290 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 16(SP)
;GCODE.c,291 :: 		gc.frequency = F_Val;
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,292 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,293 :: 		case 'S':
L_Instruction_Values149:
;GCODE.c,294 :: 		S_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,296 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,297 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_Instruction_Values150:
ORI	R2, R0, 3
SB	R2, Offset(_gc+1)(GP)
;GCODE.c,298 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,299 :: 		}
L_Instruction_Values138:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values392
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values392:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values394
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values394:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values396
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values396:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values398
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values398:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values400
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values400:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values402
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values402:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values404
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values404:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values406
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values406:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values408
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values408:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values410
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values410:
J	L_Instruction_Values150
NOP	
L_Instruction_Values139:
;GCODE.c,301 :: 		while(DMA_Busy(1));
L_Instruction_Values151:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__Instruction_Values412
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values412:
J	L_Instruction_Values151
NOP	
L_Instruction_Values152:
;GCODE.c,302 :: 		if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values414
NOP	
J	L__Instruction_Values178
NOP	
L__Instruction_Values414:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values416
NOP	
J	L__Instruction_Values177
NOP	
L__Instruction_Values416:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values418
NOP	
J	L__Instruction_Values176
NOP	
L__Instruction_Values418:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values420
NOP	
J	L__Instruction_Values175
NOP	
L__Instruction_Values420:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values422
NOP	
J	L__Instruction_Values174
NOP	
L__Instruction_Values422:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values424
NOP	
J	L__Instruction_Values173
NOP	
L__Instruction_Values424:
J	L_Instruction_Values155
NOP	
L__Instruction_Values178:
L__Instruction_Values177:
L__Instruction_Values176:
L__Instruction_Values175:
L__Instruction_Values174:
L__Instruction_Values173:
;GCODE.c,303 :: 		dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
LW	R2, 12(SP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
SB	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R26, 4(SP)
J	L_Instruction_Values156
NOP	
L_Instruction_Values155:
;GCODE.c,304 :: 		else if(c[0] == 'F')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BEQ	R3, R2, L__Instruction_Values425
NOP	
J	L_Instruction_Values157
NOP	
L__Instruction_Values425:
;GCODE.c,305 :: 		dma_printf("\t%c\t%d\n",c[0],F_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 28
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 28
LH	R2, 16(SP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SB	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R26, 4(SP)
J	L_Instruction_Values158
NOP	
L_Instruction_Values157:
;GCODE.c,306 :: 		else if(c[0] == 'S')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BEQ	R3, R2, L__Instruction_Values426
NOP	
J	L_Instruction_Values159
NOP	
L__Instruction_Values426:
;GCODE.c,307 :: 		dma_printf("\t%c\t%d\n",c[0],S_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 36
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr5_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 36
LH	R2, 18(SP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SB	R4, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LW	R26, 4(SP)
L_Instruction_Values159:
L_Instruction_Values158:
L_Instruction_Values156:
;GCODE.c,309 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _Instruction_Values
