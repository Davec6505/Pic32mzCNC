GCODE_To_Millimeters:
;GCODE.c,47 :: 		static float To_Millimeters(float value){
;GCODE.c,48 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters163
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters163:
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
;GCODE.c,49 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,52 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,53 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,54 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
_G_Initialise:
;GCODE.c,61 :: 		void G_Initialise(){
;GCODE.c,62 :: 		m_flow               = 0;
SH	R0, Offset(-1610603000)(GP)
;GCODE.c,63 :: 		group_number         = 0;
SH	R0, Offset(-1610602988)(GP)
;GCODE.c,64 :: 		axis_words           = 0;
SH	R0, Offset(-1610603006)(GP)
;GCODE.c,65 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,66 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,67 :: 		gc.inverse_feed_rate_mode = false;
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,68 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,69 :: 		gc.absolute_mode     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,70 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_FAIL:
;GCODE.c,73 :: 		void FAIL(int status){
;GCODE.c,74 :: 		status_code = status;
SH	R25, Offset(-1610602986)(GP)
;GCODE.c,75 :: 		}
L_end_FAIL:
JR	RA
NOP	
; end of _FAIL
_GET_FAIL:
;GCODE.c,77 :: 		int  GET_FAIL(){
;GCODE.c,78 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,79 :: 		}
L_end_GET_FAIL:
JR	RA
NOP	
; end of _GET_FAIL
_SET_FAIL:
;GCODE.c,81 :: 		int  SET_FAIL(int val){
;GCODE.c,82 :: 		status_code = val;
SH	R25, Offset(-1610602986)(GP)
;GCODE.c,83 :: 		}
L_end_SET_FAIL:
JR	RA
NOP	
; end of _SET_FAIL
_Set_modalgroup:
;GCODE.c,87 :: 		void Set_modalgroup(int value){
;GCODE.c,88 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
;GCODE.c,89 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,92 :: 		int Get_modalgroup(){
;GCODE.c,93 :: 		return modal_group_words;
LH	R2, Offset(-1610603004)(GP)
;GCODE.c,94 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,96 :: 		int Rst_modalgroup(){
;GCODE.c,97 :: 		modal_group_words = 0;
SH	R0, Offset(-1610603004)(GP)
;GCODE.c,98 :: 		return modal_group_words;
MOVZ	R2, R0, R0
;GCODE.c,99 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_non_modalword:
;GCODE.c,104 :: 		void Set_non_modalword(int value){
;GCODE.c,105 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603002)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603002)(GP)
;GCODE.c,106 :: 		}
L_end_Set_non_modalword:
JR	RA
NOP	
; end of _Set_non_modalword
_Get_non_modalword:
;GCODE.c,109 :: 		int Get_non_modalword(){
;GCODE.c,110 :: 		return non_modal_words;
LH	R2, Offset(-1610603002)(GP)
;GCODE.c,111 :: 		}
L_end_Get_non_modalword:
JR	RA
NOP	
; end of _Get_non_modalword
_Rst_non_modalword:
;GCODE.c,113 :: 		int Rst_non_modalword(){
;GCODE.c,114 :: 		non_modal_words = 0;
SH	R0, Offset(-1610603002)(GP)
;GCODE.c,115 :: 		return non_modal_words;
MOVZ	R2, R0, R0
;GCODE.c,116 :: 		}
L_end_Rst_non_modalword:
JR	RA
NOP	
; end of _Rst_non_modalword
_Set_Axisword:
;GCODE.c,121 :: 		void Set_Axisword(int value){
;GCODE.c,122 :: 		bit_true( axis_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603006)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,123 :: 		}
L_end_Set_Axisword:
JR	RA
NOP	
; end of _Set_Axisword
_Get_Axisword:
;GCODE.c,131 :: 		int Get_Axisword(){
;GCODE.c,132 :: 		return axis_words & 0x0fff;
LH	R2, Offset(-1610603006)(GP)
ANDI	R2, R2, 4095
;GCODE.c,133 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,135 :: 		int Rst_Axisword(){
;GCODE.c,136 :: 		axis_words = 0;
SH	R0, Offset(-1610603006)(GP)
;GCODE.c,137 :: 		return axis_words;
MOVZ	R2, R0, R0
;GCODE.c,138 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,141 :: 		int Get_motionmode(){
;GCODE.c,142 :: 		return motion_mode;
LH	R2, Offset(-1610602990)(GP)
;GCODE.c,143 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,145 :: 		int Rst_motionmode(){
;GCODE.c,146 :: 		motion_mode = 0;
SH	R0, Offset(-1610602990)(GP)
;GCODE.c,147 :: 		return motion_mode;
MOVZ	R2, R0, R0
;GCODE.c,148 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,152 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,153 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(-1610602988)(GP)
;GCODE.c,154 :: 		motion_mode  = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(-1610602990)(GP)
;GCODE.c,155 :: 		return mode;//motion_mode;
SEH	R2, R25
;GCODE.c,156 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Mode:
;GCODE.c,160 :: 		int M_Mode(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,161 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(-1610602988)(GP)
;GCODE.c,162 :: 		m_flow = Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
SH	R2, Offset(-1610603000)(GP)
;GCODE.c,167 :: 		return flow;
SEH	R2, R25
;GCODE.c,168 :: 		}
L_end_M_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,175 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,177 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,178 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,179 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,180 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,181 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,182 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,183 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,184 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,185 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,186 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups184
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups184:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups186
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups186:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups188
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups188:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups190
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups190:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups192
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups192:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups194
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups194:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups196
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups196:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups198
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups198:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups200
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups200:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups208:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups210
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups210:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups218:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups220
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups220:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups238:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,187 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,188 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,191 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,193 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,195 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,196 :: 		case 0: m_mode    = MOTION_MODE_SEEK;SV.cir = 0;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, 10(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,197 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;SV.cir = 0;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, 10(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,198 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;gc.DIR = CW;SV.cir = 1;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, 10(SP)
SH	R0, Offset(_gc+128)(GP)
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,199 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC;gc.DIR = CCW;SV.cir = 1; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, 10(SP)
ORI	R2, R0, 1
SH	R2, Offset(_gc+128)(GP)
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,200 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,201 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,202 :: 		case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,203 :: 		case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,204 :: 		case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,205 :: 		case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,206 :: 		case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,207 :: 		case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,208 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,209 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,210 :: 		m_mode = MOTION_MODE_NULL;break;
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,211 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SH	R2, Offset(-1610602990)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,212 :: 		case 90: gc.absolute_mode = 1; m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,213 :: 		case 91: gc.absolute_mode = 0; m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,214 :: 		case 93: gc.inverse_feed_rate_mode = true; m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,215 :: 		case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,216 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,217 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,218 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,219 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,220 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,221 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,222 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,223 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode241
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode241:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode243
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode243:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode245
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode245:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode247
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode247:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode249
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode249:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode251
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode251:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode253
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode253:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode255
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode255:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode257
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode257:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode267:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode297:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,228 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(-1610603004)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode153
NOP	
L_GCODE_Set_Motion_Mode298:
LH	R2, Offset(-1610603006)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode152
NOP	
L_GCODE_Set_Motion_Mode299:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode153:
L_GCODE_Set_Motion_Mode152:
;GCODE.c,230 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode301:
;GCODE.c,231 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode155
NOP	
L_GCODE_Set_Motion_Mode302:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode304
NOP	
J	L_GCODE_Set_Motion_Mode154
NOP	
L_GCODE_Set_Motion_Mode304:
L_GCODE_Set_Motion_Mode150:
;GCODE.c,232 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,231 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode155:
L_GCODE_Set_Motion_Mode154:
;GCODE.c,234 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,236 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode306
NOP	
J	L_GCODE_Set_Motion_Mode157
NOP	
L_GCODE_Set_Motion_Mode306:
LH	R2, Offset(-1610602990)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode308
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode308:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode310:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode156
NOP	
L_GCODE_Set_Motion_Mode311:
L_GCODE_Set_Motion_Mode149:
;GCODE.c,237 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,236 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode157:
L_GCODE_Set_Motion_Mode156:
;GCODE.c,240 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,258 :: 		return m_mode;
LH	R2, 10(SP)
;GCODE.c,259 :: 		}
;GCODE.c,258 :: 		return m_mode;
;GCODE.c,259 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,264 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,267 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,268 :: 		case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,269 :: 		case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,270 :: 		}
L_GCODE_Set_M_Modal_Commands76:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands314
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands314:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands316
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands316:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands318
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands318:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands320
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands320:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands322
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands322:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands324
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands324:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands326
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands326:
L_GCODE_Set_M_Modal_Commands77:
;GCODE.c,271 :: 		return m_num;
LH	R2, 0(SP)
;GCODE.c,272 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,275 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,276 :: 		FAIL(STATUS_OK);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
;GCODE.c,278 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,279 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands87:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,280 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands88:
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,281 :: 		case 2:
L_GCODE_Set_M_Commands89:
;GCODE.c,282 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,283 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,284 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,285 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands93:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,289 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,290 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,291 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands96:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,292 :: 		}
L_GCODE_Set_M_Commands85:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands329
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands329:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands331
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands331:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands333
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands333:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands335
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands335:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands337
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands337:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands339
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands339:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands341
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands341:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands343
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands343:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands345
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands345:
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands86:
;GCODE.c,293 :: 		return flow;
SEH	R2, R25
;GCODE.c,294 :: 		}
L_end_Set_M_Commands:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,302 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,304 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,309 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(-1610602988)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations347
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations347:
;GCODE.c,310 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,311 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,312 :: 		}
L_Check_group_multiple_violations97:
;GCODE.c,314 :: 		if(group_number > 0) {
LH	R2, Offset(-1610602988)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations348
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations348:
;GCODE.c,316 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(-1610602988)(GP)
BNE	R2, R3, L__Check_group_multiple_violations350
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations350:
;GCODE.c,317 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations99:
;GCODE.c,319 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
;GCODE.c,321 :: 		last_group_number = group_number;
LH	R2, Offset(-1610602988)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,325 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations351
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations351:
;GCODE.c,328 :: 		Rst_non_modalword();
JAL	_Rst_non_modalword+0
NOP	
;GCODE.c,330 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations352
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations352:
;GCODE.c,331 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(-1610602992)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603002)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603002)(GP)
L_Check_group_multiple_violations101:
;GCODE.c,334 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,335 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,342 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations353
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations353:
;GCODE.c,344 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations103
NOP	
;GCODE.c,345 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations105:
;GCODE.c,346 :: 		gc.frequency = lround(settings.default_seek_rate);
LWC1	S12, Offset(_settings+20)(GP)
JAL	_lround+0
NOP	
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,347 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations106:
;GCODE.c,348 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,349 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,350 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations107:
L_Check_group_multiple_violations108:
;GCODE.c,351 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,356 :: 		for(i=0;i<=3;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Check_group_multiple_violations109:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations354
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations354:
;GCODE.c,357 :: 		Set_Axisword(i);
SEH	R25, R4
JAL	_Set_Axisword+0
NOP	
;GCODE.c,356 :: 		for(i=0;i<=3;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;GCODE.c,357 :: 		Set_Axisword(i);
; i end address is: 16 (R4)
J	L_Check_group_multiple_violations109
NOP	
L_Check_group_multiple_violations110:
;GCODE.c,371 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,372 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations112:
;GCODE.c,373 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,375 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LH	R2, Offset(-1610603006)(GP)
BNE	R2, R0, L__Check_group_multiple_violations356
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations356:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations113:
;GCODE.c,376 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,377 :: 		}
L_Check_group_multiple_violations103:
LH	R2, Offset(-1610602990)(GP)
BNE	R2, R0, L__Check_group_multiple_violations358
NOP	
J	L_Check_group_multiple_violations105
NOP	
L__Check_group_multiple_violations358:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations360
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations360:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations362
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations362:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations364
NOP	
J	L_Check_group_multiple_violations108
NOP	
L__Check_group_multiple_violations364:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations366
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations366:
L_Check_group_multiple_violations104:
;GCODE.c,380 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations114:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations367
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations367:
;GCODE.c,381 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+32)
ORI	R2, R2, lo_addr(_gc+32)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+80)
ORI	R2, R2, lo_addr(_gc+80)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,380 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,382 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations114
NOP	
L_Check_group_multiple_violations115:
;GCODE.c,383 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,386 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations368
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations368:
;GCODE.c,387 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,389 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations369
NOP	
J	L_Check_group_multiple_violations118
NOP	
L__Check_group_multiple_violations369:
;GCODE.c,390 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(-1610602986)(GP)
;GCODE.c,391 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,392 :: 		}
L_Check_group_multiple_violations118:
;GCODE.c,394 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,395 :: 		}
L_Check_group_multiple_violations117:
;GCODE.c,398 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations370
NOP	
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations370:
;GCODE.c,399 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,400 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,401 :: 		}
L_Check_group_multiple_violations119:
;GCODE.c,404 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations371
NOP	
J	L_Check_group_multiple_violations120
NOP	
L__Check_group_multiple_violations371:
;GCODE.c,405 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,406 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,407 :: 		}
L_Check_group_multiple_violations120:
;GCODE.c,410 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations372
NOP	
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations372:
;GCODE.c,411 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,412 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,413 :: 		}
L_Check_group_multiple_violations121:
;GCODE.c,416 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations373
NOP	
J	L_Check_group_multiple_violations122
NOP	
L__Check_group_multiple_violations373:
;GCODE.c,417 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,419 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations374
NOP	
J	L__Check_group_multiple_violations160
NOP	
L__Check_group_multiple_violations374:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations375
NOP	
J	L__Check_group_multiple_violations159
NOP	
L__Check_group_multiple_violations375:
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations160:
L__Check_group_multiple_violations159:
;GCODE.c,420 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations125:
;GCODE.c,422 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,423 :: 		}
L_Check_group_multiple_violations122:
;GCODE.c,424 :: 		}
L_Check_group_multiple_violations98:
;GCODE.c,429 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,430 :: 		}
;GCODE.c,429 :: 		return status_code;
;GCODE.c,430 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,435 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;GCODE.c,439 :: 		switch(c[0]){
SW	R25, 4(SP)
MOVZ	R2, R25, R0
SW	R2, 36(SP)
J	L_Instruction_Values126
NOP	
;GCODE.c,440 :: 		case 'X':case 'x':
L_Instruction_Values128:
L_Instruction_Values129:
;GCODE.c,442 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,443 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 1
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,444 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,445 :: 		case 'Y':
L_Instruction_Values130:
;GCODE.c,447 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,448 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 2
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,449 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,450 :: 		case 'Z':
L_Instruction_Values131:
;GCODE.c,452 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,453 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 4
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,454 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,455 :: 		case 'A':
L_Instruction_Values132:
;GCODE.c,457 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,458 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 8
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,459 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,460 :: 		case 'E':
L_Instruction_Values133:
;GCODE.c,462 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,463 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 16
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,464 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,465 :: 		case 'R':
L_Instruction_Values134:
;GCODE.c,467 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,468 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,469 :: 		case 'I':
L_Instruction_Values135:
;GCODE.c,470 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,471 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+108)(GP)
;GCODE.c,472 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,473 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,474 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,475 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,476 :: 		case 'J':
L_Instruction_Values136:
;GCODE.c,477 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,478 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,479 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,480 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,481 :: 		case 'K':
L_Instruction_Values137:
;GCODE.c,482 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,483 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,484 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,485 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,486 :: 		case 'F':
L_Instruction_Values138:
;GCODE.c,487 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
; XYZ_Val start address is: 16 (R4)
MOV.S 	S2, S1
;GCODE.c,488 :: 		if(XYZ_Val < 0){FAIL(STATUS_SPEED_ERROR);break;}
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values377
NOP	
J	L_Instruction_Values139
NOP	
L__Instruction_Values377:
; XYZ_Val end address is: 16 (R4)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
J	L_Instruction_Values127
NOP	
L_Instruction_Values139:
;GCODE.c,490 :: 		gc.feed_rate = To_Millimeters(XYZ_Val);
; XYZ_Val start address is: 16 (R4)
MOV.S 	S12, S2
; XYZ_Val end address is: 16 (R4)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,493 :: 		while(DMA_IsOn(1));
L_Instruction_Values140:
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
BNE	R2, R0, L__Instruction_Values379
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values379:
J	L_Instruction_Values140
NOP	
L_Instruction_Values141:
;GCODE.c,494 :: 		dma_printf("gc.feed_rate:= %f\n",gc.feed_rate);
ADDIU	R23, SP, 16
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 16
LW	R2, Offset(_gc+24)(GP)
SW	R26, 8(SP)
SW	R25, 12(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 12(SP)
LW	R26, 8(SP)
;GCODE.c,496 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,497 :: 		case 'P':
L_Instruction_Values142:
;GCODE.c,498 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,499 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values380
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values380:
;GCODE.c,500 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,501 :: 		}
L_Instruction_Values143:
;GCODE.c,502 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+124)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,503 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+126)(GP)
;GCODE.c,504 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,505 :: 		case 'S':
L_Instruction_Values144:
;GCODE.c,506 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,507 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values381
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values381:
;GCODE.c,508 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,509 :: 		}
L_Instruction_Values145:
;GCODE.c,510 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+126)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,511 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+124)(GP)
;GCODE.c,512 :: 		break;
J	L_Instruction_Values127
NOP	
;GCODE.c,513 :: 		case 'L':
L_Instruction_Values146:
;GCODE.c,514 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,515 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values382
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values382:
;GCODE.c,516 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,517 :: 		}
L_Instruction_Values147:
;GCODE.c,518 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,519 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values127
NOP	
;GCODE.c,520 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values148:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values127
NOP	
;GCODE.c,521 :: 		}
L_Instruction_Values126:
LW	R4, 36(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values384
NOP	
J	L_Instruction_Values128
NOP	
L__Instruction_Values384:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__Instruction_Values386
NOP	
J	L_Instruction_Values129
NOP	
L__Instruction_Values386:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values388
NOP	
J	L_Instruction_Values130
NOP	
L__Instruction_Values388:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values390
NOP	
J	L_Instruction_Values131
NOP	
L__Instruction_Values390:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values392
NOP	
J	L_Instruction_Values132
NOP	
L__Instruction_Values392:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values394
NOP	
J	L_Instruction_Values133
NOP	
L__Instruction_Values394:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values396
NOP	
J	L_Instruction_Values134
NOP	
L__Instruction_Values396:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values398
NOP	
J	L_Instruction_Values135
NOP	
L__Instruction_Values398:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values400
NOP	
J	L_Instruction_Values136
NOP	
L__Instruction_Values400:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values402
NOP	
J	L_Instruction_Values137
NOP	
L__Instruction_Values402:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values404
NOP	
J	L_Instruction_Values138
NOP	
L__Instruction_Values404:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values406
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values406:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values408
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values408:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values410
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values410:
J	L_Instruction_Values148
NOP	
L_Instruction_Values127:
;GCODE.c,536 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,537 :: 		}
;GCODE.c,536 :: 		return status_code;
;GCODE.c,537 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _Instruction_Values
