GCODE_To_Millimeters:
;GCODE.c,47 :: 		static float To_Millimeters(float value){
;GCODE.c,48 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters167
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters167:
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
;GCODE.c,67 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,68 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,69 :: 		gc.absolute_mode     = true;
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
;GCODE.c,157 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(-1610602988)(GP)
;GCODE.c,158 :: 		motion_mode  = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(-1610602990)(GP)
;GCODE.c,159 :: 		return mode;//motion_mode;
SEH	R2, R25
;GCODE.c,160 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Mode:
;GCODE.c,164 :: 		int M_Mode(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,165 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(-1610602988)(GP)
;GCODE.c,166 :: 		m_flow = Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
SH	R2, Offset(-1610603000)(GP)
;GCODE.c,171 :: 		return flow;
SEH	R2, R25
;GCODE.c,172 :: 		}
L_end_M_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,179 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,181 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,182 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,183 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,184 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,185 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,186 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,187 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,188 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,189 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,190 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups188
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups188:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups190
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups190:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups192
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups192:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups194
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups194:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups196
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups196:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups198
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups198:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups200
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups200:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups202
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups202:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups204
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups204:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups206
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups206:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups208
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups208:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups210
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups210:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups212
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups212:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups214
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups214:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups216
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups216:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups218
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups218:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups220
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups220:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups238:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups240
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups240:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups242
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups242:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,191 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,192 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,195 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,197 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,199 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,200 :: 		case 0: m_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,201 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,202 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;gc.DIR = CW;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, 10(SP)
SH	R0, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,203 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC;gc.DIR = CCW; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, 10(SP)
ORI	R2, R0, 1
SH	R2, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,204 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,205 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,206 :: 		case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,207 :: 		case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,208 :: 		case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,209 :: 		case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,210 :: 		case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,211 :: 		case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,212 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,213 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,214 :: 		m_mode = MOTION_MODE_NULL;break;
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,215 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SH	R2, Offset(-1610602990)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,216 :: 		case 90: gc.absolute_mode = true; m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,217 :: 		case 91: gc.absolute_mode = false; m_mode   = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,218 :: 		case 93: gc.inverse_feed_rate_mode = true;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,219 :: 		case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,220 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,221 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,222 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,223 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,224 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,225 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,226 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,227 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode245
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode245:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode247
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode247:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode249
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode249:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode251
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode251:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode253
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode253:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode255
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode255:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode257
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode257:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode259
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode259:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode261
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode261:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode263
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode263:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode265
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode265:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode267
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode267:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode269
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode269:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode271
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode271:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode273
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode273:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode275
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode275:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode277
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode277:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode297:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode299:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode301:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,232 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(-1610603004)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode157
NOP	
L_GCODE_Set_Motion_Mode302:
LH	R2, Offset(-1610603006)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode156
NOP	
L_GCODE_Set_Motion_Mode303:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode157:
L_GCODE_Set_Motion_Mode156:
;GCODE.c,234 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode305:
;GCODE.c,235 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode306
NOP	
J	L_GCODE_Set_Motion_Mode159
NOP	
L_GCODE_Set_Motion_Mode306:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode308
NOP	
J	L_GCODE_Set_Motion_Mode158
NOP	
L_GCODE_Set_Motion_Mode308:
L_GCODE_Set_Motion_Mode154:
;GCODE.c,236 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,235 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode159:
L_GCODE_Set_Motion_Mode158:
;GCODE.c,238 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,240 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode161
NOP	
L_GCODE_Set_Motion_Mode310:
LH	R2, Offset(-1610602990)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode312
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode312:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode314:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode160
NOP	
L_GCODE_Set_Motion_Mode315:
L_GCODE_Set_Motion_Mode153:
;GCODE.c,241 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,240 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode161:
L_GCODE_Set_Motion_Mode160:
;GCODE.c,244 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,251 :: 		return m_mode;
LH	R2, 10(SP)
;GCODE.c,252 :: 		}
;GCODE.c,251 :: 		return m_mode;
;GCODE.c,252 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,257 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,260 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,261 :: 		case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,262 :: 		case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,263 :: 		}
L_GCODE_Set_M_Modal_Commands76:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands318
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands318:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands320
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands320:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands322
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands322:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands324
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands324:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands326
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands326:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands328
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands328:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands330
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands330:
L_GCODE_Set_M_Modal_Commands77:
;GCODE.c,264 :: 		return m_num;
LH	R2, 0(SP)
;GCODE.c,265 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,268 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,269 :: 		FAIL(STATUS_OK);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
;GCODE.c,271 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,272 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands87:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,273 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands88:
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,274 :: 		case 2:
L_GCODE_Set_M_Commands89:
;GCODE.c,275 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,276 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,277 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,278 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands93:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,282 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,283 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,284 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands96:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,285 :: 		}
L_GCODE_Set_M_Commands85:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands333
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands333:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands335
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands335:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands337
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands337:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands339
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands339:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands341
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands341:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands343
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands343:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands345
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands345:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands347
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands347:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands349
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands349:
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands86:
;GCODE.c,286 :: 		return flow;
SEH	R2, R25
;GCODE.c,287 :: 		}
L_end_Set_M_Commands:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,295 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,297 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,302 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(-1610602988)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations351
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations351:
;GCODE.c,303 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,304 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,305 :: 		}
L_Check_group_multiple_violations97:
;GCODE.c,307 :: 		if(group_number > 0) {
LH	R2, Offset(-1610602988)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations352
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations352:
;GCODE.c,309 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(-1610602988)(GP)
BNE	R2, R3, L__Check_group_multiple_violations354
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations354:
;GCODE.c,310 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations99:
;GCODE.c,312 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
;GCODE.c,314 :: 		last_group_number = group_number;
LH	R2, Offset(-1610602988)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,318 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations355
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations355:
;GCODE.c,321 :: 		Rst_non_modalword();
JAL	_Rst_non_modalword+0
NOP	
;GCODE.c,323 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations356
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations356:
;GCODE.c,324 :: 		bit_true( non_modal_words,bit( non_modal_action));
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
;GCODE.c,343 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations357
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations357:
;GCODE.c,344 :: 		status_code = STATUS_OK;
SH	R0, Offset(-1610602986)(GP)
;GCODE.c,351 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations103
NOP	
;GCODE.c,352 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations105:
;GCODE.c,358 :: 		gc.frequency = 100;//lround(settings.default_seek_rate);
ORI	R2, R0, 100
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,359 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,361 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,362 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations106:
;GCODE.c,367 :: 		if (axis_words == 0) {
LH	R2, Offset(-1610603006)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations358
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations358:
;GCODE.c,368 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,369 :: 		}else {
J	L_Check_group_multiple_violations108
NOP	
L_Check_group_multiple_violations107:
;GCODE.c,371 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,372 :: 		}
L_Check_group_multiple_violations108:
;GCODE.c,373 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,374 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations109:
L_Check_group_multiple_violations110:
;GCODE.c,383 :: 		for(i=0;i<=3;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Check_group_multiple_violations111:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations359
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations359:
;GCODE.c,384 :: 		Set_Axisword(i);
SEH	R25, R4
JAL	_Set_Axisword+0
NOP	
;GCODE.c,383 :: 		for(i=0;i<=3;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;GCODE.c,384 :: 		Set_Axisword(i);
; i end address is: 16 (R4)
J	L_Check_group_multiple_violations111
NOP	
L_Check_group_multiple_violations112:
;GCODE.c,392 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,393 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations114:
;GCODE.c,395 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LH	R2, Offset(-1610603006)(GP)
BNE	R2, R0, L__Check_group_multiple_violations361
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations361:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations115:
;GCODE.c,396 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,397 :: 		}
L_Check_group_multiple_violations103:
LH	R2, Offset(-1610602990)(GP)
BNE	R2, R0, L__Check_group_multiple_violations363
NOP	
J	L_Check_group_multiple_violations105
NOP	
L__Check_group_multiple_violations363:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations365
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations365:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations367
NOP	
J	L_Check_group_multiple_violations109
NOP	
L__Check_group_multiple_violations367:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations369
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations369:
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations371
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations371:
L_Check_group_multiple_violations104:
;GCODE.c,399 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations116:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__Check_group_multiple_violations372
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations372:
;GCODE.c,400 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,399 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,401 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations116
NOP	
L_Check_group_multiple_violations117:
;GCODE.c,402 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,405 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations373
NOP	
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations373:
;GCODE.c,407 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations374
NOP	
J	L_Check_group_multiple_violations120
NOP	
L__Check_group_multiple_violations374:
;GCODE.c,408 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(-1610602986)(GP)
;GCODE.c,409 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,410 :: 		}else{
J	L_Check_group_multiple_violations121
NOP	
L_Check_group_multiple_violations120:
;GCODE.c,411 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,412 :: 		}
L_Check_group_multiple_violations121:
;GCODE.c,420 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,421 :: 		}
L_Check_group_multiple_violations119:
;GCODE.c,424 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations375
NOP	
J	L_Check_group_multiple_violations122
NOP	
L__Check_group_multiple_violations375:
;GCODE.c,431 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,432 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,433 :: 		}
L_Check_group_multiple_violations122:
;GCODE.c,436 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations376
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations376:
;GCODE.c,443 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,444 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,445 :: 		}
L_Check_group_multiple_violations123:
;GCODE.c,448 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations377
NOP	
J	L_Check_group_multiple_violations124
NOP	
L__Check_group_multiple_violations377:
;GCODE.c,455 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,456 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,457 :: 		}
L_Check_group_multiple_violations124:
;GCODE.c,460 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(-1610602988)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations378
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations378:
;GCODE.c,462 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations379
NOP	
J	L__Check_group_multiple_violations164
NOP	
L__Check_group_multiple_violations379:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations380
NOP	
J	L__Check_group_multiple_violations163
NOP	
L__Check_group_multiple_violations380:
J	L_Check_group_multiple_violations128
NOP	
L__Check_group_multiple_violations164:
L__Check_group_multiple_violations163:
;GCODE.c,463 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
J	L_Check_group_multiple_violations129
NOP	
L_Check_group_multiple_violations128:
;GCODE.c,465 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations129:
;GCODE.c,472 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,473 :: 		}
L_Check_group_multiple_violations125:
;GCODE.c,474 :: 		}
L_Check_group_multiple_violations98:
;GCODE.c,483 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,484 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,485 :: 		}
;GCODE.c,484 :: 		return status_code;
;GCODE.c,485 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,490 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,494 :: 		switch(c[0]){
SW	R25, 4(SP)
MOVZ	R2, R25, R0
SW	R2, 8(SP)
J	L_Instruction_Values130
NOP	
;GCODE.c,495 :: 		case 'X':case 'x':
L_Instruction_Values132:
L_Instruction_Values133:
;GCODE.c,497 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+52)(GP)
;GCODE.c,498 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 1
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,503 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,504 :: 		case 'Y':
L_Instruction_Values134:
;GCODE.c,506 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+56)(GP)
;GCODE.c,507 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 2
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,508 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,509 :: 		case 'Z':
L_Instruction_Values135:
;GCODE.c,511 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,512 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 4
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,513 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,514 :: 		case 'A':
L_Instruction_Values136:
;GCODE.c,516 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,517 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 8
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,518 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,519 :: 		case 'E':
L_Instruction_Values137:
;GCODE.c,521 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,522 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 16
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,523 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,524 :: 		case 'R':
L_Instruction_Values138:
;GCODE.c,526 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,527 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,528 :: 		case 'I':
L_Instruction_Values139:
;GCODE.c,529 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,530 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+72)(GP)
;GCODE.c,531 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,532 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,533 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,534 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,535 :: 		case 'J':
L_Instruction_Values140:
;GCODE.c,536 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,537 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,538 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,539 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,540 :: 		case 'K':
L_Instruction_Values141:
;GCODE.c,541 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,542 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,543 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,544 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,545 :: 		case 'F':
L_Instruction_Values142:
;GCODE.c,546 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
; XYZ_Val start address is: 16 (R4)
MOV.S 	S2, S1
;GCODE.c,547 :: 		if(XYZ_Val < 0){
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values382
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values382:
;GCODE.c,548 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,549 :: 		}
L_Instruction_Values143:
;GCODE.c,551 :: 		if (gc.inverse_feed_rate_mode) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__Instruction_Values384
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values384:
;GCODE.c,552 :: 		inverse_feed_rate = To_Millimeters(XYZ_Val); // seconds per motion for this motion only
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,553 :: 		} else {
J	L_Instruction_Values145
NOP	
L_Instruction_Values144:
;GCODE.c,554 :: 		gc.feed_rate = To_Millimeters(XYZ_Val); // millimeters per minute
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,555 :: 		}
L_Instruction_Values145:
;GCODE.c,556 :: 		gc.frequency = (unsigned long)XYZ_Val;
MOV.S 	S0, S2
; XYZ_Val end address is: 16 (R4)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,561 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,562 :: 		case 'P':
L_Instruction_Values146:
;GCODE.c,563 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,564 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values385
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values385:
;GCODE.c,565 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,566 :: 		}
L_Instruction_Values147:
;GCODE.c,567 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+88)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,568 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,569 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,570 :: 		case 'S':
L_Instruction_Values148:
;GCODE.c,571 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,572 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values386
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values386:
;GCODE.c,573 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,574 :: 		}
L_Instruction_Values149:
;GCODE.c,575 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+90)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,576 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,577 :: 		break;
J	L_Instruction_Values131
NOP	
;GCODE.c,578 :: 		case 'L':
L_Instruction_Values150:
;GCODE.c,579 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,580 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values387
NOP	
J	L_Instruction_Values151
NOP	
L__Instruction_Values387:
;GCODE.c,581 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,582 :: 		}
L_Instruction_Values151:
;GCODE.c,583 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,584 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values131
NOP	
;GCODE.c,585 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values152:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values131
NOP	
;GCODE.c,586 :: 		}
L_Instruction_Values130:
LW	R4, 8(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values389
NOP	
J	L_Instruction_Values132
NOP	
L__Instruction_Values389:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__Instruction_Values391
NOP	
J	L_Instruction_Values133
NOP	
L__Instruction_Values391:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values393
NOP	
J	L_Instruction_Values134
NOP	
L__Instruction_Values393:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values395
NOP	
J	L_Instruction_Values135
NOP	
L__Instruction_Values395:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values397
NOP	
J	L_Instruction_Values136
NOP	
L__Instruction_Values397:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values399
NOP	
J	L_Instruction_Values137
NOP	
L__Instruction_Values399:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values401
NOP	
J	L_Instruction_Values138
NOP	
L__Instruction_Values401:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values403
NOP	
J	L_Instruction_Values139
NOP	
L__Instruction_Values403:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values405
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values405:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values407
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values407:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values409
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values409:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values411
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values411:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values413
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values413:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values415
NOP	
J	L_Instruction_Values150
NOP	
L__Instruction_Values415:
J	L_Instruction_Values152
NOP	
L_Instruction_Values131:
;GCODE.c,596 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,597 :: 		}
;GCODE.c,596 :: 		return status_code;
;GCODE.c,597 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Instruction_Values
