_G_Initialise:
;GCODE.c,42 :: 		void G_Initialise(){
;GCODE.c,43 :: 		group_number      = 0;
SH	R0, Offset(_group_number+0)(GP)
;GCODE.c,44 :: 		axis_words        = 0;
SB	R0, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,45 :: 		int_value         = 0;
SH	R0, Offset(_int_value+0)(GP)
;GCODE.c,46 :: 		value             = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_value+0)(GP)
;GCODE.c,47 :: 		inverse_feed_rate = false;
MOVZ	R2, R0, R0
SW	R2, Offset(_inverse_feed_rate+0)(GP)
;GCODE.c,48 :: 		absolute_override = 0;
SB	R0, Offset(GCODE_absolute_override+0)(GP)
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
;GCODE.c,93 :: 		gc.inches_mode = 0;//temp for debugging
SB	R0, Offset(_gc+3)(GP)
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
;GCODE.c,114 :: 		int Check_group_multiple_violations(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;GCODE.c,116 :: 		int i = 0;
;GCODE.c,121 :: 		if(group_number > 0) {
LH	R2, Offset(_group_number+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Check_group_multiple_violations182
NOP	
J	L_Check_group_multiple_violations0
NOP	
L__Check_group_multiple_violations182:
;GCODE.c,123 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,124 :: 		if(group_number == MODAL_GROUP_NONE)
LH	R2, Offset(_group_number+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations183
NOP	
J	L_Check_group_multiple_violations1
NOP	
L__Check_group_multiple_violations183:
;GCODE.c,125 :: 		FAIL(STATUS_MODAL_GROUP_VIOLATION);
ORI	R2, R0, 5
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations1:
;GCODE.c,127 :: 		if(group_number != last_group_number)
LH	R3, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
LH	R2, Offset(_group_number+0)(GP)
BNE	R2, R3, L__Check_group_multiple_violations185
NOP	
J	L_Check_group_multiple_violations2
NOP	
L__Check_group_multiple_violations185:
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
;GCODE.c,137 :: 		last_group_number = group_number;
LH	R2, Offset(_group_number+0)(GP)
SH	R2, Offset(Check_group_multiple_violations_last_group_number_L0+0)(GP)
;GCODE.c,138 :: 		if (group_number == MODAL_GROUP_0){
LH	R3, Offset(_group_number+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_group_multiple_violations186
NOP	
J	L_Check_group_multiple_violations3
NOP	
L__Check_group_multiple_violations186:
;GCODE.c,141 :: 		Rst_modalword();
JAL	_Rst_modalword+0
NOP	
;GCODE.c,142 :: 		bit_true( non_modal_words,bit( non_modal_action));
LH	R3, Offset(_non_modal_action+0)(GP)
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, Offset(GCODE_non_modal_words+0)(GP)
OR	R2, R2, R3
SH	R2, Offset(GCODE_non_modal_words+0)(GP)
;GCODE.c,150 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Check_group_multiple_violations
NOP	
;GCODE.c,151 :: 		}
L_Check_group_multiple_violations3:
;GCODE.c,152 :: 		}
L_Check_group_multiple_violations0:
;GCODE.c,157 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations4:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Check_group_multiple_violations187
NOP	
J	L_Check_group_multiple_violations5
NOP	
L__Check_group_multiple_violations187:
;GCODE.c,158 :: 		if ( bit_istrue(axis_words,bit(i))) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Check_group_multiple_violations189
NOP	
J	L_Check_group_multiple_violations7
NOP	
L__Check_group_multiple_violations189:
;GCODE.c,159 :: 		if (!absolute_override) { // Do not update target in absolute override mode
LBU	R2, Offset(GCODE_absolute_override+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations190
NOP	
J	L_Check_group_multiple_violations8
NOP	
L__Check_group_multiple_violations190:
;GCODE.c,160 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Check_group_multiple_violations192
NOP	
J	L_Check_group_multiple_violations9
NOP	
L__Check_group_multiple_violations192:
;GCODE.c,162 :: 		} else {
J	L_Check_group_multiple_violations10
NOP	
L_Check_group_multiple_violations9:
;GCODE.c,165 :: 		gc.next_position[i] + gc.coord_offset[i]; // Incremental mode
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
;GCODE.c,166 :: 		}
L_Check_group_multiple_violations10:
;GCODE.c,167 :: 		}
L_Check_group_multiple_violations8:
;GCODE.c,168 :: 		} else {
J	L_Check_group_multiple_violations11
NOP	
L_Check_group_multiple_violations7:
;GCODE.c,169 :: 		gc.next_position[i] += gc.coord_offset[i]; // No axis word in block. Keep same axis position.
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
;GCODE.c,170 :: 		}
L_Check_group_multiple_violations11:
;GCODE.c,157 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,171 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations4
NOP	
L_Check_group_multiple_violations5:
;GCODE.c,176 :: 		switch (motion_mode) {
J	L_Check_group_multiple_violations12
NOP	
;GCODE.c,178 :: 		case MOTION_MODE_CANCEL:
L_Check_group_multiple_violations14:
;GCODE.c,179 :: 		if (axis_words) { FAIL(STATUS_INVALID_STATEMENT); } // No axis words allowed while active.
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations194
NOP	
J	L_Check_group_multiple_violations15
NOP	
L__Check_group_multiple_violations194:
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Check_group_multiple_violations15:
;GCODE.c,180 :: 		break;
J	L_Check_group_multiple_violations13
NOP	
;GCODE.c,181 :: 		case MOTION_MODE_SEEK:
L_Check_group_multiple_violations16:
;GCODE.c,182 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations195
NOP	
J	L_Check_group_multiple_violations17
NOP	
L__Check_group_multiple_violations195:
;GCODE.c,183 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,184 :: 		}else {
J	L_Check_group_multiple_violations18
NOP	
L_Check_group_multiple_violations17:
;GCODE.c,187 :: 		gc.frequency = 5000;//settings.default_seek_rate;
ORI	R2, R0, 5000
SH	R2, Offset(_gc+14)(GP)
;GCODE.c,188 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,189 :: 		}
L_Check_group_multiple_violations18:
;GCODE.c,190 :: 		break;
J	L_Check_group_multiple_violations13
NOP	
;GCODE.c,191 :: 		case MOTION_MODE_LINEAR:
L_Check_group_multiple_violations19:
;GCODE.c,200 :: 		if (axis_words == 0) {
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BEQ	R2, R0, L__Check_group_multiple_violations196
NOP	
J	L_Check_group_multiple_violations20
NOP	
L__Check_group_multiple_violations196:
;GCODE.c,201 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,202 :: 		}else {
J	L_Check_group_multiple_violations21
NOP	
L_Check_group_multiple_violations20:
;GCODE.c,204 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,205 :: 		}
L_Check_group_multiple_violations21:
;GCODE.c,206 :: 		break;
J	L_Check_group_multiple_violations13
NOP	
;GCODE.c,207 :: 		case MOTION_MODE_CW_ARC: case MOTION_MODE_CCW_ARC:
L_Check_group_multiple_violations22:
L_Check_group_multiple_violations23:
;GCODE.c,210 :: 		if ( !( bit_false(axis_words,bit(gc.plane_axis_2)) ) ||
LBU	R3, Offset(_gc+12)(GP)
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(GCODE_axis_words+0)(GP)
AND	R2, R2, R3
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,211 :: 		( !gc.r && gc.offset[gc.plane_axis_0] == 0.0 && gc.offset[gc.plane_axis_1] == 0.0 )){
LBU	R2, Offset(GCODE_axis_words+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations198
NOP	
J	L__Check_group_multiple_violations169
NOP	
L__Check_group_multiple_violations198:
LBU	R2, Offset(_gc+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__Check_group_multiple_violations199
NOP	
J	L__Check_group_multiple_violations168
NOP	
L__Check_group_multiple_violations199:
LBU	R2, Offset(_gc+10)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations200
NOP	
J	L__Check_group_multiple_violations167
NOP	
L__Check_group_multiple_violations200:
LBU	R2, Offset(_gc+11)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+88)
ORI	R2, R2, lo_addr(_gc+88)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1T	0, L__Check_group_multiple_violations201
NOP	
J	L__Check_group_multiple_violations166
NOP	
L__Check_group_multiple_violations201:
J	L__Check_group_multiple_violations164
NOP	
L__Check_group_multiple_violations168:
L__Check_group_multiple_violations167:
L__Check_group_multiple_violations166:
J	L_Check_group_multiple_violations28
NOP	
L__Check_group_multiple_violations164:
L__Check_group_multiple_violations169:
;GCODE.c,212 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,213 :: 		} else {
J	L_Check_group_multiple_violations29
NOP	
L_Check_group_multiple_violations28:
;GCODE.c,214 :: 		if (gc.R != 0) {
LWC1	S1, Offset(_gc+100)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S1, S0
BC1F	0, L__Check_group_multiple_violations202
NOP	
J	L_Check_group_multiple_violations30
NOP	
L__Check_group_multiple_violations202:
;GCODE.c,216 :: 		asm{nop;}
NOP	
;GCODE.c,217 :: 		}
L_Check_group_multiple_violations30:
;GCODE.c,218 :: 		}
L_Check_group_multiple_violations29:
;GCODE.c,219 :: 		break;
J	L_Check_group_multiple_violations13
NOP	
;GCODE.c,220 :: 		}
L_Check_group_multiple_violations12:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Check_group_multiple_violations204
NOP	
J	L_Check_group_multiple_violations14
NOP	
L__Check_group_multiple_violations204:
LH	R2, Offset(GCODE_motion_mode+0)(GP)
BNE	R2, R0, L__Check_group_multiple_violations206
NOP	
J	L_Check_group_multiple_violations16
NOP	
L__Check_group_multiple_violations206:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Check_group_multiple_violations208
NOP	
J	L_Check_group_multiple_violations19
NOP	
L__Check_group_multiple_violations208:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Check_group_multiple_violations210
NOP	
J	L_Check_group_multiple_violations22
NOP	
L__Check_group_multiple_violations210:
LH	R3, Offset(GCODE_motion_mode+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Check_group_multiple_violations212
NOP	
J	L_Check_group_multiple_violations23
NOP	
L__Check_group_multiple_violations212:
L_Check_group_multiple_violations13:
;GCODE.c,222 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Check_group_multiple_violations31:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Check_group_multiple_violations213
NOP	
J	L_Check_group_multiple_violations32
NOP	
L__Check_group_multiple_violations213:
;GCODE.c,223 :: 		gc.position[i] =  gc.next_position[i];
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
;GCODE.c,222 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,224 :: 		}
; i end address is: 20 (R5)
J	L_Check_group_multiple_violations31
NOP	
L_Check_group_multiple_violations32:
;GCODE.c,226 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,227 :: 		}
L_end_Check_group_multiple_violations:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Check_group_multiple_violations
_Instruction_Values:
;GCODE.c,230 :: 		int Instruction_Values(char *c,void *any){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,234 :: 		switch(c[0]){
MOVZ	R2, R25, R0
SW	R2, 4(SP)
J	L_Instruction_Values34
NOP	
;GCODE.c,235 :: 		case 'X':
L_Instruction_Values36:
;GCODE.c,237 :: 		gc.next_position[X] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+72)(GP)
;GCODE.c,238 :: 		bit_true(axis_words,bit(X));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,239 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,240 :: 		case 'Y':
L_Instruction_Values37:
;GCODE.c,242 :: 		gc.next_position[Y] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+76)(GP)
;GCODE.c,243 :: 		bit_true(axis_words,bit(Y));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,244 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,245 :: 		case 'Z':
L_Instruction_Values38:
;GCODE.c,247 :: 		gc.next_position[Z] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+80)(GP)
;GCODE.c,248 :: 		bit_true(axis_words,bit(Z));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 4
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,249 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,250 :: 		case 'A':
L_Instruction_Values39:
;GCODE.c,252 :: 		gc.next_position[A] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+84)(GP)
;GCODE.c,253 :: 		bit_true(axis_words,bit(A));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,254 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,255 :: 		case 'E':
L_Instruction_Values40:
;GCODE.c,257 :: 		gc.next_position[B] = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,258 :: 		bit_true(axis_words,bit(B));
LBU	R2, Offset(GCODE_axis_words+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(GCODE_axis_words+0)(GP)
;GCODE.c,259 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,260 :: 		case 'R':
L_Instruction_Values41:
;GCODE.c,262 :: 		gc.R = To_Millimeters(XYZ_Val);
LWC1	S12, 0(R26)
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+100)(GP)
;GCODE.c,263 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,264 :: 		case 'I':
L_Instruction_Values42:
;GCODE.c,265 :: 		gc.r = 0;
LBU	R2, Offset(_gc+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_gc+0)(GP)
;GCODE.c,266 :: 		gc.R = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_gc+100)(GP)
;GCODE.c,267 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,268 :: 		gc.I = XYZ_Val;
SWC1	S0, Offset(_gc+104)(GP)
;GCODE.c,269 :: 		gc.offset[I] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+88)(GP)
;GCODE.c,270 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,271 :: 		case 'J':
L_Instruction_Values43:
;GCODE.c,272 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,273 :: 		gc.J = XYZ_Val;
SWC1	S0, Offset(_gc+108)(GP)
;GCODE.c,274 :: 		gc.offset[J] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+92)(GP)
;GCODE.c,275 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,276 :: 		case 'K':
L_Instruction_Values44:
;GCODE.c,277 :: 		XYZ_Val = *(float*)any;
LWC1	S0, 0(R26)
;GCODE.c,278 :: 		gc.K = XYZ_Val;
SWC1	S0, Offset(_gc+112)(GP)
;GCODE.c,279 :: 		gc.offset[K] = To_Millimeters(XYZ_Val);
MOV.S 	S12, S0
JAL	GCODE_To_Millimeters+0
NOP	
SWC1	S0, Offset(_gc+96)(GP)
;GCODE.c,280 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,281 :: 		case 'F':
L_Instruction_Values45:
;GCODE.c,282 :: 		F_Val = *(int*)any;
LH	R2, 0(R26)
; F_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,283 :: 		if(F_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values215
NOP	
J	L_Instruction_Values46
NOP	
L__Instruction_Values215:
;GCODE.c,284 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,285 :: 		}
L_Instruction_Values46:
;GCODE.c,292 :: 		gc.frequency = F_Val;
SH	R3, Offset(_gc+14)(GP)
; F_Val end address is: 12 (R3)
;GCODE.c,293 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,294 :: 		case 'P':
L_Instruction_Values47:
;GCODE.c,295 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,296 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values216
NOP	
J	L_Instruction_Values48
NOP	
L__Instruction_Values216:
;GCODE.c,297 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,298 :: 		}
L_Instruction_Values48:
;GCODE.c,299 :: 		gc.P = O_Val;
SH	R3, Offset(_gc+116)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,300 :: 		gc.S = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+118)(GP)
;GCODE.c,301 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,302 :: 		case 'S':
L_Instruction_Values49:
;GCODE.c,303 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,304 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values217
NOP	
J	L_Instruction_Values50
NOP	
L__Instruction_Values217:
;GCODE.c,305 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,306 :: 		}
L_Instruction_Values50:
;GCODE.c,307 :: 		gc.S = O_Val;
SH	R3, Offset(_gc+118)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,308 :: 		gc.P = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_gc+116)(GP)
;GCODE.c,309 :: 		break;
J	L_Instruction_Values35
NOP	
;GCODE.c,310 :: 		case 'L':
L_Instruction_Values51:
;GCODE.c,311 :: 		O_Val = *(int*)any;
LH	R2, 0(R26)
; O_Val start address is: 12 (R3)
SEH	R3, R2
;GCODE.c,312 :: 		if(O_Val < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__Instruction_Values218
NOP	
J	L_Instruction_Values52
NOP	
L__Instruction_Values218:
;GCODE.c,313 :: 		FAIL(STATUS_SPEED_ERROR);
ORI	R2, R0, 13
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,314 :: 		}
L_Instruction_Values52:
;GCODE.c,315 :: 		gc.L = O_Val;
SH	R3, Offset(_gc+16)(GP)
; O_Val end address is: 12 (R3)
;GCODE.c,316 :: 		break; //L2 tells the G10 we’re setting standard work offsets
J	L_Instruction_Values35
NOP	
;GCODE.c,317 :: 		default:FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_Instruction_Values53:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_Instruction_Values35
NOP	
;GCODE.c,318 :: 		}
L_Instruction_Values34:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 88
BNE	R3, R2, L__Instruction_Values220
NOP	
J	L_Instruction_Values36
NOP	
L__Instruction_Values220:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 89
BNE	R3, R2, L__Instruction_Values222
NOP	
J	L_Instruction_Values37
NOP	
L__Instruction_Values222:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 90
BNE	R3, R2, L__Instruction_Values224
NOP	
J	L_Instruction_Values38
NOP	
L__Instruction_Values224:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 65
BNE	R3, R2, L__Instruction_Values226
NOP	
J	L_Instruction_Values39
NOP	
L__Instruction_Values226:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 69
BNE	R3, R2, L__Instruction_Values228
NOP	
J	L_Instruction_Values40
NOP	
L__Instruction_Values228:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 82
BNE	R3, R2, L__Instruction_Values230
NOP	
J	L_Instruction_Values41
NOP	
L__Instruction_Values230:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 73
BNE	R3, R2, L__Instruction_Values232
NOP	
J	L_Instruction_Values42
NOP	
L__Instruction_Values232:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 74
BNE	R3, R2, L__Instruction_Values234
NOP	
J	L_Instruction_Values43
NOP	
L__Instruction_Values234:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 75
BNE	R3, R2, L__Instruction_Values236
NOP	
J	L_Instruction_Values44
NOP	
L__Instruction_Values236:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 70
BNE	R3, R2, L__Instruction_Values238
NOP	
J	L_Instruction_Values45
NOP	
L__Instruction_Values238:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 80
BNE	R3, R2, L__Instruction_Values240
NOP	
J	L_Instruction_Values47
NOP	
L__Instruction_Values240:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 83
BNE	R3, R2, L__Instruction_Values242
NOP	
J	L_Instruction_Values49
NOP	
L__Instruction_Values242:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 76
BNE	R3, R2, L__Instruction_Values244
NOP	
J	L_Instruction_Values51
NOP	
L__Instruction_Values244:
J	L_Instruction_Values53
NOP	
L_Instruction_Values35:
;GCODE.c,328 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,329 :: 		}
L_end_Instruction_Values:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Instruction_Values
_gc_set_current_position:
;GCODE.c,334 :: 		void gc_set_current_position(unsigned long x, unsigned long y, unsigned long z){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;GCODE.c,337 :: 		for(i=0;i<3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_gc_set_current_position54:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__gc_set_current_position246
NOP	
J	L_gc_set_current_position55
NOP	
L__gc_set_current_position246:
;GCODE.c,338 :: 		temp[i] = ulong2flt(settings.steps_per_mm[i]);
ADDIU	R4, SP, 20
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R4, R3
SW	R2, 32(SP)
LUI	R2, hi_addr(_settings+4)
ORI	R2, R2, lo_addr(_settings+4)
ADDU	R2, R2, R3
SH	R5, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LW	R25, 0(R2)
JAL	_ulong2flt+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LH	R5, 4(SP)
LW	R2, 32(SP)
SWC1	S0, 0(R2)
;GCODE.c,337 :: 		for(i=0;i<3;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;GCODE.c,339 :: 		}
; i end address is: 20 (R5)
J	L_gc_set_current_position54
NOP	
L_gc_set_current_position55:
;GCODE.c,340 :: 		gc.position[X] = x/temp[X];
ADDIU	R3, SP, 20
MTC1	R25, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R3)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+24)(GP)
;GCODE.c,341 :: 		gc.position[Y] = y/temp[Y];
ADDIU	R2, R3, 4
MTC1	R26, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+28)(GP)
;GCODE.c,342 :: 		gc.position[Z] = z/temp[Z];
ADDIU	R2, R3, 8
MTC1	R27, S0
MTHC1	R0, S0
CVT32.L 	S1, S0
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
SWC1	S0, Offset(_gc+32)(GP)
;GCODE.c,343 :: 		}
L_end_gc_set_current_position:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _gc_set_current_position
GCODE_To_Millimeters:
;GCODE.c,348 :: 		static float To_Millimeters(float value){
;GCODE.c,349 :: 		return(gc.inches_mode) ? (value * MM_PER_INCH) : value;
LBU	R2, Offset(_gc+3)(GP)
BNE	R2, R0, L_GCODE_To_Millimeters249
NOP	
J	L_GCODE_To_Millimeters57
NOP	
L_GCODE_To_Millimeters249:
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
; ?FLOC__GCODE_To_Millimeters?T177 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T177 end address is: 0 (R0)
J	L_GCODE_To_Millimeters58
NOP	
L_GCODE_To_Millimeters57:
; ?FLOC__GCODE_To_Millimeters?T177 start address is: 0 (R0)
MOV.S 	S0, S12
; ?FLOC__GCODE_To_Millimeters?T177 end address is: 0 (R0)
L_GCODE_To_Millimeters58:
; ?FLOC__GCODE_To_Millimeters?T177 start address is: 0 (R0)
; ?FLOC__GCODE_To_Millimeters?T177 end address is: 0 (R0)
;GCODE.c,350 :: 		}
L_end_To_Millimeters:
JR	RA
NOP	
; end of GCODE_To_Millimeters
GCODE_Select_Plane:
;GCODE.c,353 :: 		static void Select_Plane(int axis_combo){
;GCODE.c,354 :: 		axis_xyz = axis_combo;
SB	R25, Offset(_axis_xyz+0)(GP)
;GCODE.c,355 :: 		}
L_end_Select_Plane:
JR	RA
NOP	
; end of GCODE_Select_Plane
GCODE_Set_Modal_Groups:
;GCODE.c,358 :: 		static int Set_Modal_Groups(int mode){
ADDIU	SP, SP, -4
;GCODE.c,360 :: 		switch(mode) {
J	L_GCODE_Set_Modal_Groups59
NOP	
;GCODE.c,361 :: 		case 4: case 10: case 280:case 281: case 300:case 301: case 53: case 92:
L_GCODE_Set_Modal_Groups61:
L_GCODE_Set_Modal_Groups62:
L_GCODE_Set_Modal_Groups63:
L_GCODE_Set_Modal_Groups64:
L_GCODE_Set_Modal_Groups65:
L_GCODE_Set_Modal_Groups66:
L_GCODE_Set_Modal_Groups67:
L_GCODE_Set_Modal_Groups68:
;GCODE.c,362 :: 		gp_num = MODAL_GROUP_0; break;
ORI	R2, R0, 1
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,363 :: 		case 0: case 1: case 2: case 3: case 80: gp_num = MODAL_GROUP_1; break;
L_GCODE_Set_Modal_Groups69:
L_GCODE_Set_Modal_Groups70:
L_GCODE_Set_Modal_Groups71:
L_GCODE_Set_Modal_Groups72:
L_GCODE_Set_Modal_Groups73:
ORI	R2, R0, 2
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,364 :: 		case 17: case 18: case 19: gp_num = MODAL_GROUP_2; break;
L_GCODE_Set_Modal_Groups74:
L_GCODE_Set_Modal_Groups75:
L_GCODE_Set_Modal_Groups76:
ORI	R2, R0, 3
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,365 :: 		case 90: case 91: gp_num = MODAL_GROUP_3; break;
L_GCODE_Set_Modal_Groups77:
L_GCODE_Set_Modal_Groups78:
ORI	R2, R0, 4
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,366 :: 		case 93: case 94: gp_num = MODAL_GROUP_5; break;
L_GCODE_Set_Modal_Groups79:
L_GCODE_Set_Modal_Groups80:
ORI	R2, R0, 6
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,367 :: 		case 20: case 21: gp_num = MODAL_GROUP_6; break;
L_GCODE_Set_Modal_Groups81:
L_GCODE_Set_Modal_Groups82:
ORI	R2, R0, 7
SH	R2, 0(SP)
J	L_GCODE_Set_Modal_Groups60
NOP	
;GCODE.c,368 :: 		case 54: case 55: case 56: case 57: case 58: case 59: gp_num = MODAL_GROUP_12; break;
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
;GCODE.c,369 :: 		}
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
;GCODE.c,370 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,371 :: 		}
L_end_Set_Modal_Groups:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_Modal_Groups
GCODE_Set_Motion_Mode:
;GCODE.c,374 :: 		static int Set_Motion_Mode(int mode){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;GCODE.c,376 :: 		switch(mode){
SW	R25, 4(SP)
J	L_GCODE_Set_Motion_Mode89
NOP	
;GCODE.c,377 :: 		case 0: motion_mode    = MOTION_MODE_SEEK;    break;
L_GCODE_Set_Motion_Mode91:
SH	R0, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,378 :: 		case 1: motion_mode    = MOTION_MODE_LINEAR;  break;
L_GCODE_Set_Motion_Mode92:
ORI	R2, R0, 1
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,379 :: 		case 2: motion_mode    = MOTION_MODE_CW_ARC;  break;
L_GCODE_Set_Motion_Mode93:
ORI	R2, R0, 2
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,380 :: 		case 3: motion_mode    = MOTION_MODE_CCW_ARC; break;
L_GCODE_Set_Motion_Mode94:
ORI	R2, R0, 3
SH	R2, Offset(GCODE_motion_mode+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,381 :: 		case 4: non_modal_action  = NON_MODAL_DWELL;     break;
L_GCODE_Set_Motion_Mode95:
ORI	R2, R0, 1
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,382 :: 		case 10: non_modal_action = NON_MODAL_SET_COORDINATE_DATA; break;
L_GCODE_Set_Motion_Mode96:
ORI	R2, R0, 2
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,383 :: 		case 17: Select_Plane(xy); break;
L_GCODE_Set_Motion_Mode97:
MOVZ	R25, R0, R0
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,384 :: 		case 18: Select_Plane(xz); break;
L_GCODE_Set_Motion_Mode98:
ORI	R25, R0, 1
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,385 :: 		case 19: Select_Plane(yz); break;
L_GCODE_Set_Motion_Mode99:
ORI	R25, R0, 2
JAL	GCODE_Select_Plane+0
NOP	
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,386 :: 		case 20: gc.inches_mode = 1; break;
L_GCODE_Set_Motion_Mode100:
ORI	R2, R0, 1
SB	R2, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,387 :: 		case 21: gc.inches_mode = 0; break;
L_GCODE_Set_Motion_Mode101:
SB	R0, Offset(_gc+3)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,388 :: 		case 53: absolute_override = true; break;
L_GCODE_Set_Motion_Mode102:
ORI	R2, R0, 1
SB	R2, Offset(GCODE_absolute_override+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,389 :: 		case 54: case 55: case 56: case 57: case 58: case 59:
L_GCODE_Set_Motion_Mode103:
L_GCODE_Set_Motion_Mode104:
L_GCODE_Set_Motion_Mode105:
L_GCODE_Set_Motion_Mode106:
L_GCODE_Set_Motion_Mode107:
L_GCODE_Set_Motion_Mode108:
;GCODE.c,390 :: 		gc.coord_select = (mode - 53);//G54-53 == 1...;
ADDIU	R2, R25, -53
SB	R2, Offset(_gc+13)(GP)
;GCODE.c,391 :: 		break;
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,392 :: 		case 80: gc.motion_mode = MOTION_MODE_CANCEL; break; //to be implimented in the future
L_GCODE_Set_Motion_Mode109:
ORI	R2, R0, 4
SB	R2, Offset(_gc+1)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,393 :: 		case 90: gc.absolute_mode = true; break;
L_GCODE_Set_Motion_Mode110:
ORI	R2, R0, 1
SB	R2, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,394 :: 		case 91: gc.absolute_mode = false; break;
L_GCODE_Set_Motion_Mode111:
SB	R0, Offset(_gc+5)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,395 :: 		case 93: gc.inverse_feed_rate_mode = true; break;
L_GCODE_Set_Motion_Mode112:
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,396 :: 		case 94: gc.inverse_feed_rate_mode = false; break;
L_GCODE_Set_Motion_Mode113:
SB	R0, Offset(_gc+2)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,397 :: 		case 280: non_modal_action = NON_MODAL_GO_HOME_0; break;
L_GCODE_Set_Motion_Mode114:
ORI	R2, R0, 3
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,398 :: 		case 281: non_modal_action = NON_MODAL_SET_HOME_0; break;
L_GCODE_Set_Motion_Mode115:
ORI	R2, R0, 4
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,399 :: 		case 300: non_modal_action = NON_MODAL_GO_HOME_1; break;
L_GCODE_Set_Motion_Mode116:
ORI	R2, R0, 5
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,400 :: 		case 301: non_modal_action = NON_MODAL_SET_HOME_1; break;
L_GCODE_Set_Motion_Mode117:
ORI	R2, R0, 6
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,401 :: 		case 920: non_modal_action = NON_MODAL_SET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode118:
ORI	R2, R0, 7
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,402 :: 		case 921: non_modal_action = NON_MODAL_RESET_COORDINATE_OFFSET; break;
L_GCODE_Set_Motion_Mode119:
ORI	R2, R0, 8
SH	R2, Offset(_non_modal_action+0)(GP)
J	L_GCODE_Set_Motion_Mode90
NOP	
;GCODE.c,403 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);return;break;
L_GCODE_Set_Motion_Mode120:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
;GCODE.c,404 :: 		}
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
;GCODE.c,405 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,410 :: 		if ( bit_istrue(modal_group_words,bit(MODAL_GROUP_1)) || axis_words ) {
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
;GCODE.c,412 :: 		if ( gc.inverse_feed_rate_mode ) {
LBU	R2, Offset(_gc+2)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode370
NOP	
J	L_GCODE_Set_Motion_Mode124
NOP	
L_GCODE_Set_Motion_Mode370:
;GCODE.c,413 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
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
;GCODE.c,414 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,413 :: 		if (inverse_feed_rate < 0 && motion_mode != MOTION_MODE_CANCEL) {
L_GCODE_Set_Motion_Mode161:
L_GCODE_Set_Motion_Mode160:
;GCODE.c,416 :: 		}
L_GCODE_Set_Motion_Mode124:
;GCODE.c,418 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
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
;GCODE.c,419 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;GCODE.c,418 :: 		if ( absolute_override && !(motion_mode == MOTION_MODE_SEEK || motion_mode == MOTION_MODE_LINEAR)) {
L_GCODE_Set_Motion_Mode163:
L_GCODE_Set_Motion_Mode162:
;GCODE.c,426 :: 		if (status_code) { return(status_code); }
LH	R2, Offset(_status_code+0)(GP)
BNE	R2, R0, L_GCODE_Set_Motion_Mode382
NOP	
J	L_GCODE_Set_Motion_Mode133
NOP	
L_GCODE_Set_Motion_Mode382:
LH	R2, Offset(_status_code+0)(GP)
J	L_end_Set_Motion_Mode
NOP	
L_GCODE_Set_Motion_Mode133:
;GCODE.c,428 :: 		}
L_GCODE_Set_Motion_Mode123:
;GCODE.c,433 :: 		return motion_mode;
LH	R2, Offset(GCODE_motion_mode+0)(GP)
;GCODE.c,434 :: 		}
;GCODE.c,433 :: 		return motion_mode;
;GCODE.c,434 :: 		}
L_end_Set_Motion_Mode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of GCODE_Set_Motion_Mode
GCODE_Set_M_Modal_Commands:
;GCODE.c,436 :: 		static int Set_M_Modal_Commands(int flow){
ADDIU	SP, SP, -4
;GCODE.c,439 :: 		switch(flow) {
J	L_GCODE_Set_M_Modal_Commands134
NOP	
;GCODE.c,440 :: 		case 0: case 1: case 2: case 30: gp_num = MODAL_GROUP_4; break;
L_GCODE_Set_M_Modal_Commands136:
L_GCODE_Set_M_Modal_Commands137:
L_GCODE_Set_M_Modal_Commands138:
L_GCODE_Set_M_Modal_Commands139:
ORI	R2, R0, 5
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands135
NOP	
;GCODE.c,441 :: 		case 3: case 4: case 5: gp_num = MODAL_GROUP_7; break;
L_GCODE_Set_M_Modal_Commands140:
L_GCODE_Set_M_Modal_Commands141:
L_GCODE_Set_M_Modal_Commands142:
ORI	R2, R0, 8
SH	R2, 0(SP)
J	L_GCODE_Set_M_Modal_Commands135
NOP	
;GCODE.c,442 :: 		}
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
;GCODE.c,443 :: 		return gp_num;
LH	R2, 0(SP)
;GCODE.c,444 :: 		}
L_end_Set_M_Modal_Commands:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of GCODE_Set_M_Modal_Commands
GCODE_Set_M_Commands:
;GCODE.c,447 :: 		static int Set_M_Commands(int flow){
;GCODE.c,448 :: 		FAIL(STATUS_OK);
SH	R0, Offset(_status_code+0)(GP)
;GCODE.c,450 :: 		switch(flow) {
J	L_GCODE_Set_M_Commands143
NOP	
;GCODE.c,451 :: 		case 0: gc.program_flow = PROGRAM_FLOW_PAUSED; break; // Program pause
L_GCODE_Set_M_Commands145:
ORI	R2, R0, 1
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,452 :: 		case 1: break; // Optional stop not supported. Ignore.
L_GCODE_Set_M_Commands146:
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,453 :: 		case 2:
L_GCODE_Set_M_Commands147:
;GCODE.c,454 :: 		case 30: gc.program_flow = PROGRAM_FLOW_COMPLETED; break; // Program end and reset
L_GCODE_Set_M_Commands148:
ORI	R2, R0, 2
SB	R2, Offset(_gc+6)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,455 :: 		case 3: gc.spindle_direction = 1; break;
L_GCODE_Set_M_Commands149:
ORI	R2, R0, 1
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,456 :: 		case 4: gc.spindle_direction = -1; break;
L_GCODE_Set_M_Commands150:
ORI	R2, R0, 255
SB	R2, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,457 :: 		case 5: gc.spindle_direction = 0; break;
L_GCODE_Set_M_Commands151:
SB	R0, Offset(_gc+7)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,461 :: 		case 8: gc.coolant_mode = COOLANT_FLOOD_ENABLE; break;
L_GCODE_Set_M_Commands152:
ORI	R2, R0, 1
SB	R2, Offset(_gc+8)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,462 :: 		case 9: gc.coolant_mode = COOLANT_DISABLE; break;
L_GCODE_Set_M_Commands153:
SB	R0, Offset(_gc+8)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,463 :: 		default: FAIL(STATUS_UNSUPPORTED_STATEMENT);break;
L_GCODE_Set_M_Commands154:
ORI	R2, R0, 3
SH	R2, Offset(_status_code+0)(GP)
J	L_GCODE_Set_M_Commands144
NOP	
;GCODE.c,464 :: 		}
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
;GCODE.c,465 :: 		return status_code;
LH	R2, Offset(_status_code+0)(GP)
;GCODE.c,466 :: 		}
L_end_Set_M_Commands:
JR	RA
NOP	
; end of GCODE_Set_M_Commands
