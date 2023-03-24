GCODE_To_Millimeters:
;GCODE.c,45 :: 		static float To_Millimeters(float value){
;GCODE.c,46 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters183
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters183:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T5 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T5 end address is: 0 (R0)
J	L_GCODE_To_Millimeters1
NOP	
L_GCODE_To_Millimeters0:
; ?FLOC__GCODE_To_Millimeters?T5 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T5 end address is: 0 (R0)
L_GCODE_To_Millimeters1:
; ?FLOC__GCODE_To_Millimeters?T5 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T5 end address is: 0 (R0)
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
_FAIL:
;GCODE.c,59 :: 		void FAIL(int status){
;GCODE.c,60 :: 		status_code = status;
SH	R25, Offset(_status_code+0)(GP)
;GCODE.c,61 :: 		}
L_end_FAIL:
JR	RA
NOP	
; end of _FAIL
_G_Initialise:
;GCODE.c,64 :: 		void G_Initialise(){
;GCODE.c,65 :: 		m_flow               = 0;
SH	R0, Offset(_m_flow+0)(GP)
;GCODE.c,66 :: 		group_number         = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,67 :: 		axis_words           = 0;
SH	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,68 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,69 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,70 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,71 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,72 :: 		gc.absolute_mode     = true;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,73 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Set_modalgroup:
;GCODE.c,77 :: 		void Set_modalgroup(int value){
;GCODE.c,78 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,79 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,82 :: 		int Get_modalgroup(){
;GCODE.c,83 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,84 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,86 :: 		int Rst_modalgroup(){
;GCODE.c,87 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,88 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,89 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_modalword:
;GCODE.c,94 :: 		void Set_modalword(int value){
;GCODE.c,95 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,96 :: 		}
L_end_Set_modalword:
JR	RA
NOP	
; end of _Set_modalword
_Get_modalword:
;GCODE.c,99 :: 		int Get_modalword(){
;GCODE.c,100 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,101 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,103 :: 		int Rst_modalword(){
;GCODE.c,104 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,105 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,106 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Set_Axisword:
;GCODE.c,111 :: 		void Set_Axisword(int value){
;GCODE.c,112 :: 		bit_true( axis_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_axis_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,113 :: 		}
L_end_Set_Axisword:
JR	RA
NOP	
; end of _Set_Axisword
_Get_Axisword:
;GCODE.c,121 :: 		int Get_Axisword(){
;GCODE.c,122 :: 		return axis_words & 0x0fff;
LH	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 4095
;GCODE.c,123 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,125 :: 		int Rst_Axisword(){
;GCODE.c,126 :: 		axis_words = 0;
SH	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,127 :: 		return axis_words;
LH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,128 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,131 :: 		int Get_motionmode(){
;GCODE.c,132 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,133 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,135 :: 		int Rst_motionmode(){
;GCODE.c,136 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,137 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,138 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,142 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,147 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,148 :: 		motion_mode  = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,149 :: 		return mode;//motion_mode;
SEH	R2, R25
;GCODE.c,150 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Mode:
;GCODE.c,154 :: 		int M_Mode(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,155 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,156 :: 		m_flow = Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
SH	R2, Offset(_m_flow+0)(GP)
;GCODE.c,161 :: 		return flow;
SEH	R2, R25
;GCODE.c,162 :: 		}
L_end_M_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,169 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,171 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,172 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,173 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,174 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,175 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,176 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,177 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,178 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,179 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,180 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups208:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups210
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups210:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups218:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups220
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups220:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups238:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups240
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups240:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups242
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups242:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups244
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups244:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups246
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups246:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups248
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups248:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups250
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups250:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups252
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups252:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups254
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups254:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups256
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups256:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,181 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,182 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,185 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,187 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,189 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,190 :: 		case 0: m_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,191 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,192 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;gc.DIR = CW;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, 10(SP)
SH	R0, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,193 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC;gc.DIR = CCW; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, 10(SP)
ORI	R2, R0, 1
SH	R2, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,194 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,195 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,196 :: 		case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,197 :: 		case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,198 :: 		case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,199 :: 		case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,200 :: 		case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,201 :: 		case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,202 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,203 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,204 :: 		m_mode = MOTION_MODE_NULL;break;
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,205 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,206 :: 		case 90: gc.absolute_mode = true; m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,207 :: 		case 91: gc.absolute_mode = false; m_mode   = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,208 :: 		case 93: gc.inverse_feed_rate_mode = true;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,209 :: 		case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,210 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,211 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,212 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,213 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,214 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,215 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,216 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,217 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode267:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode297:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode299:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode301:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode303:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode305:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode307
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode307:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode309:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode311:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode313:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode315:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,222 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode316
NOP	
J	L_GCODE_Set_Motion_Mode173
NOP	
L_GCODE_Set_Motion_Mode316:
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode317
NOP	
J	L_GCODE_Set_Motion_Mode172
NOP	
L_GCODE_Set_Motion_Mode317:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode173:
L_GCODE_Set_Motion_Mode172:
;GCODE.c,224 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode319
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode319:
;GCODE.c,225 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode175
NOP	
L_GCODE_Set_Motion_Mode320:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode174
NOP	
L_GCODE_Set_Motion_Mode322:
L_GCODE_Set_Motion_Mode170:
;GCODE.c,226 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,225 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode175:
L_GCODE_Set_Motion_Mode174:
;GCODE.c,228 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,230 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode177
NOP	
L_GCODE_Set_Motion_Mode324:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode326:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode328:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode176
NOP	
L_GCODE_Set_Motion_Mode329:
L_GCODE_Set_Motion_Mode169:
;GCODE.c,231 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,230 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode177:
L_GCODE_Set_Motion_Mode176:
;GCODE.c,234 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,241 :: 		return m_mode;
LH	R2, 10(SP)
;GCODE.c,242 :: 		}
;GCODE.c,241 :: 		return m_mode;
;GCODE.c,242 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,247 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,250 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,251 :: 		case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,252 :: 		case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,253 :: 		}
L_GCODE_Set_M_Modal_Commands76:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands332
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands332:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands334
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands334:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands336
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands336:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands338
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands338:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands340
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands340:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands342
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands342:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands344
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands344:
L_GCODE_Set_M_Modal_Commands77:
;GCODE.c,254 :: 		return m_num;
LH	R2, 0(SP)
;GCODE.c,255 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,258 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,259 :: 		FAIL(STATUS_OK);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
;GCODE.c,261 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,262 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands87:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,263 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands88:
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,264 :: 		case 2:
L_GCODE_Set_M_Commands89:
;GCODE.c,265 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,266 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,267 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,268 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands93:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,272 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,273 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,274 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands96:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,275 :: 		}
L_GCODE_Set_M_Commands85:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands347
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands347:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands349
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands349:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands351
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands351:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands353
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands353:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands355
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands355:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands357
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands357:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands359
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands359:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands361
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands361:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands363
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands363:
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands86:
;GCODE.c,276 :: 		return flow;
SEH	R2, R25
;GCODE.c,277 :: 		}
L_end_Set_M_Commands:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,285 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -228
SW	RA, 0(SP)
;GCODE.c,287 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,292 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations365
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations365:
;GCODE.c,293 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,294 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,295 :: 		}
L_Check_group_multiple_violations97:
;GCODE.c,297 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations366
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations366:
;GCODE.c,299 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations368
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations368:
;GCODE.c,300 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations99:
;GCODE.c,302 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,304 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,308 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations369
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations369:
;GCODE.c,311 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,313 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations370
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations370:
;GCODE.c,314 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations101:
;GCODE.c,317 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations102:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations372
NOP	
J	L_Check_group_multiple_violations103
NOP	
L__Check_group_multiple_violations372:
J	L_Check_group_multiple_violations102
NOP	
L_Check_group_multiple_violations103:
;GCODE.c,318 :: 		dma_printf("group_number:= %d\tgc.absolute_override:= %d\n"
ADDIU	R23, SP, 8
ADDIU	R22, R23, 45
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
;GCODE.c,319 :: 		,group_number,gc.absolute_override);
LBU	R2, Offset(_gc+4)(GP)
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
;GCODE.c,318 :: 		dma_printf("group_number:= %d\tgc.absolute_override:= %d\n"
SW	R3, 0(SP)
;GCODE.c,319 :: 		,group_number,gc.absolute_override);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,324 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,325 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,333 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations373
NOP	
J	L_Check_group_multiple_violations104
NOP	
L__Check_group_multiple_violations373:
;GCODE.c,334 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,336 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations105:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations375
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations375:
J	L_Check_group_multiple_violations105
NOP	
L_Check_group_multiple_violations106:
;GCODE.c,337 :: 		dma_printf("[group_number:= %d][motion_mode:= %d]\n"
ADDIU	R23, SP, 53
ADDIU	R22, R23, 39
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 53
;GCODE.c,338 :: 		,group_number,motion_mode);
LH	R2, Offset(GCODE_motion_mode+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
;GCODE.c,337 :: 		dma_printf("[group_number:= %d][motion_mode:= %d]\n"
SW	R3, 0(SP)
;GCODE.c,338 :: 		,group_number,motion_mode);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,341 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations107
NOP	
;GCODE.c,342 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations109:
;GCODE.c,348 :: 		gc.frequency = 100;//lround(settings.default_seek_rate);
ORI	R2, R0, 100
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,349 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,351 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,352 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations110:
;GCODE.c,357 :: 		if (axis_words == 0) {
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations376
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations376:
;GCODE.c,358 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,359 :: 		}else {
J	L_Check_group_multiple_violations112
NOP	
L_Check_group_multiple_violations111:
;GCODE.c,361 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,362 :: 		}
L_Check_group_multiple_violations112:
;GCODE.c,363 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,364 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations113:
L_Check_group_multiple_violations114:
;GCODE.c,373 :: 		for(i=0;i<=3;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Check_group_multiple_violations115:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations377
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations377:
;GCODE.c,374 :: 		Set_Axisword(i);
SEH	R25, R4
JAL	_Set_Axisword+0
NOP	
;GCODE.c,373 :: 		for(i=0;i<=3;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;GCODE.c,374 :: 		Set_Axisword(i);
; i end address is: 16 (R4)
J	L_Check_group_multiple_violations115
NOP	
L_Check_group_multiple_violations116:
;GCODE.c,378 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations118:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations379
NOP	
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations379:
J	L_Check_group_multiple_violations118
NOP	
L_Check_group_multiple_violations119:
;GCODE.c,379 :: 		dma_printf("%s\taxis_words:= %d\n","ARC",axis_words&0x00ff);
LH	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
ADDIU	R23, SP, 92
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_GCODE+0)
ORI	R2, R2, lo_addr(?lstr_4_GCODE+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,382 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,383 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations120:
;GCODE.c,385 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LH	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations381
NOP	
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations381:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations121:
;GCODE.c,386 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,387 :: 		}
L_Check_group_multiple_violations107:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations383
NOP	
J	L_Check_group_multiple_violations109
NOP	
L__Check_group_multiple_violations383:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations385
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations385:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations387:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations389
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations389:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations391
NOP	
J	L_Check_group_multiple_violations120
NOP	
L__Check_group_multiple_violations391:
L_Check_group_multiple_violations108:
;GCODE.c,389 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations122:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__Check_group_multiple_violations392
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations392:
;GCODE.c,390 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,389 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,391 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations122
NOP	
L_Check_group_multiple_violations123:
;GCODE.c,392 :: 		}
L_Check_group_multiple_violations104:
;GCODE.c,395 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations393
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations393:
;GCODE.c,397 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations394
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations394:
;GCODE.c,398 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,399 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,400 :: 		}else{
J	L_Check_group_multiple_violations127
NOP	
L_Check_group_multiple_violations126:
;GCODE.c,401 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,402 :: 		}
L_Check_group_multiple_violations127:
;GCODE.c,405 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations128:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations396
NOP	
J	L_Check_group_multiple_violations129
NOP	
L__Check_group_multiple_violations396:
J	L_Check_group_multiple_violations128
NOP	
L_Check_group_multiple_violations129:
;GCODE.c,406 :: 		dma_printf("axis_xyz:= %d\n",axis_xyz);
ADDIU	R23, SP, 112
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr5_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 112
LBU	R2, Offset(_axis_xyz+0)(GP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,410 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,411 :: 		}
L_Check_group_multiple_violations125:
;GCODE.c,414 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations397
NOP	
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations397:
;GCODE.c,417 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations131:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations399
NOP	
J	L_Check_group_multiple_violations132
NOP	
L__Check_group_multiple_violations399:
J	L_Check_group_multiple_violations131
NOP	
L_Check_group_multiple_violations132:
;GCODE.c,418 :: 		dma_printf("gc.absolute_mode:= %d\n",gc.absolute_mode);
ADDIU	R23, SP, 127
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr6_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 127
LBU	R2, Offset(_gc+5)(GP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,421 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,422 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,423 :: 		}
L_Check_group_multiple_violations130:
;GCODE.c,426 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations400
NOP	
J	L_Check_group_multiple_violations133
NOP	
L__Check_group_multiple_violations400:
;GCODE.c,429 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations134:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations402
NOP	
J	L_Check_group_multiple_violations135
NOP	
L__Check_group_multiple_violations402:
J	L_Check_group_multiple_violations134
NOP	
L_Check_group_multiple_violations135:
;GCODE.c,430 :: 		dma_printf("gc.inverse_feed_rate_mode:= %d\n",gc.inverse_feed_rate_mode);
ADDIU	R23, SP, 150
ADDIU	R22, R23, 32
LUI	R24, hi_addr(?ICS?lstr7_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr7_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 150
LBU	R2, Offset(_gc+2)(GP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,433 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,434 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,435 :: 		}
L_Check_group_multiple_violations133:
;GCODE.c,438 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations403
NOP	
J	L_Check_group_multiple_violations136
NOP	
L__Check_group_multiple_violations403:
;GCODE.c,441 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations137:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations405
NOP	
J	L_Check_group_multiple_violations138
NOP	
L__Check_group_multiple_violations405:
J	L_Check_group_multiple_violations137
NOP	
L_Check_group_multiple_violations138:
;GCODE.c,442 :: 		dma_printf("gc.inches_mode:= %d\n",gc.inches_mode);
ADDIU	R23, SP, 182
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr8_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 182
LBU	R2, Offset(_gc+3)(GP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,445 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,446 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,447 :: 		}
L_Check_group_multiple_violations136:
;GCODE.c,450 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations406
NOP	
J	L_Check_group_multiple_violations139
NOP	
L__Check_group_multiple_violations406:
;GCODE.c,452 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations407
NOP	
J	L__Check_group_multiple_violations180
NOP	
L__Check_group_multiple_violations407:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations408
NOP	
J	L__Check_group_multiple_violations179
NOP	
L__Check_group_multiple_violations408:
J	L_Check_group_multiple_violations142
NOP	
L__Check_group_multiple_violations180:
L__Check_group_multiple_violations179:
;GCODE.c,453 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
J	L_Check_group_multiple_violations143
NOP	
L_Check_group_multiple_violations142:
;GCODE.c,455 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations143:
;GCODE.c,458 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations144:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations410
NOP	
J	L_Check_group_multiple_violations145
NOP	
L__Check_group_multiple_violations410:
J	L_Check_group_multiple_violations144
NOP	
L_Check_group_multiple_violations145:
;GCODE.c,459 :: 		dma_printf("gc.coord_select:= %d\n",gc.coord_select);
ADDIU	R23, SP, 203
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr9_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr9_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 203
LH	R2, Offset(_gc+14)(GP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,462 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,463 :: 		}
L_Check_group_multiple_violations139:
;GCODE.c,464 :: 		}
L_Check_group_multiple_violations98:
;GCODE.c,473 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,474 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,475 :: 		}
;GCODE.c,474 :: 		return status_code;
;GCODE.c,475 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 228
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,480 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,484 :: 		switch(c[0]){
SW	R25, 4(SP)
MOVZ	R2, R25, R0
SW	R2, 8(SP)
J	L_Instruction_Values146
NOP	
;GCODE.c,485 :: 		case 'X':case 'x':
L_Instruction_Values148:
L_Instruction_Values149:
;GCODE.c,487 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+52)(GP)
;GCODE.c,488 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,493 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,494 :: 		case 'Y':
L_Instruction_Values150:
;GCODE.c,496 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+56)(GP)
;GCODE.c,497 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,498 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,499 :: 		case 'Z':
L_Instruction_Values151:
;GCODE.c,501 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,502 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,503 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,504 :: 		case 'A':
L_Instruction_Values152:
;GCODE.c,506 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,507 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,508 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,509 :: 		case 'E':
L_Instruction_Values153:
;GCODE.c,511 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,512 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,513 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,514 :: 		case 'R':
L_Instruction_Values154:
;GCODE.c,516 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,517 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,518 :: 		case 'I':
L_Instruction_Values155:
;GCODE.c,519 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,520 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+72)(GP)
;GCODE.c,521 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,522 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,523 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,524 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,525 :: 		case 'J':
L_Instruction_Values156:
;GCODE.c,526 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,527 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,528 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,529 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,530 :: 		case 'K':
L_Instruction_Values157:
;GCODE.c,531 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,532 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,533 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,534 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,535 :: 		case 'F':
L_Instruction_Values158:
;GCODE.c,536 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
; XYZ_Val start address is: 16 (R4)
MOV.S 	S2, S1
;GCODE.c,537 :: 		if(XYZ_Val < 0){
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values412
NOP	
J	L_Instruction_Values159
NOP	
L__Instruction_Values412:
;GCODE.c,538 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,539 :: 		}
L_Instruction_Values159:
;GCODE.c,541 :: 		if (gc.inverse_feed_rate_mode) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__Instruction_Values414
NOP	
J	L_Instruction_Values160
NOP	
L__Instruction_Values414:
;GCODE.c,542 :: 		inverse_feed_rate = To_Millimeters(XYZ_Val); // seconds per motion for this motion only
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,543 :: 		} else {
J	L_Instruction_Values161
NOP	
L_Instruction_Values160:
;GCODE.c,544 :: 		gc.feed_rate = To_Millimeters(XYZ_Val); // millimeters per minute
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,545 :: 		}
L_Instruction_Values161:
;GCODE.c,546 :: 		gc.frequency = (unsigned long)XYZ_Val;
MOV.S 	S0, S2
; XYZ_Val end address is: 16 (R4)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,551 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,552 :: 		case 'P':
L_Instruction_Values162:
;GCODE.c,553 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,554 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values415
NOP	
J	L_Instruction_Values163
NOP	
L__Instruction_Values415:
;GCODE.c,555 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,556 :: 		}
L_Instruction_Values163:
;GCODE.c,557 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+88)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,558 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,559 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,560 :: 		case 'S':
L_Instruction_Values164:
;GCODE.c,561 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,562 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values416
NOP	
J	L_Instruction_Values165
NOP	
L__Instruction_Values416:
;GCODE.c,563 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,564 :: 		}
L_Instruction_Values165:
;GCODE.c,565 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+90)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,566 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,567 :: 		break;
J	L_Instruction_Values147
NOP	
;GCODE.c,568 :: 		case 'L':
L_Instruction_Values166:
;GCODE.c,569 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,570 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values417
NOP	
J	L_Instruction_Values167
NOP	
L__Instruction_Values417:
;GCODE.c,571 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,572 :: 		}
L_Instruction_Values167:
;GCODE.c,573 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,574 :: 		break; //L2 tells the G10 we�re setting standard work offsets
J	L_Instruction_Values147
NOP	
;GCODE.c,575 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values168:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values147
NOP	
;GCODE.c,576 :: 		}
L_Instruction_Values146:
LW	R4, 8(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values419
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values419:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__Instruction_Values421
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values421:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values423
NOP	
J	L_Instruction_Values150
NOP	
L__Instruction_Values423:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values425
NOP	
J	L_Instruction_Values151
NOP	
L__Instruction_Values425:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values427
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values427:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values429
NOP	
J	L_Instruction_Values153
NOP	
L__Instruction_Values429:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values431
NOP	
J	L_Instruction_Values154
NOP	
L__Instruction_Values431:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values433
NOP	
J	L_Instruction_Values155
NOP	
L__Instruction_Values433:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values435
NOP	
J	L_Instruction_Values156
NOP	
L__Instruction_Values435:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values437
NOP	
J	L_Instruction_Values157
NOP	
L__Instruction_Values437:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values439
NOP	
J	L_Instruction_Values158
NOP	
L__Instruction_Values439:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values441
NOP	
J	L_Instruction_Values162
NOP	
L__Instruction_Values441:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values443
NOP	
J	L_Instruction_Values164
NOP	
L__Instruction_Values443:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values445
NOP	
J	L_Instruction_Values166
NOP	
L__Instruction_Values445:
J	L_Instruction_Values168
NOP	
L_Instruction_Values147:
;GCODE.c,586 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,587 :: 		}
;GCODE.c,586 :: 		return status_code;
;GCODE.c,587 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Instruction_Values
