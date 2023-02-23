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
ADDIU	SP, SP, -4
;Main.c,67 :: 		int error = 0;
;Main.c,68 :: 		int has_flash = 0;
;Main.c,69 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,72 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,74 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,83 :: 		while(1){
L_main0:
;Main.c,85 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,86 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,89 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main142
NOP	
J	L_main2
NOP	
L__main142:
;Main.c,91 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,92 :: 		switch(modal_group){
J	L_main3
NOP	
; modal_group end address is: 16 (R4)
;Main.c,93 :: 		case 0:break;
L_main5:
J	L_main4
NOP	
;Main.c,94 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main6:
;Main.c,95 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,96 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,97 :: 		break;
J	L_main4
NOP	
;Main.c,98 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,99 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,115 :: 		if(axis_to_run>0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__main143
NOP	
J	L_main8
NOP	
L__main143:
;Main.c,116 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,117 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,118 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,119 :: 		}
L_main8:
;Main.c,120 :: 		break;
J	L_main4
NOP	
;Main.c,123 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main9:
;Main.c,124 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,125 :: 		break;
J	L_main4
NOP	
;Main.c,128 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main10:
;Main.c,129 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,130 :: 		break;
J	L_main4
NOP	
;Main.c,131 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main11:
;Main.c,132 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,133 :: 		break;
J	L_main4
NOP	
;Main.c,134 :: 		case 1024: //$H Home all axis
L_main12:
;Main.c,135 :: 		if(axis_to_home < NoOfAxis){
LH	R2, Offset(Main_axis_to_home+0)(GP)
SLTI	R2, R2, 4
BNE	R2, R0, L__main144
NOP	
J	L_main13
NOP	
L__main144:
;Main.c,137 :: 		axis_to_home  = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,138 :: 		}
L_main13:
;Main.c,139 :: 		break;
J	L_main4
NOP	
;Main.c,140 :: 		}
L_main3:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main146
NOP	
J	L_main5
NOP	
L__main146:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main148
NOP	
J	L_main6
NOP	
L__main148:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main150
NOP	
J	L_main7
NOP	
L__main150:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main152
NOP	
J	L_main9
NOP	
L__main152:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main154
NOP	
J	L_main10
NOP	
L__main154:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main156
NOP	
J	L_main11
NOP	
L__main156:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main158
NOP	
J	L_main12
NOP	
L__main158:
L_main4:
;Main.c,141 :: 		}else{
J	L_main14
NOP	
L_main2:
;Main.c,142 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,143 :: 		}
L_main14:
;Main.c,145 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,150 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,155 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main159
NOP	
J	L_main15
NOP	
L__main159:
;Main.c,156 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main15:
;Main.c,162 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,163 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,164 :: 		}
J	L_main0
NOP	
;Main.c,165 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,170 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,176 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,180 :: 		switch(action){
J	L_Main_Modal_Group_Actions016
NOP	
;Main.c,181 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions018:
;Main.c,182 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,184 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+122)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0162
NOP	
J	L_Main_Modal_Group_Actions019
NOP	
L_Main_Modal_Group_Actions0162:
;Main.c,185 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+122)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,186 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions020:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0163
NOP	
J	L_Main_Modal_Group_Actions021
NOP	
L_Main_Modal_Group_Actions0163:
;Main.c,187 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,188 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions022:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions022
NOP	
;Main.c,189 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,190 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions020
NOP	
L_Main_Modal_Group_Actions021:
;Main.c,191 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions024
NOP	
L_Main_Modal_Group_Actions019:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+120)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0164
NOP	
J	L_Main_Modal_Group_Actions025
NOP	
L_Main_Modal_Group_Actions0164:
;Main.c,192 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+120)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,193 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions026:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0165
NOP	
J	L_Main_Modal_Group_Actions027
NOP	
L_Main_Modal_Group_Actions0165:
;Main.c,194 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,195 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions028:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions028
NOP	
;Main.c,196 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,197 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions026
NOP	
L_Main_Modal_Group_Actions027:
;Main.c,198 :: 		}
L_Main_Modal_Group_Actions025:
L_Main_Modal_Group_Actions024:
;Main.c,199 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,200 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,201 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions030:
;Main.c,214 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0167
NOP	
J	L_Main_Modal_Group_Actions0128
NOP	
L_Main_Modal_Group_Actions0167:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0169
NOP	
J	L_Main_Modal_Group_Actions0127
NOP	
L_Main_Modal_Group_Actions0169:
L_Main_Modal_Group_Actions0126:
;Main.c,215 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,214 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0128:
L_Main_Modal_Group_Actions0127:
;Main.c,216 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0170
NOP	
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions0170:
;Main.c,218 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,220 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0172
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0172:
;Main.c,221 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,222 :: 		}
L_Main_Modal_Group_Actions035:
;Main.c,225 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0173
NOP	
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions0173:
;Main.c,226 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,227 :: 		}
L_Main_Modal_Group_Actions036:
;Main.c,229 :: 		} else {
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions034:
;Main.c,235 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+120)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,236 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,237 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,241 :: 		axis_words = Get_Axisword();
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
;Main.c,242 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions038:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0174
NOP	
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions0174:
; axis_words end address is: 20 (R5)
;Main.c,243 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,245 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0175
NOP	
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions0175:
;Main.c,246 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,247 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0176
NOP	
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions0176:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions042:
;Main.c,249 :: 		_flash = buffA[indx];
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
;Main.c,253 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,261 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions041:
;Main.c,264 :: 		coord_data[i] = gc.next_position[i];
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
;Main.c,272 :: 		}
L_Main_Modal_Group_Actions043:
;Main.c,273 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,242 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,274 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions038
NOP	
L_Main_Modal_Group_Actions039:
;Main.c,276 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,279 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,280 :: 		}
L_Main_Modal_Group_Actions037:
;Main.c,282 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,283 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions044:
;Main.c,284 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions045:
;Main.c,287 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,296 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0178
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0178:
;Main.c,298 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions047:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0179
NOP	
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions0179:
;Main.c,300 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0181
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0181:
;Main.c,301 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0183
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0183:
;Main.c,302 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,303 :: 		} else {
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions051:
;Main.c,304 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,305 :: 		}
L_Main_Modal_Group_Actions052:
;Main.c,306 :: 		} else {
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions050:
;Main.c,307 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,308 :: 		}
L_Main_Modal_Group_Actions053:
;Main.c,313 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
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
;Main.c,314 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions054:
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
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0185:
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions055:
;Main.c,298 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,315 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions048:
;Main.c,316 :: 		}
L_Main_Modal_Group_Actions046:
;Main.c,318 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 10
;Main.c,320 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0186
NOP	
J	L_Main_Modal_Group_Actions0129
NOP	
L_Main_Modal_Group_Actions0186:
ORI	R6, R0, 11
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0129:
L_Main_Modal_Group_Actions056:
;Main.c,321 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,324 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Main_Modal_Group_Actions057:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions0187:
;Main.c,325 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,326 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,331 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,334 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,335 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions060:
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
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0189:
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions061:
;Main.c,324 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,336 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions058:
;Main.c,338 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,339 :: 		case 16:
L_Main_Modal_Group_Actions062:
;Main.c,341 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,342 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0190
NOP	
J	L_Main_Modal_Group_Actions0130
NOP	
L_Main_Modal_Group_Actions0190:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0130:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions063:
;Main.c,343 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,344 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,345 :: 		case 53:
L_Main_Modal_Group_Actions064:
;Main.c,346 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,351 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions065:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0191
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0191:
; axis_words end address is: 20 (R5)
;Main.c,352 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0193
NOP	
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0193:
;Main.c,353 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0194
NOP	
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions0194:
;Main.c,354 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,355 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,356 :: 		} else {
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions070:
;Main.c,357 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,358 :: 		}
L_Main_Modal_Group_Actions071:
;Main.c,359 :: 		} else {
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions069:
;Main.c,360 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,361 :: 		}
L_Main_Modal_Group_Actions072:
;Main.c,362 :: 		}
L_Main_Modal_Group_Actions068:
;Main.c,351 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,363 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,364 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,365 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions073:
;Main.c,366 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,367 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions0131
NOP	
L_Main_Modal_Group_Actions0196:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0131:
SEH	R2, R4
L_Main_Modal_Group_Actions074:
;Main.c,368 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,369 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,370 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions075:
;Main.c,371 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,373 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions0197:
; axis_words end address is: 20 (R5)
;Main.c,374 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,375 :: 		} else {
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions076:
;Main.c,379 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions078:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0198:
; axis_words end address is: 20 (R5)
;Main.c,380 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0200:
;Main.c,381 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,382 :: 		}
L_Main_Modal_Group_Actions081:
;Main.c,379 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,383 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions079:
;Main.c,384 :: 		}
L_Main_Modal_Group_Actions077:
;Main.c,386 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions082:
;Main.c,388 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+60)
ORI	R25, R25, lo_addr(_gc+60)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,389 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,390 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions083:
ORI	R25, R0, 65535
;Main.c,391 :: 		break;
J	L_Main_Modal_Group_Actions017
NOP	
;Main.c,392 :: 		}
L_Main_Modal_Group_Actions016:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions018
NOP	
L_Main_Modal_Group_Actions0202:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0204
NOP	
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions0204:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0206:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions0208:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions0210:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0212
NOP	
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions0212:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0214:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions0216:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions0218:
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions017:
;Main.c,393 :: 		return action;
SEH	R2, R25
;Main.c,394 :: 		}
;Main.c,393 :: 		return action;
;Main.c,394 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,399 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Main.c,404 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions184
NOP	
;Main.c,405 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions186:
;Main.c,406 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,407 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,408 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions187:
;Main.c,409 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,410 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,411 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions188:
;Main.c,412 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,413 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,414 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions189:
;Main.c,415 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,416 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,417 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions190:
;Main.c,418 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,419 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,420 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions191:
;Main.c,421 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,422 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,423 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions192:
;Main.c,424 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+88)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,425 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,426 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions193:
;Main.c,427 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,428 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,429 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions194:
;Main.c,430 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,431 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,432 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions195:
;Main.c,433 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,434 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,435 :: 		case 15://Homing Y axis
L_Main_Modal_Group_Actions196:
;Main.c,436 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,437 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,438 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions197:
;Main.c,439 :: 		if(action){
BNE	R25, R0, L_Main_Modal_Group_Actions1221
NOP	
J	L_Main_Modal_Group_Actions198
NOP	
L_Main_Modal_Group_Actions1221:
;Main.c,441 :: 		if( axis_to_home < NoOfAxis){
LH	R2, Offset(Main_axis_to_home+0)(GP)
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1222
NOP	
J	L_Main_Modal_Group_Actions199
NOP	
L_Main_Modal_Group_Actions1222:
;Main.c,442 :: 		home_status = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
; home_status start address is: 16 (R4)
SEH	R4, R2
;Main.c,443 :: 		LED2 = TMR.clock >> 3;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 3
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
; home_status end address is: 16 (R4)
;Main.c,445 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions1100:
; home_status start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions1224
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1224:
J	L_Main_Modal_Group_Actions1100
NOP	
L_Main_Modal_Group_Actions1101:
;Main.c,446 :: 		dma_printf("axis:= %d\n",axis_to_home);
ADDIU	R23, SP, 16
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICSMain_?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 16
LH	R2, Offset(Main_axis_to_home+0)(GP)
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 14(SP)
LH	R4, 12(SP)
;Main.c,448 :: 		if(home_status){
BNE	R4, R0, L_Main_Modal_Group_Actions1226
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1226:
; home_status end address is: 16 (R4)
;Main.c,449 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,450 :: 		axis_to_home++;
LH	R2, Offset(Main_axis_to_home+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,451 :: 		if(axis_to_home > NoOfAxis){mc_reset();}
SEH	R2, R2
SLTI	R2, R2, 5
BEQ	R2, R0, L_Main_Modal_Group_Actions1227
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1227:
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions1103:
;Main.c,452 :: 		break;
J	L_Main_Modal_Group_Actions185
NOP	
;Main.c,453 :: 		}
L_Main_Modal_Group_Actions1102:
;Main.c,455 :: 		if (sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1229
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1229:
;Main.c,456 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,458 :: 		}
L_Main_Modal_Group_Actions1104:
;Main.c,459 :: 		}
L_Main_Modal_Group_Actions199:
;Main.c,467 :: 		}
L_Main_Modal_Group_Actions198:
;Main.c,469 :: 		return axis_to_home;
LH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,471 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1105:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,473 :: 		}
L_Main_Modal_Group_Actions184:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1231
NOP	
J	L_Main_Modal_Group_Actions186
NOP	
L_Main_Modal_Group_Actions1231:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1233
NOP	
J	L_Main_Modal_Group_Actions187
NOP	
L_Main_Modal_Group_Actions1233:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1235
NOP	
J	L_Main_Modal_Group_Actions188
NOP	
L_Main_Modal_Group_Actions1235:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1237
NOP	
J	L_Main_Modal_Group_Actions189
NOP	
L_Main_Modal_Group_Actions1237:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1239
NOP	
J	L_Main_Modal_Group_Actions190
NOP	
L_Main_Modal_Group_Actions1239:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1241
NOP	
J	L_Main_Modal_Group_Actions191
NOP	
L_Main_Modal_Group_Actions1241:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1243
NOP	
J	L_Main_Modal_Group_Actions192
NOP	
L_Main_Modal_Group_Actions1243:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1245
NOP	
J	L_Main_Modal_Group_Actions193
NOP	
L_Main_Modal_Group_Actions1245:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1247
NOP	
J	L_Main_Modal_Group_Actions194
NOP	
L_Main_Modal_Group_Actions1247:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1249
NOP	
J	L_Main_Modal_Group_Actions195
NOP	
L_Main_Modal_Group_Actions1249:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1251
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1251:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1253
NOP	
J	L_Main_Modal_Group_Actions197
NOP	
L_Main_Modal_Group_Actions1253:
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions185:
;Main.c,475 :: 		return action;
SEH	R2, R25
;Main.c,476 :: 		}
;Main.c,475 :: 		return action;
;Main.c,476 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,482 :: 		static int Modal_Group_Actions3(int action){
;Main.c,484 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(_gc+3)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3255
NOP	
J	L_Main_Modal_Group_Actions3106
NOP	
L_Main_Modal_Group_Actions3255:
;Main.c,485 :: 		FAIL(STATUS_SETTING_READ_FAIL);
ORI	R2, R0, 10
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions3106:
;Main.c,487 :: 		return action;
SEH	R2, R25
;Main.c,488 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,493 :: 		static int Modal_Group_Actions4(int action){
;Main.c,499 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4257
NOP	
J	L_Main_Modal_Group_Actions4134
NOP	
L_Main_Modal_Group_Actions4257:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4258
NOP	
J	L_Main_Modal_Group_Actions4133
NOP	
L_Main_Modal_Group_Actions4258:
J	L_Main_Modal_Group_Actions4109
NOP	
L_Main_Modal_Group_Actions4134:
L_Main_Modal_Group_Actions4133:
;Main.c,500 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions4109:
;Main.c,502 :: 		return action;
SEH	R2, R25
;Main.c,503 :: 		}
L_end_Modal_Group_Actions4:
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,508 :: 		static int Modal_Group_Actions7(int action){
;Main.c,513 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7260
NOP	
J	L_Main_Modal_Group_Actions7137
NOP	
L_Main_Modal_Group_Actions7260:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7261
NOP	
J	L_Main_Modal_Group_Actions7136
NOP	
L_Main_Modal_Group_Actions7261:
J	L_Main_Modal_Group_Actions7112
NOP	
L_Main_Modal_Group_Actions7137:
L_Main_Modal_Group_Actions7136:
;Main.c,514 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions7112:
;Main.c,516 :: 		return action;
SEH	R2, R25
;Main.c,517 :: 		}
L_end_Modal_Group_Actions7:
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,522 :: 		static int Modal_Group_Actions12(int action){
;Main.c,527 :: 		return action;
SEH	R2, R25
;Main.c,528 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
_protocol_execute_runtime:
;Main.c,546 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,547 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LBU	R2, Offset(_sys+25)(GP)
BNE	R2, R0, L__protocol_execute_runtime265
NOP	
J	L_protocol_execute_runtime113
NOP	
L__protocol_execute_runtime265:
;Main.c,548 :: 		char rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LBU	R4, Offset(_sys+25)(GP)
;Main.c,553 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
ANDI	R2, R4, 96
BNE	R2, R0, L__protocol_execute_runtime267
NOP	
J	L__protocol_execute_runtime139
NOP	
L__protocol_execute_runtime267:
;Main.c,554 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SB	R2, Offset(_sys+1)(GP)
;Main.c,557 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime269
NOP	
J	L_protocol_execute_runtime115
NOP	
L__protocol_execute_runtime269:
;Main.c,558 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SB	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Main.c,559 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LBU	R4, 8(SP)
;Main.c,560 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
ANDI	R3, R4, 255
;Main.c,561 :: 		do {
J	L_protocol_execute_runtime116
NOP	
L__protocol_execute_runtime138:
;Main.c,565 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Main.c,561 :: 		do {
L_protocol_execute_runtime116:
;Main.c,565 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 255
BNE	R2, R0, L__protocol_execute_runtime271
NOP	
J	L__protocol_execute_runtime138
NOP	
L__protocol_execute_runtime271:
; rt_exec end address is: 12 (R3)
;Main.c,568 :: 		} else {
; rt_exec start address is: 12 (R3)
ANDI	R4, R3, 255
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime119
NOP	
L_protocol_execute_runtime115:
;Main.c,572 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SB	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LBU	R4, 8(SP)
;Main.c,573 :: 		}
L_protocol_execute_runtime119:
;Main.c,574 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 159
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
;Main.c,575 :: 		}
J	L_protocol_execute_runtime114
NOP	
L__protocol_execute_runtime139:
;Main.c,553 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Main.c,575 :: 		}
L_protocol_execute_runtime114:
;Main.c,578 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime273
NOP	
J	L_protocol_execute_runtime120
NOP	
L__protocol_execute_runtime273:
; rt_exec end address is: 16 (R4)
;Main.c,579 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SB	R2, Offset(_sys+0)(GP)
;Main.c,580 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Main.c,581 :: 		}
L_protocol_execute_runtime120:
;Main.c,584 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime275
NOP	
J	L_protocol_execute_runtime121
NOP	
L__protocol_execute_runtime275:
;Main.c,585 :: 		report_realtime_status();
SB	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LBU	R4, 8(SP)
;Main.c,586 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,587 :: 		}
L_protocol_execute_runtime121:
;Main.c,590 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime277
NOP	
J	L_protocol_execute_runtime122
NOP	
L__protocol_execute_runtime277:
;Main.c,592 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,593 :: 		}
L_protocol_execute_runtime122:
;Main.c,597 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime279
NOP	
J	L_protocol_execute_runtime123
NOP	
L__protocol_execute_runtime279:
;Main.c,599 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,600 :: 		}
L_protocol_execute_runtime123:
;Main.c,602 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime281
NOP	
J	L_protocol_execute_runtime124
NOP	
L__protocol_execute_runtime281:
;Main.c,604 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime283
NOP	
J	L_protocol_execute_runtime125
NOP	
L__protocol_execute_runtime283:
;Main.c,605 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SB	R2, Offset(_sys+24)(GP)
;Main.c,606 :: 		}
L_protocol_execute_runtime125:
;Main.c,607 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,608 :: 		}
L_protocol_execute_runtime124:
;Main.c,609 :: 		}
L_protocol_execute_runtime113:
;Main.c,613 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
