GCODE_To_Millimeters:
;GCODE.c,45 :: 		static float To_Millimeters(float value){
;GCODE.c,46 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters192
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters192:
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
;GCODE.c,65 :: 		group_number         = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,66 :: 		axis_words           = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,67 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,68 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,69 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,70 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,71 :: 		gc.absolute_mode     = true;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,72 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Set_modalgroup:
;GCODE.c,76 :: 		void Set_modalgroup(int value){
;GCODE.c,77 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,78 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,81 :: 		int Get_modalgroup(){
;GCODE.c,82 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,83 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,85 :: 		int Rst_modalgroup(){
;GCODE.c,86 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,87 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,88 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_modalword:
;GCODE.c,93 :: 		void Set_modalword(int value){
;GCODE.c,94 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,95 :: 		}
L_end_Set_modalword:
JR	RA
NOP	
; end of _Set_modalword
_Get_modalword:
;GCODE.c,98 :: 		int Get_modalword(){
;GCODE.c,99 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,100 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,102 :: 		int Rst_modalword(){
;GCODE.c,103 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,104 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,105 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Set_Axisword:
;GCODE.c,110 :: 		void Set_Axisword(int value){
;GCODE.c,111 :: 		bit_true( axis_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
OR	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,112 :: 		}
L_end_Set_Axisword:
JR	RA
NOP	
; end of _Set_Axisword
_Get_Axisword:
;GCODE.c,115 :: 		int Get_Axisword(){
;GCODE.c,116 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,117 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,119 :: 		int Rst_Axisword(){
;GCODE.c,120 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,121 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,122 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,125 :: 		int Get_motionmode(){
;GCODE.c,126 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,127 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,129 :: 		int Rst_motionmode(){
;GCODE.c,130 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,131 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,132 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,136 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,137 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,138 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,139 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,140 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,144 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,146 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,147 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,152 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_Modal_Groups:
;GCODE.c,159 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,161 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups2
NOP	
;GCODE.c,162 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups4:
L_GCODE_Set_Modal_Groups5:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
;GCODE.c,163 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,164 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,165 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,166 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,167 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,168 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups3
NOP	
;GCODE.c,169 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,170 :: 		}
L_GCODE_Set_Modal_Groups2:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups211
NOP	
J	L_GCODE_Set_Modal_Groups4
NOP	
L_GCODE_Set_Modal_Groups211:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups213
NOP	
J	L_GCODE_Set_Modal_Groups5
NOP	
L_GCODE_Set_Modal_Groups213:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups215
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups215:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups217
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups217:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups219
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups219:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups221
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups221:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups223
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups223:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups225
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups225:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups227
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups227:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups229
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups229:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups231
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups231:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups233
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups233:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups235
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups235:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups237
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups237:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups239
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups239:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups241
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups241:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups243
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups243:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups245
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups245:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups247
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups247:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups249
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups249:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups251
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups251:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups253
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups253:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups255
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups255:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups257
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups257:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups259
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups259:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups261
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups261:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups263
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups263:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups265
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups265:
L_GCODE_Set_Modal_Groups3:
;GCODE.c,171 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,172 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,175 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,177 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,179 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode32
NOP	
;GCODE.c,180 :: 		case 0: m_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode34:
SH	R0, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,181 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode35:
ORI	R2, R0, 1
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,182 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode36:
ORI	R2, R0, 2
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,183 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 3
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,184 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,185 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,186 :: 		case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode40:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,187 :: 		case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode41:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,188 :: 		case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode42:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,189 :: 		case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,190 :: 		case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode44:
SB	R0, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,191 :: 		case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,192 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode46:
L_GCODE_Set_Motion_Mode47:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
;GCODE.c,193 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,194 :: 		m_mode = MOTION_MODE_NULL;break;
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,195 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,196 :: 		case 90: gc.absolute_mode = true; m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,197 :: 		case 91: gc.absolute_mode = false; m_mode   = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode54:
SB	R0, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,198 :: 		case 93: gc.inverse_feed_rate_mode = true;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,199 :: 		case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,200 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,201 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode58:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,202 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,203 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,204 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,205 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode33
NOP	
;GCODE.c,206 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode63:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,207 :: 		}
L_GCODE_Set_Motion_Mode32:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode268
NOP	
J	L_GCODE_Set_Motion_Mode34
NOP	
L_GCODE_Set_Motion_Mode268:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode270
NOP	
J	L_GCODE_Set_Motion_Mode35
NOP	
L_GCODE_Set_Motion_Mode270:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode272
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode272:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode274
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode274:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode276:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode278:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode280:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode282
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode282:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode284:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode286
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode286:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode288:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode290:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode292:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode294:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode296:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode298:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode300
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode300:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode302:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode304
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode304:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode306
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode306:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode308
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode308:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode310:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode312
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode312:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode314:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode316
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode316:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode318
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode318:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode320:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode322:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode324:
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode33:
;GCODE.c,212 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode325
NOP	
J	L_GCODE_Set_Motion_Mode176
NOP	
L_GCODE_Set_Motion_Mode325:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode175
NOP	
L_GCODE_Set_Motion_Mode326:
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode176:
L_GCODE_Set_Motion_Mode175:
;GCODE.c,214 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode328:
;GCODE.c,215 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode178
NOP	
L_GCODE_Set_Motion_Mode329:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode331
NOP	
J	L_GCODE_Set_Motion_Mode177
NOP	
L_GCODE_Set_Motion_Mode331:
L_GCODE_Set_Motion_Mode173:
;GCODE.c,216 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,215 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode178:
L_GCODE_Set_Motion_Mode177:
;GCODE.c,218 :: 		}
L_GCODE_Set_Motion_Mode67:
;GCODE.c,220 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode333
NOP	
J	L_GCODE_Set_Motion_Mode180
NOP	
L_GCODE_Set_Motion_Mode333:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode335
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode335:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode337
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode337:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode71:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode338
NOP	
J	L_GCODE_Set_Motion_Mode179
NOP	
L_GCODE_Set_Motion_Mode338:
L_GCODE_Set_Motion_Mode172:
;GCODE.c,221 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,220 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode180:
L_GCODE_Set_Motion_Mode179:
;GCODE.c,224 :: 		}
L_GCODE_Set_Motion_Mode66:
;GCODE.c,231 :: 		return m_mode;
LH	R2, 10(SP)
;GCODE.c,232 :: 		}
;GCODE.c,231 :: 		return m_mode;
;GCODE.c,232 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,237 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,240 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands76
NOP	
;GCODE.c,241 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands78:
L_GCODE_Set_M_Modal_Commands79:
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,242 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands77
NOP	
;GCODE.c,243 :: 		}
L_GCODE_Set_M_Modal_Commands76:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands341
NOP	
J	L_GCODE_Set_M_Modal_Commands78
NOP	
L_GCODE_Set_M_Modal_Commands341:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands343
NOP	
J	L_GCODE_Set_M_Modal_Commands79
NOP	
L_GCODE_Set_M_Modal_Commands343:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands345
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands345:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands347
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands347:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands349
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands349:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands351
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands351:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands353
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands353:
L_GCODE_Set_M_Modal_Commands77:
;GCODE.c,244 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,245 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,248 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,249 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,251 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands85
NOP	
;GCODE.c,252 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands87:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,253 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands88:
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,254 :: 		case 2:
L_GCODE_Set_M_Commands89:
;GCODE.c,255 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,256 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,257 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,258 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands93:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,262 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,263 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,264 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands96:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_GCODE_Set_M_Commands86
NOP	
;GCODE.c,265 :: 		}
L_GCODE_Set_M_Commands85:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands356
NOP	
J	L_GCODE_Set_M_Commands87
NOP	
L_GCODE_Set_M_Commands356:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands358
NOP	
J	L_GCODE_Set_M_Commands88
NOP	
L_GCODE_Set_M_Commands358:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands360
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands360:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands362
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands362:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands364
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands364:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands366
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands366:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands368
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands368:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands370
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands370:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands372
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands372:
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands86:
;GCODE.c,266 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,267 :: 		}
;GCODE.c,266 :: 		return status_code;
;GCODE.c,267 :: 		}
L_end_Set_M_Commands:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,275 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -228
SW	RA, 0(SP)
;GCODE.c,277 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,282 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations374
NOP	
J	L_Check_group_multiple_violations97
NOP	
L__Check_group_multiple_violations374:
;GCODE.c,283 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,284 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,285 :: 		}
L_Check_group_multiple_violations97:
;GCODE.c,287 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations375
NOP	
J	L_Check_group_multiple_violations98
NOP	
L__Check_group_multiple_violations375:
;GCODE.c,289 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations377
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations377:
;GCODE.c,290 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations99:
;GCODE.c,292 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,294 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,298 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations378
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations378:
;GCODE.c,301 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,303 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations379
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations379:
;GCODE.c,304 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations101:
;GCODE.c,307 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations102:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations381
NOP	
J	L_Check_group_multiple_violations103
NOP	
L__Check_group_multiple_violations381:
J	L_Check_group_multiple_violations102
NOP	
L_Check_group_multiple_violations103:
;GCODE.c,308 :: 		dma_printf("group_number:= %d\tgc.absolute_override:= %d\n"
ADDIU	R23, SP, 8
ADDIU	R22, R23, 45
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
;GCODE.c,309 :: 		,group_number,gc.absolute_override);
LBU	R2, Offset(_gc+4)(GP)
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
;GCODE.c,308 :: 		dma_printf("group_number:= %d\tgc.absolute_override:= %d\n"
SW	R3, 0(SP)
;GCODE.c,309 :: 		,group_number,gc.absolute_override);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,314 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,315 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,323 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations382
NOP	
J	L_Check_group_multiple_violations104
NOP	
L__Check_group_multiple_violations382:
;GCODE.c,324 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,326 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations105:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations384
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations384:
J	L_Check_group_multiple_violations105
NOP	
L_Check_group_multiple_violations106:
;GCODE.c,327 :: 		dma_printf("[group_number:= %d][motion_mode:= %d]\n"
ADDIU	R23, SP, 53
ADDIU	R22, R23, 39
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 53
;GCODE.c,328 :: 		,group_number,motion_mode);
LH	R2, Offset(GCODE_motion_mode+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
;GCODE.c,327 :: 		dma_printf("[group_number:= %d][motion_mode:= %d]\n"
SW	R3, 0(SP)
;GCODE.c,328 :: 		,group_number,motion_mode);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,331 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations107
NOP	
;GCODE.c,332 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations109:
;GCODE.c,334 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations386
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations386:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations110:
;GCODE.c,335 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,336 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations111:
;GCODE.c,337 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations387:
;GCODE.c,338 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,339 :: 		}else {
J	L_Check_group_multiple_violations113
NOP	
L_Check_group_multiple_violations112:
;GCODE.c,342 :: 		gc.frequency = settings.default_seek_rate;
LWC1	S0, Offset(_settings+12)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,343 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,344 :: 		}
L_Check_group_multiple_violations113:
;GCODE.c,345 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,346 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations114:
;GCODE.c,351 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations388
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations388:
;GCODE.c,352 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,353 :: 		}else {
J	L_Check_group_multiple_violations116
NOP	
L_Check_group_multiple_violations115:
;GCODE.c,355 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,356 :: 		}
L_Check_group_multiple_violations116:
;GCODE.c,357 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,358 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations117:
L_Check_group_multiple_violations118:
;GCODE.c,361 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+13)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,362 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations390
NOP	
J	L__Check_group_multiple_violations187
NOP	
L__Check_group_multiple_violations390:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations391
NOP	
J	L__Check_group_multiple_violations186
NOP	
L__Check_group_multiple_violations391:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations392
NOP	
J	L__Check_group_multiple_violations185
NOP	
L__Check_group_multiple_violations392:
LBU	R2, Offset(_gc+12)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations393
NOP	
J	L__Check_group_multiple_violations184
NOP	
L__Check_group_multiple_violations393:
J	L__Check_group_multiple_violations182
NOP	
L__Check_group_multiple_violations186:
L__Check_group_multiple_violations185:
L__Check_group_multiple_violations184:
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations182:
L__Check_group_multiple_violations187:
;GCODE.c,363 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,364 :: 		} else {
J	L_Check_group_multiple_violations124
NOP	
L_Check_group_multiple_violations123:
;GCODE.c,366 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations125:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations395
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations395:
J	L_Check_group_multiple_violations125
NOP	
L_Check_group_multiple_violations126:
;GCODE.c,367 :: 		dma_printf("%s\taxis_words:= %d\n","ARC",axis_words&0x00ff);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
ADDIU	R23, SP, 92
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_GCODE+0)
ORI	R2, R2, lo_addr(?lstr_4_GCODE+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,369 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+72)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations396
NOP	
J	L_Check_group_multiple_violations127
NOP	
L__Check_group_multiple_violations396:
;GCODE.c,371 :: 		asm{nop;}
NOP	
;GCODE.c,372 :: 		}
L_Check_group_multiple_violations127:
;GCODE.c,373 :: 		}
L_Check_group_multiple_violations124:
;GCODE.c,374 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,375 :: 		}
L_Check_group_multiple_violations107:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations398
NOP	
J	L_Check_group_multiple_violations109
NOP	
L__Check_group_multiple_violations398:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations400
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations400:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations402
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations402:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations404
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations404:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations406
NOP	
J	L_Check_group_multiple_violations118
NOP	
L__Check_group_multiple_violations406:
L_Check_group_multiple_violations108:
;GCODE.c,377 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations128:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__Check_group_multiple_violations407
NOP	
J	L_Check_group_multiple_violations129
NOP	
L__Check_group_multiple_violations407:
;GCODE.c,378 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,377 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,379 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations128
NOP	
L_Check_group_multiple_violations129:
;GCODE.c,380 :: 		}
L_Check_group_multiple_violations104:
;GCODE.c,383 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations408
NOP	
J	L_Check_group_multiple_violations131
NOP	
L__Check_group_multiple_violations408:
;GCODE.c,385 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations409
NOP	
J	L_Check_group_multiple_violations132
NOP	
L__Check_group_multiple_violations409:
;GCODE.c,386 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,387 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,388 :: 		}else{
J	L_Check_group_multiple_violations133
NOP	
L_Check_group_multiple_violations132:
;GCODE.c,389 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,390 :: 		}
L_Check_group_multiple_violations133:
;GCODE.c,393 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations134:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations411
NOP	
J	L_Check_group_multiple_violations135
NOP	
L__Check_group_multiple_violations411:
J	L_Check_group_multiple_violations134
NOP	
L_Check_group_multiple_violations135:
;GCODE.c,394 :: 		dma_printf("axis_xyz:= %d\n",axis_xyz);
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
;GCODE.c,398 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,399 :: 		}
L_Check_group_multiple_violations131:
;GCODE.c,402 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations412
NOP	
J	L_Check_group_multiple_violations136
NOP	
L__Check_group_multiple_violations412:
;GCODE.c,405 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations137:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations414
NOP	
J	L_Check_group_multiple_violations138
NOP	
L__Check_group_multiple_violations414:
J	L_Check_group_multiple_violations137
NOP	
L_Check_group_multiple_violations138:
;GCODE.c,406 :: 		dma_printf("gc.absolute_mode:= %d\n",gc.absolute_mode);
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
;GCODE.c,409 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,410 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,411 :: 		}
L_Check_group_multiple_violations136:
;GCODE.c,414 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations415
NOP	
J	L_Check_group_multiple_violations139
NOP	
L__Check_group_multiple_violations415:
;GCODE.c,417 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations140:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations417
NOP	
J	L_Check_group_multiple_violations141
NOP	
L__Check_group_multiple_violations417:
J	L_Check_group_multiple_violations140
NOP	
L_Check_group_multiple_violations141:
;GCODE.c,418 :: 		dma_printf("gc.inverse_feed_rate_mode:= %d\n",gc.inverse_feed_rate_mode);
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
;GCODE.c,421 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,422 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,423 :: 		}
L_Check_group_multiple_violations139:
;GCODE.c,426 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations418
NOP	
J	L_Check_group_multiple_violations142
NOP	
L__Check_group_multiple_violations418:
;GCODE.c,429 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations143:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations420
NOP	
J	L_Check_group_multiple_violations144
NOP	
L__Check_group_multiple_violations420:
J	L_Check_group_multiple_violations143
NOP	
L_Check_group_multiple_violations144:
;GCODE.c,430 :: 		dma_printf("gc.inches_mode:= %d\n",gc.inches_mode);
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
;GCODE.c,433 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,434 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,435 :: 		}
L_Check_group_multiple_violations142:
;GCODE.c,438 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations421
NOP	
J	L_Check_group_multiple_violations145
NOP	
L__Check_group_multiple_violations421:
;GCODE.c,440 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations422
NOP	
J	L__Check_group_multiple_violations189
NOP	
L__Check_group_multiple_violations422:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations423
NOP	
J	L__Check_group_multiple_violations188
NOP	
L__Check_group_multiple_violations423:
J	L_Check_group_multiple_violations148
NOP	
L__Check_group_multiple_violations189:
L__Check_group_multiple_violations188:
;GCODE.c,441 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
J	L_Check_group_multiple_violations149
NOP	
L_Check_group_multiple_violations148:
;GCODE.c,443 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations149:
;GCODE.c,446 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations150:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations425
NOP	
J	L_Check_group_multiple_violations151
NOP	
L__Check_group_multiple_violations425:
J	L_Check_group_multiple_violations150
NOP	
L_Check_group_multiple_violations151:
;GCODE.c,447 :: 		dma_printf("gc.coord_select:= %d\n",gc.coord_select);
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
;GCODE.c,450 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,451 :: 		}
L_Check_group_multiple_violations145:
;GCODE.c,452 :: 		}
L_Check_group_multiple_violations98:
;GCODE.c,461 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,462 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,463 :: 		}
;GCODE.c,462 :: 		return status_code;
;GCODE.c,463 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 228
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,468 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,472 :: 		switch(c[0]){
SW	R25, 4(SP)
MOVZ	R2, R25, R0
SW	R2, 8(SP)
J	L_Instruction_Values152
NOP	
;GCODE.c,473 :: 		case 'X':
L_Instruction_Values154:
;GCODE.c,475 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+52)(GP)
;GCODE.c,476 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,477 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,478 :: 		case 'Y':
L_Instruction_Values155:
;GCODE.c,480 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+56)(GP)
;GCODE.c,481 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,482 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,483 :: 		case 'Z':
L_Instruction_Values156:
;GCODE.c,485 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,486 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,487 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,488 :: 		case 'A':
L_Instruction_Values157:
;GCODE.c,490 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,491 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,492 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,493 :: 		case 'E':
L_Instruction_Values158:
;GCODE.c,495 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,496 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,497 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,498 :: 		case 'R':
L_Instruction_Values159:
;GCODE.c,500 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,501 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,502 :: 		case 'I':
L_Instruction_Values160:
;GCODE.c,503 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,504 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+72)(GP)
;GCODE.c,505 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,506 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,507 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,508 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,509 :: 		case 'J':
L_Instruction_Values161:
;GCODE.c,510 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,511 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,512 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,513 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,514 :: 		case 'K':
L_Instruction_Values162:
;GCODE.c,515 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,516 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,517 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,518 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,519 :: 		case 'F':
L_Instruction_Values163:
;GCODE.c,520 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,521 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values427
NOP	
J	L_Instruction_Values164
NOP	
L__Instruction_Values427:
;GCODE.c,522 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,523 :: 		}
L_Instruction_Values164:
;GCODE.c,530 :: 		gc.frequency = (unsigned long)F_Val;
SEH	R2, R3
; F_Val end address is: 12 (R3)
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,535 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,536 :: 		case 'P':
L_Instruction_Values165:
;GCODE.c,537 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,538 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values428
NOP	
J	L_Instruction_Values166
NOP	
L__Instruction_Values428:
;GCODE.c,539 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,540 :: 		}
L_Instruction_Values166:
;GCODE.c,541 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+88)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,542 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,543 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,544 :: 		case 'S':
L_Instruction_Values167:
;GCODE.c,545 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,546 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values429
NOP	
J	L_Instruction_Values168
NOP	
L__Instruction_Values429:
;GCODE.c,547 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,548 :: 		}
L_Instruction_Values168:
;GCODE.c,549 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+90)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,550 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,551 :: 		break;
J	L_Instruction_Values153
NOP	
;GCODE.c,552 :: 		case 'L':
L_Instruction_Values169:
;GCODE.c,553 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,554 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values430
NOP	
J	L_Instruction_Values170
NOP	
L__Instruction_Values430:
;GCODE.c,555 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,556 :: 		}
L_Instruction_Values170:
;GCODE.c,557 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,558 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values153
NOP	
;GCODE.c,559 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values171:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values153
NOP	
;GCODE.c,560 :: 		}
L_Instruction_Values152:
LW	R4, 8(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values432
NOP	
J	L_Instruction_Values154
NOP	
L__Instruction_Values432:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values434
NOP	
J	L_Instruction_Values155
NOP	
L__Instruction_Values434:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values436
NOP	
J	L_Instruction_Values156
NOP	
L__Instruction_Values436:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values438
NOP	
J	L_Instruction_Values157
NOP	
L__Instruction_Values438:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values440
NOP	
J	L_Instruction_Values158
NOP	
L__Instruction_Values440:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values442
NOP	
J	L_Instruction_Values159
NOP	
L__Instruction_Values442:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values444
NOP	
J	L_Instruction_Values160
NOP	
L__Instruction_Values444:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values446
NOP	
J	L_Instruction_Values161
NOP	
L__Instruction_Values446:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values448
NOP	
J	L_Instruction_Values162
NOP	
L__Instruction_Values448:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values450
NOP	
J	L_Instruction_Values163
NOP	
L__Instruction_Values450:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values452
NOP	
J	L_Instruction_Values165
NOP	
L__Instruction_Values452:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values454
NOP	
J	L_Instruction_Values167
NOP	
L__Instruction_Values454:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values456
NOP	
J	L_Instruction_Values169
NOP	
L__Instruction_Values456:
J	L_Instruction_Values171
NOP	
L_Instruction_Values153:
;GCODE.c,570 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,571 :: 		}
;GCODE.c,570 :: 		return status_code;
;GCODE.c,571 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,577 :: 		void gc_set_current_position(long x,long y,long z){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;GCODE.c,578 :: 		gc.position[X] = beltsteps2mm(x,X);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R26, 16(SP)
MOVZ	R26, R0, R0
JAL	_beltsteps2mm+0
NOP	
LW	R26, 16(SP)
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,579 :: 		gc.position[Y] = beltsteps2mm(y,Y);
MOVZ	R25, R26, R0
ORI	R26, R0, 1
JAL	_beltsteps2mm+0
NOP	
LW	R27, 12(SP)
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,580 :: 		gc.position[Z] = beltsteps2mm(z,Z);
ORI	R26, R0, 2
MOVZ	R25, R27, R0
JAL	_beltsteps2mm+0
NOP	
SWC1	S0, Offset(_gc+36)(GP)
;GCODE.c,581 :: 		}
L_end_gc_set_current_position:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _gc_set_current_position
