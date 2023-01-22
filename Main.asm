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
;Main.c,64 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,67 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,68 :: 		EnableInterrupts();
EI	R30
;Main.c,70 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,76 :: 		while(1){
L_main0:
;Main.c,78 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,79 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,82 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main110
NOP	
J	L_main2
NOP	
L__main110:
;Main.c,84 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,85 :: 		switch(modal_group){
J	L_main3
NOP	
;Main.c,86 :: 		case 0:break;
L_main5:
J	L_main4
NOP	
;Main.c,87 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main6:
;Main.c,88 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	_Modal_Group_Actions0+0
NOP	
;Main.c,89 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,90 :: 		break;
J	L_main4
NOP	
;Main.c,91 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,92 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,93 :: 		if(axis_to_run){
BNE	R2, R0, L__main112
NOP	
J	L_main8
NOP	
L__main112:
;Main.c,94 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,95 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	_Modal_Group_Actions1+0
NOP	
;Main.c,96 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,97 :: 		}
L_main8:
;Main.c,98 :: 		break;
J	L_main4
NOP	
;Main.c,99 :: 		case 8:
L_main9:
;Main.c,100 :: 		break;
J	L_main4
NOP	
;Main.c,101 :: 		case 16:
L_main10:
;Main.c,102 :: 		break;
J	L_main4
NOP	
;Main.c,103 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main11:
;Main.c,104 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions4+0
NOP	
;Main.c,105 :: 		break;
J	L_main4
NOP	
;Main.c,106 :: 		case 64:
L_main12:
;Main.c,107 :: 		break;
J	L_main4
NOP	
;Main.c,108 :: 		case 128:
L_main13:
;Main.c,109 :: 		break;
J	L_main4
NOP	
;Main.c,110 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main14:
;Main.c,111 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions7+0
NOP	
;Main.c,112 :: 		break;
J	L_main4
NOP	
;Main.c,113 :: 		case 512:
L_main15:
;Main.c,114 :: 		break;
J	L_main4
NOP	
;Main.c,115 :: 		}
L_main3:
LH	R2, 4(SP)
BNE	R2, R0, L__main114
NOP	
J	L_main5
NOP	
L__main114:
LH	R3, 4(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__main116
NOP	
J	L_main6
NOP	
L__main116:
LH	R3, 4(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__main118
NOP	
J	L_main7
NOP	
L__main118:
LH	R3, 4(SP)
ORI	R2, R0, 8
BNE	R3, R2, L__main120
NOP	
J	L_main9
NOP	
L__main120:
LH	R3, 4(SP)
ORI	R2, R0, 16
BNE	R3, R2, L__main122
NOP	
J	L_main10
NOP	
L__main122:
LH	R3, 4(SP)
ORI	R2, R0, 32
BNE	R3, R2, L__main124
NOP	
J	L_main11
NOP	
L__main124:
LH	R3, 4(SP)
ORI	R2, R0, 64
BNE	R3, R2, L__main126
NOP	
J	L_main12
NOP	
L__main126:
LH	R3, 4(SP)
ORI	R2, R0, 128
BNE	R3, R2, L__main128
NOP	
J	L_main13
NOP	
L__main128:
LH	R3, 4(SP)
ORI	R2, R0, 256
BNE	R3, R2, L__main130
NOP	
J	L_main14
NOP	
L__main130:
LH	R3, 4(SP)
ORI	R2, R0, 512
BNE	R3, R2, L__main132
NOP	
J	L_main15
NOP	
L__main132:
L_main4:
;Main.c,116 :: 		}else{
J	L_main16
NOP	
L_main2:
;Main.c,117 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,118 :: 		}
L_main16:
;Main.c,120 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,124 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,129 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main133
NOP	
J	L_main17
NOP	
L__main133:
;Main.c,130 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main17:
;Main.c,145 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,146 :: 		}
J	L_main0
NOP	
;Main.c,147 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Modal_Group_Actions0:
;Main.c,152 :: 		int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Main.c,162 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions018
NOP	
;Main.c,163 :: 		case 2:  //NON_MODAL_DWELL
L_Modal_Group_Actions020:
;Main.c,164 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,166 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+118)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0136
NOP	
J	L_Modal_Group_Actions021
NOP	
L__Modal_Group_Actions0136:
;Main.c,167 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+118)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,168 :: 		while(i < dly_time){
L_Modal_Group_Actions022:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0137
NOP	
J	L_Modal_Group_Actions023
NOP	
L__Modal_Group_Actions0137:
;Main.c,169 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,170 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions024:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions024
NOP	
;Main.c,171 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,172 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions022
NOP	
L_Modal_Group_Actions023:
;Main.c,173 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Modal_Group_Actions026
NOP	
L_Modal_Group_Actions021:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0138
NOP	
J	L_Modal_Group_Actions027
NOP	
L__Modal_Group_Actions0138:
;Main.c,174 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,175 :: 		while(i < dly_time){
L_Modal_Group_Actions028:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0139
NOP	
J	L_Modal_Group_Actions029
NOP	
L__Modal_Group_Actions0139:
;Main.c,176 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,177 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions030:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions030
NOP	
;Main.c,178 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,179 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions028
NOP	
L_Modal_Group_Actions029:
;Main.c,180 :: 		}
L_Modal_Group_Actions027:
L_Modal_Group_Actions026:
;Main.c,181 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,182 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,183 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Modal_Group_Actions032:
;Main.c,196 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0141
NOP	
J	L__Modal_Group_Actions0105
NOP	
L__Modal_Group_Actions0141:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L__Modal_Group_Actions0143
NOP	
J	L__Modal_Group_Actions0104
NOP	
L__Modal_Group_Actions0143:
L__Modal_Group_Actions0103:
;Main.c,197 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,196 :: 		if(gc.L != 2 && gc.L != 20)
L__Modal_Group_Actions0105:
L__Modal_Group_Actions0104:
;Main.c,198 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Modal_Group_Actions0144
NOP	
J	L_Modal_Group_Actions036
NOP	
L__Modal_Group_Actions0144:
;Main.c,200 :: 		result = Settings_Write_Coord_Data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,201 :: 		if(result){ //response if write to flash failed
BNE	R2, R0, L__Modal_Group_Actions0146
NOP	
J	L_Modal_Group_Actions037
NOP	
L__Modal_Group_Actions0146:
;Main.c,202 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,203 :: 		}
L_Modal_Group_Actions037:
;Main.c,205 :: 		if (gc.coord_select > 0) {
LBU	R2, Offset(_gc+13)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0147
NOP	
J	L_Modal_Group_Actions038
NOP	
L__Modal_Group_Actions0147:
;Main.c,206 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,207 :: 		}
L_Modal_Group_Actions038:
;Main.c,208 :: 		} else {
J	L_Modal_Group_Actions039
NOP	
L_Modal_Group_Actions036:
;Main.c,210 :: 		if(!Save_Row_From_Flash(FLASH_Settings_VAddr_P1))return;
SH	R25, 12(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
LH	R25, 12(SP)
BEQ	R2, R0, L__Modal_Group_Actions0148
NOP	
J	L_Modal_Group_Actions040
NOP	
L__Modal_Group_Actions0148:
J	L_end_Modal_Group_Actions0
NOP	
L_Modal_Group_Actions040:
;Main.c,214 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,215 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,216 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,219 :: 		axis_words = Get_Axisword();
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
;Main.c,220 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Modal_Group_Actions041:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0149
NOP	
J	L_Modal_Group_Actions042
NOP	
L__Modal_Group_Actions0149:
; axis_words end address is: 20 (R5)
;Main.c,221 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,223 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L__Modal_Group_Actions0150
NOP	
J	L_Modal_Group_Actions044
NOP	
L__Modal_Group_Actions0150:
;Main.c,224 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,225 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__Modal_Group_Actions0151
NOP	
J	L_Modal_Group_Actions045
NOP	
L__Modal_Group_Actions0151:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions042
NOP	
L_Modal_Group_Actions045:
;Main.c,226 :: 		_flash = buff[indx];
; i start address is: 24 (R6)
; indx start address is: 28 (R7)
; axis_cnt start address is: 16 (R4)
; axis_words start address is: 20 (R5)
SEH	R2, R7
SLL	R3, R2, 2
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _flash start address is: 32 (R8)
MOVZ	R8, R2, R0
;Main.c,227 :: 		coord_data[i] = ulong2flt(_flash);;
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
;Main.c,233 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Modal_Group_Actions046
NOP	
L_Modal_Group_Actions044:
;Main.c,234 :: 		coord_data[i] = gc.next_position[i];
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
;Main.c,240 :: 		}
L_Modal_Group_Actions046:
;Main.c,241 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,220 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,242 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions041
NOP	
L_Modal_Group_Actions042:
;Main.c,244 :: 		result = Settings_Write_Coord_Data((int)gc.P,coord_data);
ADDIU	R2, SP, 24
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
;Main.c,247 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 24
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,248 :: 		}
L_Modal_Group_Actions039:
;Main.c,250 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,251 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Modal_Group_Actions047:
;Main.c,252 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Modal_Group_Actions048:
;Main.c,255 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,260 :: 		if (axis_words) {
BNE	R2, R0, L__Modal_Group_Actions0153
NOP	
J	L_Modal_Group_Actions049
NOP	
L__Modal_Group_Actions0153:
;Main.c,262 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Modal_Group_Actions050:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0154
NOP	
J	L_Modal_Group_Actions051
NOP	
L__Modal_Group_Actions0154:
;Main.c,263 :: 		if ( bit_istrue(axis_words,bit(i+1)) ) {
ADDIU	R2, R5, 1
SEH	R3, R2
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0156
NOP	
J	L_Modal_Group_Actions053
NOP	
L__Modal_Group_Actions0156:
;Main.c,264 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Modal_Group_Actions0158
NOP	
J	L_Modal_Group_Actions054
NOP	
L__Modal_Group_Actions0158:
;Main.c,265 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,266 :: 		} else {
J	L_Modal_Group_Actions055
NOP	
L_Modal_Group_Actions054:
;Main.c,267 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,268 :: 		}
L_Modal_Group_Actions055:
;Main.c,269 :: 		} else {
J	L_Modal_Group_Actions056
NOP	
L_Modal_Group_Actions053:
;Main.c,270 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,271 :: 		}
L_Modal_Group_Actions056:
;Main.c,273 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
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
;Main.c,274 :: 		while(GET_RunState(i));
L_Modal_Group_Actions057:
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
BNE	R2, R0, L__Modal_Group_Actions0160
NOP	
J	L_Modal_Group_Actions058
NOP	
L__Modal_Group_Actions0160:
J	L_Modal_Group_Actions057
NOP	
L_Modal_Group_Actions058:
;Main.c,262 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,275 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Modal_Group_Actions050
NOP	
L_Modal_Group_Actions051:
;Main.c,276 :: 		}
L_Modal_Group_Actions049:
;Main.c,278 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 9
;Main.c,280 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L__Modal_Group_Actions0161
NOP	
J	L__Modal_Group_Actions0106
NOP	
L__Modal_Group_Actions0161:
ORI	R6, R0, 10
; temp end address is: 24 (R6)
J	L_Modal_Group_Actions059
NOP	
L__Modal_Group_Actions0106:
L_Modal_Group_Actions059:
;Main.c,281 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,284 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Modal_Group_Actions060:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0162
NOP	
J	L_Modal_Group_Actions061
NOP	
L__Modal_Group_Actions0162:
;Main.c,285 :: 		_data = buff[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,286 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,291 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,294 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,295 :: 		while(GET_RunState(j));
L_Modal_Group_Actions063:
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
BNE	R2, R0, L__Modal_Group_Actions0164
NOP	
J	L_Modal_Group_Actions064
NOP	
L__Modal_Group_Actions0164:
J	L_Modal_Group_Actions063
NOP	
L_Modal_Group_Actions064:
;Main.c,284 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,296 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Modal_Group_Actions060
NOP	
L_Modal_Group_Actions061:
;Main.c,298 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,299 :: 		case 16:
L_Modal_Group_Actions065:
;Main.c,300 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,301 :: 		case 53:
L_Modal_Group_Actions066:
;Main.c,302 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,306 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Modal_Group_Actions067:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0165
NOP	
J	L_Modal_Group_Actions068
NOP	
L__Modal_Group_Actions0165:
; axis_words end address is: 20 (R5)
;Main.c,307 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0167
NOP	
J	L_Modal_Group_Actions070
NOP	
L__Modal_Group_Actions0167:
;Main.c,308 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0168
NOP	
J	L_Modal_Group_Actions071
NOP	
L__Modal_Group_Actions0168:
;Main.c,309 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0169
NOP	
J	L_Modal_Group_Actions072
NOP	
L__Modal_Group_Actions0169:
;Main.c,310 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,311 :: 		} else {
J	L_Modal_Group_Actions073
NOP	
L_Modal_Group_Actions072:
;Main.c,312 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,313 :: 		}
L_Modal_Group_Actions073:
;Main.c,314 :: 		} else {
J	L_Modal_Group_Actions074
NOP	
L_Modal_Group_Actions071:
;Main.c,315 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,316 :: 		}
L_Modal_Group_Actions074:
;Main.c,317 :: 		}
L_Modal_Group_Actions070:
;Main.c,306 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,318 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions067
NOP	
L_Modal_Group_Actions068:
;Main.c,319 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,320 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Modal_Group_Actions075:
;Main.c,321 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 9
;Main.c,322 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L__Modal_Group_Actions0170
NOP	
J	L__Modal_Group_Actions0107
NOP	
L__Modal_Group_Actions0170:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 10
; temp end address is: 8 (R2)
J	L_Modal_Group_Actions076
NOP	
L__Modal_Group_Actions0107:
SEH	R2, R4
L_Modal_Group_Actions076:
;Main.c,323 :: 		Settings_Write_Coord_Data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+24)
ORI	R26, R26, lo_addr(_gc+24)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,324 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,325 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET
L_Modal_Group_Actions077:
;Main.c,326 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,327 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L__Modal_Group_Actions0171
NOP	
J	L_Modal_Group_Actions078
NOP	
L__Modal_Group_Actions0171:
; axis_words end address is: 20 (R5)
;Main.c,328 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,329 :: 		} else {
J	L_Modal_Group_Actions079
NOP	
L_Modal_Group_Actions078:
;Main.c,332 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Modal_Group_Actions080:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0172
NOP	
J	L_Modal_Group_Actions081
NOP	
L__Modal_Group_Actions0172:
; axis_words end address is: 20 (R5)
;Main.c,333 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0174
NOP	
J	L_Modal_Group_Actions083
NOP	
L__Modal_Group_Actions0174:
;Main.c,334 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,335 :: 		}
L_Modal_Group_Actions083:
;Main.c,332 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,336 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Modal_Group_Actions080
NOP	
L_Modal_Group_Actions081:
;Main.c,337 :: 		}
L_Modal_Group_Actions079:
;Main.c,339 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Modal_Group_Actions084:
;Main.c,340 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,341 :: 		case 512:
L_Modal_Group_Actions085:
;Main.c,342 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,343 :: 		default: action = -1; //error in action msg ???
L_Modal_Group_Actions086:
ORI	R25, R0, 65535
;Main.c,344 :: 		break;
J	L_Modal_Group_Actions019
NOP	
;Main.c,345 :: 		}
L_Modal_Group_Actions018:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0176
NOP	
J	L_Modal_Group_Actions020
NOP	
L__Modal_Group_Actions0176:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions0178
NOP	
J	L_Modal_Group_Actions032
NOP	
L__Modal_Group_Actions0178:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions0180
NOP	
J	L_Modal_Group_Actions047
NOP	
L__Modal_Group_Actions0180:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L__Modal_Group_Actions0182
NOP	
J	L_Modal_Group_Actions048
NOP	
L__Modal_Group_Actions0182:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__Modal_Group_Actions0184
NOP	
J	L_Modal_Group_Actions065
NOP	
L__Modal_Group_Actions0184:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L__Modal_Group_Actions0186
NOP	
J	L_Modal_Group_Actions066
NOP	
L__Modal_Group_Actions0186:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L__Modal_Group_Actions0188
NOP	
J	L_Modal_Group_Actions075
NOP	
L__Modal_Group_Actions0188:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L__Modal_Group_Actions0190
NOP	
J	L_Modal_Group_Actions077
NOP	
L__Modal_Group_Actions0190:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L__Modal_Group_Actions0192
NOP	
J	L_Modal_Group_Actions084
NOP	
L__Modal_Group_Actions0192:
SEH	R3, R25
ORI	R2, R0, 512
BNE	R3, R2, L__Modal_Group_Actions0194
NOP	
J	L_Modal_Group_Actions085
NOP	
L__Modal_Group_Actions0194:
J	L_Modal_Group_Actions086
NOP	
L_Modal_Group_Actions019:
;Main.c,346 :: 		return action;
SEH	R2, R25
;Main.c,347 :: 		}
;Main.c,346 :: 		return action;
;Main.c,347 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _Modal_Group_Actions0
_Modal_Group_Actions1:
;Main.c,352 :: 		int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,353 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions187
NOP	
;Main.c,354 :: 		case 1: //b0000 0001
L_Modal_Group_Actions189:
;Main.c,355 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,356 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,357 :: 		case 2://b0000 0010
L_Modal_Group_Actions190:
;Main.c,358 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,359 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,360 :: 		case 3://b0000 0011
L_Modal_Group_Actions191:
;Main.c,363 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,366 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,367 :: 		case 4://b0000 0100
L_Modal_Group_Actions192:
;Main.c,368 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,369 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,370 :: 		case 5://b0000 0101
L_Modal_Group_Actions193:
;Main.c,371 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,372 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,373 :: 		case 6://b0000 0110
L_Modal_Group_Actions194:
;Main.c,374 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,375 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,376 :: 		case 8://b0000 1000
L_Modal_Group_Actions195:
;Main.c,377 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,378 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,379 :: 		case 9://b0000 1001
L_Modal_Group_Actions196:
;Main.c,380 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,381 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,382 :: 		case 10://b0000 1010
L_Modal_Group_Actions197:
;Main.c,383 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,384 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,385 :: 		case 12://b0000 1100
L_Modal_Group_Actions198:
;Main.c,386 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,387 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,388 :: 		case 13://Homing X axis
L_Modal_Group_Actions199:
;Main.c,389 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,390 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,391 :: 		case 14://Homing Y axis
L_Modal_Group_Actions1100:
;Main.c,392 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,393 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,394 :: 		case 15://Homing Y axis
L_Modal_Group_Actions1101:
;Main.c,395 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,396 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,397 :: 		default: action = 0;
L_Modal_Group_Actions1102:
MOVZ	R25, R0, R0
;Main.c,398 :: 		break;
J	L_Modal_Group_Actions188
NOP	
;Main.c,399 :: 		}
L_Modal_Group_Actions187:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Modal_Group_Actions1197
NOP	
J	L_Modal_Group_Actions189
NOP	
L__Modal_Group_Actions1197:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions1199
NOP	
J	L_Modal_Group_Actions190
NOP	
L__Modal_Group_Actions1199:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Modal_Group_Actions1201
NOP	
J	L_Modal_Group_Actions191
NOP	
L__Modal_Group_Actions1201:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions1203
NOP	
J	L_Modal_Group_Actions192
NOP	
L__Modal_Group_Actions1203:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Modal_Group_Actions1205
NOP	
J	L_Modal_Group_Actions193
NOP	
L__Modal_Group_Actions1205:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Modal_Group_Actions1207
NOP	
J	L_Modal_Group_Actions194
NOP	
L__Modal_Group_Actions1207:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions1209
NOP	
J	L_Modal_Group_Actions195
NOP	
L__Modal_Group_Actions1209:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Modal_Group_Actions1211
NOP	
J	L_Modal_Group_Actions196
NOP	
L__Modal_Group_Actions1211:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Modal_Group_Actions1213
NOP	
J	L_Modal_Group_Actions197
NOP	
L__Modal_Group_Actions1213:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Modal_Group_Actions1215
NOP	
J	L_Modal_Group_Actions198
NOP	
L__Modal_Group_Actions1215:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Modal_Group_Actions1217
NOP	
J	L_Modal_Group_Actions199
NOP	
L__Modal_Group_Actions1217:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Modal_Group_Actions1219
NOP	
J	L_Modal_Group_Actions1100
NOP	
L__Modal_Group_Actions1219:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Modal_Group_Actions1221
NOP	
J	L_Modal_Group_Actions1101
NOP	
L__Modal_Group_Actions1221:
J	L_Modal_Group_Actions1102
NOP	
L_Modal_Group_Actions188:
;Main.c,401 :: 		return action;
SEH	R2, R25
;Main.c,402 :: 		}
;Main.c,401 :: 		return action;
;Main.c,402 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Modal_Group_Actions1
_Modal_Group_Actions3:
;Main.c,408 :: 		int Modal_Group_Actions3(int action){
;Main.c,413 :: 		return action;
SEH	R2, R25
;Main.c,414 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of _Modal_Group_Actions3
_Modal_Group_Actions4:
;Main.c,419 :: 		int Modal_Group_Actions4(int action){
;Main.c,424 :: 		return action;
SEH	R2, R25
;Main.c,425 :: 		}
L_end_Modal_Group_Actions4:
JR	RA
NOP	
; end of _Modal_Group_Actions4
_Modal_Group_Actions7:
;Main.c,430 :: 		int Modal_Group_Actions7(int action){
;Main.c,435 :: 		return action;
SEH	R2, R25
;Main.c,436 :: 		}
L_end_Modal_Group_Actions7:
JR	RA
NOP	
; end of _Modal_Group_Actions7
