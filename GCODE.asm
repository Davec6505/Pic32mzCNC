GCODE_To_Millimeters:
;GCODE.c,40 :: 		static float To_Millimeters(float value){
;GCODE.c,41 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters197
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters197:
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
;GCODE.c,42 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,45 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,46 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,47 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
_G_Initialise:
;GCODE.c,53 :: 		void G_Initialise(){
;GCODE.c,54 :: 		group_number         = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,55 :: 		axis_words           = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,56 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,57 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,58 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,59 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,60 :: 		gc.absolute_mode     = true;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,61 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_modalgroup:
;GCODE.c,64 :: 		int Get_modalgroup(){
;GCODE.c,65 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,66 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,68 :: 		int Rst_modalgroup(){
;GCODE.c,69 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,70 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,71 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Get_modalword:
;GCODE.c,74 :: 		int Get_modalword(){
;GCODE.c,75 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,76 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,78 :: 		int Rst_modalword(){
;GCODE.c,79 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,80 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,81 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,84 :: 		int Get_Axisword(){
;GCODE.c,85 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,86 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,88 :: 		int Rst_Axisword(){
;GCODE.c,89 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,90 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,91 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,94 :: 		int Get_motionmode(){
;GCODE.c,95 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,96 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,98 :: 		int Rst_motionmode(){
;GCODE.c,99 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,100 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,101 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,104 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,106 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,107 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,108 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,109 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,112 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,114 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,115 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,120 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_Modal_Groups:
;GCODE.c,129 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,131 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,132 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,133 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,134 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,135 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,136 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,137 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,138 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,139 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,140 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups218:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups220
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups220:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups238:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups240
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups240:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups242
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups242:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups244
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups244:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups246
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups246:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups248
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups248:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups250
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups250:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups252
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups252:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups254
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups254:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups256
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups256:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups258
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups258:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups260
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups260:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups262
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups262:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups264
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups264:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups266
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups266:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,141 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,142 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,145 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;GCODE.c,147 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,148 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,149 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,150 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,151 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,152 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,153 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,154 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,155 :: 		case 17: Select_Plane(xy);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,156 :: 		case 18: Select_Plane(xz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,157 :: 		case 19: Select_Plane(yz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,158 :: 		case 20: gc.inches_mode = 1;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,159 :: 		case 21: gc.inches_mode = 0;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,160 :: 		case 53: gc.absolute_override = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,161 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,162 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,163 :: 		return STATUS_OK;break;
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,164 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SB	R2, Offset(_gc+8)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,165 :: 		case 90: gc.absolute_mode = true; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,166 :: 		case 91: gc.absolute_mode = false; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,167 :: 		case 93: gc.inverse_feed_rate_mode = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,168 :: 		case 94: gc.inverse_feed_rate_mode = false;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,169 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,170 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,171 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,172 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,173 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,174 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,175 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,176 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode297:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode299:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode301:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode303:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode305:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode307
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode307:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode309:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode311:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode313:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode315:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode317
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode317:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode319
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode319:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode321
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode321:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode323
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode323:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode325
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode325:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,182 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode181
NOP	
L_GCODE_Set_Motion_Mode326:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode327
NOP	
J	L_GCODE_Set_Motion_Mode180
NOP	
L_GCODE_Set_Motion_Mode327:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode181:
L_GCODE_Set_Motion_Mode180:
;GCODE.c,184 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode329:
;GCODE.c,185 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode330
NOP	
J	L_GCODE_Set_Motion_Mode183
NOP	
L_GCODE_Set_Motion_Mode330:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode332
NOP	
J	L_GCODE_Set_Motion_Mode182
NOP	
L_GCODE_Set_Motion_Mode332:
L_GCODE_Set_Motion_Mode178:
;GCODE.c,186 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,185 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode183:
L_GCODE_Set_Motion_Mode182:
;GCODE.c,188 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,190 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode334
NOP	
J	L_GCODE_Set_Motion_Mode185
NOP	
L_GCODE_Set_Motion_Mode334:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode336
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode336:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode338
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode338:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode339
NOP	
J	L_GCODE_Set_Motion_Mode184
NOP	
L_GCODE_Set_Motion_Mode339:
L_GCODE_Set_Motion_Mode177:
;GCODE.c,191 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,190 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode185:
L_GCODE_Set_Motion_Mode184:
;GCODE.c,194 :: 		while(DMA_IsOn(1));
L_GCODE_Set_Motion_Mode76:
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode341
NOP	
J	L_GCODE_Set_Motion_Mode77
NOP	
L_GCODE_Set_Motion_Mode341:
J	L_GCODE_Set_Motion_Mode76
NOP	
L_GCODE_Set_Motion_Mode77:
;GCODE.c,195 :: 		dma_printf("status_code:= %d\tmodal_group_words:= %d\n",status_code,modal_group_words);
ADDIU	R23, SP, 10
ADDIU	R22, R23, 41
LUI	R24, hi_addr(?ICSGCODE_?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 10
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_status_code+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
;GCODE.c,198 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode343
NOP	
J	L_GCODE_Set_Motion_Mode78
NOP	
L_GCODE_Set_Motion_Mode343:
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode78:
;GCODE.c,200 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,202 :: 		while(DMA_IsOn(1));
L_GCODE_Set_Motion_Mode79:
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode345
NOP	
J	L_GCODE_Set_Motion_Mode80
NOP	
L_GCODE_Set_Motion_Mode345:
J	L_GCODE_Set_Motion_Mode79
NOP	
L_GCODE_Set_Motion_Mode80:
;GCODE.c,203 :: 		dma_printf("motion_mode:= %d\tnon_modal_action:= %d\n",motion_mode,non_modal_action);
ADDIU	R23, SP, 51
ADDIU	R22, R23, 40
LUI	R24, hi_addr(?ICSGCODE_?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 51
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(GCODE_motion_mode+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
;GCODE.c,205 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,206 :: 		}
;GCODE.c,205 :: 		return motion_mode;
;GCODE.c,206 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,210 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,213 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands81
NOP	
;GCODE.c,214 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
L_GCODE_Set_M_Modal_Commands85:
L_GCODE_Set_M_Modal_Commands86:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands82
NOP	
;GCODE.c,215 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands87:
L_GCODE_Set_M_Modal_Commands88:
L_GCODE_Set_M_Modal_Commands89:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands82
NOP	
;GCODE.c,216 :: 		}
L_GCODE_Set_M_Modal_Commands81:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands348
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands348:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands350
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands350:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands352
NOP	
J	L_GCODE_Set_M_Modal_Commands85
NOP	
L_GCODE_Set_M_Modal_Commands352:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands354
NOP	
J	L_GCODE_Set_M_Modal_Commands86
NOP	
L_GCODE_Set_M_Modal_Commands354:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands356
NOP	
J	L_GCODE_Set_M_Modal_Commands87
NOP	
L_GCODE_Set_M_Modal_Commands356:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands358
NOP	
J	L_GCODE_Set_M_Modal_Commands88
NOP	
L_GCODE_Set_M_Modal_Commands358:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands360
NOP	
J	L_GCODE_Set_M_Modal_Commands89
NOP	
L_GCODE_Set_M_Modal_Commands360:
L_GCODE_Set_M_Modal_Commands82:
;GCODE.c,217 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,218 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,221 :: 		static int Set_M_Commands(int flow){
;GCODE.c,222 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,224 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,225 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,226 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands93:
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,227 :: 		case 2:
L_GCODE_Set_M_Commands94:
;GCODE.c,228 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands95:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,229 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands96:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,230 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands97:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,231 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands98:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,235 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands99:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,236 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands100:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,237 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands101:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_GCODE_Set_M_Commands91
NOP	
;GCODE.c,238 :: 		}
L_GCODE_Set_M_Commands90:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands363
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands363:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands365
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands365:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands367
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands367:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands369
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands369:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands371
NOP	
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands371:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands373
NOP	
J	L_GCODE_Set_M_Commands97
NOP	
L_GCODE_Set_M_Commands373:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands375
NOP	
J	L_GCODE_Set_M_Commands98
NOP	
L_GCODE_Set_M_Commands375:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands377
NOP	
J	L_GCODE_Set_M_Commands99
NOP	
L_GCODE_Set_M_Commands377:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands379
NOP	
J	L_GCODE_Set_M_Commands100
NOP	
L_GCODE_Set_M_Commands379:
J	L_GCODE_Set_M_Commands101
NOP	
L_GCODE_Set_M_Commands91:
;GCODE.c,239 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,240 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,245 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -112
SW	RA, 0(SP)
;GCODE.c,247 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,252 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations381
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations381:
;GCODE.c,254 :: 		if(group_number == MODAL_GROUP_NONE)
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations382
NOP	
J	L_Check_group_multiple_violations103
NOP	
L__Check_group_multiple_violations382:
;GCODE.c,255 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations103:
;GCODE.c,257 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations384
NOP	
J	L_Check_group_multiple_violations104
NOP	
L__Check_group_multiple_violations384:
;GCODE.c,258 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations104:
;GCODE.c,260 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,263 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations105:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations386
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations386:
J	L_Check_group_multiple_violations105
NOP	
L_Check_group_multiple_violations106:
;GCODE.c,264 :: 		dma_printf("modal_group_words:= %d\tgroup_number:= %d\n",modal_group_words,group_number);
ADDIU	R23, SP, 8
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LH	R2, Offset(_group_number+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,267 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,269 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations387:
;GCODE.c,272 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,274 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations388
NOP	
J	L_Check_group_multiple_violations108
NOP	
L__Check_group_multiple_violations388:
;GCODE.c,275 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations108:
;GCODE.c,278 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations109:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations390
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations390:
J	L_Check_group_multiple_violations109
NOP	
L_Check_group_multiple_violations110:
;GCODE.c,279 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
ADDIU	R23, SP, 50
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 50
;GCODE.c,280 :: 		non_modal_action,non_modal_words);
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, 4(SP)
;GCODE.c,279 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
SW	R3, 0(SP)
;GCODE.c,280 :: 		non_modal_action,non_modal_words);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,288 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,289 :: 		}
L_Check_group_multiple_violations107:
;GCODE.c,292 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations391
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations391:
;GCODE.c,294 :: 		if(axis_xyz > NO_OF_PLANES)
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations392
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations392:
;GCODE.c,295 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations113
NOP	
L_Check_group_multiple_violations112:
;GCODE.c,296 :: 		else status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations113:
;GCODE.c,304 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,305 :: 		}
L_Check_group_multiple_violations111:
;GCODE.c,308 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations393
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations393:
;GCODE.c,316 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,317 :: 		}
L_Check_group_multiple_violations114:
;GCODE.c,320 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations394
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations394:
;GCODE.c,328 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,329 :: 		}
L_Check_group_multiple_violations115:
;GCODE.c,332 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations395
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations395:
;GCODE.c,340 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,341 :: 		}
L_Check_group_multiple_violations116:
;GCODE.c,344 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations396
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations396:
;GCODE.c,346 :: 		if(gc.coord_select < 0|| gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations397
NOP	
J	L__Check_group_multiple_violations190
NOP	
L__Check_group_multiple_violations397:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations398
NOP	
J	L__Check_group_multiple_violations189
NOP	
L__Check_group_multiple_violations398:
J	L_Check_group_multiple_violations120
NOP	
L__Check_group_multiple_violations190:
L__Check_group_multiple_violations189:
;GCODE.c,347 :: 		status_code = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations121
NOP	
L_Check_group_multiple_violations120:
;GCODE.c,349 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations121:
;GCODE.c,357 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,358 :: 		}
L_Check_group_multiple_violations117:
;GCODE.c,359 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,364 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations122:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations399
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations399:
;GCODE.c,365 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations401
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations401:
;GCODE.c,366 :: 		if (!gc.absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations402
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations402:
;GCODE.c,367 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Check_group_multiple_violations404
NOP	
J	L_Check_group_multiple_violations127
NOP	
L__Check_group_multiple_violations404:
;GCODE.c,369 :: 		} else {
J	L_Check_group_multiple_violations128
NOP	
L_Check_group_multiple_violations127:
;GCODE.c,372 :: 		gc.next_position[i] + gc.coord_offset[i]; // Incremental mode
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;GCODE.c,373 :: 		}
L_Check_group_multiple_violations128:
;GCODE.c,374 :: 		}
L_Check_group_multiple_violations126:
;GCODE.c,375 :: 		} else {
J	L_Check_group_multiple_violations129
NOP	
L_Check_group_multiple_violations125:
;GCODE.c,376 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;GCODE.c,377 :: 		}
L_Check_group_multiple_violations129:
;GCODE.c,364 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,378 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations122
NOP	
L_Check_group_multiple_violations123:
;GCODE.c,383 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations130
NOP	
;GCODE.c,385 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations132:
;GCODE.c,386 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations406
NOP	
J	L_Check_group_multiple_violations133
NOP	
L__Check_group_multiple_violations406:
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations133:
;GCODE.c,387 :: 		break;
J	L_Check_group_multiple_violations131
NOP	
;GCODE.c,388 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations134:
;GCODE.c,389 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations407
NOP	
J	L_Check_group_multiple_violations135
NOP	
L__Check_group_multiple_violations407:
;GCODE.c,390 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,391 :: 		}else {
J	L_Check_group_multiple_violations136
NOP	
L_Check_group_multiple_violations135:
;GCODE.c,394 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,395 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,396 :: 		}
L_Check_group_multiple_violations136:
;GCODE.c,397 :: 		break;
J	L_Check_group_multiple_violations131
NOP	
;GCODE.c,398 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations137:
;GCODE.c,404 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations138:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations409
NOP	
J	L_Check_group_multiple_violations139
NOP	
L__Check_group_multiple_violations409:
J	L_Check_group_multiple_violations138
NOP	
L_Check_group_multiple_violations139:
;GCODE.c,405 :: 		dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 93
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr5_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 93
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,407 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations410
NOP	
J	L_Check_group_multiple_violations140
NOP	
L__Check_group_multiple_violations410:
;GCODE.c,408 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,409 :: 		}else {
J	L_Check_group_multiple_violations141
NOP	
L_Check_group_multiple_violations140:
;GCODE.c,411 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,412 :: 		}
L_Check_group_multiple_violations141:
;GCODE.c,413 :: 		break;
J	L_Check_group_multiple_violations131
NOP	
;GCODE.c,414 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations142:
L_Check_group_multiple_violations143:
;GCODE.c,417 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+13)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,418 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations412
NOP	
J	L__Check_group_multiple_violations194
NOP	
L__Check_group_multiple_violations412:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations413
NOP	
J	L__Check_group_multiple_violations193
NOP	
L__Check_group_multiple_violations413:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations414
NOP	
J	L__Check_group_multiple_violations192
NOP	
L__Check_group_multiple_violations414:
LBU	R2, Offset(_gc+12)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations415
NOP	
J	L__Check_group_multiple_violations191
NOP	
L__Check_group_multiple_violations415:
J	L__Check_group_multiple_violations186
NOP	
L__Check_group_multiple_violations193:
L__Check_group_multiple_violations192:
L__Check_group_multiple_violations191:
J	L_Check_group_multiple_violations148
NOP	
L__Check_group_multiple_violations186:
L__Check_group_multiple_violations194:
;GCODE.c,419 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,420 :: 		} else {
J	L_Check_group_multiple_violations149
NOP	
L_Check_group_multiple_violations148:
;GCODE.c,421 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+100)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations416
NOP	
J	L_Check_group_multiple_violations150
NOP	
L__Check_group_multiple_violations416:
;GCODE.c,423 :: 		asm{nop;}
NOP	
;GCODE.c,424 :: 		}
L_Check_group_multiple_violations150:
;GCODE.c,425 :: 		}
L_Check_group_multiple_violations149:
;GCODE.c,426 :: 		break;
J	L_Check_group_multiple_violations131
NOP	
;GCODE.c,427 :: 		}
L_Check_group_multiple_violations130:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations418
NOP	
J	L_Check_group_multiple_violations132
NOP	
L__Check_group_multiple_violations418:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations420
NOP	
J	L_Check_group_multiple_violations134
NOP	
L__Check_group_multiple_violations420:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations422
NOP	
J	L_Check_group_multiple_violations137
NOP	
L__Check_group_multiple_violations422:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations424
NOP	
J	L_Check_group_multiple_violations142
NOP	
L__Check_group_multiple_violations424:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations426
NOP	
J	L_Check_group_multiple_violations143
NOP	
L__Check_group_multiple_violations426:
L_Check_group_multiple_violations131:
;GCODE.c,429 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations151:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations427
NOP	
J	L_Check_group_multiple_violations152
NOP	
L__Check_group_multiple_violations427:
;GCODE.c,430 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,429 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,431 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations151
NOP	
L_Check_group_multiple_violations152:
;GCODE.c,436 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,437 :: 		}
;GCODE.c,436 :: 		return status_code;
;GCODE.c,437 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 112
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,441 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,445 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values154
NOP	
;GCODE.c,446 :: 		case 'X':
L_Instruction_Values156:
;GCODE.c,448 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,449 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,450 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,451 :: 		case 'Y':
L_Instruction_Values157:
;GCODE.c,453 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,454 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,455 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,456 :: 		case 'Z':
L_Instruction_Values158:
;GCODE.c,458 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,459 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,460 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,461 :: 		case 'A':
L_Instruction_Values159:
;GCODE.c,463 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,464 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,465 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,466 :: 		case 'E':
L_Instruction_Values160:
;GCODE.c,468 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,469 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,470 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,471 :: 		case 'R':
L_Instruction_Values161:
;GCODE.c,473 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,474 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,475 :: 		case 'I':
L_Instruction_Values162:
;GCODE.c,476 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,477 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+100)(GP)
;GCODE.c,478 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,479 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,480 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,481 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,482 :: 		case 'J':
L_Instruction_Values163:
;GCODE.c,483 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,484 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,485 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,486 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,487 :: 		case 'K':
L_Instruction_Values164:
;GCODE.c,488 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,489 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,490 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,491 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,492 :: 		case 'F':
L_Instruction_Values165:
;GCODE.c,493 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,494 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values429
NOP	
J	L_Instruction_Values166
NOP	
L__Instruction_Values429:
;GCODE.c,495 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,496 :: 		}
L_Instruction_Values166:
;GCODE.c,503 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+16)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,504 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,505 :: 		case 'P':
L_Instruction_Values167:
;GCODE.c,506 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,507 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values430
NOP	
J	L_Instruction_Values168
NOP	
L__Instruction_Values430:
;GCODE.c,508 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,509 :: 		}
L_Instruction_Values168:
;GCODE.c,510 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+116)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,511 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+118)(GP)
;GCODE.c,512 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,513 :: 		case 'S':
L_Instruction_Values169:
;GCODE.c,514 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,515 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values431
NOP	
J	L_Instruction_Values170
NOP	
L__Instruction_Values431:
;GCODE.c,516 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,517 :: 		}
L_Instruction_Values170:
;GCODE.c,518 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+118)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,519 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+116)(GP)
;GCODE.c,520 :: 		break;
J	L_Instruction_Values155
NOP	
;GCODE.c,521 :: 		case 'L':
L_Instruction_Values171:
;GCODE.c,522 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,523 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values432
NOP	
J	L_Instruction_Values172
NOP	
L__Instruction_Values432:
;GCODE.c,524 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,525 :: 		}
L_Instruction_Values172:
;GCODE.c,526 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+18)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,527 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values155
NOP	
;GCODE.c,528 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values173:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_Instruction_Values155
NOP	
;GCODE.c,529 :: 		}
L_Instruction_Values154:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values434
NOP	
J	L_Instruction_Values156
NOP	
L__Instruction_Values434:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values436
NOP	
J	L_Instruction_Values157
NOP	
L__Instruction_Values436:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values438
NOP	
J	L_Instruction_Values158
NOP	
L__Instruction_Values438:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values440
NOP	
J	L_Instruction_Values159
NOP	
L__Instruction_Values440:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values442
NOP	
J	L_Instruction_Values160
NOP	
L__Instruction_Values442:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values444
NOP	
J	L_Instruction_Values161
NOP	
L__Instruction_Values444:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values446
NOP	
J	L_Instruction_Values162
NOP	
L__Instruction_Values446:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values448
NOP	
J	L_Instruction_Values163
NOP	
L__Instruction_Values448:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values450
NOP	
J	L_Instruction_Values164
NOP	
L__Instruction_Values450:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values452
NOP	
J	L_Instruction_Values165
NOP	
L__Instruction_Values452:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values454
NOP	
J	L_Instruction_Values167
NOP	
L__Instruction_Values454:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values456
NOP	
J	L_Instruction_Values169
NOP	
L__Instruction_Values456:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values458
NOP	
J	L_Instruction_Values171
NOP	
L__Instruction_Values458:
J	L_Instruction_Values173
NOP	
L_Instruction_Values155:
;GCODE.c,539 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,540 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,545 :: 		void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,548 :: 		for(i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_gc_set_current_position174:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__gc_set_current_position460
NOP	
J	L_gc_set_current_position175
NOP	
L__gc_set_current_position460:
;GCODE.c,549 :: 		temp[i] = ulong2flt(settings.steps_per_mm[i]);
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
;GCODE.c,548 :: 		for(i=0;i<3;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,550 :: 		}
; i end address is: 20 (R5)
J	L_gc_set_current_position174
NOP	
L_gc_set_current_position175:
;GCODE.c,551 :: 		gc.position[X] = x/temp[X];
ADDIU	R3, SP, 20
MTC1	R25, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R3)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,552 :: 		gc.position[Y] = y/temp[Y];
ADDIU	R2, R3, 4
MTC1	R26, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,553 :: 		gc.position[Z] = z/temp[Z];
ADDIU	R2, R3, 8
MTC1	R27, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,554 :: 		}
L_end_gc_set_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _gc_set_current_position
