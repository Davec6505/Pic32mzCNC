_G_Initialise:
;GCODE.c,44 :: 		void G_Initialise(){
;GCODE.c,45 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,46 :: 		axis_words        = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,47 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,48 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,49 :: 		inverse_feed_rate = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,50 :: 		absolute_override = 0;
SB	R0, Offset(GCODE_absolute_override+0)(GP)
;GCODE.c,51 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_modalgroup:
;GCODE.c,54 :: 		int Get_modalgroup(){
;GCODE.c,55 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,56 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,58 :: 		int Rst_modalgroup(){
;GCODE.c,59 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,60 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,61 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Get_modalword:
;GCODE.c,64 :: 		int Get_modalword(){
;GCODE.c,65 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,66 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,68 :: 		int Rst_modalword(){
;GCODE.c,69 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,70 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,71 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,74 :: 		int Get_Axisword(){
;GCODE.c,75 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,76 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,78 :: 		int Rst_Axisword(){
;GCODE.c,79 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,80 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,81 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,84 :: 		int Get_motionmode(){
;GCODE.c,85 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,86 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,88 :: 		int Rst_motionmode(){
;GCODE.c,89 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,90 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,91 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,94 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,95 :: 		gc.inches_mode = 0;//temp for debugging
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,96 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,97 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,98 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,99 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,102 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,104 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,105 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,110 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
_Check_group_multiple_violations:
;GCODE.c,116 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;GCODE.c,118 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,123 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations185
NOP	
J	L_Check_group_multiple_violations0
NOP	
L__Check_group_multiple_violations185:
;GCODE.c,124 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations187
NOP	
J	L_Check_group_multiple_violations1
NOP	
L__Check_group_multiple_violations187:
;GCODE.c,125 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
L_Check_group_multiple_violations1:
;GCODE.c,128 :: 		if ( bit_istrue(modal_group_words,bit(group_number)) ) {
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations189
NOP	
J	L_Check_group_multiple_violations2
NOP	
L__Check_group_multiple_violations189:
;GCODE.c,129 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,130 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,131 :: 		} else {
L_Check_group_multiple_violations2:
;GCODE.c,132 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,133 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,136 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,137 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations190
NOP	
J	L_Check_group_multiple_violations4
NOP	
L__Check_group_multiple_violations190:
;GCODE.c,139 :: 		if(non_modal_action != last_non_modal_action){
LH	R3, Offset(Check_group_multiple_violations_last_non_modal_action_L0+0)(GP)
LH	R2, Offset(_non_modal_action+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations192
NOP	
J	L_Check_group_multiple_violations5
NOP	
L__Check_group_multiple_violations192:
;GCODE.c,140 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,141 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,142 :: 		}
L_Check_group_multiple_violations5:
;GCODE.c,144 :: 		while(DMA_Busy(1));
L_Check_group_multiple_violations6:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations194
NOP	
J	L_Check_group_multiple_violations7
NOP	
L__Check_group_multiple_violations194:
J	L_Check_group_multiple_violations6
NOP	
L_Check_group_multiple_violations7:
;GCODE.c,145 :: 		dma_printf("group_number:= %d\tnon_modal_action:= %d\tnon_modal_words:=%d\n",
ADDIU	R23, SP, 8
ADDIU	R22, R23, 61
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
;GCODE.c,146 :: 		group_number,non_modal_action,non_modal_words);
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, 8(SP)
LH	R2, Offset(_group_number+0)(GP)
SH	R2, 4(SP)
;GCODE.c,145 :: 		dma_printf("group_number:= %d\tnon_modal_action:= %d\tnon_modal_words:=%d\n",
SW	R3, 0(SP)
;GCODE.c,146 :: 		group_number,non_modal_action,non_modal_words);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
;GCODE.c,148 :: 		last_non_modal_action = non_modal_action;
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_non_modal_action_L0+0)(GP)
;GCODE.c,149 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,150 :: 		}
L_Check_group_multiple_violations4:
;GCODE.c,151 :: 		}
L_Check_group_multiple_violations0:
;GCODE.c,156 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations8:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations195
NOP	
J	L_Check_group_multiple_violations9
NOP	
L__Check_group_multiple_violations195:
;GCODE.c,157 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations197
NOP	
J	L_Check_group_multiple_violations11
NOP	
L__Check_group_multiple_violations197:
;GCODE.c,158 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations198
NOP	
J	L_Check_group_multiple_violations12
NOP	
L__Check_group_multiple_violations198:
;GCODE.c,159 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__Check_group_multiple_violations200
NOP	
J	L_Check_group_multiple_violations13
NOP	
L__Check_group_multiple_violations200:
;GCODE.c,160 :: 		gc.next_position[i] += gc.position[i] + gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;GCODE.c,161 :: 		} else {
J	L_Check_group_multiple_violations14
NOP	
L_Check_group_multiple_violations13:
;GCODE.c,165 :: 		}
L_Check_group_multiple_violations14:
;GCODE.c,166 :: 		}
L_Check_group_multiple_violations12:
;GCODE.c,167 :: 		} else {
J	L_Check_group_multiple_violations15
NOP	
L_Check_group_multiple_violations11:
;GCODE.c,168 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
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
;GCODE.c,169 :: 		}
L_Check_group_multiple_violations15:
;GCODE.c,156 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,170 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations8
NOP	
L_Check_group_multiple_violations9:
;GCODE.c,175 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations16
NOP	
;GCODE.c,177 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations18:
;GCODE.c,178 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations202
NOP	
J	L_Check_group_multiple_violations19
NOP	
L__Check_group_multiple_violations202:
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
L_Check_group_multiple_violations19:
;GCODE.c,179 :: 		break;
J	L_Check_group_multiple_violations17
NOP	
;GCODE.c,180 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations20:
;GCODE.c,181 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations203
NOP	
J	L_Check_group_multiple_violations21
NOP	
L__Check_group_multiple_violations203:
;GCODE.c,182 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,183 :: 		}else {
J	L_Check_group_multiple_violations22
NOP	
L_Check_group_multiple_violations21:
;GCODE.c,186 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,187 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,188 :: 		}
L_Check_group_multiple_violations22:
;GCODE.c,189 :: 		break;
J	L_Check_group_multiple_violations17
NOP	
;GCODE.c,190 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations23:
;GCODE.c,196 :: 		while(DMA_Busy(1));
L_Check_group_multiple_violations24:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations205
NOP	
J	L_Check_group_multiple_violations25
NOP	
L__Check_group_multiple_violations205:
J	L_Check_group_multiple_violations24
NOP	
L_Check_group_multiple_violations25:
;GCODE.c,197 :: 		dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 69
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 69
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,199 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations206
NOP	
J	L_Check_group_multiple_violations26
NOP	
L__Check_group_multiple_violations206:
;GCODE.c,200 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,201 :: 		}else {
J	L_Check_group_multiple_violations27
NOP	
L_Check_group_multiple_violations26:
;GCODE.c,203 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,204 :: 		}
L_Check_group_multiple_violations27:
;GCODE.c,205 :: 		break;
J	L_Check_group_multiple_violations17
NOP	
;GCODE.c,206 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations28:
L_Check_group_multiple_violations29:
;GCODE.c,209 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+10)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,210 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations208
NOP	
J	L__Check_group_multiple_violations172
NOP	
L__Check_group_multiple_violations208:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations209
NOP	
J	L__Check_group_multiple_violations171
NOP	
L__Check_group_multiple_violations209:
LBU	R2, Offset(_gc+8)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+116)
ORI	R2, R2, lo_addr(_gc+116)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations210
NOP	
J	L__Check_group_multiple_violations170
NOP	
L__Check_group_multiple_violations210:
LBU	R2, Offset(_gc+9)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+116)
ORI	R2, R2, lo_addr(_gc+116)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations211
NOP	
J	L__Check_group_multiple_violations169
NOP	
L__Check_group_multiple_violations211:
J	L__Check_group_multiple_violations167
NOP	
L__Check_group_multiple_violations171:
L__Check_group_multiple_violations170:
L__Check_group_multiple_violations169:
J	L_Check_group_multiple_violations34
NOP	
L__Check_group_multiple_violations167:
L__Check_group_multiple_violations172:
;GCODE.c,211 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,212 :: 		} else {
J	L_Check_group_multiple_violations35
NOP	
L_Check_group_multiple_violations34:
;GCODE.c,213 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+128)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations212
NOP	
J	L_Check_group_multiple_violations36
NOP	
L__Check_group_multiple_violations212:
;GCODE.c,215 :: 		asm{nop;}
NOP	
;GCODE.c,216 :: 		}
L_Check_group_multiple_violations36:
;GCODE.c,217 :: 		}
L_Check_group_multiple_violations35:
;GCODE.c,218 :: 		break;
J	L_Check_group_multiple_violations17
NOP	
;GCODE.c,219 :: 		}
L_Check_group_multiple_violations16:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations214
NOP	
J	L_Check_group_multiple_violations18
NOP	
L__Check_group_multiple_violations214:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations216
NOP	
J	L_Check_group_multiple_violations20
NOP	
L__Check_group_multiple_violations216:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations218
NOP	
J	L_Check_group_multiple_violations23
NOP	
L__Check_group_multiple_violations218:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations220
NOP	
J	L_Check_group_multiple_violations28
NOP	
L__Check_group_multiple_violations220:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations222
NOP	
J	L_Check_group_multiple_violations29
NOP	
L__Check_group_multiple_violations222:
L_Check_group_multiple_violations17:
;GCODE.c,221 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations37:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__Check_group_multiple_violations223
NOP	
J	L_Check_group_multiple_violations38
NOP	
L__Check_group_multiple_violations223:
;GCODE.c,222 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,221 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,223 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations37
NOP	
L_Check_group_multiple_violations38:
;GCODE.c,225 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,226 :: 		}
;GCODE.c,225 :: 		return status_code;
;GCODE.c,226 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,229 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,233 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values40
NOP	
;GCODE.c,234 :: 		case 'X':
L_Instruction_Values42:
;GCODE.c,236 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,237 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,238 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,239 :: 		case 'Y':
L_Instruction_Values43:
;GCODE.c,241 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,242 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,243 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,244 :: 		case 'Z':
L_Instruction_Values44:
;GCODE.c,246 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,247 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,248 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,249 :: 		case 'A':
L_Instruction_Values45:
;GCODE.c,251 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,252 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,253 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,254 :: 		case 'E':
L_Instruction_Values46:
;GCODE.c,256 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,257 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,258 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,259 :: 		case 'R':
L_Instruction_Values47:
;GCODE.c,261 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+128)(GP)
;GCODE.c,262 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,263 :: 		case 'I':
L_Instruction_Values48:
;GCODE.c,264 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,265 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+128)(GP)
;GCODE.c,266 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,267 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+132)(GP)
;GCODE.c,268 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,269 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,270 :: 		case 'J':
L_Instruction_Values49:
;GCODE.c,271 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,272 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+136)(GP)
;GCODE.c,273 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+120)(GP)
;GCODE.c,274 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,275 :: 		case 'K':
L_Instruction_Values50:
;GCODE.c,276 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,277 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+140)(GP)
;GCODE.c,278 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+124)(GP)
;GCODE.c,279 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,280 :: 		case 'F':
L_Instruction_Values51:
;GCODE.c,281 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,282 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values225
NOP	
J	L_Instruction_Values52
NOP	
L__Instruction_Values225:
;GCODE.c,283 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,284 :: 		}
L_Instruction_Values52:
;GCODE.c,291 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+12)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,292 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,293 :: 		case 'P':
L_Instruction_Values53:
;GCODE.c,294 :: 		S_Val = *(int*)any;
LH	R2, 0(R26)
; S_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,295 :: 		if(S_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values226
NOP	
J	L_Instruction_Values54
NOP	
L__Instruction_Values226:
;GCODE.c,296 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,297 :: 		}
L_Instruction_Values54:
;GCODE.c,298 :: 		gc.P = S_Val;
SH	R3, Offset(_gc+144)(GP)
; S_Val end address is: 12 (R3)
;GCODE.c,299 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+146)(GP)
;GCODE.c,300 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,301 :: 		case 'S':
L_Instruction_Values55:
;GCODE.c,302 :: 		S_Val = *(int*)any;
LH	R2, 0(R26)
; S_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,303 :: 		if(S_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values227
NOP	
J	L_Instruction_Values56
NOP	
L__Instruction_Values227:
;GCODE.c,304 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,305 :: 		}
L_Instruction_Values56:
;GCODE.c,306 :: 		gc.S = S_Val;
SH	R3, Offset(_gc+146)(GP)
; S_Val end address is: 12 (R3)
;GCODE.c,307 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+144)(GP)
;GCODE.c,308 :: 		break;
J	L_Instruction_Values41
NOP	
;GCODE.c,310 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values57:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_Instruction_Values41
NOP	
;GCODE.c,311 :: 		}
L_Instruction_Values40:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values229
NOP	
J	L_Instruction_Values42
NOP	
L__Instruction_Values229:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values231
NOP	
J	L_Instruction_Values43
NOP	
L__Instruction_Values231:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values233
NOP	
J	L_Instruction_Values44
NOP	
L__Instruction_Values233:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values235
NOP	
J	L_Instruction_Values45
NOP	
L__Instruction_Values235:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values237
NOP	
J	L_Instruction_Values46
NOP	
L__Instruction_Values237:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values239
NOP	
J	L_Instruction_Values47
NOP	
L__Instruction_Values239:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values241
NOP	
J	L_Instruction_Values48
NOP	
L__Instruction_Values241:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values243
NOP	
J	L_Instruction_Values49
NOP	
L__Instruction_Values243:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values245
NOP	
J	L_Instruction_Values50
NOP	
L__Instruction_Values245:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values247
NOP	
J	L_Instruction_Values51
NOP	
L__Instruction_Values247:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values249
NOP	
J	L_Instruction_Values53
NOP	
L__Instruction_Values249:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values251
NOP	
J	L_Instruction_Values55
NOP	
L__Instruction_Values251:
J	L_Instruction_Values57
NOP	
L_Instruction_Values41:
;GCODE.c,321 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,322 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
GCODE_To_Millimeters:
;GCODE.c,327 :: 		static float To_Millimeters(float value){
;GCODE.c,328 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters254
NOP	
J	L_GCODE_To_Millimeters58
NOP	
L_GCODE_To_Millimeters254:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T168 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T168 end address is: 0 (R0)
J	L_GCODE_To_Millimeters59
NOP	
L_GCODE_To_Millimeters58:
; ?FLOC__GCODE_To_Millimeters?T168 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T168 end address is: 0 (R0)
L_GCODE_To_Millimeters59:
; ?FLOC__GCODE_To_Millimeters?T168 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T168 end address is: 0 (R0)
;GCODE.c,329 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,332 :: 		static void Select_Plane(long x,long y,long z){
;GCODE.c,333 :: 		gc.position[X] = x/settings.steps_per_mm[X];
MTC1	R25, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+4)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+20)(GP)
;GCODE.c,334 :: 		gc.position[Y] = y/settings.steps_per_mm[Y];
MTC1	R26, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+8)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,335 :: 		gc.position[Z] = z/settings.steps_per_mm[Z];
MTC1	R27, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+12)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,336 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Set_Modal_Groups:
;GCODE.c,340 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,342 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,343 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
L_GCODE_Set_Modal_Groups62:
L_GCODE_Set_Modal_Groups63:
L_GCODE_Set_Modal_Groups64:
L_GCODE_Set_Modal_Groups65:
L_GCODE_Set_Modal_Groups66:
L_GCODE_Set_Modal_Groups67:
L_GCODE_Set_Modal_Groups68:
L_GCODE_Set_Modal_Groups69:
;GCODE.c,344 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,345 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups70:
L_GCODE_Set_Modal_Groups71:
L_GCODE_Set_Modal_Groups72:
L_GCODE_Set_Modal_Groups73:
L_GCODE_Set_Modal_Groups74:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,346 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups75:
L_GCODE_Set_Modal_Groups76:
L_GCODE_Set_Modal_Groups77:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,347 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups78:
L_GCODE_Set_Modal_Groups79:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,348 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups80:
L_GCODE_Set_Modal_Groups81:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,349 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups82:
L_GCODE_Set_Modal_Groups83:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,350 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups84:
L_GCODE_Set_Modal_Groups85:
L_GCODE_Set_Modal_Groups86:
L_GCODE_Set_Modal_Groups87:
L_GCODE_Set_Modal_Groups88:
L_GCODE_Set_Modal_Groups89:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups61
NOP	
;GCODE.c,351 :: 		}
L_GCODE_Set_Modal_Groups60:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups258
NOP	
J	L_GCODE_Set_Modal_Groups62
NOP	
L_GCODE_Set_Modal_Groups258:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups260
NOP	
J	L_GCODE_Set_Modal_Groups63
NOP	
L_GCODE_Set_Modal_Groups260:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups262
NOP	
J	L_GCODE_Set_Modal_Groups64
NOP	
L_GCODE_Set_Modal_Groups262:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups264
NOP	
J	L_GCODE_Set_Modal_Groups65
NOP	
L_GCODE_Set_Modal_Groups264:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups266
NOP	
J	L_GCODE_Set_Modal_Groups66
NOP	
L_GCODE_Set_Modal_Groups266:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups268
NOP	
J	L_GCODE_Set_Modal_Groups67
NOP	
L_GCODE_Set_Modal_Groups268:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups270
NOP	
J	L_GCODE_Set_Modal_Groups68
NOP	
L_GCODE_Set_Modal_Groups270:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups272
NOP	
J	L_GCODE_Set_Modal_Groups69
NOP	
L_GCODE_Set_Modal_Groups272:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups274
NOP	
J	L_GCODE_Set_Modal_Groups70
NOP	
L_GCODE_Set_Modal_Groups274:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups276
NOP	
J	L_GCODE_Set_Modal_Groups71
NOP	
L_GCODE_Set_Modal_Groups276:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups278
NOP	
J	L_GCODE_Set_Modal_Groups72
NOP	
L_GCODE_Set_Modal_Groups278:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups280
NOP	
J	L_GCODE_Set_Modal_Groups73
NOP	
L_GCODE_Set_Modal_Groups280:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups282
NOP	
J	L_GCODE_Set_Modal_Groups74
NOP	
L_GCODE_Set_Modal_Groups282:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups284
NOP	
J	L_GCODE_Set_Modal_Groups75
NOP	
L_GCODE_Set_Modal_Groups284:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups286
NOP	
J	L_GCODE_Set_Modal_Groups76
NOP	
L_GCODE_Set_Modal_Groups286:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups288
NOP	
J	L_GCODE_Set_Modal_Groups77
NOP	
L_GCODE_Set_Modal_Groups288:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups290
NOP	
J	L_GCODE_Set_Modal_Groups78
NOP	
L_GCODE_Set_Modal_Groups290:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups292
NOP	
J	L_GCODE_Set_Modal_Groups79
NOP	
L_GCODE_Set_Modal_Groups292:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups294
NOP	
J	L_GCODE_Set_Modal_Groups80
NOP	
L_GCODE_Set_Modal_Groups294:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups296
NOP	
J	L_GCODE_Set_Modal_Groups81
NOP	
L_GCODE_Set_Modal_Groups296:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups298
NOP	
J	L_GCODE_Set_Modal_Groups82
NOP	
L_GCODE_Set_Modal_Groups298:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups300
NOP	
J	L_GCODE_Set_Modal_Groups83
NOP	
L_GCODE_Set_Modal_Groups300:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups302
NOP	
J	L_GCODE_Set_Modal_Groups84
NOP	
L_GCODE_Set_Modal_Groups302:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups304
NOP	
J	L_GCODE_Set_Modal_Groups85
NOP	
L_GCODE_Set_Modal_Groups304:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups306
NOP	
J	L_GCODE_Set_Modal_Groups86
NOP	
L_GCODE_Set_Modal_Groups306:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups308
NOP	
J	L_GCODE_Set_Modal_Groups87
NOP	
L_GCODE_Set_Modal_Groups308:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups310
NOP	
J	L_GCODE_Set_Modal_Groups88
NOP	
L_GCODE_Set_Modal_Groups310:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups312
NOP	
J	L_GCODE_Set_Modal_Groups89
NOP	
L_GCODE_Set_Modal_Groups312:
L_GCODE_Set_Modal_Groups61:
;GCODE.c,352 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,353 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,356 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;GCODE.c,358 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,359 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode92:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,360 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode93:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,361 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode94:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,362 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode95:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,363 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode96:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,364 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode97:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,365 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode98:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,366 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode99:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,367 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode100:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,368 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode101:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,369 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode102:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,370 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode103:
ORI	R2, R0, 1
SB	R2, Offset(GCODE_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,371 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode104:
L_GCODE_Set_Motion_Mode105:
L_GCODE_Set_Motion_Mode106:
L_GCODE_Set_Motion_Mode107:
L_GCODE_Set_Motion_Mode108:
L_GCODE_Set_Motion_Mode109:
;GCODE.c,372 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+11)(GP)
;GCODE.c,373 :: 		break;
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,374 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode110:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,375 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode111:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,376 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode112:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,377 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode113:
ORI	R2, R0, 1
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,378 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode114:
SB	R0, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,379 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode115:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,380 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode116:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,381 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode117:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,382 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode118:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,383 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode119:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,384 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode120:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,385 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode121:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_Motion_Mode91
NOP	
;GCODE.c,386 :: 		}
L_GCODE_Set_Motion_Mode90:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode315
NOP	
J	L_GCODE_Set_Motion_Mode92
NOP	
L_GCODE_Set_Motion_Mode315:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode317
NOP	
J	L_GCODE_Set_Motion_Mode93
NOP	
L_GCODE_Set_Motion_Mode317:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode319
NOP	
J	L_GCODE_Set_Motion_Mode94
NOP	
L_GCODE_Set_Motion_Mode319:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode321
NOP	
J	L_GCODE_Set_Motion_Mode95
NOP	
L_GCODE_Set_Motion_Mode321:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode323
NOP	
J	L_GCODE_Set_Motion_Mode96
NOP	
L_GCODE_Set_Motion_Mode323:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode325
NOP	
J	L_GCODE_Set_Motion_Mode97
NOP	
L_GCODE_Set_Motion_Mode325:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode327
NOP	
J	L_GCODE_Set_Motion_Mode98
NOP	
L_GCODE_Set_Motion_Mode327:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode329
NOP	
J	L_GCODE_Set_Motion_Mode99
NOP	
L_GCODE_Set_Motion_Mode329:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode331
NOP	
J	L_GCODE_Set_Motion_Mode100
NOP	
L_GCODE_Set_Motion_Mode331:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode333
NOP	
J	L_GCODE_Set_Motion_Mode101
NOP	
L_GCODE_Set_Motion_Mode333:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode335
NOP	
J	L_GCODE_Set_Motion_Mode102
NOP	
L_GCODE_Set_Motion_Mode335:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode337
NOP	
J	L_GCODE_Set_Motion_Mode103
NOP	
L_GCODE_Set_Motion_Mode337:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode339
NOP	
J	L_GCODE_Set_Motion_Mode104
NOP	
L_GCODE_Set_Motion_Mode339:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode341
NOP	
J	L_GCODE_Set_Motion_Mode105
NOP	
L_GCODE_Set_Motion_Mode341:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode343
NOP	
J	L_GCODE_Set_Motion_Mode106
NOP	
L_GCODE_Set_Motion_Mode343:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode345
NOP	
J	L_GCODE_Set_Motion_Mode107
NOP	
L_GCODE_Set_Motion_Mode345:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode347
NOP	
J	L_GCODE_Set_Motion_Mode108
NOP	
L_GCODE_Set_Motion_Mode347:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode349
NOP	
J	L_GCODE_Set_Motion_Mode109
NOP	
L_GCODE_Set_Motion_Mode349:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode351
NOP	
J	L_GCODE_Set_Motion_Mode110
NOP	
L_GCODE_Set_Motion_Mode351:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode353
NOP	
J	L_GCODE_Set_Motion_Mode111
NOP	
L_GCODE_Set_Motion_Mode353:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode355
NOP	
J	L_GCODE_Set_Motion_Mode112
NOP	
L_GCODE_Set_Motion_Mode355:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode357
NOP	
J	L_GCODE_Set_Motion_Mode113
NOP	
L_GCODE_Set_Motion_Mode357:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode359
NOP	
J	L_GCODE_Set_Motion_Mode114
NOP	
L_GCODE_Set_Motion_Mode359:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode361
NOP	
J	L_GCODE_Set_Motion_Mode115
NOP	
L_GCODE_Set_Motion_Mode361:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode363
NOP	
J	L_GCODE_Set_Motion_Mode116
NOP	
L_GCODE_Set_Motion_Mode363:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode365
NOP	
J	L_GCODE_Set_Motion_Mode117
NOP	
L_GCODE_Set_Motion_Mode365:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode367
NOP	
J	L_GCODE_Set_Motion_Mode118
NOP	
L_GCODE_Set_Motion_Mode367:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode369
NOP	
J	L_GCODE_Set_Motion_Mode119
NOP	
L_GCODE_Set_Motion_Mode369:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode371
NOP	
J	L_GCODE_Set_Motion_Mode120
NOP	
L_GCODE_Set_Motion_Mode371:
J	L_GCODE_Set_Motion_Mode121
NOP	
L_GCODE_Set_Motion_Mode91:
;GCODE.c,392 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode372
NOP	
J	L_GCODE_Set_Motion_Mode162
NOP	
L_GCODE_Set_Motion_Mode372:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode373
NOP	
J	L_GCODE_Set_Motion_Mode161
NOP	
L_GCODE_Set_Motion_Mode373:
J	L_GCODE_Set_Motion_Mode124
NOP	
L_GCODE_Set_Motion_Mode162:
L_GCODE_Set_Motion_Mode161:
;GCODE.c,394 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode375
NOP	
J	L_GCODE_Set_Motion_Mode125
NOP	
L_GCODE_Set_Motion_Mode375:
;GCODE.c,395 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode376
NOP	
J	L_GCODE_Set_Motion_Mode164
NOP	
L_GCODE_Set_Motion_Mode376:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode378
NOP	
J	L_GCODE_Set_Motion_Mode163
NOP	
L_GCODE_Set_Motion_Mode378:
L_GCODE_Set_Motion_Mode159:
;GCODE.c,396 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,395 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode164:
L_GCODE_Set_Motion_Mode163:
;GCODE.c,398 :: 		}
L_GCODE_Set_Motion_Mode125:
;GCODE.c,400 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode380
NOP	
J	L_GCODE_Set_Motion_Mode166
NOP	
L_GCODE_Set_Motion_Mode380:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode382
NOP	
J	L_GCODE_Set_Motion_Mode130
NOP	
L_GCODE_Set_Motion_Mode382:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode384
NOP	
J	L_GCODE_Set_Motion_Mode130
NOP	
L_GCODE_Set_Motion_Mode384:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode129
NOP	
L_GCODE_Set_Motion_Mode130:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode129:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode385
NOP	
J	L_GCODE_Set_Motion_Mode165
NOP	
L_GCODE_Set_Motion_Mode385:
L_GCODE_Set_Motion_Mode158:
;GCODE.c,401 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,400 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode166:
L_GCODE_Set_Motion_Mode165:
;GCODE.c,404 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(GCODE_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode387
NOP	
J	L_GCODE_Set_Motion_Mode134
NOP	
L_GCODE_Set_Motion_Mode387:
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode134:
;GCODE.c,406 :: 		}
L_GCODE_Set_Motion_Mode124:
;GCODE.c,408 :: 		while(DMA_Busy(1));
L_GCODE_Set_Motion_Mode135:
SH	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
LH	R25, 16(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode389
NOP	
J	L_GCODE_Set_Motion_Mode136
NOP	
L_GCODE_Set_Motion_Mode389:
J	L_GCODE_Set_Motion_Mode135
NOP	
L_GCODE_Set_Motion_Mode136:
;GCODE.c,409 :: 		dma_printf("non_modal_action:= %d\n",non_modal_action);
ADDIU	R23, SP, 18
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICSGCODE_?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 18
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R25, 16(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 16(SP)
;GCODE.c,411 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,412 :: 		}
;GCODE.c,411 :: 		return motion_mode;
;GCODE.c,412 :: 		}
L_end_Set_Motion_Mode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,414 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,416 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands137
NOP	
;GCODE.c,417 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands139:
L_GCODE_Set_M_Modal_Commands140:
L_GCODE_Set_M_Modal_Commands141:
L_GCODE_Set_M_Modal_Commands142:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands138
NOP	
;GCODE.c,418 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands143:
L_GCODE_Set_M_Modal_Commands144:
L_GCODE_Set_M_Modal_Commands145:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands138
NOP	
;GCODE.c,419 :: 		}
L_GCODE_Set_M_Modal_Commands137:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands392
NOP	
J	L_GCODE_Set_M_Modal_Commands139
NOP	
L_GCODE_Set_M_Modal_Commands392:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands394
NOP	
J	L_GCODE_Set_M_Modal_Commands140
NOP	
L_GCODE_Set_M_Modal_Commands394:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands396
NOP	
J	L_GCODE_Set_M_Modal_Commands141
NOP	
L_GCODE_Set_M_Modal_Commands396:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands398
NOP	
J	L_GCODE_Set_M_Modal_Commands142
NOP	
L_GCODE_Set_M_Modal_Commands398:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands400
NOP	
J	L_GCODE_Set_M_Modal_Commands143
NOP	
L_GCODE_Set_M_Modal_Commands400:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands402
NOP	
J	L_GCODE_Set_M_Modal_Commands144
NOP	
L_GCODE_Set_M_Modal_Commands402:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands404
NOP	
J	L_GCODE_Set_M_Modal_Commands145
NOP	
L_GCODE_Set_M_Modal_Commands404:
L_GCODE_Set_M_Modal_Commands138:
;GCODE.c,420 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,423 :: 		static int Set_M_Commands(int flow){
;GCODE.c,425 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands146
NOP	
;GCODE.c,426 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands148:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,427 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands149:
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,428 :: 		case 2:
L_GCODE_Set_M_Commands150:
;GCODE.c,429 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands151:
ORI	R2, R0, 2
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,430 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands152:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,431 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands153:
ORI	R2, R0, 255
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,432 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands154:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,436 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands155:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,437 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands156:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,438 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands157:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_M_Commands147
NOP	
;GCODE.c,439 :: 		}
L_GCODE_Set_M_Commands146:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands407
NOP	
J	L_GCODE_Set_M_Commands148
NOP	
L_GCODE_Set_M_Commands407:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands409
NOP	
J	L_GCODE_Set_M_Commands149
NOP	
L_GCODE_Set_M_Commands409:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands411
NOP	
J	L_GCODE_Set_M_Commands150
NOP	
L_GCODE_Set_M_Commands411:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands413
NOP	
J	L_GCODE_Set_M_Commands151
NOP	
L_GCODE_Set_M_Commands413:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands415
NOP	
J	L_GCODE_Set_M_Commands152
NOP	
L_GCODE_Set_M_Commands415:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands417
NOP	
J	L_GCODE_Set_M_Commands153
NOP	
L_GCODE_Set_M_Commands417:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands419
NOP	
J	L_GCODE_Set_M_Commands154
NOP	
L_GCODE_Set_M_Commands419:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands421
NOP	
J	L_GCODE_Set_M_Commands155
NOP	
L_GCODE_Set_M_Commands421:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands423
NOP	
J	L_GCODE_Set_M_Commands156
NOP	
L_GCODE_Set_M_Commands423:
J	L_GCODE_Set_M_Commands157
NOP	
L_GCODE_Set_M_Commands147:
;GCODE.c,440 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,441 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
