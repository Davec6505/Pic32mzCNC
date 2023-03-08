_Conditin_Externs:
;Main.c,55 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,56 :: 		PinMode();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_PinMode+0
NOP	
;Main.c,57 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,58 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,59 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,61 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,62 :: 		}
L_end_Conditin_Externs:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,66 :: 		void main() {
ADDIU	SP, SP, -36
;Main.c,67 :: 		int error = 0;
;Main.c,68 :: 		int has_flash = 0;
;Main.c,72 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,74 :: 		cntr = a = axis_to_run = dif = status_of_gcode = modal_group = modal_action = 0;
; status_of_gcode start address is: 8 (R2)
MOVZ	R2, R0, R0
; status_of_gcode end address is: 8 (R2)
;Main.c,76 :: 		while(1){
L_main0:
;Main.c,79 :: 		Debounce_Limits(X);
; status_of_gcode start address is: 8 (R2)
SH	R2, 0(SP)
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,80 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
LH	R2, 0(SP)
;Main.c,84 :: 		if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
SEH	R3, R2
; status_of_gcode end address is: 8 (R2)
ORI	R2, R0, 20
BEQ	R3, R2, L__main136
NOP	
J	L_main2
NOP	
L__main136:
;Main.c,86 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,88 :: 		switch(modal_group){
J	L_main3
NOP	
; modal_group end address is: 16 (R4)
;Main.c,89 :: 		case 0:FAIL(STATUS_OK);break;
L_main5:
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
J	L_main4
NOP	
;Main.c,90 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main6:
;Main.c,91 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,92 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,93 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,94 :: 		break;
J	L_main4
NOP	
;Main.c,95 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,96 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
; axis_to_run start address is: 8 (R2)
;Main.c,106 :: 		EnableSteppers(ALL_AXIS);
SH	R2, 0(SP)
ORI	R25, R0, 31
JAL	_EnableSteppers+0
NOP	
LH	R2, 0(SP)
;Main.c,107 :: 		Modal_Group_Actions1(axis_to_run);
SEH	R25, R2
; axis_to_run end address is: 8 (R2)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,108 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,114 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,115 :: 		break;
J	L_main4
NOP	
;Main.c,118 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main8:
;Main.c,119 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,120 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,121 :: 		break;
J	L_main4
NOP	
;Main.c,124 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main9:
;Main.c,125 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,126 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,127 :: 		break;
J	L_main4
NOP	
;Main.c,128 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main10:
;Main.c,129 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,130 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,131 :: 		break;
J	L_main4
NOP	
;Main.c,132 :: 		case 1024: //$H Home all axis
L_main11:
;Main.c,135 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,140 :: 		if(modal_action != 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BNE	R2, R0, L__main138
NOP	
J	L_main12
NOP	
L__main138:
JAL	_Rst_modalgroup+0
NOP	
L_main12:
;Main.c,141 :: 		break;
J	L_main4
NOP	
;Main.c,142 :: 		}
L_main3:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main140
NOP	
J	L_main5
NOP	
L__main140:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main142
NOP	
J	L_main6
NOP	
L__main142:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main144
NOP	
J	L_main7
NOP	
L__main144:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main146
NOP	
J	L_main8
NOP	
L__main146:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main148
NOP	
J	L_main9
NOP	
L__main148:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main150
NOP	
J	L_main10
NOP	
L__main150:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main152
NOP	
J	L_main11
NOP	
L__main152:
L_main4:
;Main.c,146 :: 		}
L_main2:
;Main.c,147 :: 		if(SV.Tog==1){
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main153
NOP	
J	L_main13
NOP	
L__main153:
;Main.c,148 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,149 :: 		SV.Tog = 0;
SH	R0, Offset(_SV+4)(GP)
;Main.c,150 :: 		}
L_main13:
;Main.c,152 :: 		if(!SV.Tog){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__main154
NOP	
J	L_main14
NOP	
L__main154:
;Main.c,153 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LHU	R2, Offset(_STPS+6)(GP)
BEQ	R2, R0, L__main155
NOP	
J	L__main133
NOP	
L__main155:
LHU	R2, Offset(_STPS+106)(GP)
BEQ	R2, R0, L__main156
NOP	
J	L__main132
NOP	
L__main156:
J	L_main17
NOP	
L__main133:
L__main132:
;Main.c,154 :: 		while(DMA_IsOn(1));
L_main18:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main158
NOP	
J	L_main19
NOP	
L__main158:
J	L_main18
NOP	
L_main19:
;Main.c,156 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
;Main.c,155 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
ADDIU	R23, SP, 2
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 2
;Main.c,157 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_SV+16)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+140)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
;Main.c,156 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
;Main.c,155 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
SW	R3, 0(SP)
;Main.c,157 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,158 :: 		}
L_main17:
;Main.c,159 :: 		}
L_main14:
;Main.c,163 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,166 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,169 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
; status_of_gcode start address is: 16 (R4)
SEH	R4, R2
;Main.c,180 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,185 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main159
NOP	
J	L_main20
NOP	
L__main159:
;Main.c,186 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
SH	R4, 0(SP)
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
LH	R4, 0(SP)
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main20:
;Main.c,190 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,191 :: 		}
SEH	R2, R4
; status_of_gcode end address is: 16 (R4)
J	L_main0
NOP	
;Main.c,192 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,198 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Main.c,201 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,210 :: 		switch(action){
J	L_Main_Modal_Group_Actions021
NOP	
;Main.c,211 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions023:
;Main.c,212 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,214 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+122)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0162
NOP	
J	L_Main_Modal_Group_Actions024
NOP	
L_Main_Modal_Group_Actions0162:
;Main.c,215 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+122)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,216 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions025:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0163
NOP	
J	L_Main_Modal_Group_Actions026
NOP	
L_Main_Modal_Group_Actions0163:
;Main.c,217 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,218 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions027:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions027
NOP	
;Main.c,219 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,220 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions025
NOP	
L_Main_Modal_Group_Actions026:
;Main.c,221 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions029
NOP	
L_Main_Modal_Group_Actions024:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+120)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0164
NOP	
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions0164:
;Main.c,222 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+120)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,223 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions031:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0165
NOP	
J	L_Main_Modal_Group_Actions032
NOP	
L_Main_Modal_Group_Actions0165:
;Main.c,224 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,225 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions033:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions033
NOP	
;Main.c,226 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,227 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions031
NOP	
L_Main_Modal_Group_Actions032:
;Main.c,228 :: 		}
L_Main_Modal_Group_Actions030:
L_Main_Modal_Group_Actions029:
;Main.c,229 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,230 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,231 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions035:
;Main.c,244 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0167
NOP	
J	L_Main_Modal_Group_Actions0121
NOP	
L_Main_Modal_Group_Actions0167:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0169
NOP	
J	L_Main_Modal_Group_Actions0120
NOP	
L_Main_Modal_Group_Actions0169:
L_Main_Modal_Group_Actions0119:
;Main.c,245 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,244 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0121:
L_Main_Modal_Group_Actions0120:
;Main.c,246 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0170
NOP	
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions0170:
;Main.c,248 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,250 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0172
NOP	
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions0172:
;Main.c,251 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,252 :: 		}
L_Main_Modal_Group_Actions040:
;Main.c,255 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0173
NOP	
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions0173:
;Main.c,256 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,257 :: 		}
L_Main_Modal_Group_Actions041:
;Main.c,259 :: 		} else {
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions039:
;Main.c,265 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+120)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,266 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,267 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,271 :: 		axis_words = Get_Axisword();
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
;Main.c,272 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions043:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0174
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0174:
; axis_words end address is: 20 (R5)
;Main.c,273 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,275 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0175
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0175:
;Main.c,276 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,277 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0176
NOP	
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions0176:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions047:
;Main.c,279 :: 		_flash = buffA[indx];
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
;Main.c,283 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,291 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions046:
;Main.c,294 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,302 :: 		}
L_Main_Modal_Group_Actions048:
;Main.c,303 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,272 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,304 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions044:
;Main.c,306 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,309 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,310 :: 		}
L_Main_Modal_Group_Actions042:
;Main.c,312 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,313 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions049:
;Main.c,314 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions050:
;Main.c,317 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,326 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0178
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0178:
;Main.c,328 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions052:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0179
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0179:
;Main.c,330 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0181
NOP	
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0181:
;Main.c,331 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0183
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0183:
;Main.c,332 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,333 :: 		} else {
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,334 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,335 :: 		}
L_Main_Modal_Group_Actions057:
;Main.c,336 :: 		} else {
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions055:
;Main.c,337 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,338 :: 		}
L_Main_Modal_Group_Actions058:
;Main.c,343 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+20)(GP)
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
;Main.c,344 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions059:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0185
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0185:
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions060:
;Main.c,328 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,345 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions053:
;Main.c,346 :: 		}
L_Main_Modal_Group_Actions051:
;Main.c,348 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 10
;Main.c,350 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0186
NOP	
J	L_Main_Modal_Group_Actions0122
NOP	
L_Main_Modal_Group_Actions0186:
ORI	R6, R0, 11
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0122:
L_Main_Modal_Group_Actions061:
;Main.c,351 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,354 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Main_Modal_Group_Actions062:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0187:
;Main.c,355 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,356 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R6
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 40(SP)
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
LW	R2, 40(SP)
SWC1	S0, 0(R2)
;Main.c,361 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,364 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(_settings+20)(GP)
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
;Main.c,365 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions065:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0189
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0189:
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,354 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,366 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions063:
;Main.c,368 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,369 :: 		case 16:
L_Main_Modal_Group_Actions067:
;Main.c,371 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,372 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0190
NOP	
J	L_Main_Modal_Group_Actions0123
NOP	
L_Main_Modal_Group_Actions0190:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0123:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions068:
;Main.c,373 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,374 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,375 :: 		case 53:
L_Main_Modal_Group_Actions069:
;Main.c,376 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,381 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions070:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0191
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0191:
; axis_words end address is: 20 (R5)
;Main.c,382 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0193
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0193:
;Main.c,383 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0194
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0194:
;Main.c,384 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,385 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,386 :: 		} else {
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions075:
;Main.c,387 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,388 :: 		}
L_Main_Modal_Group_Actions076:
;Main.c,389 :: 		} else {
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions074:
;Main.c,390 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,391 :: 		}
L_Main_Modal_Group_Actions077:
;Main.c,392 :: 		}
L_Main_Modal_Group_Actions073:
;Main.c,381 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,393 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions071:
;Main.c,394 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,395 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions078:
;Main.c,396 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,397 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions0124
NOP	
L_Main_Modal_Group_Actions0196:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0124:
SEH	R2, R4
L_Main_Modal_Group_Actions079:
;Main.c,398 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,399 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,400 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions080:
;Main.c,401 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,403 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0197:
; axis_words end address is: 20 (R5)
;Main.c,404 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,405 :: 		} else {
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions081:
;Main.c,409 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions083:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0198:
; axis_words end address is: 20 (R5)
;Main.c,410 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0200:
;Main.c,411 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,412 :: 		}
L_Main_Modal_Group_Actions086:
;Main.c,409 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,413 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions084:
;Main.c,414 :: 		}
L_Main_Modal_Group_Actions082:
;Main.c,416 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions087:
;Main.c,418 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+60)
ORI	R25, R25, lo_addr(_gc+60)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,419 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,420 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions088:
ORI	R25, R0, 65535
;Main.c,421 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,422 :: 		}
L_Main_Modal_Group_Actions021:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions023
NOP	
L_Main_Modal_Group_Actions0202:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0204
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0204:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions0206:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0208:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0210:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0212
NOP	
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions0212:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0214:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0216:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions0218:
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions022:
;Main.c,423 :: 		return action;
SEH	R2, R25
;Main.c,424 :: 		}
;Main.c,423 :: 		return action;
;Main.c,424 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,429 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,434 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions189
NOP	
;Main.c,435 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions191:
;Main.c,436 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,437 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,438 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions192:
;Main.c,439 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,440 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,441 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions193:
;Main.c,442 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,443 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,444 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions194:
;Main.c,445 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,446 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,447 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions195:
;Main.c,448 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,449 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,450 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions196:
;Main.c,451 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,452 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,453 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions197:
;Main.c,454 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+88)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,455 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,456 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions198:
;Main.c,457 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,458 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,459 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions199:
;Main.c,460 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,461 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,462 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1100:
;Main.c,463 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,464 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,465 :: 		case 15://Homing Y axis
L_Main_Modal_Group_Actions1101:
;Main.c,466 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
LUI	R5, 16880
ORI	R5, R5, 0
LUI	R4, 17174
ORI	R4, R4, 0
LUI	R3, 16880
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
ADDIU	SP, SP, -16
SWC1	S0, 12(SP)
LUI	R2, 16968
ORI	R2, R2, 0
SW	R2, 8(SP)
LUI	R2, 49736
ORI	R2, R2, 0
SW	R2, 4(SP)
SWC1	S0, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 12(SP)
;Main.c,467 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,468 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1102:
;Main.c,469 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,470 :: 		if(axis_to_home < 2){
SEH	R2, R2
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1220
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1220:
;Main.c,471 :: 		LED2 = TMR.clock >> 3;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 3
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,476 :: 		}else{
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1103:
;Main.c,477 :: 		int l = 0;
;Main.c,479 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,480 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,481 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,482 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1105:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1221
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1221:
;Main.c,485 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R0, 0(R2)
;Main.c,486 :: 		sys.position[l] = STPS[l].steps_abs_position;
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
ADDIU	R2, R2, 80
LW	R2, 0(R2)
SW	R2, 0(R4)
;Main.c,489 :: 		if(STPS[l].run_state != STOP)
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
BNE	R2, R0, L_Main_Modal_Group_Actions1223
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1223:
;Main.c,490 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1108:
;Main.c,482 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,491 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1106:
;Main.c,492 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,497 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1109:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1225
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1225:
;Main.c,498 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1110:
;Main.c,501 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Main.c,502 :: 		}
L_Main_Modal_Group_Actions1104:
;Main.c,503 :: 		break;
J	L_Main_Modal_Group_Actions190
NOP	
;Main.c,504 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1111:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,506 :: 		}
L_Main_Modal_Group_Actions189:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1227
NOP	
J	L_Main_Modal_Group_Actions191
NOP	
L_Main_Modal_Group_Actions1227:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1229
NOP	
J	L_Main_Modal_Group_Actions192
NOP	
L_Main_Modal_Group_Actions1229:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1231
NOP	
J	L_Main_Modal_Group_Actions193
NOP	
L_Main_Modal_Group_Actions1231:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1233
NOP	
J	L_Main_Modal_Group_Actions194
NOP	
L_Main_Modal_Group_Actions1233:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1235
NOP	
J	L_Main_Modal_Group_Actions195
NOP	
L_Main_Modal_Group_Actions1235:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1237
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1237:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1239
NOP	
J	L_Main_Modal_Group_Actions197
NOP	
L_Main_Modal_Group_Actions1239:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1241
NOP	
J	L_Main_Modal_Group_Actions198
NOP	
L_Main_Modal_Group_Actions1241:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1243
NOP	
J	L_Main_Modal_Group_Actions199
NOP	
L_Main_Modal_Group_Actions1243:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1245
NOP	
J	L_Main_Modal_Group_Actions1100
NOP	
L_Main_Modal_Group_Actions1245:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1247
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1247:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1249
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1249:
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions190:
;Main.c,508 :: 		return action;
SEH	R2, R25
;Main.c,509 :: 		}
;Main.c,508 :: 		return action;
;Main.c,509 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,515 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,517 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(_gc+3)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3251
NOP	
J	L_Main_Modal_Group_Actions3112
NOP	
L_Main_Modal_Group_Actions3251:
;Main.c,518 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3112:
;Main.c,520 :: 		return action;
SEH	R2, R25
;Main.c,521 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,526 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,532 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4253
NOP	
J	L_Main_Modal_Group_Actions4127
NOP	
L_Main_Modal_Group_Actions4253:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4254
NOP	
J	L_Main_Modal_Group_Actions4126
NOP	
L_Main_Modal_Group_Actions4254:
J	L_Main_Modal_Group_Actions4115
NOP	
L_Main_Modal_Group_Actions4127:
L_Main_Modal_Group_Actions4126:
;Main.c,533 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4115:
;Main.c,535 :: 		return action;
SEH	R2, R25
;Main.c,536 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,541 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,546 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7256
NOP	
J	L_Main_Modal_Group_Actions7130
NOP	
L_Main_Modal_Group_Actions7256:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7257
NOP	
J	L_Main_Modal_Group_Actions7129
NOP	
L_Main_Modal_Group_Actions7257:
J	L_Main_Modal_Group_Actions7118
NOP	
L_Main_Modal_Group_Actions7130:
L_Main_Modal_Group_Actions7129:
;Main.c,547 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7118:
;Main.c,549 :: 		return action;
SEH	R2, R25
;Main.c,550 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,555 :: 		static int Modal_Group_Actions12(int action){
;Main.c,560 :: 		return action;
SEH	R2, R25
;Main.c,561 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
