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
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,67 :: 		void main() {
ADDIU	SP, SP, -44
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
BNE	R3, R2, L__main153
NOP	
J	L__main144
NOP	
L__main153:
LH	R2, 0(SP)
BNE	R2, R0, L__main155
NOP	
J	L__main143
NOP	
L__main155:
J	L_main4
NOP	
L__main144:
L__main143:
;Main.c,93 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 10(SP)
;Main.c,95 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
; modal_group start address is: 16 (R4)
SEH	R4, R2
;Main.c,98 :: 		switch(modal_group){
J	L_main5
NOP	
; modal_group end address is: 16 (R4)
;Main.c,99 :: 		case 0:FAIL(STATUS_OK);break;
L_main7:
MOVZ	R25, R0, R0
JAL	_FAIL+0
NOP	
J	L_main6
NOP	
;Main.c,100 :: 		case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
L_main8:
;Main.c,101 :: 		modal_action = Modal_Group_Actions0(Get_modalword());
JAL	_Get_modalword+0
NOP	
SEH	R25, R2
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,102 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,103 :: 		report_status_message(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
;Main.c,104 :: 		break;
J	L_main6
NOP	
;Main.c,105 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main9:
;Main.c,106 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 10(SP)
;Main.c,110 :: 		while(DMA_IsOn(1));
L_main10:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main157
NOP	
J	L_main11
NOP	
L__main157:
J	L_main10
NOP	
L_main11:
;Main.c,111 :: 		dma_printf("%s %d\n","axis_to_run:=",axis_to_run);//,axis_to_run);
ORI	R30, R0, 37
SB	R30, 2(SP)
ORI	R30, R0, 115
SB	R30, 3(SP)
ORI	R30, R0, 32
SB	R30, 4(SP)
ORI	R30, R0, 37
SB	R30, 5(SP)
ORI	R30, R0, 100
SB	R30, 6(SP)
ORI	R30, R0, 10
SB	R30, 7(SP)
MOVZ	R30, R0, R0
SB	R30, 8(SP)
ADDIU	R3, SP, 2
LH	R2, 10(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Main+0)
ORI	R2, R2, lo_addr(?lstr_2_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,116 :: 		EnableSteppers(ALL_AXIS);
ORI	R25, R0, 7
JAL	_EnableSteppers+0
NOP	
;Main.c,117 :: 		Modal_Group_Actions1(axis_to_run);
LH	R25, 10(SP)
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,118 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 10(SP)
;Main.c,119 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,120 :: 		break;
J	L_main6
NOP	
;Main.c,123 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main12:
;Main.c,124 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,125 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,126 :: 		break;
J	L_main6
NOP	
;Main.c,129 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main13:
;Main.c,130 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,131 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,132 :: 		break;
J	L_main6
NOP	
;Main.c,133 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main14:
;Main.c,134 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,135 :: 		modal_group = Rst_modalgroup();
JAL	_Rst_modalgroup+0
NOP	
;Main.c,136 :: 		break;
J	L_main6
NOP	
;Main.c,137 :: 		case 1024: //$H Home all axis
L_main15:
;Main.c,139 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 7
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,144 :: 		if(modal_action == 0)modal_group = Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main158
NOP	
J	L_main16
NOP	
L__main158:
JAL	_Rst_modalgroup+0
NOP	
L_main16:
;Main.c,145 :: 		break;
J	L_main6
NOP	
;Main.c,146 :: 		}
L_main5:
; modal_group start address is: 16 (R4)
SEH	R2, R4
BNE	R2, R0, L__main160
NOP	
J	L_main7
NOP	
L__main160:
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L__main162
NOP	
J	L_main8
NOP	
L__main162:
SEH	R3, R4
ORI	R2, R0, 4
BNE	R3, R2, L__main164
NOP	
J	L_main9
NOP	
L__main164:
SEH	R3, R4
ORI	R2, R0, 32
BNE	R3, R2, L__main166
NOP	
J	L_main12
NOP	
L__main166:
SEH	R3, R4
ORI	R2, R0, 256
BNE	R3, R2, L__main168
NOP	
J	L_main13
NOP	
L__main168:
SEH	R3, R4
ORI	R2, R0, 512
BNE	R3, R2, L__main170
NOP	
J	L_main14
NOP	
L__main170:
SEH	R3, R4
; modal_group end address is: 16 (R4)
ORI	R2, R0, 1024
BNE	R3, R2, L__main172
NOP	
J	L_main15
NOP	
L__main172:
L_main6:
;Main.c,147 :: 		}
L_main4:
;Main.c,149 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed){
JAL	_Get_Axis_Enable_States+0
NOP	
BEQ	R2, R0, L__main173
NOP	
J	L__main147
NOP	
L__main173:
LH	R2, Offset(_SV+4)(GP)
BNE	R2, R0, L__main175
NOP	
J	L__main146
NOP	
L__main175:
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__main176
NOP	
J	L__main145
NOP	
L__main176:
L__main141:
;Main.c,159 :: 		report_status_message(status_of_gcode);
LH	R25, 0(SP)
JAL	_report_status_message+0
NOP	
;Main.c,161 :: 		SV.Tog = 0;
SH	R0, Offset(_SV+4)(GP)
;Main.c,149 :: 		if(!Get_Axis_Enable_States() && SV.Tog && !SV.homed){
L__main147:
L__main146:
L__main145:
;Main.c,166 :: 		if(!SV.Tog){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__main177
NOP	
J	L_main20
NOP	
L__main177:
;Main.c,167 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LHU	R2, Offset(_STPS+6)(GP)
BEQ	R2, R0, L__main178
NOP	
J	L__main149
NOP	
L__main178:
LHU	R2, Offset(_STPS+106)(GP)
BEQ	R2, R0, L__main179
NOP	
J	L__main148
NOP	
L__main179:
J	L_main23
NOP	
L__main149:
L__main148:
;Main.c,168 :: 		while(DMA_IsOn(1));
L_main24:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main181
NOP	
J	L_main25
NOP	
L__main181:
J	L_main24
NOP	
L_main25:
;Main.c,170 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
;Main.c,169 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%d\t%l\n",
ADDIU	R23, SP, 12
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 12
;Main.c,171 :: 		SV.dA,STPS[Y].step_count,STPS[X].step_delay,gc.frequency);
LW	R2, Offset(_gc+20)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_STPS+8)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+140)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
;Main.c,170 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
;Main.c,169 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%d\t%l\n",
SW	R3, 0(SP)
;Main.c,171 :: 		SV.dA,STPS[Y].step_count,STPS[X].step_delay,gc.frequency);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,172 :: 		}
L_main23:
;Main.c,173 :: 		}
L_main20:
;Main.c,177 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,180 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,183 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, 0(SP)
;Main.c,195 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,200 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main182
NOP	
J	L_main26
NOP	
L__main182:
;Main.c,201 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main26:
;Main.c,205 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,206 :: 		}
J	L_main0
NOP	
;Main.c,207 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,213 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Main.c,216 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,225 :: 		switch(action){
J	L_Main_Modal_Group_Actions027
NOP	
;Main.c,226 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions029:
;Main.c,227 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,229 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+90)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0185
NOP	
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions0185:
;Main.c,230 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+90)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,231 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions031:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0186
NOP	
J	L_Main_Modal_Group_Actions032
NOP	
L_Main_Modal_Group_Actions0186:
;Main.c,232 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,233 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions033:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions033
NOP	
;Main.c,234 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,235 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions031
NOP	
L_Main_Modal_Group_Actions032:
;Main.c,236 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions030:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+88)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0187
NOP	
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions0187:
;Main.c,237 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+88)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,238 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions037:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0188
NOP	
J	L_Main_Modal_Group_Actions038
NOP	
L_Main_Modal_Group_Actions0188:
;Main.c,239 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,240 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions039:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions039
NOP	
;Main.c,241 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,242 :: 		}
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions037
NOP	
L_Main_Modal_Group_Actions038:
;Main.c,243 :: 		}
L_Main_Modal_Group_Actions036:
L_Main_Modal_Group_Actions035:
;Main.c,244 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,245 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,246 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions041:
;Main.c,259 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0190
NOP	
J	L_Main_Modal_Group_Actions0130
NOP	
L_Main_Modal_Group_Actions0190:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0192
NOP	
J	L_Main_Modal_Group_Actions0129
NOP	
L_Main_Modal_Group_Actions0192:
L_Main_Modal_Group_Actions0128:
;Main.c,260 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,259 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0130:
L_Main_Modal_Group_Actions0129:
;Main.c,261 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0193
NOP	
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions0193:
;Main.c,263 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+52)
ORI	R26, R26, lo_addr(_gc+52)
LH	R25, Offset(_gc+88)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,265 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,266 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,267 :: 		}
L_Main_Modal_Group_Actions046:
;Main.c,270 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions0196:
;Main.c,271 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 8
LUI	R26, hi_addr(_gc+52)
ORI	R26, R26, lo_addr(_gc+52)
LUI	R25, hi_addr(_gc+36)
ORI	R25, R25, lo_addr(_gc+36)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,272 :: 		}
L_Main_Modal_Group_Actions047:
;Main.c,274 :: 		} else {
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions045:
;Main.c,280 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+88)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,281 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
; indx start address is: 12 (R3)
SEH	R3, R2
;Main.c,282 :: 		axis_cnt = 0;
; axis_cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,286 :: 		axis_words = Get_Axisword();
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
;Main.c,287 :: 		for(i = 0; i < 3;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; indx end address is: 12 (R3)
; axis_cnt end address is: 16 (R4)
; i end address is: 24 (R6)
SEH	R7, R3
SEH	R8, R4
L_Main_Modal_Group_Actions049:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; axis_cnt start address is: 32 (R8)
; indx start address is: 28 (R7)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0197:
; axis_words end address is: 20 (R5)
;Main.c,288 :: 		temp_axis = (axis_words >> i) & 1;
; axis_words start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R6
SRAV	R2, R3, R2
ANDI	R2, R2, 1
;Main.c,290 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,291 :: 		axis_cnt++;
ADDIU	R2, R8, 1
; axis_cnt end address is: 32 (R8)
; axis_cnt start address is: 16 (R4)
SEH	R4, R2
;Main.c,292 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0199
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0199:
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 16 (R4)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions053:
;Main.c,294 :: 		_flash = buffA[indx];
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
;Main.c,298 :: 		coord_data[i] = ulong2flt(_flash);
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 36(SP)
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
LW	R2, 36(SP)
SWC1	S0, 0(R2)
;Main.c,306 :: 		}else{
SEH	R8, R4
; axis_cnt end address is: 16 (R4)
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions052:
;Main.c,309 :: 		coord_data[i] = gc.next_position[i];
; axis_cnt start address is: 32 (R8)
ADDIU	R3, SP, 28
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+52)
ORI	R2, R2, lo_addr(_gc+52)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; axis_cnt end address is: 32 (R8)
;Main.c,317 :: 		}
L_Main_Modal_Group_Actions054:
;Main.c,318 :: 		indx++;
; axis_cnt start address is: 32 (R8)
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,287 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,319 :: 		}
; axis_words end address is: 20 (R5)
; axis_cnt end address is: 32 (R8)
; indx end address is: 28 (R7)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions049
NOP	
L_Main_Modal_Group_Actions050:
;Main.c,321 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 28
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+88)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,324 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 28
ORI	R27, R0, 8
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+36)
ORI	R25, R25, lo_addr(_gc+36)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,325 :: 		}
L_Main_Modal_Group_Actions048:
;Main.c,327 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,328 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions055:
;Main.c,329 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions056:
;Main.c,332 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 24 (R6)
SEH	R6, R2
;Main.c,341 :: 		if (axis_words) {
BNE	R2, R0, L_Main_Modal_Group_Actions0201
NOP	
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions0201:
;Main.c,343 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axis_words end address is: 24 (R6)
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions058:
; i start address is: 20 (R5)
; axis_words start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions0202:
;Main.c,345 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0204
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0204:
;Main.c,346 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions0206:
;Main.c,347 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,348 :: 		} else {
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions062:
;Main.c,349 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,350 :: 		}
L_Main_Modal_Group_Actions063:
;Main.c,351 :: 		} else {
J	L_Main_Modal_Group_Actions064
NOP	
L_Main_Modal_Group_Actions061:
;Main.c,352 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,353 :: 		}
L_Main_Modal_Group_Actions064:
;Main.c,358 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
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
;Main.c,359 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions065:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0208:
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,343 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,360 :: 		}
SEH	R6, R3
; axis_words end address is: 12 (R3)
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions059:
;Main.c,361 :: 		}
L_Main_Modal_Group_Actions057:
;Main.c,363 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
; temp start address is: 24 (R6)
ORI	R6, R0, 10
;Main.c,365 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions0131
NOP	
L_Main_Modal_Group_Actions0209:
ORI	R6, R0, 11
; temp end address is: 24 (R6)
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions0131:
L_Main_Modal_Group_Actions067:
;Main.c,366 :: 		i = (temp)*4 ; //place the new data into the correct position
; temp start address is: 24 (R6)
SEH	R2, R6
SLL	R2, R2, 2
; i start address is: 16 (R4)
SEH	R4, R2
;Main.c,369 :: 		for(j = 0;j<4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 16 (R4)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
L_Main_Modal_Group_Actions068:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
; temp start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0210
NOP	
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions0210:
;Main.c,370 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _data start address is: 28 (R7)
MOVZ	R7, R2, R0
;Main.c,371 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
SEH	R2, R6
SLL	R3, R2, 4
LUI	R2, hi_addr(_coord_system+0)
ORI	R2, R2, lo_addr(_coord_system+0)
ADDU	R3, R2, R3
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R2, 36(SP)
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
LW	R2, 36(SP)
SWC1	S0, 0(R2)
;Main.c,376 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
SEH	R7, R2
;Main.c,379 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
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
;Main.c,380 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions071:
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
BNE	R2, R0, L_Main_Modal_Group_Actions0212
NOP	
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0212:
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions072:
;Main.c,369 :: 		for(j = 0;j<4;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,381 :: 		}
SEH	R6, R4
; i end address is: 12 (R3)
; temp end address is: 16 (R4)
; j end address is: 20 (R5)
SEH	R4, R3
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions069:
;Main.c,383 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,384 :: 		case 16:
L_Main_Modal_Group_Actions073:
;Main.c,386 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,387 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0213
NOP	
J	L_Main_Modal_Group_Actions0132
NOP	
L_Main_Modal_Group_Actions0213:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0132:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions074:
;Main.c,388 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,389 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,390 :: 		case 53:
L_Main_Modal_Group_Actions075:
;Main.c,391 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,396 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions076:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0214
NOP	
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions0214:
; axis_words end address is: 20 (R5)
;Main.c,397 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0216
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0216:
;Main.c,398 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0217
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0217:
;Main.c,399 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0218:
;Main.c,400 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,401 :: 		} else {
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions081:
;Main.c,402 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,403 :: 		}
L_Main_Modal_Group_Actions082:
;Main.c,404 :: 		} else {
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions080:
;Main.c,405 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,406 :: 		}
L_Main_Modal_Group_Actions083:
;Main.c,407 :: 		}
L_Main_Modal_Group_Actions079:
;Main.c,396 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,408 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions077:
;Main.c,409 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,410 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions084:
;Main.c,411 :: 		temp = SETTING_INDEX_G28;
; temp start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,412 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0219
NOP	
J	L_Main_Modal_Group_Actions0133
NOP	
L_Main_Modal_Group_Actions0219:
; temp end address is: 16 (R4)
; temp start address is: 8 (R2)
ORI	R2, R0, 11
; temp end address is: 8 (R2)
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0133:
SEH	R2, R4
L_Main_Modal_Group_Actions085:
;Main.c,413 :: 		settings_write_coord_data(temp,gc.position);
; temp start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,414 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,415 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions086:
;Main.c,416 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,418 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0220
NOP	
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions0220:
; axis_words end address is: 20 (R5)
;Main.c,419 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,420 :: 		} else {
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions087:
;Main.c,424 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions089:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0221
NOP	
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions0221:
; axis_words end address is: 20 (R5)
;Main.c,425 :: 		if (bit_istrue(axis_words,bit(i)) ) {
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0223
NOP	
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions0223:
;Main.c,426 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
;Main.c,427 :: 		}
L_Main_Modal_Group_Actions092:
;Main.c,424 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,428 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions090:
;Main.c,429 :: 		}
L_Main_Modal_Group_Actions088:
;Main.c,431 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions093:
;Main.c,433 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 8
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,434 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,435 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions094:
ORI	R25, R0, 65535
;Main.c,436 :: 		break;
J	L_Main_Modal_Group_Actions028
NOP	
;Main.c,437 :: 		}
L_Main_Modal_Group_Actions027:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0225
NOP	
J	L_Main_Modal_Group_Actions029
NOP	
L_Main_Modal_Group_Actions0225:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0227
NOP	
J	L_Main_Modal_Group_Actions041
NOP	
L_Main_Modal_Group_Actions0227:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0229
NOP	
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions0229:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0231
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0231:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0233
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0233:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0235
NOP	
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions0235:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0237
NOP	
J	L_Main_Modal_Group_Actions084
NOP	
L_Main_Modal_Group_Actions0237:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0239
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0239:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0241
NOP	
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions0241:
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions028:
;Main.c,438 :: 		return action;
SEH	R2, R25
;Main.c,439 :: 		}
;Main.c,438 :: 		return action;
;Main.c,439 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,444 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Main.c,446 :: 		while(DMA_IsOn(1));
SW	R26, 4(SP)
SW	R27, 8(SP)
L_Main_Modal_Group_Actions195:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions1244
NOP	
J	L_Main_Modal_Group_Actions196
NOP	
L_Main_Modal_Group_Actions1244:
J	L_Main_Modal_Group_Actions195
NOP	
L_Main_Modal_Group_Actions196:
;Main.c,447 :: 		dma_printf("action:= %d\tgc.frequency:= %l\n",action,gc.frequency);
ADDIU	R23, SP, 14
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICSMain_?lstr4_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr4_Main+0)
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
;Main.c,449 :: 		switch(action){
J	L_Main_Modal_Group_Actions197
NOP	
;Main.c,450 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions199:
;Main.c,451 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,452 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,453 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions1100:
;Main.c,454 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,455 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,456 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions1101:
;Main.c,457 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+56)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,458 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,459 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions1102:
;Main.c,460 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+60)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,461 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,462 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1103:
;Main.c,463 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+60)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,464 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,465 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1104:
;Main.c,466 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+60)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,467 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,468 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1105:
;Main.c,469 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+64)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,470 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,471 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1106:
;Main.c,472 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+52)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,473 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,474 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1107:
;Main.c,475 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+56)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,476 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,477 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1108:
;Main.c,478 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+64)(GP)
LWC1	S12, Offset(_gc+60)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,479 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,480 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1109:
;Main.c,481 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,482 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
LH	R27, Offset(_gc+92)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S15, Offset(_gc+56)(GP)
LWC1	S14, Offset(_gc+52)(GP)
LWC1	S13, Offset(_gc+32)(GP)
LWC1	S12, Offset(_gc+28)(GP)
LW	R2, Offset(_gc+84)(GP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LW	R2, Offset(_gc+80)(GP)
SW	R2, 8(SP)
LW	R2, Offset(_gc+76)(GP)
SW	R2, 4(SP)
LW	R2, Offset(_gc+72)(GP)
SW	R2, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 12(SP)
;Main.c,483 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,484 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1110:
;Main.c,485 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,486 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,491 :: 		if(axis_to_home < 2){
SEH	R2, R2
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1245
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1245:
;Main.c,494 :: 		if (sys.abort) {
LH	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1247
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1247:
;Main.c,495 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,496 :: 		}
L_Main_Modal_Group_Actions1112:
;Main.c,497 :: 		}else{
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1111:
;Main.c,498 :: 		int l = 0;
;Main.c,500 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,501 :: 		mc_reset();
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
;Main.c,502 :: 		action = 0;
MOVZ	R25, R0, R0
;Main.c,503 :: 		for(l=0;l<NoOfAxis;l++){
; l start address is: 20 (R5)
MOVZ	R5, R0, R0
; l end address is: 20 (R5)
L_Main_Modal_Group_Actions1114:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions1248
NOP	
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1248:
;Main.c,506 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R0, 0(R2)
;Main.c,507 :: 		sys.position[l] = STPS[l].steps_abs_position;
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
;Main.c,510 :: 		if(STPS[l].run_state != STOP)
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
BNE	R2, R0, L_Main_Modal_Group_Actions1250
NOP	
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions1250:
;Main.c,511 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1117:
;Main.c,503 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,512 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1115:
;Main.c,515 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,518 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1118:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1252
NOP	
J	L_Main_Modal_Group_Actions1119
NOP	
L_Main_Modal_Group_Actions1252:
;Main.c,519 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1118
NOP	
L_Main_Modal_Group_Actions1119:
;Main.c,522 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(_sys+2)(GP)
;Main.c,523 :: 		SV.homed = false;
LBU	R2, Offset(_SV+2)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_SV+2)(GP)
;Main.c,524 :: 		}
L_Main_Modal_Group_Actions1113:
;Main.c,525 :: 		break;
J	L_Main_Modal_Group_Actions198
NOP	
;Main.c,526 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1120:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,528 :: 		}
L_Main_Modal_Group_Actions197:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1254
NOP	
J	L_Main_Modal_Group_Actions199
NOP	
L_Main_Modal_Group_Actions1254:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1256
NOP	
J	L_Main_Modal_Group_Actions1100
NOP	
L_Main_Modal_Group_Actions1256:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1258
NOP	
J	L_Main_Modal_Group_Actions1101
NOP	
L_Main_Modal_Group_Actions1258:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1260
NOP	
J	L_Main_Modal_Group_Actions1102
NOP	
L_Main_Modal_Group_Actions1260:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1262
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1262:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1264
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1264:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1266
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1266:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1268
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1268:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1270
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1270:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1272
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1272:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1274
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1274:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L_Main_Modal_Group_Actions1276
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1276:
J	L_Main_Modal_Group_Actions1120
NOP	
L_Main_Modal_Group_Actions198:
;Main.c,530 :: 		return action;
SEH	R2, R25
;Main.c,531 :: 		}
;Main.c,530 :: 		return action;
;Main.c,531 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
Main_Modal_Group_Actions3:
;Main.c,537 :: 		static int Modal_Group_Actions3(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,539 :: 		if(gc.inches_mode > 1)
LBU	R2, Offset(_gc+3)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L_Main_Modal_Group_Actions3278
NOP	
J	L_Main_Modal_Group_Actions3121
NOP	
L_Main_Modal_Group_Actions3278:
;Main.c,540 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 4(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions3121:
;Main.c,542 :: 		return action;
SEH	R2, R25
;Main.c,543 :: 		}
L_end_Modal_Group_Actions3:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,548 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,554 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4280
NOP	
J	L_Main_Modal_Group_Actions4136
NOP	
L_Main_Modal_Group_Actions4280:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4281
NOP	
J	L_Main_Modal_Group_Actions4135
NOP	
L_Main_Modal_Group_Actions4281:
J	L_Main_Modal_Group_Actions4124
NOP	
L_Main_Modal_Group_Actions4136:
L_Main_Modal_Group_Actions4135:
;Main.c,555 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions4124:
;Main.c,557 :: 		return action;
SEH	R2, R25
;Main.c,558 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,563 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,568 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7283
NOP	
J	L_Main_Modal_Group_Actions7139
NOP	
L_Main_Modal_Group_Actions7283:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7284
NOP	
J	L_Main_Modal_Group_Actions7138
NOP	
L_Main_Modal_Group_Actions7284:
J	L_Main_Modal_Group_Actions7127
NOP	
L_Main_Modal_Group_Actions7139:
L_Main_Modal_Group_Actions7138:
;Main.c,569 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 4(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 4(SP)
L_Main_Modal_Group_Actions7127:
;Main.c,571 :: 		return action;
SEH	R2, R25
;Main.c,572 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,577 :: 		static int Modal_Group_Actions12(int action){
;Main.c,582 :: 		return action;
SEH	R2, R25
;Main.c,583 :: 		}
L_end_Modal_Group_Actions12:
JR	RA
NOP	
; end of Main_Modal_Group_Actions12
