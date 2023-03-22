GCODE_To_Millimeters:
;GCODE.c,45 :: 		static float To_Millimeters(float value){
;GCODE.c,46 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters196
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters196:
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
SH	R0, Offset(GCODE_axis_words+0)(GP)
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
LH	R2, Offset(GCODE_axis_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,112 :: 		}
L_end_Set_Axisword:
JR	RA
NOP	
; end of _Set_Axisword
_Get_Axisword:
;GCODE.c,120 :: 		int Get_Axisword(){
;GCODE.c,121 :: 		return axis_words & 0x0fff;
LH	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 4095
;GCODE.c,122 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,124 :: 		int Rst_Axisword(){
;GCODE.c,125 :: 		axis_words = 0;
SH	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,126 :: 		return axis_words;
LH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,127 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,130 :: 		int Get_motionmode(){
;GCODE.c,131 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,132 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,134 :: 		int Rst_motionmode(){
;GCODE.c,135 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,136 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,137 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,141 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;GCODE.c,143 :: 		while(DMA_IsOn(1));
L_G_Mode2:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__G_Mode213
NOP	
J	L_G_Mode3
NOP	
L__G_Mode213:
J	L_G_Mode2
NOP	
L_G_Mode3:
;GCODE.c,144 :: 		dma_printf("mode:= %d\n",mode);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 11
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
;GCODE.c,146 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,147 :: 		motion_mode  = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,148 :: 		return mode;//motion_mode;
SEH	R2, R25
;GCODE.c,149 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,153 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;GCODE.c,155 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,156 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,158 :: 		while(DMA_IsOn(1));
L_M_Instruction4:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__M_Instruction216
NOP	
J	L_M_Instruction5
NOP	
L__M_Instruction216:
J	L_M_Instruction4
NOP	
L_M_Instruction5:
;GCODE.c,159 :: 		dma_printf("gc.program_flow:= %d\n",flow);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
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
;GCODE.c,161 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _M_Instruction
GCODE_Set_Modal_Groups:
;GCODE.c,168 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,170 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups6
NOP	
;GCODE.c,171 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups8:
L_GCODE_Set_Modal_Groups9:
L_GCODE_Set_Modal_Groups10:
L_GCODE_Set_Modal_Groups11:
L_GCODE_Set_Modal_Groups12:
L_GCODE_Set_Modal_Groups13:
L_GCODE_Set_Modal_Groups14:
L_GCODE_Set_Modal_Groups15:
;GCODE.c,172 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,173 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups16:
L_GCODE_Set_Modal_Groups17:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
L_GCODE_Set_Modal_Groups20:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,174 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups21:
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,175 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,176 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups26:
L_GCODE_Set_Modal_Groups27:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,177 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,178 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups30:
L_GCODE_Set_Modal_Groups31:
L_GCODE_Set_Modal_Groups32:
L_GCODE_Set_Modal_Groups33:
L_GCODE_Set_Modal_Groups34:
L_GCODE_Set_Modal_Groups35:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups7
NOP	
;GCODE.c,179 :: 		}
L_GCODE_Set_Modal_Groups6:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups219
NOP	
J	L_GCODE_Set_Modal_Groups8
NOP	
L_GCODE_Set_Modal_Groups219:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups221
NOP	
J	L_GCODE_Set_Modal_Groups9
NOP	
L_GCODE_Set_Modal_Groups221:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups223
NOP	
J	L_GCODE_Set_Modal_Groups10
NOP	
L_GCODE_Set_Modal_Groups223:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups225
NOP	
J	L_GCODE_Set_Modal_Groups11
NOP	
L_GCODE_Set_Modal_Groups225:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups227
NOP	
J	L_GCODE_Set_Modal_Groups12
NOP	
L_GCODE_Set_Modal_Groups227:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups229
NOP	
J	L_GCODE_Set_Modal_Groups13
NOP	
L_GCODE_Set_Modal_Groups229:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups231
NOP	
J	L_GCODE_Set_Modal_Groups14
NOP	
L_GCODE_Set_Modal_Groups231:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups233
NOP	
J	L_GCODE_Set_Modal_Groups15
NOP	
L_GCODE_Set_Modal_Groups233:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups235
NOP	
J	L_GCODE_Set_Modal_Groups16
NOP	
L_GCODE_Set_Modal_Groups235:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups237
NOP	
J	L_GCODE_Set_Modal_Groups17
NOP	
L_GCODE_Set_Modal_Groups237:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups239
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups239:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups241
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups241:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups243
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups243:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups245
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups245:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups247
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups247:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups249
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups249:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups251
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups251:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups253
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups253:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups255
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups255:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups257
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups257:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups259
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups259:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups261
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups261:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups263
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups263:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups265
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups265:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups267
NOP	
J	L_GCODE_Set_Modal_Groups32
NOP	
L_GCODE_Set_Modal_Groups267:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups269
NOP	
J	L_GCODE_Set_Modal_Groups33
NOP	
L_GCODE_Set_Modal_Groups269:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups271
NOP	
J	L_GCODE_Set_Modal_Groups34
NOP	
L_GCODE_Set_Modal_Groups271:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups273
NOP	
J	L_GCODE_Set_Modal_Groups35
NOP	
L_GCODE_Set_Modal_Groups273:
L_GCODE_Set_Modal_Groups7:
;GCODE.c,180 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,181 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,184 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,186 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,188 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode36
NOP	
;GCODE.c,189 :: 		case 0: m_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode38:
SH	R0, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,190 :: 		case 1: m_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode39:
ORI	R2, R0, 1
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,191 :: 		case 2: m_mode    = MOTION_MODE_CW_ARC;gc.DIR = CW;  break;
L_GCODE_Set_Motion_Mode40:
ORI	R2, R0, 2
SH	R2, 10(SP)
SH	R0, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,192 :: 		case 3: m_mode    = MOTION_MODE_CCW_ARC;gc.DIR = CCW; break;
L_GCODE_Set_Motion_Mode41:
ORI	R2, R0, 3
SH	R2, 10(SP)
ORI	R2, R0, 1
SH	R2, Offset(_gc+92)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,193 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode42:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,194 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode43:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,195 :: 		case 17: Select_Plane(xy);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode44:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,196 :: 		case 18: Select_Plane(xz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode45:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,197 :: 		case 19: Select_Plane(yz);m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode46:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,198 :: 		case 20: gc.inches_mode = 1;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode47:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,199 :: 		case 21: gc.inches_mode = 0;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode48:
SB	R0, Offset(_gc+3)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,200 :: 		case 53: gc.absolute_override = true;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode49:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,201 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode50:
L_GCODE_Set_Motion_Mode51:
L_GCODE_Set_Motion_Mode52:
L_GCODE_Set_Motion_Mode53:
L_GCODE_Set_Motion_Mode54:
L_GCODE_Set_Motion_Mode55:
;GCODE.c,202 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,203 :: 		m_mode = MOTION_MODE_NULL;break;
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,204 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode56:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,205 :: 		case 90: gc.absolute_mode = true; m_mode    = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode57:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,206 :: 		case 91: gc.absolute_mode = false; m_mode   = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode58:
SB	R0, Offset(_gc+5)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,207 :: 		case 93: gc.inverse_feed_rate_mode = true;m_mode  = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,208 :: 		case 94: gc.inverse_feed_rate_mode = false;m_mode = MOTION_MODE_NULL; break;
L_GCODE_Set_Motion_Mode60:
SB	R0, Offset(_gc+2)(GP)
ORI	R2, R0, 6
SH	R2, 10(SP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,209 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,210 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode62:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,211 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode63:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,212 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode64:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,213 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode65:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,214 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode66:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode37
NOP	
;GCODE.c,215 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode67:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,216 :: 		}
L_GCODE_Set_Motion_Mode36:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode38
NOP	
L_GCODE_Set_Motion_Mode276:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode39
NOP	
L_GCODE_Set_Motion_Mode278:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode40
NOP	
L_GCODE_Set_Motion_Mode280:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode282
NOP	
J	L_GCODE_Set_Motion_Mode41
NOP	
L_GCODE_Set_Motion_Mode282:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode42
NOP	
L_GCODE_Set_Motion_Mode284:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode286
NOP	
J	L_GCODE_Set_Motion_Mode43
NOP	
L_GCODE_Set_Motion_Mode286:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode44
NOP	
L_GCODE_Set_Motion_Mode288:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode45
NOP	
L_GCODE_Set_Motion_Mode290:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode46
NOP	
L_GCODE_Set_Motion_Mode292:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode47
NOP	
L_GCODE_Set_Motion_Mode294:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
L_GCODE_Set_Motion_Mode296:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode298:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode300
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode300:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode302
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode302:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode304
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode304:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode306
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode306:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode308
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode308:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode310:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode312
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode312:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode314:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode316
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode316:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode318
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode318:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode320:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode322:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode324:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode326:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode328:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode330
NOP	
J	L_GCODE_Set_Motion_Mode65
NOP	
L_GCODE_Set_Motion_Mode330:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode332
NOP	
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode332:
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode37:
;GCODE.c,221 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode333
NOP	
J	L_GCODE_Set_Motion_Mode175
NOP	
L_GCODE_Set_Motion_Mode333:
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode334
NOP	
J	L_GCODE_Set_Motion_Mode174
NOP	
L_GCODE_Set_Motion_Mode334:
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode175:
L_GCODE_Set_Motion_Mode174:
;GCODE.c,223 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode336
NOP	
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode336:
;GCODE.c,224 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode337
NOP	
J	L_GCODE_Set_Motion_Mode177
NOP	
L_GCODE_Set_Motion_Mode337:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode339
NOP	
J	L_GCODE_Set_Motion_Mode176
NOP	
L_GCODE_Set_Motion_Mode339:
L_GCODE_Set_Motion_Mode172:
;GCODE.c,225 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,224 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode177:
L_GCODE_Set_Motion_Mode176:
;GCODE.c,227 :: 		}
L_GCODE_Set_Motion_Mode71:
;GCODE.c,229 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode341
NOP	
J	L_GCODE_Set_Motion_Mode179
NOP	
L_GCODE_Set_Motion_Mode341:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode343
NOP	
J	L_GCODE_Set_Motion_Mode76
NOP	
L_GCODE_Set_Motion_Mode343:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode345
NOP	
J	L_GCODE_Set_Motion_Mode76
NOP	
L_GCODE_Set_Motion_Mode345:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode75
NOP	
L_GCODE_Set_Motion_Mode76:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode75:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode346
NOP	
J	L_GCODE_Set_Motion_Mode178
NOP	
L_GCODE_Set_Motion_Mode346:
L_GCODE_Set_Motion_Mode171:
;GCODE.c,230 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,229 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode179:
L_GCODE_Set_Motion_Mode178:
;GCODE.c,233 :: 		}
L_GCODE_Set_Motion_Mode70:
;GCODE.c,240 :: 		return m_mode;
LH	R2, 10(SP)
;GCODE.c,241 :: 		}
;GCODE.c,240 :: 		return m_mode;
;GCODE.c,241 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,246 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,249 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands80
NOP	
;GCODE.c,250 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
L_GCODE_Set_M_Modal_Commands85:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands81
NOP	
;GCODE.c,251 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands86:
L_GCODE_Set_M_Modal_Commands87:
L_GCODE_Set_M_Modal_Commands88:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands81
NOP	
;GCODE.c,252 :: 		}
L_GCODE_Set_M_Modal_Commands80:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands349
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands349:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands351
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands351:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands353
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands353:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands355
NOP	
J	L_GCODE_Set_M_Modal_Commands85
NOP	
L_GCODE_Set_M_Modal_Commands355:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands357
NOP	
J	L_GCODE_Set_M_Modal_Commands86
NOP	
L_GCODE_Set_M_Modal_Commands357:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands359
NOP	
J	L_GCODE_Set_M_Modal_Commands87
NOP	
L_GCODE_Set_M_Modal_Commands359:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands361
NOP	
J	L_GCODE_Set_M_Modal_Commands88
NOP	
L_GCODE_Set_M_Modal_Commands361:
L_GCODE_Set_M_Modal_Commands81:
;GCODE.c,253 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,254 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,257 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,258 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,260 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,261 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands91:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,262 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands92:
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,263 :: 		case 2:
L_GCODE_Set_M_Commands93:
;GCODE.c,264 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands94:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,265 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands95:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,266 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands96:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,267 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands97:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,271 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands98:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,272 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands99:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,273 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands100:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
;GCODE.c,274 :: 		}
L_GCODE_Set_M_Commands89:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands364
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands364:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands366
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands366:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands368
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands368:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands370
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands370:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands372
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands372:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands374
NOP	
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands374:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands376
NOP	
J	L_GCODE_Set_M_Commands97
NOP	
L_GCODE_Set_M_Commands376:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands378
NOP	
J	L_GCODE_Set_M_Commands98
NOP	
L_GCODE_Set_M_Commands378:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands380
NOP	
J	L_GCODE_Set_M_Commands99
NOP	
L_GCODE_Set_M_Commands380:
J	L_GCODE_Set_M_Commands100
NOP	
L_GCODE_Set_M_Commands90:
;GCODE.c,275 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,276 :: 		}
;GCODE.c,275 :: 		return status_code;
;GCODE.c,276 :: 		}
L_end_Set_M_Commands:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,284 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,286 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,291 :: 		if(group_number == MODAL_GROUP_NONE){
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations382
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations382:
;GCODE.c,292 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,293 :: 		return STATUS_MODAL_GROUP_VIOLATION;
ORI	R2, R0, 5
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,294 :: 		}
L_Check_group_multiple_violations101:
;GCODE.c,296 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations383
NOP	
J	L_Check_group_multiple_violations102
NOP	
L__Check_group_multiple_violations383:
;GCODE.c,298 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations385
NOP	
J	L_Check_group_multiple_violations103
NOP	
L__Check_group_multiple_violations385:
;GCODE.c,299 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations103:
;GCODE.c,301 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,303 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,307 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations386
NOP	
J	L_Check_group_multiple_violations104
NOP	
L__Check_group_multiple_violations386:
;GCODE.c,310 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,312 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations387
NOP	
J	L_Check_group_multiple_violations105
NOP	
L__Check_group_multiple_violations387:
;GCODE.c,313 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations105:
;GCODE.c,323 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,324 :: 		}
L_Check_group_multiple_violations104:
;GCODE.c,332 :: 		if(group_number == MODAL_GROUP_1){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__Check_group_multiple_violations388
NOP	
J	L_Check_group_multiple_violations106
NOP	
L__Check_group_multiple_violations388:
;GCODE.c,333 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,340 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations107
NOP	
;GCODE.c,341 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations109:
;GCODE.c,343 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); }
LH	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations390
NOP	
J	L_Check_group_multiple_violations110
NOP	
L__Check_group_multiple_violations390:
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations110:
;GCODE.c,344 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,345 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations111:
;GCODE.c,346 :: 		if (axis_words == 0) {
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations391
NOP	
J	L_Check_group_multiple_violations112
NOP	
L__Check_group_multiple_violations391:
;GCODE.c,347 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,348 :: 		}else {
J	L_Check_group_multiple_violations113
NOP	
L_Check_group_multiple_violations112:
;GCODE.c,351 :: 		gc.frequency = settings.default_seek_rate;
LWC1	S0, Offset(_settings+12)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,352 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,353 :: 		}
L_Check_group_multiple_violations113:
;GCODE.c,354 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,355 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations114:
;GCODE.c,360 :: 		if (axis_words == 0) {
LH	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations392
NOP	
J	L_Check_group_multiple_violations115
NOP	
L__Check_group_multiple_violations392:
;GCODE.c,361 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,362 :: 		}else {
J	L_Check_group_multiple_violations116
NOP	
L_Check_group_multiple_violations115:
;GCODE.c,364 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,365 :: 		}
L_Check_group_multiple_violations116:
;GCODE.c,366 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,367 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations117:
L_Check_group_multiple_violations118:
;GCODE.c,376 :: 		for(i=0;i<=3;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Check_group_multiple_violations119:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations393
NOP	
J	L_Check_group_multiple_violations120
NOP	
L__Check_group_multiple_violations393:
;GCODE.c,377 :: 		Set_Axisword(i);
SEH	R25, R4
JAL	_Set_Axisword+0
NOP	
;GCODE.c,376 :: 		for(i=0;i<=3;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;GCODE.c,377 :: 		Set_Axisword(i);
; i end address is: 16 (R4)
J	L_Check_group_multiple_violations119
NOP	
L_Check_group_multiple_violations120:
;GCODE.c,385 :: 		break;
J	L_Check_group_multiple_violations108
NOP	
;GCODE.c,386 :: 		}
L_Check_group_multiple_violations107:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations395
NOP	
J	L_Check_group_multiple_violations109
NOP	
L__Check_group_multiple_violations395:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations397
NOP	
J	L_Check_group_multiple_violations111
NOP	
L__Check_group_multiple_violations397:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations399
NOP	
J	L_Check_group_multiple_violations114
NOP	
L__Check_group_multiple_violations399:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations401
NOP	
J	L_Check_group_multiple_violations117
NOP	
L__Check_group_multiple_violations401:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations403
NOP	
J	L_Check_group_multiple_violations118
NOP	
L__Check_group_multiple_violations403:
L_Check_group_multiple_violations108:
;GCODE.c,388 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations122:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L__Check_group_multiple_violations404
NOP	
J	L_Check_group_multiple_violations123
NOP	
L__Check_group_multiple_violations404:
;GCODE.c,389 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,388 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,390 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations122
NOP	
L_Check_group_multiple_violations123:
;GCODE.c,391 :: 		}
L_Check_group_multiple_violations106:
;GCODE.c,394 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations405
NOP	
J	L_Check_group_multiple_violations125
NOP	
L__Check_group_multiple_violations405:
;GCODE.c,396 :: 		if(axis_xyz > NO_OF_PLANES){
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations406
NOP	
J	L_Check_group_multiple_violations126
NOP	
L__Check_group_multiple_violations406:
;GCODE.c,397 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,398 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,399 :: 		}else{
J	L_Check_group_multiple_violations127
NOP	
L_Check_group_multiple_violations126:
;GCODE.c,400 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,401 :: 		}
L_Check_group_multiple_violations127:
;GCODE.c,409 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,410 :: 		}
L_Check_group_multiple_violations125:
;GCODE.c,413 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations407
NOP	
J	L_Check_group_multiple_violations128
NOP	
L__Check_group_multiple_violations407:
;GCODE.c,420 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,421 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,422 :: 		}
L_Check_group_multiple_violations128:
;GCODE.c,425 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations408
NOP	
J	L_Check_group_multiple_violations129
NOP	
L__Check_group_multiple_violations408:
;GCODE.c,432 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,433 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,434 :: 		}
L_Check_group_multiple_violations129:
;GCODE.c,437 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations409
NOP	
J	L_Check_group_multiple_violations130
NOP	
L__Check_group_multiple_violations409:
;GCODE.c,444 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,445 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,446 :: 		}
L_Check_group_multiple_violations130:
;GCODE.c,449 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations410
NOP	
J	L_Check_group_multiple_violations131
NOP	
L__Check_group_multiple_violations410:
;GCODE.c,451 :: 		if(gc.coord_select < 0 || gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations411
NOP	
J	L__Check_group_multiple_violations182
NOP	
L__Check_group_multiple_violations411:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations412
NOP	
J	L__Check_group_multiple_violations181
NOP	
L__Check_group_multiple_violations412:
J	L_Check_group_multiple_violations134
NOP	
L__Check_group_multiple_violations182:
L__Check_group_multiple_violations181:
;GCODE.c,452 :: 		FAIL(STATUS_BAD_NUMBER_FORMAT);
ORI	R25, R0, 1
JAL	_FAIL+0
NOP	
J	L_Check_group_multiple_violations135
NOP	
L_Check_group_multiple_violations134:
;GCODE.c,454 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
L_Check_group_multiple_violations135:
;GCODE.c,461 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,462 :: 		}
L_Check_group_multiple_violations131:
;GCODE.c,463 :: 		}
L_Check_group_multiple_violations102:
;GCODE.c,472 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,473 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,474 :: 		}
;GCODE.c,473 :: 		return status_code;
;GCODE.c,474 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,479 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;GCODE.c,483 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 64(SP)
J	L_Instruction_Values136
NOP	
;GCODE.c,484 :: 		case 'X':
L_Instruction_Values138:
;GCODE.c,485 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,486 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+52)(GP)
;GCODE.c,487 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,488 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,489 :: 		case 'Y':
L_Instruction_Values139:
;GCODE.c,490 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,491 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+56)(GP)
;GCODE.c,492 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,493 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,494 :: 		case 'Z':
L_Instruction_Values140:
;GCODE.c,495 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,496 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,497 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,498 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,499 :: 		case 'A':
L_Instruction_Values141:
;GCODE.c,500 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,501 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,502 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,503 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,504 :: 		case 'E':
L_Instruction_Values142:
;GCODE.c,505 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,506 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,507 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SH	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,508 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,509 :: 		case 'R':
L_Instruction_Values143:
;GCODE.c,510 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,511 :: 		gc.R = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,512 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,513 :: 		case 'I':
L_Instruction_Values144:
;GCODE.c,514 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,515 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+72)(GP)
;GCODE.c,516 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,517 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,518 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+60)(GP)
;GCODE.c,519 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,520 :: 		case 'J':
L_Instruction_Values145:
;GCODE.c,521 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,522 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,523 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+64)(GP)
;GCODE.c,524 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,525 :: 		case 'K':
L_Instruction_Values146:
;GCODE.c,526 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
SWC1	S0, 12(SP)
;GCODE.c,527 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,528 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,529 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,530 :: 		case 'F':
L_Instruction_Values147:
;GCODE.c,531 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
SWC1	S1, 12(SP)
;GCODE.c,532 :: 		if(XYZ_Val < 0){
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values414
NOP	
J	L_Instruction_Values148
NOP	
L__Instruction_Values414:
;GCODE.c,533 :: 		FAIL(STATUS_SPEED_ERROR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
LW	R25, 4(SP)
;GCODE.c,534 :: 		}
L_Instruction_Values148:
;GCODE.c,536 :: 		if (gc.inverse_feed_rate_mode) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L__Instruction_Values416
NOP	
J	L_Instruction_Values149
NOP	
L__Instruction_Values416:
;GCODE.c,537 :: 		inverse_feed_rate = To_Millimeters(F_Val); // seconds per motion for this motion only
LH	R2, 16(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,538 :: 		} else {
J	L_Instruction_Values150
NOP	
L_Instruction_Values149:
;GCODE.c,539 :: 		gc.feed_rate = To_Millimeters(F_Val); // millimeters per minute
LH	R2, 16(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,540 :: 		}
L_Instruction_Values150:
;GCODE.c,541 :: 		gc.frequency = (unsigned long)XYZ_Val;
LWC1	S0, 12(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SW	R2, Offset(_gc+20)(GP)
;GCODE.c,543 :: 		while(DMA_IsOn(1));
L_Instruction_Values151:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__Instruction_Values418
NOP	
J	L_Instruction_Values152
NOP	
L__Instruction_Values418:
J	L_Instruction_Values151
NOP	
L_Instruction_Values152:
;GCODE.c,544 :: 		dma_printf("gc.frequency:= %l\n",gc.frequency);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
LW	R2, Offset(_gc+20)(GP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 8(SP)
LW	R26, 4(SP)
;GCODE.c,546 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,547 :: 		case 'P':
L_Instruction_Values153:
;GCODE.c,548 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,549 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values419
NOP	
J	L_Instruction_Values154
NOP	
L__Instruction_Values419:
;GCODE.c,550 :: 		FAIL(STATUS_SPEED_ERROR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
LW	R25, 4(SP)
;GCODE.c,551 :: 		}
L_Instruction_Values154:
;GCODE.c,552 :: 		gc.P = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,553 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,554 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,555 :: 		case 'S':
L_Instruction_Values155:
;GCODE.c,556 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,557 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values420
NOP	
J	L_Instruction_Values156
NOP	
L__Instruction_Values420:
;GCODE.c,558 :: 		FAIL(STATUS_SPEED_ERROR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
LW	R25, 4(SP)
;GCODE.c,559 :: 		}
L_Instruction_Values156:
;GCODE.c,560 :: 		gc.S = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+90)(GP)
;GCODE.c,561 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+88)(GP)
;GCODE.c,562 :: 		break;
J	L_Instruction_Values137
NOP	
;GCODE.c,563 :: 		case 'L':
L_Instruction_Values157:
;GCODE.c,564 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
SH	R2, 18(SP)
;GCODE.c,565 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values421
NOP	
J	L_Instruction_Values158
NOP	
L__Instruction_Values421:
;GCODE.c,566 :: 		FAIL(STATUS_SPEED_ERROR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
LW	R25, 4(SP)
;GCODE.c,567 :: 		}
L_Instruction_Values158:
;GCODE.c,568 :: 		gc.L = O_Val;
LH	R2, 18(SP)
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,569 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values137
NOP	
;GCODE.c,570 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values159:
SW	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LW	R25, 4(SP)
J	L_Instruction_Values137
NOP	
;GCODE.c,571 :: 		}
L_Instruction_Values136:
LW	R4, 64(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values423
NOP	
J	L_Instruction_Values138
NOP	
L__Instruction_Values423:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values425
NOP	
J	L_Instruction_Values139
NOP	
L__Instruction_Values425:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values427
NOP	
J	L_Instruction_Values140
NOP	
L__Instruction_Values427:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values429
NOP	
J	L_Instruction_Values141
NOP	
L__Instruction_Values429:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values431
NOP	
J	L_Instruction_Values142
NOP	
L__Instruction_Values431:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values433
NOP	
J	L_Instruction_Values143
NOP	
L__Instruction_Values433:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values435
NOP	
J	L_Instruction_Values144
NOP	
L__Instruction_Values435:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values437
NOP	
J	L_Instruction_Values145
NOP	
L__Instruction_Values437:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values439
NOP	
J	L_Instruction_Values146
NOP	
L__Instruction_Values439:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values441
NOP	
J	L_Instruction_Values147
NOP	
L__Instruction_Values441:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values443
NOP	
J	L_Instruction_Values153
NOP	
L__Instruction_Values443:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values445
NOP	
J	L_Instruction_Values155
NOP	
L__Instruction_Values445:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values447
NOP	
J	L_Instruction_Values157
NOP	
L__Instruction_Values447:
J	L_Instruction_Values159
NOP	
L_Instruction_Values137:
;GCODE.c,573 :: 		while(DMA_IsOn(1));
L_Instruction_Values160:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__Instruction_Values449
NOP	
J	L_Instruction_Values161
NOP	
L__Instruction_Values449:
J	L_Instruction_Values160
NOP	
L_Instruction_Values161:
;GCODE.c,574 :: 		if(c[0] == 'X' || c[0] == 'Y' || c[0] == 'Z' || c[0] == 'R' || c[0] == 'I' || c[0] == 'J')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values451
NOP	
J	L__Instruction_Values190
NOP	
L__Instruction_Values451:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values453
NOP	
J	L__Instruction_Values189
NOP	
L__Instruction_Values453:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values455
NOP	
J	L__Instruction_Values188
NOP	
L__Instruction_Values455:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values457
NOP	
J	L__Instruction_Values187
NOP	
L__Instruction_Values457:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values459
NOP	
J	L__Instruction_Values186
NOP	
L__Instruction_Values459:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values461
NOP	
J	L__Instruction_Values185
NOP	
L__Instruction_Values461:
J	L_Instruction_Values164
NOP	
L__Instruction_Values190:
L__Instruction_Values189:
L__Instruction_Values188:
L__Instruction_Values187:
L__Instruction_Values186:
L__Instruction_Values185:
;GCODE.c,575 :: 		dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 39
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 39
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
J	L_Instruction_Values165
NOP	
L_Instruction_Values164:
;GCODE.c,576 :: 		else if(c[0] == 'F')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BEQ	R3, R2, L__Instruction_Values462
NOP	
J	L_Instruction_Values166
NOP	
L__Instruction_Values462:
;GCODE.c,577 :: 		dma_printf("\t%c\t%d\n",c[0],F_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 47
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr5_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 47
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
J	L_Instruction_Values167
NOP	
L_Instruction_Values166:
;GCODE.c,578 :: 		else if(c[0] == 'S' ||  c[0] == 'P' || c[0] == 'L')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values464
NOP	
J	L__Instruction_Values193
NOP	
L__Instruction_Values464:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values466
NOP	
J	L__Instruction_Values192
NOP	
L__Instruction_Values466:
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values468
NOP	
J	L__Instruction_Values191
NOP	
L__Instruction_Values468:
J	L_Instruction_Values170
NOP	
L__Instruction_Values193:
L__Instruction_Values192:
L__Instruction_Values191:
;GCODE.c,579 :: 		dma_printf("\t%c\t%d\n",c[0],O_Val);
LBU	R4, 0(R25)
ADDIU	R23, SP, 55
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr6_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 55
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
L_Instruction_Values170:
L_Instruction_Values167:
L_Instruction_Values165:
;GCODE.c,581 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,582 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _Instruction_Values
