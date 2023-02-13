_Conditin_Externs:
;Main.c,54 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,55 :: 		PinMode();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_PinMode+0
NOP	
;Main.c,56 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,57 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,58 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,60 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,61 :: 		}
L_end_Conditin_Externs:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,65 :: 		void main() {
ADDIU	SP, SP, -8
;Main.c,66 :: 		int error = 0;
;Main.c,67 :: 		int has_flash = 0;
;Main.c,68 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,71 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,73 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,82 :: 		while(1){
L_main0:
;Main.c,84 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,85 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,88 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main121
NOP	
J	L_main2
NOP	
L__main121:
;Main.c,90 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,91 :: 		switch(modal_group){
J	L_main3
NOP	
;Main.c,92 :: 		case 0:break;
L_main5:
J	L_main4
NOP	
;Main.c,93 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main6:
;Main.c,94 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,95 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,96 :: 		break;
J	L_main4
NOP	
;Main.c,97 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,98 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,99 :: 		if(axis_to_run){
BNE	R2, R0, L__main123
NOP	
J	L_main8
NOP	
L__main123:
;Main.c,100 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,101 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,102 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,103 :: 		}
L_main8:
;Main.c,104 :: 		break;
J	L_main4
NOP	
;Main.c,107 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main9:
;Main.c,108 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,109 :: 		break;
J	L_main4
NOP	
;Main.c,112 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main10:
;Main.c,113 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,114 :: 		break;
J	L_main4
NOP	
;Main.c,115 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main11:
;Main.c,116 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,117 :: 		break;
J	L_main4
NOP	
;Main.c,118 :: 		}
L_main3:
LH	R2, 4(SP)
BNE	R2, R0, L__main125
NOP	
J	L_main5
NOP	
L__main125:
LH	R3, 4(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__main127
NOP	
J	L_main6
NOP	
L__main127:
LH	R3, 4(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__main129
NOP	
J	L_main7
NOP	
L__main129:
LH	R3, 4(SP)
ORI	R2, R0, 32
BNE	R3, R2, L__main131
NOP	
J	L_main9
NOP	
L__main131:
LH	R3, 4(SP)
ORI	R2, R0, 256
BNE	R3, R2, L__main133
NOP	
J	L_main10
NOP	
L__main133:
LH	R3, 4(SP)
ORI	R2, R0, 512
BNE	R3, R2, L__main135
NOP	
J	L_main11
NOP	
L__main135:
L_main4:
;Main.c,119 :: 		}else{
J	L_main12
NOP	
L_main2:
;Main.c,120 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,121 :: 		}
L_main12:
;Main.c,123 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,128 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,133 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main136
NOP	
J	L_main13
NOP	
L__main136:
;Main.c,134 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main13:
;Main.c,150 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,151 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,152 :: 		}
J	L_main0
NOP	
;Main.c,153 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,158 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,164 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,168 :: 		switch(action){
J	L_Main_Modal_Group_Actions014
NOP	
;Main.c,169 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions016:
;Main.c,170 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,172 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+118)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0139
NOP	
J	L_Main_Modal_Group_Actions017
NOP	
L_Main_Modal_Group_Actions0139:
;Main.c,173 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+118)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,174 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions018:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0140
NOP	
J	L_Main_Modal_Group_Actions019
NOP	
L_Main_Modal_Group_Actions0140:
;Main.c,175 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,176 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions020:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions020
NOP	
;Main.c,177 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,178 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions018
NOP	
L_Main_Modal_Group_Actions019:
;Main.c,179 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions022
NOP	
L_Main_Modal_Group_Actions017:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0141
NOP	
J	L_Main_Modal_Group_Actions023
NOP	
L_Main_Modal_Group_Actions0141:
;Main.c,180 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,181 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions024:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0142
NOP	
J	L_Main_Modal_Group_Actions025
NOP	
L_Main_Modal_Group_Actions0142:
;Main.c,182 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,183 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions026:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions026
NOP	
;Main.c,184 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,185 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions024
NOP	
L_Main_Modal_Group_Actions025:
;Main.c,186 :: 		}
L_Main_Modal_Group_Actions023:
L_Main_Modal_Group_Actions022:
;Main.c,187 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,188 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,189 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions028:
;Main.c,202 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+18)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0144
NOP	
J	L_Main_Modal_Group_Actions0113
NOP	
L_Main_Modal_Group_Actions0144:
LH	R3, Offset(_gc+18)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0146
NOP	
J	L_Main_Modal_Group_Actions0112
NOP	
L_Main_Modal_Group_Actions0146:
L_Main_Modal_Group_Actions0111:
;Main.c,203 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,202 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0113:
L_Main_Modal_Group_Actions0112:
;Main.c,204 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+18)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0147
NOP	
J	L_Main_Modal_Group_Actions032
NOP	
L_Main_Modal_Group_Actions0147:
;Main.c,206 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
LH	R2, Offset(_gc+116)(GP)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
SEH	R25, R2
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,207 :: 		if(result){ //response if write to flash failed
BNE	R2, R0, L_Main_Modal_Group_Actions0149
NOP	
J	L_Main_Modal_Group_Actions033
NOP	
L_Main_Modal_Group_Actions0149:
;Main.c,208 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,209 :: 		}
L_Main_Modal_Group_Actions033:
;Main.c,211 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0150
NOP	
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions0150:
;Main.c,212 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,213 :: 		}
L_Main_Modal_Group_Actions034:
;Main.c,214 :: 		} else {
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions032:
;Main.c,220 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,221 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,222 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,226 :: 		axis_words = Get_Axisword();
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
;Main.c,227 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions036:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0151
NOP	
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions0151:
; axis_words end address is: 20 (R5)
;Main.c,228 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,230 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0152
NOP	
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions0152:
;Main.c,231 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,232 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0153
NOP	
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions0153:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions040:
;Main.c,234 :: 		_flash = buffA[indx];
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
SW	R2, 40(SP)
;Main.c,238 :: 		coord_data[i] = ulong2flt(_flash);
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 44(SP)
SH	R4, 12(SP)
SH	R7, 14(SP)
SH	R5, 16(SP)
SH	R6, 18(SP)
SH	R25, 20(SP)
LW	R25, 40(SP)
JAL	_ulong2flt+0
NOP	
LH	R25, 20(SP)
LH	R6, 18(SP)
LH	R5, 16(SP)
LH	R7, 14(SP)
LH	R4, 12(SP)
LW	R2, 44(SP)
SWC1	S0, 0(R2)
;Main.c,244 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions039:
;Main.c,246 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,252 :: 		}
L_Main_Modal_Group_Actions041:
;Main.c,253 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,227 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,254 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions037:
;Main.c,256 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R3, SP, 24
LH	R2, Offset(_gc+116)(GP)
SH	R25, 12(SP)
MOVZ	R26, R3, R0
SEH	R25, R2
JAL	_settings_write_coord_data+0
NOP	
;Main.c,259 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,260 :: 		}
L_Main_Modal_Group_Actions035:
;Main.c,262 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,263 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions042:
;Main.c,264 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions043:
;Main.c,267 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,272 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0155
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0155:
;Main.c,274 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions045:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0156
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0156:
;Main.c,275 :: 		if ( bit_istrue(axis_words,bit(i+1)) ) {
ADDIU	R2, R5, 1
SEH	R3, R2
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0158
NOP	
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions0158:
;Main.c,276 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0160
NOP	
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions0160:
;Main.c,277 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+40)
ORI	R2, R2, lo_addr(_gc+40)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,278 :: 		} else {
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions049:
;Main.c,279 :: 		gc.next_position[i] += gc.position[i];
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,280 :: 		}
L_Main_Modal_Group_Actions050:
;Main.c,281 :: 		} else {
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions048:
;Main.c,282 :: 		gc.next_position[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,283 :: 		}
L_Main_Modal_Group_Actions051:
;Main.c,285 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+20)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
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
;Main.c,286 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions052:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0162
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0162:
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions053:
;Main.c,274 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,287 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions046:
;Main.c,288 :: 		}
L_Main_Modal_Group_Actions044:
;Main.c,290 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 6
;Main.c,292 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0163
NOP	
J	L_Main_Modal_Group_Actions0114
NOP	
L_Main_Modal_Group_Actions0163:
ORI	R6, R0, 7
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions0114:
L_Main_Modal_Group_Actions054:
;Main.c,293 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,296 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Main_Modal_Group_Actions055:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0164
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0164:
;Main.c,297 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,298 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,303 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,306 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,307 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions058:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0166
NOP	
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions0166:
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions059:
;Main.c,296 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,308 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,310 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,311 :: 		case 16:
L_Main_Modal_Group_Actions060:
;Main.c,312 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 6
;Main.c,313 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0167
NOP	
J	L_Main_Modal_Group_Actions0115
NOP	
L_Main_Modal_Group_Actions0167:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 7
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0115:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions061:
;Main.c,314 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+24)
ORI	R26, R26, lo_addr(_gc+24)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,315 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,316 :: 		case 53:
L_Main_Modal_Group_Actions062:
;Main.c,317 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,321 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions063:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0168
NOP	
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions0168:
; axis_words end address is: 20 (R5)
;Main.c,322 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0170
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0170:
;Main.c,323 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0171
NOP	
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0171:
;Main.c,324 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0172
NOP	
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0172:
;Main.c,325 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+40)
ORI	R2, R2, lo_addr(_gc+40)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,326 :: 		} else {
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions068:
;Main.c,327 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,328 :: 		}
L_Main_Modal_Group_Actions069:
;Main.c,329 :: 		} else {
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions067:
;Main.c,330 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,331 :: 		}
L_Main_Modal_Group_Actions070:
;Main.c,332 :: 		}
L_Main_Modal_Group_Actions066:
;Main.c,321 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,333 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions064:
;Main.c,334 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,335 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions071:
;Main.c,336 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 6
;Main.c,337 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0173
NOP	
J	L_Main_Modal_Group_Actions0116
NOP	
L_Main_Modal_Group_Actions0173:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 7
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0116:
SEH	R2, R4
L_Main_Modal_Group_Actions072:
;Main.c,338 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+24)
ORI	R26, R26, lo_addr(_gc+24)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,339 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,340 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions073:
;Main.c,341 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,342 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0174
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0174:
; axis_words end address is: 20 (R5)
;Main.c,343 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,344 :: 		} else {
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions074:
;Main.c,347 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions076:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0175
NOP	
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions0175:
; axis_words end address is: 20 (R5)
;Main.c,348 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0177
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0177:
;Main.c,349 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+56)
ORI	R2, R2, lo_addr(_gc+56)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+24)
ORI	R2, R2, lo_addr(_gc+24)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+40)
ORI	R2, R2, lo_addr(_gc+40)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S1, S1, S0
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Main.c,350 :: 		}
L_Main_Modal_Group_Actions079:
;Main.c,347 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,351 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions077:
;Main.c,352 :: 		}
L_Main_Modal_Group_Actions075:
;Main.c,354 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions080:
;Main.c,356 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+56)
ORI	R25, R25, lo_addr(_gc+56)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,357 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,358 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions081:
ORI	R25, R0, 65535
;Main.c,359 :: 		break;
J	L_Main_Modal_Group_Actions015
NOP	
;Main.c,360 :: 		}
L_Main_Modal_Group_Actions014:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0179
NOP	
J	L_Main_Modal_Group_Actions016
NOP	
L_Main_Modal_Group_Actions0179:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0181
NOP	
J	L_Main_Modal_Group_Actions028
NOP	
L_Main_Modal_Group_Actions0181:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0183
NOP	
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions0183:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0185
NOP	
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions0185:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0187:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0189
NOP	
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions0189:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0191
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0191:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0193
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0193:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0195:
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions015:
;Main.c,361 :: 		return action;
SEH	R2, R25
;Main.c,362 :: 		}
;Main.c,361 :: 		return action;
;Main.c,362 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,367 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,368 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions182
NOP	
;Main.c,369 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions184:
;Main.c,370 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,371 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,372 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions185:
;Main.c,373 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,374 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,375 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions186:
;Main.c,378 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,381 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,382 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions187:
;Main.c,383 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,384 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,385 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions188:
;Main.c,386 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,387 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,388 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions189:
;Main.c,389 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,390 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,391 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions190:
;Main.c,392 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+16)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,393 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,394 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions191:
;Main.c,395 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,396 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,397 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions192:
;Main.c,398 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,399 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,400 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions193:
;Main.c,401 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+16)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,402 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,403 :: 		case 13://Homing X axis
L_Main_Modal_Group_Actions194:
;Main.c,404 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,405 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,406 :: 		case 14://Homing Y axis
L_Main_Modal_Group_Actions195:
;Main.c,407 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,408 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,409 :: 		case 15://Homing Y axis
L_Main_Modal_Group_Actions196:
;Main.c,410 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,411 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,412 :: 		default: action = 0;
L_Main_Modal_Group_Actions197:
MOVZ	R25, R0, R0
;Main.c,413 :: 		break;
J	L_Main_Modal_Group_Actions183
NOP	
;Main.c,414 :: 		}
L_Main_Modal_Group_Actions182:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1198
NOP	
J	L_Main_Modal_Group_Actions184
NOP	
L_Main_Modal_Group_Actions1198:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1200
NOP	
J	L_Main_Modal_Group_Actions185
NOP	
L_Main_Modal_Group_Actions1200:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1202
NOP	
J	L_Main_Modal_Group_Actions186
NOP	
L_Main_Modal_Group_Actions1202:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1204
NOP	
J	L_Main_Modal_Group_Actions187
NOP	
L_Main_Modal_Group_Actions1204:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1206
NOP	
J	L_Main_Modal_Group_Actions188
NOP	
L_Main_Modal_Group_Actions1206:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1208
NOP	
J	L_Main_Modal_Group_Actions189
NOP	
L_Main_Modal_Group_Actions1208:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1210
NOP	
J	L_Main_Modal_Group_Actions190
NOP	
L_Main_Modal_Group_Actions1210:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1212
NOP	
J	L_Main_Modal_Group_Actions191
NOP	
L_Main_Modal_Group_Actions1212:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1214
NOP	
J	L_Main_Modal_Group_Actions192
NOP	
L_Main_Modal_Group_Actions1214:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1216
NOP	
J	L_Main_Modal_Group_Actions193
NOP	
L_Main_Modal_Group_Actions1216:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L_Main_Modal_Group_Actions1218
NOP	
J	L_Main_Modal_Group_Actions194
NOP	
L_Main_Modal_Group_Actions1218:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L_Main_Modal_Group_Actions1220
NOP	
J	L_Main_Modal_Group_Actions195
NOP	
L_Main_Modal_Group_Actions1220:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1222
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1222:
J	L_Main_Modal_Group_Actions197
NOP	
L_Main_Modal_Group_Actions183:
;Main.c,416 :: 		return action;
SEH	R2, R25
;Main.c,417 :: 		}
;Main.c,416 :: 		return action;
;Main.c,417 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,423 :: 		static int Modal_Group_Actions3(int action){
;Main.c,428 :: 		return action;
SEH	R2, R25
;Main.c,429 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,434 :: 		static int Modal_Group_Actions4(int action){
;Main.c,439 :: 		return action;
SEH	R2, R25
;Main.c,440 :: 		}
L_end_Modal_Group_Actions4:
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,445 :: 		static int Modal_Group_Actions7(int action){
;Main.c,450 :: 		return action;
SEH	R2, R25
;Main.c,451 :: 		}
L_end_Modal_Group_Actions7:
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,456 :: 		static int Modal_Group_Actions12(int action){
;Main.c,461 :: 		return action;
SEH	R2, R25
;Main.c,462 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
_protocol_execute_runtime:
;Main.c,480 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,481 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LBU	R2, Offset(_sys+25)(GP)
BNE	R2, R0, L__protocol_execute_runtime229
NOP	
J	L_protocol_execute_runtime98
NOP	
L__protocol_execute_runtime229:
;Main.c,482 :: 		uint8_t rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LBU	R4, Offset(_sys+25)(GP)
;Main.c,487 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
ANDI	R2, R4, 96
BNE	R2, R0, L__protocol_execute_runtime231
NOP	
J	L__protocol_execute_runtime118
NOP	
L__protocol_execute_runtime231:
;Main.c,488 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SB	R2, Offset(_sys+1)(GP)
;Main.c,491 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime233
NOP	
J	L_protocol_execute_runtime100
NOP	
L__protocol_execute_runtime233:
;Main.c,492 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SB	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Main.c,493 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LBU	R4, 8(SP)
;Main.c,494 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
ANDI	R3, R4, 255
;Main.c,495 :: 		do {
J	L_protocol_execute_runtime101
NOP	
L__protocol_execute_runtime117:
;Main.c,499 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Main.c,495 :: 		do {
L_protocol_execute_runtime101:
;Main.c,499 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 255
BNE	R2, R0, L__protocol_execute_runtime235
NOP	
J	L__protocol_execute_runtime117
NOP	
L__protocol_execute_runtime235:
; rt_exec end address is: 12 (R3)
;Main.c,502 :: 		} else {
; rt_exec start address is: 12 (R3)
ANDI	R4, R3, 255
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime104
NOP	
L_protocol_execute_runtime100:
;Main.c,506 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SB	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LBU	R4, 8(SP)
;Main.c,507 :: 		}
L_protocol_execute_runtime104:
;Main.c,508 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 159
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
;Main.c,509 :: 		}
J	L_protocol_execute_runtime99
NOP	
L__protocol_execute_runtime118:
;Main.c,487 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Main.c,509 :: 		}
L_protocol_execute_runtime99:
;Main.c,512 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime237
NOP	
J	L_protocol_execute_runtime105
NOP	
L__protocol_execute_runtime237:
; rt_exec end address is: 16 (R4)
;Main.c,513 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SB	R2, Offset(_sys+0)(GP)
;Main.c,514 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Main.c,515 :: 		}
L_protocol_execute_runtime105:
;Main.c,518 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime239
NOP	
J	L_protocol_execute_runtime106
NOP	
L__protocol_execute_runtime239:
;Main.c,519 :: 		report_realtime_status();
SB	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LBU	R4, 8(SP)
;Main.c,520 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,521 :: 		}
L_protocol_execute_runtime106:
;Main.c,524 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime241
NOP	
J	L_protocol_execute_runtime107
NOP	
L__protocol_execute_runtime241:
;Main.c,526 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,527 :: 		}
L_protocol_execute_runtime107:
;Main.c,531 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime243
NOP	
J	L_protocol_execute_runtime108
NOP	
L__protocol_execute_runtime243:
;Main.c,533 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,534 :: 		}
L_protocol_execute_runtime108:
;Main.c,536 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime245
NOP	
J	L_protocol_execute_runtime109
NOP	
L__protocol_execute_runtime245:
;Main.c,538 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime247
NOP	
J	L_protocol_execute_runtime110
NOP	
L__protocol_execute_runtime247:
;Main.c,539 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SB	R2, Offset(_sys+24)(GP)
;Main.c,540 :: 		}
L_protocol_execute_runtime110:
;Main.c,541 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,542 :: 		}
L_protocol_execute_runtime109:
;Main.c,543 :: 		}
L_protocol_execute_runtime98:
;Main.c,547 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
