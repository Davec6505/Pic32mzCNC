_Conditin_Externs:
;Main.c,58 :: 		void Conditin_Externs(){
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
L_end_Conditin_Externs:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Conditin_Externs
_main:
;Main.c,73 :: 		void main() {
;Main.c,74 :: 		int error = 0;
;Main.c,75 :: 		int has_flash = 0;
;Main.c,76 :: 		int modal_group = 0;
;Main.c,77 :: 		int modal_action = 0;
;Main.c,80 :: 		char output[100] = "Hello!";
;Main.c,82 :: 		Conditin_Externs();
JAL	_Conditin_Externs+0
NOP	
;Main.c,84 :: 		cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,87 :: 		Timer8_Start();
JAL	_Timer8_Start+0
NOP	
;Main.c,89 :: 		while(1){
L_main0:
;Main.c,94 :: 		Ethernet_Transport_Poll();
JAL	_Ethernet_Transport_Poll+0
NOP	
;Main.c,98 :: 		if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
LH	R3, Offset(Main_status_of_gcode+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__main185
NOP	
J	L_main2
NOP	
L__main185:
;Main.c,99 :: 		report_status_message(Execute_Gcode_Line());
JAL	Main_Execute_Gcode_Line+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,100 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Main.c,101 :: 		status_of_gcode = STATUS_OK;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,102 :: 		}
L_main2:
;Main.c,133 :: 		Ethernet_Transport_Poll();
JAL	_Ethernet_Transport_Poll+0
NOP	
;Main.c,136 :: 		protocol_system_check();
JAL	_protocol_system_check+0
NOP	
;Main.c,139 :: 		protocol_execute_runtime();
JAL	_protocol_execute_runtime+0
NOP	
;Main.c,143 :: 		if(sys.state != STATE_CYCLE && sys.state != STATE_HOMING && sys.state != STATE_HOLD)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main187
NOP	
J	L__main175
NOP	
L__main187:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main189
NOP	
J	L__main174
NOP	
L__main189:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__main191
NOP	
J	L__main173
NOP	
L__main191:
L__main172:
;Main.c,144 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, Offset(Main_status_of_gcode+0)(GP)
;Main.c,143 :: 		if(sys.state != STATE_CYCLE && sys.state != STATE_HOMING && sys.state != STATE_HOLD)
L__main175:
L__main174:
L__main173:
;Main.c,149 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,154 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main192
NOP	
J	L_main6
NOP	
L__main192:
;Main.c,155 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main6:
;Main.c,159 :: 		WDT_CLEAR();
ORI	R2, R0, 67
SB	R2, Offset(-1082128382)(GP)
;Main.c,160 :: 		}
J	L_main0
NOP	
;Main.c,161 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Host_ServiceNow:
;Main.c,167 :: 		void Host_ServiceNow(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,169 :: 		if(Serial_TakeStatusRequest()) report_realtime_status();
SW	R25, 4(SP)
JAL	_Serial_TakeStatusRequest+0
NOP	
BNE	R2, R0, L__Host_ServiceNow196
NOP	
J	L_Host_ServiceNow7
NOP	
L__Host_ServiceNow196:
JAL	_report_realtime_status+0
NOP	
L_Host_ServiceNow7:
;Main.c,170 :: 		if(Serial_PeekRealtime() & (EXEC_RESET | EXEC_FEED_HOLD)) return;
JAL	_Serial_PeekRealtime+0
NOP	
ANDI	R2, R2, 24
BNE	R2, R0, L__Host_ServiceNow198
NOP	
J	L_Host_ServiceNow8
NOP	
L__Host_ServiceNow198:
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow8:
;Main.c,171 :: 		for(n = 0; n < 16; n++){
SH	R0, 8(SP)
L_Host_ServiceNow9:
LH	R2, 8(SP)
SLTI	R2, R2, 16
BNE	R2, R0, L__Host_ServiceNow199
NOP	
J	L_Host_ServiceNow10
NOP	
L__Host_ServiceNow199:
;Main.c,172 :: 		if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
LH	R3, Offset(Main_status_of_gcode+0)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L__Host_ServiceNow200
NOP	
J	L_Host_ServiceNow12
NOP	
L__Host_ServiceNow200:
;Main.c,173 :: 		report_status_message(Execute_Gcode_Line());
JAL	Main_Execute_Gcode_Line+0
NOP	
SEH	R25, R2
JAL	_report_status_message+0
NOP	
;Main.c,174 :: 		G_Begin_Block();
JAL	_G_Begin_Block+0
NOP	
;Main.c,175 :: 		status_of_gcode = STATUS_OK;
SH	R0, Offset(Main_status_of_gcode+0)(GP)
;Main.c,176 :: 		}
L_Host_ServiceNow12:
;Main.c,177 :: 		if(sys.abort || Get_Difference() == 0) return;
LH	R2, Offset(-1610599168)(GP)
BEQ	R2, R0, L__Host_ServiceNow201
NOP	
J	L__Host_ServiceNow179
NOP	
L__Host_ServiceNow201:
JAL	_Get_Difference+0
NOP	
SEH	R2, R2
BNE	R2, R0, L__Host_ServiceNow203
NOP	
J	L__Host_ServiceNow178
NOP	
L__Host_ServiceNow203:
J	L_Host_ServiceNow15
NOP	
L__Host_ServiceNow179:
L__Host_ServiceNow178:
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow15:
;Main.c,178 :: 		if(sys.state == STATE_CYCLE || sys.state == STATE_HOMING || sys.state == STATE_HOLD)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Host_ServiceNow205
NOP	
J	L__Host_ServiceNow182
NOP	
L__Host_ServiceNow205:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__Host_ServiceNow207
NOP	
J	L__Host_ServiceNow181
NOP	
L__Host_ServiceNow207:
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Host_ServiceNow209
NOP	
J	L__Host_ServiceNow180
NOP	
L__Host_ServiceNow209:
J	L_Host_ServiceNow18
NOP	
L__Host_ServiceNow182:
L__Host_ServiceNow181:
L__Host_ServiceNow180:
;Main.c,179 :: 		return;
J	L_end_Host_ServiceNow
NOP	
L_Host_ServiceNow18:
;Main.c,180 :: 		status_of_gcode = Sample_Gocde_Line();
JAL	_Sample_Gocde_Line+0
NOP	
SH	R2, Offset(Main_status_of_gcode+0)(GP)
;Main.c,171 :: 		for(n = 0; n < 16; n++){
LH	R2, 8(SP)
ADDIU	R2, R2, 1
SH	R2, 8(SP)
;Main.c,181 :: 		}
J	L_Host_ServiceNow9
NOP	
L_Host_ServiceNow10:
;Main.c,182 :: 		}
L_end_Host_ServiceNow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Host_ServiceNow
Main_Execute_Gcode_Line:
;Main.c,189 :: 		static int Execute_Gcode_Line(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Main.c,190 :: 		int axes = Get_Axisword();
SW	R25, 4(SP)
JAL	_Get_Axisword+0
NOP	
SH	R2, 8(SP)
;Main.c,191 :: 		int nm   = Get_non_modalword();
JAL	_Get_non_modalword+0
NOP	
SH	R2, 10(SP)
;Main.c,192 :: 		SET_FAIL(STATUS_OK);
MOVZ	R25, R0, R0
JAL	_SET_FAIL+0
NOP	
;Main.c,193 :: 		if(nm){
LH	R2, 10(SP)
BNE	R2, R0, L_Main_Execute_Gcode_Line212
NOP	
J	L_Main_Execute_Gcode_Line19
NOP	
L_Main_Execute_Gcode_Line212:
;Main.c,194 :: 		Modal_Group_Actions0(nm);
LH	R25, 10(SP)
JAL	Main_Modal_Group_Actions0+0
NOP	
;Main.c,196 :: 		if(nm & ~bit(NON_MODAL_DWELL)) axes = 0;
LH	R3, 10(SP)
ORI	R2, R0, 65533
AND	R2, R3, R2
BNE	R2, R0, L_Main_Execute_Gcode_Line214
NOP	
J	L_Main_Execute_Gcode_Line20
NOP	
L_Main_Execute_Gcode_Line214:
SH	R0, 8(SP)
L_Main_Execute_Gcode_Line20:
;Main.c,197 :: 		}
L_Main_Execute_Gcode_Line19:
;Main.c,198 :: 		if(GET_FAIL() == STATUS_OK && axes)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line215
NOP	
J	L_Main_Execute_Gcode_Line167
NOP	
L_Main_Execute_Gcode_Line215:
LH	R2, 8(SP)
BNE	R2, R0, L_Main_Execute_Gcode_Line217
NOP	
J	L_Main_Execute_Gcode_Line166
NOP	
L_Main_Execute_Gcode_Line217:
L_Main_Execute_Gcode_Line165:
;Main.c,199 :: 		Motion_Line(axes);
LH	R25, 8(SP)
JAL	Main_Motion_Line+0
NOP	
;Main.c,198 :: 		if(GET_FAIL() == STATUS_OK && axes)
L_Main_Execute_Gcode_Line167:
L_Main_Execute_Gcode_Line166:
;Main.c,200 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_COMPLETED)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line218
NOP	
J	L_Main_Execute_Gcode_Line169
NOP	
L_Main_Execute_Gcode_Line218:
LBU	R3, Offset(-1610602231)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L_Main_Execute_Gcode_Line219
NOP	
J	L_Main_Execute_Gcode_Line168
NOP	
L_Main_Execute_Gcode_Line219:
L_Main_Execute_Gcode_Line164:
;Main.c,201 :: 		G_Program_End();
JAL	_G_Program_End+0
NOP	
;Main.c,200 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_COMPLETED)
L_Main_Execute_Gcode_Line169:
L_Main_Execute_Gcode_Line168:
;Main.c,204 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_PAUSED)
JAL	_GET_FAIL+0
NOP	
SEH	R2, R2
BEQ	R2, R0, L_Main_Execute_Gcode_Line220
NOP	
J	L_Main_Execute_Gcode_Line171
NOP	
L_Main_Execute_Gcode_Line220:
LBU	R3, Offset(-1610602231)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L_Main_Execute_Gcode_Line221
NOP	
J	L_Main_Execute_Gcode_Line170
NOP	
L_Main_Execute_Gcode_Line221:
L_Main_Execute_Gcode_Line163:
;Main.c,205 :: 		sys.state = STATE_HOLD;
ORI	R2, R0, 4
SH	R2, Offset(-1610599166)(GP)
;Main.c,204 :: 		if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_PAUSED)
L_Main_Execute_Gcode_Line171:
L_Main_Execute_Gcode_Line170:
;Main.c,206 :: 		return GET_FAIL();
JAL	_GET_FAIL+0
NOP	
;Main.c,207 :: 		}
;Main.c,206 :: 		return GET_FAIL();
;Main.c,207 :: 		}
L_end_Execute_Gcode_Line:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Main_Execute_Gcode_Line
Main_Compute_Target:
;Main.c,213 :: 		static void Compute_Target(int axes,float *target){
;Main.c,215 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Compute_Target30:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Compute_Target223
NOP	
J	L_Main_Compute_Target31
NOP	
L_Main_Compute_Target223:
;Main.c,216 :: 		if(bit_istrue(axes,bit(i))){
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R25, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Compute_Target225
NOP	
J	L_Main_Compute_Target33
NOP	
L_Main_Compute_Target225:
;Main.c,217 :: 		if(gc.absolute_override)
LBU	R2, Offset(-1610602236)(GP)
BNE	R2, R0, L_Main_Compute_Target227
NOP	
J	L_Main_Compute_Target34
NOP	
L_Main_Compute_Target227:
;Main.c,218 :: 		target[i] = gc.next_position[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
J	L_Main_Compute_Target35
NOP	
L_Main_Compute_Target34:
;Main.c,219 :: 		else if(gc.absolute_mode)
LBU	R2, Offset(-1610602235)(GP)
BNE	R2, R0, L_Main_Compute_Target229
NOP	
J	L_Main_Compute_Target36
NOP	
L_Main_Compute_Target229:
;Main.c,220 :: 		target[i] = gc.next_position[i] + gc.coord_system[i] + gc.coord_offset[i];
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
J	L_Main_Compute_Target37
NOP	
L_Main_Compute_Target36:
;Main.c,222 :: 		target[i] = gc.position[i] + gc.next_position[i];
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
L_Main_Compute_Target37:
L_Main_Compute_Target35:
;Main.c,223 :: 		}else{
J	L_Main_Compute_Target38
NOP	
L_Main_Compute_Target33:
;Main.c,224 :: 		target[i] = gc.position[i];
SEH	R2, R5
SLL	R4, R2, 2
ADDU	R3, R26, R4
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,225 :: 		}
L_Main_Compute_Target38:
;Main.c,215 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,226 :: 		}
; i end address is: 20 (R5)
J	L_Main_Compute_Target30
NOP	
L_Main_Compute_Target31:
;Main.c,227 :: 		}
L_end_Compute_Target:
JR	RA
NOP	
; end of Main_Compute_Target
Main_Motion_Line:
;Main.c,230 :: 		static void Motion_Line(int axes){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Main.c,232 :: 		int mode = Get_motionmode();
SW	R25, 4(SP)
SW	R26, 8(SP)
SH	R25, 12(SP)
JAL	_Get_motionmode+0
NOP	
LH	R25, 12(SP)
; mode start address is: 16 (R4)
SEH	R4, R2
;Main.c,233 :: 		if(mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR &&
SEH	R2, R2
BNE	R2, R0, L_Main_Motion_Line232
NOP	
J	L_Main_Motion_Line154
NOP	
L_Main_Motion_Line232:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Motion_Line234
NOP	
J	L_Main_Motion_Line153
NOP	
L_Main_Motion_Line234:
;Main.c,234 :: 		mode != MOTION_MODE_CW_ARC && mode != MOTION_MODE_CCW_ARC){
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Motion_Line236
NOP	
J	L_Main_Motion_Line152
NOP	
L_Main_Motion_Line236:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Motion_Line238
NOP	
J	L_Main_Motion_Line151
NOP	
L_Main_Motion_Line238:
; mode end address is: 16 (R4)
L_Main_Motion_Line150:
;Main.c,235 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;Main.c,236 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,233 :: 		if(mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR &&
L_Main_Motion_Line154:
; mode start address is: 16 (R4)
L_Main_Motion_Line153:
;Main.c,234 :: 		mode != MOTION_MODE_CW_ARC && mode != MOTION_MODE_CCW_ARC){
L_Main_Motion_Line152:
L_Main_Motion_Line151:
;Main.c,238 :: 		if(gc.absolute_override && mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR){
LBU	R2, Offset(-1610602236)(GP)
BNE	R2, R0, L_Main_Motion_Line240
NOP	
J	L_Main_Motion_Line157
NOP	
L_Main_Motion_Line240:
SEH	R2, R4
BNE	R2, R0, L_Main_Motion_Line242
NOP	
J	L_Main_Motion_Line156
NOP	
L_Main_Motion_Line242:
SEH	R3, R4
ORI	R2, R0, 1
BNE	R3, R2, L_Main_Motion_Line244
NOP	
J	L_Main_Motion_Line155
NOP	
L_Main_Motion_Line244:
; mode end address is: 16 (R4)
L_Main_Motion_Line149:
;Main.c,239 :: 		FAIL(STATUS_INVALID_STATEMENT);
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
;Main.c,240 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,238 :: 		if(gc.absolute_override && mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR){
L_Main_Motion_Line157:
; mode start address is: 16 (R4)
L_Main_Motion_Line156:
L_Main_Motion_Line155:
;Main.c,242 :: 		if(mode != MOTION_MODE_SEEK && gc.feed_rate <= 0.0){
SEH	R2, R4
BNE	R2, R0, L_Main_Motion_Line246
NOP	
J	L_Main_Motion_Line159
NOP	
L_Main_Motion_Line246:
LWC1	S1, Offset(-1610602216)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L_Main_Motion_Line247
NOP	
J	L_Main_Motion_Line158
NOP	
L_Main_Motion_Line247:
; mode end address is: 16 (R4)
L_Main_Motion_Line148:
;Main.c,243 :: 		FAIL(STATUS_UNDEFINED_FEED_RATE);
ORI	R25, R0, 17
JAL	_FAIL+0
NOP	
;Main.c,244 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,242 :: 		if(mode != MOTION_MODE_SEEK && gc.feed_rate <= 0.0){
L_Main_Motion_Line159:
; mode start address is: 16 (R4)
L_Main_Motion_Line158:
;Main.c,247 :: 		if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) && axis_xyz != AXIS_XY){
SEH	R3, R4
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Motion_Line249
NOP	
J	L_Main_Motion_Line161
NOP	
L_Main_Motion_Line249:
SEH	R3, R4
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Motion_Line251
NOP	
J	L_Main_Motion_Line160
NOP	
L_Main_Motion_Line251:
J	L_Main_Motion_Line52
NOP	
L_Main_Motion_Line161:
L_Main_Motion_Line160:
LBU	R2, Offset(_axis_xyz+0)(GP)
BNE	R2, R0, L_Main_Motion_Line253
NOP	
J	L_Main_Motion_Line162
NOP	
L_Main_Motion_Line253:
; mode end address is: 16 (R4)
L_Main_Motion_Line146:
;Main.c,248 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
;Main.c,249 :: 		return;
J	L_end_Motion_Line
NOP	
;Main.c,250 :: 		}
L_Main_Motion_Line52:
;Main.c,247 :: 		if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) && axis_xyz != AXIS_XY){
; mode start address is: 16 (R4)
L_Main_Motion_Line162:
;Main.c,251 :: 		Compute_Target(axes,target);
ADDIU	R2, SP, 16
SH	R4, 12(SP)
MOVZ	R26, R2, R0
JAL	Main_Compute_Target+0
NOP	
LH	R4, 12(SP)
;Main.c,252 :: 		Run_Move(target,mode);
ADDIU	R2, SP, 16
SEH	R26, R4
; mode end address is: 16 (R4)
MOVZ	R25, R2, R0
JAL	Main_Run_Move+0
NOP	
;Main.c,253 :: 		}
L_end_Motion_Line:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of Main_Motion_Line
Main_Run_Move:
;Main.c,257 :: 		static void Run_Move(float *target,int mode){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,258 :: 		int i, axes = 0;
; axes start address is: 16 (R4)
MOVZ	R4, R0, R0
;Main.c,259 :: 		int arc = (mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC);
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Run_Move256
NOP	
J	L_Main_Run_Move54
NOP	
L_Main_Run_Move256:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L_Main_Run_Move258
NOP	
J	L_Main_Run_Move54
NOP	
L_Main_Run_Move258:
MOVZ	R2, R0, R0
J	L_Main_Run_Move53
NOP	
L_Main_Run_Move54:
ORI	R2, R0, 1
L_Main_Run_Move53:
; arc start address is: 8 (R2)
ANDI	R2, R2, 255
;Main.c,260 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; axes end address is: 16 (R4)
; arc end address is: 8 (R2)
; i end address is: 20 (R5)
SEH	R6, R4
SEH	R4, R2
L_Main_Run_Move55:
; i start address is: 20 (R5)
; arc start address is: 16 (R4)
; axes start address is: 24 (R6)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move259
NOP	
J	L_Main_Run_Move56
NOP	
L_Main_Run_Move259:
;Main.c,261 :: 		if(target[i] != gc.position[i]) bit_true(axes,bit(i));
SEH	R2, R5
SLL	R3, R2, 2
ADDU	R2, R25, R3
LWC1	S1, 0(R2)
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
C.EQ.S 	0, S1, S0
BC1F	0, L_Main_Run_Move260
NOP	
J	L_Main_Run_Move131
NOP	
L_Main_Run_Move260:
SEH	R3, R5
ORI	R2, R0, 1
SLLV	R2, R2, R3
OR	R2, R6, R2
SEH	R6, R2
; axes end address is: 24 (R6)
J	L_Main_Run_Move58
NOP	
L_Main_Run_Move131:
L_Main_Run_Move58:
;Main.c,260 :: 		for(i=0;i<NoOfAxis;i++){
; axes start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,262 :: 		}
; i end address is: 20 (R5)
J	L_Main_Run_Move55
NOP	
L_Main_Run_Move56:
;Main.c,263 :: 		if(!axes && !arc) return;
BEQ	R6, R0, L_Main_Run_Move261
NOP	
J	L_Main_Run_Move130
NOP	
L_Main_Run_Move261:
; axes end address is: 24 (R6)
BEQ	R4, R0, L_Main_Run_Move262
NOP	
J	L_Main_Run_Move129
NOP	
L_Main_Run_Move262:
; arc end address is: 16 (R4)
L_Main_Run_Move128:
J	L_end_Run_Move
NOP	
L_Main_Run_Move130:
L_Main_Run_Move129:
;Main.c,265 :: 		sys.state = STATE_CYCLE;
ORI	R2, R0, 3
SH	R2, Offset(-1610599166)(GP)
;Main.c,277 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_Main_Run_Move62:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move263
NOP	
J	L_Main_Run_Move63
NOP	
L_Main_Run_Move263:
;Main.c,278 :: 		STPS[i].steps_abs_position = belt_steps(target[i],i);
SEH	R3, R4
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, 40960
ORI	R2, R2, 12544
ADDU	R2, R2, R3
ADDIU	R2, R2, 80
SW	R2, 12(SP)
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R25, R2
LWC1	S0, 0(R2)
SH	R4, 4(SP)
SH	R26, 6(SP)
SW	R25, 8(SP)
SEH	R25, R4
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
LW	R25, 8(SP)
LH	R26, 6(SP)
LH	R4, 4(SP)
LW	R3, 12(SP)
SW	R2, 0(R3)
;Main.c,277 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,278 :: 		STPS[i].steps_abs_position = belt_steps(target[i],i);
; i end address is: 16 (R4)
J	L_Main_Run_Move62
NOP	
L_Main_Run_Move63:
;Main.c,280 :: 		for(i=0;i<NoOfAxis;i++)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_Main_Run_Move65:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Run_Move264
NOP	
J	L_Main_Run_Move66
NOP	
L_Main_Run_Move264:
;Main.c,281 :: 		gc.position[i] = target[i];
SEH	R2, R5
SLL	R4, R2, 2
LUI	R2, 40960
ORI	R2, R2, 10528
ADDU	R3, R2, R4
ADDU	R2, R25, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Main.c,280 :: 		for(i=0;i<NoOfAxis;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;Main.c,281 :: 		gc.position[i] = target[i];
; i end address is: 20 (R5)
J	L_Main_Run_Move65
NOP	
L_Main_Run_Move66:
;Main.c,283 :: 		Cycle_Complete();
JAL	_Cycle_Complete+0
NOP	
;Main.c,285 :: 		}
L_end_Run_Move:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Main_Run_Move
_Cycle_Complete:
;Main.c,289 :: 		void Cycle_Complete(){
;Main.c,290 :: 		if(sys.state == STATE_CYCLE)
LH	R3, Offset(-1610599166)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Cycle_Complete266
NOP	
J	L_Cycle_Complete68
NOP	
L__Cycle_Complete266:
;Main.c,291 :: 		sys.state = STATE_IDLE;
SH	R0, Offset(-1610599166)(GP)
L_Cycle_Complete68:
;Main.c,292 :: 		}
L_end_Cycle_Complete:
JR	RA
NOP	
; end of _Cycle_Complete
Main_Modal_Group_Actions0:
;Main.c,330 :: 		static int Modal_Group_Actions0(int action){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Main.c,336 :: 		switch(action){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Main_Modal_Group_Actions069
NOP	
;Main.c,337 :: 		case 2:  //G4 dwell, P in seconds as in Grbl 1.1, or S in seconds
L_Main_Modal_Group_Actions071:
;Main.c,338 :: 		if(gc.S > 0)
LH	R2, Offset(-1610602114)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0268
NOP	
J	L_Main_Modal_Group_Actions072
NOP	
L_Main_Modal_Group_Actions0268:
;Main.c,339 :: 		dly_time = (unsigned long)gc.S * 1000;
LH	R3, Offset(-1610602114)(GP)
ORI	R2, R0, 1000
MULTU	R3, R2
MFLO	R2
; dly_time start address is: 8 (R2)
MOVZ	R4, R2, R0
; dly_time end address is: 8 (R2)
J	L_Main_Modal_Group_Actions073
NOP	
L_Main_Modal_Group_Actions072:
;Main.c,340 :: 		else if(gc.dwell >= 0.0)
LWC1	S1, Offset(-1610602112)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L_Main_Modal_Group_Actions0269
NOP	
J	L_Main_Modal_Group_Actions074
NOP	
L_Main_Modal_Group_Actions0269:
;Main.c,341 :: 		dly_time = (unsigned long)(gc.dwell * 1000.0 + 0.5);
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
J	L_Main_Modal_Group_Actions075
NOP	
; dly_time end address is: 8 (R2)
L_Main_Modal_Group_Actions074:
;Main.c,343 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,344 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,345 :: 		}
L_Main_Modal_Group_Actions075:
; dly_time start address is: 8 (R2)
MOVZ	R4, R2, R0
L_Main_Modal_Group_Actions073:
; dly_time end address is: 8 (R2)
;Main.c,346 :: 		while(dly_time > 0){
; dly_time start address is: 16 (R4)
; dly_time end address is: 16 (R4)
L_Main_Modal_Group_Actions076:
; dly_time start address is: 16 (R4)
SLTIU	R2, R4, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0270
NOP	
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions0270:
;Main.c,347 :: 		LED2 = TMR.clock >> 1;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Main.c,348 :: 		Delay_ms(1);
LUI	R24, 1
ORI	R24, R24, 1130
L_Main_Modal_Group_Actions078:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Main_Modal_Group_Actions078
NOP	
;Main.c,349 :: 		protocol_execute_runtime();
SW	R4, 12(SP)
SH	R25, 16(SP)
JAL	_protocol_execute_runtime+0
NOP	
LH	R25, 16(SP)
LW	R4, 12(SP)
;Main.c,350 :: 		if(sys.abort) break;
LH	R2, Offset(-1610599168)(GP)
BNE	R2, R0, L_Main_Modal_Group_Actions0272
NOP	
J	L_Main_Modal_Group_Actions080
NOP	
L_Main_Modal_Group_Actions0272:
; dly_time end address is: 16 (R4)
J	L_Main_Modal_Group_Actions077
NOP	
L_Main_Modal_Group_Actions080:
;Main.c,351 :: 		WDT_CLEAR();
; dly_time start address is: 16 (R4)
ORI	R2, R0, 67
SB	R2, Offset(-1082128382)(GP)
;Main.c,352 :: 		dly_time--;
ADDIU	R2, R4, -1
MOVZ	R4, R2, R0
;Main.c,353 :: 		}
; dly_time end address is: 16 (R4)
J	L_Main_Modal_Group_Actions076
NOP	
L_Main_Modal_Group_Actions077:
;Main.c,354 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Main.c,355 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,356 :: 		case 4:  //G10 L2 / L20 Pn, P0 = active system, P1..P6 = G54..G59
L_Main_Modal_Group_Actions081:
;Main.c,358 :: 		if(gc.L != 2 && gc.L != 20){
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0274
NOP	
J	L_Main_Modal_Group_Actions0138
NOP	
L_Main_Modal_Group_Actions0274:
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BNE	R3, R2, L_Main_Modal_Group_Actions0276
NOP	
J	L_Main_Modal_Group_Actions0137
NOP	
L_Main_Modal_Group_Actions0276:
L_Main_Modal_Group_Actions0136:
;Main.c,359 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,360 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,358 :: 		if(gc.L != 2 && gc.L != 20){
L_Main_Modal_Group_Actions0138:
L_Main_Modal_Group_Actions0137:
;Main.c,362 :: 		temp = (gc.P == 0) ? gc.coord_select : gc.P;
LH	R2, Offset(-1610602116)(GP)
BEQ	R2, R0, L_Main_Modal_Group_Actions0277
NOP	
J	L_Main_Modal_Group_Actions085
NOP	
L_Main_Modal_Group_Actions0277:
; ?FLOC__Main_Modal_Group_Actions0?T148 start address is: 16 (R4)
LH	R4, Offset(-1610602226)(GP)
; ?FLOC__Main_Modal_Group_Actions0?T148 end address is: 16 (R4)
J	L_Main_Modal_Group_Actions086
NOP	
L_Main_Modal_Group_Actions085:
; ?FLOC__Main_Modal_Group_Actions0?T148 start address is: 16 (R4)
LH	R4, Offset(-1610602116)(GP)
; ?FLOC__Main_Modal_Group_Actions0?T148 end address is: 16 (R4)
L_Main_Modal_Group_Actions086:
; ?FLOC__Main_Modal_Group_Actions0?T148 start address is: 16 (R4)
; temp start address is: 12 (R3)
SEH	R3, R4
;Main.c,363 :: 		if(temp < 1 || temp > 6){
SEH	R2, R4
; ?FLOC__Main_Modal_Group_Actions0?T148 end address is: 16 (R4)
SLTI	R2, R2, 1
BEQ	R2, R0, L_Main_Modal_Group_Actions0278
NOP	
J	L_Main_Modal_Group_Actions0140
NOP	
L_Main_Modal_Group_Actions0278:
SEH	R2, R3
SLTI	R2, R2, 7
BNE	R2, R0, L_Main_Modal_Group_Actions0279
NOP	
J	L_Main_Modal_Group_Actions0139
NOP	
L_Main_Modal_Group_Actions0279:
J	L_Main_Modal_Group_Actions089
NOP	
; temp end address is: 12 (R3)
L_Main_Modal_Group_Actions0140:
L_Main_Modal_Group_Actions0139:
;Main.c,364 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,365 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,366 :: 		}
L_Main_Modal_Group_Actions089:
;Main.c,367 :: 		axis_words = Get_Axisword();
; temp start address is: 12 (R3)
SH	R3, 12(SP)
SH	R25, 14(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
; axis_words start address is: 8 (R2)
;Main.c,368 :: 		settings_read_coord_data();
SH	R2, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
JAL	_settings_read_coord_data+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R2, 12(SP)
;Main.c,369 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 28 (R7)
MOVZ	R7, R0, R0
; temp end address is: 12 (R3)
; axis_words end address is: 8 (R2)
; i end address is: 28 (R7)
SEH	R6, R3
SEH	R5, R2
L_Main_Modal_Group_Actions090:
; i start address is: 28 (R7)
; axis_words start address is: 20 (R5)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
; temp start address is: 24 (R6)
SEH	R2, R7
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0280
NOP	
J	L_Main_Modal_Group_Actions091
NOP	
L_Main_Modal_Group_Actions0280:
; axis_words end address is: 20 (R5)
;Main.c,370 :: 		coord_data[i] = (i < 3) ? coord_system[temp-1].coord[i] : 0.0;
; axis_words start address is: 20 (R5)
ADDIU	R3, SP, 20
SEH	R2, R7
SLL	R2, R2, 2
ADDU	R4, R3, R2
SEH	R2, R7
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0281
NOP	
J	L_Main_Modal_Group_Actions093
NOP	
L_Main_Modal_Group_Actions0281:
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
; ?FLOC__Main_Modal_Group_Actions0?T168 start address is: 0 (R0)
; ?FLOC__Main_Modal_Group_Actions0?T168 end address is: 0 (R0)
J	L_Main_Modal_Group_Actions094
NOP	
L_Main_Modal_Group_Actions093:
MOVZ	R2, R0, R0
; ?FLOC__Main_Modal_Group_Actions0?T168 start address is: 0 (R0)
MTC1	R2, S0
; ?FLOC__Main_Modal_Group_Actions0?T168 end address is: 0 (R0)
L_Main_Modal_Group_Actions094:
; ?FLOC__Main_Modal_Group_Actions0?T168 start address is: 0 (R0)
SWC1	S0, 0(R4)
; ?FLOC__Main_Modal_Group_Actions0?T168 end address is: 0 (R0)
;Main.c,371 :: 		if(i < 3 && bit_istrue(axis_words,bit(i))){
SEH	R2, R7
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0282
NOP	
J	L_Main_Modal_Group_Actions0142
NOP	
L_Main_Modal_Group_Actions0282:
SEH	R3, R7
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0284
NOP	
J	L_Main_Modal_Group_Actions0141
NOP	
L_Main_Modal_Group_Actions0284:
L_Main_Modal_Group_Actions0134:
;Main.c,373 :: 		if(gc.L == 20)
LH	R3, Offset(-1610602224)(GP)
ORI	R2, R0, 20
BEQ	R3, R2, L_Main_Modal_Group_Actions0285
NOP	
J	L_Main_Modal_Group_Actions098
NOP	
L_Main_Modal_Group_Actions0285:
;Main.c,374 :: 		coord_data[i] = gc.position[i] - gc.coord_offset[i] - gc.next_position[i];
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
J	L_Main_Modal_Group_Actions099
NOP	
L_Main_Modal_Group_Actions098:
;Main.c,376 :: 		coord_data[i] = gc.next_position[i];
ADDIU	R3, SP, 20
SEH	R2, R7
SLL	R4, R2, 2
ADDU	R3, R3, R4
LUI	R2, 40960
ORI	R2, R2, 10576
ADDU	R2, R2, R4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
L_Main_Modal_Group_Actions099:
;Main.c,371 :: 		if(i < 3 && bit_istrue(axis_words,bit(i))){
L_Main_Modal_Group_Actions0142:
L_Main_Modal_Group_Actions0141:
;Main.c,369 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R7, 1
SEH	R7, R2
;Main.c,378 :: 		}
; axis_words end address is: 20 (R5)
; i end address is: 28 (R7)
J	L_Main_Modal_Group_Actions090
NOP	
L_Main_Modal_Group_Actions091:
;Main.c,379 :: 		if(settings_write_coord_data(temp,coord_data)){
ADDIU	R2, SP, 20
SH	R6, 12(SP)
SH	R25, 14(SP)
MOVZ	R26, R2, R0
SEH	R25, R6
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 14(SP)
LH	R6, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0287
NOP	
J	L_Main_Modal_Group_Actions0100
NOP	
L_Main_Modal_Group_Actions0287:
; temp end address is: 24 (R6)
;Main.c,380 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 12(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,381 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,382 :: 		}
L_Main_Modal_Group_Actions0100:
;Main.c,383 :: 		if(temp == gc.coord_select)
; temp start address is: 24 (R6)
SEH	R3, R6
; temp end address is: 24 (R6)
LH	R2, Offset(-1610602226)(GP)
BEQ	R3, R2, L_Main_Modal_Group_Actions0288
NOP	
J	L_Main_Modal_Group_Actions0101
NOP	
L_Main_Modal_Group_Actions0288:
;Main.c,384 :: 		memcpy(gc.coord_system,coord_data,sizeof(coord_data));
ADDIU	R2, SP, 20
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 10544
JAL	_memcpy+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions0101:
;Main.c,385 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,386 :: 		case  8:  //G28 go to the stored G28 position
L_Main_Modal_Group_Actions0102:
;Main.c,387 :: 		case 32:  //G30 go to the stored G30 position
L_Main_Modal_Group_Actions0103:
;Main.c,389 :: 		temp = (action == NON_MODAL_GO_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
SEH	R3, R25
ORI	R2, R0, 32
BEQ	R3, R2, L_Main_Modal_Group_Actions0289
NOP	
J	L_Main_Modal_Group_Actions0104
NOP	
L_Main_Modal_Group_Actions0289:
; ?FLOC__Main_Modal_Group_Actions0?T204 start address is: 8 (R2)
ORI	R2, R0, 11
; ?FLOC__Main_Modal_Group_Actions0?T204 end address is: 8 (R2)
J	L_Main_Modal_Group_Actions0105
NOP	
L_Main_Modal_Group_Actions0104:
; ?FLOC__Main_Modal_Group_Actions0?T204 start address is: 8 (R2)
ORI	R2, R0, 10
; ?FLOC__Main_Modal_Group_Actions0?T204 end address is: 8 (R2)
L_Main_Modal_Group_Actions0105:
; ?FLOC__Main_Modal_Group_Actions0?T204 start address is: 8 (R2)
; temp start address is: 12 (R3)
SEB	R3, R2
; ?FLOC__Main_Modal_Group_Actions0?T204 end address is: 8 (R2)
;Main.c,390 :: 		axis_words = Get_Axisword();
SH	R3, 12(SP)
SH	R25, 14(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 14(SP)
LH	R3, 12(SP)
; axis_words start address is: 16 (R4)
SEH	R4, R2
;Main.c,391 :: 		if(axis_words){
BNE	R2, R0, L_Main_Modal_Group_Actions0291
NOP	
J	L_Main_Modal_Group_Actions0106
NOP	
L_Main_Modal_Group_Actions0291:
;Main.c,392 :: 		Compute_Target(axis_words,target);
ADDIU	R2, SP, 36
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
MOVZ	R26, R2, R0
SEH	R25, R4
JAL	Main_Compute_Target+0
NOP	
;Main.c,396 :: 		Run_Move(target,MOTION_MODE_SEEK);
ADDIU	R2, SP, 36
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	Main_Run_Move+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
;Main.c,398 :: 		}
L_Main_Modal_Group_Actions0106:
;Main.c,399 :: 		settings_read_coord_data();
SH	R4, 12(SP)
SH	R3, 14(SP)
SH	R25, 16(SP)
JAL	_settings_read_coord_data+0
NOP	
LH	R25, 16(SP)
LH	R3, 14(SP)
LH	R4, 12(SP)
;Main.c,400 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; axis_words end address is: 16 (R4)
; i end address is: 32 (R8)
; temp end address is: 12 (R3)
SEH	R7, R3
SEH	R6, R4
L_Main_Modal_Group_Actions0107:
; i start address is: 32 (R8)
; temp start address is: 28 (R7)
; axis_words start address is: 24 (R6)
; axis_words start address is: 24 (R6)
; axis_words end address is: 24 (R6)
; temp start address is: 28 (R7)
; temp end address is: 28 (R7)
SEH	R2, R8
SLTI	R2, R2, 4
BNE	R2, R0, L_Main_Modal_Group_Actions0292
NOP	
J	L_Main_Modal_Group_Actions0108
NOP	
L_Main_Modal_Group_Actions0292:
; axis_words end address is: 24 (R6)
; temp end address is: 28 (R7)
;Main.c,401 :: 		target[i] = gc.position[i];
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
;Main.c,402 :: 		if(i < 3 && (!axis_words || bit_istrue(axis_words,bit(i))))
SEH	R2, R8
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0293
NOP	
J	L_Main_Modal_Group_Actions0145
NOP	
L_Main_Modal_Group_Actions0293:
BNE	R6, R0, L_Main_Modal_Group_Actions0295
NOP	
J	L_Main_Modal_Group_Actions0144
NOP	
L_Main_Modal_Group_Actions0295:
SEH	R3, R8
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R6, R2
SEH	R2, R2
BEQ	R2, R0, L_Main_Modal_Group_Actions0296
NOP	
J	L_Main_Modal_Group_Actions0143
NOP	
L_Main_Modal_Group_Actions0296:
J	L_Main_Modal_Group_Actions0114
NOP	
L_Main_Modal_Group_Actions0144:
L_Main_Modal_Group_Actions0143:
L_Main_Modal_Group_Actions0132:
;Main.c,403 :: 		target[i] = coord_system[temp-1].coord[i];
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
L_Main_Modal_Group_Actions0114:
;Main.c,402 :: 		if(i < 3 && (!axis_words || bit_istrue(axis_words,bit(i))))
L_Main_Modal_Group_Actions0145:
;Main.c,400 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R8, 1
SEH	R8, R2
;Main.c,404 :: 		}
; axis_words end address is: 24 (R6)
; temp end address is: 28 (R7)
; i end address is: 32 (R8)
J	L_Main_Modal_Group_Actions0107
NOP	
L_Main_Modal_Group_Actions0108:
;Main.c,408 :: 		Run_Move(target,MOTION_MODE_SEEK);
ADDIU	R2, SP, 36
SH	R25, 12(SP)
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	Main_Run_Move+0
NOP	
LH	R25, 12(SP)
;Main.c,410 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,411 :: 		case 16:  //G28.1 store the current machine position
L_Main_Modal_Group_Actions0115:
;Main.c,412 :: 		case 64:  //G30.1
L_Main_Modal_Group_Actions0116:
;Main.c,413 :: 		temp = (action == NON_MODAL_SET_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
SEH	R3, R25
ORI	R2, R0, 64
BEQ	R3, R2, L_Main_Modal_Group_Actions0297
NOP	
J	L_Main_Modal_Group_Actions0117
NOP	
L_Main_Modal_Group_Actions0297:
; ?FLOC__Main_Modal_Group_Actions0?T238 start address is: 12 (R3)
ORI	R3, R0, 11
; ?FLOC__Main_Modal_Group_Actions0?T238 end address is: 12 (R3)
J	L_Main_Modal_Group_Actions0118
NOP	
L_Main_Modal_Group_Actions0117:
; ?FLOC__Main_Modal_Group_Actions0?T238 start address is: 12 (R3)
ORI	R3, R0, 10
; ?FLOC__Main_Modal_Group_Actions0?T238 end address is: 12 (R3)
L_Main_Modal_Group_Actions0118:
; ?FLOC__Main_Modal_Group_Actions0?T238 start address is: 12 (R3)
; temp start address is: 8 (R2)
SEB	R2, R3
; ?FLOC__Main_Modal_Group_Actions0?T238 end address is: 12 (R3)
;Main.c,414 :: 		if(settings_write_coord_data(temp,gc.position))
SH	R25, 12(SP)
LUI	R26, 40960
ORI	R26, R26, 10528
SEH	R25, R2
; temp end address is: 8 (R2)
JAL	_settings_write_coord_data+0
NOP	
LH	R25, 12(SP)
BNE	R2, R0, L_Main_Modal_Group_Actions0299
NOP	
J	L_Main_Modal_Group_Actions0119
NOP	
L_Main_Modal_Group_Actions0299:
;Main.c,415 :: 		FAIL(STATUS_SETTING_READ_FAIL);
SH	R25, 12(SP)
ORI	R25, R0, 10
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
L_Main_Modal_Group_Actions0119:
;Main.c,416 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,417 :: 		case 128:  //G92 offsets, not written to flash so lost on reset
L_Main_Modal_Group_Actions0120:
;Main.c,418 :: 		axis_words = Get_Axisword();
SH	R25, 12(SP)
JAL	_Get_Axisword+0
NOP	
LH	R25, 12(SP)
; axis_words start address is: 20 (R5)
SEH	R5, R2
;Main.c,419 :: 		if (!axis_words) {
BEQ	R2, R0, L_Main_Modal_Group_Actions0300
NOP	
J	L_Main_Modal_Group_Actions0121
NOP	
L_Main_Modal_Group_Actions0300:
; axis_words end address is: 20 (R5)
;Main.c,420 :: 		FAIL(STATUS_INVALID_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 6
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,421 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,422 :: 		}
L_Main_Modal_Group_Actions0121:
;Main.c,423 :: 		for (i=0; i<=2; i++) {
; axis_words start address is: 20 (R5)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_Main_Modal_Group_Actions0122:
; i start address is: 24 (R6)
; axis_words start address is: 20 (R5)
; axis_words end address is: 20 (R5)
SEH	R2, R6
SLTI	R2, R2, 3
BNE	R2, R0, L_Main_Modal_Group_Actions0301
NOP	
J	L_Main_Modal_Group_Actions0123
NOP	
L_Main_Modal_Group_Actions0301:
; axis_words end address is: 20 (R5)
;Main.c,424 :: 		if (bit_istrue(axis_words,bit(i)) )
; axis_words start address is: 20 (R5)
SEH	R3, R6
ORI	R2, R0, 1
SLLV	R2, R2, R3
AND	R2, R5, R2
SEH	R2, R2
BNE	R2, R0, L_Main_Modal_Group_Actions0303
NOP	
J	L_Main_Modal_Group_Actions0125
NOP	
L_Main_Modal_Group_Actions0303:
;Main.c,425 :: 		gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
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
L_Main_Modal_Group_Actions0125:
;Main.c,423 :: 		for (i=0; i<=2; i++) {
ADDIU	R2, R6, 1
SEH	R6, R2
;Main.c,426 :: 		}
; i end address is: 24 (R6)
; axis_words end address is: 20 (R5)
J	L_Main_Modal_Group_Actions0122
NOP	
L_Main_Modal_Group_Actions0123:
;Main.c,427 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,428 :: 		case 256: //G92.1 clear the G92 offsets
L_Main_Modal_Group_Actions0126:
;Main.c,429 :: 		clear_vector(gc.coord_offset);
SH	R25, 12(SP)
ORI	R27, R0, 16
MOVZ	R26, R0, R0
LUI	R25, 40960
ORI	R25, R25, 10560
JAL	_memset+0
NOP	
LH	R25, 12(SP)
;Main.c,430 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,431 :: 		default:
L_Main_Modal_Group_Actions0127:
;Main.c,432 :: 		FAIL(STATUS_UNSUPPORTED_STATEMENT);
SH	R25, 12(SP)
ORI	R25, R0, 3
JAL	_FAIL+0
NOP	
LH	R25, 12(SP)
;Main.c,433 :: 		break;
J	L_Main_Modal_Group_Actions070
NOP	
;Main.c,434 :: 		}
L_Main_Modal_Group_Actions069:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Main_Modal_Group_Actions0305
NOP	
J	L_Main_Modal_Group_Actions071
NOP	
L_Main_Modal_Group_Actions0305:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Main_Modal_Group_Actions0307
NOP	
J	L_Main_Modal_Group_Actions081
NOP	
L_Main_Modal_Group_Actions0307:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L_Main_Modal_Group_Actions0309
NOP	
J	L_Main_Modal_Group_Actions0102
NOP	
L_Main_Modal_Group_Actions0309:
SEH	R3, R25
ORI	R2, R0, 32
BNE	R3, R2, L_Main_Modal_Group_Actions0311
NOP	
J	L_Main_Modal_Group_Actions0103
NOP	
L_Main_Modal_Group_Actions0311:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L_Main_Modal_Group_Actions0313
NOP	
J	L_Main_Modal_Group_Actions0115
NOP	
L_Main_Modal_Group_Actions0313:
SEH	R3, R25
ORI	R2, R0, 64
BNE	R3, R2, L_Main_Modal_Group_Actions0315
NOP	
J	L_Main_Modal_Group_Actions0116
NOP	
L_Main_Modal_Group_Actions0315:
SEH	R3, R25
ORI	R2, R0, 128
BNE	R3, R2, L_Main_Modal_Group_Actions0317
NOP	
J	L_Main_Modal_Group_Actions0120
NOP	
L_Main_Modal_Group_Actions0317:
SEH	R3, R25
ORI	R2, R0, 256
BNE	R3, R2, L_Main_Modal_Group_Actions0319
NOP	
J	L_Main_Modal_Group_Actions0126
NOP	
L_Main_Modal_Group_Actions0319:
J	L_Main_Modal_Group_Actions0127
NOP	
L_Main_Modal_Group_Actions070:
;Main.c,435 :: 		return action;
SEH	R2, R25
;Main.c,436 :: 		}
;Main.c,435 :: 		return action;
;Main.c,436 :: 		}
L_end_Modal_Group_Actions0:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of Main_Modal_Group_Actions0
