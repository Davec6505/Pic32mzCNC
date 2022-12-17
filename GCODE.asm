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
;GCODE.c,25 :: 		inverse_feed_rate = 0;
MOVZ	R2, R0, R0
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
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters163
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters163:
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,44 :: 		gc.motion_mode = mode;
SH	R25, Offset(_gc+14)(GP)
;GCODE.c,45 :: 		Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
;GCODE.c,46 :: 		Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
;GCODE.c,47 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,50 :: 		static void Set_Modal_Groups(int mode){
;GCODE.c,51 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,52 :: 		case 4: case 10: case 28: case 30: case 53: case 92: group_number = MODAL_GROUP_0; break;
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
ORI	R2, R0, 1
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,53 :: 		case 0: case 1: case 2: case 3: case 80: group_number = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
ORI	R2, R0, 2
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,54 :: 		case 17: case 18: case 19: group_number = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
L_GCODE_Set_Modal_Groups17:
ORI	R2, R0, 3
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,55 :: 		case 90: case 91: group_number = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 4
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,56 :: 		case 93: case 94: group_number = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 6
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,57 :: 		case 20: case 21: group_number = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 7
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,58 :: 		case 54: case 55: case 56: case 57: case 58: case 59: group_number = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
L_GCODE_Set_Modal_Groups26:
L_GCODE_Set_Modal_Groups27:
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
ORI	R2, R0, 9
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,59 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups168
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups168:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups170
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups170:
SEH	R3, R25
ORI	R2, R0, 28
BNE	R3, R2, L_GCODE_Set_Modal_Groups172
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups172:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_Modal_Groups174
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups174:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups176
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups176:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups178
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups178:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups180
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups180:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups182
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups182:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups184
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups184:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups186
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups186:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups188
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups188:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups190
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups190:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups192
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups192:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups194
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups194:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups196
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups196:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups198
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups198:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups200
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups200:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups208:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups210
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups210:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups218:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,60 :: 		}
L_end_Set_Modal_Groups:
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,63 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,65 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode30
NOP	
;GCODE.c,66 :: 		case 0: gc.motion_mode = MOTION_MODE_SEEK; break;
L_GCODE_Set_Motion_Mode32:
SH	R0, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,67 :: 		case 1: gc.motion_mode = MOTION_MODE_LINEAR; break;
L_GCODE_Set_Motion_Mode33:
ORI	R2, R0, 1
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,68 :: 		case 2: gc.motion_mode = MOTION_MODE_CW_ARC; break;
L_GCODE_Set_Motion_Mode34:
ORI	R2, R0, 2
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,69 :: 		case 3: gc.motion_mode = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 3
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,70 :: 		case 4: non_modal_action = NON_MODAL_DWELL; break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,71 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,72 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode38:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,73 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode39:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,74 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,75 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode41:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,76 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode42:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,77 :: 		case 28: case 30:
L_GCODE_Set_Motion_Mode43:
L_GCODE_Set_Motion_Mode44:
;GCODE.c,78 :: 		int_value = floor(10*mode); // Multiply by 10 to pick up Gxx.1
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
;GCODE.c,79 :: 		switch(int_value) {
J	L_GCODE_Set_Motion_Mode45
NOP	
;GCODE.c,80 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode47:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode46
NOP	
;GCODE.c,81 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode48:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode46
NOP	
;GCODE.c,82 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode49:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode46
NOP	
;GCODE.c,83 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode50:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode46
NOP	
;GCODE.c,84 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_GCODE_Set_Motion_Mode51:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,85 :: 		}
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode45:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode221
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode221:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode223
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode223:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode225
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode225:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode227
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode227:
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode46:
;GCODE.c,86 :: 		break;
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,87 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 1
SB	R2, Offset(_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,88 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode53:
L_GCODE_Set_Motion_Mode54:
L_GCODE_Set_Motion_Mode55:
L_GCODE_Set_Motion_Mode56:
L_GCODE_Set_Motion_Mode57:
L_GCODE_Set_Motion_Mode58:
;GCODE.c,89 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+11)(GP)
;GCODE.c,90 :: 		break;
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,91 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 4
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,92 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,93 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode61:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,94 :: 		case 92:
L_GCODE_Set_Motion_Mode62:
;GCODE.c,95 :: 		int_value = floor(10*mode); // Multiply by 10 to pick up G92.1
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
;GCODE.c,96 :: 		switch(int_value) {
J	L_GCODE_Set_Motion_Mode63
NOP	
;GCODE.c,97 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode65:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode64
NOP	
;GCODE.c,98 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode66:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode64
NOP	
;GCODE.c,99 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_GCODE_Set_Motion_Mode67:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,100 :: 		}
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode63:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode229
NOP	
J	L_GCODE_Set_Motion_Mode65
NOP	
L_GCODE_Set_Motion_Mode229:
LH	R3, Offset(_int_value+0)(GP)
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode231
NOP	
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode231:
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode64:
;GCODE.c,101 :: 		break;
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,102 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode68:
ORI	R2, R0, 1
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,103 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode69:
SB	R0, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,104 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode70:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,105 :: 		}
L_GCODE_Set_Motion_Mode30:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode233
NOP	
J	L_GCODE_Set_Motion_Mode32
NOP	
L_GCODE_Set_Motion_Mode233:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode235
NOP	
J	L_GCODE_Set_Motion_Mode33
NOP	
L_GCODE_Set_Motion_Mode235:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode237
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode237:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode239
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode239:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode241
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode241:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode243
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode243:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode245
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode245:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode247
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode247:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode249
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode249:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode251
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode251:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode253
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode253:
SEH	R3, R25
ORI	R2, R0, 28
BNE	R3, R2, L_GCODE_Set_Motion_Mode255
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode255:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_Motion_Mode257
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode257:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode267:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode68
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode69
NOP	
L_GCODE_Set_Motion_Mode283:
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode31:
;GCODE.c,111 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode152
NOP	
L_GCODE_Set_Motion_Mode284:
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode151
NOP	
L_GCODE_Set_Motion_Mode285:
J	L_GCODE_Set_Motion_Mode73
NOP	
L_GCODE_Set_Motion_Mode152:
L_GCODE_Set_Motion_Mode151:
;GCODE.c,114 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode74
NOP	
L_GCODE_Set_Motion_Mode287:
;GCODE.c,115 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode154
NOP	
L_GCODE_Set_Motion_Mode288:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode153
NOP	
L_GCODE_Set_Motion_Mode290:
L_GCODE_Set_Motion_Mode149:
;GCODE.c,116 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,115 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode154:
L_GCODE_Set_Motion_Mode153:
;GCODE.c,118 :: 		}
L_GCODE_Set_Motion_Mode74:
;GCODE.c,120 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode156
NOP	
L_GCODE_Set_Motion_Mode292:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode79
NOP	
L_GCODE_Set_Motion_Mode294:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode79
NOP	
L_GCODE_Set_Motion_Mode296:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode78
NOP	
L_GCODE_Set_Motion_Mode79:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode78:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode155
NOP	
L_GCODE_Set_Motion_Mode297:
L_GCODE_Set_Motion_Mode148:
;GCODE.c,121 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,120 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode156:
L_GCODE_Set_Motion_Mode155:
;GCODE.c,124 :: 		if (gc.status_code) { return(gc.status_code); }
LH	R2, Offset(_gc+12)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode83
NOP	
L_GCODE_Set_Motion_Mode299:
LH	R2, Offset(_gc+12)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode83:
;GCODE.c,129 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GCODE_Set_Motion_Mode84:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L_GCODE_Set_Motion_Mode300
NOP	
J	L_GCODE_Set_Motion_Mode85
NOP	
L_GCODE_Set_Motion_Mode300:
;GCODE.c,130 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode87
NOP	
L_GCODE_Set_Motion_Mode302:
;GCODE.c,131 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(_absolute_override+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode88
NOP	
L_GCODE_Set_Motion_Mode303:
;GCODE.c,132 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode89
NOP	
L_GCODE_Set_Motion_Mode305:
;GCODE.c,133 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;GCODE.c,134 :: 		} else {
J	L_GCODE_Set_Motion_Mode90
NOP	
L_GCODE_Set_Motion_Mode89:
;GCODE.c,135 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;GCODE.c,136 :: 		}
L_GCODE_Set_Motion_Mode90:
;GCODE.c,137 :: 		}
L_GCODE_Set_Motion_Mode88:
;GCODE.c,138 :: 		} else {
J	L_GCODE_Set_Motion_Mode91
NOP	
L_GCODE_Set_Motion_Mode87:
;GCODE.c,139 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;GCODE.c,140 :: 		}
L_GCODE_Set_Motion_Mode91:
;GCODE.c,129 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,141 :: 		}
; i end address is: 20 (R5)
J	L_GCODE_Set_Motion_Mode84
NOP	
L_GCODE_Set_Motion_Mode85:
;GCODE.c,142 :: 		}
L_GCODE_Set_Motion_Mode73:
;GCODE.c,143 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,144 :: 		}
;GCODE.c,143 :: 		return gc.status_code;
;GCODE.c,144 :: 		}
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
;GCODE.c,149 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,150 :: 		gc.program_flow = flow;
SB	R25, Offset(_gc+4)(GP)
;GCODE.c,151 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,152 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,157 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_M_Modal_Commands:
;GCODE.c,159 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,161 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands92
NOP	
;GCODE.c,162 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands94:
L_GCODE_Set_M_Modal_Commands95:
L_GCODE_Set_M_Modal_Commands96:
L_GCODE_Set_M_Modal_Commands97:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands93
NOP	
;GCODE.c,163 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands98:
L_GCODE_Set_M_Modal_Commands99:
L_GCODE_Set_M_Modal_Commands100:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands93
NOP	
;GCODE.c,164 :: 		}
L_GCODE_Set_M_Modal_Commands92:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands309
NOP	
J	L_GCODE_Set_M_Modal_Commands94
NOP	
L_GCODE_Set_M_Modal_Commands309:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands311
NOP	
J	L_GCODE_Set_M_Modal_Commands95
NOP	
L_GCODE_Set_M_Modal_Commands311:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands313
NOP	
J	L_GCODE_Set_M_Modal_Commands96
NOP	
L_GCODE_Set_M_Modal_Commands313:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands315
NOP	
J	L_GCODE_Set_M_Modal_Commands97
NOP	
L_GCODE_Set_M_Modal_Commands315:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands317
NOP	
J	L_GCODE_Set_M_Modal_Commands98
NOP	
L_GCODE_Set_M_Modal_Commands317:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands319
NOP	
J	L_GCODE_Set_M_Modal_Commands99
NOP	
L_GCODE_Set_M_Modal_Commands319:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands321
NOP	
J	L_GCODE_Set_M_Modal_Commands100
NOP	
L_GCODE_Set_M_Modal_Commands321:
L_GCODE_Set_M_Modal_Commands93:
;GCODE.c,165 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,168 :: 		static int Set_M_Commands(int flow){
;GCODE.c,170 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands101
NOP	
;GCODE.c,171 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands103:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,172 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands104:
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,173 :: 		case 2:
L_GCODE_Set_M_Commands105:
;GCODE.c,174 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands106:
ORI	R2, R0, 2
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,175 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands107:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,176 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands108:
ORI	R2, R0, 255
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,177 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands109:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,181 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands110:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,182 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands111:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,183 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands112:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
J	L_GCODE_Set_M_Commands102
NOP	
;GCODE.c,184 :: 		}
L_GCODE_Set_M_Commands101:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands324
NOP	
J	L_GCODE_Set_M_Commands103
NOP	
L_GCODE_Set_M_Commands324:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands326
NOP	
J	L_GCODE_Set_M_Commands104
NOP	
L_GCODE_Set_M_Commands326:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands328
NOP	
J	L_GCODE_Set_M_Commands105
NOP	
L_GCODE_Set_M_Commands328:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands330
NOP	
J	L_GCODE_Set_M_Commands106
NOP	
L_GCODE_Set_M_Commands330:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands332
NOP	
J	L_GCODE_Set_M_Commands107
NOP	
L_GCODE_Set_M_Commands332:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands334
NOP	
J	L_GCODE_Set_M_Commands108
NOP	
L_GCODE_Set_M_Commands334:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands336
NOP	
J	L_GCODE_Set_M_Commands109
NOP	
L_GCODE_Set_M_Commands336:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands338
NOP	
J	L_GCODE_Set_M_Commands110
NOP	
L_GCODE_Set_M_Commands338:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands340
NOP	
J	L_GCODE_Set_M_Commands111
NOP	
L_GCODE_Set_M_Commands340:
J	L_GCODE_Set_M_Commands112
NOP	
L_GCODE_Set_M_Commands102:
;GCODE.c,185 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,186 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,189 :: 		int Check_group_multiple_violations(){
;GCODE.c,190 :: 		if (group_number) {
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations343
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations343:
;GCODE.c,191 :: 		if ( bit_istrue(modal_group_words,bit(group_number)) ) {
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations345
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations345:
;GCODE.c,192 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,193 :: 		} else {
J	L_Check_group_multiple_violations115
NOP	
L_Check_group_multiple_violations114:
;GCODE.c,194 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(_modal_group_words+0)(GP)
;GCODE.c,195 :: 		}
L_Check_group_multiple_violations115:
;GCODE.c,196 :: 		group_number = MODAL_GROUP_NONE; // Reset for next command.
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,197 :: 		}
L_Check_group_multiple_violations113:
;GCODE.c,201 :: 		if (gc.status_code)
LH	R2, Offset(_gc+12)(GP)
BNE	R2, R0, L__Check_group_multiple_violations347
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations347:
;GCODE.c,202 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
J	L_end_Check_group_multiple_violations
NOP	
L_Check_group_multiple_violations116:
;GCODE.c,204 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,205 :: 		}
L_end_Check_group_multiple_violations:
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,208 :: 		int Instruction_Values(char *c,void *any){
;GCODE.c,212 :: 		switch(c[0]){
MOVZ	R4, R25, R0
J	L_Instruction_Values117
NOP	
;GCODE.c,213 :: 		case 'X':
L_Instruction_Values119:
;GCODE.c,214 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,215 :: 		gc.next_position[X] = XYZ_Val;
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,216 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,217 :: 		case 'Y':
L_Instruction_Values120:
;GCODE.c,218 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,219 :: 		gc.next_position[Y] = XYZ_Val;
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,220 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,221 :: 		case 'Z':
L_Instruction_Values121:
;GCODE.c,222 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,223 :: 		gc.next_position[Z] = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,224 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,225 :: 		case 'A':
L_Instruction_Values122:
;GCODE.c,226 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,227 :: 		gc.next_position[A] = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,228 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,229 :: 		case 'E':
L_Instruction_Values123:
;GCODE.c,230 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,231 :: 		gc.next_position[B] = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,232 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,233 :: 		case 'R':
L_Instruction_Values124:
;GCODE.c,234 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,235 :: 		gc.R = XYZ_Val;
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,236 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,237 :: 		case 'I':
L_Instruction_Values125:
;GCODE.c,238 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,239 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+120)(GP)
;GCODE.c,240 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,241 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+124)(GP)
;GCODE.c,242 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,243 :: 		case 'J':
L_Instruction_Values126:
;GCODE.c,244 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,245 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+128)(GP)
;GCODE.c,246 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,247 :: 		case 'F':
L_Instruction_Values127:
;GCODE.c,248 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,249 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values349
NOP	
J	L_Instruction_Values128
NOP	
L__Instruction_Values349:
; F_Val end address is: 12 (R3)
;GCODE.c,250 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,251 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,252 :: 		}
L_Instruction_Values128:
;GCODE.c,253 :: 		gc.frequency = F_Val;
; F_Val start address is: 12 (R3)
SH	R3, Offset(_gc+16)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,254 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,255 :: 		case 'S':
L_Instruction_Values129:
;GCODE.c,258 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,259 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_Instruction_Values130:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,260 :: 		break;
J	L_Instruction_Values118
NOP	
;GCODE.c,261 :: 		}
L_Instruction_Values117:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values351
NOP	
J	L_Instruction_Values119
NOP	
L__Instruction_Values351:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values353
NOP	
J	L_Instruction_Values120
NOP	
L__Instruction_Values353:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values355
NOP	
J	L_Instruction_Values121
NOP	
L__Instruction_Values355:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values357
NOP	
J	L_Instruction_Values122
NOP	
L__Instruction_Values357:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values359
NOP	
J	L_Instruction_Values123
NOP	
L__Instruction_Values359:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values361
NOP	
J	L_Instruction_Values124
NOP	
L__Instruction_Values361:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values363
NOP	
J	L_Instruction_Values125
NOP	
L__Instruction_Values363:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values365
NOP	
J	L_Instruction_Values126
NOP	
L__Instruction_Values365:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values367
NOP	
J	L_Instruction_Values127
NOP	
L__Instruction_Values367:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values369
NOP	
J	L_Instruction_Values129
NOP	
L__Instruction_Values369:
J	L_Instruction_Values130
NOP	
L_Instruction_Values118:
;GCODE.c,271 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,272 :: 		}
L_end_Instruction_Values:
JR	RA
NOP	
; end of _Instruction_Values
_Movement_Condition:
;GCODE.c,278 :: 		void Movement_Condition(int motion_mode){
;GCODE.c,285 :: 		switch (gc.motion_mode) {
J	L_Movement_Condition131
NOP	
;GCODE.c,286 :: 		case MOTION_MODE_CANCEL:
L_Movement_Condition133:
;GCODE.c,287 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LH	R2, Offset(_axis_words+0)(GP)
BNE	R2, R0, L__Movement_Condition372
NOP	
J	L_Movement_Condition134
NOP	
L__Movement_Condition372:
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
L_Movement_Condition134:
;GCODE.c,288 :: 		break;
J	L_Movement_Condition132
NOP	
;GCODE.c,289 :: 		case MOTION_MODE_SEEK:
L_Movement_Condition135:
;GCODE.c,290 :: 		if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L__Movement_Condition373
NOP	
J	L_Movement_Condition136
NOP	
L__Movement_Condition373:
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
J	L_Movement_Condition137
NOP	
L_Movement_Condition136:
;GCODE.c,294 :: 		}
L_Movement_Condition137:
;GCODE.c,295 :: 		break;
J	L_Movement_Condition132
NOP	
;GCODE.c,296 :: 		case MOTION_MODE_LINEAR:
L_Movement_Condition138:
;GCODE.c,301 :: 		if (!axis_words) { FAIL(STATUS_INVALID_STATEMENT);}
LH	R2, Offset(_axis_words+0)(GP)
BEQ	R2, R0, L__Movement_Condition374
NOP	
J	L_Movement_Condition139
NOP	
L__Movement_Condition374:
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
J	L_Movement_Condition140
NOP	
L_Movement_Condition139:
;GCODE.c,305 :: 		}
L_Movement_Condition140:
;GCODE.c,306 :: 		break;
J	L_Movement_Condition132
NOP	
;GCODE.c,307 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Movement_Condition141:
L_Movement_Condition142:
;GCODE.c,310 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+10)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_axis_words+0)(GP)
AND	R2, R2, R3
SH	R2, Offset(_axis_words+0)(GP)
;GCODE.c,311 :: 		( !gc.r)/*&& gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 ) */){
BNE	R2, R0, L__Movement_Condition376
NOP	
J	L__Movement_Condition159
NOP	
L__Movement_Condition376:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Movement_Condition378
NOP	
J	L__Movement_Condition158
NOP	
L__Movement_Condition378:
J	L_Movement_Condition145
NOP	
L__Movement_Condition159:
L__Movement_Condition158:
;GCODE.c,312 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,313 :: 		} else {
J	L_Movement_Condition146
NOP	
L_Movement_Condition145:
;GCODE.c,314 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+120)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Movement_Condition379
NOP	
J	L_Movement_Condition147
NOP	
L__Movement_Condition379:
;GCODE.c,316 :: 		asm{nop;}
NOP	
;GCODE.c,317 :: 		}
L_Movement_Condition147:
;GCODE.c,318 :: 		}
L_Movement_Condition146:
;GCODE.c,319 :: 		break;
J	L_Movement_Condition132
NOP	
;GCODE.c,320 :: 		}
L_Movement_Condition131:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Movement_Condition381
NOP	
J	L_Movement_Condition133
NOP	
L__Movement_Condition381:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L__Movement_Condition383
NOP	
J	L_Movement_Condition135
NOP	
L__Movement_Condition383:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Movement_Condition385
NOP	
J	L_Movement_Condition138
NOP	
L__Movement_Condition385:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Movement_Condition387
NOP	
J	L_Movement_Condition141
NOP	
L__Movement_Condition387:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Movement_Condition389
NOP	
J	L_Movement_Condition142
NOP	
L__Movement_Condition389:
L_Movement_Condition132:
;GCODE.c,322 :: 		}
L_end_Movement_Condition:
JR	RA
NOP	
; end of _Movement_Condition
