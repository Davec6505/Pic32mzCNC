GCODE_To_Millimeters:
;GCODE.c,45 :: 		static float To_Millimeters(float value){
;GCODE.c,46 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters179
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters179:
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
;GCODE.c,47 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,50 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,51 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,52 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
_G_Initialise:
;GCODE.c,58 :: 		void G_Initialise(){
;GCODE.c,59 :: 		group_number         = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,60 :: 		axis_words           = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,61 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,62 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,63 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,64 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,65 :: 		gc.absolute_mode     = true;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,66 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Set_modalgroup:
;GCODE.c,70 :: 		void Set_modalgroup(int value){
;GCODE.c,71 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,72 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,75 :: 		int Get_modalgroup(){
;GCODE.c,76 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,77 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,79 :: 		int Rst_modalgroup(){
;GCODE.c,80 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,81 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,82 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_modalword:
;GCODE.c,87 :: 		void Set_modalword(int value){
;GCODE.c,88 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,89 :: 		}
L_end_Set_modalword:
JR	RA
NOP	
; end of _Set_modalword
_Get_modalword:
;GCODE.c,92 :: 		int Get_modalword(){
;GCODE.c,93 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,94 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,96 :: 		int Rst_modalword(){
;GCODE.c,97 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,98 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,99 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,102 :: 		int Get_Axisword(){
;GCODE.c,103 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,104 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,106 :: 		int Rst_Axisword(){
;GCODE.c,107 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,108 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,109 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,112 :: 		int Get_motionmode(){
;GCODE.c,113 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,114 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,116 :: 		int Rst_motionmode(){
;GCODE.c,117 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,118 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,119 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,123 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,124 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,125 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,126 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,127 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,131 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,133 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,134 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,139 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_Modal_Groups:
;GCODE.c,146 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,148 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,149 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,150 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,151 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,152 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,153 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,154 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,155 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,156 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups26:
L_GCODE_Set_Modal_Groups27:
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
L_GCODE_Set_Modal_Groups30:
L_GCODE_Set_Modal_Groups31:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,157 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups196
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups196:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups198
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups198:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups200
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups200:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups208:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups210
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups210:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups218:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups220
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups220:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups238:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups240
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups240:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups242
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups242:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups244
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups244:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups246
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups246:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups248
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups248:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups250
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups250:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,158 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,159 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,162 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,164 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,166 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,167 :: 		case 0: m_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, 8(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,168 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, 8(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,169 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, 8(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,170 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, 8(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,171 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,172 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,173 :: 		case 17: Select_Plane(xy);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,174 :: 		case 18: Select_Plane(xz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,175 :: 		case 19: Select_Plane(yz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,176 :: 		case 20: gc.inches_mode = 1;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,177 :: 		case 21: gc.inches_mode = 0;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,178 :: 		case 53: gc.absolute_override = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,179 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,180 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,181 :: 		return STATUS_OK;break;
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,182 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,183 :: 		case 90: gc.absolute_mode = true; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,184 :: 		case 91: gc.absolute_mode = false; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,185 :: 		case 93: gc.inverse_feed_rate_mode = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,186 :: 		case 94: gc.inverse_feed_rate_mode = false;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,187 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,188 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,189 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,190 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,191 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,192 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,193 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,194 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode253
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode253:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode255
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode255:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode257
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode257:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode267:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode297:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode299:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode301:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode303:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode305:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode307
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode307:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode309:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,199 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode163
NOP	
L_GCODE_Set_Motion_Mode310:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode162
NOP	
L_GCODE_Set_Motion_Mode311:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode163:
L_GCODE_Set_Motion_Mode162:
;GCODE.c,201 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode313:
;GCODE.c,202 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode165
NOP	
L_GCODE_Set_Motion_Mode314:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode316
NOP	
J	L_GCODE_Set_Motion_Mode164
NOP	
L_GCODE_Set_Motion_Mode316:
L_GCODE_Set_Motion_Mode160:
;GCODE.c,203 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,202 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode165:
L_GCODE_Set_Motion_Mode164:
;GCODE.c,205 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,207 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode318
NOP	
J	L_GCODE_Set_Motion_Mode167
NOP	
L_GCODE_Set_Motion_Mode318:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode320:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode322:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode323
NOP	
J	L_GCODE_Set_Motion_Mode166
NOP	
L_GCODE_Set_Motion_Mode323:
L_GCODE_Set_Motion_Mode159:
;GCODE.c,208 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,207 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode167:
L_GCODE_Set_Motion_Mode166:
;GCODE.c,211 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,218 :: 		return m_mode;
LH	R2, 8(SP)
;GCODE.c,219 :: 		}
;GCODE.c,218 :: 		return m_mode;
;GCODE.c,219 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,224 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,227 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,228 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,229 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,230 :: 		}
L_GCODE_Set_M_Modal_Commands76:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands326
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands326:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands328
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands328:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands330
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands330:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands332
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands332:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands334
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands334:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands336
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands336:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands338
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands338:
L_GCODE_Set_M_Modal_Commands77:
;GCODE.c,231 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,232 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,235 :: 		static int Set_M_Commands(int flow){
;GCODE.c,236 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,238 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,239 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands87:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,240 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands88:
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,241 :: 		case 2:
L_GCODE_Set_M_Commands89:
;GCODE.c,242 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,243 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,244 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,245 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands93:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,249 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,250 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,251 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands96:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,252 :: 		}
L_GCODE_Set_M_Commands85:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands341
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands341:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands343
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands343:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands345
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands345:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands347
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands347:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands349
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands349:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands351
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands351:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands353
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands353:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands355
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands355:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands357
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands357:
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands86:
;GCODE.c,253 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,254 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,262 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,264 :: 		int i = 0;
;GCODE.c,269 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations359
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations359:
;GCODE.c,270 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,271 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,272 :: 		}
L_Check_group_multiple_violations97:
;GCODE.c,274 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations360
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations360:
;GCODE.c,276 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations362
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations362:
;GCODE.c,277 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations99:
;GCODE.c,279 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,281 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,285 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations363
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations363:
;GCODE.c,288 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,290 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations364
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations364:
;GCODE.c,291 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations101:
;GCODE.c,301 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,302 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,310 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations365
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations365:
;GCODE.c,311 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,318 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations103
NOP	
;GCODE.c,319 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations105:
;GCODE.c,321 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations367
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations367:
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations106:
;GCODE.c,322 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,323 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations107:
;GCODE.c,324 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations368
NOP	
J	L_Check_group_multiple_violations108
NOP	
L__Check_group_multiple_violations368:
;GCODE.c,325 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,326 :: 		}else {
J	L_Check_group_multiple_violations109
NOP	
L_Check_group_multiple_violations108:
;GCODE.c,329 :: 		gc.frequency = settings.default_seek_rate;
LWC1	S0, Offset(_settings+20)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,330 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,331 :: 		}
L_Check_group_multiple_violations109:
;GCODE.c,332 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,333 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations110:
;GCODE.c,338 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations369
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations369:
;GCODE.c,339 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,340 :: 		}else {
J	L_Check_group_multiple_violations112
NOP	
L_Check_group_multiple_violations111:
;GCODE.c,342 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,343 :: 		}
L_Check_group_multiple_violations112:
;GCODE.c,344 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,345 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations113:
L_Check_group_multiple_violations114:
;GCODE.c,348 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+13)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,349 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations371
NOP	
J	L__Check_group_multiple_violations174
NOP	
L__Check_group_multiple_violations371:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations372
NOP	
J	L__Check_group_multiple_violations173
NOP	
L__Check_group_multiple_violations372:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations373
NOP	
J	L__Check_group_multiple_violations172
NOP	
L__Check_group_multiple_violations373:
LBU	R2, Offset(_gc+12)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations374
NOP	
J	L__Check_group_multiple_violations171
NOP	
L__Check_group_multiple_violations374:
J	L__Check_group_multiple_violations169
NOP	
L__Check_group_multiple_violations173:
L__Check_group_multiple_violations172:
L__Check_group_multiple_violations171:
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations169:
L__Check_group_multiple_violations174:
;GCODE.c,350 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,351 :: 		} else {
J	L_Check_group_multiple_violations120
NOP	
L_Check_group_multiple_violations119:
;GCODE.c,352 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+104)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations375
NOP	
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations375:
;GCODE.c,354 :: 		asm{nop;}
NOP	
;GCODE.c,355 :: 		}
L_Check_group_multiple_violations121:
;GCODE.c,356 :: 		}
L_Check_group_multiple_violations120:
;GCODE.c,357 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,358 :: 		}
L_Check_group_multiple_violations103:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations377
NOP	
J	L_Check_group_multiple_violations105
NOP	
L__Check_group_multiple_violations377:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations379
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations379:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations381
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations381:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations383
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations383:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations385
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations385:
L_Check_group_multiple_violations104:
;GCODE.c,360 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations122:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations386
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations386:
;GCODE.c,361 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,360 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,362 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations122
NOP	
L_Check_group_multiple_violations123:
;GCODE.c,363 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,366 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations387:
;GCODE.c,368 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations388
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations388:
;GCODE.c,369 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,370 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,371 :: 		}else{
J	L_Check_group_multiple_violations127
NOP	
L_Check_group_multiple_violations126:
;GCODE.c,372 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,373 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,374 :: 		}
L_Check_group_multiple_violations127:
;GCODE.c,381 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,382 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,383 :: 		}
L_Check_group_multiple_violations125:
;GCODE.c,386 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations389
NOP	
J	L_Check_group_multiple_violations128
NOP	
L__Check_group_multiple_violations389:
;GCODE.c,393 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,394 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,395 :: 		}
L_Check_group_multiple_violations128:
;GCODE.c,398 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations390
NOP	
J	L_Check_group_multiple_violations129
NOP	
L__Check_group_multiple_violations390:
;GCODE.c,405 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,406 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,407 :: 		}
L_Check_group_multiple_violations129:
;GCODE.c,410 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations391
NOP	
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations391:
;GCODE.c,417 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,418 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,419 :: 		}
L_Check_group_multiple_violations130:
;GCODE.c,422 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations392
NOP	
J	L_Check_group_multiple_violations131
NOP	
L__Check_group_multiple_violations392:
;GCODE.c,424 :: 		if(gc.coord_select < 0|| gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations393
NOP	
J	L__Check_group_multiple_violations176
NOP	
L__Check_group_multiple_violations393:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations394
NOP	
J	L__Check_group_multiple_violations175
NOP	
L__Check_group_multiple_violations394:
J	L_Check_group_multiple_violations134
NOP	
L__Check_group_multiple_violations176:
L__Check_group_multiple_violations175:
;GCODE.c,425 :: 		status_code = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations135
NOP	
L_Check_group_multiple_violations134:
;GCODE.c,427 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations135:
;GCODE.c,434 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,435 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,436 :: 		}
L_Check_group_multiple_violations131:
;GCODE.c,437 :: 		}
L_Check_group_multiple_violations98:
;GCODE.c,446 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,447 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,448 :: 		}
L_end_Check_group_multiple_violations:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,453 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,457 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values136
NOP	
;GCODE.c,458 :: 		case 'X':
L_Instruction_Values138:
;GCODE.c,460 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,461 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,462 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,463 :: 		case 'Y':
L_Instruction_Values139:
;GCODE.c,465 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,466 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,467 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,468 :: 		case 'Z':
L_Instruction_Values140:
;GCODE.c,470 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,471 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,472 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,473 :: 		case 'A':
L_Instruction_Values141:
;GCODE.c,475 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,476 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,477 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,478 :: 		case 'E':
L_Instruction_Values142:
;GCODE.c,480 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,481 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,482 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,483 :: 		case 'R':
L_Instruction_Values143:
;GCODE.c,485 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,486 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,487 :: 		case 'I':
L_Instruction_Values144:
;GCODE.c,488 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,489 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+104)(GP)
;GCODE.c,490 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,491 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,492 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,493 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,494 :: 		case 'J':
L_Instruction_Values145:
;GCODE.c,495 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,496 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,497 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,498 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,499 :: 		case 'K':
L_Instruction_Values146:
;GCODE.c,500 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,501 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,502 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,503 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,504 :: 		case 'F':
L_Instruction_Values147:
;GCODE.c,505 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,506 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values396
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values396:
;GCODE.c,507 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,508 :: 		}
L_Instruction_Values148:
;GCODE.c,515 :: 		gc.frequency = (unsigned long)F_Val;
SEH	R2, R3
; F_Val end address is: 12 (R3)
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,520 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,521 :: 		case 'P':
L_Instruction_Values149:
;GCODE.c,522 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,523 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values397
NOP	
J	L_Instruction_Values150
NOP	
L__Instruction_Values397:
;GCODE.c,524 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,525 :: 		}
L_Instruction_Values150:
;GCODE.c,526 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+120)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,527 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+122)(GP)
;GCODE.c,528 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,529 :: 		case 'S':
L_Instruction_Values151:
;GCODE.c,530 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,531 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values398
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values398:
;GCODE.c,532 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,533 :: 		}
L_Instruction_Values152:
;GCODE.c,534 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+122)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,535 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+120)(GP)
;GCODE.c,536 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,537 :: 		case 'L':
L_Instruction_Values153:
;GCODE.c,538 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,539 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values399
NOP	
J	L_Instruction_Values154
NOP	
L__Instruction_Values399:
;GCODE.c,540 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,541 :: 		}
L_Instruction_Values154:
;GCODE.c,542 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,543 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values137
NOP	
;GCODE.c,544 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values155:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_Instruction_Values137
NOP	
;GCODE.c,545 :: 		}
L_Instruction_Values136:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values401
NOP	
J	L_Instruction_Values138
NOP	
L__Instruction_Values401:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values403
NOP	
J	L_Instruction_Values139
NOP	
L__Instruction_Values403:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values405
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values405:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values407
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values407:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values409
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values409:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values411
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values411:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values413
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values413:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values415
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values415:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values417
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values417:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values419
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values419:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values421
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values421:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values423
NOP	
J	L_Instruction_Values151
NOP	
L__Instruction_Values423:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values425
NOP	
J	L_Instruction_Values153
NOP	
L__Instruction_Values425:
J	L_Instruction_Values155
NOP	
L_Instruction_Values137:
;GCODE.c,555 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,556 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,562 :: 		void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,565 :: 		for(i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_gc_set_current_position156:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__gc_set_current_position427
NOP	
J	L_gc_set_current_position157
NOP	
L__gc_set_current_position427:
;GCODE.c,566 :: 		temp[i] = ulong2flt(settings.steps_per_mm[i]);
ADDIU	R4, SP, 20
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
SW	R2, 32(SP)
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R5, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_ulong2flt+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R5, 4(SP)
LW	R2, 32(SP)
SWC1	S0, 0(R2)
;GCODE.c,565 :: 		for(i=0;i<3;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,567 :: 		}
; i end address is: 20 (R5)
J	L_gc_set_current_position156
NOP	
L_gc_set_current_position157:
;GCODE.c,568 :: 		gc.position[X] = x/temp[X];
ADDIU	R3, SP, 20
MTC1	R25, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R3)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,569 :: 		gc.position[Y] = y/temp[Y];
ADDIU	R2, R3, 4
MTC1	R26, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,570 :: 		gc.position[Z] = z/temp[Z];
ADDIU	R2, R3, 8
MTC1	R27, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+36)(GP)
;GCODE.c,571 :: 		}
L_end_gc_set_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _gc_set_current_position
