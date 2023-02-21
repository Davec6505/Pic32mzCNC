GCODE_To_Millimeters:
;GCODE.c,40 :: 		static float To_Millimeters(float value){
;GCODE.c,41 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters203
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters203:
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
_Set_modalgroup:
;GCODE.c,65 :: 		void Set_modalgroup(int value){
;GCODE.c,66 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,67 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,70 :: 		int Get_modalgroup(){
;GCODE.c,71 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,72 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,74 :: 		int Rst_modalgroup(){
;GCODE.c,75 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,76 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,77 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_modalword:
;GCODE.c,82 :: 		void Set_modalword(int value){
;GCODE.c,83 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,84 :: 		}
L_end_Set_modalword:
JR	RA
NOP	
; end of _Set_modalword
_Get_modalword:
;GCODE.c,87 :: 		int Get_modalword(){
;GCODE.c,88 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,89 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,91 :: 		int Rst_modalword(){
;GCODE.c,92 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,93 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,94 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,97 :: 		int Get_Axisword(){
;GCODE.c,98 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,99 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,101 :: 		int Rst_Axisword(){
;GCODE.c,102 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,103 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,104 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,107 :: 		int Get_motionmode(){
;GCODE.c,108 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,109 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,111 :: 		int Rst_motionmode(){
;GCODE.c,112 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,113 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,114 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,118 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,119 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,120 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,121 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,122 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,126 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,128 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,129 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,131 :: 		while(DMA_IsOn(1));
L_M_Instruction2:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__M_Instruction219
NOP	
J	L_M_Instruction3
NOP	
L__M_Instruction219:
J	L_M_Instruction2
NOP	
L_M_Instruction3:
;GCODE.c,132 :: 		dma_printf("gc.program_flow:= %d\n",flow);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 22
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
;GCODE.c,134 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_Modal_Groups:
;GCODE.c,141 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,143 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups4
NOP	
;GCODE.c,144 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups6:
L_GCODE_Set_Modal_Groups7:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
;GCODE.c,145 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,146 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
L_GCODE_Set_Modal_Groups16:
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,147 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups19:
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,148 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,149 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,150 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups26:
L_GCODE_Set_Modal_Groups27:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,151 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
L_GCODE_Set_Modal_Groups30:
L_GCODE_Set_Modal_Groups31:
L_GCODE_Set_Modal_Groups32:
L_GCODE_Set_Modal_Groups33:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups5
NOP	
;GCODE.c,152 :: 		}
L_GCODE_Set_Modal_Groups4:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups222
NOP	
J	L_GCODE_Set_Modal_Groups6
NOP	
L_GCODE_Set_Modal_Groups222:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups224
NOP	
J	L_GCODE_Set_Modal_Groups7
NOP	
L_GCODE_Set_Modal_Groups224:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups226
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups226:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups228
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups228:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups230
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups230:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups232
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups232:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups234
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups234:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups236
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups236:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups238
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups238:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups240
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups240:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups242
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups242:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups244
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups244:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups246
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups246:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups248
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups248:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups250
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups250:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups252
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups252:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups254
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups254:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups256
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups256:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups258
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups258:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups260
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups260:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups262
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups262:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups264
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups264:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups266
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups266:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups268
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups268:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups270
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups270:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups272
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups272:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups274
NOP	
J	L_GCODE_Set_Modal_Groups32
NOP	
L_GCODE_Set_Modal_Groups274:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups276
NOP	
J	L_GCODE_Set_Modal_Groups33
NOP	
L_GCODE_Set_Modal_Groups276:
L_GCODE_Set_Modal_Groups5:
;GCODE.c,153 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,154 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,157 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,159 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,160 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode34
NOP	
;GCODE.c,161 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode36:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,162 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode37:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,163 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode38:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,164 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,165 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode40:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,166 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode41:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,167 :: 		case 17: Select_Plane(xy);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode42:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,168 :: 		case 18: Select_Plane(xz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode43:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,169 :: 		case 19: Select_Plane(yz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode44:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,170 :: 		case 20: gc.inches_mode = 1;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode45:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,171 :: 		case 21: gc.inches_mode = 0;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode46:
SB	R0, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,172 :: 		case 53: gc.absolute_override = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode47:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,173 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode48:
L_GCODE_Set_Motion_Mode49:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
L_GCODE_Set_Motion_Mode52:
L_GCODE_Set_Motion_Mode53:
;GCODE.c,174 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,175 :: 		return STATUS_OK;break;
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,176 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode54:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,177 :: 		case 90: gc.absolute_mode = true; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,178 :: 		case 91: gc.absolute_mode = false; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode56:
SB	R0, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,179 :: 		case 93: gc.inverse_feed_rate_mode = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,180 :: 		case 94: gc.inverse_feed_rate_mode = false;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode58:
SB	R0, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,181 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,182 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode60:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,183 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,184 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,185 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode63:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,186 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode64:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode35
NOP	
;GCODE.c,187 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode65:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,188 :: 		}
L_GCODE_Set_Motion_Mode34:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode279
NOP	
J	L_GCODE_Set_Motion_Mode36
NOP	
L_GCODE_Set_Motion_Mode279:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode281
NOP	
J	L_GCODE_Set_Motion_Mode37
NOP	
L_GCODE_Set_Motion_Mode281:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode283
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode283:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode285
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode285:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode287
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode287:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode289
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode289:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode291
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode291:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode293
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode293:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode295
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode295:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode297
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode297:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode299
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode299:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode301
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode301:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode303
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode303:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode305
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode305:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode307
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode307:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode309
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode309:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode311
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode311:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode313
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode313:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode315:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode317
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode317:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode319
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode319:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode321
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode321:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode323
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode323:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode325
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode325:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode327
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode327:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode329:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode331
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode331:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode333
NOP	
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode333:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode335
NOP	
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode335:
J	L_GCODE_Set_Motion_Mode65
NOP	
L_GCODE_Set_Motion_Mode35:
;GCODE.c,193 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode336
NOP	
J	L_GCODE_Set_Motion_Mode176
NOP	
L_GCODE_Set_Motion_Mode336:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode337
NOP	
J	L_GCODE_Set_Motion_Mode175
NOP	
L_GCODE_Set_Motion_Mode337:
J	L_GCODE_Set_Motion_Mode68
NOP	
L_GCODE_Set_Motion_Mode176:
L_GCODE_Set_Motion_Mode175:
;GCODE.c,195 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode339
NOP	
J	L_GCODE_Set_Motion_Mode69
NOP	
L_GCODE_Set_Motion_Mode339:
;GCODE.c,196 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode340
NOP	
J	L_GCODE_Set_Motion_Mode178
NOP	
L_GCODE_Set_Motion_Mode340:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode342
NOP	
J	L_GCODE_Set_Motion_Mode177
NOP	
L_GCODE_Set_Motion_Mode342:
L_GCODE_Set_Motion_Mode173:
;GCODE.c,197 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,196 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode178:
L_GCODE_Set_Motion_Mode177:
;GCODE.c,199 :: 		}
L_GCODE_Set_Motion_Mode69:
;GCODE.c,201 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode344
NOP	
J	L_GCODE_Set_Motion_Mode180
NOP	
L_GCODE_Set_Motion_Mode344:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode346
NOP	
J	L_GCODE_Set_Motion_Mode74
NOP	
L_GCODE_Set_Motion_Mode346:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode348
NOP	
J	L_GCODE_Set_Motion_Mode74
NOP	
L_GCODE_Set_Motion_Mode348:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode73
NOP	
L_GCODE_Set_Motion_Mode74:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode73:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode349
NOP	
J	L_GCODE_Set_Motion_Mode179
NOP	
L_GCODE_Set_Motion_Mode349:
L_GCODE_Set_Motion_Mode172:
;GCODE.c,202 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,201 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode180:
L_GCODE_Set_Motion_Mode179:
;GCODE.c,205 :: 		}
L_GCODE_Set_Motion_Mode68:
;GCODE.c,213 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,218 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,221 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands78
NOP	
;GCODE.c,222 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands80:
L_GCODE_Set_M_Modal_Commands81:
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands79
NOP	
;GCODE.c,223 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands84:
L_GCODE_Set_M_Modal_Commands85:
L_GCODE_Set_M_Modal_Commands86:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands79
NOP	
;GCODE.c,224 :: 		}
L_GCODE_Set_M_Modal_Commands78:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands352
NOP	
J	L_GCODE_Set_M_Modal_Commands80
NOP	
L_GCODE_Set_M_Modal_Commands352:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands354
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands354:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands356
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands356:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands358
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands358:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands360
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands360:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands362
NOP	
J	L_GCODE_Set_M_Modal_Commands85
NOP	
L_GCODE_Set_M_Modal_Commands362:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands364
NOP	
J	L_GCODE_Set_M_Modal_Commands86
NOP	
L_GCODE_Set_M_Modal_Commands364:
L_GCODE_Set_M_Modal_Commands79:
;GCODE.c,225 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,226 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,229 :: 		static int Set_M_Commands(int flow){
;GCODE.c,230 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,232 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands87
NOP	
;GCODE.c,233 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands89:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,234 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands90:
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,235 :: 		case 2:
L_GCODE_Set_M_Commands91:
;GCODE.c,236 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands92:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,237 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands93:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,238 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,239 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands95:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,243 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands96:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,244 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands97:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,245 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands98:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,246 :: 		}
L_GCODE_Set_M_Commands87:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands367
NOP	
J	L_GCODE_Set_M_Commands89
NOP	
L_GCODE_Set_M_Commands367:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands369
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands369:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands371
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands371:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands373
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands373:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands375
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands375:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands377
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands377:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands379
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands379:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands381
NOP	
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands381:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands383
NOP	
J	L_GCODE_Set_M_Commands97
NOP	
L_GCODE_Set_M_Commands383:
J	L_GCODE_Set_M_Commands98
NOP	
L_GCODE_Set_M_Commands88:
;GCODE.c,247 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,248 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,256 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,258 :: 		int i = 0;
;GCODE.c,263 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations385
NOP	
J	L_Check_group_multiple_violations99
NOP	
L__Check_group_multiple_violations385:
;GCODE.c,264 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,265 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,266 :: 		}
L_Check_group_multiple_violations99:
;GCODE.c,268 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations386
NOP	
J	L_Check_group_multiple_violations100
NOP	
L__Check_group_multiple_violations386:
;GCODE.c,270 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations388
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations388:
;GCODE.c,271 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations101:
;GCODE.c,273 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,275 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,279 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations389
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations389:
;GCODE.c,282 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,284 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations390
NOP	
J	L_Check_group_multiple_violations103
NOP	
L__Check_group_multiple_violations390:
;GCODE.c,285 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations103:
;GCODE.c,295 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,296 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,304 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations391
NOP	
J	L_Check_group_multiple_violations104
NOP	
L__Check_group_multiple_violations391:
;GCODE.c,305 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,312 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations105
NOP	
;GCODE.c,313 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations107:
;GCODE.c,315 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations393
NOP	
J	L_Check_group_multiple_violations108
NOP	
L__Check_group_multiple_violations393:
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations108:
;GCODE.c,316 :: 		break;
J	L_Check_group_multiple_violations106
NOP	
;GCODE.c,317 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations109:
;GCODE.c,318 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations394
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations394:
;GCODE.c,319 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,320 :: 		}else {
J	L_Check_group_multiple_violations111
NOP	
L_Check_group_multiple_violations110:
;GCODE.c,323 :: 		gc.frequency = settings.default_seek_rate;
LWC1	S0, Offset(_settings+20)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,324 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,325 :: 		}
L_Check_group_multiple_violations111:
;GCODE.c,326 :: 		break;
J	L_Check_group_multiple_violations106
NOP	
;GCODE.c,327 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations112:
;GCODE.c,332 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations395
NOP	
J	L_Check_group_multiple_violations113
NOP	
L__Check_group_multiple_violations395:
;GCODE.c,333 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,334 :: 		}else {
J	L_Check_group_multiple_violations114
NOP	
L_Check_group_multiple_violations113:
;GCODE.c,336 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,337 :: 		}
L_Check_group_multiple_violations114:
;GCODE.c,338 :: 		break;
J	L_Check_group_multiple_violations106
NOP	
;GCODE.c,339 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations115:
L_Check_group_multiple_violations116:
;GCODE.c,342 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+13)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,343 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations397
NOP	
J	L__Check_group_multiple_violations187
NOP	
L__Check_group_multiple_violations397:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations398
NOP	
J	L__Check_group_multiple_violations186
NOP	
L__Check_group_multiple_violations398:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations399
NOP	
J	L__Check_group_multiple_violations185
NOP	
L__Check_group_multiple_violations399:
LBU	R2, Offset(_gc+12)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations400
NOP	
J	L__Check_group_multiple_violations184
NOP	
L__Check_group_multiple_violations400:
J	L__Check_group_multiple_violations182
NOP	
L__Check_group_multiple_violations186:
L__Check_group_multiple_violations185:
L__Check_group_multiple_violations184:
J	L_Check_group_multiple_violations121
NOP	
L__Check_group_multiple_violations182:
L__Check_group_multiple_violations187:
;GCODE.c,344 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,345 :: 		} else {
J	L_Check_group_multiple_violations122
NOP	
L_Check_group_multiple_violations121:
;GCODE.c,346 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+100)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations401
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations401:
;GCODE.c,348 :: 		asm{nop;}
NOP	
;GCODE.c,349 :: 		}
L_Check_group_multiple_violations123:
;GCODE.c,350 :: 		}
L_Check_group_multiple_violations122:
;GCODE.c,351 :: 		break;
J	L_Check_group_multiple_violations106
NOP	
;GCODE.c,352 :: 		}
L_Check_group_multiple_violations105:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations403
NOP	
J	L_Check_group_multiple_violations107
NOP	
L__Check_group_multiple_violations403:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations405
NOP	
J	L_Check_group_multiple_violations109
NOP	
L__Check_group_multiple_violations405:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations407
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations407:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations409
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations409:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations411
NOP	
J	L_Check_group_multiple_violations116
NOP	
L__Check_group_multiple_violations411:
L_Check_group_multiple_violations106:
;GCODE.c,354 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations124:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations412
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations412:
;GCODE.c,355 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,354 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,356 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations124
NOP	
L_Check_group_multiple_violations125:
;GCODE.c,357 :: 		}
L_Check_group_multiple_violations104:
;GCODE.c,360 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations413
NOP	
J	L_Check_group_multiple_violations127
NOP	
L__Check_group_multiple_violations413:
;GCODE.c,362 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations414
NOP	
J	L_Check_group_multiple_violations128
NOP	
L__Check_group_multiple_violations414:
;GCODE.c,363 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,364 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,365 :: 		}else{
J	L_Check_group_multiple_violations129
NOP	
L_Check_group_multiple_violations128:
;GCODE.c,366 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,367 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,368 :: 		}
L_Check_group_multiple_violations129:
;GCODE.c,375 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,376 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,377 :: 		}
L_Check_group_multiple_violations127:
;GCODE.c,380 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations415
NOP	
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations415:
;GCODE.c,387 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,388 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,389 :: 		}
L_Check_group_multiple_violations130:
;GCODE.c,392 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations416
NOP	
J	L_Check_group_multiple_violations131
NOP	
L__Check_group_multiple_violations416:
;GCODE.c,399 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,400 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,401 :: 		}
L_Check_group_multiple_violations131:
;GCODE.c,404 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations417
NOP	
J	L_Check_group_multiple_violations132
NOP	
L__Check_group_multiple_violations417:
;GCODE.c,411 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,412 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,413 :: 		}
L_Check_group_multiple_violations132:
;GCODE.c,416 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations418
NOP	
J	L_Check_group_multiple_violations133
NOP	
L__Check_group_multiple_violations418:
;GCODE.c,418 :: 		if(gc.coord_select < 0|| gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations419
NOP	
J	L__Check_group_multiple_violations189
NOP	
L__Check_group_multiple_violations419:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations420
NOP	
J	L__Check_group_multiple_violations188
NOP	
L__Check_group_multiple_violations420:
J	L_Check_group_multiple_violations136
NOP	
L__Check_group_multiple_violations189:
L__Check_group_multiple_violations188:
;GCODE.c,419 :: 		status_code = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations137
NOP	
L_Check_group_multiple_violations136:
;GCODE.c,421 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations137:
;GCODE.c,428 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,429 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,430 :: 		}
L_Check_group_multiple_violations133:
;GCODE.c,431 :: 		}
L_Check_group_multiple_violations100:
;GCODE.c,440 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,441 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,442 :: 		}
L_end_Check_group_multiple_violations:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,447 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;GCODE.c,451 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 44(SP)
J	L_Instruction_Values138
NOP	
;GCODE.c,452 :: 		case 'X':
L_Instruction_Values140:
;GCODE.c,453 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,454 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,455 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,456 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,457 :: 		case 'Y':
L_Instruction_Values141:
;GCODE.c,458 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,459 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,460 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,461 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,462 :: 		case 'Z':
L_Instruction_Values142:
;GCODE.c,463 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,464 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,465 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,466 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,467 :: 		case 'A':
L_Instruction_Values143:
;GCODE.c,468 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,469 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,470 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,471 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,472 :: 		case 'E':
L_Instruction_Values144:
;GCODE.c,473 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,474 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,475 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,476 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,477 :: 		case 'R':
L_Instruction_Values145:
;GCODE.c,478 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,479 :: 		gc.R = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,480 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,481 :: 		case 'I':
L_Instruction_Values146:
;GCODE.c,482 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,483 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+100)(GP)
;GCODE.c,484 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,485 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,486 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,487 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,488 :: 		case 'J':
L_Instruction_Values147:
;GCODE.c,489 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,490 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,491 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,492 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,493 :: 		case 'K':
L_Instruction_Values148:
;GCODE.c,494 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,495 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,496 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,497 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,498 :: 		case 'F':
L_Instruction_Values149:
;GCODE.c,499 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 16(SP)
;GCODE.c,500 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values422
NOP	
J	L_Instruction_Values150
NOP	
L__Instruction_Values422:
;GCODE.c,501 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,502 :: 		}
L_Instruction_Values150:
;GCODE.c,509 :: 		gc.frequency = F_Val;
LH	R2, 16(SP)
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,510 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,511 :: 		case 'P':
L_Instruction_Values151:
;GCODE.c,512 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,513 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values423
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values423:
;GCODE.c,514 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,515 :: 		}
L_Instruction_Values152:
;GCODE.c,516 :: 		gc.P = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+116)(GP)
;GCODE.c,517 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+118)(GP)
;GCODE.c,518 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,519 :: 		case 'S':
L_Instruction_Values153:
;GCODE.c,520 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,521 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values424
NOP	
J	L_Instruction_Values154
NOP	
L__Instruction_Values424:
;GCODE.c,522 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,523 :: 		}
L_Instruction_Values154:
;GCODE.c,524 :: 		gc.S = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+118)(GP)
;GCODE.c,525 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+116)(GP)
;GCODE.c,526 :: 		break;
J	L_Instruction_Values139
NOP	
;GCODE.c,527 :: 		case 'L':
L_Instruction_Values155:
;GCODE.c,528 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,529 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values425
NOP	
J	L_Instruction_Values156
NOP	
L__Instruction_Values425:
;GCODE.c,530 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,531 :: 		}
L_Instruction_Values156:
;GCODE.c,532 :: 		gc.L = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+18)(GP)
;GCODE.c,533 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values139
NOP	
;GCODE.c,534 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values157:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_Instruction_Values139
NOP	
;GCODE.c,535 :: 		}
L_Instruction_Values138:
LW	R4, 44(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values427
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values427:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values429
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values429:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values431
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values431:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values433
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values433:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values435
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values435:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values437
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values437:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values439
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values439:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values441
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values441:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values443
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values443:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values445
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values445:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values447
NOP	
J	L_Instruction_Values151
NOP	
L__Instruction_Values447:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values449
NOP	
J	L_Instruction_Values153
NOP	
L__Instruction_Values449:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values451
NOP	
J	L_Instruction_Values155
NOP	
L__Instruction_Values451:
J	L_Instruction_Values157
NOP	
L_Instruction_Values139:
;GCODE.c,537 :: 		while(DMA_IsOn(1));
L_Instruction_Values158:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__Instruction_Values453
NOP	
J	L_Instruction_Values159
NOP	
L__Instruction_Values453:
J	L_Instruction_Values158
NOP	
L_Instruction_Values159:
;GCODE.c,538 :: 		if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values455
NOP	
J	L__Instruction_Values197
NOP	
L__Instruction_Values455:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values457
NOP	
J	L__Instruction_Values196
NOP	
L__Instruction_Values457:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values459
NOP	
J	L__Instruction_Values195
NOP	
L__Instruction_Values459:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values461
NOP	
J	L__Instruction_Values194
NOP	
L__Instruction_Values461:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values463
NOP	
J	L__Instruction_Values193
NOP	
L__Instruction_Values463:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values465
NOP	
J	L__Instruction_Values192
NOP	
L__Instruction_Values465:
J	L_Instruction_Values162
NOP	
L__Instruction_Values197:
L__Instruction_Values196:
L__Instruction_Values195:
L__Instruction_Values194:
L__Instruction_Values193:
L__Instruction_Values192:
;GCODE.c,539 :: 		dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
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
J	L_Instruction_Values163
NOP	
L_Instruction_Values162:
;GCODE.c,540 :: 		else if(c[0] == 'F')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BEQ	R3, R2, L__Instruction_Values466
NOP	
J	L_Instruction_Values164
NOP	
L__Instruction_Values466:
;GCODE.c,541 :: 		dma_printf("\t%c\t%d\n",c[0],F_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 28
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
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
J	L_Instruction_Values165
NOP	
L_Instruction_Values164:
;GCODE.c,542 :: 		else if(c[0] == 'S' ||  c[0] == 'P' || c[0] == 'L')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values468
NOP	
J	L__Instruction_Values200
NOP	
L__Instruction_Values468:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values470
NOP	
J	L__Instruction_Values199
NOP	
L__Instruction_Values470:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values472
NOP	
J	L__Instruction_Values198
NOP	
L__Instruction_Values472:
J	L_Instruction_Values168
NOP	
L__Instruction_Values200:
L__Instruction_Values199:
L__Instruction_Values198:
;GCODE.c,543 :: 		dma_printf("\t%c\t%d\n",c[0],O_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 36
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_GCODE+0)
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
L_Instruction_Values168:
L_Instruction_Values165:
L_Instruction_Values163:
;GCODE.c,545 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,546 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,552 :: 		void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,555 :: 		for(i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_gc_set_current_position169:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__gc_set_current_position474
NOP	
J	L_gc_set_current_position170
NOP	
L__gc_set_current_position474:
;GCODE.c,556 :: 		temp[i] = ulong2flt(settings.steps_per_mm[i]);
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
;GCODE.c,555 :: 		for(i=0;i<3;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,557 :: 		}
; i end address is: 20 (R5)
J	L_gc_set_current_position169
NOP	
L_gc_set_current_position170:
;GCODE.c,558 :: 		gc.position[X] = x/temp[X];
ADDIU	R3, SP, 20
MTC1	R25, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R3)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,559 :: 		gc.position[Y] = y/temp[Y];
ADDIU	R2, R3, 4
MTC1	R26, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,560 :: 		gc.position[Z] = z/temp[Z];
ADDIU	R2, R3, 8
MTC1	R27, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,561 :: 		}
L_end_gc_set_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _gc_set_current_position
