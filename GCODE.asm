GCODE_To_Millimeters:
;GCODE.c,45 :: 		static float To_Millimeters(float value){
;GCODE.c,46 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters168
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters168:
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
BNE	R3, R2, L_GCODE_Set_Modal_Groups187
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups187:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups189
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups189:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups191
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups191:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups193
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups193:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups195
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups195:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups197
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups197:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups199
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups199:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups201
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups201:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups203
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups203:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups205
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups205:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups207
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups207:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups209
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups209:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups211
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups211:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups213
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups213:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups215
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups215:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups217
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups217:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups219
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups219:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups221
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups221:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups223
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups223:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups225
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups225:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups227
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups227:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups229
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups229:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups231
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups231:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups233
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups233:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups235
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups235:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups237
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups237:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups239
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups239:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups241
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups241:
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
BNE	R2, R0, L_GCODE_Set_Motion_Mode244
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode244:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode246
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode246:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode248
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode248:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode250
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode250:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode252
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode252:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode254
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode254:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode256
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode256:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode258
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode258:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode260
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode260:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode262
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode262:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode264
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode264:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode266
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode266:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode268
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode268:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode270
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode270:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode272
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode272:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode274
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode274:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode276:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode278:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode280:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode282
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode282:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode284:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode286
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode286:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode288:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode290:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode292:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode294:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode296:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode298:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode300
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode300:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,222 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode158
NOP	
L_GCODE_Set_Motion_Mode301:
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode157
NOP	
L_GCODE_Set_Motion_Mode302:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode158:
L_GCODE_Set_Motion_Mode157:
;GCODE.c,224 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode304
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode304:
;GCODE.c,225 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode160
NOP	
L_GCODE_Set_Motion_Mode305:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode307
NOP	
J	L_GCODE_Set_Motion_Mode159
NOP	
L_GCODE_Set_Motion_Mode307:
L_GCODE_Set_Motion_Mode155:
;GCODE.c,226 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,225 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode160:
L_GCODE_Set_Motion_Mode159:
;GCODE.c,228 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,230 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode162
NOP	
L_GCODE_Set_Motion_Mode309:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode311:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode313:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode161
NOP	
L_GCODE_Set_Motion_Mode314:
L_GCODE_Set_Motion_Mode154:
;GCODE.c,231 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,230 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode162:
L_GCODE_Set_Motion_Mode161:
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
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands317
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands317:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands319
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands319:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands321
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands321:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands323
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands323:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands325
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands325:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands327
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands327:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands329
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands329:
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
BNE	R2, R0, L_GCODE_Set_M_Commands332
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands332:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands334
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands334:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands336
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands336:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands338
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands338:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands340
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands340:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands342
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands342:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands344
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands344:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands346
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands346:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands348
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands348:
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
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,287 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,292 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations350
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations350:
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
BEQ	R2, R0, L__Check_group_multiple_violations351
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations351:
;GCODE.c,299 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations353
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations353:
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
BEQ	R3, R2, L__Check_group_multiple_violations354
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations354:
;GCODE.c,311 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,313 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations355
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations355:
;GCODE.c,314 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations101:
;GCODE.c,324 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,325 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,333 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations356
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations356:
;GCODE.c,334 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,341 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations103
NOP	
;GCODE.c,342 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations105:
;GCODE.c,344 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LH	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations358
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations358:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations106:
;GCODE.c,345 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,346 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations107:
;GCODE.c,347 :: 		if (axis_words == 0) {
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations359
NOP	
J	L_Check_group_multiple_violations108
NOP	
L__Check_group_multiple_violations359:
;GCODE.c,348 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,349 :: 		}else {
J	L_Check_group_multiple_violations109
NOP	
L_Check_group_multiple_violations108:
;GCODE.c,352 :: 		gc.frequency = settings.default_seek_rate;
LWC1	S0, Offset(_settings+12)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,353 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,354 :: 		}
L_Check_group_multiple_violations109:
;GCODE.c,355 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,356 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations110:
;GCODE.c,361 :: 		if (axis_words == 0) {
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations360
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations360:
;GCODE.c,362 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,363 :: 		}else {
J	L_Check_group_multiple_violations112
NOP	
L_Check_group_multiple_violations111:
;GCODE.c,365 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,366 :: 		}
L_Check_group_multiple_violations112:
;GCODE.c,367 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,368 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations113:
L_Check_group_multiple_violations114:
;GCODE.c,377 :: 		for(i=0;i<=3;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Check_group_multiple_violations115:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations361
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations361:
;GCODE.c,378 :: 		Set_Axisword(i);
SEH	R25, R4
JAL	_Set_Axisword+0
NOP	
;GCODE.c,377 :: 		for(i=0;i<=3;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;GCODE.c,378 :: 		Set_Axisword(i);
; i end address is: 16 (R4)
J	L_Check_group_multiple_violations115
NOP	
L_Check_group_multiple_violations116:
;GCODE.c,386 :: 		break;
J	L_Check_group_multiple_violations104
NOP	
;GCODE.c,387 :: 		}
L_Check_group_multiple_violations103:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations363
NOP	
J	L_Check_group_multiple_violations105
NOP	
L__Check_group_multiple_violations363:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations365
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations365:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations367
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations367:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations369
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations369:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations371
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations371:
L_Check_group_multiple_violations104:
;GCODE.c,389 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations118:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__Check_group_multiple_violations372
NOP	
J	L_Check_group_multiple_violations119
NOP	
L__Check_group_multiple_violations372:
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
J	L_Check_group_multiple_violations118
NOP	
L_Check_group_multiple_violations119:
;GCODE.c,392 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,395 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations373
NOP	
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations373:
;GCODE.c,397 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations374
NOP	
J	L_Check_group_multiple_violations122
NOP	
L__Check_group_multiple_violations374:
;GCODE.c,398 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,399 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,400 :: 		}else{
J	L_Check_group_multiple_violations123
NOP	
L_Check_group_multiple_violations122:
;GCODE.c,401 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,402 :: 		}
L_Check_group_multiple_violations123:
;GCODE.c,410 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,411 :: 		}
L_Check_group_multiple_violations121:
;GCODE.c,414 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations375
NOP	
J	L_Check_group_multiple_violations124
NOP	
L__Check_group_multiple_violations375:
;GCODE.c,421 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,422 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,423 :: 		}
L_Check_group_multiple_violations124:
;GCODE.c,426 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations376
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations376:
;GCODE.c,433 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,434 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,435 :: 		}
L_Check_group_multiple_violations125:
;GCODE.c,438 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations377
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations377:
;GCODE.c,445 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,446 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,447 :: 		}
L_Check_group_multiple_violations126:
;GCODE.c,450 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations378
NOP	
J	L_Check_group_multiple_violations127
NOP	
L__Check_group_multiple_violations378:
;GCODE.c,452 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations379
NOP	
J	L__Check_group_multiple_violations165
NOP	
L__Check_group_multiple_violations379:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations380
NOP	
J	L__Check_group_multiple_violations164
NOP	
L__Check_group_multiple_violations380:
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations165:
L__Check_group_multiple_violations164:
;GCODE.c,453 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
J	L_Check_group_multiple_violations131
NOP	
L_Check_group_multiple_violations130:
;GCODE.c,455 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations131:
;GCODE.c,462 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,463 :: 		}
L_Check_group_multiple_violations127:
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
ADDIU	SP, SP, 8
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
J	L_Instruction_Values132
NOP	
;GCODE.c,485 :: 		case 'X':
L_Instruction_Values134:
;GCODE.c,487 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+52)(GP)
;GCODE.c,488 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,489 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,490 :: 		case 'Y':
L_Instruction_Values135:
;GCODE.c,492 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+56)(GP)
;GCODE.c,493 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,494 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,495 :: 		case 'Z':
L_Instruction_Values136:
;GCODE.c,497 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,498 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,499 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,500 :: 		case 'A':
L_Instruction_Values137:
;GCODE.c,502 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,503 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,504 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,505 :: 		case 'E':
L_Instruction_Values138:
;GCODE.c,507 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,508 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,509 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,510 :: 		case 'R':
L_Instruction_Values139:
;GCODE.c,512 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,513 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,514 :: 		case 'I':
L_Instruction_Values140:
;GCODE.c,515 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,516 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+72)(GP)
;GCODE.c,517 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,518 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,519 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,520 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,521 :: 		case 'J':
L_Instruction_Values141:
;GCODE.c,522 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,523 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,524 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,525 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,526 :: 		case 'K':
L_Instruction_Values142:
;GCODE.c,527 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,528 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,529 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,530 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,531 :: 		case 'F':
L_Instruction_Values143:
;GCODE.c,532 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
; XYZ_Val start address is: 16 (R4)
MOV.S 	S2, S1
;GCODE.c,533 :: 		if(XYZ_Val < 0){
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values382
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values382:
;GCODE.c,534 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,535 :: 		}
L_Instruction_Values144:
;GCODE.c,537 :: 		if (gc.inverse_feed_rate_mode) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__Instruction_Values384
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values384:
;GCODE.c,538 :: 		inverse_feed_rate = To_Millimeters(XYZ_Val); // seconds per motion for this motion only
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,539 :: 		} else {
J	L_Instruction_Values146
NOP	
L_Instruction_Values145:
;GCODE.c,540 :: 		gc.feed_rate = To_Millimeters(XYZ_Val); // millimeters per minute
MOV.S 	S12, S2
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,541 :: 		}
L_Instruction_Values146:
;GCODE.c,542 :: 		gc.frequency = (unsigned long)XYZ_Val;
MOV.S 	S0, S2
; XYZ_Val end address is: 16 (R4)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,547 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,548 :: 		case 'P':
L_Instruction_Values147:
;GCODE.c,549 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,550 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values385
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values385:
;GCODE.c,551 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,552 :: 		}
L_Instruction_Values148:
;GCODE.c,553 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+88)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,554 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,555 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,556 :: 		case 'S':
L_Instruction_Values149:
;GCODE.c,557 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,558 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values386
NOP	
J	L_Instruction_Values150
NOP	
L__Instruction_Values386:
;GCODE.c,559 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,560 :: 		}
L_Instruction_Values150:
;GCODE.c,561 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+90)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,562 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,563 :: 		break;
J	L_Instruction_Values133
NOP	
;GCODE.c,564 :: 		case 'L':
L_Instruction_Values151:
;GCODE.c,565 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,566 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values387
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values387:
;GCODE.c,567 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,568 :: 		}
L_Instruction_Values152:
;GCODE.c,569 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,570 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values133
NOP	
;GCODE.c,571 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values153:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values133
NOP	
;GCODE.c,572 :: 		}
L_Instruction_Values132:
LW	R4, 8(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values389
NOP	
J	L_Instruction_Values134
NOP	
L__Instruction_Values389:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values391
NOP	
J	L_Instruction_Values135
NOP	
L__Instruction_Values391:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values393
NOP	
J	L_Instruction_Values136
NOP	
L__Instruction_Values393:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values395
NOP	
J	L_Instruction_Values137
NOP	
L__Instruction_Values395:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values397
NOP	
J	L_Instruction_Values138
NOP	
L__Instruction_Values397:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values399
NOP	
J	L_Instruction_Values139
NOP	
L__Instruction_Values399:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values401
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values401:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values403
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values403:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values405
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values405:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values407
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values407:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values409
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values409:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values411
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values411:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values413
NOP	
J	L_Instruction_Values151
NOP	
L__Instruction_Values413:
J	L_Instruction_Values153
NOP	
L_Instruction_Values133:
;GCODE.c,582 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,583 :: 		}
;GCODE.c,582 :: 		return status_code;
;GCODE.c,583 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Instruction_Values
