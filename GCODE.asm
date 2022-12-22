_G_Initialise:
;GCODE.c,18 :: 		void G_Initialise(){
;GCODE.c,19 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,20 :: 		non_modal_action  = 0;
SH	R0, Offset(_non_modal_action+0)(GP)
;GCODE.c,21 :: 		modal_group_words = 0;
SH	R0, Offset(_modal_group_words+0)(GP)
;GCODE.c,22 :: 		axis_words        = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,23 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,24 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,25 :: 		inverse_feed_rate = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,26 :: 		absolute_override = 0;
SB	R0, Offset(_absolute_override+0)(GP)
;GCODE.c,27 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_Axisword:
;GCODE.c,29 :: 		int Get_Axisword(){
;GCODE.c,30 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,31 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,33 :: 		int Rst_Axisword(){
;GCODE.c,34 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,35 :: 		return (int)axis_words;
MOVZ	R2, R0, R0
;GCODE.c,36 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
GCODE_To_Millimeters:
;GCODE.c,38 :: 		static float To_Millimeters(float value){
;GCODE.c,39 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters153
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters153:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T6 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T6 end address is: 0 (R0)
J	L_GCODE_To_Millimeters1
NOP	
L_GCODE_To_Millimeters0:
; ?FLOC__GCODE_To_Millimeters?T6 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T6 end address is: 0 (R0)
L_GCODE_To_Millimeters1:
; ?FLOC__GCODE_To_Millimeters?T6 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T6 end address is: 0 (R0)
;GCODE.c,40 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,43 :: 		static void Select_Plane(long x,long y,long z){
;GCODE.c,44 :: 		gc.position[X] = x/settings.steps_per_mm[X];
MTC1	R25, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+0)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,45 :: 		gc.position[Y] = y/settings.steps_per_mm[Y];
MTC1	R26, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+4)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,46 :: 		gc.position[Z] = z/settings.steps_per_mm[Z];
MTC1	R27, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+8)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,47 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
_G_Mode:
;GCODE.c,50 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,51 :: 		gc.inches_mode = 0;//temp for debugging
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,52 :: 		Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
;GCODE.c,53 :: 		return Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
;GCODE.c,54 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,57 :: 		static void Set_Modal_Groups(int mode){
;GCODE.c,58 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,59 :: 		case 4: case 10: case 28: case 30: case 53: case 92: group_number = MODAL_GROUP_0; break;
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
;GCODE.c,60 :: 		case 0: case 1: case 2: case 3: case 80: group_number = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
ORI	R2, R0, 2
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,61 :: 		case 17: case 18: case 19: group_number = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
L_GCODE_Set_Modal_Groups17:
ORI	R2, R0, 3
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,62 :: 		case 90: case 91: group_number = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 4
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,63 :: 		case 93: case 94: group_number = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 6
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,64 :: 		case 20: case 21: group_number = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 7
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,65 :: 		case 54: case 55: case 56: case 57: case 58: case 59: group_number = MODAL_GROUP_12; break;
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
;GCODE.c,66 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups158
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups158:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups160
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups160:
SEH	R3, R25
ORI	R2, R0, 28
BNE	R3, R2, L_GCODE_Set_Modal_Groups162
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups162:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_Modal_Groups164
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups164:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups166
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups166:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups168
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups168:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups170
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups170:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups172
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups172:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups174
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups174:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups176
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups176:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups178
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups178:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups180
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups180:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups182
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups182:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups184
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups184:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups186
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups186:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups188
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups188:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups190
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups190:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups192
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups192:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups194
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups194:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups196
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups196:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups198
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups198:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups200
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups200:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups208:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,67 :: 		}
L_end_Set_Modal_Groups:
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,70 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,72 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode30
NOP	
;GCODE.c,73 :: 		case 0: gc.motion_mode = MOTION_MODE_SEEK; break;
L_GCODE_Set_Motion_Mode32:
SH	R0, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,74 :: 		case 1: gc.motion_mode = MOTION_MODE_LINEAR; break;
L_GCODE_Set_Motion_Mode33:
ORI	R2, R0, 1
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,75 :: 		case 2: gc.motion_mode = MOTION_MODE_CW_ARC; break;
L_GCODE_Set_Motion_Mode34:
ORI	R2, R0, 2
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,76 :: 		case 3: gc.motion_mode = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 3
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,77 :: 		case 4: non_modal_action = NON_MODAL_DWELL; break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,78 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,79 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode38:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,80 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode39:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,81 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,82 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode41:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,83 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode42:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,84 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,85 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode44:
L_GCODE_Set_Motion_Mode45:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
;GCODE.c,86 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+11)(GP)
;GCODE.c,87 :: 		break;
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,88 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode50:
ORI	R2, R0, 4
SH	R2, Offset(_gc+14)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,89 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode51:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,90 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode52:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,91 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,92 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,93 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,94 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode56:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,95 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,96 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,97 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,98 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,99 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
J	L_GCODE_Set_Motion_Mode31
NOP	
;GCODE.c,100 :: 		}
L_GCODE_Set_Motion_Mode30:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode211
NOP	
J	L_GCODE_Set_Motion_Mode32
NOP	
L_GCODE_Set_Motion_Mode211:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode213
NOP	
J	L_GCODE_Set_Motion_Mode33
NOP	
L_GCODE_Set_Motion_Mode213:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode215
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode215:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode217
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode217:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode219
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode219:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode221
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode221:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode223
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode223:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode225
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode225:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode227
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode227:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode229
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode229:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode231
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode231:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode233
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode233:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode235
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode235:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode237
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode237:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode239
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode239:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode241
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode241:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode243
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode243:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode245
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode245:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode247
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode247:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode249
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode249:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode251
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode251:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode253
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode253:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode255
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode255:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode257
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode257:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode267:
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode31:
;GCODE.c,106 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode268
NOP	
J	L_GCODE_Set_Motion_Mode137
NOP	
L_GCODE_Set_Motion_Mode268:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode136
NOP	
L_GCODE_Set_Motion_Mode269:
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode137:
L_GCODE_Set_Motion_Mode136:
;GCODE.c,108 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode65
NOP	
L_GCODE_Set_Motion_Mode271:
;GCODE.c,109 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode272
NOP	
J	L_GCODE_Set_Motion_Mode139
NOP	
L_GCODE_Set_Motion_Mode272:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode274
NOP	
J	L_GCODE_Set_Motion_Mode138
NOP	
L_GCODE_Set_Motion_Mode274:
L_GCODE_Set_Motion_Mode134:
;GCODE.c,110 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,109 :: 		if (inverse_feed_rate < 0 && gc.motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode139:
L_GCODE_Set_Motion_Mode138:
;GCODE.c,112 :: 		}
L_GCODE_Set_Motion_Mode65:
;GCODE.c,114 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode141
NOP	
L_GCODE_Set_Motion_Mode276:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode278:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode280:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode69
NOP	
L_GCODE_Set_Motion_Mode70:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode69:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode140
NOP	
L_GCODE_Set_Motion_Mode281:
L_GCODE_Set_Motion_Mode133:
;GCODE.c,115 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,114 :: 		if ( absolute_override && !(gc.motion_mode == MOTION_MODE_SEEK || gc.motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode141:
L_GCODE_Set_Motion_Mode140:
;GCODE.c,118 :: 		if (gc.status_code) { return(gc.status_code); }
LH	R2, Offset(_gc+12)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode74
NOP	
L_GCODE_Set_Motion_Mode283:
LH	R2, Offset(_gc+12)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode74:
;GCODE.c,120 :: 		}
L_GCODE_Set_Motion_Mode64:
;GCODE.c,121 :: 		return gc.motion_mode;
LH	R2, Offset(_gc+14)(GP)
;GCODE.c,122 :: 		}
;GCODE.c,121 :: 		return gc.motion_mode;
;GCODE.c,122 :: 		}
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
;GCODE.c,127 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,129 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,130 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,135 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_M_Modal_Commands:
;GCODE.c,137 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,139 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands75
NOP	
;GCODE.c,140 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands77:
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,141 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands81:
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,142 :: 		}
L_GCODE_Set_M_Modal_Commands75:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands287
NOP	
J	L_GCODE_Set_M_Modal_Commands77
NOP	
L_GCODE_Set_M_Modal_Commands287:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands289
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands289:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands291
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands291:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands293
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands293:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands295
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands295:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands297
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands297:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands299
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands299:
L_GCODE_Set_M_Modal_Commands76:
;GCODE.c,143 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,146 :: 		static int Set_M_Commands(int flow){
;GCODE.c,148 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands84
NOP	
;GCODE.c,149 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands86:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,150 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands87:
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,151 :: 		case 2:
L_GCODE_Set_M_Commands88:
;GCODE.c,152 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands89:
ORI	R2, R0, 2
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,153 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,154 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 255
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,155 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands92:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,159 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands93:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,160 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands94:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,161 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands95:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,162 :: 		}
L_GCODE_Set_M_Commands84:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands302
NOP	
J	L_GCODE_Set_M_Commands86
NOP	
L_GCODE_Set_M_Commands302:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands304
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands304:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands306
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands306:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands308
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands308:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands310
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands310:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands312
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands312:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands314
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands314:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands316
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands316:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands318
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands318:
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands85:
;GCODE.c,163 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,164 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Instruction_Values:
;GCODE.c,168 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,172 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values96
NOP	
;GCODE.c,173 :: 		case 'X':
L_Instruction_Values98:
;GCODE.c,175 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,176 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,177 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,178 :: 		case 'Y':
L_Instruction_Values99:
;GCODE.c,180 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,181 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,182 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,183 :: 		case 'Z':
L_Instruction_Values100:
;GCODE.c,185 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,186 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,187 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,188 :: 		case 'A':
L_Instruction_Values101:
;GCODE.c,190 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,191 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,192 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,193 :: 		case 'E':
L_Instruction_Values102:
;GCODE.c,195 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,196 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,197 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,198 :: 		case 'R':
L_Instruction_Values103:
;GCODE.c,200 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+132)(GP)
;GCODE.c,201 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,202 :: 		case 'I':
L_Instruction_Values104:
;GCODE.c,203 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,204 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+132)(GP)
;GCODE.c,205 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,206 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+136)(GP)
;GCODE.c,207 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,208 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,209 :: 		case 'J':
L_Instruction_Values105:
;GCODE.c,210 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,211 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+140)(GP)
;GCODE.c,212 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+124)(GP)
;GCODE.c,213 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,214 :: 		case 'K':
L_Instruction_Values106:
;GCODE.c,215 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,216 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+144)(GP)
;GCODE.c,217 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+128)(GP)
;GCODE.c,218 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,219 :: 		case 'F':
L_Instruction_Values107:
;GCODE.c,220 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,221 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values320
NOP	
J	L_Instruction_Values108
NOP	
L__Instruction_Values320:
;GCODE.c,222 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,223 :: 		}
L_Instruction_Values108:
;GCODE.c,230 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+16)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,231 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,232 :: 		case 'S':
L_Instruction_Values109:
;GCODE.c,235 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,241 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);
L_Instruction_Values110:
ORI	R2, R0, 3
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,242 :: 		break;
J	L_Instruction_Values97
NOP	
;GCODE.c,243 :: 		}
L_Instruction_Values96:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values322
NOP	
J	L_Instruction_Values98
NOP	
L__Instruction_Values322:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values324
NOP	
J	L_Instruction_Values99
NOP	
L__Instruction_Values324:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values326
NOP	
J	L_Instruction_Values100
NOP	
L__Instruction_Values326:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values328
NOP	
J	L_Instruction_Values101
NOP	
L__Instruction_Values328:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values330
NOP	
J	L_Instruction_Values102
NOP	
L__Instruction_Values330:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values332
NOP	
J	L_Instruction_Values103
NOP	
L__Instruction_Values332:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values334
NOP	
J	L_Instruction_Values104
NOP	
L__Instruction_Values334:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values336
NOP	
J	L_Instruction_Values105
NOP	
L__Instruction_Values336:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values338
NOP	
J	L_Instruction_Values106
NOP	
L__Instruction_Values338:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values340
NOP	
J	L_Instruction_Values107
NOP	
L__Instruction_Values340:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values342
NOP	
J	L_Instruction_Values109
NOP	
L__Instruction_Values342:
J	L_Instruction_Values110
NOP	
L_Instruction_Values97:
;GCODE.c,253 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,254 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
_Check_group_multiple_violations:
;GCODE.c,261 :: 		int Check_group_multiple_violations(){
;GCODE.c,263 :: 		if (group_number) {
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations345
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations345:
;GCODE.c,264 :: 		if ( bit_istrue(modal_group_words,bit(group_number)) ) {
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations347
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations347:
;GCODE.c,265 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,266 :: 		return gc.status_code;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,267 :: 		} else {
L_Check_group_multiple_violations112:
;GCODE.c,268 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(_modal_group_words+0)(GP)
;GCODE.c,270 :: 		group_number = MODAL_GROUP_NONE; // Reset for next command.
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,271 :: 		}
L_Check_group_multiple_violations111:
;GCODE.c,299 :: 		switch (gc.motion_mode) {
J	L_Check_group_multiple_violations114
NOP	
;GCODE.c,300 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations116:
;GCODE.c,301 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations349
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations349:
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
L_Check_group_multiple_violations117:
;GCODE.c,302 :: 		break;
J	L_Check_group_multiple_violations115
NOP	
;GCODE.c,303 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations118:
;GCODE.c,304 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations350
NOP	
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations350:
;GCODE.c,305 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,306 :: 		}else {
J	L_Check_group_multiple_violations120
NOP	
L_Check_group_multiple_violations119:
;GCODE.c,309 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_gc+12)(GP)
;GCODE.c,310 :: 		}
L_Check_group_multiple_violations120:
;GCODE.c,311 :: 		break;
J	L_Check_group_multiple_violations115
NOP	
;GCODE.c,312 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations121:
;GCODE.c,321 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations351
NOP	
J	L_Check_group_multiple_violations122
NOP	
L__Check_group_multiple_violations351:
;GCODE.c,322 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,323 :: 		}else {
J	L_Check_group_multiple_violations123
NOP	
L_Check_group_multiple_violations122:
;GCODE.c,325 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_gc+12)(GP)
;GCODE.c,326 :: 		}
L_Check_group_multiple_violations123:
;GCODE.c,327 :: 		break;
J	L_Check_group_multiple_violations115
NOP	
;GCODE.c,328 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations124:
L_Check_group_multiple_violations125:
;GCODE.c,331 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+10)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,332 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
BNE	R2, R0, L__Check_group_multiple_violations353
NOP	
J	L__Check_group_multiple_violations147
NOP	
L__Check_group_multiple_violations353:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations354
NOP	
J	L__Check_group_multiple_violations146
NOP	
L__Check_group_multiple_violations354:
LBU	R2, Offset(_gc+8)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+120)
ORI	R2, R2, lo_addr(_gc+120)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations355
NOP	
J	L__Check_group_multiple_violations145
NOP	
L__Check_group_multiple_violations355:
LBU	R2, Offset(_gc+9)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+120)
ORI	R2, R2, lo_addr(_gc+120)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations356
NOP	
J	L__Check_group_multiple_violations144
NOP	
L__Check_group_multiple_violations356:
J	L__Check_group_multiple_violations142
NOP	
L__Check_group_multiple_violations146:
L__Check_group_multiple_violations145:
L__Check_group_multiple_violations144:
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations142:
L__Check_group_multiple_violations147:
;GCODE.c,333 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,334 :: 		} else {
J	L_Check_group_multiple_violations131
NOP	
L_Check_group_multiple_violations130:
;GCODE.c,335 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+132)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations357
NOP	
J	L_Check_group_multiple_violations132
NOP	
L__Check_group_multiple_violations357:
;GCODE.c,337 :: 		asm{nop;}
NOP	
;GCODE.c,338 :: 		}
L_Check_group_multiple_violations132:
;GCODE.c,339 :: 		}
L_Check_group_multiple_violations131:
;GCODE.c,340 :: 		break;
J	L_Check_group_multiple_violations115
NOP	
;GCODE.c,341 :: 		}
L_Check_group_multiple_violations114:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations359
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations359:
LH	R2, Offset(_gc+14)(GP)
BNE	R2, R0, L__Check_group_multiple_violations361
NOP	
J	L_Check_group_multiple_violations118
NOP	
L__Check_group_multiple_violations361:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations363
NOP	
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations363:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations365
NOP	
J	L_Check_group_multiple_violations124
NOP	
L__Check_group_multiple_violations365:
LH	R3, Offset(_gc+14)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations367
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations367:
L_Check_group_multiple_violations115:
;GCODE.c,342 :: 		return gc.status_code;
LH	R2, Offset(_gc+12)(GP)
;GCODE.c,343 :: 		}
L_end_Check_group_multiple_violations:
JR	RA
NOP	
; end of _Check_group_multiple_violations
