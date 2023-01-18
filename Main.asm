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
ADDIU	SP, SP, -4
;Main.c,64 :: 		int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
;Main.c,68 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,69 :: 		cntr = a = axis_to_run = dif = status_of_gcode = 0;
SH	R0, 2(SP)
;Main.c,70 :: 		EnableInterrupts();
EI	R30
;Main.c,74 :: 		Delay_ms(1000);
LUI	R24, 1017
ORI	R24, R24, 16554
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
;Main.c,75 :: 		report_init_message();
JAL	_report_init_message+0
NOP	
;Main.c,77 :: 		while(1){
L_main2:
;Main.c,79 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,80 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,83 :: 		if(!status_of_gcode){
LH	R2, 2(SP)
BEQ	R2, R0, L__main121
NOP	
J	L_main4
NOP	
L__main121:
;Main.c,85 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,86 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,87 :: 		case 0:break;
L_main7:
J	L_main6
NOP	
;Main.c,88 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,89 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	_Modal_Group_Actions0+0
NOP	
;Main.c,90 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,91 :: 		break;
J	L_main6
NOP	
;Main.c,92 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,93 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,94 :: 		if(axis_to_run){
BNE	R2, R0, L__main123
NOP	
J	L_main10
NOP	
L__main123:
;Main.c,95 :: 		EnableSteppers(2);
ORI	R25, R0, 2
JAL	_EnableSteppers+0
NOP	
;Main.c,96 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 0(SP)
JAL	_Modal_Group_Actions1+0
NOP	
;Main.c,97 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
;Main.c,98 :: 		}
L_main10:
;Main.c,99 :: 		break;
J	L_main6
NOP	
;Main.c,100 :: 		case 8:
L_main11:
;Main.c,101 :: 		break;
J	L_main6
NOP	
;Main.c,102 :: 		case 16:
L_main12:
;Main.c,103 :: 		break;
J	L_main6
NOP	
;Main.c,104 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main13:
;Main.c,105 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions4+0
NOP	
;Main.c,106 :: 		break;
J	L_main6
NOP	
;Main.c,107 :: 		case 64:
L_main14:
;Main.c,108 :: 		break;
J	L_main6
NOP	
;Main.c,109 :: 		case 128:
L_main15:
;Main.c,110 :: 		break;
J	L_main6
NOP	
;Main.c,111 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main16:
;Main.c,112 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	_Modal_Group_Actions7+0
NOP	
;Main.c,113 :: 		break;
J	L_main6
NOP	
;Main.c,114 :: 		case 512:
L_main17:
;Main.c,115 :: 		break;
J	L_main6
NOP	
;Main.c,116 :: 		}
L_main5:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main125
NOP	
J	L_main7
NOP	
L__main125:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main127
NOP	
J	L_main8
NOP	
L__main127:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main129
NOP	
J	L_main9
NOP	
L__main129:
SEH	R3, R4
ORI	R2, R0, 8
BNE	R3, R2, L__main131
NOP	
J	L_main11
NOP	
L__main131:
SEH	R3, R4
ORI	R2, R0, 16
BNE	R3, R2, L__main133
NOP	
J	L_main12
NOP	
L__main133:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main135
NOP	
J	L_main13
NOP	
L__main135:
SEH	R3, R4
ORI	R2, R0, 64
BNE	R3, R2, L__main137
NOP	
J	L_main14
NOP	
L__main137:
SEH	R3, R4
ORI	R2, R0, 128
BNE	R3, R2, L__main139
NOP	
J	L_main15
NOP	
L__main139:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main141
NOP	
J	L_main16
NOP	
L__main141:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 512
BNE	R3, R2, L__main143
NOP	
J	L_main17
NOP	
L__main143:
L_main6:
;Main.c,117 :: 		}
L_main4:
;Main.c,118 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,122 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,127 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main144
NOP	
J	L_main18
NOP	
L__main144:
;Main.c,128 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main18:
;Main.c,143 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,144 :: 		}
J	L_main2
NOP	
;Main.c,145 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Modal_Group_Actions0:
;Main.c,150 :: 		int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -164
SW	RA, 0(SP)
;Main.c,160 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions019
NOP	
;Main.c,161 :: 		case 2:  //NON_MODAL_DWELL
L_Modal_Group_Actions021:
;Main.c,162 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,164 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+118)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0147
NOP	
J	L_Modal_Group_Actions022
NOP	
L__Modal_Group_Actions0147:
;Main.c,165 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+118)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,166 :: 		while(i < dly_time){
L_Modal_Group_Actions023:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0148
NOP	
J	L_Modal_Group_Actions024
NOP	
L__Modal_Group_Actions0148:
;Main.c,167 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,168 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions025:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions025
NOP	
;Main.c,169 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Main.c,170 :: 		}
SEH	R5, R2
; dly_time end address is: 16 (R4)
; i end address is: 8 (R2)
J	L_Modal_Group_Actions023
NOP	
L_Modal_Group_Actions024:
;Main.c,171 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Modal_Group_Actions027
NOP	
L_Modal_Group_Actions022:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+116)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0149
NOP	
J	L_Modal_Group_Actions028
NOP	
L__Modal_Group_Actions0149:
;Main.c,172 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+116)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,173 :: 		while(i < dly_time){
L_Modal_Group_Actions029:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__Modal_Group_Actions0150
NOP	
J	L_Modal_Group_Actions030
NOP	
L__Modal_Group_Actions0150:
;Main.c,174 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,175 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Modal_Group_Actions031:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Modal_Group_Actions031
NOP	
;Main.c,176 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Main.c,177 :: 		}
SEH	R5, R2
; dly_time end address is: 16 (R4)
; i end address is: 8 (R2)
J	L_Modal_Group_Actions029
NOP	
L_Modal_Group_Actions030:
;Main.c,178 :: 		}
L_Modal_Group_Actions028:
L_Modal_Group_Actions027:
;Main.c,179 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,180 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,181 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Modal_Group_Actions033:
;Main.c,194 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0152
NOP	
J	L__Modal_Group_Actions0118
NOP	
L__Modal_Group_Actions0152:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L__Modal_Group_Actions0154
NOP	
J	L__Modal_Group_Actions0117
NOP	
L__Modal_Group_Actions0154:
L__Modal_Group_Actions0116:
;Main.c,195 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,194 :: 		if(gc.L != 2 && gc.L != 20)
L__Modal_Group_Actions0118:
L__Modal_Group_Actions0117:
;Main.c,196 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Modal_Group_Actions0155
NOP	
J	L_Modal_Group_Actions037
NOP	
L__Modal_Group_Actions0155:
;Main.c,198 :: 		result = Settings_Write_Coord_Data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,199 :: 		if(result){ //response if write to flash failed
BNE	R2, R0, L__Modal_Group_Actions0157
NOP	
J	L_Modal_Group_Actions038
NOP	
L__Modal_Group_Actions0157:
;Main.c,200 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,201 :: 		}
L_Modal_Group_Actions038:
;Main.c,203 :: 		if (gc.coord_select > 0) {
LBU	R2, Offset(_gc+13)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Modal_Group_Actions0158
NOP	
J	L_Modal_Group_Actions039
NOP	
L__Modal_Group_Actions0158:
;Main.c,204 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+72)
ORI	R26, R26, lo_addr(_gc+72)
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,205 :: 		}
L_Modal_Group_Actions039:
;Main.c,206 :: 		} else {
J	L_Modal_Group_Actions040
NOP	
L_Modal_Group_Actions037:
;Main.c,208 :: 		if(!Save_Row_From_Flash(FLASH_Settings_VAddr_P1))return;
SH	R25, 12(SP)
LUI	R25, 48411
ORI	R25, R25, 49152
JAL	_Save_Row_From_Flash+0
NOP	
LH	R25, 12(SP)
BEQ	R2, R0, L__Modal_Group_Actions0159
NOP	
J	L_Modal_Group_Actions041
NOP	
L__Modal_Group_Actions0159:
J	L_end_Modal_Group_Actions0
NOP	
L_Modal_Group_Actions041:
;Main.c,212 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+116)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,213 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
SH	R2, 20(SP)
;Main.c,214 :: 		axis_cnt = 0;
SH	R0, 24(SP)
;Main.c,217 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,218 :: 		for(i = 0; i < 3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Modal_Group_Actions042:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0160
NOP	
J	L_Modal_Group_Actions043
NOP	
L__Modal_Group_Actions0160:
;Main.c,219 :: 		temp_axis = (axis_words >> i) & 1;
SEH	R3, R5
LH	R2, 18(SP)
SRAV	R2, R2, R3
ANDI	R2, R2, 1
SH	R2, 22(SP)
;Main.c,221 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L__Modal_Group_Actions0161
NOP	
J	L_Modal_Group_Actions045
NOP	
L__Modal_Group_Actions0161:
;Main.c,222 :: 		axis_cnt++;
LH	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;Main.c,223 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__Modal_Group_Actions0162
NOP	
J	L_Modal_Group_Actions046
NOP	
L__Modal_Group_Actions0162:
; i end address is: 20 (R5)
J	L_Modal_Group_Actions043
NOP	
L_Modal_Group_Actions046:
;Main.c,224 :: 		_flash = buff[indx];
; i start address is: 20 (R5)
LH	R2, 20(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _flash start address is: 16 (R4)
MOVZ	R4, R2, R0
;Main.c,225 :: 		coord_data[i] = ulong2flt(_flash);;
ADDIU	R3, SP, 32
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 160(SP)
SH	R5, 12(SP)
; _flash end address is: 16 (R4)
SH	R25, 14(SP)
MOVZ	R25, R4, R0
JAL	_ulong2flt+0
NOP	
LH	R25, 14(SP)
LH	R5, 12(SP)
LW	R2, 160(SP)
SWC1	S0, 0(R2)
; i end address is: 20 (R5)
SEH	R4, R5
;Main.c,227 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions047:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0164
NOP	
J	L_Modal_Group_Actions048
NOP	
L__Modal_Group_Actions0164:
J	L_Modal_Group_Actions047
NOP	
L_Modal_Group_Actions048:
;Main.c,229 :: 		temp_axis,i,coord_data[i],indx);
ADDIU	R3, SP, 32
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
;Main.c,228 :: 		dma_printf("temp_axis:= %d\tcoord_data[%d]:=%f\tindx:= %d\n",
ADDIU	R23, SP, 48
ADDIU	R22, R23, 45
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 48
;Main.c,229 :: 		temp_axis,i,coord_data[i],indx);
LH	R2, 20(SP)
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -20
SH	R2, 16(SP)
SWC1	S0, 12(SP)
SH	R4, 8(SP)
LH	R2, 42(SP)
SH	R2, 4(SP)
;Main.c,228 :: 		dma_printf("temp_axis:= %d\tcoord_data[%d]:=%f\tindx:= %d\n",
SW	R3, 0(SP)
;Main.c,229 :: 		temp_axis,i,coord_data[i],indx);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
LH	R25, 14(SP)
LH	R4, 12(SP)
;Main.c,231 :: 		}else{
SEH	R3, R4
; i end address is: 16 (R4)
J	L_Modal_Group_Actions049
NOP	
L_Modal_Group_Actions045:
;Main.c,232 :: 		coord_data[i] = gc.next_position[i];
; i start address is: 20 (R5)
ADDIU	R3, SP, 32
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; i end address is: 20 (R5)
SEH	R4, R5
;Main.c,234 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions050:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0166
NOP	
J	L_Modal_Group_Actions051
NOP	
L__Modal_Group_Actions0166:
J	L_Modal_Group_Actions050
NOP	
L_Modal_Group_Actions051:
;Main.c,236 :: 		,i,gc.next_position[i]);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;Main.c,235 :: 		dma_printf("gc.next_position[%d]:= %f\n"
ADDIU	R23, SP, 93
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 93
;Main.c,236 :: 		,i,gc.next_position[i]);
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
SH	R4, 4(SP)
;Main.c,235 :: 		dma_printf("gc.next_position[%d]:= %f\n"
SW	R2, 0(SP)
;Main.c,236 :: 		,i,gc.next_position[i]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
; i end address is: 16 (R4)
LH	R25, 14(SP)
LH	R4, 12(SP)
SEH	R3, R4
;Main.c,238 :: 		}
L_Modal_Group_Actions049:
;Main.c,239 :: 		indx++;
; i start address is: 12 (R3)
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;Main.c,218 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,240 :: 		}
; i end address is: 20 (R5)
J	L_Modal_Group_Actions042
NOP	
L_Modal_Group_Actions043:
;Main.c,242 :: 		result = Settings_Write_Coord_Data((int)gc.P,coord_data);
ADDIU	R2, SP, 32
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+116)(GP)
JAL	_Settings_Write_Coord_Data+0
NOP	
;Main.c,245 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 32
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+40)
ORI	R25, R25, lo_addr(_gc+40)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,246 :: 		}
L_Modal_Group_Actions040:
;Main.c,248 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,249 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Modal_Group_Actions052:
;Main.c,250 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Modal_Group_Actions053:
;Main.c,253 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,255 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions054:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0168
NOP	
J	L_Modal_Group_Actions055
NOP	
L__Modal_Group_Actions0168:
J	L_Modal_Group_Actions054
NOP	
L_Modal_Group_Actions055:
;Main.c,256 :: 		dma_printf("axis_words:= %d\n",axis_words);
ADDIU	R23, SP, 120
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 120
LH	R2, 18(SP)
SH	R25, 12(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 12(SP)
;Main.c,258 :: 		if (axis_words) {
LH	R2, 18(SP)
BNE	R2, R0, L__Modal_Group_Actions0170
NOP	
J	L_Modal_Group_Actions056
NOP	
L__Modal_Group_Actions0170:
;Main.c,260 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Modal_Group_Actions057:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0171
NOP	
J	L_Modal_Group_Actions058
NOP	
L__Modal_Group_Actions0171:
;Main.c,261 :: 		if ( bit_istrue(axis_words,bit(i+1)) ) {
ADDIU	R2, R5, 1
SEH	R3, R2
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0173
NOP	
J	L_Modal_Group_Actions060
NOP	
L__Modal_Group_Actions0173:
;Main.c,262 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L__Modal_Group_Actions0175
NOP	
J	L_Modal_Group_Actions061
NOP	
L__Modal_Group_Actions0175:
;Main.c,263 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,264 :: 		} else {
J	L_Modal_Group_Actions062
NOP	
L_Modal_Group_Actions061:
;Main.c,265 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,266 :: 		}
L_Modal_Group_Actions062:
;Main.c,267 :: 		} else {
J	L_Modal_Group_Actions063
NOP	
L_Modal_Group_Actions060:
;Main.c,268 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,269 :: 		}
L_Modal_Group_Actions063:
;Main.c,271 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+72)
ORI	R2, R2, lo_addr(_gc+72)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SH	R5, 12(SP)
SH	R25, 14(SP)
SEH	R26, R5
MOVZ	R25, R4, R0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
; i end address is: 20 (R5)
LH	R25, 14(SP)
LH	R5, 12(SP)
SEH	R3, R5
;Main.c,272 :: 		while(GET_RunState(i));
L_Modal_Group_Actions064:
; i start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
SEH	R25, R3
JAL	_GET_RunState+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0177
NOP	
J	L_Modal_Group_Actions065
NOP	
L__Modal_Group_Actions0177:
J	L_Modal_Group_Actions064
NOP	
L_Modal_Group_Actions065:
;Main.c,260 :: 		for (i=0; i<NoOfAxis; i++){ // Axes indices are consistent, so loop may be used.
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,273 :: 		}
; i end address is: 20 (R5)
J	L_Modal_Group_Actions057
NOP	
L_Modal_Group_Actions058:
;Main.c,274 :: 		}
L_Modal_Group_Actions056:
;Main.c,276 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
ORI	R2, R0, 9
SH	R2, 26(SP)
;Main.c,278 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L__Modal_Group_Actions0178
NOP	
J	L_Modal_Group_Actions066
NOP	
L__Modal_Group_Actions0178:
ORI	R2, R0, 10
SH	R2, 26(SP)
L_Modal_Group_Actions066:
;Main.c,279 :: 		i = (temp)*4 ; //place the new data into the correct position
LH	R2, 26(SP)
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,282 :: 		for(j = 0;j<4;j++){
SH	R0, 16(SP)
; i end address is: 24 (R6)
SEH	R4, R6
L_Modal_Group_Actions067:
; i start address is: 16 (R4)
LH	R2, 16(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__Modal_Group_Actions0179
NOP	
J	L_Modal_Group_Actions068
NOP	
L__Modal_Group_Actions0179:
;Main.c,283 :: 		_data = buff[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R2, 28(SP)
;Main.c,284 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
LH	R2, 26(SP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LH	R2, 16(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 160(SP)
SH	R4, 12(SP)
SH	R25, 14(SP)
LW	R25, 28(SP)
JAL	_ulong2flt+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
LW	R2, 160(SP)
SWC1	S0, 0(R2)
; i end address is: 16 (R4)
;Main.c,286 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions070:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0181
NOP	
J	L_Modal_Group_Actions071
NOP	
L__Modal_Group_Actions0181:
J	L_Modal_Group_Actions070
NOP	
L_Modal_Group_Actions071:
;Main.c,287 :: 		dma_printf("coord[%d]:= %f\n",j,_data);
ADDIU	R23, SP, 137
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr4_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 137
LW	R2, 28(SP)
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R2, 28(SP)
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 14(SP)
LH	R4, 12(SP)
;Main.c,289 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,292 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(_settings+24)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
LH	R2, 26(SP)
SLL	R3, R2, 5
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
LH	R2, 16(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
SH	R5, 12(SP)
SH	R25, 14(SP)
LH	R26, 16(SP)
MOVZ	R25, R4, R0
MOV.S 	S12, S0
JAL	_SingleAxisStep+0
NOP	
; i end address is: 20 (R5)
LH	R25, 14(SP)
LH	R5, 12(SP)
SEH	R3, R5
;Main.c,293 :: 		while(GET_RunState(j));
L_Modal_Group_Actions072:
; i start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
LH	R25, 16(SP)
JAL	_GET_RunState+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L__Modal_Group_Actions0183
NOP	
J	L_Modal_Group_Actions073
NOP	
L__Modal_Group_Actions0183:
J	L_Modal_Group_Actions072
NOP	
L_Modal_Group_Actions073:
;Main.c,282 :: 		for(j = 0;j<4;j++){
LH	R2, 16(SP)
ADDIU	R2, R2, 1
SH	R2, 16(SP)
;Main.c,294 :: 		}
SEH	R4, R3
; i end address is: 12 (R3)
J	L_Modal_Group_Actions067
NOP	
L_Modal_Group_Actions068:
;Main.c,296 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,297 :: 		case 16:
L_Modal_Group_Actions074:
;Main.c,298 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,299 :: 		case 53:
L_Modal_Group_Actions075:
;Main.c,300 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,304 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
SEH	R5, R6
L_Modal_Group_Actions076:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0184
NOP	
J	L_Modal_Group_Actions077
NOP	
L__Modal_Group_Actions0184:
;Main.c,305 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0186
NOP	
J	L_Modal_Group_Actions079
NOP	
L__Modal_Group_Actions0186:
;Main.c,306 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0187
NOP	
J	L_Modal_Group_Actions080
NOP	
L__Modal_Group_Actions0187:
;Main.c,307 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L__Modal_Group_Actions0188
NOP	
J	L_Modal_Group_Actions081
NOP	
L__Modal_Group_Actions0188:
;Main.c,308 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,309 :: 		} else {
J	L_Modal_Group_Actions082
NOP	
L_Modal_Group_Actions081:
;Main.c,310 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,311 :: 		}
L_Modal_Group_Actions082:
;Main.c,312 :: 		} else {
J	L_Modal_Group_Actions083
NOP	
L_Modal_Group_Actions080:
;Main.c,313 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,314 :: 		}
L_Modal_Group_Actions083:
;Main.c,315 :: 		}
L_Modal_Group_Actions079:
;Main.c,304 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,316 :: 		}
SEH	R5, R6
; i end address is: 24 (R6)
J	L_Modal_Group_Actions076
NOP	
L_Modal_Group_Actions077:
;Main.c,317 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,318 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Modal_Group_Actions084:
;Main.c,319 :: 		temp = SETTING_INDEX_G28;
ORI	R2, R0, 9
SH	R2, 26(SP)
;Main.c,320 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L__Modal_Group_Actions0189
NOP	
J	L_Modal_Group_Actions085
NOP	
L__Modal_Group_Actions0189:
ORI	R2, R0, 10
SH	R2, 26(SP)
L_Modal_Group_Actions085:
;Main.c,321 :: 		Settings_Write_Coord_Data(temp,gc.position);
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+24)
ORI	R26, R26, lo_addr(_gc+24)
LH	R25, 26(SP)
JAL	_Settings_Write_Coord_Data+0
NOP	
LH	R25, 12(SP)
;Main.c,322 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,323 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET
L_Modal_Group_Actions086:
;Main.c,324 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,325 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L__Modal_Group_Actions0190
NOP	
J	L_Modal_Group_Actions087
NOP	
L__Modal_Group_Actions0190:
;Main.c,326 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,327 :: 		} else {
J	L_Modal_Group_Actions088
NOP	
L_Modal_Group_Actions087:
;Main.c,330 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
SEH	R5, R6
L_Modal_Group_Actions089:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L__Modal_Group_Actions0191
NOP	
J	L_Modal_Group_Actions090
NOP	
L__Modal_Group_Actions0191:
;Main.c,331 :: 		if (bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L__Modal_Group_Actions0193
NOP	
J	L_Modal_Group_Actions092
NOP	
L__Modal_Group_Actions0193:
;Main.c,332 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R5
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
;Main.c,333 :: 		}
L_Modal_Group_Actions092:
;Main.c,330 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,334 :: 		}
SEH	R5, R6
; i end address is: 24 (R6)
J	L_Modal_Group_Actions089
NOP	
L_Modal_Group_Actions090:
;Main.c,335 :: 		}
L_Modal_Group_Actions088:
;Main.c,337 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Modal_Group_Actions093:
;Main.c,338 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,339 :: 		case 512:
L_Modal_Group_Actions094:
;Main.c,340 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,341 :: 		default: action = -1; //error in action msg ???
L_Modal_Group_Actions095:
ORI	R25, R0, 65535
;Main.c,342 :: 		break;
J	L_Modal_Group_Actions020
NOP	
;Main.c,343 :: 		}
L_Modal_Group_Actions019:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions0195
NOP	
J	L_Modal_Group_Actions021
NOP	
L__Modal_Group_Actions0195:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions0197
NOP	
J	L_Modal_Group_Actions033
NOP	
L__Modal_Group_Actions0197:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions0199
NOP	
J	L_Modal_Group_Actions052
NOP	
L__Modal_Group_Actions0199:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L__Modal_Group_Actions0201
NOP	
J	L_Modal_Group_Actions053
NOP	
L__Modal_Group_Actions0201:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__Modal_Group_Actions0203
NOP	
J	L_Modal_Group_Actions074
NOP	
L__Modal_Group_Actions0203:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L__Modal_Group_Actions0205
NOP	
J	L_Modal_Group_Actions075
NOP	
L__Modal_Group_Actions0205:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L__Modal_Group_Actions0207
NOP	
J	L_Modal_Group_Actions084
NOP	
L__Modal_Group_Actions0207:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L__Modal_Group_Actions0209
NOP	
J	L_Modal_Group_Actions086
NOP	
L__Modal_Group_Actions0209:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L__Modal_Group_Actions0211
NOP	
J	L_Modal_Group_Actions093
NOP	
L__Modal_Group_Actions0211:
SEH	R3, R25
ORI	R2, R0, 512
BNE	R3, R2, L__Modal_Group_Actions0213
NOP	
J	L_Modal_Group_Actions094
NOP	
L__Modal_Group_Actions0213:
J	L_Modal_Group_Actions095
NOP	
L_Modal_Group_Actions020:
;Main.c,344 :: 		return action;
SEH	R2, R25
;Main.c,345 :: 		}
;Main.c,344 :: 		return action;
;Main.c,345 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 164
JR	RA
NOP	
; end of _Modal_Group_Actions0
_Modal_Group_Actions1:
;Main.c,350 :: 		int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,351 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Modal_Group_Actions196
NOP	
;Main.c,352 :: 		case 1: //b0000 0001
L_Modal_Group_Actions198:
;Main.c,353 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,354 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,355 :: 		case 2://b0000 0010
L_Modal_Group_Actions199:
;Main.c,356 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,357 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,358 :: 		case 3://b0000 0011
L_Modal_Group_Actions1100:
;Main.c,361 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+76)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,364 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,365 :: 		case 4://b0000 0100
L_Modal_Group_Actions1101:
;Main.c,366 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,367 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,368 :: 		case 5://b0000 0101
L_Modal_Group_Actions1102:
;Main.c,369 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,370 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,371 :: 		case 6://b0000 0110
L_Modal_Group_Actions1103:
;Main.c,372 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,373 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,374 :: 		case 8://b0000 1000
L_Modal_Group_Actions1104:
;Main.c,375 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LH	R25, Offset(_gc+14)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,376 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,377 :: 		case 9://b0000 1001
L_Modal_Group_Actions1105:
;Main.c,378 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+72)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,379 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,380 :: 		case 10://b0000 1010
L_Modal_Group_Actions1106:
;Main.c,381 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,382 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,383 :: 		case 12://b0000 1100
L_Modal_Group_Actions1107:
;Main.c,384 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LH	R27, Offset(_gc+14)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,385 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,386 :: 		case 13://Homing X axis
L_Modal_Group_Actions1108:
;Main.c,387 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,388 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,389 :: 		case 14://Homing Y axis
L_Modal_Group_Actions1109:
;Main.c,390 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,391 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,392 :: 		case 15://Homing Y axis
L_Modal_Group_Actions1110:
;Main.c,393 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,394 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,395 :: 		default: action = 0;
L_Modal_Group_Actions1111:
MOVZ	R25, R0, R0
;Main.c,396 :: 		break;
J	L_Modal_Group_Actions197
NOP	
;Main.c,397 :: 		}
L_Modal_Group_Actions196:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Modal_Group_Actions1216
NOP	
J	L_Modal_Group_Actions198
NOP	
L__Modal_Group_Actions1216:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Modal_Group_Actions1218
NOP	
J	L_Modal_Group_Actions199
NOP	
L__Modal_Group_Actions1218:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Modal_Group_Actions1220
NOP	
J	L_Modal_Group_Actions1100
NOP	
L__Modal_Group_Actions1220:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Modal_Group_Actions1222
NOP	
J	L_Modal_Group_Actions1101
NOP	
L__Modal_Group_Actions1222:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Modal_Group_Actions1224
NOP	
J	L_Modal_Group_Actions1102
NOP	
L__Modal_Group_Actions1224:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Modal_Group_Actions1226
NOP	
J	L_Modal_Group_Actions1103
NOP	
L__Modal_Group_Actions1226:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Modal_Group_Actions1228
NOP	
J	L_Modal_Group_Actions1104
NOP	
L__Modal_Group_Actions1228:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Modal_Group_Actions1230
NOP	
J	L_Modal_Group_Actions1105
NOP	
L__Modal_Group_Actions1230:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Modal_Group_Actions1232
NOP	
J	L_Modal_Group_Actions1106
NOP	
L__Modal_Group_Actions1232:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Modal_Group_Actions1234
NOP	
J	L_Modal_Group_Actions1107
NOP	
L__Modal_Group_Actions1234:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__Modal_Group_Actions1236
NOP	
J	L_Modal_Group_Actions1108
NOP	
L__Modal_Group_Actions1236:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__Modal_Group_Actions1238
NOP	
J	L_Modal_Group_Actions1109
NOP	
L__Modal_Group_Actions1238:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__Modal_Group_Actions1240
NOP	
J	L_Modal_Group_Actions1110
NOP	
L__Modal_Group_Actions1240:
J	L_Modal_Group_Actions1111
NOP	
L_Modal_Group_Actions197:
;Main.c,399 :: 		return action;
SEH	R2, R25
;Main.c,400 :: 		}
;Main.c,399 :: 		return action;
;Main.c,400 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Modal_Group_Actions1
_Modal_Group_Actions3:
;Main.c,406 :: 		int Modal_Group_Actions3(int action){
;Main.c,411 :: 		return action;
SEH	R2, R25
;Main.c,412 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of _Modal_Group_Actions3
_Modal_Group_Actions4:
;Main.c,417 :: 		int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,419 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions4112:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Modal_Group_Actions4244
NOP	
J	L_Modal_Group_Actions4113
NOP	
L__Modal_Group_Actions4244:
J	L_Modal_Group_Actions4112
NOP	
L_Modal_Group_Actions4113:
;Main.c,420 :: 		dma_printf("GROUP_4 modal actions\n");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr5_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 4(SP)
;Main.c,422 :: 		return action;
SEH	R2, R25
;Main.c,423 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Modal_Group_Actions4
_Modal_Group_Actions7:
;Main.c,428 :: 		int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,430 :: 		while(DMA_IsOn(1));
L_Modal_Group_Actions7114:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L__Modal_Group_Actions7247
NOP	
J	L_Modal_Group_Actions7115
NOP	
L__Modal_Group_Actions7247:
J	L_Modal_Group_Actions7114
NOP	
L_Modal_Group_Actions7115:
;Main.c,431 :: 		dma_printf("GROUP_7 modal actions\n");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr6_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 4(SP)
;Main.c,433 :: 		return action;
SEH	R2, R25
;Main.c,434 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _Modal_Group_Actions7
