_G_Initialise:
;GCODE.c,41 :: 		void G_Initialise(){
;GCODE.c,42 :: 		group_number         = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,43 :: 		axis_words           = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,44 :: 		int_value            = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,45 :: 		value                = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,46 :: 		inverse_feed_rate    = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,47 :: 		gc.absolute_override = false;
SB	R0, Offset(_gc+4)(GP)
;GCODE.c,48 :: 		gc.absolute_mode     = true;
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
;GCODE.c,49 :: 		}
L_end_G_Initialise:
JR	RA
NOP	
; end of _G_Initialise
_Get_modalgroup:
;GCODE.c,52 :: 		int Get_modalgroup(){
;GCODE.c,53 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,54 :: 		}
L_end_Get_modalgroup:
JR	RA
NOP	
; end of _Get_modalgroup
_Rst_modalgroup:
;GCODE.c,56 :: 		int Rst_modalgroup(){
;GCODE.c,57 :: 		modal_group_words = 0;
SH	R0, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,58 :: 		return modal_group_words;
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,59 :: 		}
L_end_Rst_modalgroup:
JR	RA
NOP	
; end of _Rst_modalgroup
_Get_modalword:
;GCODE.c,62 :: 		int Get_modalword(){
;GCODE.c,63 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,64 :: 		}
L_end_Get_modalword:
JR	RA
NOP	
; end of _Get_modalword
_Rst_modalword:
;GCODE.c,66 :: 		int Rst_modalword(){
;GCODE.c,67 :: 		non_modal_words = 0;
SH	R0, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,68 :: 		return non_modal_words;
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,69 :: 		}
L_end_Rst_modalword:
JR	RA
NOP	
; end of _Rst_modalword
_Get_Axisword:
;GCODE.c,72 :: 		int Get_Axisword(){
;GCODE.c,73 :: 		return (int)axis_words & 0x00ff;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R2, R2, 255
;GCODE.c,74 :: 		}
L_end_Get_Axisword:
JR	RA
NOP	
; end of _Get_Axisword
_Rst_Axisword:
;GCODE.c,76 :: 		int Rst_Axisword(){
;GCODE.c,77 :: 		axis_words=0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,78 :: 		return (int)axis_words;
LBU	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,79 :: 		}
L_end_Rst_Axisword:
JR	RA
NOP	
; end of _Rst_Axisword
_Get_motionmode:
;GCODE.c,82 :: 		int Get_motionmode(){
;GCODE.c,83 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,84 :: 		}
L_end_Get_motionmode:
JR	RA
NOP	
; end of _Get_motionmode
_Rst_motionmode:
;GCODE.c,86 :: 		int Rst_motionmode(){
;GCODE.c,87 :: 		motion_mode = 0;
SH	R0, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,88 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,89 :: 		}
L_end_Rst_motionmode:
JR	RA
NOP	
; end of _Rst_motionmode
_G_Mode:
;GCODE.c,92 :: 		int G_Mode(int mode){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,94 :: 		group_number = Set_Modal_Groups(mode);
JAL	GCODE_Set_Modal_Groups+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,95 :: 		motion_mode = Set_Motion_Mode(mode);
JAL	GCODE_Set_Motion_Mode+0
NOP	
SH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,96 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,97 :: 		}
L_end_G_Mode:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _G_Mode
_M_Instruction:
;GCODE.c,100 :: 		void M_Instruction(int flow){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,102 :: 		group_number = Set_M_Modal_Commands(flow);
JAL	GCODE_Set_M_Modal_Commands+0
NOP	
SH	R2, Offset(_group_number+0)(GP)
;GCODE.c,103 :: 		Set_M_Commands(flow);
JAL	GCODE_Set_M_Commands+0
NOP	
;GCODE.c,108 :: 		}
L_end_M_Instruction:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _M_Instruction
_Check_group_multiple_violations:
;GCODE.c,115 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -112
SW	RA, 0(SP)
;GCODE.c,117 :: 		int i = 0;
SW	R25, 4(SP)
;GCODE.c,122 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations207
NOP	
J	L_Check_group_multiple_violations0
NOP	
L__Check_group_multiple_violations207:
;GCODE.c,124 :: 		if(group_number == MODAL_GROUP_NONE)
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations208
NOP	
J	L_Check_group_multiple_violations1
NOP	
L__Check_group_multiple_violations208:
;GCODE.c,125 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations1:
;GCODE.c,127 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations210
NOP	
J	L_Check_group_multiple_violations2
NOP	
L__Check_group_multiple_violations210:
;GCODE.c,128 :: 		Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
L_Check_group_multiple_violations2:
;GCODE.c,130 :: 		bit_true(modal_group_words,bit(group_number));
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_modal_group_words+0)(GP)
;GCODE.c,133 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations3:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations212
NOP	
J	L_Check_group_multiple_violations4
NOP	
L__Check_group_multiple_violations212:
J	L_Check_group_multiple_violations3
NOP	
L_Check_group_multiple_violations4:
;GCODE.c,134 :: 		dma_printf("modal_group_words:= %d\tgroup_number:= %d\n",modal_group_words,group_number);
ADDIU	R23, SP, 8
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr1_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 8
LH	R2, Offset(_group_number+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,137 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,139 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations213
NOP	
J	L_Check_group_multiple_violations5
NOP	
L__Check_group_multiple_violations213:
;GCODE.c,142 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,144 :: 		if(!gc.absolute_override)
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations214
NOP	
J	L_Check_group_multiple_violations6
NOP	
L__Check_group_multiple_violations214:
;GCODE.c,145 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
L_Check_group_multiple_violations6:
;GCODE.c,148 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations7:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations216
NOP	
J	L_Check_group_multiple_violations8
NOP	
L__Check_group_multiple_violations216:
J	L_Check_group_multiple_violations7
NOP	
L_Check_group_multiple_violations8:
;GCODE.c,149 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
ADDIU	R23, SP, 50
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr2_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 50
;GCODE.c,150 :: 		non_modal_action,non_modal_words);
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R2, 4(SP)
;GCODE.c,149 :: 		dma_printf("non_modal_action:= %d\tnon_modal_words:=%d\n",
SW	R3, 0(SP)
;GCODE.c,150 :: 		non_modal_action,non_modal_words);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;GCODE.c,158 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,159 :: 		}
L_Check_group_multiple_violations5:
;GCODE.c,162 :: 		if (group_number == MODAL_GROUP_2){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Check_group_multiple_violations217
NOP	
J	L_Check_group_multiple_violations9
NOP	
L__Check_group_multiple_violations217:
;GCODE.c,164 :: 		if(axis_xyz > NO_OF_PLANES)
LBU	R2, Offset(_axis_xyz+0)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__Check_group_multiple_violations218
NOP	
J	L_Check_group_multiple_violations10
NOP	
L__Check_group_multiple_violations218:
;GCODE.c,165 :: 		status_code = STATUS_INVALID_STATEMENT;
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations11
NOP	
L_Check_group_multiple_violations10:
;GCODE.c,166 :: 		else status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations11:
;GCODE.c,174 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,175 :: 		}
L_Check_group_multiple_violations9:
;GCODE.c,178 :: 		if (group_number == MODAL_GROUP_3){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__Check_group_multiple_violations219
NOP	
J	L_Check_group_multiple_violations12
NOP	
L__Check_group_multiple_violations219:
;GCODE.c,186 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,187 :: 		}
L_Check_group_multiple_violations12:
;GCODE.c,190 :: 		if (group_number == MODAL_GROUP_5){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__Check_group_multiple_violations220
NOP	
J	L_Check_group_multiple_violations13
NOP	
L__Check_group_multiple_violations220:
;GCODE.c,198 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,199 :: 		}
L_Check_group_multiple_violations13:
;GCODE.c,202 :: 		if (group_number == MODAL_GROUP_6){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__Check_group_multiple_violations221
NOP	
J	L_Check_group_multiple_violations14
NOP	
L__Check_group_multiple_violations221:
;GCODE.c,210 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,211 :: 		}
L_Check_group_multiple_violations14:
;GCODE.c,214 :: 		if (group_number == MODAL_GROUP_12){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__Check_group_multiple_violations222
NOP	
J	L_Check_group_multiple_violations15
NOP	
L__Check_group_multiple_violations222:
;GCODE.c,216 :: 		if(gc.coord_select < 0|| gc.coord_select > 7)
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Check_group_multiple_violations223
NOP	
J	L__Check_group_multiple_violations190
NOP	
L__Check_group_multiple_violations223:
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 8
BNE	R2, R0, L__Check_group_multiple_violations224
NOP	
J	L__Check_group_multiple_violations189
NOP	
L__Check_group_multiple_violations224:
J	L_Check_group_multiple_violations18
NOP	
L__Check_group_multiple_violations190:
L__Check_group_multiple_violations189:
;GCODE.c,217 :: 		status_code = STATUS_BAD_NUMBER_FORMAT;
ORI	R2, R0, 1
SH	R2, Offset(_status_code+0)(GP)
J	L_Check_group_multiple_violations19
NOP	
L_Check_group_multiple_violations18:
;GCODE.c,219 :: 		status_code = STATUS_OK;
SH	R0, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations19:
;GCODE.c,227 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,228 :: 		}
L_Check_group_multiple_violations15:
;GCODE.c,229 :: 		}
L_Check_group_multiple_violations0:
;GCODE.c,234 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations20:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations225
NOP	
J	L_Check_group_multiple_violations21
NOP	
L__Check_group_multiple_violations225:
;GCODE.c,235 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations227
NOP	
J	L_Check_group_multiple_violations23
NOP	
L__Check_group_multiple_violations227:
;GCODE.c,236 :: 		if (!gc.absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations228
NOP	
J	L_Check_group_multiple_violations24
NOP	
L__Check_group_multiple_violations228:
;GCODE.c,237 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Check_group_multiple_violations230
NOP	
J	L_Check_group_multiple_violations25
NOP	
L__Check_group_multiple_violations230:
;GCODE.c,239 :: 		} else {
J	L_Check_group_multiple_violations26
NOP	
L_Check_group_multiple_violations25:
;GCODE.c,242 :: 		gc.next_position[i] + gc.coord_offset[i]; // Incremental mode
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;GCODE.c,243 :: 		}
L_Check_group_multiple_violations26:
;GCODE.c,244 :: 		}
L_Check_group_multiple_violations24:
;GCODE.c,245 :: 		} else {
J	L_Check_group_multiple_violations27
NOP	
L_Check_group_multiple_violations23:
;GCODE.c,246 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;GCODE.c,247 :: 		}
L_Check_group_multiple_violations27:
;GCODE.c,234 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,248 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations20
NOP	
L_Check_group_multiple_violations21:
;GCODE.c,253 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations28
NOP	
;GCODE.c,255 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations30:
;GCODE.c,256 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations232
NOP	
J	L_Check_group_multiple_violations31
NOP	
L__Check_group_multiple_violations232:
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations31:
;GCODE.c,257 :: 		break;
J	L_Check_group_multiple_violations29
NOP	
;GCODE.c,258 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations32:
;GCODE.c,259 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations233
NOP	
J	L_Check_group_multiple_violations33
NOP	
L__Check_group_multiple_violations233:
;GCODE.c,260 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,261 :: 		}else {
J	L_Check_group_multiple_violations34
NOP	
L_Check_group_multiple_violations33:
;GCODE.c,264 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+16)(GP)
;GCODE.c,265 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,266 :: 		}
L_Check_group_multiple_violations34:
;GCODE.c,267 :: 		break;
J	L_Check_group_multiple_violations29
NOP	
;GCODE.c,268 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations35:
;GCODE.c,274 :: 		while(DMA_IsOn(1));
L_Check_group_multiple_violations36:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__Check_group_multiple_violations235
NOP	
J	L_Check_group_multiple_violations37
NOP	
L__Check_group_multiple_violations235:
J	L_Check_group_multiple_violations36
NOP	
L_Check_group_multiple_violations37:
;GCODE.c,275 :: 		dma_printf("axis_words:= %d\n",(int)axis_words & 0x00FF);
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 93
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr3_GCODE+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 93
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;GCODE.c,277 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations236
NOP	
J	L_Check_group_multiple_violations38
NOP	
L__Check_group_multiple_violations236:
;GCODE.c,278 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,279 :: 		}else {
J	L_Check_group_multiple_violations39
NOP	
L_Check_group_multiple_violations38:
;GCODE.c,281 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,282 :: 		}
L_Check_group_multiple_violations39:
;GCODE.c,283 :: 		break;
J	L_Check_group_multiple_violations29
NOP	
;GCODE.c,284 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations40:
L_Check_group_multiple_violations41:
;GCODE.c,287 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+13)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,288 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations238
NOP	
J	L__Check_group_multiple_violations194
NOP	
L__Check_group_multiple_violations238:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations239
NOP	
J	L__Check_group_multiple_violations193
NOP	
L__Check_group_multiple_violations239:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations240
NOP	
J	L__Check_group_multiple_violations192
NOP	
L__Check_group_multiple_violations240:
LBU	R2, Offset(_gc+12)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations241
NOP	
J	L__Check_group_multiple_violations191
NOP	
L__Check_group_multiple_violations241:
J	L__Check_group_multiple_violations186
NOP	
L__Check_group_multiple_violations193:
L__Check_group_multiple_violations192:
L__Check_group_multiple_violations191:
J	L_Check_group_multiple_violations46
NOP	
L__Check_group_multiple_violations186:
L__Check_group_multiple_violations194:
;GCODE.c,289 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,290 :: 		} else {
J	L_Check_group_multiple_violations47
NOP	
L_Check_group_multiple_violations46:
;GCODE.c,291 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+100)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations242
NOP	
J	L_Check_group_multiple_violations48
NOP	
L__Check_group_multiple_violations242:
;GCODE.c,293 :: 		asm{nop;}
NOP	
;GCODE.c,294 :: 		}
L_Check_group_multiple_violations48:
;GCODE.c,295 :: 		}
L_Check_group_multiple_violations47:
;GCODE.c,296 :: 		break;
J	L_Check_group_multiple_violations29
NOP	
;GCODE.c,297 :: 		}
L_Check_group_multiple_violations28:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations244
NOP	
J	L_Check_group_multiple_violations30
NOP	
L__Check_group_multiple_violations244:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations246
NOP	
J	L_Check_group_multiple_violations32
NOP	
L__Check_group_multiple_violations246:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations248
NOP	
J	L_Check_group_multiple_violations35
NOP	
L__Check_group_multiple_violations248:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations250
NOP	
J	L_Check_group_multiple_violations40
NOP	
L__Check_group_multiple_violations250:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations252
NOP	
J	L_Check_group_multiple_violations41
NOP	
L__Check_group_multiple_violations252:
L_Check_group_multiple_violations29:
;GCODE.c,299 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations49:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations253
NOP	
J	L_Check_group_multiple_violations50
NOP	
L__Check_group_multiple_violations253:
;GCODE.c,300 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,299 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,301 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations49
NOP	
L_Check_group_multiple_violations50:
;GCODE.c,306 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,307 :: 		}
;GCODE.c,306 :: 		return status_code;
;GCODE.c,307 :: 		}
L_end_Check_group_multiple_violations:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 112
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,310 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,314 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values52
NOP	
;GCODE.c,315 :: 		case 'X':
L_Instruction_Values54:
;GCODE.c,317 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,318 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,319 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,320 :: 		case 'Y':
L_Instruction_Values55:
;GCODE.c,322 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,323 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,324 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,325 :: 		case 'Z':
L_Instruction_Values56:
;GCODE.c,327 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,328 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,329 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,330 :: 		case 'A':
L_Instruction_Values57:
;GCODE.c,332 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,333 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,334 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,335 :: 		case 'E':
L_Instruction_Values58:
;GCODE.c,337 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,338 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,339 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,340 :: 		case 'R':
L_Instruction_Values59:
;GCODE.c,342 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,343 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,344 :: 		case 'I':
L_Instruction_Values60:
;GCODE.c,345 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,346 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+100)(GP)
;GCODE.c,347 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,348 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,349 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,350 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,351 :: 		case 'J':
L_Instruction_Values61:
;GCODE.c,352 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,353 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,354 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,355 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,356 :: 		case 'K':
L_Instruction_Values62:
;GCODE.c,357 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,358 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,359 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,360 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,361 :: 		case 'F':
L_Instruction_Values63:
;GCODE.c,362 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,363 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values255
NOP	
J	L_Instruction_Values64
NOP	
L__Instruction_Values255:
;GCODE.c,364 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,365 :: 		}
L_Instruction_Values64:
;GCODE.c,372 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+16)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,373 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,374 :: 		case 'P':
L_Instruction_Values65:
;GCODE.c,375 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,376 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values256
NOP	
J	L_Instruction_Values66
NOP	
L__Instruction_Values256:
;GCODE.c,377 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,378 :: 		}
L_Instruction_Values66:
;GCODE.c,379 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+116)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,380 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+118)(GP)
;GCODE.c,381 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,382 :: 		case 'S':
L_Instruction_Values67:
;GCODE.c,383 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,384 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values257
NOP	
J	L_Instruction_Values68
NOP	
L__Instruction_Values257:
;GCODE.c,385 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,386 :: 		}
L_Instruction_Values68:
;GCODE.c,387 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+118)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,388 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+116)(GP)
;GCODE.c,389 :: 		break;
J	L_Instruction_Values53
NOP	
;GCODE.c,390 :: 		case 'L':
L_Instruction_Values69:
;GCODE.c,391 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,392 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values258
NOP	
J	L_Instruction_Values70
NOP	
L__Instruction_Values258:
;GCODE.c,393 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,394 :: 		}
L_Instruction_Values70:
;GCODE.c,395 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+18)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,396 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values53
NOP	
;GCODE.c,397 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values71:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_Instruction_Values53
NOP	
;GCODE.c,398 :: 		}
L_Instruction_Values52:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values260
NOP	
J	L_Instruction_Values54
NOP	
L__Instruction_Values260:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values262
NOP	
J	L_Instruction_Values55
NOP	
L__Instruction_Values262:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values264
NOP	
J	L_Instruction_Values56
NOP	
L__Instruction_Values264:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values266
NOP	
J	L_Instruction_Values57
NOP	
L__Instruction_Values266:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values268
NOP	
J	L_Instruction_Values58
NOP	
L__Instruction_Values268:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values270
NOP	
J	L_Instruction_Values59
NOP	
L__Instruction_Values270:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values272
NOP	
J	L_Instruction_Values60
NOP	
L__Instruction_Values272:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values274
NOP	
J	L_Instruction_Values61
NOP	
L__Instruction_Values274:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values276
NOP	
J	L_Instruction_Values62
NOP	
L__Instruction_Values276:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values278
NOP	
J	L_Instruction_Values63
NOP	
L__Instruction_Values278:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values280
NOP	
J	L_Instruction_Values65
NOP	
L__Instruction_Values280:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values282
NOP	
J	L_Instruction_Values67
NOP	
L__Instruction_Values282:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values284
NOP	
J	L_Instruction_Values69
NOP	
L__Instruction_Values284:
J	L_Instruction_Values71
NOP	
L_Instruction_Values53:
;GCODE.c,408 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,409 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,414 :: 		void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,417 :: 		for(i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_gc_set_current_position72:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__gc_set_current_position286
NOP	
J	L_gc_set_current_position73
NOP	
L__gc_set_current_position286:
;GCODE.c,418 :: 		temp[i] = ulong2flt(settings.steps_per_mm[i]);
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
;GCODE.c,417 :: 		for(i=0;i<3;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,419 :: 		}
; i end address is: 20 (R5)
J	L_gc_set_current_position72
NOP	
L_gc_set_current_position73:
;GCODE.c,420 :: 		gc.position[X] = x/temp[X];
ADDIU	R3, SP, 20
MTC1	R25, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R3)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,421 :: 		gc.position[Y] = y/temp[Y];
ADDIU	R2, R3, 4
MTC1	R26, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,422 :: 		gc.position[Z] = z/temp[Z];
ADDIU	R2, R3, 8
MTC1	R27, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,423 :: 		}
L_end_gc_set_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _gc_set_current_position
GCODE_To_Millimeters:
;GCODE.c,428 :: 		static float To_Millimeters(float value){
;GCODE.c,429 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters289
NOP	
J	L_GCODE_To_Millimeters75
NOP	
L_GCODE_To_Millimeters289:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T193 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T193 end address is: 0 (R0)
J	L_GCODE_To_Millimeters76
NOP	
L_GCODE_To_Millimeters75:
; ?FLOC__GCODE_To_Millimeters?T193 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T193 end address is: 0 (R0)
L_GCODE_To_Millimeters76:
; ?FLOC__GCODE_To_Millimeters?T193 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T193 end address is: 0 (R0)
;GCODE.c,430 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,433 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,434 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,435 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Set_Modal_Groups:
;GCODE.c,441 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,443 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups77
NOP	
;GCODE.c,444 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 920:
L_GCODE_Set_Modal_Groups79:
L_GCODE_Set_Modal_Groups80:
L_GCODE_Set_Modal_Groups81:
L_GCODE_Set_Modal_Groups82:
L_GCODE_Set_Modal_Groups83:
L_GCODE_Set_Modal_Groups84:
L_GCODE_Set_Modal_Groups85:
L_GCODE_Set_Modal_Groups86:
;GCODE.c,445 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,446 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups87:
L_GCODE_Set_Modal_Groups88:
L_GCODE_Set_Modal_Groups89:
L_GCODE_Set_Modal_Groups90:
L_GCODE_Set_Modal_Groups91:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,447 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups92:
L_GCODE_Set_Modal_Groups93:
L_GCODE_Set_Modal_Groups94:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,448 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups95:
L_GCODE_Set_Modal_Groups96:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,449 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups97:
L_GCODE_Set_Modal_Groups98:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,450 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups99:
L_GCODE_Set_Modal_Groups100:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,451 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
L_GCODE_Set_Modal_Groups101:
L_GCODE_Set_Modal_Groups102:
L_GCODE_Set_Modal_Groups103:
L_GCODE_Set_Modal_Groups104:
L_GCODE_Set_Modal_Groups105:
L_GCODE_Set_Modal_Groups106:
ORI	R2, R0, 9
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups78
NOP	
;GCODE.c,452 :: 		}
L_GCODE_Set_Modal_Groups77:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Modal_Groups293
NOP	
J	L_GCODE_Set_Modal_Groups79
NOP	
L_GCODE_Set_Modal_Groups293:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Modal_Groups295
NOP	
J	L_GCODE_Set_Modal_Groups80
NOP	
L_GCODE_Set_Modal_Groups295:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Modal_Groups297
NOP	
J	L_GCODE_Set_Modal_Groups81
NOP	
L_GCODE_Set_Modal_Groups297:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Modal_Groups299
NOP	
J	L_GCODE_Set_Modal_Groups82
NOP	
L_GCODE_Set_Modal_Groups299:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Modal_Groups301
NOP	
J	L_GCODE_Set_Modal_Groups83
NOP	
L_GCODE_Set_Modal_Groups301:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Modal_Groups303
NOP	
J	L_GCODE_Set_Modal_Groups84
NOP	
L_GCODE_Set_Modal_Groups303:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Modal_Groups305
NOP	
J	L_GCODE_Set_Modal_Groups85
NOP	
L_GCODE_Set_Modal_Groups305:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Modal_Groups307
NOP	
J	L_GCODE_Set_Modal_Groups86
NOP	
L_GCODE_Set_Modal_Groups307:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Modal_Groups309
NOP	
J	L_GCODE_Set_Modal_Groups87
NOP	
L_GCODE_Set_Modal_Groups309:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Modal_Groups311
NOP	
J	L_GCODE_Set_Modal_Groups88
NOP	
L_GCODE_Set_Modal_Groups311:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Modal_Groups313
NOP	
J	L_GCODE_Set_Modal_Groups89
NOP	
L_GCODE_Set_Modal_Groups313:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Modal_Groups315
NOP	
J	L_GCODE_Set_Modal_Groups90
NOP	
L_GCODE_Set_Modal_Groups315:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Modal_Groups317
NOP	
J	L_GCODE_Set_Modal_Groups91
NOP	
L_GCODE_Set_Modal_Groups317:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Modal_Groups319
NOP	
J	L_GCODE_Set_Modal_Groups92
NOP	
L_GCODE_Set_Modal_Groups319:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Modal_Groups321
NOP	
J	L_GCODE_Set_Modal_Groups93
NOP	
L_GCODE_Set_Modal_Groups321:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Modal_Groups323
NOP	
J	L_GCODE_Set_Modal_Groups94
NOP	
L_GCODE_Set_Modal_Groups323:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Modal_Groups325
NOP	
J	L_GCODE_Set_Modal_Groups95
NOP	
L_GCODE_Set_Modal_Groups325:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Modal_Groups327
NOP	
J	L_GCODE_Set_Modal_Groups96
NOP	
L_GCODE_Set_Modal_Groups327:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Modal_Groups329
NOP	
J	L_GCODE_Set_Modal_Groups97
NOP	
L_GCODE_Set_Modal_Groups329:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Modal_Groups331
NOP	
J	L_GCODE_Set_Modal_Groups98
NOP	
L_GCODE_Set_Modal_Groups331:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Modal_Groups333
NOP	
J	L_GCODE_Set_Modal_Groups99
NOP	
L_GCODE_Set_Modal_Groups333:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Modal_Groups335
NOP	
J	L_GCODE_Set_Modal_Groups100
NOP	
L_GCODE_Set_Modal_Groups335:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Modal_Groups337
NOP	
J	L_GCODE_Set_Modal_Groups101
NOP	
L_GCODE_Set_Modal_Groups337:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Modal_Groups339
NOP	
J	L_GCODE_Set_Modal_Groups102
NOP	
L_GCODE_Set_Modal_Groups339:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Modal_Groups341
NOP	
J	L_GCODE_Set_Modal_Groups103
NOP	
L_GCODE_Set_Modal_Groups341:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Modal_Groups343
NOP	
J	L_GCODE_Set_Modal_Groups104
NOP	
L_GCODE_Set_Modal_Groups343:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Modal_Groups345
NOP	
J	L_GCODE_Set_Modal_Groups105
NOP	
L_GCODE_Set_Modal_Groups345:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Modal_Groups347
NOP	
J	L_GCODE_Set_Modal_Groups106
NOP	
L_GCODE_Set_Modal_Groups347:
L_GCODE_Set_Modal_Groups78:
;GCODE.c,453 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,454 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,457 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;GCODE.c,459 :: 		FAIL(STATUS_OK);
SW	R25, 4(SP)
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,460 :: 		switch(mode){
J	L_GCODE_Set_Motion_Mode107
NOP	
;GCODE.c,461 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode109:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,462 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode110:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,463 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode111:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,464 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode112:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,465 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode113:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,466 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode114:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,467 :: 		case 17: Select_Plane(xy);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode115:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,468 :: 		case 18: Select_Plane(xz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode116:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,469 :: 		case 19: Select_Plane(yz);return STATUS_OK; break;
L_GCODE_Set_Motion_Mode117:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,470 :: 		case 20: gc.inches_mode = 1;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode118:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,471 :: 		case 21: gc.inches_mode = 0;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode119:
SB	R0, Offset(_gc+3)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,472 :: 		case 53: gc.absolute_override = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode120:
ORI	R2, R0, 1
SB	R2, Offset(_gc+4)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,473 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode121:
L_GCODE_Set_Motion_Mode122:
L_GCODE_Set_Motion_Mode123:
L_GCODE_Set_Motion_Mode124:
L_GCODE_Set_Motion_Mode125:
L_GCODE_Set_Motion_Mode126:
;GCODE.c,474 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,475 :: 		return STATUS_OK;break;
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,476 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode127:
ORI	R2, R0, 4
SB	R2, Offset(_gc+8)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,477 :: 		case 90: gc.absolute_mode = true; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode128:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,478 :: 		case 91: gc.absolute_mode = false; return STATUS_OK; break;
L_GCODE_Set_Motion_Mode129:
SB	R0, Offset(_gc+5)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,479 :: 		case 93: gc.inverse_feed_rate_mode = true;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode130:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,480 :: 		case 94: gc.inverse_feed_rate_mode = false;return STATUS_OK; break;
L_GCODE_Set_Motion_Mode131:
SB	R0, Offset(_gc+2)(GP)
MOVZ	R2, R0, R0
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,481 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode132:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,482 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode133:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,483 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode134:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,484 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode135:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,485 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode136:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,486 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode137:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode108
NOP	
;GCODE.c,487 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode138:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,488 :: 		}
L_GCODE_Set_Motion_Mode107:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_Motion_Mode350
NOP	
J	L_GCODE_Set_Motion_Mode109
NOP	
L_GCODE_Set_Motion_Mode350:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode352
NOP	
J	L_GCODE_Set_Motion_Mode110
NOP	
L_GCODE_Set_Motion_Mode352:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_Motion_Mode354
NOP	
J	L_GCODE_Set_Motion_Mode111
NOP	
L_GCODE_Set_Motion_Mode354:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_Motion_Mode356
NOP	
J	L_GCODE_Set_Motion_Mode112
NOP	
L_GCODE_Set_Motion_Mode356:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode358
NOP	
J	L_GCODE_Set_Motion_Mode113
NOP	
L_GCODE_Set_Motion_Mode358:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_GCODE_Set_Motion_Mode360
NOP	
J	L_GCODE_Set_Motion_Mode114
NOP	
L_GCODE_Set_Motion_Mode360:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L_GCODE_Set_Motion_Mode362
NOP	
J	L_GCODE_Set_Motion_Mode115
NOP	
L_GCODE_Set_Motion_Mode362:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L_GCODE_Set_Motion_Mode364
NOP	
J	L_GCODE_Set_Motion_Mode116
NOP	
L_GCODE_Set_Motion_Mode364:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L_GCODE_Set_Motion_Mode366
NOP	
J	L_GCODE_Set_Motion_Mode117
NOP	
L_GCODE_Set_Motion_Mode366:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L_GCODE_Set_Motion_Mode368
NOP	
J	L_GCODE_Set_Motion_Mode118
NOP	
L_GCODE_Set_Motion_Mode368:
SEH	R3, R25
ORI	R2, R0, 21
BNE	R3, R2, L_GCODE_Set_Motion_Mode370
NOP	
J	L_GCODE_Set_Motion_Mode119
NOP	
L_GCODE_Set_Motion_Mode370:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_GCODE_Set_Motion_Mode372
NOP	
J	L_GCODE_Set_Motion_Mode120
NOP	
L_GCODE_Set_Motion_Mode372:
SEH	R3, R25
ORI	R2, R0, 54
BNE	R3, R2, L_GCODE_Set_Motion_Mode374
NOP	
J	L_GCODE_Set_Motion_Mode121
NOP	
L_GCODE_Set_Motion_Mode374:
SEH	R3, R25
ORI	R2, R0, 55
BNE	R3, R2, L_GCODE_Set_Motion_Mode376
NOP	
J	L_GCODE_Set_Motion_Mode122
NOP	
L_GCODE_Set_Motion_Mode376:
SEH	R3, R25
ORI	R2, R0, 56
BNE	R3, R2, L_GCODE_Set_Motion_Mode378
NOP	
J	L_GCODE_Set_Motion_Mode123
NOP	
L_GCODE_Set_Motion_Mode378:
SEH	R3, R25
ORI	R2, R0, 57
BNE	R3, R2, L_GCODE_Set_Motion_Mode380
NOP	
J	L_GCODE_Set_Motion_Mode124
NOP	
L_GCODE_Set_Motion_Mode380:
SEH	R3, R25
ORI	R2, R0, 58
BNE	R3, R2, L_GCODE_Set_Motion_Mode382
NOP	
J	L_GCODE_Set_Motion_Mode125
NOP	
L_GCODE_Set_Motion_Mode382:
SEH	R3, R25
ORI	R2, R0, 59
BNE	R3, R2, L_GCODE_Set_Motion_Mode384
NOP	
J	L_GCODE_Set_Motion_Mode126
NOP	
L_GCODE_Set_Motion_Mode384:
SEH	R3, R25
ORI	R2, R0, 80
BNE	R3, R2, L_GCODE_Set_Motion_Mode386
NOP	
J	L_GCODE_Set_Motion_Mode127
NOP	
L_GCODE_Set_Motion_Mode386:
SEH	R3, R25
ORI	R2, R0, 90
BNE	R3, R2, L_GCODE_Set_Motion_Mode388
NOP	
J	L_GCODE_Set_Motion_Mode128
NOP	
L_GCODE_Set_Motion_Mode388:
SEH	R3, R25
ORI	R2, R0, 91
BNE	R3, R2, L_GCODE_Set_Motion_Mode390
NOP	
J	L_GCODE_Set_Motion_Mode129
NOP	
L_GCODE_Set_Motion_Mode390:
SEH	R3, R25
ORI	R2, R0, 93
BNE	R3, R2, L_GCODE_Set_Motion_Mode392
NOP	
J	L_GCODE_Set_Motion_Mode130
NOP	
L_GCODE_Set_Motion_Mode392:
SEH	R3, R25
ORI	R2, R0, 94
BNE	R3, R2, L_GCODE_Set_Motion_Mode394
NOP	
J	L_GCODE_Set_Motion_Mode131
NOP	
L_GCODE_Set_Motion_Mode394:
SEH	R3, R25
ORI	R2, R0, 280
BNE	R3, R2, L_GCODE_Set_Motion_Mode396
NOP	
J	L_GCODE_Set_Motion_Mode132
NOP	
L_GCODE_Set_Motion_Mode396:
SEH	R3, R25
ORI	R2, R0, 281
BNE	R3, R2, L_GCODE_Set_Motion_Mode398
NOP	
J	L_GCODE_Set_Motion_Mode133
NOP	
L_GCODE_Set_Motion_Mode398:
SEH	R3, R25
ORI	R2, R0, 300
BNE	R3, R2, L_GCODE_Set_Motion_Mode400
NOP	
J	L_GCODE_Set_Motion_Mode134
NOP	
L_GCODE_Set_Motion_Mode400:
SEH	R3, R25
ORI	R2, R0, 301
BNE	R3, R2, L_GCODE_Set_Motion_Mode402
NOP	
J	L_GCODE_Set_Motion_Mode135
NOP	
L_GCODE_Set_Motion_Mode402:
SEH	R3, R25
ORI	R2, R0, 920
BNE	R3, R2, L_GCODE_Set_Motion_Mode404
NOP	
J	L_GCODE_Set_Motion_Mode136
NOP	
L_GCODE_Set_Motion_Mode404:
SEH	R3, R25
ORI	R2, R0, 921
BNE	R3, R2, L_GCODE_Set_Motion_Mode406
NOP	
J	L_GCODE_Set_Motion_Mode137
NOP	
L_GCODE_Set_Motion_Mode406:
J	L_GCODE_Set_Motion_Mode138
NOP	
L_GCODE_Set_Motion_Mode108:
;GCODE.c,494 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
ANDI	R2, R2, 4
SEH	R2, R2
BEQ	R2, R0, L_GCODE_Set_Motion_Mode407
NOP	
J	L_GCODE_Set_Motion_Mode181
NOP	
L_GCODE_Set_Motion_Mode407:
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L_GCODE_Set_Motion_Mode408
NOP	
J	L_GCODE_Set_Motion_Mode180
NOP	
L_GCODE_Set_Motion_Mode408:
J	L_GCODE_Set_Motion_Mode141
NOP	
L_GCODE_Set_Motion_Mode181:
L_GCODE_Set_Motion_Mode180:
;GCODE.c,496 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode410
NOP	
J	L_GCODE_Set_Motion_Mode142
NOP	
L_GCODE_Set_Motion_Mode410:
;GCODE.c,497 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
LWC1	S1, Offset(_inverse_feed_rate+0)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L_GCODE_Set_Motion_Mode411
NOP	
J	L_GCODE_Set_Motion_Mode183
NOP	
L_GCODE_Set_Motion_Mode411:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_Motion_Mode413
NOP	
J	L_GCODE_Set_Motion_Mode182
NOP	
L_GCODE_Set_Motion_Mode413:
L_GCODE_Set_Motion_Mode178:
;GCODE.c,498 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,497 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode183:
L_GCODE_Set_Motion_Mode182:
;GCODE.c,500 :: 		}
L_GCODE_Set_Motion_Mode142:
;GCODE.c,502 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
LBU	R2, Offset(_gc+4)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode415
NOP	
J	L_GCODE_Set_Motion_Mode185
NOP	
L_GCODE_Set_Motion_Mode415:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode417
NOP	
J	L_GCODE_Set_Motion_Mode147
NOP	
L_GCODE_Set_Motion_Mode417:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_Motion_Mode419
NOP	
J	L_GCODE_Set_Motion_Mode147
NOP	
L_GCODE_Set_Motion_Mode419:
MOVZ	R2, R0, R0
J	L_GCODE_Set_Motion_Mode146
NOP	
L_GCODE_Set_Motion_Mode147:
ORI	R2, R0, 1
L_GCODE_Set_Motion_Mode146:
BEQ	R2, R0, L_GCODE_Set_Motion_Mode420
NOP	
J	L_GCODE_Set_Motion_Mode184
NOP	
L_GCODE_Set_Motion_Mode420:
L_GCODE_Set_Motion_Mode177:
;GCODE.c,503 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,502 :: 		if ( gc.absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode185:
L_GCODE_Set_Motion_Mode184:
;GCODE.c,506 :: 		while(DMA_IsOn(1));
L_GCODE_Set_Motion_Mode151:
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode422
NOP	
J	L_GCODE_Set_Motion_Mode152
NOP	
L_GCODE_Set_Motion_Mode422:
J	L_GCODE_Set_Motion_Mode151
NOP	
L_GCODE_Set_Motion_Mode152:
;GCODE.c,507 :: 		dma_printf("status_code:= %d\tmodal_group_words:= %d\n",status_code,modal_group_words);
ADDIU	R23, SP, 10
ADDIU	R22, R23, 41
LUI	R24, hi_addr(?ICSGCODE_?lstr4_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr4_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 10
LH	R2, Offset(GCODE_modal_group_words+0)(GP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(_status_code+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
;GCODE.c,510 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode424
NOP	
J	L_GCODE_Set_Motion_Mode153
NOP	
L_GCODE_Set_Motion_Mode424:
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode153:
;GCODE.c,512 :: 		}
L_GCODE_Set_Motion_Mode141:
;GCODE.c,514 :: 		while(DMA_IsOn(1));
L_GCODE_Set_Motion_Mode154:
SH	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 8(SP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode426
NOP	
J	L_GCODE_Set_Motion_Mode155
NOP	
L_GCODE_Set_Motion_Mode426:
J	L_GCODE_Set_Motion_Mode154
NOP	
L_GCODE_Set_Motion_Mode155:
;GCODE.c,515 :: 		dma_printf("motion_mode:= %d\tnon_modal_action:= %d\n",motion_mode,non_modal_action);
ADDIU	R23, SP, 51
ADDIU	R22, R23, 40
LUI	R24, hi_addr(?ICSGCODE_?lstr5_GCODE+0)
ORI	R24, R24, lo_addr(?ICSGCODE_?lstr5_GCODE+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 51
LH	R2, Offset(_non_modal_action+0)(GP)
SH	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, Offset(GCODE_motion_mode+0)(GP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 8(SP)
;GCODE.c,517 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,518 :: 		}
;GCODE.c,517 :: 		return motion_mode;
;GCODE.c,518 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,522 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,525 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands156
NOP	
;GCODE.c,526 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands158:
L_GCODE_Set_M_Modal_Commands159:
L_GCODE_Set_M_Modal_Commands160:
L_GCODE_Set_M_Modal_Commands161:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands157
NOP	
;GCODE.c,527 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands162:
L_GCODE_Set_M_Modal_Commands163:
L_GCODE_Set_M_Modal_Commands164:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands157
NOP	
;GCODE.c,528 :: 		}
L_GCODE_Set_M_Modal_Commands156:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Modal_Commands429
NOP	
J	L_GCODE_Set_M_Modal_Commands158
NOP	
L_GCODE_Set_M_Modal_Commands429:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands431
NOP	
J	L_GCODE_Set_M_Modal_Commands159
NOP	
L_GCODE_Set_M_Modal_Commands431:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands433
NOP	
J	L_GCODE_Set_M_Modal_Commands160
NOP	
L_GCODE_Set_M_Modal_Commands433:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands435
NOP	
J	L_GCODE_Set_M_Modal_Commands161
NOP	
L_GCODE_Set_M_Modal_Commands435:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands437
NOP	
J	L_GCODE_Set_M_Modal_Commands162
NOP	
L_GCODE_Set_M_Modal_Commands437:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands439
NOP	
J	L_GCODE_Set_M_Modal_Commands163
NOP	
L_GCODE_Set_M_Modal_Commands439:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Modal_Commands441
NOP	
J	L_GCODE_Set_M_Modal_Commands164
NOP	
L_GCODE_Set_M_Modal_Commands441:
L_GCODE_Set_M_Modal_Commands157:
;GCODE.c,529 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,530 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,533 :: 		static int Set_M_Commands(int flow){
;GCODE.c,534 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,536 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands165
NOP	
;GCODE.c,537 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands167:
ORI	R2, R0, 1
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,538 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands168:
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,539 :: 		case 2:
L_GCODE_Set_M_Commands169:
;GCODE.c,540 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands170:
ORI	R2, R0, 2
SB	R2, Offset(_gc+9)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,541 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands171:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,542 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands172:
ORI	R2, R0, 255
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,543 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands173:
SB	R0, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,547 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands174:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,548 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands175:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,549 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands176:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_GCODE_Set_M_Commands166
NOP	
;GCODE.c,550 :: 		}
L_GCODE_Set_M_Commands165:
SEH	R2, R25
BNE	R2, R0, L_GCODE_Set_M_Commands444
NOP	
J	L_GCODE_Set_M_Commands167
NOP	
L_GCODE_Set_M_Commands444:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_GCODE_Set_M_Commands446
NOP	
J	L_GCODE_Set_M_Commands168
NOP	
L_GCODE_Set_M_Commands446:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_GCODE_Set_M_Commands448
NOP	
J	L_GCODE_Set_M_Commands169
NOP	
L_GCODE_Set_M_Commands448:
SEH	R3, R25
ORI	R2, R0, 30
BNE	R3, R2, L_GCODE_Set_M_Commands450
NOP	
J	L_GCODE_Set_M_Commands170
NOP	
L_GCODE_Set_M_Commands450:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_GCODE_Set_M_Commands452
NOP	
J	L_GCODE_Set_M_Commands171
NOP	
L_GCODE_Set_M_Commands452:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_GCODE_Set_M_Commands454
NOP	
J	L_GCODE_Set_M_Commands172
NOP	
L_GCODE_Set_M_Commands454:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_GCODE_Set_M_Commands456
NOP	
J	L_GCODE_Set_M_Commands173
NOP	
L_GCODE_Set_M_Commands456:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_GCODE_Set_M_Commands458
NOP	
J	L_GCODE_Set_M_Commands174
NOP	
L_GCODE_Set_M_Commands458:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_GCODE_Set_M_Commands460
NOP	
J	L_GCODE_Set_M_Commands175
NOP	
L_GCODE_Set_M_Commands460:
J	L_GCODE_Set_M_Commands176
NOP	
L_GCODE_Set_M_Commands166:
;GCODE.c,551 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,552 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
