_Conditin_Externs:
;Main.c,57 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,58 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,59 :: 		plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
LUI	R3, 17820
ORI	R3, R3, 16384
LUI	R2, 17820
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_plan_init+0
NOP	
;Main.c,60 :: 		Init_Protocol();
JAL	_Init_Protocol+0
NOP	
;Main.c,61 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Main.c,62 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,63 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,65 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,66 :: 		}
L_end_Conditin_Externs:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,70 :: 		void main() {
ADDIU	SP, SP, -108
;Main.c,71 :: 		int error = 0;
;Main.c,72 :: 		int has_flash = 0;
;Main.c,73 :: 		int modal_group = 0;
;Main.c,74 :: 		int modal_action = 0;
;Main.c,79 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,81 :: 		cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, 0(SP)
;Main.c,83 :: 		while(1){
L_main0:
;Main.c,86 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,87 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,88 :: 		Debounce_Limits(Z);
ORI	R25, R0, 2
JAL	_Debounce_Limits+0
NOP	
;Main.c,97 :: 		status_of_gcode == STATUS_OK){
LH	R3, 0(SP)
ORI	R2, R0, 20
BNE	R3, R2, L__main156
NOP	
J	L__main148
NOP	
L__main156:
LH	R2, 0(SP)
BNE	R2, R0, L__main158
NOP	
J	L__main147
NOP	
L__main158:
J	L_main4
NOP	
L__main148:
L__main147:
;Main.c,98 :: 		int axis_to_run = 0;
;Main.c,100 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,107 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,108 :: 		case 0:break;
L_main7:
J	L_main6
NOP	
;Main.c,109 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,110 :: 		modal_action = Modal_Group_Actions0(Get_non_modalword());
JAL	_Get_non_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,111 :: 		modal_action = modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,112 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,113 :: 		break;
J	L_main6
NOP	
;Main.c,114 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,115 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 104(SP)
;Main.c,117 :: 		if(axis_to_run){
BNE	R2, R0, L__main160
NOP	
J	L_main10
NOP	
L__main160:
;Main.c,120 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 31
JAL	_EnableSteppers+0
NOP	
;Main.c,121 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 104(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,122 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,123 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,124 :: 		}else{
J	L_main11
NOP	
L_main10:
;Main.c,125 :: 		int report = GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,126 :: 		if(!report){
BEQ	R2, R0, L__main161
NOP	
J	L_main12
NOP	
L__main161:
;Main.c,127 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,128 :: 		SET_FAIL(STATUS_NO_REPORT);
ORI	R25, R0, 99
JAL	_SET_FAIL+0
NOP	
;Main.c,129 :: 		}
L_main12:
;Main.c,130 :: 		}
L_main11:
;Main.c,131 :: 		break;
J	L_main6
NOP	
;Main.c,132 :: 		case 8: // [G17,G18,G19] Plane selection [report status set in GCODE]
L_main13:
;Main.c,133 :: 		case 16:// [G90,G91] Distance mode  [not conditioned here]
L_main14:
;Main.c,134 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,135 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,136 :: 		break;
J	L_main6
NOP	
;Main.c,137 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main15:
;Main.c,138 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,139 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,140 :: 		break;
J	L_main6
NOP	
;Main.c,141 :: 		case 64:// [G93,G94] Feed rate mode [not conditioned here]
L_main16:
;Main.c,142 :: 		case 128:// [G20,G21] Units [not conditioned here]
L_main17:
;Main.c,143 :: 		report_status_message(GET_FAIL());
JAL	_GET_FAIL+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,144 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,145 :: 		break;
J	L_main6
NOP	
;Main.c,146 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main18:
;Main.c,147 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,148 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,149 :: 		break;
J	L_main6
NOP	
;Main.c,150 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main19:
;Main.c,151 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(-1610602226)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,152 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,153 :: 		break;
J	L_main6
NOP	
;Main.c,154 :: 		case 1024: //$H Home all axis
L_main20:
;Main.c,156 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,161 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main162
NOP	
J	L_main21
NOP	
L__main162:
JAL	_Rst_modalgroup+0
NOP	
L_main21:
;Main.c,163 :: 		break;
J	L_main6
NOP	
;Main.c,164 :: 		}
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
;Main.c,165 :: 		}
L_main4:
;Main.c,169 :: 		if(SV.mode_complete){
LH	R2, Offset(_SV+2)(GP)
BNE	R2, R0, L__main186
NOP	
J	L_main22
NOP	
L__main186:
;Main.c,171 :: 		if(!DMA_IsOn(1)){
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BEQ	R2, R0, L__main187
NOP	
J	L_main23
NOP	
L__main187:
;Main.c,183 :: 		,(SV.mode_complete&0x00FF));
LH	R2, Offset(_SV+2)(GP)
ANDI	R2, R2, 255
;Main.c,173 :: 		%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%d\n"
ADDIU	R23, SP, 2
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 2
;Main.c,183 :: 		,(SV.mode_complete&0x00FF));
ADDIU	SP, SP, -44
SH	R2, 40(SP)
;Main.c,182 :: 		,STPS[Z].step_delay
LW	R2, Offset(-1610600032)(GP)
SW	R2, 36(SP)
;Main.c,181 :: 		,STPS[Z].accel_count
LW	R2, Offset(-1610600016)(GP)
SW	R2, 32(SP)
;Main.c,180 :: 		,STPS[Z].step_count
LW	R2, Offset(-1610600008)(GP)
SW	R2, 28(SP)
;Main.c,179 :: 		,STPS[Y].step_delay
LW	R2, Offset(-1610600108)(GP)
SW	R2, 24(SP)
;Main.c,178 :: 		,STPS[Y].accel_count
LW	R2, Offset(-1610600092)(GP)
SW	R2, 20(SP)
;Main.c,177 :: 		,STPS[Y].step_count
LW	R2, Offset(-1610600084)(GP)
SW	R2, 16(SP)
;Main.c,176 :: 		,STPS[X].step_delay
LW	R2, Offset(-1610600184)(GP)
SW	R2, 12(SP)
;Main.c,175 :: 		,STPS[X].accel_count
LW	R2, Offset(-1610600168)(GP)
SW	R2, 8(SP)
;Main.c,174 :: 		,STPS[X].step_count
LW	R2, Offset(-1610600160)(GP)
SW	R2, 4(SP)
;Main.c,173 :: 		%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%d\n"
SW	R3, 0(SP)
;Main.c,183 :: 		,(SV.mode_complete&0x00FF));
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 44
;Main.c,184 :: 		}
L_main23:
;Main.c,185 :: 		}
L_main22:
;Main.c,203 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,206 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,209 :: 		if((old_state == 0) && (SV.mode_complete == 0)){// && (!SV.homed)){
LH	R2, Offset(Main_old_state+0)(GP)
BEQ	R2, R0, L__main188
NOP	
J	L__main150
NOP	
L__main188:
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__main189
NOP	
J	L__main149
NOP	
L__main189:
L__main145:
;Main.c,210 :: 		old_state = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_old_state+0)(GP)
;Main.c,211 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,214 :: 		report_status_message(status_of_gcode);
LH	R25, 0(SP)
JAL	_report_status_message+0
NOP	
;Main.c,217 :: 		while(DMA_IsOn(1));
L_main27:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main191
NOP	
J	L_main28
NOP	
L__main191:
J	L_main27
NOP	
L_main28:
;Main.c,218 :: 		dma_printf("old_state:= %d\tSV.mode_complete:= %d\tstepX:= %l\tstepY:= %l\tstepZ= %l\n"
ADDIU	R23, SP, 33
ADDIU	R22, R23, 70
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 33
;Main.c,220 :: 		,STPS[Y].step_count,STPS[Z].step_count);
LW	R2, Offset(-1610600008)(GP)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LW	R2, Offset(-1610600084)(GP)
SW	R2, 16(SP)
;Main.c,219 :: 		,old_state ,SV.mode_complete,STPS[X].step_count
LW	R2, Offset(-1610600160)(GP)
SW	R2, 12(SP)
LH	R2, Offset(_SV+2)(GP)
SH	R2, 8(SP)
LH	R2, Offset(Main_old_state+0)(GP)
SH	R2, 4(SP)
;Main.c,218 :: 		dma_printf("old_state:= %d\tSV.mode_complete:= %d\tstepX:= %l\tstepY:= %l\tstepZ= %l\n"
SW	R3, 0(SP)
;Main.c,220 :: 		,STPS[Y].step_count,STPS[Z].step_count);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 24
;Main.c,209 :: 		if((old_state == 0) && (SV.mode_complete == 0)){// && (!SV.homed)){
L__main150:
L__main149:
;Main.c,223 :: 		if(SV.mode_complete > 0 && old_state != 0){
LH	R2, Offset(_SV+2)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__main192
NOP	
J	L__main152
NOP	
L__main192:
LH	R2, Offset(Main_old_state+0)(GP)
BNE	R2, R0, L__main194
NOP	
J	L__main151
NOP	
L__main194:
L__main144:
;Main.c,224 :: 		old_state = 0;
SH	R0, Offset(Main_old_state+0)(GP)
;Main.c,223 :: 		if(SV.mode_complete > 0 && old_state != 0){
L__main152:
L__main151:
;Main.c,228 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, 0(SP)
;Main.c,233 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,238 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main195
NOP	
J	L_main32
NOP	
L__main195:
;Main.c,239 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main32:
;Main.c,243 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,244 :: 		}
J	L_main0
NOP	
;Main.c,245 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,251 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Main.c,254 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,263 :: 		switch(action){
J	L_Main_Modal_Group_Actions033
NOP	
;Main.c,264 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions035:
;Main.c,265 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,267 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(-1610602114)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,268 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(-1610602114)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,269 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions037:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0199
NOP	
J	L_Main_Modal_Group_Actions038
NOP	
L_Main_Modal_Group_Actions0199:
;Main.c,270 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,271 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions039:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions039
NOP	
;Main.c,272 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,273 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions038:
;Main.c,274 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions036:
; i start address is: 20 (R5)
LH	R2, Offset(-1610602116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions0200:
;Main.c,275 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(-1610602116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,276 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions043:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0201
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0201:
;Main.c,277 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,278 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions045:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions045
NOP	
;Main.c,279 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,280 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions044:
;Main.c,281 :: 		}
L_Main_Modal_Group_Actions042:
L_Main_Modal_Group_Actions041:
;Main.c,283 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,284 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,285 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions047:
;Main.c,298 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0203
NOP	
J	L_Main_Modal_Group_Actions0134
NOP	
L_Main_Modal_Group_Actions0203:
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions0133
NOP	
L_Main_Modal_Group_Actions0205:
L_Main_Modal_Group_Actions0132:
;Main.c,299 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,298 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0134:
L_Main_Modal_Group_Actions0133:
;Main.c,300 :: 		if (gc.L == 20) {
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0206:
;Main.c,302 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10576
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,304 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions0208:
;Main.c,305 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,306 :: 		}
L_Main_Modal_Group_Actions052:
;Main.c,309 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(-1610602226)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0209:
;Main.c,310 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, 40960
ORI	R26, R26, 10576
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,311 :: 		}
L_Main_Modal_Group_Actions053:
;Main.c,313 :: 		} else {
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions051:
;Main.c,319 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(-1610602116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,320 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,321 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,325 :: 		axis_words = Get_Axisword();
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
;Main.c,326 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions055:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0210:
; axis_words end address is: 20 (R5)
;Main.c,327 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,329 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions0211:
;Main.c,330 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,331 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0212
NOP	
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions0212:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions059:
;Main.c,333 :: 		_flash = buffA[indx];
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
; _flash start address is: 32 (R8)
MOVZ	R8, R2, R0
;Main.c,337 :: 		coord_data[i] = ulong2flt(_flash);
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 40(SP)
SH	R4, 12(SP)
; _flash end address is: 32 (R8)
SH	R7, 14(SP)
SH	R5, 16(SP)
SH	R6, 18(SP)
SH	R25, 20(SP)
MOVZ	R25, R8, R0
JAL	_ulong2flt+0
NOP	
LH	R25, 20(SP)
LH	R6, 18(SP)
LH	R5, 16(SP)
LH	R7, 14(SP)
LH	R4, 12(SP)
LW	R2, 40(SP)
SWC1	S0, 0(R2)
;Main.c,345 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions058:
;Main.c,348 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,356 :: 		}
L_Main_Modal_Group_Actions060:
;Main.c,357 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,326 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,358 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,360 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(-1610602116)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,363 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,364 :: 		}
L_Main_Modal_Group_Actions054:
;Main.c,366 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,367 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions061:
;Main.c,368 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions062:
;Main.c,371 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,380 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0214:
;Main.c,382 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions064:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0215
NOP	
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions0215:
;Main.c,384 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0217
NOP	
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0217:
;Main.c,385 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0219
NOP	
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0219:
;Main.c,386 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,387 :: 		} else {
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions068:
;Main.c,388 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,389 :: 		}
L_Main_Modal_Group_Actions069:
;Main.c,390 :: 		} else {
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions067:
;Main.c,391 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,392 :: 		}
L_Main_Modal_Group_Actions070:
;Main.c,397 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
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
;Main.c,398 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions071:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0221
NOP	
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0221:
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions072:
;Main.c,382 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,399 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions065:
;Main.c,400 :: 		}
L_Main_Modal_Group_Actions063:
;Main.c,402 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 20 (R5)
ORI	R5, R0, 10
;Main.c,404 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0222
NOP	
J	L_Main_Modal_Group_Actions0135
NOP	
L_Main_Modal_Group_Actions0222:
ORI	R5, R0, 11
; temp end address is: 20 (R5)
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0135:
L_Main_Modal_Group_Actions073:
;Main.c,405 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 20 (R5)
SEH	R2, R5
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,408 :: 		for(j = 0;j<4;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions074:
; j start address is: 16 (R4)
; i start address is: 24 (R6)
; temp start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0223
NOP	
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions0223:
;Main.c,409 :: 		_data = buffA[i];
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,410 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R5
SLL	R3, R2, 5
LUI	R2, 40960
ORI	R2, R2, 13824
ADDU	R3, R2, R3
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 40(SP)
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
LW	R2, 40(SP)
SWC1	S0, 0(R2)
;Main.c,415 :: 		i++;
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,418 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,419 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions077:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0225
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0225:
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions078:
;Main.c,408 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,420 :: 		}
; i end address is: 12 (R3)
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
SEH	R6, R3
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions075:
;Main.c,422 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,423 :: 		case 16:
L_Main_Modal_Group_Actions079:
;Main.c,425 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,426 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0226
NOP	
J	L_Main_Modal_Group_Actions0136
NOP	
L_Main_Modal_Group_Actions0226:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0136:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions080:
;Main.c,427 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,428 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,429 :: 		case 53:
L_Main_Modal_Group_Actions081:
;Main.c,430 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,435 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions082:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0227
NOP	
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions0227:
; axis_words end address is: 20 (R5)
;Main.c,436 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0229
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0229:
;Main.c,437 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(-1610602236)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0230
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0230:
;Main.c,438 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(-1610602235)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0231
NOP	
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions0231:
;Main.c,439 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,440 :: 		} else {
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions087:
;Main.c,441 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,442 :: 		}
L_Main_Modal_Group_Actions088:
;Main.c,443 :: 		} else {
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions086:
;Main.c,444 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,445 :: 		}
L_Main_Modal_Group_Actions089:
;Main.c,446 :: 		}
L_Main_Modal_Group_Actions085:
;Main.c,435 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,447 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions083:
;Main.c,448 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,449 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions090:
;Main.c,450 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,451 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0232
NOP	
J	L_Main_Modal_Group_Actions0137
NOP	
L_Main_Modal_Group_Actions0232:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0137:
SEH	R2, R4
L_Main_Modal_Group_Actions091:
;Main.c,452 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,453 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,454 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions092:
;Main.c,455 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,457 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0233
NOP	
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions0233:
; axis_words end address is: 20 (R5)
;Main.c,458 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,459 :: 		} else {
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions093:
;Main.c,463 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions095:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0234
NOP	
J	L_Main_Modal_Group_Actions096
NOP	
L_Main_Modal_Group_Actions0234:
; axis_words end address is: 20 (R5)
;Main.c,464 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0236
NOP	
J	L_Main_Modal_Group_Actions098
NOP	
L_Main_Modal_Group_Actions0236:
;Main.c,465 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,466 :: 		}
L_Main_Modal_Group_Actions098:
;Main.c,463 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,467 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions095
NOP	
L_Main_Modal_Group_Actions096:
;Main.c,468 :: 		}
L_Main_Modal_Group_Actions094:
;Main.c,470 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions099:
;Main.c,472 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 10560
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,473 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,474 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions0100:
ORI	R25, R0, 65535
;Main.c,475 :: 		break;
J	L_Main_Modal_Group_Actions034
NOP	
;Main.c,476 :: 		}
L_Main_Modal_Group_Actions033:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0238
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0238:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0240
NOP	
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions0240:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0242
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0242:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0244
NOP	
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions0244:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0246
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0246:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0248
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0248:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0250
NOP	
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions0250:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0252
NOP	
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions0252:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0254
NOP	
J	L_Main_Modal_Group_Actions099
NOP	
L_Main_Modal_Group_Actions0254:
J	L_Main_Modal_Group_Actions0100
NOP	
L_Main_Modal_Group_Actions034:
;Main.c,477 :: 		return action;
SEH	R2, R25
;Main.c,478 :: 		}
;Main.c,477 :: 		return action;
;Main.c,478 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,483 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,488 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,489 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions1103:
;Main.c,490 :: 		SingleAxisStep(gc.next_position[X],gc.feed_rate,X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,491 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,492 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions1104:
;Main.c,493 :: 		SingleAxisStep(gc.next_position[Y],gc.feed_rate,Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,494 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,495 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions1105:
;Main.c,496 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602156)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,497 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,498 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions1106:
;Main.c,499 :: 		SingleAxisStep(gc.next_position[Z],gc.feed_rate,Z);
SH	R25, 12(SP)
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,500 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,501 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1107:
;Main.c,502 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,503 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,504 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1108:
;Main.c,505 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602152)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,506 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,507 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1109:
;Main.c,508 :: 		SingleAxisStep(gc.next_position[A],gc.feed_rate,A);
SH	R25, 12(SP)
ORI	R25, R0, 3
LWC1	S13, Offset(-1610602216)(GP)
LWC1	S12, Offset(-1610602148)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,509 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,510 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1110:
;Main.c,511 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602160)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,512 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,513 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1111:
;Main.c,514 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602156)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,515 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,516 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1112:
;Main.c,517 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.feed_rate);
SH	R25, 12(SP)
LWC1	S14, Offset(-1610602216)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(-1610602148)(GP)
LWC1	S12, Offset(-1610602152)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,518 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,519 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1113:
;Main.c,520 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,521 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
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
;Main.c,522 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,523 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1114:
;Main.c,524 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,525 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,530 :: 		if(axis_to_home < 3){
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions1256
NOP	
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1256:
;Main.c,533 :: 		if (sys.abort) {
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1258
NOP	
J	L_Main_Modal_Group_Actions1116
NOP	
L_Main_Modal_Group_Actions1258:
;Main.c,534 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,535 :: 		}
L_Main_Modal_Group_Actions1116:
;Main.c,536 :: 		}else{
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions1115:
;Main.c,537 :: 		int l = 0;
;Main.c,539 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,540 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,541 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,542 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1118:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1259
NOP	
J	L_Main_Modal_Group_Actions1119
NOP	
L_Main_Modal_Group_Actions1259:
;Main.c,545 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Main.c,546 :: 		sys.position[l] = STPS[l].steps_abs_position;
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 13576
ADDU	R4, R2, R3
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
LW	R2, 0(R2)
SW	R2, 0(R4)
;Main.c,549 :: 		if(STPS[l].run_state != STOP)
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions1261
NOP	
J	L_Main_Modal_Group_Actions1121
NOP	
L_Main_Modal_Group_Actions1261:
;Main.c,550 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1121:
;Main.c,542 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,551 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1118
NOP	
L_Main_Modal_Group_Actions1119:
;Main.c,554 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,557 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1122:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1263
NOP	
J	L_Main_Modal_Group_Actions1123
NOP	
L_Main_Modal_Group_Actions1263:
;Main.c,558 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1122
NOP	
L_Main_Modal_Group_Actions1123:
;Main.c,561 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
;Main.c,562 :: 		SV.mode_complete = 0;
SH	R0, Offset(_SV+2)(GP)
;Main.c,563 :: 		}
L_Main_Modal_Group_Actions1117:
;Main.c,564 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,565 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1124:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,567 :: 		}
L_Main_Modal_Group_Actions1101:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1265
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1265:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1267
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1267:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1269
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1269:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1271
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1271:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1273
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1273:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1275
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1275:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1277
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1277:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1279
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1279:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1281
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1281:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1283
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1283:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1285
NOP	
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1285:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1287
NOP	
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1287:
J	L_Main_Modal_Group_Actions1124
NOP	
L_Main_Modal_Group_Actions1102:
;Main.c,569 :: 		return action;
SEH	R2, R25
;Main.c,570 :: 		}
;Main.c,569 :: 		return action;
;Main.c,570 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,576 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,578 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(-1610602237)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3289
NOP	
J	L_Main_Modal_Group_Actions3125
NOP	
L_Main_Modal_Group_Actions3289:
;Main.c,579 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3125:
;Main.c,581 :: 		return action;
SEH	R2, R25
;Main.c,582 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,587 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,593 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4291
NOP	
J	L_Main_Modal_Group_Actions4140
NOP	
L_Main_Modal_Group_Actions4291:
LBU	R2, Offset(-1610602231)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4292
NOP	
J	L_Main_Modal_Group_Actions4139
NOP	
L_Main_Modal_Group_Actions4292:
J	L_Main_Modal_Group_Actions4128
NOP	
L_Main_Modal_Group_Actions4140:
L_Main_Modal_Group_Actions4139:
;Main.c,594 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4128:
;Main.c,595 :: 		SV.mode_complete = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,596 :: 		return action;
SEH	R2, R25
;Main.c,597 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,602 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,607 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(-1610602234)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7294
NOP	
J	L_Main_Modal_Group_Actions7143
NOP	
L_Main_Modal_Group_Actions7294:
LBU	R2, Offset(-1610602234)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7295
NOP	
J	L_Main_Modal_Group_Actions7142
NOP	
L_Main_Modal_Group_Actions7295:
J	L_Main_Modal_Group_Actions7131
NOP	
L_Main_Modal_Group_Actions7143:
L_Main_Modal_Group_Actions7142:
;Main.c,608 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7131:
;Main.c,609 :: 		SV.mode_complete = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,610 :: 		return action;
SEH	R2, R25
;Main.c,611 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,616 :: 		static int Modal_Group_Actions12(int action){
;Main.c,621 :: 		return action;
SEH	R2, R25
;Main.c,622 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
