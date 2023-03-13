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
ADDIU	SP, SP, -44
;Main.c,67 :: 		int error = 0;
;Main.c,68 :: 		int has_flash = 0;
;Main.c,73 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,75 :: 		cntr = a = axis_to_run = dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, 2(SP)
;Main.c,77 :: 		while(1){
L_main0:
;Main.c,80 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,81 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,89 :: 		status_of_gcode == STATUS_OK){
LH	R3, 2(SP)
ORI	R2, R0, 20
BNE	R3, R2, L__main144
NOP	
J	L__main137
NOP	
L__main144:
LH	R2, 2(SP)
BNE	R2, R0, L__main146
NOP	
J	L__main136
NOP	
L__main146:
J	L_main4
NOP	
L__main137:
L__main136:
;Main.c,91 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,94 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,95 :: 		case 0:FAIL(STATUS_OK);break;
L_main7:
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
J	L_main6
NOP	
;Main.c,96 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,97 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,98 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,99 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,100 :: 		break;
J	L_main6
NOP	
;Main.c,101 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,102 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,106 :: 		while(DMA_IsOn(1));
L_main10:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main148
NOP	
J	L_main11
NOP	
L__main148:
J	L_main10
NOP	
L_main11:
;Main.c,107 :: 		dma_printf("status_of_gcode:= %d\taxis_to_run:= %d\n",status_of_gcode,axis_to_run);
ADDIU	R23, SP, 4
ADDIU	R22, R23, 39
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 4
LH	R2, 0(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, 14(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,112 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 7
JAL	_EnableSteppers+0
NOP	
;Main.c,113 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,114 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,115 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,116 :: 		break;
J	L_main6
NOP	
;Main.c,119 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main12:
;Main.c,120 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,121 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,122 :: 		break;
J	L_main6
NOP	
;Main.c,125 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main13:
;Main.c,126 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,127 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,128 :: 		break;
J	L_main6
NOP	
;Main.c,129 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main14:
;Main.c,130 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,131 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,132 :: 		break;
J	L_main6
NOP	
;Main.c,133 :: 		case 1024: //$H Home all axis
L_main15:
;Main.c,135 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 7
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,140 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main149
NOP	
J	L_main16
NOP	
L__main149:
JAL	_Rst_modalgroup+0
NOP	
L_main16:
;Main.c,141 :: 		break;
J	L_main6
NOP	
;Main.c,142 :: 		}
L_main5:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main151
NOP	
J	L_main7
NOP	
L__main151:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main153
NOP	
J	L_main8
NOP	
L__main153:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main155
NOP	
J	L_main9
NOP	
L__main155:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main157
NOP	
J	L_main12
NOP	
L__main157:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main159
NOP	
J	L_main13
NOP	
L__main159:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main161
NOP	
J	L_main14
NOP	
L__main161:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main163
NOP	
J	L_main15
NOP	
L__main163:
L_main6:
;Main.c,143 :: 		}
L_main4:
;Main.c,145 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed ){
JAL	_Get_Axis_Enable_States+0
NOP	
BEQ	R2, R0, L__main164
NOP	
J	L__main140
NOP	
L__main164:
LH	R2, Offset(_SV+4)(GP)
BNE	R2, R0, L__main166
NOP	
J	L__main139
NOP	
L__main166:
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__main167
NOP	
J	L__main138
NOP	
L__main167:
L__main134:
;Main.c,155 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,157 :: 		SV.Tog = 0;
SH	R0, Offset(_SV+4)(GP)
;Main.c,145 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed ){
L__main140:
L__main139:
L__main138:
;Main.c,173 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,176 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,179 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,190 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,195 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main168
NOP	
J	L_main20
NOP	
L__main168:
;Main.c,196 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main20:
;Main.c,200 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,201 :: 		}
J	L_main0
NOP	
;Main.c,202 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,208 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Main.c,211 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,220 :: 		switch(action){
J	L_Main_Modal_Group_Actions021
NOP	
;Main.c,221 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions023:
;Main.c,222 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,224 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+90)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0171
NOP	
J	L_Main_Modal_Group_Actions024
NOP	
L_Main_Modal_Group_Actions0171:
;Main.c,225 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+90)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,226 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions025:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0172
NOP	
J	L_Main_Modal_Group_Actions026
NOP	
L_Main_Modal_Group_Actions0172:
;Main.c,227 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,228 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions027:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions027
NOP	
;Main.c,229 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,230 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions025
NOP	
L_Main_Modal_Group_Actions026:
;Main.c,231 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions029
NOP	
L_Main_Modal_Group_Actions024:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+88)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0173
NOP	
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions0173:
;Main.c,232 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+88)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,233 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions031:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0174
NOP	
J	L_Main_Modal_Group_Actions032
NOP	
L_Main_Modal_Group_Actions0174:
;Main.c,234 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,235 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions033:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions033
NOP	
;Main.c,236 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,237 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions031
NOP	
L_Main_Modal_Group_Actions032:
;Main.c,238 :: 		}
L_Main_Modal_Group_Actions030:
L_Main_Modal_Group_Actions029:
;Main.c,239 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,240 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,241 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions035:
;Main.c,254 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0176
NOP	
J	L_Main_Modal_Group_Actions0124
NOP	
L_Main_Modal_Group_Actions0176:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0178
NOP	
J	L_Main_Modal_Group_Actions0123
NOP	
L_Main_Modal_Group_Actions0178:
L_Main_Modal_Group_Actions0122:
;Main.c,255 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,254 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0124:
L_Main_Modal_Group_Actions0123:
;Main.c,256 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0179
NOP	
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions0179:
;Main.c,258 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+52)
ORI	R26, R26, lo_addr(_gc+52)
LH	R25, Offset(_gc+88)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,260 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0181
NOP	
J	L_Main_Modal_Group_Actions040
NOP	
L_Main_Modal_Group_Actions0181:
;Main.c,261 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,262 :: 		}
L_Main_Modal_Group_Actions040:
;Main.c,265 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0182
NOP	
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions0182:
;Main.c,266 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 8
LUI	R26, hi_addr(_gc+52)
ORI	R26, R26, lo_addr(_gc+52)
LUI	R25, hi_addr(_gc+36)
ORI	R25, R25, lo_addr(_gc+36)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,267 :: 		}
L_Main_Modal_Group_Actions041:
;Main.c,269 :: 		} else {
J	L_Main_Modal_Group_Actions042
NOP	
L_Main_Modal_Group_Actions039:
;Main.c,275 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+88)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,276 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,277 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,281 :: 		axis_words = Get_Axisword();
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
;Main.c,282 :: 		for(i = 0; i < 3;i++){
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
BNE	R2, R0, L_Main_Modal_Group_Actions0183
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0183:
; axis_words end address is: 20 (R5)
;Main.c,283 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,285 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0184
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0184:
;Main.c,286 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,287 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0185
NOP	
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions0185:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions047:
;Main.c,289 :: 		_flash = buffA[indx];
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
;Main.c,293 :: 		coord_data[i] = ulong2flt(_flash);
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 32(SP)
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
LW	R2, 32(SP)
SWC1	S0, 0(R2)
;Main.c,301 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions046:
;Main.c,304 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,312 :: 		}
L_Main_Modal_Group_Actions048:
;Main.c,313 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,282 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,314 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions044:
;Main.c,316 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+88)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,319 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 8
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+36)
ORI	R25, R25, lo_addr(_gc+36)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,320 :: 		}
L_Main_Modal_Group_Actions042:
;Main.c,322 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,323 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions049:
;Main.c,324 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions050:
;Main.c,327 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,336 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0187:
;Main.c,338 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions052:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions0188
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0188:
;Main.c,340 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0190
NOP	
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0190:
;Main.c,341 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0192
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0192:
;Main.c,342 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+36)
ORI	R2, R2, lo_addr(_gc+36)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,343 :: 		} else {
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,344 :: 		gc.next_position[i] += gc.position[i];
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,345 :: 		}
L_Main_Modal_Group_Actions057:
;Main.c,346 :: 		} else {
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions055:
;Main.c,347 :: 		gc.next_position[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,348 :: 		}
L_Main_Modal_Group_Actions058:
;Main.c,353 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+12)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
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
;Main.c,354 :: 		while(GET_RunState(i));
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
BNE	R2, R0, L_Main_Modal_Group_Actions0194
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0194:
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions060:
;Main.c,338 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,355 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions053:
;Main.c,356 :: 		}
L_Main_Modal_Group_Actions051:
;Main.c,358 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 10
;Main.c,360 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions0125
NOP	
L_Main_Modal_Group_Actions0195:
ORI	R6, R0, 11
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0125:
L_Main_Modal_Group_Actions061:
;Main.c,361 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,364 :: 		for(j = 0;j<4;j++){
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
BNE	R2, R0, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0196:
;Main.c,365 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,366 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R6
SLL	R3, R2, 4
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 32(SP)
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
LW	R2, 32(SP)
SWC1	S0, 0(R2)
;Main.c,371 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,374 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(_settings+12)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R6
SLL	R3, R2, 4
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
;Main.c,375 :: 		while(GET_RunState(j));
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
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0198:
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,364 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,376 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions063:
;Main.c,378 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,379 :: 		case 16:
L_Main_Modal_Group_Actions067:
;Main.c,381 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,382 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0199
NOP	
J	L_Main_Modal_Group_Actions0126
NOP	
L_Main_Modal_Group_Actions0199:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions0126:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions068:
;Main.c,383 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,384 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,385 :: 		case 53:
L_Main_Modal_Group_Actions069:
;Main.c,386 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,391 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions070:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0200:
; axis_words end address is: 20 (R5)
;Main.c,392 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0202:
;Main.c,393 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0203
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0203:
;Main.c,394 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0204
NOP	
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions0204:
;Main.c,395 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+36)
ORI	R2, R2, lo_addr(_gc+36)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Main.c,396 :: 		} else {
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions075:
;Main.c,397 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R4, R2, R3
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Main.c,398 :: 		}
L_Main_Modal_Group_Actions076:
;Main.c,399 :: 		} else {
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions074:
;Main.c,400 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,401 :: 		}
L_Main_Modal_Group_Actions077:
;Main.c,402 :: 		}
L_Main_Modal_Group_Actions073:
;Main.c,391 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,403 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions071:
;Main.c,404 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,405 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions078:
;Main.c,406 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,407 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions0127
NOP	
L_Main_Modal_Group_Actions0205:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0127:
SEH	R2, R4
L_Main_Modal_Group_Actions079:
;Main.c,408 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,409 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,410 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions080:
;Main.c,411 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,413 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0206:
; axis_words end address is: 20 (R5)
;Main.c,414 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,415 :: 		} else {
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions081:
;Main.c,419 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
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
BNE	R2, R0, L_Main_Modal_Group_Actions0207
NOP	
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0207:
; axis_words end address is: 20 (R5)
;Main.c,420 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0209:
;Main.c,421 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R6
SLL	R4, R2, 2
LUI	R2, hi_addr(_gc+44)
ORI	R2, R2, lo_addr(_gc+44)
ADDU	R3, R2, R4
LUI	R2, hi_addr(_gc+28)
ORI	R2, R2, lo_addr(_gc+28)
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+36)
ORI	R2, R2, lo_addr(_gc+36)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S1, S1, S0
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Main.c,422 :: 		}
L_Main_Modal_Group_Actions086:
;Main.c,419 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,423 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions084:
;Main.c,424 :: 		}
L_Main_Modal_Group_Actions082:
;Main.c,426 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions087:
;Main.c,428 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 8
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,429 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,430 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions088:
ORI	R25, R0, 65535
;Main.c,431 :: 		break;
J	L_Main_Modal_Group_Actions022
NOP	
;Main.c,432 :: 		}
L_Main_Modal_Group_Actions021:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions023
NOP	
L_Main_Modal_Group_Actions0211:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0213
NOP	
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions0213:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0215
NOP	
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions0215:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0217
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0217:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0219
NOP	
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0219:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0221
NOP	
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions0221:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0223
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0223:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0225
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0225:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0227
NOP	
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions0227:
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions022:
;Main.c,433 :: 		return action;
SEH	R2, R25
;Main.c,434 :: 		}
;Main.c,433 :: 		return action;
;Main.c,434 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,439 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,441 :: 		while(DMA_IsOn(1));
SW	R26, 4(SP)
SW	R27, 8(SP)
L_Main_Modal_Group_Actions189:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions1230
NOP	
J	L_Main_Modal_Group_Actions190
NOP	
L_Main_Modal_Group_Actions1230:
J	L_Main_Modal_Group_Actions189
NOP	
L_Main_Modal_Group_Actions190:
;Main.c,442 :: 		dma_printf("action:= %d\tgc.frequency:= %l\n",action,gc.frequency);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICSMain_?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 14
LW	R2, Offset(_gc+20)(GP)
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
SH	R25, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
;Main.c,444 :: 		switch(action){
J	L_Main_Modal_Group_Actions191
NOP	
;Main.c,445 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions193:
;Main.c,446 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,447 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,448 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions194:
;Main.c,449 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,450 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,451 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions195:
;Main.c,452 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+56)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,453 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,454 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions196:
;Main.c,455 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+60)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,456 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,457 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions197:
;Main.c,458 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+60)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,459 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,460 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions198:
;Main.c,461 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+60)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,462 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,463 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions199:
;Main.c,464 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+64)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,465 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,466 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1100:
;Main.c,467 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,468 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,469 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1101:
;Main.c,470 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,471 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,472 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1102:
;Main.c,473 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+60)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,474 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,475 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1103:
;Main.c,476 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,477 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,478 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1104:
;Main.c,479 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,480 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,485 :: 		if(axis_to_home < 2){
SEH	R2, R2
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1231
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1231:
;Main.c,488 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1233
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1233:
;Main.c,489 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,490 :: 		}
L_Main_Modal_Group_Actions1106:
;Main.c,491 :: 		}else{
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1105:
;Main.c,492 :: 		int l = 0;
;Main.c,494 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,495 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,496 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,497 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1108:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1234
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1234:
;Main.c,500 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R0, 0(R2)
;Main.c,501 :: 		sys.position[l] = STPS[l].steps_abs_position;
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
;Main.c,504 :: 		if(STPS[l].run_state != STOP)
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
BNE	R2, R0, L_Main_Modal_Group_Actions1236
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1236:
;Main.c,505 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1111:
;Main.c,497 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,506 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1109:
;Main.c,509 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,512 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1112:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1238
NOP	
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1238:
;Main.c,513 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1113:
;Main.c,516 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Main.c,517 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Main.c,518 :: 		}
L_Main_Modal_Group_Actions1107:
;Main.c,519 :: 		break;
J	L_Main_Modal_Group_Actions192
NOP	
;Main.c,520 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1114:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,522 :: 		}
L_Main_Modal_Group_Actions191:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1240
NOP	
J	L_Main_Modal_Group_Actions193
NOP	
L_Main_Modal_Group_Actions1240:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1242
NOP	
J	L_Main_Modal_Group_Actions194
NOP	
L_Main_Modal_Group_Actions1242:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1244
NOP	
J	L_Main_Modal_Group_Actions195
NOP	
L_Main_Modal_Group_Actions1244:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1246
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1246:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1248
NOP	
J	L_Main_Modal_Group_Actions197
NOP	
L_Main_Modal_Group_Actions1248:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1250
NOP	
J	L_Main_Modal_Group_Actions198
NOP	
L_Main_Modal_Group_Actions1250:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1252
NOP	
J	L_Main_Modal_Group_Actions199
NOP	
L_Main_Modal_Group_Actions1252:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1254
NOP	
J	L_Main_Modal_Group_Actions1100
NOP	
L_Main_Modal_Group_Actions1254:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1256
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1256:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1258
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1258:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1260
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1260:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L_Main_Modal_Group_Actions1262
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1262:
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions192:
;Main.c,524 :: 		return action;
SEH	R2, R25
;Main.c,525 :: 		}
;Main.c,524 :: 		return action;
;Main.c,525 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,531 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,533 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(_gc+3)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3264
NOP	
J	L_Main_Modal_Group_Actions3115
NOP	
L_Main_Modal_Group_Actions3264:
;Main.c,534 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3115:
;Main.c,536 :: 		return action;
SEH	R2, R25
;Main.c,537 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,542 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,548 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4266
NOP	
J	L_Main_Modal_Group_Actions4130
NOP	
L_Main_Modal_Group_Actions4266:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4267
NOP	
J	L_Main_Modal_Group_Actions4129
NOP	
L_Main_Modal_Group_Actions4267:
J	L_Main_Modal_Group_Actions4118
NOP	
L_Main_Modal_Group_Actions4130:
L_Main_Modal_Group_Actions4129:
;Main.c,549 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4118:
;Main.c,551 :: 		return action;
SEH	R2, R25
;Main.c,552 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,557 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,562 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7269
NOP	
J	L_Main_Modal_Group_Actions7133
NOP	
L_Main_Modal_Group_Actions7269:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7270
NOP	
J	L_Main_Modal_Group_Actions7132
NOP	
L_Main_Modal_Group_Actions7270:
J	L_Main_Modal_Group_Actions7121
NOP	
L_Main_Modal_Group_Actions7133:
L_Main_Modal_Group_Actions7132:
;Main.c,563 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7121:
;Main.c,565 :: 		return action;
SEH	R2, R25
;Main.c,566 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,571 :: 		static int Modal_Group_Actions12(int action){
;Main.c,576 :: 		return action;
SEH	R2, R25
;Main.c,577 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
