_Conditin_Externs:
;Main.c,64 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,65 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,66 :: 		plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
LUI	R3, 17820
ORI	R3, R3, 16384
LUI	R2, 17820
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_plan_init+0
NOP	
;Main.c,67 :: 		Init_Protocol();
JAL	_Init_Protocol+0
NOP	
;Main.c,68 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Main.c,69 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,70 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,72 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,73 :: 		}
L_end_Conditin_Externs:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,77 :: 		void main() {
ADDIU	SP, SP, -4
;Main.c,78 :: 		int error = 0;
;Main.c,79 :: 		int has_flash = 0;
;Main.c,80 :: 		int modal_group = 0;
;Main.c,81 :: 		int modal_action = 0;
;Main.c,86 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,88 :: 		cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, 0(SP)
;Main.c,90 :: 		while(1){
L_main0:
;Main.c,93 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,94 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,95 :: 		Debounce_Limits(Z);
ORI	R25, R0, 2
JAL	_Debounce_Limits+0
NOP	
;Main.c,104 :: 		status_of_gcode == STATUS_OK){
LH	R3, 0(SP)
ORI	R2, R0, 20
BNE	R3, R2, L__main156
NOP	
J	L__main147
NOP	
L__main156:
LH	R2, 0(SP)
BNE	R2, R0, L__main158
NOP	
J	L__main146
NOP	
L__main158:
J	L_main4
NOP	
L__main147:
L__main146:
;Main.c,105 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 2(SP)
;Main.c,107 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,114 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,115 :: 		case 0:break;
L_main7:
J	L_main6
NOP	
;Main.c,116 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,117 :: 		modal_action = Modal_Group_Actions0(Get_non_modalword());
JAL	_Get_non_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,118 :: 		modal_action = modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,119 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,120 :: 		break;
J	L_main6
NOP	
;Main.c,121 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,122 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,124 :: 		if(axis_to_run){
BNE	R2, R0, L__main160
NOP	
J	L_main10
NOP	
L__main160:
;Main.c,127 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 31
JAL	_EnableSteppers+0
NOP	
;Main.c,128 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 2(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,129 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,130 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,131 :: 		}else{
J	L_main11
NOP	
L_main10:
;Main.c,132 :: 		int report = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,133 :: 		if(!report){
BEQ	R2, R0, L__main161
NOP	
J	L_main12
NOP	
L__main161:
;Main.c,134 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,135 :: 		SET_FAIL(STATUS_NO_REPORT);
ORI	R25, R0, 99
JAL	_SET_FAIL+0
NOP	
;Main.c,136 :: 		}
L_main12:
;Main.c,137 :: 		}
L_main11:
;Main.c,138 :: 		break;
J	L_main6
NOP	
;Main.c,139 :: 		case 8: // [G17,G18,G19] Plane selection [report status set in GCODE]
L_main13:
;Main.c,140 :: 		case 16:// [G90,G91] Distance mode  [not conditioned here]
L_main14:
;Main.c,141 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,142 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,143 :: 		break;
J	L_main6
NOP	
;Main.c,144 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main15:
;Main.c,145 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,146 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,147 :: 		break;
J	L_main6
NOP	
;Main.c,148 :: 		case 64:// [G93,G94] Feed rate mode [not conditioned here]
L_main16:
;Main.c,149 :: 		case 128:// [G20,G21] Units [not conditioned here]
L_main17:
;Main.c,150 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,151 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,152 :: 		break;
J	L_main6
NOP	
;Main.c,153 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main18:
;Main.c,154 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,155 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,156 :: 		break;
J	L_main6
NOP	
;Main.c,157 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main19:
;Main.c,158 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(-1610602226)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,159 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,160 :: 		break;
J	L_main6
NOP	
;Main.c,161 :: 		case 1024: //$H Home all axis
L_main20:
;Main.c,163 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,168 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main162
NOP	
J	L_main21
NOP	
L__main162:
JAL	_Rst_modalgroup+0
NOP	
L_main21:
;Main.c,170 :: 		break;
J	L_main6
NOP	
;Main.c,171 :: 		}
L_main5:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main164
NOP	
J	L_main7
NOP	
L__main164:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main166
NOP	
J	L_main8
NOP	
L__main166:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main168
NOP	
J	L_main9
NOP	
L__main168:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__main170
NOP	
J	L_main13
NOP	
L__main170:
SEH	R3, R4
ORI	R2, R0, 16
BNE	R3, R2, L__main172
NOP	
J	L_main14
NOP	
L__main172:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main174
NOP	
J	L_main15
NOP	
L__main174:
SEH	R3, R4
ORI	R2, R0, 64
BNE	R3, R2, L__main176
NOP	
J	L_main16
NOP	
L__main176:
SEH	R3, R4
ORI	R2, R0, 128
BNE	R3, R2, L__main178
NOP	
J	L_main17
NOP	
L__main178:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main180
NOP	
J	L_main18
NOP	
L__main180:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main182
NOP	
J	L_main19
NOP	
L__main182:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main184
NOP	
J	L_main20
NOP	
L__main184:
L_main6:
;Main.c,172 :: 		}
L_main4:
;Main.c,211 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,214 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,217 :: 		if((old_state == 0 || SV.cir == 1) && (SV.mode_complete == 0)){// && (!SV.homed)){
LH	R2, Offset(Main_old_state+0)(GP)
BNE	R2, R0, L__main186
NOP	
J	L__main149
NOP	
L__main186:
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, 1, L__main187
NOP	
J	L__main148
NOP	
L__main187:
J	L_main26
NOP	
L__main149:
L__main148:
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__main188
NOP	
J	L__main150
NOP	
L__main188:
L__main143:
;Main.c,218 :: 		old_state = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_old_state+0)(GP)
;Main.c,219 :: 		SV.cir    = 0; //end of circle
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_SV+0)(GP)
;Main.c,220 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,223 :: 		report_status_message(status_of_gcode);
LH	R25, 0(SP)
JAL	_report_status_message+0
NOP	
;Main.c,231 :: 		}
L_main26:
;Main.c,217 :: 		if((old_state == 0 || SV.cir == 1) && (SV.mode_complete == 0)){// && (!SV.homed)){
L__main150:
;Main.c,232 :: 		if(SV.mode_complete > 0 && old_state != 0){
LH	R2, Offset(_SV+2)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__main189
NOP	
J	L__main152
NOP	
L__main189:
LH	R2, Offset(Main_old_state+0)(GP)
BNE	R2, R0, L__main191
NOP	
J	L__main151
NOP	
L__main191:
L__main142:
;Main.c,233 :: 		old_state = 0;
SH	R0, Offset(Main_old_state+0)(GP)
;Main.c,232 :: 		if(SV.mode_complete > 0 && old_state != 0){
L__main152:
L__main151:
;Main.c,237 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, 0(SP)
;Main.c,242 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,247 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main192
NOP	
J	L_main30
NOP	
L__main192:
;Main.c,248 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main30:
;Main.c,252 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,253 :: 		}
J	L_main0
NOP	
;Main.c,254 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,260 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,263 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,272 :: 		switch(action){
J	L_Main_Modal_Group_Actions031
NOP	
;Main.c,273 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions033:
;Main.c,274 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,276 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(-1610602114)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,277 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(-1610602114)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,278 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions035:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions0196:
;Main.c,279 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,280 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions037:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions037
NOP	
;Main.c,281 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,282 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions036:
;Main.c,283 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions034:
; i start address is: 20 (R5)
LH	R2, Offset(-1610602116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions0197:
;Main.c,284 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(-1610602116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,285 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions041:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,286 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,287 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions043:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions043
NOP	
;Main.c,288 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,289 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions042:
;Main.c,290 :: 		}
L_Main_Modal_Group_Actions040:
L_Main_Modal_Group_Actions039:
;Main.c,292 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,293 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,294 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions045:
;Main.c,307 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions0132
NOP	
L_Main_Modal_Group_Actions0200:
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions0131
NOP	
L_Main_Modal_Group_Actions0202:
L_Main_Modal_Group_Actions0130:
;Main.c,308 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,307 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0132:
L_Main_Modal_Group_Actions0131:
;Main.c,309 :: 		if (gc.L == 20) {
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0203
NOP	
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions0203:
;Main.c,311 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10576
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,313 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0205:
;Main.c,314 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,315 :: 		}
L_Main_Modal_Group_Actions050:
;Main.c,318 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(-1610602226)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0206:
;Main.c,319 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, 40960
ORI	R26, R26, 10576
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,320 :: 		}
L_Main_Modal_Group_Actions051:
;Main.c,322 :: 		} else {
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions049:
;Main.c,328 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(-1610602116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,329 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,330 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,334 :: 		axis_words = Get_Axisword();
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
;Main.c,335 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions053:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0207
NOP	
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions0207:
; axis_words end address is: 20 (R5)
;Main.c,336 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,338 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0208:
;Main.c,339 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,340 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions0209:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions057:
;Main.c,342 :: 		_flash = buffA[indx];
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
;Main.c,346 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,354 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,357 :: 		coord_data[i] = gc.next_position[i];
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
;Main.c,365 :: 		}
L_Main_Modal_Group_Actions058:
;Main.c,366 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,335 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,367 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions054:
;Main.c,369 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 28
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,372 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 28
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,373 :: 		}
L_Main_Modal_Group_Actions052:
;Main.c,375 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,376 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions059:
;Main.c,377 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions060:
;Main.c,380 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,389 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0211:
;Main.c,391 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions062:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0212
NOP	
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0212:
;Main.c,393 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions0214:
;Main.c,394 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0216:
;Main.c,395 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,396 :: 		} else {
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,397 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,398 :: 		}
L_Main_Modal_Group_Actions067:
;Main.c,399 :: 		} else {
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions065:
;Main.c,400 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,401 :: 		}
L_Main_Modal_Group_Actions068:
;Main.c,406 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
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
;Main.c,407 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions069:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions0218:
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions070:
;Main.c,391 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,408 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions063:
;Main.c,409 :: 		}
L_Main_Modal_Group_Actions061:
;Main.c,411 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 20 (R5)
ORI	R5, R0, 10
;Main.c,413 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0219
NOP	
J	L_Main_Modal_Group_Actions0133
NOP	
L_Main_Modal_Group_Actions0219:
ORI	R5, R0, 11
; temp end address is: 20 (R5)
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0133:
L_Main_Modal_Group_Actions071:
;Main.c,414 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 20 (R5)
SEH	R2, R5
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,417 :: 		for(j = 0;j<4;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions072:
; j start address is: 16 (R4)
; i start address is: 24 (R6)
; temp start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0220
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0220:
;Main.c,418 :: 		_data = buffA[i];
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,419 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,424 :: 		i++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,427 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,428 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions075:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0222
NOP	
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions0222:
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions076:
;Main.c,417 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,429 :: 		}
; i end address is: 12 (R3)
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
SEH	R6, R3
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions073:
;Main.c,431 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,432 :: 		case 16:
L_Main_Modal_Group_Actions077:
;Main.c,434 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,435 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0223
NOP	
J	L_Main_Modal_Group_Actions0134
NOP	
L_Main_Modal_Group_Actions0223:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0134:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions078:
;Main.c,436 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,437 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,438 :: 		case 53:
L_Main_Modal_Group_Actions079:
;Main.c,439 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,444 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions080:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0224
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0224:
; axis_words end address is: 20 (R5)
;Main.c,445 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0226
NOP	
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions0226:
;Main.c,446 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(-1610602236)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0227
NOP	
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0227:
;Main.c,447 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(-1610602235)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0228
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0228:
;Main.c,448 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,449 :: 		} else {
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions085:
;Main.c,450 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,451 :: 		}
L_Main_Modal_Group_Actions086:
;Main.c,452 :: 		} else {
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions084:
;Main.c,453 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,454 :: 		}
L_Main_Modal_Group_Actions087:
;Main.c,455 :: 		}
L_Main_Modal_Group_Actions083:
;Main.c,444 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,456 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions081:
;Main.c,457 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,458 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions088:
;Main.c,459 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,460 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0229
NOP	
J	L_Main_Modal_Group_Actions0135
NOP	
L_Main_Modal_Group_Actions0229:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions0135:
SEH	R2, R4
L_Main_Modal_Group_Actions089:
;Main.c,461 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,462 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,463 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions090:
;Main.c,464 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,466 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0230
NOP	
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0230:
; axis_words end address is: 20 (R5)
;Main.c,467 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,468 :: 		} else {
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions091:
;Main.c,472 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions093:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0231
NOP	
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions0231:
; axis_words end address is: 20 (R5)
;Main.c,473 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0233
NOP	
J	L_Main_Modal_Group_Actions096
NOP	
L_Main_Modal_Group_Actions0233:
;Main.c,474 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,475 :: 		}
L_Main_Modal_Group_Actions096:
;Main.c,472 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,476 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions094:
;Main.c,477 :: 		}
L_Main_Modal_Group_Actions092:
;Main.c,479 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions097:
;Main.c,481 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 10560
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,482 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,483 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions098:
ORI	R25, R0, 65535
;Main.c,484 :: 		break;
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,485 :: 		}
L_Main_Modal_Group_Actions031:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0235
NOP	
J	L_Main_Modal_Group_Actions033
NOP	
L_Main_Modal_Group_Actions0235:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0237
NOP	
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions0237:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0239
NOP	
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions0239:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0241
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0241:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0243
NOP	
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions0243:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0245
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0245:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0247
NOP	
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions0247:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0249
NOP	
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions0249:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0251
NOP	
J	L_Main_Modal_Group_Actions097
NOP	
L_Main_Modal_Group_Actions0251:
J	L_Main_Modal_Group_Actions098
NOP	
L_Main_Modal_Group_Actions032:
;Main.c,486 :: 		return action;
SEH	R2, R25
;Main.c,487 :: 		}
;Main.c,486 :: 		return action;
;Main.c,487 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,492 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,497 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions199
NOP	
;Main.c,498 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions1101:
;Main.c,499 :: 		SingleAxisStep(gc.next_position[X],gc.feed_rate,X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,500 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,501 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions1102:
;Main.c,502 :: 		SingleAxisStep(gc.next_position[Y],gc.feed_rate,Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,503 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,504 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions1103:
;Main.c,505 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602156)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,506 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,507 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions1104:
;Main.c,508 :: 		SingleAxisStep(gc.next_position[Z],gc.feed_rate,Z);
SH	R25, 12(SP)
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,509 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,510 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1105:
;Main.c,511 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,512 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,513 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1106:
;Main.c,514 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,515 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,516 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1107:
;Main.c,517 :: 		SingleAxisStep(gc.next_position[A],gc.feed_rate,A);
SH	R25, 12(SP)
ORI	R25, R0, 3
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602148)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,518 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,519 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1108:
;Main.c,520 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,521 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,522 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1109:
;Main.c,523 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,524 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,525 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1110:
;Main.c,526 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,527 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,528 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1111:
;Main.c,529 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,530 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
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
;Main.c,531 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,532 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1112:
;Main.c,533 :: 		axis_to_home = _Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	__Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,534 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,539 :: 		if(axis_to_home < 3){
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions1253
NOP	
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1253:
;Main.c,542 :: 		if (sys.abort) {
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1255
NOP	
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1255:
;Main.c,543 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,544 :: 		}
L_Main_Modal_Group_Actions1114:
;Main.c,545 :: 		}else{
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1113:
;Main.c,546 :: 		int l = 0;
;Main.c,548 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,549 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,550 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,551 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1116:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1256
NOP	
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions1256:
;Main.c,554 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Main.c,555 :: 		sys.position[l] = STPS[l].steps_abs_position;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 13576
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
LW	R2, 0(R2)
SW	R2, 0(R4)
;Main.c,558 :: 		if(STPS[l].run_state != STOP)
SEH	R3, R5
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions1258
NOP	
J	L_Main_Modal_Group_Actions1119
NOP	
L_Main_Modal_Group_Actions1258:
;Main.c,559 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1119:
;Main.c,551 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,560 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1116
NOP	
L_Main_Modal_Group_Actions1117:
;Main.c,563 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,566 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1120:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1260
NOP	
J	L_Main_Modal_Group_Actions1121
NOP	
L_Main_Modal_Group_Actions1260:
;Main.c,567 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1120
NOP	
L_Main_Modal_Group_Actions1121:
;Main.c,570 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
;Main.c,571 :: 		SV.mode_complete = 0;
SH	R0, Offset(_SV+2)(GP)
;Main.c,572 :: 		}
L_Main_Modal_Group_Actions1115:
;Main.c,573 :: 		break;
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,574 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1122:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,576 :: 		}
L_Main_Modal_Group_Actions199:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1262
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1262:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1264
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1264:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1266
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1266:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1268
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1268:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1270
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1270:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1272
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1272:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1274
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1274:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1276
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1276:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1278
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1278:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1280
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1280:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1282
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1282:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1284
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1284:
J	L_Main_Modal_Group_Actions1122
NOP	
L_Main_Modal_Group_Actions1100:
;Main.c,578 :: 		return action;
SEH	R2, R25
;Main.c,579 :: 		}
;Main.c,578 :: 		return action;
;Main.c,579 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,585 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,587 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(-1610602237)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3286
NOP	
J	L_Main_Modal_Group_Actions3123
NOP	
L_Main_Modal_Group_Actions3286:
;Main.c,588 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3123:
;Main.c,590 :: 		return action;
SEH	R2, R25
;Main.c,591 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,596 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,602 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4288
NOP	
J	L_Main_Modal_Group_Actions4138
NOP	
L_Main_Modal_Group_Actions4288:
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4289
NOP	
J	L_Main_Modal_Group_Actions4137
NOP	
L_Main_Modal_Group_Actions4289:
J	L_Main_Modal_Group_Actions4126
NOP	
L_Main_Modal_Group_Actions4138:
L_Main_Modal_Group_Actions4137:
;Main.c,603 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4126:
;Main.c,604 :: 		SV.mode_complete = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,605 :: 		return action;
SEH	R2, R25
;Main.c,606 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,611 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,616 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(-1610602234)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7291
NOP	
J	L_Main_Modal_Group_Actions7141
NOP	
L_Main_Modal_Group_Actions7291:
LBU	R2, Offset(-1610602234)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7292
NOP	
J	L_Main_Modal_Group_Actions7140
NOP	
L_Main_Modal_Group_Actions7292:
J	L_Main_Modal_Group_Actions7129
NOP	
L_Main_Modal_Group_Actions7141:
L_Main_Modal_Group_Actions7140:
;Main.c,617 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7129:
;Main.c,618 :: 		SV.mode_complete = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,619 :: 		return action;
SEH	R2, R25
;Main.c,620 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,625 :: 		static int Modal_Group_Actions12(int action){
;Main.c,630 :: 		return action;
SEH	R2, R25
;Main.c,631 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
