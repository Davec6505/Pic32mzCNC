_SetPinMode:
;Stepper.c,20 :: 		void SetPinMode(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,22 :: 		Timer8CallbackInitialize(dds_tick);
SW	R25, 4(SP)
LUI	R25, hi_addr(_dds_tick+0)
ORI	R25, R25, lo_addr(_dds_tick+0)
JAL	_Timer8CallbackInitialize+0
NOP	
;Stepper.c,25 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,26 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,29 :: 		PLS_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirX+0), 1
_SX	
;Stepper.c,33 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,34 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,37 :: 		PLS_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirY+0), 1
_SX	
;Stepper.c,41 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,42 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,45 :: 		PLS_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirZ+0), 1
_SX	
;Stepper.c,49 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,50 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,53 :: 		PLS_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirA+0), 1
_SX	
;Stepper.c,56 :: 		}
L_end_SetPinMode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SetPinMode
_dds_tick:
;Stepper.c,64 :: 		void dds_tick(){
;Stepper.c,66 :: 		dds_axes[0].old_phase = dds_axes[0].phase;
LW	R2, Offset(_dds_axes+0)(GP)
SW	R2, Offset(_dds_axes+8)(GP)
;Stepper.c,67 :: 		dds_axes[0].phase += dds_axes[0].incrament;
LW	R3, Offset(_dds_axes+4)(GP)
LW	R2, Offset(_dds_axes+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_dds_axes+0)(GP)
;Stepper.c,69 :: 		if(dds_axes[0].phase < dds_axes[0].old_phase){
LW	R3, Offset(_dds_axes+8)(GP)
LW	R2, Offset(_dds_axes+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__dds_tick36
NOP	
J	L_dds_tick0
NOP	
L__dds_tick36:
;Stepper.c,70 :: 		LED2 = !LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,71 :: 		}
L_dds_tick0:
;Stepper.c,72 :: 		}
L_end_dds_tick:
JR	RA
NOP	
; end of _dds_tick
_EnStepperX:
;Stepper.c,75 :: 		void EnStepperX(){
;Stepper.c,78 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,79 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,81 :: 		void EnStepperY(){
;Stepper.c,84 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,85 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,86 :: 		void EnStepperZ(){
;Stepper.c,89 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,90 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,91 :: 		void EnStepperA(){
;Stepper.c,94 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,95 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_EnableSteppers:
;Stepper.c,98 :: 		void EnableSteppers(int steppers){
;Stepper.c,100 :: 		for(i=0;i<steppers;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_EnableSteppers1:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R25
SLT	R2, R3, R2
BNE	R2, R0, L__EnableSteppers42
NOP	
J	L_EnableSteppers2
NOP	
L__EnableSteppers42:
;Stepper.c,101 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers43
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers43:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,102 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers44
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers44:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,103 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers45
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers45:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers6:
;Stepper.c,104 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers46
NOP	
J	L_EnableSteppers7
NOP	
L__EnableSteppers46:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
L_EnableSteppers7:
;Stepper.c,100 :: 		for(i=0;i<steppers;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,105 :: 		}
; i end address is: 16 (R4)
J	L_EnableSteppers1
NOP	
L_EnableSteppers2:
;Stepper.c,106 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_EnableStepper:
;Stepper.c,108 :: 		void EnableStepper(int stepper){
;Stepper.c,109 :: 		switch(stepper){
J	L_EnableStepper8
NOP	
;Stepper.c,110 :: 		case X:EN_StepX = 0; break;
L_EnableStepper10:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
J	L_EnableStepper9
NOP	
;Stepper.c,111 :: 		case Y:EN_StepY = 0; break;
L_EnableStepper11:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
J	L_EnableStepper9
NOP	
;Stepper.c,112 :: 		case Z:EN_StepZ = 0; break;
L_EnableStepper12:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
J	L_EnableStepper9
NOP	
;Stepper.c,113 :: 		case A:EN_StepA = 0; break;
L_EnableStepper13:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
J	L_EnableStepper9
NOP	
;Stepper.c,116 :: 		}
L_EnableStepper8:
SEH	R2, R25
BNE	R2, R0, L__EnableStepper49
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper49:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper51
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper51:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper53
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper53:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper55
NOP	
J	L_EnableStepper13
NOP	
L__EnableStepper55:
L_EnableStepper9:
;Stepper.c,117 :: 		}
L_end_EnableStepper:
JR	RA
NOP	
; end of _EnableStepper
_DisableStepper:
;Stepper.c,119 :: 		void DisableStepper(){
;Stepper.c,120 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,121 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,122 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,123 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,124 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_DisableSpindleInterrupt:
;Stepper.c,126 :: 		void DisableSpindleInterrupt(int stepper){
;Stepper.c,127 :: 		OC8IE_bit = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Stepper.c,128 :: 		OC8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,129 :: 		}
L_end_DisableSpindleInterrupt:
JR	RA
NOP	
; end of _DisableSpindleInterrupt
_GET_RunState:
;Stepper.c,134 :: 		int GET_RunState(int axis_No){
;Stepper.c,135 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,136 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Get_AxisStatus:
;Stepper.c,138 :: 		int Get_AxisStatus(int stepper){
;Stepper.c,139 :: 		int state = 0;
; state start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,140 :: 		switch(stepper){
J	L_Get_AxisStatus14
NOP	
; state end address is: 16 (R4)
;Stepper.c,141 :: 		case X:state = EN_StepX&1; break;
L_Get_AxisStatus16:
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus15
NOP	
;Stepper.c,142 :: 		case Y:state = EN_StepY&1; break;
L_Get_AxisStatus17:
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus15
NOP	
;Stepper.c,143 :: 		case Z:state = EN_StepZ&1; break;
L_Get_AxisStatus18:
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus15
NOP	
;Stepper.c,144 :: 		case A:state = EN_StepA&1; break;
L_Get_AxisStatus19:
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus15
NOP	
;Stepper.c,147 :: 		}
L_Get_AxisStatus14:
; state start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_AxisStatus61
NOP	
J	L_Get_AxisStatus16
NOP	
L__Get_AxisStatus61:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus63
NOP	
J	L_Get_AxisStatus17
NOP	
L__Get_AxisStatus63:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus65
NOP	
J	L_Get_AxisStatus18
NOP	
L__Get_AxisStatus65:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus67
NOP	
J	L_Get_AxisStatus19
NOP	
L__Get_AxisStatus67:
; state end address is: 16 (R4)
SEH	R2, R4
L_Get_AxisStatus15:
;Stepper.c,148 :: 		return state;
; state start address is: 8 (R2)
; state end address is: 8 (R2)
;Stepper.c,149 :: 		}
L_end_Get_AxisStatus:
JR	RA
NOP	
; end of _Get_AxisStatus
_Get_Axis_IEnable_States:
;Stepper.c,153 :: 		int Get_Axis_IEnable_States(){
;Stepper.c,154 :: 		int temp = 0;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,155 :: 		temp |= EN_StepX << 3;
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 3
OR	R3, R4, R2
; temp end address is: 16 (R4)
;Stepper.c,156 :: 		temp |= EN_StepY << 2;
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 2
OR	R3, R3, R2
;Stepper.c,157 :: 		temp |= EN_StepZ << 1;
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 1
OR	R3, R3, R2
;Stepper.c,158 :: 		temp |= EN_StepA << 0;
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 255
OR	R2, R3, R2
;Stepper.c,159 :: 		return temp;
;Stepper.c,160 :: 		}
L_end_Get_Axis_IEnable_States:
JR	RA
NOP	
; end of _Get_Axis_IEnable_States
_Single_Axis_Enable:
;Stepper.c,165 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,167 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,169 :: 		switch(axis_){
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,170 :: 		case X:
L_Single_Axis_Enable22:
;Stepper.c,171 :: 		EN_StepX = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,172 :: 		break;
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,173 :: 		case Y:
L_Single_Axis_Enable23:
;Stepper.c,174 :: 		EN_StepY = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,175 :: 		break;
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,176 :: 		case Z:
L_Single_Axis_Enable24:
;Stepper.c,177 :: 		EN_StepZ = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,178 :: 		break;
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,179 :: 		case A:
L_Single_Axis_Enable25:
;Stepper.c,180 :: 		EN_StepA = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,181 :: 		break;
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,189 :: 		default:
L_Single_Axis_Enable26:
;Stepper.c,190 :: 		break;
J	L_Single_Axis_Enable21
NOP	
;Stepper.c,191 :: 		}
L_Single_Axis_Enable20:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable71
NOP	
J	L_Single_Axis_Enable22
NOP	
L__Single_Axis_Enable71:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable73
NOP	
J	L_Single_Axis_Enable23
NOP	
L__Single_Axis_Enable73:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable75
NOP	
J	L_Single_Axis_Enable24
NOP	
L__Single_Axis_Enable75:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable77
NOP	
J	L_Single_Axis_Enable25
NOP	
L__Single_Axis_Enable77:
J	L_Single_Axis_Enable26
NOP	
L_Single_Axis_Enable21:
;Stepper.c,192 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,194 :: 		void StopAxis(int axis){
;Stepper.c,195 :: 		switch(axis){
J	L_StopAxis27
NOP	
;Stepper.c,196 :: 		case X:
L_StopAxis29:
;Stepper.c,197 :: 		EN_StepX = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,198 :: 		break;
J	L_StopAxis28
NOP	
;Stepper.c,199 :: 		case Y:
L_StopAxis30:
;Stepper.c,200 :: 		EN_StepY = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,201 :: 		break;
J	L_StopAxis28
NOP	
;Stepper.c,202 :: 		case Z:
L_StopAxis31:
;Stepper.c,203 :: 		EN_StepZ = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,204 :: 		break;
J	L_StopAxis28
NOP	
;Stepper.c,205 :: 		case A:
L_StopAxis32:
;Stepper.c,206 :: 		EN_StepA = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,207 :: 		break;
J	L_StopAxis28
NOP	
;Stepper.c,208 :: 		default : break;
L_StopAxis33:
J	L_StopAxis28
NOP	
;Stepper.c,209 :: 		}
L_StopAxis27:
SEH	R2, R25
BNE	R2, R0, L__StopAxis80
NOP	
J	L_StopAxis29
NOP	
L__StopAxis80:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis82
NOP	
J	L_StopAxis30
NOP	
L__StopAxis82:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis84
NOP	
J	L_StopAxis31
NOP	
L__StopAxis84:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis86
NOP	
J	L_StopAxis32
NOP	
L__StopAxis86:
J	L_StopAxis33
NOP	
L_StopAxis28:
;Stepper.c,210 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Stepper.c,211 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableSpindleOCx:
;Stepper.c,214 :: 		void disableSpindleOCx(){
;Stepper.c,215 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,216 :: 		}
L_end_disableSpindleOCx:
JR	RA
NOP	
; end of _disableSpindleOCx
