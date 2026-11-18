_Condition_Externs:
;Main.c,58 :: 		void Condition_Externs(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,59 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,60 :: 		Ethernet_Transport_Init();
JAL	_Ethernet_Transport_Init+0
NOP	
;Main.c,61 :: 		plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
LUI	R3, 17820
ORI	R3, R3, 16384
LUI	R2, 17820
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_plan_init+0
NOP	
;Main.c,62 :: 		Init_Protocol();
JAL	_Init_Protocol+0
NOP	
;Main.c,63 :: 		G_Initialise();
JAL	_G_Initialise+0
NOP	
;Main.c,64 :: 		sys_sync_current_position();
JAL	_sys_sync_current_position+0
NOP	
;Main.c,65 :: 		disableSpindleOCx();
JAL	_disableSpindleOCx+0
NOP	
;Main.c,66 :: 		DisableSteppers();
JAL	_DisableSteppers+0
NOP	
;Main.c,68 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,69 :: 		}
L_end_Condition_Externs:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Condition_Externs
_main:
;Main.c,73 :: 		void main() {
;Main.c,74 :: 		int error = 0;
;Main.c,75 :: 		int has_flash = 0;
;Main.c,76 :: 		int modal_group = 0;
;Main.c,77 :: 		int modal_action = 0;
;Main.c,82 :: 		Condition_Externs();
JAL	_Condition_Externs+0
NOP	
;Main.c,85 :: 		cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,88 :: 		Timer8_Start();
JAL	_Timer8_Start+0
NOP	
;Main.c,92 :: 		while(1){
L_main0:
;Main.c,96 :: 		Ethernet_Transport_Poll();
JAL	_Ethernet_Transport_Poll+0
NOP	
;Main.c,100 :: 		if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
LH	R3, Offset(Main_status_of_gcode+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__main239
NOP	
J	L_main2
NOP	
L__main239:
;Main.c,101 :: 		report_status_message(Execute_Gcode_Line());
JAL	Main_Execute_Gcode_Line+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,102 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Main.c,103 :: 		status_of_gcode = STATUS_OK;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,104 :: 		}
J	L_main3
NOP	
L_main2:
;Main.c,106 :: 		else if(Get_modalgroup() == bit(HOME_ALL)){
JAL	_Get_modalgroup+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1024
BEQ	R3, R2, L__main240
NOP	
J	L_main4
NOP	
L__main240:
;Main.c,108 :: 		modal_action = Modal_Group_Actions1(ALL_AXIS);
ORI	R25, R0, 31
JAL	Main_Modal_Group_Actions1+0
NOP	
;Main.c,109 :: 		if(modal_action == 0) Rst_modalgroup();
SEH	R2, R2
BEQ	R2, R0, L__main241
NOP	
J	L_main5
NOP	
L__main241:
JAL	_Rst_modalgroup+0
NOP	
L_main5:
;Main.c,110 :: 		}
L_main4:
L_main3:
;Main.c,112 :: 		if(sys.state == STATE_CYCLE && !Axes_Running())
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__main242
NOP	
J	L__main226
NOP	
L__main242:
JAL	Main_Axes_Running+0
NOP	
BEQ	R2, R0, L__main243
NOP	
J	L__main225
NOP	
L__main243:
L__main224:
;Main.c,113 :: 		Cycle_Complete();
JAL	_Cycle_Complete+0
NOP	
;Main.c,112 :: 		if(sys.state == STATE_CYCLE && !Axes_Running())
L__main226:
L__main225:
;Main.c,135 :: 		Ethernet_Transport_Poll();
JAL	_Ethernet_Transport_Poll+0
NOP	
;Main.c,138 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,141 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,145 :: 		if(sys.state != STATE_CYCLE && sys.state != STATE_HOMING && sys.state != STATE_HOLD)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main245
NOP	
J	L__main229
NOP	
L__main245:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main247
NOP	
J	L__main228
NOP	
L__main247:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__main249
NOP	
J	L__main227
NOP	
L__main249:
L__main223:
;Main.c,146 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, Offset(Main_status_of_gcode+0)(GP)
;Main.c,145 :: 		if(sys.state != STATE_CYCLE && sys.state != STATE_HOMING && sys.state != STATE_HOLD)
L__main229:
L__main228:
L__main227:
;Main.c,151 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,156 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main250
NOP	
J	L_main12
NOP	
L__main250:
;Main.c,157 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main12:
;Main.c,161 :: 		WDT_CLEAR();
ORI	R2, R0, 67
SB	R2, Offset(-1082128382)(GP)
;Main.c,162 :: 		}
J	L_main0
NOP	
;Main.c,163 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Host_ServiceNow:
;Main.c,169 :: 		void Host_ServiceNow(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,171 :: 		if(Serial_TakeStatusRequest()) report_realtime_status();
SW	R25, 4(SP)
JAL	_Serial_TakeStatusRequest+0
NOP	
BNE	R2, R0, L__Host_ServiceNow254
NOP	
J	L_Host_ServiceNow13
NOP	
L__Host_ServiceNow254:
JAL	_report_realtime_status+0
NOP	
L_Host_ServiceNow13:
;Main.c,172 :: 		if(Serial_PeekRealtime() & (EXEC_RESET | EXEC_FEED_HOLD)) return;
JAL	_Serial_PeekRealtime+0
NOP	
ANDI	R2, R2, 24
BNE	R2, R0, L__Host_ServiceNow256
NOP	
J	L_Host_ServiceNow14
NOP	
L__Host_ServiceNow256:
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow14:
;Main.c,173 :: 		for(n = 0; n < 16; n++){
SH	R0, 8(SP)
L_Host_ServiceNow15:
LH	R2, 8(SP)
SLTI	R2, R2, 16
BNE	R2, R0, L__Host_ServiceNow257
NOP	
J	L_Host_ServiceNow16
NOP	
L__Host_ServiceNow257:
;Main.c,174 :: 		if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
LH	R3, Offset(Main_status_of_gcode+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Host_ServiceNow258
NOP	
J	L_Host_ServiceNow18
NOP	
L__Host_ServiceNow258:
;Main.c,175 :: 		report_status_message(Execute_Gcode_Line());
JAL	Main_Execute_Gcode_Line+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,176 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Main.c,177 :: 		status_of_gcode = STATUS_OK;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,178 :: 		}
L_Host_ServiceNow18:
;Main.c,179 :: 		if(sys.abort || Get_Difference() == 0) return;
LH	R2, Offset(-1610599168)(GP)
BEQ	R2, R0, L__Host_ServiceNow259
NOP	
J	L__Host_ServiceNow233
NOP	
L__Host_ServiceNow259:
JAL	_Get_Difference+0
NOP	
SEH	R2, R2
BNE	R2, R0, L__Host_ServiceNow261
NOP	
J	L__Host_ServiceNow232
NOP	
L__Host_ServiceNow261:
J	L_Host_ServiceNow21
NOP	
L__Host_ServiceNow233:
L__Host_ServiceNow232:
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow21:
;Main.c,180 :: 		if(sys.state == STATE_CYCLE || sys.state == STATE_HOMING || sys.state == STATE_HOLD)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Host_ServiceNow263
NOP	
J	L__Host_ServiceNow236
NOP	
L__Host_ServiceNow263:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__Host_ServiceNow265
NOP	
J	L__Host_ServiceNow235
NOP	
L__Host_ServiceNow265:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Host_ServiceNow267
NOP	
J	L__Host_ServiceNow234
NOP	
L__Host_ServiceNow267:
J	L_Host_ServiceNow24
NOP	
L__Host_ServiceNow236:
L__Host_ServiceNow235:
L__Host_ServiceNow234:
;Main.c,181 :: 		return;
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow24:
;Main.c,182 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, Offset(Main_status_of_gcode+0)(GP)
;Main.c,173 :: 		for(n = 0; n < 16; n++){
LH	R2, 8(SP)
ADDIU	R2, R2, 1
SH	R2, 8(SP)
;Main.c,183 :: 		}
J	L_Host_ServiceNow15
NOP	
L_Host_ServiceNow16:
;Main.c,184 :: 		}
L_end_Host_ServiceNow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Host_ServiceNow
Main_Execute_Gcode_Line:
;Main.c,191 :: 		static int Execute_Gcode_Line(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,192 :: 		int axes = Get_Axisword();
SW	R25, 4(SP)
JAL	_Get_Axisword+0
NOP	
SH	R2, 8(SP)
;Main.c,193 :: 		int nm   = Get_non_modalword();
JAL	_Get_non_modalword+0
NOP	
SH	R2, 10(SP)
;Main.c,194 :: 		SET_FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_SET_FAIL+0
NOP	
;Main.c,195 :: 		if(nm){
LH	R2, 10(SP)
BNE	R2, R0, L_Main_Execute_Gcode_Line270
NOP	
J	L_Main_Execute_Gcode_Line25
NOP	
L_Main_Execute_Gcode_Line270:
;Main.c,196 :: 		Modal_Group_Actions0(nm);
LH	R25, 10(SP)
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,198 :: 		if(nm & ~bit(NON_MODAL_DWELL)) axes = 0;
LH	R3, 10(SP)
ORI	R2, R0, 65533
AND	R2, R3, R2
BNE	R2, R0, L_Main_Execute_Gcode_Line272
NOP	
J	L_Main_Execute_Gcode_Line26
NOP	
L_Main_Execute_Gcode_Line272:
SH	R0, 8(SP)
L_Main_Execute_Gcode_Line26:
;Main.c,199 :: 		}
L_Main_Execute_Gcode_Line25:
;Main.c,200 :: 		if(GET_FAIL() == STATUS_OK && axes)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line273
NOP	
J	L_Main_Execute_Gcode_Line218
NOP	
L_Main_Execute_Gcode_Line273:
LH	R2, 8(SP)
BNE	R2, R0, L_Main_Execute_Gcode_Line275
NOP	
J	L_Main_Execute_Gcode_Line217
NOP	
L_Main_Execute_Gcode_Line275:
L_Main_Execute_Gcode_Line216:
;Main.c,201 :: 		Motion_Line(axes);
LH	R25, 8(SP)
JAL	Main_Motion_Line+0
NOP	
;Main.c,200 :: 		if(GET_FAIL() == STATUS_OK && axes)
L_Main_Execute_Gcode_Line218:
L_Main_Execute_Gcode_Line217:
;Main.c,202 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_COMPLETED)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line276
NOP	
J	L_Main_Execute_Gcode_Line220
NOP	
L_Main_Execute_Gcode_Line276:
LBU	R3, Offset(-1610602231)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L_Main_Execute_Gcode_Line277
NOP	
J	L_Main_Execute_Gcode_Line219
NOP	
L_Main_Execute_Gcode_Line277:
L_Main_Execute_Gcode_Line215:
;Main.c,203 :: 		G_Program_End();
JAL	_G_Program_End+0
NOP	
;Main.c,202 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_COMPLETED)
L_Main_Execute_Gcode_Line220:
L_Main_Execute_Gcode_Line219:
;Main.c,206 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_PAUSED)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line278
NOP	
J	L_Main_Execute_Gcode_Line222
NOP	
L_Main_Execute_Gcode_Line278:
LBU	R3, Offset(-1610602231)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L_Main_Execute_Gcode_Line279
NOP	
J	L_Main_Execute_Gcode_Line221
NOP	
L_Main_Execute_Gcode_Line279:
L_Main_Execute_Gcode_Line214:
;Main.c,207 :: 		sys.state = STATE_HOLD;
ORI	R2, R0, 4
SH	R2, Offset(-1610599166)(GP)
;Main.c,206 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_PAUSED)
L_Main_Execute_Gcode_Line222:
L_Main_Execute_Gcode_Line221:
;Main.c,208 :: 		return GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,209 :: 		}
;Main.c,208 :: 		return GET_FAIL();
;Main.c,209 :: 		}
L_end_Execute_Gcode_Line:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Main_Execute_Gcode_Line
Main_Compute_Target:
;Main.c,215 :: 		static void Compute_Target(int axes,float *target){
;Main.c,217 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Compute_Target36:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Compute_Target281
NOP	
J	L_Main_Compute_Target37
NOP	
L_Main_Compute_Target281:
;Main.c,218 :: 		if(bit_istrue(axes,bit(i))){
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R25, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Compute_Target283
NOP	
J	L_Main_Compute_Target39
NOP	
L_Main_Compute_Target283:
;Main.c,219 :: 		if(gc.absolute_override)
LBU	R2, Offset(-1610602236)(GP)
BNE	R2, R0, L_Main_Compute_Target285
NOP	
J	L_Main_Compute_Target40
NOP	
L_Main_Compute_Target285:
;Main.c,220 :: 		target[i] = gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
J	L_Main_Compute_Target41
NOP	
L_Main_Compute_Target40:
;Main.c,221 :: 		else if(gc.absolute_mode)
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Compute_Target287
NOP	
J	L_Main_Compute_Target42
NOP	
L_Main_Compute_Target287:
;Main.c,222 :: 		target[i] = gc.next_position[i] + gc.coord_system[i] + gc.coord_offset[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10544
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S1, S1, S0
LUI	R2, 40960
ORI	R2, R2, 10560
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R3)
J	L_Main_Compute_Target43
NOP	
L_Main_Compute_Target42:
;Main.c,224 :: 		target[i] = gc.position[i] + gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R3)
L_Main_Compute_Target43:
L_Main_Compute_Target41:
;Main.c,225 :: 		}else{
J	L_Main_Compute_Target44
NOP	
L_Main_Compute_Target39:
;Main.c,226 :: 		target[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,227 :: 		}
L_Main_Compute_Target44:
;Main.c,217 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,228 :: 		}
; i end address is: 20 (R5)
J	L_Main_Compute_Target36
NOP	
L_Main_Compute_Target37:
;Main.c,229 :: 		}
L_end_Compute_Target:
JR	RA
NOP	
; end of Main_Compute_Target
Main_Motion_Line:
;Main.c,232 :: 		static void Motion_Line(int axes){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,234 :: 		int mode = Get_motionmode();
SW	R25, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
JAL	_Get_motionmode+0
NOP	
LH	R25, 12(SP)
; mode start address is: 16 (R4)
SEH	R4, R2
;Main.c,235 :: 		if(mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR &&
SEH	R2, R2
BNE	R2, R0, L_Main_Motion_Line290
NOP	
J	L_Main_Motion_Line202
NOP	
L_Main_Motion_Line290:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Motion_Line292
NOP	
J	L_Main_Motion_Line201
NOP	
L_Main_Motion_Line292:
;Main.c,236 :: 		mode != MOTION_MODE_CW_ARC && mode != MOTION_MODE_CCW_ARC){
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Motion_Line294
NOP	
J	L_Main_Motion_Line200
NOP	
L_Main_Motion_Line294:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Motion_Line296
NOP	
J	L_Main_Motion_Line199
NOP	
L_Main_Motion_Line296:
; mode end address is: 16 (R4)
L_Main_Motion_Line198:
;Main.c,237 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;Main.c,238 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,235 :: 		if(mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR &&
L_Main_Motion_Line202:
; mode start address is: 16 (R4)
L_Main_Motion_Line201:
;Main.c,236 :: 		mode != MOTION_MODE_CW_ARC && mode != MOTION_MODE_CCW_ARC){
L_Main_Motion_Line200:
L_Main_Motion_Line199:
;Main.c,240 :: 		if(gc.absolute_override && mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR){
LBU	R2, Offset(-1610602236)(GP)
BNE	R2, R0, L_Main_Motion_Line298
NOP	
J	L_Main_Motion_Line205
NOP	
L_Main_Motion_Line298:
SEH	R2, R4
BNE	R2, R0, L_Main_Motion_Line300
NOP	
J	L_Main_Motion_Line204
NOP	
L_Main_Motion_Line300:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Motion_Line302
NOP	
J	L_Main_Motion_Line203
NOP	
L_Main_Motion_Line302:
; mode end address is: 16 (R4)
L_Main_Motion_Line197:
;Main.c,241 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;Main.c,242 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,240 :: 		if(gc.absolute_override && mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR){
L_Main_Motion_Line205:
; mode start address is: 16 (R4)
L_Main_Motion_Line204:
L_Main_Motion_Line203:
;Main.c,244 :: 		if(mode != MOTION_MODE_SEEK && gc.feed_rate <= 0.0){
SEH	R2, R4
BNE	R2, R0, L_Main_Motion_Line304
NOP	
J	L_Main_Motion_Line207
NOP	
L_Main_Motion_Line304:
LWC1	S1, Offset(-1610602216)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L_Main_Motion_Line305
NOP	
J	L_Main_Motion_Line206
NOP	
L_Main_Motion_Line305:
; mode end address is: 16 (R4)
L_Main_Motion_Line196:
;Main.c,245 :: 		FAIL(STATUS_UNDEFINED_FEED_RATE);
ORI	R25, R0, 17
JAL	_FAIL+0
NOP	
;Main.c,246 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,244 :: 		if(mode != MOTION_MODE_SEEK && gc.feed_rate <= 0.0){
L_Main_Motion_Line207:
; mode start address is: 16 (R4)
L_Main_Motion_Line206:
;Main.c,249 :: 		if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) && axis_xyz != AXIS_XY){
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Motion_Line307
NOP	
J	L_Main_Motion_Line209
NOP	
L_Main_Motion_Line307:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Motion_Line309
NOP	
J	L_Main_Motion_Line208
NOP	
L_Main_Motion_Line309:
J	L_Main_Motion_Line58
NOP	
L_Main_Motion_Line209:
L_Main_Motion_Line208:
LBU	R2, Offset(_axis_xyz+0)(GP)
BNE	R2, R0, L_Main_Motion_Line311
NOP	
J	L_Main_Motion_Line210
NOP	
L_Main_Motion_Line311:
; mode end address is: 16 (R4)
L_Main_Motion_Line194:
;Main.c,250 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
;Main.c,251 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,252 :: 		}
L_Main_Motion_Line58:
;Main.c,249 :: 		if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) && axis_xyz != AXIS_XY){
; mode start address is: 16 (R4)
L_Main_Motion_Line210:
;Main.c,253 :: 		if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) &&
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Motion_Line313
NOP	
J	L_Main_Motion_Line212
NOP	
L_Main_Motion_Line313:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Motion_Line315
NOP	
J	L_Main_Motion_Line211
NOP	
L_Main_Motion_Line315:
J	L_Main_Motion_Line63
NOP	
L_Main_Motion_Line212:
L_Main_Motion_Line211:
;Main.c,254 :: 		(axes & (bit(Z) | bit(A)))){
ANDI	R2, R25, 12
BNE	R2, R0, L_Main_Motion_Line317
NOP	
J	L_Main_Motion_Line213
NOP	
L_Main_Motion_Line317:
; mode end address is: 16 (R4)
L_Main_Motion_Line192:
;Main.c,255 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
;Main.c,256 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,257 :: 		}
L_Main_Motion_Line63:
;Main.c,254 :: 		(axes & (bit(Z) | bit(A)))){
; mode start address is: 16 (R4)
L_Main_Motion_Line213:
;Main.c,258 :: 		Compute_Target(axes,target);
ADDIU	R2, SP, 16
SH	R4, 12(SP)
MOVZ	R26, R2, R0
JAL	Main_Compute_Target+0
NOP	
LH	R4, 12(SP)
;Main.c,259 :: 		Run_Move(target,mode);
ADDIU	R2, SP, 16
SEH	R26, R4
; mode end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Main_Run_Move+0
NOP	
;Main.c,260 :: 		}
L_end_Motion_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of Main_Motion_Line
Main_Run_Move:
;Main.c,264 :: 		static void Run_Move(float *target,int mode){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,265 :: 		int i, axes = 0;
; axes start address is: 20 (R5)
MOVZ	R5, R0, R0
;Main.c,266 :: 		int arc = (mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC);
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Run_Move320
NOP	
J	L_Main_Run_Move65
NOP	
L_Main_Run_Move320:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Run_Move322
NOP	
J	L_Main_Run_Move65
NOP	
L_Main_Run_Move322:
MOVZ	R2, R0, R0
J	L_Main_Run_Move64
NOP	
L_Main_Run_Move65:
ORI	R2, R0, 1
L_Main_Run_Move64:
; arc start address is: 16 (R4)
ANDI	R4, R2, 255
;Main.c,267 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; arc end address is: 16 (R4)
; axes end address is: 20 (R5)
; i end address is: 24 (R6)
L_Main_Run_Move66:
; i start address is: 24 (R6)
; arc start address is: 16 (R4)
; axes start address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move323
NOP	
J	L_Main_Run_Move67
NOP	
L_Main_Run_Move323:
;Main.c,268 :: 		if(target[i] != gc.position[i]) bit_true(axes,bit(i));
SEH	R2, R6
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.EQ.S 	0, S1, S0
BC1F	0, L_Main_Run_Move324
NOP	
J	L_Main_Run_Move177
NOP	
L_Main_Run_Move324:
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
OR	R2, R5, R2
SEH	R5, R2
; axes end address is: 20 (R5)
J	L_Main_Run_Move69
NOP	
L_Main_Run_Move177:
L_Main_Run_Move69:
;Main.c,267 :: 		for(i=0;i<NoOfAxis;i++){
; axes start address is: 20 (R5)
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,269 :: 		}
; i end address is: 24 (R6)
J	L_Main_Run_Move66
NOP	
L_Main_Run_Move67:
;Main.c,270 :: 		if(!axes && !arc) return;
BEQ	R5, R0, L_Main_Run_Move325
NOP	
J	L_Main_Run_Move176
NOP	
L_Main_Run_Move325:
BEQ	R4, R0, L_Main_Run_Move326
NOP	
J	L_Main_Run_Move175
NOP	
L_Main_Run_Move326:
; arc end address is: 16 (R4)
; axes end address is: 20 (R5)
L_Main_Run_Move174:
J	L_end_Run_Move
NOP	
L_Main_Run_Move176:
; axes start address is: 20 (R5)
; arc start address is: 16 (R4)
L_Main_Run_Move175:
;Main.c,272 :: 		sys.state = STATE_CYCLE;
ORI	R2, R0, 3
SH	R2, Offset(-1610599166)(GP)
;Main.c,275 :: 		motion_rate = (mode == MOTION_MODE_SEEK) ? settings.default_seek_rate : gc.feed_rate;
SEH	R2, R26
BEQ	R2, R0, L_Main_Run_Move327
NOP	
J	L_Main_Run_Move73
NOP	
L_Main_Run_Move327:
; ?FLOC__Main_Run_Move?T123 start address is: 0 (R0)
LWC1	S0, Offset(-1610602476)(GP)
; ?FLOC__Main_Run_Move?T123 end address is: 0 (R0)
J	L_Main_Run_Move74
NOP	
L_Main_Run_Move73:
; ?FLOC__Main_Run_Move?T123 start address is: 0 (R0)
LWC1	S0, Offset(-1610602216)(GP)
; ?FLOC__Main_Run_Move?T123 end address is: 0 (R0)
L_Main_Run_Move74:
; ?FLOC__Main_Run_Move?T123 start address is: 0 (R0)
SWC1	S0, Offset(Main_motion_rate+0)(GP)
; ?FLOC__Main_Run_Move?T123 end address is: 0 (R0)
;Main.c,276 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; arc end address is: 16 (R4)
; axes end address is: 20 (R5)
; i end address is: 32 (R8)
SEH	R7, R4
SEH	R6, R5
L_Main_Run_Move75:
; i start address is: 32 (R8)
; axes start address is: 24 (R6)
; arc start address is: 28 (R7)
SEH	R2, R8
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move328
NOP	
J	L_Main_Run_Move76
NOP	
L_Main_Run_Move328:
;Main.c,277 :: 		if(bit_istrue(axes,bit(i)))
SEH	R3, R8
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Run_Move330
NOP	
J	L_Main_Run_Move78
NOP	
L_Main_Run_Move330:
;Main.c,278 :: 		gc.next_position[i] = gc.absolute_mode ? target[i] : target[i] - gc.position[i];
SEH	R2, R8
SLL	R3, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R5, R2, R3
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Run_Move332
NOP	
J	L_Main_Run_Move79
NOP	
L_Main_Run_Move332:
SEH	R2, R8
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 16(SP)
J	L_Main_Run_Move80
NOP	
L_Main_Run_Move79:
SEH	R2, R8
SLL	R3, R2, 2
ADDU	R4, R25, R3
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LWC1	S0, 0(R4)
SUB.S 	S0, S0, S1
SWC1	S0, 16(SP)
L_Main_Run_Move80:
LWC1	S0, 16(SP)
SWC1	S0, 0(R5)
L_Main_Run_Move78:
;Main.c,276 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R8, 1
SEH	R8, R2
;Main.c,279 :: 		}
; i end address is: 32 (R8)
J	L_Main_Run_Move75
NOP	
L_Main_Run_Move76:
;Main.c,280 :: 		EnableSteppers();
SH	R7, 4(SP)
SH	R6, 6(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
JAL	_EnableSteppers+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LH	R6, 6(SP)
LH	R7, 4(SP)
;Main.c,281 :: 		if(arc)
BNE	R7, R0, L_Main_Run_Move334
NOP	
J	L_Main_Run_Move81
NOP	
L_Main_Run_Move334:
; axes end address is: 24 (R6)
; arc end address is: 28 (R7)
;Main.c,282 :: 		Modal_Group_Actions1(15);
SH	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 15
JAL	Main_Modal_Group_Actions1+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
J	L_Main_Run_Move82
NOP	
L_Main_Run_Move81:
;Main.c,284 :: 		MultiAxisStep(gc.next_position,axes,motion_rate);
; axes start address is: 24 (R6)
SH	R26, 4(SP)
SW	R25, 8(SP)
LWC1	S12, Offset(Main_motion_rate+0)(GP)
SEH	R26, R6
; axes end address is: 24 (R6)
LUI	R25, 40960
ORI	R25, R25, 10576
JAL	_MultiAxisStep+0
NOP	
LW	R25, 8(SP)
LH	R26, 4(SP)
L_Main_Run_Move82:
;Main.c,290 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Run_Move83:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move335
NOP	
J	L_Main_Run_Move84
NOP	
L_Main_Run_Move335:
;Main.c,291 :: 		gc.position[i] = target[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R3, R2, R4
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,290 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,291 :: 		gc.position[i] = target[i];
; i end address is: 20 (R5)
J	L_Main_Run_Move83
NOP	
L_Main_Run_Move84:
;Main.c,295 :: 		}
L_end_Run_Move:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of Main_Run_Move
_Cycle_Complete:
;Main.c,299 :: 		void Cycle_Complete(){
;Main.c,300 :: 		if(sys.state == STATE_CYCLE)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Cycle_Complete337
NOP	
J	L_Cycle_Complete86
NOP	
L__Cycle_Complete337:
;Main.c,301 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
L_Cycle_Complete86:
;Main.c,302 :: 		}
L_end_Cycle_Complete:
JR	RA
NOP	
; end of _Cycle_Complete
Main_Axes_Running:
;Main.c,305 :: 		static int Axes_Running(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,307 :: 		for(i=0;i<NoOfAxis;i++){
SW	R25, 4(SP)
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Main_Axes_Running87:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Axes_Running339
NOP	
J	L_Main_Axes_Running88
NOP	
L_Main_Axes_Running339:
;Main.c,308 :: 		if(GET_RunState(i)) return 1;
SH	R3, 8(SP)
SEH	R25, R3
JAL	_GET_RunState+0
NOP	
LH	R3, 8(SP)
BNE	R2, R0, L_Main_Axes_Running341
NOP	
J	L_Main_Axes_Running90
NOP	
L_Main_Axes_Running341:
; i end address is: 12 (R3)
ORI	R2, R0, 1
J	L_end_Axes_Running
NOP	
L_Main_Axes_Running90:
;Main.c,307 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
SEH	R3, R2
;Main.c,309 :: 		}
; i end address is: 12 (R3)
J	L_Main_Axes_Running87
NOP	
L_Main_Axes_Running88:
;Main.c,310 :: 		return 0;
MOVZ	R2, R0, R0
;Main.c,311 :: 		}
;Main.c,310 :: 		return 0;
;Main.c,311 :: 		}
L_end_Axes_Running:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Main_Axes_Running
Main_Wait_Motion:
;Main.c,313 :: 		static void Wait_Motion(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,314 :: 		while(Axes_Running()){
L_Main_Wait_Motion91:
JAL	Main_Axes_Running+0
NOP	
BNE	R2, R0, L_Main_Wait_Motion344
NOP	
J	L_Main_Wait_Motion92
NOP	
L_Main_Wait_Motion344:
;Main.c,315 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,316 :: 		if(sys.abort) return;
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Wait_Motion346
NOP	
J	L_Main_Wait_Motion93
NOP	
L_Main_Wait_Motion346:
J	L_end_Wait_Motion
NOP	
L_Main_Wait_Motion93:
;Main.c,317 :: 		}
J	L_Main_Wait_Motion91
NOP	
L_Main_Wait_Motion92:
;Main.c,318 :: 		Cycle_Complete();
JAL	_Cycle_Complete+0
NOP	
;Main.c,319 :: 		}
L_end_Wait_Motion:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Main_Wait_Motion
Main_Run_Single_Axes:
;Main.c,322 :: 		static void Run_Single_Axes(float *target){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Main.c,326 :: 		order[0] = Z; order[1] = X; order[2] = Y; order[3] = A;
SW	R26, 4(SP)
ADDIU	R4, SP, 16
ORI	R2, R0, 2
SH	R2, 0(R4)
ADDIU	R2, R4, 2
SH	R0, 0(R2)
ADDIU	R3, R4, 4
ORI	R2, R0, 1
SH	R2, 0(R3)
ADDIU	R3, R4, 6
ORI	R2, R0, 3
SH	R2, 0(R3)
;Main.c,327 :: 		for(k=0;k<NoOfAxis;k++){
; k start address is: 20 (R5)
MOVZ	R5, R0, R0
; k end address is: 20 (R5)
L_Main_Run_Single_Axes94:
; k start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Single_Axes348
NOP	
J	L_Main_Run_Single_Axes95
NOP	
L_Main_Run_Single_Axes348:
;Main.c,328 :: 		for(i=0;i<NoOfAxis;i++) step_target[i] = gc.position[i];
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
; k end address is: 20 (R5)
L_Main_Run_Single_Axes97:
; i start address is: 24 (R6)
; k start address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Single_Axes349
NOP	
J	L_Main_Run_Single_Axes98
NOP	
L_Main_Run_Single_Axes349:
ADDIU	R3, SP, 24
SEH	R2, R6
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
ADDIU	R2, R6, 1
SEH	R6, R2
; i end address is: 24 (R6)
J	L_Main_Run_Single_Axes97
NOP	
L_Main_Run_Single_Axes98:
;Main.c,329 :: 		step_target[order[k]] = target[order[k]];
ADDIU	R3, SP, 16
SEH	R2, R5
SLL	R2, R2, 1
ADDU	R2, R3, R2
LH	R2, 0(R2)
ADDIU	R4, SP, 24
SEH	R2, R2
SLL	R2, R2, 2
ADDU	R3, R4, R2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,330 :: 		Run_Move(step_target,MOTION_MODE_SEEK);
SH	R5, 8(SP)
SW	R25, 12(SP)
MOVZ	R26, R0, R0
MOVZ	R25, R4, R0
JAL	Main_Run_Move+0
NOP	
;Main.c,331 :: 		Wait_Motion();
JAL	Main_Wait_Motion+0
NOP	
LW	R25, 12(SP)
LH	R5, 8(SP)
;Main.c,332 :: 		if(sys.abort) return;
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Run_Single_Axes351
NOP	
J	L_Main_Run_Single_Axes100
NOP	
L_Main_Run_Single_Axes351:
; k end address is: 20 (R5)
J	L_end_Run_Single_Axes
NOP	
L_Main_Run_Single_Axes100:
;Main.c,327 :: 		for(k=0;k<NoOfAxis;k++){
; k start address is: 20 (R5)
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,333 :: 		}
; k end address is: 20 (R5)
J	L_Main_Run_Single_Axes94
NOP	
L_Main_Run_Single_Axes95:
;Main.c,334 :: 		}
L_end_Run_Single_Axes:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of Main_Run_Single_Axes
Main_Modal_Group_Actions0:
;Main.c,341 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Main.c,347 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions0101
NOP	
;Main.c,348 :: 		case 2:  //G4 dwell, P in seconds as in Grbl 1.1, or S in seconds
L_Main_Modal_Group_Actions0103:
;Main.c,349 :: 		if(gc.S > 0)
LH	R2, Offset(-1610602114)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0353
NOP	
J	L_Main_Modal_Group_Actions0104
NOP	
L_Main_Modal_Group_Actions0353:
;Main.c,350 :: 		dly_time = (unsigned long)gc.S * 1000;
LH	R3, Offset(-1610602114)(GP)
ORI	R2, R0, 1000
MULTU	R3, R2
MFLO	R2
; dly_time start address is: 8 (R2)
MOVZ	R4, R2, R0
; dly_time end address is: 8 (R2)
J	L_Main_Modal_Group_Actions0105
NOP	
L_Main_Modal_Group_Actions0104:
;Main.c,351 :: 		else if(gc.dwell >= 0.0)
LWC1	S1, Offset(-1610602112)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Main_Modal_Group_Actions0354
NOP	
J	L_Main_Modal_Group_Actions0106
NOP	
L_Main_Modal_Group_Actions0354:
;Main.c,352 :: 		dly_time = (unsigned long)(gc.dwell * 1000.0 + 0.5);
LWC1	S1, Offset(-1610602112)(GP)
LUI	R2, 17530
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S1, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
CVT36.S 	S0, S0
MFC1	R2, S0
; dly_time start address is: 8 (R2)
J	L_Main_Modal_Group_Actions0107
NOP	
; dly_time end address is: 8 (R2)
L_Main_Modal_Group_Actions0106:
;Main.c,354 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,355 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,356 :: 		}
L_Main_Modal_Group_Actions0107:
; dly_time start address is: 8 (R2)
MOVZ	R4, R2, R0
L_Main_Modal_Group_Actions0105:
; dly_time end address is: 8 (R2)
;Main.c,357 :: 		while(dly_time > 0){
; dly_time start address is: 16 (R4)
; dly_time end address is: 16 (R4)
L_Main_Modal_Group_Actions0108:
; dly_time start address is: 16 (R4)
SLTIU	R2, R4, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0355
NOP	
J	L_Main_Modal_Group_Actions0109
NOP	
L_Main_Modal_Group_Actions0355:
;Main.c,358 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,359 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions0110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions0110
NOP	
;Main.c,360 :: 		protocol_execute_runtime();
SW	R4, 12(SP)
SH	R25, 16(SP)
JAL	_protocol_execute_runtime+0
NOP	
LH	R25, 16(SP)
LW	R4, 12(SP)
;Main.c,361 :: 		if(sys.abort) break;
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0357
NOP	
J	L_Main_Modal_Group_Actions0112
NOP	
L_Main_Modal_Group_Actions0357:
; dly_time end address is: 16 (R4)
J	L_Main_Modal_Group_Actions0109
NOP	
L_Main_Modal_Group_Actions0112:
;Main.c,362 :: 		WDT_CLEAR();
; dly_time start address is: 16 (R4)
ORI	R2, R0, 67
SB	R2, Offset(-1082128382)(GP)
;Main.c,363 :: 		dly_time--;
ADDIU	R2, R4, -1
MOVZ	R4, R2, R0
;Main.c,364 :: 		}
; dly_time end address is: 16 (R4)
J	L_Main_Modal_Group_Actions0108
NOP	
L_Main_Modal_Group_Actions0109:
;Main.c,365 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,366 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,367 :: 		case 4:  //G10 L2 / L20 Pn, P0 = active system, P1..P6 = G54..G59
L_Main_Modal_Group_Actions0113:
;Main.c,369 :: 		if(gc.L != 2 && gc.L != 20){
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0359
NOP	
J	L_Main_Modal_Group_Actions0184
NOP	
L_Main_Modal_Group_Actions0359:
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0361
NOP	
J	L_Main_Modal_Group_Actions0183
NOP	
L_Main_Modal_Group_Actions0361:
L_Main_Modal_Group_Actions0182:
;Main.c,370 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,371 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,369 :: 		if(gc.L != 2 && gc.L != 20){
L_Main_Modal_Group_Actions0184:
L_Main_Modal_Group_Actions0183:
;Main.c,373 :: 		temp = (gc.P == 0) ? gc.coord_select : gc.P;
LH	R2, Offset(-1610602116)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0362
NOP	
J	L_Main_Modal_Group_Actions0117
NOP	
L_Main_Modal_Group_Actions0362:
; ?FLOC__Main_Modal_Group_Actions0?T210 start address is: 16 (R4)
LH	R4, Offset(-1610602226)(GP)
; ?FLOC__Main_Modal_Group_Actions0?T210 end address is: 16 (R4)
J	L_Main_Modal_Group_Actions0118
NOP	
L_Main_Modal_Group_Actions0117:
; ?FLOC__Main_Modal_Group_Actions0?T210 start address is: 16 (R4)
LH	R4, Offset(-1610602116)(GP)
; ?FLOC__Main_Modal_Group_Actions0?T210 end address is: 16 (R4)
L_Main_Modal_Group_Actions0118:
; ?FLOC__Main_Modal_Group_Actions0?T210 start address is: 16 (R4)
; temp start address is: 12 (R3)
SEH	R3, R4
;Main.c,374 :: 		if(temp < 1 || temp > 6){
SEH	R2, R4
; ?FLOC__Main_Modal_Group_Actions0?T210 end address is: 16 (R4)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0363
NOP	
J	L_Main_Modal_Group_Actions0186
NOP	
L_Main_Modal_Group_Actions0363:
SEH	R2, R3
SLTI	R2, R2, 7
BNE	R2, R0, L_Main_Modal_Group_Actions0364
NOP	
J	L_Main_Modal_Group_Actions0185
NOP	
L_Main_Modal_Group_Actions0364:
J	L_Main_Modal_Group_Actions0121
NOP	
; temp end address is: 12 (R3)
L_Main_Modal_Group_Actions0186:
L_Main_Modal_Group_Actions0185:
;Main.c,375 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,376 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,377 :: 		}
L_Main_Modal_Group_Actions0121:
;Main.c,378 :: 		axis_words = Get_Axisword();
; temp start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
; axis_words start address is: 8 (R2)
;Main.c,379 :: 		settings_read_coord_data();
SH	R2, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
JAL	_settings_read_coord_data+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R2, 12(SP)
;Main.c,380 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 28 (R7)
MOVZ	R7, R0, R0
; temp end address is: 12 (R3)
; axis_words end address is: 8 (R2)
; i end address is: 28 (R7)
SEH	R6, R3
SEH	R5, R2
L_Main_Modal_Group_Actions0122:
; i start address is: 28 (R7)
; axis_words start address is: 20 (R5)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; temp start address is: 24 (R6)
SEH	R2, R7
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0365
NOP	
J	L_Main_Modal_Group_Actions0123
NOP	
L_Main_Modal_Group_Actions0365:
; axis_words end address is: 20 (R5)
;Main.c,381 :: 		coord_data[i] = (i < 3) ? coord_system[temp-1].coord[i] : 0.0;
; axis_words start address is: 20 (R5)
ADDIU	R3, SP, 20
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R4, R3, R2
SEH	R2, R7
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0366
NOP	
J	L_Main_Modal_Group_Actions0125
NOP	
L_Main_Modal_Group_Actions0366:
ADDIU	R2, R6, -1
SEH	R2, R2
SLL	R3, R2, 5
LUI	R2, 40960
ORI	R2, R2, 13824
ADDU	R3, R2, R3
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R2, R3, R2
LWC1	S0, 0(R2)
; ?FLOC__Main_Modal_Group_Actions0?T230 start address is: 0 (R0)
; ?FLOC__Main_Modal_Group_Actions0?T230 end address is: 0 (R0)
J	L_Main_Modal_Group_Actions0126
NOP	
L_Main_Modal_Group_Actions0125:
MOVZ	R2, R0, R0
; ?FLOC__Main_Modal_Group_Actions0?T230 start address is: 0 (R0)
MTC1	R2, S0
; ?FLOC__Main_Modal_Group_Actions0?T230 end address is: 0 (R0)
L_Main_Modal_Group_Actions0126:
; ?FLOC__Main_Modal_Group_Actions0?T230 start address is: 0 (R0)
SWC1	S0, 0(R4)
; ?FLOC__Main_Modal_Group_Actions0?T230 end address is: 0 (R0)
;Main.c,382 :: 		if(i < 3 && bit_istrue(axis_words,bit(i))){
SEH	R2, R7
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0367
NOP	
J	L_Main_Modal_Group_Actions0188
NOP	
L_Main_Modal_Group_Actions0367:
SEH	R3, R7
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0369
NOP	
J	L_Main_Modal_Group_Actions0187
NOP	
L_Main_Modal_Group_Actions0369:
L_Main_Modal_Group_Actions0180:
;Main.c,384 :: 		if(gc.L == 20)
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0370
NOP	
J	L_Main_Modal_Group_Actions0130
NOP	
L_Main_Modal_Group_Actions0370:
;Main.c,385 :: 		coord_data[i] = gc.position[i] - gc.coord_offset[i] - gc.next_position[i];
ADDIU	R3, SP, 20
SEH	R2, R7
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10560
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S1, S1, S0
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 0(R3)
J	L_Main_Modal_Group_Actions0131
NOP	
L_Main_Modal_Group_Actions0130:
;Main.c,387 :: 		coord_data[i] = gc.next_position[i];
ADDIU	R3, SP, 20
SEH	R2, R7
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
L_Main_Modal_Group_Actions0131:
;Main.c,382 :: 		if(i < 3 && bit_istrue(axis_words,bit(i))){
L_Main_Modal_Group_Actions0188:
L_Main_Modal_Group_Actions0187:
;Main.c,380 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,389 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 28 (R7)
J	L_Main_Modal_Group_Actions0122
NOP	
L_Main_Modal_Group_Actions0123:
;Main.c,390 :: 		if(settings_write_coord_data(temp,coord_data)){
ADDIU	R2, SP, 20
SH	R6, 12(SP)
SH	R25, 14(SP)
MOVZ	R26, R2, R0
SEH	R25, R6
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 14(SP)
LH	R6, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0372
NOP	
J	L_Main_Modal_Group_Actions0132
NOP	
L_Main_Modal_Group_Actions0372:
; temp end address is: 24 (R6)
;Main.c,391 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 12(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,392 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,393 :: 		}
L_Main_Modal_Group_Actions0132:
;Main.c,394 :: 		if(temp == gc.coord_select)
; temp start address is: 24 (R6)
SEH	R3, R6
; temp end address is: 24 (R6)
LH	R2, Offset(-1610602226)(GP)
BEQ	R3, R2, L_Main_Modal_Group_Actions0373
NOP	
J	L_Main_Modal_Group_Actions0133
NOP	
L_Main_Modal_Group_Actions0373:
;Main.c,395 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 20
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions0133:
;Main.c,396 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,397 :: 		case  8:  //G28 go to the stored G28 position
L_Main_Modal_Group_Actions0134:
;Main.c,398 :: 		case 32:  //G30 go to the stored G30 position
L_Main_Modal_Group_Actions0135:
;Main.c,400 :: 		temp = (action == NON_MODAL_GO_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0374
NOP	
J	L_Main_Modal_Group_Actions0136
NOP	
L_Main_Modal_Group_Actions0374:
; ?FLOC__Main_Modal_Group_Actions0?T266 start address is: 8 (R2)
ORI	R2, R0, 11
; ?FLOC__Main_Modal_Group_Actions0?T266 end address is: 8 (R2)
J	L_Main_Modal_Group_Actions0137
NOP	
L_Main_Modal_Group_Actions0136:
; ?FLOC__Main_Modal_Group_Actions0?T266 start address is: 8 (R2)
ORI	R2, R0, 10
; ?FLOC__Main_Modal_Group_Actions0?T266 end address is: 8 (R2)
L_Main_Modal_Group_Actions0137:
; ?FLOC__Main_Modal_Group_Actions0?T266 start address is: 8 (R2)
; temp start address is: 12 (R3)
SEB	R3, R2
; ?FLOC__Main_Modal_Group_Actions0?T266 end address is: 8 (R2)
;Main.c,401 :: 		axis_words = Get_Axisword();
SH	R3, 12(SP)
SH	R25, 14(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
; axis_words start address is: 16 (R4)
SEH	R4, R2
;Main.c,402 :: 		if(axis_words){
BNE	R2, R0, L_Main_Modal_Group_Actions0376
NOP	
J	L_Main_Modal_Group_Actions0138
NOP	
L_Main_Modal_Group_Actions0376:
;Main.c,403 :: 		Compute_Target(axis_words,target);
ADDIU	R2, SP, 36
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
MOVZ	R26, R2, R0
SEH	R25, R4
JAL	Main_Compute_Target+0
NOP	
;Main.c,405 :: 		Run_Single_Axes(target);
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	Main_Run_Single_Axes+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
;Main.c,409 :: 		}
L_Main_Modal_Group_Actions0138:
;Main.c,410 :: 		settings_read_coord_data();
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
JAL	_settings_read_coord_data+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
;Main.c,411 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; axis_words end address is: 16 (R4)
; i end address is: 32 (R8)
; temp end address is: 12 (R3)
SEH	R7, R3
SEH	R6, R4
L_Main_Modal_Group_Actions0139:
; i start address is: 32 (R8)
; temp start address is: 28 (R7)
; axis_words start address is: 24 (R6)
; axis_words start address is: 24 (R6)
; axis_words end address is: 24 (R6)
; temp start address is: 28 (R7)
; temp end address is: 28 (R7)
SEH	R2, R8
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0377
NOP	
J	L_Main_Modal_Group_Actions0140
NOP	
L_Main_Modal_Group_Actions0377:
; axis_words end address is: 24 (R6)
; temp end address is: 28 (R7)
;Main.c,412 :: 		target[i] = gc.position[i];
; temp start address is: 28 (R7)
; axis_words start address is: 24 (R6)
ADDIU	R3, SP, 36
SEH	R2, R8
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,413 :: 		if(i < 3 && (!axis_words || bit_istrue(axis_words,bit(i))))
SEH	R2, R8
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0378
NOP	
J	L_Main_Modal_Group_Actions0191
NOP	
L_Main_Modal_Group_Actions0378:
BNE	R6, R0, L_Main_Modal_Group_Actions0380
NOP	
J	L_Main_Modal_Group_Actions0190
NOP	
L_Main_Modal_Group_Actions0380:
SEH	R3, R8
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0381
NOP	
J	L_Main_Modal_Group_Actions0189
NOP	
L_Main_Modal_Group_Actions0381:
J	L_Main_Modal_Group_Actions0146
NOP	
L_Main_Modal_Group_Actions0190:
L_Main_Modal_Group_Actions0189:
L_Main_Modal_Group_Actions0178:
;Main.c,414 :: 		target[i] = coord_system[temp-1].coord[i];
ADDIU	R3, SP, 36
SEH	R2, R8
SLL	R5, R2, 2
ADDU	R4, R3, R5
ADDIU	R2, R7, -1
SEH	R2, R2
SLL	R3, R2, 5
LUI	R2, 40960
ORI	R2, R2, 13824
ADDU	R2, R2, R3
ADDU	R2, R2, R5
LWC1	S0, 0(R2)
SWC1	S0, 0(R4)
L_Main_Modal_Group_Actions0146:
;Main.c,413 :: 		if(i < 3 && (!axis_words || bit_istrue(axis_words,bit(i))))
L_Main_Modal_Group_Actions0191:
;Main.c,411 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R8, 1
SEH	R8, R2
;Main.c,415 :: 		}
; axis_words end address is: 24 (R6)
; temp end address is: 28 (R7)
; i end address is: 32 (R8)
J	L_Main_Modal_Group_Actions0139
NOP	
L_Main_Modal_Group_Actions0140:
;Main.c,417 :: 		Run_Single_Axes(target);
ADDIU	R2, SP, 36
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	Main_Run_Single_Axes+0
NOP	
LH	R25, 12(SP)
;Main.c,421 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,422 :: 		case 16:  //G28.1 store the current machine position
L_Main_Modal_Group_Actions0147:
;Main.c,423 :: 		case 64:  //G30.1
L_Main_Modal_Group_Actions0148:
;Main.c,424 :: 		temp = (action == NON_MODAL_SET_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0382
NOP	
J	L_Main_Modal_Group_Actions0149
NOP	
L_Main_Modal_Group_Actions0382:
; ?FLOC__Main_Modal_Group_Actions0?T300 start address is: 12 (R3)
ORI	R3, R0, 11
; ?FLOC__Main_Modal_Group_Actions0?T300 end address is: 12 (R3)
J	L_Main_Modal_Group_Actions0150
NOP	
L_Main_Modal_Group_Actions0149:
; ?FLOC__Main_Modal_Group_Actions0?T300 start address is: 12 (R3)
ORI	R3, R0, 10
; ?FLOC__Main_Modal_Group_Actions0?T300 end address is: 12 (R3)
L_Main_Modal_Group_Actions0150:
; ?FLOC__Main_Modal_Group_Actions0?T300 start address is: 12 (R3)
; temp start address is: 8 (R2)
SEB	R2, R3
; ?FLOC__Main_Modal_Group_Actions0?T300 end address is: 12 (R3)
;Main.c,425 :: 		if(settings_write_coord_data(temp,gc.position))
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0384
NOP	
J	L_Main_Modal_Group_Actions0151
NOP	
L_Main_Modal_Group_Actions0384:
;Main.c,426 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 12(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions0151:
;Main.c,427 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,428 :: 		case 128:  //G92 offsets, not written to flash so lost on reset
L_Main_Modal_Group_Actions0152:
;Main.c,429 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,430 :: 		if (!axis_words) {
BEQ	R2, R0, L_Main_Modal_Group_Actions0385
NOP	
J	L_Main_Modal_Group_Actions0153
NOP	
L_Main_Modal_Group_Actions0385:
; axis_words end address is: 20 (R5)
;Main.c,431 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,432 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,433 :: 		}
L_Main_Modal_Group_Actions0153:
;Main.c,434 :: 		for (i=0; i<=2; i++) {
; axis_words start address is: 20 (R5)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions0154:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0386
NOP	
J	L_Main_Modal_Group_Actions0155
NOP	
L_Main_Modal_Group_Actions0386:
; axis_words end address is: 20 (R5)
;Main.c,435 :: 		if (bit_istrue(axis_words,bit(i)) )
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0388
NOP	
J	L_Main_Modal_Group_Actions0157
NOP	
L_Main_Modal_Group_Actions0388:
;Main.c,436 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
L_Main_Modal_Group_Actions0157:
;Main.c,434 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,437 :: 		}
; i end address is: 24 (R6)
; axis_words end address is: 20 (R5)
J	L_Main_Modal_Group_Actions0154
NOP	
L_Main_Modal_Group_Actions0155:
;Main.c,438 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,439 :: 		case 256: //G92.1 clear the G92 offsets
L_Main_Modal_Group_Actions0158:
;Main.c,440 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 10560
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,441 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,442 :: 		default:
L_Main_Modal_Group_Actions0159:
;Main.c,443 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,444 :: 		break;
J	L_Main_Modal_Group_Actions0102
NOP	
;Main.c,445 :: 		}
L_Main_Modal_Group_Actions0101:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0390
NOP	
J	L_Main_Modal_Group_Actions0103
NOP	
L_Main_Modal_Group_Actions0390:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0392
NOP	
J	L_Main_Modal_Group_Actions0113
NOP	
L_Main_Modal_Group_Actions0392:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0394
NOP	
J	L_Main_Modal_Group_Actions0134
NOP	
L_Main_Modal_Group_Actions0394:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0396
NOP	
J	L_Main_Modal_Group_Actions0135
NOP	
L_Main_Modal_Group_Actions0396:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0398
NOP	
J	L_Main_Modal_Group_Actions0147
NOP	
L_Main_Modal_Group_Actions0398:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0400
NOP	
J	L_Main_Modal_Group_Actions0148
NOP	
L_Main_Modal_Group_Actions0400:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0402
NOP	
J	L_Main_Modal_Group_Actions0152
NOP	
L_Main_Modal_Group_Actions0402:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0404
NOP	
J	L_Main_Modal_Group_Actions0158
NOP	
L_Main_Modal_Group_Actions0404:
J	L_Main_Modal_Group_Actions0159
NOP	
L_Main_Modal_Group_Actions0102:
;Main.c,446 :: 		return action;
SEH	R2, R25
;Main.c,447 :: 		}
;Main.c,446 :: 		return action;
;Main.c,447 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
Main_Modal_Group_Actions1:
;Main.c,453 :: 		static int Modal_Group_Actions1(int action){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,458 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions1160
NOP	
;Main.c,459 :: 		case 15://Circle interpolation
L_Main_Modal_Group_Actions1162:
;Main.c,460 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
;Main.c,461 :: 		r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
LH	R27, Offset(-1610602108)(GP)
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
;Main.c,462 :: 		break;
J	L_Main_Modal_Group_Actions1161
NOP	
;Main.c,463 :: 		case ALL_AXIS://Homing X axis
L_Main_Modal_Group_Actions1163:
;Main.c,464 :: 		axis_to_home = Home(axis_to_home);
SH	R25, 12(SP)
LH	R25, Offset(Main_axis_to_home+0)(GP)
JAL	_Home+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
;Main.c,465 :: 		LED2 = TMR.clock >> 3;
LBU	R3, Offset(_TMR+0)(GP)
SRL	R4, R3, 3
_LX	
INS	R3, R4, BitPos(LED2+0), 1
_SX	
;Main.c,470 :: 		if(axis_to_home < 3){
SEH	R2, R2
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions1406
NOP	
J	L_Main_Modal_Group_Actions1164
NOP	
L_Main_Modal_Group_Actions1406:
;Main.c,473 :: 		if (sys.abort) {
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1408
NOP	
J	L_Main_Modal_Group_Actions1165
NOP	
L_Main_Modal_Group_Actions1408:
;Main.c,474 :: 		action =(ALARM_ABORT_CYCLE);
ORI	R25, R0, 65534
;Main.c,475 :: 		}
L_Main_Modal_Group_Actions1165:
;Main.c,476 :: 		}else{
J	L_Main_Modal_Group_Actions1166
NOP	
L_Main_Modal_Group_Actions1164:
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
L_Main_Modal_Group_Actions1167:
; l start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions1409
NOP	
J	L_Main_Modal_Group_Actions1168
NOP	
L_Main_Modal_Group_Actions1409:
;Main.c,485 :: 		STPS[l].steps_abs_position = 0;
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Main.c,486 :: 		sys.position[l] = STPS[l].steps_abs_position;
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
;Main.c,489 :: 		if(STPS[l].run_state != STOP)
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
BNE	R2, R0, L_Main_Modal_Group_Actions1411
NOP	
J	L_Main_Modal_Group_Actions1170
NOP	
L_Main_Modal_Group_Actions1411:
;Main.c,490 :: 		STPS[l].run_state = STOP;
SEH	R3, R5
ORI	R2, R0, 76
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_Main_Modal_Group_Actions1170:
;Main.c,482 :: 		for(l=0;l<NoOfAxis;l++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,491 :: 		}
; l end address is: 20 (R5)
J	L_Main_Modal_Group_Actions1167
NOP	
L_Main_Modal_Group_Actions1168:
;Main.c,494 :: 		sys_sync_current_position();
SH	R25, 12(SP)
JAL	_sys_sync_current_position+0
NOP	
LH	R25, 12(SP)
;Main.c,497 :: 		while(axis_to_home)
L_Main_Modal_Group_Actions1171:
LH	R2, Offset(Main_axis_to_home+0)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions1413
NOP	
J	L_Main_Modal_Group_Actions1172
NOP	
L_Main_Modal_Group_Actions1413:
;Main.c,498 :: 		axis_to_home = Rst_Axisword();
SH	R25, 12(SP)
JAL	_Rst_Axisword+0
NOP	
LH	R25, 12(SP)
SH	R2, Offset(Main_axis_to_home+0)(GP)
J	L_Main_Modal_Group_Actions1171
NOP	
L_Main_Modal_Group_Actions1172:
;Main.c,501 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
;Main.c,502 :: 		SV.mode_complete = 0;
SB	R0, Offset(_SV+1)(GP)
;Main.c,503 :: 		report_status_message(STATUS_OK);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_report_status_message+0
NOP	
LH	R25, 12(SP)
;Main.c,504 :: 		}
L_Main_Modal_Group_Actions1166:
;Main.c,505 :: 		break;
J	L_Main_Modal_Group_Actions1161
NOP	
;Main.c,506 :: 		default: return action = 0;
L_Main_Modal_Group_Actions1173:
MOVZ	R25, R0, R0
MOVZ	R2, R0, R0
J	L_end_Modal_Group_Actions1
NOP	
;Main.c,508 :: 		}
L_Main_Modal_Group_Actions1160:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L_Main_Modal_Group_Actions1415
NOP	
J	L_Main_Modal_Group_Actions1162
NOP	
L_Main_Modal_Group_Actions1415:
SEH	R3, R25
ORI	R2, R0, 31
BNE	R3, R2, L_Main_Modal_Group_Actions1417
NOP	
J	L_Main_Modal_Group_Actions1163
NOP	
L_Main_Modal_Group_Actions1417:
J	L_Main_Modal_Group_Actions1173
NOP	
L_Main_Modal_Group_Actions1161:
;Main.c,510 :: 		return action;
SEH	R2, R25
;Main.c,511 :: 		}
;Main.c,510 :: 		return action;
;Main.c,511 :: 		}
L_end_Modal_Group_Actions1:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Modal_Group_Actions1
