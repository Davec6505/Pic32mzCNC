_Conditin_Externs:
;Main.c,54 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,55 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,56 :: 		plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
LUI	R3, 17820
ORI	R3, R3, 16384
LUI	R2, 17820
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_plan_init+0
NOP	
;Main.c,57 :: 		Init_Protocol();
JAL	_Init_Protocol+0
NOP	
;Main.c,58 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Main.c,59 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,60 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,62 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,63 :: 		}
L_end_Conditin_Externs:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,67 :: 		void main() {
ADDIU	SP, SP, -4
;Main.c,68 :: 		int error = 0;
;Main.c,69 :: 		int has_flash = 0;
;Main.c,70 :: 		int modal_group = 0;
;Main.c,71 :: 		int modal_action = 0;
;Main.c,76 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,78 :: 		cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, 0(SP)
;Main.c,80 :: 		while(1){
L_main0:
;Main.c,83 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,84 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,85 :: 		Debounce_Limits(Z);
ORI	R25, R0, 2
JAL	_Debounce_Limits+0
NOP	
;Main.c,94 :: 		status_of_gcode == STATUS_OK){
LH	R3, 0(SP)
ORI	R2, R0, 20
BNE	R3, R2, L__main147
NOP	
J	L__main140
NOP	
L__main147:
LH	R2, 0(SP)
BNE	R2, R0, L__main149
NOP	
J	L__main139
NOP	
L__main149:
J	L_main4
NOP	
L__main140:
L__main139:
;Main.c,95 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 2(SP)
;Main.c,97 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,104 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,105 :: 		case 0:break;
L_main7:
J	L_main6
NOP	
;Main.c,106 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,107 :: 		modal_action = Modal_Group_Actions0(Get_non_modalword());
JAL	_Get_non_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,108 :: 		modal_action = modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,109 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,110 :: 		break;
J	L_main6
NOP	
;Main.c,111 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,112 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,114 :: 		if(axis_to_run){
BNE	R2, R0, L__main151
NOP	
J	L_main10
NOP	
L__main151:
;Main.c,117 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 31
JAL	_EnableSteppers+0
NOP	
;Main.c,118 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 2(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,119 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,120 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,121 :: 		}else{
J	L_main11
NOP	
L_main10:
;Main.c,122 :: 		int report = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,123 :: 		if(!report){
BEQ	R2, R0, L__main152
NOP	
J	L_main12
NOP	
L__main152:
;Main.c,124 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,125 :: 		SET_FAIL(STATUS_NO_REPORT);
ORI	R25, R0, 99
JAL	_SET_FAIL+0
NOP	
;Main.c,126 :: 		}
L_main12:
;Main.c,127 :: 		}
L_main11:
;Main.c,128 :: 		break;
J	L_main6
NOP	
;Main.c,129 :: 		case 8: // [G17,G18,G19] Plane selection [report status set in GCODE]
L_main13:
;Main.c,130 :: 		case 16:// [G90,G91] Distance mode  [not conditioned here]
L_main14:
;Main.c,131 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,132 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,133 :: 		break;
J	L_main6
NOP	
;Main.c,134 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main15:
;Main.c,135 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,136 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,137 :: 		break;
J	L_main6
NOP	
;Main.c,138 :: 		case 64:// [G93,G94] Feed rate mode [not conditioned here]
L_main16:
;Main.c,139 :: 		case 128:// [G20,G21] Units [not conditioned here]
L_main17:
;Main.c,140 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,141 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,142 :: 		break;
J	L_main6
NOP	
;Main.c,143 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main18:
;Main.c,144 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,145 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,146 :: 		break;
J	L_main6
NOP	
;Main.c,147 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main19:
;Main.c,148 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(-1610602226)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,149 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,150 :: 		break;
J	L_main6
NOP	
;Main.c,151 :: 		case 1024: //$H Home all axis
L_main20:
;Main.c,153 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,158 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main153
NOP	
J	L_main21
NOP	
L__main153:
JAL	_Rst_modalgroup+0
NOP	
L_main21:
;Main.c,159 :: 		break;
J	L_main6
NOP	
;Main.c,160 :: 		}
L_main5:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main155
NOP	
J	L_main7
NOP	
L__main155:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main157
NOP	
J	L_main8
NOP	
L__main157:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main159
NOP	
J	L_main9
NOP	
L__main159:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__main161
NOP	
J	L_main13
NOP	
L__main161:
SEH	R3, R4
ORI	R2, R0, 16
BNE	R3, R2, L__main163
NOP	
J	L_main14
NOP	
L__main163:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main165
NOP	
J	L_main15
NOP	
L__main165:
SEH	R3, R4
ORI	R2, R0, 64
BNE	R3, R2, L__main167
NOP	
J	L_main16
NOP	
L__main167:
SEH	R3, R4
ORI	R2, R0, 128
BNE	R3, R2, L__main169
NOP	
J	L_main17
NOP	
L__main169:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main171
NOP	
J	L_main18
NOP	
L__main171:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main173
NOP	
J	L_main19
NOP	
L__main173:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main175
NOP	
J	L_main20
NOP	
L__main175:
L_main6:
;Main.c,161 :: 		}
L_main4:
;Main.c,181 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,184 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,187 :: 		if(!Get_Axis_IEnable_States() && SV.mode_complete > 0 && !SV.homed){
JAL	_Get_Axis_IEnable_States+0
NOP	
BEQ	R2, R0, L__main176
NOP	
J	L__main143
NOP	
L__main176:
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 6, 2
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main177
NOP	
J	L__main142
NOP	
L__main177:
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__main178
NOP	
J	L__main141
NOP	
L__main178:
L__main137:
;Main.c,188 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,191 :: 		report_status_message(status_of_gcode);
LH	R25, 0(SP)
JAL	_report_status_message+0
NOP	
;Main.c,193 :: 		SV.mode_complete = 0;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Main.c,187 :: 		if(!Get_Axis_IEnable_States() && SV.mode_complete > 0 && !SV.homed){
L__main143:
L__main142:
L__main141:
;Main.c,197 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, 0(SP)
;Main.c,202 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,207 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main179
NOP	
J	L_main25
NOP	
L__main179:
;Main.c,208 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main25:
;Main.c,212 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,213 :: 		}
J	L_main0
NOP	
;Main.c,214 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,220 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,223 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,232 :: 		switch(action){
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,233 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions028:
;Main.c,234 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,236 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(-1610602114)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0182
NOP	
J	L_Main_Modal_Group_Actions029
NOP	
L_Main_Modal_Group_Actions0182:
;Main.c,237 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(-1610602114)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,238 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions030:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0183
NOP	
J	L_Main_Modal_Group_Actions031
NOP	
L_Main_Modal_Group_Actions0183:
;Main.c,239 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,240 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions032:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions032
NOP	
;Main.c,241 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,242 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions031:
;Main.c,243 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions029:
; i start address is: 20 (R5)
LH	R2, Offset(-1610602116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0184
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0184:
;Main.c,244 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(-1610602116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,245 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions036:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0185
NOP	
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions0185:
;Main.c,246 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,247 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions038:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions038
NOP	
;Main.c,248 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,249 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions037:
;Main.c,250 :: 		}
L_Main_Modal_Group_Actions035:
L_Main_Modal_Group_Actions034:
;Main.c,252 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,253 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,254 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions040:
;Main.c,267 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions0127
NOP	
L_Main_Modal_Group_Actions0187:
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0189
NOP	
J	L_Main_Modal_Group_Actions0126
NOP	
L_Main_Modal_Group_Actions0189:
L_Main_Modal_Group_Actions0125:
;Main.c,268 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,267 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0127:
L_Main_Modal_Group_Actions0126:
;Main.c,269 :: 		if (gc.L == 20) {
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0190
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0190:
;Main.c,271 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10576
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,273 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0192
NOP	
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions0192:
;Main.c,274 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,275 :: 		}
L_Main_Modal_Group_Actions045:
;Main.c,278 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(-1610602226)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0193
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0193:
;Main.c,279 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, 40960
ORI	R26, R26, 10576
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,280 :: 		}
L_Main_Modal_Group_Actions046:
;Main.c,282 :: 		} else {
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions044:
;Main.c,288 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(-1610602116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,289 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,290 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,294 :: 		axis_words = Get_Axisword();
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,295 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions048:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0194
NOP	
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions0194:
; axis_words end address is: 20 (R5)
;Main.c,296 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,298 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,299 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,300 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions0196:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions052:
;Main.c,302 :: 		_flash = buffA[indx];
; i start address is: 24 (R6)
; indx start address is: 28 (R7)
; axis_cnt start address is: 16 (R4)
; axis_words start address is: 20 (R5)
SEH	R2, R7
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R2, 24(SP)
;Main.c,306 :: 		coord_data[i] = ulong2flt(_flash);
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 44(SP)
SH	R4, 12(SP)
SH	R7, 14(SP)
SH	R5, 16(SP)
SH	R6, 18(SP)
SH	R25, 20(SP)
LW	R25, 24(SP)
JAL	_ulong2flt+0
NOP	
LH	R25, 20(SP)
LH	R6, 18(SP)
LH	R5, 16(SP)
LH	R7, 14(SP)
LH	R4, 12(SP)
LW	R2, 44(SP)
SWC1	S0, 0(R2)
;Main.c,314 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions051:
;Main.c,317 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,325 :: 		}
L_Main_Modal_Group_Actions053:
;Main.c,326 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,295 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,327 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions049:
;Main.c,329 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 28
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,332 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 28
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,333 :: 		}
L_Main_Modal_Group_Actions047:
;Main.c,335 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,336 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions054:
;Main.c,337 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions055:
;Main.c,340 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,349 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,351 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions057:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0199
NOP	
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions0199:
;Main.c,353 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0201
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0201:
;Main.c,354 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0203
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0203:
;Main.c,355 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R3, R2, R4
LUI	R2, 40960
ORI	R2, R2, 10544
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10560
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,356 :: 		} else {
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions061:
;Main.c,357 :: 		gc.next_position[i] += gc.position[i];
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R4, R2, R3
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,358 :: 		}
L_Main_Modal_Group_Actions062:
;Main.c,359 :: 		} else {
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions060:
;Main.c,360 :: 		gc.next_position[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R3, R2, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,361 :: 		}
L_Main_Modal_Group_Actions063:
;Main.c,366 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SH	R6, 12(SP)
SH	R5, 14(SP)
SH	R25, 16(SP)
SEH	R25, R5
LWC1	S13, Offset(-1610602476)(GP)
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
LH	R25, 16(SP)
LH	R5, 14(SP)
LH	R6, 12(SP)
SEH	R4, R5
SEH	R3, R6
;Main.c,367 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions064:
; axis_words start address is: 12 (R3)
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
SEH	R25, R4
JAL	_GET_RunState+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions0205:
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions065:
;Main.c,351 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,368 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions058:
;Main.c,369 :: 		}
L_Main_Modal_Group_Actions056:
;Main.c,371 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 20 (R5)
ORI	R5, R0, 10
;Main.c,373 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions0128
NOP	
L_Main_Modal_Group_Actions0206:
ORI	R5, R0, 11
; temp end address is: 20 (R5)
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0128:
L_Main_Modal_Group_Actions066:
;Main.c,374 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 20 (R5)
SEH	R2, R5
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,377 :: 		for(j = 0;j<4;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions067:
; j start address is: 16 (R4)
; i start address is: 24 (R6)
; temp start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0207
NOP	
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0207:
;Main.c,378 :: 		_data = buffA[i];
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,379 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R5
SLL	R3, R2, 5
LUI	R2, 40960
ORI	R2, R2, 13824
ADDU	R3, R2, R3
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 44(SP)
SH	R5, 12(SP)
; _data end address is: 28 (R7)
SH	R6, 14(SP)
SH	R4, 16(SP)
SH	R25, 18(SP)
MOVZ	R25, R7, R0
JAL	_ulong2flt+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
LH	R6, 14(SP)
LH	R5, 12(SP)
LW	R2, 44(SP)
SWC1	S0, 0(R2)
;Main.c,384 :: 		i++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,387 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
SEH	R2, R5
SLL	R3, R2, 5
LUI	R2, 40960
ORI	R2, R2, 13824
ADDU	R3, R2, R3
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
SH	R6, 12(SP)
SH	R5, 14(SP)
SH	R4, 16(SP)
SH	R25, 18(SP)
SEH	R25, R4
LWC1	S13, Offset(-1610602476)(GP)
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
; i end address is: 24 (R6)
LH	R25, 18(SP)
LH	R4, 16(SP)
LH	R5, 14(SP)
LH	R6, 12(SP)
SEH	R3, R6
;Main.c,388 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions070:
; i start address is: 12 (R3)
; temp start address is: 20 (R5)
; j start address is: 16 (R4)
SH	R4, 12(SP)
SH	R5, 14(SP)
SH	R3, 16(SP)
SH	R25, 18(SP)
SEH	R25, R4
JAL	_GET_RunState+0
NOP	
LH	R25, 18(SP)
LH	R3, 16(SP)
LH	R5, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0209:
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions071:
;Main.c,377 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,389 :: 		}
; i end address is: 12 (R3)
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
SEH	R6, R3
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions068:
;Main.c,391 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,392 :: 		case 16:
L_Main_Modal_Group_Actions072:
;Main.c,394 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,395 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions0129
NOP	
L_Main_Modal_Group_Actions0210:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0129:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions073:
;Main.c,396 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,397 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,398 :: 		case 53:
L_Main_Modal_Group_Actions074:
;Main.c,399 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,404 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions075:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions0211:
; axis_words end address is: 20 (R5)
;Main.c,405 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0213
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0213:
;Main.c,406 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(-1610602236)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0214:
;Main.c,407 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(-1610602235)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0215
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0215:
;Main.c,408 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R3, R2, R4
LUI	R2, 40960
ORI	R2, R2, 10544
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10560
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,409 :: 		} else {
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions080:
;Main.c,410 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R4, R2, R3
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,411 :: 		}
L_Main_Modal_Group_Actions081:
;Main.c,412 :: 		} else {
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions079:
;Main.c,413 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R3, R2, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,414 :: 		}
L_Main_Modal_Group_Actions082:
;Main.c,415 :: 		}
L_Main_Modal_Group_Actions078:
;Main.c,404 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,416 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions076:
;Main.c,417 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,418 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions083:
;Main.c,419 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,420 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions0130
NOP	
L_Main_Modal_Group_Actions0216:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0130:
SEH	R2, R4
L_Main_Modal_Group_Actions084:
;Main.c,421 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,422 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,423 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions085:
;Main.c,424 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,426 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0217
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0217:
; axis_words end address is: 20 (R5)
;Main.c,427 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,428 :: 		} else {
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions086:
;Main.c,432 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions088:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions0218:
; axis_words end address is: 20 (R5)
;Main.c,433 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0220
NOP	
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0220:
;Main.c,434 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10560
ADDU	R3, R2, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10544
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S1, S1, S0
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Main.c,435 :: 		}
L_Main_Modal_Group_Actions091:
;Main.c,432 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,436 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions089:
;Main.c,437 :: 		}
L_Main_Modal_Group_Actions087:
;Main.c,439 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions092:
;Main.c,441 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 10560
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,442 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,443 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions093:
ORI	R25, R0, 65535
;Main.c,444 :: 		break;
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,445 :: 		}
L_Main_Modal_Group_Actions026:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0222
NOP	
J	L_Main_Modal_Group_Actions028
NOP	
L_Main_Modal_Group_Actions0222:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0224
NOP	
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions0224:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0226
NOP	
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions0226:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0228
NOP	
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0228:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0230
NOP	
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0230:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0232
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0232:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0234
NOP	
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions0234:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0236
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0236:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0238
NOP	
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions0238:
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions027:
;Main.c,446 :: 		return action;
SEH	R2, R25
;Main.c,447 :: 		}
;Main.c,446 :: 		return action;
;Main.c,447 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,452 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,457 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions194
NOP	
;Main.c,458 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions196:
;Main.c,459 :: 		SingleAxisStep(gc.next_position[X],gc.feed_rate,X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,460 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,461 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions197:
;Main.c,462 :: 		SingleAxisStep(gc.next_position[Y],gc.feed_rate,Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,463 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,464 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions198:
;Main.c,465 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602156)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,466 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,467 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions199:
;Main.c,468 :: 		SingleAxisStep(gc.next_position[Z],gc.feed_rate,Z);
SH	R25, 12(SP)
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,469 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,470 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1100:
;Main.c,471 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,472 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,473 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1101:
;Main.c,474 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,475 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,476 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1102:
;Main.c,477 :: 		SingleAxisStep(gc.next_position[A],gc.feed_rate,A);
SH	R25, 12(SP)
ORI	R25, R0, 3
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602148)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,478 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,479 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1103:
;Main.c,480 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,481 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,482 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1104:
;Main.c,483 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,484 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,485 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1105:
;Main.c,486 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,487 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,488 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1106:
;Main.c,489 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,490 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
LH	R27, Offset(-1610602112)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S15, Offset(-1610602156)(GP)
LWC1	S14, Offset(-1610602160)(GP)
LWC1	S13, Offset(-1610602204)(GP)
LWC1	S12, Offset(-1610602208)(GP)
LW	R2, Offset(-1610602120)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LW	R2, Offset(-1610602124)(GP)
SW	R2, 8(SP)
LW	R2, Offset(-1610602128)(GP)
SW	R2, 4(SP)
LW	R2, Offset(-1610602132)(GP)
SW	R2, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 12(SP)
;Main.c,491 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,492 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1107:
;Main.c,493 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,494 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,499 :: 		if(axis_to_home < 3){
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions1240
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1240:
;Main.c,502 :: 		if (sys.abort) {
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1242
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1242:
;Main.c,503 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,504 :: 		}
L_Main_Modal_Group_Actions1109:
;Main.c,505 :: 		}else{
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1108:
;Main.c,506 :: 		int l = 0;
;Main.c,508 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,509 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,510 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,511 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1111:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1243
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1243:
;Main.c,514 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Main.c,515 :: 		sys.position[l] = STPS[l].steps_abs_position;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 13576
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
LW	R2, 0(R2)
SW	R2, 0(R4)
;Main.c,518 :: 		if(STPS[l].run_state != STOP)
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions1245
NOP	
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1245:
;Main.c,519 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1114:
;Main.c,511 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,520 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1112:
;Main.c,523 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,526 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1115:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1247
NOP	
J	L_Main_Modal_Group_Actions1116
NOP	
L_Main_Modal_Group_Actions1247:
;Main.c,527 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1116:
;Main.c,530 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
;Main.c,531 :: 		SV.mode_complete = 1;
ORI	R3, R0, 1
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Main.c,532 :: 		SV.homed = false;
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+0)(GP)
;Main.c,533 :: 		}
L_Main_Modal_Group_Actions1110:
;Main.c,534 :: 		break;
J	L_Main_Modal_Group_Actions195
NOP	
;Main.c,535 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1117:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,537 :: 		}
L_Main_Modal_Group_Actions194:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1249
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1249:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1251
NOP	
J	L_Main_Modal_Group_Actions197
NOP	
L_Main_Modal_Group_Actions1251:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1253
NOP	
J	L_Main_Modal_Group_Actions198
NOP	
L_Main_Modal_Group_Actions1253:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1255
NOP	
J	L_Main_Modal_Group_Actions199
NOP	
L_Main_Modal_Group_Actions1255:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1257
NOP	
J	L_Main_Modal_Group_Actions1100
NOP	
L_Main_Modal_Group_Actions1257:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1259
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1259:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1261
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1261:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1263
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1263:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1265
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1265:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1267
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1267:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1269
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1269:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1271
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1271:
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions195:
;Main.c,539 :: 		return action;
SEH	R2, R25
;Main.c,540 :: 		}
;Main.c,539 :: 		return action;
;Main.c,540 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,546 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,548 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(-1610602237)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3273
NOP	
J	L_Main_Modal_Group_Actions3118
NOP	
L_Main_Modal_Group_Actions3273:
;Main.c,549 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3118:
;Main.c,551 :: 		return action;
SEH	R2, R25
;Main.c,552 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,557 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,563 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4275
NOP	
J	L_Main_Modal_Group_Actions4133
NOP	
L_Main_Modal_Group_Actions4275:
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4276
NOP	
J	L_Main_Modal_Group_Actions4132
NOP	
L_Main_Modal_Group_Actions4276:
J	L_Main_Modal_Group_Actions4121
NOP	
L_Main_Modal_Group_Actions4133:
L_Main_Modal_Group_Actions4132:
;Main.c,564 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4121:
;Main.c,565 :: 		SV.mode_complete = 1;
ORI	R3, R0, 1
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Main.c,566 :: 		return action;
SEH	R2, R25
;Main.c,567 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,572 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,577 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(-1610602234)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7278
NOP	
J	L_Main_Modal_Group_Actions7136
NOP	
L_Main_Modal_Group_Actions7278:
LBU	R2, Offset(-1610602234)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7279
NOP	
J	L_Main_Modal_Group_Actions7135
NOP	
L_Main_Modal_Group_Actions7279:
J	L_Main_Modal_Group_Actions7124
NOP	
L_Main_Modal_Group_Actions7136:
L_Main_Modal_Group_Actions7135:
;Main.c,578 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7124:
;Main.c,579 :: 		SV.mode_complete = 1;
ORI	R3, R0, 1
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Main.c,580 :: 		return action;
SEH	R2, R25
;Main.c,581 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,586 :: 		static int Modal_Group_Actions12(int action){
;Main.c,591 :: 		return action;
SEH	R2, R25
;Main.c,592 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
