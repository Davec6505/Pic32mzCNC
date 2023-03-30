_Conditin_Externs:
;Main.c,55 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,56 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,57 :: 		plan_init(settings.acceleration,settings.acceleration);
LWC1	S13, Offset(-1610602456)(GP)
LWC1	S12, Offset(-1610602456)(GP)
JAL	_plan_init+0
NOP	
;Main.c,58 :: 		Init_Protocol();
JAL	_Init_Protocol+0
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
ADDIU	SP, SP, -36
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
;Main.c,92 :: 		status_of_gcode == STATUS_OK){
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
;Main.c,93 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 2(SP)
;Main.c,95 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,102 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,103 :: 		case 0:FAIL(STATUS_OK);break;
L_main7:
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
J	L_main6
NOP	
;Main.c,104 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,105 :: 		modal_action = Modal_Group_Actions0(Get_non_modalword());
JAL	_Get_non_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,106 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,107 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,108 :: 		break;
J	L_main6
NOP	
;Main.c,109 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,110 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,112 :: 		if(axis_to_run){
BNE	R2, R0, L__main160
NOP	
J	L_main10
NOP	
L__main160:
;Main.c,115 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 31
JAL	_EnableSteppers+0
NOP	
;Main.c,116 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 2(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,117 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 2(SP)
;Main.c,118 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,119 :: 		}else{
J	L_main11
NOP	
L_main10:
;Main.c,120 :: 		int report = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,121 :: 		if(!report){
BEQ	R2, R0, L__main161
NOP	
J	L_main12
NOP	
L__main161:
;Main.c,122 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,123 :: 		SET_FAIL(STATUS_NO_REPORT);
ORI	R25, R0, 99
JAL	_SET_FAIL+0
NOP	
;Main.c,124 :: 		}
L_main12:
;Main.c,125 :: 		}
L_main11:
;Main.c,126 :: 		break;
J	L_main6
NOP	
;Main.c,127 :: 		case 8: // [G17,G18,G19] Plane selection [report status set in GCODE]
L_main13:
;Main.c,128 :: 		case 16:// [G90,G91] Distance mode  [not conditioned here]
L_main14:
;Main.c,129 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,130 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,131 :: 		break;
J	L_main6
NOP	
;Main.c,132 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main15:
;Main.c,133 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,134 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,135 :: 		break;
J	L_main6
NOP	
;Main.c,136 :: 		case 64:// [G93,G94] Feed rate mode [not conditioned here]
L_main16:
;Main.c,137 :: 		case 128:// [G20,G21] Units [not conditioned here]
L_main17:
;Main.c,138 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,139 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,140 :: 		break;
J	L_main6
NOP	
;Main.c,141 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main18:
;Main.c,142 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,143 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,144 :: 		break;
J	L_main6
NOP	
;Main.c,145 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main19:
;Main.c,146 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,147 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,148 :: 		break;
J	L_main6
NOP	
;Main.c,149 :: 		case 1024: //$H Home all axis
L_main20:
;Main.c,151 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,156 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main162
NOP	
J	L_main21
NOP	
L__main162:
JAL	_Rst_modalgroup+0
NOP	
L_main21:
;Main.c,157 :: 		break;
J	L_main6
NOP	
;Main.c,158 :: 		}
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
;Main.c,159 :: 		}
L_main4:
;Main.c,161 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed){
JAL	_Get_Axis_Enable_States+0
NOP	
BEQ	R2, R0, L__main185
NOP	
J	L__main150
NOP	
L__main185:
LH	R2, Offset(_SV+4)(GP)
BNE	R2, R0, L__main187
NOP	
J	L__main149
NOP	
L__main187:
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__main188
NOP	
J	L__main148
NOP	
L__main188:
L__main144:
;Main.c,171 :: 		report_status_message(status_of_gcode);
LH	R25, 0(SP)
JAL	_report_status_message+0
NOP	
;Main.c,173 :: 		SV.Tog = 0;
SH	R0, Offset(_SV+4)(GP)
;Main.c,161 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed){
L__main150:
L__main149:
L__main148:
;Main.c,178 :: 		if(!SV.Tog){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__main189
NOP	
J	L_main25
NOP	
L__main189:
;Main.c,179 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LH	R2, Offset(_STPS+4)(GP)
BEQ	R2, R0, L__main190
NOP	
J	L__main152
NOP	
L__main190:
LH	R2, Offset(_STPS+104)(GP)
BEQ	R2, R0, L__main191
NOP	
J	L__main151
NOP	
L__main191:
J	L_main28
NOP	
L__main152:
L__main151:
;Main.c,180 :: 		while(DMA_IsOn(1));
L_main29:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main193
NOP	
J	L_main30
NOP	
L__main193:
J	L_main29
NOP	
L_main30:
;Main.c,186 :: 		,(STPS[Y].run_state&0xff)
LH	R2, Offset(_STPS+104)(GP)
ANDI	R5, R2, 255
;Main.c,183 :: 		,(STPS[X].run_state&0xff)
LH	R2, Offset(_STPS+4)(GP)
ANDI	R4, R2, 255
;Main.c,182 :: 		run_state:= %d\t%l\t%l\t%d\t%l\t%l\n"
ADDIU	R23, SP, 4
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 4
;Main.c,188 :: 		,STPS[Y].dist);
LW	R2, Offset(_STPS+148)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
;Main.c,187 :: 		,STPS[Y].step_count
LW	R2, Offset(_STPS+144)(GP)
SW	R2, 20(SP)
;Main.c,186 :: 		,(STPS[Y].run_state&0xff)
SH	R5, 16(SP)
;Main.c,185 :: 		,STPS[X].dist
LW	R2, Offset(_STPS+48)(GP)
SW	R2, 12(SP)
;Main.c,184 :: 		,STPS[X].step_count
LW	R2, Offset(_STPS+44)(GP)
SW	R2, 8(SP)
;Main.c,183 :: 		,(STPS[X].run_state&0xff)
SH	R4, 4(SP)
;Main.c,182 :: 		run_state:= %d\t%l\t%l\t%d\t%l\t%l\n"
SW	R3, 0(SP)
;Main.c,188 :: 		,STPS[Y].dist);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,189 :: 		}
L_main28:
;Main.c,190 :: 		}
L_main25:
;Main.c,194 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,197 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,200 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, 0(SP)
;Main.c,212 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,217 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main194
NOP	
J	L_main31
NOP	
L__main194:
;Main.c,218 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main31:
;Main.c,222 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,223 :: 		}
J	L_main0
NOP	
;Main.c,224 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,230 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,233 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,242 :: 		switch(action){
J	L_Main_Modal_Group_Actions032
NOP	
;Main.c,243 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions034:
;Main.c,244 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,246 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+122)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0197:
;Main.c,247 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+122)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,248 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions036:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,249 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,250 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions038:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions038
NOP	
;Main.c,251 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,252 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions037:
;Main.c,253 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions035:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+120)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0199
NOP	
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions0199:
;Main.c,254 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+120)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,255 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions042:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions0200:
;Main.c,256 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,257 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions044:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions044
NOP	
;Main.c,258 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,259 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions043:
;Main.c,260 :: 		}
L_Main_Modal_Group_Actions041:
L_Main_Modal_Group_Actions040:
;Main.c,261 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,262 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,263 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions046:
;Main.c,276 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions0133
NOP	
L_Main_Modal_Group_Actions0202:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0204
NOP	
J	L_Main_Modal_Group_Actions0132
NOP	
L_Main_Modal_Group_Actions0204:
L_Main_Modal_Group_Actions0131:
;Main.c,277 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,276 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0133:
L_Main_Modal_Group_Actions0132:
;Main.c,278 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0205:
;Main.c,280 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,282 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0207
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0207:
;Main.c,283 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,284 :: 		}
L_Main_Modal_Group_Actions051:
;Main.c,287 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions0208:
;Main.c,288 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,289 :: 		}
L_Main_Modal_Group_Actions052:
;Main.c,291 :: 		} else {
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions050:
;Main.c,297 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+120)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,298 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,299 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,303 :: 		axis_words = Get_Axisword();
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
;Main.c,304 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions054:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0209:
; axis_words end address is: 20 (R5)
;Main.c,305 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,307 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions0210:
;Main.c,308 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,309 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions0211:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions058:
;Main.c,311 :: 		_flash = buffA[indx];
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
;Main.c,315 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,323 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions057:
;Main.c,326 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,334 :: 		}
L_Main_Modal_Group_Actions059:
;Main.c,335 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,304 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,336 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions055:
;Main.c,338 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 28
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,341 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 28
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,342 :: 		}
L_Main_Modal_Group_Actions053:
;Main.c,344 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,345 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions060:
;Main.c,346 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions061:
;Main.c,349 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,358 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0213
NOP	
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions0213:
;Main.c,360 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions063:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions0214:
;Main.c,362 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0216:
;Main.c,363 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0218:
;Main.c,364 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,365 :: 		} else {
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions067:
;Main.c,366 :: 		gc.next_position[i] += gc.position[i];
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,367 :: 		}
L_Main_Modal_Group_Actions068:
;Main.c,368 :: 		} else {
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,369 :: 		gc.next_position[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,370 :: 		}
L_Main_Modal_Group_Actions069:
;Main.c,375 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(-1610602476)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SH	R6, 12(SP)
SH	R5, 14(SP)
SH	R25, 16(SP)
SEH	R26, R5
MOVZ	R25, R4, R0
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
;Main.c,376 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions070:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0220
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0220:
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions071:
;Main.c,360 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,377 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions064:
;Main.c,378 :: 		}
L_Main_Modal_Group_Actions062:
;Main.c,380 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 10
;Main.c,382 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0221
NOP	
J	L_Main_Modal_Group_Actions0134
NOP	
L_Main_Modal_Group_Actions0221:
ORI	R6, R0, 11
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0134:
L_Main_Modal_Group_Actions072:
;Main.c,383 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,386 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Main_Modal_Group_Actions073:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0222
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0222:
;Main.c,387 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,388 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R6
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 44(SP)
SH	R6, 12(SP)
; _data end address is: 28 (R7)
SH	R4, 14(SP)
SH	R5, 16(SP)
SH	R25, 18(SP)
MOVZ	R25, R7, R0
JAL	_ulong2flt+0
NOP	
LH	R25, 18(SP)
LH	R5, 16(SP)
LH	R4, 14(SP)
LH	R6, 12(SP)
LW	R2, 44(SP)
SWC1	S0, 0(R2)
;Main.c,393 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,396 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(-1610602476)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R6
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
SH	R7, 12(SP)
SH	R6, 14(SP)
SH	R5, 16(SP)
SH	R25, 18(SP)
SEH	R26, R5
MOVZ	R25, R4, R0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
; temp end address is: 24 (R6)
; i end address is: 28 (R7)
; j end address is: 20 (R5)
LH	R25, 18(SP)
LH	R5, 16(SP)
LH	R6, 14(SP)
LH	R7, 12(SP)
SEH	R4, R6
SEH	R3, R7
;Main.c,397 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions076:
; i start address is: 12 (R3)
; temp start address is: 16 (R4)
; j start address is: 20 (R5)
SH	R5, 12(SP)
SH	R4, 14(SP)
SH	R3, 16(SP)
SH	R25, 18(SP)
SEH	R25, R5
JAL	_GET_RunState+0
NOP	
LH	R25, 18(SP)
LH	R3, 16(SP)
LH	R4, 14(SP)
LH	R5, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0224
NOP	
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions0224:
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions077:
;Main.c,386 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,398 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions074:
;Main.c,400 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,401 :: 		case 16:
L_Main_Modal_Group_Actions078:
;Main.c,403 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,404 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0225
NOP	
J	L_Main_Modal_Group_Actions0135
NOP	
L_Main_Modal_Group_Actions0225:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0135:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions079:
;Main.c,405 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,406 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,407 :: 		case 53:
L_Main_Modal_Group_Actions080:
;Main.c,408 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,413 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions081:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0226
NOP	
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions0226:
; axis_words end address is: 20 (R5)
;Main.c,414 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0228
NOP	
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0228:
;Main.c,415 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0229
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0229:
;Main.c,416 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0230
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0230:
;Main.c,417 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,418 :: 		} else {
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions086:
;Main.c,419 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,420 :: 		}
L_Main_Modal_Group_Actions087:
;Main.c,421 :: 		} else {
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions085:
;Main.c,422 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,423 :: 		}
L_Main_Modal_Group_Actions088:
;Main.c,424 :: 		}
L_Main_Modal_Group_Actions084:
;Main.c,413 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,425 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions082:
;Main.c,426 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,427 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions089:
;Main.c,428 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,429 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0231
NOP	
J	L_Main_Modal_Group_Actions0136
NOP	
L_Main_Modal_Group_Actions0231:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions0136:
SEH	R2, R4
L_Main_Modal_Group_Actions090:
;Main.c,430 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,431 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,432 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions091:
;Main.c,433 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,435 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0232
NOP	
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions0232:
; axis_words end address is: 20 (R5)
;Main.c,436 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,437 :: 		} else {
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions092:
;Main.c,441 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions094:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0233
NOP	
J	L_Main_Modal_Group_Actions095
NOP	
L_Main_Modal_Group_Actions0233:
; axis_words end address is: 20 (R5)
;Main.c,442 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0235
NOP	
J	L_Main_Modal_Group_Actions097
NOP	
L_Main_Modal_Group_Actions0235:
;Main.c,443 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+60)
ORI	R2, R2, lo_addr(_gc+60)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S1, S1, S0
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Main.c,444 :: 		}
L_Main_Modal_Group_Actions097:
;Main.c,441 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,445 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions095:
;Main.c,446 :: 		}
L_Main_Modal_Group_Actions093:
;Main.c,448 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions098:
;Main.c,450 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+60)
ORI	R25, R25, lo_addr(_gc+60)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,451 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,452 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions099:
ORI	R25, R0, 65535
;Main.c,453 :: 		break;
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,454 :: 		}
L_Main_Modal_Group_Actions032:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0237
NOP	
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions0237:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0239
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0239:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0241
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0241:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0243
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0243:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0245
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0245:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0247
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0247:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0249
NOP	
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions0249:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0251
NOP	
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0251:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0253
NOP	
J	L_Main_Modal_Group_Actions098
NOP	
L_Main_Modal_Group_Actions0253:
J	L_Main_Modal_Group_Actions099
NOP	
L_Main_Modal_Group_Actions033:
;Main.c,455 :: 		return action;
SEH	R2, R25
;Main.c,456 :: 		}
;Main.c,455 :: 		return action;
;Main.c,456 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,461 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,466 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions1100
NOP	
;Main.c,467 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions1102:
;Main.c,468 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,469 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,470 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions1103:
;Main.c,471 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,472 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,473 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions1104:
;Main.c,474 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,475 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,476 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions1105:
;Main.c,477 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,478 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,479 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1106:
;Main.c,480 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,481 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,482 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1107:
;Main.c,483 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,484 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,485 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1108:
;Main.c,486 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+88)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,487 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,488 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1109:
;Main.c,489 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,490 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,491 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1110:
;Main.c,492 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,493 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,494 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1111:
;Main.c,495 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,496 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,497 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1112:
;Main.c,498 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,499 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
LH	R27, Offset(_gc+124)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S15, Offset(_gc+80)(GP)
LWC1	S14, Offset(_gc+76)(GP)
LWC1	S13, Offset(_gc+32)(GP)
LWC1	S12, Offset(_gc+28)(GP)
LW	R2, Offset(_gc+116)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LW	R2, Offset(_gc+112)(GP)
SW	R2, 8(SP)
LW	R2, Offset(_gc+108)(GP)
SW	R2, 4(SP)
LW	R2, Offset(_gc+104)(GP)
SW	R2, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 12(SP)
;Main.c,500 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,501 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1113:
;Main.c,502 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,503 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,508 :: 		if(axis_to_home < 2){
SEH	R2, R2
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1255
NOP	
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1255:
;Main.c,511 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1257
NOP	
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1257:
;Main.c,512 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,513 :: 		}
L_Main_Modal_Group_Actions1115:
;Main.c,514 :: 		}else{
J	L_Main_Modal_Group_Actions1116
NOP	
L_Main_Modal_Group_Actions1114:
;Main.c,515 :: 		int l = 0;
;Main.c,517 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,518 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,519 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,520 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1117:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1258
NOP	
J	L_Main_Modal_Group_Actions1118
NOP	
L_Main_Modal_Group_Actions1258:
;Main.c,523 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
SW	R0, 0(R2)
;Main.c,524 :: 		sys.position[l] = STPS[l].steps_abs_position;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_sys+8)
ORI	R2, R2, lo_addr(_sys+8)
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 84
LW	R2, 0(R2)
SW	R2, 0(R4)
;Main.c,527 :: 		if(STPS[l].run_state != STOP)
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions1260
NOP	
J	L_Main_Modal_Group_Actions1120
NOP	
L_Main_Modal_Group_Actions1260:
;Main.c,528 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1120:
;Main.c,520 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,529 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions1118:
;Main.c,532 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,535 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1121:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1262
NOP	
J	L_Main_Modal_Group_Actions1122
NOP	
L_Main_Modal_Group_Actions1262:
;Main.c,536 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1121
NOP	
L_Main_Modal_Group_Actions1122:
;Main.c,539 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Main.c,540 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Main.c,541 :: 		}
L_Main_Modal_Group_Actions1116:
;Main.c,542 :: 		break;
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,543 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1123:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,545 :: 		}
L_Main_Modal_Group_Actions1100:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1264
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1264:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1266
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1266:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1268
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1268:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1270
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1270:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1272
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1272:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1274
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1274:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1276
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1276:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1278
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1278:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1280
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1280:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1282
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1282:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1284
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1284:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1286
NOP	
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1286:
J	L_Main_Modal_Group_Actions1123
NOP	
L_Main_Modal_Group_Actions1101:
;Main.c,547 :: 		return action;
SEH	R2, R25
;Main.c,548 :: 		}
;Main.c,547 :: 		return action;
;Main.c,548 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,554 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,556 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(_gc+3)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3288
NOP	
J	L_Main_Modal_Group_Actions3124
NOP	
L_Main_Modal_Group_Actions3288:
;Main.c,557 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3124:
;Main.c,559 :: 		return action;
SEH	R2, R25
;Main.c,560 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,565 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,571 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4290
NOP	
J	L_Main_Modal_Group_Actions4139
NOP	
L_Main_Modal_Group_Actions4290:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4291
NOP	
J	L_Main_Modal_Group_Actions4138
NOP	
L_Main_Modal_Group_Actions4291:
J	L_Main_Modal_Group_Actions4127
NOP	
L_Main_Modal_Group_Actions4139:
L_Main_Modal_Group_Actions4138:
;Main.c,572 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4127:
;Main.c,574 :: 		return action;
SEH	R2, R25
;Main.c,575 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,580 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,585 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7293
NOP	
J	L_Main_Modal_Group_Actions7142
NOP	
L_Main_Modal_Group_Actions7293:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7294
NOP	
J	L_Main_Modal_Group_Actions7141
NOP	
L_Main_Modal_Group_Actions7294:
J	L_Main_Modal_Group_Actions7130
NOP	
L_Main_Modal_Group_Actions7142:
L_Main_Modal_Group_Actions7141:
;Main.c,586 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7130:
;Main.c,588 :: 		return action;
SEH	R2, R25
;Main.c,589 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,594 :: 		static int Modal_Group_Actions12(int action){
;Main.c,599 :: 		return action;
SEH	R2, R25
;Main.c,600 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
