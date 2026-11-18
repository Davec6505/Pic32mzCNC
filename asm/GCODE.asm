GCODE_To_Millimeters:
;GCODE.c,53 :: 		static float To_Millimeters(float value){
;GCODE.c,54 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters143
NOP	
J	L_GCODE_To_Millimeters0
NOP	
L_GCODE_To_Millimeters143:
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
;GCODE.c,55 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,58 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,59 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,60 :: 		switch(axis_combo){
J	L_GCODE_Select_Plane2
NOP	
;GCODE.c,61 :: 		case AXIS_XZ: gc.plane_axis_0 = X; gc.plane_axis_1 = Z; gc.plane_axis_2 = Y; break;
L_GCODE_Select_Plane4:
SB	R0, Offset(_gc+11)(GP)
ORI	R2, R0, 2
SB	R2, Offset(_gc+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_gc+13)(GP)
J	L_GCODE_Select_Plane3
NOP	
;GCODE.c,62 :: 		case AXIS_YZ: gc.plane_axis_0 = Y; gc.plane_axis_1 = Z; gc.plane_axis_2 = X; break;
L_GCODE_Select_Plane5:
ORI	R2, R0, 1
SB	R2, Offset(_gc+11)(GP)
ORI	R2, R0, 2
SB	R2, Offset(_gc+12)(GP)
SB	R0, Offset(_gc+13)(GP)
J	L_GCODE_Select_Plane3
NOP	
;GCODE.c,63 :: 		default:      gc.plane_axis_0 = X; gc.plane_axis_1 = Y; gc.plane_axis_2 = Z; break;
L_GCODE_Select_Plane6:
SB	R0, Offset(_gc+11)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_gc+12)(GP)
ORI	R2, R0, 2
SB	R2, Offset(_gc+13)(GP)
J	L_GCODE_Select_Plane3
NOP	
;GCODE.c,64 :: 		}
L_GCODE_Select_Plane2:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Select_Plane146
NOP	
J	L_GCODE_Select_Plane4
NOP	
L_GCODE_Select_Plane146:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Select_Plane148
NOP	
J	L_GCODE_Select_Plane5
NOP	
L_GCODE_Select_Plane148:
J	L_GCODE_Select_Plane6
NOP	
L_GCODE_Select_Plane3:
;GCODE.c,65 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Load_Coord_System:
;GCODE.c,68 :: 		static void Load_Coord_System(int select){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;GCODE.c,69 :: 		settings_read_coord_data();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R25, 16(SP)
JAL	_settings_read_coord_data+0
NOP	
LH	R25, 16(SP)
;GCODE.c,70 :: 		memcpy(gc.coord_system,coord_system[select-1].coord,sizeof(gc.coord_system));
ADDIU	R2, R25, -1
SEH	R2, R2
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R2, R2, R3
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+48)
ORI	R25, R25, lo_addr(_gc+48)
JAL	_memcpy+0
NOP	
;GCODE.c,71 :: 		}
L_end_Load_Coord_System:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of GCODE_Load_Coord_System
_G_Initialise:
;GCODE.c,78 :: 		void G_Initialise(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,79 :: 		m_flow               = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R0, Offset(-1610603000)(GP)
;GCODE.c,80 :: 		group_number         = 0;
SH	R0, Offset(-1610602988)(GP)
;GCODE.c,81 :: 		axis_words           = 0;
SH	R0, Offset(-1610603006)(GP)
;GCODE.c,82 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,83 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,84 :: 		gc.inverse_feed_rate_mode = false;
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,85 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,86 :: 		gc.absolute_mode     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,87 :: 		motion_mode = gc.motion_mode = MOTION_MODE_SEEK;
SB	R0, Offset(_gc+8)(GP)
SH	R0, Offset(-1610602990)(GP)
;GCODE.c,88 :: 		Select_Plane(AXIS_XY);
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
;GCODE.c,89 :: 		gc.coord_select = 1;
ORI	R2, R0, 1
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,90 :: 		Load_Coord_System(gc.coord_select);
ORI	R25, R0, 1
JAL	GCODE_Load_Coord_System+0
NOP	
;GCODE.c,91 :: 		clear_vector(gc.coord_offset);
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+64)
ORI	R25, R25, lo_addr(_gc+64)
JAL	_memset+0
NOP	
;GCODE.c,92 :: 		}
L_end_G_Initialise:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _G_Initialise
_G_Save_State:
;GCODE.c,95 :: 		void G_Save_State(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,96 :: 		memcpy(&gc_saved,&gc,sizeof(parser_state_t));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 136
LUI	R26, hi_addr(_gc+0)
ORI	R26, R26, lo_addr(_gc+0)
LUI	R25, hi_addr(GCODE_gc_saved+0)
ORI	R25, R25, lo_addr(GCODE_gc_saved+0)
JAL	_memcpy+0
NOP	
;GCODE.c,97 :: 		motion_mode_saved = motion_mode;
LH	R2, Offset(-1610602990)(GP)
SH	R2, Offset(GCODE_motion_mode_saved+0)(GP)
;GCODE.c,98 :: 		axis_xyz_saved = axis_xyz;
LBU	R2, Offset(_axis_xyz+0)(GP)
SB	R2, Offset(GCODE_axis_xyz_saved+0)(GP)
;GCODE.c,99 :: 		cir_saved = SV.cir;
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
SB	R2, Offset(GCODE_cir_saved+0)(GP)
;GCODE.c,100 :: 		}
L_end_G_Save_State:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _G_Save_State
_G_Restore_State:
;GCODE.c,102 :: 		void G_Restore_State(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,103 :: 		memcpy(&gc,&gc_saved,sizeof(parser_state_t));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 136
LUI	R26, hi_addr(GCODE_gc_saved+0)
ORI	R26, R26, lo_addr(GCODE_gc_saved+0)
LUI	R25, hi_addr(_gc+0)
ORI	R25, R25, lo_addr(_gc+0)
JAL	_memcpy+0
NOP	
;GCODE.c,104 :: 		motion_mode = motion_mode_saved;
LH	R2, Offset(GCODE_motion_mode_saved+0)(GP)
SH	R2, Offset(-1610602990)(GP)
;GCODE.c,105 :: 		axis_xyz = axis_xyz_saved;
LBU	R2, Offset(GCODE_axis_xyz_saved+0)(GP)
SB	R2, Offset(_axis_xyz+0)(GP)
;GCODE.c,106 :: 		SV.cir = cir_saved;
LBU	R3, Offset(GCODE_cir_saved+0)(GP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_SV+0)(GP)
;GCODE.c,107 :: 		}
L_end_G_Restore_State:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _G_Restore_State
_G_Begin_Block:
;GCODE.c,110 :: 		void G_Begin_Block(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,111 :: 		Rst_modalgroup();
SW	R25, 4(SP)
JAL	_Rst_modalgroup+0
NOP	
;GCODE.c,112 :: 		Rst_non_modalword();
JAL	_Rst_non_modalword+0
NOP	
;GCODE.c,113 :: 		Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;GCODE.c,114 :: 		non_modal_action = NON_MODAL_NONE;
SH	R0, Offset(-1610602992)(GP)
;GCODE.c,115 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,116 :: 		gc.P = gc.S = gc.L = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+16)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_gc+126)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_gc+124)(GP)
;GCODE.c,117 :: 		gc.R = gc.I = gc.J = gc.K = 0.0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+120)(GP)
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+116)(GP)
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+112)(GP)
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+108)(GP)
;GCODE.c,118 :: 		gc.dwell = -1.0;
LUI	R2, 49024
ORI	R2, R2, 0
SW	R2, Offset(_gc+128)(GP)
;GCODE.c,119 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,120 :: 		gc.program_flow = PROGRAM_FLOW_RUNNING;
SB	R0, Offset(_gc+9)(GP)
;GCODE.c,121 :: 		FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
;GCODE.c,122 :: 		}
L_end_G_Begin_Block:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _G_Begin_Block
_G_Program_End:
;GCODE.c,125 :: 		void G_Program_End(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,126 :: 		motion_mode = gc.motion_mode = MOTION_MODE_LINEAR;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R2, R0, 1
SB	R2, Offset(_gc+8)(GP)
ORI	R2, R0, 1
SH	R2, Offset(-1610602990)(GP)
;GCODE.c,127 :: 		Select_Plane(AXIS_XY);
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
;GCODE.c,128 :: 		gc.absolute_mode = 1;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,129 :: 		gc.inverse_feed_rate_mode = false;
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,130 :: 		gc.coord_select = 1;
ORI	R2, R0, 1
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,131 :: 		Load_Coord_System(gc.coord_select);
ORI	R25, R0, 1
JAL	GCODE_Load_Coord_System+0
NOP	
;GCODE.c,132 :: 		clear_vector(gc.coord_offset);
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+64)
ORI	R25, R25, lo_addr(_gc+64)
JAL	_memset+0
NOP	
;GCODE.c,133 :: 		gc.spindle_direction = 0;
SB	R0, Offset(_gc+6)(GP)
;GCODE.c,134 :: 		gc.coolant_mode = COOLANT_DISABLE;
SB	R0, Offset(_gc+7)(GP)
;GCODE.c,135 :: 		gc.program_flow = PROGRAM_FLOW_RUNNING;
SB	R0, Offset(_gc+9)(GP)
;GCODE.c,136 :: 		}
L_end_G_Program_End:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _G_Program_End
_FAIL:
;GCODE.c,139 :: 		void FAIL(int status){
;GCODE.c,140 :: 		status_code = status;
SH	R25, Offset(-1610602986)(GP)
;GCODE.c,141 :: 		}
L_end_FAIL:
JR	RA
NOP	
; end of _FAIL
_GET_FAIL:
;GCODE.c,143 :: 		int  GET_FAIL(){
;GCODE.c,144 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,145 :: 		}
L_end_GET_FAIL:
JR	RA
NOP	
; end of _GET_FAIL
_SET_FAIL:
;GCODE.c,147 :: 		int  SET_FAIL(int val){
;GCODE.c,148 :: 		status_code = val;
SH	R25, Offset(-1610602986)(GP)
;GCODE.c,149 :: 		}
L_end_SET_FAIL:
JR	RA
NOP	
; end of _SET_FAIL
_Set_modalgroup:
;GCODE.c,153 :: 		void Set_modalgroup(int value){
;GCODE.c,154 :: 		bit_true( modal_group_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
;GCODE.c,155 :: 		}
L_end_Set_modalgroup:
JR	RA
NOP	
; end of _Set_modalgroup
_Get_modalgroup:
;GCODE.c,158 :: 		int Get_modalgroup(){
;GCODE.c,159 :: 		return modal_group_words;
LH	R2, Offset(-1610603004)(GP)
;GCODE.c,160 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,162 :: 		int Rst_modalgroup(){
;GCODE.c,163 :: 		modal_group_words = 0;
SH	R0, Offset(-1610603004)(GP)
;GCODE.c,164 :: 		return modal_group_words;
MOVZ	R2, R0, R0
;GCODE.c,165 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Set_non_modalword:
;GCODE.c,170 :: 		void Set_non_modalword(int value){
;GCODE.c,171 :: 		bit_true( non_modal_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603002)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603002)(GP)
;GCODE.c,172 :: 		}
L_end_Set_non_modalword:
JR	RA
NOP	
; end of _Set_non_modalword
_Get_non_modalword:
;GCODE.c,175 :: 		int Get_non_modalword(){
;GCODE.c,176 :: 		return non_modal_words;
LH	R2, Offset(-1610603002)(GP)
;GCODE.c,177 :: 		}
L_end_Get_non_modalword:
JR	RA
NOP	
; end of _Get_non_modalword
_Rst_non_modalword:
;GCODE.c,179 :: 		int Rst_non_modalword(){
;GCODE.c,180 :: 		non_modal_words = 0;
SH	R0, Offset(-1610603002)(GP)
;GCODE.c,181 :: 		return non_modal_words;
MOVZ	R2, R0, R0
;GCODE.c,182 :: 		}
L_end_Rst_non_modalword:
JR	RA
NOP	
; end of _Rst_non_modalword
_Set_Axisword:
;GCODE.c,187 :: 		void Set_Axisword(int value){
;GCODE.c,188 :: 		bit_true( axis_words,bit( value));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603006)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,189 :: 		}
L_end_Set_Axisword:
JR	RA
NOP	
; end of _Set_Axisword
_Get_Axisword:
;GCODE.c,197 :: 		int Get_Axisword(){
;GCODE.c,198 :: 		return axis_words & 0x0fff;
LH	R2, Offset(-1610603006)(GP)
ANDI	R2, R2, 4095
;GCODE.c,199 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,201 :: 		int Rst_Axisword(){
;GCODE.c,202 :: 		axis_words = 0;
SH	R0, Offset(-1610603006)(GP)
;GCODE.c,203 :: 		return axis_words;
MOVZ	R2, R0, R0
;GCODE.c,204 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,207 :: 		int Get_motionmode(){
;GCODE.c,208 :: 		return motion_mode;
LH	R2, Offset(-1610602990)(GP)
;GCODE.c,209 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,211 :: 		int Rst_motionmode(){
;GCODE.c,212 :: 		motion_mode = 0;
SH	R0, Offset(-1610602990)(GP)
;GCODE.c,213 :: 		return motion_mode;
MOVZ	R2, R0, R0
;GCODE.c,214 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,218 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,220 :: 		non_modal_action = NON_MODAL_NONE;
SH	R0, Offset(-1610602992)(GP)
;GCODE.c,221 :: 		grp = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
; grp start address is: 16 (R4)
SEH	R4, R2
;GCODE.c,222 :: 		Set_Motion_Mode(mode);
SH	R4, 4(SP)
SH	R25, 6(SP)
JAL	GCODE_Set_Motion_Mode+0
NOP	
LH	R25, 6(SP)
LH	R4, 4(SP)
;GCODE.c,223 :: 		if(status_code == STATUS_OK){
LH	R2, Offset(-1610602986)(GP)
BEQ	R2, R0, L__G_Mode170
NOP	
J	L_G_Mode7
NOP	
L__G_Mode170:
;GCODE.c,224 :: 		if(bit_istrue(modal_group_words,bit(grp))){
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__G_Mode172
NOP	
J	L_G_Mode8
NOP	
L__G_Mode172:
;GCODE.c,225 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
SH	R25, 4(SP)
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
;GCODE.c,226 :: 		}else{
J	L_G_Mode9
NOP	
L_G_Mode8:
;GCODE.c,227 :: 		bit_true(modal_group_words,bit(grp));
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
;GCODE.c,228 :: 		if(non_modal_action != NON_MODAL_NONE)
LH	R2, Offset(-1610602992)(GP)
BNE	R2, R0, L__G_Mode174
NOP	
J	L_G_Mode10
NOP	
L__G_Mode174:
;GCODE.c,229 :: 		bit_true(non_modal_words,bit(non_modal_action));
LH	R3, Offset(-1610602992)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603002)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603002)(GP)
L_G_Mode10:
;GCODE.c,230 :: 		}
L_G_Mode9:
;GCODE.c,231 :: 		}
L_G_Mode7:
;GCODE.c,232 :: 		group_number = grp;
SH	R4, Offset(-1610602988)(GP)
; grp end address is: 16 (R4)
;GCODE.c,233 :: 		return mode;
SEH	R2, R25
;GCODE.c,234 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _G_Mode
_M_Mode:
;GCODE.c,238 :: 		int M_Mode(int flow){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,240 :: 		grp = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
; grp start address is: 16 (R4)
SEH	R4, R2
;GCODE.c,241 :: 		m_flow = Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
SH	R2, Offset(-1610603000)(GP)
;GCODE.c,242 :: 		if(status_code == STATUS_OK && grp != MODAL_GROUP_NONE){
LH	R2, Offset(-1610602986)(GP)
BEQ	R2, R0, L__M_Mode176
NOP	
J	L__M_Mode131
NOP	
L__M_Mode176:
SEH	R2, R4
BNE	R2, R0, L__M_Mode178
NOP	
J	L__M_Mode130
NOP	
L__M_Mode178:
L__M_Mode129:
;GCODE.c,243 :: 		if(bit_istrue(modal_group_words,bit(grp)))
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__M_Mode180
NOP	
J	L_M_Mode14
NOP	
L__M_Mode180:
;GCODE.c,244 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
SH	R25, 4(SP)
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_M_Mode15
NOP	
L_M_Mode14:
;GCODE.c,246 :: 		bit_true(modal_group_words,bit(grp));
SEH	R3, R4
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(-1610603004)(GP)
OR	R2, R2, R3
SH	R2, Offset(-1610603004)(GP)
L_M_Mode15:
;GCODE.c,242 :: 		if(status_code == STATUS_OK && grp != MODAL_GROUP_NONE){
L__M_Mode131:
L__M_Mode130:
;GCODE.c,248 :: 		group_number = grp;
SH	R4, Offset(-1610602988)(GP)
; grp end address is: 16 (R4)
;GCODE.c,253 :: 		return flow;
SEH	R2, R25
;GCODE.c,254 :: 		}
L_end_M_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _M_Mode
GCODE_Set_Modal_Groups:
;GCODE.c,261 :: 		static int Set_Modal_Groups(int mode){
;GCODE.c,262 :: 		int gp_num = MODAL_GROUP_NONE;
; gp_num start address is: 16 (R4)
MOVZ	R4, R0, R0
;GCODE.c,263 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups16
NOP	
; gp_num end address is: 16 (R4)
;GCODE.c,264 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920: case 921:
L_GCODE_Set_Modal_Groups18:
L_GCODE_Set_Modal_Groups19:
L_GCODE_Set_Modal_Groups20:
L_GCODE_Set_Modal_Groups21:
L_GCODE_Set_Modal_Groups22:
L_GCODE_Set_Modal_Groups23:
L_GCODE_Set_Modal_Groups24:
L_GCODE_Set_Modal_Groups25:
L_GCODE_Set_Modal_Groups26:
;GCODE.c,265 :: 		gp_num = MODAL_GROUP_0; break;
; gp_num start address is: 8 (R2)
ORI	R2, R0, 1
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,266 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups27:
L_GCODE_Set_Modal_Groups28:
L_GCODE_Set_Modal_Groups29:
L_GCODE_Set_Modal_Groups30:
L_GCODE_Set_Modal_Groups31:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 2
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,267 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups32:
L_GCODE_Set_Modal_Groups33:
L_GCODE_Set_Modal_Groups34:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 3
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,268 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups35:
L_GCODE_Set_Modal_Groups36:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 4
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,269 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups37:
L_GCODE_Set_Modal_Groups38:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 6
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,270 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups39:
L_GCODE_Set_Modal_Groups40:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 7
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,271 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups41:
L_GCODE_Set_Modal_Groups42:
L_GCODE_Set_Modal_Groups43:
L_GCODE_Set_Modal_Groups44:
L_GCODE_Set_Modal_Groups45:
L_GCODE_Set_Modal_Groups46:
; gp_num start address is: 8 (R2)
ORI	R2, R0, 9
; gp_num end address is: 8 (R2)
J	L_GCODE_Set_Modal_Groups17
NOP	
;GCODE.c,272 :: 		}
L_GCODE_Set_Modal_Groups16:
; gp_num start address is: 16 (R4)
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups183
NOP	
J	L_GCODE_Set_Modal_Groups18
NOP	
L_GCODE_Set_Modal_Groups183:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups185
NOP	
J	L_GCODE_Set_Modal_Groups19
NOP	
L_GCODE_Set_Modal_Groups185:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups187
NOP	
J	L_GCODE_Set_Modal_Groups20
NOP	
L_GCODE_Set_Modal_Groups187:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups189
NOP	
J	L_GCODE_Set_Modal_Groups21
NOP	
L_GCODE_Set_Modal_Groups189:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups191
NOP	
J	L_GCODE_Set_Modal_Groups22
NOP	
L_GCODE_Set_Modal_Groups191:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups193
NOP	
J	L_GCODE_Set_Modal_Groups23
NOP	
L_GCODE_Set_Modal_Groups193:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups195
NOP	
J	L_GCODE_Set_Modal_Groups24
NOP	
L_GCODE_Set_Modal_Groups195:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups197
NOP	
J	L_GCODE_Set_Modal_Groups25
NOP	
L_GCODE_Set_Modal_Groups197:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Modal_Groups199
NOP	
J	L_GCODE_Set_Modal_Groups26
NOP	
L_GCODE_Set_Modal_Groups199:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups201
NOP	
J	L_GCODE_Set_Modal_Groups27
NOP	
L_GCODE_Set_Modal_Groups201:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups203
NOP	
J	L_GCODE_Set_Modal_Groups28
NOP	
L_GCODE_Set_Modal_Groups203:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups205
NOP	
J	L_GCODE_Set_Modal_Groups29
NOP	
L_GCODE_Set_Modal_Groups205:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups207
NOP	
J	L_GCODE_Set_Modal_Groups30
NOP	
L_GCODE_Set_Modal_Groups207:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups209
NOP	
J	L_GCODE_Set_Modal_Groups31
NOP	
L_GCODE_Set_Modal_Groups209:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups211
NOP	
J	L_GCODE_Set_Modal_Groups32
NOP	
L_GCODE_Set_Modal_Groups211:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups213
NOP	
J	L_GCODE_Set_Modal_Groups33
NOP	
L_GCODE_Set_Modal_Groups213:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups215
NOP	
J	L_GCODE_Set_Modal_Groups34
NOP	
L_GCODE_Set_Modal_Groups215:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups217
NOP	
J	L_GCODE_Set_Modal_Groups35
NOP	
L_GCODE_Set_Modal_Groups217:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups219
NOP	
J	L_GCODE_Set_Modal_Groups36
NOP	
L_GCODE_Set_Modal_Groups219:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups221
NOP	
J	L_GCODE_Set_Modal_Groups37
NOP	
L_GCODE_Set_Modal_Groups221:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups223
NOP	
J	L_GCODE_Set_Modal_Groups38
NOP	
L_GCODE_Set_Modal_Groups223:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups225
NOP	
J	L_GCODE_Set_Modal_Groups39
NOP	
L_GCODE_Set_Modal_Groups225:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups227
NOP	
J	L_GCODE_Set_Modal_Groups40
NOP	
L_GCODE_Set_Modal_Groups227:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups229
NOP	
J	L_GCODE_Set_Modal_Groups41
NOP	
L_GCODE_Set_Modal_Groups229:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups231
NOP	
J	L_GCODE_Set_Modal_Groups42
NOP	
L_GCODE_Set_Modal_Groups231:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups233
NOP	
J	L_GCODE_Set_Modal_Groups43
NOP	
L_GCODE_Set_Modal_Groups233:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups235
NOP	
J	L_GCODE_Set_Modal_Groups44
NOP	
L_GCODE_Set_Modal_Groups235:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups237
NOP	
J	L_GCODE_Set_Modal_Groups45
NOP	
L_GCODE_Set_Modal_Groups237:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups239
NOP	
J	L_GCODE_Set_Modal_Groups46
NOP	
L_GCODE_Set_Modal_Groups239:
; gp_num end address is: 16 (R4)
SEH	R2, R4
L_GCODE_Set_Modal_Groups17:
;GCODE.c,273 :: 		return gp_num;
; gp_num start address is: 8 (R2)
; gp_num end address is: 8 (R2)
;GCODE.c,274 :: 		}
L_end_Set_Modal_Groups:
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,277 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;GCODE.c,278 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 8(SP)
;GCODE.c,280 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode47
NOP	
;GCODE.c,281 :: 		case 0: motion_mode = MOTION_MODE_SEEK;SV.cir = 0;    break;
L_GCODE_Set_Motion_Mode49:
SH	R0, Offset(-1610602990)(GP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,282 :: 		case 1: motion_mode = MOTION_MODE_LINEAR;SV.cir = 0;  break;
L_GCODE_Set_Motion_Mode50:
ORI	R2, R0, 1
SH	R2, Offset(-1610602990)(GP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,283 :: 		case 2: motion_mode = MOTION_MODE_CW_ARC;gc.DIR = CW;SV.cir = 1;  break;
L_GCODE_Set_Motion_Mode51:
ORI	R2, R0, 2
SH	R2, Offset(-1610602990)(GP)
SH	R0, Offset(_gc+132)(GP)
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,284 :: 		case 3: motion_mode = MOTION_MODE_CCW_ARC;gc.DIR = CCW;SV.cir = 1; break;
L_GCODE_Set_Motion_Mode52:
ORI	R2, R0, 3
SH	R2, Offset(-1610602990)(GP)
ORI	R2, R0, 1
SH	R2, Offset(_gc+132)(GP)
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,285 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode53:
ORI	R2, R0, 4
SH	R2, Offset(-1610602990)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,286 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode54:
ORI	R2, R0, 1
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,287 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode55:
ORI	R2, R0, 2
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,288 :: 		case 17: Select_Plane(AXIS_XY); break;
L_GCODE_Set_Motion_Mode56:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,289 :: 		case 18: Select_Plane(AXIS_XZ); break;
L_GCODE_Set_Motion_Mode57:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,290 :: 		case 19: Select_Plane(AXIS_YZ); break;
L_GCODE_Set_Motion_Mode58:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,291 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode59:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,292 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode60:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,293 :: 		case 53: gc.absolute_override = true; break;
L_GCODE_Set_Motion_Mode61:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,294 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode62:
L_GCODE_Set_Motion_Mode63:
L_GCODE_Set_Motion_Mode64:
L_GCODE_Set_Motion_Mode65:
L_GCODE_Set_Motion_Mode66:
L_GCODE_Set_Motion_Mode67:
;GCODE.c,295 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,296 :: 		Load_Coord_System(gc.coord_select);
SEH	R25, R2
JAL	GCODE_Load_Coord_System+0
NOP	
;GCODE.c,297 :: 		break;
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,298 :: 		case 90: gc.absolute_mode = 1; break;
L_GCODE_Set_Motion_Mode68:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,299 :: 		case 91: gc.absolute_mode = 0; break;
L_GCODE_Set_Motion_Mode69:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,301 :: 		case 93: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
L_GCODE_Set_Motion_Mode70:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,302 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode71:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,303 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode72:
ORI	R2, R0, 3
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,304 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode73:
ORI	R2, R0, 4
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,305 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode74:
ORI	R2, R0, 5
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,306 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode75:
ORI	R2, R0, 6
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,307 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode76:
ORI	R2, R0, 7
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,308 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode77:
ORI	R2, R0, 8
SH	R2, Offset(-1610602992)(GP)
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,309 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
L_GCODE_Set_Motion_Mode78:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_GCODE_Set_Motion_Mode48
NOP	
;GCODE.c,310 :: 		}
L_GCODE_Set_Motion_Mode47:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode242
NOP	
J	L_GCODE_Set_Motion_Mode49
NOP	
L_GCODE_Set_Motion_Mode242:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode244
NOP	
J	L_GCODE_Set_Motion_Mode50
NOP	
L_GCODE_Set_Motion_Mode244:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode246
NOP	
J	L_GCODE_Set_Motion_Mode51
NOP	
L_GCODE_Set_Motion_Mode246:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode248
NOP	
J	L_GCODE_Set_Motion_Mode52
NOP	
L_GCODE_Set_Motion_Mode248:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode250
NOP	
J	L_GCODE_Set_Motion_Mode53
NOP	
L_GCODE_Set_Motion_Mode250:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode252
NOP	
J	L_GCODE_Set_Motion_Mode54
NOP	
L_GCODE_Set_Motion_Mode252:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode254
NOP	
J	L_GCODE_Set_Motion_Mode55
NOP	
L_GCODE_Set_Motion_Mode254:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode256
NOP	
J	L_GCODE_Set_Motion_Mode56
NOP	
L_GCODE_Set_Motion_Mode256:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode258
NOP	
J	L_GCODE_Set_Motion_Mode57
NOP	
L_GCODE_Set_Motion_Mode258:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode260
NOP	
J	L_GCODE_Set_Motion_Mode58
NOP	
L_GCODE_Set_Motion_Mode260:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode262
NOP	
J	L_GCODE_Set_Motion_Mode59
NOP	
L_GCODE_Set_Motion_Mode262:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode264
NOP	
J	L_GCODE_Set_Motion_Mode60
NOP	
L_GCODE_Set_Motion_Mode264:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode266
NOP	
J	L_GCODE_Set_Motion_Mode61
NOP	
L_GCODE_Set_Motion_Mode266:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode268
NOP	
J	L_GCODE_Set_Motion_Mode62
NOP	
L_GCODE_Set_Motion_Mode268:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode270
NOP	
J	L_GCODE_Set_Motion_Mode63
NOP	
L_GCODE_Set_Motion_Mode270:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode272
NOP	
J	L_GCODE_Set_Motion_Mode64
NOP	
L_GCODE_Set_Motion_Mode272:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode274
NOP	
J	L_GCODE_Set_Motion_Mode65
NOP	
L_GCODE_Set_Motion_Mode274:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode276
NOP	
J	L_GCODE_Set_Motion_Mode66
NOP	
L_GCODE_Set_Motion_Mode276:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode278
NOP	
J	L_GCODE_Set_Motion_Mode67
NOP	
L_GCODE_Set_Motion_Mode278:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode280
NOP	
J	L_GCODE_Set_Motion_Mode68
NOP	
L_GCODE_Set_Motion_Mode280:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode282
NOP	
J	L_GCODE_Set_Motion_Mode69
NOP	
L_GCODE_Set_Motion_Mode282:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode284
NOP	
J	L_GCODE_Set_Motion_Mode70
NOP	
L_GCODE_Set_Motion_Mode284:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode286
NOP	
J	L_GCODE_Set_Motion_Mode71
NOP	
L_GCODE_Set_Motion_Mode286:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode288
NOP	
J	L_GCODE_Set_Motion_Mode72
NOP	
L_GCODE_Set_Motion_Mode288:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode290
NOP	
J	L_GCODE_Set_Motion_Mode73
NOP	
L_GCODE_Set_Motion_Mode290:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode292
NOP	
J	L_GCODE_Set_Motion_Mode74
NOP	
L_GCODE_Set_Motion_Mode292:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode294
NOP	
J	L_GCODE_Set_Motion_Mode75
NOP	
L_GCODE_Set_Motion_Mode294:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode296
NOP	
J	L_GCODE_Set_Motion_Mode76
NOP	
L_GCODE_Set_Motion_Mode296:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode298
NOP	
J	L_GCODE_Set_Motion_Mode77
NOP	
L_GCODE_Set_Motion_Mode298:
J	L_GCODE_Set_Motion_Mode78
NOP	
L_GCODE_Set_Motion_Mode48:
;GCODE.c,311 :: 		gc.motion_mode = motion_mode;
LH	R2, Offset(-1610602990)(GP)
SB	R2, Offset(_gc+8)(GP)
;GCODE.c,324 :: 		return motion_mode;
LH	R2, Offset(-1610602990)(GP)
;GCODE.c,325 :: 		}
;GCODE.c,324 :: 		return motion_mode;
;GCODE.c,325 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,330 :: 		static int Set_M_Modal_Commands(int flow){
;GCODE.c,331 :: 		int m_num = MODAL_GROUP_NONE;
; m_num start address is: 16 (R4)
MOVZ	R4, R0, R0
;GCODE.c,333 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands79
NOP	
; m_num end address is: 16 (R4)
;GCODE.c,334 :: 		case 0: case 1: case 2: case 30: m_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands81:
L_GCODE_Set_M_Modal_Commands82:
L_GCODE_Set_M_Modal_Commands83:
L_GCODE_Set_M_Modal_Commands84:
; m_num start address is: 8 (R2)
ORI	R2, R0, 5
; m_num end address is: 8 (R2)
J	L_GCODE_Set_M_Modal_Commands80
NOP	
;GCODE.c,335 :: 		case 3: case 4: case 5: m_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands85:
L_GCODE_Set_M_Modal_Commands86:
L_GCODE_Set_M_Modal_Commands87:
; m_num start address is: 8 (R2)
ORI	R2, R0, 8
; m_num end address is: 8 (R2)
J	L_GCODE_Set_M_Modal_Commands80
NOP	
;GCODE.c,336 :: 		}
L_GCODE_Set_M_Modal_Commands79:
; m_num start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands301
NOP	
J	L_GCODE_Set_M_Modal_Commands81
NOP	
L_GCODE_Set_M_Modal_Commands301:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands303
NOP	
J	L_GCODE_Set_M_Modal_Commands82
NOP	
L_GCODE_Set_M_Modal_Commands303:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands305
NOP	
J	L_GCODE_Set_M_Modal_Commands83
NOP	
L_GCODE_Set_M_Modal_Commands305:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands307
NOP	
J	L_GCODE_Set_M_Modal_Commands84
NOP	
L_GCODE_Set_M_Modal_Commands307:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands309
NOP	
J	L_GCODE_Set_M_Modal_Commands85
NOP	
L_GCODE_Set_M_Modal_Commands309:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands311
NOP	
J	L_GCODE_Set_M_Modal_Commands86
NOP	
L_GCODE_Set_M_Modal_Commands311:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands313
NOP	
J	L_GCODE_Set_M_Modal_Commands87
NOP	
L_GCODE_Set_M_Modal_Commands313:
; m_num end address is: 16 (R4)
SEH	R2, R4
L_GCODE_Set_M_Modal_Commands80:
;GCODE.c,337 :: 		return m_num;
; m_num start address is: 8 (R2)
; m_num end address is: 8 (R2)
;GCODE.c,338 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,341 :: 		static int Set_M_Commands(int flow){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,342 :: 		FAIL(STATUS_OK);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
;GCODE.c,344 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands88
NOP	
;GCODE.c,345 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause, '~' resumes
L_GCODE_Set_M_Commands90:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,346 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands91:
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,347 :: 		case 2:
L_GCODE_Set_M_Commands92:
;GCODE.c,348 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands93:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,350 :: 		case 3: case 4: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
L_GCODE_Set_M_Commands94:
L_GCODE_Set_M_Commands95:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,351 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands96:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,353 :: 		case 7: case 8: FAIL(STATUS_UNSUPPORTED_STATEMENT); break;
L_GCODE_Set_M_Commands97:
L_GCODE_Set_M_Commands98:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,354 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands99:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,355 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands100:
SH	R25, 4(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
J	L_GCODE_Set_M_Commands89
NOP	
;GCODE.c,356 :: 		}
L_GCODE_Set_M_Commands88:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands316
NOP	
J	L_GCODE_Set_M_Commands90
NOP	
L_GCODE_Set_M_Commands316:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands318
NOP	
J	L_GCODE_Set_M_Commands91
NOP	
L_GCODE_Set_M_Commands318:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands320
NOP	
J	L_GCODE_Set_M_Commands92
NOP	
L_GCODE_Set_M_Commands320:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands322
NOP	
J	L_GCODE_Set_M_Commands93
NOP	
L_GCODE_Set_M_Commands322:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands324
NOP	
J	L_GCODE_Set_M_Commands94
NOP	
L_GCODE_Set_M_Commands324:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands326
NOP	
J	L_GCODE_Set_M_Commands95
NOP	
L_GCODE_Set_M_Commands326:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands328
NOP	
J	L_GCODE_Set_M_Commands96
NOP	
L_GCODE_Set_M_Commands328:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L_GCODE_Set_M_Commands330
NOP	
J	L_GCODE_Set_M_Commands97
NOP	
L_GCODE_Set_M_Commands330:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands332
NOP	
J	L_GCODE_Set_M_Commands98
NOP	
L_GCODE_Set_M_Commands332:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands334
NOP	
J	L_GCODE_Set_M_Commands99
NOP	
L_GCODE_Set_M_Commands334:
J	L_GCODE_Set_M_Commands100
NOP	
L_GCODE_Set_M_Commands89:
;GCODE.c,357 :: 		return flow;
SEH	R2, R25
;GCODE.c,358 :: 		}
L_end_Set_M_Commands:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_M_Commands
_Check_group_multiple_violations:
;GCODE.c,365 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,366 :: 		if(status_code != STATUS_OK)
SW	R25, 4(SP)
LH	R2, Offset(-1610602986)(GP)
BNE	R2, R0, L__Check_group_multiple_violations337
NOP	
J	L_Check_group_multiple_violations101
NOP	
L__Check_group_multiple_violations337:
;GCODE.c,367 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
J	L_end_Check_group_multiple_violations
NOP	
L_Check_group_multiple_violations101:
;GCODE.c,370 :: 		if(motion_mode == MOTION_MODE_CANCEL && axis_words &&
LH	R3, Offset(-1610602990)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations338
NOP	
J	L__Check_group_multiple_violations136
NOP	
L__Check_group_multiple_violations338:
LH	R2, Offset(-1610603006)(GP)
BNE	R2, R0, L__Check_group_multiple_violations340
NOP	
J	L__Check_group_multiple_violations135
NOP	
L__Check_group_multiple_violations340:
;GCODE.c,371 :: 		bit_istrue(modal_group_words,bit(MODAL_GROUP_1)))
LH	R2, Offset(-1610603004)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations342
NOP	
J	L__Check_group_multiple_violations134
NOP	
L__Check_group_multiple_violations342:
L__Check_group_multiple_violations133:
;GCODE.c,372 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;GCODE.c,370 :: 		if(motion_mode == MOTION_MODE_CANCEL && axis_words &&
L__Check_group_multiple_violations136:
L__Check_group_multiple_violations135:
;GCODE.c,371 :: 		bit_istrue(modal_group_words,bit(MODAL_GROUP_1)))
L__Check_group_multiple_violations134:
;GCODE.c,375 :: 		if(bit_istrue(modal_group_words,bit(MODAL_GROUP_0)) &&
LH	R2, Offset(-1610603004)(GP)
ANDI	R2, R2, 2
;GCODE.c,376 :: 		bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) && axis_words &&
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations344
NOP	
J	L__Check_group_multiple_violations140
NOP	
L__Check_group_multiple_violations344:
LH	R2, Offset(-1610603004)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations346
NOP	
J	L__Check_group_multiple_violations139
NOP	
L__Check_group_multiple_violations346:
LH	R2, Offset(-1610603006)(GP)
BNE	R2, R0, L__Check_group_multiple_violations348
NOP	
J	L__Check_group_multiple_violations138
NOP	
L__Check_group_multiple_violations348:
;GCODE.c,377 :: 		(non_modal_words & ~bit(NON_MODAL_DWELL)))
LH	R3, Offset(-1610603002)(GP)
ORI	R2, R0, 65533
AND	R2, R3, R2
BNE	R2, R0, L__Check_group_multiple_violations350
NOP	
J	L__Check_group_multiple_violations137
NOP	
L__Check_group_multiple_violations350:
L__Check_group_multiple_violations132:
;GCODE.c,378 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R25, R0, 5
JAL	_FAIL+0
NOP	
;GCODE.c,376 :: 		bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) && axis_words &&
L__Check_group_multiple_violations140:
L__Check_group_multiple_violations139:
L__Check_group_multiple_violations138:
;GCODE.c,377 :: 		(non_modal_words & ~bit(NON_MODAL_DWELL)))
L__Check_group_multiple_violations137:
;GCODE.c,380 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,381 :: 		}
;GCODE.c,380 :: 		return status_code;
;GCODE.c,381 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,386 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,389 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
LW	R25, 8(SP)
;GCODE.c,390 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 12(SP)
J	L_Instruction_Values108
NOP	
;GCODE.c,391 :: 		case 'X':case 'x':
L_Instruction_Values110:
L_Instruction_Values111:
;GCODE.c,393 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,394 :: 		bit_true(axis_words,bit(X));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 1
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,395 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,396 :: 		case 'Y':
L_Instruction_Values112:
;GCODE.c,398 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,399 :: 		bit_true(axis_words,bit(Y));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 2
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,400 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,401 :: 		case 'Z':
L_Instruction_Values113:
;GCODE.c,403 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,404 :: 		bit_true(axis_words,bit(Z));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 4
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,405 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,406 :: 		case 'A':
L_Instruction_Values114:
;GCODE.c,408 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,409 :: 		bit_true(axis_words,bit(A));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 8
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,410 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,411 :: 		case 'E':
L_Instruction_Values115:
;GCODE.c,413 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,414 :: 		bit_true(axis_words,bit(B));
LH	R2, Offset(-1610603006)(GP)
ORI	R2, R2, 16
SH	R2, Offset(-1610603006)(GP)
;GCODE.c,415 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,416 :: 		case 'R':
L_Instruction_Values116:
;GCODE.c,418 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,419 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,420 :: 		case 'I':
L_Instruction_Values117:
;GCODE.c,421 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,422 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+108)(GP)
;GCODE.c,424 :: 		gc.I = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,426 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,427 :: 		case 'J':
L_Instruction_Values118:
;GCODE.c,429 :: 		gc.J = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,431 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,432 :: 		case 'K':
L_Instruction_Values119:
;GCODE.c,434 :: 		gc.K = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,436 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,437 :: 		case 'F':
L_Instruction_Values120:
;GCODE.c,438 :: 		XYZ_Val = *(float*)any;
LWC1	S1, 0(R26)
; XYZ_Val start address is: 16 (R4)
MOV.S 	S2, S1
;GCODE.c,439 :: 		if(XYZ_Val < 0){FAIL(STATUS_SPEED_ERROR);break;}
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__Instruction_Values352
NOP	
J	L_Instruction_Values121
NOP	
L__Instruction_Values352:
; XYZ_Val end address is: 16 (R4)
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
J	L_Instruction_Values109
NOP	
L_Instruction_Values121:
;GCODE.c,441 :: 		gc.feed_rate = To_Millimeters(XYZ_Val);
; XYZ_Val start address is: 16 (R4)
MOV.S 	S12, S2
; XYZ_Val end address is: 16 (R4)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,447 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,448 :: 		case 'P':
L_Instruction_Values122:
;GCODE.c,449 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,450 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values353
NOP	
J	L_Instruction_Values123
NOP	
L__Instruction_Values353:
;GCODE.c,451 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,452 :: 		}
L_Instruction_Values123:
;GCODE.c,453 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+124)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,454 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+126)(GP)
;GCODE.c,455 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,456 :: 		case 'S':
L_Instruction_Values124:
;GCODE.c,457 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,458 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values354
NOP	
J	L_Instruction_Values125
NOP	
L__Instruction_Values354:
;GCODE.c,459 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,460 :: 		}
L_Instruction_Values125:
;GCODE.c,461 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+126)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,462 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+124)(GP)
;GCODE.c,463 :: 		break;
J	L_Instruction_Values109
NOP	
;GCODE.c,464 :: 		case 'L':
L_Instruction_Values126:
;GCODE.c,465 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,466 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values355
NOP	
J	L_Instruction_Values127
NOP	
L__Instruction_Values355:
;GCODE.c,467 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R25, R0, 13
JAL	_FAIL+0
NOP	
;GCODE.c,468 :: 		}
L_Instruction_Values127:
;GCODE.c,469 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,470 :: 		break; //L2 tells the G10 we�re setting standard work offsets
J	L_Instruction_Values109
NOP	
;GCODE.c,471 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values128:
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
J	L_Instruction_Values109
NOP	
;GCODE.c,472 :: 		}
L_Instruction_Values108:
LW	R4, 12(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values357
NOP	
J	L_Instruction_Values110
NOP	
L__Instruction_Values357:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 120
BNE	R3, R2, L__Instruction_Values359
NOP	
J	L_Instruction_Values111
NOP	
L__Instruction_Values359:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values361
NOP	
J	L_Instruction_Values112
NOP	
L__Instruction_Values361:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values363
NOP	
J	L_Instruction_Values113
NOP	
L__Instruction_Values363:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values365
NOP	
J	L_Instruction_Values114
NOP	
L__Instruction_Values365:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values367
NOP	
J	L_Instruction_Values115
NOP	
L__Instruction_Values367:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values369
NOP	
J	L_Instruction_Values116
NOP	
L__Instruction_Values369:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values371
NOP	
J	L_Instruction_Values117
NOP	
L__Instruction_Values371:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values373
NOP	
J	L_Instruction_Values118
NOP	
L__Instruction_Values373:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values375
NOP	
J	L_Instruction_Values119
NOP	
L__Instruction_Values375:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values377
NOP	
J	L_Instruction_Values120
NOP	
L__Instruction_Values377:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values379
NOP	
J	L_Instruction_Values122
NOP	
L__Instruction_Values379:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values381
NOP	
J	L_Instruction_Values124
NOP	
L__Instruction_Values381:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values383
NOP	
J	L_Instruction_Values126
NOP	
L__Instruction_Values383:
J	L_Instruction_Values128
NOP	
L_Instruction_Values109:
;GCODE.c,487 :: 		return status_code;
LH	R2, Offset(-1610602986)(GP)
;GCODE.c,488 :: 		}
;GCODE.c,487 :: 		return status_code;
;GCODE.c,488 :: 		}
L_end_Instruction_Values:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Instruction_Values
