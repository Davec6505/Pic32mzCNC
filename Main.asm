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
ADDIU	SP, SP, -88
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
BEQ	R2, R0, L__main166
NOP	
J	L_main2
NOP	
L__main166:
;Main.c,91 :: 		modal_group = Get_modalgroup();
JAL	_Get_modalgroup+0
NOP	
SH	R2, 4(SP)
;Main.c,92 :: 		switch(modal_group){
J	L_main3
NOP	
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
SH	R2, 4(SP)
;Main.c,97 :: 		break;
J	L_main4
NOP	
;Main.c,98 :: 		case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
L_main7:
;Main.c,99 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 0(SP)
;Main.c,102 :: 		if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
LHU	R2, Offset(_STPS+6)(GP)
BEQ	R2, R0, L__main167
NOP	
J	L__main163
NOP	
L__main167:
LHU	R2, Offset(_STPS+110)(GP)
BEQ	R2, R0, L__main168
NOP	
J	L__main162
NOP	
L__main168:
J	L_main10
NOP	
L__main163:
L__main162:
;Main.c,103 :: 		while(DMA_IsOn(1));
L_main11:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main170
NOP	
J	L_main12
NOP	
L__main170:
J	L_main11
NOP	
L_main12:
;Main.c,105 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
;Main.c,104 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
ADDIU	R23, SP, 6
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 6
;Main.c,106 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_SV+16)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+144)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
;Main.c,105 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
;Main.c,104 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
SW	R3, 0(SP)
;Main.c,106 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,107 :: 		}
L_main10:
;Main.c,111 :: 		if(axis_to_run){
LH	R2, 0(SP)
BNE	R2, R0, L__main172
NOP	
J	L_main13
NOP	
L__main172:
;Main.c,113 :: 		while(DMA_IsOn(1));
L_main14:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main174
NOP	
J	L_main15
NOP	
L__main174:
J	L_main14
NOP	
L_main15:
;Main.c,114 :: 		dma_printf("axis_to_run:= %d\n",axis_to_run);
ADDIU	R23, SP, 37
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 37
LH	R2, 0(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
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
L_main13:
;Main.c,120 :: 		break;
J	L_main4
NOP	
;Main.c,123 :: 		case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
L_main16:
;Main.c,124 :: 		Modal_Group_Actions4(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions4+0
NOP	
;Main.c,125 :: 		break;
J	L_main4
NOP	
;Main.c,128 :: 		case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
L_main17:
;Main.c,129 :: 		Modal_Group_Actions7(1);//implimentation needed
ORI	R25, R0, 1
JAL	Main_Modal_Group_Actions7+0
NOP	
;Main.c,130 :: 		break;
J	L_main4
NOP	
;Main.c,131 :: 		case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
L_main18:
;Main.c,132 :: 		Modal_Group_Actions12(gc.coord_select);//implimentation needed
LH	R25, Offset(_gc+14)(GP)
JAL	Main_Modal_Group_Actions12+0
NOP	
;Main.c,133 :: 		break;
J	L_main4
NOP	
;Main.c,134 :: 		case 1024: //$H Home all axis
L_main19:
;Main.c,135 :: 		if(axis_to_home < NoOfAxis){
LH	R2, Offset(Main_axis_to_home+0)(GP)
SLTI	R2, R2, 4
BNE	R2, R0, L__main175
NOP	
J	L_main20
NOP	
L__main175:
;Main.c,138 :: 		while(DMA_IsOn(1));
L_main21:
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
BNE	R2, R0, L__main177
NOP	
J	L_main22
NOP	
L__main177:
J	L_main21
NOP	
L_main22:
;Main.c,140 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LHU	R2, Offset(_STPS+6)(GP)
ANDI	R4, R2, 255
;Main.c,139 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
ADDIU	R23, SP, 55
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 55
;Main.c,141 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LW	R2, Offset(_SV+16)(GP)
SW	R2, 20(SP)
LW	R2, Offset(_STPS+144)(GP)
SW	R2, 16(SP)
LW	R2, Offset(_SV+12)(GP)
SW	R2, 12(SP)
;Main.c,140 :: 		(STPS[X].run_state&0xff),STPS[X].step_count,
LW	R2, Offset(_STPS+40)(GP)
SW	R2, 8(SP)
SH	R4, 4(SP)
;Main.c,139 :: 		dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
SW	R3, 0(SP)
;Main.c,141 :: 		SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 28
;Main.c,143 :: 		axis_to_home  = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,144 :: 		}
L_main20:
;Main.c,145 :: 		break;
J	L_main4
NOP	
;Main.c,146 :: 		}
L_main3:
LH	R2, 4(SP)
BNE	R2, R0, L__main179
NOP	
J	L_main5
NOP	
L__main179:
LH	R3, 4(SP)
ORI	R2, R0, 2
BNE	R3, R2, L__main181
NOP	
J	L_main6
NOP	
L__main181:
LH	R3, 4(SP)
ORI	R2, R0, 4
BNE	R3, R2, L__main183
NOP	
J	L_main7
NOP	
L__main183:
LH	R3, 4(SP)
ORI	R2, R0, 32
BNE	R3, R2, L__main185
NOP	
J	L_main16
NOP	
L__main185:
LH	R3, 4(SP)
ORI	R2, R0, 256
BNE	R3, R2, L__main187
NOP	
J	L_main17
NOP	
L__main187:
LH	R3, 4(SP)
ORI	R2, R0, 512
BNE	R3, R2, L__main189
NOP	
J	L_main18
NOP	
L__main189:
LH	R3, 4(SP)
ORI	R2, R0, 1024
BNE	R3, R2, L__main191
NOP	
J	L_main19
NOP	
L__main191:
L_main4:
;Main.c,147 :: 		}else{
J	L_main23
NOP	
L_main2:
;Main.c,148 :: 		report_status_message(status_of_gcode);
LH	R25, 2(SP)
JAL	_report_status_message+0
NOP	
;Main.c,149 :: 		}
L_main23:
;Main.c,151 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 2(SP)
;Main.c,156 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,161 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main192
NOP	
J	L_main24
NOP	
L__main192:
;Main.c,162 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main24:
;Main.c,168 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,169 :: 		WDTCONSET = 0x01;
ORI	R2, R0, 1
SW	R2, Offset(WDTCONSET+0)(GP)
;Main.c,170 :: 		}
J	L_main0
NOP	
;Main.c,171 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
Main_Modal_Group_Actions0:
;Main.c,176 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -164
SW	RA, 0(SP)
;Main.c,182 :: 		unsigned int home_select = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
;Main.c,186 :: 		switch(action){
J	L_Main_Modal_Group_Actions025
NOP	
;Main.c,187 :: 		case 2:  //NON_MODAL_DWELL
L_Main_Modal_Group_Actions027:
;Main.c,188 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,190 :: 		if(gc.S > 0){ //wait in seconds
LH	R2, Offset(_gc+122)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0195
NOP	
J	L_Main_Modal_Group_Actions028
NOP	
L_Main_Modal_Group_Actions0195:
;Main.c,191 :: 		dly_time = gc.S * 1000;
LH	R3, Offset(_gc+122)(GP)
ORI	R2, R0, 1000
MUL	R2, R3, R2
; dly_time start address is: 16 (R4)
SEH	R4, R2
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,192 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions029:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0196
NOP	
J	L_Main_Modal_Group_Actions030
NOP	
L_Main_Modal_Group_Actions0196:
;Main.c,193 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,194 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions031:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions031
NOP	
;Main.c,195 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Main.c,196 :: 		}
SEH	R5, R2
; dly_time end address is: 16 (R4)
; i end address is: 8 (R2)
J	L_Main_Modal_Group_Actions029
NOP	
L_Main_Modal_Group_Actions030:
;Main.c,197 :: 		}else if(gc.P > 0){ //wait in msec
J	L_Main_Modal_Group_Actions033
NOP	
L_Main_Modal_Group_Actions028:
; i start address is: 20 (R5)
LH	R2, Offset(_gc+120)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0197
NOP	
J	L_Main_Modal_Group_Actions034
NOP	
L_Main_Modal_Group_Actions0197:
;Main.c,198 :: 		dly_time = (unsigned long)gc.P;
LH	R2, Offset(_gc+120)(GP)
; dly_time start address is: 16 (R4)
MOVZ	R4, R2, R0
; dly_time end address is: 16 (R4)
; i end address is: 20 (R5)
;Main.c,199 :: 		while(i < dly_time){
L_Main_Modal_Group_Actions035:
; dly_time start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0198
NOP	
J	L_Main_Modal_Group_Actions036
NOP	
L_Main_Modal_Group_Actions0198:
;Main.c,200 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,201 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions037:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions037
NOP	
;Main.c,202 :: 		i++;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Main.c,203 :: 		}
SEH	R5, R2
; dly_time end address is: 16 (R4)
; i end address is: 8 (R2)
J	L_Main_Modal_Group_Actions035
NOP	
L_Main_Modal_Group_Actions036:
;Main.c,204 :: 		}
L_Main_Modal_Group_Actions034:
L_Main_Modal_Group_Actions033:
;Main.c,205 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,206 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,207 :: 		case 4:  //NON_MODAL_SET_COORDINATE_DATA
L_Main_Modal_Group_Actions039:
;Main.c,220 :: 		if(gc.L != 2 && gc.L != 20)
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0200
NOP	
J	L_Main_Modal_Group_Actions0151
NOP	
L_Main_Modal_Group_Actions0200:
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0202
NOP	
J	L_Main_Modal_Group_Actions0150
NOP	
L_Main_Modal_Group_Actions0202:
L_Main_Modal_Group_Actions0149:
;Main.c,221 :: 		return -1;
ORI	R2, R0, 65535
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,220 :: 		if(gc.L != 2 && gc.L != 20)
L_Main_Modal_Group_Actions0151:
L_Main_Modal_Group_Actions0150:
;Main.c,222 :: 		if (gc.L == 20) {
LH	R3, Offset(_gc+16)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0203
NOP	
J	L_Main_Modal_Group_Actions043
NOP	
L_Main_Modal_Group_Actions0203:
;Main.c,224 :: 		result = settings_write_coord_data((int)gc.P,gc.next_position );
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,226 :: 		if(result){ //response if write to flash failed new result
BNE	R2, R0, L_Main_Modal_Group_Actions0205
NOP	
J	L_Main_Modal_Group_Actions044
NOP	
L_Main_Modal_Group_Actions0205:
;Main.c,227 :: 		return NVM_COORDINATE_WRITE_ERROR;
ORI	R2, R0, 1
J	L_end_Modal_Group_Actions0
NOP	
;Main.c,228 :: 		}
L_Main_Modal_Group_Actions044:
;Main.c,231 :: 		if (gc.coord_select > 0) {
LH	R2, Offset(_gc+14)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0206
NOP	
J	L_Main_Modal_Group_Actions045
NOP	
L_Main_Modal_Group_Actions0206:
;Main.c,232 :: 		memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
SH	R25, 12(SP)
ORI	R27, R0, 16
LUI	R26, hi_addr(_gc+76)
ORI	R26, R26, lo_addr(_gc+76)
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,233 :: 		}
L_Main_Modal_Group_Actions045:
;Main.c,235 :: 		} else {
J	L_Main_Modal_Group_Actions046
NOP	
L_Main_Modal_Group_Actions043:
;Main.c,241 :: 		temp = indx = (gc.P-1) & 0xFF;
LH	R2, Offset(_gc+120)(GP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
;Main.c,242 :: 		indx *= 4;
SEH	R2, R2
SLL	R2, R2, 2
SH	R2, 20(SP)
;Main.c,243 :: 		axis_cnt = 0;
SH	R0, 24(SP)
;Main.c,247 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,248 :: 		for(i = 0; i < 3;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions047:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0207
NOP	
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions0207:
;Main.c,249 :: 		temp_axis = (axis_words >> i) & 1;
SEH	R3, R5
LH	R2, 18(SP)
SRAV	R2, R2, R3
ANDI	R2, R2, 1
SH	R2, 22(SP)
;Main.c,251 :: 		if(temp_axis == 0){
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0208
NOP	
J	L_Main_Modal_Group_Actions050
NOP	
L_Main_Modal_Group_Actions0208:
;Main.c,252 :: 		axis_cnt++;
LH	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;Main.c,253 :: 		if(axis_cnt > 2)break;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L_Main_Modal_Group_Actions0209
NOP	
J	L_Main_Modal_Group_Actions051
NOP	
L_Main_Modal_Group_Actions0209:
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions048
NOP	
L_Main_Modal_Group_Actions051:
;Main.c,255 :: 		_flash = buffA[indx];
; i start address is: 20 (R5)
LH	R2, 20(SP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
; _flash start address is: 16 (R4)
MOVZ	R4, R2, R0
;Main.c,259 :: 		coord_data[i] = ulong2flt(_flash);
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
;Main.c,262 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions052:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0211
NOP	
J	L_Main_Modal_Group_Actions053
NOP	
L_Main_Modal_Group_Actions0211:
J	L_Main_Modal_Group_Actions052
NOP	
L_Main_Modal_Group_Actions053:
;Main.c,264 :: 		temp_axis,i,coord_data[i],indx);
ADDIU	R3, SP, 32
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
;Main.c,263 :: 		dma_printf("temp_axis:= %d\tcoord_data[%d]:=%f\tindx:= %d\n",
ADDIU	R23, SP, 48
ADDIU	R22, R23, 45
LUI	R24, hi_addr(?ICSMain_?lstr4_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr4_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 48
;Main.c,264 :: 		temp_axis,i,coord_data[i],indx);
LH	R2, 20(SP)
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -20
SH	R2, 16(SP)
SWC1	S0, 12(SP)
SH	R4, 8(SP)
LH	R2, 42(SP)
SH	R2, 4(SP)
;Main.c,263 :: 		dma_printf("temp_axis:= %d\tcoord_data[%d]:=%f\tindx:= %d\n",
SW	R3, 0(SP)
;Main.c,264 :: 		temp_axis,i,coord_data[i],indx);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
LH	R25, 14(SP)
LH	R4, 12(SP)
;Main.c,267 :: 		}else{
SEH	R3, R4
; i end address is: 16 (R4)
J	L_Main_Modal_Group_Actions054
NOP	
L_Main_Modal_Group_Actions050:
;Main.c,270 :: 		coord_data[i] = gc.next_position[i];
; i start address is: 20 (R5)
ADDIU	R3, SP, 32
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; i end address is: 20 (R5)
SEH	R4, R5
;Main.c,273 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions055:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0213
NOP	
J	L_Main_Modal_Group_Actions056
NOP	
L_Main_Modal_Group_Actions0213:
J	L_Main_Modal_Group_Actions055
NOP	
L_Main_Modal_Group_Actions056:
;Main.c,275 :: 		,i,gc.next_position[i]);
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
;Main.c,274 :: 		dma_printf("gc.next_position[%d]:= %f\n"
ADDIU	R23, SP, 93
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICSMain_?lstr5_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr5_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 93
;Main.c,275 :: 		,i,gc.next_position[i]);
SH	R4, 12(SP)
SH	R25, 14(SP)
ADDIU	SP, SP, -12
SWC1	S0, 8(SP)
SH	R4, 4(SP)
;Main.c,274 :: 		dma_printf("gc.next_position[%d]:= %f\n"
SW	R2, 0(SP)
;Main.c,275 :: 		,i,gc.next_position[i]);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
; i end address is: 16 (R4)
LH	R25, 14(SP)
LH	R4, 12(SP)
SEH	R3, R4
;Main.c,278 :: 		}
L_Main_Modal_Group_Actions054:
;Main.c,279 :: 		indx++;
; i start address is: 12 (R3)
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;Main.c,248 :: 		for(i = 0; i < 3;i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,280 :: 		}
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions047
NOP	
L_Main_Modal_Group_Actions048:
;Main.c,282 :: 		result = settings_write_coord_data((int)gc.P,coord_data);
ADDIU	R2, SP, 32
SH	R25, 12(SP)
MOVZ	R26, R2, R0
LH	R25, Offset(_gc+120)(GP)
JAL	_settings_write_coord_data+0
NOP	
;Main.c,285 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 32
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_gc+44)
ORI	R25, R25, lo_addr(_gc+44)
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
;Main.c,286 :: 		}
L_Main_Modal_Group_Actions046:
;Main.c,288 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,289 :: 		case  8:  //NON_MODAL_GO_HOME_0_BIT
L_Main_Modal_Group_Actions057:
;Main.c,290 :: 		case 32:  //NON_MODAL_GO_HOME_1_BIT
L_Main_Modal_Group_Actions058:
;Main.c,293 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,296 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions059:
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0215
NOP	
J	L_Main_Modal_Group_Actions060
NOP	
L_Main_Modal_Group_Actions0215:
J	L_Main_Modal_Group_Actions059
NOP	
L_Main_Modal_Group_Actions060:
;Main.c,297 :: 		dma_printf("axis_words:= %d\n",axis_words);
ADDIU	R23, SP, 120
ADDIU	R22, R23, 17
LUI	R24, hi_addr(?ICSMain_?lstr6_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr6_Main+0)
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
;Main.c,302 :: 		if (axis_words) {
LH	R2, 18(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0217
NOP	
J	L_Main_Modal_Group_Actions061
NOP	
L_Main_Modal_Group_Actions0217:
;Main.c,304 :: 		for (i=0; i<NoOfAxis; i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Modal_Group_Actions062:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0218
NOP	
J	L_Main_Modal_Group_Actions063
NOP	
L_Main_Modal_Group_Actions0218:
;Main.c,306 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0220
NOP	
J	L_Main_Modal_Group_Actions065
NOP	
L_Main_Modal_Group_Actions0220:
;Main.c,307 :: 		if (gc.absolute_mode) {
LBU	R2, Offset(_gc+5)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0222
NOP	
J	L_Main_Modal_Group_Actions066
NOP	
L_Main_Modal_Group_Actions0222:
;Main.c,308 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
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
;Main.c,309 :: 		} else {
J	L_Main_Modal_Group_Actions067
NOP	
L_Main_Modal_Group_Actions066:
;Main.c,310 :: 		gc.next_position[i] += gc.position[i];
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
;Main.c,311 :: 		}
L_Main_Modal_Group_Actions067:
;Main.c,312 :: 		} else {
J	L_Main_Modal_Group_Actions068
NOP	
L_Main_Modal_Group_Actions065:
;Main.c,313 :: 		gc.next_position[i] = gc.position[i];
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
;Main.c,314 :: 		}
L_Main_Modal_Group_Actions068:
;Main.c,319 :: 		SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
LWC1	S0, Offset(_settings+20)(GP)
CVT36.S 	S0, S0
MFC1	R4, S0
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_gc+76)
ORI	R2, R2, lo_addr(_gc+76)
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
;Main.c,320 :: 		while(GET_RunState(i));
L_Main_Modal_Group_Actions069:
; i start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
SEH	R25, R3
JAL	_GET_RunState+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0224
NOP	
J	L_Main_Modal_Group_Actions070
NOP	
L_Main_Modal_Group_Actions0224:
J	L_Main_Modal_Group_Actions069
NOP	
L_Main_Modal_Group_Actions070:
;Main.c,304 :: 		for (i=0; i<NoOfAxis; i++){
ADDIU	R2, R3, 1
; i end address is: 12 (R3)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,321 :: 		}
; i end address is: 20 (R5)
J	L_Main_Modal_Group_Actions062
NOP	
L_Main_Modal_Group_Actions063:
;Main.c,322 :: 		}
L_Main_Modal_Group_Actions061:
;Main.c,324 :: 		temp = SETTING_INDEX_G28;  //home to zero pos / at limits
ORI	R2, R0, 10
SH	R2, 26(SP)
;Main.c,326 :: 		if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0225
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0225:
ORI	R2, R0, 11
SH	R2, 26(SP)
L_Main_Modal_Group_Actions071:
;Main.c,327 :: 		i = (temp)*4 ; //place the new data into the correct position
LH	R2, 26(SP)
SLL	R2, R2, 2
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,330 :: 		for(j = 0;j<4;j++){
SH	R0, 16(SP)
; i end address is: 24 (R6)
SEH	R4, R6
L_Main_Modal_Group_Actions072:
; i start address is: 16 (R4)
LH	R2, 16(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0226
NOP	
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions0226:
;Main.c,331 :: 		_data = buffA[i];
SEH	R2, R4
SLL	R3, R2, 2
LUI	R2, hi_addr(_buffA+0)
ORI	R2, R2, lo_addr(_buffA+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R2, 28(SP)
;Main.c,332 :: 		coord_system[temp].coord[j] = ulong2flt(_data);
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
;Main.c,334 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions075:
; i start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0228
NOP	
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions0228:
J	L_Main_Modal_Group_Actions075
NOP	
L_Main_Modal_Group_Actions076:
;Main.c,335 :: 		dma_printf("coord[%d]:= %f\n",j,_data);
ADDIU	R23, SP, 137
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICSMain_?lstr7_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr7_Main+0)
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
;Main.c,337 :: 		i++;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;Main.c,340 :: 		SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
LWC1	S0, Offset(_settings+20)(GP)
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
;Main.c,341 :: 		while(GET_RunState(j));
L_Main_Modal_Group_Actions077:
; i start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
LH	R25, 16(SP)
JAL	_GET_RunState+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0230
NOP	
J	L_Main_Modal_Group_Actions078
NOP	
L_Main_Modal_Group_Actions0230:
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions078:
;Main.c,330 :: 		for(j = 0;j<4;j++){
LH	R2, 16(SP)
ADDIU	R2, R2, 1
SH	R2, 16(SP)
;Main.c,342 :: 		}
SEH	R4, R3
; i end address is: 12 (R3)
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions073:
;Main.c,344 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,345 :: 		case 16:
L_Main_Modal_Group_Actions079:
;Main.c,347 :: 		home_select = SETTING_INDEX_G28;
; home_select start address is: 16 (R4)
ORI	R4, R0, 10
;Main.c,348 :: 		if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L_Main_Modal_Group_Actions0231
NOP	
J	L_Main_Modal_Group_Actions0152
NOP	
L_Main_Modal_Group_Actions0231:
; home_select end address is: 16 (R4)
; home_select start address is: 8 (R2)
ORI	R2, R0, 11
; home_select end address is: 8 (R2)
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0152:
ANDI	R2, R4, 65535
L_Main_Modal_Group_Actions080:
;Main.c,349 :: 		settings_write_coord_data(home_select,gc.position);
; home_select start address is: 8 (R2)
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
ANDI	R25, R2, 65535
; home_select end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,350 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,351 :: 		case 53:
L_Main_Modal_Group_Actions081:
;Main.c,352 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,357 :: 		for (i=0; i<=2; i++) {
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
SEH	R5, R6
L_Main_Modal_Group_Actions082:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0232
NOP	
J	L_Main_Modal_Group_Actions083
NOP	
L_Main_Modal_Group_Actions0232:
;Main.c,358 :: 		if ( bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0234
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0234:
;Main.c,359 :: 		if (!gc.absolute_override) {
LBU	R2, Offset(_gc+4)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0235
NOP	
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions0235:
;Main.c,360 :: 		if (!gc.absolute_mode) { // Do not update target in absolute override mode
LBU	R2, Offset(_gc+5)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0236
NOP	
J	L_Main_Modal_Group_Actions087
NOP	
L_Main_Modal_Group_Actions0236:
;Main.c,361 :: 		gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
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
;Main.c,362 :: 		} else {
J	L_Main_Modal_Group_Actions088
NOP	
L_Main_Modal_Group_Actions087:
;Main.c,363 :: 		gc.next_position[i] += gc.position[i]; // Incremental mode
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
;Main.c,364 :: 		}
L_Main_Modal_Group_Actions088:
;Main.c,365 :: 		} else {
J	L_Main_Modal_Group_Actions089
NOP	
L_Main_Modal_Group_Actions086:
;Main.c,366 :: 		gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
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
;Main.c,367 :: 		}
L_Main_Modal_Group_Actions089:
;Main.c,368 :: 		}
L_Main_Modal_Group_Actions085:
;Main.c,357 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,369 :: 		}
SEH	R5, R6
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions082
NOP	
L_Main_Modal_Group_Actions083:
;Main.c,370 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,371 :: 		case 64:   //NON_MODAL_SET_HOME_1
L_Main_Modal_Group_Actions090:
;Main.c,372 :: 		temp = SETTING_INDEX_G28;
ORI	R2, R0, 10
SH	R2, 26(SP)
;Main.c,373 :: 		if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0237
NOP	
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0237:
ORI	R2, R0, 11
SH	R2, 26(SP)
L_Main_Modal_Group_Actions091:
;Main.c,374 :: 		settings_write_coord_data(temp,gc.position);
SH	R25, 12(SP)
LUI	R26, hi_addr(_gc+28)
ORI	R26, R26, lo_addr(_gc+28)
LH	R25, 26(SP)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
;Main.c,375 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,376 :: 		case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
L_Main_Modal_Group_Actions092:
;Main.c,377 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, 18(SP)
;Main.c,379 :: 		if (!axis_words) { // No axis words
BEQ	R2, R0, L_Main_Modal_Group_Actions0238
NOP	
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions0238:
;Main.c,380 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
;Main.c,381 :: 		} else {
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions093:
;Main.c,385 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
SEH	R5, R6
L_Main_Modal_Group_Actions095:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0239
NOP	
J	L_Main_Modal_Group_Actions096
NOP	
L_Main_Modal_Group_Actions0239:
;Main.c,386 :: 		if (bit_istrue(axis_words,bit(i)) ) {
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R3, R2, R3
LH	R2, 18(SP)
AND	R2, R2, R3
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0241
NOP	
J	L_Main_Modal_Group_Actions098
NOP	
L_Main_Modal_Group_Actions0241:
;Main.c,387 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
SEH	R2, R5
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
;Main.c,388 :: 		}
L_Main_Modal_Group_Actions098:
;Main.c,385 :: 		for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 24 (R6)
SEH	R6, R2
;Main.c,389 :: 		}
SEH	R5, R6
; i end address is: 24 (R6)
J	L_Main_Modal_Group_Actions095
NOP	
L_Main_Modal_Group_Actions096:
;Main.c,390 :: 		}
L_Main_Modal_Group_Actions094:
;Main.c,392 :: 		case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
L_Main_Modal_Group_Actions099:
;Main.c,394 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_gc+60)
ORI	R25, R25, lo_addr(_gc+60)
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,395 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,396 :: 		default: action = -1; //error in action msg ???
L_Main_Modal_Group_Actions0100:
ORI	R25, R0, 65535
;Main.c,397 :: 		break;
J	L_Main_Modal_Group_Actions026
NOP	
;Main.c,398 :: 		}
L_Main_Modal_Group_Actions025:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0243
NOP	
J	L_Main_Modal_Group_Actions027
NOP	
L_Main_Modal_Group_Actions0243:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0245
NOP	
J	L_Main_Modal_Group_Actions039
NOP	
L_Main_Modal_Group_Actions0245:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0247
NOP	
J	L_Main_Modal_Group_Actions057
NOP	
L_Main_Modal_Group_Actions0247:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0249
NOP	
J	L_Main_Modal_Group_Actions058
NOP	
L_Main_Modal_Group_Actions0249:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0251
NOP	
J	L_Main_Modal_Group_Actions079
NOP	
L_Main_Modal_Group_Actions0251:
SEH	R3, R25
ORI	R2, R0, 53
BNE	R3, R2, L_Main_Modal_Group_Actions0253
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0253:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0255
NOP	
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions0255:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0257
NOP	
J	L_Main_Modal_Group_Actions092
NOP	
L_Main_Modal_Group_Actions0257:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0259
NOP	
J	L_Main_Modal_Group_Actions099
NOP	
L_Main_Modal_Group_Actions0259:
J	L_Main_Modal_Group_Actions0100
NOP	
L_Main_Modal_Group_Actions026:
;Main.c,399 :: 		return action;
SEH	R2, R25
;Main.c,400 :: 		}
;Main.c,399 :: 		return action;
;Main.c,400 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 164
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,405 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Main.c,410 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions1101
NOP	
;Main.c,411 :: 		case 1: //b0000 0001
L_Main_Modal_Group_Actions1103:
;Main.c,412 :: 		SingleAxisStep(gc.next_position[X],gc.frequency,X);
SH	R25, 12(SP)
MOVZ	R26, R0, R0
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,413 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,414 :: 		case 2://b0000 0010
L_Main_Modal_Group_Actions1104:
;Main.c,415 :: 		SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
SH	R25, 12(SP)
ORI	R26, R0, 1
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,416 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,417 :: 		case 3://b0000 0011
L_Main_Modal_Group_Actions1105:
;Main.c,418 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+80)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,419 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,420 :: 		case 4://b0000 0100
L_Main_Modal_Group_Actions1106:
;Main.c,421 :: 		SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
SH	R25, 12(SP)
ORI	R26, R0, 2
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,422 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,423 :: 		case 5://b0000 0101
L_Main_Modal_Group_Actions1107:
;Main.c,424 :: 		DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,425 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,426 :: 		case 6://b0000 0110
L_Main_Modal_Group_Actions1108:
;Main.c,427 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 2
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+84)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,428 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,429 :: 		case 8://b0000 1000
L_Main_Modal_Group_Actions1109:
;Main.c,430 :: 		SingleAxisStep(gc.next_position[A],gc.frequency,A);
SH	R25, 12(SP)
ORI	R26, R0, 3
LW	R25, Offset(_gc+20)(GP)
LWC1	S12, Offset(_gc+88)(GP)
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,431 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,432 :: 		case 9://b0000 1001
L_Main_Modal_Group_Actions1110:
;Main.c,433 :: 		DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
MOVZ	R25, R0, R0
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+76)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,434 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,435 :: 		case 10://b0000 1010
L_Main_Modal_Group_Actions1111:
;Main.c,436 :: 		DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 1
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+80)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,437 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,438 :: 		case 12://b0000 1100
L_Main_Modal_Group_Actions1112:
;Main.c,439 :: 		DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
SH	R25, 12(SP)
LW	R27, Offset(_gc+20)(GP)
ORI	R26, R0, 3
ORI	R25, R0, 2
LWC1	S13, Offset(_gc+88)(GP)
LWC1	S12, Offset(_gc+84)(GP)
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,440 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,441 :: 		case 15://Homing Y axis
L_Main_Modal_Group_Actions1113:
;Main.c,442 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,443 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,444 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1114:
;Main.c,445 :: 		if(action){
BNE	R25, R0, L_Main_Modal_Group_Actions1262
NOP	
J	L_Main_Modal_Group_Actions1115
NOP	
L_Main_Modal_Group_Actions1262:
;Main.c,447 :: 		if( axis_to_home < NoOfAxis){
LH	R2, Offset(Main_axis_to_home+0)(GP)
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1263
NOP	
J	L_Main_Modal_Group_Actions1116
NOP	
L_Main_Modal_Group_Actions1263:
;Main.c,448 :: 		home_status = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
; home_status start address is: 16 (R4)
SEH	R4, R2
;Main.c,449 :: 		LED2 = TMR.clock >> 3;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 3
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
; home_status end address is: 16 (R4)
;Main.c,451 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions1117:
; home_status start address is: 16 (R4)
SH	R4, 12(SP)
SH	R25, 14(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 14(SP)
LH	R4, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions1265
NOP	
J	L_Main_Modal_Group_Actions1118
NOP	
L_Main_Modal_Group_Actions1265:
J	L_Main_Modal_Group_Actions1117
NOP	
L_Main_Modal_Group_Actions1118:
;Main.c,452 :: 		dma_printf("axis:= %d\n",axis_to_home);
ADDIU	R23, SP, 16
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICSMain_?lstr8_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr8_Main+0)
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
;Main.c,454 :: 		if(home_status){
BNE	R4, R0, L_Main_Modal_Group_Actions1267
NOP	
J	L_Main_Modal_Group_Actions1119
NOP	
L_Main_Modal_Group_Actions1267:
; home_status end address is: 16 (R4)
;Main.c,455 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,456 :: 		axis_to_home++;
LH	R2, Offset(Main_axis_to_home+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,457 :: 		if(axis_to_home > NoOfAxis){mc_reset();}
SEH	R2, R2
SLTI	R2, R2, 5
BEQ	R2, R0, L_Main_Modal_Group_Actions1268
NOP	
J	L_Main_Modal_Group_Actions1120
NOP	
L_Main_Modal_Group_Actions1268:
SH	R25, 12(SP)
JAL	_mc_reset+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions1120:
;Main.c,458 :: 		break;
J	L_Main_Modal_Group_Actions1102
NOP	
;Main.c,459 :: 		}
L_Main_Modal_Group_Actions1119:
;Main.c,461 :: 		if (sys.abort) {
LBU	R2, Offset(_sys+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1270
NOP	
J	L_Main_Modal_Group_Actions1121
NOP	
L_Main_Modal_Group_Actions1270:
;Main.c,462 :: 		return(ALARM_ABORT_CYCLE);
ORI	R2, R0, 65534
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,464 :: 		}
L_Main_Modal_Group_Actions1121:
;Main.c,465 :: 		}
L_Main_Modal_Group_Actions1116:
;Main.c,467 :: 		}
L_Main_Modal_Group_Actions1115:
;Main.c,469 :: 		return axis_to_home;
LH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,471 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1122:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,473 :: 		}
L_Main_Modal_Group_Actions1101:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Modal_Group_Actions1272
NOP	
J	L_Main_Modal_Group_Actions1103
NOP	
L_Main_Modal_Group_Actions1272:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions1274
NOP	
J	L_Main_Modal_Group_Actions1104
NOP	
L_Main_Modal_Group_Actions1274:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Modal_Group_Actions1276
NOP	
J	L_Main_Modal_Group_Actions1105
NOP	
L_Main_Modal_Group_Actions1276:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions1278
NOP	
J	L_Main_Modal_Group_Actions1106
NOP	
L_Main_Modal_Group_Actions1278:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Main_Modal_Group_Actions1280
NOP	
J	L_Main_Modal_Group_Actions1107
NOP	
L_Main_Modal_Group_Actions1280:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L_Main_Modal_Group_Actions1282
NOP	
J	L_Main_Modal_Group_Actions1108
NOP	
L_Main_Modal_Group_Actions1282:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions1284
NOP	
J	L_Main_Modal_Group_Actions1109
NOP	
L_Main_Modal_Group_Actions1284:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L_Main_Modal_Group_Actions1286
NOP	
J	L_Main_Modal_Group_Actions1110
NOP	
L_Main_Modal_Group_Actions1286:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L_Main_Modal_Group_Actions1288
NOP	
J	L_Main_Modal_Group_Actions1111
NOP	
L_Main_Modal_Group_Actions1288:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L_Main_Modal_Group_Actions1290
NOP	
J	L_Main_Modal_Group_Actions1112
NOP	
L_Main_Modal_Group_Actions1290:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1292
NOP	
J	L_Main_Modal_Group_Actions1113
NOP	
L_Main_Modal_Group_Actions1292:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1294
NOP	
J	L_Main_Modal_Group_Actions1114
NOP	
L_Main_Modal_Group_Actions1294:
J	L_Main_Modal_Group_Actions1122
NOP	
L_Main_Modal_Group_Actions1102:
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
BEQ	R2, R0, L_Main_Modal_Group_Actions3296
NOP	
J	L_Main_Modal_Group_Actions3123
NOP	
L_Main_Modal_Group_Actions3296:
;Main.c,485 :: 		FAIL(STATUS_SETTING_READ_FAIL);
ORI	R2, R0, 10
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions3123:
;Main.c,487 :: 		return action;
SEH	R2, R25
;Main.c,488 :: 		}
L_end_Modal_Group_Actions3:
JR	RA
NOP	
; end of Main_Modal_Group_Actions3
Main_Modal_Group_Actions4:
;Main.c,493 :: 		static int Modal_Group_Actions4(int action){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Main.c,495 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions4124:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions4299
NOP	
J	L_Main_Modal_Group_Actions4125
NOP	
L_Main_Modal_Group_Actions4299:
J	L_Main_Modal_Group_Actions4124
NOP	
L_Main_Modal_Group_Actions4125:
;Main.c,496 :: 		dma_printf("gc.program_flow:= %d\n",gc.program_flow);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 22
LUI	R24, hi_addr(?ICSMain_?lstr9_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr9_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 6
LBU	R2, Offset(_gc+9)(GP)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Main.c,499 :: 		gc.program_flow > PROGRAM_FLOW_COMPLETED)
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 0
BEQ	R2, R0, L_Main_Modal_Group_Actions4300
NOP	
J	L_Main_Modal_Group_Actions4155
NOP	
L_Main_Modal_Group_Actions4300:
LBU	R2, Offset(_gc+9)(GP)
SLTIU	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions4301
NOP	
J	L_Main_Modal_Group_Actions4154
NOP	
L_Main_Modal_Group_Actions4301:
J	L_Main_Modal_Group_Actions4128
NOP	
L_Main_Modal_Group_Actions4155:
L_Main_Modal_Group_Actions4154:
;Main.c,500 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions4128:
;Main.c,502 :: 		return action;
SEH	R2, R25
;Main.c,503 :: 		}
L_end_Modal_Group_Actions4:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of Main_Modal_Group_Actions4
Main_Modal_Group_Actions7:
;Main.c,508 :: 		static int Modal_Group_Actions7(int action){
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;Main.c,510 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions7129:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions7304
NOP	
J	L_Main_Modal_Group_Actions7130
NOP	
L_Main_Modal_Group_Actions7304:
J	L_Main_Modal_Group_Actions7129
NOP	
L_Main_Modal_Group_Actions7130:
;Main.c,511 :: 		dma_printf("gc.spindle_direction:= %d\n",gc.spindle_direction);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICSMain_?lstr10_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr10_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 6
LBU	R2, Offset(_gc+6)(GP)
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SB	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Main.c,513 :: 		if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
LBU	R2, Offset(_gc+6)(GP)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Main_Modal_Group_Actions7305
NOP	
J	L_Main_Modal_Group_Actions7158
NOP	
L_Main_Modal_Group_Actions7305:
LBU	R2, Offset(_gc+6)(GP)
SLTIU	R2, R2, 2
BNE	R2, R0, L_Main_Modal_Group_Actions7306
NOP	
J	L_Main_Modal_Group_Actions7157
NOP	
L_Main_Modal_Group_Actions7306:
J	L_Main_Modal_Group_Actions7133
NOP	
L_Main_Modal_Group_Actions7158:
L_Main_Modal_Group_Actions7157:
;Main.c,514 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R2, R0, 6
SH	R2, Offset(_status_code+0)(GP)
L_Main_Modal_Group_Actions7133:
;Main.c,516 :: 		return action;
SEH	R2, R25
;Main.c,517 :: 		}
L_end_Modal_Group_Actions7:
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of Main_Modal_Group_Actions7
Main_Modal_Group_Actions12:
;Main.c,522 :: 		static int Modal_Group_Actions12(int action){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Main.c,524 :: 		while(DMA_IsOn(1));
L_Main_Modal_Group_Actions12134:
SH	R25, 4(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LH	R25, 4(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions12309
NOP	
J	L_Main_Modal_Group_Actions12135
NOP	
L_Main_Modal_Group_Actions12309:
J	L_Main_Modal_Group_Actions12134
NOP	
L_Main_Modal_Group_Actions12135:
;Main.c,525 :: 		dma_printf("GROUP_12 modal actions\taction:= %d\n",action);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 36
LUI	R24, hi_addr(?ICSMain_?lstr11_Main+0)
ORI	R24, R24, lo_addr(?ICSMain_?lstr11_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -8
SH	R25, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LH	R25, 4(SP)
;Main.c,527 :: 		return action;
SEH	R2, R25
;Main.c,528 :: 		}
L_end_Modal_Group_Actions12:
LW	RA, 0(SP)
ADDIU	SP, SP, 44
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
BNE	R2, R0, L__protocol_execute_runtime312
NOP	
J	L_protocol_execute_runtime136
NOP	
L__protocol_execute_runtime312:
;Main.c,548 :: 		char rt_exec = sys.execute; // Avoid calling volatile multiple times
; rt_exec start address is: 16 (R4)
LBU	R4, Offset(_sys+25)(GP)
;Main.c,553 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
ANDI	R2, R4, 96
BNE	R2, R0, L__protocol_execute_runtime314
NOP	
J	L__protocol_execute_runtime160
NOP	
L__protocol_execute_runtime314:
;Main.c,554 :: 		sys.state = STATE_ALARM; // Set system alarm state
ORI	R2, R0, 6
SB	R2, Offset(_sys+1)(GP)
;Main.c,557 :: 		if (rt_exec & EXEC_CRIT_EVENT) {
ANDI	R2, R4, 64
BNE	R2, R0, L__protocol_execute_runtime316
NOP	
J	L_protocol_execute_runtime138
NOP	
L__protocol_execute_runtime316:
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
J	L_protocol_execute_runtime139
NOP	
L__protocol_execute_runtime159:
;Main.c,565 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
;Main.c,561 :: 		do {
L_protocol_execute_runtime139:
;Main.c,565 :: 		} while (bit_isfalse(sys.execute,EXEC_RESET));
; rt_exec start address is: 12 (R3)
; rt_exec start address is: 12 (R3)
; rt_exec end address is: 12 (R3)
LBU	R2, Offset(_sys+25)(GP)
ANDI	R2, R2, 16
ANDI	R2, R2, 255
BNE	R2, R0, L__protocol_execute_runtime318
NOP	
J	L__protocol_execute_runtime159
NOP	
L__protocol_execute_runtime318:
; rt_exec end address is: 12 (R3)
;Main.c,568 :: 		} else {
; rt_exec start address is: 12 (R3)
ANDI	R4, R3, 255
; rt_exec end address is: 12 (R3)
J	L_protocol_execute_runtime142
NOP	
L_protocol_execute_runtime138:
;Main.c,572 :: 		report_alarm_message(ALARM_ABORT_CYCLE);
; rt_exec start address is: 16 (R4)
SB	R4, 8(SP)
ORI	R25, R0, 65534
JAL	_report_alarm_message+0
NOP	
; rt_exec end address is: 16 (R4)
LBU	R4, 8(SP)
;Main.c,573 :: 		}
L_protocol_execute_runtime142:
;Main.c,574 :: 		bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
; rt_exec start address is: 16 (R4)
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 159
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
; rt_exec end address is: 16 (R4)
;Main.c,575 :: 		}
J	L_protocol_execute_runtime137
NOP	
L__protocol_execute_runtime160:
;Main.c,553 :: 		if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
;Main.c,575 :: 		}
L_protocol_execute_runtime137:
;Main.c,578 :: 		if (rt_exec & EXEC_RESET) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 16
BNE	R2, R0, L__protocol_execute_runtime320
NOP	
J	L_protocol_execute_runtime143
NOP	
L__protocol_execute_runtime320:
; rt_exec end address is: 16 (R4)
;Main.c,579 :: 		sys.abort = true;  // Only place this is set true.
ORI	R2, R0, 1
SB	R2, Offset(_sys+0)(GP)
;Main.c,580 :: 		return; // Nothing else to do but exit.
J	L_end_protocol_execute_runtime
NOP	
;Main.c,581 :: 		}
L_protocol_execute_runtime143:
;Main.c,584 :: 		if (rt_exec & EXEC_STATUS_REPORT) {
; rt_exec start address is: 16 (R4)
ANDI	R2, R4, 1
BNE	R2, R0, L__protocol_execute_runtime322
NOP	
J	L_protocol_execute_runtime144
NOP	
L__protocol_execute_runtime322:
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
L_protocol_execute_runtime144:
;Main.c,590 :: 		if (rt_exec & EXEC_FEED_HOLD) {
ANDI	R2, R4, 8
BNE	R2, R0, L__protocol_execute_runtime324
NOP	
J	L_protocol_execute_runtime145
NOP	
L__protocol_execute_runtime324:
;Main.c,592 :: 		bit_false(sys.execute,EXEC_FEED_HOLD);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,593 :: 		}
L_protocol_execute_runtime145:
;Main.c,597 :: 		if (rt_exec & EXEC_CYCLE_STOP) {
ANDI	R2, R4, 4
BNE	R2, R0, L__protocol_execute_runtime326
NOP	
J	L_protocol_execute_runtime146
NOP	
L__protocol_execute_runtime326:
;Main.c,599 :: 		bit_false(sys.execute,EXEC_CYCLE_STOP);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,600 :: 		}
L_protocol_execute_runtime146:
;Main.c,602 :: 		if (rt_exec & EXEC_CYCLE_START) {
ANDI	R2, R4, 2
; rt_exec end address is: 16 (R4)
BNE	R2, R0, L__protocol_execute_runtime328
NOP	
J	L_protocol_execute_runtime147
NOP	
L__protocol_execute_runtime328:
;Main.c,604 :: 		if (bit_istrue(settings.flags,FLAG_AUTO_START)) {
LHU	R2, Offset(_settings+50)(GP)
ANDI	R2, R2, 2
ANDI	R2, R2, 65535
BNE	R2, R0, L__protocol_execute_runtime330
NOP	
J	L_protocol_execute_runtime148
NOP	
L__protocol_execute_runtime330:
;Main.c,605 :: 		sys.auto_start = true; // Re-enable auto start after feed hold.
ORI	R2, R0, 1
SB	R2, Offset(_sys+24)(GP)
;Main.c,606 :: 		}
L_protocol_execute_runtime148:
;Main.c,607 :: 		bit_false(sys.execute,EXEC_CYCLE_START);
LBU	R3, Offset(_sys+25)(GP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, Offset(_sys+25)(GP)
;Main.c,608 :: 		}
L_protocol_execute_runtime147:
;Main.c,609 :: 		}
L_protocol_execute_runtime136:
;Main.c,613 :: 		}
L_end_protocol_execute_runtime:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _protocol_execute_runtime
