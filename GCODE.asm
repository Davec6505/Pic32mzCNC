_G_Initialise:
;GCODE.c,26 :: 		void G_Initialise(){
;GCODE.c,27 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,28 :: 		axis_words        = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,29 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,30 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,31 :: 		inverse_feed_rate = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,32 :: 		absolute_override = 0;
SB	R0, Offset(GCODE_absolute_override+0)(GP)
;GCODE.c,33 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_modalgroup:
;GCODE.c,36 :: 		int Get_modalgroup(){
;GCODE.c,37 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,38 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,40 :: 		int Rst_modalgroup(){
;GCODE.c,41 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,42 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,43 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Get_modalword:
;GCODE.c,46 :: 		int Get_modalword(){
;GCODE.c,47 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,48 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,50 :: 		int Rst_modalword(){
;GCODE.c,51 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,52 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,53 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,56 :: 		int Get_Axisword(){
;GCODE.c,57 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,58 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,60 :: 		int Rst_Axisword(){
;GCODE.c,61 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,62 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,63 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,66 :: 		int Get_motionmode(){
;GCODE.c,67 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,68 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,70 :: 		int Rst_motionmode(){
;GCODE.c,71 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,72 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,73 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,76 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,77 :: 		gc.inches_mode = 0;//temp for debugging
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,78 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,79 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,80 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,81 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,84 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,86 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,87 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,92 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
_Check_group_multiple_violations:
;GCODE.c,98 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;GCODE.c,100 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,105 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations182
NOP	
J	L_Check_group_multiple_violations0
NOP	
L__Check_group_multiple_violations182:
;GCODE.c,106 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations184
NOP	
J	L_Check_group_multiple_violations1
NOP	
L__Check_group_multiple_violations184:
;GCODE.c,107 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
L_Check_group_multiple_violations1:
;GCODE.c,110 :: 		if ( bit_istrue(modal_group_words,bit(group_number)) ) {
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations186
NOP	
J	L_Check_group_multiple_violations2
NOP	
L__Check_group_multiple_violations186:
;GCODE.c,111 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,112 :: 		} else {
J	L_Check_group_multiple_violations3
NOP	
L_Check_group_multiple_violations2:
;GCODE.c,113 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,114 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,115 :: 		}
L_Check_group_multiple_violations3:
;GCODE.c,117 :: 		while(DMA_Busy(1));
L_Check_group_multiple_violations4:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations188
NOP	
J	L_Check_group_multiple_violations5
NOP	
L__Check_group_multiple_violations188:
J	L_Check_group_multiple_violations4
NOP	
L_Check_group_multiple_violations5:
;GCODE.c,118 :: 		dma_printf("group_number:= %d\tnon_modal_action:= %d\n",group_number,non_modal_action);
ADDIU	R23, SP, 8
ADDIU	R22, R23, 41
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LH	R2, Offset(_non_modal_action+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,120 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,121 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations189
NOP	
J	L_Check_group_multiple_violations6
NOP	
L__Check_group_multiple_violations189:
;GCODE.c,122 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,123 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,124 :: 		}
L_Check_group_multiple_violations6:
;GCODE.c,125 :: 		}
L_Check_group_multiple_violations0:
;GCODE.c,130 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations7:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations190
NOP	
J	L_Check_group_multiple_violations8
NOP	
L__Check_group_multiple_violations190:
;GCODE.c,131 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations192
NOP	
J	L_Check_group_multiple_violations10
NOP	
L__Check_group_multiple_violations192:
;GCODE.c,132 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations193
NOP	
J	L_Check_group_multiple_violations11
NOP	
L__Check_group_multiple_violations193:
;GCODE.c,133 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__Check_group_multiple_violations195
NOP	
J	L_Check_group_multiple_violations12
NOP	
L__Check_group_multiple_violations195:
;GCODE.c,134 :: 		gc.next_position[i] += gc.position[i] + gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+20)
ORI	R2, R2, lo_addr(_gc+20)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LUI	R2, hi_addr(_gc+68)
ORI	R2, R2, lo_addr(_gc+68)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;GCODE.c,135 :: 		} else {
J	L_Check_group_multiple_violations13
NOP	
L_Check_group_multiple_violations12:
;GCODE.c,139 :: 		}
L_Check_group_multiple_violations13:
;GCODE.c,140 :: 		}
L_Check_group_multiple_violations11:
;GCODE.c,141 :: 		} else {
J	L_Check_group_multiple_violations14
NOP	
L_Check_group_multiple_violations10:
;GCODE.c,142 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+68)
ORI	R2, R2, lo_addr(_gc+68)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;GCODE.c,143 :: 		}
L_Check_group_multiple_violations14:
;GCODE.c,130 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,144 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations7
NOP	
L_Check_group_multiple_violations8:
;GCODE.c,149 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations15
NOP	
;GCODE.c,151 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations17:
;GCODE.c,152 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations197
NOP	
J	L_Check_group_multiple_violations18
NOP	
L__Check_group_multiple_violations197:
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
L_Check_group_multiple_violations18:
;GCODE.c,153 :: 		break;
J	L_Check_group_multiple_violations16
NOP	
;GCODE.c,154 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations19:
;GCODE.c,155 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations198
NOP	
J	L_Check_group_multiple_violations20
NOP	
L__Check_group_multiple_violations198:
;GCODE.c,156 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,157 :: 		}else {
J	L_Check_group_multiple_violations21
NOP	
L_Check_group_multiple_violations20:
;GCODE.c,160 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,161 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,162 :: 		}
L_Check_group_multiple_violations21:
;GCODE.c,163 :: 		break;
J	L_Check_group_multiple_violations16
NOP	
;GCODE.c,164 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations22:
;GCODE.c,170 :: 		while(DMA_Busy(1));
L_Check_group_multiple_violations23:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations200
NOP	
J	L_Check_group_multiple_violations24
NOP	
L__Check_group_multiple_violations200:
J	L_Check_group_multiple_violations23
NOP	
L_Check_group_multiple_violations24:
;GCODE.c,171 :: 		dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 49
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 49
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,173 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations201
NOP	
J	L_Check_group_multiple_violations25
NOP	
L__Check_group_multiple_violations201:
;GCODE.c,174 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,175 :: 		}else {
J	L_Check_group_multiple_violations26
NOP	
L_Check_group_multiple_violations25:
;GCODE.c,177 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,178 :: 		}
L_Check_group_multiple_violations26:
;GCODE.c,179 :: 		break;
J	L_Check_group_multiple_violations16
NOP	
;GCODE.c,180 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations27:
L_Check_group_multiple_violations28:
;GCODE.c,183 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+10)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,184 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations203
NOP	
J	L__Check_group_multiple_violations169
NOP	
L__Check_group_multiple_violations203:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations204
NOP	
J	L__Check_group_multiple_violations168
NOP	
L__Check_group_multiple_violations204:
LBU	R2, Offset(_gc+8)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+116)
ORI	R2, R2, lo_addr(_gc+116)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations205
NOP	
J	L__Check_group_multiple_violations167
NOP	
L__Check_group_multiple_violations205:
LBU	R2, Offset(_gc+9)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+116)
ORI	R2, R2, lo_addr(_gc+116)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations206
NOP	
J	L__Check_group_multiple_violations166
NOP	
L__Check_group_multiple_violations206:
J	L__Check_group_multiple_violations164
NOP	
L__Check_group_multiple_violations168:
L__Check_group_multiple_violations167:
L__Check_group_multiple_violations166:
J	L_Check_group_multiple_violations33
NOP	
L__Check_group_multiple_violations164:
L__Check_group_multiple_violations169:
;GCODE.c,185 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,186 :: 		} else {
J	L_Check_group_multiple_violations34
NOP	
L_Check_group_multiple_violations33:
;GCODE.c,187 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+128)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations207
NOP	
J	L_Check_group_multiple_violations35
NOP	
L__Check_group_multiple_violations207:
;GCODE.c,189 :: 		asm{nop;}
NOP	
;GCODE.c,190 :: 		}
L_Check_group_multiple_violations35:
;GCODE.c,191 :: 		}
L_Check_group_multiple_violations34:
;GCODE.c,192 :: 		break;
J	L_Check_group_multiple_violations16
NOP	
;GCODE.c,193 :: 		}
L_Check_group_multiple_violations15:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations209
NOP	
J	L_Check_group_multiple_violations17
NOP	
L__Check_group_multiple_violations209:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations211
NOP	
J	L_Check_group_multiple_violations19
NOP	
L__Check_group_multiple_violations211:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations213
NOP	
J	L_Check_group_multiple_violations22
NOP	
L__Check_group_multiple_violations213:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations215
NOP	
J	L_Check_group_multiple_violations27
NOP	
L__Check_group_multiple_violations215:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations217
NOP	
J	L_Check_group_multiple_violations28
NOP	
L__Check_group_multiple_violations217:
L_Check_group_multiple_violations16:
;GCODE.c,195 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations36:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__Check_group_multiple_violations218
NOP	
J	L_Check_group_multiple_violations37
NOP	
L__Check_group_multiple_violations218:
;GCODE.c,196 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+20)
ORI	R2, R2, lo_addr(_gc+20)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,195 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,197 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations36
NOP	
L_Check_group_multiple_violations37:
;GCODE.c,199 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,200 :: 		}
;GCODE.c,199 :: 		return status_code;
;GCODE.c,200 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,203 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,207 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values39
NOP	
;GCODE.c,208 :: 		case 'X':
L_Instruction_Values41:
;GCODE.c,210 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,211 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,212 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,213 :: 		case 'Y':
L_Instruction_Values42:
;GCODE.c,215 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,216 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,217 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,218 :: 		case 'Z':
L_Instruction_Values43:
;GCODE.c,220 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,221 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,222 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,223 :: 		case 'A':
L_Instruction_Values44:
;GCODE.c,225 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,226 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,227 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,228 :: 		case 'E':
L_Instruction_Values45:
;GCODE.c,230 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,231 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,232 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,233 :: 		case 'R':
L_Instruction_Values46:
;GCODE.c,235 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+128)(GP)
;GCODE.c,236 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,237 :: 		case 'I':
L_Instruction_Values47:
;GCODE.c,238 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,239 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+128)(GP)
;GCODE.c,240 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,241 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+132)(GP)
;GCODE.c,242 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,243 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,244 :: 		case 'J':
L_Instruction_Values48:
;GCODE.c,245 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,246 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+136)(GP)
;GCODE.c,247 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,248 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,249 :: 		case 'K':
L_Instruction_Values49:
;GCODE.c,250 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,251 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+140)(GP)
;GCODE.c,252 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+124)(GP)
;GCODE.c,253 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,254 :: 		case 'F':
L_Instruction_Values50:
;GCODE.c,255 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,256 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values220
NOP	
J	L_Instruction_Values51
NOP	
L__Instruction_Values220:
;GCODE.c,257 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,258 :: 		}
L_Instruction_Values51:
;GCODE.c,265 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+12)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,266 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,267 :: 		case 'P':
L_Instruction_Values52:
;GCODE.c,268 :: 		S_Val = *(int*)any;
LH	R2, 0(R26)
; S_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,269 :: 		if(S_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values221
NOP	
J	L_Instruction_Values53
NOP	
L__Instruction_Values221:
;GCODE.c,270 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,271 :: 		}
L_Instruction_Values53:
;GCODE.c,272 :: 		gc.P = S_Val;
SH	R3, Offset(_gc+144)(GP)
; S_Val end address is: 12 (R3)
;GCODE.c,273 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+146)(GP)
;GCODE.c,274 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,275 :: 		case 'S':
L_Instruction_Values54:
;GCODE.c,276 :: 		S_Val = *(int*)any;
LH	R2, 0(R26)
; S_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,277 :: 		if(S_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values222
NOP	
J	L_Instruction_Values55
NOP	
L__Instruction_Values222:
;GCODE.c,278 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,279 :: 		}
L_Instruction_Values55:
;GCODE.c,280 :: 		gc.S = S_Val;
SH	R3, Offset(_gc+146)(GP)
; S_Val end address is: 12 (R3)
;GCODE.c,281 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+144)(GP)
;GCODE.c,282 :: 		break;
J	L_Instruction_Values40
NOP	
;GCODE.c,284 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values56:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_Instruction_Values40
NOP	
;GCODE.c,285 :: 		}
L_Instruction_Values39:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values224
NOP	
J	L_Instruction_Values41
NOP	
L__Instruction_Values224:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values226
NOP	
J	L_Instruction_Values42
NOP	
L__Instruction_Values226:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values228
NOP	
J	L_Instruction_Values43
NOP	
L__Instruction_Values228:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values230
NOP	
J	L_Instruction_Values44
NOP	
L__Instruction_Values230:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values232
NOP	
J	L_Instruction_Values45
NOP	
L__Instruction_Values232:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values234
NOP	
J	L_Instruction_Values46
NOP	
L__Instruction_Values234:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values236
NOP	
J	L_Instruction_Values47
NOP	
L__Instruction_Values236:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values238
NOP	
J	L_Instruction_Values48
NOP	
L__Instruction_Values238:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values240
NOP	
J	L_Instruction_Values49
NOP	
L__Instruction_Values240:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values242
NOP	
J	L_Instruction_Values50
NOP	
L__Instruction_Values242:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values244
NOP	
J	L_Instruction_Values52
NOP	
L__Instruction_Values244:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values246
NOP	
J	L_Instruction_Values54
NOP	
L__Instruction_Values246:
J	L_Instruction_Values56
NOP	
L_Instruction_Values40:
;GCODE.c,295 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,296 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
GCODE_To_Millimeters:
;GCODE.c,301 :: 		static float To_Millimeters(float value){
;GCODE.c,302 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters249
NOP	
J	L_GCODE_To_Millimeters57
NOP	
L_GCODE_To_Millimeters249:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T167 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T167 end address is: 0 (R0)
J	L_GCODE_To_Millimeters58
NOP	
L_GCODE_To_Millimeters57:
; ?FLOC__GCODE_To_Millimeters?T167 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T167 end address is: 0 (R0)
L_GCODE_To_Millimeters58:
; ?FLOC__GCODE_To_Millimeters?T167 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T167 end address is: 0 (R0)
;GCODE.c,303 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,306 :: 		static void Select_Plane(long x,long y,long z){
;GCODE.c,307 :: 		gc.position[X] = x/settings.steps_per_mm[X];
MTC1	R25, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+4)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+20)(GP)
;GCODE.c,308 :: 		gc.position[Y] = y/settings.steps_per_mm[Y];
MTC1	R26, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+8)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,309 :: 		gc.position[Z] = z/settings.steps_per_mm[Z];
MTC1	R27, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+12)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,310 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Set_Modal_Groups:
;GCODE.c,314 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,316 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups59
NOP	
;GCODE.c,317 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
L_GCODE_Set_Modal_Groups61:
L_GCODE_Set_Modal_Groups62:
L_GCODE_Set_Modal_Groups63:
L_GCODE_Set_Modal_Groups64:
L_GCODE_Set_Modal_Groups65:
L_GCODE_Set_Modal_Groups66:
L_GCODE_Set_Modal_Groups67:
L_GCODE_Set_Modal_Groups68:
;GCODE.c,318 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,319 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups69:
L_GCODE_Set_Modal_Groups70:
L_GCODE_Set_Modal_Groups71:
L_GCODE_Set_Modal_Groups72:
L_GCODE_Set_Modal_Groups73:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,320 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups74:
L_GCODE_Set_Modal_Groups75:
L_GCODE_Set_Modal_Groups76:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,321 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups77:
L_GCODE_Set_Modal_Groups78:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,322 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups79:
L_GCODE_Set_Modal_Groups80:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,323 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups81:
L_GCODE_Set_Modal_Groups82:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,324 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups83:
L_GCODE_Set_Modal_Groups84:
L_GCODE_Set_Modal_Groups85:
L_GCODE_Set_Modal_Groups86:
L_GCODE_Set_Modal_Groups87:
L_GCODE_Set_Modal_Groups88:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,325 :: 		}
L_GCODE_Set_Modal_Groups59:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups253
NOP	
J	L_GCODE_Set_Modal_Groups61
NOP	
L_GCODE_Set_Modal_Groups253:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups255
NOP	
J	L_GCODE_Set_Modal_Groups62
NOP	
L_GCODE_Set_Modal_Groups255:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups257
NOP	
J	L_GCODE_Set_Modal_Groups63
NOP	
L_GCODE_Set_Modal_Groups257:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups259
NOP	
J	L_GCODE_Set_Modal_Groups64
NOP	
L_GCODE_Set_Modal_Groups259:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups261
NOP	
J	L_GCODE_Set_Modal_Groups65
NOP	
L_GCODE_Set_Modal_Groups261:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups263
NOP	
J	L_GCODE_Set_Modal_Groups66
NOP	
L_GCODE_Set_Modal_Groups263:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups265
NOP	
J	L_GCODE_Set_Modal_Groups67
NOP	
L_GCODE_Set_Modal_Groups265:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups267
NOP	
J	L_GCODE_Set_Modal_Groups68
NOP	
L_GCODE_Set_Modal_Groups267:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups269
NOP	
J	L_GCODE_Set_Modal_Groups69
NOP	
L_GCODE_Set_Modal_Groups269:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups271
NOP	
J	L_GCODE_Set_Modal_Groups70
NOP	
L_GCODE_Set_Modal_Groups271:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups273
NOP	
J	L_GCODE_Set_Modal_Groups71
NOP	
L_GCODE_Set_Modal_Groups273:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups275
NOP	
J	L_GCODE_Set_Modal_Groups72
NOP	
L_GCODE_Set_Modal_Groups275:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups277
NOP	
J	L_GCODE_Set_Modal_Groups73
NOP	
L_GCODE_Set_Modal_Groups277:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups279
NOP	
J	L_GCODE_Set_Modal_Groups74
NOP	
L_GCODE_Set_Modal_Groups279:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups281
NOP	
J	L_GCODE_Set_Modal_Groups75
NOP	
L_GCODE_Set_Modal_Groups281:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups283
NOP	
J	L_GCODE_Set_Modal_Groups76
NOP	
L_GCODE_Set_Modal_Groups283:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups285
NOP	
J	L_GCODE_Set_Modal_Groups77
NOP	
L_GCODE_Set_Modal_Groups285:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups287
NOP	
J	L_GCODE_Set_Modal_Groups78
NOP	
L_GCODE_Set_Modal_Groups287:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups289
NOP	
J	L_GCODE_Set_Modal_Groups79
NOP	
L_GCODE_Set_Modal_Groups289:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups291
NOP	
J	L_GCODE_Set_Modal_Groups80
NOP	
L_GCODE_Set_Modal_Groups291:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups293
NOP	
J	L_GCODE_Set_Modal_Groups81
NOP	
L_GCODE_Set_Modal_Groups293:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups295
NOP	
J	L_GCODE_Set_Modal_Groups82
NOP	
L_GCODE_Set_Modal_Groups295:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups297
NOP	
J	L_GCODE_Set_Modal_Groups83
NOP	
L_GCODE_Set_Modal_Groups297:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups299
NOP	
J	L_GCODE_Set_Modal_Groups84
NOP	
L_GCODE_Set_Modal_Groups299:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups301
NOP	
J	L_GCODE_Set_Modal_Groups85
NOP	
L_GCODE_Set_Modal_Groups301:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups303
NOP	
J	L_GCODE_Set_Modal_Groups86
NOP	
L_GCODE_Set_Modal_Groups303:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups305
NOP	
J	L_GCODE_Set_Modal_Groups87
NOP	
L_GCODE_Set_Modal_Groups305:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups307
NOP	
J	L_GCODE_Set_Modal_Groups88
NOP	
L_GCODE_Set_Modal_Groups307:
L_GCODE_Set_Modal_Groups60:
;GCODE.c,326 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,327 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,330 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;GCODE.c,332 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode89
NOP	
;GCODE.c,333 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode91:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,334 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode92:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,335 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode93:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,336 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode94:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,337 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode95:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,338 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode96:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,339 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode97:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,340 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode98:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,341 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode99:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,342 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode100:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,343 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode101:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,344 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode102:
ORI	R2, R0, 1
SB	R2, Offset(GCODE_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,345 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode103:
L_GCODE_Set_Motion_Mode104:
L_GCODE_Set_Motion_Mode105:
L_GCODE_Set_Motion_Mode106:
L_GCODE_Set_Motion_Mode107:
L_GCODE_Set_Motion_Mode108:
;GCODE.c,346 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+11)(GP)
;GCODE.c,347 :: 		break;
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,348 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode109:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,349 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode110:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,350 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode111:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,351 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode112:
ORI	R2, R0, 1
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,352 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode113:
SB	R0, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,353 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode114:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,354 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode115:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,355 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode116:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,356 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode117:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,357 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode118:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,358 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode119:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,359 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode120:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,360 :: 		}
L_GCODE_Set_Motion_Mode89:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode310
NOP	
J	L_GCODE_Set_Motion_Mode91
NOP	
L_GCODE_Set_Motion_Mode310:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode312
NOP	
J	L_GCODE_Set_Motion_Mode92
NOP	
L_GCODE_Set_Motion_Mode312:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode314
NOP	
J	L_GCODE_Set_Motion_Mode93
NOP	
L_GCODE_Set_Motion_Mode314:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode316
NOP	
J	L_GCODE_Set_Motion_Mode94
NOP	
L_GCODE_Set_Motion_Mode316:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode318
NOP	
J	L_GCODE_Set_Motion_Mode95
NOP	
L_GCODE_Set_Motion_Mode318:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode320
NOP	
J	L_GCODE_Set_Motion_Mode96
NOP	
L_GCODE_Set_Motion_Mode320:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode97
NOP	
L_GCODE_Set_Motion_Mode322:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode98
NOP	
L_GCODE_Set_Motion_Mode324:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode99
NOP	
L_GCODE_Set_Motion_Mode326:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode100
NOP	
L_GCODE_Set_Motion_Mode328:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode330
NOP	
J	L_GCODE_Set_Motion_Mode101
NOP	
L_GCODE_Set_Motion_Mode330:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode332
NOP	
J	L_GCODE_Set_Motion_Mode102
NOP	
L_GCODE_Set_Motion_Mode332:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode334
NOP	
J	L_GCODE_Set_Motion_Mode103
NOP	
L_GCODE_Set_Motion_Mode334:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode336
NOP	
J	L_GCODE_Set_Motion_Mode104
NOP	
L_GCODE_Set_Motion_Mode336:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode338
NOP	
J	L_GCODE_Set_Motion_Mode105
NOP	
L_GCODE_Set_Motion_Mode338:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode340
NOP	
J	L_GCODE_Set_Motion_Mode106
NOP	
L_GCODE_Set_Motion_Mode340:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode342
NOP	
J	L_GCODE_Set_Motion_Mode107
NOP	
L_GCODE_Set_Motion_Mode342:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode344
NOP	
J	L_GCODE_Set_Motion_Mode108
NOP	
L_GCODE_Set_Motion_Mode344:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode346
NOP	
J	L_GCODE_Set_Motion_Mode109
NOP	
L_GCODE_Set_Motion_Mode346:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode348
NOP	
J	L_GCODE_Set_Motion_Mode110
NOP	
L_GCODE_Set_Motion_Mode348:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode350
NOP	
J	L_GCODE_Set_Motion_Mode111
NOP	
L_GCODE_Set_Motion_Mode350:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode352
NOP	
J	L_GCODE_Set_Motion_Mode112
NOP	
L_GCODE_Set_Motion_Mode352:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode354
NOP	
J	L_GCODE_Set_Motion_Mode113
NOP	
L_GCODE_Set_Motion_Mode354:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode356
NOP	
J	L_GCODE_Set_Motion_Mode114
NOP	
L_GCODE_Set_Motion_Mode356:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode358
NOP	
J	L_GCODE_Set_Motion_Mode115
NOP	
L_GCODE_Set_Motion_Mode358:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode360
NOP	
J	L_GCODE_Set_Motion_Mode116
NOP	
L_GCODE_Set_Motion_Mode360:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode362
NOP	
J	L_GCODE_Set_Motion_Mode117
NOP	
L_GCODE_Set_Motion_Mode362:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode364
NOP	
J	L_GCODE_Set_Motion_Mode118
NOP	
L_GCODE_Set_Motion_Mode364:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode366
NOP	
J	L_GCODE_Set_Motion_Mode119
NOP	
L_GCODE_Set_Motion_Mode366:
J	L_GCODE_Set_Motion_Mode120
NOP	
L_GCODE_Set_Motion_Mode90:
;GCODE.c,366 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode367
NOP	
J	L_GCODE_Set_Motion_Mode159
NOP	
L_GCODE_Set_Motion_Mode367:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode368
NOP	
J	L_GCODE_Set_Motion_Mode158
NOP	
L_GCODE_Set_Motion_Mode368:
J	L_GCODE_Set_Motion_Mode123
NOP	
L_GCODE_Set_Motion_Mode159:
L_GCODE_Set_Motion_Mode158:
;GCODE.c,368 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode370
NOP	
J	L_GCODE_Set_Motion_Mode124
NOP	
L_GCODE_Set_Motion_Mode370:
;GCODE.c,369 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode371
NOP	
J	L_GCODE_Set_Motion_Mode161
NOP	
L_GCODE_Set_Motion_Mode371:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode373
NOP	
J	L_GCODE_Set_Motion_Mode160
NOP	
L_GCODE_Set_Motion_Mode373:
L_GCODE_Set_Motion_Mode156:
;GCODE.c,370 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,369 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode161:
L_GCODE_Set_Motion_Mode160:
;GCODE.c,372 :: 		}
L_GCODE_Set_Motion_Mode124:
;GCODE.c,374 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode375
NOP	
J	L_GCODE_Set_Motion_Mode163
NOP	
L_GCODE_Set_Motion_Mode375:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode377
NOP	
J	L_GCODE_Set_Motion_Mode129
NOP	
L_GCODE_Set_Motion_Mode377:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode379
NOP	
J	L_GCODE_Set_Motion_Mode129
NOP	
L_GCODE_Set_Motion_Mode379:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode128
NOP	
L_GCODE_Set_Motion_Mode129:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode128:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode380
NOP	
J	L_GCODE_Set_Motion_Mode162
NOP	
L_GCODE_Set_Motion_Mode380:
L_GCODE_Set_Motion_Mode155:
;GCODE.c,375 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,374 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode163:
L_GCODE_Set_Motion_Mode162:
;GCODE.c,378 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(GCODE_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode382
NOP	
J	L_GCODE_Set_Motion_Mode133
NOP	
L_GCODE_Set_Motion_Mode382:
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode133:
;GCODE.c,380 :: 		}
L_GCODE_Set_Motion_Mode123:
;GCODE.c,381 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,382 :: 		}
;GCODE.c,381 :: 		return motion_mode;
;GCODE.c,382 :: 		}
L_end_Set_Motion_Mode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,384 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,386 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands134
NOP	
;GCODE.c,387 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands136:
L_GCODE_Set_M_Modal_Commands137:
L_GCODE_Set_M_Modal_Commands138:
L_GCODE_Set_M_Modal_Commands139:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands135
NOP	
;GCODE.c,388 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands140:
L_GCODE_Set_M_Modal_Commands141:
L_GCODE_Set_M_Modal_Commands142:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands135
NOP	
;GCODE.c,389 :: 		}
L_GCODE_Set_M_Modal_Commands134:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands385
NOP	
J	L_GCODE_Set_M_Modal_Commands136
NOP	
L_GCODE_Set_M_Modal_Commands385:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands387
NOP	
J	L_GCODE_Set_M_Modal_Commands137
NOP	
L_GCODE_Set_M_Modal_Commands387:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands389
NOP	
J	L_GCODE_Set_M_Modal_Commands138
NOP	
L_GCODE_Set_M_Modal_Commands389:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands391
NOP	
J	L_GCODE_Set_M_Modal_Commands139
NOP	
L_GCODE_Set_M_Modal_Commands391:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands393
NOP	
J	L_GCODE_Set_M_Modal_Commands140
NOP	
L_GCODE_Set_M_Modal_Commands393:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands395
NOP	
J	L_GCODE_Set_M_Modal_Commands141
NOP	
L_GCODE_Set_M_Modal_Commands395:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands397
NOP	
J	L_GCODE_Set_M_Modal_Commands142
NOP	
L_GCODE_Set_M_Modal_Commands397:
L_GCODE_Set_M_Modal_Commands135:
;GCODE.c,390 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,393 :: 		static int Set_M_Commands(int flow){
;GCODE.c,395 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands143
NOP	
;GCODE.c,396 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands145:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,397 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands146:
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,398 :: 		case 2:
L_GCODE_Set_M_Commands147:
;GCODE.c,399 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands148:
ORI	R2, R0, 2
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,400 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands149:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,401 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands150:
ORI	R2, R0, 255
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,402 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands151:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,406 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands152:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,407 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands153:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,408 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands154:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,409 :: 		}
L_GCODE_Set_M_Commands143:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands400
NOP	
J	L_GCODE_Set_M_Commands145
NOP	
L_GCODE_Set_M_Commands400:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands402
NOP	
J	L_GCODE_Set_M_Commands146
NOP	
L_GCODE_Set_M_Commands402:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands404
NOP	
J	L_GCODE_Set_M_Commands147
NOP	
L_GCODE_Set_M_Commands404:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands406
NOP	
J	L_GCODE_Set_M_Commands148
NOP	
L_GCODE_Set_M_Commands406:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands408
NOP	
J	L_GCODE_Set_M_Commands149
NOP	
L_GCODE_Set_M_Commands408:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands410
NOP	
J	L_GCODE_Set_M_Commands150
NOP	
L_GCODE_Set_M_Commands410:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands412
NOP	
J	L_GCODE_Set_M_Commands151
NOP	
L_GCODE_Set_M_Commands412:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands414
NOP	
J	L_GCODE_Set_M_Commands152
NOP	
L_GCODE_Set_M_Commands414:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands416
NOP	
J	L_GCODE_Set_M_Commands153
NOP	
L_GCODE_Set_M_Commands416:
J	L_GCODE_Set_M_Commands154
NOP	
L_GCODE_Set_M_Commands144:
;GCODE.c,410 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,411 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
