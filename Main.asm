_Conditin_Externs:
;Main.c,52 :: 		void Conditin_Externs(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,53 :: 		PinMode();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_PinMode+0
NOP	
;Main.c,54 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,55 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,56 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,58 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,59 :: 		}
L_end_Conditin_Externs:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,63 :: 		void main() {
ADDIU	SP, SP, -8
;Main.c,64 :: 		int error = 0;
;Main.c,65 :: 		int has_flash = 0;
MOVZ	R30, R0, R0
SH	R30, 6(SP)
;Main.c,66 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,69 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,70 :: 		EnableInterrupts();
EI	R30
;Main.c,72 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,76 :: 		Delay_ms(1000);
LUI	R24, 1017
ORI	R24, R24, 16554
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
;Main.c,82 :: 		if(has_flash){
LH	R2, 6(SP)
BNE	R2, R0, L__main128
NOP	
J	L_main2
NOP	
L__main128:
;Main.c,83 :: 		settings_read_coord_data();
JAL	_settings_read_coord_data+0
NOP	
;Main.c,84 :: 		}
L_main2:
;Main.c,87 :: 		while(1){
L_main3:
;Main.c,89 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,90 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,93 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main129
NOP	
J	L_main5
NOP	
L__main129:
;Main.c,95 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,96 :: 		switch(modal_group){
J	L_main6
NOP	
;Main.c,97 :: 		case 0:break;
L_main8:
J	L_main7
NOP	
;Main.c,98 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main9:
;Main.c,99 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	_Modal_Group_Actions0+0
NOP	
;Main.c,100 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,101 :: 		break;
J	L_main7
NOP	
;Main.c,102 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main10:
;Main.c,103 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,104 :: 		if(axis_to_run){
BNE	R2, R0, L__main131
NOP	
J	L_main11
NOP	
L__main131:
;Main.c,105 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,106 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	_Modal_Group_Actions1+0
NOP	
;Main.c,107 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,108 :: 		}
L_main11:
;Main.c,109 :: 		break;
J	L_main7
NOP	
;Main.c,110 :: 		case 8:
L_main12:
;Main.c,111 :: 		break;
J	L_main7
NOP	
;Main.c,112 :: 		case 16:
L_main13:
;Main.c,113 :: 		break;
J	L_main7
NOP	
;Main.c,114 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main14:
;Main.c,115 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions4+0
NOP	
;Main.c,116 :: 		break;
J	L_main7
NOP	
;Main.c,117 :: 		case 64:
L_main15:
;Main.c,118 :: 		break;
J	L_main7
NOP	
;Main.c,119 :: 		case 128:
L_main16:
;Main.c,120 :: 		break;
J	L_main7
NOP	
;Main.c,121 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main17:
;Main.c,122 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions7+0
NOP	
;Main.c,123 :: 		break;
J	L_main7
NOP	
;Main.c,124 :: 		case 512:
L_main18:
;Main.c,125 :: 		break;
J	L_main7
NOP	
;Main.c,126 :: 		}
L_main6:
LH	R2, 4(SP)
BNE	R2, R0, L__main133
NOP	
J	L_main8
NOP	
L__main133:
LH	R3, 4(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__main135
NOP	
J	L_main9
NOP	
L__main135:
LH	R3, 4(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__main137
NOP	
J	L_main10
NOP	
L__main137:
LH	R3, 4(SP)
ORI	R2, R0, 8
BNE	R3, R2, L__main139
NOP	
J	L_main12
NOP	
L__main139:
LH	R3, 4(SP)
ORI	R2, R0, 16
BNE	R3, R2, L__main141
NOP	
J	L_main13
NOP	
L__main141:
LH	R3, 4(SP)
ORI	R2, R0, 32
BNE	R3, R2, L__main143
NOP	
J	L_main14
NOP	
L__main143:
LH	R3, 4(SP)
ORI	R2, R0, 64
BNE	R3, R2, L__main145
NOP	
J	L_main15
NOP	
L__main145:
LH	R3, 4(SP)
ORI	R2, R0, 128
BNE	R3, R2, L__main147
NOP	
J	L_main16
NOP	
L__main147:
LH	R3, 4(SP)
ORI	R2, R0, 256
BNE	R3, R2, L__main149
NOP	
J	L_main17
NOP	
L__main149:
LH	R3, 4(SP)
ORI	R2, R0, 512
BNE	R3, R2, L__main151
NOP	
J	L_main18
NOP	
L__main151:
L_main7:
;Main.c,127 :: 		}else{
J	L_main19
NOP	
L_main5:
;Main.c,128 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,129 :: 		}
L_main19:
;Main.c,131 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,136 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,141 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main152
NOP	
J	L_main20
NOP	
L__main152:
;Main.c,142 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main20:
;Main.c,158 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,159 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,160 :: 		}
J	L_main3
NOP	
;Main.c,161 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Modal_Group_Actions0:
;Main.c,166 :: 		int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,176 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions021
NOP	
;Main.c,177 :: 		case 2:  //NON_MODAL_DWELL
L_Modal_Group_Actions023:
;Main.c,178 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,180 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+118)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0155
NOP	
J	L_Modal_Group_Actions024
NOP	
L__Modal_Group_Actions0155:
;Main.c,181 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+118)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,182 :: 		while(i < dly_time){
L_Modal_Group_Actions025:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0156
NOP	
J	L_Modal_Group_Actions026
NOP	
L__Modal_Group_Actions0156:
;Main.c,183 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,184 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions027:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions027
NOP	
;Main.c,185 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,186 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions025
NOP	
L_Modal_Group_Actions026:
;Main.c,187 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Modal_Group_Actions029
NOP	
L_Modal_Group_Actions024:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0157
NOP	
J	L_Modal_Group_Actions030
NOP	
L__Modal_Group_Actions0157:
;Main.c,188 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,189 :: 		while(i < dly_time){
L_Modal_Group_Actions031:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0158
NOP	
J	L_Modal_Group_Actions032
NOP	
L__Modal_Group_Actions0158:
;Main.c,190 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,191 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions033:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions033
NOP	
;Main.c,192 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,193 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions031
NOP	
L_Modal_Group_Actions032:
;Main.c,194 :: 		}
L_Modal_Group_Actions030:
L_Modal_Group_Actions029:
;Main.c,195 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,196 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,197 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Modal_Group_Actions035:
;Main.c,210 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0160
NOP	
J	L__Modal_Group_Actions0120
NOP	
L__Modal_Group_Actions0160:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L__Modal_Group_Actions0162
NOP	
J	L__Modal_Group_Actions0119
NOP	
L__Modal_Group_Actions0162:
L__Modal_Group_Actions0118:
;Main.c,211 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,210 :: 		if(gc.L != 2 && gc.L != 20)
L__Modal_Group_Actions0120:
L__Modal_Group_Actions0119:
;Main.c,212 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Modal_Group_Actions0163
NOP	
J	L_Modal_Group_Actions039
NOP	
L__Modal_Group_Actions0163:
;Main.c,214 :: 		result = Settings_Write_Coord_Data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,215 :: 		if(result){ //response if write to flash failed
BNE	R2, R0, L__Modal_Group_Actions0165
NOP	
J	L_Modal_Group_Actions040
NOP	
L__Modal_Group_Actions0165:
;Main.c,216 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,217 :: 		}
L_Modal_Group_Actions040:
;Main.c,219 :: 		if (gc.coord_select > 0) {
LBU	R2, Offset(_gc+13)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0166
NOP	
J	L_Modal_Group_Actions041
NOP	
L__Modal_Group_Actions0166:
;Main.c,220 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,221 :: 		}
L_Modal_Group_Actions041:
;Main.c,222 :: 		} else {
J	L_Modal_Group_Actions042
NOP	
L_Modal_Group_Actions039:
;Main.c,228 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,229 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,230 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,234 :: 		axis_words = Get_Axisword();
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
;Main.c,235 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Modal_Group_Actions043:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0167
NOP	
J	L_Modal_Group_Actions044
NOP	
L__Modal_Group_Actions0167:
; axis_words end address is: 20 (R5)
;Main.c,236 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,238 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L__Modal_Group_Actions0168
NOP	
J	L_Modal_Group_Actions046
NOP	
L__Modal_Group_Actions0168:
;Main.c,239 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,240 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__Modal_Group_Actions0169
NOP	
J	L_Modal_Group_Actions047
NOP	
L__Modal_Group_Actions0169:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions044
NOP	
L_Modal_Group_Actions047:
;Main.c,242 :: 		_flash = buffA[indx];
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
;Main.c,246 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,252 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Modal_Group_Actions048
NOP	
L_Modal_Group_Actions046:
;Main.c,254 :: 		coord_data[i] = gc.next_position[i];
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
;Main.c,260 :: 		}
L_Modal_Group_Actions048:
;Main.c,261 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,235 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,262 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions043
NOP	
L_Modal_Group_Actions044:
;Main.c,264 :: 		result = Settings_Write_Coord_Data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
;Main.c,267 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,268 :: 		}
L_Modal_Group_Actions042:
;Main.c,270 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,271 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Modal_Group_Actions049:
;Main.c,272 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Modal_Group_Actions050:
;Main.c,275 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,280 :: 		if (axis_words) {
BNE	R2, R0, L__Modal_Group_Actions0171
NOP	
J	L_Modal_Group_Actions051
NOP	
L__Modal_Group_Actions0171:
;Main.c,282 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Modal_Group_Actions052:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0172
NOP	
J	L_Modal_Group_Actions053
NOP	
L__Modal_Group_Actions0172:
;Main.c,283 :: 		if ( bit_istrue(axis_words,bit(i+1)) ) {
ADDIU	R2, R5, 1
SEH	R3, R2
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0174
NOP	
J	L_Modal_Group_Actions055
NOP	
L__Modal_Group_Actions0174:
;Main.c,284 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Modal_Group_Actions0176
NOP	
J	L_Modal_Group_Actions056
NOP	
L__Modal_Group_Actions0176:
;Main.c,285 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,286 :: 		} else {
J	L_Modal_Group_Actions057
NOP	
L_Modal_Group_Actions056:
;Main.c,287 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,288 :: 		}
L_Modal_Group_Actions057:
;Main.c,289 :: 		} else {
J	L_Modal_Group_Actions058
NOP	
L_Modal_Group_Actions055:
;Main.c,290 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,291 :: 		}
L_Modal_Group_Actions058:
;Main.c,293 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+24)(GP)
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
;Main.c,294 :: 		while(GET_RunState(i));
L_Modal_Group_Actions059:
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
BNE	R2, R0, L__Modal_Group_Actions0178
NOP	
J	L_Modal_Group_Actions060
NOP	
L__Modal_Group_Actions0178:
J	L_Modal_Group_Actions059
NOP	
L_Modal_Group_Actions060:
;Main.c,282 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,295 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions052
NOP	
L_Modal_Group_Actions053:
;Main.c,296 :: 		}
L_Modal_Group_Actions051:
;Main.c,298 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
MOVZ	R6, R0, R0
;Main.c,300 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L__Modal_Group_Actions0179
NOP	
J	L__Modal_Group_Actions0121
NOP	
L__Modal_Group_Actions0179:
ORI	R6, R0, 1
; temp end address is: 24 (R6)
J	L_Modal_Group_Actions061
NOP	
L__Modal_Group_Actions0121:
L_Modal_Group_Actions061:
;Main.c,301 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,304 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Modal_Group_Actions062:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0180
NOP	
J	L_Modal_Group_Actions063
NOP	
L__Modal_Group_Actions0180:
;Main.c,305 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,306 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,311 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,314 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(_settings+24)(GP)
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
;Main.c,315 :: 		while(GET_RunState(j));
L_Modal_Group_Actions065:
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
BNE	R2, R0, L__Modal_Group_Actions0182
NOP	
J	L_Modal_Group_Actions066
NOP	
L__Modal_Group_Actions0182:
J	L_Modal_Group_Actions065
NOP	
L_Modal_Group_Actions066:
;Main.c,304 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,316 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Modal_Group_Actions062
NOP	
L_Modal_Group_Actions063:
;Main.c,318 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,319 :: 		case 16:
L_Modal_Group_Actions067:
;Main.c,320 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,321 :: 		case 53:
L_Modal_Group_Actions068:
;Main.c,322 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,326 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Modal_Group_Actions069:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0183
NOP	
J	L_Modal_Group_Actions070
NOP	
L__Modal_Group_Actions0183:
; axis_words end address is: 20 (R5)
;Main.c,327 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0185
NOP	
J	L_Modal_Group_Actions072
NOP	
L__Modal_Group_Actions0185:
;Main.c,328 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0186
NOP	
J	L_Modal_Group_Actions073
NOP	
L__Modal_Group_Actions0186:
;Main.c,329 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0187
NOP	
J	L_Modal_Group_Actions074
NOP	
L__Modal_Group_Actions0187:
;Main.c,330 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,331 :: 		} else {
J	L_Modal_Group_Actions075
NOP	
L_Modal_Group_Actions074:
;Main.c,332 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,333 :: 		}
L_Modal_Group_Actions075:
;Main.c,334 :: 		} else {
J	L_Modal_Group_Actions076
NOP	
L_Modal_Group_Actions073:
;Main.c,335 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,336 :: 		}
L_Modal_Group_Actions076:
;Main.c,337 :: 		}
L_Modal_Group_Actions072:
;Main.c,326 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,338 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions069
NOP	
L_Modal_Group_Actions070:
;Main.c,339 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,340 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Modal_Group_Actions077:
;Main.c,341 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,342 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L__Modal_Group_Actions0188
NOP	
J	L__Modal_Group_Actions0122
NOP	
L__Modal_Group_Actions0188:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 1
; temp end address is: 8 (R2)
J	L_Modal_Group_Actions078
NOP	
L__Modal_Group_Actions0122:
SEH	R2, R4
L_Modal_Group_Actions078:
;Main.c,343 :: 		Settings_Write_Coord_Data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+24)
ORI	R26, R26, lo_addr(_gc+24)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,344 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,345 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET
L_Modal_Group_Actions079:
;Main.c,346 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,347 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L__Modal_Group_Actions0189
NOP	
J	L_Modal_Group_Actions080
NOP	
L__Modal_Group_Actions0189:
; axis_words end address is: 20 (R5)
;Main.c,348 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,349 :: 		} else {
J	L_Modal_Group_Actions081
NOP	
L_Modal_Group_Actions080:
;Main.c,352 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Modal_Group_Actions082:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0190
NOP	
J	L_Modal_Group_Actions083
NOP	
L__Modal_Group_Actions0190:
; axis_words end address is: 20 (R5)
;Main.c,353 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0192
NOP	
J	L_Modal_Group_Actions085
NOP	
L__Modal_Group_Actions0192:
;Main.c,354 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,355 :: 		}
L_Modal_Group_Actions085:
;Main.c,352 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,356 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions082
NOP	
L_Modal_Group_Actions083:
;Main.c,357 :: 		}
L_Modal_Group_Actions081:
;Main.c,359 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Modal_Group_Actions086:
;Main.c,360 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,361 :: 		case 512:
L_Modal_Group_Actions087:
;Main.c,362 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,363 :: 		default: action = -1; //error in action msg ???
L_Modal_Group_Actions088:
ORI	R25, R0, 65535
;Main.c,364 :: 		break;
J	L_Modal_Group_Actions022
NOP	
;Main.c,365 :: 		}
L_Modal_Group_Actions021:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0194
NOP	
J	L_Modal_Group_Actions023
NOP	
L__Modal_Group_Actions0194:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions0196
NOP	
J	L_Modal_Group_Actions035
NOP	
L__Modal_Group_Actions0196:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions0198
NOP	
J	L_Modal_Group_Actions049
NOP	
L__Modal_Group_Actions0198:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L__Modal_Group_Actions0200
NOP	
J	L_Modal_Group_Actions050
NOP	
L__Modal_Group_Actions0200:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__Modal_Group_Actions0202
NOP	
J	L_Modal_Group_Actions067
NOP	
L__Modal_Group_Actions0202:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L__Modal_Group_Actions0204
NOP	
J	L_Modal_Group_Actions068
NOP	
L__Modal_Group_Actions0204:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L__Modal_Group_Actions0206
NOP	
J	L_Modal_Group_Actions077
NOP	
L__Modal_Group_Actions0206:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L__Modal_Group_Actions0208
NOP	
J	L_Modal_Group_Actions079
NOP	
L__Modal_Group_Actions0208:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L__Modal_Group_Actions0210
NOP	
J	L_Modal_Group_Actions086
NOP	
L__Modal_Group_Actions0210:
SEH	R3, R25
ORI	R2, R0, 512
BNE	R3, R2, L__Modal_Group_Actions0212
NOP	
J	L_Modal_Group_Actions087
NOP	
L__Modal_Group_Actions0212:
J	L_Modal_Group_Actions088
NOP	
L_Modal_Group_Actions022:
;Main.c,366 :: 		return action;
SEH	R2, R25
;Main.c,367 :: 		}
;Main.c,366 :: 		return action;
;Main.c,367 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _Modal_Group_Actions0
_Modal_Group_Actions1:
;Main.c,372 :: 		int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,373 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions189
NOP	
;Main.c,374 :: 		case 1: //b0000 0001
L_Modal_Group_Actions191:
;Main.c,375 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,376 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,377 :: 		case 2://b0000 0010
L_Modal_Group_Actions192:
;Main.c,378 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,379 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,380 :: 		case 3://b0000 0011
L_Modal_Group_Actions193:
;Main.c,383 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,386 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,387 :: 		case 4://b0000 0100
L_Modal_Group_Actions194:
;Main.c,388 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,389 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,390 :: 		case 5://b0000 0101
L_Modal_Group_Actions195:
;Main.c,391 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,392 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,393 :: 		case 6://b0000 0110
L_Modal_Group_Actions196:
;Main.c,394 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,395 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,396 :: 		case 8://b0000 1000
L_Modal_Group_Actions197:
;Main.c,397 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,398 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,399 :: 		case 9://b0000 1001
L_Modal_Group_Actions198:
;Main.c,400 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,401 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,402 :: 		case 10://b0000 1010
L_Modal_Group_Actions199:
;Main.c,403 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,404 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,405 :: 		case 12://b0000 1100
L_Modal_Group_Actions1100:
;Main.c,406 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,407 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,408 :: 		case 13://Homing X axis
L_Modal_Group_Actions1101:
;Main.c,409 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,410 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,411 :: 		case 14://Homing Y axis
L_Modal_Group_Actions1102:
;Main.c,412 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,413 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,414 :: 		case 15://Homing Y axis
L_Modal_Group_Actions1103:
;Main.c,415 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,416 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,417 :: 		default: action = 0;
L_Modal_Group_Actions1104:
MOVZ	R25, R0, R0
;Main.c,418 :: 		break;
J	L_Modal_Group_Actions190
NOP	
;Main.c,419 :: 		}
L_Modal_Group_Actions189:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Modal_Group_Actions1215
NOP	
J	L_Modal_Group_Actions191
NOP	
L__Modal_Group_Actions1215:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions1217
NOP	
J	L_Modal_Group_Actions192
NOP	
L__Modal_Group_Actions1217:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Modal_Group_Actions1219
NOP	
J	L_Modal_Group_Actions193
NOP	
L__Modal_Group_Actions1219:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions1221
NOP	
J	L_Modal_Group_Actions194
NOP	
L__Modal_Group_Actions1221:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Modal_Group_Actions1223
NOP	
J	L_Modal_Group_Actions195
NOP	
L__Modal_Group_Actions1223:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Modal_Group_Actions1225
NOP	
J	L_Modal_Group_Actions196
NOP	
L__Modal_Group_Actions1225:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions1227
NOP	
J	L_Modal_Group_Actions197
NOP	
L__Modal_Group_Actions1227:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Modal_Group_Actions1229
NOP	
J	L_Modal_Group_Actions198
NOP	
L__Modal_Group_Actions1229:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Modal_Group_Actions1231
NOP	
J	L_Modal_Group_Actions199
NOP	
L__Modal_Group_Actions1231:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Modal_Group_Actions1233
NOP	
J	L_Modal_Group_Actions1100
NOP	
L__Modal_Group_Actions1233:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Modal_Group_Actions1235
NOP	
J	L_Modal_Group_Actions1101
NOP	
L__Modal_Group_Actions1235:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Modal_Group_Actions1237
NOP	
J	L_Modal_Group_Actions1102
NOP	
L__Modal_Group_Actions1237:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Modal_Group_Actions1239
NOP	
J	L_Modal_Group_Actions1103
NOP	
L__Modal_Group_Actions1239:
J	L_Modal_Group_Actions1104
NOP	
L_Modal_Group_Actions190:
;Main.c,421 :: 		return action;
SEH	R2, R25
;Main.c,422 :: 		}
;Main.c,421 :: 		return action;
;Main.c,422 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Modal_Group_Actions1
_Modal_Group_Actions3:
;Main.c,428 :: 		int Modal_Group_Actions3(int action){
;Main.c,433 :: 		return action;
SEH	R2, R25
;Main.c,434 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of _Modal_Group_Actions3
_Modal_Group_Actions4:
;Main.c,439 :: 		int Modal_Group_Actions4(int action){
;Main.c,444 :: 		return action;
SEH	R2, R25
;Main.c,445 :: 		}
L_end_Modal_Group_Actions4:
JR	RA
NOP	
; end of _Modal_Group_Actions4
_Modal_Group_Actions7:
;Main.c,450 :: 		int Modal_Group_Actions7(int action){
;Main.c,455 :: 		return action;
SEH	R2, R25
;Main.c,456 :: 		}
L_end_Modal_Group_Actions7:
JR	RA
NOP	
; end of _Modal_Group_Actions7
_protocol_execute_runtime:
;Main.c,474 :: 		void protocol_execute_runtime(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,475 :: 		if (sys.execute) { // Enter only if any bit flag is true
SW	R25, 4(SP)
LBU	R2, Offset(_sys+25)(GP)
BNE	R2, R0, L__protocol_execute_runtime245
NOP	
J	L_protocol_execute_runtime105
NOP	
L__protocol_execute_runtime245:
;Main.c,476 :: 		uint8_t rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LBU	R4, Offset(_sys+25)(GP)
;Main.c,481 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 96
BNE	R2, R0, L__protocol_execute_runtime247
NOP	
J	L__protocol_execute_runtime124
NOP	
L__protocol_execute_runtime247:
;Main.c,482 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SB	R2, Offset(_sys+1)(GP)
;Main.c,485 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime249
NOP	
J	L_protocol_execute_runtime107
NOP	
L__protocol_execute_runtime249:
;Main.c,486 :: 		report_alarm_message(ALARM_HARD_LIMIT);
SB	R4, 8(SP)
ORI	R25, R0, 65535
JAL	_report_alarm_message+0
NOP	
;Main.c,487 :: 		report_feedback_message(MESSAGE_CRITICAL_EVENT);
ORI	R25, R0, 1
JAL	_report_feedback_message+0
NOP	
LBU	R4, 8(SP)
;Main.c,488 :: 		bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
ANDI	R3, R4, 255
;Main.c,489 :: 		do {
J	L_protocol_execute_runtime108
NOP	
L__protocol_execute_runtime123:
;Main.c,493 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Main.c,489 :: 		do {
L_protocol_execute_runtime108:
;Main.c,493 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 255
BNE	R2, R0, L__protocol_execute_runtime251
NOP	
J	L__protocol_execute_runtime123
NOP	
L__protocol_execute_runtime251:
; rt_exec end address is: 12 (R3)
;Main.c,496 :: 		} else {
; rt_exec start address is: 12 (R3)
ANDI	R4, R3, 255
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime111
NOP	
L_protocol_execute_runtime107:
;Main.c,500 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SB	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LBU	R4, 8(SP)
;Main.c,501 :: 		}
L_protocol_execute_runtime111:
;Main.c,502 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 159
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
;Main.c,503 :: 		}
J	L_protocol_execute_runtime106
NOP	
L__protocol_execute_runtime124:
;Main.c,481 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Main.c,503 :: 		}
L_protocol_execute_runtime106:
;Main.c,506 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime253
NOP	
J	L_protocol_execute_runtime112
NOP	
L__protocol_execute_runtime253:
; rt_exec end address is: 16 (R4)
;Main.c,507 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SB	R2, Offset(_sys+0)(GP)
;Main.c,508 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Main.c,509 :: 		}
L_protocol_execute_runtime112:
;Main.c,512 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime255
NOP	
J	L_protocol_execute_runtime113
NOP	
L__protocol_execute_runtime255:
;Main.c,513 :: 		report_realtime_status();
SB	R4, 8(SP)
JAL	_report_realtime_status+0
NOP	
LBU	R4, 8(SP)
;Main.c,514 :: 		bit_false(sys.execute,EXEC_STATUS_REPORT);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,515 :: 		}
L_protocol_execute_runtime113:
;Main.c,518 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime257
NOP	
J	L_protocol_execute_runtime114
NOP	
L__protocol_execute_runtime257:
;Main.c,520 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,521 :: 		}
L_protocol_execute_runtime114:
;Main.c,525 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime259
NOP	
J	L_protocol_execute_runtime115
NOP	
L__protocol_execute_runtime259:
;Main.c,527 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,528 :: 		}
L_protocol_execute_runtime115:
;Main.c,530 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime261
NOP	
J	L_protocol_execute_runtime116
NOP	
L__protocol_execute_runtime261:
;Main.c,532 :: 		if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
LH	R2, Offset(_settings+54)(GP)
ANDI	R2, R2, 2
SEH	R2, R2
BNE	R2, R0, L__protocol_execute_runtime263
NOP	
J	L_protocol_execute_runtime117
NOP	
L__protocol_execute_runtime263:
;Main.c,533 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SB	R2, Offset(_sys+24)(GP)
;Main.c,534 :: 		}
L_protocol_execute_runtime117:
;Main.c,535 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,536 :: 		}
L_protocol_execute_runtime116:
;Main.c,537 :: 		}
L_protocol_execute_runtime105:
;Main.c,541 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
