_G_Initialise:
;GCODE.c,43 :: 		void G_Initialise(){
;GCODE.c,44 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,45 :: 		axis_words        = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,46 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,47 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,48 :: 		inverse_feed_rate = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,49 :: 		absolute_override = 0;
SB	R0, Offset(GCODE_absolute_override+0)(GP)
;GCODE.c,50 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_modalgroup:
;GCODE.c,53 :: 		int Get_modalgroup(){
;GCODE.c,54 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,55 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,57 :: 		int Rst_modalgroup(){
;GCODE.c,58 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,59 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,60 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Get_modalword:
;GCODE.c,63 :: 		int Get_modalword(){
;GCODE.c,64 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,65 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,67 :: 		int Rst_modalword(){
;GCODE.c,68 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,69 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,70 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,73 :: 		int Get_Axisword(){
;GCODE.c,74 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,75 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,77 :: 		int Rst_Axisword(){
;GCODE.c,78 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,79 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,80 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,83 :: 		int Get_motionmode(){
;GCODE.c,84 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,85 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,87 :: 		int Rst_motionmode(){
;GCODE.c,88 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,89 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,90 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,93 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,94 :: 		gc.inches_mode = 0;//temp for debugging
SB	R0, Offset(_gc+2)(GP)
;GCODE.c,95 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,96 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,97 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,98 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,101 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,103 :: 		Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
;GCODE.c,104 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,109 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
_Check_group_multiple_violations:
;GCODE.c,115 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;GCODE.c,117 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,122 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations188
NOP	
J	L_Check_group_multiple_violations0
NOP	
L__Check_group_multiple_violations188:
;GCODE.c,124 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,125 :: 		if(group_number == MODAL_GROUP_NONE)
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations189
NOP	
J	L_Check_group_multiple_violations1
NOP	
L__Check_group_multiple_violations189:
;GCODE.c,126 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(GCODE_status_code+0)(GP)
L_Check_group_multiple_violations1:
;GCODE.c,128 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations191
NOP	
J	L_Check_group_multiple_violations2
NOP	
L__Check_group_multiple_violations191:
;GCODE.c,129 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations2:
;GCODE.c,131 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,134 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations3:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations193
NOP	
J	L_Check_group_multiple_violations4
NOP	
L__Check_group_multiple_violations193:
J	L_Check_group_multiple_violations3
NOP	
L_Check_group_multiple_violations4:
;GCODE.c,135 :: 		dma_printf("group_number:= %d\n",group_number);
ADDIU	R23, SP, 8
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LH	R2, Offset(_group_number+0)(GP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,138 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,139 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations194
NOP	
J	L_Check_group_multiple_violations5
NOP	
L__Check_group_multiple_violations194:
;GCODE.c,141 :: 		if(non_modal_action != last_non_modal_action){
LH	R3, Offset(Check_group_multiple_violations_last_non_modal_action_L0+0)(GP)
LH	R2, Offset(_non_modal_action+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations196
NOP	
J	L_Check_group_multiple_violations6
NOP	
L__Check_group_multiple_violations196:
;GCODE.c,142 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,143 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,144 :: 		}
L_Check_group_multiple_violations6:
;GCODE.c,146 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations7:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations198
NOP	
J	L_Check_group_multiple_violations8
NOP	
L__Check_group_multiple_violations198:
J	L_Check_group_multiple_violations7
NOP	
L_Check_group_multiple_violations8:
;GCODE.c,147 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
ADDIU	R23, SP, 27
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 27
;GCODE.c,148 :: 		non_modal_action,non_modal_words);
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, 4(SP)
;GCODE.c,147 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
SW	R3, 0(SP)
;GCODE.c,148 :: 		non_modal_action,non_modal_words);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,150 :: 		last_non_modal_action = non_modal_action;
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_non_modal_action_L0+0)(GP)
;GCODE.c,151 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,152 :: 		}
L_Check_group_multiple_violations5:
;GCODE.c,153 :: 		}
L_Check_group_multiple_violations0:
;GCODE.c,158 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations9:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations199
NOP	
J	L_Check_group_multiple_violations10
NOP	
L__Check_group_multiple_violations199:
;GCODE.c,159 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations201
NOP	
J	L_Check_group_multiple_violations12
NOP	
L__Check_group_multiple_violations201:
;GCODE.c,160 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations202
NOP	
J	L_Check_group_multiple_violations13
NOP	
L__Check_group_multiple_violations202:
;GCODE.c,161 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L__Check_group_multiple_violations204
NOP	
J	L_Check_group_multiple_violations14
NOP	
L__Check_group_multiple_violations204:
;GCODE.c,163 :: 		} else {
J	L_Check_group_multiple_violations15
NOP	
L_Check_group_multiple_violations14:
;GCODE.c,166 :: 		gc.next_position[i] + gc.coord_offset[i]; // Incremental mode
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+68)
ORI	R2, R2, lo_addr(_gc+68)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;GCODE.c,167 :: 		}
L_Check_group_multiple_violations15:
;GCODE.c,168 :: 		}
L_Check_group_multiple_violations13:
;GCODE.c,169 :: 		} else {
J	L_Check_group_multiple_violations16
NOP	
L_Check_group_multiple_violations12:
;GCODE.c,170 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+68)
ORI	R2, R2, lo_addr(_gc+68)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;GCODE.c,171 :: 		}
L_Check_group_multiple_violations16:
;GCODE.c,158 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,172 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations9
NOP	
L_Check_group_multiple_violations10:
;GCODE.c,177 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations17
NOP	
;GCODE.c,179 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations19:
;GCODE.c,180 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations206
NOP	
J	L_Check_group_multiple_violations20
NOP	
L__Check_group_multiple_violations206:
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
L_Check_group_multiple_violations20:
;GCODE.c,181 :: 		break;
J	L_Check_group_multiple_violations18
NOP	
;GCODE.c,182 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations21:
;GCODE.c,183 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations207
NOP	
J	L_Check_group_multiple_violations22
NOP	
L__Check_group_multiple_violations207:
;GCODE.c,184 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,185 :: 		}else {
J	L_Check_group_multiple_violations23
NOP	
L_Check_group_multiple_violations22:
;GCODE.c,188 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+12)(GP)
;GCODE.c,189 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,190 :: 		}
L_Check_group_multiple_violations23:
;GCODE.c,191 :: 		break;
J	L_Check_group_multiple_violations18
NOP	
;GCODE.c,192 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations24:
;GCODE.c,198 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations25:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations209
NOP	
J	L_Check_group_multiple_violations26
NOP	
L__Check_group_multiple_violations209:
J	L_Check_group_multiple_violations25
NOP	
L_Check_group_multiple_violations26:
;GCODE.c,199 :: 		dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 70
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 70
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,201 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations210
NOP	
J	L_Check_group_multiple_violations27
NOP	
L__Check_group_multiple_violations210:
;GCODE.c,202 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,203 :: 		}else {
J	L_Check_group_multiple_violations28
NOP	
L_Check_group_multiple_violations27:
;GCODE.c,205 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,206 :: 		}
L_Check_group_multiple_violations28:
;GCODE.c,207 :: 		break;
J	L_Check_group_multiple_violations18
NOP	
;GCODE.c,208 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations29:
L_Check_group_multiple_violations30:
;GCODE.c,211 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+10)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,212 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations212
NOP	
J	L__Check_group_multiple_violations175
NOP	
L__Check_group_multiple_violations212:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations213
NOP	
J	L__Check_group_multiple_violations174
NOP	
L__Check_group_multiple_violations213:
LBU	R2, Offset(_gc+8)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations214
NOP	
J	L__Check_group_multiple_violations173
NOP	
L__Check_group_multiple_violations214:
LBU	R2, Offset(_gc+9)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+92)
ORI	R2, R2, lo_addr(_gc+92)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations215
NOP	
J	L__Check_group_multiple_violations172
NOP	
L__Check_group_multiple_violations215:
J	L__Check_group_multiple_violations170
NOP	
L__Check_group_multiple_violations174:
L__Check_group_multiple_violations173:
L__Check_group_multiple_violations172:
J	L_Check_group_multiple_violations35
NOP	
L__Check_group_multiple_violations170:
L__Check_group_multiple_violations175:
;GCODE.c,213 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,214 :: 		} else {
J	L_Check_group_multiple_violations36
NOP	
L_Check_group_multiple_violations35:
;GCODE.c,215 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+104)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations216
NOP	
J	L_Check_group_multiple_violations37
NOP	
L__Check_group_multiple_violations216:
;GCODE.c,217 :: 		asm{nop;}
NOP	
;GCODE.c,218 :: 		}
L_Check_group_multiple_violations37:
;GCODE.c,219 :: 		}
L_Check_group_multiple_violations36:
;GCODE.c,220 :: 		break;
J	L_Check_group_multiple_violations18
NOP	
;GCODE.c,221 :: 		}
L_Check_group_multiple_violations17:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations218
NOP	
J	L_Check_group_multiple_violations19
NOP	
L__Check_group_multiple_violations218:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations220
NOP	
J	L_Check_group_multiple_violations21
NOP	
L__Check_group_multiple_violations220:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations222
NOP	
J	L_Check_group_multiple_violations24
NOP	
L__Check_group_multiple_violations222:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations224
NOP	
J	L_Check_group_multiple_violations29
NOP	
L__Check_group_multiple_violations224:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations226
NOP	
J	L_Check_group_multiple_violations30
NOP	
L__Check_group_multiple_violations226:
L_Check_group_multiple_violations18:
;GCODE.c,223 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations38:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 6
BNE	R2, R0, L__Check_group_multiple_violations227
NOP	
J	L_Check_group_multiple_violations39
NOP	
L__Check_group_multiple_violations227:
;GCODE.c,224 :: 		gc.position[i] =  gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+20)
ORI	R2, R2, lo_addr(_gc+20)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+68)
ORI	R2, R2, lo_addr(_gc+68)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;GCODE.c,223 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,225 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations38
NOP	
L_Check_group_multiple_violations39:
;GCODE.c,227 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,228 :: 		}
;GCODE.c,227 :: 		return status_code;
;GCODE.c,228 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,231 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,235 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values41
NOP	
;GCODE.c,236 :: 		case 'X':
L_Instruction_Values43:
;GCODE.c,238 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+68)(GP)
;GCODE.c,239 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,240 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,241 :: 		case 'Y':
L_Instruction_Values44:
;GCODE.c,243 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,244 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,245 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,246 :: 		case 'Z':
L_Instruction_Values45:
;GCODE.c,248 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,249 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,250 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,251 :: 		case 'A':
L_Instruction_Values46:
;GCODE.c,253 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,254 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,255 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,256 :: 		case 'E':
L_Instruction_Values47:
;GCODE.c,258 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,259 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,260 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,261 :: 		case 'R':
L_Instruction_Values48:
;GCODE.c,263 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,264 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,265 :: 		case 'I':
L_Instruction_Values49:
;GCODE.c,266 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,267 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+104)(GP)
;GCODE.c,268 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,269 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,270 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,271 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,272 :: 		case 'J':
L_Instruction_Values50:
;GCODE.c,273 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,274 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,275 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,276 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,277 :: 		case 'K':
L_Instruction_Values51:
;GCODE.c,278 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,279 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+116)(GP)
;GCODE.c,280 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,281 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,282 :: 		case 'F':
L_Instruction_Values52:
;GCODE.c,283 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,284 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values229
NOP	
J	L_Instruction_Values53
NOP	
L__Instruction_Values229:
;GCODE.c,285 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,286 :: 		}
L_Instruction_Values53:
;GCODE.c,293 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+12)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,294 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,295 :: 		case 'P':
L_Instruction_Values54:
;GCODE.c,296 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,297 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values230
NOP	
J	L_Instruction_Values55
NOP	
L__Instruction_Values230:
;GCODE.c,298 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,299 :: 		}
L_Instruction_Values55:
;GCODE.c,300 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+120)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,301 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+122)(GP)
;GCODE.c,302 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,303 :: 		case 'S':
L_Instruction_Values56:
;GCODE.c,304 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,305 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values231
NOP	
J	L_Instruction_Values57
NOP	
L__Instruction_Values231:
;GCODE.c,306 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,307 :: 		}
L_Instruction_Values57:
;GCODE.c,308 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+122)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,309 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+120)(GP)
;GCODE.c,310 :: 		break;
J	L_Instruction_Values42
NOP	
;GCODE.c,311 :: 		case 'L':
L_Instruction_Values58:
;GCODE.c,312 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,313 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values232
NOP	
J	L_Instruction_Values59
NOP	
L__Instruction_Values232:
;GCODE.c,314 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,315 :: 		}
L_Instruction_Values59:
;GCODE.c,316 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+14)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,317 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values42
NOP	
;GCODE.c,318 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values60:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_Instruction_Values42
NOP	
;GCODE.c,319 :: 		}
L_Instruction_Values41:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values234
NOP	
J	L_Instruction_Values43
NOP	
L__Instruction_Values234:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values236
NOP	
J	L_Instruction_Values44
NOP	
L__Instruction_Values236:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values238
NOP	
J	L_Instruction_Values45
NOP	
L__Instruction_Values238:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values240
NOP	
J	L_Instruction_Values46
NOP	
L__Instruction_Values240:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values242
NOP	
J	L_Instruction_Values47
NOP	
L__Instruction_Values242:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values244
NOP	
J	L_Instruction_Values48
NOP	
L__Instruction_Values244:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values246
NOP	
J	L_Instruction_Values49
NOP	
L__Instruction_Values246:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values248
NOP	
J	L_Instruction_Values50
NOP	
L__Instruction_Values248:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values250
NOP	
J	L_Instruction_Values51
NOP	
L__Instruction_Values250:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values252
NOP	
J	L_Instruction_Values52
NOP	
L__Instruction_Values252:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values254
NOP	
J	L_Instruction_Values54
NOP	
L__Instruction_Values254:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values256
NOP	
J	L_Instruction_Values56
NOP	
L__Instruction_Values256:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values258
NOP	
J	L_Instruction_Values58
NOP	
L__Instruction_Values258:
J	L_Instruction_Values60
NOP	
L_Instruction_Values42:
;GCODE.c,329 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,330 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
GCODE_To_Millimeters:
;GCODE.c,335 :: 		static float To_Millimeters(float value){
;GCODE.c,336 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters261
NOP	
J	L_GCODE_To_Millimeters61
NOP	
L_GCODE_To_Millimeters261:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T153 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T153 end address is: 0 (R0)
J	L_GCODE_To_Millimeters62
NOP	
L_GCODE_To_Millimeters61:
; ?FLOC__GCODE_To_Millimeters?T153 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T153 end address is: 0 (R0)
L_GCODE_To_Millimeters62:
; ?FLOC__GCODE_To_Millimeters?T153 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T153 end address is: 0 (R0)
;GCODE.c,337 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,340 :: 		static void Select_Plane(long x,long y,long z){
;GCODE.c,341 :: 		gc.position[X] = x/settings.steps_per_mm[X];
MTC1	R25, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+4)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+20)(GP)
;GCODE.c,342 :: 		gc.position[Y] = y/settings.steps_per_mm[Y];
MTC1	R26, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+8)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,343 :: 		gc.position[Z] = z/settings.steps_per_mm[Z];
MTC1	R27, S0
CVT32.W 	S1, S0
LWC1	S0, Offset(_settings+12)(GP)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,344 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Set_Modal_Groups:
;GCODE.c,348 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,350 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups63
NOP	
;GCODE.c,351 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
L_GCODE_Set_Modal_Groups65:
L_GCODE_Set_Modal_Groups66:
L_GCODE_Set_Modal_Groups67:
L_GCODE_Set_Modal_Groups68:
L_GCODE_Set_Modal_Groups69:
L_GCODE_Set_Modal_Groups70:
L_GCODE_Set_Modal_Groups71:
L_GCODE_Set_Modal_Groups72:
;GCODE.c,352 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,353 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups73:
L_GCODE_Set_Modal_Groups74:
L_GCODE_Set_Modal_Groups75:
L_GCODE_Set_Modal_Groups76:
L_GCODE_Set_Modal_Groups77:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,354 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups78:
L_GCODE_Set_Modal_Groups79:
L_GCODE_Set_Modal_Groups80:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,355 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups81:
L_GCODE_Set_Modal_Groups82:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,356 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups83:
L_GCODE_Set_Modal_Groups84:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,357 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups85:
L_GCODE_Set_Modal_Groups86:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,358 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups87:
L_GCODE_Set_Modal_Groups88:
L_GCODE_Set_Modal_Groups89:
L_GCODE_Set_Modal_Groups90:
L_GCODE_Set_Modal_Groups91:
L_GCODE_Set_Modal_Groups92:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups64
NOP	
;GCODE.c,359 :: 		}
L_GCODE_Set_Modal_Groups63:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups265
NOP	
J	L_GCODE_Set_Modal_Groups65
NOP	
L_GCODE_Set_Modal_Groups265:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups267
NOP	
J	L_GCODE_Set_Modal_Groups66
NOP	
L_GCODE_Set_Modal_Groups267:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups269
NOP	
J	L_GCODE_Set_Modal_Groups67
NOP	
L_GCODE_Set_Modal_Groups269:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups271
NOP	
J	L_GCODE_Set_Modal_Groups68
NOP	
L_GCODE_Set_Modal_Groups271:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups273
NOP	
J	L_GCODE_Set_Modal_Groups69
NOP	
L_GCODE_Set_Modal_Groups273:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups275
NOP	
J	L_GCODE_Set_Modal_Groups70
NOP	
L_GCODE_Set_Modal_Groups275:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups277
NOP	
J	L_GCODE_Set_Modal_Groups71
NOP	
L_GCODE_Set_Modal_Groups277:
SEH	R3, R25
ORI	R2, R0, 92
BNE	R3, R2, L_GCODE_Set_Modal_Groups279
NOP	
J	L_GCODE_Set_Modal_Groups72
NOP	
L_GCODE_Set_Modal_Groups279:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups281
NOP	
J	L_GCODE_Set_Modal_Groups73
NOP	
L_GCODE_Set_Modal_Groups281:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups283
NOP	
J	L_GCODE_Set_Modal_Groups74
NOP	
L_GCODE_Set_Modal_Groups283:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups285
NOP	
J	L_GCODE_Set_Modal_Groups75
NOP	
L_GCODE_Set_Modal_Groups285:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups287
NOP	
J	L_GCODE_Set_Modal_Groups76
NOP	
L_GCODE_Set_Modal_Groups287:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups289
NOP	
J	L_GCODE_Set_Modal_Groups77
NOP	
L_GCODE_Set_Modal_Groups289:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups291
NOP	
J	L_GCODE_Set_Modal_Groups78
NOP	
L_GCODE_Set_Modal_Groups291:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups293
NOP	
J	L_GCODE_Set_Modal_Groups79
NOP	
L_GCODE_Set_Modal_Groups293:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups295
NOP	
J	L_GCODE_Set_Modal_Groups80
NOP	
L_GCODE_Set_Modal_Groups295:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups297
NOP	
J	L_GCODE_Set_Modal_Groups81
NOP	
L_GCODE_Set_Modal_Groups297:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups299
NOP	
J	L_GCODE_Set_Modal_Groups82
NOP	
L_GCODE_Set_Modal_Groups299:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups301
NOP	
J	L_GCODE_Set_Modal_Groups83
NOP	
L_GCODE_Set_Modal_Groups301:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups303
NOP	
J	L_GCODE_Set_Modal_Groups84
NOP	
L_GCODE_Set_Modal_Groups303:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups305
NOP	
J	L_GCODE_Set_Modal_Groups85
NOP	
L_GCODE_Set_Modal_Groups305:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups307
NOP	
J	L_GCODE_Set_Modal_Groups86
NOP	
L_GCODE_Set_Modal_Groups307:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups309
NOP	
J	L_GCODE_Set_Modal_Groups87
NOP	
L_GCODE_Set_Modal_Groups309:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups311
NOP	
J	L_GCODE_Set_Modal_Groups88
NOP	
L_GCODE_Set_Modal_Groups311:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups313
NOP	
J	L_GCODE_Set_Modal_Groups89
NOP	
L_GCODE_Set_Modal_Groups313:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups315
NOP	
J	L_GCODE_Set_Modal_Groups90
NOP	
L_GCODE_Set_Modal_Groups315:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups317
NOP	
J	L_GCODE_Set_Modal_Groups91
NOP	
L_GCODE_Set_Modal_Groups317:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups319
NOP	
J	L_GCODE_Set_Modal_Groups92
NOP	
L_GCODE_Set_Modal_Groups319:
L_GCODE_Set_Modal_Groups64:
;GCODE.c,360 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,361 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,364 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;GCODE.c,366 :: 		switch(mode){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_GCODE_Set_Motion_Mode93
NOP	
;GCODE.c,367 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode95:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,368 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode96:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,369 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode97:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,370 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode98:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,371 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode99:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,372 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode100:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,373 :: 		case 17: Select_Plane(X, Y, Z); break;
L_GCODE_Set_Motion_Mode101:
ORI	R27, R0, 2
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,374 :: 		case 18: Select_Plane(X, Z, Y); break;
L_GCODE_Set_Motion_Mode102:
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,375 :: 		case 19: Select_Plane(Y, Z, X); break;
L_GCODE_Set_Motion_Mode103:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,376 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode104:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,377 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode105:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,378 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode106:
ORI	R2, R0, 1
SB	R2, Offset(GCODE_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,379 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode107:
L_GCODE_Set_Motion_Mode108:
L_GCODE_Set_Motion_Mode109:
L_GCODE_Set_Motion_Mode110:
L_GCODE_Set_Motion_Mode111:
L_GCODE_Set_Motion_Mode112:
;GCODE.c,380 :: 		gc.coord_select = int_value-54;
LH	R2, Offset(_int_value+0)(GP)
ADDIU	R2, R2, -54
SB	R2, Offset(_gc+11)(GP)
;GCODE.c,381 :: 		break;
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,382 :: 		case 80: motion_mode = MOTION_MODE_CANCEL; break;
L_GCODE_Set_Motion_Mode113:
ORI	R2, R0, 4
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,383 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode114:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,384 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode115:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,385 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode116:
ORI	R2, R0, 1
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,386 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode117:
SB	R0, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,387 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode118:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,388 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode119:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,389 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode120:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,390 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode121:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,391 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode122:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,392 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode123:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,393 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_Motion_Mode124:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_Motion_Mode94
NOP	
;GCODE.c,394 :: 		}
L_GCODE_Set_Motion_Mode93:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode322
NOP	
J	L_GCODE_Set_Motion_Mode95
NOP	
L_GCODE_Set_Motion_Mode322:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode324
NOP	
J	L_GCODE_Set_Motion_Mode96
NOP	
L_GCODE_Set_Motion_Mode324:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode326
NOP	
J	L_GCODE_Set_Motion_Mode97
NOP	
L_GCODE_Set_Motion_Mode326:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode328
NOP	
J	L_GCODE_Set_Motion_Mode98
NOP	
L_GCODE_Set_Motion_Mode328:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode330
NOP	
J	L_GCODE_Set_Motion_Mode99
NOP	
L_GCODE_Set_Motion_Mode330:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode332
NOP	
J	L_GCODE_Set_Motion_Mode100
NOP	
L_GCODE_Set_Motion_Mode332:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode334
NOP	
J	L_GCODE_Set_Motion_Mode101
NOP	
L_GCODE_Set_Motion_Mode334:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode336
NOP	
J	L_GCODE_Set_Motion_Mode102
NOP	
L_GCODE_Set_Motion_Mode336:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode338
NOP	
J	L_GCODE_Set_Motion_Mode103
NOP	
L_GCODE_Set_Motion_Mode338:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode340
NOP	
J	L_GCODE_Set_Motion_Mode104
NOP	
L_GCODE_Set_Motion_Mode340:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode342
NOP	
J	L_GCODE_Set_Motion_Mode105
NOP	
L_GCODE_Set_Motion_Mode342:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode344
NOP	
J	L_GCODE_Set_Motion_Mode106
NOP	
L_GCODE_Set_Motion_Mode344:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode346
NOP	
J	L_GCODE_Set_Motion_Mode107
NOP	
L_GCODE_Set_Motion_Mode346:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode348
NOP	
J	L_GCODE_Set_Motion_Mode108
NOP	
L_GCODE_Set_Motion_Mode348:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode350
NOP	
J	L_GCODE_Set_Motion_Mode109
NOP	
L_GCODE_Set_Motion_Mode350:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode352
NOP	
J	L_GCODE_Set_Motion_Mode110
NOP	
L_GCODE_Set_Motion_Mode352:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode354
NOP	
J	L_GCODE_Set_Motion_Mode111
NOP	
L_GCODE_Set_Motion_Mode354:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode356
NOP	
J	L_GCODE_Set_Motion_Mode112
NOP	
L_GCODE_Set_Motion_Mode356:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode358
NOP	
J	L_GCODE_Set_Motion_Mode113
NOP	
L_GCODE_Set_Motion_Mode358:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode360
NOP	
J	L_GCODE_Set_Motion_Mode114
NOP	
L_GCODE_Set_Motion_Mode360:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode362
NOP	
J	L_GCODE_Set_Motion_Mode115
NOP	
L_GCODE_Set_Motion_Mode362:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode364
NOP	
J	L_GCODE_Set_Motion_Mode116
NOP	
L_GCODE_Set_Motion_Mode364:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode366
NOP	
J	L_GCODE_Set_Motion_Mode117
NOP	
L_GCODE_Set_Motion_Mode366:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode368
NOP	
J	L_GCODE_Set_Motion_Mode118
NOP	
L_GCODE_Set_Motion_Mode368:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode370
NOP	
J	L_GCODE_Set_Motion_Mode119
NOP	
L_GCODE_Set_Motion_Mode370:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode372
NOP	
J	L_GCODE_Set_Motion_Mode120
NOP	
L_GCODE_Set_Motion_Mode372:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode374
NOP	
J	L_GCODE_Set_Motion_Mode121
NOP	
L_GCODE_Set_Motion_Mode374:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode376
NOP	
J	L_GCODE_Set_Motion_Mode122
NOP	
L_GCODE_Set_Motion_Mode376:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode378
NOP	
J	L_GCODE_Set_Motion_Mode123
NOP	
L_GCODE_Set_Motion_Mode378:
J	L_GCODE_Set_Motion_Mode124
NOP	
L_GCODE_Set_Motion_Mode94:
;GCODE.c,395 :: 		FAIL(STATUS_OK);
SH	R0, Offset(GCODE_status_code+0)(GP)
;GCODE.c,400 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode379
NOP	
J	L_GCODE_Set_Motion_Mode165
NOP	
L_GCODE_Set_Motion_Mode379:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode380
NOP	
J	L_GCODE_Set_Motion_Mode164
NOP	
L_GCODE_Set_Motion_Mode380:
J	L_GCODE_Set_Motion_Mode127
NOP	
L_GCODE_Set_Motion_Mode165:
L_GCODE_Set_Motion_Mode164:
;GCODE.c,402 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+1)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode382
NOP	
J	L_GCODE_Set_Motion_Mode128
NOP	
L_GCODE_Set_Motion_Mode382:
;GCODE.c,403 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode383
NOP	
J	L_GCODE_Set_Motion_Mode167
NOP	
L_GCODE_Set_Motion_Mode383:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode385
NOP	
J	L_GCODE_Set_Motion_Mode166
NOP	
L_GCODE_Set_Motion_Mode385:
L_GCODE_Set_Motion_Mode162:
;GCODE.c,404 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,403 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode167:
L_GCODE_Set_Motion_Mode166:
;GCODE.c,406 :: 		}
L_GCODE_Set_Motion_Mode128:
;GCODE.c,408 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode387
NOP	
J	L_GCODE_Set_Motion_Mode169
NOP	
L_GCODE_Set_Motion_Mode387:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode389
NOP	
J	L_GCODE_Set_Motion_Mode133
NOP	
L_GCODE_Set_Motion_Mode389:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode391
NOP	
J	L_GCODE_Set_Motion_Mode133
NOP	
L_GCODE_Set_Motion_Mode391:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode132
NOP	
L_GCODE_Set_Motion_Mode133:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode132:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode392
NOP	
J	L_GCODE_Set_Motion_Mode168
NOP	
L_GCODE_Set_Motion_Mode392:
L_GCODE_Set_Motion_Mode161:
;GCODE.c,409 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,408 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode169:
L_GCODE_Set_Motion_Mode168:
;GCODE.c,412 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(GCODE_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode394
NOP	
J	L_GCODE_Set_Motion_Mode137
NOP	
L_GCODE_Set_Motion_Mode394:
LH	R2, Offset(GCODE_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode137:
;GCODE.c,414 :: 		}
L_GCODE_Set_Motion_Mode127:
;GCODE.c,416 :: 		while(DMA_IsOn(1));
L_GCODE_Set_Motion_Mode138:
SH	R25, 16(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 16(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode396
NOP	
J	L_GCODE_Set_Motion_Mode139
NOP	
L_GCODE_Set_Motion_Mode396:
J	L_GCODE_Set_Motion_Mode138
NOP	
L_GCODE_Set_Motion_Mode139:
;GCODE.c,417 :: 		dma_printf("non_modal_action:= %d\n",non_modal_action);
ADDIU	R23, SP, 18
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICSGCODE_?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr4_GCODE+0)
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
;GCODE.c,419 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,420 :: 		}
;GCODE.c,419 :: 		return motion_mode;
;GCODE.c,420 :: 		}
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
;GCODE.c,422 :: 		static void Set_M_Modal_Commands(int flow){
;GCODE.c,424 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands140
NOP	
;GCODE.c,425 :: 		case 0: case 1: case 2: case 30: group_number = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands142:
L_GCODE_Set_M_Modal_Commands143:
L_GCODE_Set_M_Modal_Commands144:
L_GCODE_Set_M_Modal_Commands145:
ORI	R2, R0, 5
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands141
NOP	
;GCODE.c,426 :: 		case 3: case 4: case 5: group_number = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands146:
L_GCODE_Set_M_Modal_Commands147:
L_GCODE_Set_M_Modal_Commands148:
ORI	R2, R0, 8
SH	R2, Offset(_group_number+0)(GP)
J	L_GCODE_Set_M_Modal_Commands141
NOP	
;GCODE.c,427 :: 		}
L_GCODE_Set_M_Modal_Commands140:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands399
NOP	
J	L_GCODE_Set_M_Modal_Commands142
NOP	
L_GCODE_Set_M_Modal_Commands399:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands401
NOP	
J	L_GCODE_Set_M_Modal_Commands143
NOP	
L_GCODE_Set_M_Modal_Commands401:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands403
NOP	
J	L_GCODE_Set_M_Modal_Commands144
NOP	
L_GCODE_Set_M_Modal_Commands403:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands405
NOP	
J	L_GCODE_Set_M_Modal_Commands145
NOP	
L_GCODE_Set_M_Modal_Commands405:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands407
NOP	
J	L_GCODE_Set_M_Modal_Commands146
NOP	
L_GCODE_Set_M_Modal_Commands407:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands409
NOP	
J	L_GCODE_Set_M_Modal_Commands147
NOP	
L_GCODE_Set_M_Modal_Commands409:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands411
NOP	
J	L_GCODE_Set_M_Modal_Commands148
NOP	
L_GCODE_Set_M_Modal_Commands411:
L_GCODE_Set_M_Modal_Commands141:
;GCODE.c,428 :: 		}
L_end_Set_M_Modal_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,431 :: 		static int Set_M_Commands(int flow){
;GCODE.c,433 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands149
NOP	
;GCODE.c,434 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands151:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,435 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands152:
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,436 :: 		case 2:
L_GCODE_Set_M_Commands153:
;GCODE.c,437 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands154:
ORI	R2, R0, 2
SB	R2, Offset(_gc+4)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,438 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands155:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,439 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands156:
ORI	R2, R0, 255
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,440 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands157:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,444 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands158:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,445 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands159:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,446 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands160:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_status_code+0)(GP)
J	L_GCODE_Set_M_Commands150
NOP	
;GCODE.c,447 :: 		}
L_GCODE_Set_M_Commands149:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands414
NOP	
J	L_GCODE_Set_M_Commands151
NOP	
L_GCODE_Set_M_Commands414:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands416
NOP	
J	L_GCODE_Set_M_Commands152
NOP	
L_GCODE_Set_M_Commands416:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands418
NOP	
J	L_GCODE_Set_M_Commands153
NOP	
L_GCODE_Set_M_Commands418:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands420
NOP	
J	L_GCODE_Set_M_Commands154
NOP	
L_GCODE_Set_M_Commands420:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands422
NOP	
J	L_GCODE_Set_M_Commands155
NOP	
L_GCODE_Set_M_Commands422:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands424
NOP	
J	L_GCODE_Set_M_Commands156
NOP	
L_GCODE_Set_M_Commands424:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands426
NOP	
J	L_GCODE_Set_M_Commands157
NOP	
L_GCODE_Set_M_Commands426:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands428
NOP	
J	L_GCODE_Set_M_Commands158
NOP	
L_GCODE_Set_M_Commands428:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands430
NOP	
J	L_GCODE_Set_M_Commands159
NOP	
L_GCODE_Set_M_Commands430:
J	L_GCODE_Set_M_Commands160
NOP	
L_GCODE_Set_M_Commands150:
;GCODE.c,448 :: 		return status_code;
LH	R2, Offset(GCODE_status_code+0)(GP)
;GCODE.c,449 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
